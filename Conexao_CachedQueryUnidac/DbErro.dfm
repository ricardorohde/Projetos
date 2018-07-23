object fmErro: TfmErro
  Left = 246
  Top = 147
  AutoSize = True
  BorderStyle = bsDialog
  Caption = 'Aviso'
  ClientHeight = 279
  ClientWidth = 387
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object paMessage: TPanel
    Left = 0
    Top = 0
    Width = 387
    Height = 111
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object IconImage: TImage
      Left = 10
      Top = 20
      Width = 45
      Height = 43
      Center = True
      Picture.Data = {
        055449636F6E0000010002002020100000000000E80200002600000020200200
        00000000300100000E0300002800000020000000400000000100040000000000
        0002000000000000000000000000000000000000000000000000800000800000
        00808000800000008000800080800000C0C0C000808080000000FF0000FF0000
        00FFFF00FF000000FF00FF00FFFF0000FFFFFF00000008888888888888888888
        8888880000008888888888888888888888888880003000000000000000000000
        0008888803BBBBBBBBBBBBBBBBBBBBBBBB7088883BBBBBBBBBBBBBBBBBBBBBBB
        BBB708883BBBBBBBBBBBBBBBBBBBBBBBBBBB08883BBBBBBBBBBBB7007BBBBBBB
        BBBB08803BBBBBBBBBBBB0000BBBBBBBBBB7088003BBBBBBBBBBB0000BBBBBBB
        BBB0880003BBBBBBBBBBB7007BBBBBBBBB708800003BBBBBBBBBBBBBBBBBBBBB
        BB088000003BBBBBBBBBBB0BBBBBBBBBB70880000003BBBBBBBBB707BBBBBBBB
        B08800000003BBBBBBBBB303BBBBBBBB7088000000003BBBBBBBB000BBBBBBBB
        0880000000003BBBBBBB70007BBBBBB708800000000003BBBBBB30003BBBBBB0
        88000000000003BBBBBB00000BBBBB70880000000000003BBBBB00000BBBBB08
        800000000000003BBBBB00000BBBB7088000000000000003BBBB00000BBBB088
        0000000000000003BBBB00000BBB708800000000000000003BBB70007BBB0880
        00000000000000003BBBBBBBBBB70880000000000000000003BBBBBBBBB08800
        000000000000000003BBBBBBBB7088000000000000000000003BBBBBBB088000
        0000000000000000003BBBBBB708800000000000000000000003BBBBB0880000
        00000000000000000003BBBB70800000000000000000000000003BB700000000
        0000000000000000000003330000000000000000F8000003F0000001C0000000
        80000000000000000000000000000001000000018000000380000003C0000007
        C0000007E000000FE000000FF000001FF000001FF800003FF800003FFC00007F
        FC00007FFE0000FFFE0000FFFF0001FFFF0001FFFF8003FFFF8003FFFFC007FF
        FFC007FFFFE00FFFFFE01FFFFFF07FFFFFF8FFFF280000002000000040000000
        0100010000000000800000000000000000000000000000000000000000000000
        FFFFFF000000000000000000000000003FFFFFC07FFFFFE07FFFFFF07FFCFFF0
        7FF87FE03FF87FE03FFCFFC01FFFFFC01FFDFF800FFDFF800FFDFF0007F8FF00
        07F8FE0003F8FE0003F07C0001F07C0001F0780000F0780000F070000078F000
        007FE000003FE000003FC000001FC000001F8000000F8000000F000000060000
        00000000FFFFFFFFFFFFFFFFC000001F8000000F000000070000000700000007
        000000078000000F8000000FC000001FC000001FE000003FE000003FF000007F
        F000007FF80000FFF80000FFFC0001FFFC0001FFFE0003FFFE0003FFFF0007FF
        FF0007FFFF800FFFFF800FFFFFC01FFFFFC01FFFFFE03FFFFFE03FFFFFF07FFF
        FFF8FFFF}
    end
    object bbSalvar_Erro: TSpeedButton
      Left = 87
      Top = 82
      Width = 89
      Height = 22
      Caption = 'Salvar Erro'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
      OnClick = bbSalvar_ErroClick
    end
    object meMessage: TMemo
      Left = 62
      Top = 12
      Width = 319
      Height = 58
      BorderStyle = bsNone
      ParentColor = True
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 2
    end
    object bbok: TBitBtn
      Left = 6
      Top = 80
      Width = 75
      Height = 25
      Caption = '&Ok'
      Default = True
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Small Fonts'
      Font.Style = [fsBold]
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
      OnClick = bbokClick
    end
    object bbDetalhes: TBitBtn
      Left = 304
      Top = 80
      Width = 75
      Height = 25
      Caption = 'Detalhes >>'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Small Fonts'
      Font.Style = [fsBold]
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 1
      OnClick = bbDetalhesClick
    end
  end
  object pcDetalhes: TPageControl
    Left = 0
    Top = 111
    Width = 387
    Height = 168
    ActivePage = tsRelacionamento
    Align = alTop
    TabOrder = 1
    OnChange = pcDetalhesChange
    object tsErro: TTabSheet
      Caption = 'Erro'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 379
        Height = 140
        Align = alClient
        BevelInner = bvLowered
        Caption = 'paErro'
        TabOrder = 0
        object laErro: TLabel
          Left = 194
          Top = 5
          Width = 19
          Height = 13
          Caption = 'Erro'
        end
        object laCategoria: TLabel
          Left = 11
          Top = 5
          Width = 45
          Height = 13
          Caption = 'Categoria'
        end
        object laSubCodigo: TLabel
          Left = 102
          Top = 5
          Width = 52
          Height = 13
          Caption = 'SubCodigo'
        end
        object laErro_Nativo: TLabel
          Left = 286
          Top = 5
          Width = 53
          Height = 13
          Caption = 'Erro Nativo'
        end
        object bbAnterior: TBitBtn
          Left = 216
          Top = 110
          Width = 75
          Height = 25
          Caption = '<< Anterior'
          DoubleBuffered = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = [fsBold]
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 0
          OnClick = bbAnteriorClick
        end
        object bbProximo: TBitBtn
          Left = 294
          Top = 110
          Width = 75
          Height = 25
          Caption = 'Proximo >>'
          DoubleBuffered = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Small Fonts'
          Font.Style = [fsBold]
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 1
          OnClick = bbProximoClick
        end
        object meErrMessage: TMemo
          Left = 11
          Top = 45
          Width = 362
          Height = 60
          ParentColor = True
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 2
        end
        object edErrorCode: TEdit
          Left = 194
          Top = 19
          Width = 86
          Height = 21
          Color = clBtnFace
          TabOrder = 3
        end
        object edCategory: TEdit
          Left = 11
          Top = 19
          Width = 86
          Height = 21
          Color = clBtnFace
          TabOrder = 4
        end
        object edSubCode: TEdit
          Left = 102
          Top = 19
          Width = 86
          Height = 21
          Color = clBtnFace
          TabOrder = 5
        end
        object edNativeError: TEdit
          Left = 286
          Top = 19
          Width = 86
          Height = 21
          Color = clBtnFace
          TabOrder = 6
        end
      end
    end
    object tsRelacionamento: TTabSheet
      Caption = 'Relacionamentos'
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 379
        Height = 140
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 0
        object grdRelacionamento: TDBGridPesquisa
          Left = 2
          Top = 2
          Width = 375
          Height = 136
          Align = alClient
          DataSource = dsRelacionamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NOTABELA'
              Title.Caption = 'Tabela'
              Width = 266
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTREGISTROS'
              Title.Caption = 'Qtde Registros'
              Width = 73
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CAMPOS'
              Title.Caption = 'Campos'
              Width = 370
              Visible = True
            end>
        end
      end
    end
  end
  object qyQtRegistro: TQuery
    DatabaseName = 'dbMain'
    SessionName = 'Session'
    Left = 336
    Top = 218
  end
  object dsRelacionamento: TDataSource
    DataSet = cdsRelacionamentos
    Left = 86
    Top = 166
  end
  object cdsRelacionamentos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 336
    Top = 148
    object cdsRelacionamentosNOTABELA: TStringField
      FieldName = 'NOTABELA'
      Size = 60
    end
    object cdsRelacionamentosNOTABELA_REFERENCIADA: TStringField
      FieldName = 'NOTABELA_REFERENCIADA'
      Size = 60
    end
    object cdsRelacionamentosCAMPOS: TStringField
      FieldName = 'CAMPOS'
      Size = 255
    end
    object cdsRelacionamentosQTREGISTROS: TIntegerField
      FieldName = 'QTREGISTROS'
    end
  end
  object qyRelacionamentos: TQuery
    DatabaseName = 'dbMain'
    SessionName = 'Session'
    SQL.Strings = (
      'SELECT CDRELACIONAMENTO_TABELA,'
      '               NOTABELA'
      'FROM RELACIONAMENTO_TABELA'
      'WHERE NOTABELA_REFERENCIADA = :NOTABELA_REFERENCIADA')
    Left = 332
    Top = 116
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NOTABELA_REFERENCIADA'
        ParamType = ptUnknown
      end>
    object qyRelacionamentosCDRELACIONAMENTO_TABELA: TFloatField
      FieldName = 'CDRELACIONAMENTO_TABELA'
      Origin = 'DBMAIN.RELACIONAMENTO_TABELA.CDRELACIONAMENTO_TABELA'
    end
    object qyRelacionamentosNOTABELA: TStringField
      DisplayWidth = 60
      FieldName = 'NOTABELA'
      Origin = 'DBMAIN.TABELA.NOTABELA'
      Size = 30
    end
    object qyRelacionamentosQtRegistros: TIntegerField
      DisplayWidth = 12
      FieldKind = fkCalculated
      FieldName = 'QtRegistros'
      Calculated = True
    end
  end
  object qyCampo: TQuery
    DatabaseName = 'dbMain'
    SessionName = 'Session'
    DataSource = dsRelacionamento
    SQL.Strings = (
      'SELECT CRT.NOCAMPO,'
      '       CRT.NOCAMPO_REFERENCIADO,'
      '       CT.CDTIPO_DADO'
      'FROM CAMPO_RELACIONAMENTO_TABELA CRT,'
      '     CAMPO_TABELA CT'
      'WHERE CRT.CDRELACIONAMENTO_TABELA = :CDRELACIONAMENTO_TABELA'
      'AND   CRT.NOTABELA_REFERENCIADA = CT.NOTABELA'
      'AND   CRT.NOCAMPO_REFERENCIADO  = CT.NOCAMPO'
      ''
      ''
      ' ')
    Left = 334
    Top = 180
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CDRELACIONAMENTO_TABELA'
        ParamType = ptUnknown
      end>
  end
  object sdGrava_Arquivo: TSaveDialog
    DefaultExt = 'txt'
    Filter = 'Arquivo Texto (*.txt)|*.txt'
    Left = 104
    Top = 210
  end
end
