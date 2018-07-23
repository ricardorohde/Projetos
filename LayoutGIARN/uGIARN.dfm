object frmGIARN: TfrmGIARN
  Left = 341
  Top = 131
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Layout GIA-RN'
  ClientHeight = 664
  ClientWidth = 583
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 583
    Height = 73
    Align = alTop
    TabOrder = 0
    object Label3: TLabel
      Left = 8
      Top = 3
      Width = 81
      Height = 13
      Caption = 'Arquivo de texto'
    end
    object RadioGroup1: TRadioGroup
      Left = 272
      Top = 0
      Width = 167
      Height = 57
      Caption = 'Layout'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Com'#233'rcio'
        'Industria')
      TabOrder = 0
      OnClick = RadioGroup1Click
    end
    object edtArquivo: TEdit
      Left = 8
      Top = 18
      Width = 225
      Height = 21
      TabOrder = 1
    end
    object btnArquivo: TButton
      Left = 237
      Top = 17
      Width = 27
      Height = 21
      Caption = '...'
      TabOrder = 2
      OnClick = btnArquivoClick
    end
    object btnGerar: TButton
      Left = 8
      Top = 41
      Width = 89
      Height = 25
      Caption = 'Gerar'
      TabOrder = 3
      OnClick = btnGerarClick
    end
  end
  object pgLayout: TPageControl
    Left = 0
    Top = 73
    Width = 583
    Height = 591
    ActivePage = tbIndustria
    Align = alClient
    TabOrder = 1
    object tbComercio: TTabSheet
      Caption = 'Com'#233'rcio'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 575
        Height = 563
        Align = alClient
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object tbIndustria: TTabSheet
      Caption = 'Ind'#250'stria'
      ImageIndex = 1
      TabVisible = False
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 575
        Height = 563
        Align = alClient
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 16
    Top = 16
  end
  object SetupMemData1: TSetupMemData
    Indexes = <>
    SortOptions = []
    Left = 476
    Top = 17
    object SetupMemData1Campo: TStringField
      FieldName = 'Campo'
      Size = 70
    end
    object SetupMemData1Valor: TStringField
      FieldName = 'Valor'
      Size = 15
    end
  end
  object DataSource1: TDataSource
    DataSet = SetupMemData1
    Left = 512
    Top = 16
  end
end
