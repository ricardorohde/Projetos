unit Cript;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

const
  C = 8; //# of key (32bit) words (this is a 192bit key increase # of words for more security can be expandable up to 256 bits)
  R = 20; //# of rounds (can be changed if desired)
  twoto32 = 2147483647{*2};//if you have Delphi 4 erase the brackets around the {*2} and change all the integer types to unsigned integers
  bits = 5;//number of bits that can get 32 combos

type
  Array1 = array[0..C-1] of integer;
  Array2 = array[0..2*R+3] of integer;
  Array3 = array[0..3] of integer;

var
  Desloc :  string; {internal key of the component Key is 192-bits}
  function Flo(b : integer): integer;
  function KeyExpand : Array2;
  function EncryptBlock(d : array3; S : array2): array3;
  function DecryptBlock(d : array3; S : array2): array3;
  procedure EncryptFile(Ifile, Ofile : string);
  procedure DecryptFile(Ifile : string; var Ofile : String);
  procedure RotRWord(d : array3); //move the words right 1
  procedure RotLWord(d : array3); //move the words right 1

implementation

function RotL(A: Longint; Amount: BYTE): Longint; Assembler;
asm
  mov cl, Amount
  rol eax, cl
end;

function RotR(A: Longint; Amount: BYTE): Longint; Assembler;
asm
  mov cl, Amount
  ror eax, cl
end;

function KeyExpand: array2;
const
  P =  $D82B1C0;//$B7E1F4B2;
  Q =  $F6E340A;//$9E37376A;
var
  I, A, J, V, K : Longint;
  S : Array2;
  Strn : string[32];
  Key : Array1;
begin
  {the user can pass any key length up to 256-bits}
  Strn := Copy(Desloc, 1, Length(Desloc));
  for I := Length(Desloc) + 1 to 32 do
      Strn[I] := #0;{Pad the key with nulls}
  Key[0] := 0;Key[4] := 0;
  Key[1] := 0;Key[5] := 0;
  Key[2] := 0;Key[6] := 0;
  Key[3] := 0;Key[7] := 0;
  Move(Strn, Key, SizeOf(Key));

  for I := 0 to (2*r+3) do S[I] := 0;

  S[0] := P;

  for I := 1 to (2*r+3) do
      S[I] := S[I - 1] + Q;

  A := 0; I := 0; J := 0;

  V := 3 * (2*R-4);
  for K := 1 to V do
  begin
    S[I] := rotl(S[I] + A, 3);
    A := S[I];

    Key[J] := rotl(Key[J] + A , A and 31);
    I := (I+1) mod (2*R+4);
    J := (J+1) mod C;
  end;
  KeyExpand := S;
end;

function Flo(b : integer): integer;
begin
  Flo := (b * ( 2 * b + 1 ) ) mod twoto32;
end;

procedure RotLWord(d : array3); //move the words Left 1
var
  b : array3;
begin
  b[0] := d[1]; b[1] := d[2]; b[2] := d[3]; b[3] := d[0];
  d := b;
end;

procedure RotRWord(d : array3); //move the words right 1
var
  b : array3;
begin
  b[0] := d[3]; b[1] := d[0]; b[2] := d[1]; b[3] := d[2];
  d := b;
end;

function EncryptBlock(d : array3; S : array2): array3;
var
  T, U, I : integer;
begin
  d[1] := d[1] + S[0] mod twoto32;
  d[3] := d[3] + S[1] mod twoto32;

  for I := 1 to R do
  begin
    T := rotl(Flo(d[1]), bits);
    U := rotl(Flo(d[3]), bits);

    d[0] := (rotl(d[0] xor T,U and 31)+ S[2*I]) mod twoto32;
    d[2] := (rotl(d[2] xor U,T and 31)+ S[2*I+1]) mod twoto32;
    rotlword(d);
  end;
  d[0] := (d[0] + S[2*R+2]) mod twoto32;
  d[2] := (d[2] + S[2*R+3]) mod twoto32;

  EncryptBlock := d;
  d[0] := 0;
  d[1] := 0;
  d[2] := 0;
  d[3] := 0;
end;

function DecryptBlock(d : array3; S : array2): array3;
var
  T, U, I : integer;
begin
  d[0] := (d[0] - S[2*R+2]) mod twoto32;
  d[2] := (d[2] - S[2*R+3]) mod twoto32;

  for I := R downto 1 do
  begin
    rotrword(d);
    T := rotl(Flo(d[1]), bits);
    U := rotl(Flo(d[3]), bits);

    d[0] := (rotr(d[0]-S[2*I],U and 31) xor T) mod twoto32;
    d[2] := (rotr(d[2]-S[2*I+1],T and 31) xor U) mod twoto32;
  end;
  d[1] := (d[1] - S[0]) mod twoto32;
  d[3] := (d[3] - S[1]) mod twoto32;

  Decryptblock := d;
  d[0] := 0;
  d[1] := 0;
  d[2] := 0;
  d[3] := 0;
end;

procedure EncryptFile(Ifile, OFile : string);
var
  Store : array2;
  I, NumRead, NumWritten : Integer;
  Buff : array[0..4095] of Char;
  IntBuff : array[0..1023] of Integer;
  Arr : array3;
  Outputf : file;
  CountBits : Integer;
begin
  CountBits := 0;

  AssignFile(Outputf, Ofile);
  Rewrite(Outputf, 1);

  Store := KeyExpand;
  for I := 0 to 3 do Arr[I] := 0;
  for I := 0 to 4095 do Buff[I] := #0;
  for I := 0 to 1023 do IntBuff[I] := 0;

  for I := 1 to Length(Ifile) do Buff[I - 1] := Ifile[I];
  NumRead := Length(Ifile);

  if NumRead > 0 then
  begin
    Move(Buff, IntBuff, SizeOf(Buff));

    I := 0;
    while I <= 1023 do
    begin
      if IntBuff[I] <> 0 then
      begin
        Arr[0] := IntBuff[I];
        Arr[1] := IntBuff[I+1];
        Arr[2] := IntBuff[I+2];
        Arr[3] := IntBuff[I+3];

        Arr := EncryptBlock(Arr, Store);

        IntBuff[I]   := Arr[0];
        IntBuff[I+1] := Arr[1];
        IntBuff[I+2] := Arr[2];
        IntBuff[I+3] := Arr[3];
        CountBits := I + 4;
      end;
      Inc(I,4);
    end;

    for I := 0 to 4095 do Buff[I] := #0;
    Move(IntBuff, Buff, SizeOf(IntBuff));
    BlockWrite(Outputf, Buff, (CountBits * 4), NumWritten);
  end;
  CloseFile(Outputf);
end;

procedure DecryptFile(Ifile : string; var Ofile : string);
var
  Store : array2;
  I, NumRead : Integer;
  Buff : array[0..4095] of Char;
  IntBuff : array[0..1023] of Integer;
  Arr : array3;
  Inputf : file;
begin
  AssignFile(Inputf, Ifile);
  Reset(Inputf,1);
  Ofile := '';

  Store := KeyExpand;
  repeat
    for I := 0 to 3 do Arr[I] := 0;
    for I := 0 to 4095 do Buff[I] := #0;
    for I := 0 to 1023 do IntBuff[I] := 0;

    BlockRead(Inputf, Buff, SizeOf(Buff), NumRead);
    if NumRead > 0 then
    begin
      Move(Buff, IntBuff, SizeOf(Buff));

      I := 0;
      while I <= 1023 do
      begin
        if IntBuff[I] <> 0 then
        begin
          Arr[0] := IntBuff[I];
          Arr[1] := IntBuff[I+1];
          Arr[2] := IntBuff[I+2];
          Arr[3] := IntBuff[I+3];

          Arr := DecryptBlock(Arr, Store);

          IntBuff[I]   := Arr[0];
          IntBuff[I+1] := Arr[1];
          IntBuff[I+2] := Arr[2];
          IntBuff[I+3] := Arr[3];
        end;
        Inc(I,4);
      end;

      for I := 0 to 4095 do Buff[I] := #0;
      Move(IntBuff, Buff, SizeOf(IntBuff));
      for I := 0 to 4095 do
        if Buff[I] = #0
        then Break
        else Ofile := Ofile + Buff[I];
    end;
  until (NumRead = 0);
  CloseFile(Inputf);
end;

end.
