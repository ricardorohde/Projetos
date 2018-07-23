object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  Left = 315
  Top = 103
  Height = 391
  Width = 662
  object Session: TSession
    Active = True
    KeepConnections = False
    SessionName = 'Session'
    Left = 32
    Top = 88
  end
  object dbMain: TItDatabase
    DatabaseName = 'dbMain'
    DriverName = 'SYBASE'
    LoginPrompt = False
    Params.Strings = (
      'DATABASE NAME=nivel_gasto2'
      'SERVER NAME=syb157'
      'USER NAME=sa'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'BLOB EDIT LOGGING='
      'LANGDRIVER='
      'SQLQRYMODE=SERVER'
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'DATE MODE=1'
      'SCHEMA CACHE TIME=-1'
      'MAX QUERY TIME=300'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=FALSE'
      'SCHEMA CACHE DIR='
      'HOST NAME='
      'APPLICATION NAME='
      'NATIONAL LANG NAME='
      'ENABLE BCD=FALSE'
      'TDS PACKET SIZE=512'
      'BLOBS TO CACHE=64'
      'BLOB SIZE=32'
      'CS CURSOR ROWS=1'
      'PASSWORD=tusrmvkc')
    ReadOnly = True
    SessionName = 'Session'
    BeforeConnect = dbMainBeforeConnect
    Left = 38
    Top = 26
  end
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
end
