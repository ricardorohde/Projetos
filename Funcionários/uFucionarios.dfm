object Form1: TForm1
  Left = 192
  Top = 125
  Width = 293
  Height = 124
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 8
    Top = 8
    Width = 201
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 216
    Top = 4
    Width = 45
    Height = 25
    Caption = '...'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 44
    Width = 277
    Height = 41
    Align = alBottom
    TabOrder = 2
    object btnExecute: TButton
      Left = 184
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Executar'
      TabOrder = 0
      OnClick = btnExecuteClick
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '.txt'
    Filter = 'Text files|*.txt'
    Top = 8
  end
end
