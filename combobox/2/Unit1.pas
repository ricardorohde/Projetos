unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  StdCtrls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp,
  dxSkinSpringTime;

type
  TForm1 = class(TForm)
    cxComboBox1: TcxComboBox;
    chk1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure chk1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type
  TcxMyComboBox = class (TcxComboBox)
    function CanDropDown: Boolean; override;
  end;

var
  Form1: TForm1;
  MyComboBox : TcxMyComboBox;

implementation

{$R *.dfm}



{ TcxMyComboBox }

function TcxMyComboBox.CanDropDown: Boolean;
begin
  Result := not Properties.ReadOnly and  inherited CanDropDown;
end;

procedure TForm1.chk1Click(Sender: TObject);
begin
  MyComboBox.Properties.ReadOnly := chk1.Checked;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  MyComboBox := TcxMyComboBox.Create(Self);
  MyComboBox.Parent := Self;
  MyComboBox.Text := 'MyComboBox';
  for I := 0 to 10 do
    MyComboBox.Properties.Items.Add(IntToStr(I));

end;

end.
