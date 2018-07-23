object Form1: TForm1
  Left = 207
  Top = 137
  Width = 180
  Height = 400
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 39
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label2: TLabel
    Left = 8
    Top = 81
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object Label3: TLabel
    Left = 8
    Top = 123
    Width = 40
    Height = 13
    Caption = 'Servidor'
  end
  object Label4: TLabel
    Left = 8
    Top = 166
    Width = 71
    Height = 13
    Caption = 'Base de Dados'
  end
  object Label5: TLabel
    Left = 8
    Top = 206
    Width = 41
    Height = 13
    Caption = 'Empresa'
  end
  object Label6: TLabel
    Left = 8
    Top = 1
    Width = 61
    Height = 13
    Caption = 'Tipo de Base'
  end
  object lblDtEntSai: TLabel
    Left = 8
    Top = 245
    Width = 53
    Height = 13
    Caption = 'Data Inicial'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Label7: TLabel
    Left = 8
    Top = 282
    Width = 48
    Height = 13
    Caption = 'Data Final'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object edtNome: TEdit
    Left = 8
    Top = 55
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'SUPERVISOR'
  end
  object edtSenha: TEdit
    Left = 8
    Top = 97
    Width = 121
    Height = 21
    MaxLength = 10
    PasswordChar = '*'
    TabOrder = 2
    Text = 'abc123!'
  end
  object edtServidor: TEdit
    Left = 8
    Top = 139
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'LAZARO2'
  end
  object edtBase: TEdit
    Left = 8
    Top = 182
    Width = 113
    Height = 21
    TabOrder = 4
    Text = 'FISCAL_EDSON'
  end
  object Panel1: TPanel
    Left = 0
    Top = 328
    Width = 164
    Height = 33
    Align = alBottom
    TabOrder = 5
    object BitBtn1: TBitBtn
      Left = 4
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Ok'
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 84
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = BitBtn2Click
      Kind = bkCancel
    end
  end
  object edtCdEmpresa: TEdit
    Left = 8
    Top = 222
    Width = 113
    Height = 21
    TabOrder = 6
  end
  object cboTipo: TComboBox
    Left = 8
    Top = 17
    Width = 121
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    MaxLength = 10
    TabOrder = 0
    Text = 'PostgreSQL'
    Items.Strings = (
      'PostgreSQL'
      'SQL Server')
  end
  object edtDataIni: TMaskEdit
    Left = 8
    Top = 259
    Width = 65
    Height = 21
    Hint = 'Informe a data inicial para impress'#227'o dos livros.'
    AutoSize = False
    EditMask = '99/99/9999;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 7
    Text = '  /  /    '
  end
  object edtDataFim: TMaskEdit
    Left = 8
    Top = 296
    Width = 65
    Height = 21
    Hint = 'Informe a data inicial para impress'#227'o dos livros.'
    AutoSize = False
    EditMask = '99/99/9999;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 8
    Text = '  /  /    '
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
    Top = 32
  end
  object UniSQLMonitor1: TUniSQLMonitor
    Left = 96
    Top = 32
  end
  object SetupQuery1: TSetupQuery
    SpecificOptions.Strings = (
      'PostgreSQL.UnknownAsString=True'
      'PostgreSQL.UseParamTypes=True')
    Left = 128
    Top = 32
  end
end
