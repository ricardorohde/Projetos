object Form1: TForm1
  Left = 237
  Top = 102
  Width = 499
  Height = 349
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 491
    Height = 309
    Align = alClient
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSource2
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Indicator = True
      OptionsView.NewItemRowInfoText = 'Click here to add a new row'
      object cxGrid1DBTableView1OrderNo: TcxGridDBColumn
        DataBinding.FieldName = 'OrderNo'
      end
      object cxGrid1DBTableView1CustNo: TcxGridDBColumn
        DataBinding.FieldName = 'CustNo'
      end
      object cxGrid1DBTableView1Freight: TcxGridDBColumn
        Width = 96
        DataBinding.FieldName = 'Freight'
      end
      object cxGrid1DBTableView1AmountPaid: TcxGridDBColumn
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.OnEditValueChanged = cxGrid1DBTableView1AmountPaidPropertiesEditValueChanged
        Width = 147
        DataBinding.FieldName = 'AmountPaid'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object DataSource2: TDataSource
    DataSet = Table2
    Left = 80
    Top = 136
  end
  object Table2: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    IndexName = 'CustNo'
    TableName = 'orders.db'
    Left = 48
    Top = 136
  end
end
