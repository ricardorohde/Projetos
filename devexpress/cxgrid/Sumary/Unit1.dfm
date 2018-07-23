object Form1: TForm1
  Left = 430
  Top = 124
  Width = 666
  Height = 484
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
    Width = 449
    Height = 425
    TabOrder = 0
    RootLevelOptions.DetailTabsPosition = dtpTop
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      FilterBox.Visible = fvAlways
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid1DBTableView1RecId: TcxGridDBColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
      end
      object cxGrid1DBTableView1ID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
      end
      object cxGrid1DBTableView1Name: TcxGridDBColumn
        DataBinding.FieldName = 'Name'
      end
    end
    object cxGrid1DBTableView2: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      FilterBox.Visible = fvAlways
      DataController.DataSource = DataSource2
      DataController.DetailKeyFieldNames = 'DetailID'
      DataController.Filter.OnChanged = cxGrid1DBTableView2DataControllerFilterChanged
      DataController.MasterKeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid1DBTableView2RecId: TcxGridDBColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
      end
      object cxGrid1DBTableView2DetailID: TcxGridDBColumn
        DataBinding.FieldName = 'DetailID'
      end
      object cxGrid1DBTableView2Text: TcxGridDBColumn
        DataBinding.FieldName = 'Text'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      Caption = 'Level1'
      GridView = cxGrid1DBTableView1
      object cxGrid1Level2: TcxGridLevel
        GridView = cxGrid1DBTableView2
      end
    end
    object cxGrid1Level3: TcxGridLevel
      Caption = 'Level3'
    end
  end
  object Button1: TButton
    Left = 472
    Top = 8
    Width = 169
    Height = 113
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object DataSource1: TDataSource
    DataSet = dxMemData1
    Left = 224
    Top = 232
  end
  object DataSource2: TDataSource
    DataSet = dxMemData2
    Left = 320
    Top = 232
  end
  object dxMemData1: TdxMemData
    Active = True
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F020000000400000003000300494400140000000100
      05004E616D650001010000000101000000410102000000010100000042010300
      0000010100000043010400000001010000004401050000000101000000450106
      000000010100000046}
    SortOptions = []
    Left = 224
    Top = 184
    object dxMemData1ID: TIntegerField
      FieldName = 'ID'
    end
    object dxMemData1Name: TStringField
      FieldName = 'Name'
    end
  end
  object dxMemData2: TdxMemData
    Active = True
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F02000000040000000300090044657461696C494400
      1400000001000500546578740001010000000105000000546578743101010000
      00010700000054657874315F3101020000000105000000546578743201020000
      00010700000054657874325F3201030000000105000000546578743301030000
      00010700000054657874335F3301040000000105000000546578743401040000
      00010700000054657874345F3401050000000105000000546578743501050000
      00010700000054657874355F3501060000000105000000546578743601060000
      00010700000054657874365F36010100000001040000004E616D650101000000
      01060000004E616D655F31010200000001040000004E616D6501020000000106
      0000004E616D655F32010200000001060000004E616D655F33}
    SortOptions = []
    SortedField = 'DetailID'
    Left = 320
    Top = 184
    object dxMemData2DetailID: TIntegerField
      FieldName = 'DetailID'
    end
    object dxMemData2Text: TStringField
      FieldName = 'Text'
    end
  end
end
