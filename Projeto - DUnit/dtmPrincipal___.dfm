object dmPrincipal: TdmPrincipal
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 391
  Width = 662
  object Session: TSession
    Active = True
    KeepConnections = False
    SessionName = 'Session'
    Left = 32
    Top = 88
  end
  object TcpClient: TTcpClient
    Left = 200
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
  object database: TIBDatabase
    DatabaseName = '192.168.0.5/3052:/home/bdados/Banco_trabalho/SQS2000.FDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey'
      ''
      ''
      'lc_ctype=ISO8859_1')
    LoginPrompt = False
    DefaultTransaction = Transacao
    AllowStreamedConnected = False
    Left = 36
    Top = 17
  end
  object Transacao: TIBTransaction
    DefaultDatabase = database
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommitRetaining
    Left = 103
    Top = 13
  end
end
