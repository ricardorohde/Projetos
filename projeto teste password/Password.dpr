program Password;

uses
  ExceptionLog,
  Forms,
  uPass in 'uPass.pas' {Form1},
  uTeste in 'uTeste.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
