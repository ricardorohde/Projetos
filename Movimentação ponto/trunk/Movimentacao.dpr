program Movimentacao;

uses
  ExceptionLog,
  Forms,
  uPrincipal in 'uPrincipal.pas' {frmMovimentacao},
  uRelatorio in 'uRelatorio.pas' {frmRelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMovimentacao, frmMovimentacao);
  Application.Run;
end.
