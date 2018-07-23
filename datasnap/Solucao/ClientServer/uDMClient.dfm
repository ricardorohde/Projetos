object DMClient: TDMClient
  OldCreateOrder = False
  Height = 205
  Width = 347
  object cdsEMPLOYEE: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PEMP_NO'
        ParamType = ptInput
      end>
    ProviderName = 'dspEMPLOYEE'
    RemoteServer = prvEMPLOYEE
    Left = 240
    Top = 112
    object cdsEMPLOYEEEMP_NO: TSmallintField
      FieldName = 'EMP_NO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsEMPLOYEEFIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 15
    end
    object cdsEMPLOYEELAST_NAME: TStringField
      FieldName = 'LAST_NAME'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsEMPLOYEEPHONE_EXT: TStringField
      FieldName = 'PHONE_EXT'
      Size = 4
    end
    object cdsEMPLOYEEHIRE_DATE: TSQLTimeStampField
      FieldName = 'HIRE_DATE'
      Required = True
    end
    object cdsEMPLOYEEDEPT_NO: TStringField
      FieldName = 'DEPT_NO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsEMPLOYEEJOB_CODE: TStringField
      FieldName = 'JOB_CODE'
      Required = True
      Size = 5
    end
    object cdsEMPLOYEEJOB_GRADE: TSmallintField
      FieldName = 'JOB_GRADE'
      Required = True
    end
    object cdsEMPLOYEEJOB_COUNTRY: TStringField
      FieldName = 'JOB_COUNTRY'
      Required = True
      Size = 15
    end
    object cdsEMPLOYEESALARY: TFMTBCDField
      FieldName = 'SALARY'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsEMPLOYEEFULL_NAME: TStringField
      FieldName = 'FULL_NAME'
      Size = 37
    end
  end
  object cdsAUX: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select EMP_NO, FIRST_NAME, LAST_NAME from EMPLOYEE where FIRST_N' +
      'AME like :FNAME'
    Params = <
      item
        DataType = ftString
        Name = 'FNAME'
        ParamType = ptInput
      end>
    ProviderName = 'dspAUX'
    RemoteServer = prvEMPLOYEE
    Left = 240
    Top = 48
  end
  object conEMPLOYEE: TSQLConnection
    ConnectionName = 'DS_EMPLOYEE'
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=DataSnap'
      'DriverUnit=Data.DBXDataSnap'
      'HostName=127.0.0.1'
      'Port=211'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=17.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b')
    Left = 40
    Top = 64
  end
  object prvEMPLOYEE: TDSProviderConnection
    ServerClassName = 'TDMServer'
    SQLConnection = conEMPLOYEE
    Left = 144
    Top = 64
  end
end
