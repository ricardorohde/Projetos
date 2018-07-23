program Project1Test;
uses
  Forms,
  TestFrameWork,
  GUITestRunner,
  Project1TestCases in 'Project1TestCases.pas',
  uDM in 'uDM.pas' {DM: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  DM:= TDM.Create(nil);
  try
    DM.Database.Open;
    GUITestRunner.RunRegisteredTests;
  finally
    DM.Database.Close;
    DM.Free;
  end;
end.
