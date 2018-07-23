// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:1518/WebSPonto/NewService.asmx?wsdl
// Encoding : utf-8
// Version  : 1.0
// (15/07/2011 17:40:35 - 1.33.2.5)
// ************************************************************************ //

unit NewService;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:int             - "http://www.w3.org/2001/XMLSchema"
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"
  // !:short           - "http://www.w3.org/2001/XMLSchema"
  // !:unsignedByte    - "http://www.w3.org/2001/XMLSchema"

  EditBase             = class;                 { "http://tempuri.org/" }
  Funcionario          = class;                 { "http://tempuri.org/" }
  FuncionarioTolerancia = class;                { "http://tempuri.org/" }
  HorarioComplementar  = class;                 { "http://tempuri.org/" }
  Configuracao         = class;                 { "http://tempuri.org/" }
  Digital              = class;                 { "http://tempuri.org/" }
  HorarioTurno         = class;                 { "http://tempuri.org/" }

  { "http://tempuri.org/" }
  EditState = (esEdit, esInsert, esDelete, esBrowse);

  guid            =  type WideString;      { "http://microsoft.com/wsdl/types/" }


  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  EditBase = class(TRemotable)
  private
    FID: guid;
    FEditState: EditState;
  published
    property ID: guid read FID write FID;
    property EditState: EditState read FEditState write FEditState;
  end;



  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  Funcionario = class(EditBase)
  private
    FGestorID: guid;
    FIdEmpresaExterno: Integer;
    FIdFuncionarioExterno: WideString;
    FTpPessoa: WideString;
    FNome: WideString;
    FNomeCurto: WideString;
    FDtNascimento: TXSDateTime;
    FMensagem: WideString;
    FHrEntrada: TXSDateTime;
    FHrSaidaAlmoco: TXSDateTime;
    FHrEntradaAlmoco: TXSDateTime;
    FHrSaida: TXSDateTime;
    FHrSaidaIntervalo: TXSDateTime;
    FHrEntradaIntervalo: TXSDateTime;
    FDiasFolga: WideString;
    FVerificaMarcacaoCod: WideString;
    FDtDemissao: TXSDateTime;
    FVerificaMarcacaoSenha: WideString;
    FDtAlteracaoCad: TXSDateTime;
    FConsideraAlmoco: Boolean;
    FIntervaloMinimoAlmoco: Integer;
    FPIS: WideString;
  public
    destructor Destroy; override;
  published
    property GestorID: guid read FGestorID write FGestorID;
    property IdEmpresaExterno: Integer read FIdEmpresaExterno write FIdEmpresaExterno;
    property IdFuncionarioExterno: WideString read FIdFuncionarioExterno write FIdFuncionarioExterno;
    property TpPessoa: WideString read FTpPessoa write FTpPessoa;
    property Nome: WideString read FNome write FNome;
    property NomeCurto: WideString read FNomeCurto write FNomeCurto;
    property DtNascimento: TXSDateTime read FDtNascimento write FDtNascimento;
    property Mensagem: WideString read FMensagem write FMensagem;
    property HrEntrada: TXSDateTime read FHrEntrada write FHrEntrada;
    property HrSaidaAlmoco: TXSDateTime read FHrSaidaAlmoco write FHrSaidaAlmoco;
    property HrEntradaAlmoco: TXSDateTime read FHrEntradaAlmoco write FHrEntradaAlmoco;
    property HrSaida: TXSDateTime read FHrSaida write FHrSaida;
    property HrSaidaIntervalo: TXSDateTime read FHrSaidaIntervalo write FHrSaidaIntervalo;
    property HrEntradaIntervalo: TXSDateTime read FHrEntradaIntervalo write FHrEntradaIntervalo;
    property DiasFolga: WideString read FDiasFolga write FDiasFolga;
    property VerificaMarcacaoCod: WideString read FVerificaMarcacaoCod write FVerificaMarcacaoCod;
    property DtDemissao: TXSDateTime read FDtDemissao write FDtDemissao;
    property VerificaMarcacaoSenha: WideString read FVerificaMarcacaoSenha write FVerificaMarcacaoSenha;
    property DtAlteracaoCad: TXSDateTime read FDtAlteracaoCad write FDtAlteracaoCad;
    property ConsideraAlmoco: Boolean read FConsideraAlmoco write FConsideraAlmoco;
    property IntervaloMinimoAlmoco: Integer read FIntervaloMinimoAlmoco write FIntervaloMinimoAlmoco;
    property PIS: WideString read FPIS write FPIS;
  end;

  ArrayOfFuncionario = array of Funcionario;    { "http://tempuri.org/" }
  ArrayOfString = array of WideString;          { "http://tempuri.org/" }


  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  FuncionarioTolerancia = class(EditBase)
  private
    FFuncionarioID: guid;
    FToleranciaEntrada: Smallint;
    FToleranciaEntradaAlmoco: Smallint;
    FToleranciaSaidaAlmoco: Smallint;
    FToleranciaSaida: Smallint;
    FToleranciaEntradaAntecipada: Smallint;
    FToleranciaEntradaAlmocoEntecipada: Smallint;
    FToleranciaSaidaAlmocoAntecipada: Smallint;
    FToleranciaSaidaAntecipada: Smallint;
    FIgnoraToleranciaEntrada: Boolean;
    FIgnoraToleranciaEntradaAlmoco: Boolean;
    FIgnoraToleranciaEntradaAntecipada: Boolean;
    FIgnoraToleranciaEntradaAlmocoAntecipada: Boolean;
    FIgnoraToleranciaSaida: Boolean;
    FIgnoraToleranciaSaidaAlmocoAntecipada: Boolean;
    FIgnoraToleranciaSaidaAntecipada: Boolean;
    FIgnoraToleranciaSaidaAlmoco: Boolean;
  published
    property FuncionarioID: guid read FFuncionarioID write FFuncionarioID;
    property ToleranciaEntrada: Smallint read FToleranciaEntrada write FToleranciaEntrada;
    property ToleranciaEntradaAlmoco: Smallint read FToleranciaEntradaAlmoco write FToleranciaEntradaAlmoco;
    property ToleranciaSaidaAlmoco: Smallint read FToleranciaSaidaAlmoco write FToleranciaSaidaAlmoco;
    property ToleranciaSaida: Smallint read FToleranciaSaida write FToleranciaSaida;
    property ToleranciaEntradaAntecipada: Smallint read FToleranciaEntradaAntecipada write FToleranciaEntradaAntecipada;
    property ToleranciaEntradaAlmocoEntecipada: Smallint read FToleranciaEntradaAlmocoEntecipada write FToleranciaEntradaAlmocoEntecipada;
    property ToleranciaSaidaAlmocoAntecipada: Smallint read FToleranciaSaidaAlmocoAntecipada write FToleranciaSaidaAlmocoAntecipada;
    property ToleranciaSaidaAntecipada: Smallint read FToleranciaSaidaAntecipada write FToleranciaSaidaAntecipada;
    property IgnoraToleranciaEntrada: Boolean read FIgnoraToleranciaEntrada write FIgnoraToleranciaEntrada;
    property IgnoraToleranciaEntradaAlmoco: Boolean read FIgnoraToleranciaEntradaAlmoco write FIgnoraToleranciaEntradaAlmoco;
    property IgnoraToleranciaEntradaAntecipada: Boolean read FIgnoraToleranciaEntradaAntecipada write FIgnoraToleranciaEntradaAntecipada;
    property IgnoraToleranciaEntradaAlmocoAntecipada: Boolean read FIgnoraToleranciaEntradaAlmocoAntecipada write FIgnoraToleranciaEntradaAlmocoAntecipada;
    property IgnoraToleranciaSaida: Boolean read FIgnoraToleranciaSaida write FIgnoraToleranciaSaida;
    property IgnoraToleranciaSaidaAlmocoAntecipada: Boolean read FIgnoraToleranciaSaidaAlmocoAntecipada write FIgnoraToleranciaSaidaAlmocoAntecipada;
    property IgnoraToleranciaSaidaAntecipada: Boolean read FIgnoraToleranciaSaidaAntecipada write FIgnoraToleranciaSaidaAntecipada;
    property IgnoraToleranciaSaidaAlmoco: Boolean read FIgnoraToleranciaSaidaAlmoco write FIgnoraToleranciaSaidaAlmoco;
  end;



  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  HorarioComplementar = class(EditBase)
  private
    FGestorID: guid;
    FFuncionarioID: guid;
    FEntrada: TXSDateTime;
    FSaidaAlmoco: TXSDateTime;
    FEntradaAlmoco: TXSDateTime;
    FSaida: TXSDateTime;
    FSaidaIntervalo: TXSDateTime;
    FEntradaIntervalo: TXSDateTime;
    FInicio: TXSDateTime;
    FFim: TXSDateTime;
    FDiaSemana: Byte;
  public
    destructor Destroy; override;
  published
    property GestorID: guid read FGestorID write FGestorID;
    property FuncionarioID: guid read FFuncionarioID write FFuncionarioID;
    property Entrada: TXSDateTime read FEntrada write FEntrada;
    property SaidaAlmoco: TXSDateTime read FSaidaAlmoco write FSaidaAlmoco;
    property EntradaAlmoco: TXSDateTime read FEntradaAlmoco write FEntradaAlmoco;
    property Saida: TXSDateTime read FSaida write FSaida;
    property SaidaIntervalo: TXSDateTime read FSaidaIntervalo write FSaidaIntervalo;
    property EntradaIntervalo: TXSDateTime read FEntradaIntervalo write FEntradaIntervalo;
    property Inicio: TXSDateTime read FInicio write FInicio;
    property Fim: TXSDateTime read FFim write FFim;
    property DiaSemana: Byte read FDiaSemana write FDiaSemana;
  end;



  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  Configuracao = class(EditBase)
  private
    FGestorID: guid;
    FNmIdentificacao: WideString;
    FValor: WideString;
  published
    property GestorID: guid read FGestorID write FGestorID;
    property NmIdentificacao: WideString read FNmIdentificacao write FNmIdentificacao;
    property Valor: WideString read FValor write FValor;
  end;

  ArrayOfConfiguracao = array of Configuracao;   { "http://tempuri.org/" }


  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  Digital = class(EditBase)
  private
    FGestorID: guid;
    FFuncionarioID: guid;
    FDigitalIdent: WideString;
    FAlteracaoCad: TXSDateTime;
  public
    destructor Destroy; override;
  published
    property GestorID: guid read FGestorID write FGestorID;
    property FuncionarioID: guid read FFuncionarioID write FFuncionarioID;
    property DigitalIdent: WideString read FDigitalIdent write FDigitalIdent;
    property AlteracaoCad: TXSDateTime read FAlteracaoCad write FAlteracaoCad;
  end;



  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  HorarioTurno = class(EditBase)
  private
    FFuncionarioID: guid;
    FGestorID: guid;
    FEntrada: TXSDateTime;
    FSaidaAlmoco: TXSDateTime;
    FEntradaAlmoco: TXSDateTime;
    FSaida: TXSDateTime;
    FSaidaIntervalo: TXSDateTime;
    FEntradaIntervalo: TXSDateTime;
    FInicio: TXSDateTime;
    FFim: TXSDateTime;
    FTipo: WideString;
  public
    destructor Destroy; override;
  published
    property FuncionarioID: guid read FFuncionarioID write FFuncionarioID;
    property GestorID: guid read FGestorID write FGestorID;
    property Entrada: TXSDateTime read FEntrada write FEntrada;
    property SaidaAlmoco: TXSDateTime read FSaidaAlmoco write FSaidaAlmoco;
    property EntradaAlmoco: TXSDateTime read FEntradaAlmoco write FEntradaAlmoco;
    property Saida: TXSDateTime read FSaida write FSaida;
    property SaidaIntervalo: TXSDateTime read FSaidaIntervalo write FSaidaIntervalo;
    property EntradaIntervalo: TXSDateTime read FEntradaIntervalo write FEntradaIntervalo;
    property Inicio: TXSDateTime read FInicio write FInicio;
    property Fim: TXSDateTime read FFim write FFim;
    property Tipo: WideString read FTipo write FTipo;
  end;


  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // soapAction: http://tempuri.org/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // binding   : NewServiceSoap
  // service   : NewService
  // port      : NewServiceSoap
  // URL       : http://localhost:1518/WebSPonto/NewService.asmx
  // ************************************************************************ //
  NewServiceSoap = interface(IInvokable)
  ['{46F4A84F-4D50-97CF-977A-8DC0BD79BEE8}']
    function  ReceberFuncionarioIDs(const IdTerminal: WideString): ArrayOfFuncionario; stdcall;
    function  ReceberFuncionarioIDs_ForDate(const IdTerminal: WideString; const DataUltimaAtualizacaoIponto: TXSDateTime): ArrayOfFuncionario; stdcall;
    function  ReceberFuncionarios(const id: WideString): Funcionario; stdcall;
    function  ReceberFuncionarioToleranciaIds(const IdTerminal: WideString): ArrayOfString; stdcall;
    function  ReceberFuncionarioTolerancia(const id: WideString): FuncionarioTolerancia; stdcall;
    function  ReceberHorarioComplementarFuncionario(const IdFuncionario: WideString): HorarioComplementar; stdcall;
    function  ReceberConfiguracaoGestor(const terminalID: WideString): ArrayOfConfiguracao; stdcall;
    function  DigitaisIDs(const terminalID: WideString; const funcionarioID: WideString): Digital; stdcall;
    function  ReceberHorarioTurno(const FuncionarioID: WideString): HorarioTurno; stdcall;
  end;

function GetNewServiceSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): NewServiceSoap;


implementation

function GetNewServiceSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): NewServiceSoap;
const
  defWSDL = 'http://localhost:1518/WebSPonto/NewService.asmx?wsdl';
  defURL  = 'http://localhost:1518/WebSPonto/NewService.asmx';
  defSvc  = 'NewService';
  defPrt  = 'NewServiceSoap';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as NewServiceSoap);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


destructor Funcionario.Destroy;
begin
  if Assigned(FDtNascimento) then
    FDtNascimento.Free;
  if Assigned(FHrEntrada) then
    FHrEntrada.Free;
  if Assigned(FHrSaidaAlmoco) then
    FHrSaidaAlmoco.Free;
  if Assigned(FHrEntradaAlmoco) then
    FHrEntradaAlmoco.Free;
  if Assigned(FHrSaida) then
    FHrSaida.Free;
  if Assigned(FHrSaidaIntervalo) then
    FHrSaidaIntervalo.Free;
  if Assigned(FHrEntradaIntervalo) then
    FHrEntradaIntervalo.Free;
  if Assigned(FDtDemissao) then
    FDtDemissao.Free;
  if Assigned(FDtAlteracaoCad) then
    FDtAlteracaoCad.Free;
  inherited Destroy;
end;

destructor HorarioComplementar.Destroy;
begin
  if Assigned(FEntrada) then
    FEntrada.Free;
  if Assigned(FSaidaAlmoco) then
    FSaidaAlmoco.Free;
  if Assigned(FEntradaAlmoco) then
    FEntradaAlmoco.Free;
  if Assigned(FSaida) then
    FSaida.Free;
  if Assigned(FSaidaIntervalo) then
    FSaidaIntervalo.Free;
  if Assigned(FEntradaIntervalo) then
    FEntradaIntervalo.Free;
  if Assigned(FInicio) then
    FInicio.Free;
  if Assigned(FFim) then
    FFim.Free;
  inherited Destroy;
end;

destructor Digital.Destroy;
begin
  if Assigned(FAlteracaoCad) then
    FAlteracaoCad.Free;
  inherited Destroy;
end;

destructor HorarioTurno.Destroy;
begin
  if Assigned(FEntrada) then
    FEntrada.Free;
  if Assigned(FSaidaAlmoco) then
    FSaidaAlmoco.Free;
  if Assigned(FEntradaAlmoco) then
    FEntradaAlmoco.Free;
  if Assigned(FSaida) then
    FSaida.Free;
  if Assigned(FSaidaIntervalo) then
    FSaidaIntervalo.Free;
  if Assigned(FEntradaIntervalo) then
    FEntradaIntervalo.Free;
  if Assigned(FInicio) then
    FInicio.Free;
  if Assigned(FFim) then
    FFim.Free;
  inherited Destroy;
end;

initialization
  InvRegistry.RegisterInterface(TypeInfo(NewServiceSoap), 'http://tempuri.org/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(NewServiceSoap), 'http://tempuri.org/%operationName%');
  RemClassRegistry.RegisterXSInfo(TypeInfo(EditState), 'http://tempuri.org/', 'EditState');
  RemClassRegistry.RegisterXSInfo(TypeInfo(guid), 'http://microsoft.com/wsdl/types/', 'guid');
  RemClassRegistry.RegisterXSClass(EditBase, 'http://tempuri.org/', 'EditBase');
  RemClassRegistry.RegisterXSClass(Funcionario, 'http://tempuri.org/', 'Funcionario');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfFuncionario), 'http://tempuri.org/', 'ArrayOfFuncionario');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfString), 'http://tempuri.org/', 'ArrayOfString');
  RemClassRegistry.RegisterXSClass(FuncionarioTolerancia, 'http://tempuri.org/', 'FuncionarioTolerancia');
  RemClassRegistry.RegisterXSClass(HorarioComplementar, 'http://tempuri.org/', 'HorarioComplementar');
  RemClassRegistry.RegisterXSClass(Configuracao, 'http://tempuri.org/', 'Configuracao');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfConfiguracao), 'http://tempuri.org/', 'ArrayOfConfiguracao');
  RemClassRegistry.RegisterXSClass(Digital, 'http://tempuri.org/', 'Digital');
  RemClassRegistry.RegisterXSClass(HorarioTurno, 'http://tempuri.org/', 'HorarioTurno');

end. 