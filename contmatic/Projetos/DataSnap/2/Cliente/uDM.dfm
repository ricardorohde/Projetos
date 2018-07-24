object DM: TDM
  OldCreateOrder = False
  Left = 270
  Top = 291
  Height = 150
  Width = 215
  object DCOMConnection1: TDCOMConnection
    Connected = True
    ServerGUID = '{12A4624F-C93A-4317-865A-F1FE4F6A5DE6}'
    ServerName = 'AppServerDCOM.RDM'
    Left = 40
    Top = 8
  end
  object ClientDataSet1: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    ProviderName = 'DataSetProvider1'
    RemoteServer = DCOMConnection1
    Left = 128
    Top = 24
  end
end
