unit Tela_Cadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, DB, DBClient, ComCtrls,
  ToolWin, Grids, DBGrids, DBCtrls,EMSTable, ImgList, LIB,
  uPesquisaPadrao, EMSParameters, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters, cxNavigator,
  cxDBNavigator, Buttons, ExtCtrls, Provider, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxPC;

type
  TfrmTelaDeCadastro = class(TForm)
    dtsTabela: TDataSource;
    PageControl: TPageControl;
    tsDados: TTabSheet;
    tsDetalhe: TTabSheet;
    Status: TStatusBar;
    cdsTabela: TClientDataSet;
    Parametros: TEMSParameters;
    pnlControles: TPanel;
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
    PageControle: TcxPageControl;
    tsPrincipal: TcxTabSheet;
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
    procedure btnPesquisaClick(Sender: TObject);
    procedure btnNovoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PageControlMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure gridMouseEnter(Sender: TObject);
  private
    { Private declarations }
      
    FcdsTabelaFind   : TClientDataSet;
    FDataSetProvider : TDataSetProvider;

    procedure GetCamposPesquisa(var pArray: TArrayOfListFields);
    function Validar: Boolean;
    procedure CampoCodigoExit(Sender: TObject);
    procedure SalvarNaTabelaFind();
    procedure Cancelar();
    procedure Inserir();
    procedure Editar();
    procedure Salvar();
  public
    { Public declarations }
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
  end;

var
  frmTelaDeCadastro: TfrmTelaDeCadastro;

implementation

{$R *.dfm}

procedure TfrmTelaDeCadastro.btnCancelarClick(Sender: TObject);
begin
  Cancelar();
  
  cdsTabela.Cancel;

  cdsTabela.First;
  PageControl.ActivePage := tsDados;
end;

procedure TfrmTelaDeCadastro.btnEditarClick(Sender: TObject);
begin
  Editar();
  
  cdsTabela.Edit;

  if Assigned( Parametros.CampoCodigo ) then
    Parametros.CampoCodigo.Enabled := False;

  PageControl.ActivePage := tsDetalhe;  
end;

procedure TfrmTelaDeCadastro.btnExcluirClick(Sender: TObject);
begin
  if not Confirma('Tem certeza que deseja realizar a exclusão do registro?') then
    Exit;

  cdsTabela.Delete;
  PageControl.ActivePage := tsDados;
end;

procedure TfrmTelaDeCadastro.btnNovoClick(Sender: TObject);
begin
  PageControl.ActivePage := tsDetalhe;

  Inserir();
  cdsTabela.Append;

  if Assigned( Parametros.CampoCodigo ) then
    Parametros.CampoCodigo.SetFocus;
end;

procedure TfrmTelaDeCadastro.btnSairClick(Sender: TObject);
begin
  Close;
end;

function TfrmTelaDeCadastro.Validar(): Boolean;
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

procedure TfrmTelaDeCadastro.SalvarNaTabelaFind();
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

procedure TfrmTelaDeCadastro.btnSalvarClick(Sender: TObject);
begin
  if not Validar() then
    Exit;

  SalvarNaTabelaFind();

  Salvar();
  cdsTabela.Post;

  cdsTabela.ApplyUpdates(-1);

  PageControl.ActivePage := tsDados;
end;

procedure TfrmTelaDeCadastro.FormShow(Sender: TObject);
begin
  PageControl.ActivePage  := tsDados;
  PageControle.ActivePage := tsPrincipal;

  cdsTabela.Active := True;

  FDataSetProvider.DataSet := cdsTabela;
  FcdsTabelaFind.AppendData( FDataSetProvider.Data, False);
end;


procedure TfrmTelaDeCadastro.PageControlChange(Sender: TObject);
begin
  if cdsTabela.State in [dsInsert, dsEdit] then
    PageControl.ActivePage := tsDetalhe;
end;

procedure TfrmTelaDeCadastro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (cdsTabela.State in [dsInsert, dsEdit]) then
    if not Confirma('Existem alterações para serem gravadas. Deseja realmente sair?') then
      Action := caNone
    else
      cdsTabela.Cancel;
end;

procedure TfrmTelaDeCadastro.dtsTabelaDataChange(Sender: TObject;
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

procedure TfrmTelaDeCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    Perform(Wm_NextDlgCtl,0,0);
end;

procedure TfrmTelaDeCadastro.GetCamposPesquisa(var pArray : TArrayOfListFields);
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

procedure TfrmTelaDeCadastro.btnPesquisaClick(Sender: TObject);
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


procedure TfrmTelaDeCadastro.CampoCodigoExit( Sender : TObject);
begin    
  if btnCancelar.Focused then
    Exit;

  if btnSair.Focused then
    Exit;

  if not Validar() then
    Exit;
end;

procedure TfrmTelaDeCadastro.AfterConstruction;
begin
  FDataSetProvider := TDataSetProvider.Create(nil);
  FcdsTabelaFind   := TClientDataSet.Create(nil);

  if Assigned( Parametros.CampoCodigo ) then
    if ( Parametros.CampoCodigo is TDBEdit ) then
      TDBEdit( Parametros.CampoCodigo ).OnExit := CampoCodigoExit;

  inherited;
end;

procedure TfrmTelaDeCadastro.BeforeDestruction;
begin
  inherited;

  FreeAndNil( FDataSetProvider );
  FreeAndNil( FcdsTabelaFind );
end;

procedure TfrmTelaDeCadastro.btnNovoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  Status.Panels.Items[0].text := Twincontrol(Sender).Hint;
end;

procedure TfrmTelaDeCadastro.PageControlMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  Status.Panels.Items[0].text := Caption;
end;

procedure TfrmTelaDeCadastro.gridMouseEnter(Sender: TObject);
begin
  Status.Panels.Items[0].text := Caption;
end;

procedure TfrmTelaDeCadastro.Cancelar();
var
  i : Integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if Components[i] is TClientDataSet then
      if (TClientDataSet(Components[i]).Name <> cdsTabela.Name) and
         not TClientDataSet(Components[i]).ReadOnly then
      begin
        TClientDataSet(Components[i]).Cancel;
      end;
  end;
end;

procedure TfrmTelaDeCadastro.Inserir();
var
  i : Integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if Components[i] is TClientDataSet then
      if (TClientDataSet(Components[i]).Name <> cdsTabela.Name) and
         not TClientDataSet(Components[i]).ReadOnly then
      begin
        TClientDataSet(Components[i]).Append;
      end;
  end;
end;


procedure TfrmTelaDeCadastro.Editar();
var
  i : Integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if Components[i] is TClientDataSet then
      if (TClientDataSet(Components[i]).Name <> cdsTabela.Name) and
         not TClientDataSet(Components[i]).ReadOnly then
      begin
        TClientDataSet(Components[i]).Edit;
      end;
  end;
end;

procedure TfrmTelaDeCadastro.Salvar();
var
  i : Integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if Components[i] is TClientDataSet then
      if (TClientDataSet(Components[i]).Name <> cdsTabela.Name) and
         not TClientDataSet(Components[i]).ReadOnly then
      begin
        TClientDataSet(Components[i]).Post;
      end;
  end;
end;

end.
