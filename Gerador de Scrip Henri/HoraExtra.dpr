program HoraExtra;

uses
  Forms,
  uHoraExtra in 'uHoraExtra.pas' {frmhoraExtra};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmhoraExtra, frmhoraExtra);
  Application.Run;
end.
