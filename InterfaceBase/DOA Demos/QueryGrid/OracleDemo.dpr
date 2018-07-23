// Direct Oracle Access - Oracle demo
// Allround Automations
// support@allroundautomations.nl
// http://www.allroundautomations.nl
//
// This application demonstrates:
// - Executing user-defined queries

program OracleDemo;

uses
  Forms,
  OracleDemoUnit in 'OracleDemoUnit.pas' {OracleDemoForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TOracleDemoForm, OracleDemoForm);
  Application.Run;
end.
