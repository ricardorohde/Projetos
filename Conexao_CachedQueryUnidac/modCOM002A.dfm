object dmCOM002A: TdmCOM002A
  OldCreateOrder = False
  Height = 480
  Width = 696
  object qyPrograma_Operador: TUniQuery
    Connection = dmPrincipal.con
    SQL.Strings = (
      'SELECT PO.CDPROGRAMA,'
      '       PO.SNINCLUIR,'
      '       PO.SNALTERAR,'
      '       PO.SNEXCLUIR,'
      '       PO.SNCONSULTAR'
      'FROM   PROGRAMA_OPERADOR PO'
      'WHERE  PO.CDOPERADOR = :CDOPERADOR')
    Left = 46
    Top = 182
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CDOPERADOR'
      end>
  end
  object ImIcones: TImageList
    Left = 116
    Top = 16
    Bitmap = {
      494C010102001800180010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F3F8FB00D1E5F100C7DFEE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E5DBCF009E7F7700A3867C00A3867D00AB907F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CCDCEC000466AA0000539D0000549C0000569E00004C9A005496C4000000
      000000000000000000000000000000000000000000000000000000000000EEE9
      E200754726003B000000440600006C2C0000591800003F03000045080000AA8E
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004694
      C40000519B001A92C90027CDF2002CE6FF002ADEFF0023B4E0000C6BAC000053
      9E00EBF3F9000000000000000000000000000000000000000000EEEAE2004609
      00004C0D0000C9A48100000000000000000000000000FBE7D200885220003E02
      0000855D38000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A1C6DF000054
      9D0028CEF6002BE5FF0029D9FF0029D7FF0029D7FF0029DCFF002CECFF001884
      BD000065A9000000000000000000000000000000000000000000754626004C0D
      000000000000000000000000000000000000000000000000000000000000A87B
      53003B000000E9E1D70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000059A20020A4
      D4002AE2FF0028D6FF0029D7FF0029D7FF0029D7FF0029D6FF0029D7FF002CE8
      FF00025DA2007DB2D400000000000000000000000000E5DBCF003B000000C9A4
      8100000000000000000000000000000000000000000000000000000000000000
      0000591700007546260000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BCD9EA0000559D002CE3
      FF0029D7FF0029D7FF0029D7FF0029D7FF0029D7FF0029D7FF0029D6FF002ADF
      FF001A9CD000227AB4000000000000000000000000009F7F7800440600000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B08F74003600000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000076ABCF000C76B4002CE8
      FF0028D6FF0029D7FF0029D7FF0029D7FF0029D7FF0029D7FF0029D7FF0029DA
      FF0026C2EA00004D9A00000000000000000000000000A3867D006C2C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DCBF9F003400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000076ABCF000C76B4002CE8
      FF0028D6FF0029D7FF0029D7FF0029D7FF0029D7FF0029D7FF0029D7FF0029DA
      FF0026C2EA00004D9A00000000000000000000000000A4867D00591800000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C8AE91003700000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BCD9EA0000559D002CE3
      FF0029D7FF0029D7FF0029D7FF0029D7FF0029D7FF0029D7FF0029D6FF002ADF
      FF001A9CD000227AB400000000000000000000000000AC9080003F030000FBE7
      D200000000000000000000000000000000000000000000000000000000000000
      00008C5527004406000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000059A20020A4
      D4002AE2FF0028D6FF0029D7FF0029D7FF0029D7FF0029D6FF0029D7FF002CE8
      FF00025DA2007DB2D40000000000000000000000000000000000450800008851
      1F0000000000000000000000000000000000000000000000000000000000FCEA
      D5003E020000AD91800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A1C6DF000054
      9D0028CEF6002BE5FF0029D9FF0029D7FF0029D7FF0029DCFF002CECFF001884
      BD000065A9000000000000000000000000000000000000000000AA8E7C003E02
      0000A87B53000000000000000000000000000000000000000000FDEBD5005B22
      00003F0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004694
      C40000519B001A92C90027CDF2002CE6FF002ADEFF0023B4E0000C6BAC000053
      9E00EBF3F900000000000000000000000000000000000000000000000000855D
      38003B00000058180000B18E7300DBBF9F00C8AD91008C5527003E0300003F00
      0000F3F0E9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CCDCEC000466AA0000539D0000549C0000569E00004C9A005496C4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E9E1D7007547260035000000340000003600000043060000AC917F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F3F8FB00D1E5F100C7DFEE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FC7FF83F00000000
      F01FE00F00000000E007C38700000000C007CFE300000000C0038FF300000000
      80039FF30000000080039FF30000000080039FF30000000080038FF300000000
      C003CFE300000000C007C7C700000000E007E00700000000F01FF01F00000000
      FC7FFFFF00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object qyTmp: TUniQuery
    Connection = dmPrincipal.con
    Left = 130
    Top = 180
  end
  object dsIcone: TDataSource
    DataSet = tbIcone
    Left = 52
    Top = 342
  end
  object qyPrograma_Grupo: TUniQuery
    Connection = dmPrincipal.con
    SQL.Strings = (
      'SELECT PG.CDPROGRAMA,'
      '       PG.SNINCLUIR,'
      '       PG.SNALTERAR,'
      '       PG.SNEXCLUIR,'
      '       PG.SNCONSULTAR'
      'FROM   PROGRAMA_GRUPO PG'
      'WHERE  PG.CDGRUPO = :CDGRUPO'
      'AND    PG.CDPROGRAMA NOT IN ( SELECT PO.CDPROGRAMA'
      '                              FROM   PROGRAMA_OPERADOR PO'
      
        '                              WHERE  PO.CDOPERADOR = :CDOPERADOR' +
        ' )'
      ''
      ''
      '')
    Left = 46
    Top = 238
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CDGRUPO'
      end
      item
        DataType = ftUnknown
        Name = 'CDOPERADOR'
      end>
  end
  object qyAtalho: TUniQuery
    Connection = dmPrincipal.con
    Left = 290
    Top = 128
  end
  object imIcones24: TImageList
    Height = 24
    Width = 24
    Left = 176
    Top = 14
  end
  object imIcones16: TImageList
    Left = 52
    Top = 16
  end
  object dsPrograma: TDataSource
    AutoEdit = False
    Left = 132
    Top = 126
  end
  object tbIcone: TTable
    DatabaseName = 'dbExterno'
    SessionName = 'Session'
    ReadOnly = True
    TableName = 'icone'
    Left = 42
    Top = 294
    object tbIconeCDPROGRAMA: TStringField
      FieldName = 'CDPROGRAMA'
      Size = 30
    end
    object tbIconeFGICONE: TBlobField
      FieldName = 'FGICONE'
      BlobType = ftGraphic
      Size = 1
    end
  end
  object qyCampos: TQuery
    DatabaseName = 'dbExterno'
    SessionName = 'Session'
    SQL.Strings = (
      'SELECT '
      '       NOTABELA,'
      '       NOCAMPO,'
      '       DSCAMPO,'
      '       CDTIPO_DADO,'
      '       NRTAMANHO,'
      '       NRDECIMAIS,'
      '       SNOBRIGATORIO,'
      '       SNCHAVE_PRIMARIA,'
      '       NOSEQUENCIA,'
      '       CDTIPO_DOMINIO,'
      '       TXVALOR_PADRAO,'
      '       VLMINIMO,'
      '       VLMAXIMO'
      'FROM   CAMPO_TABELA.DBF'
      'WHERE  NOTABELA = :NOTABELA'
      'OR     NOTABELA = :NOTABELA_AUXILIAR'
      'ORDER BY NOTABELA '
      ''
      ''
      ' ')
    Left = 268
    Top = 250
    ParamData = <
      item
        DataType = ftString
        Name = 'NOTABELA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NOTABELA_AUXILIAR'
        ParamType = ptUnknown
      end>
  end
  object qyCampo: TQuery
    DatabaseName = 'dbExterno'
    SessionName = 'Session'
    SQL.Strings = (
      'SELECT CDTIPO_DADO'
      'FROM   CAMPO_TABELA.DBF'
      'WHERE  NOTABELA = :NOTABELA'
      'AND    NOCAMPO  = :NOCAMPO'
      ' '
      ''
      ''
      ' ')
    Left = 396
    Top = 290
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NOTABELA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOCAMPO'
        ParamType = ptUnknown
      end>
  end
  object qyModulo: TQuery
    DatabaseName = 'dbExterno'
    SessionName = 'Session'
    SQL.Strings = (
      'SELECT CDMODULO,NOMODULO'
      'FROM MODULO.DBF'
      'ORDER BY NOMODULO')
    Left = 344
    Top = 132
  end
  object qyPrograma: TQuery
    DatabaseName = 'dbExterno'
    SessionName = 'Session'
    SQL.Strings = (
      'SELECT'
      '   CDPROGRAMA,'
      '   NOPROGRAMA,'
      '   NOABREVIADO,'
      '   NOTABELA,'
      '   NOTABELA_AUXILIAR,'
      '   SNPROGRAMA_SISTEMA,'
      '   CDSITUACAO,'
      '   SNGERAL,'
      '   SNFILTRO_OBRIGATORIO,'
      '   SNPROGRAMA_LOGICO,'
      '   CDPROGRAMA_FISICO,'
      '   TXPARAMETRO,'
      '   CDMODULO,'
      '   FGICONE,'
      '   SNGRAVA_LOG_MANUTENCAO,'
      '   SNCONFIRMACAO_INCLUSAO,'
      '   SNCONFIRMACAO_EXCLUSAO,'
      '   SNCONFIRMACAO_ALTERACAO,'
      '   SNTELA_SEMPRE_ONLINE'
      'FROM PROGRAMA.DBF'
      ''
      '')
    Left = 48
    Top = 126
  end
end
