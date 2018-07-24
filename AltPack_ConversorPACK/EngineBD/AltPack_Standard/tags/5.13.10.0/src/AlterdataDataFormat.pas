unit AlterdataDataFormat;

interface

uses
  SysUtils;

  function FormatCharacterValid(Text, CharactersValid: string): string;
  function FormatCharacterInvalid(Text, CharactersInvalid: string): string;

  function FormatMask(Text, Mask: string): string;
  function FormatOnlyMask(Text, Mask: string): string;

  function FormatTrim(Text: string): string;
  function FormatTrimText(Text: string): string;

  function FormatNumberText(Text: string; ExpectedLength: Integer): string; overload;
  function FormatNumberText(Text: Integer; ExpectedLength: Integer): string; overload;

  function FormatRemoveAccentuation(Text: string): string;

  function FormatOnlyNumber(Text: string; IncludeZero: Boolean = True): string;
  function FormatOnlyText(Text: string): string;

  function FormatLowerText(Text: string): string;
  function FormatUpperText(Text: string): string;

  function FormatUpperFirstCharacther(Text: string): string;
  function FormatUpperAllFirstCharacthers(Text: string): string;

  //---------------------------------------------------------------------------

  function FormatCEP(Text: string): string;
  function FormatCNPJCPF(Text: string): string;
  function FormatTelefone(Text: string): string;

const
  EmptyString: string = '';
  cCharactersNumbers: string = '0123456798';
  cCharactersText: array[1..2] of string = ('abcdefghijklmnopqrstuvwxyzáàãâäéèêëíìîïóòõôöúùûüýñç','ABCDEFGHIJKLMNOPKRSTUVWXYZÁÀÃÂÄÉÈÊËÍÌÎÏÓÒÕÔÖÚÙÛÜÝÑÇ');
  cCharactersTextAccentuation: array[1..2] of string = ('aaaaaeeeeiiiiooooouuuuyyncAAAAAEEEEIIIIOOOOOUUUUYNC','áàãâäéèêëíìîïóòõôöúùûüýÿñçÁÀÃÂÄÉÈÊËÍÌÎÏÓÒÕÔÖÚÙÛÜÝÑÇ');

implementation

function FormatCharacterValid(Text, CharactersValid: string): string;
var
  i: Integer;
  vText: string;
begin
  vText := EmptyString;

  for i := 1 to Length(Text) do
    if Pos(Text[i], CharactersValid) > 0 then
      vText := vText + Text[i];

  Result := vText;
end;

function FormatCharacterInvalid(Text, CharactersInvalid: string): string;
var
  i: Integer;
  vText: string;
begin
  vText := EmptyString;

  for i := 1 to Length(Text) do
    if Pos(Text[i], CharactersInvalid) = 0 then
      vText := vText + Text[i];

  Result := vText;
end;

function FormatMask(Text, Mask: string): string;
var
  i, iText, iPlusMask: Integer;
  vText: string;
begin
  iText := 1;
  iPlusMask := 0;
  vText := EmptyString;

  for i := 1 to Length(Mask) do
    if Mask[i] <> '*' then
      iPlusMask := iPlusMask + 1;

  for i := Length(Mask) to Length(Text) + iPlusMask do
    Mask := Mask + '*';

  for i := 1 to Length(Mask) do
    if Mask[i] = '*' then
      begin
        vText := vText + Text[iText];
        iText := iText + 1;
      end
    else
      vText := vText + Mask[i];

  Result := vText;
end;

function FormatOnlyMask(Text, Mask: string): string;
var
  i, iText, iMask: Integer;
  vText: string;
begin
  iText := 1;
  iMask := 0;
  vText := EmptyString;

  for i := 1 to Length(Mask) do
    if  Mask[i] = '*' then
      iMask := iMask + 1;

  if Length(Text) <> iMask then
    begin
      Result := Text;
      Exit;
    end;

  for i := 1 to Length(Mask) do
    if Mask[i] = '*' then
      begin
        vText := vText + Text[iText];
        iText := iText + 1;
      end
    else
      vText := vText + Mask[i];

  Result := vText;
end;

function FormatTrim(Text: string): string;
begin
  Result := Trim(Text);
end;

function FormatTrimText(Text: string): string;
var
  i, iPosInicial, iPosFinal: Integer;
  vText, vTextAux: string;
begin
  vTextAux := FormatTrim(Text);

  for i := 1 to Length(vTextAux) do
    if (Pos(vTextAux[i], cCharactersNumbers) > 0) or (Pos(vTextAux[i], cCharactersText[1]) > 0) or (Pos(vTextAux[i], cCharactersText[2]) > 0) or
       (Pos(vTextAux[i], cCharactersTextAccentuation[1]) > 0) or (Pos(vTextAux[i], cCharactersTextAccentuation[2]) > 0) then
      begin
        iPosInicial := i;
        Break;
      end;

  for i := Length(vTextAux) downto 1 do
    if (Pos(vTextAux[i], cCharactersNumbers) > 0) or (Pos(vTextAux[i], cCharactersText[1]) > 0) or (Pos(vTextAux[i], cCharactersText[2]) > 0) or
       (Pos(vTextAux[i], cCharactersTextAccentuation[1]) > 0) or (Pos(vTextAux[i], cCharactersTextAccentuation[2]) > 0) then
      begin
        iPosFinal := i + 1;
        Break;
      end;

  Result := Copy(vTextAux, iPosInicial, iPosFinal - iPosInicial);
end;

function FormatNumberText(Text: string; ExpectedLength: Integer): string;
var
  i: Integer;
  vText: string;
begin
  vText := EmptyString;

  for i := 1 to ExpectedLength - Length(Text) do
    vText := vText + '0';

  Result := vText + Text;
end;

function FormatNumberText(Text: Integer; ExpectedLength: Integer): string;
begin
  FormatNumberText(IntToStr(Text), ExpectedLength);
end;

function FormatRemoveAccentuation(Text: string): string;
var
  i: Integer;
  vText: string;
begin
  for i := 1 to Length(Text) do
    if Pos(Text[i], cCharactersTextAccentuation[2]) > 0 then
      vText := vText + Copy(cCharactersTextAccentuation[1], Pos(Text[i], cCharactersTextAccentuation[2]), 1)
    else
      vText := vText + Text[i];

  Result:= vText;
end;

function FormatOnlyNumber(Text: string; IncludeZero: Boolean = True): string;
begin
  if IncludeZero then
    Result := FormatCharacterValid(Text, cCharactersNumbers)
  else
    Result := FormatCharacterValid(Text, Copy(cCharactersNumbers, 2, Length(cCharactersNumbers)));
end;

function FormatOnlyText(Text: string): string;
begin
  Result := FormatCharacterInvalid(Text, cCharactersNumbers)
end;

function FormatLowerText(Text: string): string;
var
  i: Integer;
  vText: string;
begin
  for i := 1 to Length(Text) do
    if Pos(Text[i], cCharactersText[2]) > 0 then
      vText := vText + Copy(cCharactersText[1], Pos(Text[i], cCharactersText[2]), 1)
    else
      vText := vText + Text[i];

  Result:= vText;
end;

function FormatUpperText(Text: string): string;
var
  i: Integer;
  vText: string;
begin
  for i := 1 to Length(Text) do
    if Pos(Text[i], cCharactersText[1]) > 0 then
      vText := vText + Copy(cCharactersText[2], Pos(Text[i], cCharactersText[1]), 1)
    else
      vText := vText + Text[i];

  Result:= vText;
end;

function FormatUpperFirstCharacther(Text: string): string;
var
  vText: string;
begin
  vText := FormatLowerText(Text);

  if Pos(vText[1], cCharactersText[1]) > 0 then
    vText := Copy(cCharactersText[2], Pos(vText[1], cCharactersText[1]), 1) + Copy(vText, 2, Length(vText));

  Result:= vText;
end;

function FormatUpperAllFirstCharacthers(Text: string): string;
var
  i: Integer;
  vText: string;
begin
  vText := FormatUpperFirstCharacther(Text);

  for i := 2 to Length(vText) do
    if (Pos(vText[i], cCharactersText[1]) > 0) and (vText[i - 1] = ' ') then
      vText := Copy(vText, 1, i - 1) + Copy(cCharactersText[2], Pos(vText[i], cCharactersText[1]), 1) + Copy(vText, i + 1, Length(vText));

  Result := vText;
end;

  //---------------------------------------------------------------------------

function FormatCEP(Text: string): string;
var
  vText: string;
begin
  vText := FormatOnlyNumber(Text);

  Result := FormatOnlyMask(vText, '*****-***');
end;

function FormatCNPJCPF(Text: string): string;
var
  vText: string;
begin
  vText := FormatOnlyNumber(Text);

  case Length(vText) of
    11: Result := FormatOnlyMask(vText, '***.***.***-**');
    14: Result := FormatOnlyMask(vText, '**.***.***/****-**');
  else
    Result := vText;
  end;
end;

function FormatTelefone(Text: string): string;
var
  vText: string;
begin
  vText := FormatOnlyNumber(Text);

  case Length(vText) of
    8 : Result := FormatOnlyMask(vText, '****-****');
    10: Result := FormatOnlyMask(vText, '(**) ****-****');
    11: Result := FormatOnlyMask(vText, '(***) ****-****');
  else
    Result := vText;
  end;
end;

end.
