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
    procedure adiciona(a: TStringStream);
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

procedure TWebServiceHttp.adiciona(a: TStringStream);
begin
  A:= TStringStream.Create(
  'xml=<?xml version="1.0" encoding="UTF-8"?>'+
'<prestashop xmlns:xlink="http://www.w3.org/1999/xlink">'+
'<product>'+
'<id_manufacturer format="isUnsignedId"/>'+
'<id_supplier format="isUnsignedId"/>'+
'<id_category_default format="isUnsignedId"/>'+
'<out_of_stock required="true" format="isUnsignedInt"/>'+
'<new/>'+
'<cache_default_attribute/>'+
'<id_default_image not_filterable="true"/>'+
'<id_default_combination not_filterable="true"/>'+
'<reference maxSize="32" format="isReference"/>'+
'<supplier_reference maxSize="32" format="isReference"/>'+
'<location maxSize="64" format="isReference"/>'+
'<ean13 maxSize="13" format="isEan13"/>'+
'<upc maxSize="12" format="isUpc"/>'+
'<unity maxSize="10" format="isString"/>'+
'<id_tax_rules_group format="isUnsignedId"/>'+
'<id_color_default format="isUnsignedInt"/>'+
'<minimal_quantity format="isUnsignedInt"/>'+
'<price required="true" format="isPrice">1000</price>'+
'<additional_shipping_cost format="isPrice"/>'+
'<wholesale_price format="isPrice"/>'+
'<on_sale format="isBool"/>'+
'<online_only format="isBool"/>'+
'<ecotax format="isPrice"/>'+
'<unit_price format="isPrice"/>'+
'<width format="isUnsignedFloat"/>'+
'<height format="isUnsignedFloat"/>'+
'<depth format="isUnsignedFloat"/>'+
'<weight format="isUnsignedFloat"/>'+
'<quantity_discount format="isBool"/>'+
'<customizable format="isUnsignedInt"/>'+
'<uploadable_files format="isUnsignedInt"/>'+
'<text_fields format="isUnsignedInt"/>'+
'<active format="isBool">1</active>'+
'<available_for_order format="isBool"/>'+
'<condition format="isGenericName"/>'+
'<show_price format="isBool"/>'+
'<indexed format="isBool"/>'+
'<cache_is_pack format="isBool"/>'+
'<cache_has_attachments format="isBool"/>'+
'<quantity required="true">50</quantity>'+
'<meta_description maxSize="255" format="isGenericName"><language id="6" xlink:href="http://192.168.2.101/api/languages/6" format="isUnsignedId"/></meta_description>'+
'<meta_keywords maxSize="255" format="isGenericName"><language id="6" xlink:href="http://192.168.2.101/api/languages/6" format="isUnsignedId"/></meta_keywords>'+
'<meta_title maxSize="128" format="isGenericName"><language id="6" xlink:href="http://192.168.2.101/api/languages/6" format="isUnsignedId"/></meta_title>'+
'<link_rewrite required="true" maxSize="128" format="isLinkRewrite">blabla</link_rewrite>'+
'<name required="true" maxSize="128" format="isCatalogName">blabla</name>'+
'<available_now maxSize="255" format="isGenericName"><language id="6" xlink:href="http://192.168.2.101/api/languages/6" format="isUnsignedId"/></available_now>'+
'<available_later maxSize="255" format="IsGenericName"><language id="6" xlink:href="http://192.168.2.101/api/languages/6" format="isUnsignedId"/></available_later>'+
'<description format="isString">blabla</description>'+
'<description_short format="isString">blabla</description_short>'+
'<associations></associations>'+
'</product>'+
'</prestashop>');
end;

function TWebServiceHttp.post: String;
var
  params : TIdMultiPartFormDataStream;
   a: TStringStream;
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
