unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Wcrypt2;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    function md5(const Input: String): String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

Const
  // Chaves de encriptação
  StKey = 7848567;
  MtKey = 1741378;
  AdKey = 6574985;

implementation

{$R *.dfm}
// ************************ Funcões Encriptação/Desencriptação **********************
// PARA ENCRIPTAR
{$R-} {$Q-}
// Habilita/Desabilita a geração de checagem de código de Faixa e
// de checagem de código exceção de overflow
function EncryptSTR(Const InString:String; StartKey,MultKey,AddKey:Integer): String;
var I : Byte;
begin
  Result := ''; 
  for I := 1 to Length(InString) do 
  begin 
    Result := Result + Char(Byte(InString[I]) xor (StartKey shr 8));
    StartKey := (Byte(Result[I]) + StartKey) * MultKey + AddKey;
  end;
end; 

// PARA DESENCRIPTAR 
function DecryptSTR(Const InString: String; StartKey, MultKey, AddKey: Integer): String; 
var I : Byte; 
begin 
  Result := '';
  for I := 1 to Length(InString) do 
  begin 
    Result := Result + Char(Byte(InString[I]) xor (StartKey shr 8));
    StartKey := (Byte(InString[I]) + StartKey) * MultKey + AddKey;
  end; 
end; 
{$R+} {$Q+} 
// ************************ Funcões Encriptação/Desencriptação **********************
procedure TForm1.Button1Click(Sender: TObject);
begin
  ShowMessage(DecryptSTR(EncryptSTR(Edit1.Text, StKey, MtKey, AdKey), StKey, MtKey, AdKey));
end;

function TForm1.md5(const Input: String): String;
var
  hCryptProvider: HCRYPTPROV;
  hHash: HCRYPTHASH;
  bHash: array[0..$7f] of Byte;
  dwHashLen: DWORD;
  pbContent: PByte;
  i: Integer;
begin
  dwHashLen := 16;
  pbContent := Pointer(PChar(Input));
  Result := '';

  if CryptAcquireContext(@hCryptProvider, nil, nil, PROV_RSA_FULL, CRYPT_VERIFYCONTEXT or CRYPT_MACHINE_KEYSET) then
  begin
    if CryptCreateHash(hCryptProvider, CALG_MD5, 0, 0, @hHash) then
    begin
      if CryptHashData(hHash, pbContent, Length(Input), 0) then
      begin
        if CryptGetHashParam(hHash, HP_HASHVAL, @bHash[0], @dwHashLen, 0) then
        begin
          for i := 0 to dwHashLen - 1 do
          begin
            Result := Result + Format('%.2x', [bHash[i]]);
          end;
        end;
      end;
      CryptDestroyHash(hHash);
    end;
    CryptReleaseContext(hCryptProvider, 0);
  end;
  Result := AnsiLowerCase(Result);

end;

end.
