object frmConfiguracao: TfrmConfiguracao
  Left = 339
  Top = 273
  BorderStyle = bsSingle
  Caption = 'Configura'#231#245'es'
  ClientHeight = 192
  ClientWidth = 210
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 210
    Height = 151
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 40
      Height = 13
      Caption = 'Servidor'
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 107
      Height = 13
      Caption = 'Porta de Comunica'#231#227'o'
    end
    object edtServidor: TEdit
      Left = 16
      Top = 24
      Width = 169
      Height = 21
      TabOrder = 0
    end
    object chkSom: TCheckBox
      Left = 16
      Top = 120
      Width = 97
      Height = 17
      Caption = 'Habilitar Som'
      TabOrder = 1
    end
    object edtPorta: TEdit
      Left = 16
      Top = 72
      Width = 169
      Height = 21
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 151
    Width = 210
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnGravar: TButton
      Left = 120
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Gravar'
      TabOrder = 0
      OnClick = btnGravarClick
    end
  end
end
