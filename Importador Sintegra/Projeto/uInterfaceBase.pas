unit uInterfaceBase;

interface

uses Classes, Contnrs, SysUtils, StrUtils, Dialogs,
     Variants;

  type
    IInterfaceBase = interface
      function  GetProp(const PropName: String): Variant;
      procedure SetProp(const PropName: String; const Value: Variant);
      property Prop[const PropName : String]: Variant read GetProp write SetProp;
    end;

  type
    TInterfaceBase = class(TInterfacedObject, IInterfaceBase)
    private
      FValores         : array of Variant;
      FCampos          : array of string;

      function  GetProp(const PropName: String): Variant;
      procedure SetProp(const PropName: String; const Value: Variant);

    public
      function  GetNamePropByIndex(AIndex : Integer) : string;
      function  GetCountProp : Integer;

      constructor Create(AValue : array of string); reintroduce;
      property Prop[const PropName : String]: Variant read GetProp write SetProp;
    end;

implementation

{ TInterfaceBase }

constructor TInterfaceBase.Create(AValue: array of string);
var
  i : Integer;
begin
  SetLength(FCampos,  Length(AValue));
  SetLength(FValores, Length(AValue));
  for i := Low(AValue) to High(AValue) do
    FCampos[i] := UpperCase(AValue[i]);
end;

function TInterfaceBase.GetCountProp: Integer;
begin
  result := High(FCampos);
end;

function TInterfaceBase.GetNamePropByIndex(AIndex: Integer): string;
begin
  Result := FCampos[AIndex];
end;

function TInterfaceBase.GetProp(const PropName: String): Variant;
begin
  Result := FValores[AnsiIndexStr(UpperCase(PropName), FCampos)];
end;


procedure TInterfaceBase.SetProp(const PropName: String;
  const Value: Variant);
begin
  FValores[AnsiIndexStr(UpperCase(PropName), FCampos)] := Value;
end;

end.
