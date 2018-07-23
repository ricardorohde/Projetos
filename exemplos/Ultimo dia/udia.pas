unit udia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var
  Present: TDateTime;
  Data: TDateTime;
  Ano, Mes, Dia :  Word;
begin
  Present:= StrToDate(Edit1.Text);;
  DecodeDate(Present, Ano, Mes, Dia);
  Label1.Caption := 'Hoje é dia ' + IntToStr(Dia) + ' do Mês '
    + IntToStr(Mes) + ' de ' + IntToStr(Ano);
  Present := Present + (32 - Dia);
  DecodeDate(Present, Ano, Mes, Dia);
  Present := EncodeDate(Ano, Mes, 01 ) -1;
  DecodeDate(Present, Ano, Mes, Dia);
  Label2.Caption := 'Ultimo dia do Mês ' + IntToStr(Mes) + ' é ' + IntToStr(Dia);
end;
end.
