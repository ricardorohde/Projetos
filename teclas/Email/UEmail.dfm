object Form1: TForm1
  Left = 192
  Top = 103
  Width = 303
  Height = 375
  Caption = 'Enviar E-Mail'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 15
    Width = 25
    Height = 13
    Caption = 'Para:'
  end
  object Label2: TLabel
    Left = 6
    Top = 39
    Width = 41
    Height = 13
    Caption = 'Assunto:'
  end
  object Label3: TLabel
    Left = 6
    Top = 62
    Width = 55
    Height = 13
    Caption = 'Mensagem:'
  end
  object Label4: TLabel
    Left = 8
    Top = 197
    Width = 38
    Height = 13
    Caption = 'Anexos:'
  end
  object EdtPara: TEdit
    Left = 54
    Top = 12
    Width = 233
    Height = 21
    TabOrder = 0
  end
  object EdtAssunto: TEdit
    Left = 54
    Top = 37
    Width = 233
    Height = 21
    TabOrder = 1
  end
  object MemMensagem: TMemo
    Left = 6
    Top = 78
    Width = 281
    Height = 89
    TabOrder = 2
  end
  object LbxAnexos: TListBox
    Left = 6
    Top = 213
    Width = 281
    Height = 97
    ItemHeight = 13
    TabOrder = 3
  end
  object ButAnexar: TBitBtn
    Left = 104
    Top = 187
    Width = 75
    Height = 25
    Caption = 'Anexar...'
    TabOrder = 4
    OnClick = ButAnexarClick
  end
  object ButEnviar: TBitBtn
    Left = 56
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Enviar'
    TabOrder = 5
    OnClick = ButEnviarClick
  end
  object ButFechar: TBitBtn
    Left = 139
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 6
    OnClick = ButFecharClick
  end
  object ODAnexos: TOpenDialog
    Left = 184
    Top = 184
  end
  object IdMessage: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meMIME
    Recipients = <>
    ReplyTo = <>
    Left = 48
    Top = 96
  end
  object IdSMTP: TIdSMTP
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 25
    AuthenticationType = atNone
    Left = 144
    Top = 96
  end
  object IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket
    SSLOptions.Method = sslvSSLv23
    SSLOptions.Mode = sslmClient
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 56
    Top = 8
  end
  object IdPOP31: TIdPOP3
    IOHandler = IdSSLIOHandlerSocket1
    MaxLineAction = maException
    ReadTimeout = 0
    Host = 'pop.gmail.com'
    Port = 995
    Left = 16
    Top = 8
  end
end
