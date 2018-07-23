program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  int_ReInf in 'int_ReInf.pas',
  uInterfaceBase in 'uInterfaceBase.pas',
  BaseLibrary in 'BaseLibrary.pas',
  Int_Nfse in 'Int_Nfse.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
