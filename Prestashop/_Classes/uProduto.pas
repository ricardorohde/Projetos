unit uProduto;

interface

uses System.Classes, System.SysUtils, Vcl.Forms, Dialogs, {System.Contnrs,}
  DBXJSON, DBXJsonReflect, uWebServiceHttp, xmldom, XMLIntf, msxmldom, XMLDoc,
  StrUtils, msxml, System.Types, System.Variants, DBClient, mshtml, ActiveX,
  ComObj, Generics.Collections, LIB, uAcessoSite;

type
  TProduto = class
  private
    FObservacao: string;
    FPrecoCusto1: Currency;
    FEstoqueMinimo: Double;
    FPrecoVenda1: Currency;
    FCodigoBarrasEAN: string;
    FDescricao: string;
    FCodigoBarrasUPC: string;
    FCodigo: Integer;
    FVlrUnitarioSemTaxa: Extended;
    FQuantidadeBase: double;
    FCodigosite: string;
    FNCM: string;
    FVlrUnitarioComTaxa: Extended;
    FStatus: string;
    FFabricante: string;
    FCodGrupo: Integer;
    FCodigoEstoque: Integer;
    FNome: string;
    FVlrUnitario: Extended;
    FPrimeiraUnidade: string;
    FGrupo: string;
    procedure SetCodGrupo(const Value: Integer);
    procedure SetCodigo(const Value: Integer);
    procedure SetCodigoBarrasEAN(const Value: string);
    procedure SetCodigoBarrasUPC(const Value: string);
    procedure SetCodigoEstoque(const Value: Integer);
    procedure SetCodigosite(const Value: string);
    procedure SetDescricao(const Value: string);
    procedure SetEstoqueMinimo(const Value: Double);
    procedure SetFabricante(const Value: string);
    procedure SetGrupo(const Value: string);
    procedure SetNCM(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetObservacao(const Value: string);
    procedure SetPrecoCusto1(const Value: Currency);
    procedure SetPrecoVenda1(const Value: Currency);
    procedure SetPrimeiraUnidade(const Value: string);
    procedure SetQuantidadeBase(const Value: double);
    procedure SetStatus(const Value: string);
    procedure SetVlrUnitario(const Value: Extended);
    procedure SetVlrUnitarioComTaxa(const Value: Extended);
    procedure SetVlrUnitarioSemTaxa(const Value: Extended);
  public
    property Codigosite: string read FCodigosite write SetCodigosite;
    property Fabricante: string read FFabricante write SetFabricante;
    property CodGrupo: Integer read FCodGrupo write SetCodGrupo;
    property Grupo: string read FGrupo write SetGrupo;
    property Codigo: Integer read FCodigo write SetCodigo;
    property Nome: string read FNome write SetNome;
    property Status: string read FStatus write SetStatus;
    property CodigoBarrasEAN: string read FCodigoBarrasEAN write SetCodigoBarrasEAN;
    property QuantidadeBase: double read FQuantidadeBase write SetQuantidadeBase;
    property EstoqueMinimo: Double read FEstoqueMinimo write SetEstoqueMinimo;
    property PrecoVenda1: Currency read FPrecoVenda1 write SetPrecoVenda1;
    property PrecoCusto1: Currency read FPrecoCusto1 write SetPrecoCusto1;
    property PrimeiraUnidade: string read FPrimeiraUnidade write SetPrimeiraUnidade;
    property Observacao: string read FObservacao write SetObservacao;
    property Descricao: string read FDescricao write SetDescricao;
    property CodigoBarrasUPC: string read FCodigoBarrasUPC write SetCodigoBarrasUPC;
    property VlrUnitario: Extended read FVlrUnitario write SetVlrUnitario;
    property VlrUnitarioComTaxa: Extended read FVlrUnitarioComTaxa write SetVlrUnitarioComTaxa;
    property VlrUnitarioSemTaxa: Extended read FVlrUnitarioSemTaxa write SetVlrUnitarioSemTaxa;
    property NCM: string read FNCM write SetNCM;
    property CodigoEstoque: Integer read FCodigoEstoque write SetCodigoEstoque;

    function Add: TProduto;
  end;

  TProdutos = class(TAcessoSite)
    private
      FListaDeProdutos: TObjectList<TProduto>;
      procedure SetListaDeProdutos(const Value: TObjectList<TProduto>);
      function HtmlToText(Value: string): string;
    function PreencherFabricanteProduto(var produto: TProduto;
      const psID: string): Boolean;
    function PreencherCategoriaProduto(var produto: TProduto;
      const psID: string): Boolean;
    function PreencherNCMProduto(var produto: TProduto;
      const psID: string): Boolean;
    function PreencherQuantidadeProduto(var produto: TProduto;
      const psID: string): Boolean;
    public
      Procedure ListarProdutos(Id: Integer);
      procedure AfterConstruction; override;
      procedure BeforeDestruction; override;
      property ListaDeProdutos: TObjectList<TProduto> read FListaDeProdutos write SetListaDeProdutos;
  end;

implementation

{ TProduto }

function TProduto.Add: TProduto;
begin
  result:= TProduto.Create;
end;

procedure TProduto.SetCodGrupo(const Value: Integer);
begin
  FCodGrupo := Value;
end;

procedure TProduto.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TProduto.SetCodigoBarrasEAN(const Value: string);
begin
  FCodigoBarrasEAN := Value;
end;

procedure TProduto.SetCodigoBarrasUPC(const Value: string);
begin
  FCodigoBarrasUPC := Value;
end;

procedure TProduto.SetCodigoEstoque(const Value: Integer);
begin
  FCodigoEstoque := Value;
end;

procedure TProduto.SetCodigosite(const Value: string);
begin
  FCodigosite := Value;
end;

procedure TProduto.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TProduto.SetEstoqueMinimo(const Value: Double);
begin
  FEstoqueMinimo := Value;
end;

procedure TProduto.SetFabricante(const Value: string);
begin
  FFabricante := Value;
end;

procedure TProduto.SetGrupo(const Value: string);
begin
  FGrupo := Value;
end;

procedure TProduto.SetNCM(const Value: string);
begin
  FNCM := Value;
end;

procedure TProduto.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TProduto.SetObservacao(const Value: string);
begin
  FObservacao := Value;
end;

procedure TProduto.SetPrecoCusto1(const Value: Currency);
begin
  FPrecoCusto1 := Value;
end;

procedure TProduto.SetPrecoVenda1(const Value: Currency);
begin
  FPrecoVenda1 := Value;
end;

procedure TProduto.SetPrimeiraUnidade(const Value: string);
begin
  FPrimeiraUnidade := Value;
end;

procedure TProduto.SetQuantidadeBase(const Value: double);
begin
  FQuantidadeBase := Value;
end;

procedure TProduto.SetStatus(const Value: string);
begin
  FStatus := Value;
end;

procedure TProduto.SetVlrUnitario(const Value: Extended);
begin
  FVlrUnitario := Value;
end;

procedure TProduto.SetVlrUnitarioComTaxa(const Value: Extended);
begin
  FVlrUnitarioComTaxa := Value;
end;

procedure TProduto.SetVlrUnitarioSemTaxa(const Value: Extended);
begin
  FVlrUnitarioSemTaxa := Value;
end;

{ TProdutos }

procedure TProdutos.AfterConstruction;
begin
  inherited;
  FListaDeProdutos:= TObjectList<TProduto>.Create();
end;

procedure TProdutos.BeforeDestruction;
begin
  inherited;
  FreeAndNil(FListaDeProdutos);
end;

function TProdutos.HtmlToText(Value: string): string;
var
  IDoc:      IHTMLDocument2;
  Strl:      TStringList;
  sHTMLFile: String;
  v:         Variant;
  Links:     IHTMLElementCollection;
  i:         Integer;
  Link:    IHTMLAnchorElement;
begin
  if Value = EmptyStr then
    Exit;

  Strl := TStringList.Create;
  try
    Strl.Text:= Value;
    Idoc:=CreateComObject(Class_HTMLDOcument) as IHTMLDocument2;
    try
      IDoc.designMode:='on';
      while IDoc.readyState<>'complete' do
        Application.ProcessMessages;
      v:=VarArrayCreate([0,0],VarVariant);
      v[0]:= Strl.Text;
      IDoc.write(PSafeArray(System.TVarData(v).VArray));
      IDoc.designMode:='off';
      while IDoc.readyState<>'complete' do
        Application.ProcessMessages;

      Result:= IDoc.body.innerText;
    finally
      IDoc := nil;
    end;
  finally
    FreeAndNil( Strl );
  end;
end;

procedure TProdutos.ListarProdutos(Id: Integer);
var
  i: Integer;
  Node: IXMLNode;
  Nodefeature: IXMLNode;
  FXMLDocument: IXMLDocument;
  NodeAssociations: IXMLNode;
  Produto: TProduto;
  XML, NodeName: string;
begin
  try
    FXMLDocument:= TXmlDocument.Create(nil);
    XML:= GetXML( Format('products/?display=full&filter[id]=[%d]', [Id]));
    FXMLDocument.LoadFromXML( XML );
    if FXMLDocument.Active then
    begin
      Produto:= Produto.Add;
      Node:= GetNodeByName(FXMLDocument.DocumentElement, 'product');
      for i := 0 to Node.ChildNodes.Count -1 do
      begin
        NodeName:= AnsiUpperCase(Node.ChildNodes[i].NodeName);
        case AnsiIndexStr( NodeName,
          ['ID','ID_MANUFACTURER','ID_CATEGORY_DEFAULT','REFERENCE','EAN13','UPC','MINIMAL_QUANTITY',
          'PRICE', 'ACTIVE', 'WHOLESALE_PRICE','UNITY', 'NAME', 'DESCRIPTION',
          'DESCRIPTION_SHORT', 'ASSOCIATIONS', 'PRODUCT_FEATURES']) of

          0: Produto.Codigosite := Node.ChildNodes[i].NodeValue;

          1: PreencherFabricanteProduto(Produto, Node.ChildNodes[i].NodeValue);

          2: PreencherCategoriaProduto(Produto, Node.ChildNodes[i].NodeValue);

          3: Produto.Codigo := StrToInt( VarToStrDef( Node.ChildNodes[i].NodeValue, '0'));
//
          4: Produto.CodigoBarrasEAN := VarToStrDef(Node.ChildNodes[i].NodeValue, '');

          5: Produto.CodigoBarrasUPC := VarToStrDef(Node.ChildNodes[i].NodeValue, '');
//
          6: Produto.EstoqueMinimo := StrToFloatEsp( VarToStrDef(Node.ChildNodes[i].NodeValue, '0') );

          7: Produto.PrecoVenda1 := StrToFloatEsp( VarToStrDef( Node.ChildNodes[i].NodeValue, '0') );

          8:
            begin
              Produto.Status:= '0';
              if VarToStrDef( Node.ChildNodes[i].NodeValue, '0') = '0' then
              begin
                FreeAndNil( Produto );
                Break;
              end;
            end;

          9: Produto.PrecoCusto1 := StrToFloatEsp( VarToStrDef( Node.ChildNodes[i].NodeValue, '0') );

          10: Produto.PrimeiraUnidade := VarToStrDef( Node.ChildNodes[i].NodeValue, '');

          11: Produto.Nome:= VarToStrDef( Node.ChildNodes[i].ChildNodes['language'].NodeValue, '');

          12: Produto.Descricao:= HtmlToText( VarToStrDef( Node.ChildNodes[i].ChildNodes['language'].NodeValue, '') );

          13: Produto.Observacao:= VarToStrDef( Node.ChildNodes[i].ChildNodes['language'].NodeValue, '');

          14:
            begin
              NodeAssociations:= Node.ChildNodes[i];

              Nodefeature:= GetNodeByName( GetNodeByName( GetNodeByName(NodeAssociations, 'product_features'), 'product_feature'), 'id_feature_value');
              if Assigned( Nodefeature ) then
//                ExisteId(FXMLProduct_feature_values.DocumentElement, VarTostrDef(lNode.NodeValue, ''), 'product_feature_values') then
                PreencherNCMProduto(Produto, VarToStrDef(Nodefeature.NodeValue, ''));

              Nodefeature:= GetNodeByName( GetNodeByName( GetNodeByName(NodeAssociations, 'stock_availables'), 'stock_available'), 'id');
              if Assigned( Nodefeature ) then
              begin
//                ExisteId(FXMLStock_Availables.DocumentElement, VarTostrDef(lNode.NodeValue, ''), 'stock_availables') then
                PreencherQuantidadeProduto(Produto, VarToStrDef(Nodefeature.NodeValue, ''));
                Produto.CodigoEstoque:= StrToInt( VarToStrDef(Nodefeature.NodeValue, '0') );
              end;
            end;
        end;
      end;
      if Assigned( Produto ) then
        FListaDeProdutos.Add(Produto);
    end;
  finally
    FXMLDocument:= nil;
  end;
end;

function TProdutos.PreencherFabricanteProduto(var produto: TProduto; const psID: string): Boolean;
var
  FXMLManufacturers: IXMLDocument;
  NodeManufacturers, Node: IXMLNode;
  i, j: Integer;
  XML: string;
begin
  Result:= False;
  try
    FXMLManufacturers:= TXmlDocument.Create(nil);
    XML:= GetXML( Format('manufacturers/?display=full&filter[id]=[%s]', [psID]));
    FXMLManufacturers.LoadFromXML( XML );
    if FXMLManufacturers.Active then
    begin
      NodeManufacturers:= GetNodeByName(FXMLManufacturers.DocumentElement, 'manufacturers');
      for I := 0 to NodeManufacturers.ChildNodes.Count -1 do
      begin
        //Node:= GetNodeByName(NodeCustomer.ChildNodes[i], 'customer');
        Node:= NodeManufacturers.ChildNodes[i];
        if VarToStrDef(Node.ChildNodes.FindNode('id').NodeValue, '') = psID then
        begin
          for j := 0 to Node.ChildNodes.Count -1 do
          begin
            case AnsiIndexStr(AnsiUpperCase(Node.ChildNodes[j].NodeName),
              ['NAME']) of
              0: produto.Fabricante := Node.ChildNodes[j].NodeValue;
            end;
          end;

          Result:= True;
          Break;
        end;
      end;
    end;
  finally
    FXMLManufacturers:= nil;
  end;
end;

function TProdutos.PreencherCategoriaProduto(var produto: TProduto;
  const psID: string): Boolean;
var
  FXMLCategories: IXMLDocument;
  NodeCategories, Node: IXMLNode;
  i, j: Integer;
  XML: string;
begin
  Result:= False;
  try
    FXMLCategories:= TXmlDocument.Create(nil);
    XML:= GetXML( Format('categories/?display=full&filter[id]=[%s]', [psID]));
    FXMLCategories.LoadFromXML( XML );
    if FXMLCategories.Active then
    begin
      NodeCategories:= GetNodeByName(FXMLCategories.DocumentElement, 'categories');
      for I := 0 to NodeCategories.ChildNodes.Count -1 do
      begin
        //Node:= GetNodeByName(NodeCustomer.ChildNodes[i], 'customer');
        Node:= NodeCategories.ChildNodes[i];
        if VarToStrDef(Node.ChildNodes.FindNode('id').NodeValue, '') = psID then
        begin
          for j := 0 to Node.ChildNodes.Count -1 do
          begin
            case AnsiIndexStr(AnsiUpperCase(Node.ChildNodes[j].NodeName),
              ['ID','NAME']) of
              0:
                produto.CodGrupo := StrToInt(VarToStrDef(Node.ChildNodes[j].NodeValue, '0'));
              1:
                produto.Grupo := Node.ChildNodes[j].ChildNodes['language'].NodeValue;
            end;
          end;

          Result:= True;
          Break;
        end;
      end;
    end;
  finally
    FXMLCategories:= nil;
  end;
end;

function TProdutos.PreencherNCMProduto(var produto: TProduto;
  const psID: string): Boolean;
var
  FXMLProduct_feature_values: IXMLDocument;
  NodeProduct_feature_values, Node: IXMLNode;
  i, j: Integer;
  XML: string;
begin
  Result:= False;
  try
    FXMLProduct_feature_values:= TXmlDocument.Create(nil);
    XML:= GetXML( Format('product_feature_values/?display=full&filter[id]=[%s]', [psID]));
    FXMLProduct_feature_values.LoadFromXML( XML );
    if FXMLProduct_feature_values.Active then
    begin
      NodeProduct_feature_values:= GetNodeByName(FXMLProduct_feature_values.DocumentElement, 'product_feature_values');
      for I := 0 to NodeProduct_feature_values.ChildNodes.Count -1 do
      begin
        Node:= NodeProduct_feature_values.ChildNodes[i];
        if VarToStrDef(Node.ChildNodes.FindNode('id').NodeValue, '') = psID then
        begin
          for j := 0 to Node.ChildNodes.Count -1 do
          begin
            case AnsiIndexStr(AnsiUpperCase(Node.ChildNodes[j].NodeName),
              ['VALUE']) of
              0: produto.NCM := Node.ChildNodes[j].ChildNodes['language'].NodeValue;
            end;
          end;

          Result:= True;
          Break;
        end;
      end;
    end;
  finally
    FXMLProduct_feature_values:= nil;
  end;
end;

function TProdutos.PreencherQuantidadeProduto(var produto: TProduto;
  const psID: string): Boolean;
var
  FXMLStock_Availables: IXMLDocument;
  NodeStock_Availables, Node: IXMLNode;
  i, j: Integer;
  XML: string;
begin
  Result:= False;
  try
    FXMLStock_Availables:= TXmlDocument.Create(nil);
    XML:= GetXML( Format('stock_availables/?display=full&filter[id]=[%s]', [psID]));
    FXMLStock_Availables.LoadFromXML( XML );
    if FXMLStock_Availables.Active then
    begin
      NodeStock_Availables:= GetNodeByName(FXMLStock_Availables.DocumentElement, 'stock_availables');
      for I := 0 to NodeStock_Availables.ChildNodes.Count -1 do
      begin
        Node:= NodeStock_Availables.ChildNodes[i];
        if VarToStrDef(Node.ChildNodes.FindNode('id').NodeValue, '') = psID then
        begin
          for j := 0 to Node.ChildNodes.Count -1 do
          begin
            case AnsiIndexStr(AnsiUpperCase(Node.ChildNodes[j].NodeName),
              ['QUANTITY']) of
              0: produto.QuantidadeBase := Node.ChildNodes[j].NodeValue;
            end;
          end;

          Result:= True;
          Break;
        end;
      end;
    end;
  finally
    FXMLStock_Availables:= nil;
  end;
end;

procedure TProdutos.SetListaDeProdutos(const Value: TObjectList<TProduto>);
begin
  FListaDeProdutos := Value;
end;

end.
