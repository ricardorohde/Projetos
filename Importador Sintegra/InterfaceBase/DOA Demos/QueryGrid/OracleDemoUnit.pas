// Direct Oracle Access - Oracle demo
// Allround Automations
// support@allroundautomations.nl
// http://www.allroundautomations.nl
//
// This application demonstrates:
// - Executing user-defined queries

unit OracleDemoUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, ExtCtrls, ComCtrls, Oracle;

type
  TOracleDemoForm = class(TForm)
    Session: TOracleSession;
    Query: TOracleQuery;
    Grid: TStringGrid;
    StatusBar: TStatusBar;
    QueryPanel: TPanel;
    QueryMemo: TMemo;
    ExecBtn: TSpeedButton;
    CommitBtn: TSpeedButton;
    RollbackBtn: TSpeedButton;
    OracleLogon: TOracleLogon;
    LogonPanel: TPanel;
    LogonBtn: TSpeedButton;
    procedure ExecBtnClick(Sender: TObject);
    procedure LogonBtnClick(Sender: TObject);
    procedure CommitBtnClick(Sender: TObject);
    procedure RollbackBtnClick(Sender: TObject);
  public
    procedure ClearGrid;
  end;

var
  OracleDemoForm: TOracleDemoForm;

implementation

{$R *.DFM}

procedure TOracleDemoForm.ClearGrid;
var r, c: Integer;
begin
  with Grid do
  begin
    for c := 0 to ColCount - 1 do
      for r := 0 to RowCount - 1 do
        Cells[c, r] := '';
    ColCount := 2;
    RowCount := 2;
  end;
end;

procedure TOracleDemoForm.LogonBtnClick(Sender: TObject);
begin
  if LogonBtn.Down then OracleLogon.Execute else Session.Logoff;
  LogonBtn.Down       := Session.Connected;
  ExecBtn.Enabled     := Session.Connected;
  CommitBtn.Enabled   := Session.Connected;
  RollBackBtn.Enabled := Session.Connected;
end;

procedure TOracleDemoForm.ExecBtnClick(Sender: TObject);
var Row, Column, Offset: Integer;
begin
  ClearGrid;
  // Copy the SQL statement in the memo to the query and try to execute it
  Query.Clear;
  Query.SQL.Add(QueryMemo.Text);
  try
    Query.Execute;
    // Place the fieldnames into the first row of the grid
    if Query.FieldCount >= Grid.ColCount then
      Grid.ColCount := Query.FieldCount + 1;
    for Column := 1 to Query.FieldCount do
      Grid.Cells[Column, 0] := Query.FieldName(Column - 1);
    // Place the data into the grid
    Row := 1;
    while not Query.EOF do
    begin
      Grid.Cells[0, Row] := IntToStr(Row);
      for Column := 1 to Query.FieldCount do
        Grid.Cells[Column, Row] := Query.Field(Column - 1);
      inc(Row);
      Query.Next;
    end;
    if Row > Grid.RowCount then Grid.RowCount := Row;
    // Show the execution status
    with Query, StatusBar do
    begin
      case FunctionType of
        4 : SimpleText := IntToStr(RowsProcessed) + ' Rows selected';
        5 : SimpleText := IntToStr(RowsProcessed) + ' Rows updated';
        9 : SimpleText := IntToStr(RowsProcessed) + ' Rows deleted';
      else
        SimpleText := 'Done';
      end;
    end;
  except
    // Show Oracle error in message box and status bar
    on E: EOracleError do
    begin
      // Set cursor at the error if possible
      if Query.ErrorLine > 0 then
      begin
        Offset := QueryMemo.Perform(EM_LINEINDEX, Query.ErrorLine - 1, 0);
        Inc(Offset, Query.ErrorPosition - 1);
        QueryMemo.SelStart := Offset;
        QueryMemo.SelLength := 0;
      end;
      ShowMessage(E.Message);
      StatusBar.SimpleText := E.Message;
    end;
  end;
end;

procedure TOracleDemoForm.CommitBtnClick(Sender: TObject);
begin
  Session.Commit;
end;

procedure TOracleDemoForm.RollbackBtnClick(Sender: TObject);
begin
  Session.Rollback;
end;

end.
