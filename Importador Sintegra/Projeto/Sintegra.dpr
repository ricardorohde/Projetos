program Sintegra;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {Form1},
  uInterfaceBase in 'uInterfaceBase.pas',
  uRegistro10 in 'Registros\uRegistro10.pas',
  uListaInterfaceBase in 'uListaInterfaceBase.pas',
  uRegistro50 in 'Registros\uRegistro50.pas',
  uRegistro51 in 'Registros\uRegistro51.pas',
  uRegistro53 in 'Registros\uRegistro53.pas',
  uRegistro54 in 'Registros\uRegistro54.pas',
  uRegistro55 in 'Registros\uRegistro55.pas',
  uRegistro60M in 'Registros\uRegistro60M.pas',
  uRegistro60A in 'Registros\uRegistro60A.pas',
  uRegistro60I in 'Registros\uRegistro60I.pas',
  uRegistro61 in 'Registros\uRegistro61.pas',
  uRegistro11 in 'Registros\uRegistro11.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
