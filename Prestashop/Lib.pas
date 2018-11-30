unit Lib;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, Dialogs,
  MaskUtils, StrUtils, xmldom, XMLIntf, msxmldom, XMLDoc, msxml,
  Variants;

  function Confirma(const Mensagem: string; const Titulo: string = ''): Boolean;
  function Aviso(const Mensagem: string; const Titulo: string = ''): Boolean;
  function Alerta(const Mensagem: string; const Titulo: string = ''): Boolean;
  function Informacao(const Mensagem: string; const Titulo: string = ''): Boolean;
  function Erro(const Mensagem: string; const Titulo: string = ''): Boolean;
  function LimpaString(Str, Texto: string): string;
  Function RetirarAcento(Valor : String):String;
  function FormataCPF_CNPJ(const Value: string): string;
  function TrocaCaracterEspecial(aTexto : string; aLimExt : boolean) : string;
  function  RetornarTempDir() : String;//Pega o diretorio da Pasta Temporaria
  function OpcaoDesenvolvedor():Boolean;
  function FloatToString(Valor: Extended): string;overload;
  function FloatToString(Valor: string): string;overload;
  function ClearString(const Value, SubStr: string): string;
  function ExisteId(const Node:IXmlNode;const pID, pNodeName: string): Boolean;
  function GetNodeByName(const node: IXMLNode; NodeSearch: string): IXMLNode;
  function GetUltimoID(const Tabela: string):Integer;
  function IsNumber(Value: string): Boolean;
  function StrToFloatEsp(Value: string): Double;
  Function IsDate(stDate : String) : Boolean;
  function StrToDateUSA(Value: string): TDateTime;

  const CR = #13;
  const LF = #10;
  const CRLF = #13#10;
implementation

function Confirma(const Mensagem: string; const Titulo: string = ''): Boolean;
var
  TituloAux: string;
begin
  if Titulo = EmptyStr then TituloAux:= 'Confirma' else TituloAux:= Titulo;
  result:= Application.MessageBox(PWideChar(Mensagem), PWideChar(TituloAux), MB_YESNO + MB_ICONQUESTION)=IDYES;
end;

function RetornarTempDir() : String;
var DiretorioTemp : PChar;
    TempBuffer    : Dword;
begin
  TempBuffer := 255;
  GetMem(DiretorioTemp,255);
  try
    GetTempPath(tempbuffer,diretoriotemp);
    result := DiretorioTemp;
  finally
    FreeMem(diretoriotemp);
  end;
end;

function Aviso(const Mensagem: string; const Titulo: string = ''): Boolean;
var
  TituloAux: string;
begin
  if Titulo = EmptyStr then TituloAux:= 'Aviso' else TituloAux:= Titulo;
  result:= Application.MessageBox(PWideChar(Mensagem), PWideChar(TituloAux), MB_OK + MB_ICONWARNING)=IDOK;
end;

function Alerta(const Mensagem: string; const Titulo: string = ''): Boolean;
var
  TituloAux: string;
begin
  if Titulo = EmptyStr then TituloAux:= 'Aviso' else TituloAux:= Titulo;
  result:= Application.MessageBox(PWideChar(Mensagem), PWideChar(TituloAux), MB_OK + MB_ICONEXCLAMATION)=IDOK;
end;

function Informacao(const Mensagem: string; const Titulo: string = ''): Boolean;
var
  TituloAux: string;
begin
  if Titulo = EmptyStr then TituloAux:= 'Informa��o' else TituloAux:= Titulo;
  result:= Application.MessageBox(PWideChar(Mensagem), PWideChar(TituloAux), MB_OK + MB_ICONINFORMATION)=IDOK;
end;

function Erro(const Mensagem: string; const Titulo: string = ''): Boolean;
var
  TituloAux: string;
begin
  if Titulo = EmptyStr then TituloAux:= 'Erro' else TituloAux:= Titulo;
  result:= Application.MessageBox(PWideChar(Mensagem), PWideChar(TituloAux), MB_OK + MB_ICONERROR)=IDOK;
end;
function LimpaString(Str, Texto: string): string;
var
  i: integer;
begin
  Result := '';
  if Texto = '' then
    exit;
  for i := 1 to Length(Texto) do
    if Pos(Texto[i], Str)=0 then
      Result := Result + Texto[i];
end;

Function RetirarAcento(Valor : String):String;
begin
  Valor := StringReplace(Valor, '�','A', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','a', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','E', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','e', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','I', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','i', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','O', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','o', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','U', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','u', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','A', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','a', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','E', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','e', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','I', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','i', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','O', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','o', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','U', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','u', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','c', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','C', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','A', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','a', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','E', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','e', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','I', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','i', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','O', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','o', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','U', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','u', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','A', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','a', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','E', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','e', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','I', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','i', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','O', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','o', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','U', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','u', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','A', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','a', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','O', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','o', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','a', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','o', [rfReplaceAll]);
  Valor := StringReplace(Valor, '&',' ', [rfReplaceAll]);
  Valor := StringReplace(Valor, '�','o', [rfReplaceAll]);
  Valor := StringReplace(Valor, CR,' ', [rfReplaceAll]);
  Valor := StringReplace(Valor, LF,' ', [rfReplaceAll]);
  Valor := StringReplace(Valor, CRLF, ' ', [rfReplaceAll]);
  Valor := TrocaCaracterEspecial(valor, True);
  result:= UTF8ToString(Valor);
end;

function TrocaCaracterEspecial(aTexto : string; aLimExt : boolean) : string;
const
  //Lista de caracteres especiais
  xCarEsp: array[1..38] of String = ('�', '�', '�', '�', '�','�', '�', '�', '�', '�',
                                     '�', '�','�', '�','�', '�','�', '�',
                                     '�', '�', '�','�', '�','�', '�', '�', '�', '�',
                                     '�', '�', '�','�','�', '�','�','�','�','�');
  //Lista de caracteres para troca
  xCarTro: array[1..38] of String = ('a', 'a', 'a', 'a', 'a','A', 'A', 'A', 'A', 'A',
                                     'e', 'e','E', 'E','i', 'i','I', 'I',
                                     'o', 'o', 'o','o', 'o','O', 'O', 'O', 'O', 'O',
                                     'u', 'u', 'u','u','u', 'u','c','C','n', 'N');
  //Lista de Caracteres Extras
  xCarExt: array[1..48] of string = ('<','>','!','@','#','$','%','�','&','*',
                                     '(',')','_','+','=','{','}','[',']','?',
                                     ';',':',',','|','*','"','~','^','�','`',
                                     '�','�','�','�','�','�','�','�','�','�',
                                     '�','�','�','�','�','�','�','�');
var
  xTexto : string;
  i : Integer;
begin
   xTexto := aTexto;
   for i:=1 to 38 do
     xTexto := StringReplace(xTexto, xCarEsp[i], xCarTro[i], [rfReplaceAll]);
   //De acordo com o par�metro aLimExt, elimina caracteres extras.
   if (aLimExt) then
     for i:=1 to 48 do
       xTexto := StringReplace(xTexto, xCarExt[i], '', [rfReplaceAll]);
   Result := xTexto;
end;

function FormataCPF_CNPJ(const Value: string): string;
var
  i: Integer;
  lStrAux: string;
begin
  lStrAux:= '';
  for i := 1 to Length(Value) do
    if (Value[i] in ['1','2','3','4','5','6','7','8','9','0']) then
      lStrAux := lStrAux+Value[i];

  if Length(lStrAux)> 11 then
    result:= FormatMaskText('99.999.999/9999-99;0', lStrAux)
  else
    result:= FormatMaskText('999.999.999-99;0', lStrAux);
end;

function OpcaoDesenvolvedor():Boolean;
begin
  result:= Pos('developper', LowerCase(ParamStr(1))) > 0;
end;

function FloatToString(Valor: Extended): string;
begin
  try
//    Result:= '0';
    Result:= ReplaceStr( FormatFloat('#0.00', Valor), ',', '.');
//    Result:= StringReplace( Result, '0', '', [rfReplaceAll]);
  except
    Result:= '';
  end;
end;

function FloatToString(Valor: string): string;
begin
  try
    Result:= ReplaceStr( Valor, ',', '.');
    Result:= ReplaceStr( Result, '.00', '');
  except
    Result:= '';
  end;
end;

function ClearString(const Value, SubStr: string): string;
var
  i: Integer;
begin
  Result:= Value;

  for I := 1 to Length(SubStr) do
  begin
    Result:= StringReplace(Result, SubStr[i], '', [rfReplaceAll]);
  end;
end;

function ExisteId(const Node:IXMLNode;const pID, pNodeName: string): Boolean;
var
  i: Integer;
  lNode: IXMLNode;
begin
  result:= False;
  lNode:= GetNodeByName(Node, pNodeName);
  for i := 0 to lNode.ChildNodes.Count -1 do
    if pID = VarToStrDef(lNode.ChildNodes[i].Attributes['id'], '') then
    begin
      Result:= True;
      Break;
    end;
end;

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

function GetUltimoID(const Tabela: string):Integer;
var
  XML: IXMLDocument;
  Node: IXMLNode;
begin
//  XML:= TXMLDocument.Create(nil);
//  try
//    XML.LoadFromXML( GetXML( Format('%s/?display=[id]&limit=1,1&sort=[id_desc]', [Tabela]) ) );
//
//    Node:= GetNodeByName( XML.DocumentElement, 'ID' );
//
//    Result:= StrToInt( VarToStrDef(Node.NodeValue, '0') );
//  except on e: exception do
//    raise Exception.Create('Erro: '+ e.Message);
//  end;
end;

function IsNumber(Value: string): Boolean;
begin
  result:= StrToFloatDef(Value, -1) <> -1;
end;

function StrToFloatEsp(Value: string): Double;
begin
  result:= StrToFloat(StringReplace(Value, '.', ',', [rfReplaceAll]));
end;

Function IsDate(stDate : String) : Boolean;
Var
  dtValue : TDateTime;
begin
  try
    dtValue := StrToDateTime(stDate);
    IsDate := True;
  except
    IsDate := False;
  end;
end;

function StrToDateUSA(Value: string): TDateTime;
var
  lsdata : string;
begin
  result:= 0;
  lsdata := copy(Value,9,2)+'/'+copy(Value, 6,2)+'/'+ copy(Value, 1,4);
  if IsDate(lsdata) then
    result:= StrToDate(lsdata);
end;
end.
