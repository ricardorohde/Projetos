object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object Database: TIBDatabase
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
    Left = 28
    Top = 9
  end
  object Transacao: TIBTransaction
    DefaultDatabase = Database
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommitRetaining
    Left = 31
    Top = 69
  end
end
