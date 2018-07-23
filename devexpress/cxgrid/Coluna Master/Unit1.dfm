object Form1: TForm1
  Left = 191
  Top = 0
  Width = 746
  Height = 589
  Caption = 'Consultas das Faturas (PRE200AUX)'
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
  object Grade: TcxGrid
    Left = 0
    Top = 41
    Width = 738
    Height = 337
    Align = alTop
    TabOrder = 0
    object tv: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      Styles.Header = EstiloHeader
      object tvvisao: TcxGridDBColumn
        DataBinding.FieldName = 'visao'
        Visible = False
        GroupIndex = 0
        Options.Editing = False
        Options.ShowCaption = False
        IsCaptionAssigned = True
      end
      object tvData: TcxGridDBColumn
        DataBinding.FieldName = 'Data'
        Options.Editing = False
        Styles.OnGetContentStyle = tvDataStylesGetContentStyle
        Width = 81
      end
      object tvDescricao: TcxGridDBColumn
        DataBinding.FieldName = 'Descricao'
        Options.Editing = False
        Styles.OnGetContentStyle = tvDataStylesGetContentStyle
        Width = 120
      end
      object tvValor: TcxGridDBColumn
        DataBinding.FieldName = 'Valor'
        Options.Editing = False
        Styles.OnGetContentStyle = tvDataStylesGetContentStyle
        Width = 74
      end
      object tvCotacao: TcxGridDBColumn
        DataBinding.FieldName = 'Cotacao'
        Options.Editing = False
        Width = 69
      end
      object tvFator: TcxGridDBColumn
        DataBinding.FieldName = 'Fator'
        Options.Editing = False
      end
      object tvPontos: TcxGridDBColumn
        DataBinding.FieldName = 'Pontos'
        Options.Editing = False
      end
      object tvSelecionado: TcxGridDBColumn
        DataBinding.FieldName = 'Selecionado'
        Visible = False
      end
      object tvTeste: TcxGridDBColumn
        DataBinding.FieldName = 'Teste'
        Visible = False
      end
    end
    object lv: TcxGridLevel
      GridView = tv
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 378
    Width = 303
    Height = 150
    Align = alClient
    BevelInner = bvSpace
    BevelOuter = bvLowered
    Color = 16053492
    TabOrder = 1
    object Label8: TLabel
      Left = 5
      Top = 100
      Width = 165
      Height = 17
      AutoSize = False
      Caption = 'N'#186' Fidelidade....................: '
      Color = 16053492
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object Label9: TLabel
      Left = 5
      Top = 4
      Width = 165
      Height = 17
      AutoSize = False
      Caption = 'N'#186' da Fatura.....................:'
      Color = 16053492
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object Label10: TLabel
      Left = 5
      Top = 20
      Width = 165
      Height = 17
      AutoSize = False
      Caption = 'Refer'#234'ncia........................:'
      Color = 16053492
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object Label11: TLabel
      Left = 5
      Top = 36
      Width = 165
      Height = 17
      AutoSize = False
      Caption = 'Vencimento.......................:'
      Color = 16053492
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object Label12: TLabel
      Left = 5
      Top = 52
      Width = 165
      Height = 17
      AutoSize = False
      Caption = 'Emiss'#227'o............................:'
      Color = 16053492
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object Label13: TLabel
      Left = 5
      Top = 68
      Width = 165
      Height = 17
      AutoSize = False
      Caption = 'Gera'#231#227'o...........................:'
      Color = 16053492
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object Label14: TLabel
      Left = 5
      Top = 84
      Width = 165
      Height = 17
      AutoSize = False
      Caption = 'Valor................................:'
      Color = 16053492
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
  end
  object Panel2: TPanel
    Left = 303
    Top = 378
    Width = 435
    Height = 150
    Align = alRight
    BevelInner = bvSpace
    BevelOuter = bvLowered
    Color = 16053492
    TabOrder = 2
    object Label1: TLabel
      Left = 4
      Top = 115
      Width = 165
      Height = 17
      AutoSize = False
      Caption = 'Total de Ptos a Expirar.......:'
      Color = 16053492
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object Label2: TLabel
      Left = 4
      Top = 83
      Width = 165
      Height = 17
      AutoSize = False
      Caption = 'Expirados..........................:'
      Color = 16053492
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object Label3: TLabel
      Left = 4
      Top = 67
      Width = 165
      Height = 17
      AutoSize = False
      Caption = 'Resgates..........................:'
      Color = 16053492
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object Label4: TLabel
      Left = 4
      Top = 51
      Width = 165
      Height = 17
      AutoSize = False
      Caption = 'Ajustes (+/-)......................:'
      Color = 16053492
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object Label5: TLabel
      Left = 4
      Top = 35
      Width = 165
      Height = 17
      AutoSize = False
      Caption = 'Bonifica'#231#245'es.....................:'
      Color = 16053492
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object Label6: TLabel
      Left = 4
      Top = 19
      Width = 165
      Height = 17
      AutoSize = False
      Caption = 'Adquiridos nesta Fatura......:'
      Color = 16053492
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object Label7: TLabel
      Left = 4
      Top = 3
      Width = 165
      Height = 17
      AutoSize = False
      Caption = 'Saldo Anterior...................: '
      Color = 16053492
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object Label15: TLabel
      Left = 4
      Top = 131
      Width = 165
      Height = 17
      AutoSize = False
      Caption = 'Total de Pontos.................:'
      Color = 16053492
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object Label20: TLabel
      Left = 4
      Top = 99
      Width = 165
      Height = 17
      AutoSize = False
      Caption = 'Turbinados........................:'
      Color = 16053492
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
  end
  object pnBottom: TPanel
    Left = 0
    Top = 528
    Width = 738
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object Bevel1: TBevel
      Left = 0
      Top = 0
      Width = 738
      Height = 6
      Align = alTop
      Shape = bsTopLine
    end
    object bbAnterior: TButton
      Left = 64
      Top = 6
      Width = 121
      Height = 25
      Caption = '<<&Anterior'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object bbProximo: TButton
      Left = 195
      Top = 6
      Width = 121
      Height = 25
      Caption = '&Pr'#243'ximo>>'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object Exporta_Fatura: TButton
      Left = 606
      Top = 6
      Width = 121
      Height = 25
      Caption = 'Exporta Fatura'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = Exporta_FaturaClick
    end
  end
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 738
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 738
      Height = 37
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      object Label16: TLabel
        Left = 438
        Top = 4
        Width = 40
        Height = 13
        Caption = 'Produto:'
      end
      object Label17: TLabel
        Left = 7
        Top = 4
        Width = 31
        Height = 13
        Caption = 'Nome:'
      end
      object Label18: TLabel
        Left = 220
        Top = 4
        Width = 48
        Height = 13
        Caption = 'Programa:'
      end
      object Label19: TLabel
        Left = 682
        Top = 4
        Width = 31
        Height = 13
        Caption = 'Conta:'
      end
      object edNoCliente: TLabel
        Left = 7
        Top = 18
        Width = 210
        Height = 13
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object edProgram_Member: TLabel
        Left = 220
        Top = 18
        Width = 213
        Height = 13
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object edProduto: TLabel
        Left = 438
        Top = 18
        Width = 238
        Height = 13
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object edConta: TLabel
        Left = 682
        Top = 18
        Width = 63
        Height = 13
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 264
    Top = 32
    object ClientDataSet1visao: TStringField
      FieldName = 'visao'
      Size = 50
    end
    object ClientDataSet1Data: TDateField
      FieldName = 'Data'
    end
    object ClientDataSet1Descricao: TStringField
      FieldName = 'Descricao'
    end
    object ClientDataSet1Valor: TFloatField
      FieldName = 'Valor'
    end
    object ClientDataSet1Cotacao: TFloatField
      FieldName = 'Cotacao'
    end
    object ClientDataSet1Fator: TIntegerField
      FieldName = 'Fator'
    end
    object ClientDataSet1Pontos: TFloatField
      FieldName = 'Pontos'
    end
    object ClientDataSet1Selecionado: TBooleanField
      FieldName = 'Selecionado'
    end
    object ClientDataSet1Teste: TStringField
      FieldName = 'Teste'
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 336
    Top = 32
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 72
    Top = 32
    PixelsPerInch = 96
    object EstiloTurbo: TcxStyle
      AssignedValues = [svColor]
      Color = 15590611
    end
    object EstiloNivelGastos: TcxStyle
      AssignedValues = [svColor]
      Color = 11579647
    end
    object EstiloPadrao: TcxStyle
    end
    object EstiloHeader: TcxStyle
      AssignedValues = [svColor]
      Color = clGradientActiveCaption
    end
  end
  object SaveDialog: TSaveDialog
    Left = 623
    Top = 466
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    Grid = Grade
    PopupMenus = <>
    Left = 584
    Top = 64
  end
  object cxLocalizer1: TcxLocalizer
    Left = 24
    Top = 321
  end
end
