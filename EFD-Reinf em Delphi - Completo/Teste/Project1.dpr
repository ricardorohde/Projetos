program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  BaseLibrary in 'BaseLibrary.pas',
  Int_Reinf in 'Int_Reinf.pas',
  uReinf in 'uReinf.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
