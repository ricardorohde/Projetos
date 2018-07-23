object fmSelecionar: TfmSelecionar
  Left = 177
  Top = 249
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Selecionar Arquivo Conex'#227'o'
  ClientHeight = 142
  ClientWidth = 346
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBottom: TJvGradientHeaderPanel
    Left = 0
    Top = 110
    Width = 346
    Height = 32
    GradientStartColor = clSilver
    GradientEndColor = 6579300
    GradientStyle = grVertical
    LabelCaption = ' '
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clSilver
    LabelFont.Height = -11
    LabelFont.Name = 'MS Sans Serif'
    LabelFont.Style = []
    LabelAlignment = taRightJustify
    Align = alBottom
    DoubleBuffered = False
    TabOrder = 0
    object btnOK: TJvXPButton
      Left = 241
      Top = 2
      Width = 100
      Height = 28
      Caption = 'OK'
      TabOrder = 0
      Glyph.Data = {
        07544269746D617036030000424D360300000000000036000000280000001000
        0000100000000100180000000000000300000000000000000000000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1AA41C1AA41CFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF22B7
        2B2DCE3D25BE2F21B529FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF20B42731D5482DD44123CD3525BD2E22B62AFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1EB42431D44A30D7
        4A4ADE636DE48125CE3624BF2F21B529FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF1CB41E33D44D35DA5356E06D51E1679BF1B079E78D22CE3524BD2E
        1AA51EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF92DD9230D14A39DD5D5FE57838C5
        4011B41322BC27A6F5B86CE38121CF3421B5291FAE26FFFFFFFFFFFFFFFFFFFF
        FFFF30C74141E16973E89145CA4E0D9D0BFFFFFF11A3102DC032AFF7C05BDF6F
        22CF3625BE30169A18FFFFFFFFFFFFFFFFFF2BC13580EB9E5BD36B0C9F0AFFFF
        FFFFFFFFFFFFFF0EA70D45C94EB3F8C546DA5C24D03820AD25159814FFFFFFFF
        FFFFFFFFFF79CA7879CA78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0CA10B53CE60
        B3F7C741DA5626D0391CA921159A14FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF0DA70C74DC82BFF9D144DC5A24CB3619A41C92
        DD92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        17B71F68DB79B8F8CB4ADF5F22C63318A11BFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1ABA2254D4649DEEAD4FE1671F
        B52BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF16B81E50D55F7EE6901CB627FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3BCF4C92DD92FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF}
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnOKClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 346
    Height = 110
    Align = alClient
    TabOrder = 1
    object rgConexao: TRadioGroup
      Left = 8
      Top = 3
      Width = 175
      Height = 44
      Caption = 'Novo arquivo de conex'#227'o '
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'N'#227'o'
        'Sim')
      ParentFont = False
      TabOrder = 0
      OnClick = rgConexaoClick
    end
    object pc: TcxPageControl
      Left = 8
      Top = 51
      Width = 333
      Height = 59
      ActivePage = tbNao
      TabOrder = 1
      ClientRectBottom = 59
      ClientRectRight = 333
      ClientRectTop = 0
      object tbNao: TcxTabSheet
        Caption = 'N'#227'o'
        ImageIndex = 0
        TabVisible = False
        object Label1: TLabel
          Left = 2
          Top = 5
          Width = 184
          Height = 13
          Caption = 'Selecione o arquivo de conex'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtArquivo: TEdit
          Left = 2
          Top = 21
          Width = 290
          Height = 21
          TabOrder = 0
        end
        object btnSearch: TJvXPButton
          Left = 294
          Top = 21
          Width = 34
          TabOrder = 1
          Glyph.Data = {
            07544269746D617036030000424D360300000000000036000000280000001000
            0000100000000100180000000000000300000000000000000000000000000000
            0000E1C8C3163B7B4D66A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3A629D70D4FF148AFD335293FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF4788CCA1F1FFCFFFFF1791F63866AEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3678C77EE2FFE0FFFF2BA1
            F6326FBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF3280D265D9FFE9FFFF4BB3F7368BEAFFFFFFFFFFFFFAF9F9
            EEE9E9F4F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF368CDE58D5
            FFBCFBFF118BF0C4B7BC9E7A78A1807CAB8B7FA37C72815F61DDD5D6FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF2F9AEE19A5FFC7B8BCAB746EFAFAF6FFFFFF
            FFFFF3FFFFEBFFF8D298695CBBACAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFC7CBD6C98A7DFDFFFFFFFFFFFDFAECFAF2E1F6F0D3F8E8CBFFFFD9996959E5
            DFE0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2B7B5F5EFE8FFFFFFFEFCF5FCF9EE
            FBF2DFF9F3D7EDD5B7F4DCBCF5D5AE9D7D7CFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFB89A9DFFFFFCFDFAF2FCF9EFFBF4E5FDF8E9FAF3DDF5E5C9ECD4B6FFE4BC98
            6D66FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9B3B2FFFFE9FBF4E5FAF5E2FDF7E9
            FCF4E2F4E3C9F1D9BFEFDDC0FFE1B9A67B72FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFC8B4B3FFFEDAFAF2DBFAF3D9FBF5E0F4E3C6FEFDFBFFFFFBF5EBCFFDD5ABA0
            746EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0BFC6EEDABBFCEFCEF2DEC0F6EAD0
            F3E1C6FDFDEDFAF8E3F7E8C8E8B892BDA2A3FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFCFBFCC9AEAAF6D8B3F1D9B7E8CCACF4E2C6F4E9CAF7E3C3F3CC9FB98677E5
            DEE1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F0F2CBB1A7E7C49FEDC498
            EEC59AEBBD90E1AF84BF8F79CDBFC7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFF8F7F8E0D5D7CEB4A8CBB1AAC5A69DCFBABAE8E2E5FFFFFFFF
            FFFF}
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnSearchClick
        end
      end
      object tbSim: TcxTabSheet
        Caption = 'Sim'
        ImageIndex = 1
        TabVisible = False
        object Label2: TLabel
          Left = 2
          Top = 5
          Width = 314
          Height = 13
          Caption = 'Selecione o diret'#243'rio para gravar o arquivo de conex'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtDirectory: TJvDirectoryEdit
          Left = 3
          Top = 21
          Width = 320
          Height = 21
          DialogKind = dkWin32
          TabOrder = 0
          Text = 'edtDirectory'
        end
      end
    end
  end
  object OpenDialog: TOpenDialog
    Left = 276
    Top = 8
  end
end
