program ProjetoMVC;

uses
  Forms,
  uCliente in 'Controller\uCliente.pas',
  uInterfaceBase in 'Controller\uInterfaceBase.pas',
  uCadastroClientes in 'View\uCadastroClientes.pas' {frmCadastroClientes},
  uClienteDAO in 'Controller\uClienteDAO.pas',
  uDMMain in 'Model\uDMMain.pas' {DataModule1: TDataModule},
  BaseLibrary in 'BaseLibrary.pas',
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDAO in 'Controller\uDAO.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
