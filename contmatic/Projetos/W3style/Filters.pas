unit Filters;

interface

uses classes, DBTables,Variants;

type
  TFilter = class
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    FFilterValues : Variant;
    FFilterFields : TStrings;
    function GetFilterValues(Index: string): Variant;
    procedure SetFilterValues(Index: string; const Value: Variant);
    constructor Create;
    destructor Destroy; override;
    property FilterValues[index: string]: Variant read GetFilterValues write SetFilterValues;
  published
    { Published declarations }
  end;

implementation

constructor TFilter.Create;
begin
  FFilterValues := VarArrayCreate([0,0],varVariant);
  FFilterFields := TStringList.Create;
end;

destructor TFilter.Destroy;
begin
  FFilterFields.Free;
  inherited Destroy;
end;

function TFilter.GetFilterValues(Index: string): Variant;
var
  iPos : Integer;
begin
   iPos := FFilterFields.IndexOf(Index);
   if iPos = - 1
   then Result := 0
   else Result := FFilterValues[iPos];
end;

procedure TFilter.SetFilterValues(Index: string; const Value: Variant);
var
  iPos : Integer;
begin
  iPos := FFilterFields.IndexOf(Index);
  if iPos = -1 then
  begin
    iPos := FFilterFields.Add(Index);
    VarArrayRedim(FFilterValues, iPos);
  end;
  FFilterValues[iPos] := Value;
end;

end.
