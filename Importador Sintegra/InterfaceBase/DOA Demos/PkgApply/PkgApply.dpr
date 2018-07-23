// Direct Oracle Access - PkgApply
// Allround Automations
// support@allroundautomations.nl
// http://www.allroundautomations.nl
//
// This application demonstrates:
// - The use of the OnApplyRecord event
// - The use of a cursor variable in a dataset
//
// NOTE: You must run DeptAPI.pck through SQL*Plus before running this demo
// ========================================================================
//

program PkgApply;

uses
  Forms,
  Main in 'Main.pas' {MainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
