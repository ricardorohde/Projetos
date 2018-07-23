unit Tela_Cadastro_MasterDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, DB, DBClient, ComCtrls,
  ToolWin, Grids, DBGrids, EMSTable, ImgList, LIB, ExtCtrls, Buttons, Mask,
  LookupEdit, dbLookUpEdit, DBFindEdit, DBSearchEdit, uPesquisaPadrao,
  EMSParameters, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters, cxNavigator,
  cxDBNavigator, Provider, DBCtrls, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid;

type
  TfrmTela_Cadastro_MasterDetail = class(TForm)
    dtsTabela: TDataSource;
    PageControl: TPageControl;
    tsDados: TTabSheet;
    tsDetalhe: TTabSheet;
    Status: TStatusBar;
    Panel1: TPanel;
    edtNomeMaster: TEdit;
    Label1: TLabel;
    edtCodigoMaster: TDBSearchEdit;
    cdsTabela: TClientDataSet;
    Parametros: TEMSParameters;
    Panel2: TPanel;
    btnImprimir: TBitBtn;
    Navigator: TcxDBNavigator;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnExcluir: TBitBtn;
    btnPesquisar: TBitBtn;
    btnSair: TBitBtn;
    tv1: TcxGridDBTableView;
    lv1: TcxGridLevel;
    grid: TcxGrid;
    cxStyleRepository1: TcxStyleRepository;
    Style_Header: TcxStyle;
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dtsTabelaDataChange(Sender: TObject; Field: TField);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoMasterExit(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure btnNovoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PageControlMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure gridMouseEnter(Sender: TObject);
    procedure edtCodigoMasterKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FcdsTabelaFind   : TClientDataSet;
    FDataSetProvider : TDataSetProvider;

    procedure GetCamposPesquisa(var pArray: TArrayOfListFields);
    function  Validar: Boolean;
    procedure CampoCodigoExit(Sender: TObject);
    procedure SalvarNaTabelaFind();
  public
    { Public declarations }

    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
  end;

var
  frmTela_Cadastro_MasterDetail: TfrmTela_Cadastro_MasterDetail;

implementation

{$R *.dfm}

procedure TfrmTela_Cadastro_MasterDetail.btnCancelarClick(Sender: TObject);
begin
  cdsTabela.Cancel;

  cdsTabela.First;
  PageControl.ActivePage := tsDados;
end;

procedure TfrmTela_Cadastro_MasterDetail.btnEditarClick(Sender: TObject);
begin
  if Validar() then
    edtCodigoMaster.OnExit(Sender)
  else
    Exit;

  cdsTabela.Edit;

  PageControl.ActivePage := tsDetalhe;  
end;

procedure TfrmTela_Cadastro_MasterDetail.btnExcluirClick(Sender: TObject);
begin
  if not Confirma('Tem certeza que deseja realizar a exclusão do registro?') then
    Exit;

  cdsTabela.Delete;
  PageControl.ActivePage := tsDados;
end;

procedure TfrmTela_Cadastro_MasterDetail.btnNovoClick(Sender: TObject);
begin
  if Validar() then
    edtCodigoMaster.OnExit(Sender)
  else
    Exit;
    
  PageControl.ActivePage := tsDetalhe;

  cdsTabela.Append;
end;

procedure TfrmTela_Cadastro_MasterDetail.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTela_Cadastro_MasterDetail.btnSalvarClick(Sender: TObject);
begin
  cdsTabela.Post;

  cdsTabela.ApplyUpdates(-1);

  PageControl.ActivePage := tsDados;

//  cdsTabela.Refresh;
end;

procedure TfrmTela_Cadastro_MasterDetail.FormShow(Sender: TObject);
begin
  PageControl.ActivePage := tsDados;

  edtCodigoMaster.SetFocus;
//  cdsTabela.Active := True;
end;


procedure TfrmTela_Cadastro_MasterDetail.PageControlChange(Sender: TObject);
begin
  if cdsTabela.State in [dsInsert, dsEdit] then
    PageControl.ActivePage := tsDetalhe;
end;

procedure TfrmTela_Cadastro_MasterDetail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (cdsTabela.State in [dsInsert, dsEdit]) then
    if not Confirma('Existem alterações para serem gravadas. Deseja realmente sair?') then
      Action := caNone
    else
      cdsTabela.Cancel;
end;

procedure TfrmTela_Cadastro_MasterDetail.dtsTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  if Assigned( Parametros.CampoCodigo ) then
    TDBEdit( Parametros.CampoCodigo ).Enabled := (TDataSource( Sender ).DataSet.State = dsInsert);

  btnNovo.Enabled      := not (TDataSource( Sender ).DataSet.State in [dsInsert, dsEdit]);
  btnEditar.Enabled    := not (TDataSource( Sender ).DataSet.State in [dsInsert, dsEdit]) and (not TDataSource( Sender ).DataSet.IsEmpty);
  btnExcluir.Enabled   := not (TDataSource( Sender ).DataSet.State in [dsInsert, dsEdit]) and (not TDataSource( Sender ).DataSet.IsEmpty);
  btnPesquisar.Enabled := not (TDataSource( Sender ).DataSet.State in [dsInsert, dsEdit]) and (not TDataSource( Sender ).DataSet.IsEmpty);
  btnImprimir.Enabled  := not (TDataSource( Sender ).DataSet.State in [dsInsert, dsEdit]) and (not TDataSource( Sender ).DataSet.IsEmpty);
  btnSalvar.Enabled    := (TDataSource( Sender ).DataSet.State in [dsInsert, dsEdit]);
  btnCancelar.Enabled  := (TDataSource( Sender ).DataSet.State in [dsInsert, dsEdit]);
  Navigator.Enabled    := not (TDataSource( Sender ).DataSet.State in [dsInsert, dsEdit]) and (not TDataSource( Sender ).DataSet.IsEmpty);
end;

procedure TfrmTela_Cadastro_MasterDetail.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
    Perform(Wm_NextDlgCtl,0,0);
end;

procedure TfrmTela_Cadastro_MasterDetail.edtCodigoMasterExit(
  Sender: TObject);
begin
  if not (cdsTabela.State in [dsInsert, dsEdit]) then
    Exit;

  if btnCancelar.Focused then
    Exit;

  if (edtCodigoMaster.Text = '') then
  begin
    Aviso('Código não informado. Verifique!');
    edtCodigoMaster.SetFocus;
  end;
end;

procedure TfrmTela_Cadastro_MasterDetail.GetCamposPesquisa(var pArray : TArrayOfListFields);
var
  i       : Integer;
  lStrAux : string;
begin
  for i := 0 to Parametros.ListFieldsPesquisa.Count -1 do
  begin
    lStrAux := Parametros.ListFieldsPesquisa.Strings[i];

    SetLength(pArray, Length(pArray) + 1);

    pArray[ High(pArray) ].Caption  := Copy(lStrAux, 1, Pos(';',lStrAux)-1);
    Delete(lStrAux, 1, Pos(';',lStrAux));

    pArray[ High(pArray) ].FieldName := Copy(lStrAux, 1, Pos(';',lStrAux)-1);
    Delete(lStrAux, 1, Pos(';',lStrAux));

    pArray[ High(pArray) ].Width := StrToIntDef( Copy(lStrAux, 1, Pos(';',lStrAux)-1), 20 );
    Delete(lStrAux, 1, Pos(';',lStrAux));

    pArray[ High(pArray) ].Retorno := UpperCase( Copy(lStrAux, 1, Pos(';',lStrAux)-1) ) = 'RETORNO';
    Delete(lStrAux, 1, Pos(';',lStrAux));

    pArray[ High(pArray) ].Tipo := UpperCase( Copy(lStrAux, 1, Pos(';',lStrAux)-1) );
    Delete(lStrAux, 1, Pos(';',lStrAux));
  end;
end;

procedure TfrmTela_Cadastro_MasterDetail.btnPesquisaClick(Sender: TObject);
var
  Pesquisa : TPesquisa;
  lCamposPesquisa : TArrayOfListFields;
begin
  if (Parametros.ListFieldsPesquisa.Count <> 0) then
    begin
      Pesquisa := TPesquisa.Create;
      try
        GetCamposPesquisa( lCamposPesquisa );
        Pesquisa.Pesquisar( cdsTabela, lCamposPesquisa);
      finally
        FreeAndNil( Pesquisa );
      end;
    end
  else
    Aviso('Não foi configurado os campos para a pesquisa!');
end;

procedure TfrmTela_Cadastro_MasterDetail.CampoCodigoExit(Sender: TObject);
begin
  if not FcdsTabelaFind.Active then
  begin
    FDataSetProvider.DataSet := cdsTabela;
    FcdsTabelaFind.AppendData( FDataSetProvider.Data, False);
  end;

  if btnSair.Focused then
    Exit;
  
  if not Validar() then
    Exit;
end;

procedure TfrmTela_Cadastro_MasterDetail.SalvarNaTabelaFind;
var
  i : Integer;
begin
  if not FcdsTabelaFind.Locate(Parametros.FieldCampoCodigo, VarArrayOf([cdsTabela.FieldByName(Parametros.FieldCampoCodigo).Value]), []) then
    FcdsTabelaFind.Append
  else
    FcdsTabelaFind.Edit;

  for i := 0 to cdsTabela.FieldCount -1 do
  begin
    if Assigned( FcdsTabelaFind.FindField( cdsTabela.Fields[i].FieldName ) ) and
       not cdsTabela.Fields[i].IsNull then
      FcdsTabelaFind.FieldByName( cdsTabela.Fields[i].FieldName ).Value := cdsTabela.Fields[i].Value;
  end;

  FcdsTabelaFind.Post;
end;

function TfrmTela_Cadastro_MasterDetail.Validar: Boolean;
begin
  Result := False;
  if Assigned( Parametros.CampoCodigo ) then
    begin
      if ( Parametros.CampoCodigo is TDBEdit ) then
      begin
        if Trim(TCustomEdit( Parametros.CampoCodigo ).Text)= '' then
        begin
          Aviso('O Código não foi preenchido. Verifique!');
          TCustomEdit( Parametros.CampoCodigo ).SetFocus;
          Exit;
        end;

        if (Trim(Parametros.FieldCampoCodigo) <> '') then
          begin
            if (cdsTabela.State = dsInsert) and FcdsTabelaFind.Locate(Parametros.FieldCampoCodigo, VarArrayOf([StrToIntDef(TCustomEdit( Parametros.CampoCodigo ).Text, 0)]), []) then
            begin
              Aviso( 'Código já cadastrado. Verifique!' );
              TDBEdit( Parametros.CampoCodigo ).Field.Clear;
              TDBEdit( Parametros.CampoCodigo ).SetFocus;
              Exit;
            end;
          end
        else
          Exit;
      end;
    end
  else
    Exit;

  Result := True;
end;

procedure TfrmTela_Cadastro_MasterDetail.AfterConstruction;
begin
  inherited;

  FDataSetProvider := TDataSetProvider.Create(nil);
  FcdsTabelaFind   := TClientDataSet.Create(nil);

  if Assigned( Parametros.CampoCodigo ) then
    if ( Parametros.CampoCodigo is TDBEdit ) then
      TDBEdit( Parametros.CampoCodigo ).OnExit := CampoCodigoExit;  
end;

procedure TfrmTela_Cadastro_MasterDetail.BeforeDestruction;
begin
  inherited;

  FreeAndNil( FDataSetProvider );
  FreeAndNil( FcdsTabelaFind );  
end;

procedure TfrmTela_Cadastro_MasterDetail.btnNovoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  Status.Panels.Items[0].text := Twincontrol(Sender).Hint;
end;

procedure TfrmTela_Cadastro_MasterDetail.PageControlMouseMove(
  Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  Status.Panels.Items[0].text := Caption;
end;

procedure TfrmTela_Cadastro_MasterDetail.gridMouseEnter(Sender: TObject);
begin
  Status.Panels.Items[0].text := Caption;
end;

procedure TfrmTela_Cadastro_MasterDetail.edtCodigoMasterKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edtCodigoMaster.OnExit(Sender);
end;

end.
