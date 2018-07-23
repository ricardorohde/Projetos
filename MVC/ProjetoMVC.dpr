program ProjetoMVC;

uses
  Forms,
  uCliente in 'Controller\uCliente.pas',
  uInterfaceBase in 'Controller\uInterfaceBase.pas',
  uCadastroClientes in 'View\uCadastroClientes.pas' {frmCadastroClientes},
  uClienteDAO in 'Controller\uClienteDAO.pas',
  uDMMain in 'Model\uDMMain.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCadastroClientes, frmCadastroClientes);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
