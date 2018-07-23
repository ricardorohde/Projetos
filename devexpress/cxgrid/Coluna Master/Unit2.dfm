object Form2: TForm2
  Left = 192
  Top = 107
  BorderStyle = bsSingle
  Caption = 'Vis'#227'o'
  ClientHeight = 114
  ClientWidth = 128
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RadioGroup1: TRadioGroup
    Left = 0
    Top = 0
    Width = 128
    Height = 73
    Align = alClient
    Caption = 'Vis'#227'o'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      '1'
      '2'
      '3'
      '4')
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 73
    Width = 128
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 40
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
