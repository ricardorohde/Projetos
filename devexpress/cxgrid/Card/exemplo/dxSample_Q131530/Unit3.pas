unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, StdCtrls, cxGridCustomTableView, cxGridCardView,
  cxGridDBCardView, cxControls, cxGridCustomView, DBTables, cxClasses,
  cxGridLevel, cxGrid;

type
TcxMyGridCardRowViewInfo = class(TcxGridCardRowViewInfo);
  TForm3 = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    Table1: TTable;
    DataSource1: TDataSource;
    cxGrid1DBCardView1: TcxGridDBCardView;
    cxGrid1DBCardView1Name: TcxGridDBCardViewRow;
    cxGrid1DBCardView1Capital: TcxGridDBCardViewRow;
    cxGrid1DBCardView1Continent: TcxGridDBCardViewRow;
    cxGrid1DBCardView1Area: TcxGridDBCardViewRow;
    cxGrid1DBCardView1Population: TcxGridDBCardViewRow;
    procedure cxGrid1DBCardView1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.cxGrid1DBCardView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
 Caption := IntToStr(TcxMyGridCardRowViewInfo(TcxGridCardRowCellViewInfo(AViewInfo).RowViewInfo).CaptionWidth);
end;

end.
