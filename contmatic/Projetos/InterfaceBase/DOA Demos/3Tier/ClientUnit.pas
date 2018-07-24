// Direct Oracle Access - Client
// Allround Automations
// support@allroundautomations.nl
// http://www.allroundautomations.nl
//
// This application demonstrates:
// - The Client part of a 3 Tier application
// - A login procedure
// - A master/detail relation

unit ClientUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, Grids, DBGrids, Db, DBClient, Buttons, ReconcileUnit,
  ComCtrls, MConnect, MidasCon, StdCtrls;

type
  TMainForm = class(TForm)
    DeptDataSource: TDataSource;
    EmpDataSource: TDataSource;
    StatusBar: TStatusBar;
    EmpPanel: TPanel;
    EmpTopPanel: TPanel;
    EmpDBNavigator: TDBNavigator;
    EmpDBGrid: TDBGrid;
    DeptPanel: TPanel;
    DeptTopPanel: TPanel;
    DeptDBNavigator: TDBNavigator;
    DeptApplyBtn: TSpeedButton;
    DeptDBGrid: TDBGrid;
    DeptCancelBtn: TSpeedButton;
    DeptClientDataSet: TClientDataSet;
    EmpClientDataSet: TClientDataSet;
    DeptClientDataSetDEPTNO: TIntegerField;
    DeptClientDataSetDNAME: TStringField;
    DeptClientDataSetLOC: TStringField;
    DeptClientDataSetEmpDataSet: TDataSetField;
    EmpClientDataSetEMPNO: TIntegerField;
    EmpClientDataSetENAME: TStringField;
    EmpClientDataSetJOB: TStringField;
    EmpClientDataSetMGR: TIntegerField;
    EmpClientDataSetHIREDATE: TDateTimeField;
    EmpClientDataSetSAL: TFloatField;
    EmpClientDataSetCOMM: TFloatField;
    EmpClientDataSetDEPTNO: TIntegerField;
    DCOMConnection: TDCOMConnection;
    procedure DeptApplyBtnClick(Sender: TObject);
    procedure DeptClientDataSetReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure EmpClientDataSetReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure DeptCancelBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DCOMConnectionLogin(Sender: TObject; Username,
      Password: String);
    procedure EmpClientDataSetNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

// Connect to the server
procedure TMainForm.FormCreate(Sender: TObject);
begin
  DCOMConnection.Connected := True;
end;

// Apply the updates in the dept table
procedure TMainForm.DeptApplyBtnClick(Sender: TObject);
begin
  DeptClientDataSet.ApplyUpdates(1);
end;

// Use the 'standard' Recondile Error Dialog for handling errors
procedure TMainForm.DeptClientDataSetReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TMainForm.EmpClientDataSetReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

// Cancel the updates
procedure TMainForm.DeptCancelBtnClick(Sender: TObject);
begin
  DeptClientDataSet.CancelUpdates;
end;

// Handle login
procedure TMainForm.DCOMConnectionLogin(Sender: TObject; Username,
  Password: String);
begin
  if DCOMConnection.AppServer.Login(Username, Password) then
  begin
    DeptClientDataSet.Active := True;
    EmpClientDataSet.Active  := True;
  end else begin
    raise Exception.Create('Invalid username/password');
  end;
end;

procedure TMainForm.EmpClientDataSetNewRecord(DataSet: TDataSet);
begin
  EmpClientDataSet.FieldByName('DEPTNO').Value := DeptClientDataSet.FieldByName('DEPTNO').Value;
end;

end.
