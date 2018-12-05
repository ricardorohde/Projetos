unit uUtilsPrestashop;

interface

uses System.Classes, System.SysUtils, Vcl.Forms, Dialogs, {System.Contnrs,}
  DBXJSON, DBXJsonReflect, uWebServiceHttp, xmldom, XMLIntf, msxmldom, XMLDoc,
  StrUtils, msxml, System.Types, System.Variants, DBClient, mshtml, ActiveX,
  ComObj, Generics.Collections, LIB, uAcessoSite;

type
  TManufacturers = class;
  TCategories = class;
  TProduct_feature_values = class;
  TManufacturer = class;
  TCategory = class;
  TProduct_feature_value = class;
  TCountries = class;
  TCountry = class;
  TStates = class;
  TState = class;


  TManufacturers = class(TAcessoSite)
    private
      FListaDeManufacturers: TObjectList<TManufacturer>;
      procedure SetListaDeManufacturers(const Value: TObjectList<TManufacturer>);
    public
      procedure AfterConstruction; override;
      procedure BeforeDestruction; override;
      function ExportarManufacturers(Manufacturer: TManufacturer): string;
      property ListaDeManufacturers: TObjectList<TManufacturer> read FListaDeManufacturers write SetListaDeManufacturers;
  end;

  TManufacturer = class
    private
    FDescricao: string;
    procedure SetDescricao(const Value: string);
    public
      property Descricao: string read FDescricao write SetDescricao;
      function Add: TManufacturer;
  end;

  TCategories = class(TAcessoSite)
    private
      FListaDeCategories: TObjectList<TCategory>;
      procedure SetListaDeCategories(const Value: TObjectList<TCategory>);
    public
      procedure AfterConstruction; override;
      procedure BeforeDestruction; override;
      function ExportarCategories(Category: TCategory): string;
      property ListaDeCategories: TObjectList<TCategory> read FListaDeCategories write SetListaDeCategories;
  end;

  TCategory = class
    private
    FDescricao: string;
    procedure SetDescricao(const Value: string);
    public
      property Descricao: string read FDescricao write SetDescricao;
      function Add: TCategory;
  end;

  TProduct_feature_values = class(TAcessoSite)
    private
      FListaDeProduct_feature_values: TObjectList<TProduct_feature_value>;
      procedure SetListaDeProduct_feature_values(
        const Value: TObjectList<TProduct_feature_value>);
    public
      procedure AfterConstruction; override;
      procedure BeforeDestruction; override;
      function ExportarProduct_feature_values(
        Product_feature_value: TProduct_feature_value): string;
      property ListaDeProduct_feature_values: TObjectList<TProduct_feature_value> read FListaDeProduct_feature_values write SetListaDeProduct_feature_values;
  end;

  TProduct_feature_value = class
    private
      FNCM: string;
      procedure SetNCM(const Value: string);
    public
      property NCM: string read FNCM write SetNCM;

      function Add: TProduct_feature_value;
  end;

  TCountries = class(TAcessoSite)
    private
    FListaDeCountries: TObjectList<TCountry>;
    procedure SetListaDeCountries(const Value: TObjectList<TCountry>);
    public
      procedure AfterConstruction; override;
      procedure BeforeDestruction; override;
      function ExportarCountries(
        Country: TCountry): string;
      property ListaDeCountries: TObjectList<TCountry> read FListaDeCountries write SetListaDeCountries;
  end;
  TCountry = class
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
  end;
  TStates = class(TAcessoSite)
    private
    FListaDeStates: TObjectList<TState>;
    procedure SetListaDeStates(const Value: TObjectList<TState>);
    public
      procedure AfterConstruction; override;
      procedure BeforeDestruction; override;
      function ExportarStates(
        State: TState): string;
      property ListaDeStates: TObjectList<TState> read FListaDeStates write SetListaDeStates;
  end;
  TState = class
    private
      FUf: string;
      Fmunicipio: string;
      procedure Setmunicipio(const Value: string);
      procedure SetUf(const Value: string);
    public
      property municipio: string read Fmunicipio write Setmunicipio;
      property Uf: string read FUf write SetUf;
      function Add: TState;
  end;

  function RetornaIdPrestashop(XMLRetorno: IXMLDocument): Integer;
implementation


{ TManufacturers }

procedure TManufacturers.AfterConstruction;
begin
  inherited;

  FListaDeManufacturers:= TObjectList<TManufacturer>.Create();
end;

procedure TManufacturers.BeforeDestruction;
begin
  inherited;

  FreeAndNil( FListaDeManufacturers );
end;

function TManufacturers.ExportarManufacturers(Manufacturer: TManufacturer): string;
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
            3: aCCNode.NodeValue:= Manufacturer.Descricao;
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

procedure TManufacturers.SetListaDeManufacturers(
  const Value: TObjectList<TManufacturer>);
begin
  FListaDeManufacturers := Value;
end;

{ TCategories }

procedure TCategories.AfterConstruction;
begin
  inherited;
  FListaDeCategories:= TObjectList<TCategory>.Create();
end;

procedure TCategories.BeforeDestruction;
begin
  inherited;

  FreeAndNil(FListaDeCategories);
end;

procedure TCategories.SetListaDeCategories(
  const Value: TObjectList<TCategory>);
begin
  FListaDeCategories := Value;
end;

function TCategories.ExportarCategories(Category: TCategory): string;
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
            3, 4: aCCNode.ChildNodes['language'].NodeValue := Category.Descricao;
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

{ TProduct_feature_values }

procedure TProduct_feature_values.AfterConstruction;
begin
  inherited;
  FListaDeProduct_feature_values:= TObjectList<TProduct_feature_value>.Create();
end;

procedure TProduct_feature_values.BeforeDestruction;
begin
  inherited;
  FreeAndNil( FListaDeProduct_feature_values );
end;

function TProduct_feature_values.ExportarProduct_feature_values(Product_feature_value: TProduct_feature_value): string;
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

          case AnsiIndexStr(AnsiUpperCase(aCCNode.NodeName), ['VALUE']) of
            0: aCCNode.NodeValue:= Product_feature_value.NCM;
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

procedure TProduct_feature_values.SetListaDeProduct_feature_values(
  const Value: TObjectList<TProduct_feature_value>);
begin
  FListaDeProduct_feature_values := Value;
end;

{ TManufacturer }

function TManufacturer.Add: TManufacturer;
begin
  Result:= TManufacturer.Create();
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

procedure TCategory.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

{ TProduct_feature_value }

function TProduct_feature_value.Add: TProduct_feature_value;
begin
  Result:= TProduct_feature_value.Create();
end;

procedure TProduct_feature_value.SetNCM(const Value: string);
begin
  FNCM := Value;
end;

{ TCountries }

procedure TCountries.AfterConstruction;
begin
  inherited;
  FListaDeCountries:= TObjectList<TCountry>.Create();
end;

procedure TCountries.BeforeDestruction;
begin
  inherited;
  FreeAndNIl(FListaDeCountries);
end;

function TCountries.ExportarCountries(Country: TCountry): string;
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
            0: aCCNode.NodeValue:= Country.CodPais;
            1: aCCNode.NodeValue:= Country.DDI;
            2: aCCNode.NodeValue:= Country.NomePais;
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

procedure TCountries.SetListaDeCountries(const Value: TObjectList<TCountry>);
begin
  FListaDeCountries := Value;
end;

{ TStates }

procedure TStates.AfterConstruction;
begin
  inherited;
  FListaDeStates:= TObjectList<TState>.Create();
end;

procedure TStates.BeforeDestruction;
begin
  inherited;
  FreeAndNil( FListaDeStates );
end;

function TStates.ExportarStates(State: TState): string;
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
          case AnsiIndexStr(AnsiUpperCase(aCCNode.NodeName),['NAME', 'ISO_CODE']) of
            0: aCCNode.NodeValue:= State.Uf;
            1: aCCNode.NodeValue:= State.municipio;
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

procedure TStates.SetListaDeStates(const Value: TObjectList<TState>);
begin
  FListaDeStates := Value;
end;

{ TState }

function TState.Add: TState;
begin
  Result:= TState.Create;
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
