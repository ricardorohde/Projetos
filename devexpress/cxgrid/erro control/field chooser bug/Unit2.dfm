object Form2: TForm2
  Left = 301
  Top = 229
  Width = 870
  Height = 640
  Caption = 'Form2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 136
    Top = 48
    Width = 250
    Height = 200
    TabOrder = 0
    object cxGrid1Level1: TcxGridLevel
    end
  end
  object cxGridViewRepository1: TcxGridViewRepository
    Left = 496
    Top = 200
    object cxGridViewRepository1TableView2: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGridViewRepository1TableView2Column1: TcxGridColumn
      end
      object cxGridViewRepository1TableView2Column2: TcxGridColumn
      end
      object cxGridViewRepository1TableView2Column3: TcxGridColumn
      end
    end
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    Grid = cxGrid1
    PopupMenus = <>
    Left = 464
    Top = 128
  end
end
