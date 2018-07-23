object RDM_Municipio: TRDM_Municipio
  OldCreateOrder = False
  Left = 339
  Top = 147
  Height = 150
  Width = 215
  object qryMunicipio: TADQuery
    Connection = DM_Conexao.con
    SQL.Strings = (
      'SELECT "ID_COD_MUNICIPIO"'
      '      ,"COD_MUNICIPIO"'
      '      ,"UF"'
      '      ,"NOME"'
      '      ,"NOME_SEM_ACENTO"'
      '  FROM "public"."CODIGO_MUNICIPIO"'
      'WHERE (("ID_COD_MUNICIPIO" = :ID_COD_MUNICIPIO) OR'
      '       (:ID_COD_MUNICIPIO IS NULL)) AND '
      '      (("UF" = :UF) OR '
      '       (:UF IS NULL))'
      'ORDER BY "UF", '#9'"COD_MUNICIPIO"')
    Left = 32
    Top = 32
    ParamData = <
      item
        Name = 'ID_COD_MUNICIPIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'UF'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryMunicipioID_COD_MUNICIPIO: TIntegerField
      FieldName = 'ID_COD_MUNICIPIO'
      Origin = '"ID_COD_MUNICIPIO"'
    end
    object qryMunicipioCOD_MUNICIPIO: TFloatField
      FieldName = 'COD_MUNICIPIO'
      Origin = '"COD_MUNICIPIO"'
    end
    object qryMunicipioUF: TWideStringField
      FieldName = 'UF'
      Origin = '"UF"'
      Size = 2
    end
    object qryMunicipioNOME: TWideStringField
      FieldName = 'NOME'
      Origin = '"NOME"'
      Size = 255
    end
    object qryMunicipioNOME_SEM_ACENTO: TWideStringField
      FieldName = 'NOME_SEM_ACENTO'
      Origin = '"NOME_SEM_ACENTO"'
      Size = 255
    end
  end
  object dspMunicipio: TDataSetProvider
    DataSet = qryMunicipio
    Left = 120
    Top = 32
  end
end
