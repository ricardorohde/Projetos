object DSSMCustoms: TDSSMCustoms
  OldCreateOrder = False
  OnCreate = DSServerModuleCreate
  OnDestroy = DSServerModuleDestroy
  Height = 2670
  Width = 1548
  object SQLConnection1: TSQLConnection
    ConnectionName = 'IBConnection'
    DriverName = 'Firebird'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbxfb.dll'
    LoginPrompt = False
    Params.Strings = (
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'DriverUnit=DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver150.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=15.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver150.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=15.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'VendorLib=fbclient.DLL'
      'Database=C:\TechTRS\Sistema Impacto\Data\EVOLUCAO.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet='
      'Trim Char=False')
    TableScope = []
    VendorLib = 'fbclient.DLL'
    Left = 56
    Top = 16
  end
  object sqlMetas_Vendas_Dados_Santana: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select * from METAS_VENDAS_DADOS_SANTANA where EMPRESA = :EMPRES' +
      'A and FILIAL = :FILIAL'#13#10'order by EMPRESA, FILIAL, CODIGO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 72
    Top = 83
    object sqlMetas_Vendas_Dados_SantanaEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlMetas_Vendas_Dados_SantanaFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlMetas_Vendas_Dados_SantanaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlMetas_Vendas_Dados_SantanaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 40
    end
    object sqlMetas_Vendas_Dados_SantanaPERIODODE: TDateField
      FieldName = 'PERIODODE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlMetas_Vendas_Dados_SantanaPERIODOATE: TDateField
      FieldName = 'PERIODOATE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlMetas_Vendas_Dados_SantanaMETA: TFloatField
      FieldName = 'META'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlMetas_Vendas_Dados_SantanaDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlMetas_Vendas_Dados_SantanaTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object dspMetas_Vendas_Dados_Santana: TDataSetProvider
    DataSet = sqlMetas_Vendas_Dados_Santana
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspMetas_Vendas_Dados_SantanaBeforeUpdateRecord
    Left = 76
    Top = 127
  end
  object sqlMetas_Vendas_Itens_Santana: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select * from METAS_VENDAS_ITENS_SANTANA where EMPRESA = :EMPRES' +
      'A and FILIAL = :FILIAL and CODIGO = :CODIGO'#13#10'order by EMPRESA, F' +
      'ILIAL, CODIGO, VENDEDOR'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsMetas_Vendas_Dados_Santana
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 248
    Top = 131
    object sqlMetas_Vendas_Itens_SantanaEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlMetas_Vendas_Itens_SantanaFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlMetas_Vendas_Itens_SantanaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlMetas_Vendas_Itens_SantanaVENDEDOR: TIntegerField
      FieldName = 'VENDEDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlMetas_Vendas_Itens_SantanaMETA: TFloatField
      FieldName = 'META'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlMetas_Vendas_Itens_SantanaPERCENTUAL: TStringField
      FieldName = 'PERCENTUAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 6
    end
    object sqlMetas_Vendas_Itens_SantanaDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dtsMetas_Vendas_Dados_Santana: TDataSource
    DataSet = sqlMetas_Vendas_Dados_Santana
    Left = 248
    Top = 83
  end
  object sqlCampanhas_Dados_Santana: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select * from CAMPANHAS_DADOS_SANTANA where EMPRESA = :EMPRESA a' +
      'nd FILIAL = :FILIAL'#13#10'order by EMPRESA, FILIAL, CODIGO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 76
    Top = 216
    object sqlCampanhas_Dados_SantanaEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlCampanhas_Dados_SantanaFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlCampanhas_Dados_SantanaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlCampanhas_Dados_SantanaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 40
    end
    object sqlCampanhas_Dados_SantanaINICIO: TDateField
      FieldName = 'INICIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlCampanhas_Dados_SantanaFINAL: TDateField
      FieldName = 'FINAL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlCampanhas_Dados_SantanaDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dspCampanhas_Dados_Santana: TDataSetProvider
    DataSet = sqlCampanhas_Dados_Santana
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspCampanhas_Dados_SantanaBeforeUpdateRecord
    Left = 80
    Top = 268
  end
  object dtsCampanhas_Dados_Santana: TDataSource
    DataSet = sqlCampanhas_Dados_Santana
    Left = 236
    Top = 216
  end
  object sqlCotacoes_Vendas: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select * from COTACOES_VENDAS where EMPRESA = :EMPRESA and FILIA' +
      'L = :FILIAL order by EMPRESA, FILIAL, NUMERO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    Left = 432
    Top = 83
    object sqlCotacoes_VendasEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlCotacoes_VendasFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlCotacoes_VendasSITUACAO: TStringField
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlCotacoes_VendasNUMERO: TIntegerField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlCotacoes_VendasEMISSAO: TDateField
      FieldName = 'EMISSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlCotacoes_VendasHORA: TStringField
      FieldName = 'HORA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 4
    end
    object sqlCotacoes_VendasCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlCotacoes_VendasFORMARECEBIMENTO: TStringField
      FieldName = 'FORMARECEBIMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlCotacoes_VendasTIPO: TStringField
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCotacoes_VendasNUMEROORCAMENTO: TIntegerField
      FieldName = 'NUMEROORCAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacoes_VendasDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dspCotacoes_Vendas: TDataSetProvider
    DataSet = sqlCotacoes_Vendas
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspCotacoes_VendasBeforeUpdateRecord
    Left = 432
    Top = 135
  end
  object sqlLista_Faltas: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select * from LISTA_FALTAS where EMPRESA = :EMPRESA and FILIAL =' +
      ' :FILIAL order by EMPRESA, FILIAL, ORIGEM, DATA, DOCUMENTO,  PRO' +
      'DUTO, LOCAL, COMPONENTE'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    Left = 756
    Top = 218
    object sqlLista_FaltasEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlLista_FaltasFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlLista_FaltasORIGEM: TStringField
      DisplayLabel = 'Origem'
      FieldName = 'ORIGEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object sqlLista_FaltasSITUACAO: TStringField
      DefaultExpression = #39'0'#39
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 1
    end
    object sqlLista_FaltasDATA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object sqlLista_FaltasDOCUMENTO: TIntegerField
      DefaultExpression = '0'
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlLista_FaltasPRODUTO: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Produto'
      FieldName = 'PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object sqlLista_FaltasLOCAL: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Local'
      FieldName = 'LOCAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlLista_FaltasDPRODUTO: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'DPRODUTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
    object sqlLista_FaltasCOMPONENTE: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Componente'
      FieldName = 'COMPONENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 15
    end
    object sqlLista_FaltasDCOMPONENTE: TStringField
      DisplayLabel = 'Descri'#231#227'o do Componente'
      FieldName = 'DCOMPONENTE'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object sqlLista_FaltasPROPRIETARIO: TIntegerField
      DisplayLabel = 'Propriet'#225'rio'
      FieldName = 'PROPRIETARIO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlLista_FaltasQUANTIDADE: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object sqlLista_FaltasSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlLista_FaltasOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 80
    end
    object sqlLista_FaltasVENDEDOR: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'VENDEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlLista_FaltasUSUARIO: TIntegerField
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlLista_FaltasDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data de Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
  end
  object dspLista_Faltas: TDataSetProvider
    DataSet = sqlLista_Faltas
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 756
    Top = 270
  end
  object sqlImportacoes_Santana: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT * FROM IMPORTACOES_SANTANA '#13#10'WHERE EMPRESA = :EMPRESA AND' +
      ' FILIAL = :FILIAL'#13#10'ORDER BY EMPRESA, FILIAL, NUMERO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 72
    Top = 363
    object sqlImportacoes_SantanaEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlImportacoes_SantanaFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlImportacoes_SantanaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlImportacoes_SantanaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlImportacoes_SantanaPROCESSO: TStringField
      FieldName = 'PROCESSO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object sqlImportacoes_SantanaBL: TStringField
      FieldName = 'BL'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object sqlImportacoes_SantanaDATACADASTRO: TDateField
      FieldName = 'DATACADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlImportacoes_SantanaDATAEMBARQUE: TDateField
      FieldName = 'DATAEMBARQUE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlImportacoes_SantanaDATACHEGADA: TDateField
      FieldName = 'DATACHEGADA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlImportacoes_SantanaNOMENAVIO: TStringField
      FieldName = 'NOMENAVIO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object sqlImportacoes_SantanaTIPOFRETE: TStringField
      FieldName = 'TIPOFRETE'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlImportacoes_SantanaAGENTECARGA: TStringField
      FieldName = 'AGENTECARGA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlImportacoes_SantanaPORTOORIGEM: TStringField
      FieldName = 'PORTOORIGEM'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object sqlImportacoes_SantanaOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 360
    end
    object sqlImportacoes_SantanaDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlImportacoes_SantanaVALORFRETE: TFloatField
      FieldName = 'VALORFRETE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlImportacoes_SantanaTIPOCONTAINER: TStringField
      FieldName = 'TIPOCONTAINER'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlImportacoes_SantanaBLAPROVADO: TStringField
      FieldName = 'BLAPROVADO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlImportacoes_SantanaBLARQUIVO: TStringField
      FieldName = 'BLARQUIVO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlImportacoes_SantanaARQUIVONUMERARIO: TStringField
      FieldName = 'ARQUIVONUMERARIO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
  end
  object dspImportacoes_Santana: TDataSetProvider
    DataSet = sqlImportacoes_Santana
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspImportacoes_SantanaBeforeUpdateRecord
    Left = 72
    Top = 411
  end
  object dtsImportacoes_Historicos: TDataSource
    DataSet = sqlImportacoes_Santana
    Left = 203
    Top = 363
  end
  object sqlImportacoes_Historicos: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT * FROM IMPORTACOES_HISTORICOS_SANTANA '#13#10'WHERE EMPRESA = :' +
      'EMPRESA and FILIAL = :FILIAL and NUMERO = :NUMERO'#13#10'ORDER BY EMPR' +
      'ESA, FILIAL, NUMERO, ITEM'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsImportacoes_Historicos
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 203
    Top = 411
    object sqlImportacoes_HistoricosEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlImportacoes_HistoricosFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlImportacoes_HistoricosNUMERO: TIntegerField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlImportacoes_HistoricosITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlImportacoes_HistoricosDATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlImportacoes_HistoricosHISTORICO: TStringField
      FieldName = 'HISTORICO'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object sqlImportacoes_HistoricosUSUARIO: TStringField
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object sqlImportacoes_HistoricosDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dtsImportacoes_Fornecedor: TDataSource
    DataSet = sqlImportacoes_Santana
    Left = 341
    Top = 363
  end
  object sqlImportacoes_Fornecedor: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT * FROM IMPORTACOES_FORNECEDOR_SANTANA '#13#10'WHERE EMPRESA = :' +
      'EMPRESA AND FILIAL = :FILIAL AND NUMERO = :NUMERO'#13#10'ORDER BY EMPR' +
      'ESA, FILIAL, NUMERO, FORNECEDOR'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsImportacoes_Fornecedor
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 341
    Top = 411
    object sqlImportacoes_FornecedorEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlImportacoes_FornecedorFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlImportacoes_FornecedorNUMERO: TIntegerField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlImportacoes_FornecedorFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlImportacoes_FornecedorINVOICE: TStringField
      FieldName = 'INVOICE'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object sqlImportacoes_FornecedorVALOR: TFloatField
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlImportacoes_FornecedorPESO: TFloatField
      FieldName = 'PESO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlImportacoes_FornecedorCUBAGEM: TFloatField
      FieldName = 'CUBAGEM'
      ProviderFlags = [pfInUpdate]
    end
    object sqlImportacoes_FornecedorTIPOFRETE: TStringField
      FieldName = 'TIPOFRETE'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlImportacoes_FornecedorARQUIVOINVOICE: TStringField
      FieldName = 'ARQUIVOINVOICE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlImportacoes_FornecedorARQUIVOPACKINLIST: TStringField
      FieldName = 'ARQUIVOPACKINLIST'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlImportacoes_FornecedorARQUIVONCM: TStringField
      FieldName = 'ARQUIVONCM'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlImportacoes_FornecedorARQUIVOBL: TStringField
      FieldName = 'ARQUIVOBL'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlImportacoes_FornecedorRECINVOICE: TStringField
      FieldName = 'RECINVOICE'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlImportacoes_FornecedorRECPACK: TStringField
      FieldName = 'RECPACK'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlImportacoes_FornecedorRECNCM: TStringField
      FieldName = 'RECNCM'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlImportacoes_FornecedorRECORIGINAL: TStringField
      FieldName = 'RECORIGINAL'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlImportacoes_FornecedorDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlImportacoes_FornecedorPEDIDOCOMPRA1: TIntegerField
      FieldName = 'PEDIDOCOMPRA1'
      ProviderFlags = [pfInUpdate]
    end
    object sqlImportacoes_FornecedorPEDIDOCOMPRA2: TIntegerField
      FieldName = 'PEDIDOCOMPRA2'
      ProviderFlags = [pfInUpdate]
    end
    object sqlImportacoes_FornecedorPEDIDOCOMPRA3: TIntegerField
      FieldName = 'PEDIDOCOMPRA3'
      ProviderFlags = [pfInUpdate]
    end
    object sqlImportacoes_FornecedorPEDIDOCOMPRA4: TIntegerField
      FieldName = 'PEDIDOCOMPRA4'
      ProviderFlags = [pfInUpdate]
    end
    object sqlImportacoes_FornecedorPEDIDOCOMPRA5: TIntegerField
      FieldName = 'PEDIDOCOMPRA5'
      ProviderFlags = [pfInUpdate]
    end
    object sqlImportacoes_FornecedorPEDIDOCOMPRA6: TIntegerField
      FieldName = 'PEDIDOCOMPRA6'
      ProviderFlags = [pfInUpdate]
    end
    object sqlImportacoes_FornecedorSALDO: TFloatField
      FieldName = 'SALDO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlImportacoes_FornecedorGERADOFINANCEIRO: TStringField
      DisplayLabel = 'Gerado Financeiro?'
      FieldName = 'GERADOFINANCEIRO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object sqlImportacoes_Forn_Hist: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT * FROM IMPORTACOES_FORNECEDORES_HIST'#13#10'WHERE EMPRESA = :EM' +
      'PRESA AND FILIAL = :FILIAL AND NUMERO = :NUMERO AND FORNECEDOR =' +
      ' :FORNECEDOR'#13#10'ORDER BY EMPRESA, FILIAL, NUMERO, FORNECEDOR, ITEM'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsImportacoes_Forn_Hist
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FORNECEDOR'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 476
    Top = 411
    object sqlImportacoes_Forn_HistEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlImportacoes_Forn_HistFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlImportacoes_Forn_HistNUMERO: TIntegerField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlImportacoes_Forn_HistFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlImportacoes_Forn_HistITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlImportacoes_Forn_HistDATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlImportacoes_Forn_HistHISTORICO: TStringField
      FieldName = 'HISTORICO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 300
    end
    object sqlImportacoes_Forn_HistUSUARIO: TStringField
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 15
    end
    object sqlImportacoes_Forn_HistDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dtsImportacoes_Forn_Hist: TDataSource
    DataSet = sqlImportacoes_Fornecedor
    Left = 476
    Top = 363
  end
  object sqlPre_Compra_Dados: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select * from PRECOMPRA_DADOS_SANTANA'#13#10'where EMPRESA = :EMPRESA ' +
      'AND FILIAL = :FILIAL'#13#10'order by EMPRESA, FILIAL, NUMERO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    Left = 597
    Top = 80
    object sqlPre_Compra_DadosEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlPre_Compra_DadosFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlPre_Compra_DadosNUMERO: TIntegerField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlPre_Compra_DadosSITUACAO: TStringField
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlPre_Compra_DadosEMISSAO: TDateField
      FieldName = 'EMISSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlPre_Compra_DadosFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlPre_Compra_DadosOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object sqlPre_Compra_DadosDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlPre_Compra_DadosVALORMARITIMO: TFloatField
      FieldName = 'VALORMARITIMO'
    end
    object sqlPre_Compra_DadosVALORAEREO: TFloatField
      FieldName = 'VALORAEREO'
    end
    object sqlPre_Compra_DadosUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object sqlPre_Compra_DadosVALORTOTAL: TFloatField
      FieldName = 'VALORTOTAL'
    end
    object sqlPre_Compra_DadosVALORMARITIMODOLAR: TFloatField
      FieldName = 'VALORMARITIMODOLAR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlPre_Compra_DadosVALORAEREODOLAR: TFloatField
      FieldName = 'VALORAEREODOLAR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlPre_Compra_DadosVALORTOTALDOLAR: TFloatField
      FieldName = 'VALORTOTALDOLAR'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspPre_Compra_Dados: TDataSetProvider
    DataSet = sqlPre_Compra_Dados
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspPre_Compra_DadosBeforeUpdateRecord
    Left = 597
    Top = 136
  end
  object dtsPre_Compra_Dados: TDataSource
    DataSet = sqlPre_Compra_Dados
    Left = 717
    Top = 80
  end
  object sqlPre_Compra_Itens: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select * from PRECOMPRA_ITENS_SANTANA where EMPRESA = :EMPRESA A' +
      'ND FILIAL = :FILIAL AND NUMERO = :NUMERO'#13#10'order by EMPRESA, FILI' +
      'AL, NUMERO, ITEM'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsPre_Compra_Dados
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 717
    Top = 136
    object sqlPre_Compra_ItensEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlPre_Compra_ItensFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlPre_Compra_ItensNUMERO: TIntegerField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlPre_Compra_ItensITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlPre_Compra_ItensPRODUTO: TStringField
      FieldName = 'PRODUTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 15
    end
    object sqlPre_Compra_ItensDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 80
    end
    object sqlPre_Compra_ItensQUANTIDADEAEREO: TFloatField
      FieldName = 'QUANTIDADEAEREO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlPre_Compra_ItensQUANTIDADEMARITIMO: TFloatField
      FieldName = 'QUANTIDADEMARITIMO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlPre_Compra_ItensUNITARIO: TFloatField
      FieldName = 'UNITARIO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlPre_Compra_ItensUNITARIOMOEDA: TFloatField
      FieldName = 'UNITARIOMOEDA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlPre_Compra_ItensTARGET: TFloatField
      FieldName = 'TARGET'
      ProviderFlags = [pfInUpdate]
    end
    object sqlPre_Compra_ItensTOTAL: TFloatField
      FieldName = 'TOTAL'
      ProviderFlags = [pfInUpdate]
    end
    object sqlPre_Compra_ItensTOTALDOLAR: TFloatField
      FieldName = 'TOTALDOLAR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlPre_Compra_ItensMARCA: TStringField
      FieldName = 'MARCA'
      Size = 50
    end
    object sqlPre_Compra_ItensMULTIPLO: TFloatField
      FieldName = 'MULTIPLO'
    end
    object sqlPre_Compra_ItensEMBALAGEM: TStringField
      FieldName = 'EMBALAGEM'
      Size = 2
    end
    object sqlPre_Compra_ItensDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlPre_Compra_ItensUSUARIO: TIntegerField
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlPre_Compra_ItensOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
  end
  object sqlProdutos_Informacoes: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'select * from PRODUTOS_INFORMACOES where EMPRESA = :EMPRESA and ' +
      'FILIAL = :FILIAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    Left = 1081
    Top = 661
    object sqlProdutos_InformacoesEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlProdutos_InformacoesFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlProdutos_InformacoesPRODUTO: TStringField
      FieldName = 'PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object sqlProdutos_InformacoesMENSAGEM: TStringField
      FieldName = 'MENSAGEM'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 500
    end
    object sqlProdutos_InformacoesDATACADASTRO: TDateField
      FieldName = 'DATACADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlProdutos_InformacoesUSUARIO: TIntegerField
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlProdutos_InformacoesDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlProdutos_InformacoesSITUACAO: TStringField
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
  end
  object dspProdutos_Informacoes: TDataSetProvider
    DataSet = sqlProdutos_Informacoes
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 1081
    Top = 713
  end
  object sqlCategorias_Grupos: TSQLDataSet
    GetMetadata = False
    CommandText = 'SELECT * FROM CATEGORIAS_GRUPOS'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    Left = 258
    Top = 503
    object sqlCategorias_GruposEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlCategorias_GruposFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlCategorias_GruposCODIGO: TStringField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 15
    end
    object sqlCategorias_GruposDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object sqlCategorias_GruposTIPONAT: TStringField
      FieldName = 'TIPONAT'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlCategorias_GruposDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspCategorias_Grupos: TDataSetProvider
    DataSet = sqlCategorias_Grupos
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 258
    Top = 555
  end
  object sqlCotacao_Rapida_Dados: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT * FROM COTACAO_RAPIDA_DADOS WHERE EMPRESA = :EMPRESA AND ' +
      'FILIAL = :FILIAL'#13#10'ORDER BY EMPRESA, FILIAL, NUMERO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 705
    Top = 360
    object cdsCotacao_RapidaEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object cdsCotacao_RapidaFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object cdsCotacao_RapidaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsCotacao_RapidaSTATUS: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsCotacao_RapidaDATACADASTRO: TDateField
      FieldName = 'DATACADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCotacao_RapidaCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_DadosTRANSPORTADORA: TIntegerField
      FieldName = 'TRANSPORTADORA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_DadosCONDICAOPAGAMENTO: TIntegerField
      FieldName = 'CONDICAOPAGAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_DadosFORMAPAGAMENTO: TStringField
      FieldName = 'FORMAPAGAMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlCotacao_Rapida_DadosVENDEDOR: TIntegerField
      FieldName = 'VENDEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_DadosNOMEVENDEDOR: TStringField
      FieldName = 'NOMEVENDEDOR'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object sqlCotacao_Rapida_DadosTIPOPRECO: TStringField
      FieldName = 'TIPOPRECO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlCotacao_Rapida_DadosDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data da Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dspCotacao_Rapida_Dados: TDataSetProvider
    DataSet = sqlCotacao_Rapida_Dados
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspCotacao_Rapida_DadosBeforeUpdateRecord
    Left = 705
    Top = 414
  end
  object dtsCotacao_Rapida_Itens: TDataSource
    DataSet = sqlCotacao_Rapida_Dados
    Left = 842
    Top = 360
  end
  object sqlCotacao_Rapida_Itens: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT * FROM COTACAO_RAPIDA_ITENS WHERE EMPRESA = :EMPRESA AND ' +
      'FILIAL = :FILIAL AND NUMERO = :NUMERO'#13#10'ORDER BY EMPRESA, FILIAL,' +
      ' NUMERO, ITEM'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsCotacao_Rapida_Itens
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 841
    Top = 414
    object sqlCotacao_Rapida_ItensEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlCotacao_Rapida_ItensFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlCotacao_Rapida_ItensNUMERO: TIntegerField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlCotacao_Rapida_ItensITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlCotacao_Rapida_ItensPRODUTO: TStringField
      FieldName = 'PRODUTO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object sqlCotacao_Rapida_ItensDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object sqlCotacao_Rapida_ItensQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensTARGET: TFloatField
      FieldName = 'TARGET'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensUNITARIO: TFloatField
      FieldName = 'UNITARIO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensLOCAL: TStringField
      FieldName = 'LOCAL'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlCotacao_Rapida_ItensREGRA: TIntegerField
      FieldName = 'REGRA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensCLASSIFICACAOFISCAL: TStringField
      FieldName = 'CLASSIFICACAOFISCAL'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlCotacao_Rapida_ItensCODIGOFISCAL: TStringField
      FieldName = 'CODIGOFISCAL'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object sqlCotacao_Rapida_ItensMARGEMLUCRO: TFloatField
      FieldName = 'MARGEMLUCRO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensIPI: TFloatField
      FieldName = 'IPI'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensBASEIPI: TFloatField
      FieldName = 'BASEIPI'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensVALORIPI: TFloatField
      FieldName = 'VALORIPI'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensCSTIPI: TStringField
      FieldName = 'CSTIPI'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlCotacao_Rapida_ItensICMS: TFloatField
      FieldName = 'ICMS'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensBASEICMS: TFloatField
      FieldName = 'BASEICMS'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensVALORICMS: TFloatField
      FieldName = 'VALORICMS'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensORIGEMST: TStringField
      FieldName = 'ORIGEMST'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCotacao_Rapida_ItensCSTICMS: TStringField
      FieldName = 'CSTICMS'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlCotacao_Rapida_ItensBASEICMSST: TFloatField
      FieldName = 'BASEICMSST'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensVALORICMSST: TFloatField
      FieldName = 'VALORICMSST'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensISS: TFloatField
      FieldName = 'ISS'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensBASEISSA: TFloatField
      FieldName = 'BASEISSA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensVALORISSA: TFloatField
      FieldName = 'VALORISSA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensBASEISSR: TFloatField
      FieldName = 'BASEISSR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensVALORISSR: TFloatField
      FieldName = 'VALORISSR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensPISA: TFloatField
      FieldName = 'PISA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensBASEPISA: TFloatField
      FieldName = 'BASEPISA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensVALORPISA: TFloatField
      FieldName = 'VALORPISA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensPISR: TFloatField
      FieldName = 'PISR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensBASEPISR: TFloatField
      FieldName = 'BASEPISR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensVALORPISR: TFloatField
      FieldName = 'VALORPISR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensCOFINSA: TFloatField
      FieldName = 'COFINSA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensBASECOFINSA: TFloatField
      FieldName = 'BASECOFINSA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensVALORCOFINSA: TFloatField
      FieldName = 'VALORCOFINSA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensCOFINSR: TFloatField
      FieldName = 'COFINSR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensBASECOFINSR: TFloatField
      FieldName = 'BASECOFINSR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensVALORCOFINSR: TFloatField
      FieldName = 'VALORCOFINSR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensTIPOPRECO: TStringField
      FieldName = 'TIPOPRECO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlCotacao_Rapida_ItensCSLLR: TFloatField
      FieldName = 'CSLLR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensBASECSLLR: TFloatField
      FieldName = 'BASECSLLR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensVALORCSLLR: TFloatField
      FieldName = 'VALORCSLLR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensIRRF: TFloatField
      FieldName = 'IRRF'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensBASEIRRFA: TFloatField
      FieldName = 'BASEIRRFA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensVALORIRRFA: TFloatField
      FieldName = 'VALORIRRFA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensBASEIRRFR: TFloatField
      FieldName = 'BASEIRRFR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensVALORIRRFR: TFloatField
      FieldName = 'VALORIRRFR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensINSS: TFloatField
      FieldName = 'INSS'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensBASEINSSA: TFloatField
      FieldName = 'BASEINSSA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensVALORINSSA: TFloatField
      FieldName = 'VALORINSSA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensBASEINSSR: TFloatField
      FieldName = 'BASEINSSR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensVALORINSSR: TFloatField
      FieldName = 'VALORINSSR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCotacao_Rapida_ItensDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data da Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object sqlReclamacoes_Dados_Santana: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT * FROM RECLAMACOES_DADOS_SANTANA WHERE EMPRESA = :EMPRESA' +
      ' and FILIAL = :FILIAL order by EMPRESA, FILIAL, PROTOCOLO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 905
    Top = 83
    object sqlReclamacoes_Dados_SantanaEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlReclamacoes_Dados_SantanaFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlReclamacoes_Dados_SantanaPROTOCOLO: TIntegerField
      FieldName = 'PROTOCOLO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlReclamacoes_Dados_SantanaSTATUSPRINCIPAL: TStringField
      FieldName = 'STATUSPRINCIPAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlReclamacoes_Dados_SantanaSTATUSSECUNDARIO: TStringField
      FieldName = 'STATUSSECUNDARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlReclamacoes_Dados_SantanaDATAHORA: TSQLTimeStampField
      FieldName = 'DATAHORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlReclamacoes_Dados_SantanaCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlReclamacoes_Dados_SantanaNOMECLIENTE: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOMECLIENTE'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object sqlReclamacoes_Dados_SantanaUSUARIO: TIntegerField
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlReclamacoes_Dados_SantanaCANALCONTATO: TStringField
      FieldName = 'CANALCONTATO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlReclamacoes_Dados_SantanaMOTIVO: TStringField
      FieldName = 'MOTIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object sqlReclamacoes_Dados_SantanaRECLAMACAO: TStringField
      FieldName = 'RECLAMACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1200
    end
    object sqlReclamacoes_Dados_SantanaLIMITESOLUCAO: TSQLTimeStampField
      FieldName = 'LIMITESOLUCAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlReclamacoes_Dados_SantanaDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlReclamacoes_Dados_SantanaDATAHORASOLUCAO: TSQLTimeStampField
      FieldName = 'DATAHORASOLUCAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlReclamacoes_Dados_SantanaSETOR: TIntegerField
      FieldName = 'SETOR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlReclamacoes_Dados_SantanaPEDIDO: TIntegerField
      FieldName = 'PEDIDO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlReclamacoes_Dados_SantanaPROCEDE: TStringField
      FieldName = 'PROCEDE'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object dspReclamacoes_Dados_Santana: TDataSetProvider
    DataSet = sqlReclamacoes_Dados_Santana
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspReclamacoes_Dados_SantanaBeforeUpdateRecord
    Left = 905
    Top = 135
  end
  object dtsReclamacoes_Dados_Santana: TDataSource
    DataSet = sqlReclamacoes_Dados_Santana
    Left = 1072
    Top = 83
  end
  object sqlReclamacoes_Itens_Santana: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select * from RECLAMACOES_ITENS_SANTANA where EMPRESA = :EMPRESA' +
      ' AND FILIAL = :FILIAL AND PROTOCOLO = :PROTOCOLO ORDER BY EMPRES' +
      'A, FILIAL, PROTOCOLO, ITEM'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsReclamacoes_Dados_Santana
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PROTOCOLO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1072
    Top = 139
    object sqlReclamacoes_Itens_SantanaEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlReclamacoes_Itens_SantanaFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlReclamacoes_Itens_SantanaPROTOCOLO: TIntegerField
      FieldName = 'PROTOCOLO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlReclamacoes_Itens_SantanaITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlReclamacoes_Itens_SantanaCOMENTARIO: TStringField
      FieldName = 'COMENTARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 600
    end
    object sqlReclamacoes_Itens_SantanaSETOR: TStringField
      FieldName = 'SETOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object sqlReclamacoes_Itens_SantanaDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlReclamacoes_Itens_SantanaUSUARIO: TIntegerField
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlReclamacoes_Itens_SantanaEMAILDESTINO: TStringField
      FieldName = 'EMAILDESTINO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
  end
  object sqlControle_Embalagens_Dados: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT * FROM PRODUTOS_EMBALAGENS WHERE EMPRESA = :EMPRESA AND F' +
      'ILIAL = :FILIAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 2
      end>
    SQLConnection = SQLConnection1
    Left = 1128
    Top = 214
    object sqlControle_Embalagens_DadosEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlControle_Embalagens_DadosFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlControle_Embalagens_DadosSITUACAO: TStringField
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlControle_Embalagens_DadosDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 40
    end
    object sqlControle_Embalagens_DadosMODELO: TStringField
      FieldName = 'MODELO'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object sqlControle_Embalagens_DadosDATAPEDIDO: TDateField
      FieldName = 'DATAPEDIDO'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/0000;1;_'
    end
    object sqlControle_Embalagens_DadosSOLICITACAO: TDateField
      FieldName = 'SOLICITACAO'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/0000;1;_'
    end
    object sqlControle_Embalagens_DadosPRODUTO: TStringField
      FieldName = 'PRODUTO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object sqlControle_Embalagens_DadosCODIGOBARRAS: TStringField
      FieldName = 'CODIGOBARRAS'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object sqlControle_Embalagens_DadosADICIONAIS: TMemoField
      FieldName = 'ADICIONAIS'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object sqlControle_Embalagens_DadosESPECIFICACOES: TMemoField
      FieldName = 'ESPECIFICACOES'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object sqlControle_Embalagens_DadosRESPONSAVELCONFERENCIA: TStringField
      FieldName = 'RESPONSAVELCONFERENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object sqlControle_Embalagens_DadosENTREGACONFERENCIA: TDateField
      FieldName = 'ENTREGACONFERENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlControle_Embalagens_DadosMULTIPLO: TFloatField
      FieldName = 'MULTIPLO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlControle_Embalagens_DadosUNIDADEMEDIDA: TStringField
      FieldName = 'UNIDADEMEDIDA'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlControle_Embalagens_DadosARQUIVODIECUT: TStringField
      FieldName = 'ARQUIVODIECUT'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlControle_Embalagens_DadosDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlControle_Embalagens_DadosIMAGEM: TStringField
      FieldName = 'IMAGEM'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlControle_Embalagens_DadosPDFCONFERENCIA: TStringField
      FieldName = 'PDFCONFERENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlControle_Embalagens_DadosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object sqlControle_Embalagens_DadosREDUZIDO: TStringField
      FieldName = 'REDUZIDO'
      ProviderFlags = [pfInUpdate]
      Size = 90
    end
    object sqlControle_Embalagens_DadosPEDIDOCOMPRA: TIntegerField
      FieldName = 'PEDIDOCOMPRA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlControle_Embalagens_DadosDATACADASTRO: TDateField
      FieldName = 'DATACADASTRO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspControle_Embalagens_Dados: TDataSetProvider
    DataSet = sqlControle_Embalagens_Dados
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 1127
    Top = 268
  end
  object dtsControle_Embalagens_Dados: TDataSource
    DataSet = sqlControle_Embalagens_Dados
    Left = 1291
    Top = 214
  end
  object sqlControle_Embalagens_Revisoes: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT * FROM PRODUTOS_EMBALAGENS_REVISOES WHERE EMPRESA = :EMPR' +
      'ESA AND FILIAL = :FILIAL AND DOCUMENTO = :DOCUMENTO'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsControle_Embalagens_Dados
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Precision = 2
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'DOCUMENTO'
        ParamType = ptInput
        Size = 40
      end>
    SQLConnection = SQLConnection1
    Left = 1289
    Top = 268
    object sqlControle_Embalagens_RevisoesEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlControle_Embalagens_RevisoesFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlControle_Embalagens_RevisoesDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 40
    end
    object sqlControle_Embalagens_RevisoesREVISAO: TIntegerField
      FieldName = 'REVISAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlControle_Embalagens_RevisoesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 240
    end
    object sqlControle_Embalagens_RevisoesUSUARIO: TStringField
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlControle_Embalagens_RevisoesDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dtsReclamacoes_Correcoes_Santana: TDataSource
    DataSet = sqlReclamacoes_Dados_Santana
    Left = 1247
    Top = 83
  end
  object sqlReclamacoes_Cor_Santana: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select * from RECLAMACOES_CORRECOES_SANTANA where EMPRESA = :EMP' +
      'RESA AND FILIAL = :FILIAL AND PROTOCOLO = :PROTOCOLO ORDER BY EM' +
      'PRESA, FILIAL, PROTOCOLO, NUMERO'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsReclamacoes_Correcoes_Santana
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PROTOCOLO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1247
    Top = 139
    object sqlReclamacoes_Cor_SantanaEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlReclamacoes_Cor_SantanaFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlReclamacoes_Cor_SantanaPROTOCOLO: TIntegerField
      FieldName = 'PROTOCOLO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlReclamacoes_Cor_SantanaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlReclamacoes_Cor_SantanaSTATUS: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlReclamacoes_Cor_SantanaCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlReclamacoes_Cor_SantanaNOMECLIENTE: TStringField
      FieldName = 'NOMECLIENTE'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object sqlReclamacoes_Cor_SantanaDATACADASTRO: TSQLTimeStampField
      FieldName = 'DATACADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlReclamacoes_Cor_SantanaPRODUTO: TStringField
      FieldName = 'PRODUTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 15
    end
    object sqlReclamacoes_Cor_SantanaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object sqlReclamacoes_Cor_SantanaITEM1: TStringField
      FieldName = 'ITEM1'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlReclamacoes_Cor_SantanaITEM2: TStringField
      FieldName = 'ITEM2'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlReclamacoes_Cor_SantanaITEM3: TStringField
      FieldName = 'ITEM3'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlReclamacoes_Cor_SantanaITEM4: TStringField
      FieldName = 'ITEM4'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlReclamacoes_Cor_SantanaITEM5: TStringField
      FieldName = 'ITEM5'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlReclamacoes_Cor_SantanaITEM6: TStringField
      FieldName = 'ITEM6'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlReclamacoes_Cor_SantanaITEM7: TStringField
      FieldName = 'ITEM7'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlReclamacoes_Cor_SantanaITEM8: TStringField
      FieldName = 'ITEM8'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlReclamacoes_Cor_SantanaITEM9: TStringField
      FieldName = 'ITEM9'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlReclamacoes_Cor_SantanaITEM10: TStringField
      FieldName = 'ITEM10'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlReclamacoes_Cor_SantanaDETALHE: TStringField
      FieldName = 'DETALHE'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object sqlReclamacoes_Cor_SantanaACAO: TStringField
      FieldName = 'ACAO'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object sqlReclamacoes_Cor_SantanaDESTINO: TStringField
      FieldName = 'DESTINO'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object sqlReclamacoes_Cor_SantanaDATAAVALIADOR: TSQLTimeStampField
      FieldName = 'DATAAVALIADOR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlReclamacoes_Cor_SantanaCHECKAVALIADOR: TStringField
      FieldName = 'CHECKAVALIADOR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlReclamacoes_Cor_SantanaDATAGERENTEAREA: TSQLTimeStampField
      FieldName = 'DATAGERENTEAREA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlReclamacoes_Cor_SantanaCHECKGERENTEAREA: TStringField
      FieldName = 'CHECKGERENTEAREA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlReclamacoes_Cor_SantanaDATAGERENTEGERAL: TSQLTimeStampField
      FieldName = 'DATAGERENTEGERAL'
      ProviderFlags = [pfInUpdate]
    end
    object sqlReclamacoes_Cor_SantanaCHECKGERENTEGERAL: TStringField
      FieldName = 'CHECKGERENTEGERAL'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlReclamacoes_Cor_SantanaDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlReclamacoes_Cor_SantanaUSUARIO: TStringField
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object sqlReclamacoes_Cor_SantanaAVALIADOR: TStringField
      FieldName = 'AVALIADOR'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object sqlReclamacoes_Cor_SantanaGERENTEAREA: TStringField
      FieldName = 'GERENTEAREA'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object sqlReclamacoes_Cor_SantanaGERENTEGERAL: TStringField
      FieldName = 'GERENTEGERAL'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object sqlReclamacoes_Cor_SantanaEMAILDESTINO: TStringField
      FieldName = 'EMAILDESTINO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
  end
  object dspPosicao_Catalogo: TDataSetProvider
    DataSet = sqlPosicao_Catalogo
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 1012
    Top = 411
  end
  object sqlPosicao_Catalogo: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 1013
    Top = 359
  end
  object sqlSolicitacoes_Reposicao: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'SELECT * FROM SOLICITACOES_REPOSICAO'#13#10'WHERE EMPRESA = :EMPRESA A' +
      'ND FILIAL = :FILIAL'#13#10'ORDER BY EMPRESA, FILIAL, NUMERO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 448
    Top = 504
    object sqlSolicitacoes_ReposicaoEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlSolicitacoes_ReposicaoFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlSolicitacoes_ReposicaoNUMERO: TIntegerField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlSolicitacoes_ReposicaoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlSolicitacoes_ReposicaoSETOR: TStringField
      FieldName = 'SETOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlSolicitacoes_ReposicaoDATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlSolicitacoes_ReposicaoPRODUTO: TStringField
      FieldName = 'PRODUTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 15
    end
    object sqlSolicitacoes_ReposicaoQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlSolicitacoes_ReposicaoQUANTIDADEMULTIPLO: TFloatField
      FieldName = 'QUANTIDADEMULTIPLO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlSolicitacoes_ReposicaoMULTIPLO: TIntegerField
      FieldName = 'MULTIPLO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlSolicitacoes_ReposicaoDATAATENDIDA: TDateField
      FieldName = 'DATAATENDIDA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlSolicitacoes_ReposicaoOBSERVACAO1: TStringField
      FieldName = 'OBSERVACAO1'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object sqlSolicitacoes_ReposicaoOBSERVACAO2: TStringField
      FieldName = 'OBSERVACAO2'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object sqlSolicitacoes_ReposicaoDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlSolicitacoes_ReposicaoPEDIDO: TIntegerField
      FieldName = 'PEDIDO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspSolicitacoes_Reposicao: TDataSetProvider
    DataSet = sqlSolicitacoes_Reposicao
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspSolicitacoes_ReposicaoBeforeUpdateRecord
    Left = 448
    Top = 552
  end
  object sqlSaldos_Reposicao: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'SELECT * FROM SALDOS_REPOSICAO'#13#10'WHERE EMPRESA = :EMPRESA AND FIL' +
      'IAL = :FILIAL'#13#10'ORDER BY EMPRESA, FILIAL, PRODUTO, LOCAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 632
    Top = 504
    object sqlSaldos_ReposicaoEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlSaldos_ReposicaoFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlSaldos_ReposicaoPRODUTO: TStringField
      FieldName = 'PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object sqlSaldos_ReposicaoLOCAL: TStringField
      FieldName = 'LOCAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlSaldos_ReposicaoSALDO: TFloatField
      FieldName = 'SALDO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlSaldos_ReposicaoDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dspSaldos_Reposicao: TDataSetProvider
    DataSet = sqlSaldos_Reposicao
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 632
    Top = 552
  end
  object sqlProjetos_Historicos: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT * FROM PROJETOS_HISTORICOS WHERE EMPRESA = :EMPRESA AND F' +
      'ILIAL = :FILIAL AND NUMERO = :NUMERO'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsProjetos
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 432
    Top = 2408
    object sqlProjetos_HistoricosEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlProjetos_HistoricosFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlProjetos_HistoricosNUMERO: TIntegerField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlProjetos_HistoricosSEQUENCIAL: TIntegerField
      FieldName = 'SEQUENCIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlProjetos_HistoricosDATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlProjetos_HistoricosHISTORICO: TStringField
      FieldName = 'HISTORICO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 200
    end
    object sqlProjetos_HistoricosTIPO: TStringField
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlProjetos_HistoricosNOMEUSUARIO: TStringField
      FieldName = 'NOMEUSUARIO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlProjetos_HistoricosDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dtsProjetos: TDataSource
    DataSet = sqlProjetos
    Left = 264
    Top = 2352
  end
  object dspProjetos: TDataSetProvider
    DataSet = sqlProjetos
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspProjetosBeforeUpdateRecord
    Left = 260
    Top = 2300
  end
  object sqlProjetos: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT * FROM PROJETOS WHERE EMPRESA = :EMPRESA AND FILIAL = :FI' +
      'LIAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 264
    Top = 2256
    object sqlProjetosEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlProjetosFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlProjetosNUMERO: TIntegerField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlProjetosCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlProjetosSTATUS: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlProjetosTIPO: TStringField
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlProjetosLIDER: TIntegerField
      FieldName = 'LIDER'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProjetosPREVISAOHORAS: TIntegerField
      FieldName = 'PREVISAOHORAS'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProjetosHORASEFETIVAS: TIntegerField
      FieldName = 'HORASEFETIVAS'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProjetosETAPA: TStringField
      FieldName = 'ETAPA'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlProjetosDATAINICIO: TDateField
      FieldName = 'DATAINICIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlProjetosPREVISAODATAFIM: TDateField
      FieldName = 'PREVISAODATAFIM'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProjetosDATAFIM: TDateField
      FieldName = 'DATAFIM'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProjetosDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object sqlAgendamentos_Dias: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select * from AGENDAMENTO_VISITAS where EMPRESA = :EMPRESA AND F' +
      'ILIAL = :FILIAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 152
    Top = 2408
    object StringField1: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object StringField2: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object IntegerField1: TIntegerField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'CLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object StringField3: TStringField
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object IntegerField3: TIntegerField
      FieldName = 'FUNCIONARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object StringField4: TStringField
      FieldName = 'MOTIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 250
    end
    object StringField5: TStringField
      FieldName = 'HORARIO'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object DateField1: TDateField
      FieldName = 'DATAVISITA'
      ProviderFlags = [pfInUpdate]
    end
    object SQLTimeStampField1: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dtsAgendamento_Visitas: TDataSource
    DataSet = sqlAgendamento_Visitas
    Left = 40
    Top = 2344
  end
  object dspAgendamento_Visitas: TDataSetProvider
    DataSet = sqlAgendamento_Visitas
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 36
    Top = 2300
  end
  object sqlAgendamento_Visitas: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select * from AGENDAMENTO_VISITAS where EMPRESA = :EMPRESA AND F' +
      'ILIAL = :FILIAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 40
    Top = 2256
    object sqlAgendamento_VisitasEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlAgendamento_VisitasFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlAgendamento_VisitasNUMERO: TIntegerField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlAgendamento_VisitasCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlAgendamento_VisitasSITUACAO: TStringField
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlAgendamento_VisitasFUNCIONARIO: TIntegerField
      FieldName = 'FUNCIONARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlAgendamento_VisitasMOTIVO: TStringField
      FieldName = 'MOTIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 250
    end
    object sqlAgendamento_VisitasHORARIO: TStringField
      FieldName = 'HORARIO'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object sqlAgendamento_VisitasDATAVISITA: TDateField
      FieldName = 'DATAVISITA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlAgendamento_VisitasDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object sqlTarefas_Apontamentos: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select * from TAREFAS_APONTAMENTOS where EMPRESA = :EMPRESA AND ' +
      'FILIAL = :FILIAL AND NUMERO = :NUMERO'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsTarefas
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 296
    Top = 2400
    object sqlTarefas_ApontamentosEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlTarefas_ApontamentosFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlTarefas_ApontamentosNUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlTarefas_ApontamentosSEQUENCIAL: TIntegerField
      DisplayLabel = 'Sequ'#234'ncial'
      FieldName = 'SEQUENCIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlTarefas_ApontamentosDATA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlTarefas_ApontamentosHISTORICO: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 200
    end
    object sqlTarefas_ApontamentosUSUARIO: TIntegerField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlTarefas_ApontamentosSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlTarefas_ApontamentosDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data de Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dtsTarefas: TDataSource
    DataSet = sqlTarefas
    Left = 168
    Top = 2352
  end
  object dspTarefas: TDataSetProvider
    DataSet = sqlTarefas
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspTarefasBeforeUpdateRecord
    Left = 164
    Top = 2300
  end
  object sqlTarefas: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    ObjectView = True
    CommandText = 
      'select * from TAREFAS where EMPRESA = :EMPRESA AND FILIAL = :FIL' +
      'IAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 168
    Top = 2256
    object sqlTarefasEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlTarefasFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlTarefasNUMERO: TIntegerField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlTarefasSTATUS: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlTarefasPRIORIDADE: TStringField
      FieldName = 'PRIORIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object sqlTarefasTIPO: TStringField
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object sqlTarefasDATACADASTRO: TDateField
      FieldName = 'DATACADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlTarefasNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 150
    end
    object sqlTarefasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object sqlTarefasDATAINICIO: TDateField
      FieldName = 'DATAINICIO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlTarefasDATAFIM: TDateField
      FieldName = 'DATAFIM'
      ProviderFlags = [pfInUpdate]
    end
    object sqlTarefasFUNCIONARIO: TIntegerField
      FieldName = 'FUNCIONARIO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlTarefasCRIADOR: TStringField
      FieldName = 'CRIADOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 240
    end
    object sqlTarefasUSUARIO: TIntegerField
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlTarefasDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlTarefasHORASGASTAS: TFloatField
      FieldName = 'HORASGASTAS'
      ProviderFlags = [pfInUpdate]
    end
    object sqlTarefasSOLUCAO: TStringField
      FieldName = 'SOLUCAO'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object sqlTarefasSOLICITANTE: TIntegerField
      FieldName = 'SOLICITANTE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlTarefasESTIMATIVAHORAS: TFloatField
      FieldName = 'ESTIMATIVAHORAS'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dtsSetores: TDataSource
    DataSet = sqlSetores
    Left = 416
    Top = 2352
  end
  object dspSetores: TDataSetProvider
    DataSet = sqlSetores
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspSetoresBeforeUpdateRecord
    Left = 420
    Top = 2300
  end
  object sqlSetores: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select * from SETORES where EMPRESA = :EMPRESA AND FILIAL = :FIL' +
      'IAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 416
    Top = 2256
    object sqlSetoresEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlSetoresFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlSetoresNUMERO: TIntegerField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlSetoresDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 240
    end
  end
  object dtsFuncionarios: TDataSource
    DataSet = sqlFuncionarios
    Left = 336
    Top = 2352
  end
  object dspFuncionarios: TDataSetProvider
    DataSet = sqlFuncionarios
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspFuncionariosBeforeUpdateRecord
    Left = 337
    Top = 2300
  end
  object sqlFuncionarios: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select * from FUNCIONARIOS where EMPRESA = :EMPRESA AND FILIAL =' +
      ' :FILIAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 336
    Top = 2256
    object sqlFuncionariosEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlFuncionariosFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlFuncionariosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlFuncionariosSTATUS: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlFuncionariosNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 150
    end
    object sqlFuncionariosREDUZIDO: TStringField
      FieldName = 'REDUZIDO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 240
    end
    object sqlFuncionariosDATACADASTRO: TDateField
      FieldName = 'DATACADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlFuncionariosDATAADMISSAO: TDateField
      FieldName = 'DATAADMISSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlFuncionariosDATADEMISSAO: TDateField
      FieldName = 'DATADEMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFuncionariosENDERECO: TStringField
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 90
    end
    object sqlFuncionariosNUMERO: TStringField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object sqlFuncionariosCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object sqlFuncionariosMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object sqlFuncionariosUF: TStringField
      FieldName = 'UF'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlFuncionariosDDD: TStringField
      FieldName = 'DDD'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object sqlFuncionariosTELEFONE: TStringField
      FieldName = 'TELEFONE'
      ProviderFlags = [pfInUpdate]
      Size = 16
    end
    object sqlFuncionariosCELULAR: TStringField
      FieldName = 'CELULAR'
      ProviderFlags = [pfInUpdate]
      Size = 16
    end
    object sqlFuncionariosCELULAREMPRESA: TStringField
      FieldName = 'CELULAREMPRESA'
      ProviderFlags = [pfInUpdate]
      Size = 16
    end
    object sqlFuncionariosEMAIL: TStringField
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object sqlFuncionariosEMAILPESSOAL: TStringField
      FieldName = 'EMAILPESSOAL'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object sqlFuncionariosSETOR: TStringField
      FieldName = 'SETOR'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlFuncionariosCARGO: TStringField
      FieldName = 'CARGO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlFuncionariosTIPO: TStringField
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlFuncionariosHIERARQUIA: TStringField
      FieldName = 'HIERARQUIA'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlFuncionariosFORMACAO: TStringField
      FieldName = 'FORMACAO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlFuncionariosCONSULTOR: TStringField
      FieldName = 'CONSULTOR'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlFuncionariosDIAPAGAMENTO: TDateField
      FieldName = 'DIAPAGAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFuncionariosHABILITADO: TStringField
      FieldName = 'HABILITADO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlFuncionariosNUMEROHABILITACAO: TStringField
      FieldName = 'NUMEROHABILITACAO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlFuncionariosBANCO: TIntegerField
      FieldName = 'BANCO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFuncionariosAGENCIA: TStringField
      FieldName = 'AGENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object sqlFuncionariosCONTA: TStringField
      FieldName = 'CONTA'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object sqlFuncionariosOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object sqlFuncionariosUSUARIO: TIntegerField
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFuncionariosDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object sqlImportacoes_Cambio: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT * FROM IMPORTACOES_FORNECEDORES_CAMBIO WHERE EMPRESA = :E' +
      'MPRESA AND FILIAL = :FILIAL ORDER BY EMPRESA, FILIAL, FORNECEDOR' +
      ', ITEM'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 64
    Top = 504
    object StringField6: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object StringField7: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object IntegerField4: TIntegerField
      FieldName = 'FORNECEDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField5: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object DateField2: TDateField
      FieldName = 'DATAFECHAMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object StringField8: TStringField
      FieldName = 'INVOICECONTRATO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object FloatField1: TFloatField
      FieldName = 'VALORINVOICE'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField2: TFloatField
      FieldName = 'VALORPAGAMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object FloatField3: TFloatField
      FieldName = 'TAXADOLAR'
      ProviderFlags = [pfInUpdate]
    end
    object StringField9: TStringField
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
  end
  object dspImportacoes_Cambio: TDataSetProvider
    DataSet = sqlImportacoes_Cambio
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 64
    Top = 552
  end
  object dspPendencias_Pedidos_Vendas: TDataSetProvider
    DataSet = sqlPendencias_Pedidos_Vendas
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 817
    Top = 555
  end
  object sqlPendencias_Pedidos_Vendas: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'SELECT * FROM PEDIDOS_VENDAS_PENDENCIAS WHERE EMPRESA = :EMPRESA' +
      ' AND FILIAL = :FILIAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 2
      end>
    SQLConnection = SQLConnection1
    Left = 817
    Top = 503
    object sqlPendencias_Pedidos_VendasEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlPendencias_Pedidos_VendasFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlPendencias_Pedidos_VendasNUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlPendencias_Pedidos_VendasPENDENCIA: TStringField
      DisplayLabel = 'Pend'#234'ncia'
      FieldName = 'PENDENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object sqlPendencias_Pedidos_VendasSITUACAO: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 1
    end
    object sqlPendencias_Pedidos_VendasUSUARIO: TIntegerField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlPendencias_Pedidos_VendasVENDEDOR: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'VENDEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlPendencias_Pedidos_VendasDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data de Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlPendencias_Pedidos_VendasUSUARIOFECHAMENTO: TIntegerField
      DisplayLabel = 'Finalizador'
      FieldName = 'USUARIOFECHAMENTO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object sqlConcorrentes_Dados_Santana: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select a.EMPRESA, a.PERCENTUAL, a.FILIAL, a.CODIGO,  a.DESCRICAO' +
      ', a.MOEDA, a.DATAINICIO, a.DATAFINAL, a.DATACRIACAO from CONCORR' +
      'ENTES_DADOS a where a.EMPRESA = :EMPRESA AND a.FILIAL = :FILIAL ' +
      #13#10'order by a.EMPRESA, a.FILIAL, a.CODIGO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 2
      end>
    SQLConnection = SQLConnection1
    Left = 72
    Top = 652
    object sqlConcorrentes_Dados_SantanaEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlConcorrentes_Dados_SantanaFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlConcorrentes_Dados_SantanaCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlConcorrentes_Dados_SantanaDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 25
    end
    object sqlConcorrentes_Dados_SantanaDATAINICIO: TDateField
      DisplayLabel = 'Data In'#237'cio'
      FieldName = 'DATAINICIO'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object sqlConcorrentes_Dados_SantanaDATAFINAL: TDateField
      DisplayLabel = 'Data Final'
      FieldName = 'DATAFINAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object sqlConcorrentes_Dados_SantanaMOEDA: TStringField
      DisplayLabel = 'Moeda'
      FieldName = 'MOEDA'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object sqlConcorrentes_Dados_SantanaPERCENTUAL: TFloatField
      DisplayLabel = 'Percentual de Desconto'
      FieldName = 'PERCENTUAL'
      ProviderFlags = [pfInUpdate]
    end
    object sqlConcorrentes_Dados_SantanaDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data da Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dspConcorrentes_Dados_Santana: TDataSetProvider
    DataSet = sqlConcorrentes_Dados_Santana
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspConcorrentes_Dados_SantanaBeforeUpdateRecord
    AfterApplyUpdates = dspConcorrentes_Dados_SantanaAfterApplyUpdates
    OnGetTableName = dspConcorrentes_Dados_SantanaGetTableName
    Left = 72
    Top = 713
  end
  object dtsConcorrentes_Dados_Santana: TDataSource
    DataSet = sqlConcorrentes_Dados_Santana
    Left = 241
    Top = 652
  end
  object sqlConcorrentes_Itens_Santana: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select a.EMPRESA, a.FILIAL, a.CODIGO, a.PRODUTO, b.REDUZIDO, b.P' +
      'RECOVENDA1, b.PRECOVENDA2, b.PRECOVENDA3, b.PRECOVENDA4, '#13#10'b.PRE' +
      'COVENDA5, b.PRECOVENDA6, b.PRECOVENDA7, b.PRECOVENDA8, b.PRECOVE' +
      'NDA9, b.PRECOVENDA10, a.PRECOVENDA, a.VIGENCIA, a.OFERTA, a.COTA' +
      'CAO, a.ATUALIZACAO, a.DATACRIACAO'#13#10'from CONCORRENTES_ITENS a inn' +
      'er join PRODUTOS b on (b.EMPRESA = a.EMPRESA and b.FILIAL = A.FI' +
      'LIAL and b.CODIGO = a.PRODUTO)'#13#10'where a.EMPRESA = :EMPRESA and a' +
      '.FILIAL = :FILIAL and a.CODIGO = :CODIGO'#13#10'order by a.EMPRESA, a.' +
      'FILIAL, a.CODIGO, a.PRODUTO'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsConcorrentes_Dados_Santana
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    Left = 241
    Top = 713
    object sqlConcorrentes_Itens_SantanaEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlConcorrentes_Itens_SantanaFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlConcorrentes_Itens_SantanaCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlConcorrentes_Itens_SantanaPRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object sqlConcorrentes_Itens_SantanaREDUZIDO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'REDUZIDO'
      ProviderFlags = []
      Required = True
      Size = 30
    end
    object sqlConcorrentes_Itens_SantanaPRECOVENDA1: TFloatField
      DisplayLabel = 'Pre'#231'o de Venda 1'
      FieldName = 'PRECOVENDA1'
      ProviderFlags = []
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlConcorrentes_Itens_SantanaPRECOVENDA2: TFloatField
      DisplayLabel = 'Pre'#231'o de Venda 2'
      FieldName = 'PRECOVENDA2'
      ProviderFlags = []
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlConcorrentes_Itens_SantanaPRECOVENDA3: TFloatField
      DisplayLabel = 'Pre'#231'o de Venda 3'
      FieldName = 'PRECOVENDA3'
      ProviderFlags = []
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlConcorrentes_Itens_SantanaPRECOVENDA4: TFloatField
      DisplayLabel = 'Pre'#231'o de Venda 4'
      FieldName = 'PRECOVENDA4'
      ProviderFlags = []
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlConcorrentes_Itens_SantanaPRECOVENDA5: TFloatField
      DisplayLabel = 'Pre'#231'o de Venda 5'
      FieldName = 'PRECOVENDA5'
      ProviderFlags = []
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlConcorrentes_Itens_SantanaPRECOVENDA6: TFloatField
      DisplayLabel = 'Pre'#231'o de Venda 6'
      FieldName = 'PRECOVENDA6'
      ProviderFlags = []
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlConcorrentes_Itens_SantanaPRECOVENDA7: TFloatField
      DisplayLabel = 'Pre'#231'o de Venda 7'
      FieldName = 'PRECOVENDA7'
      ProviderFlags = []
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlConcorrentes_Itens_SantanaPRECOVENDA8: TFloatField
      DisplayLabel = 'Pre'#231'o de Venda 8'
      FieldName = 'PRECOVENDA8'
      ProviderFlags = []
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlConcorrentes_Itens_SantanaPRECOVENDA9: TFloatField
      DisplayLabel = 'Pre'#231'o de Venda 9'
      FieldName = 'PRECOVENDA9'
      ProviderFlags = []
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlConcorrentes_Itens_SantanaPRECOVENDA10: TFloatField
      DisplayLabel = 'Pre'#231'o de Venda 10'
      FieldName = 'PRECOVENDA10'
      ProviderFlags = []
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlConcorrentes_Itens_SantanaPRECOVENDA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Venda'
      FieldName = 'PRECOVENDA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlConcorrentes_Itens_SantanaOFERTA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Oferta'
      FieldName = 'OFERTA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlConcorrentes_Itens_SantanaCOTACAO: TFloatField
      DisplayLabel = 'Cota'#231#227'o'
      FieldName = 'COTACAO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlConcorrentes_Itens_SantanaATUALIZACAO: TDateField
      DisplayLabel = 'Atualiza'#231#227'o'
      FieldName = 'ATUALIZACAO'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/0000;1;_'
    end
    object sqlConcorrentes_Itens_SantanaVIGENCIA: TDateField
      DisplayLabel = 'Vig'#234'ncia'
      FieldName = 'VIGENCIA'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object sqlConcorrentes_Itens_SantanaDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object sqlPainel_Produtos_Concorrentes: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'SELECT EMPRESA, FILIAL, CODIGO, DESCRICAO, PRODUTO, PRECOVENDA, ' +
      'OFERTA, COTACAO, STATUS, ATUALIZACAO, PERCENTUAL FROM CONCORRENT' +
      'ES_ITENS WHERE EMPRESA = :EMPRESA AND FILIAL = :FILIAL AND PRODU' +
      'TO = :PRODUTO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PRODUTO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1237
    Top = 363
    object cdsConcorrentesEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object cdsConcorrentesFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object cdsConcorrentesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsConcorrentesDESCRICAO: TStringField
      DisplayLabel = 'Concorrente'
      FieldName = 'DESCRICAO'
      ProviderFlags = []
      Required = True
      Size = 25
    end
    object cdsConcorrentesPRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object sqlPainel_Produtos_ConcorrentesPRECOVENDA: TFloatField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'PRECOVENDA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlPainel_Produtos_ConcorrentesOFERTA: TFloatField
      DisplayLabel = 'Oferta'
      FieldName = 'OFERTA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlPainel_Produtos_ConcorrentesCOTACAO: TFloatField
      DisplayLabel = 'Cota'#231#227'o'
      FieldName = 'COTACAO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlPainel_Produtos_ConcorrentesSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkCalculated
      FieldName = 'STATUS'
      Size = 10
      Calculated = True
    end
    object sqlPainel_Produtos_ConcorrentesATUALIZACAO: TDateField
      DisplayLabel = 'Atualiza'#231#227'o'
      FieldName = 'ATUALIZACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object sqlPainel_Produtos_ConcorrentesPERCENTUAL: TFloatField
      DisplayLabel = 'Percentual'
      FieldName = 'PERCENTUAL'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
  end
  object dspPainel_Produtos_Concorrentes: TDataSetProvider
    DataSet = sqlPainel_Produtos_Concorrentes
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 1237
    Top = 415
  end
  object dspProdutos: TDataSetProvider
    DataSet = sqlProdutos
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 816
    Top = 720
  end
  object sqlProdutos: TSQLDataSet
    GetMetadata = False
    BeforeOpen = sqlProdutosBeforeOpen
    CommandText = 
      'select * from PRODUTOS where EMPRESA = :EMPRESA and FILIAL = :FI' +
      'LIAL order by EMPRESA, FILIAL, CODIGO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 2
      end>
    SQLConnection = SQLConnection1
    Left = 816
    Top = 660
    object sqlProdutosFUNCIONALIDADE: TMemoField
      DisplayLabel = 'Funcionalidade'
      FieldName = 'FUNCIONALIDADE'
      BlobType = ftMemo
    end
    object sqlProdutosEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlProdutosFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 2
    end
    object sqlProdutosSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlProdutosCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object sqlProdutosDATACADASTRO: TDateField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATACADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object sqlProdutosDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 240
    end
    object sqlProdutosREDUZIDO: TStringField
      DisplayLabel = 'Nome Reduzido'
      FieldName = 'REDUZIDO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object sqlProdutosGRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosSUBGRUPO: TIntegerField
      DisplayLabel = 'SubGrupo'
      FieldName = 'SUBGRUPO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosFABRICANTE: TStringField
      DisplayLabel = 'Fabricante'
      FieldName = 'FABRICANTE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object sqlProdutosMARCA: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object sqlProdutosMODELO: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object sqlProdutosORIGEMPRODUTO: TStringField
      DisplayLabel = 'Origem do Produto'
      FieldName = 'ORIGEMPRODUTO'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object sqlProdutosNUMEROSERIE: TStringField
      DisplayLabel = 'N'#250'mero de S'#233'rie'
      FieldName = 'NUMEROSERIE'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object sqlProdutosLOCALIZACAO: TStringField
      DisplayLabel = 'Localiza'#231#227'o'
      FieldName = 'LOCALIZACAO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object sqlProdutosREGRAENTRADA: TIntegerField
      DisplayLabel = 'Regra Entrada'
      FieldName = 'REGRAENTRADA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosREGRASAIDA: TIntegerField
      DisplayLabel = 'Regra Sa'#237'da'
      FieldName = 'REGRASAIDA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosULTIMACOMPRA: TDateField
      DisplayLabel = 'Ultima Compra'
      FieldName = 'ULTIMACOMPRA'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/0000;1;_'
    end
    object sqlProdutosULTIMOPRECO: TFloatField
      DisplayLabel = #218'ltimo Pre'#231'o'
      FieldName = 'ULTIMOPRECO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosULTIMOFORNECEDOR: TIntegerField
      DisplayLabel = #218'ltimo Fornecedor'
      FieldName = 'ULTIMOFORNECEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosCOMISSAO: TFloatField
      DisplayLabel = 'Comiss'#227'o'
      FieldName = 'COMISSAO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.0000%'
      EditFormat = '0.0000'
    end
    object sqlProdutosSITUACAOTRIBUTARIA: TStringField
      DisplayLabel = 'Situa'#231#227'o Tribut'#225'ria'
      FieldName = 'SITUACAOTRIBUTARIA'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object sqlProdutosORIGEMST: TStringField
      DefaultExpression = #39'0'#39
      DisplayLabel = 'Origem do Produto (ST)'
      FieldName = 'ORIGEMST'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlProdutosCLASSIFICACAOFISCAL: TStringField
      DisplayLabel = 'Classifica'#231#227'o Fiscal'
      DisplayWidth = 2
      FieldName = 'CLASSIFICACAOFISCAL'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlProdutosTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object sqlProdutosPRIMEIRAUNIDADE: TStringField
      DisplayLabel = 'Primeira Unidade'
      FieldName = 'PRIMEIRAUNIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object sqlProdutosLOCALPADRAO: TStringField
      DisplayLabel = 'Local Padr'#227'o'
      FieldName = 'LOCALPADRAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object sqlProdutosSEGUNDAUNIDADE: TStringField
      DisplayLabel = 'Segunda Unidade'
      FieldName = 'SEGUNDAUNIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlProdutosTIPOCONVERSAO: TStringField
      DisplayLabel = 'Tipo Convers'#227'o'
      FieldName = 'TIPOCONVERSAO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlProdutosFATORCONVERSAO: TFloatField
      DisplayLabel = 'Fator de Convers'#227'o'
      FieldName = 'FATORCONVERSAO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosCUSTOPADRAO: TFloatField
      DisplayLabel = 'Custo Padr'#227'o'
      FieldName = 'CUSTOPADRAO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosMOEDACUSTO: TStringField
      DisplayLabel = 'Moeda Custo'
      FieldName = 'MOEDACUSTO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object sqlProdutosCUSTOPADRAOMOEDA: TFloatField
      DisplayLabel = 'Custo Moeda'
      FieldName = 'CUSTOPADRAOMOEDA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosULTIMACOTACAO: TFloatField
      DisplayLabel = #218'ltima Cota'#231#227'o'
      FieldName = 'ULTIMACOTACAO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosPESOLIQUIDO: TFloatField
      DisplayLabel = 'Peso L'#237'quido'
      FieldName = 'PESOLIQUIDO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object sqlProdutosPESOBRUTO: TFloatField
      DisplayLabel = 'Peso Bruto'
      FieldName = 'PESOBRUTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object sqlProdutosCODIGOBARRAS: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'C'#243'digo Barras'
      DisplayWidth = 25
      FieldName = 'CODIGOBARRAS'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object sqlProdutosOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object sqlProdutosICMS: TFloatField
      DefaultExpression = '0'
      FieldName = 'ICMS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object sqlProdutosIPI: TFloatField
      DefaultExpression = '0'
      FieldName = 'IPI'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object sqlProdutosISS: TFloatField
      DefaultExpression = '0'
      FieldName = 'ISS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object sqlProdutosII: TFloatField
      DefaultExpression = '0'
      FieldName = 'II'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object sqlProdutosMARGEMLUCRO: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Margem Lucro'
      FieldName = 'MARGEMLUCRO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object sqlProdutosTRIBUTOS: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Tributos'
      FieldName = 'TRIBUTOS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object sqlProdutosESTOQUESEGURANCA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Estoque Seguran'#231'a'
      FieldName = 'ESTOQUESEGURANCA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object sqlProdutosPONTOPEDIDO: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Ponto Pedido'
      FieldName = 'PONTOPEDIDO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object sqlProdutosULTIMOINVENTARIO: TDateField
      DisplayLabel = 'Ultimo Invent'#225'rio'
      FieldName = 'ULTIMOINVENTARIO'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/0000;1;_'
    end
    object sqlProdutosPINVENTARIO: TIntegerField
      DefaultExpression = '0'
      DisplayLabel = 'Periodicidade Invent'#225'rio'
      FieldName = 'PINVENTARIO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosESTOQUEMINIMO: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Estoque M'#237'nimo'
      FieldName = 'ESTOQUEMINIMO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object sqlProdutosESTOQUEMAXIMO: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Estoque M'#225'ximo'
      FieldName = 'ESTOQUEMAXIMO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object sqlProdutosLIMITEESTOQUE: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Limite Estoque'
      FieldName = 'LIMITEESTOQUE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object sqlProdutosPRAZOENTREGA: TIntegerField
      DefaultExpression = '0'
      DisplayLabel = 'Prazo de Entrega'
      FieldName = 'PRAZOENTREGA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosTIPOPRAZO: TStringField
      DisplayLabel = 'Tipo Prazo de Entrega'
      FieldName = 'TIPOPRAZO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlProdutosLOTEECONOMICO: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Lote Econ'#244'mico'
      FieldName = 'LOTEECONOMICO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object sqlProdutosLOTEMINIMO: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Lote M'#237'nimo'
      FieldName = 'LOTEMINIMO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object sqlProdutosPRECOCUSTO1: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Custo 1'
      FieldName = 'PRECOCUSTO1'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosPRECOCUSTO2: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Custo 2'
      FieldName = 'PRECOCUSTO2'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosPRECOCUSTO3: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Custo 3'
      FieldName = 'PRECOCUSTO3'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosPRECOCUSTO4: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Custo 4'
      FieldName = 'PRECOCUSTO4'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosPRECOCUSTO5: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Custo 5'
      FieldName = 'PRECOCUSTO5'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosPRECOCUSTO6: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Custo 6'
      FieldName = 'PRECOCUSTO6'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosPRECOCUSTO7: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Custo 7'
      FieldName = 'PRECOCUSTO7'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosPRECOCUSTO8: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Custo 8'
      FieldName = 'PRECOCUSTO8'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosPRECOCUSTO9: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Custo 9'
      FieldName = 'PRECOCUSTO9'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosPRECOCUSTO10: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Custo 10'
      FieldName = 'PRECOCUSTO10'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosPRECOVENDA1: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Venda 1'
      FieldName = 'PRECOVENDA1'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosPRECOVENDA2: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Venda 2'
      FieldName = 'PRECOVENDA2'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosPRECOVENDA3: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Venda 3'
      FieldName = 'PRECOVENDA3'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosPRECOVENDA4: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Venda 4'
      FieldName = 'PRECOVENDA4'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosPRECOVENDA5: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Venda 5'
      FieldName = 'PRECOVENDA5'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosPRECOVENDA6: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Venda 6'
      FieldName = 'PRECOVENDA6'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosPRECOVENDA7: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Venda 7'
      FieldName = 'PRECOVENDA7'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosPRECOVENDA8: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Venda 8'
      FieldName = 'PRECOVENDA8'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosPRECOVENDA9: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Venda 9'
      FieldName = 'PRECOVENDA9'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosPRECOVENDA10: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Venda 10'
      FieldName = 'PRECOVENDA10'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosPRECOANTIGO1: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 01 - Antigo'
      FieldName = 'PRECOANTIGO1'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosPRECOANTIGO2: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 02 - Antigo'
      FieldName = 'PRECOANTIGO2'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosPRECOANTIGO3: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 03 - Antigo'
      FieldName = 'PRECOANTIGO3'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosPRECOANTIGO4: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 04 - Antigo'
      FieldName = 'PRECOANTIGO4'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosPRECOANTIGO5: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 05 - Antigo'
      FieldName = 'PRECOANTIGO5'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosPRECOANTIGO6: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 06 - Antigo'
      FieldName = 'PRECOANTIGO6'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosPRECOANTIGO7: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 07 - Antigo'
      FieldName = 'PRECOANTIGO7'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosPRECOANTIGO8: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 08 - Antigo'
      FieldName = 'PRECOANTIGO8'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosPRECOANTIGO9: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 09 - Antigo'
      FieldName = 'PRECOANTIGO9'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosPRECOANTIGO10: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 10 - Antigo'
      FieldName = 'PRECOANTIGO10'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosPRECOMINIMO: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o M'#237'nimo'
      FieldName = 'PRECOMINIMO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosPRECOMAXIMO: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o M'#225'ximo'
      FieldName = 'PRECOMAXIMO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosCORDESTAQUE: TIntegerField
      DisplayLabel = 'Cor de Destaque'
      FieldName = 'CORDESTAQUE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosIMAGEM: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Imagem'
      FieldName = 'IMAGEM'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object sqlProdutosITEMNOVO: TStringField
      FieldName = 'ITEMNOVO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlProdutosCONTROLALOTE: TStringField
      DisplayLabel = 'Controla Lote?'
      FieldName = 'CONTROLALOTE'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlProdutosREGRAMULTIPLO: TIntegerField
      DisplayLabel = 'Regra M'#250'ltiplo'
      FieldName = 'REGRAMULTIPLO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosULTIMAALTERACAOPRECO: TDateField
      DisplayLabel = #218'ltima Altera'#231#227'o de Pre'#231'o'
      FieldName = 'ULTIMAALTERACAOPRECO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosUSUARIOULTIMAALTERACAOPRECO: TIntegerField
      DisplayLabel = 'Usu'#225'rio - '#218'ltima Altera'#231#227'o de Pre'#231'o'
      FieldName = 'USUARIOULTIMAALTERACAOPRECO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosNROFCI: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'N'#250'mero FCI'
      FieldName = 'NROFCI'
      ProviderFlags = [pfInUpdate]
      Size = 32
    end
    object sqlProdutosPERCENTUALFCI: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Percentual FCI'
      FieldName = 'PERCENTUALFCI'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object sqlProdutosCOR: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Cor'
      FieldName = 'COR'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlProdutosTAMANHO: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Tamanho'
      FieldName = 'TAMANHO'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object sqlProdutosDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data da Cria'#231#227'o '
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlProdutosCOMPRIMENTO: TFloatField
      FieldName = 'COMPRIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosALTURA: TFloatField
      FieldName = 'ALTURA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosLARGURA: TFloatField
      FieldName = 'LARGURA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosPRECOSITE: TFloatField
      FieldName = 'PRECOSITE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosPRECOVENDASITE: TFloatField
      FieldName = 'PRECOVENDASITE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosMARGEMSITE: TFloatField
      FieldName = 'MARGEMSITE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosORDEMCATALOGO: TIntegerField
      DisplayLabel = 'Ordem Cat'#225'logo'
      FieldName = 'ORDEMCATALOGO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosDIASGARANTIA: TIntegerField
      DisplayLabel = 'Dias de Garantia'
      FieldName = 'DIASGARANTIA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosQUANTIDADEMAXIMA: TFloatField
      DisplayLabel = 'Qtde M'#225'xima por Venda'
      FieldName = 'QUANTIDADEMAXIMA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosFEDERAIS: TFloatField
      DefaultExpression = '0'
      DisplayLabel = '%Federal'
      FieldName = 'FEDERAIS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
    end
    object sqlProdutosESTADUAIS: TFloatField
      DefaultExpression = '0'
      DisplayLabel = '%Estadual'
      FieldName = 'ESTADUAIS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
    end
    object sqlProdutosMUNICIPAIS: TFloatField
      DefaultExpression = '0'
      DisplayLabel = '%Municipal'
      FieldName = 'MUNICIPAIS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
    end
    object sqlProdutosFEDERAISIMPORTADO: TFloatField
      DefaultExpression = '0'
      DisplayLabel = '%Federal Importado'
      FieldName = 'FEDERAISIMPORTADO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
    end
    object sqlProdutosUSUARIOTRANSFERENCIAPRECO: TIntegerField
      DisplayLabel = 'Usu'#225'rio Transfer'#234'ncia Pre'#231'o'
      FieldName = 'USUARIOTRANSFERENCIAPRECO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosULTIMATRANSFERENCIAPRECO: TSQLTimeStampField
      DisplayLabel = #218'ltima Transfer'#234'ncia Pre'#231'o'
      FieldName = 'ULTIMATRANSFERENCIAPRECO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/0000 90:00:00>LL;1;_'
    end
    object sqlProdutosPRECOALTERNATIVO10: TFloatField
      DisplayLabel = 'Pre'#231'o Alternativo 10'
      FieldName = 'PRECOALTERNATIVO10'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosPRECOALTERNATIVO9: TFloatField
      DisplayLabel = 'Pre'#231'o Alternativo 9'
      FieldName = 'PRECOALTERNATIVO9'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosPRECOALTERNATIVO8: TFloatField
      DisplayLabel = 'Pre'#231'o Alternativo 8'
      FieldName = 'PRECOALTERNATIVO8'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosPRECOALTERNATIVO7: TFloatField
      DisplayLabel = 'Pre'#231'o Alternativo 7'
      FieldName = 'PRECOALTERNATIVO7'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosPRECOALTERNATIVO6: TFloatField
      DisplayLabel = 'Pre'#231'o Alternativo 6'
      FieldName = 'PRECOALTERNATIVO6'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosPRECOALTERNATIVO5: TFloatField
      DisplayLabel = 'Pre'#231'o Alternativo 5'
      FieldName = 'PRECOALTERNATIVO5'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosPRECOALTERNATIVO4: TFloatField
      DisplayLabel = 'Pre'#231'o Alternativo 4'
      FieldName = 'PRECOALTERNATIVO4'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosPRECOALTERNATIVO3: TFloatField
      DisplayLabel = 'Pre'#231'o Alternativo 3'
      FieldName = 'PRECOALTERNATIVO3'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosPRECOALTERNATIVO2: TFloatField
      DisplayLabel = 'Pre'#231'o Alternativo 2'
      FieldName = 'PRECOALTERNATIVO2'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosPRECOALTERNATIVO1: TFloatField
      DisplayLabel = 'Pre'#231'o Alternativo 1'
      FieldName = 'PRECOALTERNATIVO1'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlProdutosEMBALAGEM: TStringField
      FieldName = 'EMBALAGEM'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlProdutosUPGRADEEMBALAGEM: TStringField
      FieldName = 'UPGRADEEMBALAGEM'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlProdutosDATAUPGRADEEMBALAGEM: TDateField
      FieldName = 'DATAUPGRADEEMBALAGEM'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosPAGINACATALOGO: TIntegerField
      FieldName = 'PAGINACATALOGO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutosARQUIVOINFORMACOES: TStringField
      FieldName = 'ARQUIVOINFORMACOES'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlProdutosGRUPOALTERNATIVO: TIntegerField
      DisplayLabel = 'Grupo Equivalente'
      FieldName = 'GRUPOALTERNATIVO'
    end
    object sqlProdutosGRUPORELACIONADO: TIntegerField
      DisplayLabel = 'Grupo Relacionado'
      FieldName = 'GRUPORELACIONADO'
    end
    object sqlProdutosDATASHEET: TStringField
      FieldName = 'DATASHEET'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlProdutosPRODUTOSITE: TStringField
      FieldName = 'PRODUTOSITE'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlProdutosLINKSITE: TStringField
      FieldName = 'LINKSITE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsProdutosCEST: TStringField
      FieldName = 'CEST'
      Size = 7
    end
    object cdsProdutosNCM: TStringField
      FieldName = 'NCM'
      Size = 8
    end
    object sqlProdutosCOMPOSICAO: TStringField
      DisplayLabel = 'Composi'#231#227'o'
      FieldName = 'COMPOSICAO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlProdutosVALIDADE: TStringField
      DisplayLabel = 'Validade'
      FieldName = 'VALIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlProdutosRISCOS: TStringField
      DisplayLabel = 'Riscos a Sa'#250'de'
      FieldName = 'RISCOS'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
  end
  object dtsProdutos: TDataSource
    DataSet = sqlProdutos
    Left = 912
    Top = 720
  end
  object sqlProdutos_Estruturas: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT a.EMPRESA, a.FILIAL, a.CODIGO, a.COMPONENTE, b.REDUZIDO, ' +
      'a.SEQUENCIA, a.QUANTIDADE, a.PERDA, a.OBSERVACAO, a.DATACRIACAO'#13 +
      #10'FROM PRODUTOS_ESTRUTURAS a INNER JOIN PRODUTOS b ON (b.EMPRESA ' +
      '= a.EMPRESA AND b.FILIAL = a.FILIAL AND b.CODIGO = a.COMPONENTE)' +
      #13#10'where a.EMPRESA = :EMPRESA and a.FILIAL = :FILIAL and a.CODIGO' +
      ' = :CODIGO'#13#10'order by a.EMPRESA, a.FILIAL, a.CODIGO, a.COMPONENTE' +
      ', a.SEQUENCIA'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsProdutos
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 912
    Top = 660
    object sqlProdutos_EstruturasEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlProdutos_EstruturasFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlProdutos_EstruturasCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object sqlProdutos_EstruturasCOMPONENTE: TStringField
      DisplayLabel = 'Componente'
      FieldName = 'COMPONENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object sqlProdutos_EstruturasREDUZIDO: TStringField
      DisplayLabel = 'Reduzido'
      FieldName = 'REDUZIDO'
      ProviderFlags = []
      Required = True
      Size = 30
    end
    object sqlProdutos_EstruturasSEQUENCIA: TIntegerField
      DefaultExpression = '0'
      DisplayLabel = 'Seq'
      FieldName = 'SEQUENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlProdutos_EstruturasQUANTIDADE: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object sqlProdutos_EstruturasPERDA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Perda'
      FieldName = 'PERDA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object sqlProdutos_EstruturasOBSERVACAO: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object sqlProdutos_EstruturasDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data da Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object sqlCallback: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'SELECT A.*, B.NOME AS NOMECLIENTE FROM CALLBACK A '#13#10'JOIN CLIENTE' +
      'S B ON (B.EMPRESA = :EMPRESA_CLIENTES AND B.FILIAL = :FILIAL_CLI' +
      'ENTES AND B.CODIGO = A.CLIENTE)'#13#10'WHERE A.EMPRESA = :EMPRESA AND ' +
      'A.FILIAL = :FILIAL'#13#10'ORDER BY EMPRESA, FILIAL, CODIGO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA_CLIENTES'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL_CLIENTES'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 2
      end>
    SQLConnection = SQLConnection1
    Left = 74
    Top = 816
    object StringField10: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object StringField11: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlCallbackSTATUS: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlCallbackCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlCallbackCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlCallbackNOMECLIENTE: TStringField
      FieldName = 'NOMECLIENTE'
      ProviderFlags = []
      Size = 50
    end
    object sqlCallbackNUMERO: TStringField
      DisplayLabel = 'Numero'
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCallbackRAMAL: TIntegerField
      FieldName = 'RAMAL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlCallbackDATAHORA: TSQLTimeStampField
      DisplayLabel = 'Data e Hora Liga'#231#227'o'
      FieldName = 'DATAHORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlCallbackOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object sqlCallbackDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dspCallback: TDataSetProvider
    DataSet = sqlCallback
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspCallbackBeforeUpdateRecord
    Left = 74
    Top = 864
  end
  object sqlRamais: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'SELECT A.*, B.NOME AS NOMEUSUARIO FROM RAMAIS A '#13#10'JOIN SYS_USERS' +
      ' B ON (B.CODIGO = A.USUARIO)'#13#10'WHERE A.EMPRESA = :EMPRESA AND A.F' +
      'ILIAL = :FILIAL'#13#10'ORDER BY EMPRESA, FILIAL, RAMAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 224
    Top = 816
    object StringField12: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object StringField13: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlRamaisRAMAL: TIntegerField
      DisplayLabel = 'Ramal'
      FieldName = 'RAMAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object StringField14: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlRamaisUSUARIO: TIntegerField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlRamaisNOMEUSUARIO: TStringField
      DisplayLabel = 'Nome Usu'#225'rio'
      FieldName = 'NOMEUSUARIO'
      ProviderFlags = []
      Size = 50
    end
    object SQLTimeStampField3: TSQLTimeStampField
      DisplayLabel = 'Data de Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dspRamais: TDataSetProvider
    DataSet = sqlRamais
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 224
    Top = 864
  end
  object sqlLigacoes_Passivas: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT A.*, B.NOME AS NOMECLIENTE FROM LIGACOES_PASSIVAS A '#13#10'JOI' +
      'N CLIENTES B ON (B.CODIGO = A.CODIGO AND B.EMPRESA = :EMPRESA_CL' +
      'IENTES AND B.FILIAL = :FILIAL_CLIENTES)'#13#10'WHERE A.EMPRESA = :EMPR' +
      'ESA AND A.FILIAL = :FILIAL'#13#10'ORDER BY EMPRESA, FILIAL, CODIGO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'EMPRESA_CLIENTES'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FILIAL_CLIENTES'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 377
    Top = 814
    object StringField15: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object StringField16: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlLigacoes_PassivasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlLigacoes_PassivasCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlLigacoes_PassivasNOMECLIENTE: TStringField
      FieldName = 'NOMECLIENTE'
      ProviderFlags = []
      Size = 60
    end
    object sqlLigacoes_PassivasNUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object IntegerField6: TIntegerField
      DisplayLabel = 'Ramal'
      FieldName = 'RAMAL'
      ProviderFlags = [pfInUpdate]
    end
    object sqlLigacoes_PassivasDATAHORA: TSQLTimeStampField
      FieldName = 'DATAHORA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlLigacoes_PassivasOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object SQLTimeStampField2: TSQLTimeStampField
      DisplayLabel = 'Data de Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dspLigacoes_Passivas: TDataSetProvider
    DataSet = sqlLigacoes_Passivas
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspLigacoes_PassivasBeforeUpdateRecord
    Left = 377
    Top = 862
  end
  object sqlLigacoes_Ativas: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT * FROM LIGACOES_ATIVAS WHERE EMPRESA = :EMPRESA AND FILIA' +
      'L = :FILIAL ORDER BY EMPRESA, FILIAL, CODIGO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 2
      end>
    SQLConnection = SQLConnection1
    Left = 526
    Top = 813
    object sqlLigacoes_AtivasEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlLigacoes_AtivasFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlLigacoes_AtivasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlLigacoes_AtivasCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlLigacoes_AtivasNOMECLIENTE: TStringField
      FieldName = 'NOMECLIENTE'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object sqlLigacoes_AtivasNUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlLigacoes_AtivasRAMAL: TIntegerField
      DisplayLabel = 'Ramal'
      FieldName = 'RAMAL'
      ProviderFlags = [pfInUpdate]
    end
    object sqlLigacoes_AtivasDATAHORA: TSQLTimeStampField
      FieldName = 'DATAHORA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlLigacoes_AtivasOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object sqlLigacoes_AtivasDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data de Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dspLigacoes_Ativas: TDataSetProvider
    DataSet = sqlLigacoes_Ativas
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspLigacoes_AtivasBeforeUpdateRecord
    Left = 526
    Top = 861
  end
  object dspHistorico_Contatos_Santana: TDataSetProvider
    DataSet = sqlHistorico_Contatos_Santana
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 698
    Top = 866
  end
  object sqlHistorico_Contatos_Santana: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'select * from HISTORICO_CONTATOS_SANTANA where EMPRESA = :EMPRES' +
      'A and FILIAL = :FILIAL'#13#10'order by EMPRESA, FILIAL, CLIENTE, SEQUE' +
      'NCIA'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    Left = 695
    Top = 809
    object sqlHistorico_Contatos_SantanaEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlHistorico_Contatos_SantanaFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlHistorico_Contatos_SantanaCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlHistorico_Contatos_SantanaTIPOCLIENTE: TStringField
      FieldName = 'TIPOCLIENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlHistorico_Contatos_SantanaSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlHistorico_Contatos_SantanaDATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlHistorico_Contatos_SantanaMOTIVO: TStringField
      FieldName = 'MOTIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 500
    end
    object sqlHistorico_Contatos_SantanaPROVIDENCIA: TStringField
      FieldName = 'PROVIDENCIA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 500
    end
    object sqlHistorico_Contatos_SantanaSETOR: TStringField
      FieldName = 'SETOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object sqlHistorico_Contatos_SantanaOCORRENCIA: TStringField
      FieldName = 'OCORRENCIA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object sqlHistorico_Contatos_SantanaUSUARIO: TIntegerField
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlHistorico_Contatos_SantanaOFERTA: TStringField
      FieldName = 'OFERTA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlHistorico_Contatos_SantanaCAMPANHA: TStringField
      FieldName = 'CAMPANHA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlHistorico_Contatos_SantanaTIPORETORNO: TStringField
      FieldName = 'TIPORETORNO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlHistorico_Contatos_SantanaDATARETORNO: TDateField
      FieldName = 'DATARETORNO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlHistorico_Contatos_SantanaSITUACAORETORNO: TStringField
      FieldName = 'SITUACAORETORNO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlHistorico_Contatos_SantanaDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlHistorico_Contatos_SantanaMOTIVOS: TStringField
      FieldName = 'MOTIVOS'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
  end
  object sqlProdutos_Informacoes_Compras: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'select * from PRODUTOS_INFORMACOES_COMPRAS where EMPRESA = :EMPR' +
      'ESA and FILIAL = :FILIAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    Left = 1273
    Top = 661
    object StringField17: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object StringField18: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object StringField21: TStringField
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object StringField19: TStringField
      FieldName = 'PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object StringField20: TStringField
      FieldName = 'MENSAGEM'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 500
    end
    object sqlProdutos_Informacoes_ComprasMENSAGEMFORNECEDOR: TStringField
      FieldName = 'MENSAGEMFORNECEDOR'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object DateField3: TDateField
      FieldName = 'DATACADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object IntegerField7: TIntegerField
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object SQLTimeStampField4: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dspProdutos_Informacoes_Compras: TDataSetProvider
    DataSet = sqlProdutos_Informacoes_Compras
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 1273
    Top = 713
  end
  object sqlSetores_Estoque: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'SELECT * FROM SETORES_ESTOQUE'#13#10'WHERE EMPRESA = :EMPRESA AND FILI' +
      'AL = :FILIAL'#13#10'ORDER BY EMPRESA, FILIAL, CODIGO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 2
      end>
    SQLConnection = SQLConnection1
    Left = 816
    Top = 816
    object StringField22: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object StringField23: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlSetores_EstoqueCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlSetores_EstoqueDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object sqlSetores_EstoqueRESPONSAVEL: TStringField
      DisplayLabel = 'Respons'#225'vel'
      FieldName = 'RESPONSAVEL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object sqlSetores_EstoqueDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dspSetores_Estoque: TDataSetProvider
    DataSet = sqlSetores_Estoque
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspSetores_EstoqueBeforeUpdateRecord
    Left = 816
    Top = 864
  end
  object sqlPedidos_Compras_Dados: TSQLDataSet
    SchemaName = 'SYSDBA'
    GetMetadata = False
    CommandText = 
      'SELECT * FROM PEDIDOS_COMPRAS_DADOS WHERE EMPRESA = :EMPRESA  an' +
      'd FILIAL = :FILIAL ORDER BY EMPRESA, FILIAL, NUMERO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    Left = 759
    Top = 974
    object sqlPedidos_Compras_DadosEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlPedidos_Compras_DadosFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 2
    end
    object sqlPedidos_Compras_DadosSITUACAO: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlPedidos_Compras_DadosNUMERO: TIntegerField
      DefaultExpression = '0'
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlPedidos_Compras_DadosESPECIEDOCUMENTO: TStringField
      DisplayLabel = 'Esp'#233'cie do Documento'
      FieldName = 'ESPECIEDOCUMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object sqlPedidos_Compras_DadosEMISSAO: TDateField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'EMISSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlPedidos_Compras_DadosFORNECEDOR: TIntegerField
      DefaultExpression = '0'
      DisplayLabel = 'Fornecedor'
      FieldName = 'FORNECEDOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlPedidos_Compras_DadosUF: TStringField
      FieldName = 'UF'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object sqlPedidos_Compras_DadosCONDICAOPAGAMENTO: TIntegerField
      DisplayLabel = 'Condi'#231#227'o Pagamento'
      FieldName = 'CONDICAOPAGAMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = '0'
    end
    object sqlPedidos_Compras_DadosFORMAPAGAMENTO: TStringField
      DisplayLabel = 'Forma Pagamento'
      FieldName = 'FORMAPAGAMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlPedidos_Compras_DadosMOEDA: TStringField
      DisplayLabel = 'Moeda'
      FieldName = 'MOEDA'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object sqlPedidos_Compras_DadosTAXA: TFloatField
      DisplayLabel = 'Taxa Moeda'
      FieldName = 'TAXA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlPedidos_Compras_DadosTIPOPRECO: TStringField
      DisplayLabel = 'Tipo Pre'#231'o'
      FieldName = 'TIPOPRECO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object sqlPedidos_Compras_DadosFILIALENTREGA: TStringField
      DisplayLabel = 'Filial Entrega'
      FieldName = 'FILIALENTREGA'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 2
    end
    object sqlPedidos_Compras_DadosTABELA: TIntegerField
      DisplayLabel = 'Tabela'
      FieldName = 'TABELA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlPedidos_Compras_DadosVALORMERCADORIAS: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor Mercadorias'
      FieldName = 'VALORMERCADORIAS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosDESCONTO: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Desconto'
      FieldName = 'DESCONTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object sqlPedidos_Compras_DadosVALORDESCONTO: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor Desconto'
      FieldName = 'VALORDESCONTO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosTIPOFRETE: TStringField
      DisplayLabel = 'Tipo Frete'
      FieldName = 'TIPOFRETE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object sqlPedidos_Compras_DadosVALORFRETE: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor Frete'
      FieldName = 'VALORFRETE'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosVALORSEGURO: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor Seguro'
      FieldName = 'VALORSEGURO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosVALORDESPESAS: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor Despesas'
      FieldName = 'VALORDESPESAS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosVALORFINANCEIRO: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor Financeiro'
      FieldName = 'VALORFINANCEIRO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosVALORBRUTO: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor Bruto'
      FieldName = 'VALORBRUTO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosVALORLIQUIDO: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor L'#237'quido'
      FieldName = 'VALORLIQUIDO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosVALORMOEDA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor Moeda'
      FieldName = 'VALORMOEDA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '$ #0.00######'
      EditFormat = '0.00000000'
    end
    object sqlPedidos_Compras_DadosBASEIPI: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base IPI'
      FieldName = 'BASEIPI'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosVALORIPI: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor IPI'
      FieldName = 'VALORIPI'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosBASEICMS: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base ICMS'
      FieldName = 'BASEICMS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosVALORICMS: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor ICMS'
      FieldName = 'VALORICMS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosBASEICMSST: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base ICMS - ST'
      FieldName = 'BASEICMSST'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosVALORICMSST: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor ICMS - ST'
      FieldName = 'VALORICMSST'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosBASEISSA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base ISS - Apur.'
      FieldName = 'BASEISSA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosVALORISSA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor ISS - Apur.'
      FieldName = 'VALORISSA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosBASEISSR: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base ISS - Ret.'
      FieldName = 'BASEISSR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosVALORISSR: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor ISS - Ret.'
      FieldName = 'VALORISSR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosBASEPISA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base PIS - Apur.'
      FieldName = 'BASEPISA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosVALORPISA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor PIS - Apur.'
      FieldName = 'VALORPISA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosBASEPISR: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base PIS - Ret.'
      FieldName = 'BASEPISR'
      currency = True
    end
    object sqlPedidos_Compras_DadosVALORPISR: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor PIS - Ret.'
      FieldName = 'VALORPISR'
      currency = True
    end
    object sqlPedidos_Compras_DadosBASECOFINSA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base COFINS - Apur.'
      FieldName = 'BASECOFINSA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosVALORCOFINSA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor COFINS - Apur.'
      FieldName = 'VALORCOFINSA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosBASECOFINSR: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base COFINS - Ret.'
      FieldName = 'BASECOFINSR'
      currency = True
    end
    object sqlPedidos_Compras_DadosVALORCOFINSR: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor COFINS - Ret.'
      FieldName = 'VALORCOFINSR'
      currency = True
    end
    object sqlPedidos_Compras_DadosBASECSLLR: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base CSLL - Ret.'
      FieldName = 'BASECSLLR'
      currency = True
    end
    object sqlPedidos_Compras_DadosVALORCSLLR: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor CSLL - Ret.'
      FieldName = 'VALORCSLLR'
      currency = True
    end
    object sqlPedidos_Compras_DadosBASEIRRFA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base IRRF - Apur.'
      FieldName = 'BASEIRRFA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosVALORIRRFA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor IRRF - Apur.'
      FieldName = 'VALORIRRFA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosBASEIRRFR: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base IRRF - Ret.'
      FieldName = 'BASEIRRFR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosVALORIRRFR: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor IRRF - Ret.'
      FieldName = 'VALORIRRFR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosBASEINSSA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base INSS - Apur.'
      FieldName = 'BASEINSSA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosVALORINSSA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor INSS - Apur.'
      FieldName = 'VALORINSSA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosBASEINSSR: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base INSS - Ret.'
      FieldName = 'BASEINSSR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosVALORINSSR: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor INSS - Ret.'
      FieldName = 'VALORINSSR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosBASEFGTS: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base FGTS'
      FieldName = 'BASEFGTS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosVALORFGTS: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor FGTS'
      FieldName = 'VALORFGTS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosBASEII: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base II'
      FieldName = 'BASEII'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosVALORII: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor II'
      FieldName = 'VALORII'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosVALIDADE: TDateField
      DisplayLabel = 'Validade'
      FieldName = 'VALIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object sqlPedidos_Compras_DadosULTIMAENTRADA: TDateField
      DisplayLabel = #218'ltima Entrada'
      FieldName = 'ULTIMAENTRADA'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/0000;1;_'
    end
    object sqlPedidos_Compras_DadosULTIMOPREFIXO: TStringField
      DisplayLabel = #218'ltimo Prefixo'
      FieldName = 'ULTIMOPREFIXO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object sqlPedidos_Compras_DadosULTIMANOTA: TIntegerField
      DisplayLabel = #218'ltima Nota'
      FieldName = 'ULTIMANOTA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlPedidos_Compras_DadosOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 256
    end
    object sqlPedidos_Compras_DadosBASETRIBUTOS: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base Tributos'
      FieldName = 'BASETRIBUTOS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosVALORTRIBUTOS: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor Tributos'
      FieldName = 'VALORTRIBUTOS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_DadosDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data da Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
  end
  object dtsPedidos_Compras_Dados: TDataSource
    DataSet = sqlPedidos_Compras_Dados
    Left = 908
    Top = 973
  end
  object sqlPedidos_Compras_Itens: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT  * FROM PEDIDOS_COMPRAS_ITENS'#13#10'WHERE EMPRESA = :EMPRESA a' +
      'nd FILIAL = :FILIAL and NUMERO = :NUMERO ORDER BY EMPRESA, FILIA' +
      'L, NUMERO, ITEM'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsPedidos_Compras_Dados
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 3
      end
      item
        DataType = ftFixedChar
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 3
      end
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = SQLConnection1
    Left = 909
    Top = 1023
    object sqlPedidos_Compras_ItensEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlPedidos_Compras_ItensFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 2
    end
    object sqlPedidos_Compras_ItensNUMERO: TIntegerField
      DefaultExpression = '0'
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlPedidos_Compras_ItensITEM: TIntegerField
      DefaultExpression = '0'
      DisplayLabel = 'Item'
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0000'
      EditFormat = '0000'
    end
    object sqlPedidos_Compras_ItensPRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'PRODUTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 15
    end
    object sqlPedidos_Compras_ItensDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
    object sqlPedidos_Compras_ItensPRIMEIRAUNIDADE: TStringField
      DisplayLabel = '1a UM'
      FieldName = 'PRIMEIRAUNIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object sqlPedidos_Compras_ItensLOCAL: TStringField
      DisplayLabel = 'Local'
      FieldName = 'LOCAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object sqlPedidos_Compras_ItensQUANTIDADE: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object sqlPedidos_Compras_ItensUNITARIO: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Unit'#225'rio'
      FieldName = 'UNITARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlPedidos_Compras_ItensUNITARIOMOEDA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Unit'#225'rio Moeda'
      FieldName = 'UNITARIOMOEDA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlPedidos_Compras_ItensTOTAL: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensTOTALMOEDA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Total Moeda'
      FieldName = 'TOTALMOEDA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '$ #0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlPedidos_Compras_ItensDESCONTO: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Desconto'
      FieldName = 'DESCONTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object sqlPedidos_Compras_ItensVALORDESCONTO: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor Desconto'
      FieldName = 'VALORDESCONTO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensVALORDESPESAS: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor Despesas'
      FieldName = 'VALORDESPESAS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensVALORFRETE: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor Frete'
      FieldName = 'VALORFRETE'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensVALORSEGURO: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor Seguro'
      FieldName = 'VALORSEGURO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensVALORFINANCEIRO: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor Financeiro'
      FieldName = 'VALORFINANCEIRO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensVALORBRUTO: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor Bruto'
      FieldName = 'VALORBRUTO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensVALORLIQUIDO: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor L'#237'quido'
      FieldName = 'VALORLIQUIDO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensPRECOLISTA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Lista'
      FieldName = 'PRECOLISTA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'R$ #0.00000000'
      EditFormat = '0.00000000'
    end
    object sqlPedidos_Compras_ItensENTREGA: TDateField
      DisplayLabel = 'Entrega'
      FieldName = 'ENTREGA'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/0000;1;_'
    end
    object sqlPedidos_Compras_ItensREGRA: TIntegerField
      DisplayLabel = 'Regra'
      FieldName = 'REGRA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlPedidos_Compras_ItensCODIGOFISCAL: TStringField
      DisplayLabel = 'CFOP'
      FieldName = 'CODIGOFISCAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 4
    end
    object sqlPedidos_Compras_ItensCLASSIFICACAOFISCAL: TStringField
      DisplayLabel = 'CF'
      DisplayWidth = 2
      FieldName = 'CLASSIFICACAOFISCAL'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlPedidos_Compras_ItensIPI: TFloatField
      DefaultExpression = '0'
      FieldName = 'IPI'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object sqlPedidos_Compras_ItensBASEIPI: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base IPI'
      FieldName = 'BASEIPI'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensVALORIPI: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor IPI'
      FieldName = 'VALORIPI'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensCSTIPI: TStringField
      DisplayLabel = 'CST IPI'
      FieldName = 'CSTIPI'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlPedidos_Compras_ItensBASEICMS: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base ICMS'
      FieldName = 'BASEICMS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensICMS: TFloatField
      DefaultExpression = '0'
      FieldName = 'ICMS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object sqlPedidos_Compras_ItensVALORICMS: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor ICMS'
      FieldName = 'VALORICMS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensCSTICMS: TStringField
      DisplayLabel = 'CST ICMS'
      FieldName = 'CSTICMS'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlPedidos_Compras_ItensORIGEMST: TStringField
      DisplayLabel = 'Origem ST'
      FieldName = 'ORIGEMST'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlPedidos_Compras_ItensMARGEMLUCRO: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'ML%'
      FieldName = 'MARGEMLUCRO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object sqlPedidos_Compras_ItensBASEICMSST: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base ICMS - ST'
      FieldName = 'BASEICMSST'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensVALORICMSST: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor ICMS - ST'
      FieldName = 'VALORICMSST'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensISS: TFloatField
      DefaultExpression = '0'
      FieldName = 'ISS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object sqlPedidos_Compras_ItensBASEISSA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base ISS - Apur.'
      FieldName = 'BASEISSA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensVALORISSA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor ISS - Apur.'
      FieldName = 'VALORISSA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensBASEISSR: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base ISS - Ret.'
      FieldName = 'BASEISSR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensVALORISSR: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor ISS - Ret.'
      FieldName = 'VALORISSR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensPISA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'PIS - Apur.'
      FieldName = 'PISA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object sqlPedidos_Compras_ItensBASEPISA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base PIS - Apur.'
      FieldName = 'BASEPISA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensVALORPISA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor PIS - Apur.'
      FieldName = 'VALORPISA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensPISR: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'PIS - Ret.'
      FieldName = 'PISR'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object sqlPedidos_Compras_ItensBASEPISR: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base PIS - Ret.'
      FieldName = 'BASEPISR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensVALORPISR: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor PIS - Ret.'
      FieldName = 'VALORPISR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensCOFINSA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'COFINS - Apur.'
      DisplayWidth = 10
      FieldName = 'COFINSA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object sqlPedidos_Compras_ItensBASECOFINSA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base COFINS - Apur.'
      FieldName = 'BASECOFINSA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensVALORCOFINSA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor COFINS - Apur.'
      FieldName = 'VALORCOFINSA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensCOFINSR: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'COFINS - Ret.'
      FieldName = 'COFINSR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlPedidos_Compras_ItensBASECOFINSR: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base COFINS - Ret.'
      FieldName = 'BASECOFINSR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensVALORCOFINSR: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor COFINS - Ret.'
      FieldName = 'VALORCOFINSR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensCSLLR: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'CSLL - Ret.'
      FieldName = 'CSLLR'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object sqlPedidos_Compras_ItensBASECSLLR: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base CSLL - Ret.'
      FieldName = 'BASECSLLR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensVALORCSLLR: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor CSLL - Ret.'
      FieldName = 'VALORCSLLR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensIRRF: TFloatField
      DefaultExpression = '0'
      FieldName = 'IRRF'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object sqlPedidos_Compras_ItensBASEIRRFA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base IRRF - Apur.'
      FieldName = 'BASEIRRFA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensVALORIRRFA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor IRRF - Apur.'
      FieldName = 'VALORIRRFA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensBASEIRRFR: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base IRRF - Ret.'
      FieldName = 'BASEIRRFR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensVALORIRRFR: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor IRRF - Ret.'
      FieldName = 'VALORIRRFR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensINSS: TFloatField
      DefaultExpression = '0'
      FieldName = 'INSS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object sqlPedidos_Compras_ItensBASEINSSA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base INSS - Apur.'
      FieldName = 'BASEINSSA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensVALORINSSA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor INSS - Apur.'
      FieldName = 'VALORINSSA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensBASEINSSR: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base INSS - Ret.'
      FieldName = 'BASEINSSR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensVALORINSSR: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor INSS - Ret.'
      FieldName = 'VALORINSSR'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensBASEFGTS: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base FGTS'
      FieldName = 'BASEFGTS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensVALORFGTS: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor FGTS'
      FieldName = 'VALORFGTS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensII: TFloatField
      DefaultExpression = '0'
      FieldName = 'II'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object sqlPedidos_Compras_ItensBASEII: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base II'
      FieldName = 'BASEII'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensVALORII: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor II'
      FieldName = 'VALORII'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensNUMEROSC: TIntegerField
      DisplayLabel = 'N'#250'mero SC'
      FieldName = 'NUMEROSC'
      ProviderFlags = [pfInUpdate]
    end
    object sqlPedidos_Compras_ItensITEMSC: TIntegerField
      DisplayLabel = 'Item SC'
      FieldName = 'ITEMSC'
      ProviderFlags = [pfInUpdate]
    end
    object sqlPedidos_Compras_ItensENTREGUE: TFloatField
      DisplayLabel = 'Entregue'
      FieldName = 'ENTREGUE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object sqlPedidos_Compras_ItensELIMINADO: TFloatField
      DisplayLabel = 'Eliminado'
      FieldName = 'ELIMINADO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object sqlPedidos_Compras_ItensORIGEMPRODUTO: TStringField
      DisplayLabel = 'Origem Produto'
      FieldName = 'ORIGEMPRODUTO'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object sqlPedidos_Compras_ItensMARCAPRODUTO: TStringField
      DisplayLabel = 'Marca Produto'
      FieldName = 'MARCAPRODUTO'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object sqlPedidos_Compras_ItensNUMEROIMPORTACAO: TStringField
      DisplayLabel = 'N'#250'mero Importa'#231#227'o'
      FieldName = 'NUMEROIMPORTACAO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object sqlPedidos_Compras_ItensTRIBUTOS: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Tributos'
      FieldName = 'TRIBUTOS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object sqlPedidos_Compras_ItensBASETRIBUTOS: TFloatField
      DisplayLabel = 'Base Tributos'
      FieldName = 'BASETRIBUTOS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensVALORTRIBUTOS: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor Tributos'
      FieldName = 'VALORTRIBUTOS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlPedidos_Compras_ItensADICIONAIS: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Adicionais'
      FieldName = 'ADICIONAIS'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object sqlPedidos_Compras_ItensDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data da Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
  end
  object dspPedidos_Compras_Dados: TDataSetProvider
    DataSet = sqlPedidos_Compras_Dados
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspPedidos_Compras_DadosBeforeUpdateRecord
    BeforeApplyUpdates = dspPedidos_Compras_DadosBeforeApplyUpdates
    AfterApplyUpdates = dspPedidos_Compras_DadosAfterApplyUpdates
    Left = 763
    Top = 1027
  end
  object dspVendedores_Grupos: TDataSetProvider
    DataSet = sqlVendedores_Grupos
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspVendedores_GruposBeforeUpdateRecord
    Left = 621
    Top = 712
  end
  object sqlVendedores_Grupos: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'select * from VENDEDORES_GRUPOS where EMPRESA = :EMPRESA and FIL' +
      'IAL = :FILIAL order by EMPRESA, FILIAL, CODIGO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 617
    Top = 660
    object StringField24: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object StringField25: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 2
    end
    object IntegerField8: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField26: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object sqlVendedores_GruposEMAILLIDER: TStringField
      DisplayLabel = 'Email L'#237'der'
      FieldName = 'EMAILLIDER'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object SQLTimeStampField5: TSQLTimeStampField
      DisplayLabel = 'Data da Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object sqlVendedores: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'select * from VENDEDORES where EMPRESA = :EMPRESA and FILIAL = :' +
      'FILIAL order by EMPRESA, FILIAL, CODIGO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1028
    Top = 515
    object sqlVendedoresEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlVendedoresFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 2
    end
    object sqlVendedoresSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlVendedoresCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlVendedoresDATACADASTRO: TDateField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATACADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object sqlVendedoresNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
    object sqlVendedoresENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
    object sqlVendedoresPESSOA: TStringField
      DisplayLabel = 'Pessoa F'#237'sica/Jur'#237'dica'
      FieldName = 'PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlVendedoresREDUZIDO: TStringField
      DisplayLabel = 'Nome Reduzido'
      FieldName = 'REDUZIDO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object sqlVendedoresCNPJ: TStringField
      FieldName = 'CNPJ'
      ProviderFlags = [pfInUpdate]
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
    object sqlVendedoresCPF: TStringField
      FieldName = 'CPF'
      ProviderFlags = [pfInUpdate]
      EditMask = '999.999.999-99;0;_'
      Size = 11
    end
    object sqlVendedoresIE: TStringField
      DisplayLabel = 'Inscri'#231#227'o Estadual'
      FieldName = 'IE'
      ProviderFlags = [pfInUpdate]
      Size = 22
    end
    object sqlVendedoresIM: TStringField
      DisplayLabel = 'Inscri'#231#227'o Municipal'
      FieldName = 'IM'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
    object sqlVendedoresRG: TStringField
      FieldName = 'RG'
      ProviderFlags = [pfInUpdate]
      EditMask = '99.999.999-aa;0;_'
      Size = 11
    end
    object sqlVendedoresNUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      DisplayWidth = 5
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 5
    end
    object sqlVendedoresCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object sqlVendedoresUF: TStringField
      FieldName = 'UF'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlVendedoresMUNICIPIO: TStringField
      DisplayLabel = 'Municipio'
      FieldName = 'MUNICIPIO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object sqlVendedoresCMUNICIPIO: TStringField
      DisplayLabel = 'C'#243'digo Munic'#237'pio'
      DisplayWidth = 7
      FieldName = 'CMUNICIPIO'
      ProviderFlags = [pfInUpdate]
      Size = 7
    end
    object sqlVendedoresBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object sqlVendedoresCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      EditMask = '99999-999;0;_'
      Size = 30
    end
    object sqlVendedoresEMAIL: TStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object sqlVendedoresHOMEPAGE: TStringField
      DisplayLabel = 'Home Page'
      FieldName = 'HOMEPAGE'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object sqlVendedoresDATANASCIMENTO: TDateField
      DisplayLabel = 'Data Nascimento'
      FieldName = 'DATANASCIMENTO'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/0000;1;_'
    end
    object sqlVendedoresDDI: TStringField
      FieldName = 'DDI'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object sqlVendedoresDDD: TStringField
      FieldName = 'DDD'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object sqlVendedoresTELEFONE: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
      ProviderFlags = [pfInUpdate]
      EditMask = '90000-0009;0;_'
      Size = 9
    end
    object sqlVendedoresFAX: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
      ProviderFlags = [pfInUpdate]
      EditMask = '90000-0009;0;_'
      Size = 9
    end
    object sqlVendedoresCELULAR: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Celular'
      FieldName = 'CELULAR'
      ProviderFlags = [pfInUpdate]
      EditMask = '90000-0009;0;_'
      Size = 9
    end
    object sqlVendedoresCONTATO: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'CONTATO'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object sqlVendedoresBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlVendedoresAGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'AGENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object sqlVendedoresCONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'CONTA'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object sqlVendedoresDATAADMISSAO: TDateField
      DisplayLabel = 'Data Admiss'#227'o'
      FieldName = 'DATAADMISSAO'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/0000;1;_'
    end
    object sqlVendedoresUSUARIO: TIntegerField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlVendedoresTIPOCOMISSAO: TStringField
      DisplayLabel = 'Tipo Comiss'#227'o'
      FieldName = 'TIPOCOMISSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlVendedoresCOMISSAO: TFloatField
      DisplayLabel = 'Comiss'#227'o'
      FieldName = 'COMISSAO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.0000%'
      EditFormat = '0.0000'
    end
    object sqlVendedoresCOMISSAOEMISSAO: TFloatField
      DisplayLabel = '%Emiss'#227'o'
      FieldName = 'COMISSAOEMISSAO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.0000%'
      EditFormat = '0.0000'
    end
    object sqlVendedoresCOMISSAOBAIXA: TFloatField
      DisplayLabel = '%Baixa'
      FieldName = 'COMISSAOBAIXA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.0000%'
      EditFormat = '0.0000'
    end
    object sqlVendedoresCONSIDERADESPESAS: TStringField
      DisplayLabel = 'Considera Despesas'
      FieldName = 'CONSIDERADESPESAS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlVendedoresCONSIDERAFRETE: TStringField
      DisplayLabel = 'Considera Frete'
      FieldName = 'CONSIDERAFRETE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlVendedoresCONSIDERASEGURO: TStringField
      DisplayLabel = 'Considera Seguro'
      FieldName = 'CONSIDERASEGURO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlVendedoresCONSIDERADESCONTO: TStringField
      DisplayLabel = 'Considera Desconto'
      FieldName = 'CONSIDERADESCONTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlVendedoresCONSIDERAIPI: TStringField
      DisplayLabel = 'Considera IPI'
      FieldName = 'CONSIDERAIPI'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlVendedoresCONSIDERAICMS: TStringField
      DisplayLabel = 'Considera ICMS'
      FieldName = 'CONSIDERAICMS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlVendedoresCONSIDERAICMSST: TStringField
      DisplayLabel = 'Considera ICMS ST'
      FieldName = 'CONSIDERAICMSST'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlVendedoresCONSIDERAISS: TStringField
      DisplayLabel = 'Considera ISS'
      FieldName = 'CONSIDERAISS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlVendedoresDIAPAGAMENTO: TIntegerField
      DisplayLabel = 'Dia de Pagamento'
      FieldName = 'DIAPAGAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlVendedoresBASEPAGAMENTO: TStringField
      DisplayLabel = 'Base Pagamento'
      FieldName = 'BASEPAGAMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlVendedoresOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object sqlVendedoresGRUPO: TIntegerField
      DisplayLabel = 'Grupo - Faixa Comiss'#227'o'
      FieldName = 'GRUPO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlVendedoresFAIXA: TIntegerField
      DisplayLabel = 'Faixa'
      FieldName = 'FAIXA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlVendedoresFORNECEDOR: TIntegerField
      DisplayLabel = 'Fornecedor'
      FieldName = 'FORNECEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlVendedoresHABILITAPRECOS: TStringField
      DisplayLabel = 'Habilita Pre'#231'os'
      FieldName = 'HABILITAPRECOS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlVendedoresUSASFA: TStringField
      DefaultExpression = #39'1'#39
      DisplayLabel = 'Usa SFA?'
      FieldName = 'USASFA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlVendedoresEMAILMETA: TStringField
      DisplayLabel = 'Email Meta'
      FieldName = 'EMAILMETA'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlVendedoresNOTIFICAMETA: TStringField
      DefaultExpression = #39'0'#39
      DisplayLabel = 'Notifica Meta?'
      FieldName = 'NOTIFICAMETA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlVendedoresDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data da Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlVendedoresCOMISSAOESPECIAL1: TFloatField
      FieldName = 'COMISSAOESPECIAL1'
      ProviderFlags = [pfInUpdate]
    end
    object sqlVendedoresCOMISSAOESPECIAL2: TFloatField
      FieldName = 'COMISSAOESPECIAL2'
      ProviderFlags = [pfInUpdate]
    end
    object sqlVendedoresCOMISSAOESPECIAL3: TFloatField
      FieldName = 'COMISSAOESPECIAL3'
      ProviderFlags = [pfInUpdate]
    end
    object sqlVendedoresSALARIOMINIMO: TFloatField
      FieldName = 'SALARIOMINIMO'
    end
    object sqlVendedoresFUNCAO: TStringField
      DisplayLabel = 'Fun'#231#227'o'
      FieldName = 'FUNCAO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object dspVendedores: TDataSetProvider
    DataSet = sqlVendedores
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspVendedoresBeforeUpdateRecord
    AfterApplyUpdates = dspVendedoresAfterApplyUpdates
    Left = 1028
    Top = 572
  end
  object dtsVendedores_Contatos: TDataSource
    DataSet = sqlVendedores
    Left = 1129
    Top = 516
  end
  object sqlVendedores_Contatos: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'select * from VENDEDORES_CONTATOS where EMPRESA = :EMPRESA and F' +
      'ILIAL = :FILIAL and CODIGO = :CODIGO order by EMPRESA, FILIAL, C' +
      'ODIGO, ITEM'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsVendedores_Contatos
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 3
      end
      item
        DataType = ftFixedChar
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 3
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = SQLConnection1
    Left = 1129
    Top = 571
    object sqlVendedores_ContatosEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlVendedores_ContatosFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 2
    end
    object sqlVendedores_ContatosCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlVendedores_ContatosITEM: TIntegerField
      DisplayLabel = 'Item'
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0000'
    end
    object sqlVendedores_ContatosNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 60
    end
    object sqlVendedores_ContatosAREA: TStringField
      DisplayLabel = #193'rea'
      FieldName = 'AREA'
      Size = 25
    end
    object sqlVendedores_ContatosCARGO: TStringField
      DisplayLabel = 'Cargo'
      FieldName = 'CARGO'
      Size = 25
    end
    object sqlVendedores_ContatosDDI: TStringField
      FieldName = 'DDI'
      Size = 3
    end
    object sqlVendedores_ContatosDDD: TStringField
      FieldName = 'DDD'
      Size = 3
    end
    object sqlVendedores_ContatosNUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      Required = True
      EditMask = '90000-0009;0;_'
      Size = 8
    end
    object sqlVendedores_ContatosRAMAL: TStringField
      DisplayLabel = 'Ramal'
      FieldName = 'RAMAL'
      Size = 4
    end
    object sqlVendedores_ContatosTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      Size = 1
    end
    object sqlVendedores_ContatosEMAIL: TStringField
      DisplayLabel = 'EMail'
      FieldName = 'EMAIL'
      Size = 60
    end
    object sqlVendedores_ContatosDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      Required = True
    end
  end
  object dtsVendedores_Clientes: TDataSource
    DataSet = sqlVendedores
    Left = 1253
    Top = 516
  end
  object sqlVendedores_Clientes: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'select * from VENDEDORES_CLIENTES where EMPRESA = :EMPRESA and F' +
      'ILIAL = :FILIAL and '#13#10'CODIGO = :CODIGO order by EMPRESA,FILIAL, ' +
      'CODIGO, CLIENTE'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsVendedores_Clientes
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 3
      end
      item
        DataType = ftFixedChar
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 3
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = SQLConnection1
    Left = 1253
    Top = 571
    object sqlVendedores_ClientesEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlVendedores_ClientesFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 2
    end
    object sqlVendedores_ClientesCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlVendedores_ClientesCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlVendedores_ClientesDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
  end
  object sqlSolicitacoes_Semicondutores: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'select * from SOLICITACOES_SEMICONDUTORES where EMPRESA = :EMPRE' +
      'SA and FILIAL = :FILIAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 2
      end>
    SQLConnection = SQLConnection1
    Left = 88
    Top = 975
    object StringField27: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object StringField28: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlSolicitacoes_SemicondutoresNUMERO: TIntegerField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlSolicitacoes_SemicondutoresSITUACAO: TStringField
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlSolicitacoes_SemicondutoresTIPO: TStringField
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object sqlSolicitacoes_SemicondutoresPRODUTO: TStringField
      FieldName = 'PRODUTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 15
    end
    object sqlSolicitacoes_SemicondutoresDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object sqlSolicitacoes_SemicondutoresPEDIDO: TIntegerField
      FieldName = 'PEDIDO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlSolicitacoes_SemicondutoresQUANTIDADEPEDIDO: TFloatField
      FieldName = 'QUANTIDADEPEDIDO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlSolicitacoes_SemicondutoresUSUARIOPEDIDO: TStringField
      FieldName = 'USUARIOPEDIDO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object SQLTimeStampField6: TSQLTimeStampField
      DisplayLabel = 'Data Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dspSolicitacoes_Semicondutores: TDataSetProvider
    DataSet = sqlSolicitacoes_Semicondutores
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspSolicitacoes_SemicondutoresBeforeUpdateRecord
    Left = 88
    Top = 1023
  end
  object sqlProdutos_Solicitacoes: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'select * from PRODUTOS where EMPRESA = :EMPRESA and FILIAL = :FI' +
      'LIAL order by EMPRESA, FILIAL, CODIGO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 282
    Top = 971
    object StringField31: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object StringField32: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object StringField33: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 240
    end
  end
  object dspProdutos_Solicitacoes: TDataSetProvider
    DataSet = sqlProdutos_Solicitacoes
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 282
    Top = 1023
  end
  object sqlMovimentos_Semicondutores: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT A.*, B.DESCRICAO AS DESCRICAOPRODUTO FROM MOVIMENTOS_SEMI' +
      'CONDUTORES A JOIN PRODUTOS B ON (B.EMPRESA = :EMPRESA_PRODUTOS A' +
      'ND B.FILIAL = :FILIAL_PRODUTOS AND B.CODIGO = A.PRODUTO) WHERE A' +
      '.EMPRESA = :EMPRESA AND A.FILIAL = :FILIAL ORDER BY A.EMPRESA, A' +
      '.FILIAL, A.REGRA, A.EMISSAO, A.PRODUTO, A.DOCUMENTO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'EMPRESA_PRODUTOS'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FILIAL_PRODUTOS'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 88
    Top = 1136
    object sqlMovimentos_SemicondutoresEMPRESA: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlMovimentos_SemicondutoresFILIAL: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlMovimentos_SemicondutoresREGRA: TIntegerField
      DefaultExpression = '0'
      DisplayLabel = 'Regra'
      FieldName = 'REGRA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlMovimentos_SemicondutoresEMISSAO: TDateField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'EMISSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object sqlMovimentos_SemicondutoresPRODUTO: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Produto'
      FieldName = 'PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object sqlMovimentos_SemicondutoresDESCRICAOPRODUTO: TStringField
      FieldName = 'DESCRICAOPRODUTO'
      ProviderFlags = []
      Size = 100
    end
    object sqlMovimentos_SemicondutoresDOCUMENTO: TIntegerField
      DefaultExpression = '0'
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlMovimentos_SemicondutoresQUANTIDADE: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object sqlMovimentos_SemicondutoresOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 512
    end
    object sqlMovimentos_SemicondutoresDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data da Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dspMovimentos_Semicondutores: TDataSetProvider
    DataSet = sqlMovimentos_Semicondutores
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspMovimentos_SemicondutoresBeforeUpdateRecord
    Left = 88
    Top = 1192
  end
  object sqlSaldos_Semicondutores: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'SELECT A.*, B.DESCRICAO AS DESCRICAOPRODUTO FROM SALDOS_SEMICOND' +
      'UTORES A JOIN PRODUTOS B ON (B.EMPRESA = :EMPRESA_PRODUTOS AND B' +
      '.FILIAL = :FILIAL_PRODUTOS AND B.CODIGO = A.PRODUTO) WHERE A.EMP' +
      'RESA = :EMPRESA AND A.FILIAL = :FILIAL ORDER BY A.EMPRESA, A.FIL' +
      'IAL, A.PRODUTO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA_PRODUTOS'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL_PRODUTOS'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 2
      end>
    SQLConnection = SQLConnection1
    Left = 304
    Top = 1144
    object StringField29: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object StringField30: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object StringField34: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Produto'
      FieldName = 'PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object sqlSaldos_SemicondutoresDESCRICAOPRODUTO: TStringField
      FieldName = 'DESCRICAOPRODUTO'
      ProviderFlags = []
      Size = 100
    end
    object sqlSaldos_SemicondutoresSALDO: TFloatField
      FieldName = 'SALDO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object SQLTimeStampField7: TSQLTimeStampField
      DisplayLabel = 'Data da Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dspSaldos_Semicondutores: TDataSetProvider
    DataSet = sqlSaldos_Semicondutores
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspMovimentos_SemicondutoresBeforeUpdateRecord
    Left = 304
    Top = 1200
  end
  object sqlClassificacao_Fiscal: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    ObjectView = True
    CommandText = 
      'SELECT * FROM CLASSIFICACAO_FISCAL WHERE EMPRESA = :EMPRESA AND ' +
      'FILIAL = :FILIAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 2
      end>
    SQLConnection = SQLConnection1
    Left = 1090
    Top = 1024
    object sqlClassificacao_FiscalEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlClassificacao_FiscalFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlClassificacao_FiscalCF: TStringField
      FieldName = 'CF'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlClassificacao_FiscalCRITERIO: TStringField
      DisplayLabel = 'Crit'#233'rio'
      FieldName = 'CRITERIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlClassificacao_FiscalDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object sqlClassificacao_FiscalOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object sqlClassificacao_FiscalDATACADASTRO: TDateField
      DisplayLabel = 'Data de Cadastro'
      FieldName = 'DATACADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClassificacao_FiscalDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data de Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClassificacao_FiscalCAMEX: TStringField
      DisplayLabel = 'Camex?'
      FieldName = 'CAMEX'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object dspClassificacao_Fiscal: TDataSetProvider
    DataSet = sqlClassificacao_Fiscal
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 1086
    Top = 1068
  end
  object dtsClassificacao_Fiscal: TDataSource
    DataSet = sqlClassificacao_Fiscal
    Left = 1202
    Top = 1024
  end
  object sqlClassificacao_Fiscal_Ufs: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    ObjectView = True
    CommandText = 
      'SELECT * FROM CLASSIFICACAO_FISCAL_UFS WHERE EMPRESA = :EMPRESA ' +
      'AND FILIAL = :FILIAL AND CF = :CF AND CRITERIO = :CRITERIO'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsClassificacao_Fiscal
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'CF'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'CRITERIO'
        ParamType = ptInput
        Size = 2
      end>
    SQLConnection = SQLConnection1
    Left = 1330
    Top = 1024
    object sqlClassificacao_Fiscal_UfsEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlClassificacao_Fiscal_UfsFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlClassificacao_Fiscal_UfsCF: TStringField
      FieldName = 'CF'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlClassificacao_Fiscal_UfsCRITERIO: TStringField
      DisplayLabel = 'Crit'#233'rio'
      FieldName = 'CRITERIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlClassificacao_Fiscal_UfsUF: TStringField
      FieldName = 'UF'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlClassificacao_Fiscal_UfsIVA: TFloatField
      FieldName = 'IVA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClassificacao_Fiscal_UfsDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data de Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClassificacao_Fiscal_UfsTEMREDUCAO: TStringField
      DisplayLabel = 'Redu'#231#227'o?'
      FieldName = 'TEMREDUCAO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object sqlCF_Historico: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    ObjectView = True
    CommandText = 
      'SELECT * FROM CLASSIFICACAO_FISCAL_HISTORICO WHERE EMPRESA = :EM' +
      'PRESA AND FILIAL = :FILIAL AND CF = :CF AND CRITERIO = :CRITERIO'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsClassificacao_Fiscal
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'CF'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'CRITERIO'
        ParamType = ptInput
        Size = 2
      end>
    SQLConnection = SQLConnection1
    Left = 1202
    Top = 1072
    object sqlCF_HistoricoEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlCF_HistoricoFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlCF_HistoricoCF: TStringField
      FieldName = 'CF'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlCF_HistoricoCRITERIO: TStringField
      FieldName = 'CRITERIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlCF_HistoricoSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlCF_HistoricoUSUARIO: TIntegerField
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlCF_HistoricoALTERACAO: TStringField
      FieldName = 'ALTERACAO'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object sqlCF_HistoricoDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object sqlClientes: TSQLDataSet
    CommandText = 
      'select * from CLIENTES '#13#10'where EMPRESA = :EMPRESA and FILIAL = :' +
      'FILIAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1000
    Top = 792
    object sqlClientesEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlClientesFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlClientesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlClientesSTATUS: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlClientesDATACADASTRO: TDateField
      FieldName = 'DATACADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlClientesNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 80
    end
    object sqlClientesPESSOA: TStringField
      FieldName = 'PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlClientesREDUZIDO: TStringField
      FieldName = 'REDUZIDO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 90
    end
    object sqlClientesENDERECO: TStringField
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 90
    end
    object sqlClientesNUMERO: TStringField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 5
    end
    object sqlClientesCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object sqlClientesUF: TStringField
      FieldName = 'UF'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object sqlClientesMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object sqlClientesCMUNICIPIO: TStringField
      FieldName = 'CMUNICIPIO'
      ProviderFlags = [pfInUpdate]
      Size = 7
    end
    object sqlClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object sqlClientesCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 8
    end
    object sqlClientesCNPJ: TStringField
      FieldName = 'CNPJ'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object sqlClientesCPF: TStringField
      FieldName = 'CPF'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object sqlClientesIE: TStringField
      FieldName = 'IE'
      ProviderFlags = [pfInUpdate]
      Size = 22
    end
    object sqlClientesRG: TStringField
      FieldName = 'RG'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesEMAIL: TStringField
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object sqlClientesEMAILNFE: TStringField
      FieldName = 'EMAILNFE'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object sqlClientesHOMEPAGE: TStringField
      FieldName = 'HOMEPAGE'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object sqlClientesDATANASCIMENTO: TDateField
      FieldName = 'DATANASCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesDDI: TStringField
      FieldName = 'DDI'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object sqlClientesDDD: TStringField
      FieldName = 'DDD'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object sqlClientesTELEFONE: TStringField
      FieldName = 'TELEFONE'
      ProviderFlags = [pfInUpdate]
      Size = 9
    end
    object sqlClientesFAX: TStringField
      FieldName = 'FAX'
      ProviderFlags = [pfInUpdate]
      Size = 9
    end
    object sqlClientesCONTATO: TStringField
      FieldName = 'CONTATO'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object sqlClientesCPAIS: TStringField
      FieldName = 'CPAIS'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object sqlClientesNPAIS: TStringField
      FieldName = 'NPAIS'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object sqlClientesVENDEDOR: TIntegerField
      FieldName = 'VENDEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesBANCO: TIntegerField
      FieldName = 'BANCO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesAGENCIA: TStringField
      FieldName = 'AGENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object sqlClientesCONTA: TStringField
      FieldName = 'CONTA'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object sqlClientesGRUPO: TIntegerField
      FieldName = 'GRUPO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesTRANSPORTADORA: TIntegerField
      FieldName = 'TRANSPORTADORA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesCONCEITO: TStringField
      FieldName = 'CONCEITO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientesRISCO: TStringField
      FieldName = 'RISCO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientesCLASSEVALOR: TStringField
      FieldName = 'CLASSEVALOR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientesTABELA: TStringField
      FieldName = 'TABELA'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object sqlClientesLIMITECREDITO: TFloatField
      FieldName = 'LIMITECREDITO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesVENCIMENTOLC: TDateField
      FieldName = 'VENCIMENTOLC'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesPRIMEIRACOMPRA: TDateField
      FieldName = 'PRIMEIRACOMPRA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesULTIMACOMPRA: TDateField
      FieldName = 'ULTIMACOMPRA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesSEGMENTOMERCADO: TIntegerField
      FieldName = 'SEGMENTOMERCADO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesMAIORSALDOLC: TFloatField
      FieldName = 'MAIORSALDOLC'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesMENORSALDOLC: TFloatField
      FieldName = 'MENORSALDOLC'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesMAIORCOMPRA: TFloatField
      FieldName = 'MAIORCOMPRA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesMENORCOMPRA: TFloatField
      FieldName = 'MENORCOMPRA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesNUMEROPAGTOS: TIntegerField
      FieldName = 'NUMEROPAGTOS'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesMEDIAATRASO: TFloatField
      FieldName = 'MEDIAATRASO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesSALDODEVEDOR: TFloatField
      FieldName = 'SALDODEVEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesNUMEROCOMPRAS: TIntegerField
      FieldName = 'NUMEROCOMPRAS'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesTITULOSABERTOS: TIntegerField
      FieldName = 'TITULOSABERTOS'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesSALDOATRASADOS: TFloatField
      FieldName = 'SALDOATRASADOS'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesTITULOSATRASADOS: TIntegerField
      FieldName = 'TITULOSATRASADOS'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesMAIORTITULO: TFloatField
      FieldName = 'MAIORTITULO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesMENORTITULO: TFloatField
      FieldName = 'MENORTITULO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesCHEQUESDEVOLVIDOS: TIntegerField
      FieldName = 'CHEQUESDEVOLVIDOS'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesULTIMADEVOLUCAO: TDateField
      FieldName = 'ULTIMADEVOLUCAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object sqlClientesTIPOFRETE: TStringField
      FieldName = 'TIPOFRETE'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientesDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesCONDICAOPAGAMENTO: TIntegerField
      FieldName = 'CONDICAOPAGAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesFORMAPAGAMENTO: TStringField
      FieldName = 'FORMAPAGAMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlClientesCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object sqlClientesTIPOPRECO: TStringField
      FieldName = 'TIPOPRECO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlClientesENDERECOENTREGA: TStringField
      FieldName = 'ENDERECOENTREGA'
      ProviderFlags = [pfInUpdate]
      Size = 90
    end
    object sqlClientesNUMEROENTREGA: TStringField
      FieldName = 'NUMEROENTREGA'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object sqlClientesCOMPLEMENTOENTREGA: TStringField
      FieldName = 'COMPLEMENTOENTREGA'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object sqlClientesUFENTREGA: TStringField
      FieldName = 'UFENTREGA'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlClientesMUNICIPIOENTREGA: TStringField
      FieldName = 'MUNICIPIOENTREGA'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object sqlClientesBAIRROENTREGA: TStringField
      FieldName = 'BAIRROENTREGA'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object sqlClientesCEPENTREGA: TStringField
      FieldName = 'CEPENTREGA'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object sqlClientesENDERECOCOBRANCA: TStringField
      FieldName = 'ENDERECOCOBRANCA'
      ProviderFlags = [pfInUpdate]
      Size = 90
    end
    object sqlClientesNUMEROCOBRANCA: TStringField
      FieldName = 'NUMEROCOBRANCA'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object sqlClientesCOMPLEMENTOCOBRANCA: TStringField
      FieldName = 'COMPLEMENTOCOBRANCA'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object sqlClientesUFCOBRANCA: TStringField
      FieldName = 'UFCOBRANCA'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlClientesMUNICIPIOCOBRANCA: TStringField
      FieldName = 'MUNICIPIOCOBRANCA'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object sqlClientesBAIRROCOBRANCA: TStringField
      FieldName = 'BAIRROCOBRANCA'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object sqlClientesCEPCOBRANCA: TStringField
      FieldName = 'CEPCOBRANCA'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object sqlClientesSUFRAMA: TStringField
      FieldName = 'SUFRAMA'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object sqlClientesNOTIFICAEMAIL: TStringField
      FieldName = 'NOTIFICAEMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientesFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesULTIMACONSULTA: TDateField
      FieldName = 'ULTIMACONSULTA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesSTATUSCONSULTA: TStringField
      FieldName = 'STATUSCONSULTA'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object sqlClientesUSUARIOINC: TStringField
      FieldName = 'USUARIOINC'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object sqlClientesUSUARIOALT: TStringField
      FieldName = 'USUARIOALT'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object sqlClientesDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlClientesIM: TStringField
      FieldName = 'IM'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
    object sqlClientesROTA: TStringField
      FieldName = 'ROTA'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object sqlClientesTESTE: TStringField
      FieldName = 'TESTE'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientesGRUPOCLIENTE: TIntegerField
      FieldName = 'GRUPOCLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesROWID: TIntegerField
      FieldName = 'ROWID'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesCELULAR: TStringField
      FieldName = 'CELULAR'
      ProviderFlags = [pfInUpdate]
      Size = 9
    end
    object sqlClientesORIGEMCADASTRO: TStringField
      FieldName = 'ORIGEMCADASTRO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlClientesINDICADORIE: TStringField
      FieldName = 'INDICADORIE'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientesIDESTRANGEIRO: TStringField
      FieldName = 'IDESTRANGEIRO'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object sqlClientesINFORMACOESCOMERCIAIS: TStringField
      FieldName = 'INFORMACOESCOMERCIAIS'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object sqlClientesSITE: TStringField
      FieldName = 'SITE'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object sqlClientesFACHADA: TStringField
      FieldName = 'FACHADA'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object sqlClientesOPTANTESIMPLES: TStringField
      FieldName = 'OPTANTESIMPLES'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientesVISITACAMPO: TStringField
      FieldName = 'VISITACAMPO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientesVALORSERASAPJ: TFloatField
      FieldName = 'VALORSERASAPJ'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientesCNAEPRINCIPAL: TStringField
      FieldName = 'CNAEPRINCIPAL'
      ProviderFlags = [pfInUpdate]
      Size = 7
    end
    object sqlClientesCNAESECUNDARIO: TStringField
      FieldName = 'CNAESECUNDARIO'
      ProviderFlags = [pfInUpdate]
      Size = 7
    end
    object sqlClientesCRITERIORFA: TStringField
      DisplayLabel = 'Crit'#233'rio RFA'
      FieldName = 'CRITERIORFA'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlClientesNOMEFANTASIA: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'NOMEFANTASIA'
      ProviderFlags = [pfInUpdate]
      Size = 90
    end
    object sqlClientesENVIOCATALOGO: TStringField
      FieldName = 'ENVIOCATALOGO'
      Size = 1
    end
    object sqlClientesDATAENVIOCATALOGO: TDateField
      FieldName = 'DATAENVIOCATALOGO'
    end
    object sqlClientesRECEBIDOCATALOGO: TStringField
      FieldName = 'RECEBIDOCATALOGO'
      Size = 1
    end
    object sqlClientesDATARECEBIDOCATALOGO: TDateField
      FieldName = 'DATARECEBIDOCATALOGO'
    end
    object sqlClientesSTATUSRECEBIDOCATALOGO: TStringField
      FieldName = 'STATUSRECEBIDOCATALOGO'
      Size = 1
    end
    object sqlClientesMETA: TFloatField
      FieldName = 'META'
    end
    object sqlClientesADICIONAISCLIENTE: TStringField
      FieldName = 'ADICIONAISCLIENTE'
      Size = 5000
    end
    object sqlClientesVENDEDOR2: TIntegerField
      FieldName = 'VENDEDOR2'
    end
    object sqlClientesSIMPLESNACIONAL: TStringField
      FieldName = 'SIMPLESNACIONAL'
      Size = 1
    end
    object sqlClientesPRODUTOSITE: TStringField
      FieldName = 'PRODUTOSITE'
      Size = 1
    end
    object sqlClientesBKPDDD: TStringField
      FieldName = 'BKPDDD'
      Size = 3
    end
    object sqlClientesBKPTELEFONE: TStringField
      FieldName = 'BKPTELEFONE'
      Size = 10
    end
    object sqlClientesQUANTIDADEMAXPRODUTO: TFloatField
      FieldName = 'QUANTIDADEMAXPRODUTO'
    end
    object sqlClientesHASH: TStringField
      FieldName = 'HASH'
      Size = 64
    end
    object sqlClientesDATAENVIOCATALOGO2013: TDateField
      FieldName = 'DATAENVIOCATALOGO2013'
    end
    object sqlClientesDATARECEBIDOCATALOGO2013: TDateField
      FieldName = 'DATARECEBIDOCATALOGO2013'
    end
    object sqlClientesTELEFONEALTERNATIVO: TStringField
      FieldName = 'TELEFONEALTERNATIVO'
      Size = 9
    end
    object sqlClientesREGIAO: TStringField
      FieldName = 'REGIAO'
      Size = 4
    end
    object sqlClientesINCLUIDO: TStringField
      FieldName = 'INCLUIDO'
      Size = 15
    end
    object sqlClientesALTERADO: TStringField
      FieldName = 'ALTERADO'
      Size = 15
    end
    object sqlClientesCRITERIOIMPOSTOS: TStringField
      FieldName = 'CRITERIOIMPOSTOS'
      Size = 1
    end
    object sqlClientesEMAILMARKETING: TStringField
      FieldName = 'EMAILMARKETING'
      Size = 500
    end
    object sqlClientesCONTATOCATALOGO: TStringField
      FieldName = 'CONTATOCATALOGO'
      Size = 100
    end
    object sqlClientesTIPOCATALOGO: TStringField
      FieldName = 'TIPOCATALOGO'
      Size = 1
    end
    object sqlClientesQUANTIDADECATALOGO: TIntegerField
      FieldName = 'QUANTIDADECATALOGO'
    end
    object sqlClientesBKPREDUZIDO: TStringField
      FieldName = 'BKPREDUZIDO'
      Size = 90
    end
    object sqlClientesMEUCAMPO: TStringField
      FieldName = 'MEUCAMPO'
    end
    object sqlClientesCGC: TStringField
      FieldName = 'CGC'
    end
    object sqlClientesANTEPENULTIMO_VALOR_CONSULTA: TFloatField
      FieldName = 'ANTEPENULTIMO_VALOR_CONSULTA'
    end
    object sqlClientesANTEPENULTIMA_DATA_CONSULTA: TDateField
      FieldName = 'ANTEPENULTIMA_DATA_CONSULTA'
    end
    object sqlClientesPENULTIMO_VALOR_CONSULTA: TFloatField
      FieldName = 'PENULTIMO_VALOR_CONSULTA'
    end
    object sqlClientesPENULTIMA_DATA_CONSULTA: TDateField
      FieldName = 'PENULTIMA_DATA_CONSULTA'
    end
    object sqlClientesVALOR_ATUAL_CONSULTA: TFloatField
      FieldName = 'VALOR_ATUAL_CONSULTA'
    end
    object sqlClientesDATA_ATUAL_CONSULTA: TDateField
      FieldName = 'DATA_ATUAL_CONSULTA'
    end
  end
  object dspClientes_santana: TDataSetProvider
    DataSet = sqlClientes
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspClientes_santanaBeforeUpdateRecord
    Left = 1000
    Top = 848
  end
  object dtsClientes: TDataSource
    DataSet = sqlClientes
    Left = 1085
    Top = 792
  end
  object sqlClientes_Contatos: TSQLDataSet
    CommandText = 
      'Select * from CLIENTES_CONTATOS where EMPRESA = :EMPRESA and FIL' +
      'IAL = :FILIAL and CODIGO = :CODIGO'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsClientes
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1085
    Top = 848
    object sqlClientes_ContatosEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Required = True
      Size = 2
    end
    object sqlClientes_ContatosFILIAL: TStringField
      FieldName = 'FILIAL'
      Required = True
      Size = 2
    end
    object sqlClientes_ContatosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sqlClientes_ContatosITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object sqlClientes_ContatosNOME: TStringField
      FieldName = 'NOME'
      Size = 80
    end
    object sqlClientes_ContatosAREA: TStringField
      FieldName = 'AREA'
      Size = 25
    end
    object sqlClientes_ContatosCARGO: TStringField
      FieldName = 'CARGO'
      Size = 25
    end
    object sqlClientes_ContatosDDI: TStringField
      FieldName = 'DDI'
      Size = 3
    end
    object sqlClientes_ContatosDDD: TStringField
      FieldName = 'DDD'
      Size = 3
    end
    object sqlClientes_ContatosNUMERO: TStringField
      FieldName = 'NUMERO'
      Required = True
      Size = 16
    end
    object sqlClientes_ContatosRAMAL: TStringField
      FieldName = 'RAMAL'
      Size = 4
    end
    object sqlClientes_ContatosTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 1
    end
    object sqlClientes_ContatosEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 60
    end
    object sqlClientes_ContatosDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      Required = True
    end
  end
  object sqlClientes_Produtos: TSQLDataSet
    CommandText = 
      'select * from CLIENTES_PRODUTOS where EMPRESA = EMPRESA and FILI' +
      'AL = :FILIAL and CODIGO = :CODIGO'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsClientes
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1173
    Top = 792
    object sqlClientes_ProdutosEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Required = True
      Size = 2
    end
    object sqlClientes_ProdutosFILIAL: TStringField
      FieldName = 'FILIAL'
      Required = True
      Size = 2
    end
    object sqlClientes_ProdutosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sqlClientes_ProdutosITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object sqlClientes_ProdutosPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Required = True
      Size = 15
    end
    object sqlClientes_ProdutosPRODUTOCLIENTE: TStringField
      FieldName = 'PRODUTOCLIENTE'
      Required = True
      Size = 15
    end
    object sqlClientes_ProdutosCODIGOBARRASCLIENTE: TStringField
      FieldName = 'CODIGOBARRASCLIENTE'
      Size = 25
    end
    object sqlClientes_ProdutosDESCRICAOCLIENTE: TStringField
      FieldName = 'DESCRICAOCLIENTE'
      Size = 80
    end
    object sqlClientes_ProdutosUNIDADEMEDIDA: TStringField
      FieldName = 'UNIDADEMEDIDA'
      Size = 2
    end
    object sqlClientes_ProdutosDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      Required = True
    end
  end
  object dspAuditoria_Produtos: TDataSetProvider
    DataSet = sqlAuditoria_produtos
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 936
    Top = 1200
  end
  object sqlAuditoria_produtos: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select A.*, B.DESCRICAO AS "PRODUTODESCRICAO" from auditoria_pro' +
      'dutos A'#13#10'inner join PRODUTOS B'#13#10'    on(B.EMPRESA = :EMPRESA_PROD' +
      'UTOS and B.FILIAL = :FILIAL_PRODUTOS and B.CODIGO = A.PRODUTO)'#13#10 +
      'where A.EMPRESA = :EMPRESA and A.FILIAL = :FILIAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA_PRODUTOS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL_PRODUTOS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 936
    Top = 1152
    object sqlAuditoria_produtosEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlAuditoria_produtosFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlAuditoria_produtosPRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object sqlAuditoria_produtosSTATUS: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlAuditoria_produtosENTRADANF: TStringField
      DisplayLabel = 'Entrada da NF'
      FieldName = 'ENTRADANF'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlAuditoria_produtosSAIDANF: TStringField
      DisplayLabel = 'Sa'#237'da da NF'
      FieldName = 'SAIDANF'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlAuditoria_produtosGARANTIA: TStringField
      DisplayLabel = 'Garantia'
      FieldName = 'GARANTIA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlAuditoria_produtosQUANTIDADEGRANDE: TStringField
      DisplayLabel = 'Quantidade Grande'
      FieldName = 'QUANTIDADEGRANDE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlAuditoria_produtosQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0.0000'
      EditFormat = '0.0000'
    end
    object sqlAuditoria_produtosPRECOABAIXO: TStringField
      DisplayLabel = 'Pre'#231'o abaixo do ultimo pre'#231'o'
      FieldName = 'PRECOABAIXO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlAuditoria_produtosDATADE: TDateField
      DisplayLabel = 'Data de'
      FieldName = 'DATADE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlAuditoria_produtosDATAATE: TDateField
      DisplayLabel = 'Data at'#233
      FieldName = 'DATAATE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlAuditoria_produtosDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data de cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlAuditoria_produtosPRODUTODESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'PRODUTODESCRICAO'
      ProviderFlags = []
      Size = 80
    end
  end
  object dspAuditoria_Clientes: TDataSetProvider
    DataSet = sqlAuditoria_Clientes
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 739
    Top = 1200
  end
  object sqlAuditoria_Clientes: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select A.*, B.NOME AS "CLIENTEDESCRICAO" from auditoria_clientes' +
      ' A'#13#10'inner join CLIENTES B'#13#10'    on(B.EMPRESA = :EMPRESA_CLIENTES ' +
      'and B.FILIAL = :FILIAL_CLIENTES and B.CODIGO = A.CLIENTE)'#13#10'where' +
      ' A.EMPRESA = :EMPRESA and A.FILIAL = :FILIAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA_CLIENTES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL_CLIENTES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 739
    Top = 1154
    object StringField35: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object StringField36: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlAuditoria_ClientesCLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object StringField38: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlAuditoria_ClientesCLIENTEDESCRICAO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'CLIENTEDESCRICAO'
      ProviderFlags = []
      Size = 80
    end
    object DateField4: TDateField
      DisplayLabel = 'Data de'
      FieldName = 'DATADE'
      ProviderFlags = [pfInUpdate]
    end
    object DateField5: TDateField
      DisplayLabel = 'Data at'#233
      FieldName = 'DATAATE'
      ProviderFlags = [pfInUpdate]
    end
    object SQLTimeStampField8: TSQLTimeStampField
      DisplayLabel = 'Data de cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlAuditoria_ClientesORCAMENTO: TStringField
      DisplayLabel = 'Or'#231'amento'
      FieldName = 'ORCAMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlAuditoria_ClientesPEDIDO: TStringField
      DisplayLabel = 'Pedido'
      FieldName = 'PEDIDO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlAuditoria_ClientesBAIXATITULO: TStringField
      DisplayLabel = 'Baixa de T'#237'tulo'
      FieldName = 'BAIXATITULO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlAuditoria_ClientesNF: TStringField
      DisplayLabel = 'Nota Fiscal'
      FieldName = 'NF'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlAuditoria_ClientesVENCIMENTOTITULO: TStringField
      DisplayLabel = 'Vencimento de T'#237'tulo'
      FieldName = 'VENCIMENTOTITULO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlAuditoria_ClientesATRASO: TStringField
      DisplayLabel = 'Atraso de 3 Dias'
      FieldName = 'ATRASO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlAuditoria_ClientesPASSOULIMITE: TStringField
      DisplayLabel = 'Passou o limite'
      FieldName = 'PASSOULIMITE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlAuditoria_ClientesGARANTIA: TStringField
      DisplayLabel = 'Garantia'
      FieldName = 'GARANTIA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
  end
  object sqlConcorrentes_Codigos_Santana: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select EMPRESA, FILIAL, CODIGO, PRODUTO, CODIGOCONCORRENTE, DATA' +
      'CRIACAO '#13#10'from CONCORRENTES_PRODUTOS'#13#10'where EMPRESA = :EMPRESA a' +
      'nd FILIAL = :FILIAL and CODIGO = :CODIGO'#13#10'order by EMPRESA, FILI' +
      'AL, CODIGO, PRODUTO'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsConcorrentes_Codigos_Santana
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 410
    Top = 711
    object StringField37: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object StringField39: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object IntegerField9: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField40: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object sqlConcorrentes_Codigos_SantanaCODIGOCONCORRENTE: TStringField
      FieldName = 'CODIGOCONCORRENTE'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object SQLTimeStampField9: TSQLTimeStampField
      DisplayLabel = 'Data Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dtsConcorrentes_Codigos_Santana: TDataSource
    DataSet = sqlConcorrentes_Dados_Santana
    Left = 412
    Top = 654
  end
  object sqlPre_Produto: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'select * from PRE_PRODUTOS where EMPRESA = :EMPRESA and FILIAL =' +
      ' :FILIAL order by EMPRESA, FILIAL, CODIGO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftUnknown
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1120
    Top = 1156
    object StringField42: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object StringField43: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 2
    end
    object StringField44: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 1
    end
    object StringField45: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object DateField8: TDateField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATACADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object StringField46: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 240
    end
    object StringField47: TStringField
      DisplayLabel = 'Nome Reduzido'
      FieldName = 'REDUZIDO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object IntegerField10: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
      ProviderFlags = [pfInUpdate]
    end
    object IntegerField11: TIntegerField
      DisplayLabel = 'SubGrupo'
      FieldName = 'SUBGRUPO'
      ProviderFlags = [pfInUpdate]
    end
    object StringField48: TStringField
      DisplayLabel = 'Fabricante'
      FieldName = 'FABRICANTE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object StringField49: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object StringField50: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object StringField51: TStringField
      DisplayLabel = 'Origem do Produto'
      FieldName = 'ORIGEMPRODUTO'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object StringField52: TStringField
      DisplayLabel = 'N'#250'mero de S'#233'rie'
      FieldName = 'NUMEROSERIE'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object StringField53: TStringField
      FieldName = 'LOCALIZACAO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object IntegerField12: TIntegerField
      DisplayLabel = 'Regra Entrada'
      FieldName = 'REGRAENTRADA'
      ProviderFlags = [pfInUpdate]
    end
    object IntegerField13: TIntegerField
      DisplayLabel = 'Regra Sa'#237'da'
      FieldName = 'REGRASAIDA'
      ProviderFlags = [pfInUpdate]
    end
    object DateField9: TDateField
      DisplayLabel = 'Ultima Compra'
      FieldName = 'ULTIMACOMPRA'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/0000;1;_'
    end
    object FloatField17: TFloatField
      DisplayLabel = #218'ltimo Pre'#231'o'
      FieldName = 'ULTIMOPRECO'
      ProviderFlags = [pfInUpdate]
    end
    object IntegerField14: TIntegerField
      DisplayLabel = #218'ltimo Fornecedor'
      FieldName = 'ULTIMOFORNECEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField18: TFloatField
      DisplayLabel = 'Comiss'#227'o'
      FieldName = 'COMISSAO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.0000%'
      EditFormat = '0.0000'
    end
    object StringField54: TStringField
      DisplayLabel = 'Situa'#231#227'o Tribut'#225'ria'
      FieldName = 'SITUACAOTRIBUTARIA'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object StringField55: TStringField
      DefaultExpression = #39'0'#39
      DisplayLabel = 'Origem do Produto (ST)'
      FieldName = 'ORIGEMST'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object StringField56: TStringField
      DisplayLabel = 'Classifica'#231#227'o Fiscal'
      DisplayWidth = 2
      FieldName = 'CLASSIFICACAOFISCAL'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object StringField57: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object StringField58: TStringField
      DisplayLabel = 'Primeira Unidade'
      FieldName = 'PRIMEIRAUNIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object StringField59: TStringField
      DisplayLabel = 'Local Padr'#227'o'
      FieldName = 'LOCALPADRAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object StringField60: TStringField
      DisplayLabel = 'Segunda Unidade'
      FieldName = 'SEGUNDAUNIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object StringField61: TStringField
      DisplayLabel = 'Tipo Convers'#227'o'
      FieldName = 'TIPOCONVERSAO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FloatField19: TFloatField
      DisplayLabel = 'Fator de Convers'#227'o'
      FieldName = 'FATORCONVERSAO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object FloatField20: TFloatField
      DisplayLabel = 'Custo Padr'#227'o'
      FieldName = 'CUSTOPADRAO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object StringField62: TStringField
      DisplayLabel = 'Moeda Custo'
      FieldName = 'MOEDACUSTO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object FloatField21: TFloatField
      DisplayLabel = 'Custo Moeda'
      FieldName = 'CUSTOPADRAOMOEDA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object FloatField22: TFloatField
      DisplayLabel = #218'ltima Cota'#231#227'o'
      FieldName = 'ULTIMACOTACAO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object FloatField23: TFloatField
      DisplayLabel = 'Peso L'#237'quido'
      FieldName = 'PESOLIQUIDO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object FloatField24: TFloatField
      DisplayLabel = 'Peso Bruto'
      FieldName = 'PESOBRUTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object StringField63: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'C'#243'digo Barras'
      DisplayWidth = 25
      FieldName = 'CODIGOBARRAS'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object StringField64: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object FloatField25: TFloatField
      DefaultExpression = '0'
      FieldName = 'ICMS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object FloatField26: TFloatField
      DefaultExpression = '0'
      FieldName = 'IPI'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object FloatField27: TFloatField
      DefaultExpression = '0'
      FieldName = 'ISS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object FloatField28: TFloatField
      DefaultExpression = '0'
      FieldName = 'II'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object FloatField29: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Margem Lucro'
      FieldName = 'MARGEMLUCRO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object FloatField30: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Tributos'
      FieldName = 'TRIBUTOS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object FloatField31: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Estoque Seguran'#231'a'
      FieldName = 'ESTOQUESEGURANCA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object FloatField32: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Ponto Pedido'
      FieldName = 'PONTOPEDIDO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object DateField10: TDateField
      DisplayLabel = 'Ultimo Invent'#225'rio'
      FieldName = 'ULTIMOINVENTARIO'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/0000;1;_'
    end
    object IntegerField15: TIntegerField
      DefaultExpression = '0'
      DisplayLabel = 'Periodicidade Invent'#225'rio'
      FieldName = 'PINVENTARIO'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField33: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Estoque M'#237'nimo'
      FieldName = 'ESTOQUEMINIMO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object FloatField34: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Estoque M'#225'ximo'
      FieldName = 'ESTOQUEMAXIMO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object FloatField35: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Limite Estoque'
      FieldName = 'LIMITEESTOQUE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object IntegerField16: TIntegerField
      DefaultExpression = '0'
      DisplayLabel = 'Prazo de Entrega'
      FieldName = 'PRAZOENTREGA'
      ProviderFlags = [pfInUpdate]
    end
    object StringField65: TStringField
      DisplayLabel = 'Tipo Prazo de Entrega'
      FieldName = 'TIPOPRAZO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FloatField36: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Lote Econ'#244'mico'
      FieldName = 'LOTEECONOMICO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object FloatField37: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Lote M'#237'nimo'
      FieldName = 'LOTEMINIMO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object FloatField38: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Custo 1'
      FieldName = 'PRECOCUSTO1'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object FloatField39: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Custo 2'
      FieldName = 'PRECOCUSTO2'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object FloatField40: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Custo 3'
      FieldName = 'PRECOCUSTO3'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object FloatField41: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Custo 4'
      FieldName = 'PRECOCUSTO4'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object FloatField42: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Custo 5'
      FieldName = 'PRECOCUSTO5'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object FloatField43: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Custo 6'
      FieldName = 'PRECOCUSTO6'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object FloatField44: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Custo 7'
      FieldName = 'PRECOCUSTO7'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object FloatField45: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Custo 8'
      FieldName = 'PRECOCUSTO8'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object FloatField46: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Custo 9'
      FieldName = 'PRECOCUSTO9'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object FloatField47: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Custo 10'
      FieldName = 'PRECOCUSTO10'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object FloatField48: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Venda 1'
      FieldName = 'PRECOVENDA1'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object FloatField49: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Venda 2'
      FieldName = 'PRECOVENDA2'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object FloatField50: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Venda 3'
      FieldName = 'PRECOVENDA3'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object FloatField51: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Venda 4'
      FieldName = 'PRECOVENDA4'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object FloatField52: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Venda 5'
      FieldName = 'PRECOVENDA5'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object FloatField53: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Venda 6'
      FieldName = 'PRECOVENDA6'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object FloatField54: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Venda 7'
      FieldName = 'PRECOVENDA7'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object FloatField55: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Venda 8'
      FieldName = 'PRECOVENDA8'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object FloatField56: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Venda 9'
      FieldName = 'PRECOVENDA9'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object FloatField57: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o Venda 10'
      FieldName = 'PRECOVENDA10'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object FloatField58: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 01 - Antigo'
      FieldName = 'PRECOANTIGO1'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField59: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 02 - Antigo'
      FieldName = 'PRECOANTIGO2'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField60: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 03 - Antigo'
      FieldName = 'PRECOANTIGO3'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField61: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 04 - Antigo'
      FieldName = 'PRECOANTIGO4'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField62: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 05 - Antigo'
      FieldName = 'PRECOANTIGO5'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField63: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 06 - Antigo'
      FieldName = 'PRECOANTIGO6'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField64: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 07 - Antigo'
      FieldName = 'PRECOANTIGO7'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField65: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 08 - Antigo'
      FieldName = 'PRECOANTIGO8'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField66: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 09 - Antigo'
      FieldName = 'PRECOANTIGO9'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField67: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 10 - Antigo'
      FieldName = 'PRECOANTIGO10'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField68: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o M'#237'nimo'
      FieldName = 'PRECOMINIMO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object FloatField69: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Pre'#231'o M'#225'ximo'
      FieldName = 'PRECOMAXIMO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object IntegerField17: TIntegerField
      DisplayLabel = 'Cor de Destaque'
      FieldName = 'CORDESTAQUE'
      ProviderFlags = [pfInUpdate]
    end
    object StringField66: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Imagem'
      FieldName = 'IMAGEM'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object StringField67: TStringField
      FieldName = 'ITEMNOVO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object StringField68: TStringField
      DisplayLabel = 'Controla Lote?'
      FieldName = 'CONTROLALOTE'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object IntegerField18: TIntegerField
      DisplayLabel = 'Regra M'#250'ltiplo'
      FieldName = 'REGRAMULTIPLO'
      ProviderFlags = [pfInUpdate]
    end
    object DateField11: TDateField
      DisplayLabel = #218'ltima Altera'#231#227'o de Pre'#231'o'
      FieldName = 'ULTIMAALTERACAOPRECO'
      ProviderFlags = [pfInUpdate]
    end
    object IntegerField19: TIntegerField
      DisplayLabel = 'Usu'#225'rio - '#218'ltima Altera'#231#227'o de Pre'#231'o'
      FieldName = 'USUARIOULTIMAALTERACAOPRECO'
      ProviderFlags = [pfInUpdate]
    end
    object StringField69: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'N'#250'mero FCI'
      FieldName = 'NROFCI'
      ProviderFlags = [pfInUpdate]
      Size = 32
    end
    object FloatField70: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Percentual FCI'
      FieldName = 'PERCENTUALFCI'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
      EditFormat = '0.00'
    end
    object StringField70: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Cor'
      FieldName = 'COR'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object StringField71: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Tamanho'
      FieldName = 'TAMANHO'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object SQLTimeStampField10: TSQLTimeStampField
      DisplayLabel = 'Data da Cria'#231#227'o '
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object FloatField71: TFloatField
      FieldName = 'COMPRIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField72: TFloatField
      FieldName = 'ALTURA'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField73: TFloatField
      FieldName = 'LARGURA'
      ProviderFlags = [pfInUpdate]
    end
    object StringField72: TStringField
      FieldName = 'PRODUTOSITE'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FloatField74: TFloatField
      FieldName = 'PRECOSITE'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField75: TFloatField
      FieldName = 'PRECOVENDASITE'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField76: TFloatField
      FieldName = 'MARGEMSITE'
      ProviderFlags = [pfInUpdate]
    end
    object IntegerField20: TIntegerField
      FieldName = 'ORDEMCATALOGO'
      ProviderFlags = [pfInUpdate]
    end
    object IntegerField21: TIntegerField
      DisplayLabel = 'Dias de Garantia'
      FieldName = 'DIASGARANTIA'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField77: TFloatField
      FieldName = 'QUANTIDADEMAXIMA'
    end
    object FloatField78: TFloatField
      DefaultExpression = '0'
      FieldName = 'FEDERAIS'
      DisplayFormat = '#0.00%'
    end
    object FloatField79: TFloatField
      DefaultExpression = '0'
      FieldName = 'ESTADUAIS'
      DisplayFormat = '#0.00%'
    end
    object FloatField80: TFloatField
      DefaultExpression = '0'
      FieldName = 'MUNICIPAIS'
      DisplayFormat = '#0.00%'
    end
    object FloatField81: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'FEDERAISIMP'
      FieldName = 'FEDERAISIMPORTADO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00%'
    end
  end
  object dspPre_Produto: TDataSetProvider
    DataSet = sqlPre_Produto
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 1120
    Top = 1200
  end
  object sqlEmpresa_Grupo: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select * from EMPRESA_GRUPO where EMPRESA = :EMPRESA and FILIAL ' +
      '= :FILIAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 449
    Top = 972
    object sqlEmpresa_GrupoEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlEmpresa_GrupoFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlEmpresa_GrupoCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo do Grupo'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlEmpresa_GrupoDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 240
    end
    object sqlEmpresa_GrupoDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspEmpresa_Grupo: TDataSetProvider
    DataSet = sqlEmpresa_Grupo
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspEmpresa_GrupoBeforeUpdateRecord
    AfterApplyUpdates = dspEmpresa_GrupoAfterApplyUpdates
    Left = 449
    Top = 1026
  end
  object sqlEmpresa_Grupo_Clientes: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    BeforeOpen = sqlEmpresa_Grupo_ClientesBeforeOpen
    CommandText = 
      'select A.*, B.REDUZIDO AS "NOMECLIENTE"  from EMPRESA_GRUPO_CLIE' +
      'NTES A '#13#10'inner join CLIENTES B on (B.EMPRESA = :EMPRESA_CLIENTES' +
      ' and B.FILIAL = :FILIAL_CLIENTES and B.CODIGO = A.CLIENTE)'#13#10'wher' +
      'e A.EMPRESA = :EMPRESA and A.FILIAL = :FILIAL and A.GRUPO= :CODI' +
      'GO'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsEmpresa_Grupo
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA_CLIENTES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL_CLIENTES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 568
    Top = 1026
    object sqlEmpresa_Grupo_ClientesEMPRESA: TStringField
      DisplayLabel = 'Empresa:'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlEmpresa_Grupo_ClientesFILIAL: TStringField
      DisplayLabel = 'Filial:'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlEmpresa_Grupo_ClientesCLIENTE: TIntegerField
      DisplayLabel = 'Cliente:'
      FieldName = 'CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlEmpresa_Grupo_ClientesGRUPO: TIntegerField
      DisplayLabel = 'C'#243'digo do Grupo:'
      FieldName = 'GRUPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlEmpresa_Grupo_ClientesDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data Cria'#231#227'o:'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlEmpresa_Grupo_ClientesOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o:'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 240
    end
    object sqlEmpresa_Grupo_ClientesNOMECLIENTE: TStringField
      FieldName = 'NOMECLIENTE'
      ProviderFlags = []
      Size = 240
    end
  end
  object dtsEmpresa_Grupo: TDataSource
    DataSet = sqlEmpresa_Grupo
    Left = 568
    Top = 972
  end
  object sqlConsulta_Separacao_Setor: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select * from pedidos_separacao_setores where empresa = :EMPRESA' +
      ' and FILIAL = :FILIAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 88
    Top = 1320
    object sqlConsulta_Separacao_SetorEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlConsulta_Separacao_SetorFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlConsulta_Separacao_SetorNUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlConsulta_Separacao_SetorSETOR: TStringField
      DisplayLabel = 'Setor'
      FieldName = 'SETOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlConsulta_Separacao_SetorQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0.000'
    end
    object sqlConsulta_Separacao_SetorSEPARADO: TStringField
      DisplayLabel = 'Separado'
      FieldName = 'SEPARADO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlConsulta_Separacao_SetorCONFERIDO: TStringField
      DisplayLabel = 'Conferido'
      FieldName = 'CONFERIDO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlConsulta_Separacao_SetorDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data de Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '99/99/0000;1;_'
    end
    object sqlConsulta_Separacao_SetorDATACONFERIDO: TDateField
      DisplayLabel = 'Data da Conferencia'
      FieldName = 'DATACONFERIDO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/0000;1;_'
    end
    object sqlConsulta_Separacao_SetorDATAHORAIMPRESSAO: TSQLTimeStampField
      DisplayLabel = 'Data e Hora Impress'#227'o'
      FieldName = 'DATAHORAIMPRESSAO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/0000 90:00:00>LL;1;_'
    end
    object sqlConsulta_Separacao_SetorFINALSEPARACAO: TSQLTimeStampField
      DisplayLabel = 'Termino da Separa'#231#227'o'
      FieldName = 'FINALSEPARACAO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/0000 90:00:00>LL;1;_'
    end
    object sqlConsulta_Separacao_SetorFINALCONFERENCIA: TSQLTimeStampField
      DisplayLabel = 'Termino da Conferencia'
      FieldName = 'FINALCONFERENCIA'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/0000 90:00:00>LL;1;_'
    end
    object sqlConsulta_Separacao_SetorUSUARIOIMPRESSAO: TStringField
      DisplayLabel = 'Usu'#225'rio que Imprimiu'
      FieldName = 'USUARIOIMPRESSAO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object sqlConsulta_Separacao_SetorUSUARIOSEPARACAO: TStringField
      DisplayLabel = 'Usu'#225'rio da Separa'#231#227'o'
      FieldName = 'USUARIOSEPARACAO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object sqlConsulta_Separacao_SetorUSUARIOCONFERENCIA: TStringField
      DisplayLabel = 'Usu'#225'rio da Conferencia'
      FieldName = 'USUARIOCONFERENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object sqlConsulta_Separacao_SetorLOCALIZACAOEXPEDICAO: TStringField
      DisplayLabel = 'Localiza'#231#227'o na Expedi'#231#227'o'
      FieldName = 'LOCALIZACAOEXPEDICAO'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object sqlConsulta_Separacao_SetorPENDENCIA: TStringField
      DisplayLabel = 'Pend'#234'ncia'
      FieldName = 'PENDENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlConsulta_Separacao_SetorDATAHORAPENDENCIA: TSQLTimeStampField
      DisplayLabel = 'Data e hora Pend'#234'ncia'
      FieldName = 'DATAHORAPENDENCIA'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/0000 90:00:00>LL;1;_'
    end
    object sqlConsulta_Separacao_SetorUSUARIOPENDENCIA: TStringField
      DisplayLabel = 'Usu'#225'rio Pend'#234'ncia'
      FieldName = 'USUARIOPENDENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
  end
  object dspConsulta_Separacao_Setor: TDataSetProvider
    DataSet = sqlConsulta_Separacao_Setor
    Options = [poIncFieldProps, poCascadeUpdates, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    Left = 88
    Top = 1376
  end
  object sqlCampanhas_Sugestoes: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select * from CAMPANHAS_SUGESTOES where EMPRESA = :EMPRESA and F' +
      'ILIAL = :FILIAL'#13#10'order by EMPRESA, FILIAL, NUMERO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 579
    Top = 217
    object StringField73: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object StringField74: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlCampanhas_SugestoesNUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlCampanhas_SugestoesSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCampanhas_SugestoesPRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'PRODUTO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object sqlCampanhas_SugestoesDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlCampanhas_SugestoesQUANTIDADE: TIntegerField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCampanhas_SugestoesUNITARIOFORASP: TFloatField
      DisplayLabel = 'Unit'#225'rio Fora SP'
      FieldName = 'UNITARIOFORASP'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCampanhas_SugestoesUNITARIOSP: TFloatField
      DisplayLabel = 'Unit'#225'rio SP'
      FieldName = 'UNITARIOSP'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCampanhas_SugestoesOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object sqlCampanhas_SugestoesDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data de Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspCampanhas_Sugestoes: TDataSetProvider
    DataSet = sqlCampanhas_Sugestoes
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspCampanhas_SugestoesBeforeUpdateRecord
    Left = 575
    Top = 269
  end
  object sqlOrdem_Producao_Santana: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select A.*, B.NOME AS "NOMEUSUARIOINICIO", C.NOME AS "NOMEUSUARI' +
      'OFINAL" from ORDEM_PRODUCAO_SANTANA A'#13#10'LEFT JOIN SYS_USERS B ON ' +
      '(B.CODIGO = A.USUARIOINICIO)'#13#10'LEFT JOIN SYS_USERS C ON (C.CODIGO' +
      ' = A.USUARIOFINAL)'#13#10'where A.EMPRESA = :EMPRESA and A.FILIAL = :F' +
      'ILIAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 312
    Top = 1320
    object sqlOrdem_Producao_SantanaEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlOrdem_Producao_SantanaFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlOrdem_Producao_SantanaNUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlOrdem_Producao_SantanaPRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'PRODUTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 15
    end
    object sqlOrdem_Producao_SantanaDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 240
    end
    object sqlOrdem_Producao_SantanaLOCAL: TStringField
      DisplayLabel = 'Local Origem'
      FieldName = 'LOCAL'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlOrdem_Producao_SantanaDATA: TDateField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'EMISSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '99/99/0000;1;_'
    end
    object sqlOrdem_Producao_SantanaDATALIMITE: TDateField
      DisplayLabel = 'Data Limite'
      FieldName = 'DATALIMITE'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/0000;1;_'
    end
    object sqlOrdem_Producao_SantanaQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = '#,##0.00##'
      EditFormat = '0.00##'
    end
    object sqlOrdem_Producao_SantanaSITUACAO: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlOrdem_Producao_SantanaDATAINICIO: TDateField
      DisplayLabel = 'Data in'#237'cio'
      FieldName = 'DATAINICIO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/0000;1;_'
    end
    object sqlOrdem_Producao_SantanaHORAINICIO: TTimeField
      DisplayLabel = 'Hor'#225'rio de in'#237'cio'
      FieldName = 'HORAINICIO'
      ProviderFlags = [pfInUpdate]
      EditMask = '!90:00:00>LL;1;_'
    end
    object sqlOrdem_Producao_SantanaUSUARIOINICIO: TIntegerField
      DisplayLabel = 'Usu'#225'rio in'#237'cio'
      FieldName = 'USUARIOINICIO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlOrdem_Producao_SantanaDATAFINAL: TDateField
      DisplayLabel = 'Data Final'
      FieldName = 'DATAFINAL'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/0000;1;_'
    end
    object sqlOrdem_Producao_SantanaHORAFINAL: TTimeField
      DisplayLabel = 'Hor'#225'rio final'
      FieldName = 'HORAFINAL'
      ProviderFlags = [pfInUpdate]
      EditMask = '!90:00:00>LL;1;_'
    end
    object sqlOrdem_Producao_SantanaUSUARIOFINAL: TIntegerField
      DisplayLabel = 'Usu'#225'rio Final'
      FieldName = 'USUARIOFINAL'
      ProviderFlags = [pfInUpdate]
    end
    object sqlOrdem_Producao_SantanaDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/0000 90:00:00;1;_'
    end
    object sqlOrdem_Producao_SantanaUSUARIO: TIntegerField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlOrdem_Producao_SantanaNOMEUSUARIOINICIO: TStringField
      DisplayLabel = 'Nome usu'#225'rio In'#237'cio'
      FieldName = 'NOMEUSUARIOINICIO'
      ProviderFlags = []
      Size = 80
    end
    object sqlOrdem_Producao_SantanaNOMEUSUARIOFINAL: TStringField
      DisplayLabel = 'Nome usuario final'
      FieldName = 'NOMEUSUARIOFINAL'
      ProviderFlags = []
      Size = 80
    end
  end
  object dspOrdem_Producao_Santana: TDataSetProvider
    DataSet = sqlOrdem_Producao_Santana
    Options = [poIncFieldProps, poCascadeUpdates, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspOrdem_Producao_SantanaBeforeUpdateRecord
    Left = 312
    Top = 1376
  end
  object sqlConsulta_Lista_Faltas: TSQLDataSet
    SchemaName = 'sysdba'
    BeforeOpen = sqlConsulta_Lista_FaltasBeforeOpen
    CommandText = 
      'select A.EMPRESA, A.FILIAL, A.ORIGEM, A.SITUACAO, A.DATA, A.DOCU' +
      'MENTO, A.PRODUTO, A.DPRODUTO, A.LOCAL, A.COMPONENTE,'#13#10'       A.D' +
      'COMPONENTE, A.PROPRIETARIO, A.QUANTIDADE, A.OBSERVACAO, A.DATACR' +
      'IACAO, A.VENDEDOR, A.USUARIO,'#13#10'       iif(A.ORIGEM = '#39'LPV'#39' or A.' +
      'ORIGEM = '#39'LOV'#39', B.REDUZIDO, E.REDUZIDO) as "NOMEPROPRIETARIO",'#13#10 +
      '       C.REDUZIDO as "NOMEVENDEDOR",'#13#10'      SUM(D.PRENOTA) as "P' +
      'RENOTA",'#13#10'       sum(D.SALDO - D.RESERVA) as "DISPONIVEL"'#13#10'from ' +
      'LISTA_FALTAS A'#13#10'left join CLIENTES B on (B.EMPRESA = :EMPRESA_CL' +
      'IENTES and B.FILIAL = :FILIAL_CLIENTES and A.PROPRIETARIO = B.CO' +
      'DIGO)'#13#10'left join VENDEDORES C on (C.EMPRESA = :EMPRESA_VENDEDORE' +
      'S and C.FILIAL = :FILIAL_VENDEDORES and A.VENDEDOR = C.CODIGO)'#13#10 +
      'left join SALDOS_ESTOQUE D on (D.EMPRESA = :EMPRESA_SALDOS and D' +
      '.FILIAL = :FILIAL_SALDOS and A.PRODUTO = D.PRODUTO and D.LOCAL I' +
      'N (:01, :02, :03))'#13#10'left join FORNECEDORES E on (E.EMPRESA = :EM' +
      'PRESA_FORNECEDORES and E.FILIAL = :FILIAL_FORNECEDORES and A.PRO' +
      'PRIETARIO = E.CODIGO)'#13#10'where A.EMPRESA = :EMPRESA and A.FILIAL =' +
      ' :FILIAL '#13#10'group by A.EMPRESA, A.FILIAL, A.ORIGEM, A.SITUACAO, A' +
      '.DATA, A.DOCUMENTO, A.PRODUTO, A.DPRODUTO, A.LOCAL, A.COMPONENTE' +
      ', A.DCOMPONENTE, A.PROPRIETARIO, A.QUANTIDADE, A.OBSERVACAO, A.D' +
      'ATACRIACAO, A.VENDEDOR, A.USUARIO, iif(A.ORIGEM = '#39'LPV'#39' or A.ORI' +
      'GEM = '#39'LOV'#39', B.REDUZIDO, E.REDUZIDO), C.REDUZIDO'#13#10'order by A.EMP' +
      'RESA, A.FILIAL, A.ORIGEM, A.DATA, A.DOCUMENTO, A.PRODUTO, A.LOCA' +
      'L, A.COMPONENTE'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA_CLIENTES'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL_CLIENTES'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'EMPRESA_VENDEDORES'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL_VENDEDORES'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'EMPRESA_SALDOS'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL_SALDOS'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = '01'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = '02'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = '03'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'EMPRESA_FORNECEDORES'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL_FORNECEDORES'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 2
      end>
    SQLConnection = SQLConnection1
    Left = 926
    Top = 216
    object sqlConsulta_Lista_FaltasEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlConsulta_Lista_FaltasFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlConsulta_Lista_FaltasPRODUTO: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Produto'
      FieldName = 'PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object sqlConsulta_Lista_FaltasDOCUMENTO: TIntegerField
      DefaultExpression = '0'
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlConsulta_Lista_FaltasORIGEM: TStringField
      DisplayLabel = 'Origem'
      FieldName = 'ORIGEM'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object sqlConsulta_Lista_FaltasSITUACAO: TStringField
      DefaultExpression = #39'0'#39
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlConsulta_Lista_FaltasDATA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object sqlConsulta_Lista_FaltasLOCAL: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Local'
      FieldName = 'LOCAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object sqlConsulta_Lista_FaltasDPRODUTO: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'DPRODUTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
    object sqlConsulta_Lista_FaltasCOMPONENTE: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Componente'
      FieldName = 'COMPONENTE'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object sqlConsulta_Lista_FaltasDCOMPONENTE: TStringField
      DisplayLabel = 'Descri'#231#227'o do Componente'
      FieldName = 'DCOMPONENTE'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object sqlConsulta_Lista_FaltasPROPRIETARIO: TIntegerField
      DisplayLabel = 'Propriet'#225'rio'
      FieldName = 'PROPRIETARIO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlConsulta_Lista_FaltasQUANTIDADE: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = '#0.00'
      EditFormat = '0.00'
    end
    object sqlConsulta_Lista_FaltasOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 80
    end
    object sqlConsulta_Lista_FaltasVENDEDOR: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'VENDEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlConsulta_Lista_FaltasUSUARIO: TIntegerField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlConsulta_Lista_FaltasDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data de Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object sqlConsulta_Lista_FaltasNOMEPROPRIETARIO: TStringField
      DisplayLabel = 'Nome Propriet'#225'rio'
      FieldName = 'NOMEPROPRIETARIO'
      LookupDataSet = sqlAgendamento_Visitas
      ProviderFlags = []
      Size = 240
    end
    object sqlConsulta_Lista_FaltasNOMEVENDEDOR: TStringField
      DisplayLabel = 'Nome Vendedor'
      FieldName = 'NOMEVENDEDOR'
      ProviderFlags = []
      Size = 240
    end
    object sqlConsulta_Lista_FaltasDISPONIVEL: TFloatField
      DisplayLabel = 'Dispon'#237'vel'
      FieldName = 'DISPONIVEL'
      ProviderFlags = []
      DisplayFormat = '#,##0.00##'
    end
    object sqlConsulta_Lista_FaltasPRENOTA: TFloatField
      FieldName = 'PRENOTA'
      ProviderFlags = []
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
    end
  end
  object dspConsulta_Lista_Faltas: TDataSetProvider
    DataSet = sqlConsulta_Lista_Faltas
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 926
    Top = 272
  end
  object dspAcompanhamento_Categorias: TDataSetProvider
    DataSet = sqlAcompanhamento_Categorias
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 523
    Top = 1192
  end
  object sqlAcompanhamento_Categorias: TSQLDataSet
    SchemaName = 'sysdba'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 523
    Top = 1146
  end
  object sqlFornecedores: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select * from FORNECEDORES'#13#10'where EMPRESA = :EMPRESA and FILIAL ' +
      '= :FILIAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 528
    Top = 1328
    object StringField75: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object StringField76: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object IntegerField22: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField77: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object DateField12: TDateField
      FieldName = 'DATACADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object StringField78: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 80
    end
    object StringField79: TStringField
      FieldName = 'PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object StringField80: TStringField
      FieldName = 'REDUZIDO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 90
    end
    object StringField81: TStringField
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 90
    end
    object StringField82: TStringField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 5
    end
    object StringField83: TStringField
      FieldName = 'COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object StringField84: TStringField
      FieldName = 'UF'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object StringField85: TStringField
      FieldName = 'MUNICIPIO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object StringField86: TStringField
      FieldName = 'CMUNICIPIO'
      ProviderFlags = [pfInUpdate]
      Size = 7
    end
    object StringField87: TStringField
      FieldName = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object StringField88: TStringField
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 8
    end
    object StringField89: TStringField
      FieldName = 'CNPJ'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object StringField90: TStringField
      FieldName = 'CPF'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object StringField91: TStringField
      FieldName = 'IE'
      ProviderFlags = [pfInUpdate]
      Size = 22
    end
    object StringField92: TStringField
      FieldName = 'RG'
      ProviderFlags = [pfInUpdate]
    end
    object StringField93: TStringField
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object StringField94: TStringField
      FieldName = 'EMAILNFE'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object StringField95: TStringField
      FieldName = 'HOMEPAGE'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object StringField96: TStringField
      FieldName = 'DDI'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object StringField97: TStringField
      FieldName = 'DDD'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object StringField98: TStringField
      FieldName = 'TELEFONE'
      ProviderFlags = [pfInUpdate]
      Size = 16
    end
    object StringField99: TStringField
      FieldName = 'FAX'
      ProviderFlags = [pfInUpdate]
      Size = 16
    end
    object StringField100: TStringField
      FieldName = 'CONTATO'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object StringField101: TStringField
      FieldName = 'CPAIS'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object StringField102: TStringField
      FieldName = 'NPAIS'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object IntegerField23: TIntegerField
      FieldName = 'VENDEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object IntegerField24: TIntegerField
      FieldName = 'BANCO'
      ProviderFlags = [pfInUpdate]
    end
    object StringField103: TStringField
      FieldName = 'AGENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object StringField104: TStringField
      FieldName = 'CONTA'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object IntegerField25: TIntegerField
      FieldName = 'GRUPO'
      ProviderFlags = [pfInUpdate]
    end
    object IntegerField26: TIntegerField
      FieldName = 'TRANSPORTADORA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFornecedoresTABELA: TIntegerField
      FieldName = 'TABELA'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField82: TFloatField
      FieldName = 'LIMITECREDITO'
      ProviderFlags = [pfInUpdate]
    end
    object DateField13: TDateField
      FieldName = 'VENCIMENTOLC'
      ProviderFlags = [pfInUpdate]
    end
    object DateField14: TDateField
      FieldName = 'PRIMEIRACOMPRA'
      ProviderFlags = [pfInUpdate]
    end
    object DateField15: TDateField
      FieldName = 'ULTIMACOMPRA'
      ProviderFlags = [pfInUpdate]
    end
    object IntegerField27: TIntegerField
      FieldName = 'SEGMENTOMERCADO'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField83: TFloatField
      FieldName = 'MAIORSALDOLC'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField84: TFloatField
      FieldName = 'MENORSALDOLC'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField85: TFloatField
      FieldName = 'MAIORCOMPRA'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField86: TFloatField
      FieldName = 'MENORCOMPRA'
      ProviderFlags = [pfInUpdate]
    end
    object IntegerField28: TIntegerField
      FieldName = 'NUMEROPAGTOS'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField87: TFloatField
      FieldName = 'MEDIAATRASO'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField88: TFloatField
      FieldName = 'SALDODEVEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object IntegerField29: TIntegerField
      FieldName = 'NUMEROCOMPRAS'
      ProviderFlags = [pfInUpdate]
    end
    object IntegerField30: TIntegerField
      FieldName = 'TITULOSABERTOS'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField89: TFloatField
      FieldName = 'SALDOATRASADOS'
      ProviderFlags = [pfInUpdate]
    end
    object IntegerField31: TIntegerField
      FieldName = 'TITULOSATRASADOS'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField90: TFloatField
      FieldName = 'MAIORTITULO'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField91: TFloatField
      FieldName = 'MENORTITULO'
      ProviderFlags = [pfInUpdate]
    end
    object IntegerField32: TIntegerField
      FieldName = 'CHEQUESDEVOLVIDOS'
      ProviderFlags = [pfInUpdate]
    end
    object DateField16: TDateField
      FieldName = 'ULTIMADEVOLUCAO'
      ProviderFlags = [pfInUpdate]
    end
    object StringField105: TStringField
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object StringField106: TStringField
      FieldName = 'TIPOFRETE'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FloatField92: TFloatField
      FieldName = 'DESCONTO'
      ProviderFlags = [pfInUpdate]
    end
    object IntegerField33: TIntegerField
      FieldName = 'CONDICAOPAGAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object StringField107: TStringField
      FieldName = 'FORMAPAGAMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object StringField108: TStringField
      FieldName = 'CATEGORIA'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object StringField109: TStringField
      FieldName = 'TIPOPRECO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object StringField123: TStringField
      FieldName = 'NOTIFICAEMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object IntegerField34: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object SQLTimeStampField11: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object StringField127: TStringField
      FieldName = 'IM'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
    object StringField130: TStringField
      FieldName = 'CELULAR'
      ProviderFlags = [pfInUpdate]
      Size = 16
    end
    object StringField131: TStringField
      FieldName = 'HASH'
      ProviderFlags = [pfInUpdate]
      Size = 64
    end
    object StringField132: TStringField
      FieldName = 'INDICADORIE'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlFornecedoresIDESTRANGEIRO: TStringField
      FieldName = 'IDESTRANGEIRO'
      Size = 25
    end
  end
  object dspFornecedores: TDataSetProvider
    DataSet = sqlFornecedores
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspFornecedoresBeforeUpdateRecord
    Left = 528
    Top = 1384
  end
  object sqlFornecedores_Contatos: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'Select * from FORNECEDORES_CONTATOS '#13#10'where EMPRESA = :EMPRESA a' +
      'nd FILIAL = :FILIAL and CODIGO = :CODIGO'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsFornecedores
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 640
    Top = 1384
    object StringField133: TStringField
      FieldName = 'EMPRESA'
      Required = True
      Size = 2
    end
    object StringField134: TStringField
      FieldName = 'FILIAL'
      Required = True
      Size = 2
    end
    object IntegerField37: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object IntegerField38: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object StringField135: TStringField
      FieldName = 'NOME'
      Size = 80
    end
    object StringField136: TStringField
      FieldName = 'AREA'
      Size = 25
    end
    object StringField137: TStringField
      FieldName = 'CARGO'
      Size = 25
    end
    object StringField138: TStringField
      FieldName = 'DDI'
      Size = 3
    end
    object StringField139: TStringField
      FieldName = 'DDD'
      Size = 3
    end
    object StringField140: TStringField
      FieldName = 'NUMERO'
      Required = True
      Size = 16
    end
    object StringField141: TStringField
      FieldName = 'RAMAL'
      Size = 4
    end
    object StringField142: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 1
    end
    object StringField143: TStringField
      FieldName = 'EMAIL'
      Size = 60
    end
    object SQLTimeStampField12: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      Required = True
    end
  end
  object dtsFornecedores: TDataSource
    DataSet = sqlFornecedores
    Left = 640
    Top = 1328
  end
  object sqlFornecedores_Produtos: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select * from FORNECEDORES_PRODUTOS '#13#10'where EMPRESA = EMPRESA an' +
      'd FILIAL = :FILIAL and CODIGO = :CODIGO'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsFornecedores
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 755
    Top = 1328
    object StringField144: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object StringField145: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object IntegerField39: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField40: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField146: TStringField
      FieldName = 'PRODUTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 15
    end
    object StringField147: TStringField
      FieldName = 'PRODUTOFORNECEDOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 15
    end
    object StringField148: TStringField
      FieldName = 'CODIGOBARRASFORNECEDOR'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object StringField149: TStringField
      FieldName = 'DESCRICAOFORNECEDOR'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object StringField150: TStringField
      FieldName = 'UNIDADEMEDIDA'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object SQLTimeStampField13: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlFornecedores_ProdutosPRECOCUSTO: TFloatField
      DisplayLabel = 'Pre'#231'o de Custo'
      FieldName = 'PRECOCUSTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'R$ #,##0.00#####'
      EditFormat = '0.00######'
    end
    object sqlClientes_ProdutosATUALIZACAO: TDateField
      DisplayLabel = 'Atualiza'#231#227'o'
      FieldName = 'ATUALIZACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
  end
  object sqlFicha_Cadastral: TSQLDataSet
    SchemaName = 'sysdba'
    BeforeOpen = sqlFicha_CadastralBeforeOpen
    CommandText = 
      'SELECT A.*, B.REDUZIDO AS NOMEVENDEDOR FROM FICHA_CADASTRAL A LE' +
      'FT JOIN VENDEDORES B ON (B.EMPRESA = :EMPRESA_VENDEDORES AND B.F' +
      'ILIAL = :FILIAL_VENDEDORES AND B.CODIGO = A.VENDEDOR)'#13#10'WHERE A.E' +
      'MPRESA = :EMPRESA AND A.FILIAL = :FILIAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA_VENDEDORES'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL_VENDEDORES'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 2
      end>
    SQLConnection = SQLConnection1
    Left = 963
    Top = 1338
    object sqlFicha_CadastralEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlFicha_CadastralFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlFicha_CadastralCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlFicha_CadastralSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object sqlFicha_CadastralCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object sqlFicha_CadastralEMISSAO: TDateField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'EMISSAO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/0000;1;_'
    end
    object sqlFicha_CadastralNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 150
    end
    object sqlFicha_CadastralREDUZIDO: TStringField
      DisplayLabel = 'Reduzido'
      FieldName = 'REDUZIDO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 240
    end
    object sqlFicha_CadastralCNPJ: TStringField
      DisplayLabel = 'Cnpj'
      FieldName = 'CNPJ'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
    object sqlFicha_CadastralIE: TStringField
      DisplayLabel = 'Inscri'#231#227'o Estadual'
      FieldName = 'IE'
      ProviderFlags = [pfInUpdate]
      Size = 22
    end
    object sqlFicha_CadastralENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 90
    end
    object sqlFicha_CadastralNUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 5
    end
    object sqlFicha_CadastralBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object sqlFicha_CadastralMUNICIPIO: TStringField
      DisplayLabel = 'Munic'#237'pio'
      FieldName = 'MUNICIPIO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object sqlFicha_CadastralUF: TStringField
      FieldName = 'UF'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object sqlFicha_CadastralCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '99999-999;0;_'
      Size = 8
    end
    object sqlFicha_CadastralHOMEPAGE: TStringField
      DisplayLabel = 'Site'
      FieldName = 'HOMEPAGE'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object sqlFicha_CadastralDDI: TStringField
      FieldName = 'DDI'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object sqlFicha_CadastralDDD: TStringField
      FieldName = 'DDD'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object sqlFicha_CadastralTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '000000009;1;_'
      Size = 16
    end
    object sqlFicha_CadastralFAX: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
      ProviderFlags = [pfInUpdate]
      EditMask = '000000009;1;_'
      Size = 16
    end
    object sqlFicha_CadastralCELULAR: TStringField
      DisplayLabel = 'Celular'
      FieldName = 'CELULAR'
      ProviderFlags = [pfInUpdate]
      EditMask = '90000-0009;0;_'
      Size = 16
    end
    object sqlFicha_CadastralCOMPRADOR: TStringField
      DisplayLabel = 'Comprador'
      FieldName = 'COMPRADOR'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object sqlFicha_CadastralPROPRIETARIO: TStringField
      DisplayLabel = 'Propriet'#225'rio'
      FieldName = 'PROPRIETARIO'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object sqlFicha_CadastralEMAILNFE: TStringField
      DisplayLabel = 'Email Nfe'
      FieldName = 'EMAILNFE'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object sqlFicha_CadastralPOSSUISKYPE: TStringField
      DisplayLabel = 'Possui Skype'
      FieldName = 'POSSUISKYPE'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlFicha_CadastralOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object sqlFicha_CadastralBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFicha_CadastralAGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'AGENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object sqlFicha_CadastralCONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'CONTA'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object sqlFicha_CadastralGERENTEBANCO: TStringField
      DisplayLabel = 'Gerente do Banco'
      FieldName = 'GERENTEBANCO'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object sqlFicha_CadastralDDIBANCO: TStringField
      DisplayLabel = 'DDI Banco'
      FieldName = 'DDIBANCO'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object sqlFicha_CadastralDDDBANCO: TStringField
      DisplayLabel = 'DDD Banco'
      FieldName = 'DDDBANCO'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object sqlFicha_CadastralTELEFONEBANCO: TStringField
      DisplayLabel = 'Telefone do Banco'
      FieldName = 'TELEFONEBANCO'
      ProviderFlags = [pfInUpdate]
      EditMask = '90000-0009;0;_'
      Size = 16
    end
    object sqlFicha_CadastralOBSERVACAOGERAL: TStringField
      DisplayLabel = 'Observa'#231#227'o Geral'
      FieldName = 'OBSERVACAOGERAL'
      ProviderFlags = [pfInUpdate]
      Size = 1024
    end
    object sqlFicha_CadastralVENDEDOR: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'VENDEDOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlFicha_CadastralCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object sqlFicha_CadastralDATACADASTRO: TSQLTimeStampField
      DisplayLabel = 'Data de Cadastro'
      FieldName = 'DATACADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '99/99/0000 90:00:00;1;_'
    end
    object sqlFicha_CadastralDDDCELULAR: TStringField
      DisplayLabel = 'DDD Celular'
      FieldName = 'DDDCELULAR'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object sqlFicha_CadastralFORNECEDOR1: TStringField
      DisplayLabel = 'Fornecedor 1'
      FieldName = 'FORNECEDOR1'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object sqlFicha_CadastralFORNECEDOR2: TStringField
      DisplayLabel = 'Fornecedor 2'
      FieldName = 'FORNECEDOR2'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object sqlFicha_CadastralFORNECEDOR3: TStringField
      DisplayLabel = 'Fornecedor 3'
      FieldName = 'FORNECEDOR3'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object sqlFicha_CadastralFORNECEDOR4: TStringField
      DisplayLabel = 'Fornecedor 4'
      FieldName = 'FORNECEDOR4'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object sqlFicha_CadastralTELEFONEFORNECEDOR1: TStringField
      DisplayLabel = 'Telefone Fornecedor 1'
      FieldName = 'TELEFONEFORNECEDOR1'
      ProviderFlags = [pfInUpdate]
      EditMask = '90000-0009;0;_'
      Size = 16
    end
    object sqlFicha_CadastralTELEFONEFORNECEDOR2: TStringField
      DisplayLabel = 'Telefone Fornecedor 2'
      FieldName = 'TELEFONEFORNECEDOR2'
      ProviderFlags = [pfInUpdate]
      EditMask = '90000-0009;0;_'
      Size = 16
    end
    object sqlFicha_CadastralTELEFONEFORNECEDOR3: TStringField
      DisplayLabel = 'Telefone Fornecedor 3'
      FieldName = 'TELEFONEFORNECEDOR3'
      ProviderFlags = [pfInUpdate]
      EditMask = '90000-0009;0;_'
      Size = 16
    end
    object sqlFicha_CadastralTELEFONEFORNECEDOR4: TStringField
      DisplayLabel = 'Telefone Fornecedor 4'
      FieldName = 'TELEFONEFORNECEDOR4'
      ProviderFlags = [pfInUpdate]
      EditMask = '90000-0009;0;_'
      Size = 16
    end
    object sqlFicha_CadastralNOMEVENDEDOR: TStringField
      DisplayLabel = 'Nome do Vendedor'
      FieldName = 'NOMEVENDEDOR'
      ProviderFlags = []
      Size = 240
    end
    object sqlFicha_CadastralDDDFORNECEDOR1: TStringField
      FieldName = 'DDDFORNECEDOR1'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object sqlFicha_CadastralDDDFORNECEDOR2: TStringField
      FieldName = 'DDDFORNECEDOR2'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object sqlFicha_CadastralDDDFORNECEDOR3: TStringField
      FieldName = 'DDDFORNECEDOR3'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object sqlFicha_CadastralDDDFORNECEDOR4: TStringField
      FieldName = 'DDDFORNECEDOR4'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object sqlFicha_CadastralDATAFUNDACAO: TDateField
      FieldName = 'DATAFUNDACAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFicha_CadastralCNAEPRINCIPAL: TStringField
      FieldName = 'CNAEPRINCIPAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 7
    end
    object sqlFicha_CadastralCNAESECUNDARIO: TStringField
      FieldName = 'CNAESECUNDARIO'
      ProviderFlags = [pfInUpdate]
      Size = 7
    end
    object sqlFicha_CadastralORIGEMCADASTRO: TStringField
      FieldName = 'ORIGEMCADASTRO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlFicha_CadastralBANCO2: TIntegerField
      FieldName = 'BANCO2'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFicha_CadastralAGENCIA2: TStringField
      FieldName = 'AGENCIA2'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object sqlFicha_CadastralCONTA2: TStringField
      FieldName = 'CONTA2'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object sqlFicha_CadastralGERENTEBANCO2: TStringField
      FieldName = 'GERENTEBANCO2'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object sqlFicha_CadastralDDIBANCO2: TStringField
      FieldName = 'DDIBANCO2'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object sqlFicha_CadastralDDDBANCO2: TStringField
      FieldName = 'DDDBANCO2'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object sqlFicha_CadastralTELEFONEBANCO2: TStringField
      FieldName = 'TELEFONEBANCO2'
      ProviderFlags = [pfInUpdate]
      Size = 16
    end
    object sqlFicha_CadastralBANCO3: TIntegerField
      FieldName = 'BANCO3'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFicha_CadastralAGENCIA3: TStringField
      FieldName = 'AGENCIA3'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object sqlFicha_CadastralCONTA3: TStringField
      FieldName = 'CONTA3'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object sqlFicha_CadastralGERENTEBANCO3: TStringField
      FieldName = 'GERENTEBANCO3'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object sqlFicha_CadastralDDIBANCO3: TStringField
      FieldName = 'DDIBANCO3'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object sqlFicha_CadastralDDDBANCO3: TStringField
      FieldName = 'DDDBANCO3'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object sqlFicha_CadastralTELEFONEBANCO3: TStringField
      FieldName = 'TELEFONEBANCO3'
      ProviderFlags = [pfInUpdate]
      Size = 16
    end
    object sqlFicha_CadastralFACHADA: TStringField
      FieldName = 'FACHADA'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object sqlFicha_CadastralVISITACAMPO: TStringField
      FieldName = 'VISITACAMPO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlFicha_CadastralEMAIL: TStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
  end
  object dspFicha_Cadastral: TDataSetProvider
    DataSet = sqlFicha_Cadastral
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspFicha_CadastralBeforeUpdateRecord
    Left = 963
    Top = 1392
  end
  object dtsFicha_Cadastral: TDataSource
    DataSet = sqlFicha_Cadastral
    Left = 1072
    Top = 1336
  end
  object sqlFicha_Documentos: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'SELECT * FROM FICHA_CADASTRAL_DOCUMENTOS WHERE EMPRESA = :EMPRES' +
      'A AND FILIAL = :FILIAL AND CODIGO = :CODIGO'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsFicha_Cadastral
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1072
    Top = 1392
    object sqlFicha_DocumentosEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlFicha_DocumentosFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlFicha_DocumentosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlFicha_DocumentosSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlFicha_DocumentosCAMINHO: TStringField
      FieldName = 'CAMINHO'
      ProviderFlags = [pfInUpdate]
      Size = 1024
    end
    object sqlFicha_DocumentosNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 512
    end
    object sqlFicha_DocumentosDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFicha_DocumentosUSUARIO: TIntegerField
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspOfertas_Especiais: TDataSetProvider
    DataSet = sqlOfertas_Especiais
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspOfertas_EspeciaisBeforeUpdateRecord
    Left = 1299
    Top = 1200
  end
  object sqlOfertas_Especiais: TSQLDataSet
    SchemaName = 'sysdba'
    BeforeOpen = sqlOfertas_EspeciaisBeforeOpen
    CommandText = 
      'SELECT A.*, B.DESCRICAO, B.CORDESTAQUE'#13#10'FROM OFERTAS_ESPECIAIS A' +
      #13#10'JOIN PRODUTOS B ON (B.EMPRESA = :EMPRESA_PRODUTOS AND B.FILIAL' +
      ' = :FILIAL_PRODUTOS AND B.CODIGO = A.PRODUTO)'#13#10'WHERE'#13#10'A.EMPRESA ' +
      '= :EMPRESA AND A.FILIAL = :FILIAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA_PRODUTOS'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL_PRODUTOS'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 2
      end>
    SQLConnection = SQLConnection1
    Left = 1299
    Top = 1154
    object sqlOfertas_EspeciaisEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlOfertas_EspeciaisFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlOfertas_EspeciaisSTATUS: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlOfertas_EspeciaisCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlOfertas_EspeciaisPRODUTO: TStringField
      FieldName = 'PRODUTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 15
    end
    object sqlOfertas_EspeciaisDATAINCLUSAO: TDateField
      FieldName = 'DATAINCLUSAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlOfertas_EspeciaisDATAFINALIZACAO: TDateField
      FieldName = 'DATAFINALIZACAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlOfertas_EspeciaisQUANTIDADE1: TIntegerField
      FieldName = 'QUANTIDADE1'
      ProviderFlags = [pfInUpdate]
    end
    object sqlOfertas_EspeciaisPRECOFORA1: TFloatField
      FieldName = 'PRECOFORA1'
      ProviderFlags = [pfInUpdate]
    end
    object sqlOfertas_EspeciaisPRECOSP1: TFloatField
      FieldName = 'PRECOSP1'
      ProviderFlags = [pfInUpdate]
    end
    object sqlOfertas_EspeciaisQUANTIDADE2: TIntegerField
      FieldName = 'QUANTIDADE2'
      ProviderFlags = [pfInUpdate]
    end
    object sqlOfertas_EspeciaisPRECOFORA2: TFloatField
      FieldName = 'PRECOFORA2'
      ProviderFlags = [pfInUpdate]
    end
    object sqlOfertas_EspeciaisPRECOSP2: TFloatField
      FieldName = 'PRECOSP2'
      ProviderFlags = [pfInUpdate]
    end
    object sqlOfertas_EspeciaisQUANTIDADE3: TIntegerField
      FieldName = 'QUANTIDADE3'
      ProviderFlags = [pfInUpdate]
    end
    object sqlOfertas_EspeciaisPRECOFORA3: TFloatField
      FieldName = 'PRECOFORA3'
      ProviderFlags = [pfInUpdate]
    end
    object sqlOfertas_EspeciaisPRECOSP3: TFloatField
      FieldName = 'PRECOSP3'
      ProviderFlags = [pfInUpdate]
    end
    object sqlOfertas_EspeciaisOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 512
    end
    object sqlOfertas_EspeciaisDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlOfertas_EspeciaisDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = []
      Required = True
      Size = 240
    end
    object sqlOfertas_EspeciaisCORDESTAQUE: TIntegerField
      FieldName = 'CORDESTAQUE'
      ProviderFlags = []
    end
  end
  object sqlMunicipios_Braspress: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'SELECT * FROM MUNICIPIOS_BRASPRESS WHERE EMPRESA = :EMPRESA AND ' +
      'FILIAL = :FILIAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    Left = 1304
    Top = 1336
    object sqlMunicipios_BraspressEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlMunicipios_BraspressFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlMunicipios_BraspressCMUNICIPIO: TStringField
      FieldName = 'CMUNICIPIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 7
    end
    object sqlMunicipios_BraspressUF: TStringField
      FieldName = 'UF'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlMunicipios_BraspressTIPO: TStringField
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlMunicipios_BraspressMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlMunicipios_BraspressTXMATE10KG: TFloatField
      FieldName = 'TXMATE10KG'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMunicipios_BraspressPERCENTUALATE10KG: TFloatField
      FieldName = 'PERCENTUALATE10KG'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMunicipios_BraspressTASATE10KG: TFloatField
      FieldName = 'TASATE10KG'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMunicipios_BraspressTXMATE20KG: TFloatField
      FieldName = 'TXMATE20KG'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMunicipios_BraspressPERCENTUALATE20KG: TFloatField
      FieldName = 'PERCENTUALATE20KG'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMunicipios_BraspressTASATE20KG: TFloatField
      FieldName = 'TASATE20KG'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMunicipios_BraspressTXMATE30KG: TFloatField
      FieldName = 'TXMATE30KG'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMunicipios_BraspressPERCENTUALATE30KG: TFloatField
      FieldName = 'PERCENTUALATE30KG'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMunicipios_BraspressTASATE30KG: TFloatField
      FieldName = 'TASATE30KG'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMunicipios_BraspressTXMATE40KG: TFloatField
      FieldName = 'TXMATE40KG'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMunicipios_BraspressPERCENTUALATE40KG: TFloatField
      FieldName = 'PERCENTUALATE40KG'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMunicipios_BraspressTASATE40KG: TFloatField
      FieldName = 'TASATE40KG'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMunicipios_BraspressTXMATE50KG: TFloatField
      FieldName = 'TXMATE50KG'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMunicipios_BraspressPERCENTUALATE50KG: TFloatField
      FieldName = 'PERCENTUALATE50KG'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMunicipios_BraspressTASATE50KG: TFloatField
      FieldName = 'TASATE50KG'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMunicipios_BraspressTXMATE60KG: TFloatField
      FieldName = 'TXMATE60KG'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMunicipios_BraspressPERCENTUALATE60KG: TFloatField
      FieldName = 'PERCENTUALATE60KG'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMunicipios_BraspressTASATE60KG: TFloatField
      FieldName = 'TASATE60KG'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMunicipios_BraspressTXMATE70KG: TFloatField
      FieldName = 'TXMATE70KG'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMunicipios_BraspressPERCENTUALATE70KG: TFloatField
      FieldName = 'PERCENTUALATE70KG'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMunicipios_BraspressTASATE70KG: TFloatField
      FieldName = 'TASATE70KG'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMunicipios_BraspressTXMACIMA70KG: TFloatField
      FieldName = 'TXMACIMA70KG'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMunicipios_BraspressPERCENTUALACIMA70KG: TFloatField
      FieldName = 'PERCENTUALACIMA70KG'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMunicipios_BraspressTASACIMA70KG: TFloatField
      FieldName = 'TASACIMA70KG'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMunicipios_BraspressDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspMunicipios_Braspress: TDataSetProvider
    DataSet = sqlMunicipios_Braspress
    Options = [poIncFieldProps, poCascadeUpdates, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 1304
    Top = 1392
  end
  object sqlCadastro_Visita: TSQLDataSet
    CommandText = 
      'select * from RELATORIO_VISITAS where EMPRESA = :EMPRESA AND FIL' +
      'IAL = :FILIAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 2
      end>
    SQLConnection = SQLConnection1
    Left = 88
    Top = 1480
    object sqlCadastro_VisitaEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlCadastro_VisitaFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlCadastro_VisitaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlCadastro_VisitaDATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCadastro_VisitaOBJETIVOVISITA: TStringField
      FieldName = 'OBJETIVOVISITA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaVENDEDOR: TIntegerField
      FieldName = 'VENDEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCadastro_VisitaNOMEVENDEDOR: TStringField
      FieldName = 'NOMEVENDEDOR'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object sqlCadastro_VisitaCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCadastro_VisitaNOMECLIENTE: TStringField
      FieldName = 'NOMECLIENTE'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object sqlCadastro_VisitaALLSEMI: TStringField
      FieldName = 'ALLSEMI'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaMXT: TStringField
      FieldName = 'MXT'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaRICOPECAS: TStringField
      FieldName = 'RICOPECAS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaHAYAMAX: TStringField
      FieldName = 'HAYAMAX'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaSTA: TStringField
      FieldName = 'STA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaELGIN: TStringField
      FieldName = 'ELGIN'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaMULTILASER: TStringField
      FieldName = 'MULTILASER'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaDUALCOMP: TStringField
      FieldName = 'DUALCOMP'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaINTER: TStringField
      FieldName = 'INTER'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaODERSO: TStringField
      FieldName = 'ODERSO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaOUTROSCONC: TStringField
      FieldName = 'OUTROSCONC'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaOBSOUTROSCONC: TStringField
      FieldName = 'OBSOUTROSCONC'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlCadastro_VisitaMENOR10K: TStringField
      FieldName = 'MENOR10K'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaMENOR20K: TStringField
      FieldName = 'MENOR20K'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaMENOR30K: TStringField
      FieldName = 'MENOR30K'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaMENOR50K: TStringField
      FieldName = 'MENOR50K'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaMENOR100K: TStringField
      FieldName = 'MENOR100K'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaMAIOR100K: TStringField
      FieldName = 'MAIOR100K'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaCOMPONENTES: TStringField
      FieldName = 'COMPONENTES'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaACESSORIOS: TStringField
      FieldName = 'ACESSORIOS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaCOMPEACESS: TStringField
      FieldName = 'COMPEACESS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaVOLUME: TStringField
      FieldName = 'VOLUME'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaMIX: TStringField
      FieldName = 'MIX'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaVOLEMIX: TStringField
      FieldName = 'VOLEMIX'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaPRECO: TStringField
      FieldName = 'PRECO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaATENDIMENTO: TStringField
      FieldName = 'ATENDIMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaINVESTIMENTO: TStringField
      FieldName = 'INVESTIMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaTABLOIDE: TStringField
      FieldName = 'TABLOIDE'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaAMBIENTACAO: TStringField
      FieldName = 'AMBIENTACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaCAMPANHA: TStringField
      FieldName = 'CAMPANHA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaEXPOSITOR: TStringField
      FieldName = 'EXPOSITOR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaUNIFORME: TStringField
      FieldName = 'UNIFORME'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaFACHADA: TStringField
      FieldName = 'FACHADA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaOBSOUTROSINVEST: TStringField
      FieldName = 'OBSOUTROSINVEST'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object sqlCadastro_VisitaRESUMOVISITA: TStringField
      FieldName = 'RESUMOVISITA'
      ProviderFlags = [pfInUpdate]
      Size = 400
    end
    object sqlCadastro_VisitaDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCadastro_VisitaINFCOMPLEMENTAR: TStringField
      FieldName = 'INFCOMPLEMENTAR'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object sqlCadastro_VisitaOUTROINVEST: TStringField
      FieldName = 'OUTROINVEST'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlCadastro_VisitaASCOMPONENTES: TStringField
      FieldName = 'ASCOMPONENTES'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object dspCadastro_Visita: TDataSetProvider
    DataSet = sqlCadastro_Visita
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspCadastro_VisitaBeforeUpdateRecord
    Left = 88
    Top = 1528
  end
  object sqlConsulta_Meta_Clientes: TSQLDataSet
    SchemaName = 'sysdba'
    BeforeOpen = sqlConsulta_Meta_ClientesBeforeOpen
    CommandText = 
      'select *'#13#10'from SP_METAS_CLIENTES2(:EMPRESA_CLIENTES, :FILIAL_CLI' +
      'ENTES, :EMPRESA_VENDEDORES, :FILIAL_VENDEDORES, :EMPRESA_PEDIDOS' +
      ', :FILIAL_PEDIDOS, :EMPRESA_CONTATOS_HISTORICOS, :FILIAL_CONTATO' +
      'S_HISTORICOS, :EMPRESA_NOTAS, :FILIAL_NOTAS, :EMISSAODIADE, :EMI' +
      'SSAODIAATE, :EMISSAOMESDE, :EMISSAOMESATE, :EMISSAOANODE, :EMISS' +
      'AOANOATE)'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA_CLIENTES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL_CLIENTES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMPRESA_VENDEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL_VENDEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMPRESA_PEDIDOS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL_PEDIDOS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMPRESA_CONTATOS_HISTORICOS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL_CONTATOS_HISTORICOS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMPRESA_NOTAS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL_NOTAS'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'EMISSAODIADE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'EMISSAODIAATE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'EMISSAOMESDE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'EMISSAOMESATE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'EMISSAOANODE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'EMISSAOANOATE'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 536
    Top = 1472
    object sqlConsulta_Meta_ClientesEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlConsulta_Meta_ClientesFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlConsulta_Meta_ClientesCODIGO: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlConsulta_Meta_ClientesNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 150
    end
    object sqlConsulta_Meta_ClientesMAIORCOMPRA: TFloatField
      DisplayLabel = 'Maior Compra'
      FieldName = 'MAIORCOMPRA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'R$ #,##0.00######'
    end
    object sqlConsulta_Meta_ClientesMENORCOMPRA: TFloatField
      DisplayLabel = 'Menor Compra'
      FieldName = 'MENORCOMPRA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'R$ #,##0.00######'
    end
    object sqlConsulta_Meta_ClientesULTIMACOMPRA: TDateField
      DisplayLabel = 'Ultima Compra'
      FieldName = 'ULTIMACOMPRA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlConsulta_Meta_ClientesNUMEROCOMPRAS: TIntegerField
      DisplayLabel = 'N'#250'mero de compras'
      FieldName = 'NUMEROCOMPRAS'
      ProviderFlags = [pfInUpdate]
    end
    object sqlConsulta_Meta_ClientesLIMITECREDITO: TFloatField
      DisplayLabel = 'Limite de cr'#233'dito'
      FieldName = 'LIMITECREDITO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'R$ #,##0.00######'
    end
    object sqlConsulta_Meta_ClientesSALDOCREDITO: TFloatField
      DisplayLabel = 'Saldo cr'#233'dito'
      FieldName = 'SALDOCREDITO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'R$ #,##0.00######'
    end
    object sqlConsulta_Meta_ClientesMETA: TFloatField
      DisplayLabel = 'Meta'
      FieldName = 'META'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'R$ #,##0.00######'
    end
    object sqlConsulta_Meta_ClientesVENDEDOR: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'VENDEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlConsulta_Meta_ClientesNOMEVENDEDOR: TStringField
      DisplayLabel = 'Nome do vendedor'
      FieldName = 'NOMEVENDEDOR'
      ProviderFlags = []
      Size = 240
    end
    object sqlConsulta_Meta_ClientesDATACADASTRO: TDateField
      DisplayLabel = 'Data de cadastro'
      FieldName = 'DATACADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlConsulta_Meta_ClientesTOTALPEDIDOSMES: TIntegerField
      DisplayLabel = 'Total de pedidos no m'#234's'
      FieldName = 'TOTALPEDIDOSMES'
      ProviderFlags = [pfInUpdate]
    end
    object sqlConsulta_Meta_ClientesTOTALPEDIDOSDIA: TIntegerField
      DisplayLabel = 'Total de pedidos no dia'
      FieldName = 'TOTALPEDIDOSDIA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlConsulta_Meta_ClientesTOTALPEDIDOS1A6: TIntegerField
      DisplayLabel = 'Total de pedidos 1 a 6'
      FieldName = 'TOTALPEDIDOS1A6'
      ProviderFlags = [pfInUpdate]
    end
    object sqlConsulta_Meta_ClientesCOMPRASMES: TFloatField
      DisplayLabel = 'Compras no m'#234's'
      FieldName = 'COMPRASMES'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'R$ #,##0.00######'
    end
  end
  object dspConsulta_Meta_Clientes: TDataSetProvider
    DataSet = sqlConsulta_Meta_Clientes
    Options = [poDisableInserts, poDisableDeletes, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    OnGetTableName = dspConsulta_Meta_ClientesGetTableName
    Left = 536
    Top = 1523
  end
  object sqlControle_Cambio: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select * from CONTROLE_CAMBIO where EMPRESA = :EMPRESA and FILIA' +
      'L = :FILIAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 2
      end>
    SQLConnection = SQLConnection1
    Left = 752
    Top = 1472
    object sqlControle_CambioEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlControle_CambioFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlControle_CambioFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlControle_CambioITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlControle_CambioTIPO: TStringField
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlControle_CambioDATAFECHAMENTO: TDateField
      FieldName = 'DATAFECHAMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlControle_CambioIMPORTACAO: TIntegerField
      FieldName = 'IMPORTACAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlControle_CambioINVOICE: TStringField
      FieldName = 'INVOICE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlControle_CambioCONTRATO: TStringField
      FieldName = 'CONTRATO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlControle_CambioDI: TStringField
      FieldName = 'DI'
      ProviderFlags = [pfInUpdate]
    end
    object sqlControle_CambioTIPOFRETE: TStringField
      FieldName = 'TIPOFRETE'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlControle_CambioVALOR: TFloatField
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlControle_CambioTAXADOLAR: TFloatField
      FieldName = 'TAXADOLAR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlControle_CambioOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object sqlControle_CambioDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlControle_CambioDESCONTO: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'DESCONTO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspControle_Cambio: TDataSetProvider
    DataSet = sqlControle_Cambio
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspControle_CambioBeforeUpdateRecord
    Left = 752
    Top = 1523
  end
  object sqlClientes_Visitas: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select * from clientes_visitas where empresa = :empresa and fili' +
      'al = :filial'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'empresa'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'filial'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 88
    Top = 1632
    object sqlClientes_VisitasEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlClientes_VisitasFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlClientes_VisitasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlClientes_VisitasCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientes_VisitasNOMECLIENTE: TStringField
      FieldName = 'NOMECLIENTE'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object sqlClientes_VisitasVENDEDOR: TIntegerField
      FieldName = 'VENDEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientes_VisitasNOMEVENDEDOR: TStringField
      FieldName = 'NOMEVENDEDOR'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object sqlClientes_VisitasDATA: TDateField
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientes_VisitasINFCOMPLEMENTAR: TStringField
      FieldName = 'INFCOMPLEMENTAR'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object sqlClientes_VisitasALLSEMI: TStringField
      FieldName = 'ALLSEMI'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasMXT: TStringField
      FieldName = 'MXT'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasRICOPECAS: TStringField
      FieldName = 'RICOPECAS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasHAYAMAX: TStringField
      FieldName = 'HAYAMAX'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasSTA: TStringField
      FieldName = 'STA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasELGIN: TStringField
      FieldName = 'ELGIN'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasMULTILASER: TStringField
      FieldName = 'MULTILASER'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasDUALCOMP: TStringField
      FieldName = 'DUALCOMP'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasINTER: TStringField
      FieldName = 'INTER'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasASCOMPONENTES: TStringField
      FieldName = 'ASCOMPONENTES'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasODERSO: TStringField
      FieldName = 'ODERSO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasOUTROSCONC: TStringField
      FieldName = 'OUTROSCONC'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasOBSOUTROSCONC: TStringField
      FieldName = 'OBSOUTROSCONC'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlClientes_VisitasMENOR10K: TStringField
      FieldName = 'MENOR10K'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasMENOR20K: TStringField
      FieldName = 'MENOR20K'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasMENOR30K: TStringField
      FieldName = 'MENOR30K'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasMENOR50K: TStringField
      FieldName = 'MENOR50K'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasMENOR100K: TStringField
      FieldName = 'MENOR100K'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasMAIOR100K: TStringField
      FieldName = 'MAIOR100K'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasCOMPONENTES: TStringField
      FieldName = 'COMPONENTES'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasACESSORIOS: TStringField
      FieldName = 'ACESSORIOS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasCOMPEACESS: TStringField
      FieldName = 'COMPEACESS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasVOLUME: TStringField
      FieldName = 'VOLUME'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasMIX: TStringField
      FieldName = 'MIX'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasVOLEMIX: TStringField
      FieldName = 'VOLEMIX'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasPRECO: TStringField
      FieldName = 'PRECO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasATENDIMENTO: TStringField
      FieldName = 'ATENDIMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasINVESTIMENTO: TStringField
      FieldName = 'INVESTIMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasTABLOIDE: TStringField
      FieldName = 'TABLOIDE'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasAMBIENTACAO: TStringField
      FieldName = 'AMBIENTACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasCAMPANHA: TStringField
      FieldName = 'CAMPANHA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasEXPOSITOR: TStringField
      FieldName = 'EXPOSITOR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasUNIFORME: TStringField
      FieldName = 'UNIFORME'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasFACHADA: TStringField
      FieldName = 'FACHADA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasOUTROSINVEST: TStringField
      FieldName = 'OUTROSINVEST'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_VisitasOBSOUTROSINVEST: TStringField
      FieldName = 'OBSOUTROSINVEST'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object sqlClientes_VisitasRESUMOVISITA: TStringField
      FieldName = 'RESUMOVISITA'
      ProviderFlags = [pfInUpdate]
      Size = 400
    end
    object sqlClientes_VisitasDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientes_VisitasOBJETIVOVISITA: TStringField
      FieldName = 'OBJETIVOVISITA'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object dspClientes_Visitas: TDataSetProvider
    DataSet = sqlClientes_Visitas
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspClientes_VisitasBeforeUpdateRecord
    Left = 88
    Top = 1704
  end
  object sqlClientes_Visitas_Documentos: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'SELECT * FROM CLIENTES_VISITAS_DOCUMENTOS WHERE EMPRESA = :EMPRE' +
      'SA AND FILIAL = :FILIAL AND CODIGO = :CODIGO'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsClientes_Visitas
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    Left = 224
    Top = 1704
    object sqlClientes_Visitas_DocumentosEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlClientes_Visitas_DocumentosFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlClientes_Visitas_DocumentosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlClientes_Visitas_DocumentosSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlClientes_Visitas_DocumentosCAMINHO: TStringField
      FieldName = 'CAMINHO'
      ProviderFlags = [pfInUpdate]
      Size = 1024
    end
    object sqlClientes_Visitas_DocumentosNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 512
    end
    object sqlClientes_Visitas_DocumentosDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dtsClientes_Visitas: TDataSource
    DataSet = sqlClientes_Visitas
    Left = 224
    Top = 1632
  end
  object sqlGrupos_Clientes_Dados: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select * from GRUPOS_CLIENTES_DADOS where empresa = :EMPRESA and' +
      ' filial = :FILIAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 2
      end>
    SQLConnection = SQLConnection1
    Left = 1056
    Top = 1469
    object sqlGrupos_Clientes_DadosEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlGrupos_Clientes_DadosFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlGrupos_Clientes_DadosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlGrupos_Clientes_DadosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object sqlGrupos_Clientes_DadosDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspGrupos_Clientes_Dados: TDataSetProvider
    DataSet = sqlGrupos_Clientes_Dados
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspGrupos_Clientes_DadosBeforeUpdateRecord
    Left = 1056
    Top = 1536
  end
  object dtsGrupos_Clientes_Dados: TDataSource
    DataSet = sqlGrupos_Clientes_Dados
    Left = 1200
    Top = 1536
  end
  object sqlGrupos_Clientes_Itens: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select * from GRUPOS_CLIENTES_ITENS where empresa = :EMPRESA and' +
      ' filial = :FILIAL and CODIGO = :CODIGO'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsGrupos_Clientes_Dados
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1200
    Top = 1472
    object sqlGrupos_Clientes_ItensEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlGrupos_Clientes_ItensFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlGrupos_Clientes_ItensCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlGrupos_Clientes_ItensCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlGrupos_Clientes_ItensNOMECLIENTE: TStringField
      FieldName = 'NOMECLIENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object sqlGrupos_Clientes_ItensOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object sqlGrupos_Clientes_ItensUFCLIENTE: TStringField
      FieldName = 'UFCLIENTE'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlGrupos_Clientes_ItensMUNICIPIOCLIENTE: TStringField
      FieldName = 'MUNICIPIOCLIENTE'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object sqlGrupos_Clientes_ItensENDERECOCLIENTE: TStringField
      FieldName = 'ENDERECOCLIENTE'
      ProviderFlags = [pfInUpdate]
      Size = 90
    end
    object sqlGrupos_Clientes_ItensDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object sqlNotas_Concorrentes: TSQLDataSet
    CommandText = 
      'select * from NOTAS_CONCORRENTES where EMPRESA = :EMPRESA AND FI' +
      'LIAL = :FILIAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 2
      end>
    SQLConnection = SQLConnection1
    Left = 304
    Top = 1472
    object sqlNotas_ConcorrentesEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlNotas_ConcorrentesFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlNotas_ConcorrentesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlNotas_ConcorrentesNUMERO: TIntegerField
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlNotas_ConcorrentesSERIE: TStringField
      FieldName = 'SERIE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 3
    end
    object sqlNotas_ConcorrentesITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate]
    end
    object sqlNotas_ConcorrentesCLIENTESANTANA: TIntegerField
      FieldName = 'CLIENTESANTANA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlNotas_ConcorrentesEMISSAO: TDateField
      FieldName = 'EMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlNotas_ConcorrentesHORA: TTimeField
      FieldName = 'HORA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlNotas_ConcorrentesCNPJ: TStringField
      FieldName = 'CNPJ'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object sqlNotas_ConcorrentesNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlNotas_ConcorrentesIE: TStringField
      FieldName = 'IE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlNotas_ConcorrentesEMAIL: TStringField
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlNotas_ConcorrentesENDERECO: TStringField
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlNotas_ConcorrentesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object sqlNotas_ConcorrentesMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object sqlNotas_ConcorrentesCMUNICIPIO: TStringField
      FieldName = 'CMUNICIPIO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object sqlNotas_ConcorrentesUF: TStringField
      FieldName = 'UF'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlNotas_ConcorrentesCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object sqlNotas_ConcorrentesTELEFONE: TStringField
      FieldName = 'TELEFONE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlNotas_ConcorrentesPRODUTO: TStringField
      FieldName = 'PRODUTO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlNotas_ConcorrentesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object sqlNotas_ConcorrentesEAN: TStringField
      FieldName = 'EAN'
      ProviderFlags = [pfInUpdate]
      Size = 13
    end
    object sqlNotas_ConcorrentesNCM: TStringField
      FieldName = 'NCM'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object sqlNotas_ConcorrentesCFOP: TStringField
      FieldName = 'CFOP'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object sqlNotas_ConcorrentesUM: TStringField
      FieldName = 'UM'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlNotas_ConcorrentesQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlNotas_ConcorrentesUNITARIO: TFloatField
      FieldName = 'UNITARIO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlNotas_ConcorrentesTOTAL: TFloatField
      FieldName = 'TOTAL'
      ProviderFlags = [pfInUpdate]
    end
    object sqlNotas_ConcorrentesICMS: TFloatField
      FieldName = 'ICMS'
      ProviderFlags = [pfInUpdate]
    end
    object sqlNotas_ConcorrentesMVA: TFloatField
      FieldName = 'MVA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlNotas_ConcorrentesBCICMSST: TFloatField
      FieldName = 'BCICMSST'
      ProviderFlags = [pfInUpdate]
    end
    object sqlNotas_ConcorrentesVALORICMSST: TFloatField
      FieldName = 'VALORICMSST'
      ProviderFlags = [pfInUpdate]
    end
    object sqlNotas_ConcorrentesIPI: TFloatField
      FieldName = 'IPI'
      ProviderFlags = [pfInUpdate]
    end
    object sqlNotas_ConcorrentesVALORTITULO: TFloatField
      FieldName = 'VALORTITULO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlNotas_ConcorrentesDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspNotas_Concorrentes: TDataSetProvider
    DataSet = sqlNotas_Concorrentes
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspCadastro_VisitaBeforeUpdateRecord
    Left = 304
    Top = 1528
  end
  object dspProdutos_Grupos_Relativos: TDataSetProvider
    DataSet = sqlProdutos_Grupos_Relativos
    Options = [poIncFieldProps, poCascadeUpdates, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspProdutos_Grupos_RelativosBeforeUpdateRecord
    Left = 504
    Top = 1704
  end
  object dtsProdutos_Grupos_Relativos: TDataSource
    DataSet = sqlProdutos_Grupos_Relativos
    Left = 680
    Top = 1632
  end
  object sqlProdutos_Grupos_Relativos: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select * from PRODUTOS_GRUPOS_RELATIVOS'#13#10'where empresa = :EMPRES' +
      'A and filial = :FILIAL order by EMPRESA, FILIAL, CODIGO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 504
    Top = 1633
    object sqlProdutos_Grupos_RelativosEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlProdutos_Grupos_RelativosFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlProdutos_Grupos_RelativosSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlProdutos_Grupos_RelativosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlProdutos_Grupos_RelativosDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 240
    end
    object sqlProdutos_Grupos_RelativosTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlProdutos_Grupos_RelativosOBSERVACAO: TMemoField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object sqlProdutos_Grupos_RelativosINCLUIDO: TStringField
      DisplayLabel = 'Incluido'
      FieldName = 'INCLUIDO'
      ProviderFlags = [pfInUpdate]
      Size = 29
    end
    object sqlProdutos_Grupos_RelativosALTERADO: TStringField
      DisplayLabel = 'Alterado'
      FieldName = 'ALTERADO'
      ProviderFlags = [pfInUpdate]
      Size = 29
    end
    object sqlProdutos_Grupos_RelativosDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data de cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/0000 90:00:00;1; '
    end
  end
  object sqlProdutos_Alternativos: TSQLDataSet
    BeforeOpen = sqlProdutos_AlternativosBeforeOpen
    CommandText = 
      'select A.*'#13#10'from PRODUTOS A'#13#10'left join PRODUTOS_GRUPOS_RELATIVOS' +
      ' B on (B.EMPRESA = :EMPRESA_GRUPORELATIVO and B.FILIAL = :FILIAL' +
      '_GRUPORELATIVO and B.CODIGO = A.GRUPOALTERNATIVO)        '#13#10'where' +
      ' A.EMPRESA = :EMPRESA and A.FILIAL = :FILIAL and A.GRUPOALTERNAT' +
      'IVO = :CODIGO'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsProdutos_Grupos_Relativos
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA_GRUPORELATIVO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL_GRUPORELATIVO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 680
    Top = 1704
    object sqlProdutos_AlternativosEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlProdutos_AlternativosFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlProdutos_AlternativosCODIGO: TStringField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object sqlProdutos_AlternativosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 240
    end
    object sqlProdutos_AlternativosREDUZIDO: TStringField
      FieldName = 'REDUZIDO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 240
    end
    object sqlProdutos_AlternativosFABRICANTE: TStringField
      FieldName = 'FABRICANTE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object sqlProdutos_AlternativosMARCA: TStringField
      FieldName = 'MARCA'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object sqlProdutos_AlternativosMODELO: TStringField
      FieldName = 'MODELO'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object sqlProdutos_AlternativosLOCALIZACAO: TStringField
      FieldName = 'LOCALIZACAO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
  end
  object sqlProdutos_Relacionados: TSQLDataSet
    SchemaName = 'sysdba'
    BeforeOpen = sqlProdutos_AlternativosBeforeOpen
    CommandText = 
      'select A.*'#13#10'from PRODUTOS A'#13#10'left join PRODUTOS_GRUPOS_RELATIVOS' +
      ' B on (B.EMPRESA = :EMPRESA_GRUPORELATIVO and B.FILIAL = :FILIAL' +
      '_GRUPORELATIVO and B.CODIGO = A.GRUPORELACIONADO)        '#13#10'where' +
      ' A.EMPRESA = :EMPRESA and A.FILIAL = :FILIAL and A.GRUPORELACION' +
      'ADO = :CODIGO'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsProdutos_Grupos_Relativos
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA_GRUPORELATIVO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL_GRUPORELATIVO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 816
    Top = 1704
    object sqlProdutos_RelacionadosEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlProdutos_RelacionadosFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlProdutos_RelacionadosCODIGO: TStringField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object sqlProdutos_RelacionadosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 240
    end
    object sqlProdutos_RelacionadosREDUZIDO: TStringField
      FieldName = 'REDUZIDO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 240
    end
    object sqlProdutos_RelacionadosFABRICANTE: TStringField
      FieldName = 'FABRICANTE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object sqlProdutos_RelacionadosMARCA: TStringField
      FieldName = 'MARCA'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object sqlProdutos_RelacionadosMODELO: TStringField
      FieldName = 'MODELO'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object sqlProdutos_RelacionadosLOCALIZACAO: TStringField
      FieldName = 'LOCALIZACAO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
  end
  object sqlLista_Rep_Dados: TSQLDataSet
    CommandText = 
      'select * from LISTA_REP_DADOS where EMPRESA = :EMPRESA AND FILIA' +
      'L = :FILIAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 2
      end>
    SQLConnection = SQLConnection1
    Left = 1056
    Top = 1640
    object StringField41: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object StringField110: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlLista_Rep_DadosID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlLista_Rep_DadosDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlLista_Rep_DadosVALIDADEDE: TDateField
      DisplayLabel = 'Validade De'
      FieldName = 'VALIDADEDE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlLista_Rep_DadosVALIDADEATE: TDateField
      DisplayLabel = 'Validade At'#233
      FieldName = 'VALIDADEATE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlLista_Rep_DadosOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object SQLTimeStampField14: TSQLTimeStampField
      DisplayLabel = 'Data de Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspLista_Rep_Dados: TDataSetProvider
    DataSet = sqlLista_Rep_Dados
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspLista_Rep_DadosBeforeUpdateRecord
    Left = 1056
    Top = 1696
  end
  object sqlLista_Rep_Itens: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select * from LISTA_REP_ITENS where empresa = :EMPRESA and filia' +
      'l = :FILIAL and ID = :ID'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsLista_Rep_Dados
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 1176
    Top = 1696
    object StringField111: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object StringField112: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlLista_Rep_ItensID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlLista_Rep_ItensCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 15
    end
    object sqlLista_Rep_ItensDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlLista_Rep_ItensPRECOVENDA1: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 1'
      FieldName = 'PRECOVENDA1'
      ProviderFlags = [pfInUpdate]
    end
    object sqlLista_Rep_ItensPRECOVENDA2: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 2'
      FieldName = 'PRECOVENDA2'
      ProviderFlags = [pfInUpdate]
    end
    object sqlLista_Rep_ItensPRECOVENDA3: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 3'
      FieldName = 'PRECOVENDA3'
      ProviderFlags = [pfInUpdate]
    end
    object sqlLista_Rep_ItensPRECOVENDA4: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 4'
      FieldName = 'PRECOVENDA4'
      ProviderFlags = [pfInUpdate]
    end
    object sqlLista_Rep_ItensPRECOVENDA5: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 5'
      FieldName = 'PRECOVENDA5'
      ProviderFlags = [pfInUpdate]
    end
    object sqlLista_Rep_ItensPRECOVENDA6: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 6'
      FieldName = 'PRECOVENDA6'
      ProviderFlags = [pfInUpdate]
    end
    object sqlLista_Rep_ItensPRECOVENDA7: TFloatField
      DisplayLabel = 'Pre'#231'o Venda 7'
      FieldName = 'PRECOVENDA7'
      ProviderFlags = [pfInUpdate]
    end
    object sqlLista_Rep_ItensPRECOSP1: TFloatField
      DisplayLabel = 'Pre'#231'o SP 1'
      FieldName = 'PRECOSP1'
      ProviderFlags = [pfInUpdate]
    end
    object sqlLista_Rep_ItensPRECOSP2: TFloatField
      DisplayLabel = 'Pre'#231'o SP 2'
      FieldName = 'PRECOSP2'
      ProviderFlags = [pfInUpdate]
    end
    object sqlLista_Rep_ItensPRECOSP3: TFloatField
      DisplayLabel = 'Pre'#231'o SP 3'
      FieldName = 'PRECOSP3'
      ProviderFlags = [pfInUpdate]
    end
    object sqlLista_Rep_ItensPRECOSP4: TFloatField
      DisplayLabel = 'Pre'#231'o SP 4'
      FieldName = 'PRECOSP4'
      ProviderFlags = [pfInUpdate]
    end
    object sqlLista_Rep_ItensPRECOSP5: TFloatField
      DisplayLabel = 'Pre'#231'o SP 5'
      FieldName = 'PRECOSP5'
      ProviderFlags = [pfInUpdate]
    end
    object sqlLista_Rep_ItensPRECOSP6: TFloatField
      DisplayLabel = 'Pre'#231'o SP 6'
      FieldName = 'PRECOSP6'
      ProviderFlags = [pfInUpdate]
    end
    object sqlLista_Rep_ItensPRECOSP7: TFloatField
      DisplayLabel = 'Pre'#231'o SP 7'
      FieldName = 'PRECOSP7'
      ProviderFlags = [pfInUpdate]
    end
    object sqlLista_Rep_ItensOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
  end
  object dtsLista_Rep_Dados: TDataSource
    DataSet = sqlLista_Rep_Dados
    Left = 1176
    Top = 1640
  end
  object sqlFechamento_Comissao_Dados: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select * from FECHAMENTO_COMISSAO_DADOS where EMPRESA = :EMPRESA' +
      ' and FILIAL = :FILIAL'#13#10'order by EMPRESA, FILIAL, CODIGO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 2
      end>
    SQLConnection = SQLConnection1
    Left = 88
    Top = 1779
    object sqlFechamento_Comissao_DadosEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlFechamento_Comissao_DadosFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlFechamento_Comissao_DadosCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlFechamento_Comissao_DadosANO: TStringField
      DisplayLabel = 'Ano'
      FieldName = 'ANO'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object sqlFechamento_Comissao_DadosMES: TStringField
      DisplayLabel = 'M'#234's'
      FieldName = 'MES'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlFechamento_Comissao_DadosDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object sqlFechamento_Comissao_DadosOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object sqlFechamento_Comissao_DadosDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data de Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFechamento_Comissao_DadosTIPO: TStringField
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlFechamento_Comissao_DadosDATADE: TDateField
      DisplayLabel = 'Data De'
      FieldName = 'DATADE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFechamento_Comissao_DadosDATAATE: TDateField
      DisplayLabel = 'Data At'#233
      FieldName = 'DATAATE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFechamento_Comissao_DadosVALEFECHADO: TStringField
      DisplayLabel = 'Vale Fechado?'
      FieldName = 'VALEFECHADO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlFechamento_Comissao_DadosDATAVALE: TDateField
      DisplayLabel = 'Data Vale'
      FieldName = 'DATAVALE'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspFechamento_Comissao_Dados: TDataSetProvider
    DataSet = sqlFechamento_Comissao_Dados
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspFechamento_Comissao_DadosBeforeUpdateRecord
    Left = 92
    Top = 1823
  end
  object sqlFechamento_Comissao_Itens: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select * from FECHAMENTO_COMISSAO_ITENS where EMPRESA = :EMPRESA' +
      ' and FILIAL = :FILIAL and CODIGO = :CODIGO'#13#10'order by EMPRESA, FI' +
      'LIAL, CODIGO, VENDEDOR'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsFechamento_Comissao_Dados
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 224
    Top = 1843
    object sqlFechamento_Comissao_ItensEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlFechamento_Comissao_ItensFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlFechamento_Comissao_ItensCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlFechamento_Comissao_ItensVENDEDOR: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'VENDEDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlFechamento_Comissao_ItensNOMEVENDEDOR: TStringField
      DisplayLabel = 'Nome Vendedor'
      FieldName = 'NOMEVENDEDOR'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlFechamento_Comissao_ItensTOTALVENDIDO: TFloatField
      DisplayLabel = 'Total Vendido'
      FieldName = 'TOTALVENDIDO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFechamento_Comissao_ItensTOTALDESCONTOS: TFloatField
      DisplayLabel = 'Total Descontos'
      FieldName = 'TOTALDESCONTOS'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFechamento_Comissao_ItensTOTALESPECIAIS: TFloatField
      DisplayLabel = 'Total Especiais'
      FieldName = 'TOTALESPECIAIS'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFechamento_Comissao_ItensTOTALDEVOLUCOES: TFloatField
      DisplayLabel = 'Total Devolu'#231#245'es'
      FieldName = 'TOTALDEVOLUCOES'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFechamento_Comissao_ItensPERCENTUAL: TFloatField
      DisplayLabel = 'Percentual'
      FieldName = 'PERCENTUAL'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFechamento_Comissao_ItensPERCENTUALESPECIAIS: TFloatField
      DisplayLabel = 'Percentual Especiais'
      FieldName = 'PERCENTUALESPECIAIS'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFechamento_Comissao_ItensMINIMO: TFloatField
      DisplayLabel = 'Valor M'#237'nimo'
      FieldName = 'MINIMO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFechamento_Comissao_ItensVALORCOMISSAO: TFloatField
      DisplayLabel = 'Valor Comiss'#227'o'
      FieldName = 'VALORCOMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFechamento_Comissao_ItensOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object sqlFechamento_Comissao_ItensDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data de Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFechamento_Comissao_ItensMETA: TFloatField
      FieldName = 'META'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFechamento_Comissao_ItensMETAESPECIAIS: TFloatField
      FieldName = 'METAESPECIAIS'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFechamento_Comissao_ItensFUNCAO: TStringField
      FieldName = 'FUNCAO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlFechamento_Comissao_ItensBASECOMISSAO: TFloatField
      FieldName = 'BASECOMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFechamento_Comissao_ItensCOMISSAOLIQUIDA: TFloatField
      FieldName = 'COMISSAOLIQUIDA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFechamento_Comissao_ItensVALORVALE: TFloatField
      DisplayLabel = 'Valor Vale'
      FieldName = 'VALORVALE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFechamento_Comissao_ItensCOMISSAOESPECIAL: TFloatField
      FieldName = 'COMISSAOESPECIAL'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dtsFechamento_Comissao_Dados: TDataSource
    DataSet = sqlFechamento_Comissao_Dados
    Left = 224
    Top = 1795
  end
  object sqlGNRE_Dados: TSQLDataSet
    CommandText = 
      'select * from gnre_dados where EMPRESA = :EMPRESA and FILIAL = :' +
      'FILIAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 656
    Top = 1792
    object sqlGNRE_DadosEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlGNRE_DadosFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlGNRE_DadosNUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlGNRE_DadosSITUACAO: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlGNRE_DadosEMISSAO: TDateField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'EMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlGNRE_DadosDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object sqlGNRE_Itens: TSQLDataSet
    SchemaName = 'sysdba'
    BeforeOpen = sqlGNRE_ItensBeforeOpen
    CommandText = 
      'select A.*, B.REDUZIDO as "NOMECLIENTE" from gnre_itens A'#13#10'LEFT ' +
      'JOIN CLIENTES B on (B.EMPRESA = :EMPRESA_CLIENTES and B.FILIAL =' +
      ' :FILIAL_CLIENTES and A.CLIENTE = B.CODIGO)'#13#10'where A.EMPRESA = :' +
      'EMPRESA and A.FILIAL = :FILIAL and A.NUMERO = :NUMERO'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsGNRE_Dados
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA_CLIENTES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL_CLIENTES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 760
    Top = 1848
    object sqlGNRE_ItensEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlGNRE_ItensFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlGNRE_ItensNUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlGNRE_ItensITEM: TIntegerField
      DisplayLabel = 'Item'
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlGNRE_ItensSITUACAO: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlGNRE_ItensUF: TStringField
      DisplayLabel = 'Uf Favorecida'
      FieldName = 'UF'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlGNRE_ItensRECEITA: TStringField
      DisplayLabel = 'Receita'
      FieldName = 'RECEITA'
      ProviderFlags = [pfInUpdate]
      Size = 6
    end
    object sqlGNRE_ItensDETALHAMENTORECEITA: TStringField
      DisplayLabel = 'Detalhamento Receita'
      FieldName = 'DETALHAMENTORECEITA'
      ProviderFlags = [pfInUpdate]
      Size = 6
    end
    object sqlGNRE_ItensPRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'PRODUTO'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object sqlGNRE_ItensORIGEMRECEITA: TStringField
      DisplayLabel = 'Origem Receita'
      FieldName = 'ORIGEMRECEITA'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlGNRE_ItensNUMERORECEITA: TStringField
      DisplayLabel = 'N'#250'mero Receita'
      FieldName = 'NUMERORECEITA'
      ProviderFlags = [pfInUpdate]
      Size = 32
    end
    object sqlGNRE_ItensPERIODO: TStringField
      DisplayLabel = 'Per'#237'odo'
      FieldName = 'PERIODO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlGNRE_ItensPARCELA: TIntegerField
      DisplayLabel = 'Parcela'
      FieldName = 'PARCELA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlGNRE_ItensMESREFERENCIA: TStringField
      DisplayLabel = 'M'#234's Referencia'
      FieldName = 'MESREFERENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlGNRE_ItensANOREFERENCIA: TStringField
      DisplayLabel = 'Ano Refer'#234'ncia'
      FieldName = 'ANOREFERENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object sqlGNRE_ItensCONVENIO: TStringField
      DisplayLabel = 'Conv'#234'nio'
      FieldName = 'CONVENIO'
      ProviderFlags = [pfInUpdate]
      Size = 90
    end
    object sqlGNRE_ItensVENCIMENTO: TDateField
      DisplayLabel = 'Vencimento'
      FieldName = 'VENCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlGNRE_ItensPAGAMENTO: TDateField
      DisplayLabel = 'Pagamento'
      FieldName = 'PAGAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlGNRE_ItensVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
    end
    object sqlGNRE_ItensNOMECLIENTE: TStringField
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'NOMECLIENTE'
      ProviderFlags = []
      Size = 240
    end
    object sqlGNRE_ItensCLIENTE: TIntegerField
      DefaultExpression = '0'
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlGNRE_ItensJUROS: TFloatField
      DisplayLabel = 'Juros'
      FieldName = 'JUROS'
    end
    object sqlGNRE_ItensMULTA: TFloatField
      DisplayLabel = 'Multa'
      FieldName = 'MULTA'
    end
    object sqlGNRE_ItensATUALIZACAOMONETARIA: TFloatField
      DisplayLabel = 'Atualiza'#231#227'o Monet'#225'ria'
      FieldName = 'ATUALIZACAOMONETARIA'
    end
    object sqlGNRE_ItensREPRESENTACAONUMERICA: TStringField
      DisplayLabel = 'Representa'#231#227'o Num'#233'rica'
      FieldName = 'REPRESENTACAONUMERICA'
      Size = 48
    end
    object sqlGNRE_ItensCODIGOBARRAS: TStringField
      DisplayLabel = 'Codigo de Barras'
      FieldName = 'CODIGOBARRAS'
      Size = 44
    end
    object sqlGNRE_ItensVENCIMENTOLIMITE: TDateField
      DisplayLabel = 'Vencimento Limite'
      FieldName = 'VENCIMENTOLIMITE'
    end
    object sqlGNRE_ItensINFORMACAOCOMPLEMENTAR: TStringField
      DisplayLabel = 'Informa'#231#245'es Complementares'
      FieldName = 'INFORMACAOCOMPLEMENTAR'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object sqlGNRE_ItensRECIBO: TStringField
      DisplayLabel = 'Recibo'
      FieldName = 'RECIBO'
      ProviderFlags = [pfInUpdate]
      Size = 64
    end
    object sqlGNRE_ItensDATARECIBO: TSQLTimeStampField
      DisplayLabel = 'Data do Recibo'
      FieldName = 'DATARECIBO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlGNRE_ItensCONTROLE: TStringField
      DisplayLabel = 'N'#250'mero de Controle'
      FieldName = 'CONTROLE'
      Size = 32
    end
    object sqlGNRE_ItensPREFIXO: TStringField
      DisplayLabel = 'Prefixo'
      FieldName = 'PREFIXO'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object sqlGNRE_ItensNOTA: TIntegerField
      DisplayLabel = 'Nota'
      FieldName = 'NOTA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlGNRE_ItensVALORFECP: TFloatField
      FieldName = 'VALORFECP'
      ProviderFlags = [pfInUpdate]
    end
    object sqlGNRE_ItensEMISSAO: TDateField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'EMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlGNRE_ItensDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspGNRE_Dados: TDataSetProvider
    DataSet = sqlGNRE_Dados
    Options = [poIncFieldProps, poCascadeUpdates, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspGNRE_DadosBeforeUpdateRecord
    OnGetTableName = dspGNRE_DadosGetTableName
    Left = 656
    Top = 1848
  end
  object dtsGNRE_Dados: TDataSource
    DataSet = sqlGNRE_Dados
    Left = 760
    Top = 1792
  end
  object sqlGNRE_itens_Extra: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select * from GNRE_ITENS_EXTRA where EMPRESA = :EMPRESA and FILI' +
      'AL = :FILIAL and NUMERO = :NUMERO and ITEM = :ITEM order by CODI' +
      'GO'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsGNRE_ITENS
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ITEM'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 864
    Top = 1848
    object sqlGNRE_itens_ExtraEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlGNRE_itens_ExtraFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlGNRE_itens_ExtraNUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlGNRE_itens_ExtraITEM: TIntegerField
      DisplayLabel = 'Item'
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlGNRE_itens_ExtraCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlGNRE_itens_ExtraTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 1
    end
    object sqlGNRE_itens_ExtraVALOR: TStringField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      Size = 128
    end
    object sqlGNRE_itens_ExtraEMISSAO: TDateField
      FieldName = 'EMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlGNRE_itens_ExtraDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dtsGNRE_ITENS: TDataSource
    DataSet = sqlGNRE_Itens
    Left = 864
    Top = 1792
  end
  object sqlRegra_Gnre: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select A.*, B.DESCRICAO as "NOMEREGRA" from REGRA_GNRE A'#13#10'LEFT J' +
      'OIN REGRAS_FISCAIS B ON (B.EMPRESA = :EMPRESA_REGRA_FISCAL and B' +
      '.FILIAL = :FILIAL_REGRA_FISCAL and A.REGRA = B.CODIGO)'#13#10'where A.' +
      'EMPRESA = :EMPRESA and A.FILIAL = :FILIAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'EMPRESA_REGRA_FISCAL'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FILIAL_REGRA_FISCAL'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 984
    Top = 1792
    object sqlRegra_GnreEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlRegra_GnreFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlRegra_GnreREGRA: TIntegerField
      DisplayLabel = 'Regra'
      FieldName = 'REGRA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlRegra_GnreUF: TStringField
      DisplayLabel = 'Uf'
      FieldName = 'UF'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlRegra_GnreRECEITA: TStringField
      DisplayLabel = 'Receita'
      FieldName = 'RECEITA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 6
    end
    object sqlRegra_GnreDETALHAMENTORECEITA: TStringField
      DisplayLabel = 'Detalhamento Receita'
      FieldName = 'DETALHAMENTORECEITA'
      ProviderFlags = [pfInUpdate]
      Size = 6
    end
    object sqlRegra_GnrePRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'PRODUTO'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object sqlRegra_GnreORIGEMRECEITA: TStringField
      DisplayLabel = 'Origem Receita'
      FieldName = 'ORIGEMRECEITA'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlRegra_GnrePERIODO: TStringField
      DisplayLabel = 'Per'#237'odo'
      FieldName = 'PERIODO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlRegra_GnreCONVENIO: TStringField
      DisplayLabel = 'Conv'#234'nio'
      FieldName = 'CONVENIO'
      ProviderFlags = [pfInUpdate]
      Size = 90
    end
    object sqlRegra_GnreSITUACAO: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlRegra_GnreNOMEREGRA: TStringField
      DisplayLabel = 'Nome Regra Fiscal'
      FieldName = 'NOMEREGRA'
      ProviderFlags = []
      Size = 150
    end
    object sqlRegra_GnreEXTRA1: TIntegerField
      FieldName = 'EXTRA1'
      ProviderFlags = [pfInUpdate]
    end
    object sqlRegra_GnreEXTRA2: TIntegerField
      FieldName = 'EXTRA2'
      ProviderFlags = [pfInUpdate]
    end
    object sqlRegra_GnreEXTRA3: TIntegerField
      FieldName = 'EXTRA3'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspRegra_Gnre: TDataSetProvider
    DataSet = sqlRegra_Gnre
    Options = [poIncFieldProps, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 984
    Top = 1848
  end
  object dtsFechamento_Comissao_Equipes: TDataSource
    DataSet = sqlFechamento_Comissao_Dados
    Left = 352
    Top = 1811
  end
  object sqlFechamento_Comissao_Equipes: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select * from FECHAMENTO_COMISSAO_EQUIPES where EMPRESA = :EMPRE' +
      'SA and FILIAL = :FILIAL and CODIGO = :CODIGO'#13#10'order by EMPRESA, ' +
      'FILIAL, CODIGO, EQUIPE'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsFechamento_Comissao_Equipes
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 352
    Top = 1859
    object StringField113: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object StringField114: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object IntegerField35: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlFechamento_Comissao_EquipesEQUIPE: TIntegerField
      FieldName = 'EQUIPE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlFechamento_Comissao_EquipesNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object sqlFechamento_Comissao_EquipesTOTALVENDIDO: TFloatField
      FieldName = 'TOTALVENDIDO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFechamento_Comissao_EquipesTOTALDESCONTOS: TFloatField
      FieldName = 'TOTALDESCONTOS'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFechamento_Comissao_EquipesTOTALESPECIAIS: TFloatField
      FieldName = 'TOTALESPECIAIS'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFechamento_Comissao_EquipesTOTALDEVOLUCOES: TFloatField
      FieldName = 'TOTALDEVOLUCOES'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFechamento_Comissao_EquipesPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFechamento_Comissao_EquipesPERCENTUALESPECIAIS: TFloatField
      FieldName = 'PERCENTUALESPECIAIS'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFechamento_Comissao_EquipesVALORCOMISSAO: TFloatField
      FieldName = 'VALORCOMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFechamento_Comissao_EquipesBASECOMISSAO: TFloatField
      FieldName = 'BASECOMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFechamento_Comissao_EquipesCOMISSAOLIQUIDA: TFloatField
      FieldName = 'COMISSAOLIQUIDA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFechamento_Comissao_EquipesCOMISSAOESPECIAL: TFloatField
      FieldName = 'COMISSAOESPECIAL'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFechamento_Comissao_EquipesVALORVALE: TFloatField
      FieldName = 'VALORVALE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFechamento_Comissao_EquipesDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlFechamento_Comissao_EquipesTOTALLIQUIDO: TFloatField
      FieldName = 'TOTALLIQUIDO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
  end
  object sqlMetas_Produtos_Especiais: TSQLDataSet
    SchemaName = 'sysdba'
    BeforeOpen = sqlMetas_Produtos_EspeciaisBeforeOpen
    CommandText = 
      'select A.*, B.DESCRICAO as "NOMEPRODUTO" , C.NOME AS "NOMEVENDED' +
      'OR"'#13#10'from METAS_PRODUTOS_ESPECIAIS A'#13#10'LEFT JOIN PRODUTOS B on (B' +
      '.EMPRESA = :EMPRESA_PRODUTOS and B.FILIAL = :FILIAL_PRODUTOS and' +
      ' A.PRODUTO = B.CODIGO)'#13#10'LEFT JOIN VENDEDORES C on (C.EMPRESA = :' +
      'EMPRESA_VENDEDORES and C.FILIAL = :FILIAL_VENDEDORES and C.CODIG' +
      'O = A.VENDEDOR)'#13#10'where A.EMPRESA = :EMPRESA and A.FILIAL = :FILI' +
      'AL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA_PRODUTOS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL_PRODUTOS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMPRESA_VENDEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL_VENDEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1176
    Top = 1792
    object sqlMetas_Produtos_EspeciaisEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlMetas_Produtos_EspeciaisFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlMetas_Produtos_EspeciaisPRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object sqlMetas_Produtos_EspeciaisVENDEDOR: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'VENDEDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlMetas_Produtos_EspeciaisANO: TIntegerField
      DisplayLabel = 'Ano da meta'
      FieldName = 'ANO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlMetas_Produtos_EspeciaisMES: TStringField
      DisplayLabel = 'M'#234's da meta'
      FieldName = 'MES'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlMetas_Produtos_EspeciaisMETAQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade da meta'
      FieldName = 'METAQUANTIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMetas_Produtos_EspeciaisOBSERVACAO: TMemoField
      DisplayLabel = 'Observa'#231#227'o da meta'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object sqlMetas_Produtos_EspeciaisNOMEPRODUTO: TStringField
      DisplayLabel = 'Nome do produto'
      FieldName = 'NOMEPRODUTO'
      ProviderFlags = []
      Size = 240
    end
    object sqlMetas_Produtos_EspeciaisNOMEVENDEDOR: TStringField
      DisplayLabel = 'Nome Vendedor'
      FieldName = 'NOMEVENDEDOR'
      ProviderFlags = []
      Size = 150
    end
  end
  object dspMetas_Produtos_Especiais: TDataSetProvider
    DataSet = sqlMetas_Produtos_Especiais
    Options = [poIncFieldProps, poCascadeUpdates, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 1176
    Top = 1848
  end
  object sqlRotaCep_BrasPress: TSQLDataSet
    BeforeOpen = sqlRotaCep_BrasPressBeforeOpen
    CommandText = 'select * from ROTACEP_BRASPRESS'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 1184
    Top = 1936
    object sqlRotaCep_BrasPressMES: TStringField
      DisplayLabel = 'M'#234's'
      FieldName = 'MES'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlRotaCep_BrasPressANO: TStringField
      DisplayLabel = 'Ano'
      FieldName = 'ANO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object sqlRotaCep_BrasPressNUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlRotaCep_BrasPressID: TStringField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object sqlRotaCep_BrasPressCEPINICIO: TStringField
      DisplayLabel = 'Cep in'#237'cio'
      FieldName = 'CEPINICIO'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object sqlRotaCep_BrasPressCEPFIM: TStringField
      DisplayLabel = 'Cep fim'
      FieldName = 'CEPFIM'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object sqlRotaCep_BrasPressUF: TStringField
      DisplayLabel = 'Uf'
      FieldName = 'UF'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlRotaCep_BrasPressLOCALIDADE: TStringField
      DisplayLabel = 'Localidade'
      FieldName = 'LOCALIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object sqlRotaCep_BrasPressLOCALIDADECEP: TStringField
      DisplayLabel = 'Localidade cep'
      FieldName = 'LOCALIDADECEP'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object sqlRotaCep_BrasPressFROTANUMERO: TStringField
      DisplayLabel = 'Frota n'#250'mero'
      FieldName = 'FROTANUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 6
    end
    object sqlRotaCep_BrasPressROTANUMERO: TStringField
      DisplayLabel = 'Rota n'#250'mero'
      FieldName = 'ROTANUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 6
    end
    object sqlRotaCep_BrasPressFROTAID: TStringField
      DisplayLabel = 'Frota id'
      FieldName = 'FROTAID'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object sqlRotaCep_BrasPressFILIALSIGLA: TStringField
      DisplayLabel = 'Filial sigla'
      FieldName = 'FILIALSIGLA'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object sqlRotaCep_BrasPressFILIALID: TStringField
      DisplayLabel = 'Filial id'
      FieldName = 'FILIALID'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object sqlRotaCep_BrasPressCLASSIFICADO: TStringField
      DisplayLabel = 'Classificado'
      FieldName = 'CLASSIFICADO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlRotaCep_BrasPressSEQUENCIA: TStringField
      DisplayLabel = 'Sequ'#234'ncia'
      FieldName = 'SEQUENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
  end
  object dspRotaCep_BrasPress: TDataSetProvider
    DataSet = sqlRotaCep_BrasPress
    Options = [poIncFieldProps, poCascadeUpdates, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspRotaCep_BrasPressBeforeUpdateRecord
    Left = 1184
    Top = 1992
  end
  object sqlCampanhas_Vendedores_Santana: TSQLDataSet
    SchemaName = 'sysdba'
    BeforeOpen = sqlCampanhas_Vendedores_SantanaBeforeOpen
    CommandText = 
      'select A.*, B.NOME as "NOMEVENDEDOR"'#13#10'from CAMPANHAS_VENDEDORES_' +
      'SANTANA A'#13#10'left join VENDEDORES B on (B.EMPRESA = :EMPRESA_VENDE' +
      'DORES and B.FILIAL = :FILIAL_VENDEDORES and B.CODIGO = A.VENDEDO' +
      'R)'#13#10'where A.EMPRESA = :EMPRESA and'#13#10'      A.FILIAL = :FILIAL and' +
      #13#10'      A.CODIGO = :CODIGO and'#13#10'      A.PRODUTO = :PRODUTO'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsCampanha_Itens_Santana
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA_VENDEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL_VENDEDORES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PRODUTO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 381
    Top = 283
    object sqlCampanhas_Vendedores_SantanaEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlCampanhas_Vendedores_SantanaFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlCampanhas_Vendedores_SantanaCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlCampanhas_Vendedores_SantanaPRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object sqlCampanhas_Vendedores_SantanaVENDEDOR: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'VENDEDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlCampanhas_Vendedores_SantanaNOMEVENDEDOR: TStringField
      DisplayLabel = 'Nome Vendedor'
      FieldName = 'NOMEVENDEDOR'
      ProviderFlags = []
      Size = 150
    end
    object sqlCampanhas_Vendedores_SantanaQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlCampanhas_Vendedores_SantanaEMISSAO: TDateField
      DisplayLabel = 'Emiss'#224'o'
      FieldName = 'EMISSAO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/0000;1;_'
    end
    object sqlCampanhas_Vendedores_SantanaDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data de cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dtsCampanha_Itens_Santana: TDataSource
    DataSet = sqlCampanha_Itens_Santana
    Left = 381
    Top = 227
  end
  object sqlCampanha_Itens_Santana: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    BeforeOpen = sqlCampanha_Itens_SantanaBeforeOpen
    CommandText = 
      'select A.*, B.REDUZIDO as "DESCRICAOPRODUTO",'#13#10'       (A.META * ' +
      'A.UNITARIOMETA) as "TOTALMETA", iif((sum(D.QUANTIDADE) <> 0) and' +
      ' (A.META <> 0),'#13#10'       (sum(D.QUANTIDADE) * 100) / A.META, 0) a' +
      's "PERCENTUALQUANTIDADE", iif((sum(D.TOTAL) <> 0) and ((A.META *' +
      ' A.UNITARIOMETA) <> 0),'#13#10'       (sum(D.TOTAL) * 100) / (A.META *' +
      ' A.UNITARIOMETA), 0) as "PERCENTUALPRECO", sum(C.RESERVA) as "RE' +
      'SERVA",'#13#10'       sum(D.QUANTIDADE) as "QTDEREALIZADO", sum(D.TOTA' +
      'L) as "PRECOREALIZADO"'#13#10'from CAMPANHAS_ITENS_SANTANA A'#13#10'left joi' +
      'n PRODUTOS B on (B.EMPRESA = :EMPRESA_PRODUTOS and B.FILIAL = :F' +
      'ILIAL_PRODUTOS and B.CODIGO = A.PRODUTO)'#13#10'left join SALDOS_ESTOQ' +
      'UE C on (C.EMPRESA = :EMPRESA_SALDOS and C.FILIAL = :FILIAL_SALD' +
      'OS and A.PRODUTO = C.PRODUTO)'#13#10'left join PEDIDOS_VENDAS_ITENS D ' +
      'on (D.EMPRESA = :EMPRESA_PEDIDOS and D.FILIAL = :FILIAL_PEDIDOS ' +
      'and A.PRODUTO = D.PRODUTO)'#13#10'left join PEDIDOS_VENDAS_DADOS E on ' +
      '(D.EMPRESA = D.EMPRESA and D.FILIAL = E.FILIAL and D.NUMERO = E.' +
      'NUMERO and E.SITUACAO in ('#39'5'#39', '#39'6'#39', '#39'7'#39', '#39'8'#39') and E.EMISSAO betw' +
      'een :INICIO and :FINAL)'#13#10'where A.EMPRESA = :EMPRESA and'#13#10'      A' +
      '.FILIAL = :FILIAL and'#13#10'      A.CODIGO = :CODIGO'#13#10'group by EMPRES' +
      'A, FILIAL, CODIGO, PRODUTO, META, UNITARIOMETA, DISPONIVELINICIO' +
      ', DISPONIVELFINAL, UNITARIOMETASP, DESCRICAOPRODUTO'#13#10'order by A.' +
      'EMPRESA, A.FILIAL, A.CODIGO, A.PRODUTO'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsCampanhas_Dados_Santana
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA_PRODUTOS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL_PRODUTOS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMPRESA_SALDOS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL_SALDOS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMPRESA_PEDIDOS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL_PEDIDOS'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'INICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FINAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 240
    Top = 272
    object sqlCampanha_Itens_SantanaEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlCampanha_Itens_SantanaFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlCampanha_Itens_SantanaCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlCampanha_Itens_SantanaPRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object sqlCampanha_Itens_SantanaMETA: TFloatField
      DisplayLabel = 'Meta'
      FieldName = 'META'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object sqlCampanha_Itens_SantanaUNITARIOMETA: TFloatField
      DisplayLabel = 'Unit'#225'rio Meta'
      FieldName = 'UNITARIOMETA'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = 'R$ #,##0.00'
    end
    object sqlCampanha_Itens_SantanaDISPONIVELINICIO: TFloatField
      DisplayLabel = 'Dispon'#237'vel em'
      FieldName = 'DISPONIVELINICIO'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object sqlCampanha_Itens_SantanaDISPONIVELFINAL: TFloatField
      DisplayLabel = 'Dispon'#237'vel at'#233
      FieldName = 'DISPONIVELFINAL'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,##0.00'
    end
    object sqlCampanha_Itens_SantanaUNITARIOMETASP: TFloatField
      DisplayLabel = 'Unit'#225'rio Meta SP'
      FieldName = 'UNITARIOMETASP'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'R$ #,##0.00'
    end
    object sqlCampanha_Itens_SantanaDESCRICAOPRODUTO: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'DESCRICAOPRODUTO'
      ProviderFlags = []
      Size = 240
    end
    object sqlCampanha_Itens_SantanaTOTALMETA: TFloatField
      DisplayLabel = 'Total da meta'
      FieldName = 'TOTALMETA'
      ProviderFlags = []
      DisplayFormat = 'R$ #,##0.00'
    end
    object sqlCampanha_Itens_SantanaPERCENTUALQUANTIDADE: TFloatField
      DisplayLabel = '% da Quantidade'
      FieldName = 'PERCENTUALQUANTIDADE'
      ProviderFlags = []
      DisplayFormat = '#,##0.00#%'
    end
    object sqlCampanha_Itens_SantanaPERCENTUALPRECO: TFloatField
      DisplayLabel = '% de Pre'#231'o'
      FieldName = 'PERCENTUALPRECO'
      ProviderFlags = []
      DisplayFormat = '#,##0.00#%'
    end
    object sqlCampanha_Itens_SantanaRESERVA: TFloatField
      DisplayLabel = 'Reserva'
      FieldName = 'RESERVA'
      ProviderFlags = []
      DisplayFormat = '#,##0.00'
    end
    object sqlCampanha_Itens_SantanaQTDEREALIZADO: TFloatField
      DisplayLabel = 'Qtde. Realizado'
      FieldName = 'QTDEREALIZADO'
      ProviderFlags = []
      DisplayFormat = '#,##0.00'
    end
    object sqlCampanha_Itens_SantanaPRECOREALIZADO: TFloatField
      DisplayLabel = 'Pre'#231'o Realizado'
      FieldName = 'PRECOREALIZADO'
      ProviderFlags = []
      DisplayFormat = '#,##0.00'
    end
  end
  object sqlClientes_Pendencias: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select A.*, B.NOME AS "NOMECLIENTE", C.NOME AS "NOMEUSUARIOABERT' +
      'URA", D.NOME AS "NOMEUSUARIOFINALIZACAO" from CLIENTES_PENDENCIA' +
      'S A'#13#10'left join CLIENTES B on (B.EMPRESA = :EMPRESA_CLIENTES and ' +
      'B.FILIAL = :FILIAL_CLIENTES and A.CLIENTE = B.CODIGO)'#13#10'left join' +
      ' SYS_USERS C on (A.USUARIOABERTURA = C.CODIGO)'#13#10'left join SYS_US' +
      'ERS D on (A.USUARIOFINALIZACAO = D.CODIGO)'#13#10'where A.EMPRESA = :E' +
      'MPRESA and A.FILIAL = :FILIAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA_CLIENTES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL_CLIENTES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1008
    Top = 1936
    object sqlClientes_PendenciasEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlClientes_PendenciasFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlClientes_PendenciasCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlClientes_PendenciasNOMECLIENTE: TStringField
      DisplayLabel = 'Nome cliente'
      FieldName = 'NOMECLIENTE'
      ProviderFlags = []
      Size = 150
    end
    object sqlClientes_PendenciasSEQUENCIA: TIntegerField
      DisplayLabel = 'Sequencia'
      FieldName = 'SEQUENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlClientes_PendenciasSITUACAO: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlClientes_PendenciasEMISSAO: TDateField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'EMISSAO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/0000;1;_'
    end
    object sqlClientes_PendenciasFINALIZACAO: TDateField
      DisplayLabel = 'Finaliza'#231#227'o'
      FieldName = 'FINALIZACAO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/0000;1;_'
    end
    object sqlClientes_PendenciasDEPARTAMENTO: TStringField
      DisplayLabel = 'Departamento'
      FieldName = 'DEPARTAMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object sqlClientes_PendenciasMOTIVO: TMemoField
      DisplayLabel = 'Motivo'
      FieldName = 'MOTIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
      BlobType = ftMemo
      Size = 1
    end
    object sqlClientes_PendenciasCOMENTARIO: TMemoField
      DisplayLabel = 'Coment'#225'rio'
      FieldName = 'COMENTARIO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object sqlClientes_PendenciasUSUARIOABERTURA: TIntegerField
      DisplayLabel = 'Usu'#225'rio abertura pend'#234'ncia'
      FieldName = 'USUARIOABERTURA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientes_PendenciasNOMEUSUARIOABERTURA: TStringField
      DisplayLabel = 'Nome do usu'#225'rio abertura'
      FieldName = 'NOMEUSUARIOABERTURA'
      ProviderFlags = []
      Size = 150
    end
    object sqlClientes_PendenciasUSUARIOFINALIZACAO: TIntegerField
      DisplayLabel = 'Usu'#225'rio finaliza'#231#227'o pend'#234'ncia'
      FieldName = 'USUARIOFINALIZACAO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlClientes_PendenciasNOMEUSUARIOFINALIZACAO: TStringField
      DisplayLabel = 'Nome usu'#225'rio finaliza'#231#227'o'
      FieldName = 'NOMEUSUARIOFINALIZACAO'
      ProviderFlags = []
      Size = 150
    end
    object sqlClientes_PendenciasDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data de cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/0000 90:00:00;1;_'
    end
    object sqlClientes_PendenciasARQUIVO: TMemoField
      DisplayLabel = 'Arquivo'
      FieldName = 'ARQUIVO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
  end
  object dspClientes_Pendencias: TDataSetProvider
    DataSet = sqlClientes_Pendencias
    Options = [poIncFieldProps, poCascadeUpdates, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 1008
    Top = 2000
  end
  object sqlConsulta_Campanhas_Santana: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select * from CAMPANHAS_DADOS_SANTANA where EMPRESA = :EMPRESA a' +
      'nd FILIAL = :FILIAL'#13#10'order by EMPRESA, FILIAL, CODIGO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 792
    Top = 1936
    object StringField115: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object StringField116: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object IntegerField36: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField117: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 40
    end
    object DateField6: TDateField
      FieldName = 'INICIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object DateField7: TDateField
      FieldName = 'FINAL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object SQLTimeStampField15: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dspConsulta_Campanhas_Santana: TDataSetProvider
    DataSet = sqlConsulta_Campanhas_Santana
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 796
    Top = 1992
  end
  object sqlProgramacao_Compras: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select * from PROGRAMACAO_COMPRAS where EMPRESA = :EMPRESA and F' +
      'ILIAL = :FILIAL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 2
      end>
    SQLConnection = SQLConnection1
    Left = 96
    Top = 1928
    object sqlProgramacao_ComprasEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlProgramacao_ComprasFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlProgramacao_ComprasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlProgramacao_ComprasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object sqlProgramacao_ComprasSTATUS: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlProgramacao_ComprasDATACADASTRO: TDateField
      FieldName = 'DATACADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlProgramacao_ComprasEMBARQUES: TIntegerField
      FieldName = 'EMBARQUES'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlProgramacao_ComprasOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object sqlProgramacao_ComprasUSUARIO: TStringField
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlProgramacao_ComprasDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object sqlProgramacao_Embarques: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select * from PROGRAMACAO_EMBARQUES where EMPRESA = :EMPRESA and' +
      ' FILIAL = :FILIAL and COMPRA = :CODIGO'#13#10'order by EMPRESA, FILIAL' +
      ', COMPRA, EMBARQUE'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsProgramacao_Embarques
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 209
    Top = 2008
    object sqlProgramacao_EmbarquesEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlProgramacao_EmbarquesFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlProgramacao_EmbarquesCOMPRA: TIntegerField
      FieldName = 'COMPRA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlProgramacao_EmbarquesEMBARQUE: TIntegerField
      FieldName = 'EMBARQUE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlProgramacao_EmbarquesSTATUS: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlProgramacao_EmbarquesDATAEMBARQUE: TDateField
      FieldName = 'DATAEMBARQUE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlProgramacao_EmbarquesDATACHEGADA: TDateField
      FieldName = 'DATACHEGADA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlProgramacao_EmbarquesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object sqlProgramacao_EmbarquesOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1000
    end
    object sqlProgramacao_EmbarquesUSUARIO: TStringField
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlProgramacao_EmbarquesDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      Required = True
    end
  end
  object dtsProgramacao_Embarques: TDataSource
    DataSet = sqlProgramacao_Compras
    Left = 208
    Top = 1944
  end
  object dspProgramacao_Compras: TDataSetProvider
    DataSet = sqlProgramacao_Compras
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspProgramacao_ComprasBeforeUpdateRecord
    Left = 96
    Top = 1992
  end
  object dtsProgramacao_Itens: TDataSource
    DataSet = sqlProgramacao_Embarques
    Left = 336
    Top = 1960
  end
  object sqlProgramacao_Embarques_Itens: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select * from PROGRAMACAO_EMBARQUES_ITENS where EMPRESA = :EMPRE' +
      'SA and FILIAL = :FILIAL and COMPRA = :COMPRA and EMBARQUE = :EMB' +
      'ARQUE'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsProgramacao_Itens
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftInteger
        Name = 'COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMBARQUE'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 336
    Top = 2024
    object sqlProgramacao_Embarques_ItensEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Required = True
      Size = 2
    end
    object sqlProgramacao_Embarques_ItensFILIAL: TStringField
      FieldName = 'FILIAL'
      Required = True
      Size = 2
    end
    object sqlProgramacao_Embarques_ItensCOMPRA: TIntegerField
      FieldName = 'COMPRA'
      Required = True
    end
    object sqlProgramacao_Embarques_ItensEMBARQUE: TIntegerField
      FieldName = 'EMBARQUE'
      Required = True
    end
    object sqlProgramacao_Embarques_ItensPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Required = True
      Size = 15
    end
    object sqlProgramacao_Embarques_ItensDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 100
    end
    object sqlProgramacao_Embarques_ItensQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Required = True
    end
    object sqlProgramacao_Embarques_ItensTARGET: TFloatField
      FieldName = 'TARGET'
    end
    object sqlProgramacao_Embarques_ItensSOLICITACAO: TIntegerField
      FieldName = 'SOLICITACAO'
    end
    object sqlProgramacao_Embarques_ItensOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 100
    end
    object sqlProgramacao_Embarques_ItensUSUARIO: TStringField
      FieldName = 'USUARIO'
      Required = True
    end
    object sqlProgramacao_Embarques_ItensDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      Required = True
    end
  end
  object sqlProdutos_Politica_Precos: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select EMPRESA, FILIAL, CODIGO, PPPRECO1, PPPRECO2, PPPRECO3, PP' +
      'PRECO4, PPPRECO5, PPPRECO6, PPPRECO7, PPPRECO8, PPPRECO9, PPPREC' +
      'O10,'#13#10'PPQUANTIDADE1, PPQUANTIDADE2, PPQUANTIDADE3, PPQUANTIDADE4' +
      ', PPQUANTIDADE5, PPQUANTIDADE6, PPQUANTIDADE7, PPQUANTIDADE8, PP' +
      'QUANTIDADE9, PPQUANTIDADE10'#13#10'from PRODUTOS'#13#10'where EMPRESA = :EMP' +
      'RESA and FILIAL = :FILIAL and CODIGO = :CODIGO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 568
    Top = 1952
    object sqlProdutos_Politica_PrecosEMPRESA: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlProdutos_Politica_PrecosFILIAL: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object sqlProdutos_Politica_PrecosCODIGO: TStringField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 15
    end
    object sqlProdutos_Politica_PrecosPPPRECO1: TFloatField
      FieldName = 'PPPRECO1'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutos_Politica_PrecosPPPRECO2: TFloatField
      FieldName = 'PPPRECO2'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutos_Politica_PrecosPPPRECO3: TFloatField
      FieldName = 'PPPRECO3'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutos_Politica_PrecosPPPRECO4: TFloatField
      FieldName = 'PPPRECO4'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutos_Politica_PrecosPPPRECO5: TFloatField
      FieldName = 'PPPRECO5'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutos_Politica_PrecosPPPRECO6: TFloatField
      FieldName = 'PPPRECO6'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutos_Politica_PrecosPPPRECO7: TFloatField
      FieldName = 'PPPRECO7'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutos_Politica_PrecosPPPRECO8: TFloatField
      FieldName = 'PPPRECO8'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutos_Politica_PrecosPPPRECO9: TFloatField
      FieldName = 'PPPRECO9'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutos_Politica_PrecosPPPRECO10: TFloatField
      FieldName = 'PPPRECO10'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutos_Politica_PrecosPPQUANTIDADE1: TFloatField
      FieldName = 'PPQUANTIDADE1'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutos_Politica_PrecosPPQUANTIDADE2: TFloatField
      FieldName = 'PPQUANTIDADE2'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutos_Politica_PrecosPPQUANTIDADE3: TFloatField
      FieldName = 'PPQUANTIDADE3'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutos_Politica_PrecosPPQUANTIDADE4: TFloatField
      FieldName = 'PPQUANTIDADE4'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutos_Politica_PrecosPPQUANTIDADE5: TFloatField
      FieldName = 'PPQUANTIDADE5'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutos_Politica_PrecosPPQUANTIDADE6: TFloatField
      FieldName = 'PPQUANTIDADE6'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutos_Politica_PrecosPPQUANTIDADE7: TFloatField
      FieldName = 'PPQUANTIDADE7'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutos_Politica_PrecosPPQUANTIDADE8: TFloatField
      FieldName = 'PPQUANTIDADE8'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutos_Politica_PrecosPPQUANTIDADE9: TFloatField
      FieldName = 'PPQUANTIDADE9'
      ProviderFlags = [pfInUpdate]
    end
    object sqlProdutos_Politica_PrecosPPQUANTIDADE10: TFloatField
      FieldName = 'PPQUANTIDADE10'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspProdutos_Politica_Precos: TDataSetProvider
    DataSet = sqlProdutos_Politica_Precos
    Options = [poIncFieldProps, poCascadeUpdates, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 568
    Top = 2000
  end
  object sqlProdutos_Limite_Minimo: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select EMPRESA, FILIAL, CODIGO, LIMITEESTOQUE'#13#10'from PRODUTOS'#13#10'wh' +
      'ere EMPRESA = :EMPRESA and FILIAL = :FILIAL and CODIGO = :CODIGO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 568
    Top = 2096
    object StringField118: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object StringField119: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object StringField120: TStringField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 15
    end
    object sqlProdutos_Limite_MinimoLIMITEESTOQUE: TFloatField
      FieldName = 'LIMITEESTOQUE'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspProdutos_Limite_Minimo: TDataSetProvider
    DataSet = sqlProdutos_Limite_Minimo
    Options = [poIncFieldProps, poCascadeUpdates, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 568
    Top = 2152
  end
  object sqlProgramacao_Compras_Cons: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select * from PROGRAMACAO_COMPRAS where EMPRESA = :EMPRESA and F' +
      'ILIAL = :FILIAL and CODIGO = :CODIGO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 96
    Top = 2096
    object StringField121: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object StringField122: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object IntegerField41: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField124: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object StringField125: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object DateField17: TDateField
      FieldName = 'DATACADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object IntegerField42: TIntegerField
      FieldName = 'EMBARQUES'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object StringField126: TStringField
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object StringField128: TStringField
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object SQLTimeStampField16: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object sqlProgramacao_Embarques_Cons: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    CommandText = 
      'select * from PROGRAMACAO_EMBARQUES where EMPRESA = :EMPRESA and' +
      ' FILIAL = :FILIAL and COMPRA = :CODIGO'#13#10'order by EMPRESA, FILIAL' +
      ', COMPRA, EMBARQUE'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsProgramacao_Embarques_Cons
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 209
    Top = 2176
    object StringField129: TStringField
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object StringField151: TStringField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object IntegerField43: TIntegerField
      FieldName = 'COMPRA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField44: TIntegerField
      FieldName = 'EMBARQUE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField152: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object DateField18: TDateField
      FieldName = 'DATAEMBARQUE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object DateField19: TDateField
      FieldName = 'DATACHEGADA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object StringField153: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object StringField154: TStringField
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1000
    end
    object StringField155: TStringField
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object SQLTimeStampField17: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      Required = True
    end
  end
  object dtsProgramacao_Embarques_Cons: TDataSource
    DataSet = sqlProgramacao_Compras_Cons
    Left = 208
    Top = 2112
  end
  object dspProgramacao_Compras_Cons: TDataSetProvider
    DataSet = sqlProgramacao_Compras_Cons
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspProgramacao_ComprasBeforeUpdateRecord
    Left = 96
    Top = 2160
  end
  object sqlProgramacao_Itens_Cons: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'select * from PROGRAMACAO_EMBARQUES_ITENS where EMPRESA = :EMPRE' +
      'SA and FILIAL = :FILIAL and COMPRA = :COMPRA and EMBARQUE = :EMB' +
      'ARQUE'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsProgramacao_Itens_Cons
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftInteger
        Name = 'COMPRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMBARQUE'
        ParamType = ptUnknown
      end>
    Left = 344
    Top = 2192
    object sqlProgramacao_Itens_ConsEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Required = True
      Size = 2
    end
    object sqlProgramacao_Itens_ConsFILIAL: TStringField
      FieldName = 'FILIAL'
      Required = True
      Size = 2
    end
    object sqlProgramacao_Itens_ConsCOMPRA: TIntegerField
      FieldName = 'COMPRA'
      Required = True
    end
    object sqlProgramacao_Itens_ConsEMBARQUE: TIntegerField
      FieldName = 'EMBARQUE'
      Required = True
    end
    object sqlProgramacao_Itens_ConsPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Required = True
      Size = 15
    end
    object sqlProgramacao_Itens_ConsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 100
    end
    object sqlProgramacao_Itens_ConsQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Required = True
    end
    object sqlProgramacao_Itens_ConsTARGET: TFloatField
      FieldName = 'TARGET'
    end
    object sqlProgramacao_Itens_ConsSOLICITACAO: TIntegerField
      FieldName = 'SOLICITACAO'
    end
    object sqlProgramacao_Itens_ConsOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 100
    end
    object sqlProgramacao_Itens_ConsUSUARIO: TStringField
      FieldName = 'USUARIO'
      Required = True
    end
    object sqlProgramacao_Itens_ConsDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      Required = True
    end
  end
  object dtsProgramacao_Itens_Cons: TDataSource
    DataSet = sqlProgramacao_Embarques_Cons
    Left = 336
    Top = 2128
  end
  object sqlClientes_Referencias_Comerciais: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'SELECT * FROM CLIENTES_REFERENCIAS_COMERCIAIS WHERE EMPRESA = EM' +
      'PRESA and FILIAL = :FILIAL and CODIGO = :CODIGO'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsClientes
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1248
    Top = 872
    object sqlClientes_Referencias_ComerciaisEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Required = True
      Size = 2
    end
    object sqlClientes_Referencias_ComerciaisFILIAL: TStringField
      FieldName = 'FILIAL'
      Required = True
      Size = 2
    end
    object sqlClientes_Referencias_ComerciaisCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sqlClientes_Referencias_ComerciaisITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object sqlClientes_Referencias_ComerciaisEMPRESAREFERENCIA1: TStringField
      FieldName = 'EMPRESAREFERENCIA1'
      Size = 80
    end
    object sqlClientes_Referencias_ComerciaisCONTATOREFERENCIA1: TStringField
      FieldName = 'CONTATOREFERENCIA1'
      Size = 80
    end
    object sqlClientes_Referencias_ComerciaisLIMITEREFERENCIA1: TFloatField
      FieldName = 'LIMITEREFERENCIA1'
    end
    object sqlClientes_Referencias_ComerciaisMAIORCOMPRAREFERENCIA1: TFloatField
      FieldName = 'MAIORCOMPRAREFERENCIA1'
    end
    object sqlClientes_Referencias_ComerciaisACUMULOATUALREFERENCIA1: TFloatField
      FieldName = 'ACUMULOATUALREFERENCIA1'
    end
    object sqlClientes_Referencias_ComerciaisULTIMACOMPRAREFERENCIA1: TDateField
      FieldName = 'ULTIMACOMPRAREFERENCIA1'
    end
    object sqlClientes_Referencias_ComerciaisQUANTIDADECOMPRASREFERENCIA1: TIntegerField
      FieldName = 'QUANTIDADECOMPRASREFERENCIA1'
    end
    object sqlClientes_Referencias_ComerciaisFORMAPGTOREFERENCIA1: TStringField
      FieldName = 'FORMAPGTOREFERENCIA1'
      Size = 30
    end
    object sqlClientes_Referencias_ComerciaisHISTORICOPGTOREFERENCIA1: TStringField
      FieldName = 'HISTORICOPGTOREFERENCIA1'
      Size = 30
    end
    object sqlClientes_Referencias_ComerciaisEMPRESAREFERENCIA2: TStringField
      FieldName = 'EMPRESAREFERENCIA2'
      Size = 80
    end
    object sqlClientes_Referencias_ComerciaisCONTATOREFERENCIA2: TStringField
      FieldName = 'CONTATOREFERENCIA2'
      Size = 80
    end
    object sqlClientes_Referencias_ComerciaisLIMITEREFERENCIA2: TFloatField
      FieldName = 'LIMITEREFERENCIA2'
    end
    object sqlClientes_Referencias_ComerciaisMAIORCOMPRAREFERENCIA2: TFloatField
      FieldName = 'MAIORCOMPRAREFERENCIA2'
    end
    object sqlClientes_Referencias_ComerciaisACUMULOATUALREFERENCIA2: TFloatField
      FieldName = 'ACUMULOATUALREFERENCIA2'
    end
    object sqlClientes_Referencias_ComerciaisULTIMACOMPRAREFERENCIA2: TDateField
      FieldName = 'ULTIMACOMPRAREFERENCIA2'
    end
    object sqlClientes_Referencias_ComerciaisQUANTIDADECOMPRASREFERENCIA2: TIntegerField
      FieldName = 'QUANTIDADECOMPRASREFERENCIA2'
    end
    object sqlClientes_Referencias_ComerciaisFORMAPGTOREFERENCIA2: TStringField
      FieldName = 'FORMAPGTOREFERENCIA2'
      Size = 30
    end
    object sqlClientes_Referencias_ComerciaisHISTORICOPGTOREFERENCIA2: TStringField
      FieldName = 'HISTORICOPGTOREFERENCIA2'
      Size = 30
    end
    object sqlClientes_Referencias_ComerciaisEMPRESAREFERENCIA3: TStringField
      FieldName = 'EMPRESAREFERENCIA3'
      Size = 80
    end
    object sqlClientes_Referencias_ComerciaisCONTATOREFERENCIA3: TStringField
      FieldName = 'CONTATOREFERENCIA3'
      Size = 80
    end
    object sqlClientes_Referencias_ComerciaisLIMITEREFERENCIA3: TFloatField
      FieldName = 'LIMITEREFERENCIA3'
    end
    object sqlClientes_Referencias_ComerciaisMAIORCOMPRAREFERENCIA3: TFloatField
      FieldName = 'MAIORCOMPRAREFERENCIA3'
    end
    object sqlClientes_Referencias_ComerciaisACUMULOATUALREFERENCIA3: TFloatField
      FieldName = 'ACUMULOATUALREFERENCIA3'
    end
    object sqlClientes_Referencias_ComerciaisULTIMACOMPRAREFERENCIA3: TDateField
      FieldName = 'ULTIMACOMPRAREFERENCIA3'
    end
    object sqlClientes_Referencias_ComerciaisQUANTIDADECOMPRASREFERENCIA3: TIntegerField
      FieldName = 'QUANTIDADECOMPRASREFERENCIA3'
    end
    object sqlClientes_Referencias_ComerciaisFORMAPGTOREFERENCIA3: TStringField
      FieldName = 'FORMAPGTOREFERENCIA3'
      Size = 30
    end
    object sqlClientes_Referencias_ComerciaisHISTORICOPGTOREFERENCIA3: TStringField
      FieldName = 'HISTORICOPGTOREFERENCIA3'
      Size = 30
    end
    object sqlClientes_Referencias_ComerciaisEMPRESAREFERENCIA4: TStringField
      FieldName = 'EMPRESAREFERENCIA4'
      Size = 80
    end
    object sqlClientes_Referencias_ComerciaisCONTATOREFERENCIA4: TStringField
      FieldName = 'CONTATOREFERENCIA4'
      Size = 80
    end
    object sqlClientes_Referencias_ComerciaisLIMITEREFERENCIA4: TFloatField
      FieldName = 'LIMITEREFERENCIA4'
    end
    object sqlClientes_Referencias_ComerciaisMAIORCOMPRAREFERENCIA4: TFloatField
      FieldName = 'MAIORCOMPRAREFERENCIA4'
    end
    object sqlClientes_Referencias_ComerciaisACUMULOATUALREFERENCIA4: TFloatField
      FieldName = 'ACUMULOATUALREFERENCIA4'
    end
    object sqlClientes_Referencias_ComerciaisULTIMACOMPRAREFERENCIA4: TDateField
      FieldName = 'ULTIMACOMPRAREFERENCIA4'
    end
    object sqlClientes_Referencias_ComerciaisQUANTIDADECOMPRASREFERENCIA4: TIntegerField
      FieldName = 'QUANTIDADECOMPRASREFERENCIA4'
    end
    object sqlClientes_Referencias_ComerciaisFORMAPGTOREFERENCIA4: TStringField
      FieldName = 'FORMAPGTOREFERENCIA4'
      Size = 30
    end
    object sqlClientes_Referencias_ComerciaisHISTORICOPGTOREFERENCIA4: TStringField
      FieldName = 'HISTORICOPGTOREFERENCIA4'
      Size = 30
    end
    object sqlClientes_Referencias_ComerciaisEMPRESAREFERENCIA5: TStringField
      FieldName = 'EMPRESAREFERENCIA5'
      Size = 80
    end
    object sqlClientes_Referencias_ComerciaisCONTATOREFERENCIA5: TStringField
      FieldName = 'CONTATOREFERENCIA5'
      Size = 80
    end
    object sqlClientes_Referencias_ComerciaisLIMITEREFERENCIA5: TFloatField
      FieldName = 'LIMITEREFERENCIA5'
    end
    object sqlClientes_Referencias_ComerciaisMAIORCOMPRAREFERENCIA5: TFloatField
      FieldName = 'MAIORCOMPRAREFERENCIA5'
    end
    object sqlClientes_Referencias_ComerciaisACUMULOATUALREFERENCIA5: TFloatField
      FieldName = 'ACUMULOATUALREFERENCIA5'
    end
    object sqlClientes_Referencias_ComerciaisULTIMACOMPRAREFERENCIA5: TDateField
      FieldName = 'ULTIMACOMPRAREFERENCIA5'
    end
    object sqlClientes_Referencias_ComerciaisQUANTIDADECOMPRASREFERENCIA5: TIntegerField
      FieldName = 'QUANTIDADECOMPRASREFERENCIA5'
    end
    object sqlClientes_Referencias_ComerciaisFORMAPGTOREFERENCIA5: TStringField
      FieldName = 'FORMAPGTOREFERENCIA5'
      Size = 30
    end
    object sqlClientes_Referencias_ComerciaisHISTORICOPGTOREFERENCIA5: TStringField
      FieldName = 'HISTORICOPGTOREFERENCIA5'
      Size = 30
    end
    object sqlClientes_Referencias_ComerciaisDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      Required = True
    end
    object sqlClientes_Referencias_ComerciaisALTERADO: TStringField
      FieldName = 'ALTERADO'
      Size = 15
    end
    object sqlClientes_Referencias_ComerciaisINCLUIDO: TStringField
      FieldName = 'INCLUIDO'
      Size = 15
    end
  end
  object sqlClientes_Referencias_Bancarias: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'SELECT * FROM CLIENTES_REFERENCIAS_BANCARIAS WHERE EMPRESA = EMP' +
      'RESA and FILIAL = :FILIAL and CODIGO = :CODIGO'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsClientes
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 1384
    Top = 792
    object sqlClientes_Referencias_BancariasEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Required = True
      Size = 2
    end
    object sqlClientes_Referencias_BancariasFILIAL: TStringField
      FieldName = 'FILIAL'
      Required = True
      Size = 2
    end
    object sqlClientes_Referencias_BancariasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sqlClientes_Referencias_BancariasITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object sqlClientes_Referencias_BancariasBANCOREFERENCIA1: TStringField
      FieldName = 'BANCOREFERENCIA1'
      Size = 80
    end
    object sqlClientes_Referencias_BancariasAGENCIAREFERENCIA1: TStringField
      FieldName = 'AGENCIAREFERENCIA1'
      Size = 5
    end
    object sqlClientes_Referencias_BancariasCONTAREFERENCIA1: TStringField
      FieldName = 'CONTAREFERENCIA1'
      Size = 10
    end
    object sqlClientes_Referencias_BancariasGERENTEREFERENCIA1: TStringField
      FieldName = 'GERENTEREFERENCIA1'
      Size = 80
    end
    object sqlClientes_Referencias_BancariasINICIOCLIENTEREFERENCIA1: TStringField
      FieldName = 'INICIOCLIENTEREFERENCIA1'
      Size = 80
    end
    object sqlClientes_Referencias_BancariasOBSERVACAOREFERENCIA1: TStringField
      FieldName = 'OBSERVACAOREFERENCIA1'
      Size = 80
    end
    object sqlClientes_Referencias_BancariasBANCOREFERENCIA2: TStringField
      FieldName = 'BANCOREFERENCIA2'
      Size = 80
    end
    object sqlClientes_Referencias_BancariasAGENCIAREFERENCIA2: TStringField
      FieldName = 'AGENCIAREFERENCIA2'
      Size = 5
    end
    object sqlClientes_Referencias_BancariasCONTAREFERENCIA2: TStringField
      FieldName = 'CONTAREFERENCIA2'
      Size = 10
    end
    object sqlClientes_Referencias_BancariasGERENTEREFERENCIA2: TStringField
      FieldName = 'GERENTEREFERENCIA2'
      Size = 80
    end
    object sqlClientes_Referencias_BancariasINICIOCLIENTEREFERENCIA2: TStringField
      FieldName = 'INICIOCLIENTEREFERENCIA2'
      Size = 80
    end
    object sqlClientes_Referencias_BancariasOBSERVACAOREFERENCIA2: TStringField
      FieldName = 'OBSERVACAOREFERENCIA2'
      Size = 80
    end
    object sqlClientes_Referencias_BancariasBANCOREFERENCIA3: TStringField
      FieldName = 'BANCOREFERENCIA3'
      Size = 80
    end
    object sqlClientes_Referencias_BancariasAGENCIAREFERENCIA3: TStringField
      FieldName = 'AGENCIAREFERENCIA3'
      Size = 5
    end
    object sqlClientes_Referencias_BancariasCONTAREFERENCIA3: TStringField
      FieldName = 'CONTAREFERENCIA3'
      Size = 10
    end
    object sqlClientes_Referencias_BancariasGERENTEREFERENCIA3: TStringField
      FieldName = 'GERENTEREFERENCIA3'
      Size = 80
    end
    object sqlClientes_Referencias_BancariasINICIOCLIENTEREFERENCIA3: TStringField
      FieldName = 'INICIOCLIENTEREFERENCIA3'
      Size = 80
    end
    object sqlClientes_Referencias_BancariasOBSERVACAOREFERENCIA3: TStringField
      FieldName = 'OBSERVACAOREFERENCIA3'
      Size = 80
    end
    object sqlClientes_Referencias_BancariasDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      Required = True
    end
    object sqlClientes_Referencias_BancariasALTERADO: TStringField
      FieldName = 'ALTERADO'
      Size = 15
    end
    object sqlClientes_Referencias_BancariasINCLUIDO: TStringField
      FieldName = 'INCLUIDO'
      Size = 15
    end
  end
  object sqlRevistas_Dados: TSQLDataSet
    CommandText = 
      'select * from REVISTAS_DADOS'#13#10'where EMPRESA = :EMPRESA '#13#10'AND FIL' +
      'IAL = :FILIAL'#13#10'order by EMPRESA, FILIAL, NUMERO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 752
    Top = 2120
    object sqlRevistas_DadosEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Required = True
      Size = 2
    end
    object sqlRevistas_DadosFILIAL: TStringField
      FieldName = 'FILIAL'
      Required = True
      Size = 2
    end
    object sqlRevistas_DadosSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Required = True
      Size = 1
    end
    object sqlRevistas_DadosDATACADASTRO: TDateField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATACADASTRO'
      Required = True
    end
    object sqlRevistas_DadosCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object sqlRevistas_DadosNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Required = True
      Size = 80
    end
    object sqlRevistas_DadosPESSOA: TStringField
      DisplayLabel = 'Pessoa'
      FieldName = 'PESSOA'
      Required = True
      Size = 1
    end
    object sqlRevistas_DadosREDUZIDO: TStringField
      DisplayLabel = 'Nome Reduzido'
      FieldName = 'REDUZIDO'
      Required = True
      Size = 90
    end
    object sqlRevistas_DadosENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Required = True
      Size = 90
    end
    object sqlRevistas_DadosNUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      Required = True
      Size = 5
    end
    object sqlRevistas_DadosCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      Size = 25
    end
    object sqlRevistas_DadosUF: TStringField
      FieldName = 'UF'
      Required = True
      Size = 2
    end
    object sqlRevistas_DadosMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      Required = True
      Size = 30
    end
    object sqlRevistas_DadosCMUNICIPIO: TStringField
      FieldName = 'CMUNICIPIO'
      Size = 7
    end
    object sqlRevistas_DadosBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Required = True
      Size = 30
    end
    object sqlRevistas_DadosCEP: TStringField
      FieldName = 'CEP'
      Required = True
      Size = 8
    end
    object sqlRevistas_DadosCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object sqlRevistas_DadosCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object sqlRevistas_DadosIE: TStringField
      FieldName = 'IE'
      Size = 22
    end
    object sqlRevistas_DadosRG: TStringField
      FieldName = 'RG'
    end
    object sqlRevistas_DadosEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 60
    end
    object sqlRevistas_DadosEMAILNFE: TStringField
      FieldName = 'EMAILNFE'
      Size = 60
    end
    object sqlRevistas_DadosHOMEPAGE: TStringField
      FieldName = 'HOMEPAGE'
      Size = 60
    end
    object sqlRevistas_DadosDATANASCIMENTO: TDateField
      FieldName = 'DATANASCIMENTO'
    end
    object sqlRevistas_DadosDDI: TStringField
      FieldName = 'DDI'
      Size = 3
    end
    object sqlRevistas_DadosDDD: TStringField
      FieldName = 'DDD'
      Required = True
      Size = 3
    end
    object sqlRevistas_DadosTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Required = True
      Size = 9
    end
    object sqlRevistas_DadosFAX: TStringField
      FieldName = 'FAX'
      Size = 9
    end
    object sqlRevistas_DadosCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 9
    end
    object sqlRevistas_DadosCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 60
    end
    object sqlRevistas_DadosCPAIS: TStringField
      FieldName = 'CPAIS'
      Size = 4
    end
    object sqlRevistas_DadosNPAIS: TStringField
      FieldName = 'NPAIS'
      Size = 30
    end
    object sqlRevistas_DadosALTERADO: TStringField
      FieldName = 'ALTERADO'
      Size = 15
    end
    object sqlRevistas_DadosINCLUIDO: TStringField
      FieldName = 'INCLUIDO'
      Size = 15
    end
    object sqlRevistas_DadosNOMEFANTASIA: TStringField
      FieldName = 'NOMEFANTASIA'
      Size = 90
    end
    object sqlRevistas_DadosSITE: TStringField
      FieldName = 'SITE'
      Size = 60
    end
    object sqlRevistas_DadosDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      Required = True
    end
  end
  object dtsRevistas_Dados: TDataSource
    DataSet = sqlRevistas_Dados
    Left = 864
    Top = 2120
  end
  object sqlRevistas_Itens: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select * from REVISTAS_ITENS '#13#10'where EMPRESA = :EMPRESA '#13#10'AND FI' +
      'LIAL = :FILIAL '#13#10'AND NUMERO = :NUMERO'#13#10'order by EMPRESA, FILIAL,' +
      ' NUMERO, ITEM'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsRevistas_Dados
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 856
    Top = 2200
    object sqlRevistas_ItensEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Required = True
      Size = 2
    end
    object sqlRevistas_ItensFILIAL: TStringField
      FieldName = 'FILIAL'
      Required = True
      Size = 2
    end
    object sqlRevistas_ItensNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Required = True
    end
    object sqlRevistas_ItensITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object sqlRevistas_ItensDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 80
    end
    object sqlRevistas_ItensALTERADO: TStringField
      FieldName = 'ALTERADO'
      Size = 15
    end
    object sqlRevistas_ItensINCLUIDO: TStringField
      FieldName = 'INCLUIDO'
      Size = 15
    end
    object sqlRevistas_ItensDATAINICIO: TDateField
      FieldName = 'DATAINICIO'
      Required = True
    end
    object sqlRevistas_ItensDATAFIM: TDateField
      FieldName = 'DATAFIM'
      Required = True
    end
    object sqlRevistas_ItensTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 30
    end
  end
  object dspRevistas: TDataSetProvider
    DataSet = sqlRevistas_Dados
    Options = [poIncFieldProps, poCascadeUpdates, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspRevistasBeforeUpdateRecord
    Left = 744
    Top = 2201
  end
  object sqlMovimentos_Bancarios: TSQLDataSet
    GetMetadata = False
    CommandText = 
      'select * from MOVIMENTOS_BANCARIOS where EMPRESA = :EMPRESA and ' +
      'FILIAL = :FILIAL order by EMPRESA, FILIAL, MOVIMENTO, EMISSAO, E' +
      'SPECIE, BANCO, AGENCIA, CONTA, DOCUMENTO, IDENTIFICADOR'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 590
    Top = 2308
    object sqlMovimentos_BancariosEMPRESA: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlMovimentos_BancariosFILIAL: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlMovimentos_BancariosMOVIMENTO: TStringField
      DefaultExpression = #39#39
      DisplayLabel = '  '
      FieldName = 'MOVIMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 1
    end
    object sqlMovimentos_BancariosEMISSAO: TDateField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'EMISSAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object sqlMovimentos_BancariosESPECIE: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Esp'#233'cie'
      FieldName = 'ESPECIE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlMovimentos_BancariosBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlMovimentos_BancariosAGENCIA: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'AGENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object sqlMovimentos_BancariosCONTA: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Conta'
      FieldName = 'CONTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object sqlMovimentos_BancariosDOCUMENTO: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object sqlMovimentos_BancariosIDENTIFICADOR: TIntegerField
      DisplayLabel = 'Identificador'
      FieldName = 'IDENTIFICADOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlMovimentos_BancariosBANCOCHEQUE: TIntegerField
      DisplayLabel = 'Banco - Cheque'
      FieldName = 'BANCOCHEQUE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMovimentos_BancariosAGENCIACHEQUE: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Ag'#234'ncia - Cheque'
      FieldName = 'AGENCIACHEQUE'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object sqlMovimentos_BancariosCONTACHEQUE: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Conta - Cheque'
      FieldName = 'CONTACHEQUE'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object sqlMovimentos_BancariosPROPRIETARIOCHEQUE: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Propriet'#225'rio Cheque'
      FieldName = 'PROPRIETARIOCHEQUE'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object sqlMovimentos_BancariosVALORBASE: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor Base'
      FieldName = 'VALORBASE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMovimentos_BancariosVALOR: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      currency = True
    end
    object sqlMovimentos_BancariosMOVIMENTACAO: TDateField
      DisplayLabel = 'Movimenta'#231#227'o'
      FieldName = 'MOVIMENTACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object sqlMovimentos_BancariosCATEGORIA: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Categoria'
      FieldName = 'CATEGORIA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 15
    end
    object sqlMovimentos_BancariosPREFIXO: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Prefixo'
      FieldName = 'PREFIXO'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object sqlMovimentos_BancariosNUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMovimentos_BancariosPARCELA: TIntegerField
      DisplayLabel = 'Parcela'
      FieldName = 'PARCELA'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMovimentos_BancariosTIPO: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object sqlMovimentos_BancariosPROPRIETARIO: TIntegerField
      DisplayLabel = 'Propriet'#225'rio'
      FieldName = 'PROPRIETARIO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMovimentos_BancariosBASE10925: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Base 10925'
      FieldName = 'BASE10925'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlMovimentos_BancariosVALORPIS: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor PIS'
      FieldName = 'VALORPIS'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMovimentos_BancariosVALORCOFINS: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor COFINS'
      FieldName = 'VALORCOFINS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlMovimentos_BancariosVALORCSLL: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Valor CSLL'
      FieldName = 'VALORCSLL'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlMovimentos_BancariosDECRESCIMO: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Decr'#233'scimo'
      FieldName = 'DECRESCIMO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlMovimentos_BancariosOUTROSDESCONTOS: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Outros Descontos'
      FieldName = 'OUTROSDESCONTOS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlMovimentos_BancariosRETENCAO10925: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Reten'#231#227'o 10925'
      FieldName = 'RETENCAO10925'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlMovimentos_BancariosACRESCIMO: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Acr'#233'scimo'
      FieldName = 'ACRESCIMO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlMovimentos_BancariosMULTA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Multa'
      FieldName = 'MULTA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlMovimentos_BancariosTAXAPERMANENCIA: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Taxa Perman'#234'ncia'
      FieldName = 'TAXAPERMANENCIA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlMovimentos_BancariosJUROS: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Juros'
      FieldName = 'JUROS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object sqlMovimentos_BancariosBENEFICIARIO: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Benefici'#225'rio'
      FieldName = 'BENEFICIARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 40
    end
    object sqlMovimentos_BancariosCONCILIADO: TStringField
      DefaultExpression = #39'0'#39
      FieldName = 'CONCILIADO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object sqlMovimentos_BancariosEMPRESAORIGEM: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Empresa Origem'
      FieldName = 'EMPRESAORIGEM'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object sqlMovimentos_BancariosFILIALORIGEM: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Filial Origem'
      FieldName = 'FILIALORIGEM'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object sqlMovimentos_BancariosORIGEM: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Origem'
      FieldName = 'ORIGEM'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object sqlMovimentos_BancariosCONFIGURACAO: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Configura'#231#227'o'
      FieldName = 'CONFIGURACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 4
    end
    object sqlMovimentos_BancariosSELECIONADO: TStringField
      DefaultExpression = #39'0'#39
      DisplayLabel = '  '
      FieldName = 'SELECIONADO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object sqlMovimentos_BancariosIDCMP: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Id Compensa'#231#227'o'
      FieldName = 'IDCMP'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object sqlMovimentos_BancariosLOTE: TIntegerField
      DefaultExpression = '0'
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMovimentos_BancariosCC: TStringField
      DefaultExpression = #39#39
      DisplayLabel = 'Centro de Custo'
      FieldName = 'CC'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object sqlMovimentos_BancariosBORDERO: TIntegerField
      DefaultExpression = '0'
      DisplayLabel = 'Border'#244
      FieldName = 'BORDERO'
      ProviderFlags = [pfInUpdate]
    end
    object sqlMovimentos_BancariosDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data da Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object sqlMovimentos_BancariosINCLUIDO: TStringField
      FieldName = 'INCLUIDO'
      Size = 15
    end
    object sqlMovimentos_BancariosALTERADO: TStringField
      FieldName = 'ALTERADO'
      Size = 15
    end
    object sqlMovimentos_BancariosID: TStringField
      FieldName = 'ID'
    end
    object sqlMovimentos_BancariosHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 255
    end
    object sqlMovimentos_BancariosTIPOMOVIMENTO: TStringField
      FieldName = 'TIPOMOVIMENTO'
      Size = 1
    end
  end
  object dspMovimentos_Bancarios: TDataSetProvider
    DataSet = sqlMovimentos_Bancarios
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    BeforeUpdateRecord = dspMovimentos_BancariosBeforeUpdateRecord
    Left = 594
    Top = 2375
  end
  object sqlMovimentos_Bancarios_Rateios: TSQLDataSet
    SchemaName = 'sysdba'
    GetMetadata = False
    ObjectView = True
    CommandText = 
      'select * from MOVIMENTOS_BANCARIOS_RATEIOS where EMPRESA = :EMPR' +
      'ESA and FILIAL = :FILIAL and MOVIMENTO = :MOVIMENTO and EMISSAO ' +
      '= :EMISSAO and ESPECIE = :ESPECIE and BANCO = :BANCO and AGENCIA' +
      ' = :AGENCIA and CONTA = :CONTA and DOCUMENTO = :DOCUMENTO and ID' +
      'ENTIFICADOR = :IDENTIFICADOR  order by EMPRESA, FILIAL, MOVIMENT' +
      'O, EMISSAO, ESPECIE, BANCO, AGENCIA, CONTA, DOCUMENTO, IDENTIFIC' +
      'ADOR, CATEGORIA'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dtsMovimentos_Bancarios_Rateios
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 3
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
        Size = 3
      end
      item
        DataType = ftString
        Name = 'MOVIMENTO'
        ParamType = ptInput
        Size = 2
      end
      item
        DataType = ftDate
        Name = 'EMISSAO'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftString
        Name = 'ESPECIE'
        ParamType = ptInput
        Size = 3
      end
      item
        DataType = ftInteger
        Name = 'BANCO'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftString
        Name = 'AGENCIA'
        ParamType = ptInput
        Size = 6
      end
      item
        DataType = ftString
        Name = 'CONTA'
        ParamType = ptInput
        Size = 11
      end
      item
        DataType = ftString
        Name = 'DOCUMENTO'
        ParamType = ptInput
        Size = 16
      end
      item
        DataType = ftInteger
        Name = 'IDENTIFICADOR'
        ParamType = ptInput
        Size = 4
      end>
    Left = 734
    Top = 2383
    object sqlMovimentos_Bancarios_RateiosEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlMovimentos_Bancarios_RateiosFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlMovimentos_Bancarios_RateiosMOVIMENTO: TStringField
      DisplayLabel = 'Movimento'
      FieldName = 'MOVIMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 1
    end
    object sqlMovimentos_Bancarios_RateiosEMISSAO: TDateField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'EMISSAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object sqlMovimentos_Bancarios_RateiosESPECIE: TStringField
      DisplayLabel = 'Esp'#233'cie'
      FieldName = 'ESPECIE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object sqlMovimentos_Bancarios_RateiosBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlMovimentos_Bancarios_RateiosAGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'AGENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object sqlMovimentos_Bancarios_RateiosCONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'CONTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object sqlMovimentos_Bancarios_RateiosDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object sqlMovimentos_Bancarios_RateiosIDENTIFICADOR: TIntegerField
      DisplayLabel = 'Identificador'
      FieldName = 'IDENTIFICADOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlMovimentos_Bancarios_RateiosCATEGORIA: TStringField
      DisplayLabel = 'Categoria'
      FieldName = 'CATEGORIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object sqlMovimentos_Bancarios_RateiosPERCENTUAL: TFloatField
      DisplayLabel = 'Percential'
      FieldName = 'PERCENTUAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = '#0.0000%'
      EditFormat = '0.0000'
    end
    object sqlMovimentos_Bancarios_RateiosVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      currency = True
    end
    object sqlMovimentos_Bancarios_RateiosDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dtsMovimentos_Bancarios_Rateios: TDataSource
    DataSet = sqlMovimentos_Bancarios
    Left = 732
    Top = 2331
  end
end
