object Form1: TForm1
  Left = 378
  Top = 134
  Width = 547
  Height = 487
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
    Width = 513
    Height = 353
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ShowEditButtons = gsebAlways
      object cxGrid1DBTableView1RecId: TcxGridDBColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
      end
      object cxGrid1DBTableView1Name: TcxGridDBColumn
        DataBinding.FieldName = 'Name'
      end
      object cxGrid1DBTableView1Number: TcxGridDBColumn
        DataBinding.FieldName = 'Number'
        RepositoryItem = cxEditRepository1ButtonItem1
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object DataSource1: TDataSource
    DataSet = dxMemData1
    Left = 48
    Top = 368
  end
  object dxMemData1: TdxMemData
    Active = True
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F0200000014000000010005004E616D650004000000
      030007004E756D6265720001050000004E616D6530010B00000001050000004E
      616D6531011600000001050000004E616D65320121000000}
    SortOptions = []
    Left = 8
    Top = 368
    object dxMemData1Name: TStringField
      FieldName = 'Name'
    end
    object dxMemData1Number: TIntegerField
      FieldName = 'Number'
    end
  end
  object cxEditRepository1: TcxEditRepository
    Left = 312
    Top = 368
    object cxEditRepository1ButtonItem1: TcxEditRepositoryButtonItem
      Properties.Buttons = <
        item
          Caption = 'Button'
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ViewStyle = vsButtonsOnly
    end
  end
end
