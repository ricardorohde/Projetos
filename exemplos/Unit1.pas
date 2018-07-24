unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, cxClasses, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinsdxBarPainter;

type
  TForm1 = class(TForm)
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure DoOnMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

type
  TdxBarControlAccess = class (TdxBarControl);

procedure TForm1.DoOnMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  ABarControl: TdxBarControlAccess;
  AItemControl: TdxBarItemControl;
begin
  ABarControl := TdxBarControlAccess(Sender);
  AItemControl := ABarControl.ItemAtPos(Point(X, Y));
  if (AItemControl <> nil) and (AItemControl.Item is TdxBarSubItem) then
    TdxBarSubItem(AItemControl.Item).DropDown(false);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  ABarControl: TdxBarControlAccess;
begin
  ABarControl := TdxBarControlAccess(dxBarManager1Bar1.Control);
  ABarControl.OnMouseMove := DoOnMouseMove;
end;

end.
