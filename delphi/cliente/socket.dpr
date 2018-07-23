program socket;

uses
  ExceptionLog,
  Forms,
  usocket in 'usocket.pas' {Form1},
  LIB in 'LIB.pas',
  uCadastroUsuario in 'uCadastroUsuario.pas' {frmCadUsuarios},
  uConfiguracao in 'uConfiguracao.pas' {frmConfiguracao},
  uCriptografia in 'uCriptografia.pas',
  uTabelaAscI in 'uTabelaAscI.pas',
  uUsuarios in 'uUsuarios.pas' {frmUsuarios},
  uEditaUsuario in 'uEditaUsuario.pas' {frmEditarUsuario};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
