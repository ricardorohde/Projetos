unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxButtons;

type
  TForm1 = class(TForm)
    cxButton1: TcxButton;
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.cxButton1Click(Sender: TObject);
var
  MyForm: TForm2;
begin
  MyForm := TForm2.create(self);
  MyForm.Show;
end;

end.
