object Form1: TForm1
  Left = 192
  Top = 107
  Width = 928
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object MaskEdit1: TMaskEdit
    Left = 152
    Top = 128
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'MaskEdit1'
  end
  object edtDate: TEdit
    Left = 136
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'edtDate'
    OnExit = edtDateExit
  end
end
