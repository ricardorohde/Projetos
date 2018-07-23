object Form1: TForm1
  Left = 418
  Top = 119
  Width = 601
  Height = 240
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
    Left = 8
    Top = 8
    Width = 569
    Height = 185
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems.OnSummary = cxGrid1DBTableView1DataControllerSummaryFooterSummaryItemsSummary
      DataController.Summary.FooterSummaryItems = <
        item
          Format = 'Totale = 0'
          Kind = skSum
          FieldName = 'Totale'
          Column = cxGrid1DBTableView1Totale
        end
        item
          Format = 'Quote =0'
          Kind = skSum
          FieldName = 'Quote'
          Column = cxGrid1DBTableView1Quote
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      OptionsView.GroupFooters = gfAlwaysVisible
      OptionsView.GroupRowStyle = grsOffice11
      object cxGrid1DBTableView1RecId: TcxGridDBColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
      end
      object cxGrid1DBTableView1Group: TcxGridDBColumn
        DataBinding.FieldName = 'Group'
      end
      object cxGrid1DBTableView1Quote: TcxGridDBColumn
        DataBinding.FieldName = 'Quote'
        Width = 84
      end
      object cxGrid1DBTableView1Totale: TcxGridDBColumn
        DataBinding.FieldName = 'Totale'
        Width = 106
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object DataSource1: TDataSource
    DataSet = dxMemData1
    Left = 416
    Top = 48
  end
  object dxMemData1: TdxMemData
    Active = True
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F03000000140000000100060047726F757000040000
      000300060051756F7465000400000003000700546F74616C6500010500000053
      6F74746F016400000001E8030000010A00000056657273616D656E746F016400
      000001E8030000010A00000056657273616D656E746F010A0000000164000000
      010A00000056657273616D656E746F010F0000000196000000010A0000005665
      7273616D656E746F016400000001E8030000}
    SortOptions = []
    Left = 344
    Top = 48
    object dxMemData1Group: TStringField
      FieldName = 'Group'
    end
    object dxMemData1Quote: TIntegerField
      FieldName = 'Quote'
    end
    object dxMemData1Totale: TIntegerField
      FieldName = 'Totale'
    end
  end
end
