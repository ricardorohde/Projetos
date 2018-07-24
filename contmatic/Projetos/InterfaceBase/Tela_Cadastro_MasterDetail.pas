unit Tela_Cadastro_MasterDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, uOperacoesBasicas,
  DB, DBClient, ComCtrls, ToolWin, Grids, DBGrids, uADStanIntf,
  uADStanOption, uADStanParam, uADStanError, uADDatSManager, uADPhysIntf,
  uADDAptIntf, uADStanAsync, uADDAptManager, uADCompDataSet, uADCompClient,
  uInterfaceBase, ImgList, ExtCtrls, Buttons, LIB;

type
  TfrmCadastro_MasterDetail = class(TForm)
    ImageList1: TImageList;
    Bar: TToolBar;
    btnNovo: TToolButton;
    btnEditar: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    btnExcluir: TToolButton;
    divisor: TToolButton;
    btnImprimir: TToolButton;
    divisor2: TToolButton;
    btnSair: TToolButton;
    StatusBar1: TStatusBar;
    PageControl: TPageControl;
    tsDados: TTabSheet;
    DBGrid1: TDBGrid;
    tsDetalhe: TTabSheet;
    dtsTabela: TDataSource;
    cdsTabela: TClientDataSet;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    edtCodigo: TEdit;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
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
  private
    { Private declarations }
    FPrimaryKey  : string;
    FTableMaster : string;
    FTableDetail : string;
    FOperacao    : TOperacao;
    FSchema      : string;
    FCampos      : array of string;
    FConnection  : TADConnection;

    function  GetTableMaster: string;
    procedure SetTableMaster(const Value: string);
    procedure AlimentarArrayDeCampos();
    function GetPrimaryKey: string;
    procedure SetPrimaryKey(const Value: string);
    function GetConnection: TADConnection;
    procedure SetConnection(const Value: TADConnection);
    function GetSchema: string;
    procedure SetSchema(const Value: string);
    function GetTableDetail: string;
    procedure SetTableDetail(const Value: string);
  public
    { Public declarations }

    property TableMaster : string         read GetTableMaster write SetTableMaster;
    property TableDetail : string         read GetTableDetail write SetTableDetail;
    property PrimaryKey  : string         read GetPrimaryKey  write SetPrimaryKey;
    property Connection  : TADConnection  read GetConnection  write SetConnection;
    property Schema      : string         read GetSchema      write SetSchema;
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
  end;

var
  frmCadastro_MasterDetail: TfrmCadastro_MasterDetail;

implementation

{$R *.dfm}

{ TfrmCadastro_MasterDetail }

procedure TfrmCadastro_MasterDetail.AfterConstruction;
var
  i,j : Integer;
begin
  inherited;

  if cdsTabela.FieldCount = 0 then Exit;

  cdsTabela.CreateDataSet;

  AlimentarArrayDeCampos();
  cdsTabela.EmptyDataSet;

  FTableMaster         := GetTableMaster();
  FOperacao            := TOperacao.Create(FCampos);
  FOperacao.Tabela     := FTableMaster;
  FOperacao.Schema     := LowerCase( FSchema );
  FOperacao.PrimaryKey := GetPrimaryKey();
  FOperacao.Connection := GetConnection();
  FOperacao.IniciaOperacao();

  for j := 0 to FOperacao.Lista.Count -1 do
  begin
    cdsTabela.Append;
    for i := 0 to cdsTabela.Fields.Count -1 do
      cdsTabela.Fields[i].Value := FOperacao.RetornarValorLista(j, cdsTabela.Fields[i].FieldName);
    cdsTabela.Post;
  end;
  cdsTabela.First;
end;

procedure TfrmCadastro_MasterDetail.AlimentarArrayDeCampos;
var
  i : Integer;
begin
  if cdsTabela.FieldCount = 0 then Exit;
  
  SetLength(FCampos, cdsTabela.FieldCount);
  
  for i := 0 to cdsTabela.FieldCount -1 do
    FCampos[i] := cdsTabela.Fields[i].FieldName;
end;

procedure TfrmCadastro_MasterDetail.BeforeDestruction;
begin
  inherited;
  FreeAndNil(FOperacao);
end;

function TfrmCadastro_MasterDetail.GetConnection: TADConnection;
begin
  Result := FConnection;
end;

function TfrmCadastro_MasterDetail.GetPrimaryKey: string;
begin
  Result := FPrimaryKey;
end;

function TfrmCadastro_MasterDetail.GetSchema: string;
begin
  Result := FSchema;
end;

function TfrmCadastro_MasterDetail.GetTableDetail: string;
begin
  Result := FTableDetail;
end;

function TfrmCadastro_MasterDetail.GetTableMaster: string;
begin
  Result := FTableMaster;
end;

procedure TfrmCadastro_MasterDetail.SetConnection(
  const Value: TADConnection);
begin
  FConnection := Value;
end;

procedure TfrmCadastro_MasterDetail.SetPrimaryKey(const Value: string);
begin
  FPrimaryKey := Value;
end;

procedure TfrmCadastro_MasterDetail.SetSchema(const Value: string);
begin
  FSchema := Value;
end;

procedure TfrmCadastro_MasterDetail.SetTableDetail(const Value: string);
begin
  FTableDetail := Value;
end;

procedure TfrmCadastro_MasterDetail.SetTableMaster(const Value: string);
begin
  FTableMaster := Value;
end;

procedure TfrmCadastro_MasterDetail.btnNovoClick(Sender: TObject);
begin
  if not cdsTabela.Active then Exit;

  PageControl.ActivePage := tsDetalhe;

  cdsTabela.Append;
end;

procedure TfrmCadastro_MasterDetail.FormShow(Sender: TObject);
begin
  PageControl.ActivePage := tsDados;
end;

procedure TfrmCadastro_MasterDetail.btnEditarClick(Sender: TObject);
begin
  if not cdsTabela.Active then Exit;

  cdsTabela.Edit;

  PageControl.ActivePage := tsDetalhe;
end;

procedure TfrmCadastro_MasterDetail.btnSalvarClick(Sender: TObject);
var
  i : Integer;
  lObjeto : TInterfaceBase;
  lBookMark : TBookmark;
begin
  if not cdsTabela.Active then Exit;

  if not (cdsTabela.State in [dsInsert, dsEdit]) then Exit;

  lBookMark := cdsTabela.GetBookmark;
  cdsTabela.Post;

  cdsTabela.GotoBookmark(lBookMark);
  lObjeto := TInterfaceBase.Create(FCampos);
  try
    for i := 0 to cdsTabela.FieldCount -1 do
    begin
      lObjeto.Prop[cdsTabela.Fields[i].FieldName] :=
        cdsTabela.Fields[i].Value;
    end;
    FOperacao.Salvar(lObjeto);
  finally
    FreeAndNil(lObjeto);
  end;

  PageControl.ActivePage := tsDados;
end;

procedure TfrmCadastro_MasterDetail.btnCancelarClick(Sender: TObject);
begin
  if not cdsTabela.Active then Exit;

  cdsTabela.Cancel;

  cdsTabela.First;
  PageControl.ActivePage := tsDados;
end;

procedure TfrmCadastro_MasterDetail.btnExcluirClick(Sender: TObject);
var
  i : Integer;
  lObjeto : TInterfaceBase;
begin
  if not cdsTabela.Active then Exit;

  if not Confirma('Tem certeza que deseja realizar a exclusão do registro?') then
    Exit;

  lObjeto := TInterfaceBase.Create(FCampos);
  try
    for i := 0 to cdsTabela.FieldCount -1 do
    begin
      lObjeto.Prop[cdsTabela.Fields[i].FieldName] :=
        cdsTabela.Fields[i].Value;
    end;
    FOperacao.Deletar(lObjeto);
  finally
    FreeAndNil(lObjeto);
  end;

  cdsTabela.Delete;
  PageControl.ActivePage := tsDados;
end;

procedure TfrmCadastro_MasterDetail.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastro_MasterDetail.PageControlChange(Sender: TObject);
begin
  if cdsTabela.State in [dsInsert, dsEdit] then
    PageControl.ActivePage := tsDetalhe;
end;

procedure TfrmCadastro_MasterDetail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (cdsTabela.State in [dsInsert, dsEdit]) then
    if not Confirma('Existem alterações para serem gravadas. Deseja realmente sair?') then
      Action := caNone
    else
      cdsTabela.Cancel;
end;

procedure TfrmCadastro_MasterDetail.dtsTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  btnNovo.Enabled     := not (cdsTabela.State in [dsInsert, dsEdit]);
  btnEditar.Enabled   := not (cdsTabela.State in [dsInsert, dsEdit]);
  btnExcluir.Enabled  := not (cdsTabela.State in [dsInsert, dsEdit]);
  btnSalvar.Enabled   := (cdsTabela.State in [dsInsert, dsEdit]);
  btnCancelar.Enabled := (cdsTabela.State in [dsInsert, dsEdit]);
end;

end.
