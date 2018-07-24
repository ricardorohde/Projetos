// Direct Oracle Access - LongRaw
// Allround Automations
// support@allroundautomations.nl
// http://www.allroundautomations.nl
//
// This application demonstrates:
// - Reading and writing Long Raw columns

unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids;

type
  TMainForm = class(TForm)
    MainSession: TOracleSession;
    TablesQuery: TOracleQuery;
    ToolBar: TPanel;
    ConnectBtn: TSpeedButton;
    TableList: TComboBox;
    OracleLogon: TOracleLogon;
    Grid: TStringGrid;
    StatusBar: TStatusBar;
    SelectQuery: TOracleQuery;
    XPortPanel: TPanel;
    ImportBtn: TSpeedButton;
    ExportBtn: TSpeedButton;
    ColumnLabel: TLabel;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    GetLongRawQuery: TOracleQuery;
    PutLongRawQuery: TOracleQuery;
    procedure ConnectBtnClick(Sender: TObject);
    procedure TableListChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ImportBtnClick(Sender: TObject);
    procedure ExportBtnClick(Sender: TObject);
  private
    RowIdColumn: Integer;
    procedure BuildTableList;
    procedure ClearData;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.BuildTableList;
begin
  TableList.Items.Add('Select a table');
  with TablesQuery do
  begin
    Execute;
    while not EOF do
    begin
      TableList.Items.Add(Field('Tab'));
      Next;
    end;
  end;
  TableList.ItemIndex := 0;
end;

procedure TMainForm.ConnectBtnClick(Sender: TObject);
begin
  if OracleLogon.Execute then
  begin
    ClearData;
    TableList.Clear;
    with MainSession do
    begin
      if not Connected then
        MainForm.Caption := 'Not connected'
      else begin
        MainForm.Caption := LogonUsername + '@' + LogonDatabase;
        BuildTableList;
      end;
    end;
  end;
end;

procedure TMainForm.ClearData;
var r, c: Integer;
begin
  with Grid do
  begin
    for c := 0 to ColCount - 1 do
      for r := 0 to RowCount - 1 do
        Cells[c, r] := '';
    ColCount := 2;
    RowCount := 2;
    Row := 1;
  end;
  ColumnLabel.Caption := '';
  StatusBar.SimpleText := '';
  ImportBtn.Enabled := False;
  ExportBtn.Enabled := False;
end;

procedure TMainForm.TableListChange(Sender: TObject);
var Row, Column, Fld:Integer;
begin
  ClearData;
  if TableList.ItemIndex = 0 then Exit;
  with SelectQuery do
  try
    // Create the SQL statement and execute it
    SQL.Text := 'select t.*, rowid from ' + TableList.Text + ' t';
    Execute;
    // Place the fieldnames into the first row of the grid
    if FieldCount - 1 >= Grid.ColCount then Grid.ColCount := FieldCount - 1;
    Column := 1;
    for Fld := 0 to FieldCount - 1 do
    begin
      if FieldType(Fld) = otLongRaw then
        // Set the name of the Long Raw column
        ColumnLabel.Caption := FieldName(Fld)
      else begin
        Grid.Cells[Column, 0] := FieldName(Fld);
        // Save the index of the rowid column
        if FieldName(Fld) = 'ROWID' then RowIdColumn := Column;
        Inc(Column);
      end;
    end;
    // Place the data into the grid
    Row := 1;
    while not EOF do
    begin
      Grid.Cells[0, Row] := IntToStr(Row);
      Column := 1;
      for Fld := 0 to FieldCount - 1 do if FieldType(Fld) <> otLongRaw then
      begin
        Grid.Cells[Column, Row] := Field(Fld);
        Inc(Column);
      end;
      inc(Row);
      Next;
    end;
    // Enable buttons
    ImportBtn.Enabled := (Row > 1);
    ExportBtn.Enabled := (Row > 1);
    // Size the grid
    if Row > Grid.RowCount then Grid.RowCount := Row;
    // Show number of selected records
    StatusBar.SimpleText := IntToStr(RowsProcessed) + ' Rows selected';
  except
    // Show Oracle error in message box and status bar
    on E: EOracleError do
    begin
      ShowMessage(E.Message);
      StatusBar.SimpleText := E.Message;
    end;
  end;
  Grid.SetFocus;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  ClearData;
end;

procedure TMainForm.ImportBtnClick(Sender: TObject);
var Buffer: Pointer;
    FileLength: Integer;
    F: File;
begin
  if OpenDialog.Execute then
  begin
    // Open the file
    AssignFile(F, OpenDialog.Filename);
    Reset(F, 1);
    // Allocate a buffer of the filesize
    FileLength := FileSize(F);
    GetMem(Buffer, FileLength);
    // Read the file into the buffer in one single blockread
    BlockRead(F, Buffer^, FileLength);
    CloseFile(F);
    // Create & execute the update statement
    with PutLongRawQuery do
    begin
      // Create a SQL statement to update the long raw column by rowid
      SQL.Text := 'update ' + TableList.Text;
      SQL.Add('set ' + ColumnLabel.Caption + ' = :this_column');
      SQL.Add('where rowid = :this_row');
      // Set the values of the variables
      SetLongVariable('this_column', Buffer, FileLength);
      SetVariable('this_row', Grid.Cells[RowIdColumn, Grid.Row]);
      // Execute & commit
      Execute;
      Session.Commit;
    end;
    FreeMem(Buffer, FileLength);
  end;
end;

procedure TMainForm.ExportBtnClick(Sender: TObject);
var Offset, Length: Integer;
    Buffer: array[0..1499] of Byte;
    F: File;
begin
  if SaveDialog.Execute then
  begin
    with GetLongRawQuery do
    begin
      // Create a SQL statement to retrieve the long raw column by rowid
      SQL.Text := 'select ' + ColumnLabel.Caption + ' from ' + TableList.Text;
      SQL.Add('where rowid = :this_row');
      // Set the variable of the rowid
      SetVariable('this_row', Grid.Cells[RowIdColumn, Grid.Row]);
      Execute;
      if not EOF then
      begin
        // Create the file
        AssignFile(F, SaveDialog.Filename);
        Rewrite(F, 1);
        // Write the array in several blockwrites of 1500 bytes
        Offset := 0;
        repeat
          Length := GetLongField(0, @Buffer, Offset, 1500);
          BlockWrite(F, Buffer, Length);
          Inc(Offset, 1500);
        until Length < 1500;
        CloseFile(F);
      end;
    end;
    StatusBar.SimpleText := ColumnLabel.Caption + ' exported to ' +
                            SaveDialog.Filename;
  end;
end;

(* Import/Export using VarArrays

procedure TMainForm.ImportBtnClick(Sender: TObject);
var LongRaw: Variant;
    Ptr: Pointer;
    F: File;
begin
  if OpenDialog.Execute then
  begin
    // Read the file
    AssignFile(F, OpenDialog.Filename);
    Reset(F, 1);
    // Create a zero based variant array of bytes of the correct size
    LongRaw := VarArrayCreate([0, FileSize(F) - 1], varByte);
    // Get a pointer to (and lock) the array data
    Ptr := VarArrayLock(LongRaw);
    // Read the file into the array in one single blockread
    BlockRead(F, Ptr^, VarArrayHighBound(LongRaw, 1) + 1);
    CloseFile(F);
    // Unlock the array data
    VarArrayUnlock(LongRaw);
    // Create & execute the update statement
    with PutLongRawQuery do
    begin
      // Create a SQL statement to update the long raw column by rowid
      SQL.Text := 'update ' + TableList.Text;
      SQL.Add('set ' + ColumnLabel.Caption + ' = :this_column');
      SQL.Add('where rowid = :this_row');
      // Set the values of the variables
      SetVariable('this_column', LongRaw);
      SetVariable('this_row', Grid.Cells[RowIdColumn, Grid.Row]);
      // Execute & commit
      Execute;
      Session.Commit;
    end;
  end;
end;

procedure TMainForm.ExportBtnClick(Sender: TObject);
var LongRaw: Variant;
    Ptr: Pointer;
    F: File;
begin
  if SaveDialog.Execute then
  begin
    with GetLongRawQuery do
    begin
      // Create a SQL statement to retrieve the long raw column by rowid
      SQL.Text := 'select ' + ColumnLabel.Caption + ' from ' + TableList.Text;
      SQL.Add('where rowid = :this_row');
      // Set the variable of the rowid
      SetVariable('this_row', Grid.Cells[RowIdColumn, Grid.Row]);
      Execute;
      if not EOF then
      begin
        // The first (and only) field is the long raw column, which is
        // returned as a zero based variant array of bytes
        LongRaw := Field(0);
        // Get a pointer to (and lock) the array data
        Ptr := VarArrayLock(LongRaw);
        // Create the file
        AssignFile(F, SaveDialog.Filename);
        Rewrite(F, 1);
        // Write the array in one single blockwrite of the correct size
        BlockWrite(F, Ptr^, VarArrayHighBound(LongRaw, 1) + 1);
        CloseFile(F);
        // Unlock the array data
        VarArrayUnlock(LongRaw);
      end;
    end;
    StatusBar.SimpleText := ColumnLabel.Caption + ' exported to ' +
                            SaveDialog.Filename;
  end;
end;

*)

end.
