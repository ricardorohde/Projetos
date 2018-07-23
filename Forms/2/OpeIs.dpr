program OpeIs;

uses
  Forms,
  UFrmOpeIs in 'UFrmOpeIs.pas' {FrmOpeIs};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFrmOpeIs, FrmOpeIs);
  Application.Run;
end.
