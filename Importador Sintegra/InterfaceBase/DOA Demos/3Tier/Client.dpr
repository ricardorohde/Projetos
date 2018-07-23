// Direct Oracle Access - Client
// Allround Automations
// support@allroundautomations.nl
// http://www.allroundautomations.nl
//
// This application demonstrates:
// - The Client part of a 3 Tier application
// - A login procedure
// - A master/detail relation

program Client;

uses
  Forms,
  ClientUnit in 'ClientUnit.pas' {MainForm},
  ReconcileUnit in 'ReconcileUnit.pas' {ReconcileErrorForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
