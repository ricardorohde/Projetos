object RDM_Feriado: TRDM_Feriado
  OldCreateOrder = False
  Left = 272
  Top = 206
  Height = 150
  Width = 215
  object qryFERIADO: TADQuery
    Connection = DM_Conexao.con
    SQL.Strings = (
      'SELECT "ID_FERIADO"'
      '      ,"CODIGO_EXTERNO"'
      '      ,"DATA_FERIADO"'
      '      ,"DESCRICAO"'
      '      ,"ABRANGENCIA"'
      '      ,"CODIGO_MUNICIPIO"'
      'FROM "public"."FERIADO"'
      'WHERE ("ID_FERIADO" = :ID_FERIADO) OR '
      '      (:ID_FERIADO IS NULL)'
      'ORDER BY "CODIGO_EXTERNO"')
    Left = 32
    Top = 16
    ParamData = <
      item
        Name = 'ID_FERIADO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryFERIADOID_FERIADO: TIntegerField
      FieldName = 'ID_FERIADO'
      Origin = '"ID_FERIADO"'
    end
    object qryFERIADOCODIGO_EXTERNO: TIntegerField
      FieldName = 'CODIGO_EXTERNO'
      Origin = '"CODIGO_EXTERNO"'
    end
    object qryFERIADODATA_FERIADO: TSQLTimeStampField
      FieldName = 'DATA_FERIADO'
      Origin = '"DATA_FERIADO"'
    end
    object qryFERIADODESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Origin = '"DESCRICAO"'
      Size = 50
    end
    object qryFERIADOABRANGENCIA: TIntegerField
      FieldName = 'ABRANGENCIA'
      Origin = '"ABRANGENCIA"'
    end
    object qryFERIADOCODIGO_MUNICIPIO: TIntegerField
      FieldName = 'CODIGO_MUNICIPIO'
      Origin = '"CODIGO_MUNICIPIO"'
    end
  end
  object dspFERIADO: TDataSetProvider
    DataSet = qryFERIADO
    Left = 120
    Top = 16
  end
end
