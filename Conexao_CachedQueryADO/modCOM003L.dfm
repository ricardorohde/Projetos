object dmCOM003L: TdmCOM003L
  OldCreateOrder = False
  Height = 366
  Width = 570
  object qyInsLog_Manutencao: TADOQuery
    Connection = dmPrincipal.con
    Parameters = <
      item
        Name = 'CDLOG_MANUTENCAO'
        DataType = ftBCD
        Precision = 10
        Size = 19
      end
      item
        Name = 'CDPROGRAMA'
        DataType = ftString
        Precision = 30
        Size = 30
      end
      item
        Name = 'TPMANUTENCAO'
        DataType = ftString
        Precision = 1
        Size = 1
      end
      item
        Name = 'CDSTATUS_MANUTENCAO'
        DataType = ftString
        Precision = 11
        Size = 11
      end
      item
        Name = 'CDOPERADOR_MANUTENCAO'
        DataType = ftString
        Precision = 15
        Size = 15
      end>
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
  end
  object qyInsLog_Manutencao_Campo: TADOQuery
    Connection = dmPrincipal.con
    Parameters = <
      item
        Name = 'CDLOG_MANUTENCAO'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 10
        Size = 19
      end
      item
        Name = 'SQREGISTRO'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 3
        Size = 19
      end
      item
        Name = 'NOCAMPO'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
      end
      item
        Name = 'DSCAMPO'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 100
        Size = 100
      end
      item
        Name = 'VLANTERIOR'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 250
        Size = 250
      end
      item
        Name = 'DSVALOR_ANTERIOR'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 250
        Size = 250
      end
      item
        Name = 'VLATUAL'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 250
        Size = 250
      end
      item
        Name = 'DSVALOR_ATUAL'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 250
        Size = 250
      end>
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
  end
  object qyInsLog_Manutencao_Registro: TADOQuery
    Connection = dmPrincipal.con
    Parameters = <
      item
        Name = 'CDLOG_MANUTENCAO'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 10
        Size = 19
      end
      item
        Name = 'SQREGISTRO'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 3
        Size = 19
      end
      item
        Name = 'NOTABELA'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
      end
      item
        Name = 'TPMANUTENCAO'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 1
        Size = 1
      end
      item
        Name = 'NRORDEM'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 3
        Size = 19
      end>
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
  end
  object qyInsLog_Manutencao_Chave: TADOQuery
    Connection = dmPrincipal.con
    Parameters = <
      item
        Name = 'CDLOG_MANUTENCAO'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 10
        Size = 19
      end
      item
        Name = 'SQREGISTRO'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 3
        Size = 19
      end
      item
        Name = 'NOCAMPO'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
      end
      item
        Name = 'DSCAMPO'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 100
        Size = 100
      end
      item
        Name = 'VLCAMPO'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 250
        Size = 250
      end
      item
        Name = 'DSVALOR'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 250
        Size = 250
      end>
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
  end
  object qyUpLog_Manutencao: TADOQuery
    Connection = dmPrincipal.con
    Parameters = <
      item
        Name = 'CDSTATUS_MANUTENCAO'
        DataType = ftString
        Precision = 11
        Size = 11
      end
      item
        Name = 'CDOPERADOR_DUPLA_CUSTODIA'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 15
        Size = 15
      end
      item
        Name = 'CDLOG_MANUTENCAO'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 10
        Size = 19
      end>
    SQL.Strings = (
      'UPDATE LOG_MANUTENCAO'
      'SET CDSTATUS_MANUTENCAO =:CDSTATUS_MANUTENCAO,'
      '    CDOPERADOR_DUPLA_CUSTODIA =:CDOPERADOR_DUPLA_CUSTODIA,'
      '    DTDUPLA_CUSTODIA =DATA_SISTEMA           '
      'WHERE'
      '  CDLOG_MANUTENCAO =:CDLOG_MANUTENCAO')
    Left = 282
    Top = 237
  end
  object qyLog_Manutencao_Campo: TADOQuery
    Connection = dmPrincipal.con
    Parameters = <
      item
        Name = 'CDLOG_MANUTENCAO'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 10
        Size = 19
      end
      item
        Name = 'SQREGISTRO'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 3
        Size = 19
      end>
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
  end
  object qyLog_Manutencao_Chave: TADOQuery
    Connection = dmPrincipal.con
    Parameters = <
      item
        Name = 'CDLOG_MANUTENCAO'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 10
        Size = 19
      end
      item
        Name = 'SQREGISTRO'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 3
        Size = 19
      end>
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
  end
  object qyLog_Manutencao_Registro: TADOQuery
    Connection = dmPrincipal.con
    Parameters = <
      item
        Name = 'CDLOG_MANUTENCAO'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 10
        Size = 19
      end
      item
        Name = 'SQREGISTRO'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 3
        Size = 19
      end>
    SQL.Strings = (
      'SELECT SQREGISTRO,NOTABELA,TPMANUTENCAO'
      'FROM LOG_MANUTENCAO_REGISTRO'
      'WHERE CDLOG_MANUTENCAO = :CDLOG_MANUTENCAO'
      'AND SQREGISTRO = :SQREGISTRO'
      'ORDER BY NRORDEM,SQREGISTRO')
    Left = 266
    Top = 64
  end
  object qyAplica_Manutencao: TADOQuery
    Connection = dmPrincipal.con
    Parameters = <>
    Left = 266
    Top = 8
  end
  object qyPrograma: TADOQuery
    Parameters = <>
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
  object qyLista_Manutencao_Registro: TADOQuery
    Connection = dmPrincipal.con
    Parameters = <
      item
        Name = 'CDLOG_MANUTENCAO'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 10
        Size = 19
      end>
    SQL.Strings = (
      'SELECT SQREGISTRO,NOTABELA,TPMANUTENCAO'
      'FROM LOG_MANUTENCAO_REGISTRO'
      'WHERE CDLOG_MANUTENCAO = :CDLOG_MANUTENCAO')
    Left = 426
    Top = 48
  end
end
