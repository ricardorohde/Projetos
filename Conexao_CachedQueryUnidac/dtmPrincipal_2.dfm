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
  object Query1: TQuery
    DatabaseName = 'dbMain'
    SessionName = 'Session'
    SQL.Strings = (
      'SELECT NOESTADO FROM ESTADO'
      'WHERE CDSIGLA_ESTADO = '#39'AC'#39
      ' ')
    Left = 152
    Top = 88
  end
  object qyTmp: TQuery
    DatabaseName = 'dbMain'
    SessionName = 'Session'
    Left = 168
    Top = 38
  end
  object qyTmp2: TQuery
    DatabaseName = 'dbMain'
    SessionName = 'Session'
    SQL.Strings = (
      'SELECT * FROM SEQUENCIA')
    Left = 244
    Top = 24
  end
  object qyParametro: TQuery
    DatabaseName = 'dbMain'
    SessionName = 'Session'
    SQL.Strings = (
      'SELECT VLPARAMETRO'
      'FROM    PARAMETRO'
      'WHERE CDPARAMETRO = :CDPARAMETRO')
    Left = 230
    Top = 86
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CDPARAMETRO'
        ParamType = ptUnknown
      end>
  end
  object dbExterno: TItDatabase
    DatabaseName = 'dbExterno'
    DriverName = 'STANDARD'
    KeepConnection = False
    LoginPrompt = False
    Params.Strings = (
      'PATH=D:\Edson\D\Projetos\Conexao\Debug\Win32\CONEXAO')
    ReadOnly = True
    TransIsolation = tiDirtyRead
    Left = 48
    Top = 168
  end
  object con: TUniConnection
    ProviderName = 'ASE'
    Port = 5003
    Database = 'hom_63'
    Username = 'sa'
    Password = 'tusrmvkc'
    Server = '10.10.10.31'
    Connected = True
    Left = 40
    Top = 32
  end
  object ASEUniProvider1: TASEUniProvider
    Left = 40
    Top = 96
  end
end
