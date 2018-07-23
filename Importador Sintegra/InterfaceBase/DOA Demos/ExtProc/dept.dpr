// Direct Oracle Access - ExtProc
// Allround Automations
// support@allroundautomations.nl
// http://www.allroundautomations.nl
//
// This application demonstrates:
// - How to use Oracle External Procedures, including:
//   > Sharing the session
//   > Using OCINumber parameters
//   > Raising Oracle exceptions

library dept;

uses
  SysUtils,
  Oracle,
  DeptDataModuleUnit in 'DeptDataModuleUnit.pas' {DeptDataModule: TDataModule};

var
  // The saved exit procedure
  SaveExit: Pointer;
  // The data module with a session and a query
  DataModule: TDeptDataModule = nil;
  // The OCI number result for the EmpCount function
  EmpCountResult: TOCINumber = nil;

// Count the number of employees in the given department
function EmpCount(Context: Pointer; p_DeptNo: TOCINumber): TOCINumber; cdecl;
var
  DeptNo: Integer;
begin
  Result := nil;
  with DataModule do
  try
    // Share the session of the caller with the TOracleSession
    Session.ExtProcShare(Context);
    // Convert the OCI number to a plain integer and set the variable
    DeptNo := Session.OCINumberToInt(p_DeptNo);
    EmpCountQuery.SetVariable('deptno', DeptNo);
    // Execute the query that counts the employees
    EmpCountQuery.Execute;
    // Allocate an OCI number for the result if necessary
    If EmpCountResult = nil then
      EmpCountResult := Session.OCINumberCreate;
    Result := EmpCountResult;
    // Get the count from the result set
    Session.OCINumberFromInt(Result, EmpCountQuery.Field('empcount'));
  except
    // Translate all Delphi exceptions to Oracle exceptions
    on E: EOracleError do
      Session.ExtProcRaise(E.ErrorCode, E.Message);
    on E: Exception do
      Session.ExtProcRaise(20000, E.Message);
  end;
end;

// Free all preserved resources when the DLL is unloaded
procedure LibExit;
begin
  if EmpCountResult <> nil then
    DataModule.Session.OCINumberFree(EmpCountResult);
  DataModule.Free;
  // Restore the exit procedure
  ExitProc := SaveExit;
end;

// Export the EmpCount function
exports
  EmpCount;

begin
  // Create the data module when the DLL is loaded
  DataModule := TDeptDataModule.Create(nil);
  // Save and override the exit procedure
  SaveExit := ExitProc;
  ExitProc := @LibExit;
end.
