unit Int_Nfse;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StrUtils, XSBuiltIns, OleCtrls, NFSeConverterX_TLB, Generics.Collections,
  Dialogs, BaseLibrary, spdProxyNFSe, spdNFSeGov, spdCustomNFSe, spdNFSe,
  spdNFSeXsdUtils, spdNFSeTypes, MSXML5_TLB, spdNFSeUtils, spdNFSeException,
  {IdGlobal,} spdNFSeConverterAdapter, spdNFSeXmlUtils, Contnrs, Inifiles;

type
  TNfse = class;
  TNfseInfo = class;
  TImposto = class;
  TPrestador = class;
  TTomador = class;
  TInformacoesRPS = class;
  TServico = class;
  TIntermediario = class;
  TOutrasInformacoes = class;
  TConfiguracao = class;
  TRemetente = class;

  TNfse = class(TComponent)
    private
      FLogEnvio: string;
      FListaNfse: TObjectList;
      FNfse: TNfseInfo;
      FIdLote: Integer;
      FNumeroLote: Integer;
      FConfig: TConfiguracao;
      FRemetente: TRemetente;
      FValorTotalDeducoes: Double;
      FValorTotalBaseCalculo: Double;
      FValorTotalServicos: Double;
      FListaCertificados: TStringList;
      FEnvioSincrono: Boolean;
      FListaNotasComErros: TStringList;
      FNome_Arquivo: string;
      FRetorno: TStringList;
      ProxyNFSe: TspdProxyNFSe;
      spdNFSe: TspdNFSe;
      spdNFSeConverterX: TspdNFSeConverterX;

      procedure SetNfse(const Value: TNfseInfo);
      procedure SetConfig(const Value: TConfiguracao);
      procedure SetIdLote(const Value: Integer);
      procedure SetNumeroLote(const Value: Integer);
      procedure SetRemetente(const Value: TRemetente);
      procedure SetValorTotalBaseCalculo(const Value: Double);
      procedure SetValorTotalDeducoes(const Value: Double);
      procedure SetValorTotalServicos(const Value: Double);
      procedure LoadConfig();
      function GetCertificate(const Serial: String): String;
      procedure CriarArquivoTx2(ArquivoTx2: TStringList);
      procedure SetListaNotasComErros(const Value: TStringList);
      procedure OnLog(const aNome, aID, aFileName: String);
      procedure EnvioSincrono(const NomeArquivo: string);
      procedure EnvioAssincrono(const NomeArquivo: string;
        var AProtocolo: string);
      procedure SetNome_Arquivo(const Value: string);
      function PedirParametrosExtras(var aParametrosExtras: string;
        const aOperacao: string): boolean;
      procedure getRetornoEnvioSincrno(const aRet: IspdRetEnvioSincronoNFSe);
      procedure SetRetorno(const Value: TStringList);
    public
      property IdLote : Integer read FIdLote write SetIdLote;
      property NumeroLote : Integer read FNumeroLote write SetNumeroLote;
      property Remetente: TRemetente read FRemetente write SetRemetente;
      property ValorTotalServicos : Double read FValorTotalServicos write SetValorTotalServicos;
      property ValorTotalDeducoes : Double read FValorTotalDeducoes write SetValorTotalDeducoes;
      property ValorTotalBaseCalculo : Double read FValorTotalBaseCalculo write SetValorTotalBaseCalculo;
      property Config: TConfiguracao read FConfig write SetConfig;
      property Nfse: TNfseInfo read FNfse write SetNfse;

      property ListaNotasComErros: TStringList read FListaNotasComErros write SetListaNotasComErros;
      property Nome_Arquivo: string read FNome_Arquivo write SetNome_Arquivo;
      property Retorno: TStringList read FRetorno write SetRetorno;
      procedure Incluir();
      procedure Processar();
      procedure AfterConstruction; override;
      procedure BeforeDestruction; override;
  end;
  TRemetente = class
    private
      FCodigoCidade: String;
      FInscricaoMunicipal: string;
      FCpfCnpj: string;
      FRazaoSocial: string;
      procedure SetCodigoCidade(const Value: String);
      procedure SetCpfCnpj(const Value: string);
      procedure SetInscricaoMunicipal(const Value: string);
      procedure SetRazaoSocial(const Value: string);
    public
      property CpfCnpj: string read FCpfCnpj write SetCpfCnpj;
      property InscricaoMunicipal: string read FInscricaoMunicipal write SetInscricaoMunicipal;
      property RazaoSocial: string read FRazaoSocial write SetRazaoSocial;
      property CodigoCidade: String read FCodigoCidade write SetCodigoCidade;
  end;

  TConfiguracao = class
    private
      FDiretorioEsquemas: String;
      FDiretorioImpressao: String;
      FDiretorioScripts: String;
      FCidade: String;
      FVersao: string;
      FDataFim: TDate;
      FDataInicio: TDate;
      FMetodoEnvio: String;
      FTransacao: Boolean;
      FQuantidadeRps: Integer;
      FParametros: TStringList;
      FDiretorioNfse: String;
      FCNPJSoftwareHouse: String;
      FTokenSoftHouse: String;
      FCertificadoDigital: string;
      FGerarSomenteXML: Boolean;
      FCodigoMunicipio: String;
      FCnpj: String;
      FInscricaoMunicipal: String;
      FDiretorioTemplates: String;
      procedure SetCidade(const Value: String);
      procedure SetDiretorioEsquemas(const Value: String);
      procedure SetDiretorioImpressao(const Value: String);
      procedure SetDiretorioScripts(const Value: String);
      procedure SetDataFim(const Value: TDate);
      procedure SetDataInicio(const Value: TDate);
      procedure SetMetodoEnvio(const Value: String);
      procedure SetQuantidadeRps(const Value: Integer);
      procedure SetTransacao(const Value: Boolean);
      procedure SetVersao(const Value: string);
      procedure SetParametros(const Value: TStringList);
      procedure SetDiretorioNfse(const Value: String);
      procedure SetCNPJSoftwareHouse(const Value: String);
      procedure SetTokenSoftHouse(const Value: String);
      procedure SetCertificadoDigital(const Value: string);
      procedure SetGerarSomenteXML(const Value: Boolean);
      procedure SetCodigoMunicipio(const Value: String);
      procedure SetCnpj(const Value: String);
      procedure SetInscricaoMunicipal(const Value: String);
      procedure SetDiretorioTemplates(const Value: String);
    public
      procedure AfterConstruction; override;
      procedure BeforeDestruction; override;
      property GerarSomenteXML: Boolean read FGerarSomenteXML write SetGerarSomenteXML;
      property TokenSoftHouse: String read FTokenSoftHouse write SetTokenSoftHouse;
      property CNPJSoftwareHouse: String read FCNPJSoftwareHouse write SetCNPJSoftwareHouse;
      property DiretorioNfse: String read FDiretorioNfse write SetDiretorioNfse;
      property DiretorioImpressao: String read FDiretorioImpressao write SetDiretorioImpressao;
      property DiretorioEsquemas: String read FDiretorioEsquemas write SetDiretorioEsquemas;
      property DiretorioScripts: String read FDiretorioScripts write SetDiretorioScripts;
      property DiretorioTemplates: String read FDiretorioTemplates write SetDiretorioTemplates;
      property Cnpj: String read FCnpj write SetCnpj;
      property Cidade: String read FCidade write SetCidade;
      property InscricaoMunicipal: String read FInscricaoMunicipal write SetInscricaoMunicipal;
      property CodigoMunicipio: String read FCodigoMunicipio write SetCodigoMunicipio;
      property QuantidadeRps : Integer read FQuantidadeRps write SetQuantidadeRps;
      property Transacao : Boolean read FTransacao write SetTransacao;
      property DataInicio : TDate read FDataInicio write SetDataInicio;
      property DataFim : TDate read FDataFim write SetDataFim;
      property Versao : string read FVersao write SetVersao;
      property CertificadoDigital : string read FCertificadoDigital write SetCertificadoDigital;
      property MetodoEnvio : String read FMetodoEnvio write SetMetodoEnvio;
      property Parametros: TStringList read FParametros write SetParametros;
  end;

  TNfseInfo = class
  private
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
    { private declarations }
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

    function Add: TNfseInfo;
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

implementation

{ TNfse }

procedure TNfse.AfterConstruction;
begin
  inherited;

  FConfig:= TConfiguracao.Create;
  FListaNfse:= TObjectList.Create;
  FRemetente:= TRemetente.Create;
  FListaNotasComErros:= TStringList.Create;
  Config.QuantidadeRps:= 0;
  ValorTotalServicos:= 0;
  ValorTotalDeducoes:= 0;
  ValorTotalBaseCalculo:= 0;
end;

procedure TNfse.BeforeDestruction;
begin
  inherited;

  FreeAndNil( FConfig );
  FreeAndNil( FRemetente );
  FreeAndNil( FListaNfse );
  FreeAndNil( FListaNotasComErros );
end;

procedure TNfse.Incluir;
begin
  FListaNfse.Add( FNfse );
end;

function TNfse.GetCertificate(const Serial: String): String;
var
  i: Integer;
begin
  result:= EmptyStr;
  for I := 0 to FListaCertificados.Count - 1 do
  begin
    if AnsiPos(AnsiUpperCase(Trim(Serial)), AnsiUpperCase(FListaCertificados.Strings[i])) > 0 then
      result:= FListaCertificados.Strings[i];
  end;
end;

procedure TNfse.LoadConfig();
var
  i: Integer;
  lCidades: TIniFile;
  lLocais: TIniFile;
  lStrLocais: TStringList;
begin
  try
    FListaCertificados:= TStringList.create;
    spdNFSe.ConfigurarSoftwareHouse(Config.CNPJSoftwareHouse, Config.TokenSoftHouse);
    spdNFSe.ListarCertificados(FListaCertificados);
    lStrLocais:= TStringList.Create;
    lLocais:= TIniFile.Create(Config.DiretorioNfse+ 'nfseLocais.ini');
    lCidades:= TIniFile.Create(Config.DiretorioNfse+ 'Cidades.ini');
    FEnvioSincrono:= Uppercase(lCidades.ReadString( Config.CodigoMunicipio, 'Sincrono', 'FALSE')) = 'TRUE';
    if not OpcaoDesenvolvedor() then
      self.spdNFSe.Ambiente:= akProducao
    else
      self.spdNFSe.Ambiente:= akHomologacao;

    spdNFSe.TimeOut := 0;
    spdNFSe.IgnoreInvalidCertificates := False;
    spdNFSe.EmailSettings.Autenticacao := False;
    spdNFSe.EmailSettings.TimeOut := 0;
    spdNFSe.EmailSettings.IsContentHTML := False;
    spdNFSe.ConexaoSegura := False;
    spdNFSe.ConfiguracoesImpressao.QtdeCopias := 1;
    spdNFSe.RemoverAcentos := True;

    lLocais.ReadSectionValues('LOCAIS',lStrLocais);
    for i := 0 to lStrLocais.Count - 1 do
      if lStrLocais.ValueFromIndex[i] = Config.CodigoMunicipio then
        begin
          spdNFSe.Cidade:= lStrLocais.Names[i];
          Break;
        end;

    if spdNFSe.Cidade = EmptyStr then
    begin
      Aviso('Cidade não homologada para emitir nota fiscal de serviço. Verifique!');
      Abort;
    end;
    spdNFSe.NomeCertificado.Clear;
    spdNFSe.NomeCertificado.Text:= GetCertificate( Config.CertificadoDigital );
    spdNFSe.cnpj:= Config.Cnpj;
    spdNFSe.InscricaoMunicipal:= Config.InscricaoMunicipal;
    spdNFSe.ValidarEsquemaAntesEnvio:= False;
    spdNFSe.ArquivoLocais:= Config.DiretorioNfse + 'nfseLocais.ini';
    spdNFSe.ArquivoServidoresHom:= Config.DiretorioNfse + 'nfseServidoresHom.ini';
    spdNFSe.ArquivoServidoresProd:= Config.DiretorioNfse + 'nfseServidoresProd.ini';
    spdNFSe.DiretorioEsquemas:= Config.DiretorioEsquemas;
    spdNFSe.DiretorioTemplates:= Config.DiretorioTemplates;
    spdNFSe.DiretorioLog:= Config.DiretorioEsquemas+'Log\';
    spdNFSe.DiretorioXmlImpressao:= Config.DiretorioImpressao;
    spdNFSe.MappingFileName:= 'Mapping.txt';
    spdNFSe.DiretorioLogErro:= Config.DiretorioNfse + 'DiretorioLogErro\';
    spdNFSe.TipoCertificado:= ckFile;
    ProxyNFSe.ComponenteNFSe := spdNFSe;
    ProxyNFSe.ComponenteNFSe.OnLog := OnLog;

    spdNFSeConverterX.DelimitadorDaLinha := #13#10;
    spdNFSeConverterX.DelimitadorDoCampo := ';';
    spdNFSeConverterX.DiretorioEsquemas := Config.DiretorioEsquemas;
    spdNFSeConverterX.DiretorioScripts := ExpandFileName(Config.DiretorioEsquemas + '\..\Scripts\');
    spdNFSeConverterX.Cidade := spdNFSe.Cidade;
  finally
    FreeAndNil( lLocais );
    FreeAndNil( lCidades);
    FreeAndNil( lStrLocais );
    FreeAndNil( FListaCertificados );
  end;
end;

procedure TNfse.OnLog(const aNome, aID, aFileName: String);
begin
  FLogEnvio := '';

  if (AnsiContainsText(aNome,'resposta')) then
    FLogEnvio := aFileName;
end;

procedure TNfse.CriarArquivoTx2(ArquivoTx2: TStringList);
var
  i: Integer;
  lNfse: TNfseInfo;
begin
  ArquivoTx2.Add('formato=tx2');
  ArquivoTx2.Add('padrao=TecnoNFSe');
  ArquivoTx2.Add('');
  ArquivoTx2.Add('INCLUIR');
  if IdLote = 0 then
    ArquivoTx2.Add('IdLote=')
  else
    ArquivoTx2.Add(Format('IdLote=%d', [IdLote]));

  if NumeroLote = 0 then
    ArquivoTx2.Add('NumeroLote=')
  else
    ArquivoTx2.Add(Format('NumeroLote=%d', [NumeroLote]));

  ArquivoTx2.Add(Format('CpfCnpjRemetente=%s', [Remetente.CpfCnpj]));
  ArquivoTx2.Add(Format('InscricaoMunicipalRemetente=%s', [Remetente.InscricaoMunicipal]));
  ArquivoTx2.Add(Format('RazaoSocialRemetente=%s', [Remetente.RazaoSocial]));
  ArquivoTx2.Add(Format('QuantidadeRps=%d', [Config.QuantidadeRps]));
  ArquivoTx2.Add(Format('CodigoCidadeRemetente=%s', [Remetente.CodigoCidade]));
  ArquivoTx2.Add(Format('Transacao=%s', [BoolToStr(Config.Transacao, True)]));
  ArquivoTx2.Add(Format('DataInicio=%s', [FormatDateTime('YYYY-MM-DD', Config.DataInicio)]));
  ArquivoTx2.Add(Format('DataFim=%s', [FormatDateTime('YYYY-MM-DD', Config.DataFim)]));
  ArquivoTx2.Add(Format('Versao=%s', [Config.Versao]));
  ArquivoTx2.Add(Format('MetodoEnvio=%s', [Config.MetodoEnvio]));
  ArquivoTx2.Add(Format('ValorTotalServicos=%s', [ FloatToString( ValorTotalServicos)]));
  ArquivoTx2.Add(Format('ValorTotalDeducoes=%s', [ FloatToString( ValorTotalDeducoes)]));
  ArquivoTx2.Add(Format('ValorTotalBaseCalculo=%s', [ FloatToString( ValorTotalBaseCalculo)]));
  ArquivoTx2.Add('SALVAR');

  for i := 0 to FListaNfse.Count - 1 do
  begin
    lNfse:= FListaNfse.Items[i] as TNfseInfo;

    ArquivoTx2.Add('');
    ArquivoTx2.Add('INCLUIRRPS');
    if lNfse.InformacoesRPS.IdRps <> 0 then
      ArquivoTx2.Add(Format('IdRps=%d', [ lNfse.InformacoesRPS.IdRps ]))
    else
      ArquivoTx2.Add('IdRps=');

    ArquivoTx2.Add(Format('NumeroRps=%s', [lNfse.InformacoesRPS.NumeroRps]));
    ArquivoTx2.Add(Format('SerieRps=%s', [lNfse.InformacoesRPS.SerieRps]));
    ArquivoTx2.Add(Format('TipoRps=%s', [lNfse.InformacoesRPS.TipoRps]));
    ArquivoTx2.Add(Format('DataEmissao=%s', [ReplaceStr(FormatDateTime('YYYY-MM-DD HH:MM:SS', lNfse.InformacoesRPS.DataEmissao), ' ', 'T')]));
    ArquivoTx2.Add(Format('OptanteSimplesNacional=%d', [lNfse.InformacoesRPS.OptanteSimplesNacional]));
    ArquivoTx2.Add(Format('IncentivadorCultural=%d', [lNfse.InformacoesRPS.IncentivadorCultural]));
    ArquivoTx2.Add(Format('SituacaoNota=%d', [lNfse.InformacoesRPS.SituacaoNota]));
    ArquivoTx2.Add(Format('TipoTributacao=%d', [lNfse.InformacoesRPS.TipoTributacao]));
    ArquivoTx2.Add(Format('NaturezaTributacao=%d', [lNfse.InformacoesRPS.NaturezaTributacao]));
    ArquivoTx2.Add(Format('RegimeEspecialTributacao=%d', [lNfse.InformacoesRPS.RegimeEspecialTributacao]));
    ArquivoTx2.Add(Format('NumeroRpsSubstituido=%s', [lNfse.InformacoesRPS.NumeroRpsSubstituido]));
    ArquivoTx2.Add(Format('SerieRpsSubstituido=%s', [lNfse.InformacoesRPS.SerieRpsSubstituido]));
    ArquivoTx2.Add(Format('TipoRpsSubstituido=%s', [lNfse.InformacoesRPS.TipoRpsSubstituido]));
    ArquivoTx2.Add(Format('ValorServicos=%s', [ FloatToString(lNfse.Servico.ValorServicos)]));
    ArquivoTx2.Add(Format('ValorDeducoes=%s', [ FloatToString(lNfse.Servico.ValorDeducoes)]));
    ArquivoTx2.Add(Format('ValorPis=%s', [FloatToString(lNfse.Imposto.ValorPis)]));
    ArquivoTx2.Add(Format('ValorCofins=%s', [FloatToString(lNfse.Imposto.ValorCofins)]));
    ArquivoTx2.Add(Format('ValorInss=%s', [FloatToString(lNfse.Imposto.ValorInss)]));
    ArquivoTx2.Add(Format('ValorIr=%s', [FloatToString(lNfse.Imposto.ValorIr)]));
    ArquivoTx2.Add(Format('ValorCsll=%s', [FloatToString(lNfse.Imposto.ValorCsll)]));
    ArquivoTx2.Add(Format('IssRetido=%d', [lNfse.Imposto.IssRetido]));
    ArquivoTx2.Add(Format('ValorIss=%s', [FloatToString(lNfse.Imposto.ValorIss)]));
    ArquivoTx2.Add(Format('ValorIssRetido=%s', [FloatToString(lNfse.Imposto.ValorIssRetido)]));
    ArquivoTx2.Add(Format('BaseCalculo=%s', [FloatToString(lNfse.Imposto.BaseCalculo)]));
    ArquivoTx2.Add(Format('ValorLiquidoNfse=%s', [FloatToString(lNfse.Imposto.ValorLiquidoNfse)]));
    ArquivoTx2.Add(Format('DescontoIncondicionado=%s', [FloatToString(lNfse.Imposto.DescontoIncondicionado)]));
    ArquivoTx2.Add(Format('DescontoCondicionado=%s', [FloatToString(lNfse.Imposto.DescontoCondicionado)]));
    ArquivoTx2.Add(Format('AliquotaISS=%s', [FloatToString(lNfse.Imposto.AliquotaISS)]));
    ArquivoTx2.Add(Format('AliquotaPIS=%s', [FloatToString(lNfse.Imposto.AliquotaPIS)]));
    ArquivoTx2.Add(Format('AliquotaCOFINS=%s', [FloatToString(lNfse.Imposto.AliquotaCOFINS)]));
    ArquivoTx2.Add(Format('AliquotaINSS=%s', [FloatToString(lNfse.Imposto.AliquotaINSS)]));
    ArquivoTx2.Add(Format('AliquotaIR=%s', [FloatToString(lNfse.Imposto.AliquotaIR)]));
    ArquivoTx2.Add(Format('AliquotaCSLL=%s', [FloatToString(lNfse.Imposto.AliquotaCSLL)]));
    ArquivoTx2.Add(Format('CodigoItemListaServico=%s', [lNfse.Servico.CodigoItemListaServico]));
    ArquivoTx2.Add(Format('CodigoCnae=%s', [lNfse.Servico.CodigoCnae]));
    ArquivoTx2.Add(Format('CodigoTributacaoMunicipio=%s', [lNfse.Servico.CodigoTributacaoMunicipio]));
    ArquivoTx2.Add(Format('DiscriminacaoServico=%s', [lNfse.Servico.DiscriminacaoServico]));
    ArquivoTx2.Add(Format('CodigoCidadePrestacao=%s', [lNfse.Servico.CodigoCidadePrestacao]));
    ArquivoTx2.Add(Format('DescricaoCidadePrestacao=%s', [lNfse.Servico.DescricaoCidadePrestacao]));
    ArquivoTx2.Add('');
    ArquivoTx2.Add(Format('CpfCnpjPrestador=%s', [lNfse.Prestador.CpfCnpjPrestador]));
    ArquivoTx2.Add(Format('InscricaoMunicipalPrestador=%s', [lNfse.Prestador.InscricaoMunicipalPrestador]));
    ArquivoTx2.Add(Format('RazaoSocialPrestador=%s', [lNfse.Prestador.RazaoSocialPrestador]));
    ArquivoTx2.Add(Format('DDDPrestador=%s', [lNfse.Prestador.DDDPrestador]));
    ArquivoTx2.Add(Format('TelefonePrestador=%s', [lNfse.Prestador.TelefonePrestador]));
    ArquivoTx2.Add('');
    ArquivoTx2.Add(Format('CpfCnpjTomador=%s', [lNfse.Tomador.CpfCnpjTomador]));
    ArquivoTx2.Add(Format('RazaoSocialTomador=%s', [lNfse.Tomador.RazaoSocialTomador]));
    ArquivoTx2.Add(Format('InscricaoMunicipalTomador=%s', [lNfse.Tomador.InscricaoMunicipalTomador]));
    ArquivoTx2.Add(Format('InscricaoEstadualTomador=%s', [lNfse.Tomador.InscricaoEstadualTomador]));
    ArquivoTx2.Add(Format('TipoLogradouroTomador=%s', [lNfse.Tomador.TipoLogradouroTomador]));
    ArquivoTx2.Add(Format('EnderecoTomador=%s', [lNfse.Tomador.EnderecoTomador]));
    ArquivoTx2.Add(Format('NumeroTomador=%s', [lNfse.Tomador.NumeroTomador]));
    ArquivoTx2.Add(Format('ComplementoTomador=%s', [lNfse.Tomador.ComplementoTomador]));
    ArquivoTx2.Add(Format('TipoBairroTomador=%s', [lNfse.Tomador.TipoBairroTomador]));
    ArquivoTx2.Add(Format('BairroTomador=%s', [lNfse.Tomador.BairroTomador]));
    ArquivoTx2.Add(Format('CodigoCidadeTomador=%s', [lNfse.Tomador.CodigoCidadeTomador]));
    ArquivoTx2.Add(Format('DescricaoCidadeTomador=%s', [lNfse.Tomador.DescricaoCidadeTomador]));
    ArquivoTx2.Add(Format('UfTomador=%s', [lNfse.Tomador.UfTomador]));
    ArquivoTx2.Add(Format('CepTomador=%s', [lNfse.Tomador.CepTomador]));
    ArquivoTx2.Add(Format('DDDTomador=%s', [lNfse.Tomador.DDDTomador]));
    ArquivoTx2.Add(Format('TelefoneTomador=%s', [lNfse.Tomador.TelefoneTomador]));
    ArquivoTx2.Add(Format('EmailTomador=%s', [lNfse.Tomador.EmailTomador]));
    ArquivoTx2.Add(Format('RazaoSocialIntermediario=%s', [lNfse.Intermediario.RazaoSocialIntermediario]));
    ArquivoTx2.Add('');
    ArquivoTx2.Add(Format('CpfCnpjIntermediario=%s', [lNfse.Intermediario.CpfCnpjIntermediario]));
    ArquivoTx2.Add(Format('InscricaoMunicipalIntermediario=%s', [lNfse.Intermediario.InscricaoMunicipalIntermediario]));
    ArquivoTx2.Add('');
    ArquivoTx2.Add(Format('NumeroNfseSubstituida=%s', [lNfse.OutrasInformacoes.NumeroNfseSubstituida]));

    if lNfse.OutrasInformacoes.DataEmissaoNfseSubstituida = 0 then
      ArquivoTx2.Add('DataEmissaoNfseSubstituida=')
    else
      ArquivoTx2.Add(Format('DataEmissaoNfseSubstituida=%s', [ FormatDateTime('YYYY-MM-DD', lNfse.OutrasInformacoes.DataEmissaoNfseSubstituida)]));

    ArquivoTx2.Add(Format('SeriePrestacao=%s', [lNfse.OutrasInformacoes.SeriePrestacao]));
    ArquivoTx2.Add(Format('MotCancelamento=%s', [lNfse.OutrasInformacoes.MotCancelamento]));
    ArquivoTx2.Add(Format('Operacao=%s', [lNfse.OutrasInformacoes.Operacao]));
    ArquivoTx2.Add(Format('CodigoObra=%s', [lNfse.OutrasInformacoes.CodigoObra]));
    ArquivoTx2.Add(Format('Art=%s', [lNfse.OutrasInformacoes.Art]));
    ArquivoTx2.Add(Format('DeducaoPor=%s', [lNfse.OutrasInformacoes.DeducaoPor]));
    ArquivoTx2.Add(Format('TipoDeducao=%s', [lNfse.OutrasInformacoes.TipoDeducao]));
    ArquivoTx2.Add(Format('CPFCNPJReferencia=%s', [lNfse.OutrasInformacoes.CPFCNPJReferencia]));
    ArquivoTx2.Add(Format('NumeroNfReferencia=%s', [lNfse.OutrasInformacoes.NumeroNfReferencia]));
    if lNfse.OutrasInformacoes.ValorTotalReferencia = 0 then
      ArquivoTx2.Add('ValorTotalReferencia=')
    else
      ArquivoTx2.Add(Format('ValorTotalReferencia=%s', [ FloatToString( lNfse.OutrasInformacoes.ValorTotalReferencia )]));

    if lNfse.OutrasInformacoes.PercentualDeduzir = 0 then
      ArquivoTx2.Add('PercentualDeduzir=')
    else
      ArquivoTx2.Add(Format('PercentualDeduzir=%s', [ FloatToString( lNfse.OutrasInformacoes.PercentualDeduzir )]));

    if lNfse.OutrasInformacoes.QuantidadeServicos = 0 then
      ArquivoTx2.Add('QuantidadeServicos=')
    else
      ArquivoTx2.Add(Format('QuantidadeServicos=%d', [ lNfse.OutrasInformacoes.QuantidadeServicos ]));

    if lNfse.OutrasInformacoes.ValorUnitarioServico = 0 then
      ArquivoTx2.Add('ValorUnitarioServico=')
    else
      ArquivoTx2.Add(Format('ValorUnitarioServico=%s', [ FloatToString( lNfse.OutrasInformacoes.ValorUnitarioServico )]));

    if lNfse.OutrasInformacoes.Tributavel = 0 then
      ArquivoTx2.Add('Tributavel=')
    else
      ArquivoTx2.Add(Format('Tributavel=%d', [ lNfse.OutrasInformacoes.Tributavel ]));

    if lNfse.OutrasInformacoes.IdentificadorSistemaLegado = 0 then
      ArquivoTx2.Add('IdentificadorSistemaLegado=')
    else
      ArquivoTx2.Add(Format('IdentificadorSistemaLegado=%d', [ lNfse.OutrasInformacoes.IdentificadorSistemaLegado ]));

    ArquivoTx2.Add(Format('TipoCodificacao=%s', [lNfse.OutrasInformacoes.TipoCodificacao]));
    ArquivoTx2.Add(Format('Assinatura=%s', [lNfse.OutrasInformacoes.Assinatura]));
    ArquivoTx2.Add(Format('NumEmissorRps=%s', [lNfse.OutrasInformacoes.NumEmissorRps]));
    ArquivoTx2.Add(Format('TipoDocumentoTomador=%s', [lNfse.OutrasInformacoes.TipoDeducao]));
    ArquivoTx2.Add(Format('DescricaoDocumentoTomador=%s', [lNfse.OutrasInformacoes.DescricaoDocumentoTomador]));
    ArquivoTx2.Add(Format('CidadeEstrangeiraTomador=%s', [lNfse.OutrasInformacoes.CidadeEstrangeiraTomador]));
    ArquivoTx2.Add(Format('PaisTomador=%d', [lNfse.OutrasInformacoes.PaisTomador]));
    ArquivoTx2.Add(Format('CodigoSubItemListaServico=%s', [lNfse.OutrasInformacoes.CodigoSubItemListaServico]));
    ArquivoTx2.Add(Format('JustificativaDeducao=%s', [lNfse.OutrasInformacoes.JustificativaDeducao]));

    if lNfse.OutrasInformacoes.ValorIssServico = 0 then
      ArquivoTx2.Add('ValorIssServico=')
    else
      ArquivoTx2.Add(Format('ValorIssServico=%s', [ FloatToString( lNfse.OutrasInformacoes.ValorIssServico )]));

    ArquivoTx2.Add(Format('ExigibilidadeISS=%d', [lNfse.OutrasInformacoes.ExigibilidadeISS]));
    ArquivoTx2.Add(Format('MunicipioIncidencia=%s', [lNfse.OutrasInformacoes.MunicipioIncidencia]));
    ArquivoTx2.Add(Format('IncentivoFiscal=%d', [lNfse.OutrasInformacoes.IncentivoFiscal]));
    ArquivoTx2.Add(Format('Competencia=%s', [ FormatDateTime('YYYY-MM-DD', lNfse.OutrasInformacoes.Competencia )]));

    if lNfse.OutrasInformacoes.CodigoPais = 0 then
      ArquivoTx2.Add('CodigoPais=')
    else
      ArquivoTx2.Add(Format('CodigoPais=%d', [ lNfse.OutrasInformacoes.CodigoPais ]));

    ArquivoTx2.Add(Format('ResponsavelRetencao=%s', [lNfse.OutrasInformacoes.ResponsavelRetencao]));
    ArquivoTx2.Add('SALVARRPS');
  end;
end;

function TNfse.PedirParametrosExtras(
var aParametrosExtras: string; const aOperacao: string): boolean;

begin
  Result := True;
//  if ckbModoAvancado.Checked then
//  begin
//    aParametrosExtras := LerIni(spdNFSe.Cidade, aOperacao + '_Extras');
//    Result := InputQuery('Informe os parâmetros extras:',
//      'Informe os parâmetros extras separados por ponto-e-vírgula, caso sejam necessários. '#13+
//      'Em caso contrário, apenas clique em OK.',
//      aParametrosExtras);
//  end
//  else
//    aParametrosExtras := '';
end;

procedure TNfse.EnvioSincrono(const NomeArquivo: string);
var
  _XML, _Extras: string;
  _Ret : IspdRetEnvioSincronoNFSe;
  lLogXml : TStringList;
  lArquivoXml : TStringList;
begin
  lLogXml:= TStringList.Create;
  lArquivoXml:= TStringList.Create;
  try
    try
      lArquivoXml.LoadFromFile(NomeArquivo);
      _Extras := '';
      if PedirParametrosExtras(_Extras, 'Enviar') then
      begin
        _XML:= ProxyNFSe.EnviarSincrono(lArquivoXml.Text, _Extras);
        lLogXml.LoadFromFile(FLogEnvio);

        _Ret := spdNFSeConverterX.ConverterRetEnvioSincronoNFSeTipo(lLogXml.Text);
        getRetornoEnvioSincrno(_Ret);

//        if Pos('-1;', lArquivoXml.Text) > 0 then
//        begin
//          mmoRetorno.Font.Color := clRed;
//          mmoRetorno.Text := 'Envio de RPS no modo Síncrono sem sucesso.'  +
//            ' A resposta do servidor está gravada no arquivo de log localizado em: '+
//            copy(lArquivoXml.Text, 4, (length(lArquivoXml.Text )-2));
//        end;
      end;
    finally
      _Ret := nil;
      FreeAndNil(lLogXml);
      FreeAndNil(lArquivoXml);
    end;
  except
    raise;
  end;
end;

procedure TNfse.getRetornoEnvioSincrno(const aRet: IspdRetEnvioSincronoNFSe);
var
  i : integer;
begin
  if aRet.Status = 1 then
    Retorno.Add('Status: EMPROCESSAMENTO')
  else
    if aRet.Status = 2 then
    begin
      Retorno.Add('Status: ERRO');
      Retorno.Add('Motivo: ' + aRet.Motivo);
    end
    else
    begin
      for i := 0 to aRet.ListaDeNFes.Count - 1 do
      begin
        Retorno.Add('Status: SUCESSO');
        Retorno.Add('CNPJ: ' + aRet.ListaDeNFes.Item(i).Cnpj);
        Retorno.Add('Inscricao Municipal: ' + aRet.ListaDeNFes.Item(i).InscMunicipal);
        Retorno.Add('Serie do RPS: ' + aRet.ListaDeNFes.Item(i).SerieRps);
        Retorno.Add('Número do RPS: ' + aRet.ListaDeNFes.Item(i).NumeroRps);
        Retorno.Add('Número da NFS-e: ' + aRet.ListaDeNFes.Item(i).NumeroNFSe);
        Retorno.Add('Data de Emissão: ' + aRet.ListaDeNFes.Item(i).DataEmissaoNFSe);
        Retorno.Add('Código de Verificação: ' + aRet.ListaDeNFes.Item(i).CodVerificacao);
        Retorno.Add('Situação: ' + aRet.ListaDeNFes.Item(i).Situacao);
        Retorno.Add('Data De Cancelamento: ' + aRet.ListaDeNFes.Item(i).DataCancelamento);
        Retorno.Add('Chave de Cancelamento: ' + aRet.ListaDeNFes.Item(i).ChaveCancelamento);
        Retorno.Add('Tipo: ' + aRet.ListaDeNFes.Item(i).Tipo);
        Retorno.Add('Motivo: ' + aRet.ListaDeNFes.Item(i).Motivo);
        Retorno.Add('XML: ' + aRet.ListaDeNFes.Item(i).Xml);

        Retorno.Add('');
        Retorno.Add('================================================');
        Retorno.Add('');
      end;
    end;
end;

procedure TNfse.EnvioAssincrono(const NomeArquivo: string;var AProtocolo: string);
var
  _Extras: string;
  lLogXml : TStringList;
  lArquivoXml : TStringList;
  _Ret : IspdRetEnvioNFSe;
begin
  lLogXml := TStringList.Create;
  lArquivoXml:= TStringList.Create;
  try
    try
      _Extras := '';
      lArquivoXml.LoadFromFile(NomeArquivo);
      if PedirParametrosExtras(_Extras, 'Enviar') then
      begin
        AProtocolo := ProxyNFSe.Enviar(lArquivoXml.Text, _Extras);
        lArquivoXml.Text := AProtocolo;

        lLogXml.LoadFromFile(FLogEnvio);
        _Ret := spdNFSeConverterX.ConverterRetEnvioNFSeTipo(lLogXml.Text);

        if Pos('-1;', AProtocolo) = 0 then
          Retorno.Add('Protocolo: ' + AProtocolo)
        else
          begin
            //mmoRetorno.Font.Color := clRed;
            Retorno.Add('Envio de RPS sem sucesso.'  +
              ' A resposta do servidor está gravada no arquivo de log localizado em: '+
              copy(AProtocolo, 4, (length(AProtocolo )-2)));
            Retorno.Add('');
            Retorno.Add('================================================');
            Retorno.Add('');
          end;
      end;
    finally
      lLogXml.Free;
      _Ret := nil;
    end;
  except
    raise;
  end;
end;

procedure TNfse.Processar();
var
  i: Integer;
  lFileName: string;
  lExtras: string;
  _Extras: String;
  lProtocolo: string;
  lXMLGerado: string;
  ArquivoTx2: TStringList;
  ArquivoXML: TStringList;
begin
  try
    ArquivoXML:= TStringList.Create;
    ProxyNFSe:= TspdProxyNFSe.Create(self);
    spdNFSe:= TspdNFSe.Create(self);
    spdNFSeConverterX:= TspdNFSeConverterX.Create(Self);

    _Extras := '';
    ArquivoTx2:= TStringList.Create;
    CriarArquivoTx2( ArquivoTx2 );

    if OpcaoDesenvolvedor() then
    begin
      lFileName:= Config.DiretorioImpressao + 'TX2';
      if not DirectoryExists(lFileName) then
        ForceDirectories(lFileName);

      lFileName:= lFileName + '\_ArquivoRPS'+ FormatDateTime('yyyymmddhhmmsszzz', Now) + '.Tx2';
    end
    else
      lFileName:= RetornarTempDir() + '_ArquivoRPS'+ FormatDateTime('yyyymmddhhmmsszzz', Now) + '.Tx2';

    //Aqui eu salvo num diretório temporário
    ArquivoTx2.SaveToFile(lFileName);

    LoadConfig();
    lExtras:= EmptyStr;
    for I := 0 to Config.Parametros.Count - 1 do
    begin
      if lExtras = EmptyStr then
        lExtras := Config.Parametros.Strings[i]
      else
        lExtras := lExtras + ';' + Config.Parametros.Strings[i];
    end;

    //Aqui faço a conversão de tx2 para xml
    ArquivoXML.Text:= spdNFSeConverterX.ConverterEnvioNFSe(lFileName, lExtras);

    if Config.CertificadoDigital <> '' then
      ArquivoXML.Text := ProxyNFSe.Assinar(ArquivoXML.Text, _Extras);

//    lNome_Arquivo := Config.DiretorioImpressao + '\NF_ELETRONICA_'+ FormatDateTime('MM_YYYY', Config.DataFim)+ onfig. +'_'+
//      GerarArquivo.FieldByName('NUMERO_LOTE_RPS').AsString+'_'+lSistema+'.xml';

    ArquivoXML.SaveToFile(Nome_Arquivo);
    if not Config.GerarSomenteXML then
    begin
      if FEnvioSincrono then
        EnvioSincrono(Nome_Arquivo)
      else
        EnvioAssincrono(Nome_Arquivo, lProtocolo);

      //Aguarda 1 segundos
      Sleep(1000);
//      if Pos('-1;', lProtocolo) = 0 then
//        begin
//          InserirNotaFiscalLog(lListaDeNotas, lProtocolo);
//          lListaDeNotas.Clear;
//        end
//      else
//        FListaNotasComErros.Add(GerarArquivo.FieldByName('SEQ_NOTA').AsString);
//
//      //Formato Xml e Salvo
      lXMLGerado := ReformatXml(ArquivoXML.Text);
      ArquivoXML.Clear;
      ArquivoXML.Text:= lXMLGerado;
      ArquivoXML.SaveToFile(Nome_Arquivo);
    end;
  finally
    FreeAndNil(ArquivoTx2);
    FreeAndNil( spdNFSe );
    FreeAndNil( ProxyNFSe );
    FreeAndNil( spdNFSeConverterX );

    if FileExists(lFileName) and not OpcaoDesenvolvedor() then
      DeleteFile(lFileName);
  end;
end;

procedure TNfse.SetConfig(const Value: TConfiguracao);
begin
  FConfig := Value;
end;

procedure TNfse.SetIdLote(const Value: Integer);
begin
  FIdLote := Value;
end;

procedure TNfse.SetListaNotasComErros(const Value: TStringList);
begin
  FListaNotasComErros.Assign(value);
end;

procedure TNfse.SetNfse(const Value: TNfseInfo);
begin
  FNfse := Value;
end;

procedure TNfse.SetNome_Arquivo(const Value: string);
begin
  FNome_Arquivo := Value;
end;

procedure TNfse.SetNumeroLote(const Value: Integer);
begin
  FNumeroLote := Value;
end;

procedure TNfse.SetRemetente(const Value: TRemetente);
begin
  FRemetente := Value;
end;

procedure TNfse.SetRetorno(const Value: TStringList);
begin
  FRetorno.Assign(value);
end;

procedure TNfse.SetValorTotalBaseCalculo(const Value: Double);
begin
  FValorTotalBaseCalculo := Value;
end;

procedure TNfse.SetValorTotalDeducoes(const Value: Double);
begin
  FValorTotalDeducoes := Value;
end;

procedure TNfse.SetValorTotalServicos(const Value: Double);
begin
  FValorTotalServicos := Value;
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

{ TNfseInfo }

function TNfseInfo.Add: TNfseInfo;
begin
  Result:= TNfseInfo.Create;
end;

procedure TNfseInfo.AfterConstruction;
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

procedure TNfseInfo.BeforeDestruction;
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

procedure TNfseInfo.SetImposto(const Value: TImposto);
begin
  FImposto := Value;
end;

procedure TNfseInfo.SetInformacoesRPS(const Value: TInformacoesRPS);
begin
  FInformacoesRPS := Value;
end;

procedure TNfseInfo.SetIntermediario(const Value: TIntermediario);
begin
  FIntermediario := Value;
end;

procedure TNfseInfo.SetOutrasInformacoes(const Value: TOutrasInformacoes);
begin
  FOutrasInformacoes := Value;
end;

procedure TNfseInfo.SetPrestador(const Value: TPrestador);
begin
  FPrestador := Value;
end;

procedure TNfseInfo.SetServico(const Value: TServico);
begin
  FServico := Value;
end;

procedure TNfseInfo.SetTomador(const Value: TTomador);
begin
  FTomador := Value;
end;

{ TConfiguracao }

procedure TConfiguracao.AfterConstruction;
begin
  inherited;
  FParametros:= TStringList.Create;
end;

procedure TConfiguracao.BeforeDestruction;
begin
  inherited;
  FreeAndNil( FParametros );
end;

procedure TConfiguracao.SetCertificadoDigital(const Value: string);
begin
  FCertificadoDigital := Value;
end;

procedure TConfiguracao.SetCidade(const Value: String);
begin
  FCidade := Value;
end;

procedure TConfiguracao.SetCnpj(const Value: String);
begin
  FCnpj := Value;
end;

procedure TConfiguracao.SetCNPJSoftwareHouse(const Value: String);
begin
  FCNPJSoftwareHouse := Value;
end;

procedure TConfiguracao.SetCodigoMunicipio(const Value: String);
begin
  FCodigoMunicipio := Value;
end;

procedure TConfiguracao.SetDataFim(const Value: TDate);
begin
  FDataFim := Value;
end;

procedure TConfiguracao.SetDataInicio(const Value: TDate);
begin
  FDataInicio := Value;
end;

procedure TConfiguracao.SetDiretorioEsquemas(const Value: String);
begin
  FDiretorioEsquemas := Value;
end;

procedure TConfiguracao.SetDiretorioImpressao(const Value: String);
begin
  FDiretorioImpressao := Value;
end;

procedure TConfiguracao.SetDiretorioNfse(const Value: String);
begin
  FDiretorioNfse := Value;
end;

procedure TConfiguracao.SetDiretorioScripts(const Value: String);
begin
  FDiretorioScripts := Value;
end;

procedure TConfiguracao.SetDiretorioTemplates(const Value: String);
begin
  FDiretorioTemplates := Value;
end;

procedure TConfiguracao.SetGerarSomenteXML(const Value: Boolean);
begin
  FGerarSomenteXML := Value;
end;

procedure TConfiguracao.SetInscricaoMunicipal(const Value: String);
begin
  FInscricaoMunicipal := Value;
end;

procedure TConfiguracao.SetMetodoEnvio(const Value: String);
begin
  FMetodoEnvio := Value;
end;

procedure TConfiguracao.SetParametros(const Value: TStringList);
begin
  FParametros.Assign(value);
end;

procedure TConfiguracao.SetQuantidadeRps(const Value: Integer);
begin
  FQuantidadeRps := Value;
end;

procedure TConfiguracao.SetTokenSoftHouse(const Value: String);
begin
  FTokenSoftHouse := Value;
end;

procedure TConfiguracao.SetTransacao(const Value: Boolean);
begin
  FTransacao := Value;
end;

procedure TConfiguracao.SetVersao(const Value: string);
begin
  FVersao := Value;
end;

{ TRemetente }

procedure TRemetente.SetCodigoCidade(const Value: String);
begin
  FCodigoCidade := Value;
end;

procedure TRemetente.SetCpfCnpj(const Value: string);
begin
  FCpfCnpj := Value;
end;

procedure TRemetente.SetInscricaoMunicipal(const Value: string);
begin
  FInscricaoMunicipal := Value;
end;

procedure TRemetente.SetRazaoSocial(const Value: string);
begin
  FRazaoSocial := Value;
end;

end.
