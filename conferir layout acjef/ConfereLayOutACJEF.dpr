program ConfereLayOutACJEF;

uses
  Forms,
  uACJEF in 'uACJEF.pas' {frmLayOutACJEF};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLayOutACJEF, frmLayOutACJEF);
  Application.Run;
end.
