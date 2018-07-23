object Form1: TForm1
  Left = 0
  Top = 229
  Caption = 'Form'
  ClientHeight = 575
  ClientWidth = 904
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid: TcxGrid
    Left = 0
    Top = 0
    Width = 904
    Height = 575
    Align = alClient
    TabOrder = 0
    LookAndFeel.Kind = lfUltraFlat
    object cxView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataModeController.GridMode = True
      DataController.DataSource = DataSource1
      DataController.Filter.MaxValueListCount = 1000
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Filtering.ColumnPopupMaxDropDownItemCount = 12
      OptionsBehavior.PostponedSynchronization = False
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.Appending = True
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.InvertSelect = False
      OptionsView.Indicator = True
      Preview.AutoHeight = False
      Preview.MaxLineCount = 2
      object cxViewCustNo: TcxGridDBColumn
        DataBinding.FieldName = 'CustNo'
      end
      object cxViewCompany: TcxGridDBColumn
        DataBinding.FieldName = 'Company'
      end
      object cxViewAddr1: TcxGridDBColumn
        DataBinding.FieldName = 'Addr1'
      end
      object cxViewAddr2: TcxGridDBColumn
        DataBinding.FieldName = 'Addr2'
      end
      object cxViewCity: TcxGridDBColumn
        DataBinding.FieldName = 'City'
      end
      object cxViewState: TcxGridDBColumn
        DataBinding.FieldName = 'State'
      end
      object cxViewZip: TcxGridDBColumn
        DataBinding.FieldName = 'Zip'
      end
      object cxViewCountry: TcxGridDBColumn
        DataBinding.FieldName = 'Country'
      end
      object cxViewPhone: TcxGridDBColumn
        DataBinding.FieldName = 'Phone'
      end
      object cxViewFAX: TcxGridDBColumn
        DataBinding.FieldName = 'FAX'
      end
      object cxViewTaxRate: TcxGridDBColumn
        DataBinding.FieldName = 'TaxRate'
      end
      object cxViewContact: TcxGridDBColumn
        DataBinding.FieldName = 'Contact'
      end
      object cxViewLastInvoiceDate: TcxGridDBColumn
        DataBinding.FieldName = 'LastInvoiceDate'
      end
    end
    object cxLevel: TcxGridLevel
      GridView = cxView
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 32
    Top = 32
  end
  object Table1: TTable
    Active = True
    CachedUpdates = True
    AfterEdit = Table1AfterEdit
    DatabaseName = 'DBDEMOS'
    TableName = 'customer.db'
    Left = 72
    Top = 32
    object Table1CustNo: TFloatField
      FieldName = 'CustNo'
    end
    object Table1Company: TStringField
      FieldName = 'Company'
      Size = 30
    end
    object Table1Addr1: TStringField
      FieldName = 'Addr1'
      Size = 30
    end
    object Table1Addr2: TStringField
      FieldName = 'Addr2'
      Size = 30
    end
    object Table1City: TStringField
      FieldName = 'City'
      Size = 15
    end
    object Table1State: TStringField
      FieldName = 'State'
    end
    object Table1Zip: TStringField
      FieldName = 'Zip'
      Size = 10
    end
    object Table1Country: TStringField
      FieldName = 'Country'
    end
    object Table1Phone: TStringField
      FieldName = 'Phone'
      Size = 15
    end
    object Table1FAX: TStringField
      FieldName = 'FAX'
      Size = 15
    end
    object Table1TaxRate: TFloatField
      FieldName = 'TaxRate'
    end
    object Table1Contact: TStringField
      FieldName = 'Contact'
    end
    object Table1LastInvoiceDate: TDateTimeField
      FieldName = 'LastInvoiceDate'
    end
  end
end
