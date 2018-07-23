unit uWebServiceHttp;

interface

uses System.Classes, IdBaseComponent, System.SysUtils,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Vcl.Forms,
  Dialogs, generics.Collections, DBXJSON, DBXJsonReflect,
  IdHTTPHeaderInfo, IdHeaderList, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, WinInet, IdExceptionCore,
  IdMultipartFormData;

  //-----------------------
//  windows,  Messages, Controls, SvcMgr,
//  ExtCtrls, xmldom, XMLIntf, WideStrings, DB, DBClient, SqlExpr, msxmldom,
//  XMLDoc, FMTBcd, Provider, IniFiles, uTypes, MConnect, SConnect, Variants,
//  Registry, DBXDataSnap, DBXCommon, DSConnect,
//  IdExplicitTLSClientServerBase, IdFTP,
//  IndyPeerImpl, Data.DBXMySQL, MidasLib, Data.DBXOdbc, Data.Win.ADODB, Math,
//  Data.DBXFirebird, uLibrary;

type
  TWebServiceHttp = class
  private
    IdHTTP: TIdHTTP;
    procedure SetParams(const Value: TStrings);
    function getParams: TStrings;
    function LimparXML(value: string): string;
    function IsConected(): Boolean;
  protected
    URL, User, Pass, ApyKey, Key, Signature: String;
    FParams: TStrings;

  public
    function getCustomHeaders: TIdHeaderList;
    function getRequest: TIdHTTPRequest;

    function post: String; overload;
    procedure post(const Source, Return: TStringStream); overload;

    function get(): String; overload;
    procedure get(const value: TStringStream); overload;

    function getURL: String;
    function getUser: String;
    function getPass: String;
    function getApyKey: String;
    function getKey: String;
    function getSignature: String;

    property Params: TStrings read getParams write SetParams;

    Constructor Create; reintroduce; overload;
    Constructor Create(UsaSSL: Boolean); overload;
    Destructor Destroy; override;
  end;

implementation

{ TWebServiceHttp }

uses uAcessoSiteEvolucao;
constructor TWebServiceHttp.Create;
begin
  self.FParams := TStringList.Create;
  self.IdHTTP := TIdHTTP.Create(Application);
end;

constructor TWebServiceHttp.Create(UsaSSL: Boolean);
var
  SSL: TIdSSLIOHandlerSocketOpenSSL;
begin
  Create;
  if UsaSSL then
  begin
    SSL := TIdSSLIOHandlerSocketOpenSSL.Create(self.IdHTTP);
    self.IdHTTP.IOHandler := SSL;

    SSL.SSLOptions.Method := sslvTLSv1;
    SSL.SSLOptions.Mode := sslmUnassigned;
  end;
end;

destructor TWebServiceHttp.Destroy;
begin
  if Assigned(self.FParams) then
    FreeAndNil(self.FParams);
  if Assigned(self.IdHTTP) then
    FreeAndNil(self.IdHTTP);
  inherited;
end;

function TWebServiceHttp.LimparXML(value: string):string;
begin
  Result:= StringReplace(value, #$A, '', [rfReplaceAll]);
  Result:= StringReplace(Result, #9, '', [rfReplaceAll]);
  Result:= StringReplace(Result, Chr(27), '', [rfReplaceAll]);
  Result:= Trim( Result );
end;

function TWebServiceHttp.get(): String;
begin
//  result:= '';
//  if not InternetCheckConnection(PWideChar( SELF.URL ), 1, 0) then
//    Exit;
  try
    IdHTTP.ReadTimeout:= 200000;//200 segundos
    IdHTTP.HTTPOptions := IdHTTP.HTTPOptions + [hoInProcessAuth];
    result:= IdHTTP.get(self.URL);
//    Sleep(60000);
  except
    on e:exception do
    begin
//      if e is EIdReadTimeout then
//        result:= get()
//      else
      raise Exception.Create('URL: '+ SELF.URL + #13 + e.Message);
    end;
  end;
end;

function TWebServiceHttp.IsConected():Boolean;
var
  flags: Cardinal;
begin
  Result := InternetGetConnectedState(@flags, 0);
end;

procedure TWebServiceHttp.get(const value: TStringStream);
begin
  try
    IdHTTP.HTTPOptions := IdHTTP.HTTPOptions + [hoInProcessAuth];
    IdHTTP.Request.ContentType := 'text/xml;charset=utf-8';
    IdHTTP.Request.CacheControl := 'no-cache';
    IdHTTP.Request.Username := 'XTM4T52R7EKV1557DGYMTVZCDWG78KGT';
    IdHTTP.Request.BasicAuthentication := true;
    IdHTTP.Request.UserAgent := EmptyStr;
    IdHTTP.Request.Accept := EmptyStr;
    IdHTTP.Request.AcceptEncoding := EmptyStr;
    IdHTTP.get(self.URL, value);
  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;
end;

function TWebServiceHttp.post: String;
var
  params : TIdMultiPartFormDataStream;
  XML: string;
begin
  XML:= Trim(self.Params.Text);
  params:= TIdMultiPartFormDataStream.Create;
  try
    try
      IdHTTP.Request.CustomHeaders.Clear;
      IdHTTP.Request.Clear;

      IdHTTP.HandleRedirects := true;
      IdHTTP.HTTPOptions:= [hoKeepOrigProtocol];
      IdHTTP.ProtocolVersion := pv1_1;
      IdHTTP.Request.UserAgent := 'Mozilla/5.0 (compatible; Test)';
      IdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
      Result := IdHTTP.post(self.URL, params);
    except on E: Exception do
      raise Exception.Create('Erro: ' + E.Message);
    end;
  finally
    FreeAndNil(params);
  end;
end;

procedure TWebServiceHttp.post(const Source, Return: TStringStream);
begin
  try
    { IdHTTP.Request.Method := 'POST';
      IdHTTP.Request.ContentType := 'application/json'; }

    IdHTTP.post(self.URL, Source, Return);
  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TWebServiceHttp.SetParams(const Value: TStrings);
begin
  self.FParams := Value;
end;

function TWebServiceHttp.getApyKey: String;
begin
  result := self.ApyKey;
end;

function TWebServiceHttp.getCustomHeaders: TIdHeaderList;
begin
  result := self.IdHTTP.Request.CustomHeaders;
end;

function TWebServiceHttp.getKey: String;
begin
  result := self.Key;
end;

function TWebServiceHttp.getParams: TStrings;
begin
  result := self.FParams;
end;

function TWebServiceHttp.getPass: String;
begin
  result := self.Pass;
end;

function TWebServiceHttp.getRequest: TIdHTTPRequest;
begin
  result := self.IdHTTP.Request;
end;

function TWebServiceHttp.getSignature: String;
begin
  result := self.Signature;
end;

function TWebServiceHttp.getURL: String;
begin
  result := self.URL;
end;

function TWebServiceHttp.getUser: String;
begin
  result := self.User;
end;

end.
