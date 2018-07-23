object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 576
  ClientWidth = 798
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 5
    Top = 5
    Width = 513
    Height = 409
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    BevelInner = bvNone
    BevelOuter = bvNone
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DataSource1
      DataController.KeyFieldNames = 'CustNo'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      OptionsView.IndicatorWidth = 0
      object cxGrid1DBTableView1CustNo: TcxGridDBColumn
        DataBinding.FieldName = 'CustNo'
      end
      object cxGrid1DBTableView1Company: TcxGridDBColumn
        DataBinding.FieldName = 'Company'
      end
      object cxGrid1DBTableView1Addr1: TcxGridDBColumn
        DataBinding.FieldName = 'Addr1'
      end
      object cxGrid1DBTableView1Addr2: TcxGridDBColumn
        DataBinding.FieldName = 'Addr2'
      end
      object cxGrid1DBTableView1City: TcxGridDBColumn
        DataBinding.FieldName = 'City'
      end
      object cxGrid1DBTableView1State: TcxGridDBColumn
        DataBinding.FieldName = 'State'
      end
      object cxGrid1DBTableView1Zip: TcxGridDBColumn
        DataBinding.FieldName = 'Zip'
      end
      object cxGrid1DBTableView1Country: TcxGridDBColumn
        DataBinding.FieldName = 'Country'
      end
      object cxGrid1DBTableView1Phone: TcxGridDBColumn
        DataBinding.FieldName = 'Phone'
      end
      object cxGrid1DBTableView1FAX: TcxGridDBColumn
        DataBinding.FieldName = 'FAX'
      end
      object cxGrid1DBTableView1TaxRate: TcxGridDBColumn
        DataBinding.FieldName = 'TaxRate'
      end
      object cxGrid1DBTableView1Contact: TcxGridDBColumn
        DataBinding.FieldName = 'Contact'
      end
      object cxGrid1DBTableView1LastInvoiceDate: TcxGridDBColumn
        DataBinding.FieldName = 'LastInvoiceDate'
      end
    end
    object cxGrid1DBTableView2: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DataSource2
      DataController.DetailKeyFieldNames = 'CustNo'
      DataController.KeyFieldNames = 'OrderNo'
      DataController.MasterKeyFieldNames = 'CustNo'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      OptionsView.IndicatorWidth = 0
      object cxGrid1DBTableView2OrderNo: TcxGridDBColumn
        DataBinding.FieldName = 'OrderNo'
      end
      object cxGrid1DBTableView2CustNo: TcxGridDBColumn
        Caption = '!!Lookup'
        DataBinding.FieldName = 'CustNo'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'CustNo'
        Properties.ListColumns = <
          item
            FieldName = 'Company'
          end>
        Properties.ListSource = DataSource1
        Properties.OnInitPopup = cxGrid1DBTableView2CustNoPropertiesInitPopup
        Properties.OnPopup = cxGrid1DBTableView2CustNoPropertiesPopup
      end
      object cxGrid1DBTableView2SaleDate: TcxGridDBColumn
        DataBinding.FieldName = 'SaleDate'
      end
      object cxGrid1DBTableView2ShipDate: TcxGridDBColumn
        DataBinding.FieldName = 'ShipDate'
      end
      object cxGrid1DBTableView2EmpNo: TcxGridDBColumn
        DataBinding.FieldName = 'EmpNo'
      end
      object cxGrid1DBTableView2ShipToContact: TcxGridDBColumn
        DataBinding.FieldName = 'ShipToContact'
      end
      object cxGrid1DBTableView2ShipToAddr1: TcxGridDBColumn
        DataBinding.FieldName = 'ShipToAddr1'
      end
      object cxGrid1DBTableView2ShipToAddr2: TcxGridDBColumn
        DataBinding.FieldName = 'ShipToAddr2'
      end
      object cxGrid1DBTableView2ShipToCity: TcxGridDBColumn
        DataBinding.FieldName = 'ShipToCity'
      end
      object cxGrid1DBTableView2ShipToState: TcxGridDBColumn
        DataBinding.FieldName = 'ShipToState'
      end
      object cxGrid1DBTableView2ShipToZip: TcxGridDBColumn
        DataBinding.FieldName = 'ShipToZip'
      end
      object cxGrid1DBTableView2ShipToCountry: TcxGridDBColumn
        DataBinding.FieldName = 'ShipToCountry'
      end
      object cxGrid1DBTableView2ShipToPhone: TcxGridDBColumn
        DataBinding.FieldName = 'ShipToPhone'
      end
      object cxGrid1DBTableView2ShipVIA: TcxGridDBColumn
        DataBinding.FieldName = 'ShipVIA'
      end
      object cxGrid1DBTableView2PO: TcxGridDBColumn
        DataBinding.FieldName = 'PO'
      end
      object cxGrid1DBTableView2Terms: TcxGridDBColumn
        DataBinding.FieldName = 'Terms'
      end
      object cxGrid1DBTableView2PaymentMethod: TcxGridDBColumn
        DataBinding.FieldName = 'PaymentMethod'
      end
      object cxGrid1DBTableView2ItemsTotal: TcxGridDBColumn
        DataBinding.FieldName = 'ItemsTotal'
      end
      object cxGrid1DBTableView2TaxRate: TcxGridDBColumn
        DataBinding.FieldName = 'TaxRate'
      end
      object cxGrid1DBTableView2Freight: TcxGridDBColumn
        DataBinding.FieldName = 'Freight'
      end
      object cxGrid1DBTableView2AmountPaid: TcxGridDBColumn
        DataBinding.FieldName = 'AmountPaid'
      end
    end
    object cxGrid1DBTableView3: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DataSource3
      DataController.DetailKeyFieldNames = 'OrderNo'
      DataController.KeyFieldNames = 'ItemNo'
      DataController.MasterKeyFieldNames = 'OrderNo'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      OptionsView.IndicatorWidth = 0
      object cxGrid1DBTableView3OrderNo: TcxGridDBColumn
        DataBinding.FieldName = 'OrderNo'
      end
      object cxGrid1DBTableView3ItemNo: TcxGridDBColumn
        DataBinding.FieldName = 'ItemNo'
      end
      object cxGrid1DBTableView3PartNo: TcxGridDBColumn
        DataBinding.FieldName = 'PartNo'
      end
      object cxGrid1DBTableView3Qty: TcxGridDBColumn
        DataBinding.FieldName = 'Qty'
      end
      object cxGrid1DBTableView3Discount: TcxGridDBColumn
        DataBinding.FieldName = 'Discount'
      end
    end
    object cxGrid1DBTableView4: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DetailKeyFieldNames = 'PartNo'
      DataController.KeyFieldNames = 'VendorNo'
      DataController.MasterKeyFieldNames = 'PartNo'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      OptionsView.IndicatorWidth = 0
      object cxGrid1DBTableView4PartNo: TcxGridDBColumn
        DataBinding.FieldName = 'PartNo'
      end
      object cxGrid1DBTableView4VendorNo: TcxGridDBColumn
        DataBinding.FieldName = 'VendorNo'
      end
      object cxGrid1DBTableView4Description: TcxGridDBColumn
        DataBinding.FieldName = 'Description'
      end
      object cxGrid1DBTableView4OnHand: TcxGridDBColumn
        DataBinding.FieldName = 'OnHand'
      end
      object cxGrid1DBTableView4OnOrder: TcxGridDBColumn
        DataBinding.FieldName = 'OnOrder'
      end
      object cxGrid1DBTableView4Cost: TcxGridDBColumn
        DataBinding.FieldName = 'Cost'
      end
      object cxGrid1DBTableView4ListPrice: TcxGridDBColumn
        DataBinding.FieldName = 'ListPrice'
      end
    end
    object cxGrid1DBTableView5: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DetailKeyFieldNames = 'VendorNo'
      DataController.KeyFieldNames = 'VendorNo'
      DataController.MasterKeyFieldNames = 'VendorNo'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      OptionsView.IndicatorWidth = 0
      object cxGrid1DBTableView5VendorNo: TcxGridDBColumn
        DataBinding.FieldName = 'VendorNo'
      end
      object cxGrid1DBTableView5VendorName: TcxGridDBColumn
        DataBinding.FieldName = 'VendorName'
      end
      object cxGrid1DBTableView5Address1: TcxGridDBColumn
        DataBinding.FieldName = 'Address1'
      end
      object cxGrid1DBTableView5Address2: TcxGridDBColumn
        DataBinding.FieldName = 'Address2'
      end
      object cxGrid1DBTableView5City: TcxGridDBColumn
        DataBinding.FieldName = 'City'
      end
      object cxGrid1DBTableView5State: TcxGridDBColumn
        DataBinding.FieldName = 'State'
      end
      object cxGrid1DBTableView5Zip: TcxGridDBColumn
        DataBinding.FieldName = 'Zip'
      end
      object cxGrid1DBTableView5Country: TcxGridDBColumn
        DataBinding.FieldName = 'Country'
      end
      object cxGrid1DBTableView5Phone: TcxGridDBColumn
        DataBinding.FieldName = 'Phone'
      end
      object cxGrid1DBTableView5FAX: TcxGridDBColumn
        DataBinding.FieldName = 'FAX'
      end
      object cxGrid1DBTableView5Preferred: TcxGridDBColumn
        DataBinding.FieldName = 'Preferred'
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGrid1DBTableView1
      Options.DetailFrameWidth = 0
      object cxGridLevel2: TcxGridLevel
        GridView = cxGrid1DBTableView2
        Options.DetailFrameWidth = 0
      end
    end
  end
  object Database1: TDatabase
    AliasName = 'DBDEMOS'
    Connected = True
    DatabaseName = 'DB'
    SessionName = 'Default'
    Left = 548
    Top = 74
  end
  object Table1: TTable
    Active = True
    CachedUpdates = True
    DatabaseName = 'DB'
    TableName = 'customer.db'
    Left = 163
    Top = 291
  end
  object Table2: TTable
    Active = True
    CachedUpdates = True
    DatabaseName = 'DB'
    TableName = 'orders.db'
    Left = 209
    Top = 293
  end
  object Table3: TTable
    Active = True
    CachedUpdates = True
    DatabaseName = 'DB'
    TableName = 'items.db'
    Left = 265
    Top = 292
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 163
    Top = 330
  end
  object DataSource2: TDataSource
    DataSet = Table2
    Left = 213
    Top = 333
  end
  object DataSource3: TDataSource
    DataSet = Table3
    Left = 264
    Top = 329
  end
end
