// Direct Oracle Access - PictureDemo
// Allround Automations
// support@allroundautomations.nl
// http://www.allroundautomations.nl
//
// This application demonstrates:
// - The use of a BLOB field in a dataset
// - The use of Data Definition Language (creating & dropping a table)
// - The use of a Data Module for the DOA components

program PictureDemo;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  DMUnit in 'DMUnit.pas' {DM: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
