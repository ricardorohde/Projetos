unit Unit1;

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
  cxEdit, DB, cxDBData, cxDBLookupComboBox, DBTables, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid;

type
  TForm1 = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1CustNo: TcxGridDBColumn;
    cxGrid1DBTableView1Company: TcxGridDBColumn;
    cxGrid1DBTableView1Addr1: TcxGridDBColumn;
    cxGrid1DBTableView1Addr2: TcxGridDBColumn;
    cxGrid1DBTableView1City: TcxGridDBColumn;
    cxGrid1DBTableView1State: TcxGridDBColumn;
    cxGrid1DBTableView1Zip: TcxGridDBColumn;
    cxGrid1DBTableView1Country: TcxGridDBColumn;
    cxGrid1DBTableView1Phone: TcxGridDBColumn;
    cxGrid1DBTableView1FAX: TcxGridDBColumn;
    cxGrid1DBTableView1TaxRate: TcxGridDBColumn;
    cxGrid1DBTableView1Contact: TcxGridDBColumn;
    cxGrid1DBTableView1LastInvoiceDate: TcxGridDBColumn;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView2OrderNo: TcxGridDBColumn;
    cxGrid1DBTableView2CustNo: TcxGridDBColumn;
    cxGrid1DBTableView2SaleDate: TcxGridDBColumn;
    cxGrid1DBTableView2ShipDate: TcxGridDBColumn;
    cxGrid1DBTableView2EmpNo: TcxGridDBColumn;
    cxGrid1DBTableView2ShipToContact: TcxGridDBColumn;
    cxGrid1DBTableView2ShipToAddr1: TcxGridDBColumn;
    cxGrid1DBTableView2ShipToAddr2: TcxGridDBColumn;
    cxGrid1DBTableView2ShipToCity: TcxGridDBColumn;
    cxGrid1DBTableView2ShipToState: TcxGridDBColumn;
    cxGrid1DBTableView2ShipToZip: TcxGridDBColumn;
    cxGrid1DBTableView2ShipToCountry: TcxGridDBColumn;
    cxGrid1DBTableView2ShipToPhone: TcxGridDBColumn;
    cxGrid1DBTableView2ShipVIA: TcxGridDBColumn;
    cxGrid1DBTableView2PO: TcxGridDBColumn;
    cxGrid1DBTableView2Terms: TcxGridDBColumn;
    cxGrid1DBTableView2PaymentMethod: TcxGridDBColumn;
    cxGrid1DBTableView2ItemsTotal: TcxGridDBColumn;
    cxGrid1DBTableView2TaxRate: TcxGridDBColumn;
    cxGrid1DBTableView2Freight: TcxGridDBColumn;
    cxGrid1DBTableView2AmountPaid: TcxGridDBColumn;
    cxGrid1DBTableView3: TcxGridDBTableView;
    cxGrid1DBTableView3OrderNo: TcxGridDBColumn;
    cxGrid1DBTableView3ItemNo: TcxGridDBColumn;
    cxGrid1DBTableView3PartNo: TcxGridDBColumn;
    cxGrid1DBTableView3Qty: TcxGridDBColumn;
    cxGrid1DBTableView3Discount: TcxGridDBColumn;
    cxGrid1DBTableView4: TcxGridDBTableView;
    cxGrid1DBTableView4PartNo: TcxGridDBColumn;
    cxGrid1DBTableView4VendorNo: TcxGridDBColumn;
    cxGrid1DBTableView4Description: TcxGridDBColumn;
    cxGrid1DBTableView4OnHand: TcxGridDBColumn;
    cxGrid1DBTableView4OnOrder: TcxGridDBColumn;
    cxGrid1DBTableView4Cost: TcxGridDBColumn;
    cxGrid1DBTableView4ListPrice: TcxGridDBColumn;
    cxGrid1DBTableView5: TcxGridDBTableView;
    cxGrid1DBTableView5VendorNo: TcxGridDBColumn;
    cxGrid1DBTableView5VendorName: TcxGridDBColumn;
    cxGrid1DBTableView5Address1: TcxGridDBColumn;
    cxGrid1DBTableView5Address2: TcxGridDBColumn;
    cxGrid1DBTableView5City: TcxGridDBColumn;
    cxGrid1DBTableView5State: TcxGridDBColumn;
    cxGrid1DBTableView5Zip: TcxGridDBColumn;
    cxGrid1DBTableView5Country: TcxGridDBColumn;
    cxGrid1DBTableView5Phone: TcxGridDBColumn;
    cxGrid1DBTableView5FAX: TcxGridDBColumn;
    cxGrid1DBTableView5Preferred: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGridLevel2: TcxGridLevel;
    Database1: TDatabase;
    Table1: TTable;
    Table2: TTable;
    Table3: TTable;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    procedure cxGrid1DBTableView2CustNoPropertiesInitPopup(Sender: TObject);
    procedure cxGrid1DBTableView2CustNoPropertiesPopup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.cxGrid1DBTableView2CustNoPropertiesInitPopup(Sender: TObject);
begin
  ///
end;

procedure TForm1.cxGrid1DBTableView2CustNoPropertiesPopup(Sender: TObject);
begin
///
end;

end.
