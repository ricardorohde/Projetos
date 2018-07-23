unit uLibrary;

interface

uses SysUtils, Windows, Classes, IniFiles, SqlExpr, XMLDoc, XMLIntf, DateUtils,
  StrUtils, DBClient, Variants, uTypes, uDSClientProxy, DB,
  IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP, xmldom, WinSock, Generics.collections, uEmail, Math, DBXJSON, DBXJSONCommon,
  DBXJSONReflect, DBXCommon, DBXDBReaders;

type
  TSaveLoadType = (stJSON, stBinary);

type
  TSuperClass = class abstract
  protected
    SQLConnection: TSQLConnection;

    class var FInstance: TSuperClass;
{$REGION 'Config'}

  Type
    TConfig = class
    public
      procedure Save(Schedule: TSchedule);
      procedure Load(var Schedule: TSchedule);
    end;
{$ENDREGION}
{$REGION 'GenericsF'}

  Type
    TGenericsF = class
    public
      function AppPath: String;
      Function SendEmail(ListEmail: TObjectList<TBodyEmail>): Boolean;
      function GetIpAddress: String;
      function GetComputerName: String;
      function IfThen(AValue: Boolean; const ATrue: String; const AFalse: String): String;
      function RetornaAliquotaICMSInterEstadual(UFDestino: ShortString): Single;
      function RetornaAliquotaICMSInterna(UFDestino: ShortString): Single;
      function Split(Source, ChrSource: AnsiString): TUStringArray;
      procedure SaveRemoteFile(BaseDir, FileName: String; SaveType: TSaveLoadType = stJSON);

      procedure InicializaValores(var Valores: TValores);

      function CalculaICMS(ICMS: TICMS; BaseItem, ValorDespesas, ValorFrete, ValorSeguro, ValorDesconto, ValorIPI,
        ValorPISApuracao, ValorCOFINSApuracao, ValorII: Currency): TImposto; overload;
      function CalculaICMSST(ICMSST: TICMSST; ValorICMS, BaseItem, ValorDespesas, ValorFrete, ValorSeguro, ValorDesconto,
        ValorIPI, ValorPISApuracao, ValorCOFINSApuracao, ValorII: Currency; MargemLucro: Single): TImposto; overload;
      function CalculaISS(ISS: TISS; BaseItem, ValorDespesas, ValorFrete, ValorSeguro, ValorDesconto: Currency): TImposto;
      function CalculaPISApuracao(PISApuracao: TPISApuracao; BaseItem, ValorDespesas, ValorFrete, ValorSeguro, ValorDesconto,
        ValorICMSST: Currency; AliquotaIPI, AliquotaICMS, AliquotaCOFINSApuracao, AliquotaII: Single): TImposto;
      function CalculaCOFINSApuracao(COFINSApuracao: TCOFINSApuracao; BaseItem, ValorDespesas, ValorFrete, ValorSeguro,
        ValorDesconto, ValorICMSST: Currency; AliquotaIPI, AliquotaICMS, AliquotaPISApuracao, AliquotaII: Single): TImposto;

      function CalculaPISRetencao(PISRetencao: TPISRetencao; BaseItem, ValorDespesas, ValorFrete, ValorSeguro,
        ValorDesconto: Currency): TImposto;
      function CalculaCOFINSRetencao(COFINSRetencao: TCOFINSRetencao; BaseItem, ValorDespesas, ValorFrete, ValorSeguro,
        ValorDesconto: Currency): TImposto;
      function CalculaCSLLRetencao(CSLLRetencao: TCSLLRetencao; BaseItem, ValorDespesas, ValorFrete, ValorSeguro,
        ValorDesconto: Currency): TImposto;

      function CalculaINSS(INSS: TINSS; BaseItem, ValorDespesas, ValorFrete, ValorSeguro, ValorDesconto: Currency): TImposto;
      function CalculaIRRF(IRRF: TIRRF; BaseItem, ValorDespesas, ValorFrete, ValorSeguro, ValorDesconto: Currency): TImposto;
      function CalculaFGTS(FGTS: TFGTS; BaseItem, ValorDespesas, ValorFrete, ValorSeguro, ValorDesconto: Currency): TImposto;
      function CalculaII(II: TII; BaseItem, ValorDespesas, ValorFrete, ValorSeguro, ValorDesconto: Currency): TImposto;
      function CalculaTributos(Tributos: TTributos; BaseItem: Currency): TImposto;
      function CalculaIPI(IPI: TIPI; BaseItem, ValorDespesas, ValorFrete, ValorSeguro, ValorDesconto, ValorII: Currency)
        : TImposto; overload;
      function CarregaRegrasComissao(Vendedor: Integer): TRegrasComissao;

      function CalculaICMSDif(ICMSDif: TICMSDiferido; ValorICMS: Currency): TImposto;
      function CalculaICMSFCP(ICMSFCP: TICMSFCP; ICMS: TImposto): TImposto;
      function CalculaICMSPUFD(ICMSPUFD: TICMSPUFD; ICMS: TImposto): TImposto;
      function CalculaICMSPUFO(ICMSPUFO: TICMSPUFO; ICMS: TImposto): TImposto;

      function RemoverAcento(value: String): String;
    end;
{$ENDREGION}
{$REGION 'DBFunctions'}

  Type
    TDBFunctions = class
      private
    public
      Function ExecuteQueryByXml(Sql: String): TDataSet; overload;
      function ExecuteQueryByXml(Fields, From, Where: String; OrderBy: String = ''): TDataSet; overload;
      function ExecuteQueryByXml(Fields: TUStringArray; From, Where: String; OrderBy: String = ''): TDataSet; overload;

      procedure GetEntityOwner(EntityName: String; var Company: String; var Branch: String); overload;
      function GetParamValue(ParamName: String): Variant;
      function CheckRequiredFields(DataSet: TDataSet): Boolean;
      function GetNextNumber(DataSet: TDataSet; FieldName: ShortString): Integer;
    end;
{$ENDREGION}
{$REGION 'User'}

  type
    TUser = class
    protected

      function Connect: Boolean;
    public
      function Login: Boolean;
      function Disconnect: Boolean;
      function GetThreadID: Integer;
      function GetCredencials: String;
    end;
{$ENDREGION}
{$REGION 'Log'}

  type
    TLog = class
      function Save(Msg: String; MsgType: TMsgType): Boolean;
    end;
{$ENDREGION}
  public
    GenericsF: TGenericsF;
    DBFunctions: TDBFunctions;
    User: TUser;
    Log: TLog;
    Config: TConfig;
    class function GetInstance: TSuperClass;
    class destructor DestroyClass;
    function setConnection(SQLConnection: TSQLConnection): TSuperClass;
    function getConnection: TSQLConnection;
  end;

implementation

uses uMain, Datasnap.DSConnect;

{ TSuperClass }

class destructor TSuperClass.DestroyClass;
begin
  if Assigned(FInstance.GenericsF) then
    FreeAndNil(FInstance.GenericsF);

  if Assigned(FInstance.DBFunctions) then
    FreeAndNil(FInstance.DBFunctions);

  if Assigned(FInstance.User) then
    FreeAndNil(FInstance.User);

  if Assigned(FInstance.Config) then
    FreeAndNil(FInstance.Config);

  if Assigned(FInstance) then
    FInstance.Free;
end;

class function TSuperClass.GetInstance: TSuperClass;
begin
  if not Assigned(FInstance) then
    FInstance := TSuperClass.Create;

  if not Assigned(FInstance.GenericsF) then
    FInstance.GenericsF := TGenericsF.Create;

  if not Assigned(FInstance.DBFunctions) then
    FInstance.DBFunctions := TDBFunctions.Create;

  if not Assigned(FInstance.User) then
    FInstance.User := TUser.Create;

  if not Assigned(FInstance.Config) then
    FInstance.Config := TConfig.Create;

  Result := FInstance;
end;

function TSuperClass.getConnection: TSQLConnection;
begin
  Result := self.SQLConnection;
end;

function TSuperClass.setConnection(SQLConnection: TSQLConnection): TSuperClass;
begin
  self.SQLConnection := SQLConnection;
  Result := self;
end;

{ TSuperClass.TGenericsF }

function TSuperClass.TGenericsF.AppPath: String;
begin
  Result := ExtractFilePath(ParamStr(0));
end;

function TSuperClass.TGenericsF.CalculaCOFINSApuracao(COFINSApuracao: TCOFINSApuracao;
  BaseItem, ValorDespesas, ValorFrete, ValorSeguro, ValorDesconto, ValorICMSST: Currency;
  AliquotaIPI, AliquotaICMS, AliquotaPISApuracao, AliquotaII: Single): TImposto;
var
  Imposto: TImposto;
  Auxiliar: Double;
begin
  with Imposto do
  begin
    Aliquota := 0;
    Base := 0;
    Valor := 0;
  end;
  with COFINSApuracao do
  begin
    if ((Calcula = VB_YES) and (Aliquota > 0)) then
    begin
      Imposto.Aliquota := Aliquota;
      Imposto.Base := BaseItem;
      if ((Despesas = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorDespesas;
      if ((Frete = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorFrete;
      if ((Seguro = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorSeguro;
      if ((Desconto = VB_YES)) then
        Imposto.Base := Imposto.Base - ValorDesconto;
      if ((ICMSST = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorICMSST;
      // Reducao da base de cálculo
      if ((Reducao <> 0)) then
        Imposto.Base := RoundTo(((Imposto.Base * (100 - Reducao)) * 0.01), -8);

      Imposto.Valor := RoundTo(((Imposto.Base * Aliquota) * 0.01), -8)
      {
        if ( not Importacao ) then
        Imposto.Valor := RoundTo(((Imposto.Base * Aliquota) * 0.01), -8)
        else
        begin
        Auxiliar  := (1 + (AliquotaICMS * 0.01) * ((AliquotaII * 0.01) + (AliquotaIPI * 0.01) * (1 + (AliquotaII * 0.01)))) / ((1-(AliquotaPISApuracao * 0.01)-(Aliquota * 0.01)) * (1-(AliquotaICMS * 0.01)));
        Imposto.Valor := RoundTo( (Aliquota * 0.01) * (Imposto.Base * Auxiliar), -8);
        Imposto.Base  := RoundTo(Imposto.Base * Auxiliar, -8);
        end;
      }
    end;
  end;
  Result := Imposto;
end;

function TSuperClass.TGenericsF.CalculaCOFINSRetencao(COFINSRetencao: TCOFINSRetencao;
  BaseItem, ValorDespesas, ValorFrete, ValorSeguro, ValorDesconto: Currency): TImposto;
var
  Imposto: TImposto;
begin
  with Imposto do
  begin
    Aliquota := 0;
    Base := 0;
    Valor := 0;
  end;
  with COFINSRetencao do
  begin
    if ((Calcula = VB_YES) and (Aliquota > 0)) then
    begin
      Imposto.Aliquota := Aliquota;
      Imposto.Base := BaseItem;
      if ((Despesas = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorDespesas;
      if ((Frete = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorFrete;
      if ((Seguro = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorSeguro;
      if ((Desconto = VB_YES)) then
        Imposto.Base := Imposto.Base - ValorDesconto;
      // Reducao da base de cálculo
      if ((Reducao <> 0)) then
        Imposto.Base := RoundTo(((Imposto.Base * (100 - Reducao)) * 0.01), -8);

      Imposto.Valor := RoundTo(((Imposto.Base * Aliquota) * 0.01), -8);
    end;
  end;
  Result := Imposto;

end;

function TSuperClass.TGenericsF.CalculaCSLLRetencao(CSLLRetencao: TCSLLRetencao; BaseItem, ValorDespesas, ValorFrete, ValorSeguro,
  ValorDesconto: Currency): TImposto;
var
  Imposto: TImposto;
begin
  with Imposto do
  begin
    Aliquota := 0;
    Base := 0;
    Valor := 0;
  end;
  with CSLLRetencao do
  begin
    if ((Calcula = VB_YES) and (Aliquota > 0)) then
    begin
      Imposto.Aliquota := Aliquota;
      Imposto.Base := BaseItem;
      if ((Despesas = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorDespesas;
      if ((Frete = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorFrete;
      if ((Seguro = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorSeguro;
      if ((Desconto = VB_YES)) then
        Imposto.Base := Imposto.Base - ValorDesconto;
      // Reducao da base de cálculo
      if ((Reducao <> 0)) then
        Imposto.Base := RoundTo(((Imposto.Base * (100 - Reducao)) * 0.01), -8);

      Imposto.Valor := RoundTo(((Imposto.Base * Aliquota) * 0.01), -8);
    end;
  end;
  Result := Imposto;
end;

function TSuperClass.TGenericsF.CalculaFGTS(FGTS: TFGTS; BaseItem, ValorDespesas, ValorFrete, ValorSeguro,
  ValorDesconto: Currency): TImposto;
var
  Imposto: TImposto;
begin
  with Imposto do
  begin
    Aliquota := 0;
    Base := 0;
    Valor := 0;
  end;
  with FGTS do
  begin
    if ((Calcula = VB_YES) and (Aliquota > 0)) then
    begin
      Imposto.Aliquota := Aliquota;
      Imposto.Base := BaseItem;
      if ((Despesas = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorDespesas;
      if ((Frete = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorFrete;
      if ((Seguro = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorSeguro;
      if ((Desconto = VB_YES)) then
        Imposto.Base := Imposto.Base - ValorDesconto;
      // Reducao da base de cálculo
      if ((Reducao <> 0)) then
        Imposto.Base := RoundTo(((Imposto.Base * (100 - Reducao)) * 0.01), -8);

      Imposto.Valor := RoundTo(((Imposto.Base * Aliquota) * 0.01), -8);
    end;
  end;
  Result := Imposto;

end;

function TSuperClass.TGenericsF.CalculaICMS(ICMS: TICMS; BaseItem, ValorDespesas, ValorFrete, ValorSeguro, ValorDesconto,
  ValorIPI, ValorPISApuracao, ValorCOFINSApuracao, ValorII: Currency): TImposto;
var
  Imposto: TImposto;
begin
  with Imposto do
  begin
    Aliquota := 0;
    Base := 0;
    Valor := 0;
  end;
  with ICMS do
  begin
    if ((Calcula = VB_YES) and (Aliquota > 0)) then
    begin
      Imposto.Aliquota := Aliquota;
      Imposto.Base := BaseItem;
      if ((Despesas = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorDespesas;
      if ((Frete = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorFrete;
      if ((Seguro = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorSeguro;
      if ((Desconto = VB_YES)) then
        Imposto.Base := Imposto.Base - ValorDesconto;
      if ((II = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorII;
      if ((IPI = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorIPI;
      if ((PISApuracao = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorPISApuracao;
      if ((COFINSApuracao = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorCOFINSApuracao;

      if not Importacao then
      begin
        // Reducao da base de cálculo
        if ((Reducao <> 0)) then
          Imposto.Base := RoundTo(((Imposto.Base * (100 - Reducao)) * 0.01), -8);
      end
      else
      begin
        // Reducao da base de cálculo
        if ((Reducao <> 0)) then
          Imposto.Base := RoundTo(((Imposto.Base * (100 - Reducao)) * 0.01), -8);
        Imposto.Base := (Imposto.Base / (1 - (Aliquota * 0.01)));
      end;

      if not Importacao then
        Imposto.Valor := RoundTo(((Imposto.Base * Aliquota) * 0.01), -8)
      else
        Imposto.Valor := RoundTo(((Imposto.Base * Aliquota) * 0.01), -8);
    end;
  end;

  Result := Imposto;

end;

function TSuperClass.TGenericsF.CalculaICMSDif(ICMSDif: TICMSDiferido; ValorICMS: Currency): TImposto;
var
  Imposto: TImposto;
begin
  with Imposto do
  begin
    Aliquota := 0;
    Base := 0;
    Valor := 0;
  end;
  with ICMSDif do
  begin
    if (((Calcula = '1') or (Calcula = '2')) and (Aliquota > 0)) then // Diferido ou por Redução Calcula
    begin
      Imposto.Aliquota := Aliquota;
      Imposto.Base := ValorICMS;
      Imposto.Valor := RoundTo(((Imposto.Base * Aliquota) * 0.01), -4);
    end;
  end;
  Result := Imposto;
end;

function TSuperClass.TGenericsF.CalculaICMSFCP(ICMSFCP: TICMSFCP; ICMS: TImposto): TImposto;
var
  Imposto: TImposto;
  AliquotaDiferencial: Single;
begin
  with Imposto do
  begin
    Aliquota := 0;
    Base := 0;
    Valor := 0;
  end;
  with ICMSFCP do
  begin
    if ((Calcula = VB_NO)) then
    begin
      Imposto.Aliquota := Aliquota;
      AliquotaDiferencial := 0;
      Imposto.Base := ICMS.Base;
      Imposto.Valor := RoundTo(((Imposto.Base * Imposto.Aliquota) * 0.01), -4);
    end;
  end;
  Result := Imposto;
end;

function TSuperClass.TGenericsF.CalculaICMSPUFD(ICMSPUFD: TICMSPUFD; ICMS: TImposto): TImposto;
var
  Imposto: TImposto;
  AliquotaDiferencial: Single;
begin
  with Imposto do
  begin
    Aliquota := 0;
    Base := 0;
    Valor := 0;
  end;
  with ICMSPUFD do
  begin
    if ((Calcula = VB_NO)) then
    begin
      Imposto.Aliquota := Aliquota;
      AliquotaDiferencial := AliquotaICMSInternaOrigem - ICMS.Aliquota;
      Imposto.Base := RoundTo(((ICMS.Base * AliquotaDiferencial) * 0.01), -4);
      Imposto.Valor := RoundTo(((Imposto.Base * Aliquota) * 0.01), -4);
    end;
  end;
  Result := Imposto;
end;

function TSuperClass.TGenericsF.CalculaICMSPUFO(ICMSPUFO: TICMSPUFO; ICMS: TImposto): TImposto;
var
  Imposto: TImposto;
  AliquotaDiferencial: Single;
begin
  with Imposto do
  begin
    Aliquota := 0;
    Base := 0;
    Valor := 0;
  end;
  with ICMSPUFO do
  begin
    if ((Calcula = VB_NO)) then
    begin
      Imposto.Aliquota := Aliquota;
      AliquotaDiferencial := AliquotaICMSInternaOrigem - ICMS.Aliquota;
      Imposto.Base := RoundTo(((ICMS.Base * AliquotaDiferencial) * 0.01), -4);
      Imposto.Valor := RoundTo(((Imposto.Base * Aliquota) * 0.01), -4);
    end;
  end;
  Result := Imposto;
end;

function TSuperClass.TGenericsF.CalculaICMSST(ICMSST: TICMSST; ValorICMS, BaseItem, ValorDespesas, ValorFrete, ValorSeguro,
  ValorDesconto, ValorIPI, ValorPISApuracao, ValorCOFINSApuracao, ValorII: Currency; MargemLucro: Single): TImposto;
var
  Imposto: TImposto;
  Auxiliar: Currency;
begin

  with Imposto do
  begin
    Aliquota := 0;
    Base := 0;
    Valor := 0;
  end;

  with ICMSST do
  begin
    if ((Calcula = VB_YES) and (Aliquota > 0)) then
    begin
      Imposto.Aliquota := Aliquota;
      Imposto.Base := BaseItem;
      if ((Despesas = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorDespesas;
      if ((Frete = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorFrete;
      if ((Seguro = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorSeguro;
      if ((Desconto = VB_YES)) then
        Imposto.Base := Imposto.Base - ValorDesconto;
      if ((II = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorII;
      if ((IPI = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorIPI;
      if ((PISApuracao = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorPISApuracao;
      if ((COFINSApuracao = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorCOFINSApuracao;

      // Calculando a parte do lucro do produto para compor o calculo
      Auxiliar := ((Imposto.Base * MargemLucro) * 0.01);
      Imposto.Base := Imposto.Base + Auxiliar;

      if not Importacao then
      begin
        // Reducao da base de cálculo
        if ((Reducao <> 0)) then
          Imposto.Base := RoundTo(((Imposto.Base * (100 - Reducao)) * 0.01), -8);
      end
      else
      begin
        // Reducao da base de cálculo
        if ((Reducao <> 0)) then
          Imposto.Base := RoundTo(((Imposto.Base * (100 - Reducao)) * 0.01), -8);
        Imposto.Base := (Imposto.Base / (1 - (Aliquota * 0.01)));
      end;

      if not Importacao then
      begin
        if (Tipo = '0') then // Substituto - Quem recolhe
          Imposto.Valor := RoundTo(((Imposto.Base * Aliquota) * 0.01), -8)
        else // Quem vende
          // Imposto.Valor := RoundTo(((Auxiliar * Aliquota) * 0.01), -8)
          Imposto.Valor := RoundTo(((Imposto.Base * Aliquota) * 0.01), -8)
      end
      else
        Imposto.Valor := RoundTo(((Imposto.Base * Aliquota) * 0.01), -8);

      // if (Tipo = '0') then // Substituto
      Imposto.Valor := Imposto.Valor - ValorICMS;
      if Imposto.Valor < 0 then
        Imposto.Valor := 0;
    end;
  end;
  Result := Imposto;

end;

function TSuperClass.TGenericsF.CalculaII(II: TII; BaseItem, ValorDespesas, ValorFrete, ValorSeguro, ValorDesconto: Currency)
  : TImposto;
var
  Imposto: TImposto;
begin
  with Imposto do
  begin
    Aliquota := 0;
    Base := 0;
    Valor := 0;
  end;
  with II do
  begin
    if ((Calcula = VB_YES) and (Aliquota > 0)) then
    begin
      Imposto.Aliquota := Aliquota;
      Imposto.Base := BaseItem;
      if ((Despesas = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorDespesas;
      if ((Frete = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorFrete;
      if ((Seguro = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorSeguro;
      if ((Desconto = VB_YES)) then
        Imposto.Base := Imposto.Base - ValorDesconto;
      // Reducao da base de cálculo
      if ((Reducao <> 0)) then
        Imposto.Base := RoundTo(((Imposto.Base * (100 - Reducao)) * 0.01), -8);

      Imposto.Valor := RoundTo(((Imposto.Base * Aliquota) * 0.01), -8);
    end;
  end;
  Result := Imposto;
end;

function TSuperClass.TGenericsF.CalculaINSS(INSS: TINSS; BaseItem, ValorDespesas, ValorFrete, ValorSeguro,
  ValorDesconto: Currency): TImposto;
var
  Imposto: TImposto;
begin
  with Imposto do
  begin
    Aliquota := 0;
    Base := 0;
    Valor := 0;
  end;
  with INSS do
  begin
    if ((Calcula = VB_YES) and (Aliquota > 0)) then
    begin
      Imposto.Aliquota := Aliquota;
      Imposto.Base := BaseItem;
      if ((Despesas = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorDespesas;
      if ((Frete = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorFrete;
      if ((Seguro = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorSeguro;
      if ((Desconto = VB_YES)) then
        Imposto.Base := Imposto.Base - ValorDesconto;
      // Reducao da base de cálculo
      if ((Reducao <> 0)) then
        Imposto.Base := RoundTo(((Imposto.Base * (100 - Reducao)) * 0.01), -8);

      Imposto.Valor := RoundTo(((Imposto.Base * Aliquota) * 0.01), -8);
    end;
  end;
  Result := Imposto;
end;

function TSuperClass.TGenericsF.CalculaIPI(IPI: TIPI; BaseItem, ValorDespesas, ValorFrete, ValorSeguro, ValorDesconto,
  ValorII: Currency): TImposto;
var
  Imposto: TImposto;
begin
  with Imposto do
  begin
    Aliquota := 0;
    Base := 0;
    Valor := 0;
  end;
  with IPI do
  begin
    if ((Calcula = VB_YES) and (Aliquota > 0)) then
    begin
      Imposto.Aliquota := Aliquota;
      Imposto.Base := BaseItem;
      if ((Despesas = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorDespesas;
      if ((Frete = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorFrete;
      if ((Seguro = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorSeguro;
      if ((Desconto = VB_YES)) then
        Imposto.Base := Imposto.Base - ValorDesconto;
      if ((II = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorII;
      // Reducao da base de cálculo
      if ((Reducao <> 0)) then
        Imposto.Base := RoundTo(((Imposto.Base * (100 - Reducao)) * 0.01), -8);

      Imposto.Valor := RoundTo(((Imposto.Base * Aliquota) * 0.01), -8)
    end;
  end;
  Result := Imposto;

end;

function TSuperClass.TGenericsF.CalculaIRRF(IRRF: TIRRF; BaseItem, ValorDespesas, ValorFrete, ValorSeguro,
  ValorDesconto: Currency): TImposto;
var
  Imposto: TImposto;
begin
  with Imposto do
  begin
    Aliquota := 0;
    Base := 0;
    Valor := 0;
  end;
  with IRRF do
  begin
    if ((Calcula = VB_YES) and (Aliquota > 0)) then
    begin
      Imposto.Aliquota := Aliquota;
      Imposto.Base := BaseItem;
      if ((Despesas = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorDespesas;
      if ((Frete = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorFrete;
      if ((Seguro = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorSeguro;
      if ((Desconto = VB_YES)) then
        Imposto.Base := Imposto.Base - ValorDesconto;
      // Reducao da base de cálculo
      if ((Reducao <> 0)) then
        Imposto.Base := RoundTo(((Imposto.Base * (100 - Reducao)) * 0.01), -8);

      Imposto.Valor := RoundTo(((Imposto.Base * Aliquota) * 0.01), -8);
    end;
  end;
  Result := Imposto;

end;

function TSuperClass.TGenericsF.CalculaISS(ISS: TISS; BaseItem, ValorDespesas, ValorFrete, ValorSeguro, ValorDesconto: Currency)
  : TImposto;
var
  Imposto: TImposto;
begin
  with Imposto do
  begin
    Aliquota := 0;
    Base := 0;
    Valor := 0;
  end;
  with ISS do
  begin
    if ((Calcula = VB_YES) and (Aliquota > 0)) then
    begin
      Imposto.Aliquota := Aliquota;
      Imposto.Base := BaseItem;
      if ((Despesas = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorDespesas;
      if ((Frete = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorFrete;
      if ((Seguro = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorSeguro;
      if ((Desconto = VB_YES)) then
        Imposto.Base := Imposto.Base - ValorDesconto;
      // Reducao da base de cálculo
      if ((Reducao <> 0)) then
        Imposto.Base := RoundTo(((Imposto.Base * (100 - Reducao)) * 0.01), -8);

      Imposto.Valor := RoundTo(((Imposto.Base * Aliquota) * 0.01), -8);
    end;
  end;
  Result := Imposto;
end;

function TSuperClass.TGenericsF.CalculaPISApuracao(PISApuracao: TPISApuracao; BaseItem, ValorDespesas, ValorFrete, ValorSeguro,
  ValorDesconto, ValorICMSST: Currency; AliquotaIPI, AliquotaICMS, AliquotaCOFINSApuracao, AliquotaII: Single): TImposto;
var
  Imposto: TImposto;
  Auxiliar: Double;
begin
  with Imposto do
  begin
    Aliquota := 0;
    Base := 0;
    Valor := 0;
  end;
  with PISApuracao do
  begin
    if ((Calcula = VB_YES) and (Aliquota > 0)) then
    begin
      Imposto.Aliquota := Aliquota;
      Imposto.Base := BaseItem;
      if ((Despesas = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorDespesas;
      if ((Frete = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorFrete;
      if ((Seguro = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorSeguro;
      if ((Desconto = VB_YES)) then
        Imposto.Base := Imposto.Base - ValorDesconto;
      if ((ICMSST = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorICMSST;

      // Reducao da base de cálculo
      if ((Reducao <> 0)) then
        Imposto.Base := RoundTo(((Imposto.Base * (100 - Reducao)) * 0.01), -8);

      Imposto.Valor := RoundTo(((Imposto.Base * Aliquota) * 0.01), -8)
      {
        if ( not Importacao ) then
        Imposto.Valor := RoundTo(((Imposto.Base * Aliquota) * 0.01), -8)
        else
        begin
        Auxiliar      := (1 + (AliquotaICMS * 0.01) * ((AliquotaII * 0.01) + (AliquotaIPI * 0.01) * (1 + (AliquotaII * 0.01)))) / ((1-(Aliquota * 0.01)-(AliquotaCOFINSApuracao * 0.01)) * (1-(AliquotaICMS * 0.01)));
        Imposto.Valor := RoundTo( (Aliquota * 0.01) * (Imposto.Base * Auxiliar), -8);
        Imposto.Base  := RoundTo(Imposto.Base * Auxiliar, -8);
        end;
      }
    end;
  end;

  Result := Imposto;

end;

function TSuperClass.TGenericsF.CalculaPISRetencao(PISRetencao: TPISRetencao; BaseItem, ValorDespesas, ValorFrete, ValorSeguro,
  ValorDesconto: Currency): TImposto;
var
  Imposto: TImposto;
begin
  with Imposto do
  begin
    Aliquota := 0;
    Base := 0;
    Valor := 0;
  end;
  with PISRetencao do
  begin
    if ((Calcula = VB_YES) and (Aliquota > 0)) then
    begin
      Imposto.Aliquota := Aliquota;
      Imposto.Base := BaseItem;
      if ((Despesas = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorDespesas;
      if ((Frete = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorFrete;
      if ((Seguro = VB_YES)) then
        Imposto.Base := Imposto.Base + ValorSeguro;
      if ((Desconto = VB_YES)) then
        Imposto.Base := Imposto.Base - ValorDesconto;
      // Reducao da base de cálculo
      if ((Reducao <> 0)) then
        Imposto.Base := RoundTo(((Imposto.Base * (100 - Reducao)) * 0.01), -8);

      Imposto.Valor := RoundTo(((Imposto.Base * Aliquota) * 0.01), -8);
    end;
  end;
  Result := Imposto;

end;

function TSuperClass.TGenericsF.CalculaTributos(Tributos: TTributos; BaseItem: Currency): TImposto;
var
  Imposto: TImposto;
begin
  with Imposto do
  begin
    Aliquota := 0;
    Base := 0;
    Valor := 0;
  end;
  with Tributos do
  begin
    if ((Calcula = VB_NO) and (Aliquota > 0)) then
    begin
      Imposto.Aliquota := Aliquota;
      Imposto.Base := BaseItem;
      Imposto.Valor := RoundTo(((Imposto.Base * Aliquota) * 0.01), -8);
    end;
  end;
  Result := Imposto;
end;

function TSuperClass.TGenericsF.CarregaRegrasComissao(Vendedor: Integer): TRegrasComissao;
const
  Entidade = 'VENDEDORES';
var
  Empresa: String;
  Filial: String;
  Campos: String;
  Filtro: String;
  Auxiliar: TDataSet;
begin
  // Tratamento para a comissão
  with Result do
  begin
    TSuperClass.GetInstance.DBFunctions.GetEntityOwner(Entidade, Empresa, Filial);
    Campos := 'TIPOCOMISSAO, CONSIDERADESPESAS, CONSIDERAFRETE, CONSIDERASEGURO, CONSIDERADESCONTO, CONSIDERAIPI, CONSIDERAICMS, CONSIDERAISS, COMISSAO, FAIXA, HABILITAPRECOS';
    Filtro := Format('EMPRESA = %s AND FILIAL = %s AND CODIGO = %d', [QuotedStr(Empresa), QuotedStr(Filial), Vendedor]);
    try
      Auxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml(Campos, Entidade, Filtro, '');
      if Assigned(Auxiliar) then
      begin
        if (Auxiliar.BOF) and (Auxiliar.EOF) then
          TSuperClass.GetInstance.Log.Save('Regras de comissão não encontrada para o vendedor em questão.', mtInfo)
        else
        begin
          Carregado := True;
          TipoCalculo := Auxiliar.FieldByName('TIPOCOMISSAO').AsString;
          ConsideraDespesas := Auxiliar.FieldByName('CONSIDERADESPESAS').AsString;
          ConsideraFrete := Auxiliar.FieldByName('CONSIDERAFRETE').AsString;
          ConsideraSeguro := Auxiliar.FieldByName('CONSIDERASEGURO').AsString;
          ConsideraDesconto := Auxiliar.FieldByName('CONSIDERADESCONTO').AsString;
          ConsideraIPI := Auxiliar.FieldByName('CONSIDERAIPI').AsString;
          ConsideraICMS := Auxiliar.FieldByName('CONSIDERAICMS').AsString;
          ConsideraISS := Auxiliar.FieldByName('CONSIDERAISS').AsString;
          ComissaoVendedor := Auxiliar.FieldByName('COMISSAO').AsFloat;
          GrupoFaixa := Auxiliar.FieldByName('FAIXA').AsInteger;
          HabilitaPrecos := Auxiliar.FieldByName('HABILITAPRECOS').AsString;
        end;
      end;
    finally
      if Assigned(Auxiliar) then
        Auxiliar.Close;
      FreeAndNil(Auxiliar);
    end;
  end;
end;

function TSuperClass.TGenericsF.GetComputerName: String;
var
  Buffer: array [0 .. 255] of Char;
  Size: DWORD;
begin
  Size := 256;
  if Windows.GetComputerName(Buffer, Size) then
    Result := Buffer
  else
    Result := '';
end;

function TSuperClass.TGenericsF.GetIpAddress: String;
type
  TaPInAddr = array [0 .. 10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  Buffer: PAnsiChar;
  II: Integer;
  PPtr: PaPInAddr;
  pHE: PHostEnt;
  GInitData: TWSAData;
  Ret: TStrings;
begin
  WSAStartup($101, GInitData);

  Ret := TStringList.Create;

  try
    Ret.Clear;
    Buffer := '';
    GetHostName(Buffer, SizeOf(Buffer));
    pHE := GetHostByName(Buffer);

    if pHE = nil then
      Exit;

    PPtr := PaPInAddr(pHE^.H_Addr_List);
    II := 0;
    while PPtr^[II] <> nil do
    begin
      Ret.Add(String(Inet_NToA(PPtr^[II]^)));
      Inc(II);
    end;
  finally
    WSACleanup;

    if Ret.Count > 0 then
      Result := Ret[0];
    Ret.Free;
  end;
end;

function TSuperClass.TGenericsF.IfThen(AValue: Boolean; const ATrue, AFalse: String): String;
var
  Ret: String;
begin
  if AValue then
    Ret := ATrue
  else
    Ret := AFalse;
  Result := Ret;
end;

procedure TSuperClass.TGenericsF.InicializaValores(var Valores: TValores);
begin
  with Valores do
  begin
    BaseItem := 0;
    ValorMercadorias := 0;
    ValorDespesas := 0;
    ValorFrete := 0;
    ValorSeguro := 0;
    Desconto := 0;
    ValorDesconto := 0;
    Comissao := 0;
    BaseComissao := 0;
    ValorComissao := 0;
    ValorFinanceiro := 0;
    Volumes := 0;
    ValorBruto := 0;
    ValorLiquido := 0;
    with IPI do
    begin
      Aliquota := 0;
      Base := 0;
      Valor := 0;
    end;
    with ICMS do
    begin
      Aliquota := 0;
      Base := 0;
      Valor := 0;
    end;
    with ICMSDiferido do
    begin
      Aliquota := 0;
      Base := 0;
      Valor := 0;
    end;
    with ICMSFCP do
    begin
      Aliquota := 0;
      Base := 0;
      Valor := 0;
    end;
    with ICMSPUFD do
    begin
      Aliquota := 0;
      Base := 0;
      Valor := 0;
    end;
    with ICMSPUFO do
    begin
      Aliquota := 0;
      Base := 0;
      Valor := 0;
    end;
    with ICMSST do
    begin
      Aliquota := 0;
      Base := 0;
      Valor := 0;
    end;
    with ISS do
    begin
      Aliquota := 0;
      Base := 0;
      Valor := 0;
    end;
    with ISSApuracao do
    begin
      Aliquota := 0;
      Base := 0;
      Valor := 0;
    end;
    with ISSRetencao do
    begin
      Aliquota := 0;
      Base := 0;
      Valor := 0;
    end;
    with PISApuracao do
    begin
      Aliquota := 0;
      Base := 0;
      Valor := 0;
    end;
    with COFINSApuracao do
    begin
      Aliquota := 0;
      Base := 0;
      Valor := 0;
    end;
    with PISRetencao do
    begin
      Aliquota := 0;
      Base := 0;
      Valor := 0;
    end;
    with COFINSRetencao do
    begin
      Aliquota := 0;
      Base := 0;
      Valor := 0;
    end;
    with CSLLRetencao do
    begin
      Aliquota := 0;
      Base := 0;
      Valor := 0;
    end;
    with INSSApuracao do
    begin
      Aliquota := 0;
      Base := 0;
      Valor := 0;
    end;
    with INSSRetencao do
    begin
      Aliquota := 0;
      Base := 0;
      Valor := 0;
    end;
    with IRRFApuracao do
    begin
      Aliquota := 0;
      Base := 0;
      Valor := 0;
    end;
    with IRRFRetencao do
    begin
      Aliquota := 0;
      Base := 0;
      Valor := 0;
    end;
    with FGTS do
    begin
      Aliquota := 0;
      Base := 0;
      Valor := 0;
    end;
    with II do
    begin
      Aliquota := 0;
      Base := 0;
      Valor := 0;
    end;
    with Tributos do
    begin
      Aliquota := 0;
      Base := 0;
      Valor := 0;
    end;
    PesoBruto := 0;
    PesoLiquido := 0;
    ValorMoeda := 0;
    CustoTotal := 0;
    MargemLucro := 0;
    ValorAlternativo := 0;
  end;
end;

function TSuperClass.TGenericsF.RemoverAcento(value: String): String;
type
  USASCIIString = type AnsiString(20127);
var
  C: Char;
begin
  Result := '';
  for C in value do
    Result := Result + String(USASCIIString(C));
end;

function TSuperClass.TGenericsF.RetornaAliquotaICMSInterEstadual(UFDestino: ShortString): Single;
var
  UFOrigem: String;
  UF: String;
  Aliquota: Single;
  Schedule: TSchedule;
begin
  TSuperClass.GetInstance.Config.Load(Schedule);
  UFOrigem := Schedule.State;
  if (UFOrigem <> UFDestino) then
    UF := UFDestino
  else
    UF := UFOrigem;
  Aliquota := TSuperClass.GetInstance.DBFunctions.GetParamValue(Format('SV_ALIQUOTA_ICMS_%s', [UF]));

  TSuperClass.GetInstance.Log.Save(Format('Parametro %s - Valor %s', [Format('SV_ALIQUOTA_ICMS_%s', [UF]), FloatToStr(Aliquota)]
    ), mtInfo);

  if ((Aliquota = 0)) then
  begin
    TSuperClass.GetInstance.Log.Save(Format('Aliquota para o estado %s, não encontrado.', [UF]) +
      Format(' Verifique o conteúdo do parâmetro %s', [Format('SV_ALIQUOTA_ICMS_%s', [UF])]), mtInfo);
    Result := 0;
  end
  else
    Result := Aliquota;
end;

function TSuperClass.TGenericsF.RetornaAliquotaICMSInterna(UFDestino: ShortString): Single;
var
  UFOrigem: String;
  UF: String;
  Aliquota: Single;
  Estados: TUStringArray;
  Contador: Integer;
  Schedule: TSchedule;
begin
  Aliquota := 0;
  TSuperClass.GetInstance.Config.Load(Schedule);
  UFOrigem := Schedule.State;
  if (UFOrigem <> UFDestino) then
    UF := UFDestino
  else
    UF := UFOrigem;

  Estados := TSuperClass.GetInstance.GenericsF.Split
    (TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_ALIQUOTAS_ICMS_INTERNA'), ',');
  for Contador := Low(Estados) to High(Estados) do
  begin
    if (Copy(Estados[Contador], 1, 2) = UF) then
    begin
      Aliquota := StrToFloat(Copy(Estados[Contador], 3, Length(Estados[Contador])));
      Break;
    end;
  end;

  if ((Aliquota = 0)) then
  begin
    TSuperClass.GetInstance.Log.Save(Format('Aliquota para o estado %s, não encontrada ou zerada.', [UF]) +
      'Verifique o conteúdo do parâmetro SV_ALIQUOTAS_ICMS_INTERNA.', mtInfo);
    Result := 0;
  end
  else
    Result := Aliquota;
end;

procedure TSuperClass.TGenericsF.SaveRemoteFile(BaseDir, FileName: String; SaveType: TSaveLoadType);
var
  Proxy: TDSServerMethodsClient;
  InputStream: TFileStream;
  Tmp: TJSONArray;
  UpBytes: Int64;
begin
  if not FileExists(FileName) then
    raise Exception.Create(Format('Arquivo %s não encontrado!', [FileName]))
  else
  begin
    if BaseDir = '' then
      BaseDir := 'Profile';
    if (SaveType = stJSON) then
    begin
      try
        Proxy := TDSServerMethodsClient.Create(TSuperClass.GetInstance.getConnection.DBXConnection);
        InputStream := TFileStream.Create(FileName, fmOpenRead);
        try
          Tmp := TDBXJSONTools.StreamToJSON(InputStream, 0, InputStream.Size);
          if not Proxy.SaveRemoteFile(BaseDir, ExtractFileName(FileName), Tmp) then
            raise Exception.Create('Falha ao salvar o arquivo remotamente');
        finally
          FreeAndNil(Tmp);
        end;
      finally
        FreeAndNil(Proxy);
      end;
    end
    else
    begin
      try
        Proxy := TDSServerMethodsClient.Create(TSuperClass.GetInstance.getConnection.DBXConnection);
        InputStream := TFileStream.Create(FileName, fmOpenRead);
        InputStream.Position := 0;
        UpBytes := Proxy.SaveRemoteBinaryFile(BaseDir, ExtractFileName(FileName), InputStream);
        if (UpBytes <> InputStream.Size) then
          raise Exception.Create('Falha ao salvar o arquivo remotamente');
      finally
        FreeAndNil(Proxy);
      end;
    end;
  end;
end;

function TSuperClass.TGenericsF.SendEmail(ListEmail: TObjectList<TBodyEmail>): Boolean;
begin
  Result := False;
  try
    Result := TEmail.GetInstance.setSender('jhonny.ramos@trssistemas.com.br').setPort(587).setSmtp('smtp.trssistemas.com.br')
      .setPassword('jhonny@2012{}').setAuthenticate(Default).setContentType('multipart/mixed').setName('Jhonny').send(ListEmail);
  except
    Result := False;
  end;
end;

function TSuperClass.TGenericsF.Split(Source, ChrSource: AnsiString): TUStringArray;
var
  WorkString: String;
  ChrPos: Integer;
  Strings: TUStringArray;
  Index: Integer;
begin
  WorkString := Source;
  Index := 0;
  while (WorkString <> '') do
  begin
    ChrPos := Pos(ChrSource, WorkString);
    if (ChrPos > 0) then
    begin
      Inc(Index);
      SetLength(Strings, Index);
      Strings[Index - 1] := Copy(WorkString, 1, ChrPos - 1);
      Delete(WorkString, 1, -1 + (ChrPos + Length(ChrSource)));
    end
    else
    begin
      Inc(Index);
      SetLength(Strings, Index);
      Strings[Index - 1] := Copy(WorkString, 1, Length(WorkString));
      Delete(WorkString, 1, Length(WorkString));
    end;
  end;
  Result := Strings;
end;

{ TSuperClass.TDBFunctions }

function TSuperClass.TDBFunctions.CheckRequiredFields(DataSet: TDataSet): Boolean;
var
  FieldIndex: Integer;
  FieldEmpty: Boolean;
begin
  Result := True;
  FieldEmpty := False;
  if (Assigned(DataSet)) then
  begin
    with (DataSet as TClientDataSet) do
      for FieldIndex := 0 to FieldCount - 1 do
        with Fields[FieldIndex] do
        begin
          if (Required) then
          begin
            if (Fields[FieldIndex].DataType in [ftString]) then
              FieldEmpty := (IsNull) or (value = '')
            else if (Fields[FieldIndex].DataType in [ftInteger]) then
              FieldEmpty := (IsNull) or (value = 0)
            else if (Fields[FieldIndex].DataType in [ftFloat, ftCurrency, ftFMTBCD, ftBCD]) then
              FieldEmpty := (IsNull) or (value = 0)
            else if (DataType in [ftDate]) then
              FieldEmpty := (IsNull) or (value = 0)
            else if (DataType in [ftDateTime]) then
              FieldEmpty := (IsNull) or (value = 0)
            else if (DataType in [ftBlob]) then
              FieldEmpty := (IsNull) or (value = '')
            else if (DataType in [ftMemo]) then
              FieldEmpty := (IsNull) or (value = '');
          end;

          if (FieldEmpty) then
          begin
            Result := False;
            raise Exception.Create(Format('O campo [ %s, %s ] é requerido.', [DisplayName, FieldName]));
          end;
        end;
  end;
end;

function TSuperClass.TDBFunctions.GetNextNumber(DataSet: TDataSet; FieldName: ShortString): Integer;
var
  Mark: TBookMark;
begin
  with DataSet do
  begin
    Mark := GetBookmark;
    Last;
    Result := FieldByName(FieldName).AsInteger + 1;
    GotoBookMark(Mark);
    FreeBookMark(Mark);
  end;
end;

function TSuperClass.TDBFunctions.ExecuteQueryByXml(Sql: String): TDataSet;
var
  RetData: OleVariant;
  Proxy: TDSServerMethodsClient;
  Ret: TClientDataSet;
begin
  Ret := Nil;
  try
    try
      Proxy := TDSServerMethodsClient.Create(TSuperClass.GetInstance.getConnection.DBXConnection, False);
      RetData := Proxy.ExecuteQuery(Sql);
      if (not VarIsNull(RetData)) and (not VarIsClear(RetData)) then
      begin
        Ret := TClientDataSet.Create(Nil);
        Ret.Data := RetData;
        Ret.Open;
        Ret.First;
      end;
    finally
      FreeAndNil(Proxy);
    end;
  except
    if Assigned(Ret) then
      FreeAndNil(Ret);
  end;
  Result := Ret;
end;

function TSuperClass.TDBFunctions.ExecuteQueryByXml(Fields, From, Where, OrderBy: String): TDataSet;
var
  RetData: OleVariant;
  Proxy: TDSServerMethodsClient;
  Ret: TClientDataSet;
  Sql: String;
begin
  Ret := Nil;
  try
    try
      Proxy := TDSServerMethodsClient.Create(TSuperClass.GetInstance.getConnection.DBXConnection, False);
      Sql := Format('SELECT %s FROM %s', [Fields, From]);
      if Where <> '' then
        Sql := Sql + Format(' WHERE %s', [Where]);
      if OrderBy <> '' then
        Sql := Sql + Format(' ORDER BY %s', [OrderBy]);
      RetData := Proxy.ExecuteQuery(Sql);
      if (not VarIsNull(RetData)) then
      begin
        Ret := TClientDataSet.Create(Nil);
        Ret.Data := RetData;
        Ret.Open;
        Ret.First;
      end;
    finally
      FreeAndNil(Proxy);
    end;
  except
    if Assigned(Ret) then
      FreeAndNil(Ret);
  end;
  Result := Ret;
end;

function TSuperClass.TDBFunctions.ExecuteQueryByXml(Fields: TUStringArray; From, Where, OrderBy: String): TDataSet;
var
  RetData: OleVariant;
  Proxy: TDSServerMethodsClient;
  Ret: TClientDataSet;
  Sql: String;
  I: Integer;
  WorkFields: String;
begin
  Ret := Nil;
  try
    for I := Low(Fields) to High(Fields) do
      WorkFields := WorkFields + Format('%s, ', [Fields[I]]);
    WorkFields := Copy(WorkFields, 1, Length(WorkFields) - 2);
    try
      Proxy := TDSServerMethodsClient.Create(TSuperClass.GetInstance.getConnection.DBXConnection, False);
      Sql := Format('SELECT %s FROM %s', [WorkFields, From]);
      if Where <> '' then
        Sql := Sql + Format(' WHERE %s', [Where]);
      if OrderBy <> '' then
        Sql := Sql + Format(' ORDER BY %s', [OrderBy]);
      RetData := Proxy.ExecuteQuery(Sql);
      if (not VarIsNull(RetData)) then
      begin
        Ret := TClientDataSet.Create(Nil);
        Ret.Data := RetData;
        Ret.Open;
        Ret.First;
      end;
    finally
      FreeAndNil(Proxy);
    end;
  except
    if Assigned(Ret) then
      FreeAndNil(Ret);
  end;
  Result := Ret;
end;

procedure TSuperClass.TDBFunctions.GetEntityOwner(EntityName: String; var Company, Branch: String);
var
  Proxy: TDSServerMethodsClient;
begin
  try
    TSuperClass.GetInstance.User.Connect;
    TSuperClass.GetInstance.User.Login;

    Proxy := TDSServerMethodsClient.Create(TSuperClass.GetInstance.getConnection.DBXConnection, False);

    Proxy.GetEntityOwner(EntityName, Company, Branch);
  finally
    FreeAndNil(Proxy);
  end;
end;

function TSuperClass.TDBFunctions.GetParamValue(ParamName: String): Variant;
var
  Empresa, Filial: String;
  dsAuxiliar: TDataSet;
begin
  try
    try
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('SYS_PARAMS', Empresa, Filial);
      dsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
        (Format('select * from SYS_PARAMS where EMPRESA = %s and FILIAL = %s and VARIAVEL = %s',
        [QuotedStr(Empresa), QuotedStr(Filial), QuotedStr(ParamName)]));
      if Assigned(dsAuxiliar) then
        if not(dsAuxiliar.State in [dsInactive]) then
          if dsAuxiliar.RecordCount > 0 then
            Result := dsAuxiliar.FieldByName('VALOR').AsVariant;
    except
      on E: Exception do
        TSuperClass.GetInstance.Log.Save('Erro ao obter parametros ' + E.Message, mtError)
    end;
  finally
    if Assigned(dsAuxiliar) then
      FreeAndNil(dsAuxiliar);
  end;
end;

{ TSuperClass.TUser }

function TSuperClass.TUser.Connect: Boolean;
var
  Schedule: TSchedule;
begin
  try
    if not TSuperClass.GetInstance.getConnection.Connected then
    begin
      TSuperClass.GetInstance.Config.Load(Schedule);
      TSuperClass.GetInstance.getConnection.Params.Values['Port'] := IntToStr(Schedule.Port);
      TSuperClass.GetInstance.getConnection.Params.Values['DSAuthenticationUser'] := 'Administrator';
      TSuperClass.GetInstance.getConnection.Params.Values['DSAuthenticationPassword'] :=
        TSuperClass.GetInstance.User.GetCredencials;
      TSuperClass.GetInstance.getConnection.Connected := True;
    end;
    Result := TSuperClass.GetInstance.getConnection.Connected;
  except
    on E: Exception do
      TSuperClass.GetInstance.Log.Save('Erro ao conectar ao servidor!' + E.Message, mtError);
  end;
end;

function TSuperClass.TUser.Disconnect: Boolean;
begin
  try
    if TSuperClass.GetInstance.getConnection.Connected then
      TSuperClass.GetInstance.getConnection.Connected := False;
    Result := TSuperClass.GetInstance.getConnection.Connected;
  except
    on E: Exception do
      TSuperClass.GetInstance.Log.Save('Erro ao desconectar ao servidor!' + E.Message, mtError);
  end;
end;

function TSuperClass.TUser.GetCredencials: String;
var
  F: TStringList;
  FilePath: String;
  Ret: String;
begin
  Ret := '';
  try
    F := TStringList.Create;
    FilePath := Copy(ExtractFilePath(ParamStr(0)), 1, Length(ExtractFilePath(ParamStr(0))) - 1);
    FilePath := Format('%s\customer_info.credentials', [FilePath]);
    F.LoadFromFile(FilePath);
    Ret := F.Text;
  finally
    FreeAndNil(F);
  end;
  Result := Ret;
end;

function TSuperClass.TUser.GetThreadID: Integer;
var
  Proxy: TDSServerMethodsClient;
  Schedule: TSchedule;
begin
  Result := 0;
  try
    TSuperClass.GetInstance.User.Connect;
    TSuperClass.GetInstance.Config.Load(Schedule);
    Proxy := TDSServerMethodsClient.Create(TSuperClass.GetInstance.getConnection.DBXConnection, False);
    Proxy.DoConnection(Schedule.Actived);
    Result := Proxy.GetUserThreadId;
  finally
    if Assigned(Proxy) then
      FreeAndNil(Proxy);
  end;
end;

function TSuperClass.TUser.Login: Boolean;
var
  Proxy: TDSServerMethodsClient;
  Schedule: TSchedule;
begin
  Result := False;
  try
    TSuperClass.GetInstance.User.Connect;
    TSuperClass.GetInstance.Config.Load(Schedule);
    Proxy := TDSServerMethodsClient.Create(TSuperClass.GetInstance.getConnection.DBXConnection, False);
    Result := Proxy.SetUser(Ord(usOnLine), Now, TSuperClass.GetInstance.GenericsF.GetIpAddress,
      TSuperClass.GetInstance.GenericsF.GetComputerName, 'Follow Up', '', Schedule.Actived, 'Consultando...', Schedule.Company,
      Schedule.Branch, '', '', '');
    Proxy.DoConnection(Schedule.Actived);
  finally
    if Assigned(Proxy) then
      FreeAndNil(Proxy);
  end;
end;

{ TSuperClass.TLog }

function TSuperClass.TLog.Save(Msg: String; MsgType: TMsgType): Boolean;
var
  LogPath: String;
  Info: String;
  Schedule: TSchedule;
  LogFile: TextFile;
begin
  Result := False;

  TSuperClass.GetInstance.Config.Load(Schedule);
  LogPath := Schedule.LogPath;

  if not FileExists( LogPath ) then
    LogPath := IncludeTrailingPathDelimiter(TSuperClass.GetInstance.GenericsF.AppPath) + 'appmobile.log';

  Info := '';
  AssignFile(LogFile, LogPath);

  if FileExists(LogPath) then
    Append(LogFile)
  else
    Rewrite(LogFile);

  try
    try

      // Info := Format('[ThreadId %d]', [TSuperClass.GetInstance.User.GetThreadID]);

      if MsgType = mtInfo then
        Info := Info + '[INFO]: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now)
      else if MsgType = mtError then
        Info := Info + '[ERROR]: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now)
      else
        Info := Info + '[UNKNOWN]: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);
      Info := Format('%s -> %s', [Info, Msg]);

      writeln(LogFile, Info);

    except
      on E: Exception do
      begin
        Info := Info + '[ERROR]: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);
        Info := Format('%s -> %s', [Info, E.Message]);
        writeln(LogFile, Info);
      end;
    end;
  finally
    closeFile(LogFile);
  end;
end;

{ TSuperClass.TConfig }

procedure TSuperClass.TConfig.Load(var Schedule: TSchedule);
var
  IniFile: TIniFile;
begin
  try
    try
      // criando instancia para carregar o arquivo de ambientes
      IniFile := TIniFile.Create(TSuperClass.GetInstance.GenericsF.AppPath + FN_CONFIGURATIONS);
      // carregando os ambientes existentes no arquivo de configuração
      Schedule.Actived := IniFile.ReadString('Mobile SFA', 'Actived', 'DefaultEnv');
      Schedule.LogPath := IniFile.ReadString('Mobile SFA', 'Log Path', '');
      Schedule.Company := IniFile.ReadString('Mobile SFA', 'Company', '**');
      Schedule.Branch := IniFile.ReadString('Mobile SFA', 'Branch', '**');
      Schedule.Port := StrToInt(IniFile.ReadString('Mobile SFA', 'Port', '215'));
      Schedule.AtualizarEstoque := StrToInt(IniFile.ReadString('Mobile SFA', 'Atualizar Estoque', '6'));
      Schedule.HoraPreco := StrToTime(IniFile.ReadString('Mobile SFA', 'Hora preço', '18:00'));
      Schedule.DataHoraInicioImportacao := StrToDateTime(IniFile.ReadString('Mobile SFA', 'Hora Inicio Importação', DateTimeToStr(Now)));
      Schedule.State := IniFile.ReadString('Mobile SFA', 'State', 'SP');
      Schedule.PrimeiraExecucao := IniFile.ReadString('Mobile SFA', 'Primeira Execução', 'N') = 'S';
    finally
      FreeAndNil(IniFile);
    end;
  except
    on E: Exception do
      TSuperClass.GetInstance.Log.Save(E.Message, mtError);
  end;
end;

procedure TSuperClass.TConfig.Save(Schedule: TSchedule);
var
  IniFile: TIniFile;
begin
  try
    try
      // criando instancia para carregar o arquivo de ambientes
      IniFile := TIniFile.Create(TSuperClass.GetInstance.GenericsF.AppPath + FN_CONFIGURATIONS);
      // carregando os ambientes existentes no arquivo de configuração
      IniFile.WriteString('Mobile SFA', 'Actived', Schedule.Actived);
      IniFile.WriteString('Mobile SFA', 'Log Path', Schedule.LogPath);
      IniFile.WriteString('Mobile SFA', 'Port', IntToStr(Schedule.Port));
      IniFile.WriteString('Mobile SFA', 'Company', Schedule.Company);
      IniFile.WriteString('Mobile SFA', 'Branch', Schedule.Branch);
      IniFile.WriteString('Mobile SFA', 'State', Schedule.State);
      IniFile.WriteString('Mobile SFA', 'Atualizar Estoque', IntToStr(Schedule.AtualizarEstoque));
      IniFile.WriteString('Mobile SFA', 'Hora preço', TimeToStr(Schedule.HoraPreco));
      IniFile.WriteString('Mobile SFA', 'Hora Inicio Importação', DateTimeToStr(Schedule.DataHoraInicioImportacao));
      if Schedule.PrimeiraExecucao then
        IniFile.WriteString('Mobile SFA', 'Primeira Execução', 'S')
      else
        IniFile.WriteString('Mobile SFA', 'Primeira Execução', 'N');
    finally
      FreeAndNil(IniFile);
    end;
  except
    on E: Exception do
      TSuperClass.GetInstance.Log.Save(E.Message, mtError);
  end;
end;

end.
