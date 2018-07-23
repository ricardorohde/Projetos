unit uCriptografia;

interface

uses
  Forms,DB, SysUtils, Variants,IniFiles,Controls,
  Windows, Messages, Classes, Graphics, Dialogs,StdCtrls, Buttons, Math;

type
  TCriptografia = class(TObject)
  private
    { Private declarations }

    Vet : array[0..66] of Extended;
//    Aux : array[0..66] of Extended;


{-------------------------------------------- RSA -----------------------------------}
    function  CriptografiaRSA(Mensagem : String): string;
//    procedure CriptografaTextoRSA(FileName : String);

    function  DescriptografaRSA(Mensagem : String) : String;
//    procedure DescriptografaTextoRSA(FileName : String);

{-------------------------------------------- Recorrência 1 (recorrência  Xn+2 = Xn+1 + Xn) -----------------------------------}
    Procedure CripRecorrencia1(Letra : Integer;Var Vet : array of Extended);
    Function  DesCripRecorrencia1(Posicao : Extended;Var Vet : array of Extended):Integer;

{-------------------------------------------- Recorrência 2 (recorrência  Xn+3 = Xn+1 + Xn) -----------------------------------}
    procedure CripRecorrencia2(Letra : Array of Integer;Var Vet : array of Extended);
    Function  DesCripRecorrencia2(Posicao1 : Extended; Var Vet : array of Extended;Var PosicaoAnt : Integer):Integer;

{-------------------------------------------- Recorrência  Xn+3= 2Xn+2 - Xn+1 + Xn -----------------------------------}
    procedure CripRecorrencia3(Letra : Array of Integer;Var Vet : array of Extended);
    Function  DesCripRecorrencia3(Posicao1 : Extended; Var Vet : array of Extended;Var PosicaoAnt : Integer):Integer;

{-------------------------------------------- Recorrência TRI Xn+3 = Xn+2 + Xn+1 + Xn -----------------------------------}
    procedure CripRecorrencia4(Letra : Array of Integer;Var Vet : array of Extended);
    Function  DesCripRecorrencia4(Posicao1 : Extended; Var Vet : array of Extended;Var PosicaoAnt : Integer):Integer;

{-------------------------------------------- Arquivo -----------------------------------}
//    procedure CriptografaArquivo(FileName : String);
//    procedure DesCripArquivo(FileName : String);

  public
    { Public declarations }

{-------------------------------------------- Módulos Auxiliares  -----------------------------------}

    {procedure CriptografaTexto(FileName : String);
    procedure DesCriptografaTexto(FileName : String);}

    function CriptografaTexto(Mensagem : String) : string;
    function DesCriptografaTexto(Mensagem : String) : string;


//    constructor create();
//    destructor destroy;
end;


{var
  frmCriptografia: TCriptografia;}

Const Numero   = 150;
Const Extensao = '.txt';

implementation

uses uTabelaAscI,StrUtils;

{ TCriptografia }


{********************************************************************
*  Objetivo :
*  Autor    : Edson de Melo
*  Data     : //2009
********************************************************************}
Function TCriptografia.CriptografiaRSA(Mensagem : String): String;
Var  primo1,primo2,x,n_resto,
     n,d,{fi_n,e,r,aux,}
     carac{,i} : Integer;
begin
   primo1 := 23;
   Primo2 := 31;

   n :=   primo1*primo2;
   //fi_n := (primo1-1)*(primo2-1);

   //e := 31;
   //r := fi_n;
   //aux := 1;

   Carac := StrToInt(Mensagem);

   d := 511;

   n_resto := 1; // variavel acumuladora
   while (d >1) do // testa se d é menor do que 1
     begin
       x := carac * carac; // x recebe o quadrado do caracter
       if(x > n) then // testa de o quadrado do caracter é menor que o n
         x := x mod n; // se teste for verdadeiro x recebe mod dele
       n_resto := n_resto * x ; // acumuladora recebe ela vezes o quadrado do prox numero
       if(n_resto > n) then// testa se a acumuladora é maior que n
         n_resto := n_resto mod n ; // se for maior acumuladora recebe ela mod n
       d := d-2; // chave privada recebe ela menos 2
     end;// fim while
   if (d = 1)then // se o que resta em d for 1
     begin
       n_resto := n_resto * carac; // ele multiplica acumuladora com o caracter
       if (n_resto > n) then// testa de a acumuladora é maior que n
         n_resto := n_resto mod n ; // se for mario acumuladora recebe ela mod n
     end;// fim if

   result := (IntToStr(n_resto));
end;


{********************************************************************
*  Objetivo :
*  Autor    : Edson de Melo
*  Data     : //2009
********************************************************************}
//procedure TCriptografia.CriptografaTextoRSA(FileName: String);
//var //j,Num,
//    i : Integer;
//    Texto   : String;
//
//    StrsCrip1,
//    StrsCrip2 : TStringList;
//begin
//  Texto := '';
//
//  StrsCrip1 := TStringList.Create;
//  StrsCrip1.LoadFromFile(FileName);
//
//  StrsCrip2 := TStringList.Create;
//
//  for I := 0 to StrsCrip1.Count - 1 do
//  begin
//    Texto := CriptografiaRSA(StrsCrip1.ValueFromIndex[i]);
//
//    StrsCrip2.Add(Texto);
//    Texto := '';
//  end;
//
//  {Delete(FileName,AnsiPos(Extensao,FileName),Length(FileName));
//  if DirectoryExists(FileName+'RSA'+Extensao) then
//    DeleteFile(FileName+'RSA'+Extensao);
//
//  StrsCrip2.SaveToFile(FileName+'RSA'+Extensao);}
//  StrsCrip2.Free;
//end;

{********************************************************************
*  Objetivo :
*  Autor    : Edson de Melo
*  Data     : //2009
********************************************************************}
function TCriptografia.DescriptografaRSA(Mensagem : String): String;
Var  primo1,primo2,x,n_resto,
     n,e,{d,fi_n,r,aux,}
     //carac,
     //i,
     Crip : Integer;
begin
  primo1 := 23;
  Primo2 := 31;

  n :=   primo1*primo2;
  //fi_n := (primo1-1)*(primo2-1);
  e := 31;
//  r := fi_n;
//  aux := 1;
  //d := 511;

  Crip := StrToInt(Mensagem);

  n_resto := 1; // variavel acumuladora
  while(e > 1)do  // testa se e é menor do que 1
    begin
      x := crip*crip; // x recebe o quadrado do caracter
      if(x > n) then// testa de o quadrado do caracter é menor que o n
        x := x mod n; // se teste for verdadeiro x recebe mod dele
       n_resto := n_resto * x; // acumuladora recebe ela vezes o quadrado do prox numero
      if (n_resto > n ) then// testa se a acumuladora é maior que n
        n_resto := n_resto mod n; // se for maior acumuladora recebe ela mod n
      e := e-2; // chave publica recebe ela menos 2
    end;//fim while
  if (e = 1 )then // se o que resta em e for 1
    begin
      n_resto := n_resto * crip; // ele multiplica acumuladora com o caracter
      if (n_resto > n)then // testa de a acumuladora é maior que n
        n_resto := n_resto mod n; // se for mario acumuladora recebe ela mod n
    end;//fim if

  Result := IntToStr(n_resto); 
end;

{********************************************************************
*  Objetivo : j
*  Autor    : Edson de Melo
*  Data     : //2009
********************************************************************}
//procedure TCriptografia.DescriptografaTextoRSA(FileName: String);
//var i : Integer;
//    //,j,Num : Integer;
//    Texto   : String;
////    Letra   : String;
//
//    StrsCrip1,
//    StrsCrip2 : TStringList;
//begin
//  Texto := '';
//
//  StrsCrip1 := TStringList.Create;
//  StrsCrip1.LoadFromFile(FileName);
//
//  StrsCrip2 := TStringList.Create;
//
//  for I := 0 to StrsCrip1.Count - 1 do
//  begin
//    Texto := DescriptografaRSA(StrsCrip1.ValueFromIndex[i]);
//
//    StrsCrip2.Add(Texto);
//    Texto := '';
//  end;
//
//  {Delete(FileName,AnsiPos(Extensao,FileName),Length(FileName));
//  if DirectoryExists(FileName+'DCripRSA'+Extensao) then
//    DeleteFile(FileName+'DcripRSA'+Extensao);
//
//  StrsCrip2.SaveToFile(FileName+'RSA'+Extensao);}
//  StrsCrip2.Free;
//end;

{********************************************************************
*  Objetivo : Criptografa Texto
*  Autor    : Edson de Melo
*  Data     : 2/10/2009
********************************************************************}
function TCriptografia.CriptografaTexto(Mensagem : String) : string;
var i,j,//K,
    Mult,
    Num,Cont   : Integer;
    Letra,
    LetraAnt,
    Aux1,
    Aux2        : String;
    Texto       : AnsiString;

    StrsCrip1   : TStringList;
//    StrsCrip2   : TStringList;

    Recorrencia : Integer;
begin
  LetraAnt  := '';
  StrsCrip1 := TStringList.Create;
  //StrsCrip1.LoadFromFile(FileName);
  StrsCrip1.Add(Mensagem);

  //StrsCrip2 := TStringList.Create;

  //StrsCrip2.Clear;

  result := '';
  
  for I := 0 to StrsCrip1.Count - 1 do
  begin
    Texto := '';
    Cont := 2;
    Recorrencia := RandomCrip(1,4);

    for j := 1 to (Length(StrsCrip1.ValueFromIndex[i])+ 2) do
    begin
      if not(Length(StrsCrip1.ValueFromIndex[i])<= 0)then
      begin
        if (StrsCrip1[i][j] = #39) then
          Letra := '#39'
        else
          if (StrsCrip1[i][j] = #0)then
            Letra := '#0'
          else
            Letra := StrsCrip1[i][j];

        Case Recorrencia of
          1 :
              Begin
                CripRecorrencia1(RetornaPosicao(Letra),Vet);
                Num := RandomCrip(25,45);
                Texto := Texto + StringOfChar('0',20 - Length(FloatToStr(Vet[Num])))+ FloatToStr(Vet[Num]);
              end;
          2 :
             begin
               if (j >= Cont)then
               begin
                 CripRecorrencia2([RetornaPosicao(LetraAnt),RetornaPosicao(Letra)],Vet);
                 Cont := Cont + 2;
                 Num := RandomCrip(50,66);
                 Texto := Texto + StringOfChar('0',20 - Length(FloatToStr(Vet[Num])))+ FloatToStr(Vet[Num]);
               end;
             end;
          3 :
             begin
               if (j >= Cont)then
               begin
                 CripRecorrencia3([RetornaPosicao(LetraAnt),RetornaPosicao(Letra)],Vet);
                 Cont := Cont + 2;
                 Num := RandomCrip(25,45);
                 Texto := Texto + StringOfChar('0',20 - Length(FloatToStr(Vet[Num])))+ FloatToStr(Vet[Num]);
               end;
             end;
          4 :
             begin
               if (j >= Cont)then
               begin
                 CripRecorrencia4([RetornaPosicao(LetraAnt),RetornaPosicao(Letra)],Vet);
                 Cont := Cont + 2;
                 Num := RandomCrip(25,37);
                 Texto := Texto + StringOfChar('0',20 - Length(FloatToStr(Vet[Num])))+ FloatToStr(Vet[Num]);
               end;
             end;
        end;//Fim do Case
        LetraAnt := Letra;
      end;
    end;

    Mult := RandomCrip(25,150);
    Aux1 := StringOfChar('0',10 - Length(IntToStr(Mult)))+ IntToStr(Mult);
    Aux2 := StringOfChar('0',10 - Length(CriptografiaRSA(IntToStr(Recorrencia * Mult))))+ CriptografiaRSA(IntToStr(Recorrencia * Mult));
    //StrsCrip2.Add(Aux1+Aux2+Texto);

    result := Aux1+Aux2+Texto;
    //StrsCrip2.Add(IntToStr(Recorrencia)+' - '+Texto);
  end;

  {Delete(FileName,AnsiPos(Extensao,FileName),Length(FileName));
  if DirectoryExists(FileName+'Crip'+Extensao) then
    DeleteFile(FileName+'Crip'+Extensao);

  StrsCrip2.SaveToFile(FileName+'Crip'+Extensao);
  StrsCrip2.Free;}
end;


function TCriptografia.DesCriptografaTexto(Mensagem : String): string;
var i,j,Tamanho,
    PosicaoAnt,
    //Cont   : Integer;
    Mult   : Integer;

    Texto,
    Letra,
    LetraAnt    : string;
    Dcrip       : AnsiString;

    StrsCrip2   : TStringList;

    Recorrencia : Integer;
begin
  StrsCrip2 := TStringList.Create;
  StrsCrip2.Add(Mensagem);
  Texto  := '';
  Dcrip  := '';
  result := '';

  for I := 0 to StrsCrip2.Count - 1 do //Linha
  begin

    j := 21;

    Mult        := StrToInt(Copy(StrsCrip2[i],1,10));

    Recorrencia := StrToInt(DescriptografaRSA(Copy(StrsCrip2[i],11,10)));

    Recorrencia := (Recorrencia div Mult);

    if length(StrsCrip2.ValueFromIndex[I]) > 20 then
      Tamanho := length(StrsCrip2.ValueFromIndex[I])
    else
      Tamanho := length(StrsCrip2.ValueFromIndex[I])+1;

    while (j <= Tamanho) do //Coluna
    begin
      Case Recorrencia of
        1 :
            Begin
              Texto := Copy(StrsCrip2[i],j,20);
              if not (Texto = '')then
                Letra := RetornaLetra(DesCripRecorrencia1(StrToFloat(Texto),vet))
            end;
        2 :
           begin
             Texto    := Copy(StrsCrip2[i],j,20);
             if not(Texto = '')then
             begin
               Letra    := RetornaLetra(DesCripRecorrencia2(StrToFloat(Texto),vet,PosicaoAnt));
               LetraAnt := RetornaLetra(PosicaoAnt);
             end;
           end;
        3 :
           begin
             Texto    := Copy(StrsCrip2[i],j,20);
             if not(Texto = '')then
             begin
               Letra    := RetornaLetra(DesCripRecorrencia3(StrToFloat(Texto),vet,PosicaoAnt));
               LetraAnt := RetornaLetra(PosicaoAnt);
             end;
           end;
        4 :
           begin
             Texto    := Copy(StrsCrip2[i],j,20);
             if not(Texto = '')then
             begin
               Letra    := RetornaLetra(DesCripRecorrencia4(StrToFloat(Texto),vet,PosicaoAnt));
               LetraAnt := RetornaLetra(PosicaoAnt);
             end;
           end;
      end;//Fim do Case

      if (Recorrencia <> 1)then
        begin
          if (Letra = '#39') then
            Dcrip := Dcrip + #39
          else
            if(Letra = '#0') then
              Dcrip := Dcrip + #0
            else
              Dcrip := Dcrip + Letra;

          if (LetraAnt = '#39')then
            Dcrip := Dcrip + #39
          else
            if (LetraAnt = '#0')then
              Dcrip := Dcrip + #0
            else
              Dcrip := Dcrip + LetraAnt;
        end
      else
        begin
          if (Letra = '#39') then
            Dcrip := Dcrip + #39
          else
            if(Letra = '#0') then
              Dcrip := Dcrip + #0
            else
              Dcrip := Dcrip + Letra;
        end;

      j := j + 20;
    end;
    //result := StringReplace(Dcrip,#0#0,'',[rfReplaceAll]);
    result := Trim(Dcrip);
    Dcrip := '';
  end;
  
  {Delete(FileName,AnsiPos(Extensao,FileName),Length(FileName));

  if DirectoryExists(FileName+'Dcrip'+Extensao) then
    DeleteFile(FileName+'Dcrip'+Extensao);

  StrsDCrip.SaveToFile(FileName+'Dcrip'+Extensao);}
  StrsCrip2.Free;
end;

{********************************************************************
*  Objetivo : Recorrência 1 (recorrência  Xn+2 = Xn+1 + Xn)
*  Autor    : Edson de Melo
*  Data     : 2/10/2009
********************************************************************}
procedure TCriptografia.CripRecorrencia1(Letra : Integer;Var Vet : array of Extended);
Var i : Integer;
begin
  Vet[0] := Numero;
  Vet[1] := Letra;
  vet[2] := Vet[0]+Vet[1];
  for i := 3 to 66 do
  begin
    vet[i] := 0;
    vet[i] := vet[i] + (vet[i-1]+ vet[i-2]);
  end;
end;

{********************************************************************
*  Objetivo : Recorrência 1 (recorrência  Xn+2 = Xn+1 + Xn)
*  Autor    : Edson de Melo
*  Data     : 2/10/2009
********************************************************************}
function TCriptografia.DesCripRecorrencia1(Posicao : Extended;var Vet: array of Extended):Integer;
var VetAux : array [0.. 66] of Extended;
    i : Integer;
    RaizDominante : Extended;
begin
  Result := 0;
  // (1/2)(raiz(5)+1)
  RaizDominante := (0.5 * (sqrt(5)+1));

  VetAux[0] := Posicao;
  vetAux[1] := Round(VetAux[0]/ RaizDominante);
  for i := 2 to 66 do
    begin
      Vetaux[i] := VetAux[i- 2] - VetAux[i- 1];
      if (Vetaux[i] = Numero)then
        begin
          Result := Trunc(Vetaux[i-1]);
          exit;
        end;
    end;
end;

{********************************************************************
*  Objetivo : Recorrência 2 (recorrência  Xn+3 = Xn+1 + Xn)
*  Autor    : Edson de Melo
*  Data     : 08/10/2009
********************************************************************}
procedure TCriptografia.CripRecorrencia2(Letra : Array of Integer;
  var Vet: array of Extended);
Var i : Integer;
begin
  Vet[0] := Numero;
  Vet[1] := Letra[0];
  vet[2] := Letra[1];
  vet[3] := vet[0]+vet[2];

  for i := 4 to 66 do
  begin
    vet[i] := 0;
    vet[i] := vet[i-1]+ vet[i-3];
  end;
end;

{********************************************************************
*  Objetivo :
*  Autor    : Edson de Melo
*  Data     : //2009
********************************************************************}
function TCriptografia.DesCripRecorrencia2(Posicao1: Extended;
  var Vet: array of Extended; var PosicaoAnt: Integer): Integer;
var VetAux : array [0.. 70] of Extended;
    i : Integer;
const RaizDominante = 1.465571231876766;
begin
  //RaizDominante := 1/3 *(power((29 + power(837,1/2))/2,1/3)+power((29 - power(837,1/2))/2,1/3) +1);
  //RD := RoundDec(RaizDominante,9);

  Result    := 0;
  VetAux[0] := posicao1;
  vetAux[1] := Round(posicao1/RaizDominante);
  vetAux[2] := Round(VetAux[1]/ RaizDominante);

  for i := 3 to 70 do
  begin
    Vetaux[i] :=  VetAux[i-3] - VetAux[i- 2];
    if (Vetaux[i] = Numero)then
    begin
      PosicaoAnt := Trunc(Vetaux[i-2]);
      Result     := Trunc(Vetaux[i-1]);
      exit;
    end;
  end;
end;

{********************************************************************
*  Objetivo : recorrência  Xn+3= 2Xn+2 - Xn+1 + Xn
*  Autor    : Edson de Melo
*  Data     : 04/11/2009
********************************************************************}
procedure TCriptografia.CripRecorrencia3(Letra : Array of Integer;
  var Vet: array of Extended);
Var i : Integer;
begin
  Vet[0] := Numero;
  Vet[1] := Letra[0];
  vet[2] := Letra[1];

  for i := 3 to 66 do
  begin
    vet[i] := 0;
    vet[i] := 2*vet[i-1]-vet[i-2]+vet[i-3];
  end;
end;

{********************************************************************
*  Objetivo :
*  Autor    : Edson de Melo
*  Data     : //2009
********************************************************************}
function TCriptografia.DesCripRecorrencia3(Posicao1: Extended;
  var Vet: array of Extended; var PosicaoAnt: Integer): Integer;
var VetAux : array [0.. 70] of Extended;
    i : Integer;
const RaizDominante = 1.754877666246697;
begin
  Result    := 0;
  VetAux[0] := posicao1;
  vetAux[1] := Round(posicao1/RaizDominante);
  vetAux[2] := Round(VetAux[1]/ RaizDominante);

  for i := 3 to 70 do
  begin
    Vetaux[i] := Vetaux[i-3]-2*Vetaux[i-2]+Vetaux[i-1];
    if (Vetaux[i] = Numero)then
    begin
      PosicaoAnt := Trunc(Vetaux[i-2]);
      Result     := Trunc(Vetaux[i-1]);
      exit;
    end;
  end;
end;


{********************************************************************
*  Objetivo : Recorrência TRI Xn+3 = Xn+2 + Xn+1 + Xn
*  Autor    : Edson de Melo
*  Data     : 04/11/2009
********************************************************************}
procedure TCriptografia.CripRecorrencia4(Letra: array of Integer;
  var Vet: array of Extended);
Var i : Integer;
begin
  Vet[0] := Numero;
  Vet[1] := Letra[0];
  vet[2] := Letra[1];

  for i := 3 to 66 do
  begin
    vet[i] := 0;
    vet[i] := (vet[i-1]+vet[i-2]+vet[i-3]);
  end;
end;

{********************************************************************
*  Objetivo :
*  Autor    : Edson de Melo
*  Data     : //2009
********************************************************************}
function TCriptografia.DesCripRecorrencia4(Posicao1: Extended;
  var Vet: array of Extended; var PosicaoAnt: Integer): Integer;
var VetAux : array [0.. 70] of Extended;
    i  : Integer;
begin
  Result    := 0;
  VetAux[0] := posicao1;
  vetAux[1] := Round(posicao1/RaizDominante4);
  vetAux[2] := Round(VetAux[1]/ RaizDominante4);

  for i := 3 to 70 do
  begin
    Vetaux[i] := Vetaux[i-3]-(Vetaux[i-2]+Vetaux[i-1]);
    if (Vetaux[i] = Numero)then
    begin
      PosicaoAnt := Trunc(Vetaux[i-2]);
      Result     := Trunc(Vetaux[i-1]);
      exit;
    end;
  end;
end;


{********************************************************************
*  Objetivo :
*  Autor    : Edson de Melo
*  Data     : //2009
********************************************************************}
//procedure TCriptografia.CriptografaArquivo(FileName: String);
//var
//  sArquivo : TFileStream;
//  Aux      : Integer;
//
//  Bitcod   : AnsiString;
//
//  StrsArq : TStringList;
//begin
//  StrsArq  := TStringList.Create;
//
//  sArquivo := TFileStream.Create(FileName, fmOpenRead);
//  Bitcod   := '';
//
//  while sArquivo.Position <> sArquivo.Size do
//  begin
//    sArquivo.ReadBuffer(Aux, 1);
//    Bitcod := Bitcod + IntToBin(Aux, 8);
//  end;
//
//  StrsArq.Add(Bitcod);
//
//  {Delete(FileName,AnsiPos(Extensao,FileName),Length(FileName));
//  if DirectoryExists(FileName+'CripArq'+Extensao) then
//    DeleteFile(FileName+'CripArq'+Extensao);
//
//  StrsArq.SaveToFile(FileName+'Arq'+Extensao);}
//  StrsArq.Free;
//  sArquivo.Free;
//end;

{********************************************************************
*  Objetivo :
*  Autor    : Edson de Melo
*  Data     : //2009
********************************************************************}
//procedure TCriptografia.DesCripArquivo(FileName: String);
//var
  //sArquivo : TFileStream;
//  Aux      : Integer;
//
//  Bitcod   : AnsiString;
//
//  StrsArq : TStringList;
//begin
{  sArquivo := TFileStream.Create();
  Bitcod   := '';

  StrsArq := TStringList.Create;

  StrsArq.LoadFromFile(FileName);

  for I := 0 to StrsArq.Count - 1 do //Linha
  begin
    for j := 1 length(StrsCrip2.ValueFromIndex[I]) do
    begin
    end;
  end; }
//end;

//constructor TCriptografia.create;
//begin
//
//end;

//destructor TCriptografia.destroy;
//begin
//  inherited;
//end;

end.

