// Direct Oracle Access - Oracle/Thread demo
// Allround Automations
// support@allroundautomations.nl
// http://www.allroundautomations.nl
//
// This application demonstrates:
// - Using threads to execute queries simultaneous
// - Creating TOracleQuery dynamically

unit ThreadUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, ExtCtrls, ComCtrls, Oracle;

type
  TQueryThread = class(TThread)
  private
    Session: TOracleSession;
    Query: TOracleQuery;
    Grid: TStringGrid;
    Memo: TMemo;
    StatusBar: TStatusBar;
    StopWatchStart: Longint;
  protected
    procedure Execute; override;
    procedure Start(ASession: TOracleSession; AGrid: TStringGrid; AMemo: TMemo; AStatusBar: TStatusBar);
    procedure ClearGrid;
    procedure MemoYellow;
    procedure MemoNormal;
  end;
  TThreadForm = class(TForm)
    Session1: TOracleSession;
    QueryPanel: TPanel;
    ExecBtn: TSpeedButton;
    CommitBtn: TSpeedButton;
    RollbackBtn: TSpeedButton;
    OracleLogon: TOracleLogon;
    LeftPanel: TPanel;
    Memo1: TMemo;
    Grid1: TStringGrid;
    LogonBtn: TSpeedButton;
    RightPanel: TPanel;
    Memo2: TMemo;
    Grid2: TStringGrid;
    StatusBar1: TStatusBar;
    StatusBar2: TStatusBar;
    Sessions: TRadioGroup;
    Session2: TOracleSession;
    DisplayCheck: TCheckBox;
    ThreadSafeCheck: TCheckBox;
    BreakBtn: TSpeedButton;
    procedure ExecBtnClick(Sender: TObject);
    procedure LogonBtnClick(Sender: TObject);
    procedure CommitBtnClick(Sender: TObject);
    procedure RollbackBtnClick(Sender: TObject);
    procedure BreakBtnClick(Sender: TObject);
  public
    QueryThread1, QueryThread2: TQueryThread;
  end;

var
  ThreadForm: TThreadForm;

implementation

{$R *.DFM}

// QueryThread

// Clear the Grid
procedure TQueryThread.ClearGrid;
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

// Functions to indicate if thread is busy or finished
procedure TQueryThread.MemoYellow;
begin
  Memo.Color := clYellow;
end;

procedure TQueryThread.MemoNormal;
begin
  Memo.Color := clWindow;
end;

// The main Thread function
procedure TQueryThread.Execute;
var Row, Column: Integer;
begin
  // Paint Memo yellow to indicate thread is running
  Synchronize(MemoYellow);
  Synchronize(ClearGrid);
  // Copy the SQL statement in the memo to the query and try to execute it
  Query.Clear;
  Query.SQL.Add(Memo.Text);
  try
    Query.Execute;
    if ThreadForm.DisplayCheck.Checked then
    begin
      // Place the fieldnames into the first row of the grid
      if Query.FieldCount >= Grid.ColCount then
        Grid.ColCount := Query.FieldCount + 1;
      for Column := 1 to Query.FieldCount do
        Grid.Cells[Column, 0] := Query.FieldName(Column - 1);
    end;
    // Place the data into the grid
    // We should use synchronize() to update the grid and the statusbar
    // but to keep it simple and a bit faster we'll do it directly
    // with a small change of a display getting messed up
    Row := 1;
    while not (Query.EOF or Terminated) do
    begin
      // break if the thread gets terminated (program exit?)
      if Terminated then Exit;
      if ThreadForm.DisplayCheck.Checked then
      begin
        Grid.Cells[0, Row] := IntToStr(Row);
        for Column := 1 to Query.FieldCount do
          Grid.Cells[Column, Row] := Query.Field(Column - 1);
        inc(Row);
        if Row > Grid.RowCount then Grid.RowCount := Row;
        StatusBar.SimpleText := IntToStr(Row);
      end;
      Query.Next;
    end;
    StatusBar.SimpleText := IntToStr(Query.RowsProcessed) + ' rows in ' +
                            IntToStr(GetTickCount - StopWatchStart) + ' ms';
  except
    // Show Oracle error in status bar
    on E: Exception do
    begin
      StatusBar.SimpleText := E.Message;
    end;
  end;
  // Memo back to normal color
  Synchronize(MemoNormal);
  Query.Free;
end;

// Init and start the thread
procedure TQueryThread.Start(ASession: TOracleSession; AGrid: TStringGrid; AMemo: TMemo; AStatusBar: TStatusBar);
begin
  // If the quaery is finished the thread may be freed
  FreeOnTerminate := True;
  // Set the components
  Session := ASession;
  Grid := AGrid;
  Memo := AMemo;
  StatusBar := AStatusBar;
  Query := TOracleQuery.Create(nil);
  Query.Session := Session;
  // Save the starttime and go
  StopWatchStart := GetTickCount;
  Resume;
end;

// Mainform

procedure TThreadForm.LogonBtnClick(Sender: TObject);
begin
  if LogonBtn.Down then
  begin
    // Set the ThreadSafe property
    Session1.ThreadSafe := ThreadSafeCheck.Checked;
    Session2.ThreadSafe := ThreadSafeCheck.Checked;
    OracleLogon.Execute
  end else
     Session1.Logoff;
  LogonBtn.Down       := Session1.Connected;
  ExecBtn.Enabled     := Session1.Connected;
  BreakBtn.Enabled    := Session1.Connected;
  CommitBtn.Enabled   := Session1.Connected;
  RollBackBtn.Enabled := Session1.Connected;
  // Set Session2 identical
  Session2.LogonUsername := Session1.LogonUsername;
  Session2.LogonPassword := Session1.LogonPassword;
  Session2.LogonDatabase := Session1.LogonDatabase;
  Session2.Connected     := Session1.Connected;
  // Disable ThreadSafe checkbox when connected
  ThreadSafeCheck.Enabled := not Session1.Connected;
end;

procedure TThreadForm.ExecBtnClick(Sender: TObject);
begin
  if (not ThreadSafeCheck.Checked) and (Sessions.ItemIndex = 0) then
    ShowMessage('Unless you''re using Oracle8''s Net8 you may expect errors');
  // Create the threads
  QueryThread1 := TQueryThread.Create(True);
  QueryThread2 := TQueryThread.Create(True);
  // Start the threads with our own Start method
  if Sessions.ItemIndex = 0 then
  begin
    // Start both threads with the same session
    QueryThread1.Start(Session1, Grid1, Memo1, StatusBar1);
    QueryThread2.Start(Session1, Grid2, Memo2, StatusBar2);
  end else begin
    // Start both threads, each with its own session
    QueryThread1.Start(Session1, Grid1, Memo1, StatusBar1);
    QueryThread2.Start(Session2, Grid2, Memo2, StatusBar2);
  end;
end;

procedure TThreadForm.BreakBtnClick(Sender: TObject);
begin
  // Note that you'll have to break twice if you're running two queries on
  // a single session.
  Session1.BreakExecution;
  Session2.BreakExecution;
end;

procedure TThreadForm.CommitBtnClick(Sender: TObject);
begin
  Session1.Commit;
  Session2.Commit;
end;

procedure TThreadForm.RollbackBtnClick(Sender: TObject);
begin
  Session1.Rollback;
  Session2.Rollback;
end;

end.
