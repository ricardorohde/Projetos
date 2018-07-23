object frmProgress: TfrmProgress
  Left = 192
  Top = 124
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 105
  ClientWidth = 451
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 105
    Align = alClient
    TabOrder = 0
    object lbl3: TLabel
      Left = 1
      Top = 1
      Width = 449
      Height = 13
      Align = alTop
    end
    object lbl1: TLabel
      Left = 1
      Top = 75
      Width = 449
      Height = 29
      Align = alBottom
      Alignment = taCenter
      Caption = 'Carregando...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 1
      Top = 14
      Width = 449
      Height = 19
      Align = alTop
      Alignment = taCenter
      Caption = 'Carregando...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ProgressBar: TProgressBar
      Left = 9
      Top = 43
      Width = 433
      Height = 17
      TabOrder = 0
    end
  end
end
