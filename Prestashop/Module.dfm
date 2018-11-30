object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=sistemaOS'
      'User_Name=root'
      'Password=abc123!'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 56
    Top = 24
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 80
    Top = 88
  end
end
