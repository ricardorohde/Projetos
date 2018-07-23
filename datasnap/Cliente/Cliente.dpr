program Cliente;

uses
  Forms,
  Tela_Cadastro in 'Tela_Cadastro.pas' {frmTelaDeCadastro},
  LIB in 'LIB.pas',
  udtmPrincipal in 'udtmPrincipal.pas' {dtmPrincipal: TDataModule},
  uCliente in 'uCliente.pas' {frmCliente};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdtmPrincipal, dtmPrincipal);
  Application.CreateForm(TfrmCliente, frmCliente);
  Application.Run;
end.
