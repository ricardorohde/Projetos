function Empty(inString:String): Boolean;
{Testa se a variavel está vazia ou não}
Var
  index : Byte;
Begin
  index := 1;
  Empty := True;
  while (index <= Length(inString))and (index <> 0) do
    begin
      if inString[index] = ' ' Then
         begin
	 inc(index)
         end
      else
	Begin
	  Empty := False;
	  index := 0
	end;
    end;
end;