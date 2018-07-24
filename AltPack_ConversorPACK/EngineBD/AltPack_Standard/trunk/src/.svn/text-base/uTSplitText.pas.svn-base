unit uTSplitText;

interface

uses
  Classes;

type
  TSplitText = class(TStringList)
  private
    { Private declarations }
    function SplitText(Text, Caracter: String; Index: Integer; WithTrim: Boolean): String;
    function SplitCount(Text, Caracter: String): Integer;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(Text, Caracter: String; Trim: Boolean = True);
    function FindMinLengthSplit(): Integer;
    function FindMaxLengthSplit(): Integer;
  published
    { Published declarations }
  end;

implementation

uses SysUtils;

{ TSplitText }

constructor TSplitText.Create(Text, Caracter: String; Trim: Boolean = True);
var
  i: Integer;
begin
  inherited Create();
  for i := 1 to SplitCount(Text, Caracter) do
    Self.Add(SplitText(Text, Caracter, i - 1, Trim));
end;

function TSplitText.SplitCount(Text, Caracter: String): Integer;
var
  i: Integer;
begin
  Result := 1;
  for i := 0 to Length(Text) do
    if Text[i] = Caracter then
      Result := Result + 1;
end;

function TSplitText.SplitText(Text, Caracter: String; Index: integer; WithTrim: Boolean): String;
var
  i, ct, old: Integer;
begin
  ct := 0;
  old := 0;
  for i := 0 to Length(Text) do
    begin
      if Text[i] = Caracter then
        begin
          if (ct = Index - 1) then
            begin
              Result := Copy(Text, old + 1, i - old - 1);

              if WithTrim then
                Result := Trim(Result);

              Exit;
            end;
          old := i;
          ct := ct + 1;
        end;

      if i = Length(Text) then
        begin
          Result := Copy(Text, old + 1, i - old);

          if WithTrim then
            Result := Trim(Result);

          Exit;
        end;

      if Index = 1 then
        begin
          Result := Copy(Text, 0, pos(Caracter, Text) - 1);

          if WithTrim then
            Result := Trim(Result);

          Exit;
        end;
    end;
end;

function TSplitText.FindMaxLengthSplit: Integer;
var
  i: Integer;
  lText: String;
begin
  Result := 0;
  lText := Self.Strings[0];
  for i := 1 to Self.Count - 1 do
    if Length(lText) < Length(Self.Strings[i]) then
      begin
        Result := i;
        lText := Self.Strings[i];
      end;
end;

function TSplitText.FindMinLengthSplit: Integer;
var
  i: Integer;
  lText: String;
begin
  Result := 0;
  lText := Self.Strings[0];
  for i := 1 to Self.Count - 1 do
    if Length(lText) > Length(Self.Strings[i]) then
      begin
        Result := i;
        lText := Self.Strings[i];
      end;
end;

end.
