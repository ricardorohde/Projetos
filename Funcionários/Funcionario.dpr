program Funcionario;

uses
  ExceptionLog,
  Forms,
  uFucionarios in 'uFucionarios.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
