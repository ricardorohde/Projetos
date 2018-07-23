object Form1: TForm1
  Left = 0
  Top = 0
  Width = 543
  Height = 368
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxComboBox1: TcxComboBox
    Left = 200
    Top = 8
    Properties.Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10')
    Properties.ReadOnly = True
    TabOrder = 0
    Text = 'cxComboBox1'
    Width = 121
  end
  object chk1: TCheckBox
    Left = 8
    Top = 32
    Width = 97
    Height = 14
    Caption = 'ReadOnly'
    TabOrder = 1
    OnClick = chk1Click
  end
end
