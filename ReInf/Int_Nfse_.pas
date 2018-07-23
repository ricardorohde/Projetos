unit Int_Nfse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StrUtils, XSBuiltIns, OleCtrls, NFSeConverterX_TLB, Generics.Collections,
  Dialogs, BaseLibrary;

type
  TNfse = class;
  TImposto = class;
  TPrestador = class;
  TTomador = class;
  TInformacoesRPS = class;
  TServico = class;
  TIntermediario = class;
  TOutrasInformacoes = class;

  TBuildingNfse = class(TComponent)
  private
    { private declarations }
    FArquivo: TStringList;
    spdNFSeConverterX: TspdNFSeConverterX;
    FDiretorioEsquemas: String;
    FDiretorioScripts: String;
    FCidade: String;
    FListaNfse: TObjectList<TNfse>;
    FInscricaoMunicipalRemetente: string;
    FCpfCnpjRemetente: string;
    FIdLote: Integer;
    FNumeroLote: Integer;
    FRazaoSocialRemetente: string;
    FVersao: string;
    FValorTotalDeducoes: Double;
    FValorTotalBaseCalculo: Double;
    FValorTotalServicos: Double;
    FDataFim: TDate;
    FDataInicio: TDate;
    FMetodoEnvio: String;
    FTransacao: Boolean;
    FCodigoCidadeRemetente: String;
    FQuantidadeRps: Integer;
    FParametros: TStringList;
    FDiretorioImpressao: String;
    procedure Config();
    procedure CriarArquivo();
    procedure SetCidade(const Value: String);
    procedure SetDiretorioEsquemas(const Value: String);
    procedure SetDiretorioScripts(const Value: String);
    procedure SetListaNfse(const Value: TObjectList<TNfse>);
    procedure SetCodigoCidadeRemetente(const Value: String);
    procedure SetCpfCnpjRemetente(const Value: string);
    procedure SetDataFim(const Value: TDate);
    procedure SetDataInicio(const Value: TDate);
    procedure SetIdLote(const Value: Integer);
    procedure SetInscricaoMunicipalRemetente(const Value: string);
    procedure SetMetodoEnvio(const Value: String);
    procedure SetNumeroLote(const Value: Integer);
    procedure SetQuantidadeRps(const Value: Integer);
    procedure SetRazaoSocialRemetente(const Value: string);
    procedure SetTransacao(const Value: Boolean);
    procedure SetValorTotalBaseCalculo(const Value: Double);
    procedure SetValorTotalDeducoes(const Value: Double);
    procedure SetValorTotalServicos(const Value: Double);
    procedure SetVersao(const Value: string);
    procedure SetParametros(const Value: TStringList);
    procedure SetDiretorioImpressao(const Value: String);
  public
    { public declarations }
    procedure BeforeDestruction; override;
    procedure AfterConstruction; override;

    property DiretorioImpressao: String read FDiretorioImpressao write SetDiretorioImpressao;
    property DiretorioEsquemas: String read FDiretorioEsquemas write SetDiretorioEsquemas;
    property DiretorioScripts: String read FDiretorioScripts write SetDiretorioScripts;
    property Cidade: String read FCidade write SetCidade;
    PROPERTY ListaNfse: TObjectList<TNfse> read FListaNfse write SetListaNfse;

    property IdLote : Integer read FIdLote write SetIdLote;
    property NumeroLote : Integer read FNumeroLote write SetNumeroLote;
    property CpfCnpjRemetente : string read FCpfCnpjRemetente write SetCpfCnpjRemetente;
    property InscricaoMunicipalRemetente : string read FInscricaoMunicipalRemetente write SetInscricaoMunicipalRemetente;
    property RazaoSocialRemetente : string read FRazaoSocialRemetente write SetRazaoSocialRemetente;
    property QuantidadeRps : Integer read FQuantidadeRps write SetQuantidadeRps;
    property CodigoCidadeRemetente : String read FCodigoCidadeRemetente write SetCodigoCidadeRemetente;
    property Transacao : Boolean read FTransacao write SetTransacao;
    property DataInicio : TDate read FDataInicio write SetDataInicio;
    property DataFim : TDate read FDataFim write SetDataFim;
    property Versao : string read FVersao write SetVersao;
    property MetodoEnvio : String read FMetodoEnvio write SetMetodoEnvio;
    property ValorTotalServicos : Double read FValorTotalServicos write SetValorTotalServicos;
    property ValorTotalDeducoes : Double read FValorTotalDeducoes write SetValorTotalDeducoes;
    property ValorTotalBaseCalculo : Double read FValorTotalBaseCalculo write SetValorTotalBaseCalculo;
    property Parametros: TStringList read FParametros write SetParametros;


    function GerarXML(): string;
  end;

  TNfse = class
  private
    { private declarations }
    FOutrasInformacoes: TOutrasInformacoes;
    FPrestador: TPrestador;
    FServico: TServico;
    FIntermediario: TIntermediario;
    FInformacoesRPS: TInformacoesRPS;
    FTomador: TTomador;
    FImposto: TImposto;
    procedure SetImposto(const Value: TImposto);
    procedure SetInformacoesRPS(const Value: TInformacoesRPS);
    procedure SetIntermediario(const Value: TIntermediario);
    procedure SetOutrasInformacoes(const Value: TOutrasInformacoes);
    procedure SetPrestador(const Value: TPrestador);
    procedure SetServico(const Value: TServico);
    procedure SetTomador(const Value: TTomador);
  public
    procedure BeforeDestruction; override;
    procedure AfterConstruction; override;

    { public declarations }
    property Imposto: TImposto read FImposto write SetImposto;
    property Prestador: TPrestador read FPrestador write SetPrestador;
    property Tomador : TTomador read FTomador write SetTomador;
    property InformacoesRPS : TInformacoesRPS read FInformacoesRPS write SetInformacoesRPS;
    property Servico : TServico read FServico write SetServico;
    property Intermediario : TIntermediario read FIntermediario write SetIntermediario;
    property OutrasInformacoes : TOutrasInformacoes read FOutrasInformacoes write SetOutrasInformacoes;
  end;

  TIntermediario = class
  private
    { private declarations }
    FInscricaoMunicipalIntermediario: string;
    FCpfCnpjIntermediario: string;
    FRazaoSocialIntermediario: string;
    procedure SetCpfCnpjIntermediario(const Value: string);
    procedure SetInscricaoMunicipalIntermediario(const Value: string);
    procedure SetRazaoSocialIntermediario(const Value: string);
  public
    { public declarations }
    property RazaoSocialIntermediario : string read FRazaoSocialIntermediario write SetRazaoSocialIntermediario;
    property CpfCnpjIntermediario : string read FCpfCnpjIntermediario write SetCpfCnpjIntermediario;
    property InscricaoMunicipalIntermediario : string read FInscricaoMunicipalIntermediario write SetInscricaoMunicipalIntermediario;
  end;

  TServico = class
  private
    { private declarations }
    FValorServicos: Double;
    FValorDeducoes: Double;
    FCodigoItemListaServico: string;
    FCodigoCnae: string;
    FCodigoTributacaoMunicipio: string;
    FDescricaoCidadePrestacao: string;
    FDiscriminacaoServico: string;
    FCodigoCidadePrestacao: string;
    procedure SetValorDeducoes(const Value: Double);
    procedure SetValorServicos(const Value: Double);
    procedure SetCodigoCidadePrestacao(const Value: string);
    procedure SetCodigoCnae(const Value: string);
    procedure SetCodigoItemListaServico(const Value: string);
    procedure SetCodigoTributacaoMunicipio(const Value: string);
    procedure SetDescricaoCidadePrestacao(const Value: string);
    procedure SetDiscriminacaoServico(const Value: string);
  public
    { public declarations }
    property ValorServicos : Double read FValorServicos write SetValorServicos;
    property ValorDeducoes : Double read FValorDeducoes write SetValorDeducoes;

    property CodigoItemListaServico : string read FCodigoItemListaServico write SetCodigoItemListaServico;
    property CodigoCnae : string read FCodigoCnae write SetCodigoCnae;
    property CodigoTributacaoMunicipio : string read FCodigoTributacaoMunicipio write SetCodigoTributacaoMunicipio;
    property DiscriminacaoServico : string read FDiscriminacaoServico write SetDiscriminacaoServico;
    property CodigoCidadePrestacao : string read FCodigoCidadePrestacao write SetCodigoCidadePrestacao;
    property DescricaoCidadePrestacao : string read FDescricaoCidadePrestacao write SetDescricaoCidadePrestacao;
  end;

  TImposto = class
  private
    { private declarations }
    FAliquotaISS: Double;
    FAliquotaPIS: Double;
    FIssRetido: Byte;
    FAliquotaCOFINS: Double;
    FAliquotaINSS: Double;
    FValorLiquidoNfse: Double;
    FValorIssRetido: Double;
    FAliquotaIR: Double;
    FDescontoCondicionado: Double;
    FValorCsll: Double;
    FDescontoIncondicionado: Double;
    FValorIss: Double;
    FValorPis: Double;
    FValorCofins: Double;
    FValorInss: Double;
    FBaseCalculo: Double;
    FAliquotaCSLL: Double;
    FValorIr: Double;
    procedure SetAliquotaCOFINS(const Value: Double);
    procedure SetAliquotaCSLL(const Value: Double);
    procedure SetAliquotaINSS(const Value: Double);
    procedure SetAliquotaIR(const Value: Double);
    procedure SetAliquotaISS(const Value: Double);
    procedure SetAliquotaPIS(const Value: Double);
    procedure SetBaseCalculo(const Value: Double);
    procedure SetDescontoCondicionado(const Value: Double);
    procedure SetDescontoIncondicionado(const Value: Double);
    procedure SetIssRetido(const Value: Byte);
    procedure SetValorCofins(const Value: Double);
    procedure SetValorCsll(const Value: Double);
    procedure SetValorInss(const Value: Double);
    procedure SetValorIr(const Value: Double);
    procedure SetValorIss(const Value: Double);
    procedure SetValorIssRetido(const Value: Double);
    procedure SetValorLiquidoNfse(const Value: Double);
    procedure SetValorPis(const Value: Double);
  public
    { public declarations }
    property ValorPis : Double read FValorPis write SetValorPis;
    property ValorCofins : Double read FValorCofins write SetValorCofins;
    property ValorInss : Double read FValorInss write SetValorInss;
    property ValorIr : Double read FValorIr write SetValorIr;
    property ValorCsll : Double read FValorCsll write SetValorCsll;
    property IssRetido : Byte read FIssRetido write SetIssRetido;
    property ValorIss : Double read FValorIss write SetValorIss;
    property ValorIssRetido : Double read FValorIssRetido write SetValorIssRetido;
    property BaseCalculo : Double read FBaseCalculo write SetBaseCalculo;
    property ValorLiquidoNfse : Double read FValorLiquidoNfse write SetValorLiquidoNfse;
    property DescontoIncondicionado : Double read FDescontoIncondicionado write SetDescontoIncondicionado;
    property DescontoCondicionado : Double read FDescontoCondicionado write SetDescontoCondicionado;
    property AliquotaISS : Double read FAliquotaISS write SetAliquotaISS;
    property AliquotaPIS : Double read FAliquotaPIS write SetAliquotaPIS;
    property AliquotaCOFINS : Double read FAliquotaCOFINS write SetAliquotaCOFINS;
    property AliquotaINSS : Double read FAliquotaINSS write SetAliquotaINSS;
    property AliquotaIR : Double read FAliquotaIR write SetAliquotaIR;
    property AliquotaCSLL : Double read FAliquotaCSLL write SetAliquotaCSLL;
  end;

  TPrestador = class
  private
    { private declarations }
    FTelefonePrestador: string;
    FDDDPrestador: string;
    FInscricaoMunicipalPrestador: string;
    FCpfCnpjPrestador: string;
    FRazaoSocialPrestador: string;
    procedure SetCpfCnpjPrestador(const Value: string);
    procedure SetDDDPrestador(const Value: string);
    procedure SetInscricaoMunicipalPrestador(const Value: string);
    procedure SetRazaoSocialPrestador(const Value: string);
    procedure SetTelefonePrestador(const Value: string);
  public
    { public declarations }
    property CpfCnpjPrestador : string read FCpfCnpjPrestador write SetCpfCnpjPrestador;
    property InscricaoMunicipalPrestador : string read FInscricaoMunicipalPrestador write SetInscricaoMunicipalPrestador;
    property RazaoSocialPrestador : string read FRazaoSocialPrestador write SetRazaoSocialPrestador;
    property DDDPrestador : string read FDDDPrestador write SetDDDPrestador;
    property TelefonePrestador : string read FTelefonePrestador write SetTelefonePrestador;
  end;

  TTomador = class
  private
    { private declarations }
    FDDDTomador: string;
    FCodigoCidadeTomador: string;
    FUfTomador: string;
    FCepTomador: string;
    FInscricaoMunicipalTomador: string;
    FCpfCnpjTomador: string;
    FNumeroTomador: string;
    FRazaoSocialTomador: string;
    FComplementoTomador: string;
    FInscricaoEstadualTomador: string;
    FTipoLogradouroTomador: string;
    FEnderecoTomador: string;
    FTelefoneTomador: string;
    FTipoBairroTomador: string;
    FEmailTomador: string;
    FBairroTomador: string;
    FDescricaoCidadeTomador: string;
    procedure SetBairroTomador(const Value: string);
    procedure SetCepTomador(const Value: string);
    procedure SetCodigoCidadeTomador(const Value: string);
    procedure SetComplementoTomador(const Value: string);
    procedure SetCpfCnpjTomador(const Value: string);
    procedure SetDDDTomador(const Value: string);
    procedure SetDescricaoCidadeTomador(const Value: string);
    procedure SetEmailTomador(const Value: string);
    procedure SetEnderecoTomador(const Value: string);
    procedure SetInscricaoEstadualTomador(const Value: string);
    procedure SetInscricaoMunicipalTomador(const Value: string);
    procedure SetNumeroTomador(const Value: string);
    procedure SetRazaoSocialTomador(const Value: string);
    procedure SetTelefoneTomador(const Value: string);
    procedure SetTipoBairroTomador(const Value: string);
    procedure SetTipoLogradouroTomador(const Value: string);
    procedure SetUfTomador(const Value: string);
  public
    { public declarations }
    property CpfCnpjTomador : string read FCpfCnpjTomador write SetCpfCnpjTomador;
    property RazaoSocialTomador : string read FRazaoSocialTomador write SetRazaoSocialTomador;
    property InscricaoMunicipalTomador : string read FInscricaoMunicipalTomador write SetInscricaoMunicipalTomador;
    property InscricaoEstadualTomador : string read FInscricaoEstadualTomador write SetInscricaoEstadualTomador;
    property TipoLogradouroTomador : string read FTipoLogradouroTomador write SetTipoLogradouroTomador;
    property EnderecoTomador : string read FEnderecoTomador write SetEnderecoTomador;
    property NumeroTomador : string read FNumeroTomador write SetNumeroTomador;
    property ComplementoTomador : string read FComplementoTomador write SetComplementoTomador;
    property TipoBairroTomador : string read FTipoBairroTomador write SetTipoBairroTomador;
    property BairroTomador : string read FBairroTomador write SetBairroTomador;
    property CodigoCidadeTomador : string read FCodigoCidadeTomador write SetCodigoCidadeTomador;
    property DescricaoCidadeTomador : string read FDescricaoCidadeTomador write SetDescricaoCidadeTomador;
    property UfTomador : string read FUfTomador write SetUfTomador;
    property CepTomador : string read FCepTomador write SetCepTomador;
    property DDDTomador : string read FDDDTomador write SetDDDTomador;
    property TelefoneTomador : string read FTelefoneTomador write SetTelefoneTomador;
    property EmailTomador : string read FEmailTomador write SetEmailTomador;
  end;

  TInformacoesRPS = class
  private
    { private declarations }
    FSituacaoNota: Byte;
    FOptanteSimplesNacional: Byte;
    FTipoRps: string;
    FRegimeEspecialTributacao: Integer;
    FTipoRpsSubstituido: string;
    FDataEmissao: TDateTime;
    FTipoTributacao: Integer;
    FSerieRps: string;
    FIncentivadorCultural: Byte;
    FSerieRpsSubstituido: string;
    FIdRps: Integer;
    FNumeroRps: string;
    FNumeroRpsSubstituido: string;
    FNaturezaTributacao: Integer;
    procedure SetDataEmissao(const Value: TDateTime);
    procedure SetIdRps(const Value: Integer);
    procedure SetIncentivadorCultural(const Value: Byte);
    procedure SetNaturezaTributacao(const Value: Integer);
    procedure SetNumeroRps(const Value: string);
    procedure SetNumeroRpsSubstituido(const Value: string);
    procedure SetOptanteSimplesNacional(const Value: Byte);
    procedure SetRegimeEspecialTributacao(const Value: Integer);
    procedure SetSerieRps(const Value: string);
    procedure SetSerieRpsSubstituido(const Value: string);
    procedure SetSituacaoNota(const Value: Byte);
    procedure SetTipoRps(const Value: string);
    procedure SetTipoRpsSubstituido(const Value: string);
    procedure SetTipoTributacao(const Value: Integer);
  public
    { public declarations }
    property IdRps : Integer read FIdRps write SetIdRps;
    property NumeroRps : string read FNumeroRps write SetNumeroRps;
    property SerieRps : string read FSerieRps write SetSerieRps;
    property TipoRps : string read FTipoRps write SetTipoRps;
    property DataEmissao : TDateTime read FDataEmissao write SetDataEmissao;
    property OptanteSimplesNacional : Byte read FOptanteSimplesNacional write SetOptanteSimplesNacional;
    property IncentivadorCultural : Byte read FIncentivadorCultural write SetIncentivadorCultural;
    property SituacaoNota : Byte read FSituacaoNota write SetSituacaoNota;
    property TipoTributacao : Integer read FTipoTributacao write SetTipoTributacao;
    property NaturezaTributacao : Integer read FNaturezaTributacao write SetNaturezaTributacao;
    property RegimeEspecialTributacao : Integer read FRegimeEspecialTributacao write SetRegimeEspecialTributacao;
    property NumeroRpsSubstituido : string read FNumeroRpsSubstituido write SetNumeroRpsSubstituido;
    property SerieRpsSubstituido : string read FSerieRpsSubstituido write SetSerieRpsSubstituido;
    property TipoRpsSubstituido : string read FTipoRpsSubstituido write SetTipoRpsSubstituido;
  end;

  TOutrasInformacoes = class
  private
    { private declarations }
    FSeriePrestacao: string;
    FOperacao: string;
    FExigibilidadeISS: Byte;
    FTipoDocumentoTomador: string;
    FAssinatura: string;
    FCodigoSubItemListaServico: string;
    FCodigoPais: Integer;
    FCPFCNPJReferencia: string;
    FTipoCodificacao: string;
    FValorTotalReferencia: Double;
    FNumeroNfseSubstituida: string;
    FIdentificadorSistemaLegado: Byte;
    FDataEmissaoNfseSubstituida: TDate;
    FPercentualDeduzir: Double;
    FNumEmissorRps: string;
    FTributavel: Byte;
    FDeducaoPor: string;
    FDescricaoDocumentoTomador: string;
    FValorUnitarioServico: Double;
    FMunicipioIncidencia: string;
    FJustificativaDeducao: string;
    FQuantidadeServicos: Integer;
    FResponsavelRetencao: string;
    FPaisTomador: Integer;
    FCodigoObra: string;
    FIncentivoFiscal: Byte;
    FNumeroNfReferencia: string;
    FTipoDeducao: string;
    FCidadeEstrangeiraTomador: string;
    FMotCancelamento: string;
    FCompetencia: TDateTime;
    FValorIssServico: Double;
    FArt: string;
    procedure SetArt(const Value: string);
    procedure SetAssinatura(const Value: string);
    procedure SetCidadeEstrangeiraTomador(const Value: string);
    procedure SetCodigoObra(const Value: string);
    procedure SetCodigoPais(const Value: Integer);
    procedure SetCodigoSubItemListaServico(const Value: string);
    procedure SetCompetencia(const Value: TDateTime);
    procedure SetCPFCNPJReferencia(const Value: string);
    procedure SetDataEmissaoNfseSubstituida(const Value: TDate);
    procedure SetDeducaoPor(const Value: string);
    procedure SetDescricaoDocumentoTomador(const Value: string);
    procedure SetExigibilidadeISS(const Value: Byte);
    procedure SetIdentificadorSistemaLegado(const Value: Byte);
    procedure SetIncentivoFiscal(const Value: Byte);
    procedure SetJustificativaDeducao(const Value: string);
    procedure SetMotCancelamento(const Value: string);
    procedure SetMunicipioIncidencia(const Value: string);
    procedure SetNumEmissorRps(const Value: string);
    procedure SetNumeroNfReferencia(const Value: string);
    procedure SetNumeroNfseSubstituida(const Value: string);
    procedure SetOperacao(const Value: string);
    procedure SetPaisTomador(const Value: Integer);
    procedure SetPercentualDeduzir(const Value: Double);
    procedure SetQuantidadeServicos(const Value: Integer);
    procedure SetResponsavelRetencao(const Value: string);
    procedure SetSeriePrestacao(const Value: string);
    procedure SetTipoCodificacao(const Value: string);
    procedure SetTipoDeducao(const Value: string);
    procedure SetTipoDocumentoTomador(const Value: string);
    procedure SetTributavel(const Value: Byte);
    procedure SetValorIssServico(const Value: Double);
    procedure SetValorTotalReferencia(const Value: Double);
    procedure SetValorUnitarioServico(const Value: Double);
  public
    { public declarations }
    property NumeroNfseSubstituida : string read FNumeroNfseSubstituida write SetNumeroNfseSubstituida;
    property DataEmissaoNfseSubstituida : TDate read FDataEmissaoNfseSubstituida write SetDataEmissaoNfseSubstituida;
    property SeriePrestacao : string read FSeriePrestacao write SetSeriePrestacao;
    property MotCancelamento : string read FMotCancelamento write SetMotCancelamento;
    property Operacao : string read FOperacao write SetOperacao;
    property CodigoObra : string read FCodigoObra write SetCodigoObra;
    property Art : string read FArt write SetArt;
    property DeducaoPor : string read FDeducaoPor write SetDeducaoPor;
    property TipoDeducao : string read FTipoDeducao write SetTipoDeducao;
    property CPFCNPJReferencia : string read FCPFCNPJReferencia write SetCPFCNPJReferencia;
    property NumeroNfReferencia : string read FNumeroNfReferencia write SetNumeroNfReferencia;
    property ValorTotalReferencia : Double read FValorTotalReferencia write SetValorTotalReferencia;
    property PercentualDeduzir : Double read FPercentualDeduzir write SetPercentualDeduzir;
    property QuantidadeServicos : Integer read FQuantidadeServicos write SetQuantidadeServicos;
    property ValorUnitarioServico : Double read FValorUnitarioServico write SetValorUnitarioServico;
    property Tributavel : Byte read FTributavel write SetTributavel;
    property IdentificadorSistemaLegado : Byte read FIdentificadorSistemaLegado write SetIdentificadorSistemaLegado;
    property TipoCodificacao : string read FTipoCodificacao write SetTipoCodificacao;
    property Assinatura : string read FAssinatura write SetAssinatura;
    property NumEmissorRps : string read FNumEmissorRps write SetNumEmissorRps;
    property TipoDocumentoTomador : string read FTipoDocumentoTomador write SetTipoDocumentoTomador;
    property DescricaoDocumentoTomador : string read FDescricaoDocumentoTomador write SetDescricaoDocumentoTomador;
    property CidadeEstrangeiraTomador : string read FCidadeEstrangeiraTomador write SetCidadeEstrangeiraTomador;
    property PaisTomador : Integer read FPaisTomador write SetPaisTomador;
    property CodigoSubItemListaServico : string read FCodigoSubItemListaServico write SetCodigoSubItemListaServico;
    property JustificativaDeducao : string read FJustificativaDeducao write SetJustificativaDeducao;
    property ValorIssServico : Double read FValorIssServico write SetValorIssServico;
    property ExigibilidadeISS : Byte read FExigibilidadeISS write SetExigibilidadeISS;
    property MunicipioIncidencia : string read FMunicipioIncidencia write SetMunicipioIncidencia;
    property IncentivoFiscal : Byte read FIncentivoFiscal write SetIncentivoFiscal;
    property Competencia : TDateTime read FCompetencia write SetCompetencia;
    property CodigoPais : Integer read FCodigoPais write SetCodigoPais;
    property ResponsavelRetencao : string read FResponsavelRetencao write SetResponsavelRetencao;
  end;

  function FloatToString(Valor: Extended): string;overload;
  function FloatToString(Valor: string): string;overload;
implementation

function FloatToString(Valor: Extended): string;
begin
  try
//    Result:= '0';
    Result:= ReplaceStr( FormatFloat('#0.00', Valor), ',', '.');
//    Result:= StringReplace( Result, '0', '', [rfReplaceAll]);
  except
    Result:= '';
  end;
end;

function FloatToString(Valor: string): string;
begin
  try
    Result:= ReplaceStr( Valor, ',', '.');
    Result:= ReplaceStr( Result, '.00', '');
  except
    Result:= '';
  end;
end;

{ TInformacoesRPS }

procedure TInformacoesRPS.SetDataEmissao(const Value: TDateTime);
begin
  FDataEmissao := Value;
end;

procedure TInformacoesRPS.SetIdRps(const Value: Integer);
begin
  FIdRps := Value;
end;

procedure TInformacoesRPS.SetIncentivadorCultural(const Value: Byte);
begin
  FIncentivadorCultural := Value;
end;

procedure TInformacoesRPS.SetNaturezaTributacao(const Value: Integer);
begin
  FNaturezaTributacao := Value;
end;

procedure TInformacoesRPS.SetNumeroRps(const Value: string);
begin
  FNumeroRps := Value;
end;

procedure TInformacoesRPS.SetNumeroRpsSubstituido(const Value: string);
begin
  FNumeroRpsSubstituido := Value;
end;

procedure TInformacoesRPS.SetOptanteSimplesNacional(const Value: Byte);
begin
  FOptanteSimplesNacional := Value;
end;

procedure TInformacoesRPS.SetRegimeEspecialTributacao(const Value: Integer);
begin
  FRegimeEspecialTributacao := Value;
end;

procedure TInformacoesRPS.SetSerieRps(const Value: string);
begin
  FSerieRps := Value;
end;

procedure TInformacoesRPS.SetSerieRpsSubstituido(const Value: string);
begin
  FSerieRpsSubstituido := Value;
end;

procedure TInformacoesRPS.SetSituacaoNota(const Value: Byte);
begin
  FSituacaoNota := Value;
end;

procedure TInformacoesRPS.SetTipoRps(const Value: string);
begin
  FTipoRps := Value;
end;

procedure TInformacoesRPS.SetTipoRpsSubstituido(const Value: string);
begin
  FTipoRpsSubstituido := Value;
end;

procedure TInformacoesRPS.SetTipoTributacao(const Value: Integer);
begin
  FTipoTributacao := Value;
end;

{ TImposto }

procedure TImposto.SetAliquotaCOFINS(const Value: Double);
begin
  FAliquotaCOFINS := Value;
end;

procedure TImposto.SetAliquotaCSLL(const Value: Double);
begin
  FAliquotaCSLL := Value;
end;

procedure TImposto.SetAliquotaINSS(const Value: Double);
begin
  FAliquotaINSS := Value;
end;

procedure TImposto.SetAliquotaIR(const Value: Double);
begin
  FAliquotaIR := Value;
end;

procedure TImposto.SetAliquotaISS(const Value: Double);
begin
  FAliquotaISS := Value;
end;

procedure TImposto.SetAliquotaPIS(const Value: Double);
begin
  FAliquotaPIS := Value;
end;

procedure TImposto.SetBaseCalculo(const Value: Double);
begin
  FBaseCalculo := Value;
end;

procedure TImposto.SetDescontoCondicionado(const Value: Double);
begin
  FDescontoCondicionado := Value;
end;

procedure TImposto.SetDescontoIncondicionado(const Value: Double);
begin
  FDescontoIncondicionado := Value;
end;

procedure TImposto.SetIssRetido(const Value: Byte);
begin
  FIssRetido := Value;
end;

procedure TImposto.SetValorCofins(const Value: Double);
begin
  FValorCofins := Value;
end;

procedure TImposto.SetValorCsll(const Value: Double);
begin
  FValorCsll := Value;
end;

procedure TImposto.SetValorInss(const Value: Double);
begin
  FValorInss := Value;
end;

procedure TImposto.SetValorIr(const Value: Double);
begin
  FValorIr := Value;
end;

procedure TImposto.SetValorIss(const Value: Double);
begin
  FValorIss := Value;
end;

procedure TImposto.SetValorIssRetido(const Value: Double);
begin
  FValorIssRetido := Value;
end;

procedure TImposto.SetValorLiquidoNfse(const Value: Double);
begin
  FValorLiquidoNfse := Value;
end;

procedure TImposto.SetValorPis(const Value: Double);
begin
  FValorPis := Value;
end;

{ TServico }

procedure TServico.SetCodigoCidadePrestacao(const Value: string);
begin
  FCodigoCidadePrestacao := Value;
end;

procedure TServico.SetCodigoCnae(const Value: string);
begin
  FCodigoCnae := Value;
end;

procedure TServico.SetCodigoItemListaServico(const Value: string);
begin
  FCodigoItemListaServico := Value;
end;

procedure TServico.SetCodigoTributacaoMunicipio(const Value: string);
begin
  FCodigoTributacaoMunicipio := Value;
end;

procedure TServico.SetDescricaoCidadePrestacao(const Value: string);
begin
  FDescricaoCidadePrestacao := Value;
end;

procedure TServico.SetDiscriminacaoServico(const Value: string);
begin
  FDiscriminacaoServico := Value;
end;

procedure TServico.SetValorDeducoes(const Value: Double);
begin
  FValorDeducoes := Value;
end;

procedure TServico.SetValorServicos(const Value: Double);
begin
  FValorServicos := Value;
end;

{ TPrestador }

procedure TPrestador.SetCpfCnpjPrestador(const Value: string);
begin
  FCpfCnpjPrestador := Value;
end;

procedure TPrestador.SetDDDPrestador(const Value: string);
begin
  FDDDPrestador := Value;
end;

procedure TPrestador.SetInscricaoMunicipalPrestador(const Value: string);
begin
  FInscricaoMunicipalPrestador := Value;
end;

procedure TPrestador.SetRazaoSocialPrestador(const Value: string);
begin
  FRazaoSocialPrestador := Value;
end;

procedure TPrestador.SetTelefonePrestador(const Value: string);
begin
  FTelefonePrestador := Value;
end;

{ TTomador }

procedure TTomador.SetBairroTomador(const Value: string);
begin
  FBairroTomador := Value;
end;

procedure TTomador.SetCepTomador(const Value: string);
begin
  FCepTomador := Value;
end;

procedure TTomador.SetCodigoCidadeTomador(const Value: string);
begin
  FCodigoCidadeTomador := Value;
end;

procedure TTomador.SetComplementoTomador(const Value: string);
begin
  FComplementoTomador := Value;
end;

procedure TTomador.SetCpfCnpjTomador(const Value: string);
begin
  FCpfCnpjTomador := Value;
end;

procedure TTomador.SetDDDTomador(const Value: string);
begin
  FDDDTomador := Value;
end;

procedure TTomador.SetDescricaoCidadeTomador(const Value: string);
begin
  FDescricaoCidadeTomador := Value;
end;

procedure TTomador.SetEmailTomador(const Value: string);
begin
  FEmailTomador := Value;
end;

procedure TTomador.SetEnderecoTomador(const Value: string);
begin
  FEnderecoTomador := Value;
end;

procedure TTomador.SetInscricaoEstadualTomador(const Value: string);
begin
  FInscricaoEstadualTomador := Value;
end;

procedure TTomador.SetInscricaoMunicipalTomador(const Value: string);
begin
  FInscricaoMunicipalTomador := Value;
end;

procedure TTomador.SetNumeroTomador(const Value: string);
begin
  FNumeroTomador := Value;
end;

procedure TTomador.SetRazaoSocialTomador(const Value: string);
begin
  FRazaoSocialTomador := Value;
end;

procedure TTomador.SetTelefoneTomador(const Value: string);
begin
  FTelefoneTomador := Value;
end;

procedure TTomador.SetTipoBairroTomador(const Value: string);
begin
  FTipoBairroTomador := Value;
end;

procedure TTomador.SetTipoLogradouroTomador(const Value: string);
begin
  FTipoLogradouroTomador := Value;
end;

procedure TTomador.SetUfTomador(const Value: string);
begin
  FUfTomador := Value;
end;

{ TIntermediario }

procedure TIntermediario.SetCpfCnpjIntermediario(const Value: string);
begin
  FCpfCnpjIntermediario := Value;
end;

procedure TIntermediario.SetInscricaoMunicipalIntermediario(
  const Value: string);
begin
  FInscricaoMunicipalIntermediario := Value;
end;

procedure TIntermediario.SetRazaoSocialIntermediario(const Value: string);
begin
  FRazaoSocialIntermediario := Value;
end;

{ TNfse }

procedure TNfse.AfterConstruction;
begin
  inherited;

  FImposto:= TImposto.create;
  FPrestador:= TPrestador.create;
  FTomador:= TTomador.create;
  FInformacoesRPS:= TInformacoesRPS.create;
  FServico:= TServico.create;
  FIntermediario:= TIntermediario.create;
  FOutrasInformacoes:= TOutrasInformacoes.create;
end;

procedure TNfse.BeforeDestruction;
begin
  inherited;

  FreeAndNil( FImposto );
  FreeAndNil( FPrestador );
  FreeAndNil( FTomador );
  FreeAndNil( FInformacoesRPS );
  FreeAndNil( FServico );
  FreeAndNil( FIntermediario );
  FreeAndNil( FOutrasInformacoes );
end;

procedure TNfse.SetImposto(const Value: TImposto);
begin
  FImposto := Value;
end;

procedure TNfse.SetInformacoesRPS(const Value: TInformacoesRPS);
begin
  FInformacoesRPS := Value;
end;

procedure TNfse.SetIntermediario(const Value: TIntermediario);
begin
  FIntermediario := Value;
end;

procedure TNfse.SetOutrasInformacoes(const Value: TOutrasInformacoes);
begin
  FOutrasInformacoes := Value;
end;

procedure TNfse.SetPrestador(const Value: TPrestador);
begin
  FPrestador := Value;
end;

procedure TNfse.SetServico(const Value: TServico);
begin
  FServico := Value;
end;

procedure TNfse.SetTomador(const Value: TTomador);
begin
  FTomador := Value;
end;

{ TOutrasInformacoes }

procedure TOutrasInformacoes.SetArt(const Value: string);
begin
  FArt := Value;
end;

procedure TOutrasInformacoes.SetAssinatura(const Value: string);
begin
  FAssinatura := Value;
end;

procedure TOutrasInformacoes.SetCidadeEstrangeiraTomador(const Value: string);
begin
  FCidadeEstrangeiraTomador := Value;
end;

procedure TOutrasInformacoes.SetCodigoObra(const Value: string);
begin
  FCodigoObra := Value;
end;

procedure TOutrasInformacoes.SetCodigoPais(const Value: Integer);
begin
  FCodigoPais := Value;
end;

procedure TOutrasInformacoes.SetCodigoSubItemListaServico(const Value: string);
begin
  FCodigoSubItemListaServico := Value;
end;

procedure TOutrasInformacoes.SetCompetencia(const Value: TDateTime);
begin
  FCompetencia := Value;
end;

procedure TOutrasInformacoes.SetCPFCNPJReferencia(const Value: string);
begin
  FCPFCNPJReferencia := Value;
end;

procedure TOutrasInformacoes.SetDataEmissaoNfseSubstituida(const Value: TDate);
begin
  FDataEmissaoNfseSubstituida := Value;
end;

procedure TOutrasInformacoes.SetDeducaoPor(const Value: string);
begin
  FDeducaoPor := Value;
end;

procedure TOutrasInformacoes.SetDescricaoDocumentoTomador(const Value: string);
begin
  FDescricaoDocumentoTomador := Value;
end;

procedure TOutrasInformacoes.SetExigibilidadeISS(const Value: Byte);
begin
  FExigibilidadeISS := Value;
end;

procedure TOutrasInformacoes.SetIdentificadorSistemaLegado(const Value: Byte);
begin
  FIdentificadorSistemaLegado := Value;
end;

procedure TOutrasInformacoes.SetIncentivoFiscal(const Value: Byte);
begin
  FIncentivoFiscal := Value;
end;

procedure TOutrasInformacoes.SetJustificativaDeducao(const Value: string);
begin
  FJustificativaDeducao := Value;
end;

procedure TOutrasInformacoes.SetMotCancelamento(const Value: string);
begin
  FMotCancelamento := Value;
end;

procedure TOutrasInformacoes.SetMunicipioIncidencia(const Value: string);
begin
  FMunicipioIncidencia := Value;
end;

procedure TOutrasInformacoes.SetNumEmissorRps(const Value: string);
begin
  FNumEmissorRps := Value;
end;

procedure TOutrasInformacoes.SetNumeroNfReferencia(const Value: string);
begin
  FNumeroNfReferencia := Value;
end;

procedure TOutrasInformacoes.SetNumeroNfseSubstituida(const Value: string);
begin
  FNumeroNfseSubstituida := Value;
end;

procedure TOutrasInformacoes.SetOperacao(const Value: string);
begin
  FOperacao := Value;
end;

procedure TOutrasInformacoes.SetPaisTomador(const Value: Integer);
begin
  FPaisTomador := Value;
end;

procedure TOutrasInformacoes.SetPercentualDeduzir(const Value: Double);
begin
  FPercentualDeduzir := Value;
end;

procedure TOutrasInformacoes.SetQuantidadeServicos(const Value: Integer);
begin
  FQuantidadeServicos := Value;
end;

procedure TOutrasInformacoes.SetResponsavelRetencao(const Value: string);
begin
  FResponsavelRetencao := Value;
end;

procedure TOutrasInformacoes.SetSeriePrestacao(const Value: string);
begin
  FSeriePrestacao := Value;
end;

procedure TOutrasInformacoes.SetTipoCodificacao(const Value: string);
begin
  FTipoCodificacao := Value;
end;

procedure TOutrasInformacoes.SetTipoDeducao(const Value: string);
begin
  FTipoDeducao := Value;
end;

procedure TOutrasInformacoes.SetTipoDocumentoTomador(const Value: string);
begin
  FTipoDocumentoTomador := Value;
end;

procedure TOutrasInformacoes.SetTributavel(const Value: Byte);
begin
  FTributavel := Value;
end;

procedure TOutrasInformacoes.SetValorIssServico(const Value: Double);
begin
  FValorIssServico := Value;
end;

procedure TOutrasInformacoes.SetValorTotalReferencia(const Value: Double);
begin
  FValorTotalReferencia := Value;
end;

procedure TOutrasInformacoes.SetValorUnitarioServico(const Value: Double);
begin
  FValorUnitarioServico := Value;
end;

{ TBuildingNfse }

procedure TBuildingNfse.AfterConstruction;
begin
  inherited;

  FArquivo:= TStringList.Create;
  FParametros:= TStringList.Create;
  FListaNfse:= TObjectList<TNfse>.Create;
  spdNFSeConverterX:= TspdNFSeConverterX.Create(Self);
  self.QuantidadeRps:= 0;
  self.ValorTotalServicos:= 0;
  self.ValorTotalDeducoes:= 0;
  self.ValorTotalBaseCalculo:= 0;
end;

procedure TBuildingNfse.BeforeDestruction;
begin
  inherited;

  FreeAndNil( FArquivo );
  FreeAndNil( FListaNfse );
  FreeAndNil( FParametros );
  FreeAndNil( spdNFSeConverterX );
end;

procedure TBuildingNfse.CriarArquivo();
var
  i: Integer;
  lNfse: TNfse;
begin
  FArquivo.Clear;
  FArquivo.Add('formato=tx2');
  FArquivo.Add('padrao=TecnoNFSe');
  FArquivo.Add('');
  FArquivo.Add('INCLUIR');
  if Self.IdLote = 0 then
    FArquivo.Add('IdLote=')
  else
    FArquivo.Add(Format('IdLote=%d', [Self.IdLote]));

  if Self.NumeroLote = 0 then
    FArquivo.Add('NumeroLote=')
  else
    FArquivo.Add(Format('NumeroLote=%d', [self.NumeroLote]));


  FArquivo.Add(Format('CpfCnpjRemetente=%s', [Self.CpfCnpjRemetente]));
  FArquivo.Add(Format('InscricaoMunicipalRemetente=%s', [Self.InscricaoMunicipalRemetente]));
  FArquivo.Add(Format('RazaoSocialRemetente=%s', [Self.RazaoSocialRemetente]));
  FArquivo.Add(Format('QuantidadeRps=%d', [Self.QuantidadeRps]));
  FArquivo.Add(Format('CodigoCidadeRemetente=%s', [Self.CodigoCidadeRemetente]));
  FArquivo.Add(Format('Transacao=%s', [BoolToStr(Self.Transacao, True)]));
  FArquivo.Add(Format('DataInicio=%s', [FormatDateTime('YYYY-MM-DD', Self.DataInicio)]));
  FArquivo.Add(Format('DataFim=%s', [FormatDateTime('YYYY-MM-DD', Self.DataFim)]));
  FArquivo.Add(Format('Versao=%s', [Self.Versao]));
  FArquivo.Add(Format('MetodoEnvio=%s', [Self.MetodoEnvio]));
  FArquivo.Add(Format('ValorTotalServicos=%s', [ FloatToString( Self.ValorTotalServicos)]));
  FArquivo.Add(Format('ValorTotalDeducoes=%s', [ FloatToString( Self.ValorTotalDeducoes)]));
  FArquivo.Add(Format('ValorTotalBaseCalculo=%s', [ FloatToString( Self.ValorTotalBaseCalculo)]));
  FArquivo.Add('SALVAR');

  for I := 0 to FListaNfse.Count - 1 do
  begin
    lNfse:= FListaNfse.Items[i] as TNfse;

    FArquivo.Add('');
    FArquivo.Add('INCLUIRRPS');
    if lNfse.InformacoesRPS.IdRps <> 0 then
      FArquivo.Add(Format('IdRps=%d', [ lNfse.InformacoesRPS.IdRps ]))
    else
      FArquivo.Add('IdRps=');

    FArquivo.Add(Format('NumeroRps=%s', [lNfse.InformacoesRPS.NumeroRps]));
    FArquivo.Add(Format('SerieRps=%s', [lNfse.InformacoesRPS.SerieRps]));
    FArquivo.Add(Format('TipoRps=%s', [lNfse.InformacoesRPS.TipoRps]));
    FArquivo.Add(Format('DataEmissao=%s', [ReplaceStr(FormatDateTime('YYYY-MM-DD HH:MM:SS', lNfse.InformacoesRPS.DataEmissao), ' ', 'T')]));
    FArquivo.Add(Format('OptanteSimplesNacional=%d', [lNfse.InformacoesRPS.OptanteSimplesNacional]));
    FArquivo.Add(Format('IncentivadorCultural=%d', [lNfse.InformacoesRPS.IncentivadorCultural]));
    FArquivo.Add(Format('SituacaoNota=%d', [lNfse.InformacoesRPS.SituacaoNota]));
    FArquivo.Add(Format('TipoTributacao=%d', [lNfse.InformacoesRPS.TipoTributacao]));
    FArquivo.Add(Format('NaturezaTributacao=%d', [lNfse.InformacoesRPS.NaturezaTributacao]));
    FArquivo.Add(Format('RegimeEspecialTributacao=%d', [lNfse.InformacoesRPS.RegimeEspecialTributacao]));
    FArquivo.Add(Format('NumeroRpsSubstituido=%s', [lNfse.InformacoesRPS.NumeroRpsSubstituido]));
    FArquivo.Add(Format('SerieRpsSubstituido=%s', [lNfse.InformacoesRPS.SerieRpsSubstituido]));
    FArquivo.Add(Format('TipoRpsSubstituido=%s', [lNfse.InformacoesRPS.TipoRpsSubstituido]));
    FArquivo.Add(Format('ValorServicos=%s', [ FloatToString(lNfse.Servico.ValorServicos)]));
    FArquivo.Add(Format('ValorDeducoes=%s', [ FloatToString(lNfse.Servico.ValorDeducoes)]));
    FArquivo.Add(Format('ValorPis=%s', [FloatToString(lNfse.Imposto.ValorPis)]));
    FArquivo.Add(Format('ValorCofins=%s', [FloatToString(lNfse.Imposto.ValorCofins)]));
    FArquivo.Add(Format('ValorInss=%s', [FloatToString(lNfse.Imposto.ValorInss)]));
    FArquivo.Add(Format('ValorIr=%s', [FloatToString(lNfse.Imposto.ValorIr)]));
    FArquivo.Add(Format('ValorCsll=%s', [FloatToString(lNfse.Imposto.ValorCsll)]));
    FArquivo.Add(Format('IssRetido=%d', [lNfse.Imposto.IssRetido]));
    FArquivo.Add(Format('ValorIss=%s', [FloatToString(lNfse.Imposto.ValorIss)]));
    FArquivo.Add(Format('ValorIssRetido=%s', [FloatToString(lNfse.Imposto.ValorIssRetido)]));
    FArquivo.Add(Format('BaseCalculo=%s', [FloatToString(lNfse.Imposto.BaseCalculo)]));
    FArquivo.Add(Format('ValorLiquidoNfse=%s', [FloatToString(lNfse.Imposto.ValorLiquidoNfse)]));
    FArquivo.Add(Format('DescontoIncondicionado=%s', [FloatToString(lNfse.Imposto.DescontoIncondicionado)]));
    FArquivo.Add(Format('DescontoCondicionado=%s', [FloatToString(lNfse.Imposto.DescontoCondicionado)]));
    FArquivo.Add(Format('AliquotaISS=%s', [FloatToString(lNfse.Imposto.AliquotaISS)]));
    FArquivo.Add(Format('AliquotaPIS=%s', [FloatToString(lNfse.Imposto.AliquotaPIS)]));
    FArquivo.Add(Format('AliquotaCOFINS=%s', [FloatToString(lNfse.Imposto.AliquotaCOFINS)]));
    FArquivo.Add(Format('AliquotaINSS=%s', [FloatToString(lNfse.Imposto.AliquotaINSS)]));
    FArquivo.Add(Format('AliquotaIR=%s', [FloatToString(lNfse.Imposto.AliquotaIR)]));
    FArquivo.Add(Format('AliquotaCSLL=%s', [FloatToString(lNfse.Imposto.AliquotaCSLL)]));
    FArquivo.Add(Format('CodigoItemListaServico=%s', [lNfse.Servico.CodigoItemListaServico]));
    FArquivo.Add(Format('CodigoCnae=%s', [lNfse.Servico.CodigoCnae]));
    FArquivo.Add(Format('CodigoTributacaoMunicipio=%s', [lNfse.Servico.CodigoTributacaoMunicipio]));
    FArquivo.Add(Format('DiscriminacaoServico=%s', [lNfse.Servico.DiscriminacaoServico]));
    FArquivo.Add(Format('CodigoCidadePrestacao=%s', [lNfse.Servico.CodigoCidadePrestacao]));
    FArquivo.Add(Format('DescricaoCidadePrestacao=%s', [lNfse.Servico.DescricaoCidadePrestacao]));
    FArquivo.Add('');
    FArquivo.Add(Format('CpfCnpjPrestador=%s', [lNfse.Prestador.CpfCnpjPrestador]));
    FArquivo.Add(Format('InscricaoMunicipalPrestador=%s', [lNfse.Prestador.InscricaoMunicipalPrestador]));
    FArquivo.Add(Format('RazaoSocialPrestador=%s', [lNfse.Prestador.RazaoSocialPrestador]));
    FArquivo.Add(Format('DDDPrestador=%s', [lNfse.Prestador.DDDPrestador]));
    FArquivo.Add(Format('TelefonePrestador=%s', [lNfse.Prestador.TelefonePrestador]));
    FArquivo.Add('');
    FArquivo.Add(Format('CpfCnpjTomador=%s', [lNfse.Tomador.CpfCnpjTomador]));
    FArquivo.Add(Format('RazaoSocialTomador=%s', [lNfse.Tomador.RazaoSocialTomador]));
    FArquivo.Add(Format('InscricaoMunicipalTomador=%s', [lNfse.Tomador.InscricaoMunicipalTomador]));
    FArquivo.Add(Format('InscricaoEstadualTomador=%s', [lNfse.Tomador.InscricaoEstadualTomador]));
    FArquivo.Add(Format('TipoLogradouroTomador=%s', [lNfse.Tomador.TipoLogradouroTomador]));
    FArquivo.Add(Format('EnderecoTomador=%s', [lNfse.Tomador.EnderecoTomador]));
    FArquivo.Add(Format('NumeroTomador=%s', [lNfse.Tomador.NumeroTomador]));
    FArquivo.Add(Format('ComplementoTomador=%s', [lNfse.Tomador.ComplementoTomador]));
    FArquivo.Add(Format('TipoBairroTomador=%s', [lNfse.Tomador.TipoBairroTomador]));
    FArquivo.Add(Format('BairroTomador=%s', [lNfse.Tomador.BairroTomador]));
    FArquivo.Add(Format('CodigoCidadeTomador=%s', [lNfse.Tomador.CodigoCidadeTomador]));
    FArquivo.Add(Format('DescricaoCidadeTomador=%s', [lNfse.Tomador.DescricaoCidadeTomador]));
    FArquivo.Add(Format('UfTomador=%s', [lNfse.Tomador.UfTomador]));
    FArquivo.Add(Format('CepTomador=%s', [lNfse.Tomador.CepTomador]));
    FArquivo.Add(Format('DDDTomador=%s', [lNfse.Tomador.DDDTomador]));
    FArquivo.Add(Format('TelefoneTomador=%s', [lNfse.Tomador.TelefoneTomador]));
    FArquivo.Add(Format('EmailTomador=%s', [lNfse.Tomador.EmailTomador]));
    FArquivo.Add(Format('RazaoSocialIntermediario=%s', [lNfse.Intermediario.RazaoSocialIntermediario]));
    FArquivo.Add('');
    FArquivo.Add(Format('CpfCnpjIntermediario=%s', [lNfse.Intermediario.CpfCnpjIntermediario]));
    FArquivo.Add(Format('InscricaoMunicipalIntermediario=%s', [lNfse.Intermediario.InscricaoMunicipalIntermediario]));
    FArquivo.Add('');
    FArquivo.Add(Format('NumeroNfseSubstituida=%s', [lNfse.OutrasInformacoes.NumeroNfseSubstituida]));

    if lNfse.OutrasInformacoes.DataEmissaoNfseSubstituida = 0 then
      FArquivo.Add('DataEmissaoNfseSubstituida=')
    else
      FArquivo.Add(Format('DataEmissaoNfseSubstituida=%s', [ FormatDateTime('YYYY-MM-DD', lNfse.OutrasInformacoes.DataEmissaoNfseSubstituida)]));

    FArquivo.Add(Format('SeriePrestacao=%s', [lNfse.OutrasInformacoes.SeriePrestacao]));
    FArquivo.Add(Format('MotCancelamento=%s', [lNfse.OutrasInformacoes.MotCancelamento]));
    FArquivo.Add(Format('Operacao=%s', [lNfse.OutrasInformacoes.Operacao]));
    FArquivo.Add(Format('CodigoObra=%s', [lNfse.OutrasInformacoes.CodigoObra]));
    FArquivo.Add(Format('Art=%s', [lNfse.OutrasInformacoes.Art]));
    FArquivo.Add(Format('DeducaoPor=%s', [lNfse.OutrasInformacoes.DeducaoPor]));
    FArquivo.Add(Format('TipoDeducao=%s', [lNfse.OutrasInformacoes.TipoDeducao]));
    FArquivo.Add(Format('CPFCNPJReferencia=%s', [lNfse.OutrasInformacoes.CPFCNPJReferencia]));
    FArquivo.Add(Format('NumeroNfReferencia=%s', [lNfse.OutrasInformacoes.NumeroNfReferencia]));
    if lNfse.OutrasInformacoes.ValorTotalReferencia = 0 then
      FArquivo.Add('ValorTotalReferencia=')
    else
      FArquivo.Add(Format('ValorTotalReferencia=%s', [ FloatToString( lNfse.OutrasInformacoes.ValorTotalReferencia )]));

    if lNfse.OutrasInformacoes.PercentualDeduzir = 0 then
      FArquivo.Add('PercentualDeduzir=')
    else
      FArquivo.Add(Format('PercentualDeduzir=%s', [ FloatToString( lNfse.OutrasInformacoes.PercentualDeduzir )]));

    if lNfse.OutrasInformacoes.QuantidadeServicos = 0 then
      FArquivo.Add('QuantidadeServicos=')
    else
      FArquivo.Add(Format('QuantidadeServicos=%d', [ lNfse.OutrasInformacoes.QuantidadeServicos ]));

    if lNfse.OutrasInformacoes.ValorUnitarioServico = 0 then
      FArquivo.Add('ValorUnitarioServico=')
    else
      FArquivo.Add(Format('ValorUnitarioServico=%s', [ FloatToString( lNfse.OutrasInformacoes.ValorUnitarioServico )]));

    if lNfse.OutrasInformacoes.Tributavel = 0 then
      FArquivo.Add('Tributavel=')
    else
      FArquivo.Add(Format('Tributavel=%d', [ lNfse.OutrasInformacoes.Tributavel ]));

    if lNfse.OutrasInformacoes.IdentificadorSistemaLegado = 0 then
      FArquivo.Add('IdentificadorSistemaLegado=')
    else
      FArquivo.Add(Format('IdentificadorSistemaLegado=%d', [ lNfse.OutrasInformacoes.IdentificadorSistemaLegado ]));

    FArquivo.Add(Format('TipoCodificacao=%s', [lNfse.OutrasInformacoes.TipoCodificacao]));
    FArquivo.Add(Format('Assinatura=%s', [lNfse.OutrasInformacoes.Assinatura]));
    FArquivo.Add(Format('NumEmissorRps=%s', [lNfse.OutrasInformacoes.NumEmissorRps]));
    FArquivo.Add(Format('TipoDocumentoTomador=%s', [lNfse.OutrasInformacoes.TipoDeducao]));
    FArquivo.Add(Format('DescricaoDocumentoTomador=%s', [lNfse.OutrasInformacoes.DescricaoDocumentoTomador]));
    FArquivo.Add(Format('CidadeEstrangeiraTomador=%s', [lNfse.OutrasInformacoes.CidadeEstrangeiraTomador]));
    FArquivo.Add(Format('PaisTomador=%d', [lNfse.OutrasInformacoes.PaisTomador]));
    FArquivo.Add(Format('CodigoSubItemListaServico=%s', [lNfse.OutrasInformacoes.CodigoSubItemListaServico]));
    FArquivo.Add(Format('JustificativaDeducao=%s', [lNfse.OutrasInformacoes.JustificativaDeducao]));

    if lNfse.OutrasInformacoes.ValorIssServico = 0 then
      FArquivo.Add('ValorIssServico=')
    else
      FArquivo.Add(Format('ValorIssServico=%s', [ FloatToString( lNfse.OutrasInformacoes.ValorIssServico )]));

    FArquivo.Add(Format('ExigibilidadeISS=%d', [lNfse.OutrasInformacoes.ExigibilidadeISS]));
    FArquivo.Add(Format('MunicipioIncidencia=%s', [lNfse.OutrasInformacoes.MunicipioIncidencia]));
    FArquivo.Add(Format('IncentivoFiscal=%d', [lNfse.OutrasInformacoes.IncentivoFiscal]));
    FArquivo.Add(Format('Competencia=%s', [ FormatDateTime('YYYY-MM-DD', lNfse.OutrasInformacoes.Competencia )]));

    if lNfse.OutrasInformacoes.CodigoPais = 0 then
      FArquivo.Add('CodigoPais=')
    else
      FArquivo.Add(Format('CodigoPais=%s', [ lNfse.OutrasInformacoes.CodigoPais ]));

    FArquivo.Add(Format('ResponsavelRetencao=%s', [lNfse.OutrasInformacoes.ResponsavelRetencao]));
    FArquivo.Add('SALVARRPS');
  end;
end;

procedure TBuildingNfse.Config();
begin
  spdNFSeConverterX.DiretorioEsquemas := Self.DiretorioEsquemas;
  spdNFSeConverterX.DiretorioScripts := ExpandFileName(Self.DiretorioEsquemas + '\..\Scripts\');
  spdNFSeConverterX.Cidade := Self.Cidade;
end;

function TBuildingNfse.GerarXML(): string;
var
  lFileName: string;
  lExtras: string;
  i: Integer;
begin
  try
    Config();
    //Aqui crio o arquivo tx2
    CriarArquivo();
    if OpcaoDesenvolvedor() then
    begin
      lFileName:= DiretorioImpressao + '/TX2';
      if not DirectoryExists(lFileName) then
        ForceDirectories(lFileName);

      lFileName:= lFileName + '/_ArquivoRPS'+ FormatDateTime('yyyymmddhhmmsszzz', Now) + '.Tx2';
    end
    else
      lFileName:= RetornarTempDir() + '_ArquivoRPS'+ FormatDateTime('yyyymmddhhmmsszzz', Now) + '.Tx2';

    //Aqui eu salvo num diretório temporário
    FArquivo.SaveToFile(lFileName);

    lExtras:= EmptyStr;
    for I := 0 to FParametros.Count - 1 do
    begin
      if lExtras = EmptyStr then
        lExtras := FParametros.Strings[i]
      else
        lExtras := lExtras + ';' + FParametros.Strings[i];
    end;

    //Aqui faço a conversão de tx2 para xml
    result:= spdNFSeConverterX.ConverterEnvioNFSe(lFileName, lExtras);
//    ShowMessage(lFileName);
  finally
    if FileExists(lFileName) and not OpcaoDesenvolvedor() then
      DeleteFile(lFileName);
  end;
end;

procedure TBuildingNfse.SetCidade(const Value: String);
begin
  FCidade := Value;
end;

procedure TBuildingNfse.SetCodigoCidadeRemetente(const Value: String);
begin
  FCodigoCidadeRemetente := Value;
end;

procedure TBuildingNfse.SetCpfCnpjRemetente(const Value: string);
begin
  FCpfCnpjRemetente := Value;
end;

procedure TBuildingNfse.SetDataFim(const Value: TDate);
begin
  FDataFim := Value;
end;

procedure TBuildingNfse.SetDataInicio(const Value: TDate);
begin
  FDataInicio := Value;
end;

procedure TBuildingNfse.SetDiretorioEsquemas(const Value: String);
begin
  FDiretorioEsquemas := Value;
end;

procedure TBuildingNfse.SetDiretorioImpressao(const Value: String);
begin
  FDiretorioImpressao := Value;
end;

procedure TBuildingNfse.SetDiretorioScripts(const Value: String);
begin
  FDiretorioScripts := Value;
end;

procedure TBuildingNfse.SetIdLote(const Value: Integer);
begin
  FIdLote := Value;
end;

procedure TBuildingNfse.SetInscricaoMunicipalRemetente(const Value: string);
begin
  FInscricaoMunicipalRemetente := Value;
end;

procedure TBuildingNfse.SetListaNfse(const Value: TObjectList<TNfse>);
begin
  FListaNfse := Value;
end;

procedure TBuildingNfse.SetMetodoEnvio(const Value: String);
begin
  FMetodoEnvio := Value;
end;

procedure TBuildingNfse.SetNumeroLote(const Value: Integer);
begin
  FNumeroLote := Value;
end;

procedure TBuildingNfse.SetParametros(const Value: TStringList);
begin
//  FParametros := Value;
  FParametros.Assign(value);
end;

procedure TBuildingNfse.SetQuantidadeRps(const Value: Integer);
begin
  FQuantidadeRps := Value;
end;

procedure TBuildingNfse.SetRazaoSocialRemetente(const Value: string);
begin
  FRazaoSocialRemetente := Value;
end;

procedure TBuildingNfse.SetTransacao(const Value: Boolean);
begin
  FTransacao := Value;
end;

procedure TBuildingNfse.SetValorTotalBaseCalculo(const Value: Double);
begin
  FValorTotalBaseCalculo := Value;
end;

procedure TBuildingNfse.SetValorTotalDeducoes(const Value: Double);
begin
  FValorTotalDeducoes := Value;
end;

procedure TBuildingNfse.SetValorTotalServicos(const Value: Double);
begin
  FValorTotalServicos := Value;
end;

procedure TBuildingNfse.SetVersao(const Value: String);
begin
  FVersao := Value;
end;

end.
