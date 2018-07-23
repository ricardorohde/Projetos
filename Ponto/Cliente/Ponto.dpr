program Ponto;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  Tela_Cadastro in 'Tela_Cadastro.pas' {frmTelaDeCadastro},
  LIB in 'LIB.pas',
  uDM_Cadastro_Funcionario in 'uDM_Cadastro_Funcionario.pas' {DM_Cadastro_Funcionario: TDataModule},
  uCadastro_Funcionario in 'uCadastro_Funcionario.pas' {frmCadastro_Funcionario},
  uDM_Cadastro_Empresa in 'uDM_Cadastro_Empresa.pas' {DM_Cadastro_Empresa: TDataModule},
  uCadastro_Empresa in 'uCadastro_Empresa.pas' {frmCadastro_Empresa},
  uPesquisaPadrao in 'uPesquisaPadrao.pas' {frmPesquisaPadrao},
  Tela_Cadastro_MasterDetail in 'Tela_Cadastro_MasterDetail.pas' {frmTela_Cadastro_MasterDetail},
  uCadastro_Horario in 'uCadastro_Horario.pas' {frmCadastro_Horario},
  uDM_Cadastro_Horario in 'uDM_Cadastro_Horario.pas' {DM_Cadastro_Horario: TDataModule},
  uDM_Cadastro_Usuario in 'uDM_Cadastro_Usuario.pas' {DM_Cadastro_Usuario: TDataModule},
  uLogin in 'uLogin.pas' {frmLogin},
  uCadastro_Horario_RepetirHorarios in 'uCadastro_Horario_RepetirHorarios.pas' {frmRepetirHorarios},
  uDM_Cadastro_Feriado in 'uDM_Cadastro_Feriado.pas' {DM_Cadastro_Feriado: TDataModule},
  uCadastro_Feriado in 'uCadastro_Feriado.pas' {frmCadastro_Feriado},
  uDM_Utils in 'uDM_Utils.pas' {DM_Utils: TDataModule},
  uDM_Cadastro_Municipio in 'uDM_Cadastro_Municipio.pas' {DM_Cadastro_Municipio: TDataModule},
  uCadastro_Municipio in 'uCadastro_Municipio.pas' {frmCadastro_Municipio},
  uCadastro_Usuario in 'uCadastro_Usuario.pas' {frmCadastro_Usuario},
  uBuscar_Relatorio in 'uBuscar_Relatorio.pas',
  uDM_Relatorios_Cadastro in 'uDM_Relatorios_Cadastro.pas' {DataModule1: TDataModule},
  uDesenvolvedor_Relatorio in 'uDesenvolvedor_Relatorio.pas' {frmDesenvolvedor_Relatorio};

{$R *.res}

begin
  Application.Initialize;
  frmLogin := TfrmLogin.Create(Application);
  if frmLogin.LogarSistema then
    Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
