program GIARN;

uses
  ExceptionLog,
  Forms,
  uGIARN in 'uGIARN.pas' {frmGIARN};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmGIARN, frmGIARN);
  Application.Run;
end.
