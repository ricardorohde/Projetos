object fmCriaSQL: TfmCriaSQL
  Left = 220
  Top = 157
  Width = 529
  Height = 310
  Caption = 'Gera'#231#227'o de SQL'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 14
    Top = 6
    Width = 41
    Height = 13
    Caption = 'TABELA'
  end
  object Label2: TLabel
    Left = 14
    Top = 42
    Width = 30
    Height = 13
    Caption = 'ALIAS'
  end
  object edNoTabela: TEdit
    Left = 12
    Top = 20
    Width = 237
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object edAlias: TEdit
    Left = 12
    Top = 56
    Width = 237
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object mmSQL: TMemo
    Left = 10
    Top = 84
    Width = 499
    Height = 159
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object btExecutar: TButton
    Left = 264
    Top = 18
    Width = 75
    Height = 25
    Caption = '&Executar'
    Default = True
    TabOrder = 3
    OnClick = btExecutarClick
  end
  object btOK: TButton
    Left = 178
    Top = 252
    Width = 75
    Height = 25
    Caption = '&OK'
    TabOrder = 4
    OnClick = btOKClick
  end
  object btCancelar: TButton
    Left = 260
    Top = 252
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancelar'
    TabOrder = 5
    OnClick = btCancelarClick
  end
  object ckAs: TCheckBox
    Left = 268
    Top = 60
    Width = 97
    Height = 17
    Caption = '"AS"'
    Checked = True
    State = cbChecked
    TabOrder = 6
  end
  object qySQL: TADOQuery
    Connection = conexao
    Parameters = <>
    Left = 384
    Top = 16
  end
  object conexao: TADOConnection
    LoginPrompt = False
    Left = 432
    Top = 16
  end
end
