function Replicate( Caracter:String; Quant:Integer ): String;
{Repete o mesmo caractere v�rias vezes}
var I : Integer;
begin
Result := '';
  for I := 1 to Quant do
      Result := Result + Caracter;
end;
