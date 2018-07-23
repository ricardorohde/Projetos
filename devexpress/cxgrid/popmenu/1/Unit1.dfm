object Form1: TForm1
  Left = 302
  Top = 132
  Width = 783
  Height = 540
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
    Left = 0
    Top = 0
    Width = 775
    Height = 506
    Align = alClient
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.First.Visible = True
      NavigatorButtons.PriorPage.Visible = True
      NavigatorButtons.Prior.Visible = True
      NavigatorButtons.Next.Visible = True
      NavigatorButtons.NextPage.Visible = True
      NavigatorButtons.Last.Visible = True
      NavigatorButtons.Insert.Visible = True
      NavigatorButtons.Delete.Visible = True
      NavigatorButtons.Edit.Visible = True
      NavigatorButtons.Post.Visible = True
      NavigatorButtons.Cancel.Visible = True
      NavigatorButtons.Refresh.Visible = True
      NavigatorButtons.SaveBookmark.Visible = True
      NavigatorButtons.GotoBookmark.Visible = True
      NavigatorButtons.Filter.Visible = True
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid1DBTableView1SpeciesNo: TcxGridDBColumn
        DataBinding.FieldName = 'Species No'
        RepositoryItem = cxEditRepository1CalcItem1
        Width = 111
      end
      object cxGrid1DBTableView1Lengthcm: TcxGridDBColumn
        DataBinding.FieldName = 'Length (cm)'
        RepositoryItem = cxEditRepository1CalcItem1
      end
      object cxGrid1DBTableView1Category: TcxGridDBColumn
        DataBinding.FieldName = 'Category'
      end
      object cxGrid1DBTableView1Common_Name: TcxGridDBColumn
        DataBinding.FieldName = 'Common_Name'
      end
      object cxGrid1DBTableView1SpeciesName: TcxGridDBColumn
        DataBinding.FieldName = 'Species Name'
        PropertiesClassName = 'TcxTextEditProperties'
      end
      object cxGrid1DBTableView1Length_In: TcxGridDBColumn
        DataBinding.FieldName = 'Length_In'
      end
      object cxGrid1DBTableView1Notes: TcxGridDBColumn
        DataBinding.FieldName = 'Notes'
      end
      object cxGrid1DBTableView1Graphic: TcxGridDBColumn
        DataBinding.FieldName = 'Graphic'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    TableName = 'biolife.db'
    Left = 64
    Top = 32
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 24
    Top = 32
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    Grid = cxGrid1
    PopupMenus = <>
    OnPopup = cxGridPopupMenu1Popup
    Left = 48
    Top = 296
  end
  object cxEditRepository1: TcxEditRepository
    Left = 48
    Top = 176
    object cxEditRepository1CalcItem1: TcxEditRepositoryCalcItem
    end
  end
end
