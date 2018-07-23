// 
// Created by the DataSnap proxy generator.
// 07/01/2013 20:06:34
// 

unit uCC;

interface

uses Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TDMServerClient = class(TDSAdminClient)
  private
    FmediaSalarioCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function mediaSalario: Currency;
  end;

implementation

function TDMServerClient.mediaSalario: Currency;
begin
  if FmediaSalarioCommand = nil then
  begin
    FmediaSalarioCommand := FDBXConnection.CreateCommand;
    FmediaSalarioCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FmediaSalarioCommand.Text := 'TDMServer.mediaSalario';
    FmediaSalarioCommand.Prepare;
  end;
  FmediaSalarioCommand.ExecuteUpdate;
  Result := FmediaSalarioCommand.Parameters[0].Value.AsCurrency;
end;


constructor TDMServerClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TDMServerClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TDMServerClient.Destroy;
begin
  FreeAndNil(FmediaSalarioCommand);
  inherited;
end;

end.
