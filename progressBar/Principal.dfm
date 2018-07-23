object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'frmPrincipal'
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
  object stsbarInfo: TStatusBar
    Left = 0
    Top = 280
    Width = 635
    Height = 19
    Panels = <>
    ExplicitLeft = 160
    ExplicitTop = 272
    ExplicitWidth = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 239
    Width = 635
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 328
    ExplicitTop = 120
    ExplicitWidth = 185
    object btnPesquisar: TButton
      Left = 544
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 0
      OnClick = btnPesquisarClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 635
    Height = 239
    Align = alClient
    DataSource = dtsTeste
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object cdsTeste: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 528
    Top = 112
    object cdsTesteID: TIntegerField
      FieldName = 'ID'
    end
    object cdsTesteNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
  end
  object dtsTeste: TDataSource
    DataSet = cdsTeste
    Left = 448
    Top = 104
  end
end
