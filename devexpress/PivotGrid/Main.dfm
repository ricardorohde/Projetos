object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'Sample Pivot Grid'
  ClientHeight = 514
  ClientWidth = 710
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object grActivityDetails: TcxDBPivotGrid
    Left = 0
    Top = 0
    Width = 710
    Height = 514
    Align = alClient
    DataSource = dsAccountDetails
    Groups = <>
    OptionsSelection.MultiSelect = True
    OptionsView.ColumnGrandTotals = False
    OptionsView.ColumnGrandTotalWidth = 120
    OptionsView.RowGrandTotalWidth = 358
    TabOrder = 0
    OnDblClick = grActivityDetailsDblClick
    ExplicitLeft = -380
    ExplicitTop = -283
    ExplicitWidth = 1065
    ExplicitHeight = 762
    object cxDBPivotGrid1YEARTEXT: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'Fisacal Year'
      DataBinding.FieldName = 'YEARTEXT'
      Visible = True
      UniqueName = 'Budget Year'
    end
    object cxDBPivotGrid1PERIODTEXT: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 1
      IsCaptionAssigned = True
      Caption = 'Month'
      DataBinding.FieldName = 'PERIODTEXT'
      TotalsVisibility = tvNone
      Visible = True
      UniqueName = 'Month'
    end
    object cxDBPivotGrid1CURRENCYDESCRIPTION: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'Currency'
      DataBinding.FieldName = 'CURRENCYDESCRIPTION'
      TotalsVisibility = tvNone
      Visible = True
      UniqueName = 'Currency'
    end
    object cxDBPivotGrid1PRORATEDAMOUNT: TcxDBPivotGridField
      Area = faData
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'Prorated Amount'
      DataBinding.FieldName = 'PRORATEDAMOUNT'
      DisplayFormat = ',0.00;-,0.00'#39'.'
      Visible = True
      UniqueName = 'Prorated Amount'
    end
    object cxDBPivotGridAccount: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 2
      IsCaptionAssigned = True
      Caption = 'Account'
      DataBinding.FieldName = 'ACCOUNTNUMBERWITHDESCRIPTION'
      TotalsVisibility = tvNone
      Visible = True
      Width = 251
      UniqueName = 'Account'
    end
  end
  object ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 8
    Top = 8
  end
  object dsAccountDetails: TDataSource
    DataSet = ClientDataSet
    Left = 48
    Top = 8
  end
  object PivotGridDrillDownDataSet: TcxPivotGridDrillDownDataSet
    PivotGrid = grActivityDetails
    SynchronizeData = True
    Left = 96
    Top = 8
  end
  object dsDrillDownDataSet: TDataSource
    DataSet = PivotGridDrillDownDataSet
    Left = 144
    Top = 8
  end
end
