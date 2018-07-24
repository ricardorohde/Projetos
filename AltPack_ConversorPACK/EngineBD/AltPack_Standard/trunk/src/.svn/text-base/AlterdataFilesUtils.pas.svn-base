unit AlterdataFilesUtils;

interface

uses
  Classes, SysUtils;

  function FormatPath(Path: string): string;
  function ExtractBeforePath(Mask: string): string;
  function ExtractFileNameNoExtension(Path: string): string;

  function ResultDirectorys(Mask: string): TStringList;
  function ResultArchives(Mask: string): TStringList;

implementation

function FormatPath(Path: string): string;
begin
  case Length(Path) of
    1 : Result := Path + ':\';
    2 : Result := Path + '\';
  else
    if Copy(Path, Length(Path), 1) <> '\' then
      Result := Path + '\'
    else
      Result := Path;
  end;
end;

function ExtractBeforePath(Mask: string): string;
var
  i: Integer;
  vMask: string;
begin
  // Inicialization of variables.
  vMask := EmptyStr;
  Result := EmptyStr;

  for i := Length(Mask) downto 1 do
    vMask := vMask + Mask[i];

  vMask := Copy(vMask, Pos('\', vMask) + 1, Length(vMask));

  for i := Length(vMask) downto 1 do
    Result := Result + vMask[i];

  Result := FormatPath(Result);
end;

function ExtractFileNameNoExtension(Path: string): string;
begin
  Result := ExtractFileName(Path);
  Result := Copy(Result, 1, Pos('.', Result) - 1);
end;

function ResultDirectorys(Mask: string): TStringList;
var
  vSearchRec : TSearchRec;
begin
  if FindFirst(Mask, faDirectory, vSearchRec) = 0 then
    begin
      Result := TStringList.Create;
      repeat
        if ((vSearchRec.Attr and faDirectory) = faDirectory) and (Copy(vSearchRec.Name, 1, 1) <> '.') then
          Result.Add(vSearchRec.Name);
      until FindNext(vSearchRec) <> 0;
      FindClose(vSearchRec);
    end;
end;

function ResultArchives(Mask: string): TStringList;
var
  vSearchRec : TSearchRec;
begin
  if FindFirst(Mask, faArchive, vSearchRec) = 0 then
    begin
      Result := TStringList.Create;
      repeat
        if ((vSearchRec.Attr and faArchive) = faArchive) and (Copy(vSearchRec.Name, 1, 1) <> '.') then
          Result.Add(vSearchRec.Name);
      until FindNext(vSearchRec) <> 0;
      FindClose(vSearchRec);
    end;
end;

end.
