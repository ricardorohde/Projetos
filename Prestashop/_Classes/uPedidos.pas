unit uPedidos;

interface

uses System.Classes, System.SysUtils, Vcl.Forms, Dialogs, {System.Contnrs,}
  DBXJSON, DBXJsonReflect, uWebServiceHttp, xmldom, XMLIntf, msxmldom, XMLDoc,
  StrUtils, msxml, System.Types, System.Variants, DBClient, mshtml, ActiveX,
  ComObj, Generics.Collections, uPedido, LIB, uProduto, uAcessoSite;

  type
    TPedidos = class(TAcessoSite)
  private
    function PreencherCustomersCliente(var Pedido: TPedido;
      const psID: string; IsDelivery: Boolean): Boolean;
    protected
      FXMLDocument: IXMLDocument;
      FXMLAddresses: IXMLDocument;
      FXMLCurrencies: IXMLDocument;
      FXMLCarriers: IXMLDocument;
      FXMLCustomers: IXMLDocument;
//      FXMLOrder_States: IXMLDocument;
      FXMLStates: IXMLDocument;
//      FAcessoSiteEvolucao: TAcessoSiteEvolucao;
      FListaDePedidos: TObjectList<TPedido>;

      procedure BuscarCustumersClientePedido(var Pedido: TPedido; const psID: string; IsDelivery: Boolean = False);
      function PreencherStatesPedido(var Pedido: TPedido; const psID: string): Boolean;
      procedure PreencherCurrenciesEntrega(var Pedido: TPedido; const psID: string);
      procedure PreencherCarriersPedido(var Pedido: TPedido; const psID: string);
      procedure PreencherStatusPedido(var Pedido: TPedido; const psID: string);
      procedure PreencherItensPedido(var Pedido: TPedido; Node: IXMLNode);
      procedure SetListaDePedidos(const value: TObjectList<TPedido>);
      function GetListaPedidos(): TObjectList<TPedido>;
    public
      procedure BeforeDestruction; override;
      procedure AfterConstruction; override;

      procedure ListarPedidos();
      property ListaDePedidos: TObjectList<TPedido> read GetListaPedidos write SetListaDePedidos;

      function Add: TPedidos;
    end;

implementation

{ TPedidos }

function TPedidos.Add: TPedidos;
begin
  Result:= TPedidos.Create;
end;

procedure TPedidos.AfterConstruction;
begin
  inherited;
//  FAcessoSiteEvolucao := TAcessoSiteEvolucao.Create(true);
  FListaDePedidos := TObjectList<TPedido>.Create();
  FXMLDocument:= TXmlDocument.Create(nil);
  FXMLAddresses:= TXmlDocument.Create(nil);
  FXMLCurrencies:= TXmlDocument.Create(nil);
  FXMLCarriers:= TXmlDocument.Create(nil);
//  FXMLOrder_States:= TXmlDocument.Create(nil);
  FXMLStates:= TXmlDocument.Create(nil);
  FXMLCustomers:= TXmlDocument.Create(nil);
end;

procedure TPedidos.BeforeDestruction;
begin
  inherited;
  FreeAndNil(FListaDePedidos);
  FXMLDocument:= nil;
  FXMLAddresses:= nil;
  FXMLCurrencies:= nil;
  FXMLCarriers:= nil;
  FXMLStates:= nil;
  FXMLCustomers:= nil;
end;

procedure TPedidos.BuscarCustumersClientePedido(var Pedido: TPedido;
  const psID: string; IsDelivery: Boolean);
var
  NodeAddresses, Node: IXMLNode;
  i, j: Integer;
  XML: string;
begin
  XML:= GetXML( Format('addresses/?display=full&filter[id]=[%s]', [psID]));
  FXMLAddresses.LoadFromXML( XML );
  if FXMLAddresses.Active then
  begin
    NodeAddresses:= GetNodeByName(FXMLAddresses.DocumentElement, 'addresses');
    for i := 0 to NodeAddresses.ChildNodes.Count -1 do
    begin
      Node:= NodeAddresses.ChildNodes[i];
      if VarToStrDef(Node.ChildNodes.FindNode('id').NodeValue, '') = psID then
      begin
        for j := 0 to Node.ChildNodes.Count -1 do
        begin
          case AnsiIndexStr(AnsiUpperCase(Node.ChildNodes[j].NodeName),['ID_STATE', 'ID_CUSTOMER']) of
            0: PreencherStatesPedido(Pedido, VarToStrDef( Node.ChildNodes[j].NodeValue, ''));
            1: PreencherCustomersCliente(Pedido, VarToStrDef( Node.ChildNodes[j].NodeValue, ''), IsDelivery);
          end;
        end;
        Break;
      end;
    end;
  end;
end;

function TPedidos.GetListaPedidos: TObjectList<TPedido>;
begin
  Result := FListaDePedidos;
end;

procedure TPedidos.ListarPedidos();
var
  loPedido: TPedido;
  i, j: Integer;
  NodeReturn,
  NodeNext: IXMLNode;
  NodeItem: IXMLNode;
  lsXML: string;
begin
  //lsXML:= GetXML( Format('orders/?display=full&filter[date_upd]=[%s]%s[valid]=1', [FormatDateTime('YYYY-MM-DD', Date), '%&date=1']) );
  lsXML:= GetXML( Format('orders/?display=full&filter[date_upd]=[%s]%s[valid]=1', ['2018-11-19', '%&date=1']) );
  FXMLDocument.LoadFromXML( lsXML );
  if FXMLDocument.Active then
  begin
    NodeReturn := GetNodeByName(FXMLDocument.DocumentElement, 'orders');

    for i := 0 to NodeReturn.ChildNodes.Count - 1 do
    begin
      NodeNext := NodeReturn.ChildNodes[i];
      loPedido := TPedido.Create;

      for j := 0 to NodeNext.ChildNodes.Count - 1 do
      begin
        case AnsiIndexStr(AnsiUpperCase(NodeNext.ChildNodes[j].NodeName), ['ID', 'ID_ADDRESS_DELIVERY', 'ID_ADDRESS_INVOICE',
          'ID_CURRENCY', 'ID_CARRIER', 'CURRENT_STATE', 'INVOICE_NUMBER', 'INVOICE_DATE', 'DELIVERY_DATE', 'TOTAL_DISCOUNTS',
          'TOTAL_PAID', 'TOTAL_PRODUCTS', 'TOTAL_SHIPPING', 'REFERENCE', 'ASSOCIATIONS', 'PAYMENT']) of

          0:
            loPedido.codigo := StrToInt(NodeNext.ChildNodes[j].nodeValue); // ID

          1:
            begin
              loPedido.ClienteEntrega := StrToInt( VarToStrDef( NodeNext.ChildNodes[j].nodeValue, '0') ); // ID_ADDRESS_DELIVERY
              //if ExisteId(FXMLAddresses.DocumentElement, VarTostrDef(NodeNext.ChildNodes[j].nodeValue, ''), 'addresses') then
              BuscarCustumersClientePedido(loPedido, NodeNext.ChildNodes[j].nodeValue, True); // ID_ADDRESS_DELIVERY
            end;

          2:
            begin
              loPedido.Cliente := StrToInt( VarToStrDef( NodeNext.ChildNodes[j].nodeValue, '0') ); // ID_ADDRESS_INVOICE
              BuscarCustumersClientePedido(loPedido, NodeNext.ChildNodes[j].nodeValue);
            end;

          3:
            PreencherCurrenciesEntrega(loPedido, NodeNext.ChildNodes[j].nodeValue); // ID_CURRENCY

          4:
            PreencherCarriersPedido(loPedido, NodeNext.ChildNodes[j].nodeValue); // ID_CARRIER

          5:
            loPedido.Status:= VarTostrDef(NodeNext.ChildNodes[j].nodeValue, '');
          6:
            loPedido.NumeroFatura := StrToInt(NodeNext.ChildNodes[j].nodeValue); // INVOICE_NUMBER

          7:
            loPedido.DataFatura := NodeNext.ChildNodes[j].nodeValue; // INVOICE_DATE

          8:
            loPedido.DataEntrega := NodeNext.ChildNodes[j].nodeValue; // DELIVERY_DATE

          9:
            loPedido.ValorDesconto := StrToFloatEsp( VarToStrDef(NodeNext.ChildNodes[j].nodeValue, '0') ); // TOTAL_DISCOUNTS

          10:
            loPedido.ValorLiquido := StrToFloatEsp( VarToStrDef( NodeNext.ChildNodes[j].nodeValue, '0') ); // TOTAL_PAID

          11:
            loPedido.ValorMercadorias := StrToFloatEsp( VarToStrDef( NodeNext.ChildNodes[j].nodeValue, '0') ); // TOTAL_PRODUCTS

          12:
            loPedido.ValorFrete := StrToFloatEsp( VarToStrDef( NodeNext.ChildNodes[j].nodeValue, '0' ) ); // TOTAL_SHIPPING

          13:
            loPedido.NumeroPedido := VarToStrDef(NodeNext.ChildNodes[j].nodeValue, ''); // REFERENCE

          14:
            begin
              NodeItem := NodeNext.ChildNodes.get(j).ChildNodes.FindNode('order_rows');
              NodeItem := NodeItem.ChildNodes.First;
              repeat
                PreencherItensPedido( loPedido, NodeItem );
                NodeItem := NodeItem.NextSibling;
              until not Assigned( NodeItem );
            end;
          15:
            loPedido.CondicaoPagamento := VarToStrDef( NodeNext.ChildNodes[j].nodeValue, ''); // PAYMENT
        end;
      end;

      if Assigned( loPedido ) then
        FListaDePedidos.Add(loPedido);
    end;
  end;
end;

function TPedidos.PreencherCustomersCliente(var Pedido: TPedido;
  const psID: string; IsDelivery: Boolean): Boolean;
begin

end;

function TPedidos.PreencherStatesPedido(var Pedido: TPedido;
  const psID: string): Boolean;
var
  NodeStates, Node: IXMLNode;
  i, j: Integer;
  XML: string;
begin
  Result:= False;
  XML:= GetXML( Format('states/?display=full&filter[id]=[%s]', [psID]));
  FXMLStates.LoadFromXML( XML );
  if FXMLStates.Active then
  begin
    NodeStates:= GetNodeByName(FXMLStates.DocumentElement, 'states');
    for i := 0 to NodeStates.ChildNodes.Count -1 do
    begin
      Node:= NodeStates.ChildNodes[i];
      if VarToStrDef(Node.ChildNodes.FindNode('id').NodeValue, '') = psID then
      begin
        for j := 0 to Node.ChildNodes.Count -1 do
        begin
          case AnsiIndexStr(AnsiUpperCase(Node.ChildNodes[j].NodeName),['ISO_CODE']) of
            0: Pedido.Uf := VarToStrDef( Node.ChildNodes[j].NodeValue, '');
          end;
        end;

        Result:= True;
        Break;
      end;
    end;
  end;
end;

procedure TPedidos.PreencherItensPedido(var Pedido: TPedido;
  Node: IXMLNode);
var
  i: Integer;
  loProduto: TProduto;
begin
  loProduto:= TProduto.Create;
  for i := 0 to Node.ChildNodes.Count -1 do
  begin
    case AnsiIndexStr(AnsiUpperCase(Node.ChildNodes[i].NodeName), ['PRODUCT_ID', 'PRODUCT_QUANTITY', 'PRODUCT_NAME',
                                                                   'PRODUCT_REFERENCE', 'PRODUCT_EAN13', 'PRODUCT_UPC',
                                                                   'PRODUCT_PRICE', 'UNIT_PRICE_TAX_INCL', 'UNIT_PRICE_TAX_EXCL']) of
      0: loProduto.Codigosite:= VarTostrDef( Node.ChildNodes[i].nodeValue, '');
      1: loProduto.QuantidadeBase:= StrToFloatEsp( VarToStrDef( Node.ChildNodes[i].nodeValue, '0') );
      2: loProduto.Nome:= VarToStrDef( Node.ChildNodes[i].NodeValue, '');
      3: loProduto.Codigo:= StrToInt(VarToStrDef( Node.ChildNodes[i].NodeValue, '0'));
      4: loProduto.CodigoBarrasEAN:= VarToStrDef( Node.ChildNodes[i].NodeValue, '');
      5: loProduto.CodigoBarrasUPC:= VarToStrDef( Node.ChildNodes[i].NodeValue, '');
      6: loProduto.VlrUnitario:= StrToFloatEsp( VarToStrDef( Node.ChildNodes[i].nodeValue, '0') );
      7: loProduto.VlrUnitarioComTaxa:= StrToFloatEsp( VarToStrDef( Node.ChildNodes[i].nodeValue, '0') );
      8: loProduto.VlrUnitarioSemTaxa:= StrToFloatEsp( VarToStrDef( Node.ChildNodes[i].nodeValue, '0') );
    end;
  end;
  Pedido.Items.Add(loProduto);
end;

procedure TPedidos.PreencherCurrenciesEntrega(var Pedido: TPedido;
  const psID: string);
var
  NodeCurrencies, Node: IXMLNode;
  i, j: Integer;
  XML: string;
begin
  XML:= GetXML( Format('currencies/?display=full&filter[id]=[%s]', [psID]));
  FXMLCurrencies.LoadFromXML( XML );
  if FXMLCurrencies.Active then
  begin
    NodeCurrencies:= GetNodeByName(FXMLCurrencies.DocumentElement, 'currencies');
    for i := 0 to NodeCurrencies.ChildNodes.Count -1 do
    begin
      Node:= NodeCurrencies.ChildNodes[i];
      if VarToStrDef(Node.ChildNodes.FindNode('id').NodeValue, '') = psID then
      begin
        for j := 0 to Node.ChildNodes.Count -1 do
        begin
          case AnsiIndexStr(AnsiUpperCase(Node.ChildNodes[j].NodeName),['ID','NAME']) of
            0: Pedido.Moeda := VarToStrDef( Node.ChildNodes[j].NodeValue, '');
            1: Pedido.DescricaoMoeda := VarToStrDef( Node.ChildNodes[j].NodeValue, '');
          end;
        end;
        Break;
      end;
    end;
  end;
end;

procedure TPedidos.PreencherStatusPedido(var Pedido: TPedido;
  const psID: string);
begin

end;

procedure TPedidos.PreencherCarriersPedido(var Pedido: TPedido;
  const psID: string);
var
  NodeCarriers, Node: IXMLNode;
  i, j: Integer;
  XML: string;
begin
  XML:= GetXML( Format('carriers/?display=full&filter[id]=[%s]', [psID]));
  FXMLCarriers.LoadFromXML( XML );
  if FXMLCarriers.Active then
  begin
    NodeCarriers:= GetNodeByName(FXMLCarriers.DocumentElement, 'carriers');
    for i := 0 to NodeCarriers.ChildNodes.Count -1 do
    begin
      Node:= NodeCarriers.ChildNodes[i];
      if VarToStrDef(Node.ChildNodes.FindNode('id').NodeValue, '') = psID then
      begin
        for j := 0 to Node.ChildNodes.Count -1 do
        begin
          case AnsiIndexStr(AnsiUpperCase(Node.ChildNodes[j].NodeName),['ID_REFERENCE']) of
            0: Pedido.Transportadora := StrToInt( VarToStrDef( Node.ChildNodes[j].NodeValue, '0') );
          end;
        end;

        Break;
      end;
    end;
  end;
end;

procedure TPedidos.SetListaDePedidos(
  const value: TObjectList<TPedido>);
begin
  FListaDePedidos := value;
end;

end.
