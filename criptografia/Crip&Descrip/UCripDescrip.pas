unit UCripDescrip;
    { Desenvolvido em delphi 7
      No dia 08/12/2005
      Aluno:------------------ }
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, AppEvnts;


type
  TForm1 = class(TForm)
    EdtString: TEdit;
    BntCriptografar: TButton;
    BntDescriptografar: TButton;
    Label1: TLabel;
    EdtCriptografado: TEdit;
    EdtDescriptografado: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    BntLimparCampo: TButton;
    BntFechar: TButton;
    StatusBar1: TStatusBar;
    procedure BntCriptografarClick(Sender: TObject);
    procedure BntDescriptografarClick(Sender: TObject);
    procedure BntFecharClick(Sender: TObject);
    procedure BntLimparCampoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

const Masc=90;  // Chave da criptografia e descriptografia

  {--------Funcao--Criptografar------- }
function EncriptVar(Texto: String):String;
var
  r : string;
  i : integer;
begin
   For i := 1 to Length(texto) do
     r := r + chr(Ord(Texto[i]) + i + Masc);
   result:= r;
end;

   {--------Funcao--Descriptografar------- }
function DesencriptarVar(Texto: String):String;
var
  w : string;
  i : integer;
begin
   FOR i := 1 TO Length(texto) do
     w := w + chr( Ord(texto[i]) - i - Masc );
   result:= w;
end;
   //------------------------------------//
procedure TForm1.BntCriptografarClick(Sender: TObject);
begin
    EdtCriptografado.Text:= EncriptVar(edtString.Text);
   
end;
  //------------------------------------//
procedure TForm1.BntDescriptografarClick(Sender: TObject);
begin
    EdtDescriptografado.Text:=DesencriptarVar(EdtCriptografado.Text);
end;
 //-------------------------------------//
procedure TForm1.BntFecharClick(Sender: TObject);
begin
   Close;
end;
 //------------------------------------//
procedure TForm1.BntLimparCampoClick(Sender: TObject);
begin
   EdtString.Clear;
   EdtCriptografado.Clear;
   EdtDescriptografado.Clear;
end;

end.
