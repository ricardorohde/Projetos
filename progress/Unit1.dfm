object Form1: TForm1
  Left = 201
  Top = 136
  Width = 928
  Height = 480
  Caption = 'Form1'
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
    Left = 104
    Top = 136
    Width = 49
    Height = 13
    Caption = 'Aguarde...'
  end
  object ProgressBar1: TProgressBar
    Left = 104
    Top = 72
    Width = 201
    Height = 16
    TabOrder = 0
  end
  object Button1: TButton
    Left = 184
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Terminar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 104
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Iniciar'
    TabOrder = 2
    OnClick = Button2Click
  end
end
