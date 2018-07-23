unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ABSMain, ExtCtrls, DBCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, StdCtrls,
  Mask, cxTimeEdit, cxDropDownEdit, cxColorComboBox, cxCalendar,
  cxButtonEdit, Menus, cxLookAndFeelPainters, cxButtons, cxContainer,
  cxTextEdit, cxMaskEdit,
  {2k9aug19wed2211soho}
  cxGridExportLink;

type
  TForm1 = class(TForm)
    ABSTable1: TABSTable;
    ABSDatabase1: TABSDatabase;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    DBNavigator1: TDBNavigator;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1date: TcxGridDBColumn;
    cxGrid1DBTableView1timeStart: TcxGridDBColumn;
    cxGrid1DBTableView1timeStop: TcxGridDBColumn;
    cxGrid1DBTableView1duration: TcxGridDBColumn;
    cxGrid1DBTableView1timeExt: TcxGridDBColumn;
    cxGrid1DBTableView1string: TcxGridDBColumn;
    cxGrid1DBTableView1memo: TcxGridDBColumn;
    cxGrid1DBTableView1blob: TcxGridDBColumn;
    DBEdit1: TDBEdit;
    cxBut_export: TcxButton;
    cxDateEdit1: TcxDateEdit;
    procedure cxGrid1DBTableView1durationGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure cxGrid1DBTableView1durationGetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
      var AText: String);
    procedure ABSTable1CalcFields(DataSet: TDataSet);
    procedure cxGrid1DBTableView1timeStartGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure cxGrid1DBTableView1CellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxBut_exportClick(Sender: TObject);
    procedure cxGrid1DBTableView1timeStartGetProperties(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AProperties: TcxCustomEditProperties);
    procedure cxDateEdit1PropertiesCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.cxGrid1DBTableView1durationGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  /// AText := ':-)';
  /// Atext :=
  /// cxGrid1DBTableView1timeStop. - cxGrid1DBTableView1timeStart;

end;

/// sample from devExpress support :-)
function HoursToString(AHours: Real): string;
/// function HoursToString(AHours: ttime): string;
var
AHoursInt, AMinInt: Integer;
begin
  AHoursInt := Round(Int(AHours));
  AMinInt   := Round(Frac(AHours) * 60);
  Result    := IntToStr(AHoursInt) + 'hr ' + IntToStr(AMinInt) + 'm';
end;
/// ------------------------------------------------------>
function HrToStr(rHr: Real): string;
var
  iHr, iMin: Integer;
begin
  iHr     := Round(Int(rHr));
  iMin    := Round(Frac(rHr) * 60);
    if iMin > 59 then
      begin
        iHr   := iHr+1;
        iMin  := 0;
      end;
  Result  := IntToStr(iHr) + 'hr ' + IntToStr(iMin) + 'm';
end;
/// -----------------------------------------------------.
function HrToStr_24(rHr: Real): string;
var
  iHr, iMin: Integer;
begin
  iHr     := Round(Int(rHr));
  iMin    := Round(Frac(rHr) * 60);
    if iMin > 59 then
      begin
        iHr   := iHr+1;
        iMin  := 0;
      end;
  Result  := IntToStr(iHr) + 'hr ' + IntToStr(iMin) + 'm';
end;
/// ------------------------------------------------------.



///
procedure TForm1.cxGrid1DBTableView1durationGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
begin
  /// T2 - T1 = t
  with TcxGridDBTableView(Sender.GridView).DataController do

  (*---------
      AText := VarToStr(
      Values[ARecordIndex, cxGrid1DBTableView1timeStop.Index] -
      Values[ARecordIndex, cxGrid1DBTableView1timeStart.Index]
      );
 --------*)
   (*--------
    /// 2k9aug13thur2300soho: ref to delphi.about.com - dateTime formatting
    AText := timeToStr(
      Values[ARecordIndex, cxGrid1DBTableView1timeStop.Index] -
      Values[ARecordIndex, cxGrid1DBTableView1timeStart.Index]
      )
  ------*)
   (*--------
    AText := varToStr( hourOf(
      Values[ARecordIndex, cxGrid1DBTableView1timeStop.Index] -
      Values[ARecordIndex, cxGrid1DBTableView1timeStart.Index]
      )/// end of hourOf
    )/// end of varToStr
  ------*)
  /// AText := HoursToString(
  AText := HrToStr(
      (Values[ARecordIndex, cxGrid1DBTableView1timeStop.Index] -
      Values[ARecordIndex, cxGrid1DBTableView1timeStart.Index])*24
  )
  (*--------
  ------*)

end;/// end of procedure :-)

procedure TForm1.ABSTable1CalcFields(DataSet: TDataSet);
begin
  /// 2k9aug16fri2400cr:-)
  /// dbGrid1.Fields[1].AsString := ':-)';
end;

procedure TForm1.cxGrid1DBTableView1timeStartGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  /// Atext := time(Values[ARecordIndex, cxGrid1DBTableView1timeStart.Index]);
end;

procedure TForm1.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  {2k9aug16sun1246cr: to present a dialog box to return a choice to use
    dateEdit or timeEdit}
  /// showMessage('yes U''v doubleClicked on the right_mouse_button !');
end;

procedure TForm1.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  {2k9aug16sun1256cr: to present a dialog box to return a choice to use
    dateEdit or timeEdit}
  /// showMessage('yes U''v singleClicked on the right_mouse_button !');

end;

procedure TForm1.cxBut_exportClick(Sender: TObject);
begin
  {2k9aug16sun1300cr: to present a dialog box to return a choice to use
    dateEdit or timeEdit}
  /// showMessage('yes U''v Clicked on the cxButton !');
  {2k9aug16sun1300cr: change property of :}
  (* cxGrid1DBTableView1timeStart.Properties[DateEdit];
    don't hv default properties.  *)

  { 2k9aug16sun1636: ------------------------------------------------>
    how to pass a string to the text grid'd 'string' field }
  ///:-) cxGrid1DBTableView1string.DataBinding.FieldName := 'timeStart';
  ///:-)
  (*  dbGrid1.SetFocus;
      dbGrid1.EditorMode  := true;

  dbGrid1.Fields[3].AsString := '12:34'; /// ok but not in edit mode
  *)

  /// cxGrid1DBTableView1timeStart.Properties := tcxTimeEdit;
  showMessage('yes U''v Clicked on the cxButton and properties changed !');

  {2k9aug19wed2200soho: how to export cxGrid}
  ExportGridToExcel('test',cxGrid1);

end;

procedure TForm1.cxGrid1DBTableView1timeStartGetProperties(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AProperties: TcxCustomEditProperties);
begin
  (* undeclared unidentifier:-( timeEdit )
  cxGrid1DBTableView1timeStart.RepositoryItem.Properties := [timeEdit];
  cxGrid1DBTableView1timeStart.RepositoryItem.Properties := timeEdit;
  *)

  /// cxGrid1DBTableView1timeStart.RepositoryItem.Properties := ;
  ///  := timeEdit;

end;

procedure TForm1.cxDateEdit1PropertiesCloseUp(Sender: TObject);
begin
  {2k9aug16sun1625cr: update grids ...}
  /// cxGrid1DBTableView1timeStart.DataBinding.FieldName[timeStart];

end;

end.
