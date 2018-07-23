object Form1: TForm1
  Left = 192
  Top = 107
  Width = 979
  Height = 563
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 971
    Height = 536
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object PostgreSQLUniProvider1: TPostgreSQLUniProvider
    Left = 168
    Top = 24
  end
  object UniConnection1: TUniConnection
    ProviderName = 'PostgreSQL'
    Port = 5432
    Database = 'postgres'
    Username = 'postgres'
    Password = 'abc123!'
    Server = 'localhost'
    Connected = True
    Left = 48
    Top = 24
  end
  object UniQuery1: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'SELECT "cdadministradora_cartao"'
      #9#9',"cdoperador_inclusao"'
      #9#9',"dtinclusao"'
      #9#9',"cdoperador_alteracao"'
      #9#9',"dtalteracao"'
      #9'FROM "ems_01"."administradora_cartao"')
    Active = True
    Left = 48
    Top = 96
  end
  object DataSource1: TDataSource
    DataSet = UniQuery1
    Left = 152
    Top = 104
  end
end
