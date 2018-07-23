unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, rxAnimate, rxGIFCtrl;

type
  TForm1 = class(TForm)
    RxGIFAnimator1: TRxGIFAnimator;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
begin
  RxGIFAnimator1.Animate:= False;
  RxGIFAnimator1.Animate:= True;
end;

end.
