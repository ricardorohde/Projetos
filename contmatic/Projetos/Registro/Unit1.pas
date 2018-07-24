unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Registry;

type
  TForm1 = class(TForm)
    edtCaminho: TEdit;
    Label1: TLabel;
    btnLimpar: TButton;
    btnAdicionar: TButton;
    procedure btnLimparClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
  private
    { Private declarations }
   procedure GravarRegistro(xArquivo, xSection, xIdent, xValue: String);

   function LerRegistro(xArquivo, xSection, xIdent: String): String;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.GravarRegistro(xArquivo, xSection, xIdent,
  xValue: String);
var
  ArqReg: TRegIniFile;
begin
  ArqReg := TRegIniFile.Create(xArquivo);

  try
    ArqReg.WriteString(xSection, xIdent, xValue);
  finally
    ArqReg.Free;
  end;
end;

function TForm1.LerRegistro(xArquivo, xSection, xIdent: String): String;
var
  ArqReg: TRegIniFile;
begin
  ArqReg := TRegIniFile.Create(xArquivo);
  try
    Result := ArqReg.ReadString(xSection, xIdent, '');
  finally
    ArqReg.Free;
  end;
end;

procedure TForm1.btnLimparClick(Sender: TObject);
var
  ArqReg: TRegIniFile;
begin
  ArqReg := TRegIniFile.Create('Closed Files');
  try
    ArqReg.EraseSection('HKEY_CURRENT_USER\Software\Borland\Delphi\7.0\Closed Projects');
    ArqReg.EraseSection('HKEY_CURRENT_USER\Software\Borland\Delphi\7.0\Closed Files');
  finally
    ArqReg.Free;
  end;
end;

procedure TForm1.btnAdicionarClick(Sender: TObject);
begin
  if FileExists(edtCaminho.Text) then
    GravarRegistro('Closed Projects', 'HKEY_CURRENT_USER\Software\Borland\Delphi\7.0', 'File_0',
    'SourceModule,'+ QuotedStr(edtCaminho.Text) + ',0,1,1,31,8,0,0');
end;

end.
