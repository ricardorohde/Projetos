object frmPesquisa: TfrmPesquisa
  Left = 192
  Top = 124
  Width = 337
  Height = 355
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrd1: TDBGrid
    Left = 0
    Top = 0
    Width = 321
    Height = 276
    Align = alClient
    DataSource = dsPesquisa
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object pnl1: TPanel
    Left = 0
    Top = 276
    Width = 321
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btn1: TBitBtn
      Left = 232
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 0
      OnClick = btn1Click
      Kind = bkOK
    end
  end
  object dsPesquisa: TDataSource
    Left = 256
    Top = 136
  end
end
