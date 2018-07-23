// Direct Oracle Access - ObjectGrid
// Allround Automations
// support@allroundautomations.nl
// http://www.allroundautomations.nl
//
// This application demonstrates:
// - Manipulation of persistent objects

unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, StdCtrls, Grids, Buttons, ComCtrls, ExtCtrls, Variants;

type
  TMainForm = class(TForm)
    Grid: TStringGrid;
    MainSession: TOracleSession;
    Query: TOracleQuery;
    BottomPanel: TPanel;
    DropBtn: TButton;
    RefreshBtn: TSpeedButton;
    CommitBtn: TSpeedButton;
    AddBtn: TSpeedButton;
    DeleteBtn: TSpeedButton;
    MainLogon: TOracleLogon;
    procedure DropBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridSelectCell(Sender: TObject; Col, Row: Integer;
      var CanSelect: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure CommitBtnClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
  public
    Moving: Boolean;
    ObjectList: TList;
    DeletedList: TList;
    procedure ExecuteSQL(const SQLText: string);
    function  CreateObjects: Boolean;
    procedure DropObjects;
    procedure GotoCell(Col, Row: Integer);
    function  ColAttrName(Col: Integer): string;
    procedure FreeObjects;
    procedure QueryObjects;
    function  CellToAttribute: Boolean;
  end;

var
  MainForm: TMainForm;

implementation

uses OracleCI;  // Contains OCI80 boolean

{$R *.DFM}

// Execute a SQL command
procedure TMainForm.ExecuteSQL(const SQLText: string);
var Q: TOracleQuery;
begin
  Q := TOracleQuery.Create(nil);
  try
    Q.Session  := MainSession;
    Q.Cursor   := crSQLWait;
    Q.SQL.Text := SQLText;
    Q.Execute;
  finally
    Q.Free;
  end;
end;

// Create objects for demo
function TMainForm.CreateObjects: Boolean;
begin
  // Ask if objects are to be created
  if MessageDlg('Create demo objects?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Result := False
  else begin
    Result := True;
    // Create the address object
    ExecuteSQL('create type TDemoAddress as object( ' +
               '  Street varchar2(30), ' +
               '  City   varchar2(30), ' +
               '  State  varchar2(2), ' +
               '  Zip    number(5)) ');
    // Create the person object
    ExecuteSQL('create type TDemoPerson as object( ' +
               '  Name      varchar2(30), ' +
               '  Birthday  date, ' +
               '  Address   TDemoAddress, ' +
               '  member function Age return integer, ' +
               '  pragma restrict_references(Age, rnps, wnds)) ');
    // Create the person object body with method 'Age'
    ExecuteSQL('create type body TDemoPerson is ' +
               '  member function Age return integer is ' +
               '  begin ' +
               '    return(floor(months_between(Sysdate, Birthday) / 12)); ' +
               '  end; ' +
               'end; ');
    // Create the table
    ExecuteSQL('create table DemoPersons of TDemoPerson');
    // Create two initial object instances
    ExecuteSQL('insert into DemoPersons values( ' +
               '''John Smith'', to_date(''01/12/1954'', ''dd/mm/yyyy''), ' +
               'TDemoAddress(''17 Centennial Drive'', ''Peabody'', ''MA'', 17554))');
    ExecuteSQL('insert into DemoPersons values( ' +
               '''David Jones'', to_date(''17/08/1961'', ''dd/mm/yyyy''), ' +
               'TDemoAddress(''67 Stewart Drive'', ''Willowbrook'', ''IL'', 61773))');
    // Commit it
    MainSession.Commit;
  end;
end;

// Drop objects for demo
procedure TMainForm.DropObjects;
begin
  // Drop the table
  ExecuteSQL('drop table DemoPersons');
  // Drop the person object
  ExecuteSQL('drop type TDemoPerson');
  // Drop the address object
  ExecuteSQL('drop type TDemoAddress');
end;

// Go to a cell in the grid
procedure TMainForm.GotoCell(Col, Row: Integer);
begin
  Moving := True;
  Grid.Row := Row;
  Grid.Col := Col;
  Moving := False;
end;

// Return the attribute name of a column of the grid
function TMainForm.ColAttrName(Col: Integer): string;
begin
  case Col of
    0: Result := 'Name';
    1: Result := 'Birthday';
    2: Result := 'Address.Street';
    3: Result := 'Address.City';
    4: Result := 'Address.State';
    5: Result := 'Address.Zip';
    6: Result := 'Age';
  else
    Result := 'Unknown';
  end;
end;

// Free all objects on the list
procedure TMainForm.FreeObjects;
var i: Integer;
begin
  for i := 0 to ObjectList.Count - 1 do
    TOracleObject(ObjectList.Items[i]).Free;
  ObjectList.Clear;
  for i := 0 to DeletedList.Count - 1 do
    TOracleObject(DeletedList.Items[i]).Free;
  DeletedList.Clear;
end;

// Query the objects and place them in the grid
procedure TMainForm.QueryObjects;
var Person: TOracleObject;
    Row: Integer;
begin
  GotoCell(0, 1);
  FreeObjects;
  try
    Query.Execute;
  except on E: EOracleError do
    begin
      if E.ErrorCode = 00942 then
        if CreateObjects then Query.Execute else Exit;
    end;
  end;
  Row := 1;
  while not Query.Eof do
  begin
    Person := Query.RefField('Person').Pin(poRecent, plNone);
    Grid.Cells[0, Row] := Person.GetAttr('Name');
    Grid.Cells[1, Row] := Person.GetAttr('Birthday');
    Grid.Cells[2, Row] := Person.GetAttr('Address.Street');
    Grid.Cells[3, Row] := Person.GetAttr('Address.City');
    Grid.Cells[4, Row] := Person.GetAttr('Address.State');
    Grid.Cells[5, Row] := Person.GetAttr('Address.Zip');
    Grid.Cells[6, Row] := Person.CallMethod('Age', parNone);
    Grid.Cells[7, Row] := '';
    ObjectList.Add(Person);
    Query.Next;
    Inc(Row);
  end;
  Grid.RowCount := Row;
end;

// Copy the value of the current cell to the object attribute
function TMainForm.CellToAttribute: Boolean;
var Person: TOracleObject;
    AttrName: string;
    AttrValue: Variant;
begin
  Result := True;
  if Moving then Exit;
  // Get the person object
  Person := ObjectList.Items[Grid.Row - 1];
  // Determine the attribute name and value of this cell
  AttrName  := ColAttrName(Grid.Col);
  AttrValue := Grid.Cells[Grid.Col, Grid.Row];
  if AttrValue = '' then AttrValue := Null;
  try
    // Try to set the attribute
    Person.SetAttr(AttrName, AttrValue);
    // If the birthday changes, recalculate the age
    if AttrName = 'Birthday' then
      Grid.Cells[6, Grid.Row] := Person.CallMethod('Age', parNone);
  except on E: Exception do
    begin
      Result := False;
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TMainForm.DropBtnClick(Sender: TObject);
begin
  DropObjects;
end;

procedure TMainForm.RefreshBtnClick(Sender: TObject);
begin
  MainSession.Rollback;
  QueryObjects;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  ObjectList  := TList.Create;
  DeletedList := TList.Create;
  MainLogon.Execute;
  if not MainSession.Connected then
    Application.Terminate
  else begin
    if not OCI80 then
    begin
      ShowMessage('This demo requires Net8, which is not detected on this PC.');
      Application.Terminate;
    end else begin
      Moving := False;
      with Grid do
      begin
        Cells[0, 0] := 'Name';
        ColWidths[0] := 150;
        Cells[1, 0] := 'Birthday';
        ColWidths[1] := 80;
        Cells[2, 0] := 'Street';
        ColWidths[2] := 150;
        Cells[3, 0] := 'City';
        ColWidths[3] := 150;
        Cells[4, 0] := 'State';
        ColWidths[4] := 40;
        Cells[5, 0] := 'Zip';
        ColWidths[5] := 40;
        Cells[6, 0] := 'Age';
        ColWidths[6] := 40;
      end;
      QueryObjects;
    end;
  end;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  FreeObjects;
  ObjectList.Free;
  DeletedList.Free;
end;

procedure TMainForm.GridSelectCell(Sender: TObject; Col, Row: Integer; var CanSelect: Boolean);
begin
  if Col = 6 then CanSelect := False else CanSelect := CellToAttribute;
end;

procedure TMainForm.CommitBtnClick(Sender: TObject);
var i: Integer;
begin
  if CellToAttribute then
  begin
    // Committing will flush all new, modified and deleted objects
    MainSession.Commit;
    // After this, the Deleted objects can be freed
    for i := 0 to DeletedList.Count - 1 do
      TOracleObject(DeletedList.Items[i]).Free;
    DeletedList.Clear;
    // Mark all objects inserted
    Grid.Cols[7].Clear;
  end;
end;

procedure TMainForm.AddBtnClick(Sender: TObject);
var Person: TOracleObject;
begin
  if CellToAttribute then
  begin
    // Add a row at the end of the grid
    Grid.RowCount := Grid.RowCount + 1;
    GotoCell(0, Grid.RowCount - 1);
    Grid.Rows[Grid.Row].Clear;
    Grid.Cells[7, Grid.Row] := '*';
    // Create a new persistent object
    Person := TOracleObject.Create(MainSession, 'TDemoPerson', 'DemoPersons');
    // Add it to the list
    ObjectList.Add(Person);
  end;
end;

procedure TMainForm.DeleteBtnClick(Sender: TObject);
var Row: Integer;
    Person: TOracleObject;
begin
  // Find the object and remove it from the list
  Person := ObjectList.Items[Grid.Row - 1];
  ObjectList.Delete(Grid.Row - 1);
  // If the object was not yet flushed, just free it
  if Grid.Cells[7, Grid.Row] = '*' then
  begin
    // Mark it not modified so that it will not be flushed
    Person.Modified := False;
    // Free it
    Person.Free;
  end else begin
    // Mark the object deleted
    Person.Delete;
    // Move the object from the object list to the deleted list
    DeletedList.Add(Person);
  end;
  // Remove the Row from the grid
  for Row := Grid.Row to Grid.RowCount - 2 do
    Grid.Rows[Row].Assign(Grid.Rows[Row + 1]);
  // Move the cursor if it's going to be off the grid
  if Grid.Row >= Grid.RowCount - 1 then GotoCell(Grid.Col, Grid.RowCount - 2);
  Grid.RowCount := Grid.RowCount - 1;
end;

end.
