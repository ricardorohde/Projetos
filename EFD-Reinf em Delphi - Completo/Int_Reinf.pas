unit Int_Reinf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StrUtils, XSBuiltIns, OleCtrls, NFSeConverterX_TLB, Generics.Collections,
  Dialogs, BaseLibrary;

implementation

type
  TReinfBase = class;
  TReinf = class;
  TReinf_Inclusao = class;
  TReinf_Exclusao = class;
  TSoftHouse = class;

  IReinfBase = Interface
    FNumeroInscricao: String;
    FVersao: String;
    FValidadeFinaal: String;
    FTipoInscricao: Integer;
    FTipoAmbiente: Integer;
    FProcEmi: Integer;
    FValidadeInicial: String;
    procedure SetNumeroInscricao(const Value: String);
    procedure SetProcEmi(const Value: Byte);
    procedure SetTipoAmbiente(const Value: Byte);
    procedure SetTipoInscricao(const Value: Byte);
    procedure SetValidadeFinaal(const Value: String);
    procedure SetValidadeInicial(const Value: String);
    procedure SetVersao(const Value: String);

    property TipoAmbiente: Byte read FTipoAmbiente write SetTipoAmbiente;
    property ProcEmi: Byte read FProcEmi write SetProcEmi;
    property Versao: String read FVersao write SetVersao;
    property TipoInscricao: Byte read FTipoInscricao write SetTipoInscricao;
    property NumeroInscricao: String read FNumeroInscricao write SetNumeroInscricao;
    property ValidadeInicial: String read FValidadeInicial write SetValidadeInicial;
    property ValidadeFinaal: String read FValidadeFinaal write SetValidadeFinaal;
  End;

  TReinfBase = class(TInterfacedObject, IReinfBase)
  private
    FNumeroInscricao: String;
    FVersao: String;
    FValidadeFinaal: String;
    FTipoInscricao: Integer;
    FTipoAmbiente: Integer;
    FProcEmi: Integer;
    FValidadeInicial: String;
    procedure SetNumeroInscricao(const Value: String);
    procedure SetProcEmi(const Value: Byte);
    procedure SetTipoAmbiente(const Value: Byte);
    procedure SetTipoInscricao(const Value: Byte);
    procedure SetValidadeFinaal(const Value: String);
    procedure SetValidadeInicial(const Value: String);
    procedure SetVersao(const Value: String);

  published
    property TipoAmbiente: Byte read FTipoAmbiente write SetTipoAmbiente;
    property ProcEmi: Byte read FProcEmi write SetProcEmi;
    property Versao: String read FVersao write SetVersao;
    property TipoInscricao: Byte read FTipoInscricao write SetTipoInscricao;
    property NumeroInscricao: String read FNumeroInscricao write SetNumeroInscricao;
    property ValidadeInicial: String read FValidadeInicial write SetValidadeInicial;
    property ValidadeFinaal: String read FValidadeFinaal write SetValidadeFinaal;
  end;

  TReinf_Exclusao = class(TReinfBase);

  TReinf_Inclusao = class(TReinfBase)
    private
    FTelefoneFixo: string;
    FCPFContato: string;
    FClassificacaoTributaria: string;
    FEmail: string;
    FCNPJ_EFR: string;
    FideEFR: string;
    FSituacaoPJ: Byte;
    FAcordoIsencaoMulta: Byte;
    FNomeContato: string;
    FEscrituracao: Byte;
    FCelular: string;
    FDesoneracao: Byte;
    procedure SetAcordoIsencaoMulta(const Value: Byte);
    procedure SetCelular(const Value: string);
    procedure SetClassificacaoTributaria(const Value: string);
    procedure SetCNPJ_EFR(const Value: string);
    procedure SetCPFContato(const Value: string);
    procedure SetDesoneracao(const Value: Byte);
    procedure SetEmail(const Value: string);
    procedure SetEscrituracao(const Value: Byte);
    procedure SetideEFR(const Value: string);
    procedure SetNomeContato(const Value: string);
    procedure SetSituacaoPJ(const Value: Byte);
    procedure SetTelefoneFixo(const Value: string);

    published
      property ClassificacaoTributaria: string read FClassificacaoTributaria write SetClassificacaoTributaria;
      property Escrituracao: Byte read FEscrituracao write SetEscrituracao;
      property Desoneracao: Byte read FDesoneracao write SetDesoneracao;
      property AcordoIsencaoMulta: Byte read FAcordoIsencaoMulta write SetAcordoIsencaoMulta;
      property SituacaoPJ: Byte read FSituacaoPJ write SetSituacaoPJ;
      property NomeContato: string read FNomeContato write SetNomeContato;
      property CPFContato: string read FCPFContato write SetCPFContato;
      property TelefoneFixo: string read FTelefoneFixo write SetTelefoneFixo;
      property Celular: string read FCelular write SetCelular;
      property Email: string read FEmail write SetEmail;
      property ideEFR: string read FideEFR write SetideEFR;
      property CNPJ_EFR: string read FCNPJ_EFR write SetCNPJ_EFR;
  end;

  TSoftHouse = Class
  private
    FCnpj: string;
    FEmail: string;
    FRazaoSocial: string;
    FContato: string;
    FTelefone: string;
    procedure SetCnpj(const Value: string);
    procedure SetContato(const Value: string);
    procedure SetEmail(const Value: string);
    procedure SetRazaoSocial(const Value: string);
    procedure SetTelefone(const Value: string);
  published
      property Cnpj: string read FCnpj write SetCnpj;
      property RazaoSocial: string read FRazaoSocial write SetRazaoSocial;
      property Contato: string read FContato write SetContato;
      property Telefone: string read FTelefone write SetTelefone;
      property Email: string read FEmail write SetEmail;
  end;

  TReinf = class
    private
      FListaReinf: TObjectList<TReinfBase>;
    public
      procedure Incluir(Reinf_Inclusao: TReinfBase);
      procedure Excluir(Reinf_Exclusao: TReinfBase);
      procedure AfterConstruction; override;
      procedure BeforeDestruction; override;
  end;

{ TReinfBase }

procedure TReinfBase.SetNumeroInscricao(const Value: String);
begin
  FNumeroInscricao := Value;
end;

procedure TReinfBase.SetProcEmi(const Value: Byte);
begin
  FProcEmi := Value;
end;

procedure TReinfBase.SetTipoAmbiente(const Value: Byte);
begin
  FTipoAmbiente := Value;
end;

procedure TReinfBase.SetTipoInscricao(const Value: Byte);
begin
  FTipoInscricao := Value;
end;

procedure TReinfBase.SetValidadeFinaal(const Value: String);
begin
  FValidadeFinaal := Value;
end;

procedure TReinfBase.SetValidadeInicial(const Value: String);
begin
  FValidadeInicial := Value;
end;

procedure TReinfBase.SetVersao(const Value: String);
begin
  FVersao := Value;
end;

{ TReinf_Inclusao }

procedure TReinf_Inclusao.SetAcordoIsencaoMulta(const Value: Byte);
begin
  FAcordoIsencaoMulta := Value;
end;

procedure TReinf_Inclusao.SetCelular(const Value: string);
begin
  FCelular := Value;
end;

procedure TReinf_Inclusao.SetClassificacaoTributaria(const Value: string);
begin
  FClassificacaoTributaria := Value;
end;

procedure TReinf_Inclusao.SetCNPJ_EFR(const Value: string);
begin
  FCNPJ_EFR := Value;
end;

procedure TReinf_Inclusao.SetCPFContato(const Value: string);
begin
  FCPFContato := Value;
end;

procedure TReinf_Inclusao.SetDesoneracao(const Value: Byte);
begin
  FDesoneracao := Value;
end;

procedure TReinf_Inclusao.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TReinf_Inclusao.SetEscrituracao(const Value: Byte);
begin
  FEscrituracao := Value;
end;

procedure TReinf_Inclusao.SetideEFR(const Value: string);
begin
  FideEFR := Value;
end;

procedure TReinf_Inclusao.SetNomeContato(const Value: string);
begin
  FNomeContato := Value;
end;

procedure TReinf_Inclusao.SetSituacaoPJ(const Value: Byte);
begin
  FSituacaoPJ := Value;
end;

procedure TReinf_Inclusao.SetTelefoneFixo(const Value: string);
begin
  FTelefoneFixo := Value;
end;

{ TSoftHouse }

procedure TSoftHouse.SetCnpj(const Value: string);
begin
  FCnpj := Value;
end;

procedure TSoftHouse.SetContato(const Value: string);
begin
  FContato := Value;
end;

procedure TSoftHouse.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TSoftHouse.SetRazaoSocial(const Value: string);
begin
  FRazaoSocial := Value;
end;

procedure TSoftHouse.SetTelefone(const Value: string);
begin
  FTelefone := Value;
end;

{ TReinf }

procedure TReinf.AfterConstruction;
begin
  inherited;

end;

procedure TReinf.BeforeDestruction;
begin
  inherited;

end;

procedure TReinf.Excluir(Reinf_Exclusao: TReinfBase);
begin

end;

procedure TReinf.Incluir(Reinf_Inclusao: TReinfBase);
begin

end;

end.

