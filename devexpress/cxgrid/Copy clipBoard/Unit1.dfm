object Form1: TForm1
  Left = 237
  Top = 102
  Width = 499
  Height = 475
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 491
    Height = 407
    Align = alClient
    TabOrder = 0
    object tv: TcxGridDBTableView
      OnKeyDown = tvKeyDown
      NavigatorButtons.ConfirmDelete = False
      OnCustomDrawCell = tvCustomDrawCell
      DataController.DataSource = DataSource2
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CopyCaptionsToClipboard = False
      OptionsBehavior.CopyPreviewToClipboard = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.Indicator = True
      object tvOrderNo: TcxGridDBColumn
        DataBinding.FieldName = 'OrderNo'
      end
      object tvCustNo: TcxGridDBColumn
        DataBinding.FieldName = 'CustNo'
      end
      object tvFreight: TcxGridDBColumn
        DataBinding.FieldName = 'Freight'
        Width = 96
      end
      object tvAmountPaid: TcxGridDBColumn
        DataBinding.FieldName = 'AmountPaid'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.OnEditValueChanged = cxGrid1DBTableView1AmountPaidPropertiesEditValueChanged
        Width = 147
      end
    end
    object lv: TcxGridLevel
      GridView = tv
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 407
    Width = 491
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 386
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Gerar CSV'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object DataSource2: TDataSource
    DataSet = ClientDataSet1
    Left = 80
    Top = 136
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 153
    Top = 138
    object ClientDataSet1OrderNo: TIntegerField
      FieldName = 'OrderNo'
    end
    object ClientDataSet1CustNo: TIntegerField
      FieldName = 'CustNo'
    end
    object ClientDataSet1Freight: TFloatField
      FieldName = 'Freight'
    end
    object ClientDataSet1AmountPaid: TFloatField
      FieldName = 'AmountPaid'
    end
  end
end
