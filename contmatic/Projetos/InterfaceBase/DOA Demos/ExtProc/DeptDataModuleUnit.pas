// Direct Oracle Access - ExtProc
// Allround Automations
// support@allroundautomations.nl
// http://www.allroundautomations.nl

unit DeptDataModuleUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle;

type
  TDeptDataModule = class(TDataModule)
    EmpCountQuery: TOracleQuery;
    Session: TOracleSession;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DeptDataModule: TDeptDataModule;

implementation

{$R *.DFM}


end.
