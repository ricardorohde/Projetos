object Form1: TForm1
  Left = 204
  Top = 178
  Width = 961
  Height = 675
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 104
    Top = 56
    Width = 761
    Height = 513
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Kind = skSum
          Column = cxGrid1DBTableView1AmountPaid
        end
        item
          Kind = skSum
          Position = spFooter
          Column = cxGrid1DBTableView1AmountPaid
        end>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      DataController.Summary.OnAfterSummary = cxGrid1DBTableView1DataControllerSummaryAfterSummary
      OptionsView.GroupFooters = gfAlwaysVisible
      OptionsView.GroupSummaryLayout = gslAlignWithColumns
      object cxGrid1DBTableView1OrderNo: TcxGridDBColumn
        DataBinding.FieldName = 'OrderNo'
      end
      object cxGrid1DBTableView1CustNo: TcxGridDBColumn
        DataBinding.FieldName = 'CustNo'
        Visible = False
        GroupIndex = 0
      end
      object cxGrid1DBTableView1SaleDate: TcxGridDBColumn
        DataBinding.FieldName = 'SaleDate'
      end
      object cxGrid1DBTableView1AmountPaid: TcxGridDBColumn
        DataBinding.FieldName = 'AmountPaid'
        Width = 137
      end
      object cxGrid1DBTableView1ShipDate: TcxGridDBColumn
        DataBinding.FieldName = 'ShipDate'
      end
      object cxGrid1DBTableView1EmpNo: TcxGridDBColumn
        DataBinding.FieldName = 'EmpNo'
      end
      object cxGrid1DBTableView1PO: TcxGridDBColumn
        DataBinding.FieldName = 'PO'
      end
      object cxGrid1DBTableView1Terms: TcxGridDBColumn
        DataBinding.FieldName = 'Terms'
      end
      object cxGrid1DBTableView1PaymentMethod: TcxGridDBColumn
        DataBinding.FieldName = 'PaymentMethod'
      end
      object cxGrid1DBTableView1ItemsTotal: TcxGridDBColumn
        DataBinding.FieldName = 'ItemsTotal'
      end
      object cxGrid1DBTableView1TaxRate: TcxGridDBColumn
        DataBinding.FieldName = 'TaxRate'
      end
      object cxGrid1DBTableView1Freight: TcxGridDBColumn
        DataBinding.FieldName = 'Freight'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Table1: TTable
    Active = True
    CachedUpdates = True
    DatabaseName = 'DBDEMOS'
    TableName = 'orders.db'
    Left = 56
    Top = 40
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 64
    Top = 96
  end
end
