inherited frmConciliacao_Automatica: TfrmConciliacao_Automatica
  Caption = 'Concilia'#231#227'o Banc'#225'ria - Autom'#225'tica '
  ExplicitWidth = 602
  ExplicitHeight = 618
  PixelsPerInch = 96
  TextHeight = 13
  inherited scrPerguntas: TScrollBox
    object Label1: TLabel
      Left = 4
      Top = 50
      Width = 133
      Height = 13
      Caption = 'Banco/Ag'#234'ncia/Conta At'#233'?'
    end
    object SpeedButton1: TSpeedButton
      Left = 189
      Top = 68
      Width = 23
      Height = 22
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FF314B62
        AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF5084B20F6FE1325F8CB87E7AFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
        106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF38A5FE329DFF156DCE444F5BFF
        00FF9C6B65AF887BAF887EAA8075FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF3BABFFA1CAE7AD8679A98373E0CFB1FFFFDAFFFFDDFCF8CFCCB2
        9FA1746BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0917DFC
        E9ACFFFFCCFFFFCFFFFFD0FFFFDEFFFFFAE3D3D1996965FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFB08978FAD192FEF4C2FFFFD0FFFFDAFFFFF6FFFF
        FCFFFFFCB69384FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB08978FEDA97ED
        B478FBEEBBFFFFD3FFFFDCFFFFF4FFFFF4FFFFE2E9DDBCA67B73FF00FFFF00FF
        FF00FFFF00FFFF00FFB18A78FFDE99E9A167F4D199FEFCCCFFFFD5FFFFDAFFFF
        DCFFFFD7EFE6C5A97E75FF00FFFF00FFFF00FFFF00FFFF00FFAA7F73FAE0A4F0
        B778EEBA7BF6DDA6FEFBCCFFFFD3FFFFD1FFFFD7D9C5A7A3756CFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFCEB293FFFEDDF4D1A5EEBA7BF2C78FF8E1ABFCF0
        BAFCFACAA3776FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1746BE1
        D4D3FFFEEEF7CC8CF0B473F7C788FCE3A5C2A088A5776CFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF986865BA9587EAD7A4EAD59EE0C097A577
        6CA5776CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFA77E70A98073A4786EFF00FFFF00FFFF00FFFF00FF}
      OnClick = SpeedButton1Click
    end
    object Label2: TLabel
      Left = 4
      Top = 4
      Width = 174
      Height = 13
      Caption = 'Arquivo de Origem - Extrato Banc'#225'rio'
    end
    object dbedtBanco: TDBEdit
      Left = 4
      Top = 69
      Width = 41
      Height = 21
      Hint = '|Informe ou selecione o Banco.'
      DataField = 'BANCO'
      DataSource = dtsPerguntas
      TabOrder = 1
    end
    object dbedtAgencia: TDBEdit
      Left = 44
      Top = 69
      Width = 54
      Height = 21
      Hint = '|Informe ou selecione a Ag'#234'ncia.'
      DataField = 'AGENCIA'
      DataSource = dtsPerguntas
      TabOrder = 2
    end
    object dbedtConta: TDBEdit
      Left = 98
      Top = 69
      Width = 91
      Height = 21
      Hint = '|Informe ou selecione a Conta.'
      DataField = 'CONTA'
      DataSource = dtsPerguntas
      TabOrder = 3
    end
    object dbedtNomeBancoAte: TDBEdit
      Left = 216
      Top = 69
      Width = 285
      Height = 21
      DataField = 'NOMEBANCO'
      DataSource = dtsPerguntas
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object dbedtArquivoOrigem: TDBEdit
      Left = 4
      Top = 23
      Width = 351
      Height = 21
      DataField = 'CAMINHOARQUIVO'
      DataSource = dtsPerguntas
      TabOrder = 0
    end
    object btnArquivo: TButton
      Left = 361
      Top = 21
      Width = 40
      Height = 25
      Caption = '...'
      TabOrder = 5
      OnClick = btnArquivoClick
    end
  end
  inherited cdsPerguntas: TClientDataSet
    Active = True
    FieldDefs = <
      item
        Name = 'CAMINHOARQUIVO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'BANCO'
        DataType = ftInteger
      end
      item
        Name = 'AGENCIA'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'CONTA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SELECIONA'
        DataType = ftString
        Size = 1
      end>
    StoreDefs = True
    Left = 436
    Top = 212
    Data = {
      9F0000009619E0BD0100000018000000050000000000030000009F000E43414D
      494E484F4152515549564F010049000000010005574944544802000200640005
      42414E434F0400010000000000074147454E4349410100490000000100055749
      44544802000200050005434F4E54410100490000000100055749445448020002
      000A000953454C4543494F4E4101004900000001000557494454480200020001
      000000}
    object cdsPerguntasCAMINHOARQUIVO: TStringField
      FieldName = 'CAMINHOARQUIVO'
      Size = 100
    end
    object cdsPerguntasBANCO: TIntegerField
      FieldName = 'BANCO'
    end
    object cdsPerguntasAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 5
    end
    object cdsPerguntasCONTA: TStringField
      FieldName = 'CONTA'
      Size = 10
    end
    object cdsPerguntasNOMEBANCO: TStringField
      FieldKind = fkCalculated
      FieldName = 'NOMEBANCO'
      Size = 50
      Calculated = True
    end
  end
  inherited dtsPerguntas: TDataSource
    Left = 436
    Top = 164
  end
  object cdsEfetiva_Movimentos: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'SELECIONADO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CONCILIADO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'MOVIMENTO'
        DataType = ftDate
      end
      item
        Name = 'TIPOMOVIMENTO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'VALOR'
        DataType = ftCurrency
      end
      item
        Name = 'HISTORICO'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ID'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DOCUMENTO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'STATUS'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 344
    Top = 232
    Data = {
      1D0100009619E0BD0100000018000000090000000000030000001D010B53454C
      4543494F4E41444F01004900000001000557494454480200020001000A434F4E
      43494C4941444F0100490000000100055749445448020002000100094D4F5649
      4D454E544F04000600000000000D5449504F4D4F56494D454E544F0100490000
      0001000557494454480200020001000556414C4F520800040000000100075355
      42545950450200490006004D6F6E65790009484953544F5249434F0200490000
      00010005574944544802000200FF000249440100490000000100055749445448
      02000200140009444F43554D454E544F01004900000001000557494454480200
      02001400065354415455530100490000000100055749445448020002001E0000
      00}
    object cdsEfetiva_MovimentosSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      Size = 1
    end
    object cdsEfetiva_MovimentosCONCILIADO: TStringField
      FieldName = 'CONCILIADO'
      Size = 1
    end
    object cdsEfetiva_MovimentosMOVIMENTO: TDateField
      FieldName = 'MOVIMENTO'
    end
    object cdsEfetiva_MovimentosTIPOMOVIMENTO: TStringField
      FieldName = 'TIPOMOVIMENTO'
      Size = 1
    end
    object cdsEfetiva_MovimentosVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object cdsEfetiva_MovimentosHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 255
    end
    object cdsEfetiva_MovimentosID: TStringField
      FieldName = 'ID'
    end
    object cdsEfetiva_MovimentosDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object cdsEfetiva_MovimentosSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 30
    end
  end
  object cdsMovimentos_Bancarios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMovimentos_Bancarios'
    RemoteServer = dspcMovimentos_Bancarios
    Left = 120
    Top = 256
    object cdsMovimentos_BancariosEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object cdsMovimentos_BancariosFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object cdsMovimentos_BancariosMOVIMENTO: TStringField
      DisplayLabel = '  '
      FieldName = 'MOVIMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 1
    end
    object cdsMovimentos_BancariosEMISSAO: TDateField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'EMISSAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object cdsMovimentos_BancariosESPECIE: TStringField
      DisplayLabel = 'Esp'#233'cie'
      FieldName = 'ESPECIE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object cdsMovimentos_BancariosDESCRICAOESPECIE: TStringField
      DisplayLabel = 'Descri'#231#227'o Esp'#233'cie'
      FieldKind = fkCalculated
      FieldName = 'DESCRICAOESPECIE'
      Size = 25
      Calculated = True
    end
    object cdsMovimentos_BancariosBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsMovimentos_BancariosAGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'AGENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsMovimentos_BancariosCONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'CONTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object cdsMovimentos_BancariosDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsMovimentos_BancariosIDENTIFICADOR: TIntegerField
      DisplayLabel = 'Identificador'
      FieldName = 'IDENTIFICADOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsMovimentos_BancariosBANCOCHEQUE: TIntegerField
      DisplayLabel = 'Banco - Cheque'
      FieldName = 'BANCOCHEQUE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsMovimentos_BancariosAGENCIACHEQUE: TStringField
      DisplayLabel = 'Ag'#234'ncia - Cheque'
      FieldName = 'AGENCIACHEQUE'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object cdsMovimentos_BancariosCONTACHEQUE: TStringField
      DisplayLabel = 'Conta - Cheque'
      FieldName = 'CONTACHEQUE'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsMovimentos_BancariosPROPRIETARIOCHEQUE: TStringField
      DisplayLabel = 'Propriet'#225'rio Cheque'
      FieldName = 'PROPRIETARIOCHEQUE'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object cdsMovimentos_BancariosVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      currency = True
    end
    object cdsMovimentos_BancariosMOVIMENTACAO: TDateField
      DisplayLabel = 'Movimenta'#231#227'o'
      FieldName = 'MOVIMENTACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object cdsMovimentos_BancariosCATEGORIA: TStringField
      DisplayLabel = 'Categoria'
      FieldName = 'CATEGORIA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 15
    end
    object cdsMovimentos_BancariosPREFIXO: TStringField
      DisplayLabel = 'Prefixo'
      FieldName = 'PREFIXO'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object cdsMovimentos_BancariosNUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsMovimentos_BancariosPARCELA: TIntegerField
      DisplayLabel = 'Parcela'
      FieldName = 'PARCELA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsMovimentos_BancariosTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object cdsMovimentos_BancariosPROPRIETARIO: TIntegerField
      DisplayLabel = 'Propriet'#225'rio'
      FieldName = 'PROPRIETARIO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsMovimentos_BancariosDECRESCIMO: TFloatField
      DisplayLabel = 'Decr'#233'scimo'
      FieldName = 'DECRESCIMO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsMovimentos_BancariosOUTROSDESCONTOS: TFloatField
      DisplayLabel = 'Outros Descontos'
      FieldName = 'OUTROSDESCONTOS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsMovimentos_BancariosACRESCIMO: TFloatField
      DisplayLabel = 'Acr'#233'scimo'
      FieldName = 'ACRESCIMO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsMovimentos_BancariosMULTA: TFloatField
      DisplayLabel = 'Multa'
      FieldName = 'MULTA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsMovimentos_BancariosTAXAPERMANENCIA: TFloatField
      DisplayLabel = 'Taxa Perman'#234'ncia'
      FieldName = 'TAXAPERMANENCIA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsMovimentos_BancariosJUROS: TFloatField
      DisplayLabel = 'Juros'
      FieldName = 'JUROS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsMovimentos_BancariosBENEFICIARIO: TStringField
      DisplayLabel = 'Benefici'#225'rio'
      FieldName = 'BENEFICIARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 40
    end
    object cdsMovimentos_BancariosCONCILIADO: TStringField
      DisplayLabel = '  '
      FieldName = 'CONCILIADO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object cdsMovimentos_BancariosEMPRESAORIGEM: TStringField
      DisplayLabel = 'Empresa Origem'
      FieldName = 'EMPRESAORIGEM'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object cdsMovimentos_BancariosFILIALORIGEM: TStringField
      DisplayLabel = 'Filial Origem'
      FieldName = 'FILIALORIGEM'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2
    end
    object cdsMovimentos_BancariosORIGEM: TStringField
      DisplayLabel = 'Origem'
      FieldName = 'ORIGEM'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object cdsMovimentos_BancariosCONFIGURACAO: TStringField
      DisplayLabel = 'Configura'#231#227'o'
      FieldName = 'CONFIGURACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 4
    end
    object cdsMovimentos_BancariosSELECIONADO: TStringField
      DisplayLabel = '  '
      FieldName = 'SELECIONADO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsMovimentos_BancariosIDCMP: TStringField
      DisplayLabel = 'Id Compensa'#231#227'o'
      FieldName = 'IDCMP'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object cdsMovimentos_BancariosLOTE: TIntegerField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsMovimentos_BancariosDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data da Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsMovimentos_BancariossqlMovimentos_Bancarios_Rateios: TDataSetField
      FieldName = 'sqlMovimentos_Bancarios_Rateios'
    end
    object cdsMovimentos_BancariosVALORBASE: TFloatField
      DisplayLabel = 'Valor Base'
      FieldName = 'VALORBASE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsMovimentos_BancariosBASE10925: TFloatField
      DisplayLabel = 'Base 10925'
      FieldName = 'BASE10925'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsMovimentos_BancariosVALORPIS: TFloatField
      DisplayLabel = 'Valor PIS'
      FieldName = 'VALORPIS'
      ProviderFlags = [pfInUpdate]
    end
    object cdsMovimentos_BancariosVALORCOFINS: TFloatField
      DisplayLabel = 'Valor COFINS'
      FieldName = 'VALORCOFINS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsMovimentos_BancariosVALORCSLL: TFloatField
      DisplayLabel = 'Valor CSLL'
      FieldName = 'VALORCSLL'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsMovimentos_BancariosRETENCAO10925: TFloatField
      DisplayLabel = 'Reten'#231#227'o 10925'
      FieldName = 'RETENCAO10925'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsMovimentos_BancariosCC: TStringField
      DisplayLabel = 'Centro de Custo'
      FieldName = 'CC'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object cdsMovimentos_BancariosBORDERO: TIntegerField
      DisplayLabel = 'Border'#244
      FieldName = 'BORDERO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsMovimentos_BancariosINCLUIDO: TStringField
      FieldName = 'INCLUIDO'
      Size = 15
    end
    object cdsMovimentos_BancariosALTERADO: TStringField
      FieldName = 'ALTERADO'
      Size = 15
    end
    object cdsMovimentos_BancariosID: TStringField
      FieldName = 'ID'
    end
    object cdsMovimentos_BancariosHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 255
    end
    object cdsMovimentos_BancariosTIPOMOVIMENTO: TStringField
      FieldName = 'TIPOMOVIMENTO'
      Size = 1
    end
  end
  object dspcMovimentos_Bancarios: TDSProviderConnection
    ServerClassName = 'TDSSMCustoms'
    Connected = True
    SQLConnection = DMMain.DSServer
    Left = 123
    Top = 202
  end
  object dtsMovimentos_Bancarios: TDataSource
    DataSet = cdsMovimentos_Bancarios
    Left = 124
    Top = 300
  end
  object opdlg: TOpenDialog
    Left = 344
    Top = 144
  end
  object cdsMovimentos_Arquivo: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'SELECIONADO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CONCILIADO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'MOVIMENTO'
        DataType = ftDate
      end
      item
        Name = 'TIPOMOVIMENTO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'VALOR'
        DataType = ftCurrency
      end
      item
        Name = 'HISTORICO'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ID'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DOCUMENTO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'INCLUIDO'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'IdxPrimario'
        Fields = 'MOVIMENTO;DOCUMENTO;TIPOMOVIMENTO;VALOR'
        Options = [ixPrimary]
      end>
    Params = <>
    StoreDefs = True
    Left = 344
    Top = 312
    object cdsMovimentos_ArquivoCONCILIADO: TStringField
      FieldName = 'CONCILIADO'
      Size = 1
    end
    object cdsMovimentos_ArquivoMOVIMENTO: TDateField
      FieldName = 'MOVIMENTO'
    end
    object cdsMovimentos_ArquivoTIPOMOVIMENTO: TStringField
      FieldName = 'TIPOMOVIMENTO'
      Size = 1
    end
    object cdsMovimentos_ArquivoVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object cdsMovimentos_ArquivoHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 255
    end
    object cdsMovimentos_ArquivoID: TStringField
      FieldName = 'ID'
    end
    object cdsMovimentos_ArquivoDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object cdsMovimentos_ArquivoINCLUIDO: TIntegerField
      FieldName = 'INCLUIDO'
    end
  end
end
