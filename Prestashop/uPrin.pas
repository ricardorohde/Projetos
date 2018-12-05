unit uPrin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp, StdCtrls, ExtCtrls, ComCtrls, Menus,ShellApi,Registry,
  OleCtrls, SHDocVw, uPedidos, uPedido, uProduto, uCliente, uClassesPrestashop,
  IniFiles,  LIB,

//Firedac
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Xml.xmldom,
  Xml.XMLIntf, Xml.XMLDoc;

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
    procedure InserirItemPedido(Item: TProduto; IdMaster: Integer);
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
      Procedure ExportarMarcas();
      Procedure ExportarCategorias();
      Procedure ExportarNCM();
      procedure ExportarMunicipios();
      procedure ExportarPaises();
      Procedure ExportarProdutos();
      Procedure ExportarClientes();
  end;


  TfrmPrincipal = class(TForm)
    PopupMenu1: TPopupMenu;
    pmnuiExit: TMenuItem;
    Abrir: TMenuItem;
    TrayIcon1: TTrayIcon;
    XMLDocument1: TXMLDocument;
    procedure FormCreate(Sender: TObject);
    procedure AbrirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pmnuiExitClick(Sender: TObject);
    procedure pmnuiOpenClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    _Thread: TWThreadMonitorar;
  protected
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses Module;

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
//  Contador:= 0;
  _Thread := TWThreadMonitorar.Create(false, Self);
  with TIniFile.Create(ExtractFilePath(Application.Exename) + 'IntPrestashop.ini') do
  try
    _Thread.TempoAtualizacao:= ReadInteger('Configuracao', 'TempoAtualizacao', 10);
  finally
    free;
  end;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FreeAndNil(_Thread);
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
  frmPrincipal.TrayIcon1.Animate:= True;
  frmPrincipal.TrayIcon1.BalloonFlags:= bfInfo;
  frmPrincipal.TrayIcon1.BalloonTitle:= 'Executado';
  frmPrincipal.TrayIcon1.ShowBalloonHint;
  try
    Importacao:= TImportacao.Create;
    Importacao.ImportarPedidos();
  Finally
    FreeAndNil( Importacao );
  End;

  try
    Exportacao:= TExportacao.Create;
    Exportacao.ExportarMarcas();
    Exportacao.ExportarCategorias();
    Exportacao.ExportarNCM();
//    Exportacao.ExportarPaises();
//    Exportacao.ExportarMunicipios();

    Exportacao.ExportarClientes();
    Exportacao.ExportarProdutos();
  Finally
    FreeAndNil( Exportacao );
  End;
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
    for I := 0 to Clientes.ListaDeClientes.Count -1 do
      InserirCliente( Clientes.ListaDeClientes.Items[i] as TCliente );
  finally
    FreeAndNil( Clientes );
  end;
end;

procedure TImportacao.InserirCliente(Cliente: TCliente);
var
  Query: TFDQuery;
  ID: Integer;
begin
  Id:= DataModule1.MaxId('Cliente', 'idcliente');
  try
    Query:= TFDQuery.Create(nil);
    Query.Connection:= DataModule1.Conexao;
    Query.Open('SELECT * FROM Cliente where 1=0');
    Query.Append;
    Query.FieldByName('idcliente').AsInteger:= Cliente.Codigo;
    Query.FieldByName('nmcliente').AsString:= Cliente.Nome;
//      Cliente.NomeReduzido:= Query.FieldByName('nmfantasia').AsString;
    Query.FieldByName('endereco').AsString:= Cliente.Endereco;
    Query.FieldByName('numero').AsString:= Cliente.Numero;
    Query.FieldByName('complemento').AsString:= Cliente.Complemento;
    Query.FieldByName('bairro').AsString:= Cliente.Bairro;
    Query.FieldByName('cep').AsString:= Cliente.Cep;
    Query.FieldByName('nmcidade').AsString:= Cliente.Municipio;
    Query.FieldByName('uf').AsString:= Cliente.Uf;
    Query.FieldByName('telefone').AsString:= Cliente.Telefone;
    Query.FieldByName('celular').AsString:= Cliente.Celular;
    Query.FieldByName('cpfcnpj').AsString:= Cliente.CnpjCpf;
    Query.FieldByName('rgie').AsString:= Cliente.RgIe;
    Query.FieldByName('nmempresa').AsString:= Cliente.RazaoSocial;
    if Cliente.StatusCliente = '1' then
      Query.FieldByName('flgativo').AsString:= 'S'
    else
      Query.FieldByName('flgativo').AsString:= 'N';
    Query.Post;
  finally
    FreeAndNil( Query );
  end;
end;

procedure TImportacao.InserirItemPedido(Item: TProduto; IdMaster: Integer);
var
  Query: TFDQuery;
  i: Integer;
begin
  if not DataModule1.Find('produto', Format('idproduto = %d', [Item.Codigo])) then
    ImportarProduto(Item.Codigo);

  try
    Query:= TFDQuery.Create(nil);
    Query.Connection:= DataModule1.Conexao;
    Query.Open('SELECT * FROM movdetail WHERE 1=0');
    Query.Append;
    Query.FieldByName('idmovdetail').AsInteger:= DataModule1.MaxId('movdetail', 'idmovdetail');
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
var
  Query: TFDQuery;
  i, ID: Integer;
begin
  Id:= DataModule1.MaxId('Produto', 'IdProduto');
  try
    Query:= TFDQuery.Create(nil);
    Query.Connection:= DataModule1.Conexao;
    Query.Open('SELECT * FROM Produto where 1=0');
    Query.Append;
    Query.FieldByName('IdProduto').AsInteger:= Produto.Codigo;
    Query.FieldByName('NmProduto').AsString:= Produto.Nome;
    if Produto.Status= '1' then
      Query.FieldByName('flgativo').AsString:= 'S'
    else
      Query.FieldByName('flgativo').AsString:= 'N';
    Query.FieldByName('codBarra').AsString:= Produto.CodigoBarrasEAN;
    Query.FieldByName('precocusto').AsCurrency:= Produto.PrecoCusto1;
    Query.FieldByName('precovenda').AsCurrency:= Produto.PrecoVenda1;
    Query.FieldByName('codncm').AsString:= Produto.NCM;
    Query.FieldByName('idgrupoproduto').AsInteger:= Produto.CodGrupo;
    Query.FieldByName('nmgrupo').AsString:= Produto.Grupo;
    Query.FieldByName('unidade').AsString:= Produto.PrimeiraUnidade;
    Query.Post;
  finally
    FreeAndNil( Query );
  end;
end;

procedure TImportacao.InserirPedido(Pedido: TPedido);
var
  Query: TFDQuery;
  i, ID: Integer;
begin
  if not DataModule1.Find('Cliente', Format('idcliente = %d', [Pedido.Cliente])) then
    ImportarCliente(Pedido.Cliente);

  Id:= DataModule1.MaxId('movheader', 'idmovheader');
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

procedure TExportacao.ExportarCategorias();
var
  ID: string;
  Category: TCategory;
  Query: TFDQuery;
begin
  try
    Query:= TFDQuery.Create(nil);
    Query.Connection:= DataModule1.Conexao;
    Query.Open('SELECT * FROM grupoproduto where IdPrestashop is null');
    Query.First;
    while not Query.Eof do
    begin
      try
        Category:= Category.Add;
        Category.Descricao:= Query.FieldByName('NmGrupo').AsString;
        ID:= Category.Exportar();
        if StrToIntDef(ID, -1) <> -1 then
        begin
          Query.Edit;
          Query.FieldByName('IdPrestashop').AsInteger:= StrToIntDef(ID, -1);
          Query.Post;
        end;
      finally
        FreeAndNil( Category );
      end;
      Query.Next;
    end;
  finally
    FreeAndNil( Query );
  end;
end;

procedure TExportacao.ExportarClientes();
var
  Cliente: TCliente;
  Clientes: TClientes;
  Query: TFDQuery;
begin
  try
    Clientes:= TClientes.Create;
    Query:= TFDQuery.Create(nil);
    Query.Connection:= DataModule1.Conexao;
    Query.SQl.Add('SELECT C.*, M.nmcidade, M.IdPrestashop CodigoMunicipio, M.uf');
    Query.SQl.Add('FROM Cliente C');
    Query.SQl.Add('left join municipio M on M.idmunicipio = C.idmunicipio');
    Query.SQl.Add('WHERE C.IdPrestashop IS NULL and Coalesce(C.Email, '''') <> ''''');
    Query.Open;
    Query.First;
    while not Query.Eof do
    begin
      Cliente:= Cliente.Add;
      Cliente.Codigo:= Query.FieldByName('idcliente').AsInteger;
      Cliente.Nome:= Query.FieldByName('nmcliente').AsString;
//      Cliente.NomeReduzido:= Query.FieldByName('nmfantasia').AsString;
      Cliente.CodigoMunicipioWS:= Query.FieldByName('CodigoMunicipio').AsString;
      Cliente.Endereco:= Query.FieldByName('endereco').AsString;
      Cliente.Numero:= Query.FieldByName('numero').AsString;
      Cliente.Complemento:= Query.FieldByName('complemento').AsString;
      Cliente.Bairro:= Query.FieldByName('bairro').AsString;
      Cliente.Cep:= Query.FieldByName('cep').AsString;
      Cliente.Municipio:= Query.FieldByName('nmcidade').AsString;
      Cliente.Uf:= Query.FieldByName('uf').AsString;
      Cliente.Telefone:= Query.FieldByName('telefone').AsString;
      Cliente.Celular:= Query.FieldByName('celular').AsString;
      Cliente.CnpjCpf:= Query.FieldByName('cpfcnpj').AsString;
      Cliente.RgIe:= Query.FieldByName('rgie').AsString;
      Cliente.RazaoSocial:= Query.FieldByName('nmempresa').AsString;
      Cliente.Email:= Query.FieldByName('email').AsString;
      if Query.FieldByName('flgativo').AsString = 'S' then
        Cliente.StatusCliente:= '1'
      else
        Cliente.StatusCliente:= '0';

      Clientes.ListaDeClientes.Add(Cliente);
      Query.Next;
    end;
    Clientes.ExportarClientes();
  finally
    FreeAndNil( Clientes );
    FreeAndNil( Query );
  end;
end;

procedure TExportacao.ExportarMarcas();
var
  ID: string;
  Manufacturer: TManufacturer;
  Query: TFDQuery;
begin
  try
    Query:= TFDQuery.Create(nil);
    Query.Connection:= DataModule1.Conexao;
    Query.Open('SELECT * FROM MARCA WHERE IDPRESTASHOP IS NULL');
    Query.First;
    while not Query.Eof do
    begin
      if trim(Query.FieldByName('NmMarca').AsString) <> '' then
      begin
        try
          Manufacturer:= Manufacturer.Add;
          Manufacturer.Descricao:= Query.FieldByName('NmMarca').AsString;
          ID:= Manufacturer.Exportar();
          if StrToIntDef(ID, -1) <> -1 then
          begin
            Query.Edit;
            Query.FieldByName('IdPrestashop').AsInteger:= StrToIntDef(ID, -1);
            Query.Post;
          end;
        finally
          FreeAndNil( Manufacturer );
        end;
      end;
      Query.Next;
    end;
  finally
    FreeAndNil( Query );
  end;
end;

procedure TExportacao.ExportarMunicipios();
var
  ID: string;
  State: TState;
  Query: TFDQuery;
begin
  try
    Query:= TFDQuery.Create(nil);
    Query.Connection:= DataModule1.Conexao;
    Query.Open('SELECT M.*, P.IdPrestashop CodigoPais FROM municipio M inner join pais P on P.idpais = M.idpais where M.IdPrestashop is null');
    Query.First;
    while not Query.Eof do
    begin
      try
        State:= State.Add;
        State.municipio:= UTF8ToString(Query.FieldByName('NmCidade').AsString);
        State.Uf:= Query.FieldByName('UF').AsString;
        State.CodigoPais:= Query.FieldByName('CodigoPais').AsString;
        ID:= State.Exportar();
        if StrToIntDef(ID, -1) <> -1 then
        begin
          Query.Edit;
          Query.FieldByName('IdPrestashop').AsInteger:= StrToIntDef(ID, -1);
          Query.Post;
        end;
      finally
        FreeAndNil( State );
      end;
      Query.Next;
    end;
  finally
    FreeAndNil( State );
    FreeAndNil( Query );
  end;
end;

procedure TExportacao.ExportarNCM();
var
  ID: string;
  Product_feature_value: TProduct_feature_value;
  Query: TFDQuery;
begin
  try
    Query:= TFDQuery.Create(nil);
    Query.Connection:= DataModule1.Conexao;
    Query.Open('SELECT N.* FROM NCM N where N.IdPrestashop is null and exists(select 1 from produto P where P.idncm = N.idncm limit 1)');
    Query.First;
    while not Query.Eof do
    begin
      try
        Product_feature_value:= Product_feature_value.Add;
        Product_feature_value.NCM:= Query.FieldByName('CodNcm').AsString;
        ID:= Product_feature_value.Exportar();
        if StrToIntDef(ID, -1) <> -1 then
        begin
          Query.Edit;
          Query.FieldByName('IdPrestashop').AsInteger:= StrToIntDef(ID, -1);
          Query.Post;
        end;
      finally
        FreeAndNil( Product_feature_value );
      end;
      Query.Next;
    end;
  finally
    FreeAndNil( Query );
  end;
end;

procedure TExportacao.ExportarPaises();
var
  ID: string;
  Country: TCountry;
  Query: TFDQuery;
begin
  try
    Query:= TFDQuery.Create(nil);
    Query.Connection:= DataModule1.Conexao;
    Query.Open('SELECT * FROM pais  where IdPrestashop is null');
    Query.First;
    while not Query.Eof do
    begin
      try
        Country:= Country.Add;
        Country.CodPais:= Query.FieldByName('idPais').AsString;
        Country.NomePais:= Query.FieldByName('NmPais').AsString;
        ID:= Country.Exportar();
        if StrToIntDef(ID, -1) <> -1 then
        begin
          Query.Edit;
          Query.FieldByName('IdPrestashop').AsInteger:= StrToIntDef(ID, -1);
          Query.Post;
        end;
      finally
        FreeAndNil( Country );
      end;
      Query.Next;
    end;
  finally
    FreeAndNil( Country );
    FreeAndNil( Query );
  end;
end;

procedure TExportacao.ExportarProdutos();
var
  Produto: TProduto;
  Produtos: TProdutos;
  Query: TFDQuery;
begin
  try
    Produtos:= TProdutos.Create;
    Query:= TFDQuery.Create(nil);
    Query.Connection:= DataModule1.Conexao;
    Query.SQl.Add('SELECT');
    Query.SQl.Add('  P.IdProduto,');
    Query.SQl.Add('  P.codBarra,');
    Query.SQl.Add('  P.NmProduto,');
    Query.SQl.Add('  P.precocusto,');
    Query.SQl.Add('  P.precovenda,');
    Query.SQl.Add('  P.flgativo,');
    Query.SQl.Add('  P.estoqueminimo,');
    Query.SQl.Add('  GP.IdPrestashop grupo,');
    Query.SQl.Add('  GP.nmgrupo,');
    Query.SQl.Add('  N.IdPrestashop ncm,');
    Query.SQl.Add('  U.unidade,');
    Query.SQl.Add('  E.qtdestoque,');
    Query.SQl.Add('  M.IdPrestashop Marca');
    Query.SQl.Add('FROM PRODUTO P');
    Query.SQl.Add('LEFT JOIN NCM N ON N.IDNCM = P.IDNCM');
    Query.SQl.Add('LEFT JOIN GRUPOPRODUTO GP ON GP.IDGRUPOPRODUTO = P.IDGRUPOPRODUTO');
    Query.SQl.Add('LEFT JOIN UNIDADEMEDIDA U ON U.IDUNIDADE = P.IDUNIDADE');
    Query.SQl.Add('LEFT JOIN ESTOQUE E ON E.IDPRODUTO = P.IDPRODUTO');
    Query.SQl.Add('LEFT JOIN MARCA M ON M.IDMARCA = P.IDMARCA');
    Query.SQl.Add('WHERE P.IdPrestashop IS NULL');
    Query.Open;
    Query.First;
    while not Query.Eof do
    begin
      Produto:= Produto.Add;
      Produto.Codigo:= Query.FieldByName('IdProduto').AsInteger;
      Produto.Nome:= Query.FieldByName('NmProduto').AsString;
      if Query.FieldByName('flgativo').AsString = 'S' then
        Produto.Status:= '1'
      else
        Produto.Status:= '0';
      Produto.CodigoBarrasEAN:= Query.FieldByName('codBarra').AsString;
      Produto.PrecoCusto1:= Query.FieldByName('precocusto').AsCurrency;
      Produto.PrecoVenda1:= Query.FieldByName('precovenda').AsCurrency;
      Produto.NCM:= Query.FieldByName('ncm').AsString;
      Produto.CodGrupo:= Query.FieldByName('grupo').AsInteger;
      Produto.Grupo:= Query.FieldByName('nmgrupo').AsString;
      Produto.PrimeiraUnidade:= Query.FieldByName('unidade').AsString;
      Produto.QuantidadeBase:= Query.FieldByName('qtdestoque').AsFloat;
      Produto.Fabricante:= Query.FieldByName('Marca').AsString;
      Produtos.ListaDeProdutos.Add(Produto);
      Query.Next;
    end;

    Produtos.ExportarProdutos();
  finally
    FreeAndNil( Produtos );
    FreeAndNil( Query );
  end;
end;

end.


