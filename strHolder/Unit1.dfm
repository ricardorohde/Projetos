object Form1: TForm1
  Left = 538
  Top = 180
  Width = 979
  Height = 563
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBEdit1: TDBEdit
    Left = 192
    Top = 64
    Width = 121
    Height = 21
    DataField = 'pis_lancamento_automatico_id'
    DataSource = DataSource1
    MaxLength = 5
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 328
    Top = 24
    Width = 320
    Height = 473
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object edtCdContabil: TDBEdit
    Left = 195
    Top = 161
    Width = 102
    Height = 21
    Hint = 'Informe o c'#243'digo de lan'#231'amento autom'#225'tico do valor cont'#225'bil'
    DataField = 'pis_lancamento_automatico_id'
    DataSource = DataSource1
    MaxLength = 5
    TabOrder = 2
  end
  object AlterdataConnection1: TAlterdataConnection
    ProviderName = 'PostgreSQL'
    Database = 'FISCAL_EDSON'
    SpecificOptions.Strings = (
      'SQL Server.LockTimeout=-1'
      'PostgreSQL.CharSet=Latin1'
      'PostgreSQL.ApplicationName=delphi32.exe')
    Macros = <
      item
        Name = 'TRUE'
        Value = 'True'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'FALSE'
        Value = 'False'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'ISNUMERIC'
        Value = 'ISNUMERIC'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'NEWID'
        Value = 'NewId()'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'LIMIT_MACRO'
        Value = 'LIMIT'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'TEMP'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'CREATE_TEMP'
        Value = 'TEMPORARY '
        Condition = 'PostgreSQL'
      end
      item
        Name = 'GLOBAL_TEMP'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'CREATE_GLOBAL_TEMP'
        Value = 'GLOBAL TEMPORARY '
        Condition = 'PostgreSQL'
      end
      item
        Name = 'REPLICATE'
        Value = 'REPEAT'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'Blob'
        Value = 'BYTEA'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'Graphic'
        Value = 'BYTEA'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'DateTime'
        Value = 'TIMESTAMP'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'BCD'
        Value = 'DECIMAL'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'Memo'
        Value = 'TEXT'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'LargeInt'
        Value = 'BIGINT'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'Boolean'
        Value = 'BOOLEAN'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'AutoInc'
        Value = 'SERIAL'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'LARGE_AUTOINC'
        Value = 'BIGSERIAL'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'DOUBLE'
        Value = 'DOUBLE PRECISION'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'Float'
        Value = 'DOUBLE PRECISION'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'Currency'
        Value = 'DOUBLE PRECISION'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'QUOTE'
        Value = '"'
      end>
    Username = 'SUPERVISOR'
    Password = 'abc123!'
    Server = 'LAZARO2'
    Connected = True
    LoginPrompt = False
    Left = 64
    Top = 64
  end
  object SetupTable1: TSetupTable
    LockMode = lmNone
    SpecificOptions.Strings = (
      'PostgreSQL.UnknownAsString=True')
    Copyright = 'Alterdata Software'
    ShowStatus = True
    Version = '6.11'
    AutoCreate = True
    Left = 128
    Top = 64
    object SetupTable1CdVlContabil: TIntegerField
      DefaultExpression = '00000'
      DisplayLabel = 'C'#243'd. Valor Cont'#225'bil'
      FieldName = 'pis_lancamento_automatico_id'
      DisplayFormat = '00000'
    end
    object SetupTable1cofins_lancamento_automatico_id: TIntegerField
      FieldName = 'cofins_lancamento_automatico_id'
      DisplayFormat = '00000'
    end
  end
  object DataSource1: TDataSource
    DataSet = SetupTable1
    Left = 136
    Top = 160
  end
  object StrHolder: TStrHolder
    Capacity = 4
    Macros = <
      item
        Name = 'Table'
      end>
    Left = 76
    Top = 159
    InternalVer = 1
    StrData = (
      ''
      '53454c45435420'
      '7069735f6c616e63616d656e746f5f6175746f6d617469636f5f69642c'
      '636f66696e735f6c616e63616d656e746f5f6175746f6d617469636f5f6964'
      '46524f4d205746495343414c2e20255461626c65')
  end
  object UniSQLMonitor1: TUniSQLMonitor
    Left = 248
    Top = 120
  end
end
