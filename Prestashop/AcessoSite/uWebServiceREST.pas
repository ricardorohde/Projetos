unit uWebServiceREST;

interface

uses System.Classes, System.SysUtils, Vcl.Forms, Dialogs, generics.Collections,
  IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, REST.Authenticator.Simple, Xml.xmldom, Xml.XMLIntf,
  Xml.XMLDoc, REST.Types, LIB;

type
  TWebServiceREST = class
  private
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    SimpleAuthenticator1: TSimpleAuthenticator;
    FSenha: string;
    FURL: string;
    FUsuario: string;
    procedure SetSenha(const Value: string);
    procedure SetURL(const Value: string);
    procedure SetUsuario(const Value: string);
    procedure Config();
    procedure RESTRequest1HTTPProtocolError(Sender: TCustomRESTRequest);
    procedure RESTClient1HTTPProtocolError(Sender: TCustomRESTClient);
  public
    property Senha: string read FSenha write SetSenha;
    property URL: string read FURL write SetURL;
    property Usuario: string read FUsuario write SetUsuario;

    function GetSchema(const Resource: string): string;
    function Post(const Resource, xml: string): string;
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
  end;

{ TWebServiceREST }

implementation

uses Module;

procedure TWebServiceREST.AfterConstruction;
begin
  inherited;
  RESTClient1:= TRESTClient.Create(nil);
  RESTRequest1:= TRESTRequest.Create(nil);
  RESTResponse1:= TRESTResponse.Create(nil);
  SimpleAuthenticator1:= TSimpleAuthenticator.Create(nil);

  RESTRequest1.OnHTTPProtocolError:= RESTRequest1HTTPProtocolError;
  RESTClient1.OnHTTPProtocolError:= RESTClient1HTTPProtocolError;
end;

procedure TWebServiceREST.BeforeDestruction;
begin
  inherited;
  FreeAndNil( RESTClient1 );
  FreeAndNil( RESTRequest1 );
  FreeAndNil( RESTResponse1 );
  FreeAndNil( SimpleAuthenticator1 );
end;

procedure TWebServiceREST.Config();
begin
  RESTClient1.Authenticator:= SimpleAuthenticator1;
  RESTClient1.HandleRedirects:= True;
  RESTRequest1.Client:= RESTClient1;
  RESTRequest1.Response:= RESTResponse1;
  RESTRequest1.SynchronizedEvents:= False;
end;

function TWebServiceREST.GetSchema(const Resource: string): string;
begin
  Config();
  RESTRequest1.Params.Clear;
  RESTClient1.Authenticator := nil;
//  SimpleAuthenticator1.UserNameKey := '';
//  SimpleAuthenticator1.UserName := '';

  RESTClient1.BaseURL:= URL;
  RESTRequest1.Resource:= Resource;
  RESTRequest1.ResourceSuffix := Format('?schema=blank&ws_key=%s', [Usuario]);
  RESTRequest1.Method := rmGet;
  RESTRequest1.Execute;
  Result:= RESTResponse1.Content;
end;

procedure TWebServiceREST.RESTRequest1HTTPProtocolError(Sender: TCustomRESTRequest);
var
  XML: string;
  FXMLRetorno: TXmlDocument;
begin
  try
    FXMLRetorno:= TXmlDocument.Create(nil);
    XML:= RESTResponse1.Content;
    FXMLRetorno.LoadFromXML(XML);
    if FXMLRetorno.Active then
      AddLog( RetornaErroPrestashop( FXMLRetorno ));
  finally
    FXMLRetorno:= nil;
  end;
end;

procedure TWebServiceREST.RESTClient1HTTPProtocolError(Sender: TCustomRESTClient);
begin
//  TCustomRESTClient( Sender ).
end;

function TWebServiceREST.Post(const Resource, xml: string): string;
begin
  try
    Config();
    RESTRequest1.Params.Clear;
    RESTClient1.Authenticator := nil;
  //  SimpleAuthenticator1.UserNameKey := '';
  //  SimpleAuthenticator1.UserName := '';

    RESTClient1.BaseURL:= URL;
    RESTRequest1.Resource:= Resource;
    RESTRequest1.ClearBody;
    RESTRequest1.AddBody(Xml, ctTEXT_XML);
    RESTRequest1.ResourceSuffix := Format('?ws_key=%s', [Usuario]);
    RESTRequest1.Method := rmPost;
    RESTRequest1.Execute;
    result:= RESTResponse1.Content;
  except on e:exception do
    begin
      AddLog(e.Message);
      AddLog(RESTResponse1.Content);
    end;
  end;
end;

procedure TWebServiceREST.SetSenha(const Value: string);
begin
  FSenha := Value;
end;

procedure TWebServiceREST.SetURL(const Value: string);
begin
  FURL := Value;
end;

procedure TWebServiceREST.SetUsuario(const Value: string);
begin
  FUsuario := Value;
end;

end.
