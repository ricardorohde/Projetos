object Form1: TForm1
  Left = 408
  Top = 150
  Width = 207
  Height = 378
  BorderIcons = [biSystemMenu]
  Caption = 'Clonar Empresa'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 191
    Height = 298
    Align = alClient
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.ColumnHorzSizing = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1Selecao: TcxGridDBColumn
        Caption = 'Selecionar Todos'
        DataBinding.FieldName = 'Selecao'
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object cxGrid1DBTableView1Ano: TcxGridDBColumn
        DataBinding.FieldName = 'Ano'
        HeaderAlignmentHorz = taCenter
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 298
    Width = 191
    Height = 41
    Align = alBottom
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 25
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Gravar'
      TabOrder = 0
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 105
      Top = 9
      Width = 82
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object SetupMemData1: TSetupMemData
    Indexes = <>
    SortOptions = []
    Left = 16
    Top = 8
    object SetupMemData1Selecao: TBooleanField
      FieldName = 'Selecao'
    end
    object SetupMemData1Ano: TIntegerField
      FieldName = 'Ano'
    end
  end
  object DataSource1: TDataSource
    DataSet = SetupMemData1
    Left = 48
    Top = 24
  end
end
