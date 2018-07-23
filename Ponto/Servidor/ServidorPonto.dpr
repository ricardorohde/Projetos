program ServidorPonto;

uses
  Forms,
  uServidorPonto in 'uServidorPonto.pas' {frmServidorPonto},
  uDM_Conexao in 'uDM_Conexao.pas' {DM_Conexao: TDataModule},
  ServidorPonto_TLB in 'ServidorPonto_TLB.pas',
  uRDM_Funcionario in 'uRDM_Funcionario.pas' {RDM_Funcionario: TRemoteDataModule} {RDM_Funcionario: CoClass},
  uRDM_Empresa in 'uRDM_Empresa.pas' {RDM_Empresa: TRemoteDataModule} {RDM_EMPRESA: CoClass},
  uRDM_Usuario in 'uRDM_Usuario.pas' {RDM_Usuario: TRemoteDataModule} {RDM_Usuario: CoClass},
  uRDM_Horario in 'uRDM_Horario.pas' {RDM_Horario: TRemoteDataModule} {RDM_Horario: CoClass},
  uRDM_Feriado in 'uRDM_Feriado.pas' {RDM_Feriado: TRemoteDataModule} {RDM_Feriado: CoClass},
  uRDM_Utils in 'uRDM_Utils.pas' {RDM_Utils: TRemoteDataModule} {RDM_Utils: CoClass},
  uRDM_Municipio in 'uRDM_Municipio.pas' {RDM_Municipio: TRemoteDataModule} {RDM_Municipio: CoClass};

{$R *.TLB}

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmServidorPonto, frmServidorPonto);
  Application.CreateForm(TDM_Conexao, DM_Conexao);
  Application.Run;
end.
