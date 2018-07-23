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
  cxGridTableView, cxGridDBTableView, cxGrid, cxPC, uDM_Utils, frxClass,
  frxDBSet;

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
    procedure btnPesquisarClick(Sender: TObject);
    procedure cdsTabelaBeforeDelete(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure cdsTabelaAfterOpen(DataSet: TDataSet);
    procedure btnImprimirClick(Sender: TObject);
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
    procedure Salvar(Id : Integer);
    procedure Abrir();
    function ValidarAbertura(): Boolean;
    procedure Deletar(Id: Integer);
    procedure Posicionar(Id: Integer);
  public
    { Public declarations }
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
  end;

var
  frmTelaDeCadastro: TfrmTelaDeCadastro;

implementation

uses uDesenvolvedor_Relatorio;

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
  cdsTabela.Edit;
  Editar();

  PageControle.ActivePage := tsPrincipal;  
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

  cdsTabela.Append;
  Inserir();

  PageControle.ActivePage := tsPrincipal;
  if Assigned( Parametros.CampoCodigo ) then
    Parametros.CampoCodigo.SetFocus;
end;

procedure TfrmTelaDeCadastro.btnSairClick(Sender: TObject);
begin
  Close;
end;

function TfrmTelaDeCadastro.ValidarAbertura(): Boolean;
begin
  Result := False;
  if (Parametros.ListDataSet.Count <= 0) then
  begin
    Aviso('Não foi configurado os DataSets.Verifique!');
    Exit;
  end;

  if (Parametros.ListFieldsPesquisa.Count <= 0) then
  begin
    Aviso('Não foi configurado os campos de pesquisa.Verifique!');
    Exit;
  end;

  if (Empty( Parametros.FieldCampoCodigo )) then
  begin
    Aviso('Não foi configurado o campo de código.Verifique!');
    Exit;
  end;

  if (Empty( Parametros.FieldCampoID )) then
  begin
    Aviso('Não foi configurado o campo de ID.Verifique!');
    Exit;
  end;

  if (Empty( Parametros.TableName )) then
  begin
    Aviso('Não foi configurado o nome da tabela.Verifique!');
    Exit;
  end;

  Result := True;
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
var
  lID        : Integer;
  lInEditing : Boolean;
begin
  if not Validar() then
    Exit;

  SalvarNaTabelaFind();

  lID := cdsTabela.FieldByName(Parametros.FieldCampoID).AsInteger;
  lInEditing := (cdsTabela.State = dsEdit);
  cdsTabela.Post;
  cdsTabela.ApplyUpdates(-1);

  if not lInEditing then
    lID := RetornarID(Parametros.TableName, Parametros.FieldCampoID);

  Salvar( lID );
  PageControl.ActivePage := tsDados;
end;

procedure TfrmTelaDeCadastro.FormShow(Sender: TObject);
begin  
  PageControl.ActivePage  := tsDados;
  PageControle.ActivePage := tsPrincipal;

  if not Assigned( Parametros.MasterSource ) then
  begin
    cdsTabela.Active := True;
  end;

  if cdsTabela.Active then
    tv1.ViewData.Expand(False);
    
  Abrir();

  grid.SetFocus;
end;

procedure TfrmTelaDeCadastro.PageControlChange(Sender: TObject);
begin
  if cdsTabela.State in [dsInsert, dsEdit] then
    PageControl.ActivePage := tsDetalhe
  else
    if (PageControl.ActivePage = tsDetalhe) then
    begin
      Posicionar( cdsTabela.FieldByName( Parametros.FieldCampoID ).AsInteger );
    end;
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
  if (Key = #13) then
  begin
    if not (Self.ActiveControl is TCustomMemo) then
    begin
      if (GetKeyState(VK_SHIFT) and 128)=128 then
         Self.Perform(WM_NEXTDLGCTL, -1, 0)
      else
         Self.Perform(WM_NEXTDLGCTL, 0, 0);
      Key:=#0;
    end;
  end;
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
         not TClientDataSet(Components[i]).ReadOnly and
         (Parametros.ListDataSet.IndexOf(TClientDataSet(Components[i]).Name) >= 0) then
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
         not TClientDataSet(Components[i]).ReadOnly and
         (Parametros.ListDataSet.IndexOf(TClientDataSet(Components[i]).Name) >= 0) then
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
         not TClientDataSet(Components[i]).ReadOnly and
         (Parametros.ListDataSet.IndexOf(TClientDataSet(Components[i]).Name) >= 0) then
      begin
        TClientDataSet(Components[i]).Edit;
      end;
  end;
end;

procedure TfrmTelaDeCadastro.Deletar(Id : Integer);
var
  i : Integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if Components[i] is TClientDataSet then
      if (TClientDataSet(Components[i]).Name <> cdsTabela.Name) and
         not TClientDataSet(Components[i]).ReadOnly and
         (Parametros.ListDataSet.IndexOf(TClientDataSet(Components[i]).Name) >= 0) then
      begin
        if TClientDataSet(Components[i]).Locate(Parametros.FieldCampoID, VarArrayOf([Id]), []) then
          TClientDataSet(Components[i]).Delete;
      end;
  end;
end;

procedure TfrmTelaDeCadastro.Posicionar(Id : Integer);
var
  i : Integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if Components[i] is TClientDataSet then
      if (TClientDataSet(Components[i]).Name <> cdsTabela.Name) and
         not TClientDataSet(Components[i]).ReadOnly and
         (Parametros.ListDataSet.IndexOf(TClientDataSet(Components[i]).Name) >= 0) then
      begin
        TClientDataSet(Components[i]).Locate(Parametros.FieldCampoID, VarArrayOf([Id]), []);
      end;
  end;
end;

procedure TfrmTelaDeCadastro.Salvar(Id : Integer);
var
  i, j : Integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if Components[i] is TClientDataSet then
      if (TClientDataSet(Components[i]).Name <> cdsTabela.Name) and
         not TClientDataSet(Components[i]).ReadOnly and
         (Parametros.ListDataSet.IndexOf(TClientDataSet(Components[i]).Name) >= 0) then
      begin
        for j := 0 to TClientDataSet(Components[i]).FieldCount -1 do
        begin
          if (TClientDataSet(Components[i]).Fields[j].IsNull or
              Empty(TClientDataSet(Components[i]).Fields[j].Value)) and
             TClientDataSet(Components[i]).Fields[j].Required then
          begin
            if (TClientDataSet(Components[i]).Fields[j].DisplayLabel <> '') then
              Aviso('Campo: ' + TClientDataSet(Components[i]).Fields[j].DisplayLabel + ' deve ser preenchido. Verifique!')
            else
              Aviso('Campo: ' + TClientDataSet(Components[i]).Fields[j].FieldName + ' deve ser preenchido. Verifique!');

            Exit;
          end;
        end;

        if TClientDataSet(Components[i]).State <> dsEdit then
          TClientDataSet(Components[i]).FieldByName(Parametros.FieldCampoID).AsInteger := Id;
          
        TClientDataSet(Components[i]).Post;
        TClientDataSet(Components[i]).ApplyUpdates(0);
      end;
  end;
end;

procedure TfrmTelaDeCadastro.btnPesquisarClick(Sender: TObject);
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

procedure TfrmTelaDeCadastro.Abrir();
var
  i : Integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if Components[i] is TClientDataSet then
      if (TClientDataSet(Components[i]).Name <> cdsTabela.Name) and
         not TClientDataSet(Components[i]).ReadOnly and
         (Parametros.ListDataSet.IndexOf(TClientDataSet(Components[i]).Name) >= 0) then
      begin
        TClientDataSet(Components[i]).Active := True;
      end;
  end;
end;

procedure TfrmTelaDeCadastro.cdsTabelaBeforeDelete(DataSet: TDataSet);
begin
  Deletar( cdsTabela.FieldByName( Parametros.FieldCampoID ).AsInteger );

  if FcdsTabelaFind.Locate(Parametros.FieldCampoID, VarArrayOf([cdsTabela.FieldByName( Parametros.FieldCampoID ).Value]), []) then
    FcdsTabelaFind.Delete;
    
  try
    TCustomRemoteServer(cdsTabela.RemoteServer).AppServer.Deletar(cdsTabela.FieldByName( Parametros.FieldCampoID ).AsInteger);
  except on e: Exception do
    Aviso('Erro ao deletar registro. Erro: '+ CRLF + e.Message);
  end;
end;

procedure TfrmTelaDeCadastro.FormCreate(Sender: TObject);
begin
  if not ValidarAbertura() then
  begin
    Close;
  end;
end;

procedure TfrmTelaDeCadastro.cdsTabelaAfterOpen(DataSet: TDataSet);
begin
  FDataSetProvider.DataSet := cdsTabela;
  FcdsTabelaFind.AppendData( FDataSetProvider.Data, False);
end;

procedure TfrmTelaDeCadastro.btnImprimirClick(Sender: TObject);
begin
  CriaForm(TfrmDesenvolvedor_Relatorio, taShowModal);
end;

end.
