unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinSilver, dxSkinStardust, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxHint, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSpringTime, dxSkinSummer2008, JvComponentBase,
  JvBalloonHint;

type
  TForm2 = class(TForm)
    cxTextEdit1: TcxTextEdit;
    JvBalloonHint1: TJvBalloonHint;
    procedure cxHintStyleController1ShowHintEx(Sender: TObject; var Caption,
      HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
    procedure cxTextEdit1MouseEnter(Sender: TObject);
    procedure cxTextEdit1MouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.cxHintStyleController1ShowHintEx(Sender: TObject; var Caption,
  HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
begin
  HintStr := 'test2';
end;

procedure TForm2.cxTextEdit1MouseEnter(Sender: TObject);
begin
  if not JvBalloonHint1.Active then
    JvBalloonHint1.ActivateHint(cxTextEdit1,'sahsoishaoshasosdhalsdhal','teste', 5000);
end;

procedure TForm2.cxTextEdit1MouseLeave(Sender: TObject);
begin
  JvBalloonHint1.CancelHint;
end;

end.
