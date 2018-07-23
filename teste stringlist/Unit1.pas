unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure percorrelinha(ALinha : String);

    function AsciiToInt(Caracter: Char): Integer;

    function ReplaceStrNew(aString : string): string;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses StrUtils;

{$R *.dfm}

function TForm1.AsciiToInt(Caracter: Char): Integer;
var
  i: Integer;
begin
  i := 32;
  while i < 255 do begin
    if Chr(i) = Caracter then
      Break;
    i := i + 1;
  end;
  Result := i;
end;

procedure TForm1.Button1Click(Sender: TObject);
var //lStrTeste : TStringList;
//    i : Integer;
    lfhFileHandler : TextFile;
    lLinhaArquivo : String;
begin
//  lStrTeste := TStringList.Create;
//  try
//    lStrTeste.LoadFromFile('C:\Fiscal\sintegra\DG COM INVENTARIO 122012 - Cópia.txt');
//
//    for i := 0 to lStrTeste.Count - 1 do
//      percorrelinha(lStrTeste.Strings[i]);
//
//  finally
//    FreeAndNil(lStrTeste);
//  end;
  //ler o arquivo txt
  AssignFile(lfhFileHandler,'C:\Fiscal\sintegra\DG COM INVENTARIO 122012 - Cópia.txt');

  //inicia o arquivo
  reset(lfhFileHandler);

  //faz um while até o final do arquivo
  while not eof(lfhFileHandler) do
    begin
      ReadLn(lfhFileHandler, lLinhaArquivo);

      //AnsiReverseString()
      showmessage(lLinhaArquivo);

      ReplaceStrNew(lLinhaArquivo);

      //showmessage(StringReplace(lLinhaArquivo,'#0','',[rfIgnoreCase,rfReplaceAll]));
      //showmessage(AnsiReplaceStr(lLinhaArquivo, #0, ''));
      //showmessage(lLinhaArquivo);

      //percorrelinha(lLinhaArquivo);
    end;

end;

procedure TForm1.percorrelinha(ALinha: String);
var i,Caracter : Integer;
    lLinha : string;
begin
  lLinha := StringReplace(ALinha,#0,'',[rfReplaceAll]);
  Caracter := 0;
  for i := 0 to length(lLinha)-1 do
    begin
      if (lLinha[i] <> #0) then
        Caracter := AsciiToInt(lLinha[i])
      else
        ShowMessage('achei');
    end;
end;

function TForm1.ReplaceStrNew(aString: string): string;
var lStrAux : string;
    i : Integer;
begin
  if not (Pos(#0, aString) = 0) then
    exit;

  lStrAux := aString;
  i := 0;

  while aString <> '' do
    begin
      if (lStrAux[i] <> #0) then
        result := result + lStrAux[i];

      Inc(i);
      delete(aString, 1,1);
    end;
end;

end.

