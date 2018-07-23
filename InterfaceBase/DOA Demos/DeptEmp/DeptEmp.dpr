// Direct Oracle Access - DeptEmp
// Allround Automations
// support@allroundautomations.nl
// http://www.allroundautomations.nl
//
// This application demonstrates:
// - The use of Master/Detail datasets
// - Using derived fields in an updateable dataset
// - The use of OnTranslateMessage & EnforceConstraints
// - The use of QBE mode and the TOracleNavigator component

program DeptEmp;

uses
  Forms,
  Main in 'Main.pas' {MainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
