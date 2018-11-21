unit uPedido;

interface

uses System.Classes, System.SysUtils, Vcl.Forms, Dialogs, {System.Contnrs,}
  DBXJSON, DBXJsonReflect, uWebServiceHttp, xmldom, XMLIntf, msxmldom, XMLDoc,
  StrUtils, msxml, System.Types, System.Variants, DBClient, mshtml, ActiveX,
  ComObj, Generics.Collections, uProduto;

  type
    TPedido = class
    private
    FValorFrete: Currency;
    FNumeroFatura: Integer;
    FCPF_CNPJ_Cliente: string;
    FCondicaoPagamento: String;
    FTransportadora: Integer;
    FUnitario: string;
    FDataEntrega: string;
    FValorDesconto: Currency;
    FUf: string;
    FDescricao: string;
    FItems: TObjectList<TProduto>;
    FCPF_CNPJ_ClienteEntrega: string;
    FCodigoBarrasUPC: Integer;
    FCliente: Integer;
    FCodigo: Integer;
    FValorMercadorias: Currency;
    FProdutoId: Integer;
    FDataFatura: string;
    FMoeda: string;
    FNumeroProduto: string;
    FStatus: string;
    FClienteEntrega: Integer;
    FQuantidade: Double;
    FNumeroPedido: string;
    FValorLiquido: Currency;
    FCodigoBarrasEAN13: Integer;
    FDescricaoMoeda: string;
    procedure SetCliente(const Value: Integer);
    procedure SetClienteEntrega(const Value: Integer);
    procedure SetCodigo(const Value: Integer);
    procedure SetCodigoBarrasEAN13(const Value: Integer);
    procedure SetCodigoBarrasUPC(const Value: Integer);
    procedure SetCondicaoPagamento(const Value: String);
    procedure SetCPF_CNPJ_Cliente(const Value: string);
    procedure SetCPF_CNPJ_ClienteEntrega(const Value: string);
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

implementation

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

procedure TPedido.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
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

end.
