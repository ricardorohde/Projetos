object Form2: TForm2
  Left = 395
  Top = 228
  Width = 438
  Height = 332
  Caption = 'Edi'#231#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    422
    294)
  PixelsPerInch = 96
  TextHeight = 13
  object btnSalvar: TButton
    Left = 327
    Top = 44
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 0
  end
  object btnVoltar: TButton
    Left = 327
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Voltar'
    TabOrder = 1
    OnClick = btnVoltarClick
  end
  object mmo: TMemo
    Left = 4
    Top = 3
    Width = 313
    Height = 286
    Anchors = [akLeft, akTop, akBottom]
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object btnCarregar: TButton
    Left = 328
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Carregar'
    TabOrder = 3
    OnClick = btnCarregarClick
  end
end
