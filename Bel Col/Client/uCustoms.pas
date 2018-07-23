unit uCustoms;

interface

uses Windows, Classes, Forms, SysUtils, Dialogs, DB, DBClient, uTypes, Controls,
  IdMessage, IdSMTP, DSConnect, Math, Variants, DateUtils, StrUtils, uDMMain,
  xmldom, XMLIntf, msxmldom, XMLDoc, msxml, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, IdHTTPHeaderInfo, IdHeaderList, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL;

implementation

function GetNodeByName(const node: IXMLNode; NodeSearch: string): IXMLNode;
var
  i: Integer;
begin
  Result := nil;
  if not Assigned( node ) then
    Exit;

  for i := 0 to node.ChildNodes.Count - 1 do
  begin
    if AnsiUpperCase(node.ChildNodes[i].NodeName) = AnsiUpperCase(NodeSearch) then
      begin
        Result := node.ChildNodes[i];
        Break;
      end
    else if node.ChildNodes[i].HasChildNodes then
      Result := GetNodeByName(node.ChildNodes[i], NodeSearch);
  end;
end;

function FreteCorreios(cdsDados: TClientDataSet): Currency;
var
 lsURL: string;
 XMLDocument: IXMLDocument;
 IdHTTP: TIdHTTP;
 SSL: TIdSSLIOHandlerSocketOpenSSL;
 XMLStream: TStringStream;
 lNode: IXMLNode;
begin
  Result := 0;
  lsURL:= 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?'+
          Format('nCdEmpresa=%s&', [VarToStrDef(__SuperClass.GetInstance.DBFunctions.GetParamValue('SV_CODIGO_ADMIN_CORREIOS'), '')])+
          Format('sDsSenha=%s&', [Copy(__SuperClass.GetInstance.User.Branch.CNPJ, 1, 8)])+
          Format('sCepOrigem=%s&', [StringReplace(cdsDados.FieldByName('CEPORIGEM').AsString, '-', '', [rfReplaceAll])])+
          Format('sCepDestino=%s&', [StringReplace(cdsDados.FieldByName('CEPDESTINO').AsString, '-', '', [rfReplaceAll])])+
          Format('nVlPeso=%s&', [cdsDados.FieldByName('PESO').AsString])+
          Format('nCdFormato=%s&', [cdsDados.FieldByName('FORMATO').AsString])+
          Format('nVlComprimento=%s&', [cdsDados.FieldByName('COMPRIMENTO').AsString])+
          Format('nVlAltura=%s&', [cdsDados.FieldByName('ALTURA').AsString])+
          Format('nVlLargura=%s&', [cdsDados.FieldByName('LARGURA').AsString])+
          Format('sCdMaoPropria=%s&', [__SuperClass.GetInstance.GenericsF.IfThen(cdsDados.FieldByName('MAOPROPRIA').AsString = VB_SIM, 'S', 'N')])+
          Format('nVlValorDeclarado=%s&', [cdsDados.FieldByName('VALORDECLARADO').AsString])+
          Format('sCdAvisoRecebimento=%s&', [__SuperClass.GetInstance.GenericsF.IfThen(cdsDados.FieldByName('AVISORECEBIMENTO').AsString = VB_SIM, 'S', 'N')])+
          Format('nCdServico=%s&', [cdsDados.FieldByName('SERVICO').AsString])+
          Format('nVlDiametro=%s&', [cdsDados.FieldByName('DIAMETRO').AsString])+
          'StrRetorno=xml';
  try
    try
      IdHTTP := TIdHTTP.Create;
      SSL := TIdSSLIOHandlerSocketOpenSSL.Create(IdHTTP);
      XMLDocument := TXMLDocument.Create(Nil);
      IdHTTP.IOHandler := SSL;
      XMLStream := TStringStream.Create(EmptyStr);
      IdHTTP.Get(lsURL, XMLStream);
      XMLDocument.LoadFromStream(XMLStream, xetUTF_8);
      XMLDocument.Active := True;

      lNode:= GetNodeByName( GetNodeByName(XMLDocument.DocumentElement, 'cServico'), 'Valor');

      Result:= StrToFloat( VarToStrDef(lNode.NodeValue, '0') );
    finally
      XMLDocument := Nil;
      FreeAndNil(SSL);
      FreeAndNil(IdHTTP);
    end;
  except
    __SuperClass.GetInstance.GenericsF.DisplayMessage('Problemas para obter o valor do frete.', '',
      'Verifique o filtro informado.', 'Informação', MB_ICONEXCLAMATION);
  end;
end;


exports FreteCorreios;

end.
