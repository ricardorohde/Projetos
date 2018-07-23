program InterfaceBase;

uses
  Forms,
  Tela_Cadastro in 'Tela_Cadastro.pas' {frmTelaDeCadastro},
  uInterfaceBase in 'uInterfaceBase.pas',
  uOperacoesBasicas in 'uOperacoesBasicas.pas',
  uConexao in 'uConexao.pas',
  uLogin in 'uLogin.pas' {frmLogin};

{$R *.res}

begin
  Application.Initialize;
//  Application.MainForm := False;
  Application.CreateForm(TfrmTelaDeCadastro, frmTelaDeCadastro);
  Application.Run;
end.
