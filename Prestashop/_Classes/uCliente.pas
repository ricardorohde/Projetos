unit uCliente;

interface

uses System.Classes, System.SysUtils, Vcl.Forms, Dialogs, {System.Contnrs,}
  DBXJSON, DBXJsonReflect, uWebServiceHttp, xmldom, XMLIntf, msxmldom, XMLDoc,
  StrUtils, msxml, System.Types, System.Variants, DBClient, mshtml, ActiveX,
  ComObj, Generics.Collections, LIB, uAcessoSite;

type
  TCliente = class
  private
    FBairro: string;
    FPessoa: string;
    FDataNascimento: TDate;
    FEmail: string;
    FDDD: string;
    FUf: string;
    FCodigo: Integer;
    FNomeReduzido: string;
    FCep: String;
    FCnpjCpf: string;
    FNumero: String;
    FMunicipio: string;
    FRgIe: string;
    FRazaoSocial: string;
    FFornecedor: string;
    FComplemento: string;
    FCodPais: string;
    FHomepage: string;
    FContato: string;
    FNomePais: string;
    FNome: string;
    FDDI: string;
    FEndereco: string;
    FStatusCliente: string;
    FTelefone: string;
    FCelular: string;
    procedure SetBairro(const Value: string);
    procedure SetCelular(const Value: string);
    procedure SetCep(const Value: String);
    procedure SetCnpjCpf(const Value: string);
    procedure SetCodigo(const Value: Integer);
    procedure SetCodPais(const Value: string);
    procedure SetComplemento(const Value: string);
    procedure SetContato(const Value: string);
    procedure SetDataNascimento(const Value: TDate);
    procedure SetDDD(const Value: string);
    procedure SetDDI(const Value: string);
    procedure SetEmail(const Value: string);
    procedure SetEndereco(const Value: string);
    procedure SetFornecedor(const Value: string);
    procedure SetHomepage(const Value: string);
    procedure SetMunicipio(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetNomePais(const Value: string);
    procedure SetNomeReduzido(const Value: string);
    procedure SetNumero(const Value: String);
    procedure SetPessoa(const Value: string);
    procedure SetRazaoSocial(const Value: string);
    procedure SetRgIe(const Value: string);
    procedure SetStatusCliente(const Value: string);
    procedure SetTelefone(const Value: string);
    procedure SetUf(const Value: string);

  public
    property Codigo: Integer read FCodigo write SetCodigo;
    property NomeReduzido: string read FNomeReduzido write SetNomeReduzido;
    property Nome: string read FNome write SetNome;
    property Email: string read FEmail write SetEmail;
    property DataNascimento: TDate read FDataNascimento write SetDataNascimento;
    property Homepage: string read FHomepage write SetHomepage;
    property RazaoSocial: string read FRazaoSocial write SetRazaoSocial;
    property StatusCliente: string read FStatusCliente write SetStatusCliente;
    property Pessoa: string read FPessoa write SetPessoa;
    property CnpjCpf: string read FCnpjCpf write SetCnpjCpf;
    property RgIe: string read FRgIe write SetRgIe;
    property Fornecedor: string read FFornecedor write SetFornecedor;
    property CodPais: string read FCodPais write SetCodPais;
    property NomePais: string read FNomePais write SetNomePais;
    property Uf: string read FUf write SetUf;
    property Endereco: string read FEndereco write SetEndereco;
    property Bairro: string read FBairro write SetBairro;
    property Cep: String read FCep write SetCep;
    property Municipio: string read FMunicipio write SetMunicipio;
    property Telefone: string read FTelefone write SetTelefone;
    property Celular: string read FCelular write SetCelular;
    property Numero: String read FNumero write SetNumero;
    property Complemento: string read FComplemento write SetComplemento;
    property Contato: string read FContato write SetContato;
    property DDD: string read FDDD write SetDDD;
    property DDI: string read FDDI write SetDDI;

    function Add: TCliente;
  end;

  TClientes = class(TAcessoSite)
    private
      FListaDeClientes: TObjectList<TCliente>;
      procedure SetListaDeCliente(const Value: TObjectList<TCliente>);
      function PreencherCustomersCliente(var Cliente: TCliente;
        const psID: string): Boolean;
      function PreencherCountriesCliente(var cliente: TCliente;
        const psID: string): Boolean;
      function PreencherStatesCliente(var cliente: TCliente;
        const psID: string): Boolean;

      function ExportarCustomers(Cliente: TCliente): string;
      function ExportarCountries(Cliente: TCliente): string;
      function ExportarStates(Cliente: TCliente): string;
    public

      Procedure ListarClientes(Id: Integer);
      procedure ExportarClientes();
      procedure AfterConstruction; override;
      procedure BeforeDestruction; override;
      property ListaDeClientes: TObjectList<TCliente> read FListaDeClientes write SetListaDeCliente;
  end;

implementation

{ TCliente }

function TCliente.Add: TCliente;
begin
  result:= TCliente.Create;
end;

procedure TCliente.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TCliente.SetCelular(const Value: string);
begin
  FCelular := Value;
end;

procedure TCliente.SetCep(const Value: String);
begin
  FCep := Value;
end;

procedure TCliente.SetCnpjCpf(const Value: string);
begin
  FCnpjCpf := Value;
end;

procedure TCliente.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TCliente.SetCodPais(const Value: string);
begin
  FCodPais := Value;
end;

procedure TCliente.SetComplemento(const Value: string);
begin
  FComplemento := Value;
end;

procedure TCliente.SetContato(const Value: string);
begin
  FContato := Value;
end;

procedure TCliente.SetDataNascimento(const Value: TDate);
begin
  FDataNascimento := Value;
end;

procedure TCliente.SetDDD(const Value: string);
begin
  FDDD := Value;
end;

procedure TCliente.SetDDI(const Value: string);
begin
  FDDI := Value;
end;

procedure TCliente.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TCliente.SetEndereco(const Value: string);
begin
  FEndereco := Value;
end;

procedure TCliente.SetFornecedor(const Value: string);
begin
  FFornecedor := Value;
end;

procedure TCliente.SetHomepage(const Value: string);
begin
  FHomepage := Value;
end;

procedure TCliente.SetMunicipio(const Value: string);
begin
  FMunicipio := Value;
end;

procedure TCliente.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TCliente.SetNomePais(const Value: string);
begin
  FNomePais := Value;
end;

procedure TCliente.SetNomeReduzido(const Value: string);
begin
  FNomeReduzido := Value;
end;

procedure TCliente.SetNumero(const Value: String);
begin
  FNumero := Value;
end;

procedure TCliente.SetPessoa(const Value: string);
begin
  FPessoa := Value;
end;

procedure TCliente.SetRazaoSocial(const Value: string);
begin
  FRazaoSocial := Value;
end;

procedure TCliente.SetRgIe(const Value: string);
begin
  FRgIe := Value;
end;

procedure TCliente.SetStatusCliente(const Value: string);
begin
  FStatusCliente := Value;
end;

procedure TCliente.SetTelefone(const Value: string);
begin
  FTelefone := Value;
end;

procedure TCliente.SetUf(const Value: string);
begin
  FUf := Value;
end;

{ TClientes }

procedure TClientes.AfterConstruction;
begin
  inherited;
  FListaDeClientes:= TObjectList<TCliente>.Create(nil);
end;

procedure TClientes.BeforeDestruction;
begin
  inherited;
  FreeAndNil( FListaDeClientes );
end;

procedure TClientes.ExportarClientes();
var
  XML: string;
  k,i,j, a: integer;
  Cliente: TCliente;
  FXMLDocument: IXMLDocument;
  aNode, aCNode, aCCNode: IXMLNode;
begin
//  XML:= GetXML(Format('/products?schema=blank&ws_key=%s', [User]));
  XML:= GetSchema('addresses');;
  for k:= 0 to ListaDeClientes.Count -1 do
  begin
    Cliente:= ListaDeClientes.Items[k] as TCliente;
    try
      FXMLDocument:= TXmlDocument.Create(nil);
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
            case AnsiIndexStr(AnsiUpperCase(aCCNode.NodeName),
              ['ID','ID_CUSTOMER','ID_SUPPLIER','ID_COUNTRY','ID_STATE','ADDRESS1',
               'ADDRESS2','POSTCODE','CITY','PHONE','PHONE_MOBILE','NUMEND','COMPL'] ) of
//              0:
//                Cliente.codigo := StrToInt( VarToStrDef( NodeReturnCliente.ChildNodes[j].NodeValue, '0' ));  //ID
              1: aCCNode.NodeValue:= ExportarCustomers(Cliente);
              2: aCCNode.NodeValue:= Cliente.fornecedor;
              3: aCCNode.NodeValue:= ExportarCountries(Cliente);
              4: aCCNode.NodeValue:= ExportarStates(Cliente);
              5: aCCNode.NodeValue:= Cliente.endereco;
              6: aCCNode.NodeValue:= Cliente.Bairro;
              7: aCCNode.NodeValue:= Cliente.Cep;
              8: aCCNode.NodeValue:= Cliente.municipio;
              9: aCCNode.NodeValue:= Cliente.telefone;
              10: aCCNode.NodeValue:= Cliente.celular;
              11: aCCNode.NodeValue:= Cliente.numero;
              12: aCCNode.NodeValue:= Cliente.Complemento;
            end;
          end;
        end;
      end;

      PostXML('addresses', FXMLDocument.XML.Text);
    finally
      FXMLDocument:= nil;
    end;
  end;
end;

function TClientes.ExportarCustomers(Cliente: TCliente): string;
var
  XML: string;
  k,i,j, a: integer;
  FXMLDocument: IXMLDocument;
  aNode, aCNode, aCCNode: IXMLNode;
begin
  XML:= GetSchema('customers');;
  try
    FXMLDocument:= TXmlDocument.Create(nil);
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

          case AnsiIndexStr(AnsiUpperCase(aCCNode.NodeName),
            ['ID','LASTNAME','FIRSTNAME','EMAIL','BIRTHDAY','WEBSITE','COMPANY','ACTIVE','TIPO','CPF_CNPJ','RG_IE']) of
  //          0: Cliente.NomeReduzido := Node.ChildNodes[j].NodeValue; //lastname
            1: aCCNode.NodeValue:= Cliente.Nome;
            2: aCCNode.NodeValue:= Cliente.NomeReduzido;
            3: aCCNode.NodeValue:= Cliente.Email;
            4: aCCNode.NodeValue:= Cliente.DataNascimento;
            5: aCCNode.NodeValue:= Cliente.Homepage;
            6: aCCNode.NodeValue:= Cliente.RazaoSocial;
            7: aCCNode.NodeValue:= Cliente.StatusCliente;
            8: aCCNode.NodeValue:= Cliente.Pessoa;
            9: aCCNode.NodeValue:= Cliente.CnpjCpf;
            10: aCCNode.NodeValue:= Cliente.RgIe;
          end;
        end;
      end;
    end;

    PostXML('customers', FXMLDocument.XML.Text);
  finally
    FXMLDocument:= nil;
  end;
end;

function TClientes.ExportarCountries(Cliente: TCliente): string;
var
  XML: string;
  k,i,j, a: integer;
  FXMLDocument: IXMLDocument;
  aNode, aCNode, aCCNode: IXMLNode;
begin
  XML:= GetSchema('countries');;
  try
    FXMLDocument:= TXmlDocument.Create(nil);
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

          case AnsiIndexStr(AnsiUpperCase(aCCNode.NodeName),
            ['ID','LASTNAME','FIRSTNAME','EMAIL','BIRTHDAY','WEBSITE','COMPANY','ACTIVE','TIPO','CPF_CNPJ','RG_IE']) of
  //          0: Cliente.NomeReduzido := Node.ChildNodes[j].NodeValue; //lastname
            1: aCCNode.NodeValue:= Cliente.Nome;
            2: aCCNode.NodeValue:= Cliente.NomeReduzido;
            3: aCCNode.NodeValue:= Cliente.Email;
            4: aCCNode.NodeValue:= Cliente.DataNascimento;
            5: aCCNode.NodeValue:= Cliente.Homepage;
            6: aCCNode.NodeValue:= Cliente.RazaoSocial;
            7: aCCNode.NodeValue:= Cliente.StatusCliente;
            8: aCCNode.NodeValue:= Cliente.Pessoa;
            9: aCCNode.NodeValue:= Cliente.CnpjCpf;
            10: aCCNode.NodeValue:= Cliente.RgIe;
          end;
        end;
      end;
    end;

    PostXML('countries', FXMLDocument.XML.Text);
  finally
    FXMLDocument:= nil;
  end;
end;

function TClientes.ExportarStates(Cliente: TCliente): string;
var
  XML: string;
  i,j: integer;
  FXMLDocument: IXMLDocument;
  aNode, aCNode, aCCNode: IXMLNode;
begin
//  XML:= GetXML(Format('/products?schema=blank&ws_key=%s', [User]));
  XML:= GetSchema('states');;
  try
    FXMLDocument:= TXmlDocument.Create(nil);
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
            0: aCCNode.NodeValue:= cliente.CodPais;
            1: aCCNode.NodeValue:= cliente.DDI;
            2: aCCNode.NodeValue:= cliente.NomePais;
          end;
        end;
      end;
    end;

    PostXML('states', FXMLDocument.XML.Text);
  finally
    FXMLDocument:= nil;
  end;
end;
procedure TClientes.ListarClientes(Id: Integer);
var
  Cliente: TCliente;
  FXMLAddresses: IXMLDocument;
  NodeAddresses, NodeReturnCliente: IXMLNode;
  i, j: Integer;
  XML, StrAux: string;
begin
  try
    FXMLAddresses:= TXmlDocument.Create(nil);
    XML:= GetXML( Format('addresses/?display=full&filter[id]=[%d]', [Id]));
    FXMLAddresses.LoadFromXML( XML );
    if FXMLAddresses.Active then
    begin
      NodeAddresses:= GetNodeByName(FXMLAddresses.DocumentElement, 'addresses');
      for i := 0 to NodeAddresses.ChildNodes.Count - 1 do
      begin
        Cliente:= Cliente.Add;
        NodeReturnCliente := NodeAddresses.ChildNodes[i];
        for j := 0 to NodeReturnCliente.ChildNodes.Count -1 do
        begin
          case AnsiIndexStr( AnsiUpperCase(NodeReturnCliente.ChildNodes[j].NodeName),
            ['ID','ID_CUSTOMER','ID_SUPPLIER','ID_COUNTRY','ID_STATE','ADDRESS1',
             'ADDRESS2','POSTCODE','CITY','PHONE','PHONE_MOBILE','NUMEND','COMPL'] ) of
            0:
              Cliente.codigo := StrToInt( VarToStrDef( NodeReturnCliente.ChildNodes[j].NodeValue, '0' ));  //ID
            1:
              if not PreencherCustomersCliente( Cliente, NodeReturnCliente.ChildNodes[j].NodeValue) then //ID_CUSTOMER
              begin
                FreeAndNil(Cliente);
                Break;
              end;
            2:
              Cliente.fornecedor := VarToStrDef( NodeReturnCliente.ChildNodes[j].NodeValue, '' );   //ID_SUPPLIER
            3:
              if not PreencherCountriesCliente(Cliente, NodeReturnCliente.ChildNodes[j].NodeValue) then //ID_COUNTRY
              begin
                FreeAndNil(Cliente);
                Break;
              end;

            4:
              if not PreencherStatesCliente(Cliente, NodeReturnCliente.ChildNodes[j].NodeValue) then //ID_STATE
              begin
                FreeAndNil(Cliente);
                Break;
              end;
            5:
              Cliente.endereco := VarToStrDef( NodeReturnCliente.ChildNodes[j].NodeValue, ''); //ADDRESS1
            6:
              Cliente.Bairro := VarToStrDef( NodeReturnCliente.ChildNodes[j].NodeValue, ''); // ADDRESS2
            7:
              Cliente.Cep := Trim( ClearString( VarToStrDef(NodeReturnCliente.ChildNodes[j].NodeValue, '') , '-/.') ); // POSTCODE
            8:
              Cliente.municipio := VarToStrDef( NodeReturnCliente.ChildNodes[j].NodeValue, ''); //CITY
            9:
              begin
                // PHONE
                StrAux:= VarToStrDef(NodeReturnCliente.ChildNodes[j].NodeValue, '');
                if Pos('(', StrAux) > 0 then
                  begin
                    Cliente.DDD:= ClearString( Copy(StrAux, 1, Pos(')', StrAux)), '()');
                    Delete(StrAux, 1, Pos(')', StrAux));
                    Cliente.telefone:= Trim( ClearString( StrAux , '()-/.') );
                  end
                else
                  Cliente.telefone := Trim( ClearString( VarToStrDef(NodeReturnCliente.ChildNodes[j].NodeValue, '') , '()-/.') );
              end;
            10:
              begin
                // PHONE_MOBILE
                StrAux:= VarToStrDef(NodeReturnCliente.ChildNodes[j].NodeValue, '');
                if Pos('(', StrAux) > 0 then
                  begin
                    Delete(StrAux, 1, Pos(')', StrAux));
                    Cliente.celular:= Trim( ClearString( StrAux , '()-/.') );
                  end
                else
                  Cliente.celular := Trim( ClearString( VarToStrDef(NodeReturnCliente.ChildNodes[j].NodeValue, '') , '()-/.') ); // PHONE
              end;
            11:
              Cliente.numero := VarToStrDef( NodeReturnCliente.ChildNodes[j].NodeValue, '');  //NUMEND
            12:
              Cliente.Complemento := VarToStrDef( NodeReturnCliente.ChildNodes[j].NodeValue, ''); //COMPL
          end;
        end;

        if Assigned(Cliente) then
          FListaDeClientes.Add(Cliente);
      end;
    end;
  finally
    FXMLAddresses:= nil;
  end;
end;

function TClientes.PreencherCustomersCliente(var Cliente: TCliente; const psID: string): Boolean;
var
  FXMLCustomers: IXMLDocument;
  NodeCustomer, Node: IXMLNode;
  i, j: Integer;
  XML: string;
begin
  Result:= False;
  try
    FXMLCustomers:= TXmlDocument.Create(nil);
    XML:= GetXML( Format('customers/?display=full&filter[id]=[%s]', [psID]));
    FXMLCustomers.LoadFromXML( XML );
    if FXMLCustomers.Active then
    begin
      NodeCustomer:= GetNodeByName(FXMLCustomers.DocumentElement, 'customers');
      for I := 0 to NodeCustomer.ChildNodes.Count -1 do
      begin
        //Node:= GetNodeByName(NodeCustomer.ChildNodes[i], 'customer');
        Node:= NodeCustomer.ChildNodes[i];
        if VarToStrDef(Node.ChildNodes.FindNode('id').NodeValue, '') = psID then
        begin
          for j := 0 to Node.ChildNodes.Count -1 do
          begin
            case AnsiIndexStr(AnsiUpperCase(Node.ChildNodes[j].NodeName),
              ['LASTNAME','FIRSTNAME','EMAIL','BIRTHDAY','WEBSITE','COMPANY','ACTIVE','TIPO','CPF_CNPJ','RG_IE']) of
    //          0: Cliente.NomeReduzido := Node.ChildNodes[j].NodeValue; //lastname
              1:
                begin
                  Cliente.Nome:= Node.ChildNodes[j].NodeValue + ' ' + Node.ChildNodes.FindNode('lastname').NodeValue ;//firstname
                  Cliente.NomeReduzido:= Node.ChildNodes[j].NodeValue;//firstname
                end;
              2: Cliente.Email := Node.ChildNodes[j].NodeValue;        //email
              3:
                if (VarToStrDef( Node.ChildNodes[j].NodeValue, '') <> EmptyStr)  then
                  Cliente.DataNascimento := StrToDateUSA(Node.ChildNodes[j].NodeValue);  //birthday
              4:
                if (VarToStrDef( Node.ChildNodes[j].NodeValue, '') <> EmptyStr) then
                  Cliente.Homepage := VarToStrDef( Node.ChildNodes[j].NodeValue, '');
              5:
                if (VarToStrDef( Node.ChildNodes[j].NodeValue, '') <> EmptyStr) then
                  Cliente.RazaoSocial := VarToStrDef( Node.ChildNodes[j].NodeValue, '');//company
              6:
                if VarToStrDef( Node.ChildNodes[j].NodeValue, '') = '1' then //active
                  Cliente.StatusCliente:= '0'
                else
                  Cliente.StatusCliente:= '1';

              7: Cliente.Pessoa := AnsiUpperCase( VarToStrDef( Node.ChildNodes[j].NodeValue, '') );         //tipo
              8:
                if (VarToStrDef( Node.ChildNodes[j].NodeValue, '') <> EmptyStr) then //cpf_cnpj
                  Cliente.CnpjCpf:= Trim( ClearString( VarToStrDef(Node.ChildNodes[j].NodeValue, '') , '-/.') );
              9:
                if (VarToStrDef( Node.ChildNodes[j].NodeValue, '') <> EmptyStr) then
                  Cliente.RgIe:= VarToStrDef( Node.ChildNodes[j].NodeValue, '');          //rg_ie
            end;
          end;

          Result:= True;
          Break;
        end;
      end;
    end;
  finally
    FXMLCustomers:= nil;
  end;
end;

function TClientes.PreencherStatesCliente(var cliente: TCliente;const psID: string): Boolean;
var
  FXMLStates: IXMLDocument;
  NodeStates, Node: IXMLNode;
  i, j: Integer;
  XML: string;
begin
  Result:= False;
  try
    FXMLStates:= TXmlDocument.Create(nil);
    XML:= GetXML( Format('states/?display=full&filter[id]=[%s]', [psID]));
    FXMLStates.LoadFromXML( XML );
    if FXMLStates.Active then
    begin
      NodeStates:= GetNodeByName(FXMLStates.DocumentElement, 'states');
      for i := 0 to NodeStates.ChildNodes.Count -1 do
      begin
        //Node:= GetNodeByName(NodeStates.ChildNodes[i], 'state');
        Node:= NodeStates.ChildNodes[i];
        if VarToStrDef(Node.ChildNodes.FindNode('id').NodeValue, '') = psID then
        begin
          for j := 0 to Node.ChildNodes.Count -1 do
          begin
            case AnsiIndexStr(AnsiUpperCase(Node.ChildNodes[j].NodeName),['NAME', 'ISO_CODE']) of
              0: cliente.municipio := VarToStrDef( Node.ChildNodes[j].NodeValue, '');
              1: cliente.Uf := VarToStrDef( Node.ChildNodes[j].NodeValue, '');
            end;
          end;

          Result:= True;
          Break;
        end;
      end;
    end;
  finally
    FXMLStates:= nil;
  end;
end;

function TClientes.PreencherCountriesCliente(var cliente: TCliente; const psID: string): Boolean;
var
  FXMLCountries: IXMLDocument;
  NodeCountries, Node: IXMLNode;
  i, j: Integer;
  lteste: string;
  XML: string;
begin
  Result:= False;
  try
    FXMLCountries:= TXmlDocument.Create(nil);
    XML:= GetXML( Format('countries/?display=full&filter[id]=[%s]', [psID]));
    FXMLCountries.LoadFromXML( XML );
    if FXMLCountries.Active then
    begin
      NodeCountries:= GetNodeByName(FXMLCountries.DocumentElement, 'countries');
      for i := 0 to NodeCountries.ChildNodes.Count -1 do
      begin
        //Node:= GetNodeByName(NodeCountries.ChildNodes[i], 'country');
        Node:= NodeCountries.ChildNodes[i];
        if VarToStrDef(Node.ChildNodes.FindNode('id').NodeValue, '') = psID then
        begin
          for j := 0 to Node.ChildNodes.Count -1 do
          begin
            lteste:= AnsiUpperCase(Node.ChildNodes[j].NodeName);
            case AnsiIndexStr(lteste,['ID','CALL_PREFIX','NAME']) of
              0: cliente.CodPais:= VarToStrDef( Node.ChildNodes[j].NodeValue, '');
              1: cliente.DDI:= VarToStrDef( Node.ChildNodes[j].NodeValue, '');
              2: cliente.NomePais := VarToStrDef( Node.ChildNodes[j].ChildNodes['language'].NodeValue, '');
            end;
          end;

          Result:= True;
          Break;
        end;
      end;
    end;
  finally
    FXMLCountries:= nil;
  end;
end;

procedure TClientes.SetListaDeCliente(const Value: TObjectList<TCliente>);
begin
  FListaDeClientes := Value;
end;

end.
