unit ServerDM;

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, Server_TLB, StdVcl, Provider, Db, OracleData, Oracle;

type
  TServerDMClass = class(TRemoteDataModule, IServerDMClass)
    OracleSession: TOracleSession;
    DeptDataSet: TOracleDataSet;
    EmpDataSet: TOracleDataSet;
    DeptProvider: TDataSetProvider;
    procedure RemoteDataModuleDestroy(Sender: TObject);
    procedure EmpDataSetBeforeOpen(DataSet: TDataSet);
    procedure DeptDataSetBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    function Login(const Username, Password: WideString): WordBool; safecall;
  end;

implementation

uses ServerUnit;

{$R *.DFM}

class procedure TServerDMClass.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

// Connect to the default database, return false if it failed
// This function is added in the Server_TLB and is part of the
// AppServer interface that can be used in the Client Application
function TServerDMClass.Login(const Username, Password: WideString): WordBool;
begin
  UpdateStatusLine(1);
  with OracleSession do
  begin
    LogonUsername := Username;
    LogonPassword := Password;
    try
      Connected := True;
      Result := True;
      Log(Username + ' logged in successully.');
    except
      Result := False;
      Log(Username + ' log in failed.');
    end;
  end;
end;

procedure TServerDMClass.RemoteDataModuleDestroy(Sender: TObject);
begin
  Log(OracleSession.LogonUsername + ' disconnected');
  UpdateStatusLine(-1);
end;

procedure TServerDMClass.DeptDataSetBeforeOpen(DataSet: TDataSet);
begin
  // If the session is not connected, log on with scott/tiger
  // This way we get a default connection at design time
  OracleSession.Connected := True;
end;

procedure TServerDMClass.EmpDataSetBeforeOpen(DataSet: TDataSet);
begin
  // If the session is not connected, log on with scott/tiger
  // This way we get a default connection at design time
  OracleSession.Connected := True;
end;

initialization
  TComponentFactory.Create(ComServer, TServerDMClass,
    Class_ServerDMClass, ciMultiInstance, tmApartment);
end.
