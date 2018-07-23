object DMServer: TDMServer
  OldCreateOrder = False
  Height = 257
  Width = 502
  object conEMPLOYEE: TSQLConnection
    ConnectionName = 'conEMPLOYEE'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver170.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=17.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver170.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=17.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'User_Name=sysdba'
      'Password=masterkey'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet='
      'Trim Char=False'
      
        'Database=localhost:C:\Program Files\Firebird\Firebird_2_5\exampl' +
        'es\empbuild\EMPLOYEE.FDB')
    Left = 57
    Top = 65
  end
  object qryEMPLOYEE: TSQLDataSet
    CommandText = 'select * from EMPLOYEE where EMP_NO=:PEMP_NO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'PEMP_NO'
        ParamType = ptInput
      end>
    SQLConnection = conEMPLOYEE
    Left = 145
    Top = 105
    object qryEMPLOYEEEMP_NO: TSmallintField
      FieldName = 'EMP_NO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryEMPLOYEEFIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 15
    end
    object qryEMPLOYEELAST_NAME: TStringField
      FieldName = 'LAST_NAME'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryEMPLOYEEPHONE_EXT: TStringField
      FieldName = 'PHONE_EXT'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object qryEMPLOYEEHIRE_DATE: TSQLTimeStampField
      FieldName = 'HIRE_DATE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryEMPLOYEEDEPT_NO: TStringField
      FieldName = 'DEPT_NO'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 3
    end
    object qryEMPLOYEEJOB_CODE: TStringField
      FieldName = 'JOB_CODE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 5
    end
    object qryEMPLOYEEJOB_GRADE: TSmallintField
      FieldName = 'JOB_GRADE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryEMPLOYEEJOB_COUNTRY: TStringField
      FieldName = 'JOB_COUNTRY'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 15
    end
    object qryEMPLOYEESALARY: TFMTBCDField
      FieldName = 'SALARY'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object qryEMPLOYEEFULL_NAME: TStringField
      FieldName = 'FULL_NAME'
      ProviderFlags = [pfInUpdate]
      Size = 37
    end
  end
  object dspEMPLOYEE: TDataSetProvider
    DataSet = qryEMPLOYEE
    Left = 240
    Top = 104
  end
  object qryAUX: TSQLDataSet
    CommandText = 
      'select EMP_NO, FIRST_NAME, LAST_NAME from EMPLOYEE where FIRST_N' +
      'AME like :FNAME'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'FNAME'
        ParamType = ptInput
      end>
    SQLConnection = conEMPLOYEE
    Left = 145
    Top = 41
  end
  object dspAUX: TDataSetProvider
    DataSet = qryAUX
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 240
    Top = 40
  end
  object qryMediaSalario: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select AVG(SALARY) as MEDIA_SALARIO from EMPLOYEE')
    SQLConnection = conEMPLOYEE
    Left = 144
    Top = 168
    object qryMediaSalarioMEDIA_SALARIO: TFMTBCDField
      FieldName = 'MEDIA_SALARIO'
      Precision = 18
      Size = 2
    end
  end
  object LocalConnection: TLocalConnection
    Left = 352
    Top = 80
  end
end
