unit uAcessoSite;

interface

uses System.Classes, System.SysUtils, Vcl.Forms, Dialogs, {System.Contnrs,}
  DBXJSON, DBXJsonReflect, uWebServiceHttp, xmldom, XMLIntf, msxmldom, XMLDoc,
  StrUtils, msxml, System.Types, System.Variants, DBClient, mshtml, ActiveX,
  ComObj, Generics.Collections, IniFiles;

type
  TAcessoSite = class(TWebServiceHttp)
  private
    FSenha: string;
    FURL: string;
    FUsuario: string;
    procedure ConfigurarRequisicao();
    constructor CreatePrivate();
  public
    function GetXML(psComplemento: string): string;
    function PostXML(aXml: string): string;

    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
  end;

//function GetAcessoSiteEvolucao : TAcessoSite;
//var
//  AcessoSiteEvolucao: TAcessoSite;

implementation

uses uWebServiceREST;

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
    end;
  finally
    free;
  end;
end;

procedure TAcessoSite.BeforeDestruction;
begin
  inherited;

end;

procedure TAcessoSite.ConfigurarRequisicao;
begin
  self.getCustomHeaders.Clear;
  self.getRequest.Username := 'XTM4T52R7EKV1557DGYMTVZCDWG78KGT';
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

function TAcessoSite.GetXML(psComplemento: string): string;
begin
  ConfigurarRequisicao();
  self.URL:= FURL + '/api/'+ psComplemento;
  Result := get();
end;

function TAcessoSite.PostXML(aXML: string): string;
var
  WebServiceREST: TWebServiceREST;
begin
  try
    WebServiceREST:= TWebServiceREST.create;

  finally
    FreeAndNil( WebServiceREST );
  end;

//  URL:= FURL + psComplemento;
//
//  Params.Clear;
//  Params.Add('');
//  Result := post();
end;

end.
