object dmMain: TdmMain
  OldCreateOrder = False
  Height = 237
  Width = 346
  object ConexaoOrigem: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'Database=C:\TechTRS\Sistema Impacto\Data\evolucao.fdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False'
      'LibraryName=dbxfb.dll'
      'VendorLib=gds32.dll'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'GetDriverRFunc=getSQLDriverINTERBASE')
    Left = 64
    Top = 16
  end
  object ConexaoDestino: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'Database=C:\TechTRS\Sistema Impacto\Data\evolucao.fdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False'
      'LibraryName=dbxfb.dll'
      'VendorLib=gds32.dll'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'GetDriverRFunc=getSQLDriverINTERBASE')
    Left = 64
    Top = 80
  end
end
