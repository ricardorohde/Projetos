object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 80
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 72
    Top = 8
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object Button2: TButton
    Left = 182
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 2
    OnClick = Button2Click
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 424
    Top = 104
  end
  object RESTClient1: TRESTClient
    Authenticator = SimpleAuthenticator1
    Params = <>
    HandleRedirects = True
    Left = 544
    Top = 104
  end
  object SimpleAuthenticator1: TSimpleAuthenticator
    Left = 536
    Top = 48
  end
  object RESTResponse1: TRESTResponse
    Left = 552
    Top = 176
  end
  object XMLDocument1: TXMLDocument
    Left = 424
    Top = 176
  end
end
