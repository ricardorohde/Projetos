program Agenda;

uses
  //ExceptionLog,
  Forms,
  uPrin in 'uPrin.pas' {frmAgenda},
  uConexao in 'uConexao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmAgenda, frmAgenda);
  Application.Run;
end.
