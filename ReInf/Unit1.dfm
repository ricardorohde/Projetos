object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnIncluir: TButton
    Left = 168
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Incluir'
    TabOrder = 0
    OnClick = btnIncluirClick
  end
  object btnExcluir: TButton
    Left = 249
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 1
    OnClick = btnExcluirClick
  end
  object btnNfse: TButton
    Left = 160
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Nfse'
    TabOrder = 2
    OnClick = btnNfseClick
  end
  object GerarArquivo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 360
    Top = 120
  end
end
