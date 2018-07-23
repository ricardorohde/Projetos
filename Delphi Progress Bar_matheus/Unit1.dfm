object Form1: TForm1
  Left = 223
  Top = 156
  Width = 491
  Height = 466
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
  object pb1: TProgressBar
    Left = 0
    Top = 411
    Width = 475
    Height = 17
    Align = alBottom
    TabOrder = 0
  end
  object btn1: TButton
    Left = 192
    Top = 120
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 1
    OnClick = btn1Click
  end
  object lst1: TListBox
    Left = 0
    Top = 0
    Width = 169
    Height = 411
    Align = alLeft
    ItemHeight = 13
    TabOrder = 2
  end
  object btn2: TButton
    Left = 256
    Top = 56
    Width = 75
    Height = 25
    Caption = 'btn2'
    TabOrder = 3
    OnClick = btn2Click
  end
  object edt1: TEdit
    Left = 200
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object lst2: TListBox
    Left = 184
    Top = 160
    Width = 153
    Height = 241
    ItemHeight = 13
    TabOrder = 5
  end
  object btn3: TButton
    Left = 376
    Top = 112
    Width = 75
    Height = 25
    Caption = 'btn3'
    TabOrder = 6
    OnClick = btn3Click
  end
  object tmr1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = tmr1Timer
    Left = 408
    Top = 16
  end
end
