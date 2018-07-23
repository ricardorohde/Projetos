object Form1: TForm1
  Left = 198
  Top = 209
  Width = 928
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 2
    Top = 6
    Width = 750
    Height = 166
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 3
    Top = 190
    Width = 746
    Height = 145
    DataSource = DataSource2
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object ADOQuery1: TADOQuery
    Connection = Data_Principal.ado_conexao
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'SELECT    MLC.NOLOGIN_WEB'
      '        , CONVERT(INTEGER, MLC.CDCONTATO) CDCONTATO'
      
        '        , MLC.NOCONTATO                                         ' +
        '               '
      
        '        , MLC.NOCONTATO AS NOCONTATOX                           ' +
        '               '
      
        '        , MLC.TXEMAIL                                           ' +
        '               '
      
        '        , MLC.NRDDD1                                            ' +
        '               '
      
        '        , MLC.NRTELEFONE1                                       ' +
        '               '
      
        '        , MLC.NRDDD2                                            ' +
        '               '
      
        '        , MLC.NRTELEFONE2                                       ' +
        '               '
      
        '        , MLC.DTINCLUSAO                                        ' +
        '               '
      
        '        , MLC.DTALTERACAO                                       ' +
        '               '
      
        '        , MLC.TXOBSERVACAO                                      ' +
        '               '
      
        '        , MLC.NOLOGIN_WEB                                       ' +
        '               '
      
        '        , MLC.CDSTATUS_CONTATO                                  ' +
        '               '
      
        '        , MLC.NOCIDADE                                          ' +
        '               '
      
        '        , MLC.CDSTATUS_ATENDIMENTO                              ' +
        '               '
      
        '        , MLC.CDSTATUS_VENDA                                    ' +
        '               '
      
        '        , MLC.CDSERVICO                                         ' +
        '               '
      
        '        , MLC.NRCONTRATO                                        ' +
        '               '
      
        '        , MLC.DTINSTALACAO                                      ' +
        '               '
      
        '        , MLC.CDREJEICAO                                        ' +
        '               '
      
        '        , MLC.CDFOLLOWUP                                        ' +
        '               '
      
        '        , MLC.CDPROSPECT                                        ' +
        '               '
      
        '        , MLC.CDOPERADOR                                        ' +
        '               '
      
        '        , COALESCE(MLC.SNLOCK, '#39'N'#39') SNLOCK                      ' +
        '             '
      
        '        , MLC.CDOPERADOR_LOCK                                   ' +
        '               '
      
        '        , MLC.SNINSTALADO                                       ' +
        '               '
      
        '        , MLC.CDMOTIVO_CANCELAMENTO                             ' +
        '               '
      
        '        , MLC.SNGEROU_PONTUACAO                                 ' +
        '               '
      
        '        , MLC.CDPROSPECT_INCLUSAO                               ' +
        '               '
      
        '        , MLC.CDOPERADOR_INCLUSAO                               ' +
        '               '
      
        '        , LC.NOPESSOA AS NOPESSOAX                              ' +
        '               '
      
        '        , LC.NRDOCUMENTO AS NRDOCUMENTOX                        ' +
        '               '
      
        '        , LC.CODSUPERVISOR AS CODSUPERVISORX                    ' +
        '               '
      
        '        , LC.NOME_SUPERVISOR                                    ' +
        '               '
      
        '        , LC.CODPRGX                                            ' +
        '               '
      
        '        , MP.DESCRICAO                                          ' +
        '               '
      
        '        , LCC.CNPJ AS CNPJX                                     ' +
        '               '
      
        '        , LCC.NOEMPRESA AS NOEMPRESAX                           ' +
        '               '
      
        '        , LCC.QTDE_CARTOES_VALE_VIAGEM                          ' +
        '               '
      
        '        , LCC.VL_VENDA                                          ' +
        '               '
      
        '        , A.NOME_DOMINIO                                        ' +
        '               '
      
        '     FROM MGM_LOGIN_CONTATO MLC                                 ' +
        '               '
      
        'LEFT JOIN LOGIN L ON (L.NOLOGIN_WEB = MLC.NOLOGIN_WEB)          ' +
        '               '
      
        'LEFT JOIN MGM_PROGRAMA MP ON (MP.CODPRGX = L.CODPRGX)           ' +
        '               '
      
        'LEFT JOIN LOGIN_CADASTRO LC ON (LC.CODPRGX = L.CODPRGX AND      ' +
        '               '
      
        '                                LC.CDCLIENTE_ADESAO =  L.CDCLIEN' +
        'TE_ADESAO)     '
      
        'LEFT JOIN MGM_LOGIN_CONTATO_COMPLEMENTAR LCC ON (MLC.CDCONTATO =' +
        ' LCC.CDCONTATO)'
      
        'LEFT JOIN ( SELECT TD.CDTIPO_DOMINIO TIPO_DOMINIO               ' +
        '               '
      
        '        , TD.NOTIPO_DOMINIO NOME_TIPO_DOMINIO                   ' +
        '               '
      
        '        , D.CDDOMINIO DOMINIO                                   ' +
        '               '
      
        '        , D.NODOMINIO NOME_DOMINIO                              ' +
        '               '
      
        '     FROM DOMINIO D                                             ' +
        '               '
      
        'LEFT JOIN TIPO_DOMINIO TD ON (D.CDTIPO_DOMINIO = TD.CDTIPO_DOMIN' +
        'IO)            '
      
        '    WHERE TD.CDTIPO_DOMINIO = 300) A ON ( A.DOMINIO = MLC.CDSTAT' +
        'US_ATENDIMENTO )'
      'WHERE CDSTATUS_ATENDIMENTO IS NOT NULL'
      'ORDER BY CDSTATUS_ATENDIMENTO')
    Left = 798
    Top = 65
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 860
    Top = 66
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 872
    Top = 134
  end
  object ADOQuery2: TADOQuery
    Connection = Data_Principal.ado_conexao
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'CDCONTATO'
        DataType = ftLargeint
        NumericScale = 10
        Value = Null
      end>
    SQL.Strings = (
      'SELECT LHI.NOLOGIN_WEB'
      '  , LHI.NOLOGIN_WEB AS NOLOGIN_WEBX'
      #9' , LHI.DTTENTATIVA'
      #9' , CAST(LHI.CDCONTATO AS INTEGER) CDCONTATO'
      #9' , LHI.NRDDD'
      #9' , LHI.NRTELEFONE'
      
        '  , (CASE WHEN COALESCE(LHI.NRDDD, '#39#39') <> '#39#39' THEN '#39'('#39' || LHI.NRD' +
        'DD || '#39')'#39' ELSE '#39#39' END || LHI.NRTELEFONE) TELEFONE'
      #9' , LHI.NOCONTATO AS NOCONTATOX'
      #9' , LHI.TXEMAIL'
      #9' , LHI.TPHISTORICO'
      #9' , LHI.OBSERVACAO'
      
        #9' ,  CASE WHEN TPHISTORICO = '#39'R'#39' THEN '#39'Indica'#231#227'o V'#225'lida (Realiza' +
        'da)'#39
      
        #9'         WHEN TPHISTORICO = '#39'N'#39' THEN '#39'Indica'#231#227'o V'#225'lida (N'#227'o Rea' +
        'lizada)'#39
      
        #9'         WHEN TPHISTORICO = '#39'E'#39' THEN '#39'Indica'#231#227'o V'#225'lida (Em Nego' +
        'cia'#231#227'o)'#39
      #9'         WHEN TPHISTORICO = '#39'I'#39' THEN '#39'Indica'#231#227'o Inv?da'#39
      #9'         WHEN TPHISTORICO = '#39'F'#39' THEN '#39'Follow-UP'#39' END HISTORICO'
      #9' , LC.NOPESSOA AS NOPESSOAX'
      #9' , LC.NRDOCUMENTO AS NRDOCUMENTOX'
      #9' , LCC.CNPJ AS CNPJX'
      #9' , LCC.NOEMPRESA AS NOEMPRESAX'
      'FROM MGM_LOGIN_HISTORICO_INDICACAO LHI'
      'LEFT JOIN LOGIN L ON (L.NOLOGIN_WEB = LHI.NOLOGIN_WEB)'
      'LEFT JOIN LOGIN_CADASTRO LC ON (LC.CODPRGX = L.CODPRGX AND'
      
        '                                LC.CDCLIENTE_ADESAO =  L.CDCLIEN' +
        'TE_ADESAO)'
      
        'LEFT JOIN MGM_LOGIN_CONTATO_COMPLEMENTAR LCC ON (LCC.CDCONTATO =' +
        ' LHI.CDCONTATO)'
      'WHERE LHI.CDCONTATO = :CDCONTATO'
      'ORDER BY LHI.DTTENTATIVA DESC')
    Left = 802
    Top = 118
  end
end
