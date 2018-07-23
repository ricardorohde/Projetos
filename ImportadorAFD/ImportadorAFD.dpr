program ImportadorAFD;

uses
  Forms,
  uImportadorAFD in 'uImportadorAFD.pas' {frmImportadorAFD};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmImportadorAFD, frmImportadorAFD);
  Application.Run;
end.
