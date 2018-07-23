object SERVERDATASNAP: TSERVERDATASNAP
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  Left = 380
  Top = 239
  Height = 200
  Width = 316
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
    Left = 168
    Top = 40
  end
  object ADQuery1: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'SELECT * '
      'FROM func')
    Left = 48
    Top = 112
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = ADQuery1
    Left = 136
    Top = 112
  end
end
