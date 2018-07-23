object DM_Conexao: TDM_Conexao
  OldCreateOrder = False
  Left = 364
  Top = 200
  Height = 150
  Width = 215
  object con: TADConnection
    Params.Strings = (
      'Database=postgres'
      'User_Name=postgres'
      'Password=123'
      'Server=localhost'
      'DriverID=PG')
    FetchOptions.AssignedValues = [evItems, evCache, evLiveWindowFastFirst]
    FetchOptions.Items = [fiBlobs, fiDetails]
    FetchOptions.Cache = [fiBlobs, fiDetails]
    FetchOptions.LiveWindowFastFirst = True
    UpdateOptions.AssignedValues = [uvLockPoint]
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 8
  end
  object ADPhysPgDriverLink1: TADPhysPgDriverLink
    VendorLib = 'C:\Dll_postgres\libpq.dll'
    Left = 40
    Top = 72
  end
end
