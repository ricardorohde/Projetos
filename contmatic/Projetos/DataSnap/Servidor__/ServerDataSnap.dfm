object SERVER: TSERVER
  OldCreateOrder = False
  Left = 192
  Top = 106
  Height = 268
  Width = 432
  object ADQuery1: TADQuery
    Left = 184
    Top = 32
  end
  object ADConnection1: TADConnection
    Params.Strings = (
      'Database=ruberlei_20150212'
      'User_Name=postgres'
      'Password=phoenix'
      'Server=winsrv200832'
      'DriverID=PG'
      'Porta=5432'
      'Client DLL name = C:\Dll_postgres\libpq.dll')
    LoginPrompt = False
    Left = 64
    Top = 40
  end
end
