unit uCustoms;

interface

uses Windows, Classes, Forms, SysUtils, Dialogs, DB, DBClient, uTypes, Controls,
  IdMessage, IdSMTP, DSConnect, Math, Variants, DateUtils, StrUtils, uDMMain,
  xmldom, XMLIntf, msxmldom, XMLDoc, msxml, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, IdHTTPHeaderInfo, IdHeaderList, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL;

type
  TTransferItens = class
  private
  public
    Description: String;
    Selected: Boolean;
    Group: String;
    GroupDescription: String;
    Digit: String;
    DigitDescription: String;
    Item: integer;
    Product: String;
    Quantity: Real;
    Provider: integer;
    ProviderName: String;
    Cost: Real;
    Applied: Boolean;

    // Campanha
    Vendedor: integer;
    VendedorNome: String;
    ValorTotal: Real;
    ValorComissao: Real;
    TotalValorComissao: Real;
  end;

function MostraPrecoVendaCustomizado(TipoPreco: ShortString; GrupoFaixa: integer; Produto: ShortString;
  Cliente, TabelaPreco: integer; Tipo: integer = 0): TPrecoVenda;
function MostraSaldosEstoqueCustomizado(Produto, Descricao: String; Vendedor, Cliente: integer; Origem: String): String;

implementation

uses uMostra_Saldos_Estoque_BelCol, uMostra_Precos_Vendas_BelCol, uLibrary, Db, Windows;

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

function MostraPrecoVendaCustomizado(TipoPreco: ShortString; GrupoFaixa: integer; Produto: ShortString;
  Cliente, TabelaPreco: integer; Tipo: integer = 0): TPrecoVenda;
var
  Ret: TPrecoVenda;
begin
  Ret.TipoPreco := '';
  Ret.Preco := 0;
  frmMostra_Precos_Vendas_belcol := TfrmMostra_Precos_Vendas_belcol.Create(Application);
  try
    frmMostra_Precos_Vendas_belcol.TipoPreco := TipoPreco;
    frmMostra_Precos_Vendas_belcol.Produto := Produto;
    frmMostra_Precos_Vendas_belcol.GrupoFaixa := GrupoFaixa;
    frmMostra_Precos_Vendas_belcol.Identificador := Cliente;
    frmMostra_Precos_Vendas_belcol.TabelaPreco := TabelaPreco;

    case Tipo of
      0:
        frmMostra_Precos_Vendas_belcol.Tipo := TTipo.mpvSaida;
      1:
        frmMostra_Precos_Vendas_belcol.Tipo := TTipo.mpvEntrada;
    else
      frmMostra_Precos_Vendas_belcol.Tipo := TTipo.mpvSaida;
    end;

    if (frmMostra_Precos_Vendas_belcol.ShowModal = mrOk) then
      Ret := frmMostra_Precos_Vendas_belcol.PrecoVenda;
  finally
    FreeAndNil(frmMostra_Precos_Vendas_belcol);
  end;
  Result := Ret;
end;

function MostraSaldosEstoqueCustomizado(Produto, Descricao: String; Vendedor, Cliente: integer; Origem: String): String;
var
  Empresa, Filial: String;
  SQL: String;
  Auxiliar: TDataSet;
begin
  Result := '';

  frmMostra_Saldos_Estoque_BelCol := TfrmMostra_Saldos_Estoque_BelCol.Create(Application);
  try
    with frmMostra_Saldos_Estoque_BelCol do
    begin
      FVendedor := Vendedor;
      FCliente := Cliente;
      FProduto := Produto;
      FDescricao := Descricao;
      FOrigem := Origem;
      if ExecutaSQL then
        if (ShowModal = mrOk) then
          Result := FLocal;
    end;
  finally
    FreeAndNil(frmMostra_Saldos_Estoque_BelCol);
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
          Format('nCdEmpresa=%s&', [VarToStrDef(__SuperClass.DBFunctions.GetParamValue('SV_CODIGO_ADMIN_CORREIOS'), '')])+
          Format('sDsSenha=%s&', [Copy(__SuperClass.User.Branch.CNPJ, 1, 8)])+
          Format('sCepOrigem=%s&', [StringReplace(cdsDados.FieldByName('CEPORIGEM').AsString, '-', '', [rfReplaceAll])])+
          Format('sCepDestino=%s&', [StringReplace(cdsDados.FieldByName('CEPDESTINO').AsString, '-', '', [rfReplaceAll])])+
          Format('nVlPeso=%s&', [cdsDados.FieldByName('PESO').AsString])+
          Format('nCdFormato=%s&', [cdsDados.FieldByName('FORMATO').AsString])+
          Format('nVlComprimento=%s&', [cdsDados.FieldByName('COMPRIMENTO').AsString])+
          Format('nVlAltura=%s&', [cdsDados.FieldByName('ALTURA').AsString])+
          Format('nVlLargura=%s&', [cdsDados.FieldByName('LARGURA').AsString])+
          Format('sCdMaoPropria=%s&', [__SuperClass.GenericsF.IfThen(cdsDados.FieldByName('MAOPROPRIA').AsString = VB_SIM, 'S', 'N')])+
          Format('nVlValorDeclarado=%s&', [cdsDados.FieldByName('VALORDECLARADO').AsString])+
          Format('sCdAvisoRecebimento=%s&', [__SuperClass.GenericsF.IfThen(cdsDados.FieldByName('AVISORECEBIMENTO').AsString = VB_SIM, 'S', 'N')])+
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
    __SuperClass.GenericsF.DisplayMessage('Problemas para obter o valor do frete.', '',
      'Verifique o filtro informado.', 'Informação', MB_ICONEXCLAMATION);
  end;
end;

exports MostraPrecoVendaCustomizado, MostraSaldosEstoqueCustomizado, FreteCorreios;

end.
