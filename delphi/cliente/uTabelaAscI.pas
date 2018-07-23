{*******************************************************************************
 * Softguild Informática Ltda. - SGWFiscal
 * -----------------------------------------------------------------------------
 * Modulo     : .pas
 * Programador: Edson de Melo
 * Data       : //2009
 * Objetivo   :
 * Observações:
 *******************************************************************************}
unit uTabelaAscI;
  interface
    uses SysUtils, Dialogs,Math,Variants,Windows;

    function RetornaLetra(Posicao : Integer) : String;
    function RetornaPosicao(Letra : String) : Integer;
    function RoundDec(Valor : Double; casas : Smallint) :Double;
    function Arred(Valor : Extended) : Int64;
    function Empty( Variable: Variant ): Boolean;
    procedure Aviso(Mensagem:string);
    function Confirma(mensagem: string):boolean;
    Function Primo(Num : Integer):Boolean;
    Function RandomCrip(X1,X2 : Integer):Integer;
    Function RandomPrimo(X1,X2 : Integer):Integer;
    function RaizDominante : extended;
    function RaizDominante4 : extended;
    function Raiz(num : real;Expoente : Integer):real;

    function BinToInt(Value: String): LongInt;
    function IntToBin(Value: LongInt;Size: Integer): String;

    function IsMDC(X,Y : Integer):Boolean;
    function MDC(X,Y : Integer):Integer;
    function RetornaE(Y : Integer): Integer;
    Function RetornaD(E,Z : Integer): Integer;

    //function CripTabela(Letra : String): String;
    const TabelaAsc : array[0..136] of String = ('Û','B','C','D','E','F','G',
                                                 'H','I','J','K','L','M','N',
                                                 'O','P','Q','R','S','T','U',
                                                 'V','X','W','Y','Z','a','b',
                                                 'c','d','e','f','g','h','i',
                                                 'j','k','l','m','n','o','p',
                                                 'q','r','s','t','u','v','x',
                                                 'w','y','z','1','2','3','4',
                                                 '5','6','7','8','9','0','"',
                                                 '!','@','#','$','%','¨','&',
                                                 '*','(',')','{','}','[',']',
                                                 '|','\',',','.','<','>',':',
                                                 ';','?','/','-','_','=','+',
                                                 'â','ê','î','ô','û','Â','Ê',
                                                 'Î','Ô','A','ã','õ','ñ','Ã',
                                                 'Õ','Ñ','á','é','í','ó','ú',
                                                 'Á','É','Í','Ó','Ú','À','È',
                                                 'Ì','Ò','Ù','à','è','ì','ò',
                                                 'ù',' ','#0','`','´','#13#10',
                                                 '','#39','#13','ç','Ç');
implementation

{-------------------------------------------- Programador Edson de Melo Santos -----------------------------------}

function RetornaLetra(Posicao : Integer) : String;
begin
  Result := TabelaAsc[Posicao];
end;

{-------------------------------------------- Programador Edson de Melo Santos -----------------------------------}

function RetornaPosicao(Letra : String) : Integer;
var i : Integer;
begin
  for i := 0 to Length(TabelaAsc) do
  begin
    if (Letra = TabelaAsc[i])then
    begin
      Result := i;
      exit;
    end;
  end;
end;

{********************************************************************
*  Objetivo :
*  Autor    : Edson de Melo
*  Data     : /2009
********************************************************************}
function RoundDec(Valor : Double; casas : Smallint) :Double;
var
  iMult : Extended;
  s1 : string;
begin
  if casas < 1 then
    iMult := 1
  else
    iMult := Power(10,casas);

  Result := Valor * iMult;

  s1 := FloatToStr(Result);

  if Pos(DecimalSeparator, s1) > 0 then
  begin
    Delete(s1, 1, Pos(DecimalSeparator, s1));
    s1 := Copy(s1, 1, 1);

    if s1 = '5' then
      Result := Trunc(Result) + 1
    else
      Result := Round(Result);
  end;

  Result := Result / iMult;
end;

{********************************************************************
*  Objetivo :
*  Autor    : Edson de Melo
*  Data     : /2009
********************************************************************}
function Empty( Variable: Variant ): Boolean;
var
  Indice: Word;
begin
  Result := false;

  case (VarType(Variable)) of
    varEmpty,
    varNull   : Result := true;
    varInteger: Result := (Variable = 0);
    varDouble : Result := (Variable = 0.00);
    varDate   : Result := (Variable = 0);
    varString :
      begin
        Result := true;

        for Indice := 1 to Length( Variable ) do begin
          if (Copy( Variable, Indice, 1 ) <> ' ') then begin
            Result := false;
            Break;
          end;
        end;
      end;
  end;
end;

{********************************************************************
*  Objetivo :
*  Autor    : Edson de Melo
*  Data     : /2009
********************************************************************}
procedure Aviso(Mensagem:string);
begin
  MessageDlg(Mensagem,mtWarning,[mbOk],0);
end;

{********************************************************************
*  Objetivo :
*  Autor    : Edson de Melo
*  Data     : /2009
********************************************************************}
function Confirma(mensagem: string):boolean;
begin

  if MessageDlg('Confirma ' + mensagem,mtConfirmation,[mbYes,mbNo],0)=idYes then
    result := true
  else
    result := false;
end;

{********************************************************************
*  Objetivo :
*  Autor    : Edson de Melo
*  Data     : //2009
********************************************************************}
function Arred(Valor : Extended) : Int64;
var Aux2 : Int64;
begin
  //Aux  := RoundTo(Valor,1);

  Aux2 := Trunc(Frac(Valor) * 10);
  Aux2 := Aux2 * 10;
  if (Aux2 >= 5)then
    result := Round(Valor)
  else
    result := Round(Valor)+1;
end;

{********************************************************************
*  Objetivo : Retorna se o Número é primo ou Não
*  Autor    : Edson de Melo
*  Data     : //2009
********************************************************************}
Function Primo(Num : Integer):Boolean;
var i : Integer;
begin
  if (Num < 2)then
    result := False
  else
    begin
      Result := True;
      for i := 2 to (Num div 2)do
      begin
        if (Num mod i = 0)then
        begin
          Result := False;
          Break;
        end;
      end;
    end;
end;

{********************************************************************
*  Objetivo : Pega Números Aleatórios em
              um Determinado Intevalo
*  Autor    : Edson de Melo
*  Data     : //2009
********************************************************************}
Function RandomCrip(X1,X2 : Integer):Integer;
begin
  repeat
    Result := Trunc(Abs(Random(X2)));
  until ((Result >= X1) and (Result <= X2));
end;

{********************************************************************
*  Objetivo : Retorna Número Primo Aleatório em
              um Determinado Intervalo
*  Autor    : Edson de Melo
*  Data     : //2009
********************************************************************}
Function RandomPrimo(X1,X2 : Integer):Integer;
begin
  repeat
    result := RandomCrip(X1,X2);
  until (Primo(result));
end;

{********************************************************************
*  Objetivo :
*  Autor    : Edson de Melo
*  Data     : //2009
********************************************************************}
function RaizDominante : extended;
begin
  result := (1/3 *((raiz((29 + sqrt(837))/2,3)) +(raiz((29 - sqrt(837))/2,3))+1));
end;
{********************************************************************
*  Objetivo :
*  Autor    : Edson de Melo
*  Data     : /2009
********************************************************************}
function Raiz(num : real;Expoente : Integer):real;
begin
  result := exp(ln(num)/Expoente);
end;

{********************************************************************
*  Objetivo :
*  Autor    : Edson de Melo
*  Data     : /2009
********************************************************************}
function BinToInt(Value: String): LongInt;
var
  i, Size: Integer;
begin
  Result := 0;
  Size := Length(Value);

  if Size > 63 then
    Size := 63;
  Size := Size - 1;
  for i := Size downto 0 do
  begin
    if Value[i + 1] = '1' then
      Result := Result + (1 shl (Size - i));
  end;
end;

{********************************************************************
*  Objetivo : Converte uma string em binário
*  Autor    : Edson de Melo
*  Data     : /2009
********************************************************************}
function IntToBin(Value: LongInt;Size: Integer): String;
var
  i: Integer;
begin
  Result:='';
  for i:=Size downto 0 do
  begin
    if Value and (1 shl i)<>0 then
      begin
        Result:=Result+'1';
      end
    else
      begin
        Result:=Result+'0';
      end;
  end;
end;

{********************************************************************
*  Objetivo :
*  Autor    : Edson de Melo
*  Data     : //2009
********************************************************************}
function RaizDominante4 : extended;
var b10,b11 : Extended;
begin
  b10    := raiz(19-sqrt(297),3);//(19-297^(1/2))^(1/3) (B10)
  b11    := raiz(19+sqrt(297),3);//(19+297^(1/2))^(1/3) (B11)
  result := (b10+b11+1)/3;//(B10+B11+1)/3
end;

{********************************************************************
*  Objetivo :
*  Autor    : Edson de Melo
*  Data     : //2009
********************************************************************}
function IsMDC(X,Y : Integer):Boolean;
begin
  result := False;
  {if (x mod y = 0)then
    Result := True;}
  if (MDC(X,Y)= 1)then
    result := True;
end;


{********************************************************************
*  Objetivo :
*  Autor    : Edson de Melo
*  Data     : //2009
********************************************************************}
function MDC(X,Y : Integer):Integer;
var resto : Integer;
begin
  while(Y <> 0) do
  begin
    resto := X mod Y;
    X := Y;
    Y := resto;
  end;
  Result :=  X;
end;

{********************************************************************
*  Objetivo :
*  Autor    : Edson de Melo
*  Data     : //2009
********************************************************************}
function RetornaE(Y : Integer): Integer;
var Aux : Integer;
begin
  repeat
    Aux := RandomCrip(1,500);
  until IsMDC(Aux,Y);
  Result := Aux;
end;

{********************************************************************
*  Objetivo :
*  Autor    : Edson de Melo
*  Data     : //2009
********************************************************************}
Function RetornaD(E,Z : Integer): Integer;
Var d : Integer;
begin
  repeat
    d := d + 1;
  until ((((d * e) -1) mod z) <> 0);
  Result := d;
end;
end.
