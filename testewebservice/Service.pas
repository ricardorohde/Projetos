// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:1518/WebSPonto/Service.asmx?wsdl
// Encoding : utf-8
// Version  : 1.0
// (27/01/2012 09:03:11 - 1.33.2.5)
// ************************************************************************ //

unit Service;

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
  // !:base64Binary    - "http://www.w3.org/2001/XMLSchema"


  ReceberCadastroResult =  type WideString;      { "http://tempuri.org/" }
  ReceberMovimentoResult =  type WideString;      { "http://tempuri.org/" }
  RetornarXMLSchemaCadastroResult =  type WideString;      { "http://tempuri.org/" }
  RetornarXMLSchemaMovimentoResult =  type WideString;      { "http://tempuri.org/" }
  Receber_Informacoes_TerminaisResult =  type WideString;      { "http://tempuri.org/" }
  BaixarMovimentoResult =  type WideString;      { "http://tempuri.org/" }

  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // soapAction: http://tempuri.org/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // binding   : WebSPontoSoap
  // service   : WebSPonto
  // port      : WebSPontoSoap
  // URL       : http://localhost:1518/WebSPonto/Service.asmx
  // ************************************************************************ //
  WebSPontoSoap = interface(IInvokable)
  ['{736B95D6-A271-B1CA-E251-2B9C051D5CD0}']
    function  RetornaDataHora: WideString; stdcall;
    function  RetornaMinutosMPE: Integer; stdcall;
    function  RetornaHora(const MPE: Integer): WideString; stdcall;
    function  ConectarWebSPonto_Terminal(const CodigoTerminal: WideString; const CodigoMec: WideString): Integer; stdcall;
    function  ReceberCadastro: ReceberCadastroResult; stdcall;
    function  EnviaCadastro(const XmlCadastro: WideString): Integer; stdcall;
    function  ReceberMovimento(const DtInicial: TXSDateTime; const DtFinal: TXSDateTime; const VerificaStatus: WideString): ReceberMovimentoResult; stdcall;
    function  EnviaMovimento(const XmlMovimento: WideString): Integer; stdcall;
    function  RetornarXMLSchemaCadastro: RetornarXMLSchemaCadastroResult; stdcall;
    function  RetornarXMLSchemaMovimento: RetornarXMLSchemaMovimentoResult; stdcall;
    function  Receber_Informacoes_Terminais: Receber_Informacoes_TerminaisResult; stdcall;
    function  Configuracacoes_WebSPonto(const Parametro: WideString; const Valor: Integer): Integer; stdcall;
    function  RetornaMsgErro: WideString; stdcall;
    function  VerificaAtualizacao: Integer; stdcall;
    function  Receber_Instalador: TByteDynArray; stdcall;
    function  Alinhamento_do_Relacionamento_Terminal_Digital: Integer; stdcall;
    function  AddNoRelacionametoTerminalDigital(const IdDigital: WideString): Integer; stdcall;
    function  ApagarRelacionamentoTerminal_Digital: Integer; stdcall;
    function  ApagarFuncionarioExcluidoNoWponto(const IdFuncionarioExterno: WideString; const IdEmpresaExterno: Integer; const Tipo: WideString): Integer; stdcall;
    function  BaixarMovimento(const DtInicial: TXSDateTime; const DtFinal: TXSDateTime; const VerificaStatus: WideString): BaixarMovimentoResult; stdcall;
    function  MarcarMovimentosComoEnviados(const XmlMovimentosRecebidos: WideString): Integer; stdcall;
    function  LimparHorarioComplementarDoFuncionario(const IdEmpresa: Integer; const IdFuncionario: WideString; const TpPessoa: WideString): Integer; stdcall;
    function  LimparEscalasDoFuncionario(const IdEmpresa: Integer; const IdFuncionario: WideString; const TpPessoa: WideString): Integer; stdcall;
    function  LimparTurnosDoFuncionario(const IdEmpresa: Integer; const IdFuncionario: WideString; const TpPessoa: WideString): Integer; stdcall;
  end;

function GetWebSPontoSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): WebSPontoSoap;


implementation

function GetWebSPontoSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): WebSPontoSoap;
const
  defWSDL = 'http://localhost:1518/WebSPonto/Service.asmx?wsdl';
  defURL  = 'http://localhost:1518/WebSPonto/Service.asmx';
  defSvc  = 'WebSPonto';
  defPrt  = 'WebSPontoSoap';
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
    Result := (RIO as WebSPontoSoap);
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


initialization
  InvRegistry.RegisterInterface(TypeInfo(WebSPontoSoap), 'http://tempuri.org/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(WebSPontoSoap), 'http://tempuri.org/%operationName%');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ReceberCadastroResult), 'http://tempuri.org/', 'ReceberCadastroResult');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ReceberMovimentoResult), 'http://tempuri.org/', 'ReceberMovimentoResult');
  RemClassRegistry.RegisterXSInfo(TypeInfo(RetornarXMLSchemaCadastroResult), 'http://tempuri.org/', 'RetornarXMLSchemaCadastroResult');
  RemClassRegistry.RegisterXSInfo(TypeInfo(RetornarXMLSchemaMovimentoResult), 'http://tempuri.org/', 'RetornarXMLSchemaMovimentoResult');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Receber_Informacoes_TerminaisResult), 'http://tempuri.org/', 'Receber_Informacoes_TerminaisResult');
  RemClassRegistry.RegisterXSInfo(TypeInfo(BaixarMovimentoResult), 'http://tempuri.org/', 'BaixarMovimentoResult');
  InvRegistry.RegisterInvokeOptions(TypeInfo(WebSPontoSoap), ioDocument );
end. 