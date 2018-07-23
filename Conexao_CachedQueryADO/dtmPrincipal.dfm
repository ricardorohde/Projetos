object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  Height = 391
  Width = 662
  object TcpClient: TTcpClient
    Left = 88
    Top = 24
  end
  object sprb0033: TStoredProc
    DatabaseName = 'dbMain'
    SessionName = 'Session'
    StoredProcName = 'dbo.sprb0033;1'
    Left = 96
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@PSTRING_ORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@PSTRING_ALTERADO'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = '@PTIPO'
        ParamType = ptInput
      end>
  end
  object dbExterno: TItDatabase
    DatabaseName = 'dbExterno'
    DriverName = 'STANDARD'
    KeepConnection = False
    LoginPrompt = False
    Params.Strings = (
      'PATH=C:\temp\exe\CONEXAO')
    ReadOnly = True
    SessionName = 'Session'
    TransIsolation = tiDirtyRead
    Left = 48
    Top = 168
  end
  object Session: TSession
    Active = True
    KeepConnections = False
    SessionName = 'Session'
    Left = 40
    Top = 240
  end
  object con: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=ASEOLEDB.1;Persist Security Info=False;User ID=sa;Passw' +
      'ord=tusrmvkc;Data Source="10.10.10.31;5003";Initial Catalog=hom_' +
      '65;'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'ASEOLEDB.1'
    Left = 32
    Top = 40
  end
  object qyTmp: TADOQuery
    Connection = con
    Parameters = <>
    Left = 144
    Top = 24
  end
  object Query1: TADOQuery
    Connection = con
    Parameters = <>
    SQL.Strings = (
      'SELECT NOESTADO FROM ESTADO'
      'WHERE CDSIGLA_ESTADO = '#39'AC'#39)
    Left = 160
    Top = 80
  end
  object qyTmp2: TADOQuery
    Connection = con
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM SEQUENCIA')
    Left = 224
    Top = 25
  end
  object qyParametro: TADOQuery
    Connection = con
    Parameters = <
      item
        Name = 'CDPARAMETRO'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = Null
      end>
    SQL.Strings = (
      'SELECT VLPARAMETRO'
      'FROM    PARAMETRO'
      'WHERE CDPARAMETRO = :CDPARAMETRO')
    Left = 216
    Top = 88
  end
  object qyTipo_Dominio: TADOQuery
    Connection = con
    Parameters = <
      item
        Name = 'CDTIPO_DOMINIO'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 3
        Size = 19
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM TIPO_DOMINIO'
      'WHERE CDTIPO_DOMINIO = :CDTIPO_DOMINIO')
    Left = 240
    Top = 160
  end
  object qyDominio: TADOQuery
    Connection = con
    Parameters = <
      item
        Name = 'CDTIPO_DOMINIO'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 3
        Size = 19
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM DOMINIO'
      'WHERE CDTIPO_DOMINIO = :CDTIPO_DOMINIO')
    Left = 144
    Top = 160
  end
end
