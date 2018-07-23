// Direct Oracle Access - Department grid demo
// Allround Automations
// support@allroundautomations.nl
// http://www.allroundautomations.nl
//
// This application demonstrates:
// - Connecting to a database
// - Selecting and updating data using variables
// - Displaying queried data in a grid

unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Buttons, ExtCtrls, Grids;

type
  TMainForm = class(TForm)
    MainSession: TOracleSession;
    MainLogon: TOracleLogon;
    DeptGrid: TStringGrid;
    ToolBar: TPanel;
    ConnectBtn: TSpeedButton;
    QueryBtn: TSpeedButton;
    CommitBtn: TSpeedButton;
    SelectQuery: TOracleQuery;
    UpdateQuery: TOracleQuery;
    procedure ConnectBtnClick(Sender: TObject);
    procedure QueryBtnClick(Sender: TObject);
    procedure CommitBtnClick(Sender: TObject);
    procedure DeptGridSetEditText(Sender: TObject; ACol, ARow: Longint;
      const Value: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.ConnectBtnClick(Sender: TObject);
begin
  // Log on or off
  if MainSession.Connected then MainSession.LogOff else MainLogon.Execute;
  // The button shows if we're connected
  ConnectBtn.Down := MainSession.Connected;
end;


procedure TMainForm.QueryBtnClick(Sender: TObject);
var Row: Integer;
begin
  // Setup titles
  DeptGrid.Cells[0, 0] := 'Number';
  DeptGrid.Cells[1, 0] := 'Name';
  DeptGrid.Cells[2, 0] := 'Location';
  Row := 1;
  // Execute the query
  // SelectQuery.SQL = select * from dept
  //                   order by deptno
  with SelectQuery do
  try
    Execute;
    // Fill the grid, mark each row unchanged
    while not EOF do
    begin
      DeptGrid.Cells[0, Row] := Field('DEPTNO');
      DeptGrid.Cells[1, Row] := Field('DNAME');
      DeptGrid.Cells[2, Row] := Field('LOC');
      DeptGrid.Cells[3, Row] := 'UNCHANGED';
      Next;
      Inc(Row);
    end;
  except
    on E:EOracleError do
      if E.ErrorCode = 942 then
        ShowMessage('You must install the demo tables first')
      else
        ShowMessage(E.Message);
  end;
  // Adjust the grid
  DeptGrid.RowCount := Row + 1;
end;

procedure TMainForm.DeptGridSetEditText(Sender: TObject; ACol,
  ARow: Longint; const Value: string);
begin
  // Mark row as changed
  DeptGrid.Cells[3, ARow] := 'CHANGED';
end;

procedure TMainForm.CommitBtnClick(Sender: TObject);
var Row: Integer;
begin
  for Row := 1 to DeptGrid.RowCount - 1 do
  begin
    // Execute an update statement for each changed row
    // UpdateQuery.SQL = update dept
    //                   set dname = :dname, loc = :loc
    //                   where deptno = :deptno
    if DeptGrid.Cells[3, Row] = 'CHANGED' then with UpdateQuery do
    try
      // Set the query variables to the new values
      SetVariable('DEPTNO', DeptGrid.Cells[0, Row]);
      SetVariable('DNAME',  DeptGrid.Cells[1, Row]);
      SetVariable('LOC',    DeptGrid.Cells[2, Row]);
      // Update it
      Execute;
      // Mark row unchanged
      DeptGrid.Cells[3, Row] := 'UNCHANGED';
    except
      on E:EOracleError do ShowMessage(E.Message);
    end;
  end;
  // Commit all updates
  MainSession.Commit;
end;

end.
