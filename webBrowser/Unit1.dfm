object Form1: TForm1
  Left = 353
  Top = 252
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 524
  ClientWidth = 963
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object WebBrowser1: TWebBrowser
    Left = 0
    Top = 0
    Width = 963
    Height = 483
    Align = alClient
    TabOrder = 0
    ControlData = {
      4C00000087630000EB3100000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Panel1: TPanel
    Left = 0
    Top = 483
    Width = 963
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 856
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Ok'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object ArquivoJavascript: TStrHolder
    Capacity = 4
    Macros = <>
    Left = 8
    Top = 80
    InternalVer = 1
    StrData = (
      ''
      '')
  end
end
