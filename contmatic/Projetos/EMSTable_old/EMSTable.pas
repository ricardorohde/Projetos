unit EMSTable;

interface

uses
  SysUtils, Classes, DB, DBClient;

type
  TEMSTable = class(TClientDataSet)
  private
    { Private declarations }
    FSchema       : string;
    FTableName    : string;
    FPrimaryKey   : string;
    FDetailFields : string;
    FReadOnly     : Boolean;

    function  GetTableName: string;
    procedure SetTableName(const Value: string);
    function  GetPrimaryKey: string;
    procedure SetPrimaryKey(const Value: string);
    function  GetSchema: string;
    procedure SetSchema(const Value: string);
    function  GetDetailFields: string;
    procedure SetDetailFields(const Value: string);
    function GetReadOnly: Boolean;
    procedure SetReadOnly(const Value: Boolean);
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
    { Published declarations }
    property TableName    : string  read GetTableName    write SetTableName;
    property PrimaryKey   : string  read GetPrimaryKey   write SetPrimaryKey;
    property Schema       : string  read GetSchema       write SetSchema;
    property DetailFields : string  read GetDetailFields write SetDetailFields;
    property ReadOnly     : Boolean read GetReadOnly     write SetReadOnly default False;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('EMS', [TEMSTable]);
end;

{ TEMSTable }

function TEMSTable.GetDetailFields: string;
begin
  Result := FDetailFields;
end;

function TEMSTable.GetPrimaryKey: string;
begin
  Result := FPrimaryKey;
end;

function TEMSTable.GetReadOnly: Boolean;
begin
  Result := FReadOnly;
end;

function TEMSTable.GetSchema: string;
begin
  Result := FSchema;
end;

function TEMSTable.GetTableName: string;
begin
  Result := FTableName;
end;

procedure TEMSTable.SetDetailFields(const Value: string);
begin
  FDetailFields := Value;
end;

procedure TEMSTable.SetPrimaryKey(const Value: string);
begin
  FPrimaryKey := Value;
end;

procedure TEMSTable.SetReadOnly(const Value: Boolean);
begin
  FReadOnly := Value;
end;

procedure TEMSTable.SetSchema(const Value: string);
begin
  FSchema := Value;
end;

procedure TEMSTable.SetTableName(const Value: string);
begin
  FTableName := Value;
end;

end.
