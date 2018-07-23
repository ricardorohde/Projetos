program SamplePivotGrid;

uses
  Forms,
  Main in 'Main.pas' {fmMain},
  BaseForm in 'BaseForm.pas' {fmBase},
  DrillDownDetailForm in 'DrillDownDetailForm.pas' {fmDrilldownDetail};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
