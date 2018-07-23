//
// Created by the DataSnap proxy generator.
// 13/02/2016 10:36:28
//

unit uDSClientProxy;

interface

uses Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, DSProxy, System.SysUtils, Data.DB, Data.SqlExpr,
  Data.DBXDBReaders, System.Classes, Datasnap.DBClient, Data.DBXJSONReflect;

type
  TDSServerMethodsClient = class(TDSAdminClient)
  private
    FEchoStringCommand: TDBXCommand;
    FReverseStringCommand: TDBXCommand;
    FDoConnectionCommand: TDBXCommand;
    FGetDataBaseTablesCommand: TDBXCommand;
    FGetEntityOwnerCommand: TDBXCommand;
    FGetEntityNameCommand: TDBXCommand;
    FGetSQLStatementCommand: TDBXCommand;
    FSetUserCommand: TDBXCommand;
    FGetServerSectionsCommand: TDBXCommand;
    FGetSectionDisplayNameCommand: TDBXCommand;
    FGetSectionDebugClientProgramsCommand: TDBXCommand;
    FGetSectionConfigurationsCommand: TDBXCommand;
    FCheckSystemFilesCommand: TDBXCommand;
    FGetSystemDirectoryCommand: TDBXCommand;
    FSplitCommand: TDBXCommand;
    FGetActivedEnvCommand: TDBXCommand;
    FGetInactiveCustomsCommand: TDBXCommand;
    FGetLicenseInfCommand: TDBXCommand;
    FGetDaysToExpiresCommand: TDBXCommand;
    FIsLockedLicenseCommand: TDBXCommand;
    FIsValidCompanyLicenseCommand: TDBXCommand;
    FGetServerDateTimeCommand: TDBXCommand;
    FExecuteQueryCommand: TDBXCommand;
    FExecuteQueryByXMLCommand: TDBXCommand;
    FGetFormDefsCommand: TDBXCommand;
    FPutFormDefsCommand: TDBXCommand;
    FPutUserConfigurarionsCommand: TDBXCommand;
    FGetUserConfigurationsCommand: TDBXCommand;
    FGetUserThreadIdCommand: TDBXCommand;
    FObtemMoedaCommand: TDBXCommand;
    FSaveLocalDataSetCommand: TDBXCommand;
    FLoadLocalDataSetCommand: TDBXCommand;
    FSaveRemoteFileCommand: TDBXCommand;
    FSaveRemoteBinaryFileCommand: TDBXCommand;
    FLoadRemoteFileCommand: TDBXCommand;
    FLoadRemoteBinaryFileCommand: TDBXCommand;
    FRemoteFileExistsCommand: TDBXCommand;
    FDeleteRemoteFileCommand: TDBXCommand;
    FGetTipsCommand: TDBXCommand;
    FDiaUtilCommand: TDBXCommand;
    FGeraTitulosCommand: TDBXCommand;
    FRetornaTitulosCommand: TDBXCommand;
    FObtemReservaPedidoVendaCommand: TDBXCommand;
    FPegaSaldoInicialEstoqueCommand: TDBXCommand;
    FPegaSaldoInicialEstoqueLoteCommand: TDBXCommand;
    FPegaBaixasTituloCommand: TDBXCommand;
    FPegaSaldoBancarioCommand: TDBXCommand;
    FPegaLimiteCreditoBancarioCommand: TDBXCommand;
    FFechamentoEstoqueCommand: TDBXCommand;
    FTemBaixasPagarCommand: TDBXCommand;
    FAtualizaSerieNotaFiscalCommand: TDBXCommand;
    FConverteMoedaCommand: TDBXCommand;
    FPegaSaldoAtualEstoqueCommand: TDBXCommand;
    FExecuteSQLCommand: TDBXCommand;
    FReajustePrecosCommand: TDBXCommand;
    FRecalculoSaldosBancariosCommand: TDBXCommand;
    FFechamentoComissaoVendedorCommand: TDBXCommand;
    FRefazReservasCommand: TDBXCommand;
    FRefazAcumuladosCommand: TDBXCommand;
    FRefazSaldosTerceirosCommand: TDBXCommand;
    FReApropriaCustoMedioCommand: TDBXCommand;
    FRecalculoDemandasVendasCommand: TDBXCommand;
    FRecalculoSaldoAtualCommand: TDBXCommand;
    FRecalculoSaldoAtualLoteCommand: TDBXCommand;
    FRefazDadosClienteCommand: TDBXCommand;
    FRefazDadosFornecedorCommand: TDBXCommand;
    FObtemEstruturaCommand: TDBXCommand;
    FObtemRetencao10925Command: TDBXCommand;
    FPegaSequenciaMovimentosInternosCommand: TDBXCommand;
    FObtemRegrasImpostosCategoriaCommand: TDBXCommand;
    FGetNumberOfInstancesCommand: TDBXCommand;
    FGetGeneratorIdCommand: TDBXCommand;
    FGetHTTPEnvCommand: TDBXCommand;
    FIsDevModeCommand: TDBXCommand;
    FIsAutoEnvCommand: TDBXCommand;
    FGetDevModeCommand: TDBXCommand;
    FGetAutoEnvCommand: TDBXCommand;
    FGetLoggedUserListCommand: TDBXCommand;
    FEncrypterCommand: TDBXCommand;
    FRSAEncrypterCommand: TDBXCommand;
    FGetUserGredentialsCommand: TDBXCommand;
    FHasCreditsCommand: TDBXCommand;
    FRetornaClienteCommand: TDBXCommand;
    FRetornaFornecedorCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function DoConnection(Section: string): Boolean;
    function GetDataBaseTables: TJSONArray;
    procedure GetEntityOwner(EntityName: string; var Company: string; var Branch: string);
    function GetEntityName(ProviderName: string): string;
    function GetSQLStatement(ProviderName: string): string;
    function SetUser(Status: Integer; LoginDate: TDateTime; IP: string; ComputerName: string; UserName: string; Password: string;
      Environment: string; ProgramName: string; Company: string; Branch: string; ChannelName: string; ClientId: string;
      CallBackId: string): Boolean;
    function GetServerSections: TJSONArray;
    function GetSectionDisplayName(Section: string): string;
    function GetSectionDebugClientPrograms(Section: string): string;
    function GetSectionConfigurations(Section: string): TJSONArray;
    function CheckSystemFiles: Boolean;
    function GetSystemDirectory(Dir: string): string;
    function Split(Source: AnsiString; ChrSource: AnsiString): TJSONArray;
    function GetActivedEnv: string;
    function GetInactiveCustoms: Boolean;
    function GetLicenseInf: TJSONArray;
    function GetDaysToExpires: Integer;
    function IsLockedLicense: Boolean;
    function IsValidCompanyLicense(CompanyId: string): Boolean;
    function GetServerDateTime: TDateTime;
    function ExecuteQuery(SQL: string): OleVariant;
    function ExecuteQueryByXML(SQL: string): string;
    function GetFormDefs(DefName: string): TJSONValue;
    function PutFormDefs(DefName: string; Defs: TJSONValue): Boolean;
    function PutUserConfigurarions(ProfileDir: string; Defs: TJSONValue): Boolean;
    function GetUserConfigurations(ProfileDir: string): TJSONValue;
    function GetUserThreadId: Integer;
    function ObtemMoeda(Moeda: string; Referencia: TDateTime): Double;
    function SaveLocalDataSet(FileName: string; XML: string): Boolean;
    function LoadLocalDataSet(FileName: string; var XML: string): Boolean;
    function SaveRemoteFile(BaseDir: string; FileName: string; InStream: TJSONArray): Boolean;
    function SaveRemoteBinaryFile(BaseDir: string; FileName: string; InStream: TStream): Int64;
    function LoadRemoteFile(BaseDir: string; FileName: string): TJSONArray;
    function LoadRemoteBinaryFile(BaseDir: string; FileName: string; out FileSize: Int64): TStream;
    function RemoteFileExists(BaseDir: string; FileName: string): Boolean;
    function DeleteRemoteFile(BaseDir: string; FileName: string): Boolean;
    function GetTips: TJSONArray;
    function DiaUtil(Data: TDateTime): TDateTime;
    function GeraTitulos(CondicaoPagamento: Integer; Valor: Currency; Referencia: TDateTime): TJSONArray;
    function RetornaTitulos(Carteira: string; Prefixo: string; Numero: Integer; Tipo: string; Proprietario: Integer): TJSONArray;
    function ObtemReservaPedidoVenda(Numero: Integer; Item: Integer): Double;
    function PegaSaldoInicialEstoque(Produto: string; Local: string; DataBase: TDateTime; ReApropriacao: Boolean): TJSONValue;
    function PegaSaldoInicialEstoqueLote(Produto: string; Local: string; Lote: string; DataBase: TDateTime): TJSONValue;
    function PegaBaixasTitulo(Carteira: string; Prefixo: string; Numero: Integer; Parcela: Integer; Tipo: string;
      Proprietario: Integer; DataBase: TDateTime): TJSONArray;
    function PegaSaldoBancario(Banco: Integer; Agencia: string; Conta: string; DataBase: TDateTime): Currency;
    function PegaLimiteCreditoBancario(Banco: Integer; Agencia: string; Conta: string): Currency;
    procedure FechamentoEstoque(Produto: string; Local: string; DataFechamento: TDateTime; RecalculaSaldos: string);
    function TemBaixasPagar(Prefixo: string; Numero: Integer; Tipo: string; Fornecedor: Integer): Boolean;
    procedure AtualizaSerieNotaFiscal(Prefixo: string; Numero: Integer);
    function ConverteMoeda(Valor: Currency; Origem: string; Destino: string; Referencia: TDateTime; TaxaOrigem: Double;
      TaxaDestino: Double): Currency;
    function PegaSaldoAtualEstoque(Produto: string; Local: string): TJSONArray;
    function ExecuteSQL(SQL: string): Integer;
    procedure ReajustePrecos(Entidade: string; Tipo: string; TipoPreco: string; ProdutoDe: string; ProdutoAte: string;
      GrupoDe: Integer; GrupoAte: Integer; Percentual: Double);
    procedure RecalculoSaldosBancarios(Referencia: TDateTime; Banco: Integer; Agencia: string; Conta: string);
    function FechamentoComissaoVendedor(Vendedor: Integer; Titulo: Integer; EmissaoDe: TDateTime; EmissaoAte: TDateTime): Boolean;
    procedure RefazReservas(Produto: string; Local: string);
    procedure RefazAcumulados(Produto: string; Local: string);
    procedure RefazSaldosTerceiros(Produto: string; Local: string);
    procedure ReApropriaCustoMedio(Produto: string; Local: string; DataLimite: TDateTime; MetodoApropriacao: string);
    procedure RecalculoDemandasVendas(Empresa: string; Filial: string; Ano: Integer; Mes: Integer; Produto: string;
      Quantidade: Double; Refaz: Boolean);
    procedure RecalculoSaldoAtual(Produto: string; Locais: string; DataAtual: TDateTime; CriaZerado: Boolean;
      RefazTerceiros: Boolean);
    procedure RecalculoSaldoAtualLote(Produto: string; Locais: string; Lote: string; DataAtual: TDateTime; CriaZerado: Boolean);
    procedure RefazDadosCliente(Cliente: Integer);
    procedure RefazDadosFornecedor(Fornecedor: Integer);
    function ObtemEstrutura(Produto: string): TJSONArray;
    procedure ObtemRetencao10925(Carteira: string; Proprietario: Integer; DataPagamento: TDateTime; var ValorPago: Currency;
      var Base10925: Currency; var Valor10925: Currency; var ValorPIS: Currency; var ValorCOFINS: Currency;
      var ValorCSLL: Currency);
    function PegaSequenciaMovimentosInternos(Numero: Integer; Item: Integer): Integer;
    function ObtemRegrasImpostosCategoria(Categoria: string): TJSONValue;
    function GetNumberOfInstances(UserName: string; IP: string): Integer;
    function GetGeneratorId(Company: string; Branch: string; EntityName: string; FieldName: string): Integer;
    function GetHTTPEnv: TJSONArray;
    function IsDevMode: Boolean;
    function IsAutoEnv: Boolean;
    function GetDevMode: string;
    function GetAutoEnv: string;
    function GetLoggedUserList: TJSONArray;
    function Encrypter(Encrypt: Boolean; Source: string; StartKey: Integer; MultKey: Integer; AddKey: Integer): string;
    function RSAEncrypter(Encrypt: Boolean; Source: string): string;
    function GetUserGredentials: Boolean;
    function HasCredits: Boolean;
    procedure RetornaCliente(Fornecedor: Integer; var Cliente: Integer; var Nome: string; var CNPJ: string; out Erro: Boolean);
    procedure RetornaFornecedor(Cliente: Integer; var Fornecedor: Integer; var Nome: string; var CNPJ: string; out Erro: Boolean);
  end;

  TDSSMEstruturaClient = class(TDSAdminClient)
  private
    FDSServerModuleCreateCommand: TDBXCommand;
    FDSServerModuleDestroyCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
  end;

  TDSSMCadClient = class(TDSAdminClient)
  private
    FDSServerModuleCreateCommand: TDBXCommand;
    FDSServerModuleDestroyCommand: TDBXCommand;
    FdspClientesAfterApplyUpdatesCommand: TDBXCommand;
    FdspClientes_GruposAfterApplyUpdatesCommand: TDBXCommand;
    FdspClientes_Tabelas_DadosAfterApplyUpdatesCommand: TDBXCommand;
    FdspFornecedoresAfterApplyUpdatesCommand: TDBXCommand;
    FdspFornecedores_Tabelas_DadosAfterApplyUpdatesCommand: TDBXCommand;
    FdspProdutos_GruposAfterApplyUpdatesCommand: TDBXCommand;
    FdspProdutos_SubGruposAfterApplyUpdatesCommand: TDBXCommand;
    FdspCondicoes_PagamentosAfterApplyUpdatesCommand: TDBXCommand;
    FdspVendedoresAfterApplyUpdatesCommand: TDBXCommand;
    FdspTransportadorasAfterApplyUpdatesCommand: TDBXCommand;
    FdspRegras_FiscaisAfterApplyUpdatesCommand: TDBXCommand;
    FdspSegmentos_MercadoAfterApplyUpdatesCommand: TDBXCommand;
    FdspRegras_BaixasAfterApplyUpdatesCommand: TDBXCommand;
    FdspRegras_EstoqueAfterApplyUpdatesCommand: TDBXCommand;
    FdspFaixas_GruposAfterApplyUpdatesCommand: TDBXCommand;
    FdspEstacoesAfterApplyUpdatesCommand: TDBXCommand;
    FdspAdministradorasAfterApplyUpdatesCommand: TDBXCommand;
    FdspConcorrentes_DadosAfterApplyUpdatesCommand: TDBXCommand;
    FdspFornecedores_GruposAfterApplyUpdatesCommand: TDBXCommand;
    FdspClientesGetDataCommand: TDBXCommand;
    FdspClientesAfterGetRecordsCommand: TDBXCommand;
    FdspClientesBeforeGetRecordsCommand: TDBXCommand;
    FdspLayOut_CNAB_DadosAfterApplyUpdatesCommand: TDBXCommand;
    FdspProcessos_ProdutivosAfterApplyUpdatesCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
    procedure dspClientesAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspClientes_GruposAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspClientes_Tabelas_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspFornecedoresAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspFornecedores_Tabelas_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspProdutos_GruposAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspProdutos_SubGruposAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspCondicoes_PagamentosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspVendedoresAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspTransportadorasAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspRegras_FiscaisAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspSegmentos_MercadoAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspRegras_BaixasAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspRegras_EstoqueAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspFaixas_GruposAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspEstacoesAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspAdministradorasAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspConcorrentes_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspFornecedores_GruposAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspClientesGetData(Sender: TObject; DataSet: TCustomClientDataSet);
    procedure dspClientesAfterGetRecords(Sender: TObject; var OwnerData: OleVariant);
    procedure dspClientesBeforeGetRecords(Sender: TObject; var OwnerData: OleVariant);
    procedure dspLayOut_CNAB_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspProcessos_ProdutivosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
  end;

  TDSSMLanClient = class(TDSAdminClient)
  private
    FDSServerModuleCreateCommand: TDBXCommand;
    FDSServerModuleDestroyCommand: TDBXCommand;
    FdspPedidos_Vendas_DadosBeforeApplyUpdatesCommand: TDBXCommand;
    FdspPedidos_Compras_DadosBeforeApplyUpdatesCommand: TDBXCommand;
    FdspNotas_Entradas_DadosAfterApplyUpdatesCommand: TDBXCommand;
    FdspPedidos_Compras_DadosAfterApplyUpdatesCommand: TDBXCommand;
    FdspPedidos_Vendas_DadosAfterApplyUpdatesCommand: TDBXCommand;
    FdspNotas_Entradas_DadosBeforeApplyUpdatesCommand: TDBXCommand;
    FdspBorderos_DadosBeforeApplyUpdatesCommand: TDBXCommand;
    FdspBorderos_DadosAfterApplyUpdatesCommand: TDBXCommand;
    FdspNotas_Saidas_DadosAfterApplyUpdatesCommand: TDBXCommand;
    FdspNotas_Saidas_DadosBeforeApplyUpdatesCommand: TDBXCommand;
    FdspVendas_Balcao_DadosAfterApplyUpdatesCommand: TDBXCommand;
    FdspVendas_Balcao_DadosBeforeApplyUpdatesCommand: TDBXCommand;
    FdspCotacoes_NegociacaoAfterApplyUpdatesCommand: TDBXCommand;
    FdspTecnicosAfterApplyUpdatesCommand: TDBXCommand;
    FdspOS_DadosAfterApplyUpdatesCommand: TDBXCommand;
    FdspOS_Orcamentos_DadosAfterApplyUpdatesCommand: TDBXCommand;
    FdspOrcamentos_Vendas_DadosAfterApplyUpdatesCommand: TDBXCommand;
    FdspProspectsAfterApplyUpdatesCommand: TDBXCommand;
    FdspCotacoes_Compras_DadosAfterApplyUpdatesCommand: TDBXCommand;
    FdspComandas_DadosAfterApplyUpdatesCommand: TDBXCommand;
    FdspComandas_DadosBeforeApplyUpdatesCommand: TDBXCommand;
    FdspContabilistasAfterApplyUpdatesCommand: TDBXCommand;
    FdspParticipantesAfterApplyUpdatesCommand: TDBXCommand;
    FdspRoteiros_ProducaoAfterApplyUpdatesCommand: TDBXCommand;
    FdspLinhas_ProducaoAfterApplyUpdatesCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
    procedure dspPedidos_Vendas_DadosBeforeApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspPedidos_Compras_DadosBeforeApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspNotas_Entradas_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspPedidos_Compras_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspPedidos_Vendas_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspNotas_Entradas_DadosBeforeApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspBorderos_DadosBeforeApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspBorderos_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspNotas_Saidas_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspNotas_Saidas_DadosBeforeApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspVendas_Balcao_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspVendas_Balcao_DadosBeforeApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspCotacoes_NegociacaoAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspTecnicosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspOS_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspOS_Orcamentos_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspOrcamentos_Vendas_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspProspectsAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspCotacoes_Compras_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspComandas_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspComandas_DadosBeforeApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspContabilistasAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspParticipantesAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspRoteiros_ProducaoAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspLinhas_ProducaoAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
  end;

  TDSSMConClient = class(TDSAdminClient)
  private
    FDSServerModuleCreateCommand: TDBXCommand;
    FDSServerModuleDestroyCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
  end;

  TDSSMRelClient = class(TDSAdminClient)
  private
    FDSServerModuleCreateCommand: TDBXCommand;
    FDSServerModuleDestroyCommand: TDBXCommand;
    FsqlEspelho_Nota_DadosCalcFieldsCommand: TDBXCommand;
    FsqlEspelho_Nota_ItensBeforeOpenCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
    procedure sqlEspelho_Nota_DadosCalcFields(DataSet: TDataSet);
    procedure sqlEspelho_Nota_ItensBeforeOpen(DataSet: TDataSet);
  end;

  TDSSMConfigClient = class(TDSAdminClient)
  private
    FDSServerModuleCreateCommand: TDBXCommand;
    FDSServerModuleDestroyCommand: TDBXCommand;
    FdspListas_DadosAfterApplyUpdatesCommand: TDBXCommand;
    FdspExpressoesAfterApplyUpdatesCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
    procedure dspListas_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspExpressoesAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
  end;

  TDSSMCustomsClient = class(TDSAdminClient)
  private
    FDSServerModuleCreateCommand: TDBXCommand;
    FDSServerModuleDestroyCommand: TDBXCommand;
    FdspPedidos_Vendas_DadosBeforeApplyUpdatesCommand: TDBXCommand;
    FdspPedidos_Vendas_DadosAfterApplyUpdatesCommand: TDBXCommand;
    FdspOrcamentos_Vendas_Dados_AfterApplyUpdatesCommand: TDBXCommand;
    FdspRequisicao_material_DadosAfterApplyUpdatesCommand: TDBXCommand;
    FsqlRequisicao_material_ItensBeforeOpenCommand: TDBXCommand;
    FsqlRequisicao_material_DadosBeforeOpenCommand: TDBXCommand;
    FdspAgendamentoAfterApplyUpdatesCommand: TDBXCommand;
    FsqlAgendamentoBeforeOpenCommand: TDBXCommand;
    FdspContratoAfterApplyUpdatesCommand: TDBXCommand;
    FsqlContratoBeforeOpenCommand: TDBXCommand;
    FsqlContrato_TecnicosBeforeOpenCommand: TDBXCommand;
    FdspPedidos_Compras_Dados_AfterApplyUpdatesCommand: TDBXCommand;
    FdspPedidos_Compras_Dados_BeforeApplyUpdatesCommand: TDBXCommand;
    FsqlEquipamentos_DadosBeforeOpenCommand: TDBXCommand;
    FdspEquipamentos_DadosAfterApplyUpdatesCommand: TDBXCommand;
    FsqlOrcamentos_EstruturasBeforeOpenCommand: TDBXCommand;
    FsqlPedidos_Compras_DadosBeforeOpenCommand: TDBXCommand;
    FdspProdutos_AfterApplyUpdatesCommand: TDBXCommand;
    FsqlSaldos_EstoqueBeforeOpenCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
    procedure dspPedidos_Vendas_DadosBeforeApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspPedidos_Vendas_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspOrcamentos_Vendas_Dados_AfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspRequisicao_material_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure sqlRequisicao_material_ItensBeforeOpen(DataSet: TDataSet);
    procedure sqlRequisicao_material_DadosBeforeOpen(DataSet: TDataSet);
    procedure dspAgendamentoAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure sqlAgendamentoBeforeOpen(DataSet: TDataSet);
    procedure dspContratoAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure sqlContratoBeforeOpen(DataSet: TDataSet);
    procedure sqlContrato_TecnicosBeforeOpen(DataSet: TDataSet);
    procedure dspPedidos_Compras_Dados_AfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure dspPedidos_Compras_Dados_BeforeApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure sqlEquipamentos_DadosBeforeOpen(DataSet: TDataSet);
    procedure dspEquipamentos_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure sqlOrcamentos_EstruturasBeforeOpen(DataSet: TDataSet);
    procedure sqlPedidos_Compras_DadosBeforeOpen(DataSet: TDataSet);
    procedure dspProdutos_AfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure sqlSaldos_EstoqueBeforeOpen(DataSet: TDataSet);
  end;

implementation

function TDSServerMethodsClient.EchoString(Value: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FDBXConnection.CreateCommand;
    FEchoStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEchoStringCommand.Text := 'TDSServerMethods.EchoString';
    FEchoStringCommand.Prepare;
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.ExecuteUpdate;
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TDSServerMethodsClient.ReverseString(Value: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FDBXConnection.CreateCommand;
    FReverseStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FReverseStringCommand.Text := 'TDSServerMethods.ReverseString';
    FReverseStringCommand.Prepare;
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.ExecuteUpdate;
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

function TDSServerMethodsClient.DoConnection(Section: string): Boolean;
begin
  if FDoConnectionCommand = nil then
  begin
    FDoConnectionCommand := FDBXConnection.CreateCommand;
    FDoConnectionCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDoConnectionCommand.Text := 'TDSServerMethods.DoConnection';
    FDoConnectionCommand.Prepare;
  end;
  FDoConnectionCommand.Parameters[0].Value.SetWideString(Section);
  FDoConnectionCommand.ExecuteUpdate;
  Result := FDoConnectionCommand.Parameters[1].Value.GetBoolean;
end;

function TDSServerMethodsClient.GetDataBaseTables: TJSONArray;
begin
  if FGetDataBaseTablesCommand = nil then
  begin
    FGetDataBaseTablesCommand := FDBXConnection.CreateCommand;
    FGetDataBaseTablesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetDataBaseTablesCommand.Text := 'TDSServerMethods.GetDataBaseTables';
    FGetDataBaseTablesCommand.Prepare;
  end;
  FGetDataBaseTablesCommand.ExecuteUpdate;
  Result := TJSONArray(FGetDataBaseTablesCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

procedure TDSServerMethodsClient.GetEntityOwner(EntityName: string; var Company: string; var Branch: string);
begin
  if FGetEntityOwnerCommand = nil then
  begin
    FGetEntityOwnerCommand := FDBXConnection.CreateCommand;
    FGetEntityOwnerCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetEntityOwnerCommand.Text := 'TDSServerMethods.GetEntityOwner';
    FGetEntityOwnerCommand.Prepare;
  end;
  FGetEntityOwnerCommand.Parameters[0].Value.SetWideString(EntityName);
  FGetEntityOwnerCommand.Parameters[1].Value.SetWideString(Company);
  FGetEntityOwnerCommand.Parameters[2].Value.SetWideString(Branch);
  FGetEntityOwnerCommand.ExecuteUpdate;
  Company := FGetEntityOwnerCommand.Parameters[1].Value.GetWideString;
  Branch := FGetEntityOwnerCommand.Parameters[2].Value.GetWideString;
end;

function TDSServerMethodsClient.GetEntityName(ProviderName: string): string;
begin
  if FGetEntityNameCommand = nil then
  begin
    FGetEntityNameCommand := FDBXConnection.CreateCommand;
    FGetEntityNameCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetEntityNameCommand.Text := 'TDSServerMethods.GetEntityName';
    FGetEntityNameCommand.Prepare;
  end;
  FGetEntityNameCommand.Parameters[0].Value.SetWideString(ProviderName);
  FGetEntityNameCommand.ExecuteUpdate;
  Result := FGetEntityNameCommand.Parameters[1].Value.GetWideString;
end;

function TDSServerMethodsClient.GetSQLStatement(ProviderName: string): string;
begin
  if FGetSQLStatementCommand = nil then
  begin
    FGetSQLStatementCommand := FDBXConnection.CreateCommand;
    FGetSQLStatementCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetSQLStatementCommand.Text := 'TDSServerMethods.GetSQLStatement';
    FGetSQLStatementCommand.Prepare;
  end;
  FGetSQLStatementCommand.Parameters[0].Value.SetWideString(ProviderName);
  FGetSQLStatementCommand.ExecuteUpdate;
  Result := FGetSQLStatementCommand.Parameters[1].Value.GetWideString;
end;

function TDSServerMethodsClient.SetUser(Status: Integer; LoginDate: TDateTime; IP: string; ComputerName: string; UserName: string;
  Password: string; Environment: string; ProgramName: string; Company: string; Branch: string; ChannelName: string;
  ClientId: string; CallBackId: string): Boolean;
begin
  if FSetUserCommand = nil then
  begin
    FSetUserCommand := FDBXConnection.CreateCommand;
    FSetUserCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSetUserCommand.Text := 'TDSServerMethods.SetUser';
    FSetUserCommand.Prepare;
  end;
  FSetUserCommand.Parameters[0].Value.SetInt32(Status);
  FSetUserCommand.Parameters[1].Value.AsDateTime := LoginDate;
  FSetUserCommand.Parameters[2].Value.SetWideString(IP);
  FSetUserCommand.Parameters[3].Value.SetWideString(ComputerName);
  FSetUserCommand.Parameters[4].Value.SetWideString(UserName);
  FSetUserCommand.Parameters[5].Value.SetWideString(Password);
  FSetUserCommand.Parameters[6].Value.SetWideString(Environment);
  FSetUserCommand.Parameters[7].Value.SetWideString(ProgramName);
  FSetUserCommand.Parameters[8].Value.SetWideString(Company);
  FSetUserCommand.Parameters[9].Value.SetWideString(Branch);
  FSetUserCommand.Parameters[10].Value.SetWideString(ChannelName);
  FSetUserCommand.Parameters[11].Value.SetWideString(ClientId);
  FSetUserCommand.Parameters[12].Value.SetWideString(CallBackId);
  FSetUserCommand.ExecuteUpdate;
  Result := FSetUserCommand.Parameters[13].Value.GetBoolean;
end;

function TDSServerMethodsClient.GetServerSections: TJSONArray;
begin
  if FGetServerSectionsCommand = nil then
  begin
    FGetServerSectionsCommand := FDBXConnection.CreateCommand;
    FGetServerSectionsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetServerSectionsCommand.Text := 'TDSServerMethods.GetServerSections';
    FGetServerSectionsCommand.Prepare;
  end;
  FGetServerSectionsCommand.ExecuteUpdate;
  Result := TJSONArray(FGetServerSectionsCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TDSServerMethodsClient.GetSectionDisplayName(Section: string): string;
begin
  if FGetSectionDisplayNameCommand = nil then
  begin
    FGetSectionDisplayNameCommand := FDBXConnection.CreateCommand;
    FGetSectionDisplayNameCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetSectionDisplayNameCommand.Text := 'TDSServerMethods.GetSectionDisplayName';
    FGetSectionDisplayNameCommand.Prepare;
  end;
  FGetSectionDisplayNameCommand.Parameters[0].Value.SetWideString(Section);
  FGetSectionDisplayNameCommand.ExecuteUpdate;
  Result := FGetSectionDisplayNameCommand.Parameters[1].Value.GetWideString;
end;

function TDSServerMethodsClient.GetSectionDebugClientPrograms(Section: string): string;
begin
  if FGetSectionDebugClientProgramsCommand = nil then
  begin
    FGetSectionDebugClientProgramsCommand := FDBXConnection.CreateCommand;
    FGetSectionDebugClientProgramsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetSectionDebugClientProgramsCommand.Text := 'TDSServerMethods.GetSectionDebugClientPrograms';
    FGetSectionDebugClientProgramsCommand.Prepare;
  end;
  FGetSectionDebugClientProgramsCommand.Parameters[0].Value.SetWideString(Section);
  FGetSectionDebugClientProgramsCommand.ExecuteUpdate;
  Result := FGetSectionDebugClientProgramsCommand.Parameters[1].Value.GetWideString;
end;

function TDSServerMethodsClient.GetSectionConfigurations(Section: string): TJSONArray;
begin
  if FGetSectionConfigurationsCommand = nil then
  begin
    FGetSectionConfigurationsCommand := FDBXConnection.CreateCommand;
    FGetSectionConfigurationsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetSectionConfigurationsCommand.Text := 'TDSServerMethods.GetSectionConfigurations';
    FGetSectionConfigurationsCommand.Prepare;
  end;
  FGetSectionConfigurationsCommand.Parameters[0].Value.SetWideString(Section);
  FGetSectionConfigurationsCommand.ExecuteUpdate;
  Result := TJSONArray(FGetSectionConfigurationsCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TDSServerMethodsClient.CheckSystemFiles: Boolean;
begin
  if FCheckSystemFilesCommand = nil then
  begin
    FCheckSystemFilesCommand := FDBXConnection.CreateCommand;
    FCheckSystemFilesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FCheckSystemFilesCommand.Text := 'TDSServerMethods.CheckSystemFiles';
    FCheckSystemFilesCommand.Prepare;
  end;
  FCheckSystemFilesCommand.ExecuteUpdate;
  Result := FCheckSystemFilesCommand.Parameters[0].Value.GetBoolean;
end;

function TDSServerMethodsClient.GetSystemDirectory(Dir: string): string;
begin
  if FGetSystemDirectoryCommand = nil then
  begin
    FGetSystemDirectoryCommand := FDBXConnection.CreateCommand;
    FGetSystemDirectoryCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetSystemDirectoryCommand.Text := 'TDSServerMethods.GetSystemDirectory';
    FGetSystemDirectoryCommand.Prepare;
  end;
  FGetSystemDirectoryCommand.Parameters[0].Value.SetWideString(Dir);
  FGetSystemDirectoryCommand.ExecuteUpdate;
  Result := FGetSystemDirectoryCommand.Parameters[1].Value.GetWideString;
end;

function TDSServerMethodsClient.Split(Source: AnsiString; ChrSource: AnsiString): TJSONArray;
begin
  if FSplitCommand = nil then
  begin
    FSplitCommand := FDBXConnection.CreateCommand;
    FSplitCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSplitCommand.Text := 'TDSServerMethods.Split';
    FSplitCommand.Prepare;
  end;
  FSplitCommand.Parameters[0].Value.SetAnsiString(Source);
  FSplitCommand.Parameters[1].Value.SetAnsiString(ChrSource);
  FSplitCommand.ExecuteUpdate;
  Result := TJSONArray(FSplitCommand.Parameters[2].Value.GetJSONValue(FInstanceOwner));
end;

function TDSServerMethodsClient.GetActivedEnv: string;
begin
  if FGetActivedEnvCommand = nil then
  begin
    FGetActivedEnvCommand := FDBXConnection.CreateCommand;
    FGetActivedEnvCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetActivedEnvCommand.Text := 'TDSServerMethods.GetActivedEnv';
    FGetActivedEnvCommand.Prepare;
  end;
  FGetActivedEnvCommand.ExecuteUpdate;
  Result := FGetActivedEnvCommand.Parameters[0].Value.GetWideString;
end;

function TDSServerMethodsClient.GetInactiveCustoms: Boolean;
begin
  if FGetInactiveCustomsCommand = nil then
  begin
    FGetInactiveCustomsCommand := FDBXConnection.CreateCommand;
    FGetInactiveCustomsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetInactiveCustomsCommand.Text := 'TDSServerMethods.GetInactiveCustoms';
    FGetInactiveCustomsCommand.Prepare;
  end;
  FGetInactiveCustomsCommand.ExecuteUpdate;
  Result := FGetInactiveCustomsCommand.Parameters[0].Value.GetBoolean;
end;

function TDSServerMethodsClient.GetLicenseInf: TJSONArray;
begin
  if FGetLicenseInfCommand = nil then
  begin
    FGetLicenseInfCommand := FDBXConnection.CreateCommand;
    FGetLicenseInfCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetLicenseInfCommand.Text := 'TDSServerMethods.GetLicenseInf';
    FGetLicenseInfCommand.Prepare;
  end;
  FGetLicenseInfCommand.ExecuteUpdate;
  Result := TJSONArray(FGetLicenseInfCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TDSServerMethodsClient.GetDaysToExpires: Integer;
begin
  if FGetDaysToExpiresCommand = nil then
  begin
    FGetDaysToExpiresCommand := FDBXConnection.CreateCommand;
    FGetDaysToExpiresCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetDaysToExpiresCommand.Text := 'TDSServerMethods.GetDaysToExpires';
    FGetDaysToExpiresCommand.Prepare;
  end;
  FGetDaysToExpiresCommand.ExecuteUpdate;
  Result := FGetDaysToExpiresCommand.Parameters[0].Value.GetInt32;
end;

function TDSServerMethodsClient.IsLockedLicense: Boolean;
begin
  if FIsLockedLicenseCommand = nil then
  begin
    FIsLockedLicenseCommand := FDBXConnection.CreateCommand;
    FIsLockedLicenseCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FIsLockedLicenseCommand.Text := 'TDSServerMethods.IsLockedLicense';
    FIsLockedLicenseCommand.Prepare;
  end;
  FIsLockedLicenseCommand.ExecuteUpdate;
  Result := FIsLockedLicenseCommand.Parameters[0].Value.GetBoolean;
end;

function TDSServerMethodsClient.IsValidCompanyLicense(CompanyId: string): Boolean;
begin
  if FIsValidCompanyLicenseCommand = nil then
  begin
    FIsValidCompanyLicenseCommand := FDBXConnection.CreateCommand;
    FIsValidCompanyLicenseCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FIsValidCompanyLicenseCommand.Text := 'TDSServerMethods.IsValidCompanyLicense';
    FIsValidCompanyLicenseCommand.Prepare;
  end;
  FIsValidCompanyLicenseCommand.Parameters[0].Value.SetWideString(CompanyId);
  FIsValidCompanyLicenseCommand.ExecuteUpdate;
  Result := FIsValidCompanyLicenseCommand.Parameters[1].Value.GetBoolean;
end;

function TDSServerMethodsClient.GetServerDateTime: TDateTime;
begin
  if FGetServerDateTimeCommand = nil then
  begin
    FGetServerDateTimeCommand := FDBXConnection.CreateCommand;
    FGetServerDateTimeCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetServerDateTimeCommand.Text := 'TDSServerMethods.GetServerDateTime';
    FGetServerDateTimeCommand.Prepare;
  end;
  FGetServerDateTimeCommand.ExecuteUpdate;
  Result := FGetServerDateTimeCommand.Parameters[0].Value.AsDateTime;
end;

function TDSServerMethodsClient.ExecuteQuery(SQL: string): OleVariant;
begin
  if FExecuteQueryCommand = nil then
  begin
    FExecuteQueryCommand := FDBXConnection.CreateCommand;
    FExecuteQueryCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FExecuteQueryCommand.Text := 'TDSServerMethods.ExecuteQuery';
    FExecuteQueryCommand.Prepare;
  end;
  FExecuteQueryCommand.Parameters[0].Value.SetWideString(SQL);
  FExecuteQueryCommand.ExecuteUpdate;
  Result := FExecuteQueryCommand.Parameters[1].Value.AsVariant;
end;

function TDSServerMethodsClient.ExecuteQueryByXML(SQL: string): string;
begin
  if FExecuteQueryByXMLCommand = nil then
  begin
    FExecuteQueryByXMLCommand := FDBXConnection.CreateCommand;
    FExecuteQueryByXMLCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FExecuteQueryByXMLCommand.Text := 'TDSServerMethods.ExecuteQueryByXML';
    FExecuteQueryByXMLCommand.Prepare;
  end;
  FExecuteQueryByXMLCommand.Parameters[0].Value.SetWideString(SQL);
  FExecuteQueryByXMLCommand.ExecuteUpdate;
  Result := FExecuteQueryByXMLCommand.Parameters[1].Value.GetWideString;
end;

function TDSServerMethodsClient.GetFormDefs(DefName: string): TJSONValue;
begin
  if FGetFormDefsCommand = nil then
  begin
    FGetFormDefsCommand := FDBXConnection.CreateCommand;
    FGetFormDefsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetFormDefsCommand.Text := 'TDSServerMethods.GetFormDefs';
    FGetFormDefsCommand.Prepare;
  end;
  FGetFormDefsCommand.Parameters[0].Value.SetWideString(DefName);
  FGetFormDefsCommand.ExecuteUpdate;
  Result := TJSONValue(FGetFormDefsCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TDSServerMethodsClient.PutFormDefs(DefName: string; Defs: TJSONValue): Boolean;
begin
  if FPutFormDefsCommand = nil then
  begin
    FPutFormDefsCommand := FDBXConnection.CreateCommand;
    FPutFormDefsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPutFormDefsCommand.Text := 'TDSServerMethods.PutFormDefs';
    FPutFormDefsCommand.Prepare;
  end;
  FPutFormDefsCommand.Parameters[0].Value.SetWideString(DefName);
  FPutFormDefsCommand.Parameters[1].Value.SetJSONValue(Defs, FInstanceOwner);
  FPutFormDefsCommand.ExecuteUpdate;
  Result := FPutFormDefsCommand.Parameters[2].Value.GetBoolean;
end;

function TDSServerMethodsClient.PutUserConfigurarions(ProfileDir: string; Defs: TJSONValue): Boolean;
begin
  if FPutUserConfigurarionsCommand = nil then
  begin
    FPutUserConfigurarionsCommand := FDBXConnection.CreateCommand;
    FPutUserConfigurarionsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPutUserConfigurarionsCommand.Text := 'TDSServerMethods.PutUserConfigurarions';
    FPutUserConfigurarionsCommand.Prepare;
  end;
  FPutUserConfigurarionsCommand.Parameters[0].Value.SetWideString(ProfileDir);
  FPutUserConfigurarionsCommand.Parameters[1].Value.SetJSONValue(Defs, FInstanceOwner);
  FPutUserConfigurarionsCommand.ExecuteUpdate;
  Result := FPutUserConfigurarionsCommand.Parameters[2].Value.GetBoolean;
end;

function TDSServerMethodsClient.GetUserConfigurations(ProfileDir: string): TJSONValue;
begin
  if FGetUserConfigurationsCommand = nil then
  begin
    FGetUserConfigurationsCommand := FDBXConnection.CreateCommand;
    FGetUserConfigurationsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetUserConfigurationsCommand.Text := 'TDSServerMethods.GetUserConfigurations';
    FGetUserConfigurationsCommand.Prepare;
  end;
  FGetUserConfigurationsCommand.Parameters[0].Value.SetWideString(ProfileDir);
  FGetUserConfigurationsCommand.ExecuteUpdate;
  Result := TJSONValue(FGetUserConfigurationsCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TDSServerMethodsClient.GetUserThreadId: Integer;
begin
  if FGetUserThreadIdCommand = nil then
  begin
    FGetUserThreadIdCommand := FDBXConnection.CreateCommand;
    FGetUserThreadIdCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetUserThreadIdCommand.Text := 'TDSServerMethods.GetUserThreadId';
    FGetUserThreadIdCommand.Prepare;
  end;
  FGetUserThreadIdCommand.ExecuteUpdate;
  Result := FGetUserThreadIdCommand.Parameters[0].Value.GetInt32;
end;

function TDSServerMethodsClient.ObtemMoeda(Moeda: string; Referencia: TDateTime): Double;
begin
  if FObtemMoedaCommand = nil then
  begin
    FObtemMoedaCommand := FDBXConnection.CreateCommand;
    FObtemMoedaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FObtemMoedaCommand.Text := 'TDSServerMethods.ObtemMoeda';
    FObtemMoedaCommand.Prepare;
  end;
  FObtemMoedaCommand.Parameters[0].Value.SetWideString(Moeda);
  FObtemMoedaCommand.Parameters[1].Value.AsDateTime := Referencia;
  FObtemMoedaCommand.ExecuteUpdate;
  Result := FObtemMoedaCommand.Parameters[2].Value.GetDouble;
end;

function TDSServerMethodsClient.SaveLocalDataSet(FileName: string; XML: string): Boolean;
begin
  if FSaveLocalDataSetCommand = nil then
  begin
    FSaveLocalDataSetCommand := FDBXConnection.CreateCommand;
    FSaveLocalDataSetCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSaveLocalDataSetCommand.Text := 'TDSServerMethods.SaveLocalDataSet';
    FSaveLocalDataSetCommand.Prepare;
  end;
  FSaveLocalDataSetCommand.Parameters[0].Value.SetWideString(FileName);
  FSaveLocalDataSetCommand.Parameters[1].Value.SetWideString(XML);
  FSaveLocalDataSetCommand.ExecuteUpdate;
  Result := FSaveLocalDataSetCommand.Parameters[2].Value.GetBoolean;
end;

function TDSServerMethodsClient.LoadLocalDataSet(FileName: string; var XML: string): Boolean;
begin
  if FLoadLocalDataSetCommand = nil then
  begin
    FLoadLocalDataSetCommand := FDBXConnection.CreateCommand;
    FLoadLocalDataSetCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLoadLocalDataSetCommand.Text := 'TDSServerMethods.LoadLocalDataSet';
    FLoadLocalDataSetCommand.Prepare;
  end;
  FLoadLocalDataSetCommand.Parameters[0].Value.SetWideString(FileName);
  FLoadLocalDataSetCommand.Parameters[1].Value.SetWideString(XML);
  FLoadLocalDataSetCommand.ExecuteUpdate;
  XML := FLoadLocalDataSetCommand.Parameters[1].Value.GetWideString;
  Result := FLoadLocalDataSetCommand.Parameters[2].Value.GetBoolean;
end;

function TDSServerMethodsClient.SaveRemoteFile(BaseDir: string; FileName: string; InStream: TJSONArray): Boolean;
begin
  if FSaveRemoteFileCommand = nil then
  begin
    FSaveRemoteFileCommand := FDBXConnection.CreateCommand;
    FSaveRemoteFileCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSaveRemoteFileCommand.Text := 'TDSServerMethods.SaveRemoteFile';
    FSaveRemoteFileCommand.Prepare;
  end;
  FSaveRemoteFileCommand.Parameters[0].Value.SetWideString(BaseDir);
  FSaveRemoteFileCommand.Parameters[1].Value.SetWideString(FileName);
  FSaveRemoteFileCommand.Parameters[2].Value.SetJSONValue(InStream, FInstanceOwner);
  FSaveRemoteFileCommand.ExecuteUpdate;
  Result := FSaveRemoteFileCommand.Parameters[3].Value.GetBoolean;
end;

function TDSServerMethodsClient.SaveRemoteBinaryFile(BaseDir: string; FileName: string; InStream: TStream): Int64;
begin
  if FSaveRemoteBinaryFileCommand = nil then
  begin
    FSaveRemoteBinaryFileCommand := FDBXConnection.CreateCommand;
    FSaveRemoteBinaryFileCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSaveRemoteBinaryFileCommand.Text := 'TDSServerMethods.SaveRemoteBinaryFile';
    FSaveRemoteBinaryFileCommand.Prepare;
  end;
  FSaveRemoteBinaryFileCommand.Parameters[0].Value.SetWideString(BaseDir);
  FSaveRemoteBinaryFileCommand.Parameters[1].Value.SetWideString(FileName);
  FSaveRemoteBinaryFileCommand.Parameters[2].Value.SetStream(InStream, FInstanceOwner);
  FSaveRemoteBinaryFileCommand.ExecuteUpdate;
  Result := FSaveRemoteBinaryFileCommand.Parameters[3].Value.GetInt64;
end;

function TDSServerMethodsClient.LoadRemoteFile(BaseDir: string; FileName: string): TJSONArray;
begin
  if FLoadRemoteFileCommand = nil then
  begin
    FLoadRemoteFileCommand := FDBXConnection.CreateCommand;
    FLoadRemoteFileCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLoadRemoteFileCommand.Text := 'TDSServerMethods.LoadRemoteFile';
    FLoadRemoteFileCommand.Prepare;
  end;
  FLoadRemoteFileCommand.Parameters[0].Value.SetWideString(BaseDir);
  FLoadRemoteFileCommand.Parameters[1].Value.SetWideString(FileName);
  FLoadRemoteFileCommand.ExecuteUpdate;
  Result := TJSONArray(FLoadRemoteFileCommand.Parameters[2].Value.GetJSONValue(FInstanceOwner));
end;

function TDSServerMethodsClient.LoadRemoteBinaryFile(BaseDir: string; FileName: string; out FileSize: Int64): TStream;
begin
  if FLoadRemoteBinaryFileCommand = nil then
  begin
    FLoadRemoteBinaryFileCommand := FDBXConnection.CreateCommand;
    FLoadRemoteBinaryFileCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLoadRemoteBinaryFileCommand.Text := 'TDSServerMethods.LoadRemoteBinaryFile';
    FLoadRemoteBinaryFileCommand.Prepare;
  end;
  FLoadRemoteBinaryFileCommand.Parameters[0].Value.SetWideString(BaseDir);
  FLoadRemoteBinaryFileCommand.Parameters[1].Value.SetWideString(FileName);
  FLoadRemoteBinaryFileCommand.ExecuteUpdate;
  FileSize := FLoadRemoteBinaryFileCommand.Parameters[2].Value.GetInt64;
  Result := FLoadRemoteBinaryFileCommand.Parameters[3].Value.GetStream(FInstanceOwner);
end;

function TDSServerMethodsClient.RemoteFileExists(BaseDir: string; FileName: string): Boolean;
begin
  if FRemoteFileExistsCommand = nil then
  begin
    FRemoteFileExistsCommand := FDBXConnection.CreateCommand;
    FRemoteFileExistsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRemoteFileExistsCommand.Text := 'TDSServerMethods.RemoteFileExists';
    FRemoteFileExistsCommand.Prepare;
  end;
  FRemoteFileExistsCommand.Parameters[0].Value.SetWideString(BaseDir);
  FRemoteFileExistsCommand.Parameters[1].Value.SetWideString(FileName);
  FRemoteFileExistsCommand.ExecuteUpdate;
  Result := FRemoteFileExistsCommand.Parameters[2].Value.GetBoolean;
end;

function TDSServerMethodsClient.DeleteRemoteFile(BaseDir: string; FileName: string): Boolean;
begin
  if FDeleteRemoteFileCommand = nil then
  begin
    FDeleteRemoteFileCommand := FDBXConnection.CreateCommand;
    FDeleteRemoteFileCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDeleteRemoteFileCommand.Text := 'TDSServerMethods.DeleteRemoteFile';
    FDeleteRemoteFileCommand.Prepare;
  end;
  FDeleteRemoteFileCommand.Parameters[0].Value.SetWideString(BaseDir);
  FDeleteRemoteFileCommand.Parameters[1].Value.SetWideString(FileName);
  FDeleteRemoteFileCommand.ExecuteUpdate;
  Result := FDeleteRemoteFileCommand.Parameters[2].Value.GetBoolean;
end;

function TDSServerMethodsClient.GetTips: TJSONArray;
begin
  if FGetTipsCommand = nil then
  begin
    FGetTipsCommand := FDBXConnection.CreateCommand;
    FGetTipsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetTipsCommand.Text := 'TDSServerMethods.GetTips';
    FGetTipsCommand.Prepare;
  end;
  FGetTipsCommand.ExecuteUpdate;
  Result := TJSONArray(FGetTipsCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TDSServerMethodsClient.DiaUtil(Data: TDateTime): TDateTime;
begin
  if FDiaUtilCommand = nil then
  begin
    FDiaUtilCommand := FDBXConnection.CreateCommand;
    FDiaUtilCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDiaUtilCommand.Text := 'TDSServerMethods.DiaUtil';
    FDiaUtilCommand.Prepare;
  end;
  FDiaUtilCommand.Parameters[0].Value.AsDateTime := Data;
  FDiaUtilCommand.ExecuteUpdate;
  Result := FDiaUtilCommand.Parameters[1].Value.AsDateTime;
end;

function TDSServerMethodsClient.GeraTitulos(CondicaoPagamento: Integer; Valor: Currency; Referencia: TDateTime): TJSONArray;
begin
  if FGeraTitulosCommand = nil then
  begin
    FGeraTitulosCommand := FDBXConnection.CreateCommand;
    FGeraTitulosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGeraTitulosCommand.Text := 'TDSServerMethods.GeraTitulos';
    FGeraTitulosCommand.Prepare;
  end;
  FGeraTitulosCommand.Parameters[0].Value.SetInt32(CondicaoPagamento);
  FGeraTitulosCommand.Parameters[1].Value.AsCurrency := Valor;
  FGeraTitulosCommand.Parameters[2].Value.AsDateTime := Referencia;
  FGeraTitulosCommand.ExecuteUpdate;
  Result := TJSONArray(FGeraTitulosCommand.Parameters[3].Value.GetJSONValue(FInstanceOwner));
end;

function TDSServerMethodsClient.RetornaTitulos(Carteira: string; Prefixo: string; Numero: Integer; Tipo: string;
  Proprietario: Integer): TJSONArray;
begin
  if FRetornaTitulosCommand = nil then
  begin
    FRetornaTitulosCommand := FDBXConnection.CreateCommand;
    FRetornaTitulosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRetornaTitulosCommand.Text := 'TDSServerMethods.RetornaTitulos';
    FRetornaTitulosCommand.Prepare;
  end;
  FRetornaTitulosCommand.Parameters[0].Value.SetWideString(Carteira);
  FRetornaTitulosCommand.Parameters[1].Value.SetWideString(Prefixo);
  FRetornaTitulosCommand.Parameters[2].Value.SetInt32(Numero);
  FRetornaTitulosCommand.Parameters[3].Value.SetWideString(Tipo);
  FRetornaTitulosCommand.Parameters[4].Value.SetInt32(Proprietario);
  FRetornaTitulosCommand.ExecuteUpdate;
  Result := TJSONArray(FRetornaTitulosCommand.Parameters[5].Value.GetJSONValue(FInstanceOwner));
end;

function TDSServerMethodsClient.ObtemReservaPedidoVenda(Numero: Integer; Item: Integer): Double;
begin
  if FObtemReservaPedidoVendaCommand = nil then
  begin
    FObtemReservaPedidoVendaCommand := FDBXConnection.CreateCommand;
    FObtemReservaPedidoVendaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FObtemReservaPedidoVendaCommand.Text := 'TDSServerMethods.ObtemReservaPedidoVenda';
    FObtemReservaPedidoVendaCommand.Prepare;
  end;
  FObtemReservaPedidoVendaCommand.Parameters[0].Value.SetInt32(Numero);
  FObtemReservaPedidoVendaCommand.Parameters[1].Value.SetInt32(Item);
  FObtemReservaPedidoVendaCommand.ExecuteUpdate;
  Result := FObtemReservaPedidoVendaCommand.Parameters[2].Value.GetDouble;
end;

function TDSServerMethodsClient.PegaSaldoInicialEstoque(Produto: string; Local: string; DataBase: TDateTime;
  ReApropriacao: Boolean): TJSONValue;
begin
  if FPegaSaldoInicialEstoqueCommand = nil then
  begin
    FPegaSaldoInicialEstoqueCommand := FDBXConnection.CreateCommand;
    FPegaSaldoInicialEstoqueCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPegaSaldoInicialEstoqueCommand.Text := 'TDSServerMethods.PegaSaldoInicialEstoque';
    FPegaSaldoInicialEstoqueCommand.Prepare;
  end;
  FPegaSaldoInicialEstoqueCommand.Parameters[0].Value.SetWideString(Produto);
  FPegaSaldoInicialEstoqueCommand.Parameters[1].Value.SetWideString(Local);
  FPegaSaldoInicialEstoqueCommand.Parameters[2].Value.AsDateTime := DataBase;
  FPegaSaldoInicialEstoqueCommand.Parameters[3].Value.SetBoolean(ReApropriacao);
  FPegaSaldoInicialEstoqueCommand.ExecuteUpdate;
  Result := TJSONValue(FPegaSaldoInicialEstoqueCommand.Parameters[4].Value.GetJSONValue(FInstanceOwner));
end;

function TDSServerMethodsClient.PegaSaldoInicialEstoqueLote(Produto: string; Local: string; Lote: string; DataBase: TDateTime)
  : TJSONValue;
begin
  if FPegaSaldoInicialEstoqueLoteCommand = nil then
  begin
    FPegaSaldoInicialEstoqueLoteCommand := FDBXConnection.CreateCommand;
    FPegaSaldoInicialEstoqueLoteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPegaSaldoInicialEstoqueLoteCommand.Text := 'TDSServerMethods.PegaSaldoInicialEstoqueLote';
    FPegaSaldoInicialEstoqueLoteCommand.Prepare;
  end;
  FPegaSaldoInicialEstoqueLoteCommand.Parameters[0].Value.SetWideString(Produto);
  FPegaSaldoInicialEstoqueLoteCommand.Parameters[1].Value.SetWideString(Local);
  FPegaSaldoInicialEstoqueLoteCommand.Parameters[2].Value.SetWideString(Lote);
  FPegaSaldoInicialEstoqueLoteCommand.Parameters[3].Value.AsDateTime := DataBase;
  FPegaSaldoInicialEstoqueLoteCommand.ExecuteUpdate;
  Result := TJSONValue(FPegaSaldoInicialEstoqueLoteCommand.Parameters[4].Value.GetJSONValue(FInstanceOwner));
end;

function TDSServerMethodsClient.PegaBaixasTitulo(Carteira: string; Prefixo: string; Numero: Integer; Parcela: Integer;
  Tipo: string; Proprietario: Integer; DataBase: TDateTime): TJSONArray;
begin
  if FPegaBaixasTituloCommand = nil then
  begin
    FPegaBaixasTituloCommand := FDBXConnection.CreateCommand;
    FPegaBaixasTituloCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPegaBaixasTituloCommand.Text := 'TDSServerMethods.PegaBaixasTitulo';
    FPegaBaixasTituloCommand.Prepare;
  end;
  FPegaBaixasTituloCommand.Parameters[0].Value.SetWideString(Carteira);
  FPegaBaixasTituloCommand.Parameters[1].Value.SetWideString(Prefixo);
  FPegaBaixasTituloCommand.Parameters[2].Value.SetInt32(Numero);
  FPegaBaixasTituloCommand.Parameters[3].Value.SetInt32(Parcela);
  FPegaBaixasTituloCommand.Parameters[4].Value.SetWideString(Tipo);
  FPegaBaixasTituloCommand.Parameters[5].Value.SetInt32(Proprietario);
  FPegaBaixasTituloCommand.Parameters[6].Value.AsDateTime := DataBase;
  FPegaBaixasTituloCommand.ExecuteUpdate;
  Result := TJSONArray(FPegaBaixasTituloCommand.Parameters[7].Value.GetJSONValue(FInstanceOwner));
end;

function TDSServerMethodsClient.PegaSaldoBancario(Banco: Integer; Agencia: string; Conta: string; DataBase: TDateTime): Currency;
begin
  if FPegaSaldoBancarioCommand = nil then
  begin
    FPegaSaldoBancarioCommand := FDBXConnection.CreateCommand;
    FPegaSaldoBancarioCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPegaSaldoBancarioCommand.Text := 'TDSServerMethods.PegaSaldoBancario';
    FPegaSaldoBancarioCommand.Prepare;
  end;
  FPegaSaldoBancarioCommand.Parameters[0].Value.SetInt32(Banco);
  FPegaSaldoBancarioCommand.Parameters[1].Value.SetWideString(Agencia);
  FPegaSaldoBancarioCommand.Parameters[2].Value.SetWideString(Conta);
  FPegaSaldoBancarioCommand.Parameters[3].Value.AsDateTime := DataBase;
  FPegaSaldoBancarioCommand.ExecuteUpdate;
  Result := FPegaSaldoBancarioCommand.Parameters[4].Value.AsCurrency;
end;

function TDSServerMethodsClient.PegaLimiteCreditoBancario(Banco: Integer; Agencia: string; Conta: string): Currency;
begin
  if FPegaLimiteCreditoBancarioCommand = nil then
  begin
    FPegaLimiteCreditoBancarioCommand := FDBXConnection.CreateCommand;
    FPegaLimiteCreditoBancarioCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPegaLimiteCreditoBancarioCommand.Text := 'TDSServerMethods.PegaLimiteCreditoBancario';
    FPegaLimiteCreditoBancarioCommand.Prepare;
  end;
  FPegaLimiteCreditoBancarioCommand.Parameters[0].Value.SetInt32(Banco);
  FPegaLimiteCreditoBancarioCommand.Parameters[1].Value.SetWideString(Agencia);
  FPegaLimiteCreditoBancarioCommand.Parameters[2].Value.SetWideString(Conta);
  FPegaLimiteCreditoBancarioCommand.ExecuteUpdate;
  Result := FPegaLimiteCreditoBancarioCommand.Parameters[3].Value.AsCurrency;
end;

procedure TDSServerMethodsClient.FechamentoEstoque(Produto: string; Local: string; DataFechamento: TDateTime;
  RecalculaSaldos: string);
begin
  if FFechamentoEstoqueCommand = nil then
  begin
    FFechamentoEstoqueCommand := FDBXConnection.CreateCommand;
    FFechamentoEstoqueCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFechamentoEstoqueCommand.Text := 'TDSServerMethods.FechamentoEstoque';
    FFechamentoEstoqueCommand.Prepare;
  end;
  FFechamentoEstoqueCommand.Parameters[0].Value.SetWideString(Produto);
  FFechamentoEstoqueCommand.Parameters[1].Value.SetWideString(Local);
  FFechamentoEstoqueCommand.Parameters[2].Value.AsDateTime := DataFechamento;
  FFechamentoEstoqueCommand.Parameters[3].Value.SetWideString(RecalculaSaldos);
  FFechamentoEstoqueCommand.ExecuteUpdate;
end;

function TDSServerMethodsClient.TemBaixasPagar(Prefixo: string; Numero: Integer; Tipo: string; Fornecedor: Integer): Boolean;
begin
  if FTemBaixasPagarCommand = nil then
  begin
    FTemBaixasPagarCommand := FDBXConnection.CreateCommand;
    FTemBaixasPagarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FTemBaixasPagarCommand.Text := 'TDSServerMethods.TemBaixasPagar';
    FTemBaixasPagarCommand.Prepare;
  end;
  FTemBaixasPagarCommand.Parameters[0].Value.SetWideString(Prefixo);
  FTemBaixasPagarCommand.Parameters[1].Value.SetInt32(Numero);
  FTemBaixasPagarCommand.Parameters[2].Value.SetWideString(Tipo);
  FTemBaixasPagarCommand.Parameters[3].Value.SetInt32(Fornecedor);
  FTemBaixasPagarCommand.ExecuteUpdate;
  Result := FTemBaixasPagarCommand.Parameters[4].Value.GetBoolean;
end;

procedure TDSServerMethodsClient.AtualizaSerieNotaFiscal(Prefixo: string; Numero: Integer);
begin
  if FAtualizaSerieNotaFiscalCommand = nil then
  begin
    FAtualizaSerieNotaFiscalCommand := FDBXConnection.CreateCommand;
    FAtualizaSerieNotaFiscalCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAtualizaSerieNotaFiscalCommand.Text := 'TDSServerMethods.AtualizaSerieNotaFiscal';
    FAtualizaSerieNotaFiscalCommand.Prepare;
  end;
  FAtualizaSerieNotaFiscalCommand.Parameters[0].Value.SetWideString(Prefixo);
  FAtualizaSerieNotaFiscalCommand.Parameters[1].Value.SetInt32(Numero);
  FAtualizaSerieNotaFiscalCommand.ExecuteUpdate;
end;

function TDSServerMethodsClient.ConverteMoeda(Valor: Currency; Origem: string; Destino: string; Referencia: TDateTime;
  TaxaOrigem: Double; TaxaDestino: Double): Currency;
begin
  if FConverteMoedaCommand = nil then
  begin
    FConverteMoedaCommand := FDBXConnection.CreateCommand;
    FConverteMoedaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FConverteMoedaCommand.Text := 'TDSServerMethods.ConverteMoeda';
    FConverteMoedaCommand.Prepare;
  end;
  FConverteMoedaCommand.Parameters[0].Value.AsCurrency := Valor;
  FConverteMoedaCommand.Parameters[1].Value.SetWideString(Origem);
  FConverteMoedaCommand.Parameters[2].Value.SetWideString(Destino);
  FConverteMoedaCommand.Parameters[3].Value.AsDateTime := Referencia;
  FConverteMoedaCommand.Parameters[4].Value.SetDouble(TaxaOrigem);
  FConverteMoedaCommand.Parameters[5].Value.SetDouble(TaxaDestino);
  FConverteMoedaCommand.ExecuteUpdate;
  Result := FConverteMoedaCommand.Parameters[6].Value.AsCurrency;
end;

function TDSServerMethodsClient.PegaSaldoAtualEstoque(Produto: string; Local: string): TJSONArray;
begin
  if FPegaSaldoAtualEstoqueCommand = nil then
  begin
    FPegaSaldoAtualEstoqueCommand := FDBXConnection.CreateCommand;
    FPegaSaldoAtualEstoqueCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPegaSaldoAtualEstoqueCommand.Text := 'TDSServerMethods.PegaSaldoAtualEstoque';
    FPegaSaldoAtualEstoqueCommand.Prepare;
  end;
  FPegaSaldoAtualEstoqueCommand.Parameters[0].Value.SetWideString(Produto);
  FPegaSaldoAtualEstoqueCommand.Parameters[1].Value.SetWideString(Local);
  FPegaSaldoAtualEstoqueCommand.ExecuteUpdate;
  Result := TJSONArray(FPegaSaldoAtualEstoqueCommand.Parameters[2].Value.GetJSONValue(FInstanceOwner));
end;

function TDSServerMethodsClient.ExecuteSQL(SQL: string): Integer;
begin
  if FExecuteSQLCommand = nil then
  begin
    FExecuteSQLCommand := FDBXConnection.CreateCommand;
    FExecuteSQLCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FExecuteSQLCommand.Text := 'TDSServerMethods.ExecuteSQL';
    FExecuteSQLCommand.Prepare;
  end;
  FExecuteSQLCommand.Parameters[0].Value.SetWideString(SQL);
  FExecuteSQLCommand.ExecuteUpdate;
  Result := FExecuteSQLCommand.Parameters[1].Value.GetInt32;
end;

procedure TDSServerMethodsClient.ReajustePrecos(Entidade: string; Tipo: string; TipoPreco: string; ProdutoDe: string;
  ProdutoAte: string; GrupoDe: Integer; GrupoAte: Integer; Percentual: Double);
begin
  if FReajustePrecosCommand = nil then
  begin
    FReajustePrecosCommand := FDBXConnection.CreateCommand;
    FReajustePrecosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FReajustePrecosCommand.Text := 'TDSServerMethods.ReajustePrecos';
    FReajustePrecosCommand.Prepare;
  end;
  FReajustePrecosCommand.Parameters[0].Value.SetWideString(Entidade);
  FReajustePrecosCommand.Parameters[1].Value.SetWideString(Tipo);
  FReajustePrecosCommand.Parameters[2].Value.SetWideString(TipoPreco);
  FReajustePrecosCommand.Parameters[3].Value.SetWideString(ProdutoDe);
  FReajustePrecosCommand.Parameters[4].Value.SetWideString(ProdutoAte);
  FReajustePrecosCommand.Parameters[5].Value.SetInt32(GrupoDe);
  FReajustePrecosCommand.Parameters[6].Value.SetInt32(GrupoAte);
  FReajustePrecosCommand.Parameters[7].Value.SetDouble(Percentual);
  FReajustePrecosCommand.ExecuteUpdate;
end;

procedure TDSServerMethodsClient.RecalculoSaldosBancarios(Referencia: TDateTime; Banco: Integer; Agencia: string; Conta: string);
begin
  if FRecalculoSaldosBancariosCommand = nil then
  begin
    FRecalculoSaldosBancariosCommand := FDBXConnection.CreateCommand;
    FRecalculoSaldosBancariosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRecalculoSaldosBancariosCommand.Text := 'TDSServerMethods.RecalculoSaldosBancarios';
    FRecalculoSaldosBancariosCommand.Prepare;
  end;
  FRecalculoSaldosBancariosCommand.Parameters[0].Value.AsDateTime := Referencia;
  FRecalculoSaldosBancariosCommand.Parameters[1].Value.SetInt32(Banco);
  FRecalculoSaldosBancariosCommand.Parameters[2].Value.SetWideString(Agencia);
  FRecalculoSaldosBancariosCommand.Parameters[3].Value.SetWideString(Conta);
  FRecalculoSaldosBancariosCommand.ExecuteUpdate;
end;

function TDSServerMethodsClient.FechamentoComissaoVendedor(Vendedor: Integer; Titulo: Integer; EmissaoDe: TDateTime;
  EmissaoAte: TDateTime): Boolean;
begin
  if FFechamentoComissaoVendedorCommand = nil then
  begin
    FFechamentoComissaoVendedorCommand := FDBXConnection.CreateCommand;
    FFechamentoComissaoVendedorCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFechamentoComissaoVendedorCommand.Text := 'TDSServerMethods.FechamentoComissaoVendedor';
    FFechamentoComissaoVendedorCommand.Prepare;
  end;
  FFechamentoComissaoVendedorCommand.Parameters[0].Value.SetInt32(Vendedor);
  FFechamentoComissaoVendedorCommand.Parameters[1].Value.SetInt32(Titulo);
  FFechamentoComissaoVendedorCommand.Parameters[2].Value.AsDateTime := EmissaoDe;
  FFechamentoComissaoVendedorCommand.Parameters[3].Value.AsDateTime := EmissaoAte;
  FFechamentoComissaoVendedorCommand.ExecuteUpdate;
  Result := FFechamentoComissaoVendedorCommand.Parameters[4].Value.GetBoolean;
end;

procedure TDSServerMethodsClient.RefazReservas(Produto: string; Local: string);
begin
  if FRefazReservasCommand = nil then
  begin
    FRefazReservasCommand := FDBXConnection.CreateCommand;
    FRefazReservasCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRefazReservasCommand.Text := 'TDSServerMethods.RefazReservas';
    FRefazReservasCommand.Prepare;
  end;
  FRefazReservasCommand.Parameters[0].Value.SetWideString(Produto);
  FRefazReservasCommand.Parameters[1].Value.SetWideString(Local);
  FRefazReservasCommand.ExecuteUpdate;
end;

procedure TDSServerMethodsClient.RefazAcumulados(Produto: string; Local: string);
begin
  if FRefazAcumuladosCommand = nil then
  begin
    FRefazAcumuladosCommand := FDBXConnection.CreateCommand;
    FRefazAcumuladosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRefazAcumuladosCommand.Text := 'TDSServerMethods.RefazAcumulados';
    FRefazAcumuladosCommand.Prepare;
  end;
  FRefazAcumuladosCommand.Parameters[0].Value.SetWideString(Produto);
  FRefazAcumuladosCommand.Parameters[1].Value.SetWideString(Local);
  FRefazAcumuladosCommand.ExecuteUpdate;
end;

procedure TDSServerMethodsClient.RefazSaldosTerceiros(Produto: string; Local: string);
begin
  if FRefazSaldosTerceirosCommand = nil then
  begin
    FRefazSaldosTerceirosCommand := FDBXConnection.CreateCommand;
    FRefazSaldosTerceirosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRefazSaldosTerceirosCommand.Text := 'TDSServerMethods.RefazSaldosTerceiros';
    FRefazSaldosTerceirosCommand.Prepare;
  end;
  FRefazSaldosTerceirosCommand.Parameters[0].Value.SetWideString(Produto);
  FRefazSaldosTerceirosCommand.Parameters[1].Value.SetWideString(Local);
  FRefazSaldosTerceirosCommand.ExecuteUpdate;
end;

procedure TDSServerMethodsClient.ReApropriaCustoMedio(Produto: string; Local: string; DataLimite: TDateTime;
  MetodoApropriacao: string);
begin
  if FReApropriaCustoMedioCommand = nil then
  begin
    FReApropriaCustoMedioCommand := FDBXConnection.CreateCommand;
    FReApropriaCustoMedioCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FReApropriaCustoMedioCommand.Text := 'TDSServerMethods.ReApropriaCustoMedio';
    FReApropriaCustoMedioCommand.Prepare;
  end;
  FReApropriaCustoMedioCommand.Parameters[0].Value.SetWideString(Produto);
  FReApropriaCustoMedioCommand.Parameters[1].Value.SetWideString(Local);
  FReApropriaCustoMedioCommand.Parameters[2].Value.AsDateTime := DataLimite;
  FReApropriaCustoMedioCommand.Parameters[3].Value.SetWideString(MetodoApropriacao);
  FReApropriaCustoMedioCommand.ExecuteUpdate;
end;

procedure TDSServerMethodsClient.RecalculoDemandasVendas(Empresa: string; Filial: string; Ano: Integer; Mes: Integer;
  Produto: string; Quantidade: Double; Refaz: Boolean);
begin
  if FRecalculoDemandasVendasCommand = nil then
  begin
    FRecalculoDemandasVendasCommand := FDBXConnection.CreateCommand;
    FRecalculoDemandasVendasCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRecalculoDemandasVendasCommand.Text := 'TDSServerMethods.RecalculoDemandasVendas';
    FRecalculoDemandasVendasCommand.Prepare;
  end;
  FRecalculoDemandasVendasCommand.Parameters[0].Value.SetWideString(Empresa);
  FRecalculoDemandasVendasCommand.Parameters[1].Value.SetWideString(Filial);
  FRecalculoDemandasVendasCommand.Parameters[2].Value.SetInt32(Ano);
  FRecalculoDemandasVendasCommand.Parameters[3].Value.SetInt32(Mes);
  FRecalculoDemandasVendasCommand.Parameters[4].Value.SetWideString(Produto);
  FRecalculoDemandasVendasCommand.Parameters[5].Value.SetDouble(Quantidade);
  FRecalculoDemandasVendasCommand.Parameters[6].Value.SetBoolean(Refaz);
  FRecalculoDemandasVendasCommand.ExecuteUpdate;
end;

procedure TDSServerMethodsClient.RecalculoSaldoAtual(Produto: string; Locais: string; DataAtual: TDateTime; CriaZerado: Boolean;
  RefazTerceiros: Boolean);
begin
  if FRecalculoSaldoAtualCommand = nil then
  begin
    FRecalculoSaldoAtualCommand := FDBXConnection.CreateCommand;
    FRecalculoSaldoAtualCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRecalculoSaldoAtualCommand.Text := 'TDSServerMethods.RecalculoSaldoAtual';
    FRecalculoSaldoAtualCommand.Prepare;
  end;
  FRecalculoSaldoAtualCommand.Parameters[0].Value.SetWideString(Produto);
  FRecalculoSaldoAtualCommand.Parameters[1].Value.SetWideString(Locais);
  FRecalculoSaldoAtualCommand.Parameters[2].Value.AsDateTime := DataAtual;
  FRecalculoSaldoAtualCommand.Parameters[3].Value.SetBoolean(CriaZerado);
  FRecalculoSaldoAtualCommand.Parameters[4].Value.SetBoolean(RefazTerceiros);
  FRecalculoSaldoAtualCommand.ExecuteUpdate;
end;

procedure TDSServerMethodsClient.RecalculoSaldoAtualLote(Produto: string; Locais: string; Lote: string; DataAtual: TDateTime;
  CriaZerado: Boolean);
begin
  if FRecalculoSaldoAtualLoteCommand = nil then
  begin
    FRecalculoSaldoAtualLoteCommand := FDBXConnection.CreateCommand;
    FRecalculoSaldoAtualLoteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRecalculoSaldoAtualLoteCommand.Text := 'TDSServerMethods.RecalculoSaldoAtualLote';
    FRecalculoSaldoAtualLoteCommand.Prepare;
  end;
  FRecalculoSaldoAtualLoteCommand.Parameters[0].Value.SetWideString(Produto);
  FRecalculoSaldoAtualLoteCommand.Parameters[1].Value.SetWideString(Locais);
  FRecalculoSaldoAtualLoteCommand.Parameters[2].Value.SetWideString(Lote);
  FRecalculoSaldoAtualLoteCommand.Parameters[3].Value.AsDateTime := DataAtual;
  FRecalculoSaldoAtualLoteCommand.Parameters[4].Value.SetBoolean(CriaZerado);
  FRecalculoSaldoAtualLoteCommand.ExecuteUpdate;
end;

procedure TDSServerMethodsClient.RefazDadosCliente(Cliente: Integer);
begin
  if FRefazDadosClienteCommand = nil then
  begin
    FRefazDadosClienteCommand := FDBXConnection.CreateCommand;
    FRefazDadosClienteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRefazDadosClienteCommand.Text := 'TDSServerMethods.RefazDadosCliente';
    FRefazDadosClienteCommand.Prepare;
  end;
  FRefazDadosClienteCommand.Parameters[0].Value.SetInt32(Cliente);
  FRefazDadosClienteCommand.ExecuteUpdate;
end;

procedure TDSServerMethodsClient.RefazDadosFornecedor(Fornecedor: Integer);
begin
  if FRefazDadosFornecedorCommand = nil then
  begin
    FRefazDadosFornecedorCommand := FDBXConnection.CreateCommand;
    FRefazDadosFornecedorCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRefazDadosFornecedorCommand.Text := 'TDSServerMethods.RefazDadosFornecedor';
    FRefazDadosFornecedorCommand.Prepare;
  end;
  FRefazDadosFornecedorCommand.Parameters[0].Value.SetInt32(Fornecedor);
  FRefazDadosFornecedorCommand.ExecuteUpdate;
end;

function TDSServerMethodsClient.ObtemEstrutura(Produto: string): TJSONArray;
begin
  if FObtemEstruturaCommand = nil then
  begin
    FObtemEstruturaCommand := FDBXConnection.CreateCommand;
    FObtemEstruturaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FObtemEstruturaCommand.Text := 'TDSServerMethods.ObtemEstrutura';
    FObtemEstruturaCommand.Prepare;
  end;
  FObtemEstruturaCommand.Parameters[0].Value.SetWideString(Produto);
  FObtemEstruturaCommand.ExecuteUpdate;
  Result := TJSONArray(FObtemEstruturaCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

procedure TDSServerMethodsClient.ObtemRetencao10925(Carteira: string; Proprietario: Integer; DataPagamento: TDateTime;
  var ValorPago: Currency; var Base10925: Currency; var Valor10925: Currency; var ValorPIS: Currency; var ValorCOFINS: Currency;
  var ValorCSLL: Currency);
begin
  if FObtemRetencao10925Command = nil then
  begin
    FObtemRetencao10925Command := FDBXConnection.CreateCommand;
    FObtemRetencao10925Command.CommandType := TDBXCommandTypes.DSServerMethod;
    FObtemRetencao10925Command.Text := 'TDSServerMethods.ObtemRetencao10925';
    FObtemRetencao10925Command.Prepare;
  end;
  FObtemRetencao10925Command.Parameters[0].Value.SetWideString(Carteira);
  FObtemRetencao10925Command.Parameters[1].Value.SetInt32(Proprietario);
  FObtemRetencao10925Command.Parameters[2].Value.AsDateTime := DataPagamento;
  FObtemRetencao10925Command.Parameters[3].Value.AsCurrency := ValorPago;
  FObtemRetencao10925Command.Parameters[4].Value.AsCurrency := Base10925;
  FObtemRetencao10925Command.Parameters[5].Value.AsCurrency := Valor10925;
  FObtemRetencao10925Command.Parameters[6].Value.AsCurrency := ValorPIS;
  FObtemRetencao10925Command.Parameters[7].Value.AsCurrency := ValorCOFINS;
  FObtemRetencao10925Command.Parameters[8].Value.AsCurrency := ValorCSLL;
  FObtemRetencao10925Command.ExecuteUpdate;
  ValorPago := FObtemRetencao10925Command.Parameters[3].Value.AsCurrency;
  Base10925 := FObtemRetencao10925Command.Parameters[4].Value.AsCurrency;
  Valor10925 := FObtemRetencao10925Command.Parameters[5].Value.AsCurrency;
  ValorPIS := FObtemRetencao10925Command.Parameters[6].Value.AsCurrency;
  ValorCOFINS := FObtemRetencao10925Command.Parameters[7].Value.AsCurrency;
  ValorCSLL := FObtemRetencao10925Command.Parameters[8].Value.AsCurrency;
end;

function TDSServerMethodsClient.PegaSequenciaMovimentosInternos(Numero: Integer; Item: Integer): Integer;
begin
  if FPegaSequenciaMovimentosInternosCommand = nil then
  begin
    FPegaSequenciaMovimentosInternosCommand := FDBXConnection.CreateCommand;
    FPegaSequenciaMovimentosInternosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPegaSequenciaMovimentosInternosCommand.Text := 'TDSServerMethods.PegaSequenciaMovimentosInternos';
    FPegaSequenciaMovimentosInternosCommand.Prepare;
  end;
  FPegaSequenciaMovimentosInternosCommand.Parameters[0].Value.SetInt32(Numero);
  FPegaSequenciaMovimentosInternosCommand.Parameters[1].Value.SetInt32(Item);
  FPegaSequenciaMovimentosInternosCommand.ExecuteUpdate;
  Result := FPegaSequenciaMovimentosInternosCommand.Parameters[2].Value.GetInt32;
end;

function TDSServerMethodsClient.ObtemRegrasImpostosCategoria(Categoria: string): TJSONValue;
begin
  if FObtemRegrasImpostosCategoriaCommand = nil then
  begin
    FObtemRegrasImpostosCategoriaCommand := FDBXConnection.CreateCommand;
    FObtemRegrasImpostosCategoriaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FObtemRegrasImpostosCategoriaCommand.Text := 'TDSServerMethods.ObtemRegrasImpostosCategoria';
    FObtemRegrasImpostosCategoriaCommand.Prepare;
  end;
  FObtemRegrasImpostosCategoriaCommand.Parameters[0].Value.SetWideString(Categoria);
  FObtemRegrasImpostosCategoriaCommand.ExecuteUpdate;
  Result := TJSONValue(FObtemRegrasImpostosCategoriaCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TDSServerMethodsClient.GetNumberOfInstances(UserName: string; IP: string): Integer;
begin
  if FGetNumberOfInstancesCommand = nil then
  begin
    FGetNumberOfInstancesCommand := FDBXConnection.CreateCommand;
    FGetNumberOfInstancesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetNumberOfInstancesCommand.Text := 'TDSServerMethods.GetNumberOfInstances';
    FGetNumberOfInstancesCommand.Prepare;
  end;
  FGetNumberOfInstancesCommand.Parameters[0].Value.SetWideString(UserName);
  FGetNumberOfInstancesCommand.Parameters[1].Value.SetWideString(IP);
  FGetNumberOfInstancesCommand.ExecuteUpdate;
  Result := FGetNumberOfInstancesCommand.Parameters[2].Value.GetInt32;
end;

function TDSServerMethodsClient.GetGeneratorId(Company: string; Branch: string; EntityName: string; FieldName: string): Integer;
begin
  if FGetGeneratorIdCommand = nil then
  begin
    FGetGeneratorIdCommand := FDBXConnection.CreateCommand;
    FGetGeneratorIdCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetGeneratorIdCommand.Text := 'TDSServerMethods.GetGeneratorId';
    FGetGeneratorIdCommand.Prepare;
  end;
  FGetGeneratorIdCommand.Parameters[0].Value.SetWideString(Company);
  FGetGeneratorIdCommand.Parameters[1].Value.SetWideString(Branch);
  FGetGeneratorIdCommand.Parameters[2].Value.SetWideString(EntityName);
  FGetGeneratorIdCommand.Parameters[3].Value.SetWideString(FieldName);
  FGetGeneratorIdCommand.ExecuteUpdate;
  Result := FGetGeneratorIdCommand.Parameters[4].Value.GetInt32;
end;

function TDSServerMethodsClient.GetHTTPEnv: TJSONArray;
begin
  if FGetHTTPEnvCommand = nil then
  begin
    FGetHTTPEnvCommand := FDBXConnection.CreateCommand;
    FGetHTTPEnvCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetHTTPEnvCommand.Text := 'TDSServerMethods.GetHTTPEnv';
    FGetHTTPEnvCommand.Prepare;
  end;
  FGetHTTPEnvCommand.ExecuteUpdate;
  Result := TJSONArray(FGetHTTPEnvCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TDSServerMethodsClient.IsDevMode: Boolean;
begin
  if FIsDevModeCommand = nil then
  begin
    FIsDevModeCommand := FDBXConnection.CreateCommand;
    FIsDevModeCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FIsDevModeCommand.Text := 'TDSServerMethods.IsDevMode';
    FIsDevModeCommand.Prepare;
  end;
  FIsDevModeCommand.ExecuteUpdate;
  Result := FIsDevModeCommand.Parameters[0].Value.GetBoolean;
end;

function TDSServerMethodsClient.IsAutoEnv: Boolean;
begin
  if FIsAutoEnvCommand = nil then
  begin
    FIsAutoEnvCommand := FDBXConnection.CreateCommand;
    FIsAutoEnvCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FIsAutoEnvCommand.Text := 'TDSServerMethods.IsAutoEnv';
    FIsAutoEnvCommand.Prepare;
  end;
  FIsAutoEnvCommand.ExecuteUpdate;
  Result := FIsAutoEnvCommand.Parameters[0].Value.GetBoolean;
end;

function TDSServerMethodsClient.GetDevMode: string;
begin
  if FGetDevModeCommand = nil then
  begin
    FGetDevModeCommand := FDBXConnection.CreateCommand;
    FGetDevModeCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetDevModeCommand.Text := 'TDSServerMethods.GetDevMode';
    FGetDevModeCommand.Prepare;
  end;
  FGetDevModeCommand.ExecuteUpdate;
  Result := FGetDevModeCommand.Parameters[0].Value.GetWideString;
end;

function TDSServerMethodsClient.GetAutoEnv: string;
begin
  if FGetAutoEnvCommand = nil then
  begin
    FGetAutoEnvCommand := FDBXConnection.CreateCommand;
    FGetAutoEnvCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetAutoEnvCommand.Text := 'TDSServerMethods.GetAutoEnv';
    FGetAutoEnvCommand.Prepare;
  end;
  FGetAutoEnvCommand.ExecuteUpdate;
  Result := FGetAutoEnvCommand.Parameters[0].Value.GetWideString;
end;

function TDSServerMethodsClient.GetLoggedUserList: TJSONArray;
begin
  if FGetLoggedUserListCommand = nil then
  begin
    FGetLoggedUserListCommand := FDBXConnection.CreateCommand;
    FGetLoggedUserListCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetLoggedUserListCommand.Text := 'TDSServerMethods.GetLoggedUserList';
    FGetLoggedUserListCommand.Prepare;
  end;
  FGetLoggedUserListCommand.ExecuteUpdate;
  Result := TJSONArray(FGetLoggedUserListCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TDSServerMethodsClient.Encrypter(Encrypt: Boolean; Source: string; StartKey: Integer; MultKey: Integer;
  AddKey: Integer): string;
begin
  if FEncrypterCommand = nil then
  begin
    FEncrypterCommand := FDBXConnection.CreateCommand;
    FEncrypterCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEncrypterCommand.Text := 'TDSServerMethods.Encrypter';
    FEncrypterCommand.Prepare;
  end;
  FEncrypterCommand.Parameters[0].Value.SetBoolean(Encrypt);
  FEncrypterCommand.Parameters[1].Value.SetWideString(Source);
  FEncrypterCommand.Parameters[2].Value.SetInt32(StartKey);
  FEncrypterCommand.Parameters[3].Value.SetInt32(MultKey);
  FEncrypterCommand.Parameters[4].Value.SetInt32(AddKey);
  FEncrypterCommand.ExecuteUpdate;
  Result := FEncrypterCommand.Parameters[5].Value.GetWideString;
end;

function TDSServerMethodsClient.RSAEncrypter(Encrypt: Boolean; Source: string): string;
begin
  if FRSAEncrypterCommand = nil then
  begin
    FRSAEncrypterCommand := FDBXConnection.CreateCommand;
    FRSAEncrypterCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRSAEncrypterCommand.Text := 'TDSServerMethods.RSAEncrypter';
    FRSAEncrypterCommand.Prepare;
  end;
  FRSAEncrypterCommand.Parameters[0].Value.SetBoolean(Encrypt);
  FRSAEncrypterCommand.Parameters[1].Value.SetWideString(Source);
  FRSAEncrypterCommand.ExecuteUpdate;
  Result := FRSAEncrypterCommand.Parameters[2].Value.GetWideString;
end;

function TDSServerMethodsClient.GetUserGredentials: Boolean;
begin
  if FGetUserGredentialsCommand = nil then
  begin
    FGetUserGredentialsCommand := FDBXConnection.CreateCommand;
    FGetUserGredentialsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetUserGredentialsCommand.Text := 'TDSServerMethods.GetUserGredentials';
    FGetUserGredentialsCommand.Prepare;
  end;
  FGetUserGredentialsCommand.ExecuteUpdate;
  Result := FGetUserGredentialsCommand.Parameters[0].Value.GetBoolean;
end;

function TDSServerMethodsClient.HasCredits: Boolean;
begin
  if FHasCreditsCommand = nil then
  begin
    FHasCreditsCommand := FDBXConnection.CreateCommand;
    FHasCreditsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FHasCreditsCommand.Text := 'TDSServerMethods.HasCredits';
    FHasCreditsCommand.Prepare;
  end;
  FHasCreditsCommand.ExecuteUpdate;
  Result := FHasCreditsCommand.Parameters[0].Value.GetBoolean;
end;

procedure TDSServerMethodsClient.RetornaCliente(Fornecedor: Integer; var Cliente: Integer; var Nome: string; var CNPJ: string;
  out Erro: Boolean);
begin
  if FRetornaClienteCommand = nil then
  begin
    FRetornaClienteCommand := FDBXConnection.CreateCommand;
    FRetornaClienteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRetornaClienteCommand.Text := 'TDSServerMethods.RetornaCliente';
    FRetornaClienteCommand.Prepare;
  end;
  FRetornaClienteCommand.Parameters[0].Value.SetInt32(Fornecedor);
  FRetornaClienteCommand.Parameters[1].Value.SetInt32(Cliente);
  FRetornaClienteCommand.Parameters[2].Value.SetWideString(Nome);
  FRetornaClienteCommand.Parameters[3].Value.SetWideString(CNPJ);
  FRetornaClienteCommand.ExecuteUpdate;
  Cliente := FRetornaClienteCommand.Parameters[1].Value.GetInt32;
  Nome := FRetornaClienteCommand.Parameters[2].Value.GetWideString;
  CNPJ := FRetornaClienteCommand.Parameters[3].Value.GetWideString;
  Erro := FRetornaClienteCommand.Parameters[4].Value.GetBoolean;
end;

procedure TDSServerMethodsClient.RetornaFornecedor(Cliente: Integer; var Fornecedor: Integer; var Nome: string; var CNPJ: string;
  out Erro: Boolean);
begin
  if FRetornaFornecedorCommand = nil then
  begin
    FRetornaFornecedorCommand := FDBXConnection.CreateCommand;
    FRetornaFornecedorCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRetornaFornecedorCommand.Text := 'TDSServerMethods.RetornaFornecedor';
    FRetornaFornecedorCommand.Prepare;
  end;
  FRetornaFornecedorCommand.Parameters[0].Value.SetInt32(Cliente);
  FRetornaFornecedorCommand.Parameters[1].Value.SetInt32(Fornecedor);
  FRetornaFornecedorCommand.Parameters[2].Value.SetWideString(Nome);
  FRetornaFornecedorCommand.Parameters[3].Value.SetWideString(CNPJ);
  FRetornaFornecedorCommand.ExecuteUpdate;
  Fornecedor := FRetornaFornecedorCommand.Parameters[1].Value.GetInt32;
  Nome := FRetornaFornecedorCommand.Parameters[2].Value.GetWideString;
  CNPJ := FRetornaFornecedorCommand.Parameters[3].Value.GetWideString;
  Erro := FRetornaFornecedorCommand.Parameters[4].Value.GetBoolean;
end;

constructor TDSServerMethodsClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;

constructor TDSServerMethodsClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TDSServerMethodsClient.Destroy;
begin
  FreeAndNil(FEchoStringCommand);
  FreeAndNil(FReverseStringCommand);
  FreeAndNil(FDoConnectionCommand);
  FreeAndNil(FGetDataBaseTablesCommand);
  FreeAndNil(FGetEntityOwnerCommand);
  FreeAndNil(FGetEntityNameCommand);
  FreeAndNil(FGetSQLStatementCommand);
  FreeAndNil(FSetUserCommand);
  FreeAndNil(FGetServerSectionsCommand);
  FreeAndNil(FGetSectionDisplayNameCommand);
  FreeAndNil(FGetSectionDebugClientProgramsCommand);
  FreeAndNil(FGetSectionConfigurationsCommand);
  FreeAndNil(FCheckSystemFilesCommand);
  FreeAndNil(FGetSystemDirectoryCommand);
  FreeAndNil(FSplitCommand);
  FreeAndNil(FGetActivedEnvCommand);
  FreeAndNil(FGetInactiveCustomsCommand);
  FreeAndNil(FGetLicenseInfCommand);
  FreeAndNil(FGetDaysToExpiresCommand);
  FreeAndNil(FIsLockedLicenseCommand);
  FreeAndNil(FIsValidCompanyLicenseCommand);
  FreeAndNil(FGetServerDateTimeCommand);
  FreeAndNil(FExecuteQueryCommand);
  FreeAndNil(FExecuteQueryByXMLCommand);
  FreeAndNil(FGetFormDefsCommand);
  FreeAndNil(FPutFormDefsCommand);
  FreeAndNil(FPutUserConfigurarionsCommand);
  FreeAndNil(FGetUserConfigurationsCommand);
  FreeAndNil(FGetUserThreadIdCommand);
  FreeAndNil(FObtemMoedaCommand);
  FreeAndNil(FSaveLocalDataSetCommand);
  FreeAndNil(FLoadLocalDataSetCommand);
  FreeAndNil(FSaveRemoteFileCommand);
  FreeAndNil(FSaveRemoteBinaryFileCommand);
  FreeAndNil(FLoadRemoteFileCommand);
  FreeAndNil(FLoadRemoteBinaryFileCommand);
  FreeAndNil(FRemoteFileExistsCommand);
  FreeAndNil(FDeleteRemoteFileCommand);
  FreeAndNil(FGetTipsCommand);
  FreeAndNil(FDiaUtilCommand);
  FreeAndNil(FGeraTitulosCommand);
  FreeAndNil(FRetornaTitulosCommand);
  FreeAndNil(FObtemReservaPedidoVendaCommand);
  FreeAndNil(FPegaSaldoInicialEstoqueCommand);
  FreeAndNil(FPegaSaldoInicialEstoqueLoteCommand);
  FreeAndNil(FPegaBaixasTituloCommand);
  FreeAndNil(FPegaSaldoBancarioCommand);
  FreeAndNil(FPegaLimiteCreditoBancarioCommand);
  FreeAndNil(FFechamentoEstoqueCommand);
  FreeAndNil(FTemBaixasPagarCommand);
  FreeAndNil(FAtualizaSerieNotaFiscalCommand);
  FreeAndNil(FConverteMoedaCommand);
  FreeAndNil(FPegaSaldoAtualEstoqueCommand);
  FreeAndNil(FExecuteSQLCommand);
  FreeAndNil(FReajustePrecosCommand);
  FreeAndNil(FRecalculoSaldosBancariosCommand);
  FreeAndNil(FFechamentoComissaoVendedorCommand);
  FreeAndNil(FRefazReservasCommand);
  FreeAndNil(FRefazAcumuladosCommand);
  FreeAndNil(FRefazSaldosTerceirosCommand);
  FreeAndNil(FReApropriaCustoMedioCommand);
  FreeAndNil(FRecalculoDemandasVendasCommand);
  FreeAndNil(FRecalculoSaldoAtualCommand);
  FreeAndNil(FRecalculoSaldoAtualLoteCommand);
  FreeAndNil(FRefazDadosClienteCommand);
  FreeAndNil(FRefazDadosFornecedorCommand);
  FreeAndNil(FObtemEstruturaCommand);
  FreeAndNil(FObtemRetencao10925Command);
  FreeAndNil(FPegaSequenciaMovimentosInternosCommand);
  FreeAndNil(FObtemRegrasImpostosCategoriaCommand);
  FreeAndNil(FGetNumberOfInstancesCommand);
  FreeAndNil(FGetGeneratorIdCommand);
  FreeAndNil(FGetHTTPEnvCommand);
  FreeAndNil(FIsDevModeCommand);
  FreeAndNil(FIsAutoEnvCommand);
  FreeAndNil(FGetDevModeCommand);
  FreeAndNil(FGetAutoEnvCommand);
  FreeAndNil(FGetLoggedUserListCommand);
  FreeAndNil(FEncrypterCommand);
  FreeAndNil(FRSAEncrypterCommand);
  FreeAndNil(FGetUserGredentialsCommand);
  FreeAndNil(FHasCreditsCommand);
  FreeAndNil(FRetornaClienteCommand);
  FreeAndNil(FRetornaFornecedorCommand);
  inherited;
end;

procedure TDSSMEstruturaClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'TDSSMEstrutura.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;

procedure TDSSMEstruturaClient.DSServerModuleDestroy(Sender: TObject);
begin
  if FDSServerModuleDestroyCommand = nil then
  begin
    FDSServerModuleDestroyCommand := FDBXConnection.CreateCommand;
    FDSServerModuleDestroyCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleDestroyCommand.Text := 'TDSSMEstrutura.DSServerModuleDestroy';
    FDSServerModuleDestroyCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleDestroyCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleDestroyCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleDestroyCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FDSServerModuleDestroyCommand.ExecuteUpdate;
end;

constructor TDSSMEstruturaClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;

constructor TDSSMEstruturaClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TDSSMEstruturaClient.Destroy;
begin
  FreeAndNil(FDSServerModuleCreateCommand);
  FreeAndNil(FDSServerModuleDestroyCommand);
  inherited;
end;

procedure TDSSMCadClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'TDSSMCad.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;

procedure TDSSMCadClient.DSServerModuleDestroy(Sender: TObject);
begin
  if FDSServerModuleDestroyCommand = nil then
  begin
    FDSServerModuleDestroyCommand := FDBXConnection.CreateCommand;
    FDSServerModuleDestroyCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleDestroyCommand.Text := 'TDSSMCad.DSServerModuleDestroy';
    FDSServerModuleDestroyCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleDestroyCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleDestroyCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleDestroyCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FDSServerModuleDestroyCommand.ExecuteUpdate;
end;

procedure TDSSMCadClient.dspClientesAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspClientesAfterApplyUpdatesCommand = nil then
  begin
    FdspClientesAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspClientesAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspClientesAfterApplyUpdatesCommand.Text := 'TDSSMCad.dspClientesAfterApplyUpdates';
    FdspClientesAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspClientesAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspClientesAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspClientesAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspClientesAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspClientesAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspClientesAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCadClient.dspClientes_GruposAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspClientes_GruposAfterApplyUpdatesCommand = nil then
  begin
    FdspClientes_GruposAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspClientes_GruposAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspClientes_GruposAfterApplyUpdatesCommand.Text := 'TDSSMCad.dspClientes_GruposAfterApplyUpdates';
    FdspClientes_GruposAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspClientes_GruposAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspClientes_GruposAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspClientes_GruposAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspClientes_GruposAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspClientes_GruposAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspClientes_GruposAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCadClient.dspClientes_Tabelas_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspClientes_Tabelas_DadosAfterApplyUpdatesCommand = nil then
  begin
    FdspClientes_Tabelas_DadosAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspClientes_Tabelas_DadosAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspClientes_Tabelas_DadosAfterApplyUpdatesCommand.Text := 'TDSSMCad.dspClientes_Tabelas_DadosAfterApplyUpdates';
    FdspClientes_Tabelas_DadosAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspClientes_Tabelas_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspClientes_Tabelas_DadosAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler)
      .GetJSONMarshaler;
    try
      FdspClientes_Tabelas_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspClientes_Tabelas_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspClientes_Tabelas_DadosAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspClientes_Tabelas_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCadClient.dspFornecedoresAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspFornecedoresAfterApplyUpdatesCommand = nil then
  begin
    FdspFornecedoresAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspFornecedoresAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspFornecedoresAfterApplyUpdatesCommand.Text := 'TDSSMCad.dspFornecedoresAfterApplyUpdates';
    FdspFornecedoresAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspFornecedoresAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspFornecedoresAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspFornecedoresAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspFornecedoresAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspFornecedoresAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspFornecedoresAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCadClient.dspFornecedores_Tabelas_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspFornecedores_Tabelas_DadosAfterApplyUpdatesCommand = nil then
  begin
    FdspFornecedores_Tabelas_DadosAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspFornecedores_Tabelas_DadosAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspFornecedores_Tabelas_DadosAfterApplyUpdatesCommand.Text := 'TDSSMCad.dspFornecedores_Tabelas_DadosAfterApplyUpdates';
    FdspFornecedores_Tabelas_DadosAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspFornecedores_Tabelas_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspFornecedores_Tabelas_DadosAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler)
      .GetJSONMarshaler;
    try
      FdspFornecedores_Tabelas_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspFornecedores_Tabelas_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspFornecedores_Tabelas_DadosAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspFornecedores_Tabelas_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCadClient.dspProdutos_GruposAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspProdutos_GruposAfterApplyUpdatesCommand = nil then
  begin
    FdspProdutos_GruposAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspProdutos_GruposAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspProdutos_GruposAfterApplyUpdatesCommand.Text := 'TDSSMCad.dspProdutos_GruposAfterApplyUpdates';
    FdspProdutos_GruposAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspProdutos_GruposAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspProdutos_GruposAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspProdutos_GruposAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspProdutos_GruposAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspProdutos_GruposAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspProdutos_GruposAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCadClient.dspProdutos_SubGruposAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspProdutos_SubGruposAfterApplyUpdatesCommand = nil then
  begin
    FdspProdutos_SubGruposAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspProdutos_SubGruposAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspProdutos_SubGruposAfterApplyUpdatesCommand.Text := 'TDSSMCad.dspProdutos_SubGruposAfterApplyUpdates';
    FdspProdutos_SubGruposAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspProdutos_SubGruposAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspProdutos_SubGruposAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler)
      .GetJSONMarshaler;
    try
      FdspProdutos_SubGruposAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspProdutos_SubGruposAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspProdutos_SubGruposAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspProdutos_SubGruposAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCadClient.dspCondicoes_PagamentosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspCondicoes_PagamentosAfterApplyUpdatesCommand = nil then
  begin
    FdspCondicoes_PagamentosAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspCondicoes_PagamentosAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspCondicoes_PagamentosAfterApplyUpdatesCommand.Text := 'TDSSMCad.dspCondicoes_PagamentosAfterApplyUpdates';
    FdspCondicoes_PagamentosAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspCondicoes_PagamentosAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspCondicoes_PagamentosAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler)
      .GetJSONMarshaler;
    try
      FdspCondicoes_PagamentosAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspCondicoes_PagamentosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspCondicoes_PagamentosAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspCondicoes_PagamentosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCadClient.dspVendedoresAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspVendedoresAfterApplyUpdatesCommand = nil then
  begin
    FdspVendedoresAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspVendedoresAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspVendedoresAfterApplyUpdatesCommand.Text := 'TDSSMCad.dspVendedoresAfterApplyUpdates';
    FdspVendedoresAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspVendedoresAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspVendedoresAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspVendedoresAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspVendedoresAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspVendedoresAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspVendedoresAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCadClient.dspTransportadorasAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspTransportadorasAfterApplyUpdatesCommand = nil then
  begin
    FdspTransportadorasAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspTransportadorasAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspTransportadorasAfterApplyUpdatesCommand.Text := 'TDSSMCad.dspTransportadorasAfterApplyUpdates';
    FdspTransportadorasAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspTransportadorasAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspTransportadorasAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspTransportadorasAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspTransportadorasAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspTransportadorasAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspTransportadorasAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCadClient.dspRegras_FiscaisAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspRegras_FiscaisAfterApplyUpdatesCommand = nil then
  begin
    FdspRegras_FiscaisAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspRegras_FiscaisAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspRegras_FiscaisAfterApplyUpdatesCommand.Text := 'TDSSMCad.dspRegras_FiscaisAfterApplyUpdates';
    FdspRegras_FiscaisAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspRegras_FiscaisAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspRegras_FiscaisAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspRegras_FiscaisAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspRegras_FiscaisAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspRegras_FiscaisAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspRegras_FiscaisAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCadClient.dspSegmentos_MercadoAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspSegmentos_MercadoAfterApplyUpdatesCommand = nil then
  begin
    FdspSegmentos_MercadoAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspSegmentos_MercadoAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspSegmentos_MercadoAfterApplyUpdatesCommand.Text := 'TDSSMCad.dspSegmentos_MercadoAfterApplyUpdates';
    FdspSegmentos_MercadoAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspSegmentos_MercadoAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspSegmentos_MercadoAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspSegmentos_MercadoAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspSegmentos_MercadoAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspSegmentos_MercadoAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspSegmentos_MercadoAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCadClient.dspRegras_BaixasAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspRegras_BaixasAfterApplyUpdatesCommand = nil then
  begin
    FdspRegras_BaixasAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspRegras_BaixasAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspRegras_BaixasAfterApplyUpdatesCommand.Text := 'TDSSMCad.dspRegras_BaixasAfterApplyUpdates';
    FdspRegras_BaixasAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspRegras_BaixasAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspRegras_BaixasAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspRegras_BaixasAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspRegras_BaixasAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspRegras_BaixasAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspRegras_BaixasAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCadClient.dspRegras_EstoqueAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspRegras_EstoqueAfterApplyUpdatesCommand = nil then
  begin
    FdspRegras_EstoqueAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspRegras_EstoqueAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspRegras_EstoqueAfterApplyUpdatesCommand.Text := 'TDSSMCad.dspRegras_EstoqueAfterApplyUpdates';
    FdspRegras_EstoqueAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspRegras_EstoqueAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspRegras_EstoqueAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspRegras_EstoqueAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspRegras_EstoqueAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspRegras_EstoqueAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspRegras_EstoqueAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCadClient.dspFaixas_GruposAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspFaixas_GruposAfterApplyUpdatesCommand = nil then
  begin
    FdspFaixas_GruposAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspFaixas_GruposAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspFaixas_GruposAfterApplyUpdatesCommand.Text := 'TDSSMCad.dspFaixas_GruposAfterApplyUpdates';
    FdspFaixas_GruposAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspFaixas_GruposAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspFaixas_GruposAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspFaixas_GruposAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspFaixas_GruposAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspFaixas_GruposAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspFaixas_GruposAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCadClient.dspEstacoesAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspEstacoesAfterApplyUpdatesCommand = nil then
  begin
    FdspEstacoesAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspEstacoesAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspEstacoesAfterApplyUpdatesCommand.Text := 'TDSSMCad.dspEstacoesAfterApplyUpdates';
    FdspEstacoesAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspEstacoesAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspEstacoesAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspEstacoesAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspEstacoesAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspEstacoesAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspEstacoesAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCadClient.dspAdministradorasAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspAdministradorasAfterApplyUpdatesCommand = nil then
  begin
    FdspAdministradorasAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspAdministradorasAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspAdministradorasAfterApplyUpdatesCommand.Text := 'TDSSMCad.dspAdministradorasAfterApplyUpdates';
    FdspAdministradorasAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspAdministradorasAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspAdministradorasAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspAdministradorasAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspAdministradorasAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspAdministradorasAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspAdministradorasAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCadClient.dspConcorrentes_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspConcorrentes_DadosAfterApplyUpdatesCommand = nil then
  begin
    FdspConcorrentes_DadosAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspConcorrentes_DadosAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspConcorrentes_DadosAfterApplyUpdatesCommand.Text := 'TDSSMCad.dspConcorrentes_DadosAfterApplyUpdates';
    FdspConcorrentes_DadosAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspConcorrentes_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspConcorrentes_DadosAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler)
      .GetJSONMarshaler;
    try
      FdspConcorrentes_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspConcorrentes_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspConcorrentes_DadosAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspConcorrentes_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCadClient.dspFornecedores_GruposAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspFornecedores_GruposAfterApplyUpdatesCommand = nil then
  begin
    FdspFornecedores_GruposAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspFornecedores_GruposAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspFornecedores_GruposAfterApplyUpdatesCommand.Text := 'TDSSMCad.dspFornecedores_GruposAfterApplyUpdates';
    FdspFornecedores_GruposAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspFornecedores_GruposAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspFornecedores_GruposAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler)
      .GetJSONMarshaler;
    try
      FdspFornecedores_GruposAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspFornecedores_GruposAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspFornecedores_GruposAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspFornecedores_GruposAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCadClient.dspClientesGetData(Sender: TObject; DataSet: TCustomClientDataSet);
begin
  if FdspClientesGetDataCommand = nil then
  begin
    FdspClientesGetDataCommand := FDBXConnection.CreateCommand;
    FdspClientesGetDataCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspClientesGetDataCommand.Text := 'TDSSMCad.dspClientesGetData';
    FdspClientesGetDataCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspClientesGetDataCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspClientesGetDataCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspClientesGetDataCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  if not Assigned(DataSet) then
    FdspClientesGetDataCommand.Parameters[1].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspClientesGetDataCommand.Parameters[1].ConnectionHandler).GetJSONMarshaler;
    try
      FdspClientesGetDataCommand.Parameters[1].Value.SetJSONValue(FMarshal.Marshal(DataSet), True);
      if FInstanceOwner then
        DataSet.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspClientesGetDataCommand.ExecuteUpdate;
end;

procedure TDSSMCadClient.dspClientesAfterGetRecords(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspClientesAfterGetRecordsCommand = nil then
  begin
    FdspClientesAfterGetRecordsCommand := FDBXConnection.CreateCommand;
    FdspClientesAfterGetRecordsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspClientesAfterGetRecordsCommand.Text := 'TDSSMCad.dspClientesAfterGetRecords';
    FdspClientesAfterGetRecordsCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspClientesAfterGetRecordsCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspClientesAfterGetRecordsCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspClientesAfterGetRecordsCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspClientesAfterGetRecordsCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspClientesAfterGetRecordsCommand.ExecuteUpdate;
  OwnerData := FdspClientesAfterGetRecordsCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCadClient.dspClientesBeforeGetRecords(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspClientesBeforeGetRecordsCommand = nil then
  begin
    FdspClientesBeforeGetRecordsCommand := FDBXConnection.CreateCommand;
    FdspClientesBeforeGetRecordsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspClientesBeforeGetRecordsCommand.Text := 'TDSSMCad.dspClientesBeforeGetRecords';
    FdspClientesBeforeGetRecordsCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspClientesBeforeGetRecordsCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspClientesBeforeGetRecordsCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspClientesBeforeGetRecordsCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspClientesBeforeGetRecordsCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspClientesBeforeGetRecordsCommand.ExecuteUpdate;
  OwnerData := FdspClientesBeforeGetRecordsCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCadClient.dspLayOut_CNAB_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspLayOut_CNAB_DadosAfterApplyUpdatesCommand = nil then
  begin
    FdspLayOut_CNAB_DadosAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspLayOut_CNAB_DadosAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspLayOut_CNAB_DadosAfterApplyUpdatesCommand.Text := 'TDSSMCad.dspLayOut_CNAB_DadosAfterApplyUpdates';
    FdspLayOut_CNAB_DadosAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspLayOut_CNAB_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspLayOut_CNAB_DadosAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspLayOut_CNAB_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspLayOut_CNAB_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspLayOut_CNAB_DadosAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspLayOut_CNAB_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCadClient.dspProcessos_ProdutivosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspProcessos_ProdutivosAfterApplyUpdatesCommand = nil then
  begin
    FdspProcessos_ProdutivosAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspProcessos_ProdutivosAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspProcessos_ProdutivosAfterApplyUpdatesCommand.Text := 'TDSSMCad.dspProcessos_ProdutivosAfterApplyUpdates';
    FdspProcessos_ProdutivosAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspProcessos_ProdutivosAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspProcessos_ProdutivosAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler)
      .GetJSONMarshaler;
    try
      FdspProcessos_ProdutivosAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspProcessos_ProdutivosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspProcessos_ProdutivosAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspProcessos_ProdutivosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

constructor TDSSMCadClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;

constructor TDSSMCadClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TDSSMCadClient.Destroy;
begin
  FreeAndNil(FDSServerModuleCreateCommand);
  FreeAndNil(FDSServerModuleDestroyCommand);
  FreeAndNil(FdspClientesAfterApplyUpdatesCommand);
  FreeAndNil(FdspClientes_GruposAfterApplyUpdatesCommand);
  FreeAndNil(FdspClientes_Tabelas_DadosAfterApplyUpdatesCommand);
  FreeAndNil(FdspFornecedoresAfterApplyUpdatesCommand);
  FreeAndNil(FdspFornecedores_Tabelas_DadosAfterApplyUpdatesCommand);
  FreeAndNil(FdspProdutos_GruposAfterApplyUpdatesCommand);
  FreeAndNil(FdspProdutos_SubGruposAfterApplyUpdatesCommand);
  FreeAndNil(FdspCondicoes_PagamentosAfterApplyUpdatesCommand);
  FreeAndNil(FdspVendedoresAfterApplyUpdatesCommand);
  FreeAndNil(FdspTransportadorasAfterApplyUpdatesCommand);
  FreeAndNil(FdspRegras_FiscaisAfterApplyUpdatesCommand);
  FreeAndNil(FdspSegmentos_MercadoAfterApplyUpdatesCommand);
  FreeAndNil(FdspRegras_BaixasAfterApplyUpdatesCommand);
  FreeAndNil(FdspRegras_EstoqueAfterApplyUpdatesCommand);
  FreeAndNil(FdspFaixas_GruposAfterApplyUpdatesCommand);
  FreeAndNil(FdspEstacoesAfterApplyUpdatesCommand);
  FreeAndNil(FdspAdministradorasAfterApplyUpdatesCommand);
  FreeAndNil(FdspConcorrentes_DadosAfterApplyUpdatesCommand);
  FreeAndNil(FdspFornecedores_GruposAfterApplyUpdatesCommand);
  FreeAndNil(FdspClientesGetDataCommand);
  FreeAndNil(FdspClientesAfterGetRecordsCommand);
  FreeAndNil(FdspClientesBeforeGetRecordsCommand);
  FreeAndNil(FdspLayOut_CNAB_DadosAfterApplyUpdatesCommand);
  FreeAndNil(FdspProcessos_ProdutivosAfterApplyUpdatesCommand);
  inherited;
end;

procedure TDSSMLanClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'TDSSMLan.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;

procedure TDSSMLanClient.DSServerModuleDestroy(Sender: TObject);
begin
  if FDSServerModuleDestroyCommand = nil then
  begin
    FDSServerModuleDestroyCommand := FDBXConnection.CreateCommand;
    FDSServerModuleDestroyCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleDestroyCommand.Text := 'TDSSMLan.DSServerModuleDestroy';
    FDSServerModuleDestroyCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleDestroyCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleDestroyCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleDestroyCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FDSServerModuleDestroyCommand.ExecuteUpdate;
end;

procedure TDSSMLanClient.dspPedidos_Vendas_DadosBeforeApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspPedidos_Vendas_DadosBeforeApplyUpdatesCommand = nil then
  begin
    FdspPedidos_Vendas_DadosBeforeApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspPedidos_Vendas_DadosBeforeApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspPedidos_Vendas_DadosBeforeApplyUpdatesCommand.Text := 'TDSSMLan.dspPedidos_Vendas_DadosBeforeApplyUpdates';
    FdspPedidos_Vendas_DadosBeforeApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspPedidos_Vendas_DadosBeforeApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspPedidos_Vendas_DadosBeforeApplyUpdatesCommand.Parameters[0].ConnectionHandler)
      .GetJSONMarshaler;
    try
      FdspPedidos_Vendas_DadosBeforeApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspPedidos_Vendas_DadosBeforeApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspPedidos_Vendas_DadosBeforeApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspPedidos_Vendas_DadosBeforeApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMLanClient.dspPedidos_Compras_DadosBeforeApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspPedidos_Compras_DadosBeforeApplyUpdatesCommand = nil then
  begin
    FdspPedidos_Compras_DadosBeforeApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspPedidos_Compras_DadosBeforeApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspPedidos_Compras_DadosBeforeApplyUpdatesCommand.Text := 'TDSSMLan.dspPedidos_Compras_DadosBeforeApplyUpdates';
    FdspPedidos_Compras_DadosBeforeApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspPedidos_Compras_DadosBeforeApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspPedidos_Compras_DadosBeforeApplyUpdatesCommand.Parameters[0].ConnectionHandler)
      .GetJSONMarshaler;
    try
      FdspPedidos_Compras_DadosBeforeApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspPedidos_Compras_DadosBeforeApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspPedidos_Compras_DadosBeforeApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspPedidos_Compras_DadosBeforeApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMLanClient.dspNotas_Entradas_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspNotas_Entradas_DadosAfterApplyUpdatesCommand = nil then
  begin
    FdspNotas_Entradas_DadosAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspNotas_Entradas_DadosAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspNotas_Entradas_DadosAfterApplyUpdatesCommand.Text := 'TDSSMLan.dspNotas_Entradas_DadosAfterApplyUpdates';
    FdspNotas_Entradas_DadosAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspNotas_Entradas_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspNotas_Entradas_DadosAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler)
      .GetJSONMarshaler;
    try
      FdspNotas_Entradas_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspNotas_Entradas_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspNotas_Entradas_DadosAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspNotas_Entradas_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMLanClient.dspPedidos_Compras_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspPedidos_Compras_DadosAfterApplyUpdatesCommand = nil then
  begin
    FdspPedidos_Compras_DadosAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspPedidos_Compras_DadosAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspPedidos_Compras_DadosAfterApplyUpdatesCommand.Text := 'TDSSMLan.dspPedidos_Compras_DadosAfterApplyUpdates';
    FdspPedidos_Compras_DadosAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspPedidos_Compras_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspPedidos_Compras_DadosAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler)
      .GetJSONMarshaler;
    try
      FdspPedidos_Compras_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspPedidos_Compras_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspPedidos_Compras_DadosAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspPedidos_Compras_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMLanClient.dspPedidos_Vendas_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspPedidos_Vendas_DadosAfterApplyUpdatesCommand = nil then
  begin
    FdspPedidos_Vendas_DadosAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspPedidos_Vendas_DadosAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspPedidos_Vendas_DadosAfterApplyUpdatesCommand.Text := 'TDSSMLan.dspPedidos_Vendas_DadosAfterApplyUpdates';
    FdspPedidos_Vendas_DadosAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspPedidos_Vendas_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspPedidos_Vendas_DadosAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler)
      .GetJSONMarshaler;
    try
      FdspPedidos_Vendas_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspPedidos_Vendas_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspPedidos_Vendas_DadosAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspPedidos_Vendas_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMLanClient.dspNotas_Entradas_DadosBeforeApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspNotas_Entradas_DadosBeforeApplyUpdatesCommand = nil then
  begin
    FdspNotas_Entradas_DadosBeforeApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspNotas_Entradas_DadosBeforeApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspNotas_Entradas_DadosBeforeApplyUpdatesCommand.Text := 'TDSSMLan.dspNotas_Entradas_DadosBeforeApplyUpdates';
    FdspNotas_Entradas_DadosBeforeApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspNotas_Entradas_DadosBeforeApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspNotas_Entradas_DadosBeforeApplyUpdatesCommand.Parameters[0].ConnectionHandler)
      .GetJSONMarshaler;
    try
      FdspNotas_Entradas_DadosBeforeApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspNotas_Entradas_DadosBeforeApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspNotas_Entradas_DadosBeforeApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspNotas_Entradas_DadosBeforeApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMLanClient.dspBorderos_DadosBeforeApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspBorderos_DadosBeforeApplyUpdatesCommand = nil then
  begin
    FdspBorderos_DadosBeforeApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspBorderos_DadosBeforeApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspBorderos_DadosBeforeApplyUpdatesCommand.Text := 'TDSSMLan.dspBorderos_DadosBeforeApplyUpdates';
    FdspBorderos_DadosBeforeApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspBorderos_DadosBeforeApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspBorderos_DadosBeforeApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspBorderos_DadosBeforeApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspBorderos_DadosBeforeApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspBorderos_DadosBeforeApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspBorderos_DadosBeforeApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMLanClient.dspBorderos_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspBorderos_DadosAfterApplyUpdatesCommand = nil then
  begin
    FdspBorderos_DadosAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspBorderos_DadosAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspBorderos_DadosAfterApplyUpdatesCommand.Text := 'TDSSMLan.dspBorderos_DadosAfterApplyUpdates';
    FdspBorderos_DadosAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspBorderos_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspBorderos_DadosAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspBorderos_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspBorderos_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspBorderos_DadosAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspBorderos_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMLanClient.dspNotas_Saidas_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspNotas_Saidas_DadosAfterApplyUpdatesCommand = nil then
  begin
    FdspNotas_Saidas_DadosAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspNotas_Saidas_DadosAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspNotas_Saidas_DadosAfterApplyUpdatesCommand.Text := 'TDSSMLan.dspNotas_Saidas_DadosAfterApplyUpdates';
    FdspNotas_Saidas_DadosAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspNotas_Saidas_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspNotas_Saidas_DadosAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler)
      .GetJSONMarshaler;
    try
      FdspNotas_Saidas_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspNotas_Saidas_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspNotas_Saidas_DadosAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspNotas_Saidas_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMLanClient.dspNotas_Saidas_DadosBeforeApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspNotas_Saidas_DadosBeforeApplyUpdatesCommand = nil then
  begin
    FdspNotas_Saidas_DadosBeforeApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspNotas_Saidas_DadosBeforeApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspNotas_Saidas_DadosBeforeApplyUpdatesCommand.Text := 'TDSSMLan.dspNotas_Saidas_DadosBeforeApplyUpdates';
    FdspNotas_Saidas_DadosBeforeApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspNotas_Saidas_DadosBeforeApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspNotas_Saidas_DadosBeforeApplyUpdatesCommand.Parameters[0].ConnectionHandler)
      .GetJSONMarshaler;
    try
      FdspNotas_Saidas_DadosBeforeApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspNotas_Saidas_DadosBeforeApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspNotas_Saidas_DadosBeforeApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspNotas_Saidas_DadosBeforeApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMLanClient.dspVendas_Balcao_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspVendas_Balcao_DadosAfterApplyUpdatesCommand = nil then
  begin
    FdspVendas_Balcao_DadosAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspVendas_Balcao_DadosAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspVendas_Balcao_DadosAfterApplyUpdatesCommand.Text := 'TDSSMLan.dspVendas_Balcao_DadosAfterApplyUpdates';
    FdspVendas_Balcao_DadosAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspVendas_Balcao_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspVendas_Balcao_DadosAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler)
      .GetJSONMarshaler;
    try
      FdspVendas_Balcao_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspVendas_Balcao_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspVendas_Balcao_DadosAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspVendas_Balcao_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMLanClient.dspVendas_Balcao_DadosBeforeApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspVendas_Balcao_DadosBeforeApplyUpdatesCommand = nil then
  begin
    FdspVendas_Balcao_DadosBeforeApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspVendas_Balcao_DadosBeforeApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspVendas_Balcao_DadosBeforeApplyUpdatesCommand.Text := 'TDSSMLan.dspVendas_Balcao_DadosBeforeApplyUpdates';
    FdspVendas_Balcao_DadosBeforeApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspVendas_Balcao_DadosBeforeApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspVendas_Balcao_DadosBeforeApplyUpdatesCommand.Parameters[0].ConnectionHandler)
      .GetJSONMarshaler;
    try
      FdspVendas_Balcao_DadosBeforeApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspVendas_Balcao_DadosBeforeApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspVendas_Balcao_DadosBeforeApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspVendas_Balcao_DadosBeforeApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMLanClient.dspCotacoes_NegociacaoAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspCotacoes_NegociacaoAfterApplyUpdatesCommand = nil then
  begin
    FdspCotacoes_NegociacaoAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspCotacoes_NegociacaoAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspCotacoes_NegociacaoAfterApplyUpdatesCommand.Text := 'TDSSMLan.dspCotacoes_NegociacaoAfterApplyUpdates';
    FdspCotacoes_NegociacaoAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspCotacoes_NegociacaoAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspCotacoes_NegociacaoAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler)
      .GetJSONMarshaler;
    try
      FdspCotacoes_NegociacaoAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspCotacoes_NegociacaoAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspCotacoes_NegociacaoAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspCotacoes_NegociacaoAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMLanClient.dspTecnicosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspTecnicosAfterApplyUpdatesCommand = nil then
  begin
    FdspTecnicosAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspTecnicosAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspTecnicosAfterApplyUpdatesCommand.Text := 'TDSSMLan.dspTecnicosAfterApplyUpdates';
    FdspTecnicosAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspTecnicosAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspTecnicosAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspTecnicosAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspTecnicosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspTecnicosAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspTecnicosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMLanClient.dspOS_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspOS_DadosAfterApplyUpdatesCommand = nil then
  begin
    FdspOS_DadosAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspOS_DadosAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspOS_DadosAfterApplyUpdatesCommand.Text := 'TDSSMLan.dspOS_DadosAfterApplyUpdates';
    FdspOS_DadosAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspOS_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspOS_DadosAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspOS_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspOS_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspOS_DadosAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspOS_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMLanClient.dspOS_Orcamentos_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspOS_Orcamentos_DadosAfterApplyUpdatesCommand = nil then
  begin
    FdspOS_Orcamentos_DadosAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspOS_Orcamentos_DadosAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspOS_Orcamentos_DadosAfterApplyUpdatesCommand.Text := 'TDSSMLan.dspOS_Orcamentos_DadosAfterApplyUpdates';
    FdspOS_Orcamentos_DadosAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspOS_Orcamentos_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspOS_Orcamentos_DadosAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler)
      .GetJSONMarshaler;
    try
      FdspOS_Orcamentos_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspOS_Orcamentos_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspOS_Orcamentos_DadosAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspOS_Orcamentos_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMLanClient.dspOrcamentos_Vendas_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspOrcamentos_Vendas_DadosAfterApplyUpdatesCommand = nil then
  begin
    FdspOrcamentos_Vendas_DadosAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspOrcamentos_Vendas_DadosAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspOrcamentos_Vendas_DadosAfterApplyUpdatesCommand.Text := 'TDSSMLan.dspOrcamentos_Vendas_DadosAfterApplyUpdates';
    FdspOrcamentos_Vendas_DadosAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspOrcamentos_Vendas_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspOrcamentos_Vendas_DadosAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler)
      .GetJSONMarshaler;
    try
      FdspOrcamentos_Vendas_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspOrcamentos_Vendas_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspOrcamentos_Vendas_DadosAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspOrcamentos_Vendas_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMLanClient.dspProspectsAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspProspectsAfterApplyUpdatesCommand = nil then
  begin
    FdspProspectsAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspProspectsAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspProspectsAfterApplyUpdatesCommand.Text := 'TDSSMLan.dspProspectsAfterApplyUpdates';
    FdspProspectsAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspProspectsAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspProspectsAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspProspectsAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspProspectsAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspProspectsAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspProspectsAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMLanClient.dspCotacoes_Compras_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspCotacoes_Compras_DadosAfterApplyUpdatesCommand = nil then
  begin
    FdspCotacoes_Compras_DadosAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspCotacoes_Compras_DadosAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspCotacoes_Compras_DadosAfterApplyUpdatesCommand.Text := 'TDSSMLan.dspCotacoes_Compras_DadosAfterApplyUpdates';
    FdspCotacoes_Compras_DadosAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspCotacoes_Compras_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspCotacoes_Compras_DadosAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler)
      .GetJSONMarshaler;
    try
      FdspCotacoes_Compras_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspCotacoes_Compras_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspCotacoes_Compras_DadosAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspCotacoes_Compras_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMLanClient.dspComandas_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspComandas_DadosAfterApplyUpdatesCommand = nil then
  begin
    FdspComandas_DadosAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspComandas_DadosAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspComandas_DadosAfterApplyUpdatesCommand.Text := 'TDSSMLan.dspComandas_DadosAfterApplyUpdates';
    FdspComandas_DadosAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspComandas_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspComandas_DadosAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspComandas_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspComandas_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspComandas_DadosAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspComandas_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMLanClient.dspComandas_DadosBeforeApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspComandas_DadosBeforeApplyUpdatesCommand = nil then
  begin
    FdspComandas_DadosBeforeApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspComandas_DadosBeforeApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspComandas_DadosBeforeApplyUpdatesCommand.Text := 'TDSSMLan.dspComandas_DadosBeforeApplyUpdates';
    FdspComandas_DadosBeforeApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspComandas_DadosBeforeApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspComandas_DadosBeforeApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspComandas_DadosBeforeApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspComandas_DadosBeforeApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspComandas_DadosBeforeApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspComandas_DadosBeforeApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMLanClient.dspContabilistasAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspContabilistasAfterApplyUpdatesCommand = nil then
  begin
    FdspContabilistasAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspContabilistasAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspContabilistasAfterApplyUpdatesCommand.Text := 'TDSSMLan.dspContabilistasAfterApplyUpdates';
    FdspContabilistasAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspContabilistasAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspContabilistasAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspContabilistasAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspContabilistasAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspContabilistasAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspContabilistasAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMLanClient.dspParticipantesAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspParticipantesAfterApplyUpdatesCommand = nil then
  begin
    FdspParticipantesAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspParticipantesAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspParticipantesAfterApplyUpdatesCommand.Text := 'TDSSMLan.dspParticipantesAfterApplyUpdates';
    FdspParticipantesAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspParticipantesAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspParticipantesAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspParticipantesAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspParticipantesAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspParticipantesAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspParticipantesAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMLanClient.dspRoteiros_ProducaoAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspRoteiros_ProducaoAfterApplyUpdatesCommand = nil then
  begin
    FdspRoteiros_ProducaoAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspRoteiros_ProducaoAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspRoteiros_ProducaoAfterApplyUpdatesCommand.Text := 'TDSSMLan.dspRoteiros_ProducaoAfterApplyUpdates';
    FdspRoteiros_ProducaoAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspRoteiros_ProducaoAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspRoteiros_ProducaoAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspRoteiros_ProducaoAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspRoteiros_ProducaoAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspRoteiros_ProducaoAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspRoteiros_ProducaoAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMLanClient.dspLinhas_ProducaoAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspLinhas_ProducaoAfterApplyUpdatesCommand = nil then
  begin
    FdspLinhas_ProducaoAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspLinhas_ProducaoAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspLinhas_ProducaoAfterApplyUpdatesCommand.Text := 'TDSSMLan.dspLinhas_ProducaoAfterApplyUpdates';
    FdspLinhas_ProducaoAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspLinhas_ProducaoAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspLinhas_ProducaoAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspLinhas_ProducaoAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspLinhas_ProducaoAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspLinhas_ProducaoAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspLinhas_ProducaoAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

constructor TDSSMLanClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;

constructor TDSSMLanClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TDSSMLanClient.Destroy;
begin
  FreeAndNil(FDSServerModuleCreateCommand);
  FreeAndNil(FDSServerModuleDestroyCommand);
  FreeAndNil(FdspPedidos_Vendas_DadosBeforeApplyUpdatesCommand);
  FreeAndNil(FdspPedidos_Compras_DadosBeforeApplyUpdatesCommand);
  FreeAndNil(FdspNotas_Entradas_DadosAfterApplyUpdatesCommand);
  FreeAndNil(FdspPedidos_Compras_DadosAfterApplyUpdatesCommand);
  FreeAndNil(FdspPedidos_Vendas_DadosAfterApplyUpdatesCommand);
  FreeAndNil(FdspNotas_Entradas_DadosBeforeApplyUpdatesCommand);
  FreeAndNil(FdspBorderos_DadosBeforeApplyUpdatesCommand);
  FreeAndNil(FdspBorderos_DadosAfterApplyUpdatesCommand);
  FreeAndNil(FdspNotas_Saidas_DadosAfterApplyUpdatesCommand);
  FreeAndNil(FdspNotas_Saidas_DadosBeforeApplyUpdatesCommand);
  FreeAndNil(FdspVendas_Balcao_DadosAfterApplyUpdatesCommand);
  FreeAndNil(FdspVendas_Balcao_DadosBeforeApplyUpdatesCommand);
  FreeAndNil(FdspCotacoes_NegociacaoAfterApplyUpdatesCommand);
  FreeAndNil(FdspTecnicosAfterApplyUpdatesCommand);
  FreeAndNil(FdspOS_DadosAfterApplyUpdatesCommand);
  FreeAndNil(FdspOS_Orcamentos_DadosAfterApplyUpdatesCommand);
  FreeAndNil(FdspOrcamentos_Vendas_DadosAfterApplyUpdatesCommand);
  FreeAndNil(FdspProspectsAfterApplyUpdatesCommand);
  FreeAndNil(FdspCotacoes_Compras_DadosAfterApplyUpdatesCommand);
  FreeAndNil(FdspComandas_DadosAfterApplyUpdatesCommand);
  FreeAndNil(FdspComandas_DadosBeforeApplyUpdatesCommand);
  FreeAndNil(FdspContabilistasAfterApplyUpdatesCommand);
  FreeAndNil(FdspParticipantesAfterApplyUpdatesCommand);
  FreeAndNil(FdspRoteiros_ProducaoAfterApplyUpdatesCommand);
  FreeAndNil(FdspLinhas_ProducaoAfterApplyUpdatesCommand);
  inherited;
end;

procedure TDSSMConClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'TDSSMCon.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;

procedure TDSSMConClient.DSServerModuleDestroy(Sender: TObject);
begin
  if FDSServerModuleDestroyCommand = nil then
  begin
    FDSServerModuleDestroyCommand := FDBXConnection.CreateCommand;
    FDSServerModuleDestroyCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleDestroyCommand.Text := 'TDSSMCon.DSServerModuleDestroy';
    FDSServerModuleDestroyCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleDestroyCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleDestroyCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleDestroyCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FDSServerModuleDestroyCommand.ExecuteUpdate;
end;

constructor TDSSMConClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;

constructor TDSSMConClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TDSSMConClient.Destroy;
begin
  FreeAndNil(FDSServerModuleCreateCommand);
  FreeAndNil(FDSServerModuleDestroyCommand);
  inherited;
end;

procedure TDSSMRelClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'TDSSMRel.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;

procedure TDSSMRelClient.DSServerModuleDestroy(Sender: TObject);
begin
  if FDSServerModuleDestroyCommand = nil then
  begin
    FDSServerModuleDestroyCommand := FDBXConnection.CreateCommand;
    FDSServerModuleDestroyCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleDestroyCommand.Text := 'TDSSMRel.DSServerModuleDestroy';
    FDSServerModuleDestroyCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleDestroyCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleDestroyCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleDestroyCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FDSServerModuleDestroyCommand.ExecuteUpdate;
end;

procedure TDSSMRelClient.sqlEspelho_Nota_DadosCalcFields(DataSet: TDataSet);
begin
  if FsqlEspelho_Nota_DadosCalcFieldsCommand = nil then
  begin
    FsqlEspelho_Nota_DadosCalcFieldsCommand := FDBXConnection.CreateCommand;
    FsqlEspelho_Nota_DadosCalcFieldsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FsqlEspelho_Nota_DadosCalcFieldsCommand.Text := 'TDSSMRel.sqlEspelho_Nota_DadosCalcFields';
    FsqlEspelho_Nota_DadosCalcFieldsCommand.Prepare;
  end;
  FsqlEspelho_Nota_DadosCalcFieldsCommand.Parameters[0].Value.SetDBXReader
    (TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FsqlEspelho_Nota_DadosCalcFieldsCommand.ExecuteUpdate;
end;

procedure TDSSMRelClient.sqlEspelho_Nota_ItensBeforeOpen(DataSet: TDataSet);
begin
  if FsqlEspelho_Nota_ItensBeforeOpenCommand = nil then
  begin
    FsqlEspelho_Nota_ItensBeforeOpenCommand := FDBXConnection.CreateCommand;
    FsqlEspelho_Nota_ItensBeforeOpenCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FsqlEspelho_Nota_ItensBeforeOpenCommand.Text := 'TDSSMRel.sqlEspelho_Nota_ItensBeforeOpen';
    FsqlEspelho_Nota_ItensBeforeOpenCommand.Prepare;
  end;
  FsqlEspelho_Nota_ItensBeforeOpenCommand.Parameters[0].Value.SetDBXReader
    (TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FsqlEspelho_Nota_ItensBeforeOpenCommand.ExecuteUpdate;
end;

constructor TDSSMRelClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;

constructor TDSSMRelClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TDSSMRelClient.Destroy;
begin
  FreeAndNil(FDSServerModuleCreateCommand);
  FreeAndNil(FDSServerModuleDestroyCommand);
  FreeAndNil(FsqlEspelho_Nota_DadosCalcFieldsCommand);
  FreeAndNil(FsqlEspelho_Nota_ItensBeforeOpenCommand);
  inherited;
end;

procedure TDSSMConfigClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'TDSSMConfig.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;

procedure TDSSMConfigClient.DSServerModuleDestroy(Sender: TObject);
begin
  if FDSServerModuleDestroyCommand = nil then
  begin
    FDSServerModuleDestroyCommand := FDBXConnection.CreateCommand;
    FDSServerModuleDestroyCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleDestroyCommand.Text := 'TDSSMConfig.DSServerModuleDestroy';
    FDSServerModuleDestroyCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleDestroyCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleDestroyCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleDestroyCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FDSServerModuleDestroyCommand.ExecuteUpdate;
end;

procedure TDSSMConfigClient.dspListas_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspListas_DadosAfterApplyUpdatesCommand = nil then
  begin
    FdspListas_DadosAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspListas_DadosAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspListas_DadosAfterApplyUpdatesCommand.Text := 'TDSSMConfig.dspListas_DadosAfterApplyUpdates';
    FdspListas_DadosAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspListas_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspListas_DadosAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspListas_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspListas_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspListas_DadosAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspListas_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMConfigClient.dspExpressoesAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspExpressoesAfterApplyUpdatesCommand = nil then
  begin
    FdspExpressoesAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspExpressoesAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspExpressoesAfterApplyUpdatesCommand.Text := 'TDSSMConfig.dspExpressoesAfterApplyUpdates';
    FdspExpressoesAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspExpressoesAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspExpressoesAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspExpressoesAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspExpressoesAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspExpressoesAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspExpressoesAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

constructor TDSSMConfigClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;

constructor TDSSMConfigClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TDSSMConfigClient.Destroy;
begin
  FreeAndNil(FDSServerModuleCreateCommand);
  FreeAndNil(FDSServerModuleDestroyCommand);
  FreeAndNil(FdspListas_DadosAfterApplyUpdatesCommand);
  FreeAndNil(FdspExpressoesAfterApplyUpdatesCommand);
  inherited;
end;

procedure TDSSMCustomsClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'TDSSMCustoms.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;

procedure TDSSMCustomsClient.DSServerModuleDestroy(Sender: TObject);
begin
  if FDSServerModuleDestroyCommand = nil then
  begin
    FDSServerModuleDestroyCommand := FDBXConnection.CreateCommand;
    FDSServerModuleDestroyCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleDestroyCommand.Text := 'TDSSMCustoms.DSServerModuleDestroy';
    FDSServerModuleDestroyCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleDestroyCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleDestroyCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleDestroyCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FDSServerModuleDestroyCommand.ExecuteUpdate;
end;

procedure TDSSMCustomsClient.dspPedidos_Vendas_DadosBeforeApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspPedidos_Vendas_DadosBeforeApplyUpdatesCommand = nil then
  begin
    FdspPedidos_Vendas_DadosBeforeApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspPedidos_Vendas_DadosBeforeApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspPedidos_Vendas_DadosBeforeApplyUpdatesCommand.Text := 'TDSSMCustoms.dspPedidos_vendas_DadosBeforeApplyUpdates';
    FdspPedidos_Vendas_DadosBeforeApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspPedidos_Vendas_DadosBeforeApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspPedidos_Vendas_DadosBeforeApplyUpdatesCommand.Parameters[0].ConnectionHandler)
      .GetJSONMarshaler;
    try
      FdspPedidos_Vendas_DadosBeforeApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspPedidos_Vendas_DadosBeforeApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspPedidos_Vendas_DadosBeforeApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspPedidos_Vendas_DadosBeforeApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCustomsClient.dspPedidos_Vendas_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspPedidos_Vendas_DadosAfterApplyUpdatesCommand = nil then
  begin
    FdspPedidos_Vendas_DadosAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspPedidos_Vendas_DadosAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspPedidos_Vendas_DadosAfterApplyUpdatesCommand.Text := 'TDSSMCustoms.dspPedidos_vendas_DadosAfterApplyUpdates';
    FdspPedidos_Vendas_DadosAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspPedidos_Vendas_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspPedidos_Vendas_DadosAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler)
      .GetJSONMarshaler;
    try
      FdspPedidos_Vendas_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspPedidos_Vendas_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspPedidos_Vendas_DadosAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspPedidos_Vendas_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCustomsClient.dspOrcamentos_Vendas_Dados_AfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspOrcamentos_Vendas_Dados_AfterApplyUpdatesCommand = nil then
  begin
    FdspOrcamentos_Vendas_Dados_AfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspOrcamentos_Vendas_Dados_AfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspOrcamentos_Vendas_Dados_AfterApplyUpdatesCommand.Text := 'TDSSMCustoms.dspOrcamentos_Vendas_Dados_AfterApplyUpdates';
    FdspOrcamentos_Vendas_Dados_AfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspOrcamentos_Vendas_Dados_AfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspOrcamentos_Vendas_Dados_AfterApplyUpdatesCommand.Parameters[0].ConnectionHandler)
      .GetJSONMarshaler;
    try
      FdspOrcamentos_Vendas_Dados_AfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspOrcamentos_Vendas_Dados_AfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspOrcamentos_Vendas_Dados_AfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspOrcamentos_Vendas_Dados_AfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCustomsClient.dspRequisicao_material_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspRequisicao_material_DadosAfterApplyUpdatesCommand = nil then
  begin
    FdspRequisicao_material_DadosAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspRequisicao_material_DadosAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspRequisicao_material_DadosAfterApplyUpdatesCommand.Text := 'TDSSMCustoms.dspRequisicao_material_DadosAfterApplyUpdates';
    FdspRequisicao_material_DadosAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspRequisicao_material_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspRequisicao_material_DadosAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler)
      .GetJSONMarshaler;
    try
      FdspRequisicao_material_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspRequisicao_material_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspRequisicao_material_DadosAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspRequisicao_material_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCustomsClient.sqlRequisicao_material_ItensBeforeOpen(DataSet: TDataSet);
begin
  if FsqlRequisicao_material_ItensBeforeOpenCommand = nil then
  begin
    FsqlRequisicao_material_ItensBeforeOpenCommand := FDBXConnection.CreateCommand;
    FsqlRequisicao_material_ItensBeforeOpenCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FsqlRequisicao_material_ItensBeforeOpenCommand.Text := 'TDSSMCustoms.sqlRequisicao_material_ItensBeforeOpen';
    FsqlRequisicao_material_ItensBeforeOpenCommand.Prepare;
  end;
  FsqlRequisicao_material_ItensBeforeOpenCommand.Parameters[0].Value.SetDBXReader
    (TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FsqlRequisicao_material_ItensBeforeOpenCommand.ExecuteUpdate;
end;

procedure TDSSMCustomsClient.sqlRequisicao_material_DadosBeforeOpen(DataSet: TDataSet);
begin
  if FsqlRequisicao_material_DadosBeforeOpenCommand = nil then
  begin
    FsqlRequisicao_material_DadosBeforeOpenCommand := FDBXConnection.CreateCommand;
    FsqlRequisicao_material_DadosBeforeOpenCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FsqlRequisicao_material_DadosBeforeOpenCommand.Text := 'TDSSMCustoms.sqlRequisicao_material_DadosBeforeOpen';
    FsqlRequisicao_material_DadosBeforeOpenCommand.Prepare;
  end;
  FsqlRequisicao_material_DadosBeforeOpenCommand.Parameters[0].Value.SetDBXReader
    (TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FsqlRequisicao_material_DadosBeforeOpenCommand.ExecuteUpdate;
end;

procedure TDSSMCustomsClient.dspAgendamentoAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspAgendamentoAfterApplyUpdatesCommand = nil then
  begin
    FdspAgendamentoAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspAgendamentoAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspAgendamentoAfterApplyUpdatesCommand.Text := 'TDSSMCustoms.dspAgendamentoAfterApplyUpdates';
    FdspAgendamentoAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspAgendamentoAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspAgendamentoAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspAgendamentoAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspAgendamentoAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspAgendamentoAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspAgendamentoAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCustomsClient.sqlAgendamentoBeforeOpen(DataSet: TDataSet);
begin
  if FsqlAgendamentoBeforeOpenCommand = nil then
  begin
    FsqlAgendamentoBeforeOpenCommand := FDBXConnection.CreateCommand;
    FsqlAgendamentoBeforeOpenCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FsqlAgendamentoBeforeOpenCommand.Text := 'TDSSMCustoms.sqlAgendamentoBeforeOpen';
    FsqlAgendamentoBeforeOpenCommand.Prepare;
  end;
  FsqlAgendamentoBeforeOpenCommand.Parameters[0].Value.SetDBXReader(TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FsqlAgendamentoBeforeOpenCommand.ExecuteUpdate;
end;

procedure TDSSMCustomsClient.dspContratoAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspContratoAfterApplyUpdatesCommand = nil then
  begin
    FdspContratoAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspContratoAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspContratoAfterApplyUpdatesCommand.Text := 'TDSSMCustoms.dspContratoAfterApplyUpdates';
    FdspContratoAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspContratoAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspContratoAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspContratoAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspContratoAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspContratoAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspContratoAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCustomsClient.sqlContratoBeforeOpen(DataSet: TDataSet);
begin
  if FsqlContratoBeforeOpenCommand = nil then
  begin
    FsqlContratoBeforeOpenCommand := FDBXConnection.CreateCommand;
    FsqlContratoBeforeOpenCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FsqlContratoBeforeOpenCommand.Text := 'TDSSMCustoms.sqlContratoBeforeOpen';
    FsqlContratoBeforeOpenCommand.Prepare;
  end;
  FsqlContratoBeforeOpenCommand.Parameters[0].Value.SetDBXReader(TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FsqlContratoBeforeOpenCommand.ExecuteUpdate;
end;

procedure TDSSMCustomsClient.sqlContrato_TecnicosBeforeOpen(DataSet: TDataSet);
begin
  if FsqlContrato_TecnicosBeforeOpenCommand = nil then
  begin
    FsqlContrato_TecnicosBeforeOpenCommand := FDBXConnection.CreateCommand;
    FsqlContrato_TecnicosBeforeOpenCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FsqlContrato_TecnicosBeforeOpenCommand.Text := 'TDSSMCustoms.sqlContrato_TecnicosBeforeOpen';
    FsqlContrato_TecnicosBeforeOpenCommand.Prepare;
  end;
  FsqlContrato_TecnicosBeforeOpenCommand.Parameters[0].Value.SetDBXReader
    (TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FsqlContrato_TecnicosBeforeOpenCommand.ExecuteUpdate;
end;

procedure TDSSMCustomsClient.dspPedidos_Compras_Dados_AfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspPedidos_Compras_Dados_AfterApplyUpdatesCommand = nil then
  begin
    FdspPedidos_Compras_Dados_AfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspPedidos_Compras_Dados_AfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspPedidos_Compras_Dados_AfterApplyUpdatesCommand.Text := 'TDSSMCustoms.dspPedidos_Compras_Dados_AfterApplyUpdates';
    FdspPedidos_Compras_Dados_AfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspPedidos_Compras_Dados_AfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspPedidos_Compras_Dados_AfterApplyUpdatesCommand.Parameters[0].ConnectionHandler)
      .GetJSONMarshaler;
    try
      FdspPedidos_Compras_Dados_AfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspPedidos_Compras_Dados_AfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspPedidos_Compras_Dados_AfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspPedidos_Compras_Dados_AfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCustomsClient.dspPedidos_Compras_Dados_BeforeApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspPedidos_Compras_Dados_BeforeApplyUpdatesCommand = nil then
  begin
    FdspPedidos_Compras_Dados_BeforeApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspPedidos_Compras_Dados_BeforeApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspPedidos_Compras_Dados_BeforeApplyUpdatesCommand.Text := 'TDSSMCustoms.dspPedidos_Compras_Dados_BeforeApplyUpdates';
    FdspPedidos_Compras_Dados_BeforeApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspPedidos_Compras_Dados_BeforeApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspPedidos_Compras_Dados_BeforeApplyUpdatesCommand.Parameters[0].ConnectionHandler)
      .GetJSONMarshaler;
    try
      FdspPedidos_Compras_Dados_BeforeApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspPedidos_Compras_Dados_BeforeApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspPedidos_Compras_Dados_BeforeApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspPedidos_Compras_Dados_BeforeApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCustomsClient.sqlEquipamentos_DadosBeforeOpen(DataSet: TDataSet);
begin
  if FsqlEquipamentos_DadosBeforeOpenCommand = nil then
  begin
    FsqlEquipamentos_DadosBeforeOpenCommand := FDBXConnection.CreateCommand;
    FsqlEquipamentos_DadosBeforeOpenCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FsqlEquipamentos_DadosBeforeOpenCommand.Text := 'TDSSMCustoms.sqlEquipamentos_DadosBeforeOpen';
    FsqlEquipamentos_DadosBeforeOpenCommand.Prepare;
  end;
  FsqlEquipamentos_DadosBeforeOpenCommand.Parameters[0].Value.SetDBXReader
    (TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FsqlEquipamentos_DadosBeforeOpenCommand.ExecuteUpdate;
end;

procedure TDSSMCustomsClient.dspEquipamentos_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspEquipamentos_DadosAfterApplyUpdatesCommand = nil then
  begin
    FdspEquipamentos_DadosAfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspEquipamentos_DadosAfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspEquipamentos_DadosAfterApplyUpdatesCommand.Text := 'TDSSMCustoms.dspEquipamentos_DadosAfterApplyUpdates';
    FdspEquipamentos_DadosAfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspEquipamentos_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspEquipamentos_DadosAfterApplyUpdatesCommand.Parameters[0].ConnectionHandler)
      .GetJSONMarshaler;
    try
      FdspEquipamentos_DadosAfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspEquipamentos_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspEquipamentos_DadosAfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspEquipamentos_DadosAfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCustomsClient.sqlOrcamentos_EstruturasBeforeOpen(DataSet: TDataSet);
begin
  if FsqlOrcamentos_EstruturasBeforeOpenCommand = nil then
  begin
    FsqlOrcamentos_EstruturasBeforeOpenCommand := FDBXConnection.CreateCommand;
    FsqlOrcamentos_EstruturasBeforeOpenCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FsqlOrcamentos_EstruturasBeforeOpenCommand.Text := 'TDSSMCustoms.sqlOrcamentos_EstruturasBeforeOpen';
    FsqlOrcamentos_EstruturasBeforeOpenCommand.Prepare;
  end;
  FsqlOrcamentos_EstruturasBeforeOpenCommand.Parameters[0].Value.SetDBXReader
    (TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FsqlOrcamentos_EstruturasBeforeOpenCommand.ExecuteUpdate;
end;

procedure TDSSMCustomsClient.sqlPedidos_Compras_DadosBeforeOpen(DataSet: TDataSet);
begin
  if FsqlPedidos_Compras_DadosBeforeOpenCommand = nil then
  begin
    FsqlPedidos_Compras_DadosBeforeOpenCommand := FDBXConnection.CreateCommand;
    FsqlPedidos_Compras_DadosBeforeOpenCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FsqlPedidos_Compras_DadosBeforeOpenCommand.Text := 'TDSSMCustoms.sqlPedidos_Compras_DadosBeforeOpen';
    FsqlPedidos_Compras_DadosBeforeOpenCommand.Prepare;
  end;
  FsqlPedidos_Compras_DadosBeforeOpenCommand.Parameters[0].Value.SetDBXReader
    (TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FsqlPedidos_Compras_DadosBeforeOpenCommand.ExecuteUpdate;
end;

procedure TDSSMCustomsClient.dspProdutos_AfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  if FdspProdutos_AfterApplyUpdatesCommand = nil then
  begin
    FdspProdutos_AfterApplyUpdatesCommand := FDBXConnection.CreateCommand;
    FdspProdutos_AfterApplyUpdatesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FdspProdutos_AfterApplyUpdatesCommand.Text := 'TDSSMCustoms.dspProdutos_AfterApplyUpdates';
    FdspProdutos_AfterApplyUpdatesCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FdspProdutos_AfterApplyUpdatesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FdspProdutos_AfterApplyUpdatesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FdspProdutos_AfterApplyUpdatesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FdspProdutos_AfterApplyUpdatesCommand.Parameters[1].Value.AsVariant := OwnerData;
  FdspProdutos_AfterApplyUpdatesCommand.ExecuteUpdate;
  OwnerData := FdspProdutos_AfterApplyUpdatesCommand.Parameters[1].Value.AsVariant;
end;

procedure TDSSMCustomsClient.sqlSaldos_EstoqueBeforeOpen(DataSet: TDataSet);
begin
  if FsqlSaldos_EstoqueBeforeOpenCommand = nil then
  begin
    FsqlSaldos_EstoqueBeforeOpenCommand := FDBXConnection.CreateCommand;
    FsqlSaldos_EstoqueBeforeOpenCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FsqlSaldos_EstoqueBeforeOpenCommand.Text := 'TDSSMCustoms.sqlSaldos_EstoqueBeforeOpen';
    FsqlSaldos_EstoqueBeforeOpenCommand.Prepare;
  end;
  FsqlSaldos_EstoqueBeforeOpenCommand.Parameters[0].Value.SetDBXReader(TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FsqlSaldos_EstoqueBeforeOpenCommand.ExecuteUpdate;
end;

constructor TDSSMCustomsClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;

constructor TDSSMCustomsClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TDSSMCustomsClient.Destroy;
begin
  FreeAndNil(FDSServerModuleCreateCommand);
  FreeAndNil(FDSServerModuleDestroyCommand);
  FreeAndNil(FdspPedidos_Vendas_DadosBeforeApplyUpdatesCommand);
  FreeAndNil(FdspPedidos_Vendas_DadosAfterApplyUpdatesCommand);
  FreeAndNil(FdspOrcamentos_Vendas_Dados_AfterApplyUpdatesCommand);
  FreeAndNil(FdspRequisicao_material_DadosAfterApplyUpdatesCommand);
  FreeAndNil(FsqlRequisicao_material_ItensBeforeOpenCommand);
  FreeAndNil(FsqlRequisicao_material_DadosBeforeOpenCommand);
  FreeAndNil(FdspAgendamentoAfterApplyUpdatesCommand);
  FreeAndNil(FsqlAgendamentoBeforeOpenCommand);
  FreeAndNil(FdspContratoAfterApplyUpdatesCommand);
  FreeAndNil(FsqlContratoBeforeOpenCommand);
  FreeAndNil(FsqlContrato_TecnicosBeforeOpenCommand);
  FreeAndNil(FdspPedidos_Compras_Dados_AfterApplyUpdatesCommand);
  FreeAndNil(FdspPedidos_Compras_Dados_BeforeApplyUpdatesCommand);
  FreeAndNil(FsqlEquipamentos_DadosBeforeOpenCommand);
  FreeAndNil(FdspEquipamentos_DadosAfterApplyUpdatesCommand);
  FreeAndNil(FsqlOrcamentos_EstruturasBeforeOpenCommand);
  FreeAndNil(FsqlPedidos_Compras_DadosBeforeOpenCommand);
  FreeAndNil(FdspProdutos_AfterApplyUpdatesCommand);
  FreeAndNil(FsqlSaldos_EstoqueBeforeOpenCommand);
  inherited;
end;

end.
