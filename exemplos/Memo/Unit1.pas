unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    procedure InserirTexto(texto: String; objeto: TMemo);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
//var
//  Linha, Coluna: integer;
begin
//  with Memo1 do
//  begin
//    Linha := Perform(EM_LINEFROMCHAR,SelStart, 0);
//
//    Label1.Caption := IntToStr(Linha);
//
//    Coluna := SelStart - Perform(EM_LINEINDEX, Linha, 0);
//
//    Label2.Caption := IntToStr(Coluna);
//  end;
  InserirTexto(Edit1.Text, Memo1)
end;

procedure TForm1.InserirTexto(texto: String; objeto : TMemo);
var
  textoA,
  textoD : String;
  Pos : Integer;
begin
  // Armazena a coluna em que está o cursor...
  pos := objeto.SelStart;

  // Armazena o texto anterior...
  textoA := Copy(objeto.Text,1,POS);
  // Armazena o texto depois...
  textoD := Copy(objeto.Text,POS+1,Length(objeto.Text));

  // Armazena o texto anterior, o texto desejato, e o texto posterior...
  Objeto.Text := textoA +' '+ texto +' '+ textoD;

//  Objeto.SelLength;
  Objeto.SelStart := Length(objeto.Text);//Objeto.Perform (EM_LINEINDEX, 1, 0);
  Objeto.SetFocus;
end;

end.
