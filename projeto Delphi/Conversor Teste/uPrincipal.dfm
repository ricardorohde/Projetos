object Form1: TForm1
  Left = 307
  Top = 262
  Width = 474
  Height = 91
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 458
    Height = 52
    Align = alClient
    TabOrder = 0
    object btnFechar: TBitBtn
      Left = 368
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Fechar'
      TabOrder = 0
      OnClick = btnFecharClick
      Kind = bkClose
    end
    object btn2: TBitBtn
      Left = 272
      Top = 16
      Width = 89
      Height = 25
      Caption = 'Concluir'
      TabOrder = 1
      OnClick = btn2Click
      Kind = bkOK
    end
  end
end
