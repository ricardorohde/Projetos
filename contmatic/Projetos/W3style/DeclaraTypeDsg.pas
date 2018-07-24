unit DeclaraTypeDsg;

interface

uses Classes, dbTables, db, sysUtils, TypInfo,DesignIntf,DesignEditors;

Type
  TDataFieldProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetDataSourcePropName: string; virtual;
    procedure GetValueList(List: TStrings); virtual;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

  TDatabaseProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

implementation

{TDataFieldProperty}

function TDataFieldProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paSortList, paMultiSelect];
end;

procedure TDataFieldProperty.GetValues(Proc: TGetStrProc);
var
  I: Integer;
  Values: TStringList;
begin
  Values := TStringList.Create;
  try
    GetValueList(Values);
    for I := 0 to Values.Count - 1 do Proc(Values[I]);
  finally
    Values.Free;
  end;
end;

procedure TDataFieldProperty.GetValueList(List: TStrings);
var
  Instance: TPersistent;
  PropInfo: PPropInfo;
  DataSource: TDataSource;
begin
  Instance := GetComponent(0);
  PropInfo := TypInfo.GetPropInfo(Instance.ClassInfo, GetDataSourcePropName);
  if (PropInfo <> nil) and (PropInfo^.PropType^.Kind = tkClass) then
  begin
    DataSource := TObject(GetOrdProp(Instance, PropInfo)) as TDataSource;
    if (DataSource <> nil) and (DataSource.DataSet <> nil) then
      DataSource.DataSet.GetFieldNames(List);
  end;
end;

function TDataFieldProperty.GetDataSourcePropName: string;
begin
  Result := 'DataSource';
end;

{ TDatabase }

function TDatabaseProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paSortList];
end;

procedure TDatabaseProperty.GetValues(Proc: TGetStrProc);
var
  I: Integer;
  Values: TStringList;
begin
  Values := TStringList.Create;
  try
    Session.GetDatabaseNames(Values);
    for I := 0 to Values.Count - 1 do Proc(Values[I]);
  finally
    Values.Free;
  end;
end;

end.
