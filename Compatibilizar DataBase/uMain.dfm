object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Compatibilizar DataBase'
  ClientHeight = 620
  ClientWidth = 668
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Notebook1: TNotebook
    Left = 3
    Top = 154
    Width = 659
    Height = 423
    PageIndex = 1
    TabOrder = 0
    object TPage
      Left = 0
      Top = 0
      Caption = 'Pagina_1'
      ExplicitWidth = 671
      ExplicitHeight = 593
      object gboxSelecionarBanco: TGroupBox
        Left = 4
        Top = 2
        Width = 650
        Height = 110
        Caption = 'Selecionar Banco Origem'
        TabOrder = 0
        object Label37: TLabel
          Left = 12
          Top = 23
          Width = 122
          Height = 13
          Caption = 'Local do banco de dados:'
        end
        object Label38: TLabel
          Left = 12
          Top = 66
          Width = 40
          Height = 13
          Caption = 'Usu'#225'rio:'
        end
        object Label39: TLabel
          Left = 218
          Top = 66
          Width = 34
          Height = 13
          Caption = 'Senha:'
        end
        object edtCaminhoBancoModelo: TEdit
          Left = 11
          Top = 42
          Width = 592
          Height = 19
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object edtUsuarioModelo: TEdit
          Left = 11
          Top = 81
          Width = 200
          Height = 19
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
        object edtSenhaModelo: TEdit
          Left = 218
          Top = 81
          Width = 200
          Height = 19
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          PasswordChar = '*'
          TabOrder = 2
        end
        object btnTestarModelo: TBitBtn
          Left = 541
          Top = 77
          Width = 100
          Height = 27
          Caption = 'Conectar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Glyph.Data = {
            42040000424D4204000000000000420000002800000010000000100000000100
            20000300000000040000000000000000000000000000000000000000FF0000FF
            0000FF00000000000000E0A73C52E3AE4DF9E2AB57F6DEA75BF3DBA35DF3D699
            51F3D19244F3CD8B3DF3C98538F3C27D32F3BF742BF3B96C23F3B6661CFFA554
            16C09F4C164B00000000E4AD49EBFAE8B3FFFDEDC3FFFFFBEFFFFFFFFFFFFFF4
            DEFFF8E5ACFFF9E08DFFF9DB83FFF2CC69FFEBBC4EFFE4AB34FFE6A01CFFC577
            13FFA45215D900000000E5AB48E3F8E3ADFFF6DBA4FFF8E8CDFFFAEFE3FFF5DF
            BEFFEFD194FFEFCC79FFEEC772FFE7B95CFFE1AB46FFDB9D31FFDB931CFFC478
            13FFA35315CF00000000E4AD4BE3FBE9BBFFF9E0ABFFFBEED9FFFCF5F0FFF8E5
            C8FFF2D69AFFF3D17FFFF1CC76FFEBBE5EFFE5AF45FFDC9E2FFFDE9519FFC579
            14FFA35316CF00000000E4AA45E8F4DBA7FFF5DEB1FFF5E5C8FFF7E9D8FFF2DD
            BAFFEED29DFFEDCC8AFFECCA81FFE6BF71FFE3B660FFDCAA4DFFDEA739FFBD73
            1DFFA45114D600000000E0A73C46E5B557FFE6B964FFE2B66BFFE0B776FFDAAA
            5DFFD69E4BFFD39844FFCE903FFFCA8738FFC37C32FFBD712BFFBA6E23FFA14F
            16C49D4B153D00000000E9BE67D8FAE7B5FFF7E0ACFFFBEED9FFFDF6F1FFF8E4
            C7FFF1D69CFFF3D17FFFF1CD75FFEBBE5FFFE3AD46FFDD9D2EFFDC9417FFC87D
            12FFAF5F15C700000000EABF66E4F8E1A8FFF7DEAAFFF9EAD2FFFBF1E9FFF6E1
            C2FFEFD398FFF0CE7DFFEFCA76FFE8BB5FFFE2AF48FFDCA032FFD9921CFFC67A
            14FFB05E14D000000000EABF67E4F8E2ABFFF7DDA2FFF9EAD0FFFBF1E7FFF6E1
            BFFFEFD293FFF0CC75FFEFC86FFFE8B958FFE0AA40FFDA9A2AFFD88E14FFC677
            0EFFB05E12D000000000EAC069D8FAEBCBFFF8E5BEFFFAEDDCFFFBF5EFFFF9E8
            CFFFF5DCACFFF3D799FFF2D58FFFECCA7CFFE8BE67FFE1B150FFE1AC3AFFCD8D
            26FFB26419C700000000E2AC4246E7BB65FFE9BF7AFFE6C285FFE4C28FFFDEB3
            71FFD9A65BFFD69F54FFD29B4DFFCD9045FFC8893EFFC37D35FFC07D2DFFAE62
            21C4A5541A3D00000000E7B85DE8F7E1A4FFF7DEA4FFF8E9CFFFFAF1E7FFF6E1
            BDFFF1D393FFF1CE78FFF0C96FFFE9BA5AFFE3AB43FFDD9A2DFFDA9017FFC273
            11FFAA5A14D600000000EBC269E3F8E3ADFFF7E0ACFFFBEBD5FFFCF3EBFFF9E3
            C5FFF0D59AFFF0D07FFFF0CB78FFEABD60FFE4AF49FFDEA033FFDB951CFFC87D
            14FFB26214CF00000000EAC067E3F8DFA6FFF7DCA1FFF8E7CCFFFAEFE2FFF7DF
            BCFFEFD18FFFEDCB74FFEDC66DFFE6B756FFE0A83FFFDA9829FFD78C14FFC576
            0EFFB05E13CF00000000EABF69EBFCF1CFFFFCEBC6FFFFF8EEFFFFFFFFFFFEF1
            DFFFF7E5B7FFF7E09CFFF6DC94FFF1D07DFFEBC464FFE6B34CFFE6AC34FFCF8B
            21FFB26116D900000000E5AF4952EAC172F9E9C380F6E6C081F3E4BF85F3E1B5
            77F3DEB06DF3DAA964F3D6A461F3D29D5AF3CF9753F3CA8F49F3C89040FFB46D
            28C0A957194B}
          ParentFont = False
          TabOrder = 3
          OnClick = btnTestarModeloClick
        end
        object btnProcurarBancoModelo: TBitBtn
          Left = 612
          Top = 38
          Width = 29
          Height = 27
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF009CA5AD009C949400FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF006384A500218CD6008494A500A5A59C00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0063849C00189CEF0094EFFF006BCEFF00A5ADB500FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0063849C00189CEF0094EFFF008CEFFF006BA5BD00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF006B8C
            A500189CEF0094EFFF008CEFFF006B9CBD00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00948C8C008C8484009C949400FF00FF00FF00FF003173
            A50084E7FF008CEFFF006B9CBD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF008C737B00A57B7300C6A59C00D6ADAD00C69C9C00A58484009C8484009C8C
            8C005AA5CE0073ADCE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008C73
            7300BD8C7B00E7CEB500EFE7DE00EFE7E700EFE7D600E7C6B500CEADAD00AD9C
            9C00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00AD73
            6300EFBD9400EFD6BD00EFE7CE00EFE7D600EFDECE00EFD6B500E7BDA500B59C
            9C00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0094737300D684
            5A00EFB58C00EFC69C00EFCEAD00EFD6B500EFCEAD00EFBD9C00E7AD8400D6B5
            AD009C9C9C00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF009C737300DE84
            4A00E79C6B00EFAD8400E7B58C00E7B58C00E7B58C00EFB58400F7B57B00EFC6
            AD009C9C9C00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF009C7B7300E78C
            5200F7B58400FFD6A500FFDEB500F7DEAD00F7DEAD00FFDEAD00FFCE9C00EFCE
            B500A5A5A500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00AD949400E7AD
            8C00FFDEAD00FFE7BD00FFEFC600FFEFCE00FFEFCE00FFEFBD00FFDEB500E7C6
            C600BDBDBD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BD94
            8C00FFD6AD00FFF7CE00FFF7D600FFF7DE00FFF7DE00FFF7CE00F7E7CE00BDAD
            B500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEBD
            BD00CEADA500F7DEC600FFF7DE00FFF7EF00FFEFE700F7E7D600D6C6C600FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00CEBDBD00DEC6BD00E7CECE00E7CECE00CEBDC600FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          TabOrder = 4
          OnClick = btnProcurarBancoModeloClick
        end
        object btnSenhaDefault: TBitBtn
          Left = 428
          Top = 77
          Width = 100
          Height = 27
          Caption = 'Default'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000232E0000232E00000000000000000001FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFD0DFF23E9DE1A0BEE5FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2581D44D
            BCF3188BECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF2581D457CAF6188BECFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2581D46D
            D3F72366B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF2581D465D2F7188BECFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2581D457
            CDF62366B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF2581D451C9F32366B8FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2581D450
            C0F1188BECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF65A8E847CBFB39B9F195C0EAFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F7FD6FB1F175DDFD59
            DBFF63DBFF408DE0A6CBF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF83B4EC56B0F060D4FE61D0FE61CCFE5EC5FB488BE1EFF6FCFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF378DEBC1EBFEC1EBFEC1
            EBFEC1EBFEC1EBFE41A0F4A9CDF2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF2D92F62685E82685E82685E82685E82685E83AA3FA90C3F5FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF55A9F53EA9F4CEE8FCFF
            FFFFD9EAFA2987EA43A3FAC4DEF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFB8DAF73EA7F73F9CF31981F22583F1419FF865B2F3FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9DBF762B6F377
            C5F85EB8F58DC8F5F0F7FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentFont = False
          TabOrder = 5
          OnClick = btnSenhaDefaultClick
        end
      end
      object chkTabelas: TCheckListBox
        Left = 4
        Top = 118
        Width = 650
        Height = 299
        ItemHeight = 13
        TabOrder = 1
        OnClick = chkTabelasClick
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Pagina_2'
      ExplicitWidth = 671
      ExplicitHeight = 593
      object gbxDestino: TGroupBox
        Left = 4
        Top = 2
        Width = 650
        Height = 116
        Caption = 'Selecionar Banco Destino'
        TabOrder = 0
        object Label3: TLabel
          Left = 218
          Top = 66
          Width = 34
          Height = 13
          Caption = 'Senha:'
        end
        object Label5: TLabel
          Left = 12
          Top = 66
          Width = 40
          Height = 13
          Caption = 'Usu'#225'rio:'
        end
        object Label6: TLabel
          Left = 12
          Top = 23
          Width = 122
          Height = 13
          Caption = 'Local do banco de dados:'
        end
        object btnTestarDestino: TBitBtn
          Left = 541
          Top = 77
          Width = 100
          Height = 27
          Caption = 'Conectar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Glyph.Data = {
            42040000424D4204000000000000420000002800000010000000100000000100
            20000300000000040000000000000000000000000000000000000000FF0000FF
            0000FF00000000000000E0A73C52E3AE4DF9E2AB57F6DEA75BF3DBA35DF3D699
            51F3D19244F3CD8B3DF3C98538F3C27D32F3BF742BF3B96C23F3B6661CFFA554
            16C09F4C164B00000000E4AD49EBFAE8B3FFFDEDC3FFFFFBEFFFFFFFFFFFFFF4
            DEFFF8E5ACFFF9E08DFFF9DB83FFF2CC69FFEBBC4EFFE4AB34FFE6A01CFFC577
            13FFA45215D900000000E5AB48E3F8E3ADFFF6DBA4FFF8E8CDFFFAEFE3FFF5DF
            BEFFEFD194FFEFCC79FFEEC772FFE7B95CFFE1AB46FFDB9D31FFDB931CFFC478
            13FFA35315CF00000000E4AD4BE3FBE9BBFFF9E0ABFFFBEED9FFFCF5F0FFF8E5
            C8FFF2D69AFFF3D17FFFF1CC76FFEBBE5EFFE5AF45FFDC9E2FFFDE9519FFC579
            14FFA35316CF00000000E4AA45E8F4DBA7FFF5DEB1FFF5E5C8FFF7E9D8FFF2DD
            BAFFEED29DFFEDCC8AFFECCA81FFE6BF71FFE3B660FFDCAA4DFFDEA739FFBD73
            1DFFA45114D600000000E0A73C46E5B557FFE6B964FFE2B66BFFE0B776FFDAAA
            5DFFD69E4BFFD39844FFCE903FFFCA8738FFC37C32FFBD712BFFBA6E23FFA14F
            16C49D4B153D00000000E9BE67D8FAE7B5FFF7E0ACFFFBEED9FFFDF6F1FFF8E4
            C7FFF1D69CFFF3D17FFFF1CD75FFEBBE5FFFE3AD46FFDD9D2EFFDC9417FFC87D
            12FFAF5F15C700000000EABF66E4F8E1A8FFF7DEAAFFF9EAD2FFFBF1E9FFF6E1
            C2FFEFD398FFF0CE7DFFEFCA76FFE8BB5FFFE2AF48FFDCA032FFD9921CFFC67A
            14FFB05E14D000000000EABF67E4F8E2ABFFF7DDA2FFF9EAD0FFFBF1E7FFF6E1
            BFFFEFD293FFF0CC75FFEFC86FFFE8B958FFE0AA40FFDA9A2AFFD88E14FFC677
            0EFFB05E12D000000000EAC069D8FAEBCBFFF8E5BEFFFAEDDCFFFBF5EFFFF9E8
            CFFFF5DCACFFF3D799FFF2D58FFFECCA7CFFE8BE67FFE1B150FFE1AC3AFFCD8D
            26FFB26419C700000000E2AC4246E7BB65FFE9BF7AFFE6C285FFE4C28FFFDEB3
            71FFD9A65BFFD69F54FFD29B4DFFCD9045FFC8893EFFC37D35FFC07D2DFFAE62
            21C4A5541A3D00000000E7B85DE8F7E1A4FFF7DEA4FFF8E9CFFFFAF1E7FFF6E1
            BDFFF1D393FFF1CE78FFF0C96FFFE9BA5AFFE3AB43FFDD9A2DFFDA9017FFC273
            11FFAA5A14D600000000EBC269E3F8E3ADFFF7E0ACFFFBEBD5FFFCF3EBFFF9E3
            C5FFF0D59AFFF0D07FFFF0CB78FFEABD60FFE4AF49FFDEA033FFDB951CFFC87D
            14FFB26214CF00000000EAC067E3F8DFA6FFF7DCA1FFF8E7CCFFFAEFE2FFF7DF
            BCFFEFD18FFFEDCB74FFEDC66DFFE6B756FFE0A83FFFDA9829FFD78C14FFC576
            0EFFB05E13CF00000000EABF69EBFCF1CFFFFCEBC6FFFFF8EEFFFFFFFFFFFEF1
            DFFFF7E5B7FFF7E09CFFF6DC94FFF1D07DFFEBC464FFE6B34CFFE6AC34FFCF8B
            21FFB26116D900000000E5AF4952EAC172F9E9C380F6E6C081F3E4BF85F3E1B5
            77F3DEB06DF3DAA964F3D6A461F3D29D5AF3CF9753F3CA8F49F3C89040FFB46D
            28C0A957194B}
          ParentFont = False
          TabOrder = 0
          OnClick = btnTestarDestinoClick
        end
        object btnSenhaDestino: TBitBtn
          Left = 428
          Top = 77
          Width = 100
          Height = 27
          Caption = 'Default'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000232E0000232E00000000000000000001FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFD0DFF23E9DE1A0BEE5FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2581D44D
            BCF3188BECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF2581D457CAF6188BECFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2581D46D
            D3F72366B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF2581D465D2F7188BECFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2581D457
            CDF62366B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF2581D451C9F32366B8FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2581D450
            C0F1188BECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF65A8E847CBFB39B9F195C0EAFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F7FD6FB1F175DDFD59
            DBFF63DBFF408DE0A6CBF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF83B4EC56B0F060D4FE61D0FE61CCFE5EC5FB488BE1EFF6FCFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF378DEBC1EBFEC1EBFEC1
            EBFEC1EBFEC1EBFE41A0F4A9CDF2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF2D92F62685E82685E82685E82685E82685E83AA3FA90C3F5FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF55A9F53EA9F4CEE8FCFF
            FFFFD9EAFA2987EA43A3FAC4DEF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFB8DAF73EA7F73F9CF31981F22583F1419FF865B2F3FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9DBF762B6F377
            C5F85EB8F58DC8F5F0F7FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentFont = False
          TabOrder = 1
          OnClick = btnSenhaDestinoClick
        end
        object btnProcurarBancoDestino: TBitBtn
          Left = 612
          Top = 38
          Width = 29
          Height = 27
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF009CA5AD009C949400FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF006384A500218CD6008494A500A5A59C00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0063849C00189CEF0094EFFF006BCEFF00A5ADB500FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0063849C00189CEF0094EFFF008CEFFF006BA5BD00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF006B8C
            A500189CEF0094EFFF008CEFFF006B9CBD00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00948C8C008C8484009C949400FF00FF00FF00FF003173
            A50084E7FF008CEFFF006B9CBD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF008C737B00A57B7300C6A59C00D6ADAD00C69C9C00A58484009C8484009C8C
            8C005AA5CE0073ADCE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008C73
            7300BD8C7B00E7CEB500EFE7DE00EFE7E700EFE7D600E7C6B500CEADAD00AD9C
            9C00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00AD73
            6300EFBD9400EFD6BD00EFE7CE00EFE7D600EFDECE00EFD6B500E7BDA500B59C
            9C00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0094737300D684
            5A00EFB58C00EFC69C00EFCEAD00EFD6B500EFCEAD00EFBD9C00E7AD8400D6B5
            AD009C9C9C00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF009C737300DE84
            4A00E79C6B00EFAD8400E7B58C00E7B58C00E7B58C00EFB58400F7B57B00EFC6
            AD009C9C9C00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF009C7B7300E78C
            5200F7B58400FFD6A500FFDEB500F7DEAD00F7DEAD00FFDEAD00FFCE9C00EFCE
            B500A5A5A500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00AD949400E7AD
            8C00FFDEAD00FFE7BD00FFEFC600FFEFCE00FFEFCE00FFEFBD00FFDEB500E7C6
            C600BDBDBD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BD94
            8C00FFD6AD00FFF7CE00FFF7D600FFF7DE00FFF7DE00FFF7CE00F7E7CE00BDAD
            B500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CEBD
            BD00CEADA500F7DEC600FFF7DE00FFF7EF00FFEFE700F7E7D600D6C6C600FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00CEBDBD00DEC6BD00E7CECE00E7CECE00CEBDC600FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          TabOrder = 2
          OnClick = btnProcurarBancoDestinoClick
        end
        object edtSenhaDestino: TEdit
          Left = 218
          Top = 81
          Width = 200
          Height = 19
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          PasswordChar = '*'
          TabOrder = 3
        end
        object edtUsuarioDestino: TEdit
          Left = 11
          Top = 81
          Width = 200
          Height = 19
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 4
        end
        object edtCaminhoBaseDadosDestino: TEdit
          Left = 11
          Top = 42
          Width = 592
          Height = 19
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
      end
      object gpxStatus: TGroupBox
        Left = 4
        Top = 117
        Width = 650
        Height = 304
        Caption = 'Processo '
        TabOrder = 1
        object memoScripts: TMemo
          Left = 4
          Top = 16
          Width = 636
          Height = 280
          Color = clBtnFace
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
  end
  object panBarraConfiguracao: TPanel
    Left = 0
    Top = 583
    Width = 668
    Height = 37
    Align = alBottom
    AutoSize = True
    BevelInner = bvLowered
    BorderStyle = bsSingle
    TabOrder = 1
    ExplicitTop = 603
    ExplicitWidth = 685
    object btnProximoConfiguracao: TBitBtn
      Left = 445
      Top = 2
      Width = 83
      Height = 27
      BiDiMode = bdLeftToRight
      Caption = '&Pr'#243'ximo'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000232E0000232E00000001000000010000975F29009760
        290098602A009E632A00A0642B00A0652C00A0662D00A2693200A3693200A36A
        3300AB774500A1784F00A2785000A27A5200A37A5200A47B5400B88C6100C5A1
        7E00C5A27F00C5A28000C9A88700D1B59A00CBB7A400CBB8A500CFBFAF00D1C0
        AF00E6D7C900E3D9CF00E6D9CC00E5DCD300EFE9E300F2EAE300F2EBE400F3EF
        EB00F3EFEC00F4F0ED00F6F4F100FBF9F700FBFAF800FEFEFE00FFFFFF000000
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
        0000000000000000000000000000000000000000000000000000282828282828
        2828282828282828282828282828281C19282828282828282828282828281A0A
        0117272828282828282828282828140705021728282828282828282828281B11
        0805001727282828282828282828281D11070502162828282828282828282828
        1B110805001727282828282828282828281E1204050018282828282828282828
        281F1004030E212828282828282828281F1006030B2328282828282828282820
        1005030E222828282828282828281F1006030C23282828282828282828271509
        030D22282828282828282828282825130F232828282828282828282828282826
        2428282828282828282828282828282828282828282828282828}
      Layout = blGlyphRight
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      OnClick = btnProximoConfiguracaoClick
    end
    object btnCancelarConfiguracao: TBitBtn
      Left = 577
      Top = 2
      Width = 83
      Height = 27
      Caption = '&Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000232E0000232E00000000000000000001FFFFFFFFFFFF
        FFFFFFFFFFFFF1F1F1CFCFCFAFAFAFB1B1B1B3B3B3B5B5B5D5D5D5F3F3F3FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6C6C6939393A4A4A4B2B2B2BC
        BCBCC5C5C5CECECEBFBFBFA7A7A7D1D1D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        B6B6B69E9E9EC2C2C2B0B0BB7B7BBE6F6FC87878D29A9ADEDFDFEAEFEFEFBBBB
        BBC8C8C8FFFFFFFFFFFFFFFFFFC3C3C39E9E9ED1D1D17F7FC11414BA0E0EC015
        15C71D1DD02727DB3D3DE8B1B1F5FCFCFCBBBBBBD1D1D1FFFFFFF0F0F08D8D8D
        D7D7D78585C70505B67575D83C3CCC1515C71D1DD04F4FE18C8CF33D3DF4B1B1
        F5EFEFEFA7A7A7F3F3F3CACACAB1B1B1D1D1DC0F0FB57272D5FFFFFFF0F0FB40
        40D14545D7F1F1FCFFFFFF8C8CF33D3DE8E0E0EBBFBFBFD5D5D5A5A5A5D2D2D2
        8F8FD10202B23333C2EFEFFAFFFFFFF0F0FBF0F0FCFFFFFFF1F1FC4F4FE12727
        DB9A9ADECECECEB5B5B5A5A5A5D5D5D58686D20606B30303B33434C3F0F0FBFF
        FFFFFFFFFFF0F0FC4545D71D1DD01D1DD07979D2C5C5C5B3B3B3A5A5A5D8D8D8
        9C9CDA4242C51A1AB93333C2EFEFFBFFFFFFFFFFFFF0F0FB4040D11515C71515
        C76F6FC8BCBCBCB1B1B1A5A5A5DCDCDCB5B5E24949C76767D0F3F3FBFFFFFFEF
        EFFBF0F0FBFFFFFFF0F0FB3C3CCC0E0EC07C7CBEB3B3B3AFAFAFCACACABBBBBB
        ECECF45858CB9999DFFFFFFFF3F3FB5F5FCF5D5DCFF3F3FBFFFFFF8383DC2D2D
        C1AFAFBAA4A4A4CFCFCFF0F0F08F8F8FF5F5F5B8B8E54E4EC89999DF6767D03F
        3FC53C3CC45F5FCF9090DE3838C59191C6C2C2C2939393F1F1F1FFFFFFC3C3C3
        A5A5A5FCFCFCB8B8E55858CB4949C74646C64343C54040C54848C69A9ACDD0D0
        D09D9D9DC6C6C6FFFFFFFFFFFFFFFFFFB4B4B4A5A5A5F5F5F5ECECF4B5B5E29C
        9CDA9898D7A8A8D8D5D5DDD7D7D79E9E9EB6B6B6FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFC3C3C38F8F8FBABABADCDCDCD8D8D8D5D5D5D2D2D2B1B1B18D8D8DC3C3
        C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0CACACAA5A5A5A5
        A5A5A5A5A5A5A5A5CACACAF0F0F0FFFFFFFFFFFFFFFFFFFFFFFF}
      ParentFont = False
      TabOrder = 1
      OnClick = btnCancelarConfiguracaoClick
    end
    object btnCompatibilizar: TBitBtn
      Left = 445
      Top = 2
      Width = 124
      Height = 29
      BiDiMode = bdLeftToRight
      Caption = '&Compatibilizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFCFCFCFAFAFAF8F8F8F8F8F8F8F8F8F8F8F8FAFAFAFCFCFCFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAF4F4F4ECECECE6E6E6E0E0E0DC
        DCDCDCDCDCE0E0E0E6E6E6ECECECF4F4F4FAFAFAFFFFFFFFFFFFFFFFFFFFFFFF
        FAFAFAF4F4F4ECECECE8E8E897BCAA56A585C0CDC6E0E0E0E6E6E6ECECECF4F4
        F4FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FAF98BBFA750AD8C3C
        A68382BCA3FAFAFAFAFAFAFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFEDF5F176B79B4BAE8D33A47E33A47E53AE8CCCE3D8FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7E8E06BB59647AF8C38A8833AA98438
        A8833FAC8879B99EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FBFA
        60AF8E43B08B3CAD8752B5945FAD8C53B6943CAD8759B695BBDACBFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0CCB859B9985CB99888C0A7EDF5F166
        B59541B28C43B38D70B89AFBFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FDFDFD91C4ADA9D0BEFFFFFFFFFFFFABD1C05EBD9D45B5905DBD9CADD2C1FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB
        FCFB71BA9B4DBB974ABA946AB899F5F9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBD9CB66C2A14DBE9861C5A3A0CC
        B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF7EC0A45AC5A252C29D6ABD9DE9F3EEFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCE3D86AC3A355C6A16DCE
        AE9ECCB7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF89C2AA72CBAB84C2A8DBEBE3FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9F4EEBDD8CBFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 2
      Visible = False
      OnClick = btnCompatibilizarClick
    end
  end
  object gboxCabecalhoConfiguracao: TGroupBox
    Left = 3
    Top = 3
    Width = 659
    Height = 37
    Color = clWhite
    ParentBackground = False
    ParentColor = False
    TabOrder = 2
    object Label2: TLabel
      Left = 11
      Top = 12
      Width = 199
      Height = 16
      Caption = 'Configura'#231#245'es Banco de Dados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 546
      Top = 12
      Width = 105
      Height = 16
      Caption = 'Visualiza'#231#227'o Scripts'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnFace
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object gboxConfiguracoes: TGroupBox
    Left = 3
    Top = 46
    Width = 659
    Height = 105
    Color = clWhite
    ParentBackground = False
    ParentColor = False
    TabOrder = 3
    object Label1: TLabel
      Left = 144
      Top = 46
      Width = 383
      Height = 19
      Caption = 'Configura'#231#227'o das Tabelas do Banco de Dados...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Image2: TImage
      Left = 592
      Top = 29
      Width = 50
      Height = 50
      Picture.Data = {
        0A544A504547496D616765C4060000FFD8FFE000104A46494600010101004800
        480000FFDB0043000604040405040605050609060506090B080606080B0C0A0A
        0B0A0A0C100C0C0C0C0C0C100C0E0F100F0E0C1313141413131C1B1B1B1C2020
        2020202020202020FFDB0043010707070D0C0D181010181A1511151A20202020
        2020202020202020202020202020202020202020202020202020202020202020
        20202020202020202020202020FFC00011080032003203011100021101031101
        FFC4001B00000105010100000000000000000000000701040506080003FFC400
        3B1000010302040403030A050500000000000201030405110006122107131431
        224151427181152333435253616291A124326492A37382B2B4C1FFC4001A0100
        02030101000000000000000000000003040001020506FFC4002B110002010204
        04050501000000000000000001020311041221311341516105223271B1234281
        A1C1F0FFDA000C03010002110311003F00D538842AB225C89151A834FD42430C
        C791CA69A63960283C96CF75D0AE7735F6B0C4295D5CCB623947A5496D3A9572
        6B7E5CF7DE747F453D3FB63790CDC48F42A4C5454A72153AFBAF466ACA2AFAA8
        25DB5F88E23812E3917ABEC7D14E6658FD996D692F77318D29FE3C0DD22F30E0
        330CC0DA5D2DD4FCF108648DBDDF36EFF8F1874D9AB8C1DE2964165D369EAC36
        DBADAA8B8D983A24249B2A2A28DD151719CACB2D58C901E55A572AB9571FEA47
        FEB3387E87A41C88FF00959E64B5346A2BE7E8BEF4F3C1AC51EA39B1906C9C92
        2488DDB52B565BDD6DB092A7AFAE29A20AE71272C450D5D34B7C93EF34027FCB
        0371990A8E61E3D384CBCD51DA4681BB23E711164BAD89120DCCC5396D6EBDCB
        E18C658ADDDD965968DC2C8D3A8F066BC204F4A8ED3CE116EAA4E0212AAFE375
        C2B296A102555EB14BA3D3DDA8D525370E130977643C48229FAF9AF9262A1072
        765AB29C92DC0BD5734D4EAD58A84FA0E5BAB54A9D25D1718982C8B00628CB61
        7147C9B35DC16DB63A94E8A82B4A514C0716FB2643AE6B6BAC4813E3C9A4D44F
        E8E24F695923FF004CB703FF006AE0CE96975AAEC45516DB319668A8A8E59ABA
        EAB2F4EBBFC7009EC1026E50E1570C9FCB546A93997213F224C28D20CE40ABC8
        A6E3424ABA5C534DD57D31CBD4210DC777A053B2047A3D35B663B52EA119A48B
        1405A04403E62F8436F630482D4A0BB4E8FD353E2C6FB9681BFED144FF00CC08
        B03B12B2C678E294C912DBEBF2F657715AA7404F1813C1E17662B7F58424B60F
        CBDB7C765D1E0D05CA53E7FC105533D4ED10BAC56690E85DA98CAA7A6B1454F7
        A2EE98E53A525C98EA9A2B39FE265BCCD9726D29E6C2A07A15C136FC5D3A826A
        E6F35366C86DB6F75C3186CF4E49EDFD0551A92B6E6687EA125FC9B98A24B739
        B329CDB91DD77EDA0AF80FDEA89BE3A58DA5976D9AB83C3D4CCBBA340E43A921
        70F72D269278869309153D9BF4E1DD5748638F188D149E2CAC9995AC9949774F
        F17525715A15BAEC88DA2F644FACF2C11AB7ECA0FF00854D198783A2FD0B354B
        A7549F382EB02EB6FCDEE2C4869C46F53D7DB964BE15BEDBA6E9DF1EC31D0E26
        1E328ABF6EBEDDCE061E792AB4F40F86DD75D4437A9B4DA95F70902E285D3C97
        49B6EFEC4B8F37F4D7DD28FF00BDD1D7F3F48B21F37CE9B0A832C6A4EC78A24C
        3BD2D220EA37A41A02AA0A9AA02E84B5CF4876EEB6C3185A6A53596EF5D64F64
        0AB4DC63AD976465E6D1D5A0E6A7CD6FCD8C9AD7D4D751AFECB8EB78C5959744
        2DE1BAA6C2DD1F3FE4CCB391B2E37982B7A657C970B974B89772517CC0D9396D
        6A73E2AA298E029248E990544CE10F3E71532BBB4EA3B94B814B7D6DCF21279C
        2D9DBB8837D25605F0EA254F3EF81DEE9B2CD3B801A0699B32A55A879B0B3BE5
        C85F28A49056AB74744B9B82A882AEB49ED2AA0A6A1FC2E97DF1D7C262A32A7C
        0A8ECB74FA310C450929F121ABE6BA8C61E72E10BA84A4D9D29FFAF8626EC5D2
        5E68ADB66DA27E9871E1719CA4A6BAE8FE50B71F0FCD38BFCAF81ABF9869D596
        A551387345EA25CF058F36B4E22F29A68F63E63E5AD7B796ABFA22E23A6E9353
        C44FD3AA8AEBF045253F2D18EFBC9943AFE41A8E5D093979E696638F8F305D6C
        174CA0224D6423BDADFCA43ECFBACB85278AE3B727B9D0A545538E5455607091
        80781F7291D346D48AE754FB8CB4A9F66CA7E69B6C985DD2804770E3C2BE1B85
        2E5B754E9FA78ECEA28C2A1CBBEA421116DB2B1034026BB978896CBD9375EAD4
        D2C6A282C61734762106B2E954B984872E1B12093B13AD81AA7F722E34A4D6C5
        34386DA6DA046DB1406C761014B227B913192C1DF1DCCD9C96DC96495B90D4C6
        91B783C263A8490B4926E974EF8253DCA678705A3479348726C9681F98043A64
        B8284EA77EC6B72C54D961371821D8843FFFD9}
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.fdb'
    Filter = 'BD - Interbase|*.gdb|Banco de dados Firebird|*.fdb'
    FilterIndex = 2
    Left = 24
    Top = 584
  end
end
