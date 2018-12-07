unit uAcessoSite;

interface

uses System.Classes, System.SysUtils, Vcl.Forms, Dialogs, {System.Contnrs,}
  DBXJSON, DBXJsonReflect, uWebServiceHttp, xmldom, XMLIntf, msxmldom, XMLDoc,
  StrUtils, msxml, System.Types, System.Variants, DBClient, mshtml, ActiveX,
  ComObj, Generics.Collections, IniFiles, uWebServiceREST;

type
  TAcessoSite = class(TWebServiceHttp)
  private
    FSenha: string;
    FURL: string;
    FUsuario: string;
    WebServiceREST: TWebServiceREST;
    FCaminhoImagens: string;

    procedure ConfigurarRequisicao();
    constructor CreatePrivate();
    procedure SetCaminhoImagens(const Value: string);

  public
    function GetXML(const Complemento: string): string;
    function GetSchema(const Resource: string): string;
    function PostXML(const Complemento, aXml: string): string;

//    function PostXML(aXml: string): string;overload;
    property CaminhoImagens: string read FCaminhoImagens write SetCaminhoImagens;
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
  end;

//function GetAcessoSiteEvolucao : TAcessoSite;
//var
//  AcessoSiteEvolucao: TAcessoSite;

implementation

//function GetAcessoSiteEvolucao : TAcessoSite;
//begin
//  if not Assigned( AcessoSiteEvolucao ) then
//    AcessoSiteEvolucao := TAcessoSite.createPrivate;
//
//  Result := AcessoSiteEvolucao;
//end;

{ TAcessoSiteEvolucao }

procedure TAcessoSite.AfterConstruction;
begin
  inherited;
  with TIniFile.Create(ExtractFilePath(Application.Exename) + 'IntPrestashop.ini') do
  try
    if ReadString('Prestashop', 'URL', '') <> ''  then
    begin
      FSenha:=ReadString('Prestashop', 'Senha', '');
      FURL:=ReadString('Prestashop', 'URL', '');
      FUsuario:=ReadString('Prestashop', 'Usuario', '');
      Self.CaminhoImagens:= ReadString('Configuracao', 'CaminhoImagens', '');
      if AnsiPos('api', FURL) <= 0 then FURL:= FURL + '/api';
      Self.User:= FUsuario;
      Self.Key:= FSenha;
      Self.URL:= FURL;

    end;
  finally
    free;
  end;
  WebServiceREST:= TWebServiceREST.create;
  WebServiceREST.Usuario:= FUsuario;
  WebServiceREST.Senha:= FSenha;
  WebServiceREST.URL:= FURL;
end;

procedure TAcessoSite.BeforeDestruction;
begin
  inherited;

  FreeAndNil( WebServiceREST );
end;

procedure TAcessoSite.ConfigurarRequisicao;
begin
  self.getCustomHeaders.Clear;
//  self.getRequest.Username := 'XTM4T52R7EKV1557DGYMTVZCDWG78KGT';
  self.getRequest.Username := self.User;
  self.getRequest.BasicAuthentication := true;
  self.getRequest.ContentType := 'text/xml;charset=utf-8';
  self.getRequest.CacheControl := 'no-cache';
  self.getRequest.UserAgent := EmptyStr;
  self.getRequest.Accept := EmptyStr;
  self.getRequest.AcceptEncoding := EmptyStr;
  self.Params.Clear;
end;

constructor TAcessoSite.CreatePrivate;
begin
  inherited Create(True);
end;

function TAcessoSite.GetSchema(const Resource: string): string;
begin
  Result:= WebServiceREST.GetSchema(Resource);
end;

function TAcessoSite.GetXML(const Complemento: string): string;
begin
  ConfigurarRequisicao();
  self.URL:= FURL + Complemento;
  Result := get();
end;

function TAcessoSite.PostXML(const Complemento, aXML: string): string;
begin
//  ConfigurarRequisicao();
//  self.URL:= FURL + Complemento;
//  Result := post(aXml);
  Result:= WebServiceREST.Post(Complemento, aXML);
//  URL:= FURL + psComplemento;
//  Params.Clear;
//  Params.Add('');
//  Result := post();
end;

procedure TAcessoSite.SetCaminhoImagens(const Value: string);
begin
  FCaminhoImagens := Value;
end;

end.
