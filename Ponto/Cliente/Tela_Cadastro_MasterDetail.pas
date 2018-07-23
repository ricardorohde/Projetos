unit Tela_Cadastro_MasterDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Tela_Cadastro, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, Mask, LookupEdit, dbLookUpEdit, DBSearchEdit,
  StdCtrls, EMSParameters, DBClient, cxNavigator, cxDBNavigator, Buttons,
  ExtCtrls, ComCtrls, cxPC, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  uEditButton, DBEditBtn;

type
  TfrmTela_Cadastro_MasterDetail = class(TfrmTelaDeCadastro)
    Panel1: TPanel;
    Label1: TLabel;
    edtNomeMaster: TEdit;
    edtCodigoMaster: TDBEditBtn;
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodigoMasterExit(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure edtCodigoMasterKeyPress(Sender: TObject; var Key: Char);
    procedure cdsTabelaBeforePost(DataSet: TDataSet);
    procedure edtCodigoMasterBeforeButton(Sender: TObject);
  private
    function Validar(): Boolean;
    procedure DesabilitarBotoes();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTela_Cadastro_MasterDetail: TfrmTela_Cadastro_MasterDetail;

implementation

uses LIB;

{$R *.dfm}


procedure TfrmTela_Cadastro_MasterDetail.btnNovoClick(Sender: TObject);
begin
  if Validar() then
    edtCodigoMaster.OnExit(Sender)
  else
    Exit;
    
  inherited;
end;

procedure TfrmTela_Cadastro_MasterDetail.DesabilitarBotoes();
begin
  btnNovo.Enabled      := False;
  btnEditar.Enabled    := False;
  btnSalvar.Enabled    := False;
  btnCancelar.Enabled  := False;
  btnExcluir.Enabled   := False;
  btnPesquisar.Enabled := False;
  btnImprimir.Enabled  := False;
  Navigator.Enabled    := False;
end;

procedure TfrmTela_Cadastro_MasterDetail.FormShow(Sender: TObject);
begin
  if not Assigned( Parametros.MasterSource ) then
  begin
    Aviso('Não foi configurado a tabela master. Verifique!');
    Close;
  end;
  edtCodigoMaster.SetFocus;

  inherited;

  if Assigned( Parametros.MasterSource ) then
  begin
    TClientDataSet( Parametros.MasterSource.DataSet ).Active := False;
    TClientDataSet( Parametros.MasterSource.DataSet ).Params[0].DataType := ftInteger;
    TClientDataSet( Parametros.MasterSource.DataSet ).Params[0].Clear;
    TClientDataSet( Parametros.MasterSource.DataSet ).Active := True;
  end;
  
  DesabilitarBotoes();
end;

procedure TfrmTela_Cadastro_MasterDetail.edtCodigoMasterExit(
  Sender: TObject);
begin
  if grid.Focused then
    Exit;
    
  if btnCancelar.Focused then
    Exit;

  if btnSair.Focused then
    Exit;

  if (edtCodigoMaster.Text = '') then
  begin
    Aviso(Label1.Caption + ' não informado(a). Verifique!');
    edtCodigoMaster.SetFocus;
    Exit;
  end;

  inherited;

  if Assigned( Parametros.MasterSource ) then
  begin
    if TClientDataSet( Parametros.MasterSource.DataSet ).Active then
    begin
      if not TClientDataSet( Parametros.MasterSource.DataSet ).Locate(Parametros.MasterCampoCodigo, VarArrayOf( [StrToIntDef(edtCodigoMaster.Text, 0)] ), [])  then
      begin
        DesabilitarBotoes();
        cdsTabela.Active := False;
        edtNomeMaster.Clear;
        Aviso(Label1.Caption + ' não encontrado(a). Verifique!');
        edtCodigoMaster.SetFocus;
        Exit;
      end;
    end;

    edtNomeMaster.Clear;
    if Assigned( TClientDataSet( Parametros.MasterSource.DataSet ).FindField( Parametros.MasterDescricaoField ) ) then
      edtNomeMaster.Text := TClientDataSet( Parametros.MasterSource.DataSet ).FieldByName( Parametros.MasterDescricaoField ).AsString;

    if Assigned( cdsTabela.Params.FindParam( Parametros.MasterCampoID ) ) and not cdsTabela.Active then
    begin
      cdsTabela.Active := False;
      cdsTabela.Params.ParamByName( Parametros.MasterCampoID ).AsInteger :=
        Parametros.MasterSource.DataSet.FieldByName( Parametros.MasterCampoID ).AsInteger;
      cdsTabela.Active := True;
    end;
  end;
end;

procedure TfrmTela_Cadastro_MasterDetail.btnEditarClick(Sender: TObject);
begin
  if Validar() then
    edtCodigoMaster.OnExit(Sender)
  else
    Exit;

  inherited;
end;

procedure TfrmTela_Cadastro_MasterDetail.edtCodigoMasterKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    edtCodigoMaster.OnExit(Sender);
end;

function TfrmTela_Cadastro_MasterDetail.Validar: Boolean;
begin
  Result := False;
  if Trim( edtCodigoMaster.Text ) = '' then
  begin
    Aviso(Label1.Caption + ' não preenchido. Verifique!');
    edtCodigoMaster.SetFocus;
    Exit;
  end;
  Result := True;
end;

procedure TfrmTela_Cadastro_MasterDetail.cdsTabelaBeforePost(
  DataSet: TDataSet);
begin
  if Assigned( cdsTabela.FindField( Parametros.MasterCampoID ) ) then
    cdsTabela.Fields.FieldByName( Parametros.MasterCampoID ).AsInteger :=
      Parametros.MasterSource.DataSet.FieldByName( Parametros.MasterCampoID ).AsInteger;
  inherited;
end;

procedure TfrmTela_Cadastro_MasterDetail.edtCodigoMasterBeforeButton(
  Sender: TObject);
begin
  cdsTabela.Close;
  
  inherited;
end;

end.
