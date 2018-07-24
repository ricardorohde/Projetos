program ServidorPonto;

uses
  Forms,
  uServidorPonto in 'uServidorPonto.pas' {frmServidorPonto},
  uDM_Conexao in 'uDM_Conexao.pas' {DM_Conexao: TDataModule},
  ServidorPonto_TLB in 'ServidorPonto_TLB.pas',
  uRDM_Funcionario in 'uRDM_Funcionario.pas' {RDM_Funcionario: TRemoteDataModule} {RDM_Funcionario: CoClass},
  uRDM_Empresa in 'uRDM_Empresa.pas' {RDM_Empresa: TRemoteDataModule} {RDM_EMPRESA: CoClass};

{$R *.TLB}

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmServidorPonto, frmServidorPonto);
  Application.CreateForm(TDM_Conexao, DM_Conexao);
  Application.Run;
end.
