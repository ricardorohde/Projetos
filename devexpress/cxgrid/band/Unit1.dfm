object Form1: TForm1
  Left = 259
  Top = 184
  Width = 827
  Height = 529
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 811
    Height = 449
    Align = alClient
    TabOrder = 0
    object cxGrid1DBBandedTableView1: TcxGridDBBandedTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Bands = <
        item
          Caption = 'Campos'
        end
        item
          Caption = 'Valores'
        end>
      object cxGrid1DBBandedTableView1Column1: TcxGridDBBandedColumn
        DataBinding.FieldName = 'CdNota'
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1Column2: TcxGridDBBandedColumn
        DataBinding.FieldName = 'DtEscrituracao'
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1Column3: TcxGridDBBandedColumn
        DataBinding.FieldName = 'IdCodFiscal'
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1Column4: TcxGridDBBandedColumn
        DataBinding.FieldName = 'NmNumero'
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1Column5: TcxGridDBBandedColumn
        DataBinding.FieldName = 'VlContabil'
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1Column6: TcxGridDBBandedColumn
        DataBinding.FieldName = 'VlICMSBase'
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1Column7: TcxGridDBBandedColumn
        DataBinding.FieldName = 'AliqICMS'
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBBandedTableView1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 449
    Width = 811
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 728
      Top = 8
      Width = 75
      Height = 25
      Caption = 'refresh'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 632
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Edit'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 440
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button3'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object SetupMemData1: TSetupMemData
    Indexes = <>
    SortOptions = []
    Left = 736
    Top = 72
    object SetupMemData1CdEmpresa: TIntegerField
      FieldName = 'CdEmpresa'
    end
    object SetupMemData1NmEmpresa: TStringField
      FieldName = 'NmEmpresa'
      Size = 50
    end
    object SetupMemData1VlIcms: TFloatField
      FieldName = 'VlIcms'
    end
  end
  object DataSource1: TDataSource
    DataSet = q
    Left = 704
    Top = 72
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    Grid = cxGrid1
    PopupMenus = <>
    Left = 768
    Top = 72
  end
  object AlterdataConnection1: TAlterdataConnection
    ProviderName = 'PostgreSQL'
    Database = 'FISCAL_ROGERIO'
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
    Username = 'postgres'
    Password = 'abc123!'
    Server = 'lazaro2'
    Connected = True
    LoginPrompt = False
    Left = 568
    Top = 224
  end
  object UniSQLMonitor1: TUniSQLMonitor
    Left = 112
    Top = 344
  end
  object q: TSetupQuery
    Connection = AlterdataConnection1
    DMLRefresh = True
    SpecificOptions.Strings = (
      'PostgreSQL.UnknownAsString=True'
      'PostgreSQL.UseParamTypes=True')
    OnCalcFields = qCalcFields
    Left = 352
    Top = 240
  end
end
