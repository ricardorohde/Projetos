object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 418
  ClientWidth = 532
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
    Left = 8
    Top = 8
    Width = 513
    Height = 353
    PopupMenu = PopupMenu1
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid1DBTableView1RecId: TcxGridDBColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
      end
      object cxGrid1DBTableView1Name: TcxGridDBColumn
        DataBinding.FieldName = 'Name'
      end
      object cxGrid1DBTableView1Number: TcxGridDBColumn
        DataBinding.FieldName = 'Number'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 88
    Top = 365
    object EnableSearch1: TMenuItem
      Caption = 'EnableSearch'
      OnClick = EnableSearch1Click
    end
    object DisableSearch1: TMenuItem
      Caption = 'Disable Search'
      OnClick = DisableSearch1Click
    end
  end
  object DataSource1: TDataSource
    DataSet = dxMemData1
    Left = 48
    Top = 365
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
    Top = 365
    object dxMemData1Name: TStringField
      FieldName = 'Name'
    end
    object dxMemData1Number: TIntegerField
      FieldName = 'Number'
    end
  end
end
