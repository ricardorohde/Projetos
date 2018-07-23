object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 487
  ClientWidth = 713
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ListBox1: TListBox
    Left = 0
    Top = 304
    Width = 713
    Height = 183
    Align = alBottom
    ItemHeight = 13
    TabOrder = 0
  end
  object IBQuery1: TIBQuery
    Left = 96
    Top = 16
  end
  object IBSQLMonitor1: TIBSQLMonitor
    OnSQL = IBSQLMonitor1SQL
    TraceFlags = [tfQPrepare, tfQExecute, tfQFetch, tfError, tfStmt, tfConnect, tfTransact, tfBlob]
    Left = 104
    Top = 96
  end
  object Transacao: TIBTransaction
    DefaultDatabase = sqs2000
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommitRetaining
    Left = 23
    Top = 109
  end
  object sqs2000: TIBDatabase
    Connected = True
    DatabaseName = '192.168.0.5:/home/bdados/Centrimoveis/26092017/SQSNOVO.FDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey'
      ''
      ''
      'lc_ctype=ISO8859_1')
    LoginPrompt = False
    DefaultTransaction = Transacao
    TraceFlags = [tfQPrepare, tfQExecute, tfQFetch, tfError, tfStmt, tfConnect, tfTransact, tfBlob, tfService, tfMisc]
    AllowStreamedConnected = False
    Left = 28
    Top = 9
  end
  object FIBSQLMonitor1: TFIBSQLMonitor
    OnSQL = FIBSQLMonitor1SQL
    TraceFlags = [tfQPrepare, tfQExecute, tfQFetch, tfConnect, tfTransact]
    Left = 160
    Top = 64
  end
end
