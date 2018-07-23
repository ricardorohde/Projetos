object RDM_Usuario: TRDM_Usuario
  OldCreateOrder = False
  Left = 229
  Top = 219
  Height = 150
  Width = 215
  object qryUsuario: TADQuery
    Connection = DM_Conexao.con
    SQL.Strings = (
      'SELECT "ID_USUARIO"'
      '      ,"USUARIO"'
      '      ,"SENHA"'
      '      ,"CODIGO_EXTERNO"'
      'FROM "public"."USUARIOS"'
      'WHERE ("USUARIO" =:USUARIO) OR '
      '      (:USUARIO IS NULL)')
    Left = 32
    Top = 24
    ParamData = <
      item
        Name = 'USUARIO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryUsuarioID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = '"ID_USUARIO"'
    end
    object qryUsuarioUSUARIO: TWideStringField
      FieldName = 'USUARIO'
      Origin = '"USUARIO"'
      Size = 30
    end
    object qryUsuarioSENHA: TWideStringField
      FieldName = 'SENHA'
      Origin = '"SENHA"'
      Size = 255
    end
    object qryUsuarioCODIGO_EXTERNO: TIntegerField
      FieldName = 'CODIGO_EXTERNO'
      Origin = '"CODIGO_EXTERNO"'
    end
  end
  object dspUsuario: TDataSetProvider
    DataSet = qryUsuario
    Left = 128
    Top = 24
  end
end
