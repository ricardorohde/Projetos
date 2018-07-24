// Direct Oracle Access - PkgApply
// Allround Automations
// support@allroundautomations.nl
// http://www.allroundautomations.nl
//
// This application demonstrates:
// - The use of the OnApplyRecord event
// - The use of a cursor variable in a dataset
//
// NOTE: You must run DeptAPI.pck through SQL*Plus before running this demo
// ========================================================================
//

unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ExtCtrls, DBCtrls, OracleData, Oracle, Grids, DBGrids, StdCtrls;

type
  TMainForm = class(TForm)
    MainSession: TOracleSession;
    DeptDataSet: TOracleDataSet;
    DeptNo: TIntegerField;
    DName: TWideStringField;
    Loc: TWideStringField;
    DBNavigator: TDBNavigator;
    DeptDataSource: TDataSource;
    DeptGrid: TDBGrid;
    OrderGroup: TRadioGroup;
    MainLogon: TOracleLogon;
    ShowCallsCheck: TCheckBox;
    Query: TOracleQuery;
    procedure DeptDataSetApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: String);
    procedure OrderGroupClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ShowCallsCheckClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

// Apply a record
procedure TMainForm.DeptDataSetApplyRecord(Sender: TOracleDataSet;
  Action: Char; var Applied: Boolean; var NewRowId: String);
var
  Call: string;
begin
  // For locks, updates and deletes we need the old deptno value to
  // identify a dept record
  case Action of
    'L': Call := 'DeptAPI.LockRecord(:Old_DeptNo)';
    'I': Call := 'DeptAPI.InsertRecord(:DeptNo, :DName, :Loc)';
    'U': Call := 'DeptAPI.UpdateRecord(:Old_DeptNo, :DeptNo, :DName, :Loc)';
    'D': Call := 'DeptAPI.DeleteRecord(:Old_DeptNo)';
  else
    Call := '';
  end;
  // Build a PL/SQL block with a call to a DeptAPI procedure;
  if Call <> '' then
  begin
    with Query do
    begin
      Clear;
      SQL.Add('begin');
      SQL.Add('  ' + Call + ';');
      SQL.Add('end;');
      // Declare the variables
      Sender.DeclareQueryVariables(Query);
      // Set the values of the variables
      Sender.SetQueryVariables(Query);
      // Execute the query
      Execute;
      // The procedure can determine a new DeptNo value, so we need to refresh it
      if VariableIndex('DeptNo') >= 0 then DeptNo.Value := GetVariable('DeptNo');
    end;
  end;
  // Notify to the dataset the we have applied the record
  Applied := True;
end;

procedure TMainForm.OrderGroupClick(Sender: TObject);
begin
  // Set the p_order variable to the name of the corresponding field
  DeptDataSet.SetVariable('p_order', DeptDataSet.Fields[OrderGroup.ItemIndex].FieldName);
  // Refresh the dataset
  DeptDataSet.Refresh;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  MainLogon.Execute;
  if MainSession.Connected then DeptDataSet.Open;
end;

procedure TMainForm.ShowCallsCheckClick(Sender: TObject);
begin
  Query.Debug := ShowCallsCheck.Checked;
  DeptDataSet.Debug := ShowCallsCheck.Checked;
end;

end.
