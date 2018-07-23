object Form1: TForm1
  Left = 305
  Top = 163
  Width = 469
  Height = 432
  Caption = 'Criptografar e Descriptografar'
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
    Left = 134
    Top = 25
    Width = 178
    Height = 16
    Caption = 'Texto a ser Criptografado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 228
    Top = 109
    Width = 113
    Height = 13
    Caption = 'Texto Criptografado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 225
    Top = 197
    Width = 134
    Height = 13
    Caption = 'Texto Descriptografado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EdtString: TEdit
    Left = 138
    Top = 44
    Width = 169
    Height = 21
    TabOrder = 0
  end
  object BntCriptografar: TButton
    Left = 72
    Top = 113
    Width = 97
    Height = 41
    Caption = 'Criptografar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BntCriptografarClick
  end
  object BntDescriptografar: TButton
    Left = 72
    Top = 201
    Width = 97
    Height = 41
    Caption = 'Descriptografar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = BntDescriptografarClick
  end
  object EdtCriptografado: TEdit
    Left = 225
    Top = 127
    Width = 169
    Height = 21
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object EdtDescriptografado: TEdit
    Left = 225
    Top = 215
    Width = 169
    Height = 21
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object BntLimparCampo: TButton
    Left = 87
    Top = 304
    Width = 97
    Height = 41
    Caption = '&Limpar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = BntLimparCampoClick
  end
  object BntFechar: TButton
    Left = 246
    Top = 304
    Width = 97
    Height = 41
    Caption = '&Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = BntFecharClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 386
    Width = 461
    Height = 19
    Hint = 'Criptografar'
    AutoHint = True
    Panels = <>
    ParentShowHint = False
    ShowHint = True
    OnHint = BntCriptografarClick
  end
end
