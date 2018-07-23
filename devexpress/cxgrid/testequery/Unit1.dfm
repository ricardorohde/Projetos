object Form1: TForm1
  Left = 245
  Top = 161
  Width = 979
  Height = 563
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 208
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object RadioGroup1: TRadioGroup
    Left = 0
    Top = 8
    Width = 185
    Height = 41
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Entrada'
      'Saida')
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 48
    Width = 945
    Height = 481
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button2: TButton
    Left = 352
    Top = 16
    Width = 75
    Height = 25
    Caption = 'editar'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 440
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 4
    OnClick = Button3Click
  end
  object AlterdataConnection1: TAlterdataConnection
    ProviderName = 'PostgreSQL'
    Database = 'FISCAL_EDSON'
    SpecificOptions.Strings = (
      'SQL Server.LockTimeout=-1'
      'SQL Server.OLEDBProvider=prNativeClient'
      'PostgreSQL.CharSet=Latin1'
      'PostgreSQL.ApplicationName=delphi32.exe')
    Macros = <
      item
        Name = 'NOLOCK'
        Value = '(NOLOCK)'
        Condition = 'SQLServer'
      end
      item
        Name = 'TRUE'
        Value = 'CAST(1 AS Bit)'
        Condition = 'SQLServer'
      end
      item
        Name = 'FALSE'
        Value = 'CAST(0 AS Bit)'
        Condition = 'SQLServer'
      end
      item
        Name = 'ISNUMERIC'
        Value = 'ISNUMERIC'
        Condition = 'SQLServer'
      end
      item
        Name = 'NEWID'
        Value = 'NewId()'
        Condition = 'SQLServer'
      end
      item
        Name = 'TOP_MACRO'
        Value = 'TOP'
        Condition = 'SQLServer'
      end
      item
        Name = 'TEMP'
        Value = '#'
        Condition = 'SQLServer'
      end
      item
        Name = 'CREATE_TEMP'
        Value = '#'
        Condition = 'SQLServer'
      end
      item
        Name = 'GLOBAL_TEMP'
        Value = '##'
        Condition = 'SQLServer'
      end
      item
        Name = 'CREATE_GLOBAL_TEMP'
        Value = '##'
        Condition = 'SQLServer'
      end
      item
        Name = 'REPLICATE'
        Value = 'REPLICATE'
        Condition = 'SQLServer'
      end
      item
        Name = 'Blob'
        Value = 'VARBINARY(MAX)'
        Condition = 'SQLServer'
      end
      item
        Name = 'Graphic'
        Value = 'VARBINARY(MAX)'
        Condition = 'SQLServer'
      end
      item
        Name = 'Memo'
        Value = 'VARCHAR(MAX)'
        Condition = 'SQLServer'
      end
      item
        Name = 'Boolean'
        Value = 'BIT'
        Condition = 'SQLServer'
      end
      item
        Name = 'DateTime'
        Value = 'DATETIME'
        Condition = 'SQLServer'
      end
      item
        Name = 'BCD'
        Value = 'DECIMAL'
        Condition = 'SQLServer'
      end
      item
        Name = 'LargeInt'
        Value = 'BIGINT'
        Condition = 'SQLServer'
      end
      item
        Name = 'AutoInc'
        Value = 'INT IDENTITY'
        Condition = 'SQLServer'
      end
      item
        Name = 'LARGE_AUTOINC'
        Value = 'BIGINT IDENTITY'
        Condition = 'SQLServer'
      end
      item
        Name = 'QUOTE'
        Value = '"'
      end
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
      end>
    Username = 'SUPERVISOR'
    Password = 'abc123!'
    Server = 'Lazaro2'
    Connected = True
    LoginPrompt = False
    Left = 488
    Top = 120
  end
  object SetupQuery1: TSetupQuery
    SpecificOptions.Strings = (
      'PostgreSQL.UnknownAsString=True'
      'PostgreSQL.UseParamTypes=True')
    Left = 536
    Top = 176
  end
  object DataSource1: TDataSource
    DataSet = SetupQuery1
    Left = 296
    Top = 16
  end
end
