object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 150
  Width = 215
  object Conexao: TSQLConnection
    ConnectionName = 'Devart InterBase'
    DriverName = 'DevartInterBase'
    GetDriverFunc = 'getSQLDriverInterBase'
    LibraryName = 'dbexpida40.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=DevartInterBase'
      'DataBase=C:\Edson\BD\SQS2000.FDB'
      'RoleName='
      'User_Name=sysdba'
      'Password=masterkey'
      'SQLDialect=3'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'DevartInterBase TransIsolation=ReadCommitted'
      'WaitOnLocks=True'
      'Charset='
      'CharLength=0'
      'EnableBCD=True'
      'OptimizedNumerics=True'
      'LongStrings=True'
      'UseQuoteChar=False'
      'UseUnicode=True'
      'FetchAll=False'
      'DeferredBlobRead=False'
      'DeferredArrayRead=False'
      'TrimFixedChar=True'
      'TrimVarChar=False'
      'ForceUsingDefaultPort=False'
      'ForceUnloadClientLibrary=False')
    VendorLib = 'gds32.dll'
    Left = 64
    Top = 16
  end
end