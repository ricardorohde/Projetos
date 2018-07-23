program Project1;

uses
  ExceptionLog,
  Forms,
  Unit11 in 'Unit11.pas' {FormExePrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormExePrincipal, FormExePrincipal);
  Application.Run;
end.
