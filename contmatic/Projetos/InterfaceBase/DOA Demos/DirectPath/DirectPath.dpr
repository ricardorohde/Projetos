// Direct Oracle Access - DirectPath demo
// Allround Automations
// support@allroundautomations.nl
// http://www.allroundautomations.nl

program DirectPath;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {MainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
