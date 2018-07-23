unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, DB, DBClient,
  cxImageComboBox, cxDBEdit, cxNavigator, cxDBNavigator, JvExStdCtrls,
  JvCombobox, JvDBCombobox, DBCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    cxComboBox1: TcxComboBox;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1teste: TStringField;
    DataSource1: TDataSource;
    cxDBNavigator1: TcxDBNavigator;
    cxDBImageComboBox1: TcxDBImageComboBox;
    JvDBComboBox1: TJvDBComboBox;
    CheckBox1: TCheckBox;
    DBComboBox1: TDBComboBox;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBComboBox1DropDown(Sender: TObject);
    procedure cxDBImageComboBox1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBImageComboBox1PropertiesPopup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  TcxMyComboBox = class (TcxDBImageComboBox)
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

procedure TForm1.Button1Click(Sender: TObject);
var
  lstraux : string;
begin
  Edit1.ReadOnly := True;

  lstraux := 'SELECT C.NOMCLI FROM RESGATE R, CLIENTE C WHERE R.NUMSOL = @VNUMSOL AND R.CODCLI = C.CODCLI';

  lstraux := StringReplace(lstraux, 'SELECT ', '', [rfIgnoreCase]);

  lstraux := 'SELECT MAX(DATALENGTH(' + StringReplace(lstraux, ' ', ')) ', [rfIgnoreCase]);


  ShowMessage(lstraux);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  ClientDataSet1.CreateDataSet;

  ClientDataSet1.Append;
  ClientDataSet1teste.AsString := 'teste1';
  ClientDataSet1.Post;

//  cxDBImageComboBox1.Properties.ReadOnly := True;
  JvDBComboBox1.ReadOnly := True;
//  cxDBImageComboBox1.Properties.LockUpdate(True);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  I: Integer;
  Item: TcxImageComboBoxItem;
begin
  MyComboBox := TcxMyComboBox.Create(Self);
  MyComboBox.DataBinding.DataSource := DataSource1;
  MyComboBox.DataBinding.DataField  := 'teste';

  MyComboBox.Parent := Self;
  MyComboBox.Text := 'MyComboBox';
  MyComboBox.Properties.Items.BeginUpdate;
  for I := 0 to 10 do
  begin
    Item := MyComboBox.Properties.Items.Add as TcxImageComboBoxItem;
    Item.Value := i;
    Item.Description := IntToStr(i);
    Item.ImageIndex  := i;
  end;
  MyComboBox.Properties.Items.EndUpdate;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  MyComboBox.Properties.ReadOnly := CheckBox1.Checked;
end;

procedure TForm1.DBComboBox1DropDown(Sender: TObject);
begin
  if TDBComboBox(sender).ReadOnly then
    Abort;
end;

procedure TForm1.cxDBImageComboBox1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if cxDBImageComboBox1.Properties.ReadOnly then
    Abort;
end;

procedure TForm1.cxDBImageComboBox1PropertiesPopup(Sender: TObject);
begin
  if cxDBImageComboBox1.Properties.ReadOnly then
    Abort;
end;

end.
