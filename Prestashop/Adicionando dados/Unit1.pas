unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, REST.Authenticator.Simple, Xml.xmldom, Xml.XMLIntf,
  Xml.XMLDoc, REST.types;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    RESTRequest1: TRESTRequest;
    RESTClient1: TRESTClient;
    SimpleAuthenticator1: TSimpleAuthenticator;
    RESTResponse1: TRESTResponse;
    XMLDocument1: TXMLDocument;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  try
    Memo1.Text:= '<prestashop><manufacturer><id><![CDATA[804]]></id><name><![CDATA[DisneyLand]]></name></manufacturer></prestashop>';

    RESTRequest1.Params.Clear;
    //authentication does not work with PUT, use token as suffix....
    RESTClient1.Authenticator:= nil; //SimpleAuthenticator1;//
    //SimpleAuthenticator1.UserNameKey := 'ws_key';
    //SimpleAuthenticator1.UserName := 'HEREIGOESTHETOKEN';
    RESTRequest1.Resource:= 'manufacturers';
    RESTRequest1.ResourceSuffix:= '?ws_key=Q6ZEP8W4N2Y7ZUWRL7HS1Z83IX3AMHQW';
    RESTRequest1.Method:= rmPut; //update
    RESTClient1.BaseURL:= 'http://localhost/MinhaLoja/api';
    RESTRequest1.Params.AddItem('id', '1', pkGETorPOST, [], ctTEXT_PLAIN);
    RESTRequest1.Params.AddItem('putXml', Memo1.Text,
      pkGETorPOST, [], ctAPPLICATION_X_WWW_FORM_URLENCODED);

    RESTRequest1.Execute;

    Memo1.Lines.Clear;
    Memo1.Lines.Add(RESTResponse1.Content);
  except
    on E: Exception do
    begin
      Memo1.Lines.Clear;
      Memo1.Lines.Add('Exception class name = ' + E.ClassName);
      Memo1.Lines.Add('Exception message = ' + E.Message);
    end;
  end;
  end;

procedure TForm1.Button2Click(Sender: TObject);
var
  aNode, aCNode, aCCNode : IXMLNode;
  i,j : integer;
  aXml : string;
begin
  RESTRequest1.Params.Clear;
  RESTClient1.Authenticator := nil;
//  SimpleAuthenticator1.UserNameKey := 'edson_feso@hotmail.com';
//  SimpleAuthenticator1.UserName := '';

  RESTClient1.BaseURL := 'http://localhost/MinhaLoja/api/';
  RESTRequest1.Resource := 'manufacturers';
  RESTRequest1.ResourceSuffix := '?schema=blank&ws_key=Q6ZEP8W4N2Y7ZUWRL7HS1Z83IX3AMHQW';
  RESTRequest1.Method := rmGet;
  RESTRequest1.Execute;
  aXml := RESTResponse1.Content;
  XMLDocument1.LoadFromXML(aXml);

  aNode := XMLDocument1.ChildNodes.FindNode('prestashop');
  if assigned(aNode)
  then begin
    for i := 0 to aNode.ChildNodes.Count-1 do
    begin
      aCNode := aNode.ChildNodes.Get(i);
      for j := 0 to aCNode.ChildNodes.Count-1 do
      begin
        aCCNode := aCNode.ChildNodes.Get(j);
        if aCCNode.NodeName = 'id' then aCCNode.NodeValue := ''; //cannot pass id at create
        if aCCNode.NodeName = 'active' then aCCNode.NodeValue := '1' ;
        if aCCNode.NodeName = 'name' then aCCNode.NodeValue := 'New Brand';
      end;
    end;
  end;

  XmlDocument1.SaveToXML(aXml);

  RESTRequest1.ClearBody;
  RESTRequest1.AddBody(aXml, ctTEXT_XML);
  RESTRequest1.ResourceSuffix := '?ws_key=Q6ZEP8W4N2Y7ZUWRL7HS1Z83IX3AMHQW#';

  RESTRequest1.Method := rmPost;
  RESTRequest1.Execute;

  //new id is returned in the contents XML id tag
  Memo1.Lines.Clear;
  Memo1.Lines.Add(RESTResponse1.Content);
end;
end.
