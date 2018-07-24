object fmConfiguracao: TfmConfiguracao
  Left = 228
  Top = 204
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Configura'#231#245'es do Servidor'
  ClientHeight = 265
  ClientWidth = 238
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 238
    Height = 224
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 11
      Top = 16
      Width = 48
      Height = 13
      Caption = 'Servidor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 11
      Top = 56
      Width = 31
      Height = 13
      Caption = 'Porta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 11
      Top = 96
      Width = 44
      Height = 13
      Caption = 'Usu'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 11
      Top = 136
      Width = 37
      Height = 13
      Caption = 'Senha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 11
      Top = 176
      Width = 87
      Height = 13
      Caption = 'Base de Dados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtServidor: TEdit
      Left = 11
      Top = 30
      Width = 146
      Height = 21
      MaxLength = 20
      TabOrder = 0
    end
    object edtPorta: TEdit
      Left = 11
      Top = 70
      Width = 146
      Height = 21
      MaxLength = 4
      TabOrder = 1
      OnKeyPress = edtPortaKeyPress
    end
    object edtUsuario: TEdit
      Left = 11
      Top = 110
      Width = 146
      Height = 21
      MaxLength = 20
      TabOrder = 2
    end
    object edtSenha: TEdit
      Left = 11
      Top = 150
      Width = 146
      Height = 21
      MaxLength = 20
      PasswordChar = '*'
      TabOrder = 3
    end
    object edtDataBase: TEdit
      Left = 11
      Top = 190
      Width = 146
      Height = 21
      MaxLength = 50
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 224
    Width = 238
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnOk: TSpeedButton
      Left = 57
      Top = 6
      Width = 84
      Height = 31
      Caption = '&Ok'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF1AA41C1AA41CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF22B72B2DCE3D25BE2F21
        B529FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF20B42731D5482DD44123CD3525BD2E22B62AFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1EB42431D44A30D74A4ADE636DE48125
        CE3624BF2F21B529FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1CB41E
        33D44D35DA5356E06D51E1679BF1B079E78D22CE3524BD2E1AA51EFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF92DD9230D14A39DD5D5FE57838C54011B41322BC27A6
        F5B86CE38121CF3421B5291FAE26FFFFFFFFFFFFFFFFFFFFFFFF30C74141E169
        73E89145CA4E0D9D0BFFFFFF11A3102DC032AFF7C05BDF6F22CF3625BE30169A
        18FFFFFFFFFFFFFFFFFF2BC13580EB9E5BD36B0C9F0AFFFFFFFFFFFFFFFFFF0E
        A70D45C94EB3F8C546DA5C24D03820AD25159814FFFFFFFFFFFFFFFFFF79CA78
        79CA78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0CA10B53CE60B3F7C741DA5626D0
        391CA921159A14FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF0DA70C74DC82BFF9D144DC5A24CB3619A41C92DD92FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17B71F68DB79B8F8
        CB4ADF5F22C63318A11BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF1ABA2254D4649DEEAD4FE1671FB52BFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF16B8
        1E50D55F7EE6901CB627FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3BCF4C92DD92FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = btnOkClick
    end
    object btnCancelar: TSpeedButton
      Left = 148
      Top = 6
      Width = 84
      Height = 31
      Caption = '&Cancelar'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFF140EAE
        1711B8100BA1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF100B
        A11711B8140EAEFFFFFF1F1AB52522E92723F11F1BD1130EA6FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF130EA61F1BD12723F12522E91F1AB53D3AC84648F6
        2425F12A2BF32121D4140FADFFFFFFFFFFFFFFFFFFFFFFFF140FAD2121D42A2B
        F32425F14648F63D3AC8221CB66262E1444BF3262DEF2C33F22326D71812B3FF
        FFFFFFFFFF1812B32326D72C33F2262DEF474DF46262E1221CB6FFFFFF241DBB
        6566E34853F32934EF2F3BF2262BD91A13BA1A13BA262BD92F3BF22834EF4752
        F35F61DF241DBAFFFFFFFFFFFFFFFFFF2621C2656AE54756F32C3DF03041F12B
        36E42B36E43041F12D3DF04A59F35D5FE02119BFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF2721C66267E64356F23044F03448F23448F23044EF4255F26166E5221A
        C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2C23CC4551E9354DF136
        4CEF364CEF354DF04251EA2B23CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF1D14CE3240E63C54F23850F0384FF03B54F23445E91D15CEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F17D4313EE43E58F13953F045
        5EF2455FF23A53F03E57F0303AE31F15D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        2018D93542E7425FF33D59F1556EF3737FF2737EF2566EF33D59F1425EF3313A
        E41F16D9FFFFFFFFFFFFFFFFFF2018DE3744E94663F2405DF15C77F36E76EF30
        28DF2E25DF7078F05D77F4405DF14562F2333DE82117DDFFFFFF221BE23947EC
        4A69F34462F25F7AF3686EF0271FE2FFFFFFFFFFFF2C23E2717AF1607BF44362
        F24A69F33846EB2019E24144EC5372F44464F26481F46E76F2271EE6FFFFFFFF
        FFFFFFFFFFFFFFFF2D25E7747CF26480F44564F25270F33D41EB4441ED7B8FF5
        7A94F6737BF32D24EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D24EA737C
        F37A93F67A8FF64441EDFFFFFF4845F05A59F22D24EDFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF2D24ED5959F24844F0FFFFFF}
      OnClick = btnCancelarClick
    end
  end
  object ADOConnection1: TADOConnection
    Left = 184
    Top = 56
  end
end