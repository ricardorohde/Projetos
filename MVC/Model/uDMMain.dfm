object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 272
  Width = 249
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 'C:\BASE\DADOS\fb3\SQS2002.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    Left = 24
    Top = 16
  end
  object IBQuery1: TIBQuery
    Left = 24
    Top = 72
  end
  object IBDataSet1: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    RefreshSQL.Strings = (
      'select * from BASE_CASA_IMOV'
      'ORDER BY CODIGO')
    SelectSQL.Strings = (
      'select * from BASE_CASA_IMOV'
      'ORDER BY CODIGO')
    Active = True
    Left = 24
    Top = 136
    object IBDataSet1FILIAL: TIntegerField
      FieldName = 'FILIAL'
      Origin = '"BASE_CASA_IMOV"."FILIAL"'
    end
    object IBDataSet1CODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = '"BASE_CASA_IMOV"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBDataSet1AVISO_STATUS: TIBStringField
      FieldName = 'AVISO_STATUS'
      Origin = '"BASE_CASA_IMOV"."AVISO_STATUS"'
      Size = 30
    end
    object IBDataSet1TIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = '"BASE_CASA_IMOV"."TIPO"'
      Required = True
      Size = 30
    end
    object IBDataSet1FINALIDADE: TIBStringField
      FieldName = 'FINALIDADE'
      Origin = '"BASE_CASA_IMOV"."FINALIDADE"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object IBDataSet1NATUREZA: TIBStringField
      FieldName = 'NATUREZA'
      Origin = '"BASE_CASA_IMOV"."NATUREZA"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object IBDataSet1ENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = '"BASE_CASA_IMOV"."ENDERECO"'
      Size = 40
    end
    object IBDataSet1COMPLEMENTO: TIBStringField
      FieldName = 'COMPLEMENTO'
      Origin = '"BASE_CASA_IMOV"."COMPLEMENTO"'
    end
    object IBDataSet1BAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = '"BASE_CASA_IMOV"."BAIRRO"'
      Required = True
      Size = 60
    end
    object IBDataSet1MUNICIPIO: TIBStringField
      FieldName = 'MUNICIPIO'
      Origin = '"BASE_CASA_IMOV"."MUNICIPIO"'
      Required = True
      Size = 60
    end
    object IBDataSet1ESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = '"BASE_CASA_IMOV"."ESTADO"'
      Required = True
      FixedChar = True
      Size = 2
    end
    object IBDataSet1CEP: TIBStringField
      FieldName = 'CEP'
      Origin = '"BASE_CASA_IMOV"."CEP"'
      FixedChar = True
      Size = 9
    end
    object IBDataSet1AREA_UTIL: TIBBCDField
      FieldName = 'AREA_UTIL'
      Origin = '"BASE_CASA_IMOV"."AREA_UTIL"'
      Precision = 18
      Size = 2
    end
    object IBDataSet1VALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = '"BASE_CASA_IMOV"."VALOR"'
      Precision = 18
      Size = 2
    end
    object IBDataSet1VALOR_CONDOMINIO: TIBBCDField
      FieldName = 'VALOR_CONDOMINIO'
      Origin = '"BASE_CASA_IMOV"."VALOR_CONDOMINIO"'
      Precision = 18
      Size = 2
    end
    object IBDataSet1VALOR_IPTU: TIBBCDField
      FieldName = 'VALOR_IPTU'
      Origin = '"BASE_CASA_IMOV"."VALOR_IPTU"'
      Precision = 18
      Size = 2
    end
    object IBDataSet1CODIGO_PROPRIETARIO: TIntegerField
      FieldName = 'CODIGO_PROPRIETARIO'
      Origin = '"BASE_CASA_IMOV"."CODIGO_PROPRIETARIO"'
    end
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    Left = 128
    Top = 24
  end
end
