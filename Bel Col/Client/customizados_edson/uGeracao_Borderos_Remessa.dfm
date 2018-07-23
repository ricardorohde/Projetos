inherited frmGeracao_Borderos_Remessa: TfrmGeracao_Borderos_Remessa
  Caption = 'Gera'#231#227'o de Remessas (Pagar/Receber)'
  ClientHeight = 622
  ClientWidth = 593
  Position = poDesktopCenter
  ExplicitWidth = 599
  ExplicitHeight = 647
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel [0]
    Left = 4
    Top = 4
    Width = 133
    Height = 13
    Caption = 'Banco/Ag'#234'ncia/Conta At'#233'?'
  end
  object SpeedButton1: TSpeedButton [1]
    Left = 190
    Top = 19
    Width = 23
    Height = 22
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF0000000000000000000000000000000000000000007373
      7300FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF0000000000FFCECE00FFCECE00FFCECE00FFFFFF00FFFFFF00CE9C9C00CE9C
      9C00000000007373730073737300FF00FF00FF00FF00FF00FF00FF00FF00CE9C
      9C00CE9C9C00FFCECE00FFCECE00FFCECE00FFFFFF00FFFFFF00CE9C9C00CE9C
      9C00CE9C9C00CE9C9C007373730073737300FF00FF00FF00FF00CE9C9C00CE9C
      9C00CE9C9C0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000CE9C9C00CE9C9C00CE9C9C0073737300FF00FF00FF00FF00CE9C9C000000
      0000FFFFFF00FFFFFF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF0000000000CE9C9C007373730073737300FF00FF0000000000FFFF
      FF0000000000FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C0000000000FFFFFF00000000007373730073737300FF00FF00FFFFFF000000
      0000FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C009C63630000000000FFFFFF007373730073737300FF00FF00FFFFFF000000
      0000CE9C9C00FF9C9C00FFFFFF009C6363009C6363009C6363009C636300FF9C
      9C00CE9C9C0000000000FFFFFF0073737300FF00FF00FF00FF0000000000FFFF
      FF0000000000CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C
      9C0000000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF000000
      0000FFFFFF00FFFFFF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000073737300FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000C6C6C600C6C6C6000000000073737300FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
      0000FFFFFF00C6C6C600000000000000000073737300FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00000000007373730010101000000000000000000073737300FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF000000000073737300101010000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000000000737373001010100000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00}
  end
  inherited pnlBaixo: TPanel
    Top = 587
    Width = 593
    Height = 35
    ExplicitTop = 587
    ExplicitWidth = 593
    ExplicitHeight = 35
    inherited btnConfirmar: TButton
      Left = 432
      Top = 6
      ExplicitLeft = 432
      ExplicitTop = 6
    end
    inherited btnCancelar: TButton
      Top = 5
      ExplicitTop = 5
    end
  end
  inherited scrPerguntas: TScrollBox
    Width = 593
    Height = 587
    ExplicitWidth = 593
    ExplicitHeight = 587
    object Label23: TLabel
      Left = 5
      Top = 163
      Width = 73
      Height = 13
      Caption = 'Emiss'#227'o De?'
      FocusControl = dbedtEmissaoDe
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 5
      Top = 203
      Width = 76
      Height = 13
      Caption = 'Emiss'#227'o At'#233'?'
      FocusControl = dbedtEmissaoAte
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 5
      Top = 122
      Width = 75
      Height = 13
      Caption = 'Border'#244' At'#233'?'
      FocusControl = dbedtBorderoAte
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 5
      Top = 82
      Width = 72
      Height = 13
      Caption = 'Border'#244' De?'
      FocusControl = dbedtBorderoDe
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 5
      Top = 4
      Width = 53
      Height = 13
      Caption = 'Carteira?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object spdBancos: TSpeedButton
      Left = 195
      Top = 57
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
      OnClick = spdBancosClick
    end
    object Label6: TLabel
      Left = 5
      Top = 42
      Width = 111
      Height = 13
      Caption = 'Banco/Ag'#234'ncia/Conta:'
    end
    object dbedtEmissaoDe: TDBEdit
      Left = 5
      Top = 178
      Width = 134
      Height = 21
      Hint = '|Informe a Emiss'#227'o De.'
      DataField = 'EMISSAODE'
      DataSource = dtsPerguntas
      MaxLength = 10
      TabOrder = 6
      OnChange = dbedtEmissaoDeChange
    end
    object dbedtEmissaoAte: TDBEdit
      Left = 5
      Top = 217
      Width = 134
      Height = 21
      Hint = '|Informe a Emiss'#227'o At'#233'.'
      DataField = 'EMISSAOATE'
      DataSource = dtsPerguntas
      MaxLength = 10
      TabOrder = 7
      OnChange = dbedtEmissaoDeChange
    end
    object dbedtBorderoAte: TDBEdit
      Left = 5
      Top = 138
      Width = 134
      Height = 21
      Hint = '|Informe o Border'#244' At'#233'.'
      DataField = 'BORDEROATE'
      DataSource = dtsPerguntas
      TabOrder = 5
    end
    object dbedtBorderoDe: TDBEdit
      Left = 5
      Top = 97
      Width = 134
      Height = 21
      Hint = '|Informe o Border'#244' De.'
      DataField = 'BORDERODE'
      DataSource = dtsPerguntas
      TabOrder = 4
    end
    object dbcboCarteira: TDBComboBox
      Tag = 4
      Left = 5
      Top = 18
      Width = 134
      Height = 21
      Hint = '|Selecione a Carteira.'
      Style = csDropDownList
      DataField = 'CARTEIRA'
      DataSource = dtsPerguntas
      Items.Strings = (
        '0=Pagar'
        '1=Receber')
      TabOrder = 0
    end
    object dbedtNomeBanco: TDBEdit
      Left = 220
      Top = 57
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
      TabOrder = 8
    end
    object dbedtConta: TDBEdit
      Left = 104
      Top = 57
      Width = 91
      Height = 21
      Hint = '|Informe ou selecione a Conta.'
      DataField = 'CONTA'
      DataSource = dtsPerguntas
      TabOrder = 3
    end
    object dbedtAgencia: TDBEdit
      Left = 47
      Top = 57
      Width = 56
      Height = 21
      Hint = '|Informe ou selecione a Ag'#234'ncia.'
      DataField = 'AGENCIA'
      DataSource = dtsPerguntas
      TabOrder = 2
    end
    object dbedtBanco: TDBEdit
      Left = 5
      Top = 57
      Width = 41
      Height = 21
      Hint = '|Informe ou selecione o Banco.'
      DataField = 'BANCO'
      DataSource = dtsPerguntas
      TabOrder = 1
    end
  end
  inherited cdsPerguntas: TClientDataSet
    Active = True
    FieldDefs = <
      item
        Name = 'CARTEIRA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PROPRIETARIODE'
        DataType = ftInteger
      end
      item
        Name = 'NOMEPROPRIETARIODE'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'PROPRIETARIOATE'
        DataType = ftInteger
      end
      item
        Name = 'NOMEPROPRIETARIOATE'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'BORDERODE'
        DataType = ftInteger
      end
      item
        Name = 'BORDEROATE'
        DataType = ftInteger
      end
      item
        Name = 'EMISSAODE'
        DataType = ftDate
      end
      item
        Name = 'EMISSAOATE'
        DataType = ftDate
      end
      item
        Name = 'ARQUIVO'
        DataType = ftString
        Size = 80
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
        Name = 'NOMEBANCO'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'FORMAPAGAMENTODE'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'FORMAPAGAMENTOATE'
        DataType = ftString
        Size = 2
      end>
    StoreDefs = True
    Left = 220
    Top = 84
    Data = {
      C80100009619E0BD010000001800000010000000000003000000C80108434152
      544549524101004900000001000557494454480200020001000E50524F505249
      45544152494F44450400010000000000124E4F4D4550524F5052494554415249
      4F444501004900000001000557494454480200020019000F50524F5052494554
      4152494F4154450400010000000000134E4F4D4550524F50524945544152494F
      415445010049000000010005574944544802000200190009424F524445524F44
      4504000100000000000A424F524445524F415445040001000000000009454D49
      5353414F444504000600000000000A454D495353414F41544504000600000000
      00074152515549564F0100490000000100055749445448020002005000054241
      4E434F0400010000000000074147454E43494101004900000001000557494454
      4802000200050005434F4E54410100490000000100055749445448020002000A
      00094E4F4D4542414E434F010049000000010005574944544802000200190010
      464F524D41504147414D454E544F444501004900000001000557494454480200
      0200020011464F524D41504147414D454E544F41544501004900000001000557
      494454480200020002000000}
    object cdsPerguntasCARTEIRA: TStringField
      FieldName = 'CARTEIRA'
      Size = 1
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
      FieldName = 'NOMEBANCO'
      Size = 25
    end
    object cdsPerguntasBORDERODE: TIntegerField
      FieldName = 'BORDERODE'
    end
    object cdsPerguntasBORDEROATE: TIntegerField
      FieldName = 'BORDEROATE'
    end
    object cdsPerguntasEMISSAODE: TDateField
      FieldName = 'EMISSAODE'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsPerguntasEMISSAOATE: TDateField
      FieldName = 'EMISSAOATE'
      EditMask = '!99/99/0000;1;_'
    end
  end
  object dtsBorderos: TDataSource [5]
    DataSet = cdsBorderos
    Left = 339
    Top = 190
  end
  object cdsBorderos: TClientDataSet [6]
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAS_Auxiliar'
    RemoteServer = dspcBorderos
    Left = 339
    Top = 144
  end
  inherited dtsPerguntas: TDataSource
    Left = 221
    Top = 142
  end
  object dspcBorderos: TDSProviderConnection
    ServerClassName = 'TDSSMLan'
    Connected = True
    SQLConnection = DMMain.DSServer
    Left = 344
    Top = 88
  end
end
