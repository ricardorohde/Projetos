unit uPrin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp, StdCtrls, ExtCtrls, ComCtrls, Menus,ShellApi,Registry,
  OleCtrls, SHDocVw, uPedidos, uPedido, uProdutosExportacao, uProduto,
  uCliente,

//Firedac
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TWThreadMonitorar = class(TThread)
  private
    FTempoAtualizacao: Integer;
    procedure AtualizaTela();
    procedure SetTempoAtualizacao(const Value: Integer);
  protected
    procedure Execute(); override;
  public
    constructor Create(CreateSuspended: Boolean; AForm: TForm);
    property TempoAtualizacao: Integer read FTempoAtualizacao write SetTempoAtualizacao;
  end;

  TImportacao = Class
    private
      procedure InserirPedido(Pedido: TPedido);
    function MaxId(Tabela, Campo: string): Integer;
    procedure InserirItemPedido(Item: TProduto; IdMaster: Integer);
    function Find(Tabela, Filtro: String): Boolean;
    procedure ImportarCliente(IdCliente: Integer);
    procedure InserirCliente(Cliente: TCliente);
    procedure ImportarProduto(IdProduto: Integer);
    procedure InserirProduto(Produto: TProduto);
    public
      Procedure ImportarPedidos();
  end;

  TExportacao = class
    private

    public
      Procedure ExportarProdutos();
  end;


  TfrmPrincipal = class(TForm)
    PopupMenu1: TPopupMenu;
    pmnuiExit: TMenuItem;
    Abrir: TMenuItem;
    TrayIcon1: TTrayIcon;
    procedure FormCreate(Sender: TObject);
    procedure AbrirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pmnuiExitClick(Sender: TObject);
    procedure pmnuiOpenClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

  protected
  public
    { Public declarations }
    TrayIconData: TNotifyIconData;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses Module;

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  _Thread: TWThreadMonitorar;
begin
  inherited;
//  Contador:= 0;
  _Thread := TWThreadMonitorar.Create(false, Self);
  _Thread.TempoAtualizacao:= 10;
end;

procedure TfrmPrincipal.AbrirClick(Sender: TObject);
begin
  frmPrincipal.Show;
  ShowWindow(Application.Handle, SW_HIDE);
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.Hide;
  abort;
end;

procedure TfrmPrincipal.pmnuiExitClick(Sender: TObject);
begin
  FreeandNil(frmPrincipal);
  Application.Terminate;
end;

procedure TfrmPrincipal.pmnuiOpenClick(Sender: TObject);
begin
  frmPrincipal.Show;
  ShowWindow(Application.Handle, SW_HIDE);
end;


procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_HIDE);
end;

{ TWThreadMonitorar }

procedure TWThreadMonitorar.AtualizaTela;
var
  Exportacao: TExportacao;
  Importacao: TImportacao;
begin
//  frmPrincipal.TrayIcon1.BalloonFlags:= bfInfo;
//  frmPrincipal.TrayIcon1.BalloonTitle:= 'Executado';
//  frmPrincipal.TrayIcon1.ShowBalloonHint;
  try
    Importacao:= TImportacao.Create;
    Importacao.ImportarPedidos();
  Finally
    FreeAndNil( Importacao );
  End;

//  try
//    Exportacao:= TExportacao.Create;
//    Exportacao.ExportarProdutos();
//  Finally
//    FreeAndNil( Exportacao );
//  End;
end;

constructor TWThreadMonitorar.Create(CreateSuspended: Boolean; AForm: TForm);
begin
  inherited Create (CreateSuspended);
  FreeOnTerminate := false;
end;

procedure TWThreadMonitorar.Execute;
begin
  inherited;
  while (not Terminated) do
  begin
    Synchronize(AtualizaTela);
    Sleep(TempoAtualizacao * 1000);
  end;
end;

procedure TWThreadMonitorar.SetTempoAtualizacao(const Value: Integer);
begin
  FTempoAtualizacao := Value;
end;

{ TImportacao }

procedure TImportacao.ImportarPedidos();
var
  lPedidos: TPedidos;
  i: Integer;
begin
  try
    lPedidos:= lPedidos.Add;
    lPedidos.ListarPedidos();

    for I := 0 to lPedidos.ListaDePedidos.Count -1 do
    begin
      InserirPedido(lPedidos.ListaDePedidos.Items[i] as TPedido);
    end;
  finally
    FreeAndNil( lPedidos );
  end;
end;

procedure TImportacao.ImportarCliente(IdCliente: Integer);
var
  Clientes: TClientes;
  i: Integer;
begin
  try
    Clientes:= TClientes.Create;
    Clientes.ListarClientes(IdCliente);
    for I := 0 to Clientes.ListaDeCliente.Count -1 do
      InserirCliente( Clientes.ListaDeCliente.Items[i] as TCliente );
  finally
    FreeAndNil( Clientes );
  end;
end;

procedure TImportacao.InserirCliente(Cliente: TCliente);
begin
//Voltar
end;

Function TImportacao.MaxId(Tabela, Campo: string): Integer;
var
  Query: TFDQuery;
begin
  result:= 1;
  try
    Query:= TFDQuery.Create(nil);
    Query.Connection:= DataModule1.Conexao;
    Query.Open(Format('SELECT Max(%s) FROM %s', [Campo, Tabela]));

    if not Query.IsEmpty and not Query.Fields[0].IsNull then
      result:= Query.Fields[0].AsInteger + 1;
  finally
    FreeAndNil( Query );
  end;
end;

procedure TImportacao.InserirItemPedido(Item: TProduto; IdMaster: Integer);
var
  Query: TFDQuery;
  i: Integer;
begin
  if not Find('produto', Format('idproduto = %d', [Item.Codigo])) then
    ImportarProduto(Item.Codigo);

  try
    Query:= TFDQuery.Create(nil);
    Query.Connection:= DataModule1.Conexao;
    Query.Open('SELECT * FROM movdetail WHERE 1=0');
    Query.Append;
    Query.FieldByName('idmovdetail').AsInteger:= MaxId('movdetail', 'idmovdetail');
    Query.FieldByName('idmovheader').AsInteger:= IdMaster;
//    Query.FieldByName('idordemservico'
    Query.FieldByName('idproduto').AsInteger:= Item.Codigo;
//    Query.FieldByName('idunidade'
//    Query.FieldByName('idunidadeorig'
//    Query.FieldByName('idlocalestoque'
//    Query.FieldByName('idserial'
//    Query.FieldByName('idgrade'
    Query.FieldByName('vlrunitario').AsCurrency:= Item.PrecoVenda1;
//    Query.FieldByName('espessura'
//    Query.FieldByName('largura'
//    Query.FieldByName('comprimento'
//    Query.FieldByName('quantidade'
//    Query.FieldByName('qtdentregue'
//    Query.FieldByName('quantidadeorig'
//    Query.FieldByName('vlrdesconto'
//    Query.FieldByName('vlracrescimo'
    Query.FieldByName('vlrtotal').AsCurrency:= Item.PrecoCusto1;
//    Query.FieldByName('flgentregue'
//    Query.FieldByName('observacoes'
//    Query.FieldByName('dtcompetencia'
//    Query.FieldByName('idpessoaservico'
//    Query.FieldByName('flgbaixaestoque'
//    Query.FieldByName('identificacao'
    Query.Post;
  finally
    FreeAndNil( Query );
  end;
end;


function TImportacao.Find(Tabela, Filtro: String): Boolean;
var
  Query: TFDQuery;
begin
  try
    Query:= TFDQuery.Create(nil);
    Query.Connection:= DataModule1.Conexao;
    Query.Open(Format('SELECT 1 FROM %s WHERE %s LIMIT 1', [Tabela, Filtro]));
    result:= not Query.IsEmpty;
  finally
    FreeAndNil( Query );
  end;
end;

procedure TImportacao.ImportarProduto(IdProduto: Integer);
var
  Produtos: TProdutos;
  i: Integer;
begin
  try
    Produtos:= TProdutos.Create;
    Produtos.ListarProdutos(IdProduto);
    for I := 0 to Produtos.ListaDeProdutos.Count -1 do
      InserirProduto( Produtos.ListaDeProdutos.Items[i] as TProduto );
  finally
    FreeAndNil( Produtos );
  end;
end;

procedure TImportacao.InserirProduto(Produto: TProduto);
begin
//Voltar
end;

procedure TImportacao.InserirPedido(Pedido: TPedido);
var
  Query: TFDQuery;
  i, ID: Integer;
begin
  if not Find('Cliente', Format('idcliente = %d', [Pedido.Cliente])) then
    ImportarCliente(Pedido.Cliente);

  Id:= MaxId('movheader', 'idmovheader');
  try
    Query:= TFDQuery.Create(nil);
    Query.Connection:= DataModule1.Conexao;
    Query.Open('SELECT * FROM movheader where 1=0');
    Query.Append;
    Query.FieldByName('idmovheader').AsInteger:= Id;
    Query.FieldByName('data').AsDateTime:= now;
    Query.FieldByName('observacoes').AsString:= Pedido.Descricao;
    Query.FieldByName('subtotal').AsCurrency:= Pedido.ValorMercadorias;
    Query.FieldByName('desconto').AsCurrency:= pedido.ValorDesconto;
//    Query.FieldByName('acrescimo').AsCurrency:= Pedido.valo
    Query.FieldByName('total').AsCurrency:= Pedido.ValorMercadorias;
    Query.FieldByName('flgstatus').AsString:= Pedido.Status;
    Query.FieldByName('flgfaturado').AsString:= 'S';
    Query.FieldByName('flgfaturarautomatico').AsString:= 'N';
//    Query.FieldByName('infadicionais'
//    Query.FieldByName('dtcompetencia'
//    Query.FieldByName('datacompetencia'

//    Query.FieldByName('idpessoa'
    Query.FieldByName('idcliente').AsInteger:= Pedido.Cliente;
//    Query.FieldByName('idfilial'
//    Query.FieldByName('idtipodocumento'
//    Query.FieldByName('iddestino'
//    Query.FieldByName('idmovheaderpai'
//    Query.FieldByName('idordemservico'
//    Query.FieldByName('identificacao'
//    Query.FieldByName('idendereco'
    Query.Post;

    for I := 0 to Pedido.Items.Count -1 do
      InserirItemPedido(Pedido.Items[i] as TProduto, Id);
  finally
    FreeAndNil( Query );
  end;
end;

{ TExportacao }

procedure TExportacao.ExportarProdutos();
//var
//  Produtos: TProdutos;
var
  Query: TFDQuery;
begin
  try
    Query:= TFDQuery.Create(nil);
    Query.Connection:= DataModule1.Conexao;


//    Query.Open(Format('SELECT 1 FROM %s WHERE %s LIMIT 1', [Tabela, Filtro]));












  finally
    FreeAndNil( Query );
  end;


//  try
//    Produtos:= Produtos.Add;
//    Produtos.ExportarProdutos();
//  finally
//    FreeAndNil( Produtos );
//  end;
end;

end.


