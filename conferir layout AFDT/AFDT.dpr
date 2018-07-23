program AFDT;

uses
  Forms,
  uAFD in 'uAFD.pas' {frmAFD},
  uAdicionarMov in 'uAdicionarMov.pas' {frmAdicionarMov};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmAFD, frmAFD);
  Application.CreateForm(TfrmAdicionarMov, frmAdicionarMov);
  Application.Run;
end.
