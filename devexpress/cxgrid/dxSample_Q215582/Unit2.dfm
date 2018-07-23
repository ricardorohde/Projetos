object Form2: TForm2
  Left = 0
  Top = 0
  Width = 721
  Height = 550
  Caption = 'Form2'
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
    Left = 0
    Top = 0
    Width = 705
    Height = 511
    Align = alClient
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
      object cxGrid1DBTableView1A: TcxGridDBColumn
        DataBinding.FieldName = 'A'
      end
      object cxGrid1DBTableView1B: TcxGridDBColumn
        DataBinding.FieldName = 'B'
      end
      object cxGrid1DBTableView1Column1: TcxGridDBColumn
        Caption = '(A-B)'
        DataBinding.ValueType = 'Integer'
        OnGetDataText = cxGrid1DBTableView1Column1GetDataText
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object dxMemData1: TdxMemData
    Active = True
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F020000000400000003000200410004000000030002
      00420001FCFFFFFF010400000001020000000101000000010400000001000000
      000102000000010400000001010000000103000000}
    SortOptions = []
    Left = 32
    Top = 432
    object dxMemData1A: TIntegerField
      FieldName = 'A'
    end
    object dxMemData1B: TIntegerField
      FieldName = 'B'
    end
  end
  object DataSource1: TDataSource
    DataSet = dxMemData1
    Left = 88
    Top = 432
  end
end
