program GeradorScripHenry;

uses
  Forms,
  uGeraScript in 'uGeraScript.pas' {frmhoraExtra};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmhoraExtra, frmhoraExtra);
  Application.Run;
end.
