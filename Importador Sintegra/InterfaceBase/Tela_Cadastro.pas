unit Tela_Cadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, uOperacoesBasicas,
  DB, DBClient, ComCtrls, ToolWin, Grids, DBGrids, uADStanIntf,
  uADStanOption, uADStanParam, uADStanError, uADDatSManager, uADPhysIntf,
  uADDAptIntf, uADStanAsync, uADDAptManager, uADCompDataSet, uADCompClient,
  uInterfaceBase, ImgList, LIB, EMSTable;

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
    FOperacao     : TOperacao;
    FCampos       : TCampos;
    FConnection   : TADConnection;
    FArrayDataSet : array of TDataSet;

    procedure AlimentarArrayDeCampos();
    function  GetConnection: TADConnection;
    procedure SetConnection(const Value: TADConnection);
  public
    { Public declarations }

    property Connection  : TADConnection  read GetConnection write SetConnection;
    
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
  end;

var
  frmTelaDeCadastro: TfrmTelaDeCadastro;

implementation

{$R *.dfm}

procedure TfrmTelaDeCadastro.btnCancelarClick(Sender: TObject);
begin
  if not cdsTabela.Active then Exit;

  cdsTabela.Cancel;

  cdsTabela.First;
  PageControl.ActivePage := tsDados;
end;

procedure TfrmTelaDeCadastro.btnEditarClick(Sender: TObject);
begin
  if not cdsTabela.Active then Exit;

  cdsTabela.Edit;

  PageControl.ActivePage := tsDetalhe;  
end;

procedure TfrmTelaDeCadastro.btnExcluirClick(Sender: TObject);
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

procedure TfrmTelaDeCadastro.btnNovoClick(Sender: TObject);
begin
  if not cdsTabela.Active then Exit;

  PageControl.ActivePage := tsDetalhe;

  cdsTabela.Append;
end;

procedure TfrmTelaDeCadastro.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTelaDeCadastro.btnSalvarClick(Sender: TObject);
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

procedure TfrmTelaDeCadastro.AlimentarArrayDeCampos();
var
  i : Integer;
begin
  if cdsTabela.FieldCount = 0 then Exit;
  
  SetLength(FCampos, cdsTabela.FieldCount);
  
  for i := 0 to cdsTabela.FieldCount -1 do
    FCampos[i] := cdsTabela.Fields[i].FieldName;
end;

procedure TfrmTelaDeCadastro.FormShow(Sender: TObject);
begin
  PageControl.ActivePage := tsDados;
end;


function TfrmTelaDeCadastro.GetConnection: TADConnection;
begin
  Result := FConnection;
end;

procedure TfrmTelaDeCadastro.SetConnection(const Value: TADConnection);
begin
  FConnection := Value;
end;

procedure TfrmTelaDeCadastro.AfterConstruction;
var
  i,j : Integer;
begin
  inherited;

  if cdsTabela.FieldCount = 0 then Exit;

  cdsTabela.CreateDataSet;

  AlimentarArrayDeCampos();
  cdsTabela.EmptyDataSet;

  FOperacao            := TOperacao.Create(FCampos);
  FOperacao.Tabela     := cdsTabela.TableName;
  FOperacao.Schema     := LowerCase( cdsTabela.Schema );
  FOperacao.PrimaryKey := cdsTabela.PrimaryKey;
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

//  for i := 0 to ComponentCount -1 do
//    if Components[i] is TClientDataSet then
//    begin
//      if not TClientDataSet(Components[i]).Active then
//      begin
//        TClientDataSet(Components[i]).CreateDataSet;
//        SetLength( FArrayDataSet, Length(FArrayDataSet) + 1);
//        FArrayDataSet[High(FArrayDataSet)] := TClientDataSet(Components[i]);
//      end;
//    end;
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


procedure TfrmTelaDeCadastro.BeforeDestruction;
begin
  inherited;
  FreeAndNil(FOperacao);
end;

end.
