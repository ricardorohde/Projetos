unit uAcessoSite;

interface

uses System.Classes, System.SysUtils, Vcl.Forms, Dialogs, {System.Contnrs,}
  DBXJSON, DBXJsonReflect, uWebServiceHttp, xmldom, XMLIntf, msxmldom, XMLDoc,
  StrUtils, msxml, System.Types, System.Variants, DBClient, mshtml, ActiveX,
  ComObj, Generics.Collections;

type
  TAcessoSiteEvolucao = class(TWebServiceHttp)
  private
    FAppSenha: string;
    FSenha: string;
    FURL: string;
    FUsuario: string;
    FUser: string;
    procedure ConfigurarRequisicao();
    constructor CreatePrivate();
    procedure SetAppSenha(const Value: string);
    procedure SetSenha(const Value: string);
    procedure SetURL(const Value: string);
    procedure SetUser(const Value: string);
    procedure SetUsuario(const Value: string);
  public
    property URL: string read FURL write SetURL;
    property User: string read FUser write SetUser;
    property Usuario: string read FUsuario write SetUsuario;
    property AppSenha: string read FAppSenha write SetAppSenha;
    property Senha: string read FSenha write SetSenha;

  end;

function GetAcessoSiteEvolucao : TAcessoSiteEvolucao;
var
  AcessoSiteEvolucao: TAcessoSiteEvolucao;

implementation

function GetAcessoSiteEvolucao : TAcessoSiteEvolucao;
begin
  if not Assigned( AcessoSiteEvolucao ) then
    AcessoSiteEvolucao := TAcessoSiteEvolucao.createPrivate;

  Result := AcessoSiteEvolucao;
end;

{ TAcessoSiteEvolucao }

procedure TAcessoSiteEvolucao.ConfigurarRequisicao;
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

constructor TAcessoSiteEvolucao.CreatePrivate;
begin
  inherited Create(True);
end;
procedure TAcessoSiteEvolucao.SetAppSenha(const Value: string);
begin
  FAppSenha := Value;
end;

procedure TAcessoSiteEvolucao.SetSenha(const Value: string);
begin
  FSenha := Value;
end;

procedure TAcessoSiteEvolucao.SetURL(const Value: string);
begin
  FURL := Value;
end;

procedure TAcessoSiteEvolucao.SetUser(const Value: string);
begin
  FUser := Value;
end;

procedure TAcessoSiteEvolucao.SetUsuario(const Value: string);
begin
  FUsuario := Value;
end;

end.
