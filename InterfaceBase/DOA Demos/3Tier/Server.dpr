// Direct Oracle Access - Server
// Allround Automations
// support@allroundautomations.nl
// http://www.allroundautomations.nl
//
// This application demonstrates:
// - The Server part of a 3 Tier application
// - The use of the TOracleDataSet component in a Server Application

// This is a tray-icon application, it will show up as an icon on the
// bottom right of your screen.
// Click it to display the main form.

program Server;

uses
  Forms,
  ServerUnit in 'ServerUnit.pas' {MainForm},
  Server_TLB in 'Server_TLB.pas',
  ServerDM in 'ServerDM.pas' {ServerDMClass: TRemoteDataModule} {ServerDMClass: CoClass};

{$R *.TLB}

{$R *.RES}

begin
  Application.Initialize;
  // Prevent the MainForm from showing 
  Application.ShowMainForm := False;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
