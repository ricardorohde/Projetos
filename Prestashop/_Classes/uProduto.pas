unit uProduto;

interface

type
  TProduto = class
  private
    FObservacao: string;
    FPrecoCusto1: Currency;
    FEstoqueMinimo: Double;
    FPrecoVenda1: Currency;
    FCodigoBarrasEAN: string;
    FDescricao: string;
    FCodigoBarrasUPC: string;
    FCodigo: string;
    FVlrUnitarioSemTaxa: Extended;
    FQuantidadeBase: double;
    FCodigosite: string;
    FNCM: string;
    FVlrUnitarioComTaxa: Extended;
    FStatus: string;
    FFabricante: string;
    FCodGrupo: Integer;
    FCodigoEstoque: Integer;
    FNome: string;
    FVlrUnitario: Extended;
    FPrimeiraUnidade: string;
    FGrupo: string;
    procedure SetCodGrupo(const Value: Integer);
    procedure SetCodigo(const Value: string);
    procedure SetCodigoBarrasEAN(const Value: string);
    procedure SetCodigoBarrasUPC(const Value: string);
    procedure SetCodigoEstoque(const Value: Integer);
    procedure SetCodigosite(const Value: string);
    procedure SetDescricao(const Value: string);
    procedure SetEstoqueMinimo(const Value: Double);
    procedure SetFabricante(const Value: string);
    procedure SetGrupo(const Value: string);
    procedure SetNCM(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetObservacao(const Value: string);
    procedure SetPrecoCusto1(const Value: Currency);
    procedure SetPrecoVenda1(const Value: Currency);
    procedure SetPrimeiraUnidade(const Value: string);
    procedure SetQuantidadeBase(const Value: double);
    procedure SetStatus(const Value: string);
    procedure SetVlrUnitario(const Value: Extended);
    procedure SetVlrUnitarioComTaxa(const Value: Extended);
    procedure SetVlrUnitarioSemTaxa(const Value: Extended);
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

implementation

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

procedure TProduto.SetPrecoCusto1(const Value: Currency);
begin
  FPrecoCusto1 := Value;
end;

procedure TProduto.SetPrecoVenda1(const Value: Currency);
begin
  FPrecoVenda1 := Value;
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

end.
