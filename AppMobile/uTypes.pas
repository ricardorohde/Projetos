unit uTypes;

interface

const

  VB_YES = '1';
  VB_NO = '0';

  MS_SFA_ACTIVED = 0;
  MS_SFA_LOG_PATH = 1;
  MS_SFA_UPLOAD_SCHEDULE_TYPE = 2;
  MS_SFA_LAST_UPLOAD = 3;
  MS_SFA_NEXT_UPLOAD = 4;
  MS_SFA_UPLOAD_PATH = 5;
  MS_SFA_DOWNLOAD_SCHEDULE_TYPE = 6;
  MS_SFA_DOWNLOAD_PATH = 7;
  MS_SFA_LAST_DOWNLOAD = 8;
  MS_SFA_NEXT_DOWNLOAD = 9;
  MS_SFA_COMPANIES_LIST = 10;

  // definindo as constantes dos arquivos de configuracao do sistema
  // FN_CONFIGURATIONS = 'IMPACTO.INI';
  FN_CONFIGURATIONS = 'APPSERVER.INI';
  FN_CONNECTIONS = 'DBXCONNECTIONS.INI';
  FN_DRIVERS = 'DBXDRIVERS.INI';

type

  TUSerStatus = (usOnLine, usLocked, usDisconnected, usOffLine, usNone);

  TUStringArray = array of String;

  TMsgType = (mtInfo, mtError);

  TEntityOwner = record
    Name: String;
    Company: String;
    Branch: String;
  end;

  TImposto = record
    Aliquota: Single;
    Base: Currency;
    Valor: Currency;
    Retencao: Boolean;
  end;

  // Variaveis para calcula do IPI
  TIPI = record
    Calcula: String;
    Aliquota: Single;
    Despesas: String;
    Frete: String;
    Seguro: String;
    Desconto: String;
    II: String;
    Reducao: Single;
    AgregaValor: String;
    Importacao: Boolean;
    CST: String;
  end;

  // Variaveis para calcula do ICMS
  TICMS = record
    Calcula: String;
    Aliquota: Single;
    Despesas: String;
    Frete: String;
    Seguro: String;
    Desconto: String;
    II: String;
    IPI: String;
    PISApuracao: String;
    COFINSApuracao: String;
    Reducao: Single;
    AgregaValor: String;
    Importacao: Boolean;
    CST: String;
    CSOSN: String;
    OrigemST: String;
  end;

  TICMSDiferido = record
    Calcula: String;
    Aliquota: Single;
  end;

  TICMSFCP = record
    Calcula: String;
    Aliquota: Single;
    AliquotaICMSInternaOrigem: Single;
  end;

  TICMSPUFD = record
    Calcula: String;
    Aliquota: Single;
    AliquotaICMSInternaOrigem: Single;
  end;

  TICMSPUFO = record
    Calcula: String;
    Aliquota: Single;
    AliquotaICMSInternaOrigem: Single;
  end;

  // Variaveis para calcula do ICMS Substituicao Tributaria
  TICMSST = record
    Calcula: String;
    Aliquota: Single;
    Despesas: String;
    Frete: String;
    Seguro: String;
    Desconto: String;
    II: String;
    IPI: String;
    PISApuracao: String;
    COFINSApuracao: String;
    Reducao: Single;
    Tipo: String;
    AgregaValor: String;
    Importacao: Boolean;
  end;

  // Variaveis para calcula do ISS
  TISS = record
    Calcula: String;
    Aliquota: Single;
    Despesas: String;
    Frete: String;
    Seguro: String;
    Desconto: String;
    Reducao: Single;
    Recolhe: String;
    Importacao: Boolean;
  end;

  // Variaveis para calcula do PIS - Apuração
  TPISApuracao = record
    Calcula: String;
    Aliquota: Single;
    Despesas: String;
    Frete: String;
    Seguro: String;
    Desconto: String;
    ICMSST: String;
    Reducao: Single;
    AgregaValor: String;
    Importacao: Boolean;
    CST: String;
  end;

  // Variaveis para calcula do COFINS - Apuração
  TCOFINSApuracao = record
    Calcula: String;
    Aliquota: Single;
    Despesas: String;
    Frete: String;
    Seguro: String;
    Desconto: String;
    ICMSST: String;
    Reducao: Single;
    AgregaValor: String;
    Importacao: Boolean;
    CST: String;
  end;

  // Variaveis para calcula do PIS - Retenção
  TPISRetencao = record
    Calcula: String;
    Aliquota: Single;
    Despesas: String;
    Frete: String;
    Seguro: String;
    Desconto: String;
    Reducao: Single;
    Recolhe: String;
    Importacao: Boolean;
  end;

  // Variaveis para calcula do COFINS - Retenção
  TCOFINSRetencao = record
    Calcula: String;
    Aliquota: Single;
    Despesas: String;
    Frete: String;
    Seguro: String;
    Desconto: String;
    Reducao: Single;
    Recolhe: String;
    Importacao: Boolean;
  end;

  // Variaveis para calcula do CSLL - Retenção
  TCSLLRetencao = record
    Calcula: String;
    Aliquota: Single;
    Despesas: String;
    Frete: String;
    Seguro: String;
    Desconto: String;
    Reducao: Single;
    Recolhe: String;
    Importacao: Boolean;
  end;

  // Variaveis para calcula do INSS
  TINSS = record
    Calcula: String;
    Aliquota: Single;
    Despesas: String;
    Frete: String;
    Seguro: String;
    Desconto: String;
    Reducao: Single;
    Recolhe: String;
    Importacao: Boolean;
  end;

  // Variaveis para calcula do IRRF
  TIRRF = record
    Calcula: String;
    Aliquota: Single;
    Despesas: String;
    Frete: String;
    Seguro: String;
    Desconto: String;
    Reducao: Single;
    Recolhe: String;
    Importacao: Boolean;
  end;

  // Variaveis para calcula do FGTS
  TFGTS = record
    Calcula: String;
    Aliquota: Single;
    Despesas: String;
    Frete: String;
    Seguro: String;
    Desconto: String;
    Reducao: Single;
    Importacao: Boolean;
  end;

  // Variaveis para calcular o II
  TII = record
    Calcula: String;
    Aliquota: Single;
    Despesas: String;
    Frete: String;
    Seguro: String;
    Desconto: String;
    Reducao: Single;
    AgregaValor: String;
    Importacao: Boolean;
  end;

  TTributos = record
    Calcula: String;
    Aliquota: Single;
  end;

  TComissao = record
    Aliquota: Single;
    Base: Currency;
    Valor: Currency;
  end;

  TRegrasComissao = record
    Carregado: Boolean;
    TipoCalculo: String;
    ConsideraDespesas: String;
    ConsideraFrete: String;
    ConsideraSeguro: String;
    ConsideraDesconto: String;
    ConsideraIPI: String;
    ConsideraICMS: String;
    ConsideraICMSST: String;
    ConsideraISS: String;
    ComissaoVendedor: Single;
    GrupoFaixa: Integer;
    HabilitaPrecos: String;
  end;

  TValores = record
    BaseItem: Double;
    ValorMercadorias: Currency;
    ValorDespesas: Currency;
    ValorFrete: Currency;
    ValorSeguro: Currency;
    Desconto: Single;
    ValorDesconto: Currency;
    Comissao: Single;
    BaseComissao: Currency;
    ValorComissao: Currency;
    ValorFinanceiro: Currency;
    Volumes: Single;
    ValorBruto: Currency;
    ValorLiquido: Currency;
    IPI: TImposto;
    ICMS: TImposto;
    ICMSDiferido: TImposto;
    ICMSFCP: TImposto;
    ICMSPUFD: TImposto;
    ICMSPUFO: TImposto;
    ICMSST: TImposto;
    ISSApuracao: TImposto;
    ISSRetencao: TImposto;
    ISS: TImposto;
    PISApuracao: TImposto;
    COFINSApuracao: TImposto;
    PISRetencao: TImposto;
    COFINSRetencao: TImposto;
    CSLLRetencao: TImposto;
    INSSApuracao: TImposto;
    INSSRetencao: TImposto;
    INSS: TImposto;
    IRRFApuracao: TImposto;
    IRRFRetencao: TImposto;
    FGTS: TImposto;
    II: TImposto;
    Tributos: TImposto;
    PesoBruto: Single;
    PesoLiquido: Single;
    ValorMoeda: Currency;
    CustoTotal: Currency;
    MargemLucro: Single;
    ValorAlternativo: Currency end;

  type
    TSchedule = record
      Actived: String;
      LogPath: String;
      Branch: String;
      Company: String;
      State: String;
      Port: Integer;
      AtualizarEstoque: Integer;
      HoraPreco: TTime;
      DataHoraInicioImportacao: TDateTime;
      PrimeiraExecucao: Boolean;
    end;

    TExecType = (etUpLoad, etDownLoad);

implementation

end.
