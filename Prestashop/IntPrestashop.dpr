program IntPrestashop;

uses
  Forms,
  uPrin in 'uPrin.pas' {frmPrincipal},
  Module in 'Module.pas' {DataModule1: TDataModule},
  Lib in 'Lib.pas',
  uWebServiceHttp in 'AcessoSite\uWebServiceHttp.pas',
  uAcessoSite in 'AcessoSite\uAcessoSite.pas',
  uProduto in '_Classes\uProduto.pas',
  uCliente in '_Classes\uCliente.pas',
  uPedido in '_Classes\uPedido.pas',
  uPedidos in '_Classes\uPedidos.pas',
  uWebServiceREST in 'AcessoSite\uWebServiceREST.pas',
  uClassesPrestashop in '_Classes\uClassesPrestashop.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.ShowMainForm := False;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
