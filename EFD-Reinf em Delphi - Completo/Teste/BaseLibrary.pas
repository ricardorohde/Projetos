unit BaseLibrary;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, Dialogs, IB, IBIntf, IBExternals,
  IBSQLMonitor, IBUtils, MaskUtils;

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

end.
