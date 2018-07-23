object Form1: TForm1
  Left = 192
  Top = 125
  Width = 979
  Height = 563
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 963
    Height = 483
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 483
    Width = 963
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 872
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object AlterdataConnection1: TAlterdataConnection
    ProviderName = 'SQL Server'
    Database = 'WPONTOSREP_TESTE'
    SpecificOptions.Strings = (
      'SQL Server.LockTimeout=-1'
      'PostgreSQL.CharSet=Latin1'
      'PostgreSQL.ApplicationName=delphi32.exe'
      'SQL Server.OLEDBProvider=prNativeClient')
    Macros = <
      item
        Name = 'TRUE'
        Value = 'True'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'FALSE'
        Value = 'False'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'ISNUMERIC'
        Value = 'ISNUMERIC'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'NEWID'
        Value = 'NewId()'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'LIMIT_MACRO'
        Value = 'LIMIT'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'TEMP'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'CREATE_TEMP'
        Value = 'TEMPORARY '
        Condition = 'PostgreSQL'
      end
      item
        Name = 'GLOBAL_TEMP'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'CREATE_GLOBAL_TEMP'
        Value = 'GLOBAL TEMPORARY '
        Condition = 'PostgreSQL'
      end
      item
        Name = 'REPLICATE'
        Value = 'REPEAT'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'Blob'
        Value = 'BYTEA'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'Graphic'
        Value = 'BYTEA'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'DateTime'
        Value = 'TIMESTAMP'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'BCD'
        Value = 'DECIMAL'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'Memo'
        Value = 'TEXT'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'LargeInt'
        Value = 'BIGINT'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'Boolean'
        Value = 'BOOLEAN'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'AutoInc'
        Value = 'SERIAL'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'LARGE_AUTOINC'
        Value = 'BIGSERIAL'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'DOUBLE'
        Value = 'REAL'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'Float'
        Value = 'REAL'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'Currency'
        Value = 'REAL'
        Condition = 'PostgreSQL'
      end
      item
        Name = 'QUOTE'
        Value = '"'
      end
      item
        Name = 'NOLOCK'
        Value = '(NOLOCK)'
        Condition = 'SQLServer'
      end
      item
        Name = 'TRUE'
        Value = 'CAST(1 AS Bit)'
        Condition = 'SQLServer'
      end
      item
        Name = 'FALSE'
        Value = 'CAST(0 AS Bit)'
        Condition = 'SQLServer'
      end
      item
        Name = 'ISNUMERIC'
        Value = 'ISNUMERIC'
        Condition = 'SQLServer'
      end
      item
        Name = 'NEWID'
        Value = 'NewId()'
        Condition = 'SQLServer'
      end
      item
        Name = 'TOP_MACRO'
        Value = 'TOP'
        Condition = 'SQLServer'
      end
      item
        Name = 'TEMP'
        Value = '#'
        Condition = 'SQLServer'
      end
      item
        Name = 'CREATE_TEMP'
        Value = '#'
        Condition = 'SQLServer'
      end
      item
        Name = 'GLOBAL_TEMP'
        Value = '##'
        Condition = 'SQLServer'
      end
      item
        Name = 'CREATE_GLOBAL_TEMP'
        Value = '##'
        Condition = 'SQLServer'
      end
      item
        Name = 'REPLICATE'
        Value = 'REPLICATE'
        Condition = 'SQLServer'
      end
      item
        Name = 'Blob'
        Value = 'VARBINARY(MAX)'
        Condition = 'SQLServer'
      end
      item
        Name = 'Graphic'
        Value = 'VARBINARY(MAX)'
        Condition = 'SQLServer'
      end
      item
        Name = 'Memo'
        Value = 'VARCHAR(MAX)'
        Condition = 'SQLServer'
      end
      item
        Name = 'Boolean'
        Value = 'BIT'
        Condition = 'SQLServer'
      end
      item
        Name = 'DateTime'
        Value = 'DATETIME'
        Condition = 'SQLServer'
      end
      item
        Name = 'BCD'
        Value = 'DECIMAL'
        Condition = 'SQLServer'
      end
      item
        Name = 'LargeInt'
        Value = 'BIGINT'
        Condition = 'SQLServer'
      end
      item
        Name = 'AutoInc'
        Value = 'INT IDENTITY'
        Condition = 'SQLServer'
      end
      item
        Name = 'LARGE_AUTOINC'
        Value = 'BIGINT IDENTITY'
        Condition = 'SQLServer'
      end>
    Username = 'SUPERVISOR'
    Password = 'abc123!'
    Server = 'lazaro2'
    Connected = True
    LoginPrompt = False
    Left = 128
    Top = 16
  end
  object QryFiltroMovimento: TSetupQuery
    Connection = AlterdataConnection1
    SQL.Strings = (
      'SELECT'
      
        #9#9'    M.cdEmpresa,M.idFuncionario,M.tpPessoa,M.DtMovimentacao,M.' +
        'stWDP,M.stNaoCalcular,'
      
        #9#9#9'FP.NmFuncionario,FP.cdChamada,FP.dtDemissao,FP.dtAdmissao,FP.' +
        'dtTransferencia,FP.idDepartamento,'
      ' '#9#9'FP.idFuncao,FP.idSindicatoGRCS,'
      
        #9#9#9'StatusMovimentacao1 ,StatusMovimentacao2 ,StatusMovimentacao3' +
        ','
      
        #9#9#9'StatusMovimentacao4 ,StatusMovimentacao5 ,StatusMovimentacao6' +
        ','
      
        ' '#9#9'StatusMovimentacao7 ,StatusMovimentacao8 ,StatusMovimentacao9' +
        ','
      #9#9#9'StatusMovimentacao10,'
      ' '#9#9'MotivoMovimentacao1,MotivoMovimentacao2,MotivoMovimentacao3,'
      #9#9#9'MotivoMovimentacao4,MotivoMovimentacao5,MotivoMovimentacao6,'
      #9#9#9'MotivoMovimentacao7,MotivoMovimentacao8,MotivoMovimentacao9,'
      ' '#9#9'MotivoMovimentacao10,'
      
        #9'CAST(SUBSTRING(HoraMovTotal, 1,  4) AS VARCHAR) AS HrMovimentac' +
        'ao1,CAST(SUBSTRING(HoraMovTotal, 5,  4) AS VARCHAR) AS HrMovimen' +
        'tacao2,CAST(SUBSTRING(HoraMovTotal, 9,  4) AS VARCHAR) AS HrMovi' +
        'mentacao3,'
      
        #9'CAST(SUBSTRING(HoraMovTotal, 13, 4) AS VARCHAR) AS HrMovimentac' +
        'ao4,CAST(SUBSTRING(HoraMovTotal, 17, 4) AS VARCHAR) AS HrMovimen' +
        'tacao5,CAST(SUBSTRING(HoraMovTotal, 21, 4) AS VARCHAR)  AS HrMov' +
        'imentacao6,'
      
        #9'CAST(SUBSTRING(HoraMovTotal, 25, 4) AS VARCHAR) AS HrMovimentac' +
        'ao7,CAST(SUBSTRING(HoraMovTotal, 29, 4) AS VARCHAR) AS HrMovimen' +
        'tacao8,CAST(SUBSTRING(HoraMovTotal, 33, 4) AS VARCHAR)  AS HrMov' +
        'imentacao9,'
      
        #9'CAST(SUBSTRING(HoraMovTotal, 37, 4) AS VARCHAR)  AS HrMovimenta' +
        'cao10,'
      
        #9'CAST(SUBSTRING(HoraTotal, 1,  4) AS VARCHAR) AS Hrlegal1,CAST(S' +
        'UBSTRING(HoraTotal, 5,  4) AS VARCHAR) AS Hrlegal2,CAST(SUBSTRIN' +
        'G(HoraTotal, 9,  4) AS VARCHAR)  AS Hrlegal3,'
      
        #9'CAST(SUBSTRING(HoraTotal, 13, 4) AS VARCHAR) AS Hrlegal4,CAST(S' +
        'UBSTRING(HoraTotal, 17, 4) AS VARCHAR) AS Hrlegal5,CAST(SUBSTRIN' +
        'G(HoraTotal, 21, 4) AS VARCHAR)  AS Hrlegal6,'
      
        #9'CAST(SUBSTRING(HoraTotal, 25, 4) AS VARCHAR) AS Hrlegal7,CAST(S' +
        'UBSTRING(HoraTotal, 29, 4) AS VARCHAR) AS Hrlegal8,CAST(SUBSTRIN' +
        'G(HoraTotal, 33, 4) AS VARCHAR)  AS Hrlegal9,'
      #9'CAST(SUBSTRING(HoraTotal, 37, 4) AS VARCHAR)  AS Hrlegal10'
      #9#9'FROM'
      
        ' '#9'(select cdEmpresa,idFuncionario,tpPessoa,DtMovimentacao,stWDP,' +
        'stNaoCalcular,'
      
        #9#9#9'      StatusMovimentacao1 ,StatusMovimentacao2 ,StatusMovimen' +
        'tacao3,'
      
        ' '#9#9'      StatusMovimentacao4 ,StatusMovimentacao5 ,StatusMovimen' +
        'tacao6,'
      
        #9#9#9'      StatusMovimentacao7 ,StatusMovimentacao8 ,StatusMovimen' +
        'tacao9,'
      ' '#9#9'      StatusMovimentacao10,'
      
        #9#9#9'      MotivoMovimentacao1,MotivoMovimentacao2,MotivoMovimenta' +
        'cao3,'
      
        #9#9#9'      MotivoMovimentacao4,MotivoMovimentacao5,MotivoMovimenta' +
        'cao6,'
      
        ' '#9#9'      MotivoMovimentacao7,MotivoMovimentacao8,MotivoMovimenta' +
        'cao9,'
      #9#9#9'      MotivoMovimentacao10,'
      '    /*HrLegal*/'
      '           '
      #9'          '
      
        #9'          (CASE WHEN StatusMovimentacao1  = '#39'D'#39' THEN '#39#39' ELSE CO' +
        'ALESCE(HrMovimentacao1,'#39#39')  END) || '
      
        #9'          (CASE WHEN StatusMovimentacao2  = '#39'D'#39' THEN '#39#39' ELSE CO' +
        'ALESCE(HrMovimentacao2,'#39#39')  END) || '
      
        #9'          (CASE WHEN StatusMovimentacao3  = '#39'D'#39' THEN '#39#39' ELSE CO' +
        'ALESCE(HrMovimentacao3,'#39#39')  END) || '
      
        #9'          (CASE WHEN StatusMovimentacao4  = '#39'D'#39' THEN '#39#39' ELSE CO' +
        'ALESCE(HrMovimentacao4,'#39#39')  END) || '
      
        #9'          (CASE WHEN StatusMovimentacao5  = '#39'D'#39' THEN '#39#39' ELSE CO' +
        'ALESCE(HrMovimentacao5,'#39#39')  END) || '
      
        #9'          (CASE WHEN StatusMovimentacao6  = '#39'D'#39' THEN '#39#39' ELSE CO' +
        'ALESCE(HrMovimentacao6,'#39#39')  END) || '
      
        #9'          (CASE WHEN StatusMovimentacao7  = '#39'D'#39' THEN '#39#39' ELSE CO' +
        'ALESCE(HrMovimentacao7,'#39#39')  END) || '
      
        #9'          (CASE WHEN StatusMovimentacao8  = '#39'D'#39' THEN '#39#39' ELSE CO' +
        'ALESCE(HrMovimentacao8,'#39#39')  END) || '
      
        #9'          (CASE WHEN StatusMovimentacao9  = '#39'D'#39' THEN '#39#39' ELSE CO' +
        'ALESCE(HrMovimentacao9,'#39#39')  END) || '
      
        #9'          (CASE WHEN StatusMovimentacao10 = '#39'D'#39' THEN '#39#39' ELSE CO' +
        'ALESCE(HrMovimentacao10,'#39#39') END) AS HoraTotal,'
      #9#9'/*HrMovimentacao*/'
      ' '#9'        '
      #9#9'        '
      
        #9#9'        COALESCE(HrMovimentacao1,'#39#39') || COALESCE(HrMovimentaca' +
        'o2,'#39#39') || COALESCE(HrMovimentacao3,'#39#39') || '
      
        ' '#9'        COALESCE(HrMovimentacao4,'#39#39') || COALESCE(HrMovimentaca' +
        'o5,'#39#39') || COALESCE(HrMovimentacao6,'#39#39') || '
      
        #9#9'        COALESCE(HrMovimentacao7,'#39#39') || COALESCE(HrMovimentaca' +
        'o8,'#39#39') || COALESCE(HrMovimentacao9,'#39#39') || '
      ' '#9'        COALESCE(HrMovimentacao10,'#39#39') AS HoraMovTotal'
      #9#9'FROM WPONTO.Movimen)M'
      
        'INNER JOIN (SELECT F.NmFuncionario, F.cdChamada, F.dtDemissao, F' +
        '.dtAdmissao,F.dtTransferencia,F.idDepartamento,F.idFuncao,F.idSi' +
        'ndicatoGRCS,'#39'F'#39' AS tipoPessoa,F.idFuncionario'
      #9'        FROM WPONTO.F00001 F'
      #9'        UNION'
      
        #9'        SELECT P.nmPessoa AS nmFuncionario,P.cdChamada,P.dtTerm' +
        'ino AS dtDemissao,P.dtCadastro AS dtAdmissao, DATE '#39'1899-12-31'#39' ' +
        'AS dtTransferencia,'
      
        #9'                        P.idDepartamento,P.idFuncao,P.idSindica' +
        'to AS IdSindicatoGRCS,P.tpPessoa AS tipoPessoa,P.idPessoa AS idF' +
        'uncionario'
      
        #9'        FROM WPONTO.Pessoa P) FP ON M.idFuncionario = FP.idFunc' +
        'ionario AND M.tpPessoa = FP.tipoPessoa'
      #9'        WHERE (M.cdEmpresa = 1)'
      
        #9'              AND (M.DtMovimentacao between '#39'2011-11-01'#39' and '#39'2' +
        '011-11-30'#39')'
      ' AND (M.idFuncionario IN ('#39'0010000001'#39')) AND (M.tpPessoa = '#39'F'#39')'
      'ORDER BY NmFuncionario')
    DMLRefresh = True
    SpecificOptions.Strings = (
      'PostgreSQL.UnknownAsString=True'
      'PostgreSQL.UseParamTypes=True')
    Left = 96
    Top = 16
  end
  object UniSQLMonitor1: TUniSQLMonitor
    Left = 168
    Top = 16
  end
  object DataSource1: TDataSource
    Left = 216
    Top = 168
  end
end
