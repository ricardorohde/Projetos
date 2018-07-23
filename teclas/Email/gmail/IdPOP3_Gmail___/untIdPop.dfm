object Form1: TForm1
  Left = 192
  Top = 124
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Conectar ao POP3 do Gmail'
  ClientHeight = 143
  ClientWidth = 288
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
  object Label1: TLabel
    Left = 10
    Top = 35
    Width = 40
    Height = 13
    Caption = 'Usu'#225'rio:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 69
    Width = 34
    Height = 13
    Caption = 'Senha:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnConectar: TBitBtn
    Left = 80
    Top = 104
    Width = 137
    Height = 25
    Caption = 'Conectar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnConectarClick
  end
  object edtUsuario: TEdit
    Left = 56
    Top = 32
    Width = 217
    Height = 21
    CharCase = ecLowerCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 40
    ParentFont = False
    TabOrder = 0
  end
  object edtSenha: TEdit
    Left = 56
    Top = 64
    Width = 217
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 30
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
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
  object IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket
    SSLOptions.Method = sslvSSLv23
    SSLOptions.Mode = sslmClient
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 56
    Top = 8
  end
  object IdSMTP: TIdSMTP
    IOHandler = IdSSLIOHandlerSocket1
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 465
    AuthenticationType = atNone
    Left = 144
    Top = 96
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
end
