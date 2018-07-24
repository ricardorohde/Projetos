object fmErro: TfmErro
  Left = 276
  Top = 223
  BorderStyle = bsDialog
  Caption = 'Aviso'
  ClientHeight = 260
  ClientWidth = 368
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
    Width = 370
    Height = 111
    BevelOuter = bvNone
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
    object meMessage: TMemo
      Left = 62
      Top = 12
      Width = 296
      Height = 58
      BorderStyle = bsNone
      ParentColor = True
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 3
    end
    object bbok: TBitBtn
      Left = 6
      Top = 80
      Width = 75
      Height = 25
      Caption = '&Ok'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Small Fonts'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = bbokClick
    end
    object bbDetalhes: TBitBtn
      Left = 290
      Top = 80
      Width = 75
      Height = 25
      Caption = 'Detalhes >>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Small Fonts'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = bbDetalhesClick
    end
    object bbTabelas: TButton
      Left = 220
      Top = 80
      Width = 67
      Height = 25
      Caption = 'Tabelas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Visible = False
      OnClick = bbTabelasClick
    end
  end
  object paDetalhe: TPanel
    Left = 0
    Top = 112
    Width = 370
    Height = 145
    BevelInner = bvLowered
    BevelOuter = bvNone
    BorderStyle = bsSingle
    TabOrder = 1
    object Label1: TLabel
      Left = 43
      Top = 35
      Width = 19
      Height = 13
      Caption = 'Erro'
    end
    object Label2: TLabel
      Left = 14
      Top = 11
      Width = 45
      Height = 13
      Caption = 'Categoria'
    end
    object Label3: TLabel
      Left = 142
      Top = 11
      Width = 52
      Height = 13
      Caption = 'SubCodigo'
    end
    object Label4: TLabel
      Left = 142
      Top = 35
      Width = 53
      Height = 13
      Caption = 'Erro Nativo'
    end
    object bbAnterior: TBitBtn
      Left = 118
      Top = 109
      Width = 75
      Height = 25
      Caption = '<< Anterior'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Small Fonts'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = bbAnteriorClick
    end
    object bbProximo: TBitBtn
      Left = 206
      Top = 109
      Width = 75
      Height = 25
      Caption = 'Proximo >>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Small Fonts'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = bbProximoClick
    end
    object meErrMessage: TMemo
      Left = 11
      Top = 56
      Width = 346
      Height = 48
      ParentColor = True
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 2
    end
    object edErrorCode: TEdit
      Left = 67
      Top = 29
      Width = 65
      Height = 21
      Color = clBtnFace
      TabOrder = 3
    end
    object edCategory: TEdit
      Left = 67
      Top = 5
      Width = 65
      Height = 21
      Color = clBtnFace
      TabOrder = 4
    end
    object edSubCode: TEdit
      Left = 203
      Top = 5
      Width = 65
      Height = 21
      Color = clBtnFace
      TabOrder = 5
    end
    object edNativeError: TEdit
      Left = 203
      Top = 29
      Width = 65
      Height = 21
      Color = clBtnFace
      TabOrder = 6
    end
    object paDetalhe_Simples: TPanel
      Left = 1
      Top = 1
      Width = 364
      Height = 62
      Align = alTop
      TabOrder = 7
      Visible = False
      object meMensagem_Erro: TMemo
        Left = 10
        Top = 7
        Width = 342
        Height = 46
        BorderStyle = bsNone
        ParentColor = True
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
end
