unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    btnSalvar: TButton;
    btnVoltar: TButton;
    mmo: TMemo;
    btnCarregar: TButton;
    procedure btnVoltarClick(Sender: TObject);
    procedure btnCarregarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}
uses
  Unit1;

procedure TForm2.btnVoltarClick(Sender: TObject);
begin
  if Assigned(Form2) then
    begin
      Form2.Close();
    end;
end;

procedure TForm2.btnCarregarClick(Sender: TObject);
begin
  mmo.Text := Form1.passaTexto;
end;

end.
