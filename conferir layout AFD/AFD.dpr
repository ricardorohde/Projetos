program AFD;

uses
  Forms,
  uAFD in 'uAFD.pas' {frmAFD};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmAFD, frmAFD);
  Application.Run;
end.
