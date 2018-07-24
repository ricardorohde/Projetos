object Form1: TForm1
  Left = 314
  Top = 205
  Width = 279
  Height = 141
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
    Left = 8
    Top = 8
    Width = 41
    Height = 13
    Caption = 'Caminho'
  end
  object edtCaminho: TEdit
    Left = 8
    Top = 24
    Width = 217
    Height = 21
    TabOrder = 0
    Text = 'C:\sistemas\folha\Fontes\folha.dpr'
  end
  object btnLimpar: TButton
    Left = 8
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Limpar'
    TabOrder = 1
    OnClick = btnLimparClick
  end
  object btnAdicionar: TButton
    Left = 96
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 2
    OnClick = btnAdicionarClick
  end
end
