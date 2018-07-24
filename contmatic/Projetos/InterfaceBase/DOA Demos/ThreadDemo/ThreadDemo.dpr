// Direct Oracle Access - Oracle/Thread demo
// Allround Automations
// support@allroundautomations.nl
// http://www.allroundautomations.nl
//
// This application demonstrates:
// - Using threads to execute queries simultaneous
// - Creating TOracleQuery dynamically

program ThreadDemo;

uses
  Forms,
  ThreadUnit in 'ThreadUnit.pas' {ThreadForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TThreadForm, ThreadForm);
  Application.Run;
end.
