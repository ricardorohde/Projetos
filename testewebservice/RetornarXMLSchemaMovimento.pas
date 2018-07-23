
{*********************************************************************}
{                                                                     }
{                          XML Data Binding                           }
{                                                                     }
{         Generated on: 28/05/2008 12:58:25                           }
{       Generated from: G:\TEMP\Fred\RetornarXMLSchemaMovimento.xml   }
{   Settings stored in: G:\TEMP\Fred\RetornarXMLSchemaMovimento.xdb   }
{                                                                     }
{*********************************************************************}

unit RetornarXMLSchemaMovimento;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  //IXMLDSMovimentoType = interface;
  IXMLDsMovimentoType = interface;
  IXMLMovimentoType = interface;

{ IXMLDSMovimentoType }

  //IXMLDSMovimentoType = interface(IXMLNodeCollection)
  IXMLDsMovimentoType = interface(IXMLNodeCollection)
    ['{753707E8-FF9C-4A96-B437-3EBBC9514004}']
    { Property Accessors }
    function Get_Xmlns: WideString;
    function Get_Movimento(Index: Integer): IXMLMovimentoType;
    procedure Set_Xmlns(Value: WideString);
    { Methods & Properties }
    function Add: IXMLMovimentoType;
    function Insert(const Index: Integer): IXMLMovimentoType;
    property Xmlns: WideString read Get_Xmlns write Set_Xmlns;
    property Movimento[Index: Integer]: IXMLMovimentoType read Get_Movimento; default;
  end;

{ IXMLMovimentoType }

  IXMLMovimentoType = interface(IXMLNode)
    ['{AD718306-0A13-4C9C-BC5E-B0F8DA009E09}']
    { Property Accessors }
    function Get_ID: WideString;
    function Get_GestorID: WideString;
    function Get_FuncionarioID: WideString;
    function Get_DtHrMovimentacao: WideString;
    function Get_IdEmpresaExterno: Integer;
    function Get_IdFuncionarioExterno: WideString;
    function Get_TerminaldeMarcacao: WideString;
    function Get_TpPessoa: WideString;
    procedure Set_ID(Value: WideString);
    procedure Set_GestorID(Value: WideString);
    procedure Set_FuncionarioID(Value: WideString);
    procedure Set_DtHrMovimentacao(Value: WideString);
    procedure Set_IdEmpresaExterno(Value: Integer);
    procedure Set_IdFuncionarioExterno(Value: WideString);
    procedure Set_TerminaldeMarcacao(Value: WideString);
    procedure Set_TpPessoa(Value: WideString);
    { Methods & Properties }
    property ID: WideString read Get_ID write Set_ID;
    property GestorID: WideString read Get_GestorID write Set_GestorID;
    property FuncionarioID: WideString read Get_FuncionarioID write Set_FuncionarioID;
    property DtHrMovimentacao: WideString read Get_DtHrMovimentacao write Set_DtHrMovimentacao;
    property IdEmpresaExterno: Integer read Get_IdEmpresaExterno write Set_IdEmpresaExterno;
    property IdFuncionarioExterno: WideString read Get_IdFuncionarioExterno write Set_IdFuncionarioExterno;
    property TerminaldeMarcacao: WideString read Get_TerminaldeMarcacao write Set_TerminaldeMarcacao;
    property TpPessoa: WideString read Get_TpPessoa write Set_TpPessoa;
  end;

{ Forward Decls }

  //TXMLDSMovimentoType = class;
  TXMLDsMovimentoType = class;
  TXMLMovimentoType = class;

{ TXMLDSMovimentoType }

  //TXMLDSMovimentoType = class(TXMLNodeCollection, IXMLDSMovimentoType)
  TXMLDsMovimentoType = class(TXMLNodeCollection, IXMLDsMovimentoType)
  protected
    { IXMLDSMovimentoType }
    function Get_Xmlns: WideString;
    function Get_Movimento(Index: Integer): IXMLMovimentoType;
    procedure Set_Xmlns(Value: WideString);
    function Add: IXMLMovimentoType;
    function Insert(const Index: Integer): IXMLMovimentoType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLMovimentoType }

  TXMLMovimentoType = class(TXMLNode, IXMLMovimentoType)
  protected
    { IXMLMovimentoType }
    function Get_ID: WideString;
    function Get_GestorID: WideString;
    function Get_FuncionarioID: WideString;
    function Get_DtHrMovimentacao: WideString;
    function Get_IdEmpresaExterno: Integer;
    function Get_IdFuncionarioExterno: WideString;
    function Get_TerminaldeMarcacao: WideString;
    function Get_TpPessoa: WideString;
    procedure Set_ID(Value: WideString);
    procedure Set_GestorID(Value: WideString);
    procedure Set_FuncionarioID(Value: WideString);
    procedure Set_DtHrMovimentacao(Value: WideString);
    procedure Set_IdEmpresaExterno(Value: Integer);
    procedure Set_IdFuncionarioExterno(Value: WideString);
    procedure Set_TerminaldeMarcacao(Value: WideString);
    procedure Set_TpPessoa(Value: WideString);
  end;

{ Global Functions }

//function GetDSMovimento(Doc: IXMLDocument): IXMLDSMovimentoType;
function GetDsMovimento(Doc: IXMLDocument): IXMLDsMovimentoType;
//function LoadDSMovimento(const FileName: WideString): IXMLDSMovimentoType;
function LoadDsMovimento(const FileName: WideString): IXMLDsMovimentoType;
//function NewDSMovimento: IXMLDSMovimentoType;
function NewDsMovimento: IXMLDsMovimentoType;

const
  TargetNamespace = 'http://tempuri.org/DsMovimento.xsd';
  //TargetNamespace = 'http://tempuri.org/DSMovimento.xsd';

implementation

{ Global Functions }

//function GetDSMovimento(Doc: IXMLDocument): IXMLDSMovimentoType;
function GetDsMovimento(Doc: IXMLDocument): IXMLDsMovimentoType;
begin
//  Result := Doc.GetDocBinding('DSMovimento', TXMLDSMovimentoType, TargetNamespace) as IXMLDSMovimentoType;
  Result := Doc.GetDocBinding('DsMovimento', TXMLDsMovimentoType, TargetNamespace) as IXMLDsMovimentoType;
end;

//function LoadDSMovimento(const FileName: WideString): IXMLDSMovimentoType;
function LoadDsMovimento(const FileName: WideString): IXMLDsMovimentoType;
begin
//  Result := LoadXMLDocument(FileName).GetDocBinding('DSMovimento', TXMLDSMovimentoType, TargetNamespace) as IXMLDSMovimentoType;
  Result := LoadXMLDocument(FileName).GetDocBinding('DsMovimento', TXMLDsMovimentoType, TargetNamespace) as IXMLDsMovimentoType;
end;

//function NewDSMovimento: IXMLDSMovimentoType;
function NewDsMovimento: IXMLDsMovimentoType;
begin
//  Result := NewXMLDocument.GetDocBinding('DSMovimento', TXMLDSMovimentoType, TargetNamespace) as IXMLDSMovimentoType;
  Result := NewXMLDocument.GetDocBinding('DsMovimento', TXMLDsMovimentoType, TargetNamespace) as IXMLDsMovimentoType;
end;

{ TXMLDSMovimentoType }

//procedure TXMLDSMovimentoType.AfterConstruction;
procedure TXMLDsMovimentoType.AfterConstruction;
begin
  RegisterChildNode('Movimento', TXMLMovimentoType);
  ItemTag := 'Movimento';
  ItemInterface := IXMLMovimentoType;
  inherited;
end;

//function TXMLDSMovimentoType.Get_Xmlns: WideString;
function TXMLDsMovimentoType.Get_Xmlns: WideString;
begin
  Result := AttributeNodes['xmlns'].Text;
end;

//procedure TXMLDSMovimentoType.Set_Xmlns(Value: WideString);
procedure TXMLDsMovimentoType.Set_Xmlns(Value: WideString);
begin
  SetAttribute('xmlns', Value);
end;

//function TXMLDSMovimentoType.Get_Movimento(Index: Integer): IXMLMovimentoType;
function TXMLDsMovimentoType.Get_Movimento(Index: Integer): IXMLMovimentoType;
begin
  Result := List[Index] as IXMLMovimentoType;
end;

//function TXMLDSMovimentoType.Add: IXMLMovimentoType;
function TXMLDsMovimentoType.Add: IXMLMovimentoType;
begin
  Result := AddItem(-1) as IXMLMovimentoType;
end;

//function TXMLDSMovimentoType.Insert(const Index: Integer): IXMLMovimentoType;
function TXMLDsMovimentoType.Insert(const Index: Integer): IXMLMovimentoType;
begin
  Result := AddItem(Index) as IXMLMovimentoType;
end;

{ TXMLMovimentoType }

function TXMLMovimentoType.Get_ID: WideString;
begin
  Result := ChildNodes['ID'].Text;
end;

procedure TXMLMovimentoType.Set_ID(Value: WideString);
begin
  ChildNodes['ID'].NodeValue := Value;
end;

function TXMLMovimentoType.Get_GestorID: WideString;
begin
  Result := ChildNodes['GestorID'].Text;
end;

procedure TXMLMovimentoType.Set_GestorID(Value: WideString);
begin
  ChildNodes['GestorID'].NodeValue := Value;
end;

function TXMLMovimentoType.Get_FuncionarioID: WideString;
begin
  Result := ChildNodes['FuncionarioID'].Text;
end;

procedure TXMLMovimentoType.Set_FuncionarioID(Value: WideString);
begin
  ChildNodes['FuncionarioID'].NodeValue := Value;
end;

function TXMLMovimentoType.Get_DtHrMovimentacao: WideString;
begin
  Result := ChildNodes['DtHrMovimentacao'].Text;
end;

procedure TXMLMovimentoType.Set_DtHrMovimentacao(Value: WideString);
begin
  ChildNodes['DtHrMovimentacao'].NodeValue := Value;
end;

function TXMLMovimentoType.Get_IdEmpresaExterno: Integer;
begin
  Result := ChildNodes['IdEmpresaExterno'].NodeValue;
end;

procedure TXMLMovimentoType.Set_IdEmpresaExterno(Value: Integer);
begin
  ChildNodes['IdEmpresaExterno'].NodeValue := Value;
end;

function TXMLMovimentoType.Get_IdFuncionarioExterno: WideString;
begin
  Result := ChildNodes['IdFuncionarioExterno'].NodeValue;
end;

procedure TXMLMovimentoType.Set_IdFuncionarioExterno(Value: WideString);
begin
  ChildNodes['IdFuncionarioExterno'].NodeValue := Value;
end;

function TXMLMovimentoType.Get_TerminaldeMarcacao: WideString;
begin
  Result := ChildNodes['TerminaldeMarcacao'].Text;
end;

procedure TXMLMovimentoType.Set_TerminaldeMarcacao(Value: WideString);
begin
  ChildNodes['TerminaldeMarcacao'].NodeValue := Value;
end;

function TXMLMovimentoType.Get_TpPessoa: WideString;
begin
  Result := ChildNodes['TpPessoa'].Text;
end;

procedure TXMLMovimentoType.Set_TpPessoa(Value: WideString);
begin
  ChildNodes['TpPessoa'].NodeValue := Value;
end;

end.