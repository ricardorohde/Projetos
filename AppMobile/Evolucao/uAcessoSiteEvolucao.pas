unit uAcessoSiteEvolucao;

interface

uses System.Classes, System.SysUtils, Vcl.Forms, Dialogs, {System.Contnrs,}
  DBXJSON, DBXJsonReflect, uWebServiceHttp, xmldom, XMLIntf, msxmldom, XMLDoc,
  StrUtils, msxml, System.Types, System.Variants, DBClient, mshtml, ActiveX,
  ComObj, uLibrary, uTypes, Generics.Collections;

type
  TAcessoSiteEvolucao = class(TWebServiceHttp)
  private
    procedure ConfigurarRequisicao();
    constructor CreatePrivate();
  public
    function setURL(value: String): TAcessoSiteEvolucao;
    function setUser(value: String): TAcessoSiteEvolucao;
    function setPass(value: String): TAcessoSiteEvolucao;
    function setApyKey(value: String): TAcessoSiteEvolucao;
    function setKey(value: String): TAcessoSiteEvolucao;
  end;

type
  TCliente = class
  private
    FDDI: string;
    procedure SetDDI(const Value: string);
  protected
    FBairro: string;
    FPessoa: string;
    FDataNascimento: TDate;
    FEmail: string;
    FUf: string;
    FCodigo: Integer;
    FNomeReduzido: string;
    FCep: String;
    FCnpjCpf: string;
    FNumero: string;
    FMunicipio: string;
    FRgIe: string;
    FRazaoSocial: string;
    FFornecedor: string;
    FComplemento: string;
    FCodPais: string;
    FHomepage: string;
    FNomePais: string;
    FNome: string;
    FEndereco: string;
    FStatusCliente: string;
    FTelefone: string;
    FCelular: string;
    FDDD: string;
    FContato: string;
    procedure SetBairro(const Value: string);
    procedure SetCelular(const Value: string);
    procedure SetCep(const Value: String);
    procedure SetCnpjCpf(const Value: string);
    procedure SetCodigo(const Value: Integer);
    procedure SetCodPais(const Value: string);
    procedure SetComplemento(const Value: string);
    procedure SetDataNascimento(const Value: TDate);
    procedure SetEmail(const Value: string);
    procedure SetEndereco(const Value: string);
    procedure SetFornecedor(const Value: string);
    procedure SetHomepage(const Value: string);
    procedure SetMunicipio(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetNomePais(const Value: string);
    procedure SetNomeReduzido(const Value: string);
    procedure SetNumero(const Value: string);
    procedure SetPessoa(const Value: string);
    procedure SetRazaoSocial(const Value: string);
    procedure SetRgIe(const Value: string);
    procedure SetStatusCliente(const Value: string);
    procedure SetTelefone(const Value: string);
    procedure SetUf(const Value: string);
    procedure SetContato(const Value: string);
    procedure SetDDD(const Value: string);
  public
    property Codigo: Integer read FCodigo write SetCodigo;
    property NomeReduzido: string read FNomeReduzido write SetNomeReduzido;
    property Nome: string read FNome write SetNome;
    property Email: string read FEmail write SetEmail;
    property DataNascimento: TDate read FDataNascimento write SetDataNascimento;
    property Homepage: string read FHomepage write SetHomepage;
    property RazaoSocial: string read FRazaoSocial write SetRazaoSocial;
    property StatusCliente: string read FStatusCliente write SetStatusCliente;
    property Pessoa: string read FPessoa write SetPessoa;
    property CnpjCpf: string read FCnpjCpf write SetCnpjCpf;
    property RgIe: string read FRgIe write SetRgIe;
    property Fornecedor: string read FFornecedor write SetFornecedor;
    property CodPais: string read FCodPais write SetCodPais;
    property NomePais: string read FNomePais write SetNomePais;
    property Uf: string read FUf write SetUf;
    property Endereco: string read FEndereco write SetEndereco;
    property Bairro: string read FBairro write SetBairro;
    property Cep: String read FCep write SetCep;
    property Municipio: string read FMunicipio write SetMunicipio;
    property Telefone: string read FTelefone write SetTelefone;
    property Celular: string read FCelular write SetCelular;
    property Numero: String read FNumero write SetNumero;
    property Complemento: string read FComplemento write SetComplemento;
    property Contato: string read FContato write SetContato;
    property DDD: string read FDDD write SetDDD;
    property DDI: string read FDDI write SetDDI;
  end;

  TSolicitarClientes = class
  private
    FCodigo: Integer;
    procedure SetCodigo(const Value: Integer);
  protected
    FXMLDocument: IXMLDocument;
    FXMLCustomers: IXMLDocument;
    FXMLCountries: IXMLDocument;
    FXMLStates: IXMLDocument;
    FUltimoClienteImportado: Integer;
//    FAcessoSiteEvolucao: TAcessoSiteEvolucao;
    FListaDeClientes: TObjectList<TCliente>;

    procedure SetListaDeClientes(const value: TObjectList<TCliente>);
    function GetListaClientes(): TObjectList<TCliente>;
    function PreencherCustomersCliente(var cliente: TCliente; const psID: string): Boolean;
    function PreencherEstadoCliente(var cliente: TCliente; const psID: string): Boolean;
    function PreencherCountriesCliente(var cliente: TCliente;
      const psID: string): Boolean;
    procedure SetUltimoClienteImportado(const Value: Integer);
  public
    property Codigo: Integer read FCodigo write SetCodigo;
    property UltimoClienteImportado: Integer read FUltimoClienteImportado write SetUltimoClienteImportado;

    procedure BeforeDestruction; override;
    procedure AfterConstruction; override;
    property ListaDeClientes: TObjectList<TCliente> read GetListaClientes write SetListaDeClientes;
  end;

  TSolicitarClientesXLS = class
  private
    FFileName: string;
    FListaDeClientes: TObjectList<TCliente>;

    procedure AdicionaCliente(Cliente: TCliente; Valor: string;
      Coluna: Integer);
    function XlsToString(AXLSFile: string): Boolean;
    procedure SetFileName(const Value: string);
    procedure SetListaDeClientes(const value: TObjectList<TCliente>);
    function GetListaClientes(): TObjectList<TCliente>;
  public
    procedure BeforeDestruction; override;
    procedure AfterConstruction; override;
    property FileName: string read FFileName write SetFileName;
    property ListaDeClientes: TObjectList<TCliente> read GetListaClientes write SetListaDeClientes;
  end;

type
  TProduto = class
  private
    FCodigoEstoque: Integer;
    procedure SetCodigoEstoque(const Value: Integer);
  protected
    FNCM: string;
    FNome: string;
    FPrecoCusto1: Currency;
    FObservacao: string;
    FPrecoVenda1: Currency;
    FEstoqueMinimo: Double;
    FCodigoBarrasEAN: string;
    FDescricao: string;
    FCodigoBarrasUPC: string;
    FCodigo: string;
    FQuantidadeBase: double;
    FCodigosite: string;
    FFabricante: string;
    FPrimeiraUnidade: string;
    FCodGrupo: Integer;
    FGrupo: string;
    FStatus: string;
    FVlrUnitario: Extended;
    FVlrUnitarioSemTaxa: Extended;
    FVlrUnitarioComTaxa: Extended;

    procedure SetCodigo(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetCodigoBarrasEAN(const Value: string);
    procedure SetCodigoBarrasUPC(const Value: string);
    procedure SetCodigosite(const Value: string);
    procedure SetDescricao(const Value: string);
    procedure SetEstoqueMinimo(const Value: Double);
    procedure SetFabricante(const Value: string);
    procedure SetCodGrupo(const Value: Integer);
    procedure SetGrupo(const Value: string);
    procedure SetObservacao(const Value: string);
    procedure SetPrecoVenda1(const Value: Currency);
    procedure SetPrecoCusto1(const Value: Currency);
    procedure SetPrimeiraUnidade(const Value: string);
    procedure SetQuantidadeBase(const Value: double);
    procedure SetStatus(const Value: string);
    procedure SetVlrUnitario(const Value: Extended);
    procedure SetVlrUnitarioComTaxa(const Value: Extended);
    procedure SetVlrUnitarioSemTaxa(const Value: Extended);
    procedure SetNCM(const Value: string);
  public
    property Codigosite: string read FCodigosite write SetCodigosite;
    property Fabricante: string read FFabricante write SetFabricante;
    property CodGrupo: Integer read FCodGrupo write SetCodGrupo;
    property Grupo: string read FGrupo write SetGrupo;
    property Codigo: string read FCodigo write SetCodigo;
    property Nome: string read FNome write SetNome;
    property Status: string read FStatus write SetStatus;
    property CodigoBarrasEAN: string read FCodigoBarrasEAN write SetCodigoBarrasEAN;
    property QuantidadeBase: double read FQuantidadeBase write SetQuantidadeBase;
    property EstoqueMinimo: Double read FEstoqueMinimo write SetEstoqueMinimo;
    property PrecoVenda1: Currency read FPrecoVenda1 write SetPrecoVenda1;
    property PrecoCusto1: Currency read FPrecoCusto1 write SetPrecoCusto1;
    property PrimeiraUnidade: string read FPrimeiraUnidade write SetPrimeiraUnidade;
    property Observacao: string read FObservacao write SetObservacao;
    property Descricao: string read FDescricao write SetDescricao;
    property CodigoBarrasUPC: string read FCodigoBarrasUPC write SetCodigoBarrasUPC;
    property VlrUnitario: Extended read FVlrUnitario write SetVlrUnitario;
    property VlrUnitarioComTaxa: Extended read FVlrUnitarioComTaxa write SetVlrUnitarioComTaxa;
    property VlrUnitarioSemTaxa: Extended read FVlrUnitarioSemTaxa write SetVlrUnitarioSemTaxa;
    property NCM: string read FNCM write SetNCM;
    property CodigoEstoque: Integer read FCodigoEstoque write SetCodigoEstoque;
  end;

  TSolicitarProdutos = class
  private
    FProduto: string;
    procedure Setproduto(const Value: string);
  protected
    FXMLDocument: IXMLDocument;
    FXMLManufacturers: IXMLDocument;
    FXMLCategories: IXMLDocument;
    FXMLStock_Availables: IXMLDocument;
    FXMLProduct_feature_values: IXMLDocument;
    FUltimoProdutoImportado: Integer;
    FListaDeProdutos: TObjectList<TProduto>;

    procedure SetListaDeProdutos(const value: TObjectList<TProduto>);
    function GetListaProdutos(): TObjectList<TProduto>;

    function PreencherFabricanteProduto(var produto: TProduto; const psID: string): Boolean;
    function PreencherCategoriaProduto(var produto: TProduto; const psID: string):Boolean;
    function PreencherQuantidadeProduto(var produto: TProduto; const psID: string): Boolean;
    function PreencherNCMProduto(var produto: TProduto; const psID: string): Boolean;
    function HtmlToText(Value: string): string;
    procedure SetUltimoProdutoImportado(const Value: Integer);
  public
    property Produto: string read FProduto write SetProduto;
    property UltimoProdutoImportado: Integer read FUltimoProdutoImportado write SetUltimoProdutoImportado;

    procedure BeforeDestruction; override;
    procedure AfterConstruction; override;
    property ListaDeProdutos: TObjectList<TProduto> read GetListaProdutos write SetListaDeProdutos;
  end;

  type
    TPedido = class
    private
    FCPF_CNPJ_Cliente: string;
    FCPF_CNPJ_ClienteEntrega: string;
    procedure SetCPF_CNPJ_Cliente(const Value: string);
    procedure SetCPF_CNPJ_ClienteEntrega(const Value: string);
    protected
      FValorFrete: Currency;
      FNumeroFatura: Integer;
      FCondicaoPagamento: String;
      FTransportadora: Integer;
      FUnitario: string;
      FDataEntrega: string;
      FValorDesconto: Currency;
      FUf: string;
      FDescricao: string;
      FItems: TObjectList<TProduto>;
      FCodigoBarrasUPC: Integer;
      FCodigo: Integer;
      FValorMercadorias: Currency;
      FProdutoId: Integer;
      FDataFatura: string;
      FMoeda: string;
      FNumeroProduto: string;
      FStatus: string;
      FCliente: Integer;
      FClienteEntrega: Integer;
      FQuantidade: Double;
      FNumeroPedido: string;
      FValorLiquido: Currency;
      FCodigoBarrasEAN13: Integer;
      FDescricaoMoeda: string;
      procedure SetCliente(const Value: Integer);
      procedure SetClienteEntrega(const Value: Integer);
      procedure Setcodigo(const Value: Integer);
      procedure SetCodigoBarrasEAN13(const Value: Integer);
      procedure SetCodigoBarrasUPC(const Value: Integer);
      procedure SetCondicaoPagamento(const Value: String);
      procedure SetDataEntrega(const Value: string);
      procedure SetDataFatura(const Value: string);
      procedure SetDescricao(const Value: string);
      procedure SetDescricaoMoeda(const Value: string);
      procedure SetItems(const Value: TObjectList<TProduto>);
      procedure SetMoeda(const Value: string);
      procedure SetNumeroFatura(const Value: Integer);
      procedure SetNumeroPedido(const Value: string);
      procedure SetNumeroProduto(const Value: string);
      procedure SetProdutoId(const Value: Integer);
      procedure SetQuantidade(const Value: Double);
      procedure SetStatus(const Value: string);
      procedure SetTransportadora(const Value: Integer);
      procedure SetUf(const Value: string);
      procedure SetUnitario(const Value: string);
      procedure SetValorDesconto(const Value: Currency);
      procedure SetValorFrete(const Value: Currency);
      procedure SetValorLiquido(const Value: Currency);
      procedure SetValorMercadorias(const Value: Currency);
    public
      property Codigo: Integer read FCodigo write SetCodigo;
      property ClienteEntrega: Integer read FClienteEntrega write SetClienteEntrega;
      property Uf: string read FUf write SetUf;
      property Cliente: Integer read FCliente write SetCliente;
      property Moeda: string read FMoeda write SetMoeda;
      property DescricaoMoeda: string read FDescricaoMoeda write SetDescricaoMoeda;
      property Transportadora: Integer read FTransportadora write SetTransportadora;
      property Status: string read FStatus write SetStatus;
      property NumeroFatura: Integer read FNumeroFatura write SetNumeroFatura;
      property DataFatura: string read FDataFatura write SetDataFatura;
      property DataEntrega: string read FDataEntrega write SetDataEntrega;
      property CondicaoPagamento: String read FCondicaoPagamento write SetCondicaoPagamento;
      property ValorDesconto: Currency read FValorDesconto write SetValorDesconto;
      property ValorLiquido: Currency read FValorLiquido write SetValorLiquido;
      property ValorMercadorias: Currency read FValorMercadorias write SetValorMercadorias;
      property ValorFrete: Currency read FValorFrete write SetValorFrete;
      property NumeroPedido: string read FNumeroPedido write SetNumeroPedido;
      property ProdutoId: Integer read FProdutoId write SetProdutoId;
      property Quantidade: Double read FQuantidade write SetQuantidade;
      property Descricao: string read FDescricao write SetDescricao;
      property NumeroProduto: string read FNumeroProduto write SetNumeroProduto;
      property CodigoBarrasEAN13: Integer read FCodigoBarrasEAN13 write SetCodigoBarrasEAN13;
      property CodigoBarrasUPC: Integer read FCodigoBarrasUPC write SetCodigoBarrasUPC;
      property Unitario: string read FUnitario write SetUnitario;
      property CPF_CNPJ_Cliente: string read FCPF_CNPJ_Cliente write SetCPF_CNPJ_Cliente;
      property CPF_CNPJ_ClienteEntrega: string read FCPF_CNPJ_ClienteEntrega write SetCPF_CNPJ_ClienteEntrega;
      property Items: TObjectList<TProduto> read FItems write SetItems;

      procedure BeforeDestruction; override;
      procedure AfterConstruction; override;
    end;

  type
    TSolicitarPedidos = class
  private
    function PreencherCustomersCliente(var Pedido: TPedido;
      const psID: string; IsDelivery: Boolean): Boolean;
    protected
      FXMLDocument: IXMLDocument;
      FXMLAddresses: IXMLDocument;
      FXMLCurrencies: IXMLDocument;
      FXMLCarriers: IXMLDocument;
      FXMLCustomers: IXMLDocument;
//      FXMLOrder_States: IXMLDocument;
      FXMLStates: IXMLDocument;
//      FAcessoSiteEvolucao: TAcessoSiteEvolucao;
      FListaDePedidos: TObjectList<TPedido>;

      procedure BuscarCustumersClientePedido(var Pedido: TPedido; const psID: string; IsDelivery: Boolean = False);
      function PreencherEstadoPedido(var Pedido: TPedido; const psID: string): Boolean;
      procedure PreencherMoedaEntrega(var Pedido: TPedido; const psID: string);
      procedure PreencherTransportadoraPedido(var Pedido: TPedido; const psID: string);
      procedure PreencherStatusPedido(var Pedido: TPedido; const psID: string);
      procedure PreencherItensPedido(var Pedido: TPedido; Node: IXMLNode);
      procedure SetListaDePedidos(const value: TObjectList<TPedido>);
      function GetListaPedidos(): TObjectList<TPedido>;
    public
      procedure BeforeDestruction; override;
      procedure AfterConstruction; override;

      property ListaDePedidos: TObjectList<TPedido> read GetListaPedidos write SetListaDePedidos;
    end;

    TEstoque = class(TProduto)
      private

      public
        procedure AtualizarEstoque();
    end;

    function GetXML(psComplemento: string): string;
    function PostXML(psComplemento: string): string;
    function ClearString(const Value, SubStr: string): string;
    function ExisteId(const Node:IXmlNode;const pID, pNodeName: string): Boolean;
    function GetNodeByName(const node: IXMLNode; NodeSearch: string): IXMLNode;
    function GetUltimoID(const Tabela: string): Integer;
    function IsNumber(Value: string): Boolean;
    function StrToFloatEsp(Value: string): Double;
    Function IsDate(stDate : String) : Boolean;
    function StrToDateUSA(Value: string): TDateTime;

function GetAcessoSiteEvolucao : TAcessoSiteEvolucao;
var
  AcessoSiteEvolucao: TAcessoSiteEvolucao;

implementation

{ TAcessoSiteEvolucao }

function GetAcessoSiteEvolucao : TAcessoSiteEvolucao;
begin
  if not Assigned( AcessoSiteEvolucao ) then
    AcessoSiteEvolucao := TAcessoSiteEvolucao.createPrivate;

  Result := AcessoSiteEvolucao;
end;


function GetXML(psComplemento: string): string;
begin
  GetAcessoSiteEvolucao.setURL(Format('http://evolucaopet.com.br/api/%s', [psComplemento]));
  GetAcessoSiteEvolucao.ConfigurarRequisicao();
  Result := GetAcessoSiteEvolucao.get();
end;

function PostXML(psComplemento: string): string;

begin
  GetAcessoSiteEvolucao.setURL(Format('https://evolucaopet.com.br/actions/erp_stock.php?set=export%s', [psComplemento]));
  Result := GetAcessoSiteEvolucao.post();
end;

function ExisteId(const Node:IXMLNode;const pID, pNodeName: string): Boolean;
var
  i: Integer;
  lNode: IXMLNode;
begin
  result:= False;
  lNode:= GetNodeByName(Node, pNodeName);
  for i := 0 to lNode.ChildNodes.Count -1 do
    if pID = VarToStrDef(lNode.ChildNodes[i].Attributes['id'], '') then
    begin
      Result:= True;
      Break;
    end;
end;

function ClearString(const Value, SubStr: string): string;
var
  i: Integer;
begin
  Result:= Value;

  for I := 1 to Length(SubStr) do
  begin
    Result:= StringReplace(Result, SubStr[i], '', [rfReplaceAll]);
  end;
end;

procedure TAcessoSiteEvolucao.ConfigurarRequisicao();
begin
  self.getCustomHeaders.Clear;
  self.getRequest.Username := 'XTM4T52R7EKV1557DGYMTVZCDWG78KGT';
  self.getRequest.BasicAuthentication := true;
  self.getRequest.ContentType := 'text/xml;charset=utf-8';
  self.getRequest.CacheControl := 'no-cache';
  self.getRequest.UserAgent := EmptyStr;
  self.getRequest.Accept := EmptyStr;
  self.getRequest.AcceptEncoding := EmptyStr;
  self.Params.Clear;
end;

constructor TAcessoSiteEvolucao.CreatePrivate();
begin
  inherited Create(True);
end;

function TAcessoSiteEvolucao.setApyKey(value: String): TAcessoSiteEvolucao;
begin
  self.URL := value;
  Result := self;
end;

function TAcessoSiteEvolucao.setKey(value: String): TAcessoSiteEvolucao;
begin
  self.Key := value;
  Result := self;
end;

function TAcessoSiteEvolucao.setPass(value: String): TAcessoSiteEvolucao;
begin
  self.Pass := value;
  Result := self;
end;

function TAcessoSiteEvolucao.setURL(value: String): TAcessoSiteEvolucao;
begin
  self.URL := value;
  Result := self;
end;

function TAcessoSiteEvolucao.setUser(value: String): TAcessoSiteEvolucao;
begin
  self.User := value;
  Result := self;
end;

function GetNodeByName(const node: IXMLNode; NodeSearch: string): IXMLNode;
var
  i: Integer;
begin
  Result := nil;
  if not Assigned( node ) then
    Exit;

  for i := 0 to node.ChildNodes.Count - 1 do
  begin
    if AnsiUpperCase(node.ChildNodes[i].NodeName) = AnsiUpperCase(NodeSearch) then
      begin
        Result := node.ChildNodes[i];
        Break;
      end
    else if node.ChildNodes[i].HasChildNodes then
      Result := GetNodeByName(node.ChildNodes[i], NodeSearch);
  end;
end;

function GetUltimoID(const Tabela: string):Integer;
var
  XML: IXMLDocument;
  Node: IXMLNode;
begin
  XML:= TXMLDocument.Create(nil);
  try
    XML.LoadFromXML( GetXML( Format('%s/?display=[id]&limit=1,1&sort=[id_desc]', [Tabela]) ) );

    Node:= GetNodeByName( XML.DocumentElement, 'ID' );

    Result:= StrToInt( VarToStrDef(Node.NodeValue, '0') );
  except on e: exception do
    raise Exception.Create('Erro: '+ e.Message);
  end;
end;

function IsNumber(Value: string): Boolean;
begin
  result:= StrToFloatDef(Value, -1) <> -1;
end;

function StrToFloatEsp(Value: string): Double;
begin
  result:= StrToFloat(StringReplace(Value, '.', ',', [rfReplaceAll]));
end;

Function IsDate(stDate : String) : Boolean;
Var
  dtValue : TDateTime;
Begin
  try
    dtValue := StrToDateTime(stDate);
    IsDate := True;
  except
    IsDate := False;
  end;
End;

function StrToDateUSA(Value: string): TDateTime;
var
  lsdata : string;
begin
  result:= 0;
  lsdata := copy(Value,9,2)+'/'+copy(Value, 6,2)+'/'+ copy(Value, 1,4);
  if IsDate(lsdata) then
    result:= StrToDate(lsdata);
end;

{ TSolicitarCliente }

procedure TSolicitarClientes.AfterConstruction;
begin
  inherited;
//  FAcessoSiteEvolucao := TAcessoSiteEvolucao.Create(true);
  FListaDeClientes := TObjectList<TCliente>.Create;
  FXMLDocument:= TXmlDocument.Create(nil);
  FXMLCustomers:= TXmlDocument.Create(nil);
  FXMLCountries:= TXmlDocument.Create(nil);
  FXMLStates:= TXmlDocument.Create(nil);
end;

procedure TSolicitarClientes.BeforeDestruction;
begin
  inherited;
  FreeAndNil(FListaDeClientes);
  FXMLDocument:= nil;
  FXMLCustomers:= nil;
  FXMLCountries:= nil;
  FXMLStates:= nil;
end;

function TSolicitarClientes.PreencherCustomersCliente(var Cliente: TCliente; const psID: string): Boolean;
var
  NodeCustomer, Node: IXMLNode;
  i, j: Integer;
begin
  Result:= False;
  NodeCustomer:= GetNodeByName(FXMLCustomers.DocumentElement, 'customers');
  for I := 0 to NodeCustomer.ChildNodes.Count -1 do
  begin
    //Node:= GetNodeByName(NodeCustomer.ChildNodes[i], 'customer');
    Node:= NodeCustomer.ChildNodes[i];
    if VarToStrDef(Node.ChildNodes.FindNode('id').NodeValue, '') = psID then
    begin
      for j := 0 to Node.ChildNodes.Count -1 do
      begin
        case AnsiIndexStr(AnsiUpperCase(Node.ChildNodes[j].NodeName),
          ['LASTNAME','FIRSTNAME','EMAIL','BIRTHDAY','WEBSITE','COMPANY','ACTIVE','TIPO','CPF_CNPJ','RG_IE']) of
//          0: Cliente.NomeReduzido := Node.ChildNodes[j].NodeValue; //lastname
          1:
            begin
              Cliente.Nome:= Node.ChildNodes[j].NodeValue + ' ' + Node.ChildNodes.FindNode('lastname').NodeValue ;//firstname
              Cliente.NomeReduzido:= Node.ChildNodes[j].NodeValue;//firstname
            end;
          2: Cliente.Email := Node.ChildNodes[j].NodeValue;        //email
          3:
            if (VarToStrDef( Node.ChildNodes[j].NodeValue, '') <> EmptyStr)  then
              Cliente.DataNascimento := StrToDateUSA(Node.ChildNodes[j].NodeValue);  //birthday
          4:
            if (VarToStrDef( Node.ChildNodes[j].NodeValue, '') <> EmptyStr) then
              Cliente.Homepage := VarToStrDef( Node.ChildNodes[j].NodeValue, '');
          5:
            if (VarToStrDef( Node.ChildNodes[j].NodeValue, '') <> EmptyStr) then
              Cliente.RazaoSocial := VarToStrDef( Node.ChildNodes[j].NodeValue, '');//company
          6:
            if VarToStrDef( Node.ChildNodes[j].NodeValue, '') = '1' then //active
              Cliente.StatusCliente:= '0'
            else
              Cliente.StatusCliente:= '1';

          7: Cliente.Pessoa := AnsiUpperCase( VarToStrDef( Node.ChildNodes[j].NodeValue, '') );         //tipo
          8:
            if (VarToStrDef( Node.ChildNodes[j].NodeValue, '') <> EmptyStr) then //cpf_cnpj
              Cliente.CnpjCpf:= Trim( ClearString( VarToStrDef(Node.ChildNodes[j].NodeValue, '') , '-/.') );
          9:
            if (VarToStrDef( Node.ChildNodes[j].NodeValue, '') <> EmptyStr) then
              Cliente.RgIe:= VarToStrDef( Node.ChildNodes[j].NodeValue, '');          //rg_ie
        end;
      end;

      Result:= True;
      Break;
    end;
  end;
end;

function TSolicitarClientes.PreencherEstadoCliente(var cliente: TCliente;const psID: string): Boolean;
var
  NodeStates, Node: IXMLNode;
  i, j: Integer;
begin
  Result:= False;
  NodeStates:= GetNodeByName(FXMLStates.DocumentElement, 'states');
  for i := 0 to NodeStates.ChildNodes.Count -1 do
  begin
    //Node:= GetNodeByName(NodeStates.ChildNodes[i], 'state');
    Node:= NodeStates.ChildNodes[i];
    if VarToStrDef(Node.ChildNodes.FindNode('id').NodeValue, '') = psID then
    begin
      for j := 0 to Node.ChildNodes.Count -1 do
      begin
        case AnsiIndexStr(AnsiUpperCase(Node.ChildNodes[j].NodeName),['NAME', 'ISO_CODE']) of
          0: cliente.municipio := VarToStrDef( Node.ChildNodes[j].NodeValue, '');
          1: cliente.Uf := VarToStrDef( Node.ChildNodes[j].NodeValue, '');
        end;
      end;

      Result:= True;
      Break;
    end;
  end;
end;

function TSolicitarClientes.PreencherCountriesCliente(var cliente: TCliente; const psID: string): Boolean;
var
  NodeCountries, Node: IXMLNode;
  i, j: Integer;
  lteste: string;
begin
  Result:= False;
  NodeCountries:= GetNodeByName(FXMLCountries.DocumentElement, 'countries');
  for i := 0 to NodeCountries.ChildNodes.Count -1 do
  begin
    //Node:= GetNodeByName(NodeCountries.ChildNodes[i], 'country');
    Node:= NodeCountries.ChildNodes[i];
    if VarToStrDef(Node.ChildNodes.FindNode('id').NodeValue, '') = psID then
    begin
      for j := 0 to Node.ChildNodes.Count -1 do
      begin
        lteste:= AnsiUpperCase(Node.ChildNodes[j].NodeName);
        case AnsiIndexStr(lteste,['ID','CALL_PREFIX','NAME']) of
          0: cliente.CodPais:= VarToStrDef( Node.ChildNodes[j].NodeValue, '');
          1: cliente.DDI:= VarToStrDef( Node.ChildNodes[j].NodeValue, '');
          2: cliente.NomePais := VarToStrDef( Node.ChildNodes[j].ChildNodes['language'].NodeValue, '');
        end;
      end;

      Result:= True;
      Break;
    end;
  end;
end;

function TSolicitarClientes.GetListaClientes(): TObjectList<TCliente>;
var
  lsCampos: string;
  loCliente: TCliente;
  i, j, K: Integer;
  NodeReturn: IXMLNode;
  NodeReturnCliente: IXMLNode;
  lsXML: string;
  lsStrAux: string;
  liQtImportar: Integer;
begin
  liQtImportar:= GetUltimoID('addresses') - FUltimoClienteImportado;
  lsXML:= GetXML('customers/?display=[id,lastname,firstname,email,birthday,website,company,active,tipo,cpf_cnpj,rg_ie]');
  if lsXML <> EmptyStr then
    FXMLCustomers.LoadFromXML( lsXML );

  lsXML:= GetXML( 'countries/?display=[id,name,call_prefix]' );
  if lsXML <> EmptyStr then
    FXMLCountries.LoadFromXML( lsXML );

  lsXML:= GetXML( 'states/?display=[id,name,iso_code]' );
  if lsXML <> EmptyStr then
    FXMLStates.LoadFromXML( lsXML );

  if FCodigo <> 0 then
    lsXML:= GetXML( Format('addresses/%d', [FCodigo]))
  else
    lsXML:= GetXML( Format('addresses/?display=full&limit=%d,%d&sort=[id_desc]', [1, liQtImportar]));

  FXMLDocument.LoadFromXML( lsXML );

  if FXMLDocument.Active then
  begin
    if FCodigo <> 0 then
      NodeReturn := FXMLDocument.DocumentElement
    else
      NodeReturn := GetNodeByName(FXMLDocument.DocumentElement, 'addresses');

    for i := 0 to NodeReturn.ChildNodes.Count - 1 do
    begin
      TSuperClass.GetInstance.Log.save(Format('[Clientes] Baixando cliente [%d, %d]: ', [ i + 1, NodeReturn.ChildNodes.Count]), mtInfo);

      loCliente := TCliente.Create;
      NodeReturnCliente := NodeReturn.ChildNodes[i];
      for j := 0 to NodeReturnCliente.ChildNodes.Count -1 do
      begin
        case AnsiIndexStr( AnsiUpperCase(NodeReturnCliente.ChildNodes[j].NodeName),
          ['ID','ID_CUSTOMER','ID_SUPPLIER','ID_COUNTRY','ID_STATE','ADDRESS1',
           'ADDRESS2','POSTCODE','CITY','PHONE','PHONE_MOBILE','NUMEND','COMPL'] ) of
          0:
            loCliente.codigo := StrToInt( VarToStrDef( NodeReturnCliente.ChildNodes[j].NodeValue, '0' ));  //ID
          1:
            if not PreencherCustomersCliente( loCliente, NodeReturnCliente.ChildNodes[j].NodeValue) then //ID_CUSTOMER
            begin
              FreeAndNil(loCliente);
              Break;
            end;
          2:
            loCliente.fornecedor := VarToStrDef( NodeReturnCliente.ChildNodes[j].NodeValue, '' );   //ID_SUPPLIER
          3:
            if not PreencherCountriesCliente(loCliente, NodeReturnCliente.ChildNodes[j].NodeValue) then //ID_COUNTRY
            begin
              FreeAndNil(loCliente);
              Break;
            end;

          4:
            if not PreencherEstadoCliente(loCliente, NodeReturnCliente.ChildNodes[j].NodeValue) then //ID_STATE
            begin
              FreeAndNil(loCliente);
              Break;
            end;
          5:
            loCliente.endereco := VarToStrDef( NodeReturnCliente.ChildNodes[j].NodeValue, ''); //ADDRESS1
          6:
            loCliente.Bairro := VarToStrDef( NodeReturnCliente.ChildNodes[j].NodeValue, ''); // ADDRESS2
          7:
            loCliente.Cep := Trim( ClearString( VarToStrDef(NodeReturnCliente.ChildNodes[j].NodeValue, '') , '-/.') ); // POSTCODE
          8:
            loCliente.municipio := VarToStrDef( NodeReturnCliente.ChildNodes[j].NodeValue, ''); //CITY
          9:
            begin
              // PHONE
              lsStrAux:= VarToStrDef(NodeReturnCliente.ChildNodes[j].NodeValue, '');
              if Pos('(', lsStrAux) > 0 then
                begin
                  loCliente.DDD:= ClearString( Copy(lsStrAux, 1, Pos(')', lsStrAux)), '()');
                  Delete(lsStrAux, 1, Pos(')', lsStrAux));
                  loCliente.telefone:= Trim( ClearString( lsStrAux , '()-/.') );
                end
              else
                loCliente.telefone := Trim( ClearString( VarToStrDef(NodeReturnCliente.ChildNodes[j].NodeValue, '') , '()-/.') );
            end;
          10:
            begin
              // PHONE_MOBILE
              lsStrAux:= VarToStrDef(NodeReturnCliente.ChildNodes[j].NodeValue, '');
              if Pos('(', lsStrAux) > 0 then
                begin
                  Delete(lsStrAux, 1, Pos(')', lsStrAux));
                  loCliente.celular:= Trim( ClearString( lsStrAux , '()-/.') );
                end
              else
                loCliente.celular := Trim( ClearString( VarToStrDef(NodeReturnCliente.ChildNodes[j].NodeValue, '') , '()-/.') ); // PHONE
            end;
          11:
            loCliente.numero := VarToStrDef( NodeReturnCliente.ChildNodes[j].NodeValue, '');  //NUMEND
          12:
            loCliente.Complemento := VarToStrDef( NodeReturnCliente.ChildNodes[j].NodeValue, ''); //COMPL
        end;
      end;

      if Assigned(loCliente) then
        FListaDeClientes.Add(loCliente);
    end;
  end;

  Result := FListaDeClientes;
end;

procedure TSolicitarClientes.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TSolicitarClientes.SetListaDeClientes(const value: TObjectList<TCliente>);
begin
  FListaDeClientes := value;
end;

procedure TSolicitarClientes.SetUltimoClienteImportado(const Value: Integer);
begin
  FUltimoClienteImportado := Value;
end;

{ TProduto }

procedure TProduto.SetCodGrupo(const Value: Integer);
begin
  FCodGrupo := Value;
end;

procedure TProduto.SetCodigo(const Value: string);
begin
  FCodigo := Value;
end;

procedure TProduto.SetCodigoBarrasEAN(const Value: string);
begin
  FCodigoBarrasEAN := Value;
end;

procedure TProduto.SetCodigoBarrasUPC(const Value: string);
begin
  FCodigoBarrasUPC := Value;
end;

procedure TProduto.SetCodigoEstoque(const Value: Integer);
begin
  FCodigoEstoque := Value;
end;

procedure TProduto.SetCodigosite(const Value: string);
begin
  FCodigosite := Value;
end;

procedure TProduto.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TProduto.SetEstoqueMinimo(const Value: Double);
begin
  FEstoqueMinimo := Value;
end;

procedure TProduto.SetFabricante(const Value: string);
begin
  FFabricante := Value;
end;

procedure TProduto.SetGrupo(const Value: string);
begin
  FGrupo := Value;
end;

procedure TProduto.SetNCM(const Value: string);
begin
  FNCM := Value;
end;

procedure TProduto.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TProduto.SetObservacao(const Value: string);
begin
  FObservacao := Value;
end;

procedure TProduto.SetPrecoVenda1(const Value: Currency);
begin
  FPrecoVenda1 := Value;
end;

procedure TProduto.SetPrecoCusto1(const Value: Currency);
begin
  FPrecoCusto1 := Value;
end;

procedure TProduto.SetPrimeiraUnidade(const Value: string);
begin
  FPrimeiraUnidade := Value;
end;

procedure TProduto.SetQuantidadeBase(const Value: double);
begin
  FQuantidadeBase := Value;
end;

procedure TProduto.SetStatus(const Value: string);
begin
  FStatus := Value;
end;

procedure TProduto.SetVlrUnitario(const Value: Extended);
begin
  FVlrUnitario := Value;
end;

procedure TProduto.SetVlrUnitarioComTaxa(const Value: Extended);
begin
  FVlrUnitarioComTaxa := Value;
end;

procedure TProduto.SetVlrUnitarioSemTaxa(const Value: Extended);
begin
  FVlrUnitarioSemTaxa := Value;
end;

{ TSolicitarProduto }

procedure TSolicitarProdutos.AfterConstruction;
begin
  inherited;
//  FAcessoSiteEvolucao:= TAcessoSiteEvolucao.Create(true);
  FListaDeProdutos:= TObjectList<TProduto>.Create();
  FXMLDocument:= TXmlDocument.Create(nil);
  FXMLManufacturers:= TXmlDocument.Create(nil);
  FXMLCategories:= TXmlDocument.Create(nil);
  FXMLStock_Availables:= TXmlDocument.Create(nil);
  FXMLProduct_feature_values:= TXmlDocument.Create(nil);
end;

procedure TSolicitarProdutos.BeforeDestruction;
begin
  inherited;
  FreeAndNil(FListaDeProdutos);
  FXMLDocument:= nil;
  FXMLManufacturers:= nil;
  FXMLCategories:= nil;
  FXMLStock_Availables:= nil;
  FXMLProduct_feature_values:= nil;
end;

function TSolicitarProdutos.GetListaProdutos: TObjectList<TProduto>;
var
  loProduto: TProduto;
  i, j, k: Integer;
  lNode: IXMLNode;
  NodeReturn: IXMLNode;
  NodeReturnProduto: IXMLNode;
  lNodeAssociations: IXMLNode;
  xmlProduto: IXMLDocument;
  lsXML: string;
  lsNodeName: string;
  liQtImportar: Integer;
begin
  if FProduto = '' then
    begin
      liQtImportar:= GetUltimoID('products') - FUltimoProdutoImportado;
      lsXML:= GetXML( Format('products/?display=full&limit=1,%d&sort=[id_desc]', [liQtImportar]));
      FXMLDocument.LoadFromXML( lsXML );
    end
  else
    begin
      lsXML:= GetXML( Format('products/%s', [FProduto]));
      FXMLDocument.LoadFromXML( lsXML );
    end;

//  lsXML:= GetXML( 'manufacturers/ ');
  lsXML:= GetXML( 'manufacturers/?display=[id,name]');
  if lsXML <> EmptyStr then
    FXMLManufacturers.LoadFromXML( lsXML );

  lsXML:= GetXML( 'categories/?display=[id,name]');
  if lsXML <> EmptyStr then
    FXMLCategories.LoadFromXML( lsXML );

  lsXML:= GetXML( 'stock_availables/?display=[id,quantity]');
  if lsXML <> EmptyStr then
    FXMLStock_Availables.LoadFromXML( lsXML );

  lsXML:= GetXML( 'product_feature_values/?display=[id,value]' );
  if lsXML <> EmptyStr then
    FXMLProduct_feature_values.LoadFromXML( lsXML );

  if FXMLDocument.Active then
  begin
    if FProduto <> '' then
      NodeReturn := FXMLDocument.DocumentElement
    else
      NodeReturn:= GetNodeByName(FXMLDocument.DocumentElement, 'products');

    xmlProduto:= TXMLDocument.Create(nil);

    for i := 0 to NodeReturn.ChildNodes.Count - 1 do
    begin
      TSuperClass.GetInstance.Log.save(Format('[Produtos] Baixando produto [%d, %d]: ', [ i + 1, NodeReturn.ChildNodes.Count]), mtInfo);

      loProduto:= TProduto.Create;
      NodeReturnProduto:= NodeReturn.ChildNodes[i];
      for j := 0 to NodeReturnProduto.ChildNodes.Count -1 do
      begin
        lsNodeName:= AnsiUpperCase(NodeReturnProduto.ChildNodes[j].NodeName);
        case AnsiIndexStr( lsNodeName,
          ['ID','ID_MANUFACTURER','ID_CATEGORY_DEFAULT','REFERENCE','EAN13','UPC','MINIMAL_QUANTITY',
          'PRICE', 'ACTIVE', 'WHOLESALE_PRICE','UNITY', 'NAME', 'DESCRIPTION',
          'DESCRIPTION_SHORT', 'ASSOCIATIONS', 'PRODUCT_FEATURES']) of

          0: loProduto.Codigosite := NodeReturnProduto.ChildNodes[j].NodeValue;

          1: //if ExisteId(FXMLManufacturers.DocumentElement, VarTostrDef(NodeReturnProduto.ChildNodes[j].nodeValue, ''), 'manufacturers') then
             PreencherFabricanteProduto(loProduto, NodeReturnProduto.ChildNodes[j].NodeValue);

          2: //if ExisteId(FXMLCategories.DocumentElement, VarTostrDef(NodeReturnProduto.ChildNodes[j].nodeValue, ''), 'categories') then
             PreencherCategoriaProduto(loProduto, NodeReturnProduto.ChildNodes[j].NodeValue);

          3: loProduto.Codigo := VarToStrDef( NodeReturnProduto.ChildNodes[j].NodeValue, '');
//
          4: loProduto.CodigoBarrasEAN := VarToStrDef(NodeReturnProduto.ChildNodes[j].NodeValue, '');

          5: loProduto.CodigoBarrasUPC := VarToStrDef(NodeReturnProduto.ChildNodes[j].NodeValue, '');
//
          6: loProduto.EstoqueMinimo := StrToFloatEsp( VarToStrDef(NodeReturnProduto.ChildNodes[j].NodeValue, '0') );

          7: loProduto.PrecoVenda1 := StrToFloatEsp( VarToStrDef( NodeReturnProduto.ChildNodes[j].NodeValue, '0') );

          8:
            begin
              loProduto.Status:= '0';
              if VarToStrDef( NodeReturnProduto.ChildNodes[j].NodeValue, '0') = '0' then
              begin
                FreeAndNil( loProduto );
                Break;
              end;
            end;

          9: loProduto.PrecoCusto1 := StrToFloatEsp( VarToStrDef( NodeReturnProduto.ChildNodes[j].NodeValue, '0') );

          10: loProduto.PrimeiraUnidade := VarToStrDef( NodeReturnProduto.ChildNodes[j].NodeValue, '');

          11: loProduto.Nome:= VarToStrDef( NodeReturnProduto.ChildNodes[j].ChildNodes['language'].NodeValue, '');

          12: loProduto.Descricao:= HtmlToText( VarToStrDef( NodeReturnProduto.ChildNodes[j].ChildNodes['language'].NodeValue, '') );

          13: loProduto.Observacao:= VarToStrDef( NodeReturnProduto.ChildNodes[j].ChildNodes['language'].NodeValue, '');

          14:
            begin
              lNodeAssociations:= NodeReturnProduto.ChildNodes[j];

              lNode:= GetNodeByName( GetNodeByName( GetNodeByName(lNodeAssociations, 'product_features'), 'product_feature'), 'id_feature_value');
              if Assigned( lNode ) then
//                ExisteId(FXMLProduct_feature_values.DocumentElement, VarTostrDef(lNode.NodeValue, ''), 'product_feature_values') then
                PreencherNCMProduto(loProduto, VarToStrDef(lNode.NodeValue, ''));

              lNode:= GetNodeByName( GetNodeByName( GetNodeByName(lNodeAssociations, 'stock_availables'), 'stock_available'), 'id');
              if Assigned( lNode ) then
              begin
//                ExisteId(FXMLStock_Availables.DocumentElement, VarTostrDef(lNode.NodeValue, ''), 'stock_availables') then
                PreencherQuantidadeProduto(loProduto, VarToStrDef(lNode.NodeValue, ''));
                loProduto.CodigoEstoque:= StrToInt( VarToStrDef(lNode.NodeValue, '0') );
              end;
            end;
        end;
      end;
      if Assigned( loProduto ) then
        FListaDeProdutos.Add(loProduto);
    end;
  end;
  Result := FListaDeProdutos;
//  Sleep(120000);
end;

function TSolicitarProdutos.HtmlToText(Value: string): string;
var
  IDoc:      IHTMLDocument2;
  Strl:      TStringList;
  sHTMLFile: String;
  v:         Variant;
  Links:     IHTMLElementCollection;
  i:         Integer;
  Link:    IHTMLAnchorElement;
begin
  if Value = EmptyStr then
    Exit;

  Strl := TStringList.Create;
  try
    Strl.Text:= Value;
    Idoc:=CreateComObject(Class_HTMLDOcument) as IHTMLDocument2;
    try
      IDoc.designMode:='on';
      while IDoc.readyState<>'complete' do
        Application.ProcessMessages;
      v:=VarArrayCreate([0,0],VarVariant);
      v[0]:= Strl.Text;
      IDoc.write(PSafeArray(System.TVarData(v).VArray));
      IDoc.designMode:='off';
      while IDoc.readyState<>'complete' do
        Application.ProcessMessages;

      Result:= IDoc.body.innerText;
    finally
      IDoc := nil;
    end;
  finally
    FreeAndNil( Strl );
  end;
end;

function TSolicitarProdutos.PreencherCategoriaProduto(var produto: TProduto;
  const psID: string): Boolean;
var
  NodeCategories, Node: IXMLNode;
  i, j: Integer;
begin
  Result:= False;
  NodeCategories:= GetNodeByName(FXMLCategories.DocumentElement, 'categories');
  for I := 0 to NodeCategories.ChildNodes.Count -1 do
  begin
    //Node:= GetNodeByName(NodeCustomer.ChildNodes[i], 'customer');
    Node:= NodeCategories.ChildNodes[i];
    if VarToStrDef(Node.ChildNodes.FindNode('id').NodeValue, '') = psID then
    begin
      for j := 0 to Node.ChildNodes.Count -1 do
      begin
        case AnsiIndexStr(AnsiUpperCase(Node.ChildNodes[j].NodeName),
          ['ID','NAME']) of
          0:
            produto.CodGrupo := StrToInt(VarToStrDef(Node.ChildNodes[j].NodeValue, '0'));
          1:
            produto.Grupo := Node.ChildNodes[j].ChildNodes['language'].NodeValue;
        end;
      end;

      Result:= True;
      Break;
    end;
  end;

//var
//  lsXML: string;
//  lsComplementoURL: string;
//  xmlCategory: IXMLDocument;
//  Node: IXMLNode;
//begin
//  xmlCategory := TXMLDocument.Create( nil );
//
//  lsComplementoURL:= 'categories/'+ psProduto;
//
//  lsXML:= GetXML( lsComplementoURL );
//  if lsXML = EmptyStr then
//    Exit;
//
//  xmlCategory.LoadFromXML( lsXML );
//
//  Node:= GetNodeByName(xmlCategory.DocumentElement, 'category');
//
//  produto.Grupo := Node.ChildNodes['name'].ChildNodes['language'].NodeValue;

    {
    case AnsiIndexStr(AnsiUpperCase(Node.ChildNodes[i].NodeName),['LANGUAGE']) of
      0: produto.Grupo := Node.ChildNodes[i].NodeValue;
    end;
    }
end;

function TSolicitarProdutos.PreencherFabricanteProduto(var produto: TProduto; const psID: string): Boolean;
var
  NodeManufacturers, Node: IXMLNode;
  i, j: Integer;
begin
  Result:= False;
  NodeManufacturers:= GetNodeByName(FXMLManufacturers.DocumentElement, 'manufacturers');
  for I := 0 to NodeManufacturers.ChildNodes.Count -1 do
  begin
    //Node:= GetNodeByName(NodeCustomer.ChildNodes[i], 'customer');
    Node:= NodeManufacturers.ChildNodes[i];
    if VarToStrDef(Node.ChildNodes.FindNode('id').NodeValue, '') = psID then
    begin
      for j := 0 to Node.ChildNodes.Count -1 do
      begin
        case AnsiIndexStr(AnsiUpperCase(Node.ChildNodes[j].NodeName),
          ['NAME']) of
          0: produto.Fabricante := Node.ChildNodes[j].NodeValue;
        end;
      end;

      Result:= True;
      Break;
    end;
  end;
end;


function TSolicitarProdutos.PreencherQuantidadeProduto(var produto: TProduto;
  const psID: string): Boolean;
var
  NodeStock_Availables, Node: IXMLNode;
  i, j: Integer;
begin
  Result:= False;
  NodeStock_Availables:= GetNodeByName(FXMLStock_Availables.DocumentElement, 'stock_availables');
  for I := 0 to NodeStock_Availables.ChildNodes.Count -1 do
  begin
    Node:= NodeStock_Availables.ChildNodes[i];
    if VarToStrDef(Node.ChildNodes.FindNode('id').NodeValue, '') = psID then
    begin
      for j := 0 to Node.ChildNodes.Count -1 do
      begin
        case AnsiIndexStr(AnsiUpperCase(Node.ChildNodes[j].NodeName),
          ['QUANTITY']) of
          0: produto.QuantidadeBase := Node.ChildNodes[j].NodeValue;
        end;
      end;

      Result:= True;
      Break;
    end;
  end;
end;

function TSolicitarProdutos.PreencherNCMProduto(var produto: TProduto;
  const psID: string): Boolean;
var
  NodeProduct_feature_values, Node: IXMLNode;
  i, j: Integer;
begin
  Result:= False;
  NodeProduct_feature_values:= GetNodeByName(FXMLProduct_feature_values.DocumentElement, 'product_feature_values');
  for I := 0 to NodeProduct_feature_values.ChildNodes.Count -1 do
  begin
    Node:= NodeProduct_feature_values.ChildNodes[i];
    if VarToStrDef(Node.ChildNodes.FindNode('id').NodeValue, '') = psID then
    begin
      for j := 0 to Node.ChildNodes.Count -1 do
      begin
        case AnsiIndexStr(AnsiUpperCase(Node.ChildNodes[j].NodeName),
          ['VALUE']) of
          0: produto.NCM := Node.ChildNodes[j].ChildNodes['language'].NodeValue;
        end;
      end;

      Result:= True;
      Break;
    end;
  end;
end;
procedure TSolicitarProdutos.SetListaDeProdutos(
  const value: TObjectList<TProduto>);
begin
  FListaDeProdutos := value;
end;

procedure TSolicitarProdutos.Setproduto(const Value: string);
begin
  FProduto := Value;
end;

procedure TSolicitarProdutos.SetUltimoProdutoImportado(const Value: Integer);
begin
  FUltimoProdutoImportado := Value;
end;

{ TPedido }

procedure TPedido.AfterConstruction;
begin
  inherited;
  FItems:= TObjectList<TProduto>.Create;
end;

procedure TPedido.BeforeDestruction;
begin
  inherited;
  FreeAndNil(FItems);
end;

procedure TPedido.SetCliente(const Value: Integer);
begin
  FCliente := Value;
end;

procedure TPedido.SetClienteEntrega(const Value: Integer);
begin
  FClienteEntrega := Value;
end;

procedure TPedido.Setcodigo(const Value: Integer);
begin
  Fcodigo := Value;
end;

procedure TPedido.SetCodigoBarrasEAN13(const Value: Integer);
begin
  FCodigoBarrasEAN13 := Value;
end;

procedure TPedido.SetCodigoBarrasUPC(const Value: Integer);
begin
  FCodigoBarrasUPC := Value;
end;

procedure TPedido.SetCondicaoPagamento(const Value: String);
begin
  FCondicaoPagamento := Value;
end;

procedure TPedido.SetCPF_CNPJ_Cliente(const Value: string);
begin
  FCPF_CNPJ_Cliente := Value;
end;

procedure TPedido.SetCPF_CNPJ_ClienteEntrega(const Value: string);
begin
  FCPF_CNPJ_ClienteEntrega := Value;
end;

procedure TPedido.SetDataEntrega(const Value: string);
begin
  FDataEntrega := Value;
end;

procedure TPedido.SetDataFatura(const Value: string);
begin
  FDataFatura := Value;
end;

procedure TPedido.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TPedido.SetDescricaoMoeda(const Value: string);
begin
  FDescricaoMoeda := Value;
end;

procedure TPedido.SetItems(const Value: TObjectList<TProduto>);
begin
  FItems := Value;
end;

procedure TPedido.SetMoeda(const Value: string);
begin
  FMoeda := Value;
end;

procedure TPedido.SetNumeroFatura(const Value: Integer);
begin
  FNumeroFatura := Value;
end;

procedure TPedido.SetNumeroPedido(const Value: string);
begin
  FNumeroPedido := Value;
end;

procedure TPedido.SetNumeroProduto(const Value: string);
begin
  FNumeroProduto := Value;
end;

procedure TPedido.SetProdutoId(const Value: Integer);
begin
  FProdutoId := Value;
end;

procedure TPedido.SetQuantidade(const Value: Double);
begin
  FQuantidade := Value;
end;

procedure TPedido.SetStatus(const Value: string);
begin
  FStatus := Value;
end;

procedure TPedido.SetTransportadora(const Value: Integer);
begin
  FTransportadora := Value;
end;

procedure TPedido.SetUf(const Value: string);
begin
  FUf := Value;
end;

procedure TPedido.SetUnitario(const Value: string);
begin
  FUnitario := Value;
end;

procedure TPedido.SetValorDesconto(const Value: Currency);
begin
  FValorDesconto := Value;
end;

procedure TPedido.SetValorFrete(const Value: Currency);
begin
  FValorFrete := Value;
end;

procedure TPedido.SetValorLiquido(const Value: Currency);
begin
  FValorLiquido := Value;
end;

procedure TPedido.SetValorMercadorias(const Value: Currency);
begin
  FValorMercadorias := Value;
end;

{ TSolicitarPedido }

procedure TSolicitarPedidos.AfterConstruction;
begin
  inherited;
//  FAcessoSiteEvolucao := TAcessoSiteEvolucao.Create(true);
  FListaDePedidos := TObjectList<TPedido>.Create();
  FXMLDocument:= TXmlDocument.Create(nil);
  FXMLAddresses:= TXmlDocument.Create(nil);
  FXMLCurrencies:= TXmlDocument.Create(nil);
  FXMLCarriers:= TXmlDocument.Create(nil);
//  FXMLOrder_States:= TXmlDocument.Create(nil);
  FXMLStates:= TXmlDocument.Create(nil);
  FXMLCustomers:= TXmlDocument.Create(nil);
end;

procedure TSolicitarPedidos.BeforeDestruction;
begin
  inherited;
  FreeAndNil(FListaDePedidos);
  FXMLDocument:= nil;
  FXMLAddresses:= nil;
  FXMLCurrencies:= nil;
  FXMLCarriers:= nil;
  FXMLStates:= nil;
  FXMLCustomers:= nil;
end;

procedure TSolicitarPedidos.BuscarCustumersClientePedido(var Pedido: TPedido;
  const psID: string; IsDelivery: Boolean = False);
var
  NodeAddresses, Node: IXMLNode;
  i, j: Integer;
begin
  NodeAddresses:= GetNodeByName(FXMLAddresses.DocumentElement, 'addresses');
  for i := 0 to NodeAddresses.ChildNodes.Count -1 do
  begin
    Node:= NodeAddresses.ChildNodes[i];
    if VarToStrDef(Node.ChildNodes.FindNode('id').NodeValue, '') = psID then
    begin
      for j := 0 to Node.ChildNodes.Count -1 do
      begin
        case AnsiIndexStr(AnsiUpperCase(Node.ChildNodes[j].NodeName),['ID_STATE', 'ID_CUSTOMER']) of
          0: PreencherEstadoPedido(Pedido, VarToStrDef( Node.ChildNodes[j].NodeValue, ''));
          1: PreencherCustomersCliente(Pedido, VarToStrDef( Node.ChildNodes[j].NodeValue, ''), IsDelivery);
        end;
      end;
      Break;
    end;
  end;
end;

function TSolicitarPedidos.PreencherCustomersCliente(var Pedido: TPedido;
  const psID: string; IsDelivery: Boolean): Boolean;
var
  NodeCustomer, Node: IXMLNode;
  i, j: Integer;
begin
  Result:= False;
  NodeCustomer:= GetNodeByName(FXMLCustomers.DocumentElement, 'customers');
  for I := 0 to NodeCustomer.ChildNodes.Count -1 do
  begin
    Node:= NodeCustomer.ChildNodes[i];
    if VarToStrDef(Node.ChildNodes.FindNode('id').NodeValue, '') = psID then
    begin
      for j := 0 to Node.ChildNodes.Count -1 do
      begin
        case AnsiIndexStr(AnsiUpperCase(Node.ChildNodes[j].NodeName),
          ['CPF_CNPJ']) of
//          0: Cliente.NomeReduzido := Node.ChildNodes[j].NodeValue; //lastname

          0:
            if (VarToStrDef( Node.ChildNodes[j].NodeValue, '') <> EmptyStr) then //cpf_cnpj
            begin
              if not IsDelivery then
                Pedido.CPF_CNPJ_Cliente:= Trim( ClearString( VarToStrDef(Node.ChildNodes[j].NodeValue, '') , '-/.'))
              else
                Pedido.CPF_CNPJ_ClienteEntrega:= Trim( ClearString( VarToStrDef(Node.ChildNodes[j].NodeValue, '') , '-/.'));
            end;
        end;
      end;

      Result:= True;
      Break;
    end;
  end;
end;
function TSolicitarPedidos.PreencherEstadoPedido(var Pedido: TPedido;const psID: string): Boolean;
var
  NodeStates, Node: IXMLNode;
  i, j: Integer;
begin
  Result:= False;
  NodeStates:= GetNodeByName(FXMLStates.DocumentElement, 'states');
  for i := 0 to NodeStates.ChildNodes.Count -1 do
  begin
    Node:= NodeStates.ChildNodes[i];
    if VarToStrDef(Node.ChildNodes.FindNode('id').NodeValue, '') = psID then
    begin
      for j := 0 to Node.ChildNodes.Count -1 do
      begin
        case AnsiIndexStr(AnsiUpperCase(Node.ChildNodes[j].NodeName),['ISO_CODE']) of
          0: Pedido.Uf := VarToStrDef( Node.ChildNodes[j].NodeValue, '');
        end;
      end;

      Result:= True;
      Break;
    end;
  end;
end;

procedure TSolicitarPedidos.PreencherMoedaEntrega(var Pedido: TPedido;
  const psID: string);
//var
//  lsXML: string;
//  lsComplementoURL: string;
//  xmlMoeda: IXMLDocument;
//  node: IXMLNode;
//  i: Integer;
var
  NodeCurrencies, Node: IXMLNode;
  i, j: Integer;
begin
  NodeCurrencies:= GetNodeByName(FXMLCurrencies.DocumentElement, 'currencies');
  for i := 0 to NodeCurrencies.ChildNodes.Count -1 do
  begin
    Node:= NodeCurrencies.ChildNodes[i];
    if VarToStrDef(Node.ChildNodes.FindNode('id').NodeValue, '') = psID then
    begin
      for j := 0 to Node.ChildNodes.Count -1 do
      begin
        case AnsiIndexStr(AnsiUpperCase(Node.ChildNodes[j].NodeName),['ID','NAME']) of
          0: Pedido.Moeda := VarToStrDef( Node.ChildNodes[j].NodeValue, '');
          1: Pedido.DescricaoMoeda := VarToStrDef( Node.ChildNodes[j].NodeValue, '');
        end;
      end;

      Break;
    end;
  end;


//  xmlMoeda := TXmlDocument.Create(nil);
//
//  lsComplementoURL := 'currencies/' + psPedido;
//
//  lsXML:= GetXML( lsComplementoURL );
//  if lsXML = EmptyStr then
//    Exit;
//  xmlMoeda.LoadFromXML( lsXML );
//
//  node := GetNodeByName(xmlMoeda.DocumentElement, 'currency');
//  Pedido.Moeda := VarToStrDef( node.ChildNodes['id'].nodeValue, '');
//  Pedido.DescricaoMoeda := VarToStrDef( node.ChildNodes['name'].nodeValue, '');
end;

procedure TSolicitarPedidos.PreencherStatusPedido(var Pedido: TPedido;
  const psID: string);
//var
//  lsXML: string;
//  lsComplementoURL: string;
//  xmlStatus: IXMLDocument;
//  node: IXMLNode;
//  i: Integer;
begin
//  xmlStatus := TXmlDocument.Create(nil);
//
//  lsComplementoURL := 'order_states/' + psPedido;
//
//  lsXML:= GetXML( lsComplementoURL );
//  if lsXML = EmptyStr then
//    Exit;
//  xmlStatus.LoadFromXML( lsXML );
//
//  node := GetNodeByName(xmlStatus.DocumentElement, 'order_state');
//
//  if not VarIsNull(node.ChildNodes['name'].ChildNodes['language'].nodeValue) then
//    Pedido.Status := (node.ChildNodes['name'].ChildNodes['language'].nodeValue);
end;

procedure TSolicitarPedidos.PreencherTransportadoraPedido(var Pedido: TPedido;
  const psID: string);
//var
//  lsXML: string;
//  lsComplementoURL: string;
//  xmlTransportadora: IXMLDocument;
//  node: IXMLNode;
//  i: Integer;
var
  NodeCarriers, Node: IXMLNode;
  i, j: Integer;
begin
  NodeCarriers:= GetNodeByName(FXMLCarriers.DocumentElement, 'carriers');
  for i := 0 to NodeCarriers.ChildNodes.Count -1 do
  begin
    Node:= NodeCarriers.ChildNodes[i];
    if VarToStrDef(Node.ChildNodes.FindNode('id').NodeValue, '') = psID then
    begin
      for j := 0 to Node.ChildNodes.Count -1 do
      begin
        case AnsiIndexStr(AnsiUpperCase(Node.ChildNodes[j].NodeName),['ID_REFERENCE']) of
          0: Pedido.Transportadora := StrToInt( VarToStrDef( Node.ChildNodes[j].NodeValue, '0') );
        end;
      end;

      Break;
    end;
  end;

//  xmlTransportadora := TXmlDocument.Create(nil);
//
//  lsComplementoURL := 'carriers/' + psPedido;
//
//  lsXML:= GetXML( lsComplementoURL );
//  if lsXML = EmptyStr then
//    Exit;
//  xmlTransportadora.LoadFromXML( lsXML );
//
//  node := GetNodeByName(xmlTransportadora.DocumentElement, 'carrier');
//
//  if not VarIsNull(node.ChildNodes['id_reference'].nodeValue) then
//    Pedido.Transportadora := StrToInt(node.ChildNodes['id_reference'].nodeValue);
end;


procedure TSolicitarPedidos.PreencherItensPedido(var Pedido: TPedido; Node: IXMLNode);
var
  i: Integer;
  loProduto: TProduto;
begin
  loProduto:= TProduto.Create;
  for i := 0 to Node.ChildNodes.Count -1 do
  begin
    case AnsiIndexStr(AnsiUpperCase(Node.ChildNodes[i].NodeName), ['PRODUCT_ID', 'PRODUCT_QUANTITY', 'PRODUCT_NAME',
                                                                   'PRODUCT_REFERENCE', 'PRODUCT_EAN13', 'PRODUCT_UPC',
                                                                   'PRODUCT_PRICE', 'UNIT_PRICE_TAX_INCL', 'UNIT_PRICE_TAX_EXCL']) of
      0: loProduto.Codigosite:= VarTostrDef( Node.ChildNodes[i].nodeValue, '');
      1: loProduto.QuantidadeBase:= StrToFloatEsp( VarToStrDef( Node.ChildNodes[i].nodeValue, '0') );
      2: loProduto.Nome:= VarToStrDef( Node.ChildNodes[i].NodeValue, '');
      3: loProduto.Codigo:= VarToStrDef( Node.ChildNodes[i].NodeValue, '');
      4: loProduto.CodigoBarrasEAN:= VarToStrDef( Node.ChildNodes[i].NodeValue, '');
      5: loProduto.CodigoBarrasUPC:= VarToStrDef( Node.ChildNodes[i].NodeValue, '');
      6: loProduto.VlrUnitario:= StrToFloatEsp( VarToStrDef( Node.ChildNodes[i].nodeValue, '0') );
      7: loProduto.VlrUnitarioComTaxa:= StrToFloatEsp( VarToStrDef( Node.ChildNodes[i].nodeValue, '0') );
      8: loProduto.VlrUnitarioSemTaxa:= StrToFloatEsp( VarToStrDef( Node.ChildNodes[i].nodeValue, '0') );
    end;
  end;
  Pedido.Items.Add(loProduto);
end;

procedure TSolicitarPedidos.SetListaDePedidos(const value: TObjectList<TPedido>);
begin
  FListaDePedidos := value;
end;

function TSolicitarPedidos.GetListaPedidos: TObjectList<TPedido>;
var
  loPedido: TPedido;
  i, j: Integer;
  NodeReturn,
  NodeNext: IXMLNode;
  NodeItem: IXMLNode;
  lsXML: string;
begin
  lsXML:= GetXML( Format('orders/?display=full&filter[date_upd]=[%s]%s[valid]=1', [FormatDateTime('YYYY-MM-DD', Date), '%&date=1']) );
  FXMLDocument.LoadFromXML( lsXML );

  lsXML:= GetXML( 'addresses/?display=[id,id_state,id_customer]&sort=[id_desc]' );
  FXMLAddresses.LoadFromXML( lsXML );

  lsXML:= GetXML('customers/?display=[id,cpf_cnpj]');
  if lsXML <> EmptyStr then
    FXMLCustomers.LoadFromXML( lsXML );

  lsXML:= GetXML( 'currencies/?display=[id,name]' );
  FXMLCurrencies.LoadFromXML( lsXML );

  lsXML:= GetXML( 'carriers/?display=[id,id_reference]' );
  FXMLCarriers.LoadFromXML( lsXML );

//  lsXML:= GetXML( 'order_states/' );
//  FXMLOrder_States.LoadFromXML( lsXML );

  lsXML:= GetXML( 'states/?display=[id,iso_code]' );
  FXMLStates.LoadFromXML( lsXML );

  if FXMLDocument.Active then
  begin
    NodeReturn := GetNodeByName(FXMLDocument.DocumentElement, 'orders');

    for i := 0 to NodeReturn.ChildNodes.Count - 1 do
    begin
      TSuperClass.GetInstance.Log.save(Format('[Pedidos] Baixando pedido [%d, %d]: ', [ i + 1, NodeReturn.ChildNodes.Count]), mtInfo);

      NodeNext := NodeReturn.ChildNodes[i];
      loPedido := TPedido.Create;

      for j := 0 to NodeNext.ChildNodes.Count - 1 do
      begin
        case AnsiIndexStr(AnsiUpperCase(NodeNext.ChildNodes[j].NodeName), ['ID', 'ID_ADDRESS_DELIVERY', 'ID_ADDRESS_INVOICE',
          'ID_CURRENCY', 'ID_CARRIER', 'CURRENT_STATE', 'INVOICE_NUMBER', 'INVOICE_DATE', 'DELIVERY_DATE', 'TOTAL_DISCOUNTS',
          'TOTAL_PAID', 'TOTAL_PRODUCTS', 'TOTAL_SHIPPING', 'REFERENCE', 'ASSOCIATIONS', 'PAYMENT']) of

          0:
            loPedido.codigo := StrToInt(NodeNext.ChildNodes[j].nodeValue); // ID

          1:
            begin
              loPedido.ClienteEntrega := StrToInt( VarToStrDef( NodeNext.ChildNodes[j].nodeValue, '0') ); // ID_ADDRESS_DELIVERY
              //if ExisteId(FXMLAddresses.DocumentElement, VarTostrDef(NodeNext.ChildNodes[j].nodeValue, ''), 'addresses') then
              BuscarCustumersClientePedido(loPedido, NodeNext.ChildNodes[j].nodeValue, True); // ID_ADDRESS_DELIVERY
            end;

          2:
            begin
              loPedido.Cliente := StrToInt( VarToStrDef( NodeNext.ChildNodes[j].nodeValue, '0') ); // ID_ADDRESS_INVOICE
              BuscarCustumersClientePedido(loPedido, NodeNext.ChildNodes[j].nodeValue);
            end;

          3:
            //if ExisteId(FXMLCurrencies.DocumentElement, VarTostrDef(NodeNext.ChildNodes[j].nodeValue, ''), 'currencies') then
            PreencherMoedaEntrega(loPedido, NodeNext.ChildNodes[j].nodeValue); // ID_CURRENCY

          4:
            //if ExisteId(FXMLCarriers.DocumentElement, VarTostrDef(NodeNext.ChildNodes[j].nodeValue, ''), 'carriers') then
            PreencherTransportadoraPedido(loPedido, NodeNext.ChildNodes[j].nodeValue); // ID_CARRIER

          5:
            loPedido.Status:= VarTostrDef(NodeNext.ChildNodes[j].nodeValue, '');
//            if ExisteId(FXMLOrder_States.DocumentElement, VarTostrDef(NodeNext.ChildNodes[j].nodeValue, ''), 'order_states') then
//              PreencherStatusPedido(loPedido, NodeNext.ChildNodes[j].nodeValue); // CURRENT_STATE

          6:
            loPedido.NumeroFatura := StrToInt(NodeNext.ChildNodes[j].nodeValue); // INVOICE_NUMBER

          7:
            loPedido.DataFatura := NodeNext.ChildNodes[j].nodeValue; // INVOICE_DATE

          8:
            loPedido.DataEntrega := NodeNext.ChildNodes[j].nodeValue; // DELIVERY_DATE

          9:
            loPedido.ValorDesconto := StrToFloatEsp( VarToStrDef(NodeNext.ChildNodes[j].nodeValue, '0') ); // TOTAL_DISCOUNTS

          10:
            loPedido.ValorLiquido := StrToFloatEsp( VarToStrDef( NodeNext.ChildNodes[j].nodeValue, '0') ); // TOTAL_PAID

          11:
            loPedido.ValorMercadorias := StrToFloatEsp( VarToStrDef( NodeNext.ChildNodes[j].nodeValue, '0') ); // TOTAL_PRODUCTS

          12:
            loPedido.ValorFrete := StrToFloatEsp( VarToStrDef( NodeNext.ChildNodes[j].nodeValue, '0' ) ); // TOTAL_SHIPPING

          13:
            loPedido.NumeroPedido := VarToStrDef(NodeNext.ChildNodes[j].nodeValue, ''); // REFERENCE

          14:
            begin
              NodeItem := NodeNext.ChildNodes.get(j).ChildNodes.FindNode('order_rows');
              NodeItem := NodeItem.ChildNodes.First;
              repeat
                PreencherItensPedido( loPedido, NodeItem );
                NodeItem := NodeItem.NextSibling;
              until not Assigned( NodeItem );
            end;
          15:
            loPedido.CondicaoPagamento := VarToStrDef( NodeNext.ChildNodes[j].nodeValue, ''); // PAYMENT
        end;
      end;

      if Assigned( loPedido ) then
        FListaDePedidos.Add(loPedido);
    end;
  end;

  Result := FListaDePedidos;
end;
{ TCliente }

procedure TCliente.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TCliente.SetCelular(const Value: string);
begin
  FCelular := Value;
end;

procedure TCliente.SetCep(const Value: String);
begin
  FCep := Value;
end;

procedure TCliente.SetCnpjCpf(const Value: string);
begin
  FCnpjCpf := Value;
end;

procedure TCliente.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TCliente.SetCodPais(const Value: string);
begin
  FCodPais := Value;
end;

procedure TCliente.SetComplemento(const Value: string);
begin
  FComplemento := Value;
end;

procedure TCliente.SetContato(const Value: string);
begin
  FContato := Value;
end;

procedure TCliente.SetDataNascimento(const Value: TDate);
begin
  FDataNascimento := Value;
end;

procedure TCliente.SetDDD(const Value: string);
begin
  FDDD := Value;
end;

procedure TCliente.SetDDI(const Value: string);
begin
  FDDI := Value;
end;

procedure TCliente.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TCliente.SetEndereco(const Value: string);
begin
  FEndereco := Value;
end;

procedure TCliente.SetFornecedor(const Value: string);
begin
  FFornecedor := Value;
end;

procedure TCliente.SetHomepage(const Value: string);
begin
  FHomepage := Value;
end;

procedure TCliente.SetMunicipio(const Value: string);
begin
  FMunicipio := Value;
end;

procedure TCliente.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TCliente.SetNomePais(const Value: string);
begin
  FNomePais := Value;
end;

procedure TCliente.SetNomeReduzido(const Value: string);
begin
  FNomeReduzido := Value;
end;

procedure TCliente.SetNumero(const Value: String);
begin
  FNumero := Value;
end;

procedure TCliente.SetPessoa(const Value: string);
begin
  FPessoa := Value;
end;

procedure TCliente.SetRazaoSocial(const Value: string);
begin
  FRazaoSocial := Value;
end;

procedure TCliente.SetRgIe(const Value: string);
begin
  FRgIe := Value;
end;

procedure TCliente.SetStatusCliente(const Value: string);
begin
  FStatusCliente := Value;
end;

procedure TCliente.SetTelefone(const Value: string);
begin
  FTelefone := Value;
end;

procedure TCliente.SetUf(const Value: string);
begin
  FUf := Value;
end;

{ TSolicitarClientesXLS }

procedure TSolicitarClientesXLS.AdicionaCliente(Cliente: TCliente;
  Valor: string; Coluna: Integer);
var
  lsAux: string;
begin
  case Coluna of
//    1: Cliente.Numero := '';
    2: Cliente.Codigo := StrToIntDef(Valor, 0);
    3: Cliente.NomeReduzido:= Valor;
    4: Cliente.Nome:= Valor;
    5:
      begin
        Cliente.Numero:= '';
        Cliente.Endereco:= Valor;
      end;
    6: Cliente.Bairro:= Valor;
    7:
      begin
        Cliente.Municipio:= Copy( Valor, 1, Pos('-', Valor) -1);
        Cliente.Uf:= Copy( Valor, Pos('-', Valor)+ 1, 2);
      end;
    8:
      begin
        lsAux:= ClearString(Valor, ' ./-');
        if Length(lsAux)<= 11 then
          begin
            Cliente.Pessoa:= 'PF';
            Cliente.CnpjCpf:= lsAux
          end
        else
          begin
            Cliente.Pessoa:= 'PJ';
            Cliente.CnpjCpf:= lsAux;
          end;
      end;
    9:
      if IsNumber(Valor) then
        Cliente.RgIe:= Valor
      else
        Cliente.RgIe:= Valor;
    10: Cliente.StatusCliente:= IntToStr( AnsiIndexStr(AnsiUpperCase(Valor), ['ATIVO', 'INATIVO']) );
    16:
       begin
         Delete(Valor, 1, 1);
         lsAux:= Copy(Valor, 1, Pos(')', Valor) -1);
         if lsAux <> EmptyStr then
           Cliente.DDD:= lsAux;

         Delete(Valor, 1, Pos(')', Valor));
         lsAux:= Valor;
         if lsAux <> EmptyStr then
           Cliente.Telefone:= lsAux;
       end;
    17: Cliente.CONTATO:= Valor;
    18: Cliente.Email:= Valor;
    21: Cliente.Cep:= Valor;
  end;
end;

procedure TSolicitarClientesXLS.AfterConstruction;
begin
  inherited;

  FListaDeClientes := TObjectList<TCliente>.Create();
end;

procedure TSolicitarClientesXLS.BeforeDestruction;
begin
  inherited;
  FreeAndNil( FListaDeClientes );
end;

function TSolicitarClientesXLS.GetListaClientes: TObjectList<TCliente>;
begin
  XlsToString(FileName);
  Result:= FListaDeClientes;
end;

procedure TSolicitarClientesXLS.SetFileName(const Value: string);
begin
  FFileName := Value;
end;

procedure TSolicitarClientesXLS.SetListaDeClientes(
  const value: TObjectList<TCliente>);
begin
  FListaDeClientes := value;
end;

function TSolicitarClientesXLS.XlsToString(AXLSFile: string): Boolean;
const
	xlCellTypeLastCell = $0000000B;
var
	XLApp, Sheet: OLEVariant;
	RangeMatrix: Variant;
	x, y, k, r: Integer;
  lsCelula: string;
  loCliente: TCliente;
begin
  Result:=False;
  //Cria Excel- OLE Object
  XLApp:=CreateOleObject('Excel.Application');
  try
    //Esconde Excel
    XLApp.Visible:=False;
    //Abre o Workbook
    XLApp.Workbooks.Open(AXLSFile);
    Sheet:=XLApp.Workbooks[ExtractFileName(AXLSFile)].WorkSheets[1];
    Sheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;
    //Pegar o número da última linha
    x:=XLApp.ActiveCell.Row;
    //Pegar o número da última coluna
    y:=XLApp.ActiveCell.Column;
    //Seta Stringgrid linha e coluna

    //Associaca a variant WorkSheet com a variant do Delphi
    RangeMatrix:=XLApp.Range['A1', XLApp.Cells.Item[X, Y]].Value;
    //Cria o loop para listar os registros no TStringGrid
    k:=1;
    repeat
      for r:=1 to y do
      begin
        lsCelula:= RangeMatrix[K, R];
        if (k > 1) then
        begin
          case r of
            23: FListaDeClientes.Add(loCliente);
          else
            begin
              if r = 1 then
                loCliente:= TCliente.Create;

              AdicionaCliente(loCliente, lsCelula, r);
            end;
          end;
        end;
      end;
      Inc(k,1);
    until k > x;
    RangeMatrix:=Unassigned;
  finally
    //Fecha o Excel
    if not VarIsEmpty(XLApp) then
    begin
      XLApp.Quit;
      XLAPP:=Unassigned;
      Sheet:=Unassigned;
      Result:=True;
    end;
	end;
end;

{ TEstoque }

procedure TEstoque.AtualizarEstoque();
var
  lsProduto: string;
  lsQuantidade: string;
  lsKey: string;
begin
  lsProduto:= Format('&product=%s', [self.Codigosite]);
  lsQuantidade:= Format('&qtd=%s', [FloatToStr(self.QuantidadeBase)]);
  lsKey:= Format('&key=%s', ['XTM4T52R7EKV1557DGYMTVZCDWG78KGT']);
  PostXML(lsProduto + lsQuantidade + lsKey);
end;

end.
