unit uCliente;

interface

type
  TCliente = class
  private
    FBairro: string;
    FPessoa: string;
    FDataNascimento: TDate;
    FEmail: string;
    FDDD: string;
    FUf: string;
    FCodigo: Integer;
    FNomeReduzido: string;
    FCep: String;
    FCnpjCpf: string;
    FNumero: String;
    FMunicipio: string;
    FRgIe: string;
    FRazaoSocial: string;
    FFornecedor: string;
    FComplemento: string;
    FCodPais: string;
    FHomepage: string;
    FContato: string;
    FNomePais: string;
    FNome: string;
    FDDI: string;
    FEndereco: string;
    FStatusCliente: string;
    FTelefone: string;
    FCelular: string;
    procedure SetBairro(const Value: string);
    procedure SetCelular(const Value: string);
    procedure SetCep(const Value: String);
    procedure SetCnpjCpf(const Value: string);
    procedure SetCodigo(const Value: Integer);
    procedure SetCodPais(const Value: string);
    procedure SetComplemento(const Value: string);
    procedure SetContato(const Value: string);
    procedure SetDataNascimento(const Value: TDate);
    procedure SetDDD(const Value: string);
    procedure SetDDI(const Value: string);
    procedure SetEmail(const Value: string);
    procedure SetEndereco(const Value: string);
    procedure SetFornecedor(const Value: string);
    procedure SetHomepage(const Value: string);
    procedure SetMunicipio(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetNomePais(const Value: string);
    procedure SetNomeReduzido(const Value: string);
    procedure SetNumero(const Value: String);
    procedure SetPessoa(const Value: string);
    procedure SetRazaoSocial(const Value: string);
    procedure SetRgIe(const Value: string);
    procedure SetStatusCliente(const Value: string);
    procedure SetTelefone(const Value: string);
    procedure SetUf(const Value: string);

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

implementation

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

end.
