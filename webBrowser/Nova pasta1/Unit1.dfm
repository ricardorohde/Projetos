object Form1: TForm1
  Left = 192
  Top = 151
  Width = 979
  Height = 563
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 298
    Width = 963
    Height = 186
    Align = alBottom
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object WebBrowser1: TWebBrowser
    Left = 0
    Top = 0
    Width = 963
    Height = 298
    Align = alClient
    TabOrder = 1
    ControlData = {
      4C00000087630000CD1E00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Panel1: TPanel
    Left = 0
    Top = 484
    Width = 963
    Height = 41
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 2
    object Button1: TButton
      Left = 440
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
