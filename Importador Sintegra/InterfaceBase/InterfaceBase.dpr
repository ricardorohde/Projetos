program InterfaceBase;

uses
  Forms,
  Tela_Cadastro in 'Tela_Cadastro.pas' {frmTelaDeCadastro},
  uInterfaceBase in 'uInterfaceBase.pas',
  uOperacoesBasicas in 'uOperacoesBasicas.pas',
  uConexao in 'uConexao.pas',
  uLogin in 'uLogin.pas' {frmLogin},
  DataModule in 'DataModule.pas' {DataModule1: TDataModule},
  LIB in 'LIB.pas',
  uCadastro_Horarios in 'uCadastro_Horarios.pas' {frmCadastro_Horarios},
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  Tela_Cadastro_MasterDetail in 'Tela_Cadastro_MasterDetail.pas' {frmCadastro_MasterDetail};

{$R *.res}

begin
  Application.Initialize;
//  Application.MainForm := False;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
