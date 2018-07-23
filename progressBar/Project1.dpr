program Project1;

uses
  Forms,
  Principal in 'Principal.pas' {frmPrincipal},
  ThreadProgressbar in 'ThreadProgressbar.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
