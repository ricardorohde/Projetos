object Form1: TForm1
  Left = 192
  Top = 107
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 240
    Top = 24
    Width = 32
    Height = 13
    Caption = 'Master'
  end
  object Label2: TLabel
    Left = 240
    Top = 176
    Width = 37
    Height = 13
    Caption = 'Detalhe'
  end
  object DBGrid1: TDBGrid
    Left = 240
    Top = 40
    Width = 320
    Height = 120
    DataSource = dtsMaster
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 240
    Top = 192
    Width = 320
    Height = 120
    DataSource = dtsDetalhe
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 336
    Top = 8
    Width = 240
    Height = 25
    DataSource = dtsMaster
    TabOrder = 2
  end
  object cdsMaster: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 104
    Top = 24
    object cdsMasterID: TAutoIncField
      FieldName = 'ID'
    end
    object cdsMasterNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
  end
  object cdsDetalhe: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_MASTER'
    MasterFields = 'ID'
    MasterSource = dtsMaster
    PacketRecords = 0
    Params = <>
    Left = 144
    Top = 24
    object cdsDetalheID: TAutoIncField
      FieldName = 'ID'
    end
    object cdsDetalheID_MASTER: TIntegerField
      FieldName = 'ID_MASTER'
    end
    object cdsDetalhedescricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
  end
  object dtsMaster: TDataSource
    DataSet = cdsMaster
    Left = 192
    Top = 24
  end
  object dtsDetalhe: TDataSource
    DataSet = cdsDetalhe
    Left = 192
    Top = 64
  end
end
