unit uFucionarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Alterdata;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    btnExecute: TButton;
    procedure Button1Click(Sender: TObject);
    procedure btnExecuteClick(Sender: TObject);
  private
    { Private declarations }
    FStringList : TStringList;
    procedure ObterFucionario(pLinha : string);
    function RetirarCaracterTralhaZerodaString(AString: string): string;
    function  RetornaDescricaoReg(var ARetorno: string; ACaracter : string = ' '): string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    Edit1.Text := OpenDialog1.FileName;
end;

procedure TForm1.btnExecuteClick(Sender: TObject);
var //lStringList   : TStringList;
    //i             : Integer;
    lArqText      : TextFile;
    lBreak        : Boolean;
    lLinhaArquivo : string;

    function ReplaceString(pValue : string): string;
    begin
      result := StringReplace(pValue, '-', '', [rfReplaceAll]);
      result := StringReplace(result, '=', '', [rfReplaceAll]);
    end;
begin
  if not FileExists(Edit1.Text) then
    begin
      ShowMessage('File not Exists!!!');
      Edit1.SetFocus;
      Exit;
    end;

  //lStringList := TStringList.Create;
  FStringList := TStringList.Create;
  try
    AssignFile(lArqText,Edit1.Text);
    Reset(lArqText);
    lBreak := False;
    //lStringList.LoadFromFile(Edit1.Text);

    while not lBreak do
      begin
        ReadLn(lArqText,lLinhaArquivo);
        lLinhaArquivo := ReplaceString(RetirarCaracterTralhaZerodaString(lLinhaArquivo));

        ObterFucionario(lLinhaArquivo);

        lBreak := EOF(lArqText) and (Pos(#0, lLinhaArquivo) = 0);
      end;

//    for i := 0 to lStringList.Count - 1 do
//      begin
//        ObterFucionario(lStringList.Strings[i]);
//      end;
  finally
    FStringList.SaveToFile(ExtractFilePath(Edit1.Text) +'\'+ StringReplace(ExtractFileName(Edit1.Text), '.txt','',[rfReplaceAll]) + 'cópia.txt');
//    FreeAndNil(lStringList);
    FreeAndNil(FStringList);
  end;
end;

procedure TForm1.ObterFucionario(pLinha: string);
var lFuncionario : string;
begin
  if (Length(pLinha) <= 30) then
    Exit;

  lFuncionario := Copy(pLinha, Pos(' ',pLinha), Length(pLinha));
  lFuncionario := TrimLeft(TrimRight(lFuncionario));
  FStringList.Add(lFuncionario);
end;

function TForm1.RetirarCaracterTralhaZerodaString(
  AString: string): string;
var lStrAux : string;
    i : Integer;
begin
  result := AString;

  if (Pos(#0, aString) = 0) then
    Exit;

  result := '';

  lStrAux := AString;
  i := 0;
  while not Empty(AString) do
    begin
      if (lStrAux[i] <> #0) then
        result := result + lStrAux[i]
      else if (i > 0) then
        result := result + ' ';

      Inc(i);
      delete(aString, 1,1);
    end;
end;


function TForm1.RetornaDescricaoReg(var ARetorno: string;
  ACaracter: string): string;
var lLinha   : string;
    lPosicao : Integer;
begin
  lLinha    := Trim(ARetorno);
  lPosicao  := pos(ACaracter,lLinha);
  lLinha    := Copy(lLinha,lPosicao + 1,Length(lLinha));

  lPosicao  := pos(ACaracter,lLinha);
  result    := Copy(lLinha,1,lPosicao - 1);

  lLinha    := Copy(lLinha,lPosicao,Length(lLinha));

  ARetorno  := lLinha;
end;

end.

