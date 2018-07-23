object Form1: TForm1
  Left = 293
  Top = 158
  Width = 953
  Height = 685
  Caption = 'Exportador'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 8
    Top = 5
    Width = 40
    Height = 13
    Caption = 'Servidor'
  end
  object Label5: TLabel
    Left = 139
    Top = 39
    Width = 26
    Height = 13
    Caption = 'Alias:'
  end
  object Label6: TLabel
    Left = 9
    Top = 86
    Width = 114
    Height = 13
    Caption = 'Arquivo de Exporta'#231#227'o:'
  end
  object btnAtivar: TButton
    Left = 10
    Top = 54
    Width = 75
    Height = 25
    Caption = 'Ativar'
    TabOrder = 0
    OnClick = btnAtivarClick
  end
  object cbservers: TComboBox
    Left = 8
    Top = 19
    Width = 297
    Height = 21
    ItemHeight = 13
    TabOrder = 1
  end
  object edtArquivo: TEdit
    Left = 8
    Top = 102
    Width = 267
    Height = 21
    TabOrder = 2
  end
  object btnselarquivo: TButton
    Left = 279
    Top = 101
    Width = 30
    Height = 25
    Caption = '...'
    TabOrder = 3
    OnClick = btnselarquivoClick
  end
  object cboAlias: TComboBox
    Left = 141
    Top = 56
    Width = 161
    Height = 21
    ItemHeight = 13
    TabOrder = 4
  end
  object Panel1: TPanel
    Left = 0
    Top = 504
    Width = 937
    Height = 142
    Align = alBottom
    TabOrder = 5
    object Label1: TLabel
      Left = 14
      Top = 94
      Width = 65
      Height = 13
      Caption = 'Data do Filtro'
    end
    object Label2: TLabel
      Left = 107
      Top = 94
      Width = 71
      Height = 13
      Caption = 'Data Desejada'
    end
    object Label3: TLabel
      Left = 15
      Top = 0
      Width = 45
      Height = 13
      Caption = 'Empresa:'
    end
    object Label7: TLabel
      Left = 15
      Top = 41
      Width = 35
      Height = 13
      Caption = 'Op'#231#227'o:'
    end
    object btnGerar: TButton
      Left = 193
      Top = 106
      Width = 75
      Height = 25
      Caption = 'Gerar'
      TabOrder = 0
      OnClick = btnGerarClick
    end
    object cboEmpresa: TComboBox
      Left = 14
      Top = 16
      Width = 339
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      OnEnter = cboEmpresaEnter
    end
    object edtDtFiltro: TMaskEdit
      Left = 14
      Top = 110
      Width = 59
      Height = 21
      EditMask = '!99/0000;1; '
      MaxLength = 7
      TabOrder = 2
      Text = '  /    '
    end
    object edtDtDesejada: TMaskEdit
      Left = 107
      Top = 110
      Width = 62
      Height = 21
      EditMask = '!99/0000;1; '
      MaxLength = 7
      TabOrder = 3
      Text = '  /    '
    end
    object cboOpcao: TComboBox
      Left = 15
      Top = 58
      Width = 170
      Height = 21
      ItemHeight = 13
      TabOrder = 4
    end
  end
  object chkwdp: TCheckBox
    Left = 8
    Top = 128
    Width = 161
    Height = 17
    Caption = 'Est'#225' Integrado com o Wdp'
    TabOrder = 6
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 160
    Width = 921
    Height = 337
    DataSource = DataSource1
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object nxRemoteServerEngine1: TnxRemoteServerEngine
    ActiveRuntime = True
    ActiveDesigntime = True
    Transport = nxWinsockTransport1
    Left = 336
    Top = 40
  end
  object nxWinsockTransport1: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ActiveRuntime = True
    ActiveDesigntime = True
    ServerNameRuntime = 'EDSON.DSN.PACK@192.168.159.1'
    ServerNameDesigntime = 'EDSON.DSN.PACK@192.168.159.1'
    Left = 344
    Top = 8
  end
  object nxSession1: TnxSession
    ActiveRuntime = True
    ActiveDesigntime = True
    Default = True
    ServerEngine = nxRemoteServerEngine1
    Left = 336
    Top = 72
  end
  object dbteste: TnxDatabase
    Session = nxSession1
    Left = 312
    Top = 40
  end
  object OpenDialog1: TOpenDialog
    Left = 336
    Top = 104
  end
  object Query: TnxQuery
    Database = dbteste
    Left = 312
    Top = 72
    object Querytets: TStringField
      FieldName = 'tets'
      Size = 12
    end
  end
  object nxQuery1: TnxQuery
    Database = dbteste
    Left = 384
    Top = 88
  end
  object DataSource1: TDataSource
    DataSet = nxQuery1
    Left = 184
    Top = 264
  end
  object SetupMemData1: TSetupMemData
    Indexes = <>
    SortOptions = []
    Left = 464
    Top = 88
  end
end
