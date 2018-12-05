unit uClassesPrestashop;

interface

uses System.Classes, System.SysUtils, Vcl.Forms, Dialogs, {System.Contnrs,}
  DBXJSON, DBXJsonReflect, uWebServiceHttp, xmldom, XMLIntf, msxmldom, XMLDoc,
  StrUtils, msxml, System.Types, System.Variants, DBClient, mshtml, ActiveX,
  ComObj, Generics.Collections, LIB, uAcessoSite;

type
  TManufacturer = class;
  TCategory = class;
  TProduct_feature_value = class;
  TCountry = class;
  TState = class;

  TManufacturer = class(TAcessoSite)
    private
    FDescricao: string;
    procedure SetDescricao(const Value: string);
    public
      property Descricao: string read FDescricao write SetDescricao;
      function Add: TManufacturer;
      function Exportar(): string;
  end;

  TCategory = class(TAcessoSite)
    private
      FDescricao: string;
      procedure SetDescricao(const Value: string);
    public
      property Descricao: string read FDescricao write SetDescricao;
      function Add: TCategory;
      function Exportar(): string;
  end;

  TProduct_feature_value= class(TAcessoSite)
    private
      FNCM: string;
      procedure SetNCM(const Value: string);
    public
      property NCM: string read FNCM write SetNCM;
      function Add: TProduct_feature_value;
      function Exportar(): string;
  end;

  TCountry = class(TAcessoSite)
    private
      FCodPais: string;
      FNomePais: string;
      FDDI: string;
      procedure SetCodPais(const Value: string);
      procedure SetDDI(const Value: string);
      procedure SetNomePais(const Value: string);
    public
      property CodPais: string read FCodPais write SetCodPais;
      property DDI: string read FDDI write SetDDI;
      property NomePais: string read FNomePais write SetNomePais;
      function Add: TCountry;
      function Exportar(): string;
  end;
  TState = class(TAcessoSite)
    private
      FUf: string;
      Fmunicipio: string;
    FCodigoPais: string;
      procedure Setmunicipio(const Value: string);
      procedure SetUf(const Value: string);
    procedure SetCodigoPais(const Value: string);
    function GetPais(): Integer;
    public
      property municipio: string read Fmunicipio write Setmunicipio;
      property Uf: string read FUf write SetUf;
      property CodigoPais: string read FCodigoPais write SetCodigoPais;
      function Add: TState;
      function Exportar(): string;
  end;

  function RetornaIdPrestashop(XMLRetorno: IXMLDocument): Integer;
implementation


function RetornaIdPrestashop(XMLRetorno: IXMLDocument): Integer;
var
  i,j: integer;
  aNode, aCNode, aCCNode: IXMLNode;
begin
  Result:= -1;
  if not XMLRetorno.Active then Exit;

  aNode := XMLRetorno.ChildNodes.FindNode('prestashop');
  if assigned(aNode) then
  begin
    for i := 0 to aNode.ChildNodes.Count-1 do
    begin
      aCNode:= aNode.ChildNodes.Get(i);
      for j := 0 to aCNode.ChildNodes.Count-1 do
      begin
        aCCNode := aCNode.ChildNodes[j];

        if AnsiUpperCase(aCCNode.NodeName) = 'ID' then
        begin
          Result:= StrToIntDef(VarToStrDef(aCCNode.NodeValue, '-1'),-1);
          Break;
        end;
      end;
    end;
  end;
end;

{ TManufacturer }

function TManufacturer.Add: TManufacturer;
begin
  Result:= TManufacturer.Create();
end;

function TManufacturer.Exportar(): string;
var
  XML: string;
  k,i,j,a, ID: integer;
  FXMLDocument, FXMLRetorno: IXMLDocument;
  aNode, aCNode, aCCNode: IXMLNode;
begin
  Result:= '';
  try
    FXMLDocument:= TXmlDocument.Create(nil);
    FXMLRetorno:= TXmlDocument.Create(nil);
    XML:= GetSchema('manufacturers');;
    FXMLDocument.LoadFromXML(XML);
    aNode := FXMLDocument.ChildNodes.FindNode('prestashop');
    if assigned(aNode) then
    begin
      for i := 0 to aNode.ChildNodes.Count-1 do
      begin
        aCNode := aNode.ChildNodes.Get(i);
        for j := 0 to aCNode.ChildNodes.Count-1 do
        begin
          aCCNode := aCNode.ChildNodes[j];

          case AnsiIndexStr(AnsiUpperCase(aCCNode.NodeName), ['ACTIVE', 'DATE_ADD', 'DATE_UPD','NAME']) of
  //          0: Cliente.NomeReduzido := Node.ChildNodes[j].NodeValue; //lastname
            0: aCCNode.NodeValue:= '1';
            1,2: aCCNode.NodeValue:= FormatDateTime('YYYY-MM-DD HH:MM:SS', Now);
            3: aCCNode.NodeValue:= Self.Descricao;
          end;
        end;
      end;
    end;

    XML:= PostXML('manufacturers', FXMLDocument.XML.Text);
    FXMLRetorno.LoadFromXML(XML);
    ID:= RetornaIdPrestashop(FXMLRetorno);
    if ID <> -1 then
      Result:= IntToStr(ID);
  finally
    FXMLDocument:= nil;
    FXMLRetorno:= nil;
  end;
end;

procedure TManufacturer.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

{ TCategory }

function TCategory.Add: TCategory;
begin
  Result:= TCategory.Create();
end;

function TCategory.Exportar(): string;
var
  XML: string;
  k,i,j,a, ID: integer;
  FXMLDocument, FXMLRetorno: IXMLDocument;
  aNode, aCNode, aCCNode: IXMLNode;
begin
  Result:= '';
  try
    FXMLDocument:= TXmlDocument.Create(nil);
    FXMLRetorno:= TXmlDocument.Create(nil);
    XML:= GetSchema('categories');;
    FXMLDocument.LoadFromXML(XML);
    aNode := FXMLDocument.ChildNodes.FindNode('prestashop');
    if assigned(aNode) then
    begin
      for i := 0 to aNode.ChildNodes.Count-1 do
      begin
        aCNode := aNode.ChildNodes.Get(i);
        for j := 0 to aCNode.ChildNodes.Count-1 do
        begin
          aCCNode := aCNode.ChildNodes[j];

          case AnsiIndexStr(AnsiUpperCase(aCCNode.NodeName), ['ACTIVE', 'DATE_ADD', 'DATE_UPD','NAME', 'LINK_REWRITE']) of
  //          0: Cliente.NomeReduzido := Node.ChildNodes[j].NodeValue; //lastname
            0: aCCNode.NodeValue:= '1';
            1,2: aCCNode.NodeValue:= FormatDateTime('YYYY-MM-DD HH:MM:SS', Now);
            3:
              begin
                aCCNode.ChildNodes[0].NodeValue := Self.Descricao;
                aCCNode.ChildNodes[1].NodeValue := Self.Descricao;
              end;
            4:
              begin
                aCCNode.ChildNodes[0].NodeValue := LimpaString(' -()*&�%$#@!"=+_/값[]{}|\~^�`,.?;:'+ Char(39), Self.Descricao);
                aCCNode.ChildNodes[1].NodeValue := LimpaString(' -()*&�%$#@!"=+_/값[]{}|\~^�`,.?;:'+ Char(39), Self.Descricao);
              end;
          end;
        end;
      end;
    end;

    XML:= PostXML('categories', FXMLDocument.XML.Text);
    FXMLRetorno.LoadFromXML(XML);
    ID:= RetornaIdPrestashop(FXMLRetorno);
    if ID <> -1 then
      Result:= IntToStr(ID);
  finally
    FXMLDocument:= nil;
    FXMLRetorno:= nil;
  end;
end;

procedure TCategory.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

{ TProduct_feature_value }

function TProduct_feature_value.Add: TProduct_feature_value;
begin
  Result:= TProduct_feature_value.Create();
end;

function TProduct_feature_value.Exportar(): string;
var
  XML: string;
  k,i,j,a, ID: integer;
  FXMLDocument, FXMLRetorno: IXMLDocument;
  aNode, aCNode, aCCNode: IXMLNode;
begin
  Result:= '';
  try
    FXMLDocument:= TXmlDocument.Create(nil);
    FXMLRetorno:= TXmlDocument.Create(nil);
    XML:= GetSchema('product_feature_values');;
    FXMLDocument.LoadFromXML(XML);
    aNode := FXMLDocument.ChildNodes.FindNode('prestashop');
    if assigned(aNode) then
    begin
      for i := 0 to aNode.ChildNodes.Count-1 do
      begin
        aCNode := aNode.ChildNodes.Get(i);
        for j := 0 to aCNode.ChildNodes.Count-1 do
        begin
          aCCNode := aCNode.ChildNodes[j];
          case AnsiIndexStr(AnsiUpperCase(aCCNode.NodeName), ['ID_FEATURE','VALUE']) of
            0: aCCNode.NodeValue:= '1';
            1: aCCNode.ChildNodes['language'].NodeValue:= Self.NCM;
          end;
        end;
      end;
    end;

    XML:= PostXML('product_feature_values', FXMLDocument.XML.Text);
    FXMLRetorno.LoadFromXML(XML);
    ID:= RetornaIdPrestashop(FXMLRetorno);
    if ID <> -1 then
      Result:= IntToStr(ID);
  finally
    FXMLDocument:= nil;
    FXMLRetorno:= nil;
  end;
end;

procedure TProduct_feature_value.SetNCM(const Value: string);
begin
  FNCM := Value;
end;

{ TState }

function TState.Add: TState;
begin
  Result:= TState.Create;
end;

function TState.GetPais(): Integer;
var
  FXMLRetorno: IXMLDocument;
  XML: string;
begin
  try
    FXMLRetorno:= TXmlDocument.Create(nil);
    XML:= GetXML( Format('/countries?display=full&filter[iso_code]=[%s]', ['BR']));
    FXMLRetorno.LoadFromXML(XML);
    Result:= GetNodeByName(FXMLRetorno.DocumentElement, 'ID').NodeValue;
  finally
    FXMLRetorno:= nil;
  end;
end;

function TState.Exportar(): string;
var
  XML: string;
  k,i,j,a, ID: integer;
  FXMLDocument, FXMLRetorno: IXMLDocument;
  aNode, aCNode, aCCNode: IXMLNode;
begin
  Result:= '';
//  XML:= GetXML(Format('/products?schema=blank&ws_key=%s', [User]));
  try
    FXMLDocument:= TXmlDocument.Create(nil);
    FXMLRetorno:= TXmlDocument.Create(nil);
    XML:= GetSchema('states');;
    FXMLDocument.LoadFromXML(XML);
    aNode := FXMLDocument.ChildNodes.FindNode('prestashop');
    if assigned(aNode) then
    begin
      for i := 0 to aNode.ChildNodes.Count-1 do
      begin
        aCNode := aNode.ChildNodes.Get(i);
        for j := 0 to aCNode.ChildNodes.Count-1 do
        begin
          aCCNode := aCNode.ChildNodes[j];
          case AnsiIndexStr(AnsiUpperCase(aCCNode.NodeName),['NAME', 'ISO_CODE', 'ID_COUNTRY', 'ID_ZONE', 'ACTIVE']) of
            0: aCCNode.NodeValue:= Self.municipio;
            1: aCCNode.NodeValue:= Self.Uf;
            2: aCCNode.NodeValue:= GetPais();
            3: aCCNode.NodeValue:= '8';
            4: aCCNode.NodeValue:= '1';
          end;
        end;
      end;
    end;

    XML:= PostXML('states', FXMLDocument.XML.Text);
    FXMLRetorno.LoadFromXML(XML);
    ID:= RetornaIdPrestashop(FXMLRetorno);
    if ID <> -1 then
      Result:= IntToStr(ID);
  finally
    FXMLDocument:= nil;
    FXMLRetorno:= nil;
  end;
end;

procedure TState.SetCodigoPais(const Value: string);
begin
  FCodigoPais := Value;
end;

procedure TState.Setmunicipio(const Value: string);
begin
  Fmunicipio := Value;
end;

procedure TState.SetUf(const Value: string);
begin
  FUf := Value;
end;

{ TCountry }

function TCountry.Add: TCountry;
begin
  Result:= TCountry.Create;
end;

function TCountry.Exportar(): string;
var
  XML: string;
  k,i,j,a, ID: integer;
  FXMLDocument, FXMLRetorno: IXMLDocument;
  aNode, aCNode, aCCNode: IXMLNode;
begin
  Result:= '';
//  XML:= GetXML(Format('/products?schema=blank&ws_key=%s', [User]));
  try
    FXMLDocument:= TXmlDocument.Create(nil);
    FXMLRetorno:= TXmlDocument.Create(nil);
    XML:= GetSchema('countries');;
    FXMLDocument.LoadFromXML(XML);
    aNode := FXMLDocument.ChildNodes.FindNode('prestashop');
    if assigned(aNode) then
    begin
      for i := 0 to aNode.ChildNodes.Count-1 do
      begin
        aCNode := aNode.ChildNodes.Get(i);
        for j := 0 to aCNode.ChildNodes.Count-1 do
        begin
          aCCNode := aCNode.ChildNodes[j];
          case AnsiIndexStr(AnsiUpperCase(aCCNode.NodeName),['ID','CALL_PREFIX','NAME']) of
            0: aCCNode.NodeValue:= Self.CodPais;
            1: aCCNode.NodeValue:= Self.DDI;
            2: aCCNode.ChildNodes['language'].NodeValue:= Self.NomePais;
          end;
        end;
      end;
    end;

    XML:= PostXML('countries', FXMLDocument.XML.Text);
    FXMLRetorno.LoadFromXML(XML);
    ID:= RetornaIdPrestashop(FXMLRetorno);
    if ID <> -1 then
      Result:= IntToStr(ID);
  finally
    FXMLDocument:= nil;
    FXMLRetorno:= nil;
  end;
end;

procedure TCountry.SetCodPais(const Value: string);
begin
  FCodPais := Value;
end;

procedure TCountry.SetDDI(const Value: string);
begin
  FDDI := Value;
end;

procedure TCountry.SetNomePais(const Value: string);
begin
  FNomePais := Value;
end;

end.
