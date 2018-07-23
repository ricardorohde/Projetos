program Servidor;

uses
  Forms,
  usocket in 'usocket.pas' {frmPrincipal},
  uCriptografia in 'uCriptografia.pas',
  uTabelaAscI in 'uTabelaAscI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
