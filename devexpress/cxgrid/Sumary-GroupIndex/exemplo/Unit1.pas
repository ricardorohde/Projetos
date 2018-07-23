unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinSilver,
  dxSkinStardust, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, DBTables,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid;

type
  TForm1 = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Table1: TTable;
    DataSource1: TDataSource;
    cxGrid1DBTableView1OrderNo: TcxGridDBColumn;
    cxGrid1DBTableView1CustNo: TcxGridDBColumn;
    cxGrid1DBTableView1SaleDate: TcxGridDBColumn;
    cxGrid1DBTableView1ShipDate: TcxGridDBColumn;
    cxGrid1DBTableView1EmpNo: TcxGridDBColumn;
    cxGrid1DBTableView1PO: TcxGridDBColumn;
    cxGrid1DBTableView1Terms: TcxGridDBColumn;
    cxGrid1DBTableView1PaymentMethod: TcxGridDBColumn;
    cxGrid1DBTableView1ItemsTotal: TcxGridDBColumn;
    cxGrid1DBTableView1TaxRate: TcxGridDBColumn;
    cxGrid1DBTableView1Freight: TcxGridDBColumn;
    cxGrid1DBTableView1AmountPaid: TcxGridDBColumn;
    procedure cxGrid1DBTableView1DataControllerSummaryAfterSummary(
      ASender: TcxDataSummary);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  cxGridDBDataDefinitions;

{$R *.dfm}

procedure ProcessGroupSummaries(ASender: TcxDataSummary; AParentDataGroupIndex: Integer);
var
  I, AIndex: Integer;
  ADC: TcxGridDBDataController;
begin
  ADC :=  ASender.DataController as TcxGridDBDataController;
  for I := 0 to ADC.Groups.ChildCount[AParentDataGroupIndex] - 1 do
  begin
    AIndex := ADC.Groups.ChildDataGroupIndex[AParentDataGroupIndex, I];
    ASender.GroupSummaryValues[AIndex, 0] := AIndex;
    ASender.GroupSummaryValues[AIndex, 1] := AIndex;
    if ADC.Groups.Level[AIndex] < ADC.Groups.GroupingItemCount - 1 then
      ProcessGroupSummaries(ASender, AIndex);
  end;
end;


procedure TForm1.cxGrid1DBTableView1DataControllerSummaryAfterSummary(
  ASender: TcxDataSummary);
begin
  ProcessGroupSummaries(ASender, -1);
end;

end.
