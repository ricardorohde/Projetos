object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object ADConnection1: TADConnection
    Params.Strings = (
      'Database=sistemaOS'
      'User_Name=root'
      'Password=abc123!'
      'DriverID=MySQL')
    LoginPrompt = False
    OnError = ADConnection1Error
    Left = 32
    Top = 8
  end
  object ADPhysMySQLDriverLink1: TADPhysMySQLDriverLink
    VendorLib = 'libmysql.dll'
    Left = 128
    Top = 8
  end
end
