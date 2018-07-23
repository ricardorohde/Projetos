program Conversor;

uses
  ExceptionLog,
  Forms,
  uPrincipal in 'uPrincipal.pas' {Form1},
  uConexao in 'uConexao.pas',
  uProgress in 'uProgress.pas' {frmProgress};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmProgress, frmProgress);
  Application.Run;
end.
