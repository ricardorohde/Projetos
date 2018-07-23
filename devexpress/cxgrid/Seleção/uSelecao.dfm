object Form1: TForm1
  Left = 200
  Top = 186
  Width = 625
  Height = 373
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
    Width = 617
    Height = 305
    Align = alClient
    TabOrder = 0
    object tv: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DataSource1
      DataController.KeyFieldNames = 'CODIGO'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      object tvSelecionar: TcxGridDBColumn
        Caption = 'Selecionar todos'
        DataBinding.ValueType = 'Boolean'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        HeaderAlignmentHorz = taCenter
        MinWidth = 100
        Options.Filtering = False
        Options.GroupFooters = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
        Width = 100
        OnHeaderClick = tvSelecionarHeaderClick
      end
      object tvCODIGO: TcxGridDBColumn
        DataBinding.FieldName = 'CODIGO'
        Width = 112
      end
      object tvDESCRICAO: TcxGridDBColumn
        DataBinding.FieldName = 'DESCRICAO'
        Width = 309
      end
      object tvColumn1: TcxGridDBColumn
        DataBinding.ValueType = 'String'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Caption = 'Teste'
            Kind = bkText
          end>
        Properties.HideSelection = False
        Properties.ReadOnly = True
        Properties.OnButtonClick = tvColumn1PropertiesButtonClick
        Visible = False
        MinWidth = 64
        Options.Filtering = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.IgnoreTimeForFiltering = False
        Options.IncSearch = False
        Options.ShowEditButtons = isebAlways
        Options.GroupFooters = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
        VisibleForCustomization = False
      end
      object tvColumn2: TcxGridDBColumn
        Caption = 'teste'
        DataBinding.ValueType = 'String'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Caption = 'Follow-up'
            Default = True
            Kind = bkText
          end>
        Properties.ReadOnly = False
        Properties.ViewStyle = vsButtonsOnly
        Properties.OnButtonClick = tvColumn1PropertiesButtonClick
        MinWidth = 64
        Options.Filtering = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.IgnoreTimeForFiltering = False
        Options.IncSearch = False
        Options.ShowEditButtons = isebAlways
        Options.GroupFooters = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
      end
    end
    object lv: TcxGridLevel
      GridView = tv
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 305
    Width = 617
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 384
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'IdxPrimario'
        Fields = 'CODIGO'
        Options = [ixPrimary]
      end>
    IndexName = 'IdxPrimario'
    Params = <>
    StoreDefs = True
    Left = 288
    Top = 88
    object ClientDataSet1CODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object ClientDataSet1DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 296
    Top = 40
  end
end
