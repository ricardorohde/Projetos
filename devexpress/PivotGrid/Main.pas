unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxClasses, cxCustomData, cxStyles, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxmdaset, cxPivotGridCustomDataSet,
  cxPivotGridDrillDownDataSet, cxCustomPivotGrid, cxDBPivotGrid, DB, DBClient;

type
  TfmMain = class(TForm)
    ClientDataSet: TClientDataSet;
    dsAccountDetails: TDataSource;
    grActivityDetails: TcxDBPivotGrid;
    cxDBPivotGrid1YEARTEXT: TcxDBPivotGridField;
    cxDBPivotGrid1PERIODTEXT: TcxDBPivotGridField;
    cxDBPivotGrid1CURRENCYDESCRIPTION: TcxDBPivotGridField;
    cxDBPivotGrid1PRORATEDAMOUNT: TcxDBPivotGridField;
    cxDBPivotGridAccount: TcxDBPivotGridField;
    PivotGridDrillDownDataSet: TcxPivotGridDrillDownDataSet;
    dsDrillDownDataSet: TDataSource;
    procedure grActivityDetailsDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure ShowDrillDownDataSource(ACrossCell: TcxPivotGridCrossCell);

  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

uses DrillDownDetailForm;

{$R *.dfm}

procedure TfmMain.FormActivate(Sender: TObject);
begin
  ClientDataSet.LoadFromFile('AccountViewData.xml');
end;

procedure TfmMain.grActivityDetailsDblClick(Sender: TObject);
var
  ACrossCell: TcxPivotGridCrossCell;
begin
  with grActivityDetails.HitTest do
  begin
    // Handles double-clicks on data cells
    if HitAtDataCell then
    begin
      // Determines a cross cell which corresponds to the data cell being clicked.
      ACrossCell := TcxPivotGridDataCellViewInfo(HitObject).CrossCell;
      ShowDrillDownDataSource(ACrossCell);
    end;
  end;
end;
procedure TfmMain.ShowDrillDownDataSource(ACrossCell: TcxPivotGridCrossCell);
  var
    AForm: TfmDrilldownDetail;
begin
  AForm := TfmDrilldownDetail.Create(nil);

  try
    Aform.tvDrillDown.datacontroller.datasource := dsDrilldownDataSet;
    AForm.OwnerPivotGrid := grActivityDetails;
    AForm.UpdateDrillDownTableView;

    AForm.ShowModal;
  finally
    AForm.Free;
  end;
end;

end.
