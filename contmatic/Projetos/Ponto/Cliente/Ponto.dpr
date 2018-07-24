program Ponto;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  Tela_Cadastro in 'Tela_Cadastro.pas' {frmTelaDeCadastro},
  LIB in 'LIB.pas',
  uDM_Cadastro_Funcionario in 'uDM_Cadastro_Funcionario.pas' {DM_Cadastro_Funcionario: TDataModule},
  Tela_Cadastro_MasterDetail in 'Tela_Cadastro_MasterDetail.pas' {frmTela_Cadastro_MasterDetail},
  uCadastro_Funcionario in 'uCadastro_Funcionario.pas' {frmCadastro_Funcionario},
  uDM_Cadastro_Empresa in 'uDM_Cadastro_Empresa.pas' {DM_Cadastro_Empresa: TDataModule},
  uCadastro_Empresa in 'uCadastro_Empresa.pas' {frmCadastro_Empresa},
  uPesquisaPadrao in 'uPesquisaPadrao.pas' {frmPesquisaPadrao};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
