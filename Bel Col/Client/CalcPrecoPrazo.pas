// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://ws.correios.com.br/calculador/CalcPrecoPrazo.asmx?WSDL
//  >Import : http://ws.correios.com.br/calculador/CalcPrecoPrazo.asmx?WSDL>0
// Encoding : utf-8
// Version  : 1.0
// (12/09/2016 11:44:57 - - $Rev: 45757 $)
// ************************************************************************ //

unit CalcPrecoPrazo;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNBD = $0002;
  IS_REF  = $0080;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:decimal         - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:int             - "http://www.w3.org/2001/XMLSchema"[Gbl]

  cResultado2          = class;                 { "http://tempuri.org/"[GblCplx] }
  cResultado           = class;                 { "http://tempuri.org/"[GblElm] }
  cServico             = class;                 { "http://tempuri.org/"[GblCplx] }

  ArrayOfCServico = array of cServico;          { "http://tempuri.org/"[GblCplx] }


  // ************************************************************************ //
  // XML       : cResultado, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  cResultado2 = class(TRemotable)
  private
    FServicos: ArrayOfCServico;
    FServicos_Specified: boolean;
    procedure SetServicos(Index: Integer; const AArrayOfCServico: ArrayOfCServico);
    function  Servicos_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property Servicos: ArrayOfCServico  Index (IS_OPTN) read FServicos write SetServicos stored Servicos_Specified;
  end;



  // ************************************************************************ //
  // XML       : cResultado, global, <element>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  cResultado = class(cResultado2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : cServico, global, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  cServico = class(TRemotable)
  private
    FCodigo: Integer;
    FValor: string;
    FValor_Specified: boolean;
    FPrazoEntrega: string;
    FPrazoEntrega_Specified: boolean;
    FValorMaoPropria: string;
    FValorMaoPropria_Specified: boolean;
    FValorAvisoRecebimento: string;
    FValorAvisoRecebimento_Specified: boolean;
    FValorValorDeclarado: string;
    FValorValorDeclarado_Specified: boolean;
    FEntregaDomiciliar: string;
    FEntregaDomiciliar_Specified: boolean;
    FEntregaSabado: string;
    FEntregaSabado_Specified: boolean;
    FErro: string;
    FErro_Specified: boolean;
    FMsgErro: string;
    FMsgErro_Specified: boolean;
    FValorSemAdicionais: string;
    FValorSemAdicionais_Specified: boolean;
    FobsFim: string;
    FobsFim_Specified: boolean;
    procedure SetValor(Index: Integer; const Astring: string);
    function  Valor_Specified(Index: Integer): boolean;
    procedure SetPrazoEntrega(Index: Integer; const Astring: string);
    function  PrazoEntrega_Specified(Index: Integer): boolean;
    procedure SetValorMaoPropria(Index: Integer; const Astring: string);
    function  ValorMaoPropria_Specified(Index: Integer): boolean;
    procedure SetValorAvisoRecebimento(Index: Integer; const Astring: string);
    function  ValorAvisoRecebimento_Specified(Index: Integer): boolean;
    procedure SetValorValorDeclarado(Index: Integer; const Astring: string);
    function  ValorValorDeclarado_Specified(Index: Integer): boolean;
    procedure SetEntregaDomiciliar(Index: Integer; const Astring: string);
    function  EntregaDomiciliar_Specified(Index: Integer): boolean;
    procedure SetEntregaSabado(Index: Integer; const Astring: string);
    function  EntregaSabado_Specified(Index: Integer): boolean;
    procedure SetErro(Index: Integer; const Astring: string);
    function  Erro_Specified(Index: Integer): boolean;
    procedure SetMsgErro(Index: Integer; const Astring: string);
    function  MsgErro_Specified(Index: Integer): boolean;
    procedure SetValorSemAdicionais(Index: Integer; const Astring: string);
    function  ValorSemAdicionais_Specified(Index: Integer): boolean;
    procedure SetobsFim(Index: Integer; const Astring: string);
    function  obsFim_Specified(Index: Integer): boolean;
  published
    property Codigo:                Integer  read FCodigo write FCodigo;
    property Valor:                 string   Index (IS_OPTN) read FValor write SetValor stored Valor_Specified;
    property PrazoEntrega:          string   Index (IS_OPTN) read FPrazoEntrega write SetPrazoEntrega stored PrazoEntrega_Specified;
    property ValorMaoPropria:       string   Index (IS_OPTN) read FValorMaoPropria write SetValorMaoPropria stored ValorMaoPropria_Specified;
    property ValorAvisoRecebimento: string   Index (IS_OPTN) read FValorAvisoRecebimento write SetValorAvisoRecebimento stored ValorAvisoRecebimento_Specified;
    property ValorValorDeclarado:   string   Index (IS_OPTN) read FValorValorDeclarado write SetValorValorDeclarado stored ValorValorDeclarado_Specified;
    property EntregaDomiciliar:     string   Index (IS_OPTN) read FEntregaDomiciliar write SetEntregaDomiciliar stored EntregaDomiciliar_Specified;
    property EntregaSabado:         string   Index (IS_OPTN) read FEntregaSabado write SetEntregaSabado stored EntregaSabado_Specified;
    property Erro:                  string   Index (IS_OPTN) read FErro write SetErro stored Erro_Specified;
    property MsgErro:               string   Index (IS_OPTN) read FMsgErro write SetMsgErro stored MsgErro_Specified;
    property ValorSemAdicionais:    string   Index (IS_OPTN) read FValorSemAdicionais write SetValorSemAdicionais stored ValorSemAdicionais_Specified;
    property obsFim:                string   Index (IS_OPTN) read FobsFim write SetobsFim stored obsFim_Specified;
  end;


  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // soapAction: http://tempuri.org/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : CalcPrecoPrazoWSSoap12
  // service   : CalcPrecoPrazoWS
  // port      : CalcPrecoPrazoWSSoap12
  // URL       : http://ws.correios.com.br/calculador/CalcPrecoPrazo.asmx
  // ************************************************************************ //
  CalcPrecoPrazoWSSoap = interface(IInvokable)
  ['{E04DF0FA-3C20-940E-7BB1-28A4F5C61B38}']
    function  CalcPrecoPrazo(const nCdEmpresa: string; const sDsSenha: string; const nCdServico: string; const sCepOrigem: string; const sCepDestino: string; const nVlPeso: string; 
                             const nCdFormato: Integer; const nVlComprimento: TXSDecimal; const nVlAltura: TXSDecimal; const nVlLargura: TXSDecimal; const nVlDiametro: TXSDecimal; 
                             const sCdMaoPropria: string; const nVlValorDeclarado: TXSDecimal; const sCdAvisoRecebimento: string): cResultado2; stdcall;
    function  CalcPrecoPrazoData(const nCdEmpresa: string; const sDsSenha: string; const nCdServico: string; const sCepOrigem: string; const sCepDestino: string; const nVlPeso: string; 
                                 const nCdFormato: Integer; const nVlComprimento: TXSDecimal; const nVlAltura: TXSDecimal; const nVlLargura: TXSDecimal; const nVlDiametro: TXSDecimal; 
                                 const sCdMaoPropria: string; const nVlValorDeclarado: TXSDecimal; const sCdAvisoRecebimento: string; const sDtCalculo: string): cResultado2; stdcall;
    function  CalcPrecoPrazoRestricao(const nCdEmpresa: string; const sDsSenha: string; const nCdServico: string; const sCepOrigem: string; const sCepDestino: string; const nVlPeso: string; 
                                      const nCdFormato: Integer; const nVlComprimento: TXSDecimal; const nVlAltura: TXSDecimal; const nVlLargura: TXSDecimal; const nVlDiametro: TXSDecimal; 
                                      const sCdMaoPropria: string; const nVlValorDeclarado: TXSDecimal; const sCdAvisoRecebimento: string; const sDtCalculo: string): cResultado2; stdcall;
    function  CalcPreco(const nCdEmpresa: string; const sDsSenha: string; const nCdServico: string; const sCepOrigem: string; const sCepDestino: string; const nVlPeso: string; 
                        const nCdFormato: Integer; const nVlComprimento: TXSDecimal; const nVlAltura: TXSDecimal; const nVlLargura: TXSDecimal; const nVlDiametro: TXSDecimal; 
                        const sCdMaoPropria: string; const nVlValorDeclarado: TXSDecimal; const sCdAvisoRecebimento: string): cResultado2; stdcall;
    function  CalcPrecoData(const nCdEmpresa: string; const sDsSenha: string; const nCdServico: string; const sCepOrigem: string; const sCepDestino: string; const nVlPeso: string; 
                            const nCdFormato: Integer; const nVlComprimento: TXSDecimal; const nVlAltura: TXSDecimal; const nVlLargura: TXSDecimal; const nVlDiametro: TXSDecimal; 
                            const sCdMaoPropria: string; const nVlValorDeclarado: TXSDecimal; const sCdAvisoRecebimento: string; const sDtCalculo: string): cResultado2; stdcall;
    function  CalcPrazo(const nCdServico: string; const sCepOrigem: string; const sCepDestino: string): cResultado2; stdcall;
    function  CalcPrazoData(const nCdServico: string; const sCepOrigem: string; const sCepDestino: string; const sDtCalculo: string): cResultado2; stdcall;
    function  CalcPrazoRestricao(const nCdServico: string; const sCepOrigem: string; const sCepDestino: string; const sDtCalculo: string): cResultado2; stdcall;
    function  CalcPrecoFAC(const nCdServico: string; const nVlPeso: string; const strDataCalculo: string): cResultado2; stdcall;
  end;


  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // style     : ????
  // use       : ????
  // binding   : CalcPrecoPrazoWSHttpGet
  // service   : CalcPrecoPrazoWS
  // port      : CalcPrecoPrazoWSHttpGet
  // ************************************************************************ //
  CalcPrecoPrazoWSHttpGet = interface(IInvokable)
  ['{65401BD7-7552-FC0E-DACC-E7F44B17514D}']
    function  CalcPrecoPrazo(const nCdEmpresa: string; const sDsSenha: string; const nCdServico: string; const sCepOrigem: string; const sCepDestino: string; const nVlPeso: string; 
                             const nCdFormato: string; const nVlComprimento: string; const nVlAltura: string; const nVlLargura: string; const nVlDiametro: string; 
                             const sCdMaoPropria: string; const nVlValorDeclarado: string; const sCdAvisoRecebimento: string): cResultado; stdcall;
    function  CalcPrecoPrazoData(const nCdEmpresa: string; const sDsSenha: string; const nCdServico: string; const sCepOrigem: string; const sCepDestino: string; const nVlPeso: string; 
                                 const nCdFormato: string; const nVlComprimento: string; const nVlAltura: string; const nVlLargura: string; const nVlDiametro: string; 
                                 const sCdMaoPropria: string; const nVlValorDeclarado: string; const sCdAvisoRecebimento: string; const sDtCalculo: string): cResultado; stdcall;
    function  CalcPrecoPrazoRestricao(const nCdEmpresa: string; const sDsSenha: string; const nCdServico: string; const sCepOrigem: string; const sCepDestino: string; const nVlPeso: string; 
                                      const nCdFormato: string; const nVlComprimento: string; const nVlAltura: string; const nVlLargura: string; const nVlDiametro: string; 
                                      const sCdMaoPropria: string; const nVlValorDeclarado: string; const sCdAvisoRecebimento: string; const sDtCalculo: string): cResultado; stdcall;
    function  CalcPreco(const nCdEmpresa: string; const sDsSenha: string; const nCdServico: string; const sCepOrigem: string; const sCepDestino: string; const nVlPeso: string; 
                        const nCdFormato: string; const nVlComprimento: string; const nVlAltura: string; const nVlLargura: string; const nVlDiametro: string; 
                        const sCdMaoPropria: string; const nVlValorDeclarado: string; const sCdAvisoRecebimento: string): cResultado; stdcall;
    function  CalcPrecoData(const nCdEmpresa: string; const sDsSenha: string; const nCdServico: string; const sCepOrigem: string; const sCepDestino: string; const nVlPeso: string; 
                            const nCdFormato: string; const nVlComprimento: string; const nVlAltura: string; const nVlLargura: string; const nVlDiametro: string; 
                            const sCdMaoPropria: string; const nVlValorDeclarado: string; const sCdAvisoRecebimento: string; const sDtCalculo: string): cResultado; stdcall;
    function  CalcPrazo(const nCdServico: string; const sCepOrigem: string; const sCepDestino: string): cResultado; stdcall;
    function  CalcPrazoData(const nCdServico: string; const sCepOrigem: string; const sCepDestino: string; const sDtCalculo: string): cResultado; stdcall;
    function  CalcPrazoRestricao(const nCdServico: string; const sCepOrigem: string; const sCepDestino: string; const sDtCalculo: string): cResultado; stdcall;
    function  CalcPrecoFAC(const nCdServico: string; const nVlPeso: string; const strDataCalculo: string): cResultado; stdcall;
  end;


  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // style     : ????
  // use       : ????
  // binding   : CalcPrecoPrazoWSHttpPost
  // service   : CalcPrecoPrazoWS
  // port      : CalcPrecoPrazoWSHttpPost
  // ************************************************************************ //
  CalcPrecoPrazoWSHttpPost = interface(IInvokable)
  ['{698295FB-BD70-1248-DD82-C17B443ED611}']
    function  CalcPrecoPrazo(const nCdEmpresa: string; const sDsSenha: string; const nCdServico: string; const sCepOrigem: string; const sCepDestino: string; const nVlPeso: string; 
                             const nCdFormato: string; const nVlComprimento: string; const nVlAltura: string; const nVlLargura: string; const nVlDiametro: string; 
                             const sCdMaoPropria: string; const nVlValorDeclarado: string; const sCdAvisoRecebimento: string): cResultado; stdcall;
    function  CalcPrecoPrazoData(const nCdEmpresa: string; const sDsSenha: string; const nCdServico: string; const sCepOrigem: string; const sCepDestino: string; const nVlPeso: string; 
                                 const nCdFormato: string; const nVlComprimento: string; const nVlAltura: string; const nVlLargura: string; const nVlDiametro: string; 
                                 const sCdMaoPropria: string; const nVlValorDeclarado: string; const sCdAvisoRecebimento: string; const sDtCalculo: string): cResultado; stdcall;
    function  CalcPrecoPrazoRestricao(const nCdEmpresa: string; const sDsSenha: string; const nCdServico: string; const sCepOrigem: string; const sCepDestino: string; const nVlPeso: string; 
                                      const nCdFormato: string; const nVlComprimento: string; const nVlAltura: string; const nVlLargura: string; const nVlDiametro: string; 
                                      const sCdMaoPropria: string; const nVlValorDeclarado: string; const sCdAvisoRecebimento: string; const sDtCalculo: string): cResultado; stdcall;
    function  CalcPreco(const nCdEmpresa: string; const sDsSenha: string; const nCdServico: string; const sCepOrigem: string; const sCepDestino: string; const nVlPeso: string; 
                        const nCdFormato: string; const nVlComprimento: string; const nVlAltura: string; const nVlLargura: string; const nVlDiametro: string; 
                        const sCdMaoPropria: string; const nVlValorDeclarado: string; const sCdAvisoRecebimento: string): cResultado; stdcall;
    function  CalcPrecoData(const nCdEmpresa: string; const sDsSenha: string; const nCdServico: string; const sCepOrigem: string; const sCepDestino: string; const nVlPeso: string; 
                            const nCdFormato: string; const nVlComprimento: string; const nVlAltura: string; const nVlLargura: string; const nVlDiametro: string; 
                            const sCdMaoPropria: string; const nVlValorDeclarado: string; const sCdAvisoRecebimento: string; const sDtCalculo: string): cResultado; stdcall;
    function  CalcPrazo(const nCdServico: string; const sCepOrigem: string; const sCepDestino: string): cResultado; stdcall;
    function  CalcPrazoData(const nCdServico: string; const sCepOrigem: string; const sCepDestino: string; const sDtCalculo: string): cResultado; stdcall;
    function  CalcPrazoRestricao(const nCdServico: string; const sCepOrigem: string; const sCepDestino: string; const sDtCalculo: string): cResultado; stdcall;
    function  CalcPrecoFAC(const nCdServico: string; const nVlPeso: string; const strDataCalculo: string): cResultado; stdcall;
  end;

function GetCalcPrecoPrazoWSSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): CalcPrecoPrazoWSSoap;
function GetCalcPrecoPrazoWSHttpGet(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): CalcPrecoPrazoWSHttpGet;
function GetCalcPrecoPrazoWSHttpPost(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): CalcPrecoPrazoWSHttpPost;


implementation
  uses SysUtils;

function GetCalcPrecoPrazoWSSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): CalcPrecoPrazoWSSoap;
const
  defWSDL = 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.asmx?WSDL';
  defURL  = 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.asmx';
  defSvc  = 'CalcPrecoPrazoWS';
  defPrt  = 'CalcPrecoPrazoWSSoap12';
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
    Result := (RIO as CalcPrecoPrazoWSSoap);
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


function GetCalcPrecoPrazoWSHttpGet(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): CalcPrecoPrazoWSHttpGet;
const
  defWSDL = 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.asmx?WSDL';
  defURL  = '';
  defSvc  = 'CalcPrecoPrazoWS';
  defPrt  = 'CalcPrecoPrazoWSHttpGet';
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
    Result := (RIO as CalcPrecoPrazoWSHttpGet);
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


function GetCalcPrecoPrazoWSHttpPost(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): CalcPrecoPrazoWSHttpPost;
const
  defWSDL = 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.asmx?WSDL';
  defURL  = '';
  defSvc  = 'CalcPrecoPrazoWS';
  defPrt  = 'CalcPrecoPrazoWSHttpPost';
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
    Result := (RIO as CalcPrecoPrazoWSHttpPost);
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


destructor cResultado2.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FServicos)-1 do
    SysUtils.FreeAndNil(FServicos[I]);
  System.SetLength(FServicos, 0);
  inherited Destroy;
end;

procedure cResultado2.SetServicos(Index: Integer; const AArrayOfCServico: ArrayOfCServico);
begin
  FServicos := AArrayOfCServico;
  FServicos_Specified := True;
end;

function cResultado2.Servicos_Specified(Index: Integer): boolean;
begin
  Result := FServicos_Specified;
end;

procedure cServico.SetValor(Index: Integer; const Astring: string);
begin
  FValor := Astring;
  FValor_Specified := True;
end;

function cServico.Valor_Specified(Index: Integer): boolean;
begin
  Result := FValor_Specified;
end;

procedure cServico.SetPrazoEntrega(Index: Integer; const Astring: string);
begin
  FPrazoEntrega := Astring;
  FPrazoEntrega_Specified := True;
end;

function cServico.PrazoEntrega_Specified(Index: Integer): boolean;
begin
  Result := FPrazoEntrega_Specified;
end;

procedure cServico.SetValorMaoPropria(Index: Integer; const Astring: string);
begin
  FValorMaoPropria := Astring;
  FValorMaoPropria_Specified := True;
end;

function cServico.ValorMaoPropria_Specified(Index: Integer): boolean;
begin
  Result := FValorMaoPropria_Specified;
end;

procedure cServico.SetValorAvisoRecebimento(Index: Integer; const Astring: string);
begin
  FValorAvisoRecebimento := Astring;
  FValorAvisoRecebimento_Specified := True;
end;

function cServico.ValorAvisoRecebimento_Specified(Index: Integer): boolean;
begin
  Result := FValorAvisoRecebimento_Specified;
end;

procedure cServico.SetValorValorDeclarado(Index: Integer; const Astring: string);
begin
  FValorValorDeclarado := Astring;
  FValorValorDeclarado_Specified := True;
end;

function cServico.ValorValorDeclarado_Specified(Index: Integer): boolean;
begin
  Result := FValorValorDeclarado_Specified;
end;

procedure cServico.SetEntregaDomiciliar(Index: Integer; const Astring: string);
begin
  FEntregaDomiciliar := Astring;
  FEntregaDomiciliar_Specified := True;
end;

function cServico.EntregaDomiciliar_Specified(Index: Integer): boolean;
begin
  Result := FEntregaDomiciliar_Specified;
end;

procedure cServico.SetEntregaSabado(Index: Integer; const Astring: string);
begin
  FEntregaSabado := Astring;
  FEntregaSabado_Specified := True;
end;

function cServico.EntregaSabado_Specified(Index: Integer): boolean;
begin
  Result := FEntregaSabado_Specified;
end;

procedure cServico.SetErro(Index: Integer; const Astring: string);
begin
  FErro := Astring;
  FErro_Specified := True;
end;

function cServico.Erro_Specified(Index: Integer): boolean;
begin
  Result := FErro_Specified;
end;

procedure cServico.SetMsgErro(Index: Integer; const Astring: string);
begin
  FMsgErro := Astring;
  FMsgErro_Specified := True;
end;

function cServico.MsgErro_Specified(Index: Integer): boolean;
begin
  Result := FMsgErro_Specified;
end;

procedure cServico.SetValorSemAdicionais(Index: Integer; const Astring: string);
begin
  FValorSemAdicionais := Astring;
  FValorSemAdicionais_Specified := True;
end;

function cServico.ValorSemAdicionais_Specified(Index: Integer): boolean;
begin
  Result := FValorSemAdicionais_Specified;
end;

procedure cServico.SetobsFim(Index: Integer; const Astring: string);
begin
  FobsFim := Astring;
  FobsFim_Specified := True;
end;

function cServico.obsFim_Specified(Index: Integer): boolean;
begin
  Result := FobsFim_Specified;
end;

initialization
  { CalcPrecoPrazoWSSoap }
  InvRegistry.RegisterInterface(TypeInfo(CalcPrecoPrazoWSSoap), 'http://tempuri.org/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(CalcPrecoPrazoWSSoap), 'http://tempuri.org/%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(CalcPrecoPrazoWSSoap), ioDocument);
  InvRegistry.RegisterInvokeOptions(TypeInfo(CalcPrecoPrazoWSSoap), ioSOAP12);
  { CalcPrecoPrazoWSSoap.CalcPrecoPrazo }
  InvRegistry.RegisterMethodInfo(TypeInfo(CalcPrecoPrazoWSSoap), 'CalcPrecoPrazo', '',
                                 '[ReturnName="CalcPrecoPrazoResult"]');
  { CalcPrecoPrazoWSSoap.CalcPrecoPrazoData }
  InvRegistry.RegisterMethodInfo(TypeInfo(CalcPrecoPrazoWSSoap), 'CalcPrecoPrazoData', '',
                                 '[ReturnName="CalcPrecoPrazoDataResult"]');
  { CalcPrecoPrazoWSSoap.CalcPrecoPrazoRestricao }
  InvRegistry.RegisterMethodInfo(TypeInfo(CalcPrecoPrazoWSSoap), 'CalcPrecoPrazoRestricao', '',
                                 '[ReturnName="CalcPrecoPrazoRestricaoResult"]');
  { CalcPrecoPrazoWSSoap.CalcPreco }
  InvRegistry.RegisterMethodInfo(TypeInfo(CalcPrecoPrazoWSSoap), 'CalcPreco', '',
                                 '[ReturnName="CalcPrecoResult"]');
  { CalcPrecoPrazoWSSoap.CalcPrecoData }
  InvRegistry.RegisterMethodInfo(TypeInfo(CalcPrecoPrazoWSSoap), 'CalcPrecoData', '',
                                 '[ReturnName="CalcPrecoDataResult"]');
  { CalcPrecoPrazoWSSoap.CalcPrazo }
  InvRegistry.RegisterMethodInfo(TypeInfo(CalcPrecoPrazoWSSoap), 'CalcPrazo', '',
                                 '[ReturnName="CalcPrazoResult"]');
  { CalcPrecoPrazoWSSoap.CalcPrazoData }
  InvRegistry.RegisterMethodInfo(TypeInfo(CalcPrecoPrazoWSSoap), 'CalcPrazoData', '',
                                 '[ReturnName="CalcPrazoDataResult"]');
  { CalcPrecoPrazoWSSoap.CalcPrazoRestricao }
  InvRegistry.RegisterMethodInfo(TypeInfo(CalcPrecoPrazoWSSoap), 'CalcPrazoRestricao', '',
                                 '[ReturnName="CalcPrazoRestricaoResult"]');
  { CalcPrecoPrazoWSSoap.CalcPrecoFAC }
  InvRegistry.RegisterMethodInfo(TypeInfo(CalcPrecoPrazoWSSoap), 'CalcPrecoFAC', '',
                                 '[ReturnName="CalcPrecoFACResult"]');
  { CalcPrecoPrazoWSHttpGet }
  InvRegistry.RegisterInterface(TypeInfo(CalcPrecoPrazoWSHttpGet), 'http://tempuri.org/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(CalcPrecoPrazoWSHttpGet), '');
  { CalcPrecoPrazoWSHttpPost }
  InvRegistry.RegisterInterface(TypeInfo(CalcPrecoPrazoWSHttpPost), 'http://tempuri.org/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(CalcPrecoPrazoWSHttpPost), '');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfCServico), 'http://tempuri.org/', 'ArrayOfCServico');
  RemClassRegistry.RegisterXSClass(cResultado2, 'http://tempuri.org/', 'cResultado2', 'cResultado');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(cResultado2), 'Servicos', '[ArrayItemName="cServico"]');
  RemClassRegistry.RegisterXSClass(cResultado, 'http://tempuri.org/', 'cResultado');
  RemClassRegistry.RegisterXSClass(cServico, 'http://tempuri.org/', 'cServico');

end.