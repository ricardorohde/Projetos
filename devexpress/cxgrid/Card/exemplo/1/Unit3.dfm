object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 614
  ClientWidth = 834
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
    Left = 64
    Top = 32
    Width = 705
    Height = 401
    TabOrder = 0
    object cxGrid1DBCardView1: TcxGridDBCardView
      NavigatorButtons.ConfirmDelete = False
      OnCustomDrawCell = cxGrid1DBCardView1CustomDrawCell
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      LayoutDirection = ldVertical
      OptionsView.CardWidth = 195
      object cxGrid1DBCardView1Name: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Name'
        Position.BeginsLayer = True
      end
      object cxGrid1DBCardView1Capital: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Capital'
        Position.BeginsLayer = True
      end
      object cxGrid1DBCardView1Continent: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Continent'
        Position.BeginsLayer = True
      end
      object cxGrid1DBCardView1Area: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Area'
        Position.BeginsLayer = True
      end
      object cxGrid1DBCardView1Population: TcxGridDBCardViewRow
        Caption = 'Population22'
        DataBinding.FieldName = 'Population'
        Position.BeginsLayer = True
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBCardView1
    end
  end
  object Table1: TTable
    Active = True
    CachedUpdates = True
    DatabaseName = 'DBDEMOS'
    TableName = 'country.db'
    Left = 64
    Top = 464
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 104
    Top = 464
  end
end
