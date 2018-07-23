object Form1: TForm1
  Left = 265
  Top = 184
  Width = 330
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 33
    Width = 322
    Height = 420
    Align = alClient
    TabOrder = 0
    object tv: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dts1
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Kind = skSum
          Position = spFooter
          FieldName = 'Valor'
          Column = tvValor
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          FieldName = 'Valor'
          Column = tvValor
          DisplayText = 'Somat'#243'rio'
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ExpandButtonsForEmptyDetails = False
      OptionsView.Footer = True
      OptionsView.FooterMultiSummaries = True
      OptionsView.GroupByBox = False
      OptionsView.GroupFooters = gfAlwaysVisible
      OptionsView.GroupSummaryLayout = gslAlignWithColumns
      object tvid: TcxGridDBColumn
        DataBinding.FieldName = 'id'
        GroupIndex = 0
        Width = 89
      end
      object tvDescricao: TcxGridDBColumn
        DataBinding.FieldName = 'Descricao'
      end
      object tvValor: TcxGridDBColumn
        DataBinding.FieldName = 'Valor'
      end
    end
    object lv: TcxGridLevel
      GridView = tv
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 322
    Height = 33
    Align = alTop
    TabOrder = 1
    object CheckBox1: TCheckBox
      Left = 9
      Top = 8
      Width = 97
      Height = 17
      Caption = 'Sum'#225'rio Vis'#237'vel'
      TabOrder = 0
      OnClick = CheckBox1Click
    end
  end
  object cds1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 264
    Top = 8
    object cds1id: TIntegerField
      FieldName = 'id'
    end
    object cds1Descricao: TStringField
      FieldName = 'Descricao'
    end
    object cds1Valor: TFloatField
      FieldName = 'Valor'
    end
  end
  object dts1: TDataSource
    DataSet = cds1
    Left = 312
    Top = 16
  end
end
