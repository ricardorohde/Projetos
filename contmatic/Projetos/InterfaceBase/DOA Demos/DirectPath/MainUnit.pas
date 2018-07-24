// Direct Oracle Access - DirectPath demo
// Allround Automations
// support@allroundautomations.nl
// http://www.allroundautomations.nl
//
// This application demonstrates:
// - The use of Array DML
// - The use of Direct Path Loading
// - The performance gains achieved by using these features

unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, StdCtrls, OracleCI, OracleMonitor, Variants;

type
  // Some collection classes to store the import data
  TFileItem = class(TCollectionItem)
  public
    Line: Integer;
    Text: AnsiString;
  end;
  TFileItems = class(TCollection)
  private
    function GetFileItem(Index: Integer): TFileItem;
  public
    property FileItem[Index: Integer]: TFileItem read GetFileItem; default;
  end;
  // The Main Form
  TMainForm = class(TForm)
    CreateTableQuery: TOracleQuery;
    MainSession: TOracleSession;
    MainLogon: TOracleLogon;
    CreateTableBtn: TButton;
    DropTableBtn: TButton;
    DropTableQuery: TOracleQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SelectFileBtn: TButton;
    BenchmarkBtn: TButton;
    OpenDialog: TOpenDialog;
    FilenameLabel: TLabel;
    TruncateTableQuery: TOracleQuery;
    InsertQuery: TOracleQuery;
    ResultsMemo: TMemo;
    Loader: TOracleDirectPathLoader;
    procedure CreateTableBtnClick(Sender: TObject);
    procedure DropTableBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SelectFileBtnClick(Sender: TObject);
    procedure BenchmarkBtnClick(Sender: TObject);
  private
    FileItems: TFileItems;
    Filename: string;
    procedure LoadFile;
    procedure TruncateTable;
    procedure SingleInsertBenchmark;
    procedure ArrayInsertBenchmark;
    procedure DirectPathLoadBenchmark;
  end;

var
  MainForm: TMainForm;

implementation

uses OracleDPColumnsEdit;

{$R *.DFM}

function TFileItems.GetFileItem(Index: Integer): TFileItem;
begin
  Result := Items[Index] as TFileItem;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  if not MainSession.Connected then MainLogon.Execute;
  if not MainSession.Connected then Halt;
end;

// Create the table
procedure TMainForm.CreateTableBtnClick(Sender: TObject);
begin
  CreateTableQuery.Execute;
end;

// Drop the table
procedure TMainForm.DropTableBtnClick(Sender: TObject);
begin
  DropTableQuery.Execute;
end;

// Truncate the table
procedure TMainForm.TruncateTable;
begin
  TruncateTableQuery.Execute;
end;

// Select the text file that we will load into the database for the benchmark
procedure TMainForm.SelectFileBtnClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    Filename := OpenDialog.FileName;
    FilenameLabel.Caption := Filename;
  end;
end;

// Load the text file that we will load into the database for the benchmark
procedure TMainForm.LoadFile;
var i: Integer;
    Lines: TStringList;
begin
  Lines := TStringList.Create;
  Lines.LoadFromFile(Filename);
  FileItems := TFileItems.Create(TFileItem);
  for i := 0 to Lines.Count - 1 do
  begin
    with TFileItem.Create(FileItems) do
    begin
      Line := i + 1;
      Text := Copy(Lines[i], 1, 80);
    end;
  end;
  Lines.Free;
end;

// Perform the Single Insert Benchmark
procedure TMainForm.SingleInsertBenchmark;
var i: Integer;
begin
  with InsertQuery do
  begin
    for i := 0 to FileItems.Count - 1 do
    begin
      SetVariable('line', FileItems[i].Line);
      SetVariable('text', FileItems[i].Text);
      Execute;
    end;
  end;
  MainSession.Commit;
end;

// Perform the Array Insert Benchmark
procedure TMainForm.ArrayInsertBenchmark;
var Line, Text: Variant;
    i, j: Integer;
const ArraySize = 100;
begin
  // Create arrays to hold the column data for the records
  Line := VarArrayCreate([0, ArraySize - 1], varVariant);
  Text := VarArrayCreate([0, ArraySize - 1], varVariant);
  j := 0;
  for i := 0 to FileItems.Count - 1 do
  begin
    // Copy record to column arrays
    Line[j] := FileItems[i].Line;
    Text[j] := FileItems[i].Text;
    Inc(j);
    // We have filled the array, or we are at the end of the file: execute it
    if (j = ArraySize) or (i = FileItems.Count - 1) then
    begin
      with InsertQuery do
      begin
        SetVariable('line', Line);
        SetVariable('text', Text);
        ExecuteArray(0, j);
      end;
      j := 0;
    end;
  end;
  MainSession.Commit;
end;

// Perform the Direct Path Loading Benchmark
procedure TMainForm.DirectPathLoadBenchmark;
var i, Row: Integer;
begin
  // Prepare the loader
  Loader.Prepare;
  // Process all data in batches of <MaxRows> records
  Row := 0;
  for i := 0 to FileItems.Count - 1 do
  begin
    // Copy record to array
    Loader.Columns[0].SetData(Row, @FileItems[i].Line, 0);
    loader.Columns[1].SetData(Row, @FileItems[i].Text[1], Length(FileItems[i].Text));
    Inc(Row);
    // We have filled the array, or we are at the end of the file: load it
    if (Row = Loader.MaxRows) or (i = FileItems.Count - 1) then
    begin
      try
        Loader.Load(Row);
      except
        on E:EOracleError do
        begin
          ShowMessage(E.Message + #13#10#13#10 +
                      'Row = ' + IntToStr(Loader.LastRow) + ', ' +
                      'Col = ' + IntToStr(Loader.LastColumn));
          Loader.Abort;            
          Exit;
        end;
      end;
      Row := 0;
    end;
  end;
  // Commit the loaded data
  Loader.Finish;
end;

// Perform all benchmarks
procedure TMainForm.BenchmarkBtnClick(Sender: TObject);
var T1, T2, T3: dword;
    s: string;
begin
  // Load the text file into memory
  LoadFile;
  Screen.Cursor := crHourGlass;
  try
    // Clear the benchmark results
    ResultsMemo.Text := IntToStr(FileItems.Count) + ' Lines';
    ResultsMemo.Update;
    // Truncate the table
    TruncateTable;
    // Perform benchmark with single insert statements
    T1 := GetTickCount;
    SingleInsertBenchmark;
    T1 := GetTickCount - T1;
    s := 'Single Inserts: ' + FloatToStr(T1 / 1000) + ' sec';
    ResultsMemo.Lines.Add(s);
    ResultsMemo.Update;
    // Truncate the table again without influencing the benchmark
    TruncateTable;
    // Perform benchmark with array insert statements
    T2 := GetTickCount;
    ArrayInsertBenchmark;
    T2 := GetTickCount - T2;
    s := 'Array Inserts: ' + FloatToStr(T2 / 1000) + ' sec';
    ResultsMemo.Lines.Add(s);
    ResultsMemo.Update;
    if not OCI81 then
      s := 'Direct Path Loading requires Net8 8.1'
    else begin
      // Truncate the table again without influencing the benchmark
      TruncateTable;
      // Perform benchmark with array insert statements
      T3 := GetTickCount;
      DirectPathLoadBenchmark;
      T3 := GetTickCount - T3;
      s := 'Direct Path Loading: ' + FloatToStr(T3 / 1000) + ' sec';
    end;
    ResultsMemo.Lines.Add(s);
  finally
    FileItems.Free;
    Screen.Cursor := crDefault;
  end;
end;

end.
