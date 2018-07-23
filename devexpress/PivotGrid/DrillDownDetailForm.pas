unit DrillDownDetailForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, ActnList, StdCtrls, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxDBPivotGrid, cxCustomPivotGrid, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxPivotGridLnk, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPSCore, dxPScxCommon,
  cxGridExportLink, ShellAPI,
  LMDCustomButton, LMDButton, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  dxSkinsdxRibbonPainter;

const
  CM_APPLYBESTFIT = WM_USER + 1;
  CM_UPDATEGRIDVIEW = WM_USER + 2;

type
  TfmDrilldownDetail = class(TfmBase)
    tvDrillDown: TcxGridDBTableView;
    lvDrillDown: TcxGridLevel;
    grDrillDown: TcxGrid;
    btnPrint: TLMDButton;
    btnExport: TLMDButton;
    actExportToExcel: TAction;
    actPrint: TAction;
    dxComponentPrinter: TdxComponentPrinter;
    linkDetailGrid: TdxGridReportLink;
    sdExportFile: TSaveDialog;
    ckOpenFileAfterExport: TCheckBox;
    procedure actExportToExcelExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure dxComponentPrinterStartGenerateReport(Sender: TObject;
      AReportLink: TBasedxReportLink);
  private
    FOwnerPivotGrid: tcxDBPivotGrid;
    FPlanTitle: string;
    procedure SetColumnProperties(ATableView: TcxGridTableView);
    procedure SetOwnerPivotGrid(const Value: tcxDBPivotGrid);
    procedure SetPlanTitle(const Value: string);

  public
    property OwnerPivotGrid: tcxDBPivotGrid read FOwnerPivotGrid write SetOwnerPivotGrid;
    property PlanTitle: string read FPlanTitle write SetPlanTitle;
    procedure UpdateDrillDownTableView;
  end;

var
  fmDrilldownDetail: TfmDrilldownDetail;

implementation

uses StrUtils, Main;

{$R *.dfm}

{ TfmDrilldownDetail }

procedure TfmDrilldownDetail.actExportToExcelExecute(Sender: TObject);
begin
  inherited;
  self.cursor := crHourGlass;
  try
    if sdExportfile.execute then
    begin
      ExportGridToExcel(sdExportfile.Filename, grDrilldown, true, true, true);
      if ckOpenFileAfterExport.checked then
        ShellExecute(Handle, 'open', PChar(sdExportfile.Filename), nil, nil, SW_SHOWNORMAL);
    end
    else
    begin
      MessageDlg('Did Not Export To Excel', mtInformation, [mbOK], 0);
    end;
  finally
    self.cursor := crDefault;
  end;
end;

procedure TfmDrilldownDetail.actPrintExecute(Sender: TObject);
begin
  inherited;
  dxComponentPrinter.Preview(true, linkDetailGrid);
end;

procedure TfmDrilldownDetail.dxComponentPrinterStartGenerateReport(
  Sender: TObject; AReportLink: TBasedxReportLink);
begin
  inherited;
  AReportLink.ReportTitle.Text := 'Drill-down Details' ;
  AReportLink.ReportTitle.Font.size := 12;
  AReportLink.ReportFootnotes.Text := 'Print date: ' + FormatDateTime('dd-mmm-yyyy', now());
  AReportLink.ReportFootnotes.Font.Size := 10;
end;

procedure TfmDrilldownDetail.SetColumnProperties(ATableView: TcxGridTableView);

  procedure CreateFooterSummaryCell(AGridColumn: TcxGridColumn);
  begin
    AGridColumn.Summary.FooterKind := skSum;
    AGridColumn.Summary.FooterFormat := ',.00';
    AGridColumn.summary.GroupKind := skSum;
    AGridColumn.Summary.GroupFormat := ',.00';
  end;

  function ColumnByCaption(ACaption: string): TcxGridColumn;
  var
    I: Integer;
  begin
    Result := nil;
    for I := 0 to ATableView.ColumnCount - 1 do
      if ATableView.Columns[I].Caption = ACaption then
      begin
        Result := ATableView.Columns[I];
        Break;
      end;
  end;

var
  I: Integer;
begin
  for I := 0 to OwnerPivotGrid.FieldCount - 1 do
  begin
    if (OwnerPivotGrid.Fields[I].Area = faData) then
    begin
      if not OwnerPivotGrid.Fields[I].DataBinding.ValueTypeClass.IsString then
        CreateFooterSummaryCell(ColumnByCaption(OwnerPivotGrid.Fields[I].Caption));
    end;
  end;
end;

procedure TfmDrilldownDetail.SetOwnerPivotGrid(const Value: tcxDBPivotGrid);
begin
  FOwnerPivotGrid := Value;
end;

procedure TfmDrilldownDetail.SetPlanTitle(const Value: string);
begin
  FPlanTitle := Value;
end;

procedure TfmDrilldownDetail.UpdateDrillDownTableView;
begin
  with tvDrillDown do
  begin
    BeginUpdate;
    try
      ClearItems;
      DataController.CreateAllItems;
      SetColumnProperties(tvDrillDown);
    finally
     EndUpdate;
    end;
  end;

  if HandleAllocated then
    PostMessage(Handle, CM_APPLYBESTFIT, Integer(tvDrillDown), 0);
end;

end.
