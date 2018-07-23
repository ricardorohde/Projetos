// Direct Oracle Access - DeptEmp
// Allround Automations
// support@allroundautomations.nl
// http://www.allroundautomations.nl
//
// This application demonstrates:
// - The use of Master/Detail datasets
// - Using derived fields in an updateable dataset
// - The use of OnTranslateMessage & EnforceConstraints
// - The use of QBE mode and the TOracleNavigator component

unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, StdCtrls, Db, Grids, DBGrids, ExtCtrls, DBCtrls, OracleData,
  OracleNavigator, OracleMonitor;

type
  TMainForm = class(TForm)
    MainSession: TOracleSession;
    MainLogon: TOracleLogon;
    DeptDataSet: TOracleDataSet;
    EmpDataSet: TOracleDataSet;
    DeptDataSource: TDataSource;
    EmpDataSource: TDataSource;
    DeptGroupBox: TGroupBox;
    DeptGrid: TDBGrid;
    EmpGroupBox: TGroupBox;
    EmpGrid: TDBGrid;
    EmpNo: TIntegerField;
    EName: TWideStringField;
    Job: TWideStringField;
    Mgr: TIntegerField;
    HireDate: TDateTimeField;
    Sal: TFloatField;
    Comm: TFloatField;
    EmpDeptNo: TIntegerField;
    MgrName: TWideStringField;
    MgrQuery: TOracleQuery;
    DeptNo: TIntegerField;
    DName: TWideStringField;
    Loc: TWideStringField;
    DeptNavigator: TOracleNavigator;
    EmpNavigator: TOracleNavigator;
    CreateTablesScript: TOracleScript;
    DropTablesScript: TOracleScript;
    CheckTablesQuery: TOracleQuery;
    DropButton: TButton;
    function  DemoTablesOkay(CreateTables: Boolean): Boolean;
    procedure MgrValidate(Sender: TField);
    procedure FormCreate(Sender: TObject);
    procedure ScriptError(Sender: TOracleScript);
    procedure DropButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

// Logon during form creation and open both datasets
procedure TMainForm.FormCreate(Sender: TObject);
begin
  MainLogon.Execute;
  if MainSession.Connected and DemoTablesOkay(True) then
  begin
    DeptDataSet.Open;
    EmpDataSet.Open;
  end;
end;

// Check if the demo tables exist, and if not, create them
function TMainForm.DemoTablesOkay(CreateTables: Boolean): Boolean;
begin
  Result := False;
  try
    // Check if all 3 tables exist
    with CheckTablesQuery do
    begin
      Execute;
      if Field('count') = 3 then
        Result := True
      else begin
        // If not, create them if appropriate
        if CreateTables then
        begin
          CreateTablesScript.Execute;
          // Check again
          Result := DemoTablesOkay(False);
        end;
      end;
    end;
  except
    on E:Exception do ShowMessage(E.Message)
  end;
end;

// Display script error
procedure TMainForm.ScriptError(Sender: TOracleScript);
begin
  ShowMessage(Sender.CurrentCommand.ErrorMessage);
end;

// Check if Manager exists (and is in fact a manager)
procedure TMainForm.MgrValidate(Sender: TField);
begin
  if Mgr.IsNull then
    MgrName.Clear
  else with MgrQuery do
  begin
    // Select name and job of manager field
    SetVariable('EMPNO', Mgr.Value);
    Execute;
    if Eof then raise Exception.Create('Employee does not exist');
    // Is this employee a manager?
    if Trim(Field('JOB')) <> 'MANAGER' then
      raise Exception.Create('This employee is not a manager');
    MgrName.Value := Field('ENAME');
  end;
end;

procedure TMainForm.DropButtonClick(Sender: TObject);
begin
  EmpDataSet.Close;
  DeptDataSet.Close;
  DropTablesScript.Execute;
end;

end.
