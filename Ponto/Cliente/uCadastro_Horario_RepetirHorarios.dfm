object frmRepetirHorarios: TfrmRepetirHorarios
  Left = 256
  Top = 260
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Repetir Hor'#225'rios'
  ClientHeight = 128
  ClientWidth = 526
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 526
    Height = 33
    Align = alTop
    TabOrder = 0
    object chkSegunda: TCheckBox
      Tag = 2
      Left = 80
      Top = 8
      Width = 71
      Height = 17
      Caption = 'Segunda'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object chkTerca: TCheckBox
      Tag = 3
      Left = 155
      Top = 8
      Width = 72
      Height = 17
      Caption = 'Ter'#231'a'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object chkQuarta: TCheckBox
      Tag = 4
      Left = 227
      Top = 8
      Width = 64
      Height = 17
      Caption = 'Quarta'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object chkQuinta: TCheckBox
      Tag = 5
      Left = 295
      Top = 8
      Width = 68
      Height = 17
      Caption = 'Quinta'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object chkSabado: TCheckBox
      Tag = 7
      Left = 441
      Top = 7
      Width = 72
      Height = 17
      Caption = 'S'#225'bado'
      TabOrder = 6
    end
    object chkSexta: TCheckBox
      Tag = 6
      Left = 369
      Top = 7
      Width = 64
      Height = 17
      Caption = 'Sexta'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object chkDomingo: TCheckBox
      Tag = 1
      Left = 6
      Top = 8
      Width = 72
      Height = 17
      Caption = 'Domingo'
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 33
    Width = 526
    Height = 54
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 37
      Height = 13
      Caption = 'Entrada'
    end
    object Label2: TLabel
      Left = 88
      Top = 8
      Width = 78
      Height = 13
      Caption = 'Inicio do Almo'#231'o'
    end
    object Label3: TLabel
      Left = 172
      Top = 8
      Width = 69
      Height = 13
      Caption = 'Fim do Almo'#231'o'
    end
    object Label4: TLabel
      Left = 256
      Top = 8
      Width = 27
      Height = 13
      Caption = 'Saida'
    end
    object edtEntrada: TcxTimeEdit
      Left = 8
      Top = 24
      EditValue = 0d
      TabOrder = 0
      Width = 73
    end
    object edtInicioAlmoco: TcxTimeEdit
      Left = 88
      Top = 24
      EditValue = 0d
      TabOrder = 1
      Width = 73
    end
    object edtFimAlmoco: TcxTimeEdit
      Left = 172
      Top = 24
      EditValue = 0d
      TabOrder = 2
      Width = 73
    end
    object edtSaida: TcxTimeEdit
      Left = 256
      Top = 24
      EditValue = 0d
      TabOrder = 3
      Width = 73
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 87
    Width = 526
    Height = 41
    Align = alBottom
    TabOrder = 2
    object btnOk: TBitBtn
      Left = 344
      Top = 8
      Width = 83
      Height = 25
      Caption = '&Ok'
      TabOrder = 0
      OnClick = btnOkClick
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
    end
    object btnCancelar: TBitBtn
      Left = 433
      Top = 8
      Width = 86
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
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
    end
  end
  object cdsHORARIO_DETALHE: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_HORARIO'
        ParamType = ptInput
      end>
    ProviderName = 'dspHORARIO_DETALHE'
    RemoteServer = DM_Cadastro_Horario.DCOMCon_Horario
    Left = 341
    Top = 109
    object cdsHORARIO_DETALHEID_HORARIO_DETALHE: TIntegerField
      FieldName = 'ID_HORARIO_DETALHE'
    end
    object cdsHORARIO_DETALHEID_HORARIO: TIntegerField
      FieldName = 'ID_HORARIO'
    end
    object cdsHORARIO_DETALHEENTRADA: TTimeField
      FieldName = 'ENTRADA'
    end
    object cdsHORARIO_DETALHEALMOCO_INICIO: TTimeField
      FieldName = 'ALMOCO_INICIO'
    end
    object cdsHORARIO_DETALHEALMOCO_FIM: TTimeField
      FieldName = 'ALMOCO_FIM'
    end
    object cdsHORARIO_DETALHESAIDA: TTimeField
      FieldName = 'SAIDA'
    end
    object cdsHORARIO_DETALHEDIA_SEMANA: TIntegerField
      FieldName = 'DIA_SEMANA'
    end
    object cdsHORARIO_DETALHEHORAS_A_TRABALHAR: TTimeField
      FieldName = 'HORAS_A_TRABALHAR'
    end
  end
end
