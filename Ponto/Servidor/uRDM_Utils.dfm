object RDM_Utils: TRDM_Utils
  OldCreateOrder = False
  Left = 404
  Top = 277
  Height = 223
  Width = 215
  object qryRetornoID: TADQuery
    Connection = DM_Conexao.con
    SQL.Strings = (
      'SELECT currval(pg_get_serial_sequence(:TABELA, :CAMPO)) ID')
    Left = 48
    Top = 24
    ParamData = <
      item
        Name = 'TABELA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CAMPO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryRetornoIDid: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = True
    end
  end
  object dspRetornoID: TDataSetProvider
    DataSet = qryRetornoID
    Left = 128
    Top = 24
  end
  object qryEstados: TADQuery
    Connection = DM_Conexao.con
    SQL.Strings = (
      'SELECT "ID_ESTADO"'
      '      ,"UF"'
      '      ,"NOME"'
      'FROM "public"."ESTADOS"'
      'WHERE ("UF" = :UF) OR'
      '      (:UF IS NULL)'
      'ORDER BY "UF"')
    Left = 48
    Top = 80
    ParamData = <
      item
        Name = 'UF'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryEstadosID_ESTADO: TIntegerField
      FieldName = 'ID_ESTADO'
      Origin = '"ID_ESTADO"'
    end
    object qryEstadosUF: TWideStringField
      FieldName = 'UF'
      Origin = '"UF"'
      Size = 2
    end
    object qryEstadosNOME: TWideStringField
      FieldName = 'NOME'
      Origin = '"NOME"'
      Size = 50
    end
  end
  object dspEstados: TDataSetProvider
    DataSet = qryEstados
    Left = 128
    Top = 80
  end
end
