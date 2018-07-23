program socket;

uses
  Forms,
  usocket in 'usocket.pas' {Form1},
  LIB in 'LIB.pas',
  uCadastroUsuario in 'uCadastroUsuario.pas' {frmCadUsuarios},
  uConfiguracao in 'uConfiguracao.pas' {frmConfiguracao};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
