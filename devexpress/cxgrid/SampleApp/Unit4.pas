unit Unit4;

interface

uses
  Forms, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDropDownEdit, cxTextEdit, ImgList, Controls, Types,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView, Classes, cxGrid;

type
  TForm4 = class(TForm)
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1TableView1: TcxGridTableView;
    cxGrid1TableView1Column1: TcxGridColumn;
    cxGrid1TableView1Column2: TcxGridColumn;
    BalloonHint1: TBalloonHint;
    ImageList1: TImageList;
    procedure cxGrid1TableView1Column1PropertiesEditValueChanged(Sender: TObject);
    procedure cxGrid1TableView1Column2PropertiesEditValueChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1TableView1Column2PropertiesValidate(Sender: TObject; var DisplayValue: Variant;
      var ErrorText: TCaption; var Error: Boolean);
  private
    procedure ShowBalloonHint(ARect: TRect; const ATitle, ADescription: String;
      AIcon: PWideChar);
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses
  Dialogs, SysUtils, Variants, Windows, Graphics;

type
  TMycxCustomGridTableItemHelper = class helper for TcxCustomGridTableItem
  public
    function MyGetCell(Index: Integer): TcxGridTableDataCellViewInfo;
  end;

function TMycxCustomGridTableItemHelper.MyGetCell(Index: Integer): TcxGridTableDataCellViewInfo;
begin
  Result := inherited Cells[Index];
end;

procedure TForm4.cxGrid1TableView1Column1PropertiesEditValueChanged(Sender: TObject);
var
  r: TRect;
  s: String;
begin
  s := VarToStr(cxGrid1TableView1Column1.EditValue);
  Showmessage(Format('OnEditValueChanged Column1 EditValue: "%s"', [s]));

  if s = 'Item needs additional Info' then begin

    r := cxGrid1TableView1.Columns[1].MyGetCell(cxGrid1TableView1.Controller.FocusedRowIndex).Bounds;
    ShowBalloonHint(r, 'A Title', 'Please enter a value here too', IDI_INFORMATION);

    cxGrid1TableView1Column2.Editing := True;
  end;
end;

procedure TForm4.cxGrid1TableView1Column2PropertiesEditValueChanged(Sender: TObject);
begin
  Showmessage(Format('OnEditValueChanged Column2 EditValue: "%s"',
    [VarToStr(cxGrid1TableView1Column2.EditValue)]));
end;

procedure TForm4.cxGrid1TableView1Column2PropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if VarToStr(cxGrid1TableView1Column1.EditValue) = 'Item needs additional Info' then
    if VarToStr(cxGrid1TableView1Column2.EditValue) = '' then begin
      Error := True;
      ErrorText := 'Column 2 needs a Value when Column 1 has selected "Item needs additional Info"';
    end;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  cxGrid1TableView1Column2.Properties.ImmediatePost := True; //doesn't help :-(
end;

procedure TForm4.ShowBalloonHint(ARect: TRect; const ATitle, ADescription: String;
  AIcon: PWideChar);
var
  p: TPoint;
  x, y: Integer;
  ico: TIcon;
begin
  ico := TIcon.Create;
  try
    ico.Handle := LoadIcon(0, AIcon);
    ImageList1.Clear;
    ImageList1.AddIcon(ico);
  finally
    ico.Free;
  end;
  BalloonHint1.Title := ATitle;
  BalloonHint1.Description := ADescription;
  BalloonHint1.ImageIndex := 0;
  x := (ARect.Left + ARect.Right) div 2;
  y := (ARect.Top + ARect.Bottom) div 2;
  p.X := x;
  p.Y := y - 3;
  p := cxGrid1.ClientToScreen(p);
  if p.Y < Screen.Height div 2 then
    p.Y := p.Y + 6;
  BalloonHint1.HideAfter := 3000;
  BalloonHint1.ShowHint(p);
end;

end.
