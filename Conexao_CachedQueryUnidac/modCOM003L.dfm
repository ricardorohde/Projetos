object dmCOM003L: TdmCOM003L
  OldCreateOrder = False
  Height = 366
  Width = 570
  object qyInsLog_Manutencao: TUniQuery
    Connection = dmPrincipal.con
    SQL.Strings = (
      'INSERT INTO LOG_MANUTENCAO'
      '( CDLOG_MANUTENCAO     ,'
      '  CDPROGRAMA           ,'
      '  TPMANUTENCAO         ,'
      '  CDSTATUS_MANUTENCAO  ,'
      '  CDOPERADOR_MANUTENCAO,'
      '  DTMANUTENCAO         )'
      'VALUES'
      '( :CDLOG_MANUTENCAO     ,'
      '  :CDPROGRAMA           ,'
      '  :TPMANUTENCAO         ,'
      '  :CDSTATUS_MANUTENCAO  ,'
      '  :CDOPERADOR_MANUTENCAO,'
      '  DATA_SISTEMA          )')
    Left = 72
    Top = 6
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CDLOG_MANUTENCAO'
      end
      item
        DataType = ftUnknown
        Name = 'CDPROGRAMA'
      end
      item
        DataType = ftUnknown
        Name = 'TPMANUTENCAO'
      end
      item
        DataType = ftUnknown
        Name = 'CDSTATUS_MANUTENCAO'
      end
      item
        DataType = ftUnknown
        Name = 'CDOPERADOR_MANUTENCAO'
      end>
  end
  object qyInsLog_Manutencao_Campo: TUniQuery
    Connection = dmPrincipal.con
    SQL.Strings = (
      'INSERT INTO LOG_MANUTENCAO_CAMPO'
      '(CDLOG_MANUTENCAO,'
      ' SQREGISTRO      ,'
      ' NOCAMPO         ,'
      ' DSCAMPO         ,'
      ' VLANTERIOR      ,'
      ' DSVALOR_ANTERIOR,'
      ' VLATUAL         ,'
      ' DSVALOR_ATUAL )'
      'VALUES'
      '(:CDLOG_MANUTENCAO,'
      ' :SQREGISTRO      ,'
      ' :NOCAMPO         , '
      ' :DSCAMPO         ,'
      ' :VLANTERIOR      ,'
      ' :DSVALOR_ANTERIOR,'
      ' :VLATUAL         ,'
      ' :DSVALOR_ATUAL)')
    Left = 72
    Top = 170
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CDLOG_MANUTENCAO'
      end
      item
        DataType = ftInteger
        Name = 'SQREGISTRO'
      end
      item
        DataType = ftString
        Name = 'NOCAMPO'
      end
      item
        DataType = ftString
        Name = 'DSCAMPO'
      end
      item
        DataType = ftString
        Name = 'VLANTERIOR'
      end
      item
        DataType = ftString
        Name = 'DSVALOR_ANTERIOR'
      end
      item
        DataType = ftString
        Name = 'VLATUAL'
      end
      item
        DataType = ftString
        Name = 'DSVALOR_ATUAL'
      end>
  end
  object qyInsLog_Manutencao_Registro: TUniQuery
    Connection = dmPrincipal.con
    SQL.Strings = (
      'INSERT INTO LOG_MANUTENCAO_REGISTRO'
      '( CDLOG_MANUTENCAO ,'
      '  SQREGISTRO       ,'
      '  NOTABELA         ,'
      '  TPMANUTENCAO,'
      '  NRORDEM          )'
      'VALUES'
      '( :CDLOG_MANUTENCAO ,'
      '  :SQREGISTRO       ,'
      '  :NOTABELA         ,'
      '  :TPMANUTENCAO,'
      '  :NRORDEM          )'
      '')
    Left = 70
    Top = 62
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CDLOG_MANUTENCAO'
      end
      item
        DataType = ftUnknown
        Name = 'SQREGISTRO'
      end
      item
        DataType = ftUnknown
        Name = 'NOTABELA'
      end
      item
        DataType = ftUnknown
        Name = 'TPMANUTENCAO'
      end
      item
        DataType = ftUnknown
        Name = 'NRORDEM'
      end>
  end
  object qyInsLog_Manutencao_Chave: TUniQuery
    Connection = dmPrincipal.con
    SQL.Strings = (
      'INSERT INTO LOG_MANUTENCAO_CHAVE'
      '(CDLOG_MANUTENCAO,'
      ' SQREGISTRO,'
      ' NOCAMPO ,'
      ' DSCAMPO ,'
      ' VLCAMPO ,'
      ' DSVALOR )'
      'VALUES'
      '(:CDLOG_MANUTENCAO,'
      ' :SQREGISTRO,'
      ' :NOCAMPO ,'
      ' :DSCAMPO ,'
      ' :VLCAMPO ,'
      ' :DSVALOR )')
    Left = 70
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CDLOG_MANUTENCAO'
      end
      item
        DataType = ftUnknown
        Name = 'SQREGISTRO'
      end
      item
        DataType = ftString
        Name = 'NOCAMPO'
      end
      item
        DataType = ftString
        Name = 'DSCAMPO'
      end
      item
        DataType = ftUnknown
        Name = 'VLCAMPO'
      end
      item
        DataType = ftUnknown
        Name = 'DSVALOR'
      end>
  end
  object qyUpLog_Manutencao: TUniQuery
    Connection = dmPrincipal.con
    SQL.Strings = (
      'UPDATE LOG_MANUTENCAO'
      'SET CDSTATUS_MANUTENCAO =:CDSTATUS_MANUTENCAO,'
      '    CDOPERADOR_DUPLA_CUSTODIA =:CDOPERADOR_DUPLA_CUSTODIA,'
      '    DTDUPLA_CUSTODIA =DATA_SISTEMA           '
      'WHERE'
      '  CDLOG_MANUTENCAO =:CDLOG_MANUTENCAO')
    Left = 282
    Top = 237
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CDSTATUS_MANUTENCAO'
      end
      item
        DataType = ftUnknown
        Name = 'CDOPERADOR_DUPLA_CUSTODIA'
      end
      item
        DataType = ftUnknown
        Name = 'CDLOG_MANUTENCAO'
      end>
  end
  object qyLog_Manutencao_Campo: TUniQuery
    Connection = dmPrincipal.con
    SQL.Strings = (
      'SELECT'
      '  NOCAMPO,'
      '  VLANTERIOR,'
      '  VLATUAL'
      'FROM'
      '  LOG_MANUTENCAO_CAMPO'
      'WHERE'
      '  CDLOG_MANUTENCAO = :CDLOG_MANUTENCAO'
      'AND'
      '  SQREGISTRO =:SQREGISTRO')
    Left = 274
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CDLOG_MANUTENCAO'
      end
      item
        DataType = ftUnknown
        Name = 'SQREGISTRO'
      end>
  end
  object qyLog_Manutencao_Chave: TUniQuery
    Connection = dmPrincipal.con
    SQL.Strings = (
      'SELECT'
      '  NOCAMPO,'
      '  VLCAMPO'
      'FROM'
      '  LOG_MANUTENCAO_CHAVE'
      'WHERE'
      '  CDLOG_MANUTENCAO = :CDLOG_MANUTENCAO'
      'AND'
      '  SQREGISTRO = :SQREGISTRO')
    Left = 266
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CDLOG_MANUTENCAO'
      end
      item
        DataType = ftUnknown
        Name = 'SQREGISTRO'
      end>
  end
  object qyLog_Manutencao_Registro: TUniQuery
    Connection = dmPrincipal.con
    SQL.Strings = (
      'SELECT SQREGISTRO,NOTABELA,TPMANUTENCAO'
      'FROM LOG_MANUTENCAO_REGISTRO'
      'WHERE CDLOG_MANUTENCAO = :CDLOG_MANUTENCAO'
      'AND SQREGISTRO = :SQREGISTRO'
      'ORDER BY NRORDEM,SQREGISTRO')
    Left = 266
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CDLOG_MANUTENCAO'
      end
      item
        DataType = ftInteger
        Name = 'SQREGISTRO'
        ParamType = ptInput
      end>
  end
  object qyAplica_Manutencao: TUniQuery
    Connection = dmPrincipal.con
    Left = 266
    Top = 8
  end
  object qyPrograma: TUniQuery
    SQL.Strings = (
      ''
      ''
      '')
    Left = 72
    Top = 222
  end
  object JvMemData: TJvMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'TABELA'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'CAMPO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'CHAVE'
        DataType = ftString
        Size = 1
      end>
    Left = 424
    Top = 112
    object JvMemDataTABELA: TStringField
      DisplayWidth = 51
      FieldName = 'TABELA'
      Size = 80
    end
    object JvMemDataCAMPO: TStringField
      DisplayWidth = 37
      FieldName = 'CAMPO'
      Size = 100
    end
    object JvMemDataCHAVE: TStringField
      DisplayWidth = 20
      FieldName = 'CHAVE'
      Size = 1
    end
  end
  object qyLista_Manutencao_Registro: TUniQuery
    Connection = dmPrincipal.con
    SQL.Strings = (
      'SELECT SQREGISTRO,NOTABELA,TPMANUTENCAO'
      'FROM LOG_MANUTENCAO_REGISTRO'
      'WHERE CDLOG_MANUTENCAO = :CDLOG_MANUTENCAO')
    Left = 426
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CDLOG_MANUTENCAO'
      end>
  end
end
