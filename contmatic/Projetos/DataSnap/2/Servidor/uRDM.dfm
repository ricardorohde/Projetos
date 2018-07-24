object RDM: TRDM
  OldCreateOrder = False
  Left = 327
  Top = 335
  Height = 309
  Width = 266
  object DataSetProvider1: TDataSetProvider
    DataSet = ADQuery1
    Left = 144
    Top = 72
  end
  object ADConnection1: TADConnection
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
  object ADQuery1: TADQuery
    Active = True
    Connection = ADConnection1
    SQL.Strings = (
      'SELECT "ID_HORARIO"'
      #9#9',"CODIGO_EXTERNO"'
      #9#9',"DESCRICAO"'
      #9#9',"POSSUI_ESCALA"'
      #9'FROM "public"."HORARIO"'
      'WHERE ("ID_HORARIO" = :ID) OR (:ID IS NULL)')
    Left = 152
    Top = 16
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ADDataType = dtInt32
        ParamType = ptInput
      end>
    object ADQuery1ID_HORARIO: TIntegerField
      FieldName = 'ID_HORARIO'
      Origin = '"ID_HORARIO"'
    end
    object ADQuery1CODIGO_EXTERNO: TIntegerField
      FieldName = 'CODIGO_EXTERNO'
      Origin = '"CODIGO_EXTERNO"'
    end
    object ADQuery1DESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Origin = '"DESCRICAO"'
      Size = 50
    end
    object ADQuery1POSSUI_ESCALA: TBooleanField
      FieldName = 'POSSUI_ESCALA'
      Origin = '"POSSUI_ESCALA"'
    end
  end
end
