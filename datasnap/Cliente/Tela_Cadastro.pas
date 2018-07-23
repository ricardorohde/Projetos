unit Tela_Cadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, DB, DBClient, ComCtrls,
  ToolWin, Grids, DBGrids, EMSTable, ImgList, LIB;

type
  TCampos = array of string;

  TfrmTelaDeCadastro = class(TForm)
    dtsTabela: TDataSource;
    PageControl: TPageControl;
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
    tsDados: TTabSheet;
    DBGrid1: TDBGrid;
    tsDetalhe: TTabSheet;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    cdsTabela: TEMSTable;
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
  public
    { Public declarations }
  end;

var
  frmTelaDeCadastro: TfrmTelaDeCadastro;

implementation

{$R *.dfm}

procedure TfrmTelaDeCadastro.btnCancelarClick(Sender: TObject);
begin
  cdsTabela.Cancel;

  cdsTabela.First;
  PageControl.ActivePage := tsDados;
end;

procedure TfrmTelaDeCadastro.btnEditarClick(Sender: TObject);
begin
  cdsTabela.Edit;

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
end;

procedure TfrmTelaDeCadastro.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTelaDeCadastro.btnSalvarClick(Sender: TObject);
begin
  cdsTabela.Post;

  PageControl.ActivePage := tsDados;
end;

procedure TfrmTelaDeCadastro.FormShow(Sender: TObject);
begin
  PageControl.ActivePage := tsDados;

  cdsTabela.Active := True;
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
  btnNovo.Enabled     := not (cdsTabela.State in [dsInsert, dsEdit]);
  btnEditar.Enabled   := not (cdsTabela.State in [dsInsert, dsEdit]);
  btnExcluir.Enabled  := not (cdsTabela.State in [dsInsert, dsEdit]);
  btnSalvar.Enabled   := (cdsTabela.State in [dsInsert, dsEdit]);
  btnCancelar.Enabled := (cdsTabela.State in [dsInsert, dsEdit]);
end;


end.
