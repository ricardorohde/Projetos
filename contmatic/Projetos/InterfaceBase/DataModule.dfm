object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 192
  Top = 107
  Height = 296
  Width = 361
  object ADConnection1: TADConnection
    Params.Strings = (
      'Database=folha'
      'User_Name=postgres'
      'Password=123456'
      'Server=localhost'
      'DriverID=PG')
    FetchOptions.AssignedValues = [evItems, evCache, evLiveWindowFastFirst]
    FetchOptions.Items = [fiBlobs, fiDetails]
    FetchOptions.Cache = [fiBlobs, fiDetails]
    FetchOptions.LiveWindowFastFirst = True
    UpdateOptions.AssignedValues = [uvLockPoint]
    LoginPrompt = False
    Left = 56
    Top = 40
  end
  object ADPhysPgDriverLink1: TADPhysPgDriverLink
    VendorLib = 'C:\Dll_postgres\libpq.dll'
    Left = 160
    Top = 48
  end
end
