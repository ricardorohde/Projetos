object frmMovimentacao: TfrmMovimentacao
  Left = 230
  Top = 151
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Movimenta'#231#227'o do funcion'#225'rio'
  ClientHeight = 524
  ClientWidth = 700
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
  object grdMovimentacao: TcxGrid
    Left = 0
    Top = 53
    Width = 700
    Height = 430
    Align = alClient
    TabOrder = 0
    object tv: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dtsMovimentacao
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object tvData: TcxGridDBColumn
        Caption = ' Data'
        DataBinding.FieldName = 'Data'
        MinWidth = 85
        Options.Editing = False
        Options.Focusing = False
        Options.HorzSizing = False
        Width = 85
      end
      object tvHora1: TcxGridDBColumn
        Caption = 'Hora 1'
        DataBinding.FieldName = 'Hora1'
        MinWidth = 50
        Options.Editing = False
        Options.Focusing = False
        Options.HorzSizing = False
        Width = 50
      end
      object tvHora2: TcxGridDBColumn
        Caption = 'Hora 2'
        DataBinding.FieldName = 'Hora2'
        MinWidth = 50
        Options.Editing = False
        Options.Focusing = False
        Options.HorzSizing = False
        Width = 50
      end
      object tvHora3: TcxGridDBColumn
        Caption = 'Hora 2'
        DataBinding.FieldName = 'Hora3'
        MinWidth = 50
        Options.Editing = False
        Options.Focusing = False
        Options.HorzSizing = False
        Width = 50
      end
      object tvHora4: TcxGridDBColumn
        Caption = 'Hora 4'
        DataBinding.FieldName = 'Hora4'
        MinWidth = 50
        Options.Editing = False
        Options.Focusing = False
        Options.HorzSizing = False
        Width = 50
      end
      object tvHora5: TcxGridDBColumn
        Caption = 'Hora 5'
        DataBinding.FieldName = 'Hora5'
        MinWidth = 50
        Options.Editing = False
        Options.Focusing = False
        Options.HorzSizing = False
        Width = 50
      end
      object tvHora6: TcxGridDBColumn
        Caption = 'Hora 6'
        DataBinding.FieldName = 'Hora6'
        MinWidth = 50
        Options.Editing = False
        Options.Focusing = False
        Options.HorzSizing = False
        Width = 50
      end
      object tvHora7: TcxGridDBColumn
        Caption = 'Hora 7'
        DataBinding.FieldName = 'Hora7'
        MinWidth = 50
        Options.Editing = False
        Options.Focusing = False
        Options.HorzSizing = False
        Width = 50
      end
      object tvHora8: TcxGridDBColumn
        Caption = 'tvHora8'
        DataBinding.FieldName = 'Hora8'
        MinWidth = 50
        Options.Editing = False
        Options.Focusing = False
        Options.HorzSizing = False
        Width = 50
      end
      object tvHora9: TcxGridDBColumn
        Caption = 'Hora 9'
        DataBinding.FieldName = 'Hora9'
        MinWidth = 50
        Options.Editing = False
        Options.Focusing = False
        Options.HorzSizing = False
        Width = 50
      end
      object tvHora10: TcxGridDBColumn
        Caption = 'Hora 10'
        DataBinding.FieldName = 'Hora10'
        MinWidth = 50
        Options.Editing = False
        Options.Focusing = False
        Options.HorzSizing = False
        Width = 50
      end
      object tvMovimentado: TcxGridDBColumn
        DataBinding.FieldName = 'Movimentado'
        MinWidth = 70
        Options.Editing = False
        Options.Focusing = False
        Options.HorzSizing = False
        Width = 70
      end
    end
    object grdMovimentacaoLevel1: TcxGridLevel
      GridView = tv
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 483
    Width = 700
    Height = 41
    Align = alBottom
    TabOrder = 1
    object cboPis: TComboBox
      Left = 8
      Top = 8
      Width = 153
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = 'Edson     - 016013094641'
      Items.Strings = (
        'Edson     - 016013094641'
        'Raphael - 013229094629')
    end
    object btnExportar: TButton
      Left = 612
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Exportar'
      TabOrder = 1
      OnClick = btnExportarClick
    end
    object btnRelatorio: TButton
      Left = 528
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Relat'#243'rio'
      TabOrder = 2
      OnClick = btnRelatorioClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 700
    Height = 53
    Align = alTop
    TabOrder = 2
    object Label4: TLabel
      Left = 7
      Top = 7
      Width = 45
      Height = 13
      Caption = 'Diret'#243'rio:'
    end
    object edtArquivo: TEdit
      Left = 7
      Top = 24
      Width = 358
      Height = 21
      TabOrder = 0
      Text = '\\NT03\diginet\exportacao\export'
    end
    object btnArquivo: TButton
      Left = 370
      Top = 20
      Width = 38
      Height = 25
      Caption = '...'
      TabOrder = 1
      OnClick = btnArquivoClick
    end
    object btnAtualizar: TButton
      Left = 416
      Top = 20
      Width = 129
      Height = 25
      Caption = 'Atualizar Movimenta'#231#227'o'
      TabOrder = 2
      OnClick = btnAtualizarClick
    end
  end
  object shlGetDirectory: TcxShellBrowserDialog
    FolderLabelCaption = 'Selecione o diret'#243'rio'
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = True
    Path = 'C:\'
    Left = 264
    Top = 65528
  end
  object mmdMovimentacao: TSetupMemData
    Indexes = <>
    SortOptions = []
    Left = 288
    Top = 65528
    object mmdMovimentacaoData: TDateTimeField
      FieldName = 'Data'
    end
    object mmdMovimentacaoHora1: TStringField
      FieldName = 'Hora1'
      Size = 5
    end
    object mmdMovimentacaoHora2: TStringField
      FieldName = 'Hora2'
      Size = 5
    end
    object mmdMovimentacaoHora3: TStringField
      FieldName = 'Hora3'
      Size = 5
    end
    object mmdMovimentacaoHora4: TStringField
      FieldName = 'Hora4'
      Size = 5
    end
    object mmdMovimentacaoHora5: TStringField
      FieldName = 'Hora5'
      Size = 5
    end
    object mmdMovimentacaoHora6: TStringField
      FieldName = 'Hora6'
      Size = 5
    end
    object mmdMovimentacaoHora7: TStringField
      FieldName = 'Hora7'
      Size = 5
    end
    object mmdMovimentacaoHora8: TStringField
      FieldName = 'Hora8'
      Size = 5
    end
    object mmdMovimentacaoHora9: TStringField
      FieldName = 'Hora9'
      Size = 5
    end
    object mmdMovimentacaoHora10: TStringField
      FieldName = 'Hora10'
      Size = 5
    end
    object mmdMovimentacaoMovimentado: TStringField
      FieldName = 'Movimentado'
      Size = 5
    end
  end
  object dtsMovimentacao: TDataSource
    DataSet = mmdMovimentacao
    Left = 320
    Top = 65528
  end
end
