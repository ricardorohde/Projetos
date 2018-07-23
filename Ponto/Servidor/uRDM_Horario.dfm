object RDM_Horario: TRDM_Horario
  OldCreateOrder = False
  Left = 211
  Top = 169
  Height = 251
  Width = 316
  object dspHORARIO: TDataSetProvider
    DataSet = qryHORARIO
    Left = 184
    Top = 40
  end
  object dspHORARIO_DETALHE: TDataSetProvider
    DataSet = qryHORARIO_DETALHE
    Left = 200
    Top = 112
  end
  object qryHORARIO: TADQuery
    Connection = DM_Conexao.con
    SQL.Strings = (
      'SELECT "ID_HORARIO"'
      '      ,"CODIGO_EXTERNO"'
      '      ,"DESCRICAO"'
      '      ,"POSSUI_ESCALA"'
      'FROM "public"."HORARIO"'
      'WHERE ("ID_HORARIO" = :ID_HORARIO) OR '
      '      (:ID_HORARIO IS NULL)'
      'ORDER BY "CODIGO_EXTERNO" ')
    Left = 56
    Top = 40
    ParamData = <
      item
        Name = 'ID_HORARIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryHORARIO_DETALHE: TADQuery
    Connection = DM_Conexao.con
    SQL.Strings = (
      'SELECT "ID_HORARIO_DETALHE"'
      '      ,"ID_HORARIO"'
      '      ,"ENTRADA"'
      '      ,"ALMOCO_INICIO"'
      '      ,"ALMOCO_FIM"'
      '      ,"SAIDA"'
      '      ,"DIA_SEMANA"'
      '      ,"HORAS_A_TRABALHAR"'
      'FROM "public"."HORARIO_DETALHE"'
      'WHERE "ID_HORARIO" = :ID_HORARIO'
      'ORDER BY "DIA_SEMANA"')
    Left = 72
    Top = 112
    ParamData = <
      item
        Name = 'ID_HORARIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
