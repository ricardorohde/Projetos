unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, Menus, DBClient, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid;

type
  TForm1 = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1OrderNo: TcxGridDBColumn;
    cxGrid1DBTableView1CustNo: TcxGridDBColumn;
    cxGrid1DBTableView1SaleDate: TcxGridDBColumn;
    cxGrid1DBTableView1ShipDate: TcxGridDBColumn;
    cxGrid1DBTableView1EmpNo: TcxGridDBColumn;
    cxGrid1DBTableView1ShipToContact: TcxGridDBColumn;
    cxGrid1DBTableView1ShipToAddr1: TcxGridDBColumn;
    cxGrid1DBTableView1ShipToAddr2: TcxGridDBColumn;
    cxGrid1DBTableView1ShipToCity: TcxGridDBColumn;
    cxGrid1DBTableView1ShipToState: TcxGridDBColumn;
    cxGrid1DBTableView1ShipToZip: TcxGridDBColumn;
    cxGrid1DBTableView1ShipToCountry: TcxGridDBColumn;
    cxGrid1DBTableView1ShipToPhone: TcxGridDBColumn;
    cxGrid1DBTableView1ShipVIA: TcxGridDBColumn;
    cxGrid1DBTableView1PO: TcxGridDBColumn;
    cxGrid1DBTableView1Terms: TcxGridDBColumn;
    cxGrid1DBTableView1PaymentMethod: TcxGridDBColumn;
    cxGrid1DBTableView1ItemsTotal: TcxGridDBColumn;
    cxGrid1DBTableView1TaxRate: TcxGridDBColumn;
    cxGrid1DBTableView1Freight: TcxGridDBColumn;
    cxGrid1DBTableView1AmountPaid: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    ClientDataSet1: TClientDataSet;
    dsOrders: TDataSource;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridDBColumn15: TcxGridDBColumn;
    cxGridDBColumn16: TcxGridDBColumn;
    cxGridDBColumn17: TcxGridDBColumn;
    cxGridDBColumn18: TcxGridDBColumn;
    cxGridDBColumn19: TcxGridDBColumn;
    cxGridDBColumn20: TcxGridDBColumn;
    cxGridDBColumn21: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    ClientDataSet2: TClientDataSet;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    est11: TMenuItem;
    procedure est11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.est11Click(Sender: TObject);
var
  AGridSite: TcxGridSite;
  AGrid: TcxGrid;
  AView: TcxCustomGridView;
begin
  if (ActiveControl is TcxGridSite) then
  begin
    AGridSite := ActiveControl as TcxGridSite;
    AGrid := AGridSite.Parent as TcxGrid;
    AView := AGridSite.GridView;
    Caption := 'Grid: ' + AGrid.Name + '; View: ' + AView.PatternGridView.Name;
  end;
end;

end.
