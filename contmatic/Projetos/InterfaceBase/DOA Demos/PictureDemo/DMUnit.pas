// Direct Oracle Access - PictureDemo
// Allround Automations
// support@allroundautomations.nl
// http://www.allroundautomations.nl
//
// This application demonstrates:
// - The use of a BLOB field in a dataset
// - The use of Data Definition Language (creating & dropping a table)
// - The use of a Data Module for the DOA components

unit DMUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TDM = class(TDataModule)
    OracleSession: TOracleSession;
    OracleLogon: TOracleLogon;
    OracleDataSet: TOracleDataSet;
    DataSource: TDataSource;
    CheckTableQuery: TOracleQuery;
    CreateTableQuery: TOracleQuery;
    NAME: TWideStringField;
    INFO: TWideStringField;
    FILENAME: TWideStringField;
    PICTURE: TBlobField;
    DropTableQuery: TOracleQuery;
    procedure DMCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.DFM}

procedure TDM.DMCreate(Sender: TObject);
begin
  // Show the logon dialog
  OracleLogon.Execute;
  // If not connected then exit
  if OracleSession.Connected then
  try
    // Test if the demotable exists
    CheckTableQuery.Execute;
    if CheckTableQuery.Eof then
    begin
      // If not, ask to create it
      if Application.MessageBox('Create demo table DOA_PICTUREDEMO ?', 'Confirm',
           mb_YESNO + mb_IconQuestion) = IDYES then
        CreateTableQuery.Execute
      else
        OracleSession.Connected := False;
    end;
  except
    on E:EOracleError do ShowMessage(E.Message);
  end;
  // If everything is OK activate the dataset
  if OracleSession.Connected then
    OracleDataSet.Active := True
  else
    Application.Terminate;
end;

end.
