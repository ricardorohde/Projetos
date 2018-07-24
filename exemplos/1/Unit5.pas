unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxCalc, cxBarEditItem, dxSkinsCore, dxSkinsdxBarPainter, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, StdCtrls,
  cxClasses, dxBar;

type
  TForm5 = class(TForm)
    dxBarManager1: TdxBarManager;
    dxBar1: TdxBar;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    I: integer;
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
begin
  dxBarManager1.SaveToIniFile('123.ini');
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
 dxBarManager1.LoadFromIniFile('123.ini');
end;

procedure TForm5.Button3Click(Sender: TObject);
var
  ABarEditItem: TcxBarEditItem;
begin
  with dxBarManager1 do
  begin
    BeginUpdate;
    try
      ABarEditItem := TcxBarEditItem(dxBar1.ItemLinks.AddItem(TcxBarEditItem).Item);
      with ABarEditItem do
      begin
        PropertiesClass := TcxCalcEditProperties;
        Caption := 'Calc Edit';
        Name := 'MyCalcEdit' + IntToStr(I);
        Inc(I);
        ShowCaption := True;
      end;
    finally
      EndUpdate;
    end;
  end;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  I := 1;
end;

end.
