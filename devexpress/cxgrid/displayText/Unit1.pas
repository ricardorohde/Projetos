unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit,
  DB, cxDBData, Grids, DBGrids, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, StdCtrls, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, DBTables;

type
  TForm1 = class(TForm)
    DataSource2: TDataSource;
    Table2: TTable;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1OrderNo: TcxGridDBColumn;
    cxGrid1DBTableView1CustNo: TcxGridDBColumn;
    cxGrid1DBTableView1Freight: TcxGridDBColumn;
    cxGrid1DBTableView1AmountPaid: TcxGridDBColumn;
    procedure cxGrid1DBTableView1AmountPaidPropertiesEditValueChanged(
      Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses cxVariants, cxDataUtils;

procedure TForm1.cxGrid1DBTableView1AmountPaidPropertiesEditValueChanged(
  Sender: TObject);
var
  Edit: TcxCustomEdit;
  Value: Double;
  View: TcxGridDBTableView;
  FreightColumn: TcxGridColumn;
begin
  Edit := Sender as TcxCustomEdit;
  if VarIsNumericEx(Edit.EditValue) then
  begin
    Value := Edit.EditValue;

    View := cxGrid1.FocusedView as TcxGridDBTableView;
    FreightColumn := View.GetColumnByFieldName('Freight');
    View.DataController.SetEditValue(FreightColumn.Index, Value / 5, evsValue);
  end;
end;

end.
