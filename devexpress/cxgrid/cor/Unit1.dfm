object Form1: TForm1
  Left = 398
  Top = 103
  Width = 979
  Height = 563
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
    Top = 0
    Width = 971
    Height = 536
    Align = alClient
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Styles.OnGetContentStyle = cxGrid1DBTableView1StylesGetContentStyle
      object cxGrid1DBTableView1Flag: TcxGridDBColumn
        DataBinding.FieldName = 'Flag'
        OnGetDisplayText = cxGrid1DBTableView1FlagGetDisplayText
        Width = 90
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 600
    Top = 112
    object ClientDataSet1Flag: TStringField
      FieldName = 'Flag'
      Size = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 448
    Top = 88
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 272
    Top = 104
    PixelsPerInch = 96
    object EstiloAzul: TcxStyle
    end
    object EstiloVermelho: TcxStyle
      AssignedValues = [svColor]
      Color = 8421631
    end
  end
end
