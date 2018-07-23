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
  if Titulo = EmptyStr then TituloAux:= 'Informaзгo' else TituloAux:= Titulo;
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
  Valor := StringReplace(Valor, 'В','A', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'в','a', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'К','E', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'к','e', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'О','I', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'о','i', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Ф','O', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'ф','o', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Ы','U', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'ы','u', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Б','A', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'б','a', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Й','E', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'й','e', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Н','I', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'н','i', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'У','O', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'у','o', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Ъ','U', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'ъ','u', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'з','c', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'З','C', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'А','A', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'а','a', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'И','E', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'и','e', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'М','I', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'м','i', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Т','O', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'т','o', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Щ','U', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'щ','u', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Д','A', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'д','a', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Л','E', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'л','e', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'П','I', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'п','i', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Ц','O', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'ц','o', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Ь','U', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'ь','u', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Г','A', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'г','a', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Х','O', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'х','o', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Є','a', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'є','o', [rfReplaceAll]);
  Valor := StringReplace(Valor, '&',' ', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'є','o', [rfReplaceAll]);
  Valor := StringReplace(Valor, CR,' ', [rfReplaceAll]);
  Valor := StringReplace(Valor, LF,' ', [rfReplaceAll]);
  Valor := StringReplace(Valor, CRLF, ' ', [rfReplaceAll]);
  Valor := TrocaCaracterEspecial(valor, True);
  result:= UTF8ToString(Valor);
end;

function TrocaCaracterEspecial(aTexto : string; aLimExt : boolean) : string;
const
  //Lista de caracteres especiais
  xCarEsp: array[1..38] of String = ('б', 'а', 'г', 'в', 'д','Б', 'А', 'Г', 'В', 'Д',
                                     'й', 'и','Й', 'И','н', 'м','Н', 'М',
                                     'у', 'т', 'ц','х', 'ф','У', 'Т', 'Ц', 'Х', 'Ф',
                                     'ъ', 'щ', 'ь','Ъ','Щ', 'Ь','з','З','с','С');
  //Lista de caracteres para troca
  xCarTro: array[1..38] of String = ('a', 'a', 'a', 'a', 'a','A', 'A', 'A', 'A', 'A',
                                     'e', 'e','E', 'E','i', 'i','I', 'I',
                                     'o', 'o', 'o','o', 'o','O', 'O', 'O', 'O', 'O',
                                     'u', 'u', 'u','u','u', 'u','c','C','n', 'N');
  //Lista de Caracteres Extras
  xCarExt: array[1..48] of string = ('<','>','!','@','#','$','%','Ё','&','*',
                                     '(',')','_','+','=','{','}','[',']','?',
                                     ';',':',',','|','*','"','~','^','ґ','`',
                                     'Ё','ж','Ж','ш','Ј','Ш','ѓ','Є','є','ї',
                                     '®','Ѕ','ј','Я','µ','ю','э','Э');
var
  xTexto : string;
  i : Integer;
begin
   xTexto := aTexto;
   for i:=1 to 38 do
     xTexto := StringReplace(xTexto, xCarEsp[i], xCarTro[i], [rfReplaceAll]);
   //De acordo com o parвmetro aLimExt, elimina caracteres extras.
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
