unit Tela_Cadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, uOperacoesBasicas,
  DB, DBClient, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, dxSkinsdxBarPainter, ImgList,
  dxBar, cxClasses, dxRibbon, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  SQLServerUniProvider, UniProvider, PostgreSQLUniProvider;

type
  TfrmTelaDeCadastro = class(TForm)
    cdsTabela: TClientDataSet;
    tv: TcxGridDBTableView;
    lv: TcxGridLevel;
    cxGrid1: TcxGrid;
    dtsTabela: TDataSource;
    dxRibbon1Tab1: TdxRibbonTab;
    dxRibbon1: TdxRibbon;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    btnNovo: TdxBarLargeButton;
    btnEditar: TdxBarLargeButton;
    cxImageList1: TcxImageList;
    btnSalvar: TdxBarLargeButton;
    btnExcluir: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarManager1Bar2: TdxBar;
    dxBarManager1Bar3: TdxBar;
    btnSair: TdxBarLargeButton;
    btnImprimir: TdxBarLargeButton;
    btnCancelar: TdxBarLargeButton;
    PostgreSQLUniProvider1: TPostgreSQLUniProvider;
    SQLServerUniProvider1: TSQLServerUniProvider;
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    FTableName : string;
    FOperacao  : TOperacao;
    function  GetTableName: string;
    procedure SetTableName(const Value: string);
  public
    { Public declarations }

    property TableName : string read GetTableName write SetTableName;
  end;

var
  frmTelaDeCadastro: TfrmTelaDeCadastro;

implementation

uses uLogin;

{$R *.dfm}


procedure TfrmTelaDeCadastro.btnCancelarClick(Sender: TObject);
begin
  if not cdsTabela.Active then Exit;

  cdsTabela.Cancel;
end;

procedure TfrmTelaDeCadastro.btnEditarClick(Sender: TObject);
begin
  if not cdsTabela.Active then Exit;

  cdsTabela.Edit;
end;

procedure TfrmTelaDeCadastro.btnExcluirClick(Sender: TObject);
begin
  if not cdsTabela.Active then Exit;

  cdsTabela.Delete;
end;

procedure TfrmTelaDeCadastro.btnNovoClick(Sender: TObject);
begin
  if not cdsTabela.Active then Exit;

  cdsTabela.Append;
end;

procedure TfrmTelaDeCadastro.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTelaDeCadastro.btnSalvarClick(Sender: TObject);
begin
  if not cdsTabela.Active then Exit;

  cdsTabela.Post;
end;

procedure TfrmTelaDeCadastro.FormCreate(Sender: TObject);
begin
  if cdsTabela.FieldCount = 0 then Exit;
    cdsTabela.CreateDataSet;
end;

procedure TfrmTelaDeCadastro.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FOperacao);
end;

procedure TfrmTelaDeCadastro.FormShow(Sender: TObject);
var
  i       : Integer;
  lCampos : array of string;
begin
  if cdsTabela.FieldCount = 0 then Exit;

  SetLength(lCampos, cdsTabela.FieldCount);

  cdsTabela.EmptyDataSet;
  for i := 0 to cdsTabela.FieldCount -1 do
    lCampos[i] := cdsTabela.Fields[i].FieldName;

  FOperacao := TOperacao.Create(FTableName, lCampos);
end;

function TfrmTelaDeCadastro.GetTableName: string;
begin
  Result := FTableName;
end;

procedure TfrmTelaDeCadastro.SetTableName(const Value: string);
begin
  FTableName := Value;
end;

procedure TfrmTelaDeCadastro.btnImprimirClick(Sender: TObject);
begin
  frmLogin := TfrmLogin.Create(self);
  frmLogin.ShowModal;
end;

end.
