object Form1: TForm1
  Left = 192
  Top = 125
  Width = 979
  Height = 543
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 463
    Width = 963
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 448
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 560
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 963
    Height = 463
    Align = alClient
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnMouseMove = cxGrid1DBTableView1MouseMove
      NavigatorButtons.ConfirmDelete = False
      OnCellClick = cxGrid1DBTableView1CellClick
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid1DBTableView1Idcodigo: TcxGridDBColumn
        DataBinding.FieldName = 'Idcodigo'
      end
      object cxGrid1DBTableView1Column1: TcxGridDBColumn
        DataBinding.FieldName = 'selecionar'
        PropertiesClassName = 'TcxHyperLinkEditProperties'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 963
    Height = 463
    Align = alClient
    DataSource = DataSource2
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object AlterdataConnection1: TAlterdataConnection
    ProviderName = 'PostgreSQL'
    Database = '0006731963'
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
    Server = 'nt09'
    Connected = True
    LoginPrompt = False
    Left = 16
  end
  object SetupQuery1: TSetupQuery
    SpecificOptions.Strings = (
      'PostgreSQL.UnknownAsString=True'
      'PostgreSQL.UseParamTypes=True')
    Left = 8
    Top = 40
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SetupQuery1
    Left = 24
    Top = 72
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 168
    object ClientDataSet1Idcodigo: TIntegerField
      FieldName = 'Idcodigo'
    end
    object ClientDataSet1selecionar: TStringField
      FieldName = 'selecionar'
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 56
    Top = 128
  end
  object tblTempProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 313
    object tblTempProdutosCdEmpresa: TIntegerField
      FieldName = 'CdEmpresa'
    end
    object tblTempProdutosCdCodigo: TIntegerField
      FieldName = 'CdCodigo'
    end
    object tblTempProdutosCodEspecifico: TStringField
      FieldName = 'CodEspecifico'
      Size = 14
    end
    object tblTempProdutosCdClassificacao: TStringField
      FieldName = 'CdClassificacao'
    end
    object tblTempProdutosnmDescricao: TStringField
      FieldName = 'nmDescricao'
      Size = 53
    end
    object tblTempProdutosIncideMP540: TBooleanField
      FieldName = 'IncideMP540'
    end
    object tblTempProdutosDsIncideMP540: TStringField
      FieldName = 'DsIncideMP540'
      Size = 53
    end
    object tblTempProdutosAgrupamentoNCM: TStringField
      FieldName = 'AgrupamentoNCM'
    end
    object tblTempProdutosCodigo_atividade_id: TSmallintField
      FieldName = 'Codigo_atividade_id'
    end
    object tblTempProdutosAtualizar: TBooleanField
      FieldName = 'Atualizar'
    end
  end
  object PvdProdutos: TDataSetProvider
    DataSet = SetupQuery1
    Left = 164
    Top = 316
  end
  object DataSource2: TDataSource
    DataSet = tblTempProdutos
    Left = 208
    Top = 248
  end
end
