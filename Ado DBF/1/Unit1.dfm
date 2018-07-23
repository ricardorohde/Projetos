object Form1: TForm1
  Left = 184
  Top = 186
  Width = 928
  Height = 480
  Caption = 'Form1'
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 920
    Height = 453
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object db_source: TADOConnection
    ConnectOptions = coAsyncConnect
    LoginPrompt = False
    Left = 140
    Top = 63
  end
  object ADOQuery1: TADOQuery
    Connection = db_source
    Parameters = <>
    SQL.Strings = (
      'SELECT * '
      'FROM Conexao')
    Left = 209
    Top = 90
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 277
    Top = 121
  end
end
