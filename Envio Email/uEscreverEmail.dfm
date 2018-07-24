object frmEscreverEmail: TfrmEscreverEmail
  Left = 0
  Top = 0
  Caption = 'Escrever'
  ClientHeight = 536
  ClientWidth = 593
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object TPanel
    Left = 0
    Top = 0
    Width = 593
    Height = 59
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 603
    object Label1: TLabel
      Left = 9
      Top = 8
      Width = 26
      Height = 13
      Caption = 'Para:'
    end
    object Label2: TLabel
      Left = 9
      Top = 35
      Width = 43
      Height = 18
      Caption = 'Assunto:'
    end
    object edtPara: TEdit
      Left = 72
      Top = 5
      Width = 393
      Height = 21
      TabOrder = 0
    end
    object edtAssunto: TEdit
      Left = 72
      Top = 32
      Width = 393
      Height = 21
      TabOrder = 1
    end
    object btnEnviar: TButton
      Left = 496
      Top = 18
      Width = 75
      Height = 25
      Caption = 'Enviar'
      TabOrder = 2
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 59
    Width = 593
    Height = 477
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 80
    ExplicitTop = 136
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Gauge1: TGauge
      Left = 5
      Top = 50
      Width = 583
      Height = 2
      Progress = 0
    end
  end
  object IdSMTP1: TIdSMTP
    SASLMechanisms = <>
    Left = 544
    Top = 64
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 544
    Top = 120
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 544
    Top = 176
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 544
    Top = 232
  end
end
