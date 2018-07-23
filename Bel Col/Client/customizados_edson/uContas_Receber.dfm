inherited frmContas_Receber: TfrmContas_Receber
  Left = 2
  Top = 105
  Caption = 'Cadastro de Contas a Receber'
  ExplicitWidth = 1400
  ExplicitHeight = 536
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    ActivePage = tbsCadastrais
    inherited tbsNavegar: TTabSheet
      ImageIndex = 14
    end
    inherited tbsCadastrais: TTabSheet
      ImageIndex = 15
      ExplicitLeft = 4
      ExplicitTop = 28
      ExplicitWidth = 1386
      ExplicitHeight = 418
      inherited scrCadastrais: TScrollBox
        VertScrollBar.Position = 30
        object Label21: TLabel
          Left = 4
          Top = -26
          Width = 56
          Height = 13
          Caption = 'Situa'#231#227'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 168
          Top = -26
          Width = 54
          Height = 13
          Caption = 'Emiss'#227'o'
          FocusControl = dbedtEmissao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 306
          Top = -26
          Width = 47
          Height = 13
          Caption = 'Prefixo'
          FocusControl = dbedtPrefixo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 360
          Top = -26
          Width = 37
          Height = 13
          Caption = 'T'#237'tulo'
          FocusControl = dbedtTitulo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 428
          Top = -26
          Width = 49
          Height = 13
          Caption = 'Parcela'
          FocusControl = dbedtParcela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 482
          Top = -26
          Width = 28
          Height = 13
          Caption = 'Tipo'
          FocusControl = dbcboTipo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 506
          Top = 94
          Width = 76
          Height = 13
          Caption = 'Vencimento'
          FocusControl = dbedtVencimento
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 644
          Top = 94
          Width = 108
          Height = 13
          Caption = 'Vencimento Real'
          FocusControl = dbedtVencimentoReal
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 782
          Top = 94
          Width = 34
          Height = 13
          Caption = 'Valor'
          FocusControl = dbedtValor
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 831
          Top = 134
          Width = 33
          Height = 14
          Caption = 'Juros'
          FocusControl = dbedtJuros
        end
        object Label11: TLabel
          Left = 694
          Top = 134
          Width = 115
          Height = 14
          Caption = 'Taxa Perman'#234'ncia'
          FocusControl = dbedtTaxaPermanencia
        end
        object Label35: TLabel
          Left = 523
          Top = 174
          Width = 35
          Height = 14
          Caption = 'Saldo'
          FocusControl = dbedtSaldo
        end
        object Label48: TLabel
          Left = 4
          Top = 14
          Width = 45
          Height = 13
          Caption = 'Cliente'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object spdClientes: TSpeedButton
          Left = 68
          Top = 29
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
          OnClick = spdClientesClick
        end
        object Label24: TLabel
          Left = 4
          Top = 94
          Width = 38
          Height = 14
          Caption = 'Banco'
        end
        object spdBancos: TSpeedButton
          Left = 190
          Top = 109
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
        object Label31: TLabel
          Left = 99
          Top = 94
          Width = 38
          Height = 14
          Caption = 'Conta'
          FocusControl = dbedtConta
        end
        object Label51: TLabel
          Left = 45
          Top = 94
          Width = 49
          Height = 14
          Caption = 'Ag'#234'ncia'
          FocusControl = dbedtAgencia
        end
        object Label30: TLabel
          Left = 384
          Top = 14
          Width = 136
          Height = 13
          Caption = 'Categoria Financeira'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object spdCategorias: TSpeedButton
          Left = 570
          Top = 29
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
          OnClick = spdCategoriasClick
        end
        object Label5: TLabel
          Left = 4
          Top = 174
          Width = 42
          Height = 14
          Caption = 'Moeda'
        end
        object spdMoedas: TSpeedButton
          Left = 68
          Top = 189
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
          OnClick = spdMoedasClick
        end
        object Label18: TLabel
          Left = 4
          Top = 134
          Width = 62
          Height = 14
          Caption = 'Acr'#233'scimo'
          FocusControl = dbedtAcrescimo
        end
        object Label19: TLabel
          Left = 142
          Top = 134
          Width = 71
          Height = 14
          Caption = 'Decr'#233'scimo'
          FocusControl = dbedtDecrescimo
        end
        object Label22: TLabel
          Left = 556
          Top = 134
          Width = 90
          Height = 14
          Caption = 'Dias Desconto'
          FocusControl = dbedtDiasDesconto
        end
        object Label25: TLabel
          Left = 418
          Top = 134
          Width = 89
          Height = 14
          Caption = 'Tipo Desconto'
        end
        object Label16: TLabel
          Left = 385
          Top = 174
          Width = 76
          Height = 14
          Caption = 'Taxa Moeda'
          FocusControl = dbedtTaxaMoeda
        end
        object Label10: TLabel
          Left = 772
          Top = -26
          Width = 83
          Height = 13
          Caption = 'Fluxo Caixa?'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label27: TLabel
          Left = 258
          Top = 54
          Width = 55
          Height = 13
          Caption = 'Vendedor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object spdVendedores: TSpeedButton
          Left = 323
          Top = 69
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
          OnClick = spdVendedoresClick
        end
        object Label28: TLabel
          Left = 638
          Top = 54
          Width = 90
          Height = 13
          Caption = 'Valor Comiss'#227'o'
          FocusControl = dbedtValorComissao
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 280
          Top = 134
          Width = 127
          Height = 14
          Caption = 'Desconto Financeiro'
          FocusControl = dbeedtDesconto
        end
        object Label29: TLabel
          Left = 4
          Top = 336
          Width = 89
          Height = 13
          Caption = 'Filial de Origem'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object dbmemObservacao: TLabel
          Left = 4
          Top = 213
          Width = 58
          Height = 13
          Caption = 'Hist'#243'rico'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label32: TLabel
          Left = 297
          Top = 336
          Width = 114
          Height = 13
          Caption = 'Empresa de Origem'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 4
          Top = 54
          Width = 122
          Height = 13
          Caption = 'Forma de Pagamento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 293
          Top = 213
          Width = 83
          Height = 13
          Caption = 'Nosso N'#250'mero'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 695
          Top = 213
          Width = 101
          Height = 13
          Caption = 'Tipo de Cobran'#231'a'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 4
          Top = 252
          Width = 50
          Height = 14
          Caption = 'Border'#244
          FocusControl = dbedtBordero
        end
        object Label17: TLabel
          Left = 143
          Top = 252
          Width = 75
          Height = 14
          Caption = 'Observa'#231#227'o'
          FocusControl = dbedtObservacao
        end
        object Label36: TLabel
          Left = 4
          Top = 294
          Width = 55
          Height = 13
          Caption = 'Valor ISS'
          FocusControl = dbedtValorISS
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label37: TLabel
          Left = 143
          Top = 294
          Width = 61
          Height = 13
          Caption = 'Valor IRRF'
          FocusControl = dbedtValorIRRF
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label38: TLabel
          Left = 832
          Top = 294
          Width = 64
          Height = 13
          Caption = 'Valor FGTS'
          FocusControl = dbedtValorFGTS
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label26: TLabel
          Left = 281
          Top = 294
          Width = 54
          Height = 13
          Caption = 'Valor PIS'
          FocusControl = dbedtValorPIS
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label39: TLabel
          Left = 419
          Top = 294
          Width = 79
          Height = 13
          Caption = 'Valor COFINS'
          FocusControl = dbedtValorCOFINS
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label40: TLabel
          Left = 555
          Top = 294
          Width = 63
          Height = 13
          Caption = 'Valor CSLL'
          FocusControl = dbedtValorCSLL
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label41: TLabel
          Left = 693
          Top = 294
          Width = 63
          Height = 13
          Caption = 'Valor INSS'
          FocusControl = dbedtValorINSS
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label42: TLabel
          Left = 921
          Top = 93
          Width = 89
          Height = 13
          Caption = 'Valor Original'
          FocusControl = dbedtValorOriginal
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label33: TLabel
          Left = 4
          Top = 376
          Width = 104
          Height = 14
          Caption = 'Centro de Custo'
          FocusControl = dbedtCC
        end
        object spdbtnCC: TSpeedButton
          Left = 156
          Top = 392
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
          OnClick = spdbtnCCClick
        end
        object Label34: TLabel
          Left = 661
          Top = 174
          Width = 95
          Height = 14
          Caption = 'Valor Desconto'
          FocusControl = dbedtValorDesconto
        end
        object Label43: TLabel
          Left = 799
          Top = 174
          Width = 106
          Height = 14
          Caption = 'Valor Taxa Perm.'
          FocusControl = dbedtValorTaxaPermanencia
        end
        object Label44: TLabel
          Left = 938
          Top = 174
          Width = 69
          Height = 14
          Caption = 'Valor Juros'
          FocusControl = dbedtValorJuros
        end
        object Label45: TLabel
          Left = 1077
          Top = 174
          Width = 70
          Height = 14
          Caption = 'Valor Multa'
          FocusControl = dbedtValorMulta
        end
        object Label46: TLabel
          Left = 1216
          Top = 174
          Width = 93
          Height = 14
          Caption = 'Valor Corrigido'
          FocusControl = dbedtValorCorrigido
        end
        object dbcboSituacao: TDBComboBox
          Left = 4
          Top = -10
          Width = 160
          Height = 22
          Hint = '|Selecione a Situa'#231#227'o do T'#237'tulo a Receber.'
          Style = csDropDownList
          DataField = 'SITUACAO'
          DataSource = dtsContas_Receber
          Enabled = False
          Items.Strings = (
            '0=Em Aberto'
            '1=Baixado Parcial'
            '2=Baixado Total'
            '')
          TabOrder = 0
        end
        object dbedtEmissao: TDBEdit
          Left = 168
          Top = -10
          Width = 134
          Height = 22
          Hint = '|Informe a Emiss'#227'o do T'#237'tulo a Receber.['
          DataField = 'EMISSAO'
          DataSource = dtsContas_Receber
          TabOrder = 1
          OnDblClick = dbedtEmissaoDblClick
        end
        object dbedtPrefixo: TDBEdit
          Left = 306
          Top = -10
          Width = 50
          Height = 22
          Hint = '|Informe o Prefixo do T'#237'tulo a Receber.'
          DataField = 'PREFIXO'
          DataSource = dtsContas_Receber
          TabOrder = 2
        end
        object dbedtTitulo: TDBEdit
          Left = 360
          Top = -10
          Width = 64
          Height = 22
          Hint = '|Informe o N'#250'mero do T'#237'tulo a Receber.'
          DataField = 'NUMERO'
          DataSource = dtsContas_Receber
          TabOrder = 3
        end
        object dbedtParcela: TDBEdit
          Left = 428
          Top = -10
          Width = 50
          Height = 22
          Hint = '|Informe a Parcela do T'#237'tulo a Receber.'
          DataField = 'PARCELA'
          DataSource = dtsContas_Receber
          TabOrder = 4
        end
        object dbcboTipo: TDBComboBox
          Left = 482
          Top = -10
          Width = 288
          Height = 22
          Hint = '|Selecione o Tipo do T'#237'tulo a Receber.'
          Style = csDropDownList
          DataField = 'TIPO'
          DataSource = dtsContas_Receber
          TabOrder = 5
        end
        object dbedtVencimento: TDBEdit
          Left = 506
          Top = 110
          Width = 134
          Height = 22
          Hint = '|Informe o Vencimento do T'#237'tulo a Receber.'
          DataField = 'VENCIMENTO'
          DataSource = dtsContas_Receber
          TabOrder = 19
          OnDblClick = dbedtVencimentoDblClick
        end
        object dbedtVencimentoReal: TDBEdit
          Left = 644
          Top = 110
          Width = 134
          Height = 22
          Hint = '|Informe o Vencimento Real do T'#237'tulo a Receber.'
          DataField = 'VENCIMENTOREAL'
          DataSource = dtsContas_Receber
          TabOrder = 20
          OnDblClick = dbedtVencimentoRealDblClick
        end
        object dbedtValor: TDBEdit
          Left = 782
          Top = 110
          Width = 134
          Height = 22
          Hint = '|Informe o Valor do T'#237'tulo a Receber.'
          DataField = 'VALOR'
          DataSource = dtsContas_Receber
          Enabled = False
          TabOrder = 21
        end
        object dbedtJuros: TDBEdit
          Left = 831
          Top = 150
          Width = 134
          Height = 22
          Hint = '|Informe os Juros do T'#237'tulo a Receber.'
          DataField = 'JUROS'
          DataSource = dtsContas_Receber
          TabOrder = 28
        end
        object dbedtTaxaPermanencia: TDBEdit
          Left = 694
          Top = 150
          Width = 134
          Height = 22
          Hint = '|Informe a Taxa de Perman'#234'ncia do T'#237'tulo a Receber.'
          DataField = 'TAXAPERMANENCIA'
          DataSource = dtsContas_Receber
          TabOrder = 27
        end
        object dbedtSaldo: TDBEdit
          Left = 523
          Top = 190
          Width = 134
          Height = 21
          Hint = '|Informe o Saldo do T'#237'tulo a Receber.'
          DataField = 'SALDO'
          DataSource = dtsContas_Receber
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 32
        end
        object dbedtCliente: TDBEdit
          Left = 4
          Top = 30
          Width = 64
          Height = 22
          Hint = '|Informe ou selecione o Cliente do T'#237'tulo a Receber.'
          DataField = 'CLIENTE'
          DataSource = dtsContas_Receber
          TabOrder = 7
        end
        object dbedtConta: TDBEdit
          Left = 99
          Top = 110
          Width = 91
          Height = 22
          Hint = '|Informe ou selecione a Conta do T'#237'tulo a Receber.'
          DataField = 'CONTA'
          DataSource = dtsContas_Receber
          Enabled = False
          TabOrder = 17
        end
        object dbedtBanco: TDBEdit
          Left = 4
          Top = 110
          Width = 41
          Height = 22
          Hint = '|Informe ou selecione o Banco do T'#237'tulo a Receber.'
          DataField = 'BANCO'
          DataSource = dtsContas_Receber
          Enabled = False
          TabOrder = 15
        end
        object dbedtAgencia: TDBEdit
          Left = 45
          Top = 110
          Width = 54
          Height = 22
          Hint = '|Informe ou selecione a Ag'#234'ncia do T'#237'tulo a Receber.'
          DataField = 'AGENCIA'
          DataSource = dtsContas_Receber
          Enabled = False
          TabOrder = 16
        end
        object dbedtCategoriaFinanceira: TDBEdit
          Left = 384
          Top = 30
          Width = 186
          Height = 22
          Hint = 
            '|Informe ou selecione a Categoria Financeira do T'#237'tulo a Receber' +
            '.'
          DataField = 'CATEGORIA'
          DataSource = dtsContas_Receber
          TabOrder = 9
        end
        object dbedtMoeda: TDBEdit
          Left = 4
          Top = 190
          Width = 64
          Height = 22
          Hint = '|Informe ou selecione a Moeda do T'#237'tulo a Receber.'
          DataField = 'MOEDA'
          DataSource = dtsContas_Receber
          TabOrder = 29
        end
        object dbedtAcrescimo: TDBEdit
          Left = 4
          Top = 150
          Width = 134
          Height = 22
          Hint = '|Informe o Acr'#233'scimo do T'#237'tulo a Receber.'
          DataField = 'ACRESCIMO'
          DataSource = dtsContas_Receber
          TabOrder = 22
        end
        object dbedtDecrescimo: TDBEdit
          Left = 142
          Top = 150
          Width = 134
          Height = 22
          Hint = '|Informe o Descr'#233'scimo do T'#237'tulo a Receber.'
          DataField = 'DECRESCIMO'
          DataSource = dtsContas_Receber
          TabOrder = 23
        end
        object dbedtDiasDesconto: TDBEdit
          Left = 556
          Top = 150
          Width = 134
          Height = 22
          Hint = '|Informe os Dias de Desconto do T'#237'tulo a Receber.'
          DataField = 'DIASDESCONTO'
          DataSource = dtsContas_Receber
          TabOrder = 26
        end
        object dbcboTipoDesconto: TDBComboBox
          Left = 418
          Top = 150
          Width = 134
          Height = 22
          Hint = '|Selecione o Tipo de Desconto do T'#237'tulo a Receber.'
          Style = csDropDownList
          DataField = 'TIPODESCONTO'
          DataSource = dtsContas_Receber
          Items.Strings = (
            '0=Proporcional'
            '1=Fixo')
          TabOrder = 25
        end
        object dbedtTaxaMoeda: TDBEdit
          Left = 385
          Top = 190
          Width = 134
          Height = 22
          Hint = '|Informe a Taxa da Moeda do T'#237'tulo a Receber.'
          DataField = 'TAXAMOEDA'
          DataSource = dtsContas_Receber
          TabOrder = 31
        end
        object dbcboFluxo: TDBComboBox
          Left = 774
          Top = -10
          Width = 134
          Height = 22
          Hint = '|Selecione o Fluxo de Caixa do T'#237'tulo a Receber.'
          Style = csDropDownList
          DataField = 'FLUXO'
          DataSource = dtsContas_Receber
          Items.Strings = (
            '0=N'#227'o'
            '1=Sim')
          TabOrder = 6
        end
        object dbedtNomeCliente: TDBEdit
          Left = 95
          Top = 30
          Width = 285
          Height = 21
          DataField = 'NOMECLIENTE'
          DataSource = dtsContas_Receber
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
        object dbedtNomeBanco: TDBEdit
          Left = 217
          Top = 110
          Width = 285
          Height = 21
          DataField = 'NOMEBANCO'
          DataSource = dtsContas_Receber
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 18
        end
        object dbedtDescricaoMoeda: TDBEdit
          Left = 96
          Top = 190
          Width = 285
          Height = 21
          DataField = 'DESCRICAOMOEDA'
          DataSource = dtsContas_Receber
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 30
        end
        object dbedtDescricaoCategoria: TDBEdit
          Left = 597
          Top = 30
          Width = 285
          Height = 21
          DataField = 'DESCRICAOCATEGORIA'
          DataSource = dtsContas_Receber
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
        object dbedtVendedor: TDBEdit
          Left = 258
          Top = 70
          Width = 64
          Height = 22
          Hint = '|Informe ou selecione o Vendedor do T'#237'tulo a Receber.'
          DataField = 'VENDEDOR'
          DataSource = dtsContas_Receber
          Enabled = False
          TabOrder = 12
        end
        object dbedtValorComissao: TDBEdit
          Left = 638
          Top = 70
          Width = 134
          Height = 22
          Hint = '|Informe o Valor da Comiss'#227'o do T'#237'tulo a Receber.'
          DataField = 'COMISSAO'
          DataSource = dtsContas_Receber
          Enabled = False
          TabOrder = 14
        end
        object dbedtNomeVendedor: TDBEdit
          Left = 350
          Top = 70
          Width = 285
          Height = 21
          DataField = 'NOMEVENDEDOR'
          DataSource = dtsContas_Receber
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 13
        end
        object dbeedtDesconto: TDBEdit
          Left = 280
          Top = 150
          Width = 134
          Height = 22
          Hint = '|Informe o Desconto Financeiro do T'#237'tulo a Receber.'
          DataField = 'DESCONTO'
          DataSource = dtsContas_Receber
          TabOrder = 24
        end
        object dbcboFilialOrigem: TDBComboBox
          Left = 4
          Top = 351
          Width = 288
          Height = 21
          Hint = '|Selecione a Filial de Origem do T'#237'tulo a Receber.'
          Style = csDropDownList
          DataField = 'FILIALORIGEM'
          DataSource = dtsContas_Receber
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 46
        end
        object dbedtHistorico: TDBEdit
          Left = 4
          Top = 229
          Width = 285
          Height = 21
          Hint = '|Informe o Hist'#243'rico do T'#237'tulo a Receber.'
          DataField = 'HISTORICO'
          DataSource = dtsContas_Receber
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 33
        end
        object dbcboEmpresaOrigem: TDBComboBox
          Left = 297
          Top = 351
          Width = 288
          Height = 21
          Hint = '|Selecione a Empresa de Origem do T'#237'tulo a Receber'
          Style = csDropDownList
          DataField = 'EMPRESAORIGEM'
          DataSource = dtsContas_Receber
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 45
        end
        object dbcboFormaPagamento: TDBComboBox
          Left = 4
          Top = 70
          Width = 250
          Height = 22
          Hint = '|Selecione a Forma de Pagamento do T'#237'tulo a Receber.'
          Style = csDropDownList
          DataField = 'FORMAPAGAMENTO'
          DataSource = dtsContas_Receber
          TabOrder = 11
        end
        object dbedtNossoNumero: TDBEdit
          Left = 293
          Top = 229
          Width = 398
          Height = 21
          Hint = '|Informe o Nosso N'#250'mero do T'#237'tulo a Receber.'
          DataField = 'NOSSONUMERO'
          DataSource = dtsContas_Receber
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 34
        end
        object dbcboTipoCobranca: TDBComboBox
          Left = 695
          Top = 229
          Width = 250
          Height = 22
          Hint = '|Selecione o Tipo de Cobran'#231'a do T'#237'tulo a Receber.'
          Style = csDropDownList
          DataField = 'TIPOCOBRANCA'
          DataSource = dtsContas_Receber
          Enabled = False
          TabOrder = 35
        end
        object dbedtBordero: TDBEdit
          Left = 4
          Top = 268
          Width = 134
          Height = 22
          Hint = '|Informe o N'#250'mero do Border'#244' do T'#237'tulo a Receber.'
          DataField = 'BORDERO'
          DataSource = dtsContas_Receber
          Enabled = False
          TabOrder = 36
        end
        object dbedtObservacao: TDBEdit
          Left = 143
          Top = 268
          Width = 562
          Height = 22
          Hint = '|Informe a Observa'#231#227'o do T'#237'tulo a Receber.'
          DataField = 'OBSERVACAO'
          DataSource = dtsContas_Receber
          TabOrder = 37
        end
        object dbedtValorISS: TDBEdit
          Left = 4
          Top = 310
          Width = 134
          Height = 22
          Hint = 'Valor do ISS para reten'#231#227'o'
          DataField = 'VALORISS'
          DataSource = dtsContas_Receber
          Enabled = False
          TabOrder = 38
        end
        object dbedtValorIRRF: TDBEdit
          Left = 143
          Top = 310
          Width = 134
          Height = 22
          Hint = 'Valor do IRRF para reten'#231#227'o'
          DataField = 'VALORIRRF'
          DataSource = dtsContas_Receber
          Enabled = False
          TabOrder = 39
        end
        object dbedtValorFGTS: TDBEdit
          Left = 832
          Top = 310
          Width = 134
          Height = 22
          Hint = 'Valor do FGTS para reten'#231#227'o'
          DataField = 'VALORFGTS'
          DataSource = dtsContas_Receber
          Enabled = False
          TabOrder = 40
        end
        object dbedtValorPIS: TDBEdit
          Left = 281
          Top = 310
          Width = 134
          Height = 22
          Hint = 'Valor do PIS para reten'#231#227'o'
          DataField = 'VALORPIS'
          DataSource = dtsContas_Receber
          Enabled = False
          TabOrder = 41
        end
        object dbedtValorCOFINS: TDBEdit
          Left = 419
          Top = 310
          Width = 134
          Height = 22
          Hint = 'Valor do COFINS para reten'#231#227'o'
          DataField = 'VALORCOFINS'
          DataSource = dtsContas_Receber
          Enabled = False
          TabOrder = 42
        end
        object dbedtValorCSLL: TDBEdit
          Left = 555
          Top = 310
          Width = 134
          Height = 22
          Hint = 'Valor do CSLL para reten'#231#227'o'
          DataField = 'VALORCSLL'
          DataSource = dtsContas_Receber
          Enabled = False
          TabOrder = 43
        end
        object dbedtValorINSS: TDBEdit
          Left = 693
          Top = 310
          Width = 134
          Height = 22
          Hint = 'Valor do INSS para reten'#231#227'o'
          DataField = 'VALORINSS'
          DataSource = dtsContas_Receber
          Enabled = False
          TabOrder = 44
        end
        object dbedtValorOriginal: TDBEdit
          Left = 921
          Top = 109
          Width = 134
          Height = 22
          Hint = 'Informe o Valor original do T'#237'tulo a Pagar.'
          DataField = 'VALORORIGINAL'
          DataSource = dtsContas_Receber
          Enabled = False
          TabOrder = 47
        end
        object dbedtCC: TDBEdit
          Left = 4
          Top = 392
          Width = 152
          Height = 22
          DataField = 'CC'
          DataSource = dtsContas_Receber
          TabOrder = 48
        end
        object dbedtDescricaoCC: TDBEdit
          Left = 184
          Top = 392
          Width = 329
          Height = 22
          DataField = 'DESCRICAOCC'
          DataSource = dtsContas_Receber
          Enabled = False
          TabOrder = 49
        end
        object dbedtValorDesconto: TDBEdit
          Left = 661
          Top = 189
          Width = 134
          Height = 22
          Hint = 'Informe o Valor do desconto financeiro'
          DataField = 'VALORDESCONTO'
          DataSource = dtsContas_Receber
          Enabled = False
          TabOrder = 50
        end
        object dbedtValorTaxaPermanencia: TDBEdit
          Left = 799
          Top = 189
          Width = 134
          Height = 22
          Hint = 'Informe o valor da taxa de perman'#234'ncia'
          DataField = 'VALORTAXAPERMANENCIA'
          DataSource = dtsContas_Receber
          Enabled = False
          TabOrder = 51
        end
        object dbedtValorJuros: TDBEdit
          Left = 938
          Top = 189
          Width = 134
          Height = 22
          Hint = 'Informe o valor dos juros'
          DataField = 'VALORJUROS'
          DataSource = dtsContas_Receber
          Enabled = False
          TabOrder = 52
        end
        object dbedtValorMulta: TDBEdit
          Left = 1077
          Top = 189
          Width = 134
          Height = 22
          Hint = 'Informe o valor da multa'
          DataField = 'VALORMULTA'
          DataSource = dtsContas_Receber
          Enabled = False
          TabOrder = 53
        end
        object dbedtValorCorrigido: TDBEdit
          Left = 1216
          Top = 189
          Width = 134
          Height = 22
          Hint = 'Informe o valor corrigido'
          DataField = 'VALORCORRIGIDO'
          DataSource = dtsContas_Receber
          Enabled = False
          TabOrder = 54
        end
      end
    end
    object tbsRateios: TTabSheet
      Caption = '&3-Rateios'
      ImageIndex = 16
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object dbGridRateios: TDBGrid
        Left = 0
        Top = 0
        Width = 1386
        Height = 418
        Align = alClient
        DataSource = dtsContas_Receber_Rateios
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Verdana'
        TitleFont.Style = []
        OnEditButtonClick = dbGridRateiosEditButtonClick
        OnKeyDown = dbGridKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'CATEGORIA'
            Width = 180
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAOCATEGORIA'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ReadOnly = True
            Width = 285
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PERCENTUAL'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ReadOnly = True
            Width = 134
            Visible = True
          end>
      end
    end
    object tbsCobrancas: TTabSheet
      Caption = '&4-Hist'#243'rico de Cobran'#231'as'
      ImageIndex = 17
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object scrCobrancas: TScrollBox
        Left = 0
        Top = 0
        Width = 1386
        Height = 418
        Align = alClient
        TabOrder = 0
        object dbgridCobrancas: TDBGrid
          Left = 0
          Top = 0
          Width = 1382
          Height = 414
          Align = alClient
          DataSource = dtsContas_Receber_Cobrancas
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
          OnDblClick = dbGridDblClick
          OnEditButtonClick = dbgridCobrancasEditButtonClick
          OnKeyDown = dbGridKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'SEQUENCIA'
              ReadOnly = True
              Title.Caption = 'Seq'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 30
              Visible = True
            end
            item
              ButtonStyle = cbsEllipsis
              Expanded = False
              FieldName = 'DATA'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 134
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MOTIVO'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 360
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROVIDENCIA'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 360
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'USUARIO'
              ReadOnly = True
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 60
              Visible = True
            end>
        end
      end
    end
  end
  inherited cbToolBar: TCoolBar
    Bands = <
      item
        Control = tbGroup1
        ImageIndex = -1
        MinHeight = 38
        Width = 108
      end
      item
        Break = False
        Control = tbGroup2
        ImageIndex = -1
        MinHeight = 38
        Width = 432
      end
      item
        Break = False
        Control = tbGroup3
        ImageIndex = -1
        MinHeight = 38
        Width = 115
      end
      item
        Break = False
        Control = tbGroup4
        ImageIndex = -1
        MinHeight = 38
        Width = 729
      end>
    inherited tbGroup2: TToolBar
      Left = 119
      Width = 419
      ExplicitLeft = 119
      ExplicitWidth = 419
    end
    inherited tbGroup1: TToolBar
      Width = 95
      ExplicitWidth = 95
    end
    inherited tbGroup3: TToolBar
      Left = 553
      Width = 102
      ExplicitLeft = 553
      ExplicitWidth = 102
    end
    inherited tbGroup4: TToolBar
      Left = 670
      Width = 720
      ExplicitLeft = 670
      ExplicitWidth = 720
      object btnSeparador1: TToolButton
        Left = 240
        Top = 0
        Width = 8
        CustomHint = bhToolBar
        Caption = 'btnSeparador1'
        ImageIndex = 19
        Style = tbsSeparator
      end
      object btnProjetar: TToolButton
        Left = 248
        Top = 0
        CustomHint = bhToolBar
        Action = actProjetar
      end
      object ToolButton9: TToolButton
        Left = 288
        Top = 0
        Width = 8
        CustomHint = bhToolBar
        Caption = 'ToolButton9'
        ImageIndex = 0
        Style = tbsSeparator
      end
      object btnImprimir_Boleto: TToolButton
        Left = 296
        Top = 0
        CustomHint = bhToolBar
        Action = actImprimir_Boleto
      end
    end
  end
  inherited ppmToolBar: TPopupMenu
    Left = 140
  end
  inherited imgLegendas: TImageList
    Left = 60
    Top = 336
    Bitmap = {
      494C01010E00FC02FC0210001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
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
      0000000000000000000000000000008200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008284000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000820000008200000082000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000828400008284000082840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000082000000820000008200000082000000820000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000082840000828400008284000082840000828400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008200000082000000820000008200000082000000820000008200000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008284000082840000828400008284000082840000828400008284000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000082
      0000008200000082000000820000008200000082000000820000008200000082
      0000000000000000000000000000000000000000000000000000000000000082
      8400008284000082840000828400008284000082840000828400008284000082
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008200000082
      0000008200000082000000820000008200000082000000820000008200000082
      0000008200000000000000000000000000000000000000000000008284000082
      8400008284000082840000828400008284000082840000828400008284000082
      8400008284000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000820000008200000082
      0000008200000082000000820000008200000082000000820000008200000082
      0000008200000082000000000000000000000000000000828400008284000082
      8400008284000082840000828400008284000082840000828400008284000082
      8400008284000082840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008200000082
      0000008200000082000000820000008200000082000000820000008200000082
      0000008200000000000000000000000000000000000000000000008284000082
      8400008284000082840000828400008284000082840000828400008284000082
      8400008284000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000082
      0000008200000082000000820000008200000082000000820000008200000082
      0000000000000000000000000000000000000000000000000000000000000082
      8400008284000082840000828400008284000082840000828400008284000082
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008200000082000000820000008200000082000000820000008200000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008284000082840000828400008284000082840000828400008284000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000082000000820000008200000082000000820000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000082840000828400008284000082840000828400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000820000008200000082000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000828400008284000082840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008284000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840084000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C3C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084008400840084008400840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C3C600C6C3C600C6C3C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400840084008400840084008400840084008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840084008400840084008400840084008400840084008400840084000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000840000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000008400
      8400840084008400840084008400840084008400840084008400840084008400
      840000000000000000000000000000000000000000000000000000000000C6C3
      C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3
      C600000000000000000000000000000000000000000000000000000000008400
      0000840000008400000084000000840000008400000084000000840000008400
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000840084008400
      8400840084008400840084008400840084008400840084008400840084008400
      8400840084000000000000000000000000000000000000000000C6C3C600C6C3
      C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3
      C600C6C3C6000000000000000000000000000000000000000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      000084000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000084008400840084008400
      8400840084008400840084008400840084008400840084008400840084008400
      84008400840084008400000000000000000000000000C6C3C600C6C3C600C6C3
      C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3
      C600C6C3C600C6C3C60000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      00008400000084000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000840084008400
      8400840084008400840084008400840084008400840084008400840084008400
      8400840084000000000000000000000000000000000000000000C6C3C600C6C3
      C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3
      C600C6C3C6000000000000000000000000000000000000000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000008400
      8400840084008400840084008400840084008400840084008400840084008400
      840000000000000000000000000000000000000000000000000000000000C6C3
      C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3
      C600000000000000000000000000000000000000000000000000000000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840084008400840084008400840084008400840084008400840084000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000840000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400840084008400840084008400840084008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084008400840084008400840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C3C600C6C3C600C6C3C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840084000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C3C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000000000000000000000000000000000
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
      0000000000000000000000000000000084000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848284000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008400000084000000840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084828400848284008482840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF00FF00FF00FF00FF00FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008482840084828400848284008482840084828400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000084000000840000008400000084000000840000008400000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848284008482840084828400848284008482840084828400848284000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      8400000084000000840000008400000084000000840000008400000084000000
      840000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000008482
      8400848284008482840084828400848284008482840084828400848284008482
      840000000000000000000000000000000000000000000000000000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00000000000000000000000000000000000000000000000000000084000000
      8400000084000000840000008400000084000000840000008400000084000000
      8400000084000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF00000000000000000000000000000000000000000000848284008482
      8400848284008482840084828400848284008482840084828400848284008482
      8400848284000000000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF000000000000000000000000000000000000008400000084000000
      8400000084000000840000008400000084000000840000008400000084000000
      84000000840000008400000000000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000084828400848284008482
      8400848284008482840084828400848284008482840084828400848284008482
      84008482840084828400000000000000000000000000FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000000000000000000000000000000000000084000000
      8400000084000000840000008400000084000000840000008400000084000000
      8400000084000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF00000000000000000000000000000000000000000000848284008482
      8400848284008482840084828400848284008482840084828400848284008482
      8400848284000000000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF000000000000000000000000000000000000000000000000000000
      8400000084000000840000008400000084000000840000008400000084000000
      840000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000008482
      8400848284008482840084828400848284008482840084828400848284008482
      840000000000000000000000000000000000000000000000000000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000084000000840000008400000084000000840000008400000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848284008482840084828400848284008482840084828400848284000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008482840084828400848284008482840084828400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008400000084000000840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084828400848284008482840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF00FF00FF00FF00FF00FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000084000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848284000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF00FF000000000000000000000000000000
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
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000000000000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000000000000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF00000000000000000000000000000000
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
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FEFFFEFF00000000
      FC7FFC7F00000000F83FF83F00000000F01FF01F00000000E00FE00F00000000
      C007C00700000000800380030000000000010001000000008003800300000000
      C007C00700000000E00FE00F00000000F01FF01F00000000F83FF83F00000000
      FC7FFC7F00000000FEFFFEFF00000000FFFFFFFFFFFFFFFFFEFFFEFFFEFFFEFF
      FC7FFC7FFC7FFC7FF83FF83FF83FF83FF01FF01FF01FF01FE00FE00FE00FE00F
      C007C007C007C007800380038003800300010001000100018003800380038003
      C007C007C007C007E00FE00FE00FE00FF01FF01FF01FF01FF83FF83FF83FF83F
      FC7FFC7FFC7FFC7FFEFFFEFFFEFFFEFFFFFFFFFFFFFFFFFFFEFFFEFFFEFFFEFF
      FC7FFC7FFC7FFC7FF83FF83FF83FF83FF01FF01FF01FF01FE00FE00FE00FE00F
      C007C007C007C007800380038003800300010001000100018003800380038003
      C007C007C007C007E00FE00FE00FE00FF01FF01FF01FF01FF83FF83FF83FF83F
      FC7FFC7FFC7FFC7FFEFFFEFFFEFFFEFFFFFFFFFFFFFFFFFFFEFFFEFFFEFFFEFF
      FC7FFC7FFC7FFC7FF83FF83FF83FF83FF01FF01FF01FF01FE00FE00FE00FE00F
      C007C007C007C007800380038003800300010001000100018003800380038003
      C007C007C007C007E00FE00FE00FE00FF01FF01FF01FF01FF83FF83FF83FF83F
      FC7FFC7FFC7FFC7FFEFFFEFFFEFFFEFF00000000000000000000000000000000
      000000000000}
  end
  object dtsContas_Receber: TDataSource [6]
    DataSet = cdsContas_Receber
    OnDataChange = dtsContas_ReceberDataChange
    Left = 716
    Top = 436
  end
  object cdsContas_Receber_Rateios: TClientDataSet [7]
    Aggregates = <>
    DataSetField = cdsContas_RecebersqlContas_Receber_Rateios
    Params = <>
    BeforePost = cdsContas_Receber_RateiosBeforePost
    BeforeDelete = cdsContas_Receber_RateiosBeforeDelete
    OnDeleteError = cdsContas_Receber_RateiosDeleteError
    OnEditError = cdsContas_Receber_RateiosEditError
    OnNewRecord = cdsContas_Receber_RateiosNewRecord
    OnPostError = cdsContas_Receber_RateiosPostError
    OnReconcileError = cdsContas_Receber_RateiosReconcileError
    Left = 748
    Top = 388
    object cdsContas_Receber_RateiosEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object cdsContas_Receber_RateiosFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsContas_Receber_RateiosPREFIXO: TStringField
      DisplayLabel = 'Prefixo'
      FieldName = 'PREFIXO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsContas_Receber_RateiosNUMERO: TIntegerField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsContas_Receber_RateiosPARCELA: TIntegerField
      DisplayLabel = 'Parcela'
      FieldName = 'PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsContas_Receber_RateiosTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdsContas_Receber_RateiosCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsContas_Receber_RateiosCATEGORIA: TStringField
      DisplayLabel = 'Categoria'
      FieldName = 'CATEGORIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      OnValidate = cdsContas_Receber_RateiosCATEGORIAValidate
      Size = 15
    end
    object cdsContas_Receber_RateiosDESCRICAOCATEGORIA: TStringField
      DisplayLabel = 'Descri'#231#227'o da Categoria'
      FieldKind = fkInternalCalc
      FieldName = 'DESCRICAOCATEGORIA'
      Size = 25
    end
    object cdsContas_Receber_RateiosVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      currency = True
    end
    object cdsContas_Receber_RateiosPERCENTUAL: TFloatField
      DisplayLabel = 'Percentual'
      FieldName = 'PERCENTUAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      OnValidate = cdsContas_Receber_RateiosPERCENTUALValidate
      DisplayFormat = '#0.0000%'
      EditFormat = '0.0000'
    end
    object cdsContas_Receber_RateiosDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data da Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dtsContas_Receber_Rateios: TDataSource [8]
    DataSet = cdsContas_Receber_Rateios
    Left = 748
    Top = 436
  end
  object cdsContas_Receber_Cobrancas: TClientDataSet [9]
    Aggregates = <>
    DataSetField = cdsContas_RecebersqlContas_Receber_Cobrancas
    Params = <>
    BeforeInsert = cdsContas_Receber_CobrancasBeforeInsert
    BeforePost = cdsContas_Receber_CobrancasBeforePost
    BeforeDelete = cdsContas_Receber_CobrancasBeforeDelete
    OnDeleteError = cdsContas_Receber_CobrancasDeleteError
    OnEditError = cdsContas_Receber_CobrancasEditError
    OnNewRecord = cdsContas_Receber_CobrancasNewRecord
    OnPostError = cdsContas_Receber_CobrancasPostError
    OnReconcileError = cdsContas_Receber_RateiosReconcileError
    Left = 788
    Top = 388
    object cdsContas_Receber_CobrancasEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object cdsContas_Receber_CobrancasFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsContas_Receber_CobrancasPREFIXO: TStringField
      DisplayLabel = 'Prefixo'
      FieldName = 'PREFIXO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsContas_Receber_CobrancasNUMERO: TIntegerField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsContas_Receber_CobrancasPARCELA: TIntegerField
      DisplayLabel = 'Parcela'
      FieldName = 'PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsContas_Receber_CobrancasTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdsContas_Receber_CobrancasCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsContas_Receber_CobrancasSEQUENCIA: TIntegerField
      DisplayLabel = 'Sequ'#234'ncia'
      FieldName = 'SEQUENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0000'
    end
    object cdsContas_Receber_CobrancasDATA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object cdsContas_Receber_CobrancasMOTIVO: TStringField
      DisplayLabel = 'Motivo'
      FieldName = 'MOTIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 256
    end
    object cdsContas_Receber_CobrancasPROVIDENCIA: TStringField
      DisplayLabel = 'Provid'#234'ncia'
      FieldName = 'PROVIDENCIA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 256
    end
    object cdsContas_Receber_CobrancasUSUARIO: TIntegerField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsContas_Receber_CobrancasDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data da Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
  end
  object dtsContas_Receber_Cobrancas: TDataSource [10]
    DataSet = cdsContas_Receber_Cobrancas
    Left = 788
    Top = 436
  end
  inherited sdExcel: TSaveDialog
    Left = 200
    Top = 128
  end
  inherited imlEnabledLargeImages: TImageList
    Left = 56
    Top = 433
    Bitmap = {
      494C010116008C048C0420002000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000080000000C000000001002000000000000080
      010000000000000000000000000000000000000000040000000D000000150000
      0016000000160000001600000016000000160000001600000016000000160000
      0016000000160000001600000016000000160000001600000016000000160000
      0016000000160000001600000016000000160000001600000016000000160000
      0016000000160000001600000010000000050000000000000000000000000000
      0000000000000000000000000000949494FF909090FF8C8C8CFF898989FF8585
      85FF828282FF7D7D7DFF7A7A7AFF777777FF737373FF707070FF6C6C6CFF6969
      69FF656565FF626262FF5E5E5EFF5C5C5CFF5C5C5CFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000D0000002B0000003F0000
      0043000000430000004300000043000000430000004300000043000000430000
      0043000000430000004300000043000000430000004300000043000000430000
      0043000000430000004300000043000000430000004300000043000000430000
      0043000000430000004200000031000000100000000000000000000000000000
      00000000000000000000000000009C9C9CFFFCFCFCFFFBFBFBFFFAFBFBFFF9FA
      FAFFF8F9F9FFF7F8F8FFF6F7F7FFF5F6F6FFF5F6F6FFF4F5F5FFF3F4F4FFF2F3
      F3FFF1F2F2FFF0F2F2FFEFF1F1FFEEF0F0FF606060FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000001562450DC4B77E10FFB57B
      0BFFB57A0AFFB57A0AFFB57A0AFFB57A0AFFB57A0AFFB57A0AFFB57A0AFFB57A
      0AFFB57A0AFFB57A0AFFB57B0BFFB67C0BFFB97C08FF9B855FFF918B87FF8D8D
      8EFF8E8D8CFF908F8DFF92908EFF918F8DFF918F8DFF908E8CFF8F8D8BFF8E8C
      8AFF8E8B89FF8F8D8BFF838280F3000000160000000000000000000000000000
      0000000000000000000000000000A5A5A5FFFCFDFDFFEFF0F1FFEDEEEFFFEBEC
      EDFFE9EAEBFFE8E8EAFFE6E6E8FFE4E5E6FFE2E3E4FFE1E1E2FFDFDFE0FFDDDD
      DEFFDBDCDCFFDADADAFFD8D8D8FFEFF0F0FF696969FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000016B88114FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8F5FFECDECAFFD7BB91FFFAEE
      DDFFFFFFFDFFB2B1B1FFB8B7B6FFC2C2C1FFCFCDCBFFD8D7D6FFE2E1E0FFECEB
      EBFFF7F6F7FFFFFFFFFF94908EFF000000160000000000000000000000000000
      0000000000000000000000000000AEAEAEFFFDFDFDFFF0F0F2FFBFBFBFFFBFBF
      BFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBF
      BFFFBFBFBFFFBFBFBFFFD9D9D9FFEFF1F1FF727272FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000016B88113FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF9F1FFF8EDE2FFF4E8DAFFE5D1B7FFC19D
      64FFF7EBDCFFECDBC8FFC3BDB5FFB4B4B3FFC0BFBEFFCACAC8FFD4D3D3FFDEDD
      DCFFE8E7E6FFF9F8F8FF959290FF000000160000000000000000000000000000
      0000000000000000000000000000B7B7B7FFFDFDFDFFF0F1F3FFEFF0F1FFEDEE
      EFFFEBECEDFFE9EAEBFFE8E8EAFFE6E6E8FFE4E5E6FFE2E3E4FFE1E1E2FFDFDF
      E0FFDDDDDEFFDBDCDCFFDADADAFFF0F1F1FF7A7A7AFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000016BA8316FFFFFFFFFFBAB9
      B9FFBAB8B6FFB9B7B6FFB9B7B6FFBAB8B7FFBCBAB8FFBAB8B7FFB9B7B6FFB9B7
      B6FFBAB8B7FFBCBAB8FFBBBAB9FFB3AEA8FFAFA69DFFACA396FFABA094FFA689
      60FFD9C4A4FFF4E8D8FFF1DFC7FFDACCB8FFB8B6B4FFC0C0BFFFCBCBC9FFD5D4
      D3FFE0DFDEFFEEEFEEFF999593FF000000160606062F797979CFB5B5B5FFB3B3
      B3FFB0B0B0FFAEAEAEFFABABABFFBFBFBFFFFEFEFEFFF1F2F4FFF0F0F2FFEEEF
      F0FFECEDEEFFEAEBECFFE8E9EAFFE7E7E9FFE5E6E7FFE3E4E5FFE1E2E3FFE0E0
      E1FFDEDEDFFFDCDCDDFFDBDBDBFFF0F2F2FF848484FF7A7A7AFF787878FF7575
      75FF737373FF707070FF474747CF0303032F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000016BB841AFFFFFFFFFFBAB9
      B9FFFFFFFDFFFFFFFAFFFFFFFAFFFFFFFDFFBAB9B7FFFFFFFDFFFFFFFAFFFFFF
      FAFFFFFFFDFFBAB9B8FFFFFFFFFFFEF6EAFFF5E9D7FFF4E5CEFFA89C90FFE8D2
      B6FFB88F52FFF9F2E8FFF1E4D4FFEFDEC6FFE5D3BAFFC0BCB7FFC2C1C1FFCDCC
      CBFFD8D6D5FFE6E7E6FF9D9B99FF00000016A4A4A4EFC6C6C6FFE8E8E8FFFFFF
      FFFFFFFFFFFFFFFFFFFFADADADFFBFBFBFFFFEFEFEFFF2F3F5FFBFBFBFFFBFBF
      BFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBF
      BFFFBFBFBFFFBFBFBFFFDBDCDCFFF0F2F2FF8D8D8DFF7C7C7CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFA5A5A5FF5E5E5EEF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000016BD871FFFFFFFFFFFB6B6
      B6FFFFFFF7FFFFFCF4FFFFFCF4FFFFFFF7FFB5B4B3FFFFFFF7FFFFFCF4FFFFFC
      F4FFFFFFF7FFB6B4B4FFFFFFF9FFFDF3E8FFF1E4D1FFF1E1CBFFA59B8EFFEAD5
      BBFFC09964FFE1D1BBFFF6EDE1FFF0E3D2FFEEDDC5FFE9D5BAFFC1BDB9FFC4C3
      C4FFCFCECEFFDFDDDCFFA29F9DFF00000016BDBDBDFFF6F6F6FFFCFCFCFFF7F7
      F7FFF8F8F8FFFFFFFFFFAEAEAEFFBFBFBFFFFEFEFEFFFEFEFEFFFDFDFDFFFCFC
      FCFFFBFBFBFFFAFAFAFFF9FAFAFFF8F9F9FFF7F8F8FFF6F7F7FFF5F6F6FFF4F6
      F6FFF4F5F5FFF3F4F4FFF2F3F3FFF1F2F2FF969696FF7D7D7DFFFFFFFFFFD9D5
      D3FFD6D1CFFFEFECECFFFFFFFFFF6D6D6DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000016BE8922FFFFFFFFFFB5B5
      B5FFFFFFF4FFFFFBF1FFFFFBF1FFFFFFF4FFB7B4B4FFFFFFF5FFFFFBF2FFFFFB
      F2FFFFFFF5FFB7B4B4FFFFFFF6FFFCF3E6FFF4E5D2FFF3E2CCFFA59B8EFFECD8
      BDFFCFAF84FFD4BFA1FFFAF5EEFFF4EADCFFEFE2D1FFEEDDC5FFE9D5BAFFC4C0
      BAFFC7C6C5FFD6D5D5FFA6A3A1FF00000016BEBEBEFFFFFFFFFFF5F5F5FFF6F6
      F6FFF7F7F7FFFFFFFFFFAFAFAFFFACACACFFAAAAAAFFA7A7A7FFA5A5A5FFA2A2
      A2FFA0A0A0FF9D9D9DFF9A9A9AFF989898FF959595FF939393FF909090FF8E8E
      8EFF8C8C8CFF898989FF878787FF848484FF828282FF7E7E7EFFFFFFFFFFDBD7
      D6FFD8D3D1FFD4CFCDFFFFFFFFFF6F6F6FFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000016BF8A25FFFFFFFFFFB4B4
      B5FFFFFFF5FFFFFDF2FFFFFDF2FFFFFFF7FFC4B6B9FFFFFFFDFFFFFFFAFFFFFF
      FAFFFFFFFDFFC4B6B9FFFFFFF8FFFFF9EBFFFAEBD6FFF9E7D0FFA79E93FFF2DD
      C2FFDFC5A1FFBFA177FFFFFDFCFFF7F0E7FFF3E9DBFFEFE2D1FFEEDDC5FFE2D1
      BBFFBFBEBDFFCDCCCBFFAAA8A6FF00000016BFBFBFFFFFFFFFFFF5F5F5FFF6F6
      F6FFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDD9
      D8FFD9D5D4FFD6D1CFFFFFFFFFFF707070FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000016C08D2AFFFFFFFFFFB3B3
      B3FFB2B1B1FFB0AFAFFFB2AFB0FFC1B4B7FF008C56FF008C59FF008A58FF008A
      58FF008C59FF008C56FFC1B4B7FFB3B1B1FFA9A59FFFAAA39CFFAAA298FFA69D
      93FFA3988CFFB69463FFFFFFFFFFFCF8F5FFF7F1E7FFF4EBDDFFF0E3D3FFEFDE
      C6FFD6CABAFFC2C2C2FFADABAAFF00000016BFBFBFFFFFFFFFFFF5F5F5FFF5F5
      F5FFF6F6F6FFF7F7F7FFF8F8F8FFF9F9F9FFFAFAFAFFFBFBFBFFFCFCFCFFFDFD
      FDFFFEFEFEFFFEFEFEFFFCFCFCFFFBFBFBFFF9F9F9FFF7F7F7FFF6F6F6FFF4F4
      F4FFF2F2F2FFF0F0F0FFEFEFEFFFECEBEBFFE8E7E7FFE5E3E3FFE2DFDEFFDEDB
      DAFFDBD7D6FFD8D3D2FFFFFFFFFF717171FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000016C18F2EFFFFFFFFFFB0B1
      B2FFFFFEEEFFFFFBECFFFFFBEDFFFFFFF6FF008C59FF00D99FFF00D79DFF00D7
      9DFF00D99FFF008C59FFFFFFF7FFFFFCEEFFFFF5E3FFFEEED8FFA7A29BFFFAE6
      CDFFF6E2CAFFA9834CFFFFFFFFFFFFFFFFFFFFFEFEFFFBF7F0FFF7EFE4FFF2E7
      D7FFF1E0C8FFBDBCB9FFB0AEADFF00000016BFBFBFFFBDBDBDFFBBBBBBFFB8B8
      B8FFB5B5B5FFB2B2B2FFB0B0B0FFADADADFFAAAAAAFFA7A7A7FFA4A4A4FFA1A1
      A1FF9F9F9FFF9C9C9CFF999999FF969696FF949494FF909090FF8E8E8EFF8B8B
      8BFF888888FF858585FF838383FF808080FF7C7C7CFF797979FF777777FF7373
      73FF717171FF6E6E6EFF6B6B6BFF727272FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000016C39032FFFFFFFFFFADAD
      AEFFFFFAEAFFFFF6E7FFFFF6E8FFFFFDF2FF008B59FF00D19DFF00CE9CFF00CE
      9CFF00D19DFF008B59FFFFFDF2FFFFF7E8FFFFF6E7FFFFF2DDFFA5A39DFFFBE8
      D1FFF7E5CFFFCFAD82FFB88C54FFAA814AFFB88D53FFC09B6AFFC9A87CFFDCC6
      A8FFF1E3D1FFFFF2DEFFB2B1B0FF00000016BFBFBFFFFFFFFFFFF5F5F5FFF5F5
      F5FFF5F5F5FFF6F6F6FFF7F7F7FFF8F8F8FFF9F9F9FFFAFAFAFFFBFBFBFFFCFC
      FCFFFDFDFDFFFEFEFEFFFEFEFEFFFDFDFDFFFBFBFBFFF9F9F9FFF7F7F7FFF6F6
      F6FFF4F4F4FFF2F2F2FFF0F0F0FFEFEFEFFFECEBEBFFE9E7E7FFE5E3E3FFE2DF
      DEFFDEDBDAFFDBD7D6FFFFFFFFFF737373FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000016C49236FFFFFFFFFFABAC
      AEFFFFF9E7FFFFF5E4FFFFF5E5FFFFFCEEFF008B59FF00CA9FFF00C79DFF00C7
      9DFF00CA9FFF008B59FFFFFCEEFFFFF6E5FFFFF5E4FFFFF9E7FFA9A6A5FFFFEE
      D9FFFCE8D3FFFDEAD4FFFFEDD8FFA8A3A2FFF9E5CBFFEED9BEFFDFC3A1FFC59F
      6EFFBC9A6FFFF8EAD7FFB5B7B8FF00000016BFBFBFFFFFFFFFFFF5F5F5FFF5F5
      F5FFF5F5F5FFF6F6F6FFF7F7F7FFF8F8F8FFF9F9F9FFFAFAFAFFFBFBFBFFFCFC
      FCFFFDFDFDFFFEFEFEFFFFFFFFFFFDFDFDFFFCFCFCFFFAFAFAFFF8F8F8FFF6F6
      F6FFF5F5F5FFDFF4D8FFC6F4B7FFBFF4AEFFC4F2B4FFD3EDCAFFE7E5E5FFE4E1
      E1FFE0DDDCFFDDD9D8FFFFFFFFFF757575FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000016C59539FFFFFFFCFFAAAB
      ADFFFFFBE5FFFFF8E3FFFFF9E4FFFFFFEDFF008D5AFF00C6A0FF00C49FFF00C4
      9FFF00C6A0FF008D5AFFFFFFEDFFFFF9E4FFFFF8E4FFFFFDE8FFBAAEB2FFFFFB
      E8FFFFF4E2FFFFF3E0FFFFF7E3FFB6A9AAFFFFF7E1FFFFF6E2FFFFFAE7FFFFFF
      EEFFAF9F8CFFD0B088FFC0AD8EFF00000016BFBFBFFFFFFFFFFFF5F5F5FFF5F5
      F5FFF5F5F5FFF5F5F5FF757575FF787878FF7C7C7CFF808080FF838383FF8686
      86FF8A8A8AFF8D8D8DFF909090FF949494FF979797FF9A9A9AFF9D9D9DFFA1A1
      A1FF8C9F8EFF429D41FF56C042FF5ECF41FF5ECF41FF56C042FF98B893FFE5E3
      E3FFE2DFDFFFDFDBDAFFFFFFFFFF767676FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000016C7973EFFFFFFFBFFABAB
      ADFFAAAAABFFA7A8AAFFA9A8AAFFB8ACB0FF008E58FF008E5BFF008C5AFF008C
      5AFF008E5BFF008E58FFB8ACB0FFA9A8AAFFA9A8AAFFB8ACB1FF008D58FF008D
      5BFF008B5AFF008B5AFF008D5CFF008E59FFB8ACAFFFA9A8AAFFA8A9AAFFABAC
      ACFFADAFB2FFEAD2B5FFC7973FFF00000016BFBFBFFFFFFFFFFFF5F5F5FFF5F5
      F5FFF5F5F5FFF5F5F5FF737373FFB0A197FFB2A49AFFB4A79DFFB6AAA1FFB8AD
      A4FFBAB0A7FFBCB2ABFFBEB5AEFFC1B8B1FFC3BBB5FFC5BEB8FFC7C0BBFFC9C3
      BFFFA4CA95FF4ED431FF5DE139FF69EC3BFF69EC3BFF5DE139FF8FCD7DFFE7E5
      E5FFE4E2E1FFE0DDDCFFFFFFFFFF777777FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000016C89841FFFFFFFAFFA7A7
      AAFFFFF8E0FFFFF5DFFFFFF5DFFFFFF9E3FFB6AAAFFFFFFCE8FFFFF8E6FFFFF8
      E6FFFFFCE8FFB6AAAFFFFFF9E3FFFFF5DFFFFFF5E0FFFFFBE8FF008D5BFF00D9
      9FFF00D79EFF00D79EFF00D99FFF008D5BFFFFFBE8FFFFF6E0FFFFF5DEFFFFF8
      E0FFA8A9AAFFFFF8E9FFC59647FF00000016BFBFBFFFFFFFFFFFF5F5F5FFF5F5
      F5FFF5F5F5FFF5F5F5FF717171FF747474FF787878FF7B7B7BFF7E7E7EFF8282
      82FF868686FF898989FF8C8C8CFF909090FF939393FF969696FF999999FF9D9D
      9DFF889F88FF429D41FF56C042FF5BC942FF5BC942FF56C042FF90C286FFE9E8
      E7FFE5E4E3FFE2DFDFFFFFFFFFFF787878FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000016C99A46FFFFFFF8FFA3A4
      A6FFFFF4DBFFFFF0D9FFFFF0D9FFFFF4DCFFA4A4A6FFFFF5DCFFFFF1DAFFFFF1
      DAFFFFF5DCFFA4A4A6FFFFF4DCFFFFF0D9FFFFF0DAFFFFF7E2FF008B5AFF00D1
      9EFF00CE9CFF00CE9CFF00D19EFF008B5AFFFFF7E2FFFFF0DAFFFFF0D9FFFFF4
      DBFFA3A4A7FFFFFFF9FFC99B46FF00000016BFBFBFFFFFFFFFFFF5F5F5FFF5F5
      F5FFF5F5F5FFF5F5F5FFF5F5F5FFF6F6F6FFF7F7F7FFF8F8F8FFF9F9F9FFFAFA
      FAFFFBFBFBFFFCFCFCFFFDFDFDFFFEFEFEFFFFFFFFFFFDFDFDFFFCFCFCFFFAFA
      FAFFF2F8F1FFCEF8C0FFC7F7B8FFC6F6B7FFC5F4B6FFC4F4B5FFDBF0D4FFEAEA
      EAFFE7E6E5FFE4E2E1FFFFFFFFFF797979FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000016CB9B49FFFFFFF7FFA2A3
      A6FFFFF3D7FFFFEFD5FFFFEFD5FFFFF3D8FFA1A2A5FFFFF3D8FFFFEFD5FFFFEF
      D5FFFFF3D8FFA1A2A5FFFFF3D8FFFFEFD5FFFFF0D6FFFFF6DFFF008C5AFF00CA
      9FFF00C79DFF00C79DFF00CA9FFF008C5AFFFFF6DFFFFFF0D6FFFFEFD6FFFFF3
      D7FFA2A3A6FFFFFFF7FFCB9C49FF00000016A7A7A7EFF7F7F7FFFBFBFBFFF5F5
      F5FFF5F5F5FFF5F5F5FFF5F5F5FFF5F5F5FFF6F6F6FFF7F7F7FFF8F8F8FFF9F9
      F9FFFAFAFAFFFBFBFBFFFCFCFCFFFDFDFDFFFEFEFEFFFEFEFEFFFDFDFDFFFBFB
      FBFFF9F9F9FFF1F7EFFFECF7E9FFE9F5E5FFE8F3E5FFEBF2EAFFEFEFEFFFECEC
      ECFFE9E8E7FFF5F5F4FFEFEFEFFF6A6A6AEF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000016CC9E4DFFFFFFF5FFA1A2
      A4FFFFF5D6FFFFF2D5FFFFF2D5FFFFF6D7FFA2A3A5FFFFF6D7FFFFF2D5FFFFF2
      D5FFFFF6D7FFA2A3A5FFFFF6D7FFFFF2D5FFFFF3D6FFFFF8DDFF008E5CFF00C6
      A1FF00C49FFF00C49FFF00C6A1FF008E5CFFFFF8DDFFFFF3D6FFFFF2D5FFFFF5
      D6FFA1A2A4FFFFFFF5FFCC9E4DFF000000162F2F2F7FCBCBCBFFEBEBEBFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFD8D8D8FF979797FF1E1E1E7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000016CEA051FFFFFFF4FFA1A2
      A4FFA0A1A4FF9E9FA3FF9E9FA3FFA1A2A4FFA5A5A6FFA1A2A4FF9E9FA3FF9E9F
      A3FFA1A2A4FFA5A5A6FFA1A2A4FF9E9FA3FFA09FA4FFAEA3A9FF008F5AFF008E
      5CFF008D5BFF008D5BFF008E5CFF008F5AFFAEA3A9FFA09FA4FF9E9FA3FFA0A1
      A4FFA1A2A4FFFFFFF4FFCEA051FF000000160000000030303080A7A7A7EFBFBF
      BFFFBBAE9FFFBBAE9FFFBBAE9FFFBAAD9DFFB7AA9AFFB5A796FFB2A492FFB0A2
      8EFFAD9F8AFFAB9C87FFA89983FFA6977EFFA3947BFFA19177FF9E8E73FF9C8B
      6FFF99896BFF978668FF948364FF928060FF8F7D5DFF8D7A59FF8D7A59FF8888
      88FF858585FF727272EF20202080000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000016CFA354FFFFFFF3FF9D9E
      A1FFFFF4D1FFFFF0D0FFFFF0D0FFFFF4D2FF9E9FA2FFFFF4D2FFFFF0D0FFFFF0
      D0FFFFF4D2FF9E9FA2FFFFF4D2FFFFF0D0FFFFF0D0FFFFF5D4FFACA1A7FFFFF6
      D8FFFFF3D6FFFFF3D6FFFFF6D8FFACA1A7FFFFF5D4FFFFF0D0FFFFF0D0FFFFF4
      D1FF9D9EA1FFFFFFF3FFCFA354FF000000160000000000000000000000000000
      0000BBAE9FFFC5C5C5FFC1C1C1FFBEBEBEFFBBBBBBFFB8B8B8FFB5B5B5FFB2B2
      B2FFAFAFAFFFABABABFFA8A8A8FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5
      A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FF8D7A59FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000016D0A459FFFFFFF2FF9A9C
      A0FFFFEFCCFFFFEBCAFFFFEBCAFFFFEFCCFF9A9CA0FFFFEFCCFFFFEBCAFFFFEB
      CAFFFFEFCCFF9A9CA0FFFFEFCCFFFFEBCAFFFFEBCAFFFFF0CDFF9C9CA1FFFFF0
      CEFFFFECCBFFFFECCBFFFFF0CEFF9C9CA1FFFFF0CDFFFFEBCAFFFFEBCAFFFFEF
      CCFF9A9CA0FFFFFFF2FFD0A459FF000000160000000000000000000000000000
      0000BBAE9FFFC6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5A5A5FF8D7A59FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000016D1A65DFFFFFFF1FF989A
      9DFFFFEDCAFFFFE9C8FFFFE9C8FFFFEDCAFF989A9EFFFFEDCAFFFFE9C8FFFFE9
      C8FFFFEDCAFF989A9EFFFFEDCAFFFFE9C8FFFFE9C8FFFFEDCAFF989A9EFFFFED
      CAFFFFE9C8FFFFE9C8FFFFEDCAFF989A9EFFFFEDCAFFFFE9C8FFFFE9C8FFFFED
      CAFF989A9DFFFFFFF1FFD1A65DFF000000160000000000000000000000000000
      0000BBAE9FFFC8C8C8FFFFFFFFFFFDFDFDFFFCFCFCFFFBFBFBFFFAFAFAFFF9F9
      F9FFF8F8F8FFF7F7F7FFF6F6F6FFF5F5F5FFF4F4F4FFF3F3F3FFF2F2F2FFF1F1
      F1FFF0F0F0FFEFEFEFFFEEEEEEFFEDEDEDFFFFFFFFFFA5A5A5FF8D7A59FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000016D3A860FFFFFFF1FF9798
      9BFFFFEFC8FFFFECC7FFFFECC7FFFFEFC9FF989A9DFFFFEFC9FFFFECC7FFFFEC
      C7FFFFEFC9FF989A9DFFFFEFC9FFFFECC7FFFFECC7FFFFEFC9FF989A9DFFFFEF
      C9FFFFECC7FFFFECC7FFFFEFC9FF989A9DFFFFEFC9FFFFECC7FFFFECC7FFFFEF
      C8FF97989BFFFFFFF1FFD3A860FF000000160000000000000000000000000000
      0000BBAE9FFFCACACAFFFFFFFFFFFFFFFFFFFEFEFEFFFDFDFDFFFCFCFCFFFBFB
      FBFFFAFAFAFFF9F9F9FFF7F7F7FFF6F6F6FFF5F5F5FFF4F4F4FFF3F3F3FFA5A5
      A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FF8E7B5AFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000016D7A962FFFFFFEDFF9897
      97FF989798FF979797FF979797FF999898FF9B9999FF999898FF979797FF9797
      97FF999898FF9B9999FF999898FF979797FF979797FF999898FF9B9999FF9998
      98FF979797FF979797FF999898FF9B9999FF999898FF979797FF979797FF9897
      98FF989797FFFFFFEDFFD7A962FF000000160000000000000000000000000000
      000000000000CBCBCBFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFDFDFDFFFCFC
      FCFFFBFBFBFFFAFAFAFFF9F9F9FFF8F8F8FFF7F7F7FFF6F6F6FFF5F5F5FFA5A5
      A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2FFA5A5A5FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000016E6AE5CFFFFFFE4FFFFFF
      E2FFFFFFE1FFFFFFE2FFFFFFE2FFFFFFE2FFFFFFE2FFFFFFE2FFFFFFE2FFFFFF
      E2FFFFFFE2FFFFFFE2FFFFFFE2FFFFFFE2FFFFFFE2FFFFFFE2FFFFFFE2FFFFFF
      E2FFFFFFE2FFFFFFE2FFFFFFE2FFFFFFE2FFFFFFE2FFFFFFE2FFFFFFE2FFFFFF
      E1FFFFFFE2FFFFFFE4FFE6AE5CFF000000160000000000000000000000000000
      000000000000CDCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
      FDFFFCFCFCFFFBFBFBFFFAFAFAFFF9F9F9FFF8F8F8FFF7F7F7FFF6F6F6FFA5A5
      A5FFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2FFA5A5A5FF3F3F3F9F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000001634A7FFFF007DFFFF007D
      FFFF007DFFFF007EFFFF007EFFFF007EFFFF007EFFFF007EFFFF007EFFFF007E
      FFFF007EFFFF007EFFFF007EFFFF007EFFFF007EFFFF007EFFFF007EFFFF007E
      FFFF007EFFFF007EFFFF007EFFFF007EFFFF007EFFFF007EFFFF007EFFFF007D
      FFFF007DFFFF007DFFFF34A7FFFF000000160000000000000000000000000000
      000000000000CFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFEFEFFFDFDFDFFFCFCFCFFFBFBFBFFFAFAFAFFF9F9F9FFF8F8F8FFA5A5
      A5FFFFFFFFFFFFFFFFFFF2F2F2FFA5A5A5FF3F3F3F9F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000001633A3FFFF97CFFFFF58B3
      FFFF5BB4FFFF5BB4FFFF5BB4FFFF5BB4FFFF5BB4FFFF5BB4FFFF5BB4FFFF5BB4
      FFFF5BB4FFFF5BB4FFFF5BB4FFFF5BB4FFFF5BB4FFFF5BB4FFFF5BB4FFFF5BB4
      FFFF5BB4FFFF5BB4FFFF5BB4FFFF5BB4FFFF5BB4FFFF5BB4FFFF5BB4FFFF5BB4
      FFFF58B3FFFF97CFFFFF33A3FFFF000000160000000000000000000000000000
      000000000000D0D0D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEFFFDFDFDFFFCFCFCFFFBFBFBFFFAFAFAFFF9F9F9FFA5A5
      A5FFFFFFFFFFF2F2F2FFA5A5A5FF3F3F3F9F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000015299DFFFFACD9FFFF3CA6
      FFFF3FA7FFFF3FA8FFFF3FA8FFFF3FA8FFFF3FA8FFFF3FA8FFFF3FA8FFFF3FA8
      FFFF3FA8FFFF3FA8FFFF3FA8FFFF3FA8FFFF3FA8FFFF3FA8FFFF3FA8FFFF3FA8
      FFFF3FA8FFFF3FA8FFFF3FA8FFFF3FA8FFFF3FA8FFFF3FA8FFFF3FA8FFFF3FA7
      FFFF3CA6FFFFACD9FFFF299DFFFF000000150000000000000000000000000000
      000000000000D2D2D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFCFCFCFFFBFBFBFFFAFAFAFFA6A6
      A6FFF2F2F2FFA5A5A5FF3F3F3F9F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000D229AFFFFB2DDFFFFAFDB
      FFFFB0DBFFFFB0DCFFFFB0DCFFFFB0DCFFFFB0DCFFFFB0DCFFFFB0DCFFFFB0DC
      FFFFB0DCFFFFB0DCFFFFB0DCFFFFB0DCFFFFB0DCFFFFB0DCFFFFB0DCFFFFB0DC
      FFFFB0DCFFFFB0DCFFFFB0DCFFFFB0DCFFFFB0DCFFFFB0DCFFFFB0DCFFFFB0DB
      FFFFAFDBFFFFB2DDFFFF229AFFFF0000000D0000000000000000000000000000
      000000000000D4D4D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8
      A8FFA5A5A5FF3F3F3F9F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000004114A7CB41C97FFFF1A96
      FFFF1A96FFFF1A96FFFF1A96FFFF1A96FFFF1A96FFFF1A96FFFF1A96FFFF1A96
      FFFF1A96FFFF1A96FFFF1A96FFFF1A96FFFF1A96FFFF1A96FFFF1A96FFFF1A96
      FFFF1A96FFFF1A96FFFF1A96FFFF1A96FFFF1A96FFFF1A96FFFF1A96FFFF1A96
      FFFF1A96FFFF1C97FFFF114A7CB4000000040000000000000000000000000000
      000000000000D5D5D5FFD2D2D2FFCFCFCFFFCCCCCCFFC9C9C9FFC6C6C6FFC3C3
      C3FFBFBFBFFFBCBCBCFFB9B9B9FFB6B6B6FFB3B3B3FFAFAFAFFFADADADFFA9A9
      A9FF4040409F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000001400100576204F
      2FD45B8D6ACB1B3E25910415095B0004012B00000008000000000000000F0000
      000E000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BFB7B0FFC0B9B2FFC1BA
      B3FFC2BBB5FFC3BDB6FFC4BEB8FFC5BFBAFFC6C0BBFFC7C2BDFFC7C2BDFFC7C2
      BDFFC7C2BDFFC7C2BDFFC7C2BDFFC7C2BDFFC7C2BDFFC7C2BDFFC7C2BDFFC7C2
      BDFFC7C2BDFFC7C2BDFFC7C2BDFF000000000000000000000002000000100000
      0024000000370000003200000020000000110000000700000002000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000050000
      0010000000160000001600000016000000160000001600000016000000160000
      0016000000160000001600000016000000160000001600000016000000160000
      0016000000160000001600000016000000160000001600000016000000160000
      00100000000500000000000000000000000006130A74125227EC0C5B25FF1C79
      3AFFC3E9CFFFDBEBE0FFBAE3C6FF9AD4AAFB5A9C6DDD204D2DAC59675FC7797A
      7BCE393A3AA21516167405050547000000220000000800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BEB6AFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFFF5F4
      F3FFEDEBEAFFE4E2E0FFC7C2BDFF00000000000000040000002100080C7A001C
      2CB4002134C200111DAA0003057B000000590000003D00000028000000140000
      0009000000010000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000100000
      0031000000420000004300000043000000430000004300000043000000430000
      0043000000430000004300000043000000430000004300000043000000430000
      0043000000430000004300000043000000430000004300000043000000420000
      003100000010000000000000000000000000134322D013682FFF176F34FF1882
      3AFFB9E5C6FF99CAADFF85CAA2FF99D2B1FFB0DBC2FFB9DEC6FFE3F0EAFFFFFF
      FFFFFFFFFFFFFFFFFFFFEFF0F0FDB4B6B6E96E706FC73435359C1212126E0404
      04410000001C0000000400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BCB4ADFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDFFFCFC
      FBFFFBFAF9FFF9F8F7FFF8F6F6FFF6F5F4FFF5F3F2FFF3F1F0FFF1EEEDFFECEA
      E8FFE8E5E2FFEDEBEAFFC7C2BDFF000000000003054B043D62D32586C5FF41A2
      E2FF42A8E8FF3599D7FF1F7DB5FC0F5682EC04293FC9000F18A8000407800000
      01600000003E0000002A000000150000000A0000000300000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000167D6B
      56F38A7760FF89765FFF89765FFF89765EFF88755DFF88745DFF88745DFF8875
      5DFF89765EFF89765EFF88755DFF88745DFF88755DFF89765EFF89765FFF8976
      5EFF88755DFF88755DFF88755DFF88755DFF89765EFF89765FFF8A7760FF7D6B
      56F3000000160000000000000000000000000B3F1CCD197337FF1E7D3EFF1B8D
      40FFB6E2C3FF8CC7A4FF81D4A6FF84DBABFF82E0ACFF79D7A4FFDBEDE5FFFFFF
      FFFFECF5EFFFF9FCFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECED
      EDFCABACADE5656666C12C2D2D940E0E0E650203023800000015000000020000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BBB3ABFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFDFD
      FCFFFCFBFBFFFAF9F9FFF9F7F7FFF7F6F5FFF6F4F3FFF4F2F1FFF3F1EFFFEFED
      EBFFECE9E7FFF5F4F3FFC7C2BDFF00000000022B44AD2784CFFF44A6EBFF4AAC
      EDFF5CA9E0FF4FB0F1FF47B4F7FF49B0EEFF3FA1DDFE2E8AC1FA155E88EC0439
      57DA001725B600090E9200000063000000490000002E0000001B0000000C0000
      0004000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000168A77
      60FFAD9988FFAB9786FFAB9785FFA99482FFA58F7BFFA38D79FFA38E79FFA590
      7CFFA89381FFA79280FFA58F7CFFAB9887FFA58F7CFFA89380FFA99583FFA892
      80FFA58F7CFFA48E7AFFA48E7AFFA58F7CFFA99482FFAB9785FFAD9988FF8A77
      60FF000000160000000000000000000000000D401DCB1D793CFF228544FF2094
      46FFB8E2C4FF85C49EFF7BD0A0FF82D8A8FF87E1AFFF86DCAEFFE7F3EEFFF1F8
      F3FF9BD3B2FFADE0C3FFB2DEC3FFBADEC7FFC1E2CCFFD7EDDDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E5E5FA9EA1A1E0575A5ABA2325
      248B0A0A0A5A0101012F0000000E000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BAB1A9FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFFCFCFCFFFBFAFAFFFAF9F8FFF8F7F6FFF7F5F4FFF5F3F2FFF4F2F0FFF2F0
      EEFFF0EDECFFFBFBFBFFC7C2BDFF00000000063A5AC2308DDAFF42A3E9FF4BA7
      E7FFE08D6EFFDA9781FFAC9598FF889CB4FF67A9D6FF5CB6EDFF56BFFCFF52BC
      F8FF42A8E2FF2E8BBFFF14557BF4083652DB01141FB200070B920002036B0000
      004C0000002D0000001400000002000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000168976
      5FFFAB9786FFA79381FFA6917EFFA08B77FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF9F8974FFBAAB9EFFFFFFFFFFF5F2F0FFFFFFFFFFB4A393FFA08A76FFB4A3
      93FFFFFFFFFFFFFFFFFFFAF8F8FFFFFFFFFFA08B77FFA6927EFFAB9786FF8976
      5FFF000000160000000000000000000000000D401ECA1F7B3DFF248946FF2398
      4AFFBBE3C7FF80C19AFF75CD9BFF7CD5A3FF80DDAAFF82D7A9FFEDF5F2FFEAF4
      EEFF75C69BFF88D8AFFF82D1A6FF77C698FF5EB981FF7CC493FFFFFFFFFFC6E5
      D2FFBCE4CCFFCEE9D8FFDDEEE2FFEDF7EFFFFDFFFEFFFFFFFFFFFFFFFFFFFFFF
      FFFFFDFEFFFFDADEDEF7969E9EE20A0B0B520000000000000000000000000000
      00000000000000000000000000000000000000000000B9B0A7FFFFFFFFFFFFFF
      FFFFFFFFFFFFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0
      A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFF3F1
      F0FFF2EFEEFFFFFFFFFFC7C2BDFF00000000063A5AC2328FDAFF41A2E9FF4AA3
      E5FFE6A992FFFEE7DDFFFAD7CBFFF0BCAAFFDB9886FFBF887BFF978F99FF77A2
      C3FF5DBCF4FF50B0E6FF438DB6FF418AB1FF31789FFC1F5D82F30B3B57E10121
      34C800060B8E0000005400000018000000020000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000168976
      5FFFAB9786FFA38F7BFFA18D79FF9B856FFFFFFFFFFF957E68FF9A846EFF9C86
      71FF9A846EFFFFFFFFFFBCAEA0FF98826CFFBCAEA0FFFFFFFFFF967E68FFFFFF
      FFFFE1DBD4FF957D66FF927963FFFFFFFFFF9B856FFFA28D79FFAB9786FF8976
      5FFF000000160000000000000000000000000E401DC8207B3FFF258A48FF269A
      4CFFBEE4C9FF7ABE95FF6FC894FF76D19DFF78D9A3FF7DD3A5FFF3F7F7FFE6F3
      EBFF77C99FFF87D9AFFF81D2A7FF75C99AFF59B47BFF81BB93FFFFFFFFFFA2D6
      B9FF83D4AAFF86D1A7FF7CC69AFF67BD85FFD5ECDCFFF7FAF8FFC7E6D3FFDAEF
      E2FFECF6EFFFFDFFFDFFFFFFFFFF1919196D00000000D2CCC7FFD1CCC6FFD1CB
      C5FFD0CBC4FFD0CAC4FFD0CAC3FFCFC9C2FFCFC8C2FFB8AEA5FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFEFEFFFDFCFCFFFBFBFAFFFAF9F8FFF8F7F6FFF7F6F5FFF5F4F3FFF4F2
      F1FFF3F0EFFFFFFFFFFFC7C2BDFF00000000063A5AC23491DBFF40A0E7FF48A1
      E4FFE6AF9AFFFEF6F1FFF6EEE8FFFAF6EFFFFFFAF6FFFEF3EBFFF9CFBEFFF3AB
      94FFDE8D74FFA7766EFF6F707BFF5F7D96FF528EAFFF4E97BDFF4C96BEFF468E
      B4FF20668DFA012033C700000055000000140000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000168976
      5FFFAC9886FF9F8C77FF9D8A75FF96826BFFFFFFFFFF958169FF9C8973FF9C89
      73FFA69482FFFFFFFFFF947E68FF99866FFF947E68FFFFFFFFFF8E7760FFFFFF
      FFFF99856EFFB4A595FFFFFFFFFFFFFFFFFF97836CFF9D8A75FFAC9886FF8976
      5FFF000000160000000000000000000000000E3F1EC6217C40FF278B49FF289B
      4EFFBFE4CBFF74BA8FFF69C38EFF6FCB96FF6FD49BFF7BCFA1FFF9FAFCFFDDF1
      E6FF85D8AFFF94DCB7FF91D9B1FF92D7AFFF84CB9FFFA5CFB2FFFFFFFFFF9AD4
      B5FF7CD4A9FF80D2A7FF71C695FF51AB70FFD6E8DBFFEAF5EFFF85D1A9FF8CD5
      ADFF81C89DFF82C899FFF4FFFAFF1313136200000000D2CDC7FFFFFFFFFFF2F0
      EEFFEEEBE8FFE9E6E3FFE4DFDBFFDED9D4FFD6D0C9FFB6ADA3FFFFFFFFFFFFFF
      FFFFFFFFFFFFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0
      A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFF5F3
      F2FFF3F1F0FFFFFFFFFFC7C2BDFF00000000063B5AC23593DCFF3D9EE7FF469F
      E3FFE7B19BFFFFF8F4FF9691CDFF9692CCFFFFFAE4FFFEEFDDFFFDEFE3FFFEF1
      E5FFFCEBE1FFD2BBB3FFB18C83FFA77469FF945F55FF805F5FFF667587FF558A
      A9FF4FA2CCFF247DADFA00070C8D000000280000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000168976
      5FFFAC9887FF9B8772FF9A8670FF937C66FFFFFFFFFF937C66FF9A8670FF9A86
      70FF937C66FFFFFFFFFF917A63FF96816BFF917A63FFFFFFFFFF8B735BFFFFFF
      FFFF97826BFF9B8770FFB2A393FFB2A494FF97826DFF9A8671FFAC9887FF8976
      5FFF000000160000000000000000000000000E3E1EC5227D41FF288C4BFF2A9C
      50FFC0E4CCFF6FB68AFF62BD87FF68C68FFF67CD92FF7BCB9EFFFBFBFDFFEEF8
      F2FFC4EAD5FFC3E7D2FFBEE5CDFFBFE6CEFFBFE6CBFFCDE6D4FFFFFFFFFF9FDD
      BEFF90DDB7FF8FD8B0FF8FD5ACFF7DC496FFE4F0E7FFE4F3EBFF7AD0A5FF82D5
      AAFF6CC492FF62B37DFFF0FCF7FF0F0F105A00000000D2CDC8FFFFFFFFFFEEEC
      E9FFEBE8E5FFE7E3E0FFE2DDD8FFD9D4CEFFD2CBC3FFB5ABA2FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFDFDFDFFFCFBFBFFFAF9F9FFF9F8F7FFF7F6F5FFF6F4
      F3FFF4F3F1FFFFFFFFFFC7C2BDFF00000000063B5AC23795DEFF3C9DE6FF449D
      E1FFE8B39EFFFFF8F3FFCAC9E0FF2F3AC6FF9390CCFF3841C9FF9792C5FFFFED
      D7FFF6DFCBFFC8B3A2FFBEADA0FFBCB3AAFFBBB1ABFFB9A29BFFB38173FFB859
      40FF82A4BAFF50BBEDFF001626B10000002F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000168976
      5FFFAD9887FF97846FFF96836EFF8F7A64FFFFFFFFFF8F7A64FF96836EFF9783
      6EFF917C66FFFFFFFFFFB5A899FF8B765FFFB5A798FFFFFFFFFF8A745DFFF2EF
      ECFFE1DAD5FF8A745DFF8C765FFF8F7963FF94806BFF96836EFFAD9887FF8976
      5FFF000000160000000000000000000000000F3E1EC4237E42FF298C4CFF2B9D
      51FFC0E5CCFF6AB285FF5CB77EFF61C087FF5EC589FF7BC79CFFFDFCFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFEFEFEFFF7FAF8FFEEF5F1FFF1F7F2FFFFFFFFFFCFED
      DCFFC7EBD7FFC0E6CFFFC2E8CFFFBDE3C9FFF4F8F4FFDDF1E7FF8DDBB5FF94DB
      B5FF91D7ADFF92CCA5FFF1FBF8FF0C0C0C5100000000D3CEC9FFFFFFFFFFF1EF
      EDFFEDEAE7FFE7E3E0FFE0DCD6FFDAD5CFFFD4CEC7FFB4AAA0FFFFFFFFFFFFFF
      FFFFFFFFFFFFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0
      A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFF7F5
      F4FFF5F4F2FFFFFFFFFFC7C2BDFF00000000063B5AC23998DFFF3B9BE6FF439C
      E0FFE8B5A0FFFFF8F3FFF9F6EDFF6D72CBFF011ADDFF4D56CBFFE3DBD9FFFEDF
      C9FFF2CFBBFFC0AD9EFFC1A997FFD0B097FFD7B69CFFDDBDA3FFE5D7C9FFEFB0
      9DFF8B97A6FF4FBBEEFF001826B20000002F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000168977
      5FFFAD9987FF93806AFF93806AFF8E7963FFFFFFFFFF8E7963FF94806AFF9581
      6BFF917C67FFA59583FFFFFFFFFFF3F0EEFFFFFFFFFFB6A99AFF8E7862FF9381
      6AFFF2F1EEFFFFFFFFFFFFFFFFFFFFFFFFFF907B65FF938069FFAD9987FF8977
      5FFF000000160000000000000000000000000F3D1FC3257E44FF2B8D4DFF2D9E
      52FFC0E5CCFF64AD7EFF55B178FF5ABA80FF56BE80FF80C59DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FBF9FFFFFFFFFFF1F9F4FFD1EDDEFFCEEA
      D9FFCBEAD7FFCEEAD7FFF1FCFAFF0A0A0A4A00000000D3CFCAFFFEFEFEFFF2F1
      EEFFEEEBE8FFE9E5E1FFE3DFDAFFDDD8D2FFD6D0CAFFB3A89EFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDFFFCFCFBFFFBFAF9FFF9F8F7FFF8F6
      F6FFF6F5F4FFFFFFFFFFC7C2BDFF00000000063B5AC23B9AE1FF3A98E4FF4199
      DFFFE9B7A1FFFFF9F5FF888AD2FF1E30D0FF5A60CAFF454EC5FFEEEAE0FFFFDD
      CAFFD5A089FF382F2DFF5A6878FFA0BEDDFFB9C9DBFFD8BAAFFFF5BB9EFFF4AE
      9AFF8999AAFF4EBAEDFF001826B20000002F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000168976
      5DFFAC9786FF8D7A63FF8E7B65FF8C7962FF8A765FFF8C7962FF8E7B65FF8F7C
      65FF8E7B64FF8B7760FF88735CFF87735BFF88735BFF8B765FFF8D7962FF8C78
      61FF88745CFF867159FF8F7A65FF88735CFF8C7862FF8D7A63FFAC9786FF8976
      5DFF000000160000000000000000000000000F3E1FC3268145FF2D8E4FFF2FA0
      54FFC1E5CCFF5FA979FF50AB71FF54B478FF4EB675FF84C49FFFFFFFFFFFF0F7
      F3FFE8F4EDFFF5FAF7FFFBFDFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7F2
      EBFFAED4B9FFBFD7C6FFD0E0D5FFE2ECE5FFF7F9F7FFFEFEFEFFFEFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFF0FCFBFF0707074100000000D4CFCBFFFDFDFDFFF4F3
      F1FFF0EEEBFFEBE8E5FFE5E2DDFFDFDBD6FFD9D3CDFFB2A69CFFFFFFFFFFFFFF
      FFFFFFFFFFFFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0
      A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFF9F8
      F7FFF7F6F5FFFFFFFFFFC6C1BCFF00000000073B5AC23D9CE2FF3997E4FF3F97
      DEFFE9B9A3FFFFF8F5FFD8D5E7FFCBC9E4FFEEEAEEFF5055C6FF9190CAFFFFF5
      E4FFDED4C7FF505A66FF74B5EAFF72BEFFFF9E889CFFC8573EFFD7522EFFE05C
      36FF86A1B4FF4CBAEDFF001826B20000002F0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000016836F
      55FFA58F7BFF816C52FF816D53FF816D53FF816C53FF816D53FF826D53FF826D
      54FF826D53FF816C53FF816B52FF806B52FF816B52FF816C53FF816D53FF816D
      53FF816C52FF806B51FF806B51FF806B52FF816C53FF816C52FFA58F7BFF836F
      55FF00000016000000000000000000000000103D1FC1278145FF2E8F50FF31A1
      57FFC1E6CDFF5AA474FF4CA76DFF51B074FF47B06EFF8BC4A2FFFFFFFFFFEBF4
      EEFFA4D8B7FFB0E1C6FF8DCCA8FF87C5A0FF94CAA9FFA9D5BAFFB6D5C0FF4B9F
      64FF148C3CFF0B6E2DFF368D52FF74AE84FFEDF0ECFFD4ECDFFFA3DCBCFFADDD
      C0FFACD9BCFFB4E0C3FFE8F7F4FF0505053A00000000D4D0CCFFFEFEFEFFF5F4
      F3FFF2F0EEFFEEEBE8FFE8E4E1FFE2DED9FFDCD6D0FFB0A59AFFFFFFFFFFFEFE
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFDFCFCFFFBFAFAFFFAF9
      F8FFF8F7F6FFFFFFFFFFC5C0BAFF00000000073B5BC23EA0E3FF3695E3FF3D95
      DDFFEABBA6FFFFF8F5FFFFFBF8FFE3EDDCFF89C786FFEFEDE7FFF0E6E4FFFFF1
      E6FFF5EADFFF96C1E9FF79BAF4FFB28F99FFFC895FFFEA7450FFD54A28FFD848
      23FFB27168FF58ABD9FF001828B3000000300000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000016B5B7
      BAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5B7
      BAFF00000016000000000000000000000000113E20C2288247FF2F9052FF34A2
      59FFC1E6CDFF54A06FFF4BA46BFF52AE73FF48AD6DFF95C7A9FFFFFFFFFFFFFF
      FFFFE1F0E7FFA0D9B9FF9FE1BFFF76CC9FFF69C594FF5AB581FF157033FF0E71
      30FF157738FF348750FF7AB18BFFDEE9E0FFFFFFFFFFBCE1CDFF78D0A4FF80D1
      A5FF67BF8BFF69BB85FFE0EFECFE0304043200000000D5D1CDFFFEFEFEFFF7F6
      F5FFC7C2BDFFC7C2BDFFC7C2BDFFC7C2BDFFC7C2BDFFAFA398FFFFFFFFFFFCFC
      FCFFFEFEFEFFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0
      A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFFBFA
      F9FFF9F8F7FFFFFFFFFFC4BEB9FF00000000083C5BC240A1E4FF3693E2FF3C92
      DCFFEABDA7FFFFF8F5FFFDFBF9FF90D398FF2EC348FFD0E5CDFFFFF6EDFFFFF2
      E9FFFDF0E3FFA2CFF7FF9B91AAFFF38863FFF9936DFFF9936EFFE46946FFD54A
      27FFD84D28FFA76861FF001A29B70000003E0000000300000000000000000000
      000000000000000000000000000000000000000000000000000000000016B0B1
      B1FFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFDFFFFFFFDFFFFFF
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFEFEFEFFFFFFFFFFB0B1
      B1FF00000016000000000000000000000000123F21C32A8349FF319153FF37A4
      5BFFC1E5CDFF4F9B69FF4AA169FF51AB72FF46A86AFF9FCCB2FFFFFFFFFFFFFF
      FFFFFFFFFFFFD1E8DAFF9AD8B5FF9EE4C1FF7BCEA3FF378B54FF237C41FF2380
      43FF368853FF529668FF94C0A1FFFFFFFFFFFFFFFFFFBDE4CFFF7ED4AAFF83D4
      A8FF73C796FF7EBF94FFD9E7E4FA0202022B00000000D5D1CEFFFFFFFFFFF9F7
      F6FFF6F5F3FFF2F0EEFFEDEAE7FFE7E3E0FFE0DCD8FFAEA296FFFFFFFFFFFAFA
      FAFFFCFCFCFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFDFDFCFFFBFB
      FAFFFAF9F9FFFFFFFFFFC3BDB7FF00000000083C5BC243A4E5FF3492E1FF3991
      DBFFEBC0ABFFFFF9F5FFC5DFC5FF69C979FF47D164FF71D081FFFEF8F5FFFEE7
      DBFFFEE5D6FFBEC3D2FFEAA787FFFBA47DFFF88F6AFFF9926DFFF9936EFFE973
      4FFFD44A27FFDB4A24FF692A1BDB070201820000002C00000008000000000000
      000000000000000000000000000000000000000000000000000000000016AFAF
      AFFFFFFFFFFFFCFBF9FFFFFFFBFF000BB6FF0011FFFF000CFFFFFFFFF9FF0003
      FFFFFFFFFBFFA8A8A7FFA7A7A7FFFFFFFFFFA7A7A7FFA9A9A9FFAAAAAAFFA8A8
      A8FFFFFFFFFFA7A7A7FFA9A9A9FFA7A7A7FFFCFCFBFFFAFAF9FFFFFFFFFFAFAF
      AFFF00000016000000000000000000000000133F22C32B844AFF339255FF39A6
      5DFFC1E5CDFF499765FF499F67FF51A970FF45A466FFA9CFB9FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFC9E6D5FF92D2ADFF338951FF1C793BFF258546FF388C
      55FF599A6DFF499E66FF4BB16BFFC3E2CBFFFFFFFFFFC8EBD9FFA5E3C3FFAAE0
      C1FFB1E4C4FFBDE4CAFFD0DFDCF70101012500000000D6D2CFFFFFFFFFFFFAF9
      F8FFC7C2BDFFC7C2BDFFC7C2BDFFC7C2BDFFC7C2BDFFADA095FFFFFFFFFFF7F7
      F7FFF9F9F9FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0
      A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFFCFC
      FCFFFBFAFAFFFFFFFFFFC2BBB5FF00000000083C5BC244A6E6FF3390E0FF388E
      DAFFEBC2ADFFFFFAF6FFECF3EBFFEBF2EBFFA9DCB1FF41D265FFD4E6D2FFFEE0
      D4FFFBB59BFFE99A80FFFBCAA2FFFECAA4FFF89974FFF8906BFFF9926DFFF993
      6EFFE46945FFD54A27FFD04927FC6E2614D70100006B0000002C000000030000
      000000000000000000000000000000000000000000000000000000000016AFAF
      AFFFFFFFFFFFF8F8F8FFFEFEFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFF
      FEFFFFFFFDFFFFFFFEFFFFFFFFFFFDFDFDFFFEFEFEFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFEFEFFFFFFFFFFFEFEFEFFFDFDFDFFF9F9F9FFF7F7F7FFFFFFFFFFAFAF
      AFFF00000016000000000000000000000000144223C52D854BFF359356FF3BA8
      5FFFC1E5CCFF459562FF4BA069FF54AA72FF46A367FFB4D3C1FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFEFF5F1FF3A8852FF117432FF1A803DFF248244FF4A90
      60FFBBD3C2FFD8EBDEFFBEE1C8FFC5E1CCFFFFFFFFFFFFFFFFFFFCFDFCFFF7FB
      F8FFF3F9F4FFF5FBF7FFC2D0CFF10101011E00000000D6D3CFFFFFFFFFFFFAFA
      F9FFF8F7F7FFF5F4F2FFF1EFECFFECE9E6FFE6E2DFFFAC9F93FFFFFFFFFFF4F4
      F4FFF6F6F6FFF9F9F9FFFAFAFAFFFCFCFCFFFEFEFEFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
      FDFFFCFBFBFFFFFFFFFFC0BAB3FF00000000083D5CC247A8E8FF318EDEFF358C
      D9FFECC4B0FFFFF9F6FFFFFDFBFFFFFCFAFFFBFBFAFFB3DEB9FF6FC97EFFE2ED
      DFFFFFFAF5FFFBE5DAFFF1AC8BFFFCCAA3FFFECAA3FFF9A17CFFF8906BFFF992
      6DFFF8936EFFE8724EFFD54A27FFD74C29FF692514D50601007F0000002B0000
      000900000000000000000000000000000000000000000000000000000016B0B0
      B0FFFFFFFFFFF5F6F5FFF9FCFDFFA65000FFDC8114FFD97C0EFFFAFFFFFFD676
      06FFFAFDFDFFA9AAAAFFABABABFFA9A9A9FFFBFBFAFFA9A9A9FFABACACFFACAC
      ACFFABABABFFA9A9A9FFFBFBFAFFA6A6A6FFF7F7F6FFF5F5F3FFFFFFFFFFB0B0
      B0FF00000016000000000000000000000000154425C82E864DFF369458FF3CA9
      60FFC0E4CBFF41935EFF4EA26BFF59AC76FF4BA46AFFBFD9CAFFFFFFFFFFFFFF
      FFFFFFFFFFFFF3F6F4FF4E9262FF0E7530FF1C823FFF238344FF44905DFF4DA1
      6CFFA5D0B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4F2E9FFDCF1E4FFDDEF
      E3FFDCEFE2FFE8F8EDFFBBC7C7ED0000001900000000D6D3D0FFFFFFFFFFFBFB
      FAFFC7C2BDFFC7C2BDFFC7C2BDFFC7C2BDFFC7C2BDFFAA9D91FFFFFFFFFFF0F0
      F0FFF3F3F3FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0
      A5FFBBB0A5FFBBB0A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFFDFDFDFFEFEDEBFFBFB8B1FF00000000083C5CC248ABE8FF308CDDFF3489
      D8FFECC7B1FFFFF9F5FFFFFDFCFFFCFBFAFFE1ECDEFFFEFBFAFFC1DDC1FFC6DB
      C0FFFFF8F3FFFFF6EFFFF6D8CAFFF1AC8BFFFED2AAFFFECAA3FFF89974FFF890
      6BFFF9926DFFF8936EFFE36844FFD54A27FFCD4927FB682311D40000006C0000
      00380000000C000000000000000000000000000000000000000000000016B0B0
      B0FFFFFFFFFFF3F2F2FFF9F8F7FFFFFFFFFFFFFFFFFFFFFFFDFFFEFEF9FFFEFE
      F9FFFBFAF7FFFBF9F9FFFCFBFBFFFBFAFAFFF9F8F8FFF9F8F8FFFBFAFAFFFCFB
      FBFFFBFAFAFFF9F8F8FFF8F7F7FFF8F7F7FFF5F3F4FFF2F1F1FFFFFFFFFFB0B0
      B0FF00000016000000000000000000000000164726CB31874EFF389559FF3DAA
      61FFBEE3CAFF3F935DFF54A772FF60B27EFF53A972FFCAE0D4FFFFFFFFFFFFFF
      FFFFF3F7F4FF599C6DFF167C38FF288B4AFF2A8A4BFF398952FF60AF80FF6EC6
      94FF4FA76EFFBBD9C4FFFFFFFFFFFFFFFFFFFFFFFFFFA9D9BDFF87D4AAFF83CD
      A2FF67BC87FF8BCEA1FFB4BBBCE70000001400000000D7D4D1FFFFFFFFFFFCFC
      FBFFFBFAF9FFF8F7F6FFF4F3F1FFF0EEECFFEBE8E4FFA99C8FFFFFFFFFFFECEC
      ECFFF0F0F0FFF2F2F2FFF5F5F5FFF7F7F7FFF9F9F9FFFBFBFBFFFDFDFDFFFEFE
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFE9E6E4FFC9C2BCFFBEB7AFFF00000000093D5CC24BADEAFF2E8ADCFF3186
      D6FFEDC9B3FFFFFAF6FFFFFDFEFFB0DAB4FF36B746FFDFEDDFFFFFFCFBFFFFFC
      FAFFFFF7F2FFFFF6EFFFFFF6EEFFF9E1D6FFF1AC8BFFFCCCA3FFFEC9A3FFF9A0
      7BFFF8906BFFF9926DFFF8926DFFE86F4BFFC85639FFBA7662FF6B5851E21514
      12A6000000430000000D0000000000000000000000000000000000000016B0B0
      B0FFFFFFFFFFF0F0EEFFFAF8F1FF000EBBFF0015FFFF000FFFFFFFFFF0FF0006
      FFFFFCFAF2FFACABAAFFACACACFFACACACFFAAAAAAFFF6F6F5FFABABABFFACAC
      ACFFAAAAAAFFF5F5F4FFAAAAAAFFA9A9A9FFF2F2F1FFEFEFEEFFFFFFFFFFB0B0
      B0FF00000016000000000000000000000000184928CD32894FFF39965BFF3DAC
      61FFC0E5CCFF3D965DFF5DB07CFF6BBC8BFF60B180FFD4E6DEFFFFFFFFFFEEF4
      EFFF68AF7CFF349051FF469D63FF46A967FF43A160FFABCBB4FF7ABF94FF5BB6
      80FF57B27AFF50A86DFFD8EBDDFFFFFFFFFFFFFFFFFF9FD7B9FF7BD3A8FF7CD0
      A2FF5FBA83FF91C8A4FFA8B0B0E10000000E00000000D7D5D2FFFFFFFFFFFDFC
      FCFFC7C2BDFFC7C2BDFFC7C2BDFFC7C2BDFFC7C2BDFFA89A8DFFFFFFFFFFE8E8
      E8FFECECECFFEEEEEEFFF1F1F1FFF4F4F4FFF6F6F6FFF8F8F8FFFAFAFAFFFCFC
      FCFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB4A99FFFBCB3ABFFC0B8
      B1FFCEC7C2FFC7C0BAFE85807AD500000000093D5CC24CAFEBFF2D88DCFF3084
      D6FFEDCBB5FFFFFAF7FFE2F0E4FF55C66AFF2DCF4FFFA1D7A8FFFFFDFCFFFFFA
      F6FFFFFCF9FFFFFAF7FFFFF6EFFFFFF6EFFFF6D6C7FFF1AC8BFFFFD1ABFFFEC9
      A2FFF89873FFF8906BFFFA906BFFDA8E73FFB6A79EFF9798ACFF5461BEFF4348
      8EF30202027B0000002D0000000300000000000000000000000000000016B0B0
      B0FFFFFFFFFFEDEDECFFF4F4F1FFFFFFFAFFFFFFFAFFFEFFF7FFF9FAF3FFF8F9
      F3FFF5F5F2FFF5F5F3FFF5F5F4FFF4F4F3FFF4F4F3FFF4F4F3FFF5F5F4FFF5F5
      F4FFF3F3F2FFF3F3F2FFF5F5F4FFF4F4F2FFEFEFEEFFEDEDECFFFFFFFFFFB0B0
      B0FF00000016000000000000000000000000194A2ACE338951FF3B975CFF3CAE
      61FFC5E8D0FF3C9A5DFF66B987FF79C699FF6FBA8EFFDEEBE5FFFFFFFFFFBFD9
      C5FF84BC94FF89B998FF86BB96FF79BF8EFFB9DBC2FFFFFFFFFFD1E5D7FF6CB0
      84FF6DB386FF66B781FF7DC390FFFAFAF9FFFFFFFFFFA5E0C2FF89D9B1FF91D8
      B1FF95D7AEFFBEE3CBFF989FA0DA0000000900000000D8D5D3FFFFFFFFFFFDFD
      FDFFFCFCFBFFFAFAF9FFF8F6F5FFF4F2F1FFEFEDEAFFA7998BFFFFFFFFFFE3E3
      E3FFE7E7E7FFEAEAEAFFEDEDEDFFF0F0F0FFF3F3F3FFF5F5F4FFF8F8F8FFFAFA
      FAFFFBFBFBFFFDFDFDFFFFFFFFFFFFFFFFFFF7F7F5FFBCB3ABFFC0B7AFFFDAD6
      D1FFECEAE8FFBBB2AAFF1211105000000000093D5CC24EB2ECFF2B87DAFF2C82
      D5FFEECDB8FFFFFBF7FFD2E7D3FFBCDDBFFF7BD48EFF4AD06AFFEFF3EEFFFDDB
      CFFFFAB69DFFFBC7B4FFFDDDD0FFFDE9DFFFFEF4ECFFF9E1D6FFF1AD8CFFFDCB
      A4FFFEC8A2FFFBA078FFD79982FFC4C2BFFF6B74C5FF2647E9FF1243FFFF0838
      FDFF040D5AD20000037A0000002700000006000000000000000000000016B0B0
      B0FFFFFFFFFFEBEAE9FFEFF1F2FFA85200FFDE8316FFDB7E11FFF1F5F7FFD879
      09FFF1F2F2FFABACACFFABABACFFF1F0EFFFABABACFFADADADFFADADAEFFACAC
      ACFFF1F0EFFFABABACFFACACADFFABABABFFEEECEBFFEBE9E8FFFFFFFFFFB0B0
      B0FF000000160000000000000000000000001A4D2BD0348A52FF3D985EFF3FB0
      64FFC8EBD3FF3C9E5FFF6BC08EFF8BD1ABFF80C49EFFE6F0ECFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FEFFFDFDFDFFFCFDFCFFF6F9F7FFFCFDFCFFFFFFFFFFD2F1E0FFCAEDD9FFCDEB
      D8FFCEEAD8FFE5F6EAFF8C9493D50000000600000000D8D6D4FFFFFFFFFFFEFE
      FEFFC7C2BDFFC7C2BDFFC7C2BDFFC7C2BDFFC7C2BDFFA6978AFFFFFFFFFFDEDE
      DEFFE2E2E2FFE6E6E6FFE9E9E9FFECECECFFEFEFEFFFF1F1F0FFF2F2F1FFF5F5
      F4FFF8F8F8FFFBFBFBFFFDFDFDFFFEFEFEFFE7E4E1FFBFB7AFFFE1DDD9FFEDEA
      E8FFB8AFA7FF4844419F0000000000000000093E5CC250B4EDFF2A85D9FF2B7E
      D3FFEECFB9FFFFFBF6FFFEFEFFFFFFFFFFFFE2F0E3FF67D683FF98DAA6FFFBF7
      F4FFFDEAE2FFFDDBCEFFFAC4AFFFF9B79EFFFAB79EFFFCCDB9FFF5D5C8FFF1B1
      91FFFFD4ABFFECBB99FFD4CCC8FF8A90CCFF3D5EF2FF365FFEFF2450FFFF1947
      FFFF0933E7FB050D56D00000005D00000019000000000000000000000016B0B0
      B0FFFFFFFFFFE8E8E5FFEEEFEBFFF9FAF3FFFDFEF4FFF9FAF0FFF3F4ECFFF3F4
      ECFFF0F0EBFFEFEFECFFEFEFEDFFEEEEEBFFEEEEEBFFF0F0EDFFF0F0EEFFF0F0
      EDFFEEEEECFFEFEFECFFEEEEECFFEDEDEBFFEAEAE8FFE7E7E5FFFFFFFFFFB0B0
      B0FF000000160000000000000000000000001B4E2CD2368B53FF3D985EFF40AD
      64FFC9EED4FF50AC71FF62C189FF9DDDBDFF90CDAEFFEAF2F1FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF7D8786D00000000200000000D9D6D5FFFFFFFFFFFFFF
      FFFFFEFEFDFFFDFCFCFFFAFAF8FFF7F6F4FFF3F1EFFFA49688FFFFFFFFFFD9D9
      D9FFDDDDDDFFE1E1E1FFE5E5E5FFE8E8E8FFEBEBEBFFEDEDECFFEFEDECFFEEED
      EBFFEDECEAFFEEECEAFFF1F0EDFFF1EFEDFFCDC8C1FFD6D0CBFFEDEAE8FFB6AC
      A3FF46433F9F000000000000000000000000093E5CC252B6EFFF2883D8FF287B
      D2FFEED1BCFFF7F4F1FFEEEEEEFFFCFBFBFFFFFFFFFFF5F8F5FF86C990FFC5DF
      C6FFFFFDFCFFFFFCF8FFFFFEFAFFFFFBF6FFFEEAE0FFFCD6C6FFFFF6F1FFF2C6
      B9FFE59672FFD5C1AFFFB1B4DEFF5E77EDFF597AFFFF496DFFFF345DFFFF1846
      FFFF0536FFFF0436FDFF03031C9B00000023000000000000000000000016B0B0
      B0FFFFFFFFFFE6E5E3FFF1EDE6FF0011BEFF0016FFFF0011FFFFFAF5E4FF0009
      FFFFF2EFE7FFAEAEACFFAEAEAEFFACACADFFECEAE9FFACACADFFAEAEAFFFAEAE
      AFFFADADAEFFACACACFFEBE9E8FFA9A9AAFFE8E6E5FFE4E3E2FFFFFFFFFFB0B0
      B0FF000000160000000000000000000000001B4D2CD2368A53FF479E66FF44AA
      67FFB9EBC7FF84C69BFF4CBC77FFA9E5C9FFA0D7BDFFD0E5DEFFDEF1EAFFDDEF
      E6FFDAEDE3FFD6EBDFFFD1E8DBFFCDE6D8FFCAE4D4FFC6E2D2FFC1E0CEFFBDDE
      CAFFB8DCC6FFB3D9C2FFA9D4BAFFA1CFB3FF95C8AAFF7EB895FFB5DAC4FF5E73
      67C11818196C1E2020710D0E0E4E0000000000000000D9D7D6FFFFFFFFFFFFFF
      FFFFC7C2BDFFC7C2BDFFC7C2BDFFC7C2BDFFC7C2BDFFA49587FFFFFFFFFFD6D6
      D6FFD7D7D7FFDCDCDCFFE0E0E0FFE4E4E4FFE8E8E7FFEAEAE8FFECEAE9FFECEA
      E7FFEBE8E6FFE8E5E2FFE5E2DDFFE1DCD8FFB8AEA5FFDBD7D2FFB4AAA0FF4642
      3E9F000000000000000000000000000000000A3E5DC254BAF0FF2781D8FF2779
      D1FFF4D5BBFFDAD7D1FFADABABFFBEBDBCFFD4D2D2FFEEECECFFF4F9F4FFE9F2
      E9FFFFFEFEFFFFFCF9FFFFFBF7FFFFF8F4FFFFF8F2FFFFF7F1FFFFF9F5FFFBD0
      BEFF9A8890FFB6B7B4FF8992DFFF7591FBFF6685FFFF5879FFFF2853FFFF1342
      FFFF1341FFFF1443FFFF0203158700000014000000000000000000000016B0B0
      B0FFFFFFFFFFE2E2E0FFE9E9E6FFF4F4EDFFF7F8EEFFF3F4EAFFEEEEE7FFEEEE
      E7FFEAEBE6FFE9EAE7FFEAEAE8FFEAEAE7FFE8E8E6FFE8E8E6FFE9E9E7FFE9E9
      E7FFE6E6E4FFE4E4E2FFE3E3E1FFE3E3E1FFE1E1DFFFE0E0DEFFFFFFFFFFB0B0
      B0FF00000016000000000000000000000000193F25BE4A9564FF4CA16AFF41A2
      64FF8CD8A4FFCFE9D8FF42BA6EFFAAE7CBFFACE7CCFFA1DEBFFF96D7B3FF8ACE
      A7FF7EC69BFF74C090FF6EBC8BFF6BBA88FF66B885FF61B580FF5BB17AFF54AE
      74FF4EAA6EFF47A669FF3DA161FF2F9754FF1D8944FF04732BFF73B28AFF1736
      218B0000000000000000000000000000000000000000DAD8D6FFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEFFFCFCFBFFFAF9F8FFF7F5F3FFA49587FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFEFEFEFFFBFBFAFFF9F8F7FFF6F5F3FFF2F1EFFFEFED
      EAFFEBE8E4FFE6E3DFFFE1DDD8FFC3BAB2FFB1A69BFFB2A79CFF45413D9F0000
      000000000000000000000000000000000000042D45AA52B7E9FF3E9DE6FF1F75
      D1FF95A6BBFFB0A69FFFCDCBCBFFDCDCDBFFCAC8C7FFBAB8B7FFBAB8B7FFC7C5
      C5FFDDDBDAFFEAE9E9FFFAF8F6FFFEFBF8FFFFFAF5FFFFF8F0FFFFF9F5FFFFD1
      BEFF7D99B6FF72AACBFF8188D2FE8FA4FCFF7A96FFFF5174FFFF2E58FFFF3259
      FFFF325BFEFF1A2D97DE0000002900000003000000000000000000000016B0B0
      B0FFFFFFFFFFDFDFDEFFE4E5E7FFA85300FFDC8319FFDA8013FFE4E8EDFFD97A
      0CFFE4E6E7FFADAEAFFFAFAFAFFFAEAFAFFFADADAEFFE6E5E3FFADADADFFABAB
      ACFFF0F0EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0B0
      B0FF000000160000000000000000000000000D241592378652FF3E965EFF43A0
      65FF5ABB7BFFDFF8E5FF94DAADFF7EDAA6FFC2EFDCFFADE5C8FFA3DEBDFF97D5
      B1FF8BCEA5FF81C79BFF7AC395FF78C193FF74BF90FF6FBC8CFF6AB987FF64B5
      82FF5EB27BFF57AE76FF4EA96EFF409F61FF2D9150FF137A37FF78B28DFF1F43
      2A960000000000000000000000000000000000000000DAD8D7FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFEFEFDFFFBFAFAFFF8F7F6FFA49587FFA49587FFA495
      87FFA49587FFA59688FFA6978AFFA7998BFFA89A8DFFA99B8EFFAA9C90FFAB9E
      91FFAC9F93FFADA095FFAEA296FFB0A59AFE7B746ECE11100F50000000000000
      000000000000000000000000000000000000000A10562175A5EF5CC3FAFF3A97
      E3FF1C75D4FF3E77B5FFD5CFCAFFD1D0D0FFD3D2D1FFDBDAD9FFDBDAD9FFD7D6
      D5FFCBC9C8FFBFBEBDFFBDBBB9FFCAC8C5FFE7E4E0FFFCF6F1FFFFFEFBFFFFD2
      BFFF829CB8FF3EA4E3FF1E3862DD5C65B2EC8BA4FFFF5678FFFF4F72FFFF5276
      FFFF3B53C7ED02030E6C0000000700000000000000000000000000000016B0B0
      B0FFFFFFFFFFDDDCDAFFE0E0E0FFE1E4E7FFE1E5EAFFE0E4E7FFDFE2E3FFE0E2
      E3FFE1E1E0FFE2E1DFFFE3E1DFFFE3E1DFFFE2E1DFFFE1E0DEFFE1E0DEFFDFDE
      DCFFFFFFFFFFCDCDCDFFA9A9A9FFAAAAAAFFA9A9A9FFA7A7A7FFFFFFFFFFB1B1
      B1FF000000100000000000000000000000000309054E307B4AFF3D925BFF459F
      65FF46A568FF8DD8A4FFF1FCF4FF7CD49DFF98DEB7FFC0EAD4FFACDFC3FF9ED6
      B4FF92CFA9FF88C89FFF82C49AFF80C398FF7AC194FF76BE90FF70BA8BFF6AB7
      86FF64B381FF5DAF7AFF54A972FF45A065FF2F9051FF127836FF75AF8BFF234A
      2E9D0000000000000000000000000000000000000000DBD9D8FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFEFEFEFFFCFCFCFFF9F9F7FFF6F4F3FFF1EEECFFEBE8
      E5FFE4E0DCFFDED9D4FFE1DCD7FFC0B7AFFFD7D1CAFFD7D1CAFFD3CCC6FFDAD6
      D2FEBEBAB7F21414135000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000200090F550F537AD73391
      C1F63FA1E0FF3B98DCFFA4AFB7FFEFECEAFFE5E5E4FFC9C9C8FFCDCCCAFFD3D2
      D1FFDBDADAFFE5E4E4FFE7E6E5FFDBDAD9FFC4C2C1FFBBB9B7FFC7C7C6FFFAD3
      C0FF819AB9FF3AA1E5FF001823B00000065A4A53A0DA809AFBFF7990F2FC4552
      A0DB0101064F000000060000000000000000000000000000000000000016B0B0
      B0FFFFFFFFFFD9D8D7FFDBDBDAFFDCDCDCFFDCDCDDFFDCDCDCFFDCDBDCFFDCDB
      DCFFDCDBDBFFDCDBDBFFDCDBDBFFDCDBDBFFDCDBDBFFDCDBDAFFDCDBDAFFDAD9
      D8FFFFFFFFFFA9A9AAFFFFFFFFFFF9F9F8FFF0EFEFFFFFFFFFFFEAEAEAFF9494
      94EA00000005000000000000000000000000000000081C4B2DD1388854FF4298
      61FF46A068FF4CAB6DFFA4E2B7FFEFFAF2FF8BD0A5FF79C898FF9DD5B4FFA1D5
      B5FF98CFACFF8DC8A2FF88C59DFF87C49CFF83C299FF7DC095FF77BC90FF71B8
      8CFF6BB586FF64B080FF5AAA76FF4AA068FF2F8D50FF0F7333FF7BB08EFF274F
      33A20000000000000000000000000000000000000000DBDAD9FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFBFAF9FFF7F6F5FFF3F1EFFFF1EF
      EEFFF3F1EFFFF7F6F4FFEBE8E6FFCDC6C1FFD9D2CDFFDFDBD6FFE6E3E2FFC5C1
      BDF552514E9F0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000002032A000B
      115804283DA10E517AD8337AA4FD7B94A1FFBCBFC0FFBBB9B8FFBCB9BAFFC2C1
      C0FFC9C8C7FFCECDCCFFD7D6D5FFDDDDDCFFE4E4E4FFE9EAEAFFB9AFACFFF7BB
      9EFF819DBAFF399FE5FF001926B20000002E0101053F20234FA10F112A820000
      023500000003000000000000000000000000000000000000000000000016B0B0
      B0FFFFFFFFFFD7D6D4FFD9D8D6FFDAD9D7FFDAD9D7FFDAD9D7FFDAD9D7FFDAD9
      D7FFDAD9D7FFDAD9D7FFDAD9D7FFDAD9D7FFDAD9D7FFDAD9D7FFD9D8D6FFD7D6
      D4FFFFFFFFFFAAAAAAFFF9F9F7FFEDECECFFFFFFFFFFE8E8E8FF8D8D8DE50000
      000500000000000000000000000000000000000000000308054A2F7547FD3B8C
      57FF439962FF459E65FF4BA96CFF8FDAA7FFE2F9E8FFCCE6D5FF9ECDAFFF88C0
      9DFF84BD99FF82BB96FF7BB891FF7BB891FF77B68FFF73B48BFF6EB187FF6AAF
      83FF64AB7DFF5DA878FF55A270FF429660FF288448FF137135FF7DB190FF345A
      3FA80000000000000000000000000000000000000000DBDADAFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFCFFFBFBFBFFFBFBFAFFFAF9
      F8FFF9F8F7FFF8F7F5FFE8E5E3FFDBD7D4FFF4F2F1FFF1F0EFFFD5D1CEFF5351
      509F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000002042D000D1665394D58C9BCB8B5FEA3A1A0FFABA9
      A7FFB3B2B1FFBBB8B7FFC0BFBEFFD5D4D4FFE6E6E6FFE8E7E6FF97989EFFAD93
      93FF6FA2CDFF399DE2FF001624AC000000270000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000016B0B0
      B0FFFFFFFFFFD5D4D1FFD6D5D3FFD7D6D4FFD7D6D4FFD7D6D4FFD7D6D4FFD7D6
      D4FFD7D6D4FFD7D6D4FFD7D6D4FFD7D6D4FFD7D6D4FFD7D6D4FFD6D5D3FFD5D4
      D1FFFFFFFFFFA9A9A9FFF0EFEFFFFFFFFFFFE7E7E7FF8D8D8DE6000000050000
      0000000000000000000000000000000000000000000000000000051009652E73
      46FB398855FF40935DFF429761FF439D63FF56B676FF8BD6A2FFB5E8C4FFC4EB
      D0FFC3E8CFFFC3E8CEFFBEE5CAFFBFE3CBFFC1E3CCFFC2E3CCFFC2E2CCFFC2E2
      CCFFBFDFCAFFBEDEC8FFBDDDC8FFBADCC5FFB6DAC3FFB3D6BFFFD4E7DAFF4B6D
      55B20000000000000000000000000000000000000000DCDBDBFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFDFDFDFFFCFCFBFFFBFA
      F9FFFAF9F8FFF8F8F6FFE1DFDCFFEDEBEAFFF9F9F7FFD6D2CFFF5351509F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000E0E0D54B1B0AFF1CFCECDFFB5B3
      B2FFA4A2A1FFA4A3A1FFADABAAFFB1B0AFFFD9D5D4FFDAD2CDFF5D93BEFF41A0
      E9FF43A1E6FF2486C5FF000B117C000000100000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000015B0B0
      B0FFFFFFFFFFCFCECCFFD1D0CDFFD2D0CEFFD2D0CEFFD2D0CEFFD2D0CEFFD2D0
      CEFFD2D0CEFFD2D0CEFFD2D0CEFFD2D0CEFFD2D0CEFFD2D0CEFFD1D0CDFFCFCE
      CCFFFFFFFFFFA7A7A7FFFFFFFFFFE8E8E8FF606060C000000004000000000000
      0000000000000000000000000000000000000000000000000000000000000205
      033A194228C3337C4CFF388653FF3D8C59FF479463FF40955EFF359756FF369F
      58FF38A259FF3AA45CFF3DA65EFF40A861FF43AB64FF46AD66FF49AE68FF4AAF
      6AFF4CB16CFF4DB16DFF4DB16CFF4CAF6BFF4AAD69FF59B375FF71B988FF2A3F
      318E0000000000000000000000000000000000000000DCDBDBFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF7F6F6FFDAD8D5FFEFEEEDFFD7D4D1FF5352519F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000005100F0F5B646262C49D9C
      9BE2D5D4D3FCD7D7D6FFCAC7C5FF7B8388F10A344DCA1B5378E22885C5FA1C6F
      A6F0033451C1000C137400000008000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000DB2B2
      B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFE9E9E9FF4E4E4EAE0000000300000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000002010503380B1D11831E422ABA285839D5255B38DD255B39DD265B
      39DE275D3AE0275F3BE228613DE428613CE428623DE628643EE727643DE72764
      3DE727643DE727653DE92A653EE92E6842EA2F6441E9102A18A4000301350000
      00000000000000000000000000000000000000000000DCDBDBFFDCDBDBFFDCDB
      DBFFDCDBDAFFDBDADAFFDBD9D9FFDBD9D8FFDAD8D8FFDAD8D7FFD9D7D6FFD9D7
      D5FFD9D6D5FFD8D6D4FFD8D5D3FF9D9C99D81414145000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000010101190505
      05351818176D424040A86E6D6BCF17191B7F0000002200030435000A10580003
      0547000000190000000200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000045757
      57B4B2B2B2FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0
      B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0
      B0FFB0B0B0FFB1B1B1FF535353B0000000040000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00050B0B0B44D8D8D8FF0101012F00000024000000190000000F000000050000
      0001000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00050B0B0B44D8D8D8FF0101012F00000024000000190000000F000000050000
      000100000000000000000000000000000000000000000000011600000A340000
      0114000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000003000000060000
      00080000000A0000001A00000045000000460000004700000047000000460000
      00440000000C0000000800000006000000030000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000303
      0320D8D8D8FDDADADAFFBBBBBBFFAAAAAAFF050505500202023C010101270000
      001A000000120000000B00000007000000030000000100000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000303
      0320D8D8D8FDDADADAFFBBBBBBFFAAAAAAFF050505500202023C010101270000
      001A000000120000000B0000000700000003000006280000D4E90000D2E80000
      C7E20000205B0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000100404042B0303032300000007000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000100000006000000191C1C1C8E646464D88383
      83F1A8A8A8FD9D9D9DFEC1C1C1FFBABABAFFB4B4B4FF9C9C9CFF8B8B8BFF7272
      72FE6A6A6AFD525252EF3C3C3CD5060606730000001900000005000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000575757A8E7E7E7FFC8C8C8FFB1B1B1FFBDBDBDFF03030346050505500404
      044F03030345020202370101012B0000001F00000017000000120000000F0000
      000C000000090000000600000004000000020000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000575757A8E7E7E7FFC8C8C8FFB1B1B1FFBDBDBDFF03030346050505500404
      044F03030345020202370101012B0000001F01015F9F8E8EFFFF1B1BFFFF0000
      FFFF0000DCEE0000114400000004000000020000000000000000000000000000
      000000002D6C0000DBED00001C55000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000020101
      01180C0C0C4B1A1F21911C3543D9154963FB0B364AF417252EBE131516740606
      06340000000D0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000302020235606060D3BCBCBCFDEFEFEFFFFEFEFEFFFBFB
      FBFFF3F3F3FFE8E8E8FFE3E3E3FFDBC9C3FFD9BFB7FFC4C4C4FFC2C2C2FFB2B2
      B2FFC4A293FFFF4D11FFFF4D11FFFF551BFFFF5016FFF5541AFD923710C50301
      001F000000000000000000000000000000000000000000000000000000000000
      000000000001D1D1D1FBDEDEDEFFBDBDBDFFA9A9A9FF000000150000001E0101
      01300404044D0707075F070707610606065A0505055003030343020202390101
      012F010101250000001D000000150000000F0000000900000006000000040000
      0002000000010000000000000000000000000000000000000000000000000000
      000000000001D1D1D1FBDEDEDEFFBDBDBDFFA9A9A9FF000000150000001E0101
      01300404044D0707075F070707610606065A040460AD8E8EFFFF8C8CFFFF1616
      FFFF0000FFFF0000ABD4000006310000000F00000009000000060000000E0000
      55940909E6F30101E2F100002460000000000000000000000000000000000000
      0000000000000000000000000000000000020202021E0E0E0F561B22269E1D3C
      4EE2195573FF1E688CFF2A779BFF347B9AFF1E6383FF13597DFF094C6EFF0C3D
      56FA162934CA15181A810808083E000000110000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000011B1B1B6DBABABAFAE4E4E4FFF0F0F0FFF9F9F9FFFEFEFEFFFBFB
      FBFFF5F5F5FFECECECFFE7E7E7FFFE541AFFFF5219FFE49E7DFFCCCCCCFFFF4D
      11FFFF4D11FFFFC46BFFFFC46BFFFF732EFFFF5C1CFFFF4F13FFFF480EFFFF4D
      11FF762F10AE0000000000000000000000000000000000000000000000000000
      0000000000003A3A3A89E6E6E6FFCCCCCCFFB3B3B3FFCBCBCBFF000000020000
      000A00000020030303430606065B070707600606065A05050551030303480303
      0340020202380101013001010128000000220000001B000000140000000D0000
      0008000000030000000000000000000000000000000000000000000000000000
      0000000000003A3A3A89E6E6E6FFCCCCCCFFB3B3B3FFCBCBCBFF000000020000
      000A00000020030303430606065B0707076006060D660A0AFFFF7878FFFF7373
      FFFF1212FFFF0000FFFF0000C2E1010104300000001B0000011D020286BB1717
      EAF50202EEF70000619E00000000000000000000000000000000000000000000
      000000000001030303230E0F105F18252BA81D4459EA1E6280FF277194FF3279
      9DFF387E9EFF3C7C9CFF3D7E9BFF3B789AFF286683FF2A6A86FF2A6A8AFF2569
      8CFF1B6384FF115576FF0E4565FF142D3BD213181B8B09090946000000120000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000003A5A5A5DCE3E3E3FFE0E0E0FFEEEEEEFFF8F8F8FFFEFEFEFFFBFB
      FBFFF5F5F5FFEFEFEFFFECECECFFFF5920FFFFC46BFFFF5015FFFF4D11FFFF91
      5BFFFFC46BFFFFC46BFFFF4B10FFFF4D11FFDF794BFFC68969FFD89B7BFFE174
      42F8FF4D11FFFF4D11FF00000000000000000000000000000000000000000000
      00000000000000000000C4C4C4F4E0E0E0FFC0C0C0FFAAAAAAFF0000000F0000
      00000000000500000016010101320303034603030349030303440202023D0202
      02370101013001010129000000230000001C000000150000000F000000090000
      0004000000010000000000000000000000000000000000000000000000000000
      00000000000000000000C4C4C4F4E0E0E0FFC0C0C0FFAAAAAAFF0000000F0000
      00000000000500000016010101320303034603030349040413610808A1D16161
      F7FC5D5DFFFF0E0EFFFF0000EFF8000082BA00000E45030397C63B3BF4FA0F0F
      F0F8000084B80000011400000000000000000000000000000000020202240D10
      1166172831B2215069F126688CFF30789CFF3681A2FF3D83A2FF3D7E9EFF3F7D
      9CFF3D7D9CFF3D7D9CFF3F809EFF3F7D9BFF2A6885FF2D6B8AFF2D6B8AFF2D6B
      8AFF2D6B8BFF2D6C8BFF2A6C8DFF22698AFF185D80FF124D6BFF113043DC1119
      1E950808094A0000001000000000000000000000000000000000000000000000
      000000000000FFFFFFFFE3E3E3FFE0E0E0FFEEEEEEFFF8F8F8FFFEFEFEFFFAFA
      FAFFF1F1F1FFE5E5E5FFE1E1E1FFFF4D11FFFFC46BFFFF7948FFFFA16CFFFFC4
      6BFFFF6723FFFF4D11FFC09279FF939393FF9B9B9BFF9A9A9AFFB9B9B9FFE3E3
      E3FF00000000311609705D290F9B000000000000000000000000000000000000
      0000000000000000000020202066E4E4E4FFD1D1D1FFB6B6B6FFBEBEBEFF0000
      000000000000000000030000000E0000002201010130010101310101012C0101
      01250000001F00000018000000120000000D0000000700000004000000020000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000020202066E4E4E4FFD1D1D1FFB6B6B6FFBEBEBEFF0000
      000000000000000000030000000E00000022010101300101013102020A460101
      99C93C3CEDF74A4AFFFF0B0BFFFF0000E9F51313DAED5A5AFFFF1616FFFF0000
      D0E70000000A00000000000000000000000000000002071922A6255E7AFA3075
      99FF3882A3FF3F86A6FF4084A4FF4183A3FF4182A0FF4082A0FF4082A0FF4082
      A0FF4082A0FF3F82A0FF4285A5FF4284A3FF2D6B8AFF30708DFF306F8DFF306F
      8DFF306F8DFF306F8DFF30718DFF30708EFF2F718EFF30728FFF286F8FFF1F66
      8AFF175675FF0A334AE60004076A000000000000000000000000000000000000
      000000000000FFFFFFFFE3E3E3FFE0E0E0FFEEEEEEFFF8F8F8FFFEFEFEFFFAFA
      FAFFF1F1F1FFE5E5E5FFE3D0C9FFFF4D11FFFFA958FFFFC886FFFFC06CFFFF69
      25FFFF4D11FFA3948BFF9F9F9FFF939393FF9B9B9BFF9A9A9AFFB9B9B9FFE3E3
      E3FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B0B0B0E8E2E2E2FFC3C3C3FFA4A4A4FFF4F4
      F4FF00000000000000000000000100000008000000140000001C0000001A0000
      00140000000E0000000800000004000000020000000100000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B0B0B0E8E2E2E2FFC3C3C3FFA4A4A4FFF4F4
      F4FF00000000000000000000000100000008000000140000001C0000001A0000
      001400006EAA3030E6F33A3AFFFF0808FFFF1515FFFF1E1EFFFF0000A7CF0000
      0B360000000000000000000000000000000000000128418BB0FF458DB0FF4387
      A7FF4587A6FF4486A4FF4485A5FF4485A5FF4485A5FF4485A5FF4485A5FF4485
      A5FF4485A5FF4485A5FF4889A8FF4685A6FF2F6989FF326F8FFF32708FFF326F
      8FFF32708EFF32708EFF32708FFF327191FF32708FFF32708EFF327190FF3273
      91FF317393FF31789CFF153D51DE000000000000000000000000000000000000
      000000000000FFFFFFFFE3E3E3FFE0E0E0FFEEEEEEFFF8F8F8FFFEFEFEFFFAFA
      FAFFF1F1F1FFE5E5E5FFE0DDDCFFFF4D11FFFFC46BFFFFC46BFFFFC061FFFF45
      0CFFD68F68FFA3958CFF9F9F9FFF939393FF9B9B9BFF9A9A9AFFB9B9B9FFE3E3
      E3FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000B0B0B3EE2E2E2FFD3D3D3FFA6A6A6FFACAC
      ACFF000000030000000100000000000000000000000400000008000000080000
      0005000000020000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000B0B0B3EE2E2E2FFD3D3D3FFA6A6A6FFACAC
      ACFF000000030000000100000000000000000000000400000008000000080000
      000500000117000094C32626F8FC2828FFFF0000FFFF0000FCFE00003B7B0000
      000000000000000000000000000000000000000000264D92B4FF4A8CACFF4889
      AAFF4889A9FF4889A9FF4889A9FF4889A9FF4889A9FF4889A9FF4889A9FF4889
      A9FF4889A9FF4886A9FF4A8CACFF4C8AABFF31708DFF367592FF357492FF3573
      92FF387897FF387698FF367594FF367598FF367596FF357392FF357492FF3574
      92FF357592FF387C9CFF1B3C4CCF000000000000000000000000000000000000
      000000000000FFFFFFFFE3E3E3FFE0E0E0FFEEEEEEFFF8F8F8FFFEFEFEFFFAFA
      FAFFEEEEEEFFE3E3E3FFE1C2B7FFFF4D11FFFFC46BFFFFC061FFFFC061FFFFC4
      6BFFFF470DFFFF4D12FFAA9C94FF939393FF9B9B9BFF9A9A9AFFB9B9B9FFE3E3
      E3FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008A8A8AD0D2D2D2FFABABABFF9E9E
      9EFFD1D1D1FFF9F9F9FF00000003000000010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008A8A8AD0D2D2D2FFABABABFF9E9E
      9EFFD1D1D1FFF9F9F9FF00000003000000010000000000000000000000000000
      000000005B992A2AE8F43A3AFFFF0808FFFF0E0EFFFF1616FFFF0000A9D00000
      093000000000000000000000000000000000000000205197B8FF4D90B1FF4B8D
      ACFF4B8DACFF4B8DACFF4B8DACFF4B8DACFF4B8DACFF4B8DACFF4B8DACFF4B8D
      ACFF4B8DACFF4B8DACFF4E8FAFFF4E90ADFF317190FF377897FF377797FF3C7C
      9BFF2D6881FF33718DFF3D82A2FF24566AFF336F8DFF397C9AFF387998FF3777
      97FF377797FF3B80A0FF1B3C4BCC000000000000000000000000000000000000
      000000000000FFFFFFFFE3E3E3FFE2E2E2FFF5F5F5FFF8F8F8FFF7F7F7FFE8E8
      E8FFD0D0D0FFB7B7B7FFA8A6A5FFF7763DFFFF5418FFFF561AFFFF5013FFFF4E
      12FFFF4D11FFFE4C11FF908177FF918078FFFF4D11FFFF4D11FFFF4D11FFFF4D
      11FFFF4D11FFFF4D11FFAA4418D1000000000000000000000000000000000000
      00000000000000000000000000000000000104040426C7C7C7FCAFAFAFFFABAB
      ABFFA4A4A4FF9D9D9DFFC2C2C2FFECECECFF0000000400000001000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000104040426C7C7C7FCAFAFAFFFABAB
      ABFFA4A4A4FF9D9D9DFFC2C2C2FFECECECFF0000000400000001000002180000
      7FB53B3BEEF74A4AFFFF0B0BFFFF0000EAF50E0EDFEF3C3CFFFF0E0EFFFF0000
      C0DE0000000000000000000000000000000000000020539ABCFF5093B4FF4E90
      B0FF4E90B0FF4E90B0FF4E90B0FF4E90B0FF4E90B0FF4E90B0FF4E90B0FF4E90
      B0FF4E90B0FF4E8FAFFF5192B2FF5191B1FF367493FF3B7C9AFF3B799BFF3E83
      A0FF2D6079FF1E4257FF2B5F76FF1C4053FF2D637CFF3F84A7FF3D7E9CFF3B7C
      9BFF3B7C9BFF3E83A5FF1C3C4BCA000000000000000000000000000000000000
      000000000000FCFCFCFFDADADAFFE6E6E6FFC9C9C9FFA8A8A8FF9C9C9CFF9494
      94FFA2A2A2FF929292FF898989FF848484FFBB8260FFB96F4BFFBF6B45FFAD70
      4FFFA96F4EFF716259FF5F5F5FFF78675EFFFE4A0FFFFF4D11FFFFC46BFFFFA3
      4DFFFFA34DFFFF7B33FFFF4D11FF000000000000000000000000000000000000
      00000000000000000000000000010000000301010110B7B7B7FFB4B4B4FFB0B0
      B0FFAAAAAAFFA2A2A2FF9B9B9BFF949494FFB3B3B3FFD8D8D8FFFFFFFFFF0000
      0001000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000010000000301010110B7B7B7FFB4B4B4FFB0B0
      B0FFAAAAAAFFA2A2A2FF9B9B9BFF949494FFB3B3B3FFBABADEFF4747FFFF5A5A
      F6FB5D5DFFFF0E0EFFFF0000ECF600007EB400000E3C010190C02222F2F90808
      F2F9000087BA0000000F00000000000000000000001D58A0C3FF5399B8FF5194
      B4FF5194B4FF5194B4FF5194B4FF5194B4FF5194B4FF5194B4FF5194B4FF5194
      B4FF5194B4FF4F94B3FF5398B6FF5596B8FF337496FF3D799AFF3D7E9EFF428C
      ACFF4084A4FF224D60FF356E8AFF387493FF2D637BFF2A5870FF2B5D76FF3F80
      A0FF3D7D9EFF4085A5FF1D3E4CC9000000000000000000000000000000000000
      000000000000E6E6E6FFCBCBCBFFBCBCBCFFC4C4C4FFDCDCDCFFFEFEFEFFFAFA
      FAFFF1F1F1FFE5E5E5FFDFDFDFFFD1D1D1FFCCCCCCFFBCBCBCFFBABABAFFA7A7
      A7FFA8A8A8FF979797FF9F9F9FFF898989FFA28270FFC97D58FFFF4D11FFFFBB
      6CFFFFAF56FFFFC46BFFFF4D11FF000000000000000000000000000000000000
      00000000000000000000000000010000000504040424BDBDBDFFB9B9B9FFB4B4
      B4FFAFAFAFFFA6A6A6FF9F9F9FFF989898FF929292FF8C8C8CFF8E8E8EFBC8C8
      C8FFF8F8F8FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000010000000504040424BDBDBDFFB9B9B9FFB4B4
      B4FFAFAFAFFFA6A6A6FF9F9F9FFF989898FF8D8D96FF0E0EFBFF7878FFFF7373
      FFFF1212FFFF0000FFFF0000CBE4000002180000000000000114010191C10C0C
      E8F40000F0F80000579600000000000000000000001B5CA6C9FF599DBFFF569A
      BAFF5699B9FF5699B9FF5699B9FF5699B9FF5699BAFF5699B9FF5699B9FF5699
      BAFF5699B9FF5699B9FF5B9BBFFF5B9BBAFF377998FF4082A0FF4287ABFF3265
      7DFF244D5DFF366F89FF458CABFF2D5F76FF3D7C9AFF306278FF387490FF448A
      ACFF4183A2FF458AAAFF1D3C4CC7000000000000000000000000000000000000
      000000000000929292C8D9D9D9FFE0E0E0FFEEEEEEFFF8F8F8FFFEFEFEFFFAFA
      FAFFF1F1F1FFE5E5E5FFDFDFDFFFD1D1D1FFCCCCCCFFBCBCBCFFBABABAFFA7A7
      A7FFA8A8A8FF979797FF9F9F9FFF939393FFA6978FFFFF4D11FFFF9356FFFFBE
      65FFFFC46BFFFFC46BFFFF4D11FF000000000000000000000000000000000000
      00000000000000000000000000010000000616161654C2C2C2FFC0C0C0FFBABA
      BAFFB3B3B3FFABABABFFA3A3A3FF9C9C9CFF949494FF8F8F8FFF898989FF8484
      84FF7E7E7EFFB7B7B7FFF1F1F1FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000010000000616161654C2C2C2FFC0C0C0FFBABA
      BAFFB3B3B3FFABABABFFA3A3A3FF9C9C9CFF4242CEFF8383FFFF8C8CFFFF1616
      FFFF0000FFFF2020F2FFD2D2F3FF0000000000000000000000000000000C0000
      59970303E2F10000E4F200001E58000000000000001A60A8CBFF5C9FC0FF599B
      BCFF599BBCFF599BBCFF599BBCFF599BBCFF599BBCFF599BBCFF599BBCFF599B
      BCFF599BBCFF5999B9FF5B9DBEFF609FC1FF387D9AFF4385A4FF498CADFF3971
      8EFF224356FF3E7897FF4A8FADFF264C5EFF356C85FF498DADFF305E74FF3971
      8DFF4487A6FF498FB1FF1E3D4CC6000000000000000000000000000000000000
      000000000000DEDEDEF0E3E3E3FFE0E0E0FFEEEEEEFFF8F8F8FFFEFEFEFFFAFA
      FAFFF1F1F1FFE5E5E5FFDFDFDFFFE9A27BFFD8BBAAFFBCBCBCFFBABABAFFA7A7
      A7FFA8A8A8FF979797FF9F9F9FFFAC8F7DFFFF4D11FFFFC46BFFFFC46BFFFF4D
      11FFFF480EFFFF7930FFFF4D11FF000000000000000000000000000000000000
      00000000000000000000000000020000000834343480C8C8C8FFC5C5C5FFC0C0
      C0FFB8B8B8FFB0B0B0FFA8A8A8FFA0A0A0FF989898FF939393FF8B8B8BFF8686
      86FF828282FF7C7C7CFF787878FFA6A6A6FFD9D9D9FFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000020000000834343480C8C8C8FFC5C5C5FFC0C0
      C0FFB8B8B8FFB0B0B0FFA8A8A8FFA0A0A0FF3939D8FF8E8EFFFF1B1BFFFF0000
      FFFF0A0AF4FF5959A1FF787878FFA6A6A6FFD9D9D9FFFFFFFFFF000000000000
      000600003C7C0000D5EA00001E59000000000000001866ACD0FF60A3C5FF5D9E
      C0FF5D9EC0FF5D9EC0FF5D9EC0FF5D9EC0FF5D9EC0FF5D9EC0FF5D9EC0FF5D9E
      C0FF5D9EC0FF5D9EC0FF5FA0C3FF66A7C4FF417EA0FF4889AAFF468BAAFF5196
      B7FF4485A4FF366F87FF4C96B6FF275167FF3B718EFF386E89FF274B62FF305F
      78FF488BACFF4E92B5FF1F3D4CC5000000000000000000000000000000000000
      000000000000FFFFFFFFE3E3E3FFE0E0E0FFEEEEEEFFF8F8F8FFFEFEFEFFFAFA
      FAFFF1F1F1FFE5E5E5FFDFDFDFFFD1D1D1FFF38C59FFFF4D11FFFF4D11FFFF4D
      11FFFF4D11FFFF4D11FFFF4D11FFFF4D11FFFF9E61FFFFC46BFFFF4D11FFFF4D
      11FFA54518CEFF5C1CFFFF4D11FF000000000000000000000000000000000000
      0000000000000000000000000002000000083E3E3E8CCDCDCDFFCBCBCBFFC6C6
      C6FFBDBDBDFFB5B5B5FFABABABFFA3A3A3FF9C9C9CFF959595FF909090FF8B8B
      8BFF878787FF828282FF7B7B7BFF787878FF747474FF7B7B7BFBC8C8C8FFF7F7
      F7FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000002000000083E3E3E8CCDCDCDFFCBCBCBFFC6C6
      C6FFBDBDBDFFB5B5B5FFABABABFFA3A3A3FF8282ACFF0B0BF6FF0D0DF4FF0D0D
      F3FF4E4EB9FF828282FF7B7B7BFF787878FF747474FF7B7B7BFBC8C8C8FFF7F7
      F7FF000000000000000D00000003000000000000001868ADD2FF63A6CAFF5FA2
      C3FF5FA2C3FF5FA2C3FF5FA2C3FF60A2C3FF5FA2C3FF5FA2C3FF5FA2C3FF5FA2
      C3FF5FA2C3FF5FA0C3FF60A4C4FF6CABCBFF40839EFF488AA9FF498BA8FF4C91
      B5FF43839DFF2B5365FF498AA6FF305A6EFF315F77FF2D586CFF2F5B70FF3869
      83FF488AA8FF5096B7FF1F3F4CC5000000000000000000000000000000000000
      000000000000FFFFFFFFE3E3E3FFE0E0E0FFEEEEEEFFF8F8F8FFFEFEFEFFFAFA
      FAFFF1F1F1FFE5E5E5FFDFDFDFFFD1D1D1FFCCCCCCFFD99F7EFFFF4D11FFFF4D
      11FFFFC46BFFFFC46BFFFFC46BFFFFC46BFFFFC46BFFFF4D11FFF27941FFE6D7
      CEFF47200D87FF460DFFFF4D11FF000000000000000000000000000000000000
      0000000000000000000000000002000000097D7D7DC5D2D2D2FFD2D2D2FFCECE
      CEFFC5C5C5FFBBBBBBFFB0B0B0FFA6A6A6FFA0A0A0FF999999FF949494FF9090
      90FF8C8C8CFF868686FF808080FF7B7B7BFF777777FF737373FF707070FF7474
      74FEACACACFFEFEFEFFF00000000000000000000000000000000000000000000
      0000000000000000000000000002000000097D7D7DC5D2D2D2FFD2D2D2FFCECE
      CEFFC5C5C5FFBBBBBBFFB0B0B0FFA6A6A6FFA0A0A0FF8585A6FF6C6CB0FF8282
      9BFF8C8C8CFF868686FF808080FF7B7B7BFF777777FF737373FF707070FF7474
      74FEACACACFFEFEFEFFF0000000000000000000000176CB3D8FF67AACFFF64A6
      CAFF64A6C9FF64A6C7FF64A7CBFF5FA2C4FF5798B7FF65A6CCFF64A6C7FF64A6
      CCFF64A6C9FF64A6C9FF66A8CDFF6FB1CEFF4185A4FF4B8EACFF4C8EAAFF4F94
      B9FF3C6E8AFF24495BFF417490FF335F77FF2F596EFF2C586CFF45829FFF4989
      A7FF4C8DACFF5198BAFF1F3E4BC2000000000000000000000000000000000000
      000000000000FFFFFFFFE3E3E3FFE0E0E0FFEEEEEEFFF8F8F8FFFEFEFEFFFAFA
      FAFFF1F1F1FFE5E5E5FFDFDFDFFFD1D1D1FFCCCCCCFFBCBCBCFFBABABAFFDC88
      5BFFFF4D11FFFF4E12FFFF450CFFFD5417FFFF4D11FFBC8F75FFB9B9B9FFE3E3
      E3FF000000000301001F00000000000000000000000000000000000000000000
      000000000000000000000000000200000009949494D4D7D7D7FFD8D8D8FFD5D5
      D5FFCDCDCDFFC2C2C2FFB7B7B7FFADADADFFA5A5A5FFA0A0A0FF9A9A9AFF9595
      95FF909090FF898989FF828282FF7D7D7DFF808080FFA0A0A0FFACACACFFA5A5
      A5FFB0B0B0FFA6A6A6FF7E7E7EE1000000000000000000000000000000000000
      000000000000000000000000000200000009949494D4D7D7D7FFD8D8D8FFD5D5
      D5FFCDCDCDFFC2C2C2FFB7B7B7FFADADADFFA5A5A5FFA0A0A0FF9A9A9AFF9595
      95FF909090FF898989FF828282FF7D7D7DFF808080FFA0A0A0FFACACACFFA5A5
      A5FFB0B0B0FFA6A6A6FF7E7E7EE1000000000000001771B6DBFF6AADD1FF67A9
      CBFF67A9CBFF68ABCCFF65A6CAFF5A9AB8FF5DA0BCFF63A5C6FF68A9CCFF67A9
      CBFF67A9CBFF67A9CAFF67ABCDFF78B4D2FF458AA9FF4F90B0FF4F91B1FF4F97
      B5FF5394B5FF4D91B2FF5298B7FF2B5B6FFF3C7287FF315E73FF407793FF559C
      BDFF5092B2FF559CBEFF223E4BC2000000000000000000000000000000000000
      000000000000FFFFFFFFE3E3E3FFE0E0E0FFEEEEEEFFF8F8F8FFFEFEFEFFFAFA
      FAFFF1F1F1FFE3E3E3FFDCDCDCFFCFCFCFFFC8C8C8FFB9B9B9FFB5B5B5FFA4A4
      A4FFA7A7A7FF979797FF9F9F9FFF939393FF9B9B9BFF9A9A9AFFB9B9B9FFE3E3
      E3FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000020000000AD9D9D9FFDBDBDBFFDDDDDDFFDCDC
      DCFFD5D5D5FFCBCBCBFFBFBFBFFFB5B5B5FFADADADFFA6A6A6FFA1A1A1FF9999
      99FF919191FF8B8B8BFFACACACFFBCBCBCFFC7C7C7FFD8D8D8FFE4E4E4FFDDDD
      DDFFD9D9D9FFDADADAFFA1A1A1F8000000000000000000000000000000000000
      00000000000000000000000000020000000AD9D9D9FFDBDBDBFFDDDDDDFFDCDC
      DCFFD5D5D5FFCBCBCBFFBFBFBFFFB5B5B5FFADADADFFA6A6A6FFA1A1A1FF9999
      99FF919191FF8B8B8BFFACACACFFBCBCBCFFC7C7C7FFD8D8D8FFE4E4E4FFDDDD
      DDFFD9D9D9FFDADADAFFA1A1A1F8000000000000001674BDDFFF6EB1D6FF6AAF
      CFFF6AADCFFF68AACBFF5694B6FF90D2E9FF99D9F2FF599ABFFF6FB1D2FF6AAD
      CFFF6AADCFFF6AADCFFF69B0D1FF7EBCD9FF458CABFF5093B3FF5194B4FF4F92
      B4FF5396B6FF569BBAFF5292B5FF2A5266FF427897FF457D9AFF30576AFF4E90
      ADFF5398B9FF589EC2FF233D4CC1000000000000000000000000000000000000
      000000000000FFFFFFFFE3E3E3FFE3E3E3FFF5F5F5FFF8F8F8FFF7F7F7FFEDED
      EDFFDFDFDFFFC3C3C3FFB2B2B2FFA4A4A4FF979797FF8C8C8CFF838383FF8585
      85FF898989FF848484FF848484FF848484FF959595FF9A9A9AFFB9B9B9FFE3E3
      E3FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000020A0A0A37DDDDDDFFDFDFDFFFE2E2E2FFE2E2
      E2FFDBDBDBFFD0D0D0FFC6C6C6FFBBBBBBFFB3B3B3FFABABABFFA2A2A2FFA8A8
      A8FFC4C4C4FFC7C7C7FFE0E0E0FFF7F7F7FFF8F8F8FFF5F5F5FFEEEEEEFFE8E8
      E8FFE1E1E1FFCACACAFF545454B5000000000000000000000000000000000000
      00000000000000000000000000020A0A0A37DDDDDDFFDFDFDFFFE2E2E2FFE2E2
      E2FFDBDBDBFFD0D0D0FFC6C6C6FFBBBBBBFFB3B3B3FFABABABFFA2A2A2FFA8A8
      A8FFC4C4C4FFC7C7C7FFE0E0E0FFF7F7F7FFF8F8F8FFF5F5F5FFEEEEEEFFE8E8
      E8FFE1E1E1FFCACACAFF545454B5000000000000001578BDE3FF71B5D9FF6EB0
      D2FF6BADD1FF6EB1D2FF90D1ECFFA5ECFFFF97DBF7FF64A4C6FF6EB0D3FF6EB0
      D1FF6EB0D2FF6EB0D2FF6CB2D5FF84BCDAFF4C8FB3FF5597BAFF5898B9FF5698
      B8FF5698B8FF5999B9FF599ABDFF49819EFF4A849FFF5A9EC0FF355E73FF3D6B
      83FF599CBDFF5DA5C9FF243F4CC1000000000000000000000000000000000000
      000000000000FCFCFCFFE4E4E4FFEDEDEDFFD6D6D6FFB8B8B8FFA2A2A2FF9D9D
      9DFF999999FF979797FF8B8B8BFF828282FF7A7A7AFF717171FF707070FF6B6B
      6BFF5F5F5FFF5D5D5DFF616161FF636363FF6C6C6CFF8C8C8CFFADADADFFE1E1
      E1FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000211111147E1E1E1FFE3E3E3FFE6E6E6FFE6E6
      E6FFE1E1E1FFD7D7D7FFCBCBCBFFC1C1C1FFB5B5B5FFB4B4B4FFCCCCCCFFD2D2
      D2FFDCDCDCFFEEEEEEFFF5F5F5FFF9F9F9FFFAFAFAFFF9F9F9FFF7F7F7FFF0F0
      F0FFE1E1E1FFAAAAAAEF00000000000000000000000000000000000000000000
      000000000000000000000000000211111147E1E1E1FFE3E3E3FFE6E6E6FFE6E6
      E6FFE1E1E1FFD7D7D7FFCBCBCBFFC1C1C1FFB5B5B5FFB4B4B4FFCCCCCCFFD2D2
      D2FFDCDCDCFFEEEEEEFFF5F5F5FFF9F9F9FFFAFAFAFFF9F9F9FFF7F7F7FFF0F0
      F0FFE1E1E1FFAAAAAAEF0000000000000000000000157CC0E7FF75B9DFFF72B3
      D9FF72B2D8FF72B4D8FF90D2F2FF91D8F3FF91D6F1FF71B2D2FF70B0D8FF72B3
      D9FF72B3DAFF72B3D8FF71B4DCFF85BFDEFF4E93B4FF579AB9FF589BBAFF589B
      B9FF589BBAFF579BB8FF589CBEFF5C9FC1FF5A9FBFFF5AA0C0FF5290AFFF4C85
      A0FF589AB9FF60A8CCFF25404EC2000000000000000000000000000000000000
      000000000000E8E8E8FFD2D2D2FFC1C1C1FFC7C7C7FFD9D9D9FFFEFEFEFFFAFA
      FAFFF1F1F1FFE5E5E5FFDFDFDFFFD1D1D1FFCCCCCCFFBCBCBCFFBABABAFFA7A7
      A7FFA8A8A8FF979797FF9F9F9FFF838383FF848484FF858585FF9A9A9AFFC3C3
      C3FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000023D3D3D84E5E5E5FFE6E6E6FFE8E8E8FFE9E9
      E9FFE4E4E4FFDBDBDBFFCDCDCDFFC2C2C2FFD1D1D1FFD4D4D4FFCECECEFFD9D9
      D9FFE3E3E3FFECECECFFF0F0F0FFF3F3F3FFF7F7F7FFFAFAFAFFF9F9F9FFF0F0
      F0FFB9B9B9F00000000000000000000000000000000000000000000000000000
      00000000000000000000000000023D3D3D84E5E5E5FFE6E6E6FFE8E8E8FFE9E9
      E9FFE4E4E4FFDBDBDBFFCDCDCDFFC2C2C2FFD1D1D1FFD4D4D4FFCECECEFFD9D9
      D9FFE3E3E3FFECECECFFF0F0F0FFF3F3F3FFF7F7F7FFFAFAFAFFF9F9F9FFF0F0
      F0FFB9B9B9F00000000000000000000000000000001580C3E9FF7BBEE0FF76B7
      DAFF76B7DBFF74B5D7FF7DC2E3FF85CCECFF84CDEDFF76B9DBFF76B5D9FF76B7
      DAFF76B9DAFF76B7DAFF75B8DEFF85C2DDFF5294B6FF5D9DBEFF5C9FBFFF5D9D
      C0FF5C9DC0FF5C9DBFFF5C9DBFFF5C9DBFFF5C9DC0FF5D9FC0FF5EA0C3FF5EA3
      C4FF5D9EC0FF64AACFFF253F4CC0000000000000000000000000000000000000
      000000000000929292C7DCDCDCFFE0E0E0FFEEEEEEFFF8F8F8FFFEFEFEFFFAFA
      FAFFF1F1F1FFE5E5E5FFDFDFDFFFD1D1D1FFCCCCCCFFBCBCBCFFBABABAFFA7A7
      A7FFA8A8A8FF979797FF9F9F9FFF939393FF9B9B9BFF9A9A9AFFBDBDBDFF8686
      86C5000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000025E5E5EA2E8E8E8FFE8E8E8FFE9E9E9FFE9E9
      E9FFE3E3E3FFD8D8D8FFD1D1D1FFDFDFDFFFCACACAFFC4C4C4FFCECECEFFD6D6
      D6FFDEDEDEFFE6E6E6FFEAEAEAFFEEEEEEFFF2F2F2FFF6F6F6FFE7E7E7FFA2A2
      A2E0000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000025E5E5EA2E8E8E8FFE8E8E8FFE9E9E9FFE9E9
      E9FFE3E3E3FFD8D8D8FFD1D1D1FFDFDFDFFFCACACAFFC4C4C4FFCECECEFFD6D6
      D6FFDEDEDEFFE6E6E6FFEAEAEAFFEEEEEEFFF2F2F2FFF6F6F6FFE7E7E7FFA2A2
      A2E0000000000000000000000000000000000000001582C6ECFF7EC1E6FF79BA
      DEFF79BADEFF79BADEFF79BDE0FF78C0E3FF7CC0E3FF79BDDFFF79B9DEFF77B7
      DEFF75B5DAFF73B6DAFF74B4DCFF84C1DFFF5590B1FF5393B6FF599CC0FF5C9C
      C0FF5D9EC0FF5E9FC1FF5E9FC1FF5E9FC1FF5E9FC1FF5E9FC1FF5E9FC1FF5E9F
      C1FF5E9FC2FF66ACD1FF253F4CC0000000000000000000000000000000000000
      000000000000FFFFFFFFE3E3E3FFE0E0E0FFEEEEEEFFF8F8F8FFFEFEFEFFFAFA
      FAFFF1F1F1FFE5E5E5FFDFDFDFFFD1D1D1FFCCCCCCFFBCBCBCFFBABABAFFA7A7
      A7FFA8A8A8FF979797FF9F9F9FFF939393FF9B9B9BFF9A9A9AFFB9B9B9FFAEAE
      AEDF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000001878787C1EBEBEBFFEAEAEAFFE9E9E9FFE5E5
      E5FFDBDBDBFFE7E7E7FFD0D0D0FFB3B3B3FFBABABAFFC1C1C1FFC9C9C9FFD2D2
      D2FFD9D9D9FFE1E1E1FFE6E6E6FFE9E9E9FFEDEDEDFFD8D8D8FD444444930000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000001878787C1EBEBEBFFEAEAEAFFE9E9E9FFE5E5
      E5FFDBDBDBFFE7E7E7FFD0D0D0FFB3B3B3FFBABABAFFC1C1C1FFC9C9C9FFD2D2
      D2FFD9D9D9FFE1E1E1FFE6E6E6FFE9E9E9FFEDEDEDFFD8D8D8FD444444930000
      0000000000000000000000000000000000000000001585CAEDFF82C4E8FF7DBE
      E2FF7DBEE2FF7DBEE2FF75B9DFFF69B4DAFF65B3D9FF71B8DFFF7CBAE0FF7EBE
      E3FF86C2E5FF8FCBEAFF92D2F2FF9FE4FFFF90D2EBFF7BB8D1FF6BA7C4FF609E
      BAFF5D9BBDFF5D9EC1FF63A4C7FF62A4C7FF5EA3C5FF60A3C5FF60A3C5FF60A3
      C5FF60A3C6FF6AB1D7FF253F4DC0000000000000000000000000000000000000
      000000000000FFFFFFFFE3E3E3FFE0E0E0FFEEEEEEFFF8F8F8FFFEFEFEFFFAFA
      FAFFF1F1F1FFE5E5E5FFDFDFDFFFD1D1D1FFCCCCCCFFBCBCBCFFBABABAFFA7A7
      A7FFA8A8A8FF979797FF9F9F9FFF939393FF9B9B9BFF9A9A9AFFB9B9B9FFE3E3
      E3FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000001D3D3D3EFEEEEEEFFEBEBEBFFE5E5E5FFFFFF
      FFFFE5E5E5FFACACACFFA8A8A8FFAEAEAEFFB5B5B5FFBBBBBBFFC4C4C4FFCBCB
      CBFFD3D3D3FFDBDBDBFFE1E1E1FFE0E0E0FFE0E0E0FD10101048000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000001D3D3D3EFEEEEEEFFEBEBEBFFE5E5E5FFFFFF
      FFFFE5E5E5FFACACACFFA8A8A8FFAEAEAEFFB5B5B5FFBBBBBBFFC4C4C4FFCBCB
      CBFFD3D3D3FFDBDBDBFFE1E1E1FFE0E0E0FFE0E0E0FD10101048000000000000
      0000000000000000000000000000000000000000001486C9EDFF84C6ECFF7EC1
      E5FF7EBFE5FF81C1E6FF6BB0DBFF66AAD3FF7CB8DCFF96CDEAFF9AD9F6FF9ADF
      F9FF96DDFAFF8BDAF5FF82D1F2FF7ECEEFFF84D2F5FF8EDBFEFF93DFFCFF8FD8
      F2FF85C7E3FF73B3D0FF5B98B5FF629DBEFF64A2C5FF63A3C6FF63A5C7FF63A6
      CAFF65A7CAFF6EB4D9FF253F4EC1000000000000000000000000000000000000
      000000000000FFFFFFFFE3E3E3FFE0E0E0FFEEEEEEFFF8F8F8FFFEFEFEFFFAFA
      FAFFF1F1F1FFE5E5E5FFDFDFDFFFD1D1D1FFCCCCCCFFBCBCBCFFBABABAFFA7A7
      A7FFA8A8A8FF979797FF9F9F9FFF939393FF9B9B9BFF9A9A9AFFB9B9B9FFE3E3
      E3FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000FF5F5F5FFF0F0F0FFE7E7E7FFE7E7E7FFD4D4
      D4FF999999FF9F9F9FFFA3A3A3FFA8A8A8FFAFAFAFFFB7B7B7FFBEBEBEFFC5C5
      C5FFCECECEFFD5D5D5FFD6D6D6FD747474BA0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000FF5F5F5FFF0F0F0FFE7E7E7FFE7E7E7FFD4D4
      D4FF999999FF9F9F9FFFA3A3A3FFA8A8A8FFAFAFAFFFB7B7B7FFBEBEBEFFC5C5
      C5FFCECECEFFD5D5D5FFD6D6D6FD747474BA0000000000000000000000000000
      0000000000000000000000000000000000000101021A8BCCF1FF8AC9EDFF8FCB
      EDFF93CEEFFF97D5F1FF9CD2EBFF9CCDE7FF87C1E0FF6CB0D5FF5BA5D0FF62AD
      D7FF6CB9DFFF78C4E7FF81CFEBFF82D0EDFF7DCEECFF77C7E8FF75C2E3FF73BF
      DDFF78C2E2FF81C6E3FF75BAD7FF81C6E2FF83C4DFFF77B9D6FF72B2CFFF6EAA
      CBFF68A9CAFF68AACCFF406A80D2000000000000000000000000000000000000
      000000000000FFFFFFFFE3E3E3FFE0E0E0FFEEEEEEFFF8F8F8FFFEFEFEFFFAFA
      FAFFF1F1F1FFE5E5E5FFDFDFDFFFD1D1D1FFCCCCCCFFBCBCBCFFBABABAFFA7A7
      A7FFA8A8A8FF979797FF9F9F9FFF939393FF9B9B9BFF9A9A9AFFB9B9B9FFE3E3
      E3FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000F0F0F41F0F0F0FFEEEEEEFFF3F3F3FFB8B8B8FF9393
      93FF929292FF979797FF9D9D9DFFA4A4A4FFAAAAAAFFB2B2B2FFB8B8B8FFC1C1
      C1FFD5D5D5FFE7E7E7FC0B0B0B3C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000F0F0F41F0F0F0FFEEEEEEFFF3F3F3FFB8B8B8FF9393
      93FF929292FF979797FF9D9D9DFFA4A4A4FFAAAAAAFFB2B2B2FFB8B8B8FFC1C1
      C1FFD5D5D5FFE7E7E7FC0B0B0B3C000000000000000000000000000000000000
      000000000000000000000000000000000000000000003F5E6CAC84B8D2EE90D2
      ECFF86CDEAFF7DC9E8FF7BC9E8FF74C2E4FF70BEE0FF6FBADEFF69B3DBFF5CA8
      D0FF539CC7FF4D93C4FF519BC7FF65A9D5FF77B7D8FF78BAD6FF7BC2DCFF86CB
      E5FF84CFEAFF83CEEBFF81CCEDFF7CCAE8FF7DC9E8FF7ECAEBFF82CCEAFF83CA
      E6FF81C4E3FF6193A8DD1521266B000000000000000000000000000000000000
      000000000000FFFFFFFFE3E3E3FFE0E0E0FFEEEEEEFFF8F8F8FFFEFEFEFFFAFA
      FAFFEFEFEFFFE3E3E3FFDCDCDCFFCECECEFFC6C6C6FFB7B7B7FFB5B5B5FFA4A4
      A4FFA2A2A2FF969696FF9F9F9FFF939393FF9B9B9BFF9A9A9AFFB9B9B9FFE3E3
      E3FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000002828286CB6B6B6FFECECECFFA0A0A0FF929292FF8E8E
      8EFF8C8C8CFF919191FF989898FF9F9F9FFFA6A6A6FFADADADFFC0C0C0FFE5E5
      E5FB2A2A2A700000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002828286CB6B6B6FFECECECFFA0A0A0FF929292FF8E8E
      8EFF8C8C8CFF919191FF989898FF9F9F9FFFA6A6A6FFADADADFFC0C0C0FFE5E5
      E5FB2A2A2A700000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0112080E10451F323A83426C7EBF69ACC8F079C4E4FF76C1E2FF76BEDBFF75B9
      D9FF70B7D5FF75BDDDFF85C1E0FF82B8DAFF69A6CEFF569BCAFF5099CAFF58A2
      CFFF64ADD6FF6FB8DDFF75C1E0FF77C1E2FF5B95AEE1335462AA1421266A0407
      0832000000050000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFE3E3E3FFE4E4E4FFEDEDEDFFEAEAEAFFE8E8E8FFDDDD
      DDFFD3D3D3FFD4D4D4FFD4D4D4FFD8D8D8FFDDDDDDFFD6D6D6FFD0D0D0FFCCCC
      CCFFC4C4C4FFA6A6A6FF9D9D9DFF939393FF979797FF9B9B9BFFB9B9B9FFE3E3
      E3FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000003D3D3D82FFFFFFFF9D9D9DFF919191FF8D8D8DFF8A8A
      8AFF888888FF8E8E8EFF949494FF9A9A9AFFB2B2B2FFE3E3E3FC404040870000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003D3D3D82FFFFFFFF9D9D9DFF919191FF8D8D8DFF8A8A
      8AFF888888FF8E8E8EFF949494FF9A9A9AFFB2B2B2FFE3E3E3FC404040870000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000101151420266B538599D371B6
      D0F679C4E3FF77C3E0FF73C2E0FF70BFDEFF6CBADAFF69B4D8FF69B2D6FF568E
      AFEA30536AB911202A7804070A3B000000090000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F6F6F6FFD4D4D4FFC1C1C1FFB7B7B7FFBDBDBDFFC3C3C3FFC9C9
      C9FFCECECEFFD3D3D3FFD7D7D7FFDCDCDCFFE1E1E1FFE4E4E4FFE3E3E3FFE0E0
      E0FFDBDBDBFFD6D6D6FFD2D2D2FFCDCDCDFFC7C7C7FFB5B5B5FFB6B6B6FFDBDB
      DBFF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000ACACACDEA8A8A8FF909090FF8D8D8DFF8A8A8AFF8787
      87FF848484FF888888FFB6B6B6FFE1E1E1FB2D2D2D7000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000ACACACDEA8A8A8FF909090FF8D8D8DFF8A8A8AFF8787
      87FF848484FF888888FFB6B6B6FFE1E1E1FB2D2D2D7000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000E03060730101C20632F505DA71E333B8505090A390000000B0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CDCDCDFFABABABFFB3B3B3FFC2C2C2FFC8C8C8FFCDCDCDFFD2D2
      D2FFD7D7D7FFDBDBDBFFDEDEDEFFE1E1E1FFE4E4E4FFE7E7E7FFE6E6E6FFE1E1
      E1FFDCDCDCFFD7D7D7FFD3D3D3FFCDCDCDFFC8C8C8FFC2C2C2FFBCBCBCFFBCBC
      BCFD000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CACACAF68A8A8AFF8B8B8BFF898989FF868686FF9A9A
      9AFFB6B6B6FBB3B3B3E50C0C0C3C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CACACAF68A8A8AFF8B8B8BFF898989FF868686FF9A9A
      9AFFB6B6B6FBB3B3B3E50C0C0C3C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000020202064A3A3A3EDBABABAFFC4C4C4FFCDCDCDFFD5D5D5FFDADA
      DAFFDDDDDDFFE1E1E1FFE3E3E3FFDEDEDEFFE1E1E1FFE5E5E5FFE4E4E4FFE0E0
      E0FFDBDBDBFFD7D7D7FFD2D2D2FFCDCDCDFFC8C8C8FFBFBFBFFFA5A5A5F02626
      2670000000000000000000000000000000000000000000000000000000000000
      00000000000000000000727272BAC1C1C1FBAEAEAEF4BEBEBEF69E9E9EDB1A1A
      1A57000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000727272BAC1C1C1FBAEAEAEF4BEBEBEF69E9E9EDB1A1A
      1A57000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000001019191958585858A05A5A5AA0A6A6
      A6DCAFAFAFE2B1B1B1E4ADADADE2A5A5A5E0A2A2A2DFA1A1A1E0A1A1A1E09999
      99E0969696E0808080D8464646A0424242A00E0E0E4C00000010000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000031A4DDFF329FD9FF349BD4FF3596D0FF3791CBFF388C
      C7FF3A88C2FF3B83BEFF3C80BBFF0811195F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000010000
      0006000000140000002700000032000000350000003500000035000000350000
      0035000000350000003500000035000000350000003500000035000000350000
      0035000000350000003500000035000000350000003500000035000000350000
      0032000000270000001400000006000000010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000C0C0C860000001D00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000001011D0A27178600000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002FA9E2FF816C59FF816C59FF816C59FFF0F0F0FFEDED
      EDFFEAEAEAFFE8E8E8FFA7C1D8FF3C80BBFF0811195F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000001000000040000
      00120000002C0100014701000155010001580100015801000158010001580100
      0158010001580100015801000158010001580100015801000158010001580100
      0158010001580100015801000158010001580100015801000158020002580100
      0155010001470000002C00000013000000060000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000202023C282828EF05050555000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000040F0855227B47EF0207043C00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A6A6A6FFA6A6A6FFA6A6A6FFA6A6
      A6FFA6A6A6FFA6A6A6FF2EAEE7FF816C59FF816C59FFB0A498FFE4E4E4FFDFDF
      DFFFDADADAFFDDDDDDFFE9E9E9FFA7C1D8FF3C80BBFF7E98AEFFA6A6A6FFA6A6
      A6FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000020000000E0000
      0029A7461BFFA9481AFFAA491AFFAB4919FFAB4919FFAC4A19FFAC4A19FFAC4A
      19FFAC4A19FFAC4A19FFAC4A19FFAC4A19FFAC4A19FFAC4A19FFAC4A19FFAC4A
      19FFAC4A19FFAC4A19FFAC4A19FFAB4919FFAA491AFFA9481AFFA6461BFFA243
      1DFF020002640100014B0000002C000000150000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000171717B5363636FD0D0D0D830000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000A271687268951FE13482AB70000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A8A8A8FFE5E5E5FFE5E5E5FFE5E5
      E5FFE5E5E5FFE5E5E5FF2DB0E9FF816C59FFB0A498FFFFFFFFFFEBEBEBFFE5E5
      E5FFE6E6E6FFE6F1F9FFA9CDE7FF5F9ECEFF3B83BEFF3C80BBFFC3D8EAFFA8A8
      A8FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000060000001BAB49
      1AFFD27B3DFFD6803EFFD8823FFFD8833FFFD9843FFFB34F17FF9E969EFF9E96
      9EFFA49DA4FFB0A8B0FFBFB7BFFFCEC6CEFFDCD4DCFFE2DAE2FFE5DEE5FFE8E1
      E8FFE8E1E8FFE8E1E8FFB34F17FFD8833FFFD7813FFFD47E3FFFD07A3EFFCA74
      3DFFA3441CFF0200026401000147000000270000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000363636F53F3F3FFF1B1B
      1BB2000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000014492AB72A8E54FF23874CF9000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AAAAAAFFE5E5E5FFD9D9D9FFD9D9
      D9FFD8D8D8FFD8D8D8FF2DB0E9FFFFFFFFFFFCFCFCFFF7F7F7FFF1F1F1FFF0F0
      F0FFF4F4F4FF3596D0FF4B9CCFFF78B2D7FF9ACFE9FF70A6CFFF4888BFFF96A2
      ADFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000007AD4B19FFD780
      3CFFDC843CFFDE883DFFE1893EFFE18A3FFFE18B3FFFB95315FFA39EA3FF4E4A
      4EFF4D494DFF4E4A4EFFC5C1C5FFD5D1D5FFE4DFE4FFEBE6EBFFEEEAEEFFF1ED
      F1FFF1EDF1FFF1EDF1FFB95315FFE18A3FFFE0893FFFDD863EFFD8823DFFD27B
      3DFFCB753CFFA2431DFF01000155000000320000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000707075D454545FF4747
      47FF242424C60000000F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000F1C59
      36C935955EFF30925AFF06150C62000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADADFFE5E5E5FFDADADAFFD9D9
      D9FFD9D9D9FFD8D8D8FF2DB0E9FFFFFFFFFFFFFFFFFFFDFDFDFFFAFAFAFFF9F9
      F9FFF7F7F7FF349BD5FFBBE5F8FFB3E2F7FFABDFF6FFA3DCF5FF76ACD5FF4383
      BAFF0204062F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000008B34F17FFDE86
      3BFFE38A3CFFE58D3DFFE78F3EFFE78F3FFFE7903FFFBE5613FFA7A4A7FF3F3C
      3FFF3F3C3FFF3F3C3FFFCAC8CAFFDBD9DBFFEAE8EAFFF1EFF1FFF5F3F5FFF8F6
      F8FFF8F6F8FFF8F6F8FFBE5613FFE78F3EFFE68E3EFFE38C3DFFDF873CFFD882
      3CFFD0793BFFA6461BFF02000258000000350000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002B2B2BCB5252
      52FF575757FF2C2C2CDB0000000F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000F246C42DD479E
      6BFF3D9964FF22643FD300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AFAFAFFFE5E5E5FFDADADAFFCCCC
      CCFFCCCCCCFFCCCCCCFF2DB0E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFC
      FCFFFAFAFAFF32A0D9FFC2E8F9FF5BD3F2FF44C0EDFF67C9EFFFA2DCF5FF5C95
      C0FF3470A3EF0204062F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000008B75215FFE48A
      3AFFE78D3BFFE9903CFFEB913DFFEB923EFFEB923EFFC05812FFA9A8A9FF4140
      41FF424142FF414041FFCDCCCDFFDEDDDEFFEEEDEEFFF5F4F5FFF9F8F9FFFCFB
      FCFFFCFBFCFFFCFBFCFFC05812FFEB923EFFEA913DFFE78E3CFFE38A3BFFDC84
      3BFFD47C3AFFA9481AFF01000158000000350000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000010101264A4A
      4AFA707070FF626262FF2E2E2EDA0000000F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000F276C43DC56A778FF62AE
      83FF3D9664FC0103022900000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B1B1B1FFE5E5E5FFDBDBDBFFDBDB
      DBFFDADADAFFDADADAFF2DB0E9FFFFFFFFFFFFFFFFFFE5F5FCFF2DB0E9FF2EAE
      E7FF2FA9E3FF31A5DEFFC9EAF9FF53CCF0FF5DD3F2FF3FBDECFF67C8EFFF9BD3
      EEFF2D628BD93470A3EF0000000F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000008B95315FFE68C
      39FFEA903AFFEB913BFFEC923CFFED933DFFED943EFFC25912FFAAAAAAFF3F3E
      3FFF3F3E3FFF3F3E3FFFCFCFCFFFE0E0E0FFF0F0F0FFF7F7F7FFFBFBFBFFFEFE
      FEFFFEFEFEFFFEFEFEFFC25912FFED933DFFEB923CFFE9903BFFE68C3AFFDE86
      3AFFD67E39FFAA491AFF01000158000000350000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002020
      20A15D5D5DFF868686FF696969FF282828D50000000F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000F23653ED760AC81FF7CBD9AFF51A5
      75FF1D462EAB0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B3B3B3FFE5E5E5FFDCDCDCFFDBDB
      DBFFDBDBDBFFDADADAFF2DB0E9FF7CCEF1FFFFFFFFFF9CD6EFFF42B5E7FFE8F6
      FDFFDFF3FCFFD8F0FBFFD0EDFAFF4BC7EFFF54CDF1FF5ED4F3FF3FBDECFF66C8
      EFFF87BCD6F02D628BD928547BCF0000000F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000008BB5414FFE78D
      38FFEA8F39FFEB913AFFEE933BFFEE943BFFEE943CFFC35A12FFABABABFF5050
      50FF4F4F4FFF505050FFD0D0D0FFE1E1E1FFF1F1F1FFF8F8F8FFFCFCFCFFFFFF
      FFFFFFFFFFFFFFFFFFFFC35A12FFEE943CFFEC923BFFEA903AFFE68D39FFE087
      39FFD78038FFAB4919FF01000158000000350000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000A424242E2808080FF929292FF717171FF242424D20000000F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000F1F5D38D26DB48DFF90C8A9FF79BB96FF3B85
      5CE80000000B0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B6B6B6FFE7E7E7FFDDDDDDFFCCCC
      CCFFCCCCCCFFCCCCCCFF68BBDEFF2DB0E9FF68BBDEFF4AB5E4FF7AC5E6FFE2F6
      FCFFF5FCFEFF30B3EAFF3AB9EBFF43C0EDFF4CC7EFFF56CEF1FF5FD5F3FF3FBC
      EBFF65C8EFFF86BCD6F03676ABF128547BCF0000000F00000000000000000000
      0000000000000000000000000000000000000000000000000008BB5514FFE88D
      37FFEA9038FFEC9138FFED9339FFEE933AFFEE933BFFC35A12FFABABABFFABAB
      ABFFB2B2B2FFBFBFBFFFD0D0D0FFE1E1E1FFF1F1F1FFF8F8F8FFFCFCFCFFFFFF
      FFFFFFFFFFFFFFFFFFFFC35A12FFEE933AFFED9239FFEA8F39FFE68C38FFE087
      37FFD87E37FFAC4A19FF01000158000000350000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000111111735C5C5CFF919191FF989898FF6E6E6EFF171717AF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000123F25AF6FB48DFF80C999FF96CDADFF55A778FF1226
      1A7D000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B8B8B8FFEFEFEFFFE2E2E2FFDEDE
      DEFFDCDCDCFFDCDCDCFFDBDBDBFF6EC0E4FF2DB0E9FF2DB0E9FFD1EAF5FFA8E7
      F8FFC5EFFAFFFCFEFFFF32B3EAFF3BBAECFF44C1EEFF4DC8EFFF57CFF1FF60D6
      F3FF3FBCEBFF65C7EEFF608FA7D83676ABF128547BCF0000000F000000000000
      0000000000000000000000000000000000000000000000000008BB5514FFE88C
      36FFEA8F36FFEC9037FFED9238FFED9238FFED9239FFC35A12FFC35A12FFC35A
      12FFC35A12FFC35A12FFC35A12FFC35A12FFC35A12FFC35A12FFC35A12FFC35A
      12FFC35A12FFC35A12FFC35A12FFED9238FFEC9038FFEA8E37FFE68B36FFE086
      36FFD87E37FFAC4A19FF01000158000000350000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000008414141DD858585FF6B6B6BFF969696FF666666FF0909096F0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000071A0F6F69B088FF9DD5B2FF92D0A8FF85C29FFF40835CE30000
      0009000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BABABAFFFDFDFDFFE9E9E9FFE4E4
      E4FFE1E1E1FFDEDEDEFFDCDCDCFFDBDBDBFF6EC0E4FF2DB0E9FFA8D9EEFFC1EE
      FAFF96E2F7FFCDF1FBFFDEF3FCFF33B4EAFF3CBBECFF45C2EEFF4FC9F0FF58D0
      F1FF59D1F1FF3FBCEBFF64C7EEFF608FA7D83676ABF11C3C58AF000000000000
      0000000000000000000000000000000000000000000000000008BB5514FFE88C
      34FFEA8E34FFEC8F35FFED9136FFED9137FFED9137FFED8E31FFED8F33FFED8F
      33FFED9034FFED9034FFED9035FFED9035FFED9136FFED9136FFED9136FFED91
      36FFED8F33FFED8F33FFED8E31FFED9036FFEC8F36FFEA8D35FFE68A35FFE085
      34FFD87E35FFAC4A19FF01000158000000350000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000131313725C5C5CFF9F9F9FFF525252FFA4A4A4FF484848FF0101
      012F000000000000000000000000000000000000000000000000000000000000
      00000104022F469B69FFB0DCC2FF53C66EFFA6D8BAFF59AA7CFF14281D7D0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BCBCBCFFFFFFFFFFF3F3F3FFCCCC
      CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFF5FB9E0FF2DB0E9FFA4D5
      EBFFC3EFFAFF9CE4F7FFD3F3FCFFA6DEF6FF34B5EAFF3DBCECFF47C3EEFF50CA
      F0FF59D1F2FF51CBF0FF3FBBEBFF64C7EEFF47718AC83B84BFFF1631489F0000
      0000000000000000000000000000000000000000000000000008BB5514FFE88A
      32FFEA8D33FFEC8E33FFED8F34FFED9034FFED9035FFED8E31FFED8F33FFED8F
      33FFED9034FFED9034FFED9035FFED9035FFED9136FFED9136FFED9136FFED91
      36FFED8F33FFED8F33FFED8E31FFED8F34FFEC8E34FFEA8C33FFE68832FFE083
      32FFD87C33FFAC4A19FF01000158000000350000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000C3B3B3BD59A9A9AFF6D6D6DFF747474FF9D9D9DFF1B1B
      1BBF000000000000000000000000000000000000000000000000000000000000
      0000164C2CBFADD7C0FF7AD392FF72CF8AFFA1D1B6FF3B7B57DB0000000F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BFBFBFFFFFFFFFFFF4F4F4FFF3F3
      F3FFF2F2F2FFEEEEEEFFE7E7E7FFE4E4E4FFE0E0E0FFD2DADEFF4EB8E6FF2DB0
      E9FFB5DEF0FFC5EFFAFFA3E6F8FFDAF5FCFF6FC9F0FF35B6EBFF3EBDECFF48C4
      EEFF51CBF0FF5AD2F2FF4AC5EEFF3FBBEBFF64C6EEFF3E677FC33B84BFFF1631
      489F000000000000000000000000000000000000000000000008BB5514FFE889
      30FFEA8C31FFEC8D32FFED8E32FFED8F32FFED8F33FFED8E31FFED8F33FFED8F
      33FFED9034FFED9034FFED9035FFED9035FFED9136FFED9136FFED9136FFED91
      36FFED8F33FFED8F33FFED8E31FFED8E32FFEC8D32FFEA8B31FFE68831FFE083
      31FFD87C32FFAC4A19FF01000158000000350000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000141414766D6D6DFF9D9D9DFF404040FFAFAFAFFF5A5A
      5AFF0707075F0000000000000000000000000000000000000000000000000512
      0B5F5FAA7DFFC0E7CEFF3DC659FFA7E0B9FF70B890FF182D2183000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C1C1C1FFFFFFFFFFF6F6F6FFF5F5
      F5FFF4F4F4FFF3F3F3FFF2F2F2FFEDEDEDFFE6E6E6FFE3E3E3FFD5DDE1FF4EB8
      E7FF38B3E8FFD2EAF5FFC7EFFAFFAAE8F8FFE1F7FDFF37B4EAFF36B7EBFF40BE
      EDFF49C5EEFF52CCF0FF5CD3F2FF43C0EDFF3FBBEAFF63C6EEFF3E677FC33B84
      BFFF1631489F0000000000000000000000000000000000000008BB5514FFE889
      2FFFEA8C30FFEC8D31FFED8E31FFED8E31FFED8E31FFED8E31FFED8F33FFED8F
      33FFED9034FFED9034FFED9035FFED9035FFED9136FFED9136FFED9136FFED91
      36FFED8F33FFED8F33FFED8E31FFED8E31FFEC8D31FFEA8A30FFE68830FFE083
      31FFD87B31FFAC4A19FF01000158000000350000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010101143C3C3CE6B9B9B9FF4C4C4CFF6C6C6CFFB3B3
      B3FF1B1B1BBF000000000000000000000000000000000000000000000000164C
      2CBFCBE8D8FF78D98FFF4DCB68FFC9E7D7FF3E895DE90102011C000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C3C3C3FFFFFFFFFFF7F7F7FFCCCC
      CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFC2CA
      CEFF4BB5E4FF37B2E7FFD0E8F3FFC9EFFAFFB1EAF9FFE8F9FDFF2EB1E9FF37B8
      EBFF41BFEDFF4AC6EFFF53CDF1FF5DD3F2FF3FBDECFF81D0F1FF3F6983C33989
      C4FF1F416CC309093F9F00000000000000000000000000000008BB5514FFE88A
      31FFEA8B30FFEC8C30FFED8D30FFED8D30FFED8D30FFED8E31FFED8F33FFED8F
      33FFED9034FFED9034FFED9035FFED9035FFED9136FFED9136FFED9136FFED91
      36FFED8F33FFED8F33FFED8E31FFED8D30FFEC8C30FFEA8A2FFFE68831FFE083
      31FFD87C32FFAC4A19FF01000158000000350000000000000000000000000A0A
      0AFF0B0B0BFF0D0D0DFF0E0E0EFF101010FF111111FF131313FF151515FF1616
      16FF181818FF191919FF1B1B1BFF1C1C1CFF1E1E1EFF0C0C0C9F000000000000
      00000000000000000000000000001E1E1EA1949494FF777777FF363636FFB6B6
      B6FF4E4E4EFF0101012F000000000000000000000000000000000104022F51A2
      72FFD1F1DCFF47D062FF84DC98FFA0D1B6FF244B36AC00000000000000000000
      0000000000000000000004160D601DA25CFF1CA35DFF1BA65EFF1AA85FFF19AA
      60FF19AC61FF18AE62FF24B46CFF31B975FF39BB7AFF3CBA7BFF39B677FF31B0
      70FF23A965FF000000000000000000000000C6C6C6FFFFFFFFFFF8F8F8FFF7F7
      F7FFF6F6F6FFF5F5F5FFF4F4F4FFF3F3F3FFF2F2F2FFF3F3F3FFF0F0F0FFEBEB
      EBFFDAE3E6FF38B3E9FF38B3E8FFF0F8FCFFCBF0FBFFB8ECF9FFF0FBFEFF2FB2
      E9FF39B9EBFF42BFEDFF4BC7EFFF5CD0F1FFA2E0F7FF436F85C33693CDFF1E46
      71C31A1AA7FF1919A5FF09093F9F000000000000000000000008BB5514FFE88C
      35FFEA8E35FFEC8F35FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFCFBFCFFE68832FFE083
      32FFD87C33FFAC4A19FF01000158000000350000000000000000000000000909
      09FF323232FF3F3F3FFF606060FF858585FFA5A5A5FFB1B1B1FFCACACAFFCDCD
      CDFFCDCDCDFFCDCDCDFFC3C3C3FF3C3C3CFF0B0B0B9F00000000000000000000
      00000000000000000000000000000A0A0A5F656565FF9D9D9DFF323232FF8888
      88FF7E7E7EFF0C0C0C7F000000000000000000000000000000000921137F8FC5
      A6FFA9EBB8FF4ED568FFB1E9C0FF6FB991FF0E1D156B00000000000000000000
      000000000000000000000000000004160D6041B579FFD3F3E3FFDCF8EAFFDBF7
      EAFFD9F7E9FFD8F7E8FFD0F3E2FFBEEBD5FFA8E1C5FF8DD6B1FF6FC99CFF50BC
      85FF2FB06FFF000000000000000000000000C8C8C8FFFFFFFFFFFAFAFAFFF9F9
      F9FFF8F8F8FFF7F7F7FFF6F6F6FFF5F5F5FFF4F4F4FFF3F3F3FFF5F5F5FFF4F4
      F4FFF0F0F0FFC7DFEAFF38B3E9FF50BAE9FFF0F8FCFFCDF1FBFFBFEEFAFFF7FD
      FEFF30B3EAFF3ABAECFF5DC8EFFFB0E3F7FF467389C3339CD6FF1C4A76C31B1B
      ACFF1B1BA9FF1A1AA8FF1919A5FF09093F9F0000000000000008BB5514FFE88D
      3AFFEA903AFFEC913AFFFFFFFFFFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4
      D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4
      D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD3D3D3FFFCFBFCFFE68A36FFE085
      36FFD87E37FFAC4A19FF01000158000000350000000000000000000000000808
      08FF616160FF303030FF373636FF3F3F3FFF464545FF1A1A1AFF141414FF1414
      14FF5A5A5AFFC5C5C5FF3B3B3BFF0A0A0A9F0000000000000000000000000000
      000000000000000000000000000000000018444444FFBBBBBBFF2D2D2DFF6161
      61FFA8A8A8FF1B1B1BBF00000000000000000000000000000000164C2CBFC0E0
      CEFF8AE79EFF56DB70FFD4F2DEFF4DA876FF0203022300000000000000000000
      00000000000000000000000000000000000004170D603FB779FFD2F3E3FF5FD8
      79FF16C536FF16C536FF1CC63CFF16C435FF16C435FF16C435FF16C435FF6DC9
      9BFF38B777FF000000000000000000000000CACACAFFFFFFFFFFFBFBFBFFCCCC
      CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
      CCFFCCCCCCFFCCCCCCFFAEC7D1FF37B2E7FF50BBE9FFEEF7FCFFCFF1FBFFC6EF
      FAFFFDFEFFFF5DC3EEFFCCECFAFF4A768CC330A6DFFF1B4F7BC31D1DB0FF1B1B
      ACFF1A1AA8FF1A1AA8FF1A1AA8FF1919A5FF0000000000000008BB5514FFE991
      40FFEB9440FFED9540FFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFE
      FEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFE
      FEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFDFDFDFFFBFAFBFFE68C3AFFE087
      3AFFD8803AFFAC4A19FF01000158000000350000000000000000000000000707
      07FF8C8B8BFF3F3F3EFF414141FF464646FF4B4B4AFF171717FF141414FF5C5C
      5CFFC9C9C9FF3A3A3AFF0909099F000000000000000000000000000000000000
      000000000000000000000000000000000002292929FFD4D4D4FF2F2F2FFF4545
      45FFD4D4D4FF2A2A2AEF00000000000000000000000000000000227846EFF4FD
      F8FF78E88FFF5FE077FFEBFAF3FF329B61FF0000000800000000000000000000
      0000000000000000000000000000000000000000000003180D603EB97BFFD2F4
      E4FF60D879FF16C536FF16C536FF16C435FF16C435FF16C435FF16C435FF8CD5
      B0FF3ABE7CFF000000000000000000000000CCCCCCFFFFFFFFFFFDFDFDFFFCFC
      FCFFFBFBFBFFFAFAFAFFF9F9F9FFF7F7F7FFF6F6F6FFF5F5F5FFF4F4F4FFF2F2
      F2FFF0F0F0FFEEEEEEFFECECECFFC6DEE9FF39B4E9FF6AC3EAFFFCFEFFFFD1F2
      FBFFD9F4FCFFE4F5FCFF4D7B8CC32DAFE8FF19547FC31F1FB5FF1F1FB5FF1D1D
      B1FF1A1AA8FF1A1AA8FF1A1AA9FF1A1AA7FF0000000000000008BB5514FFE994
      45FFEB9745FFED9845FFFEFEFEFFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4
      D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4
      D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD3D3D3FFFBFAFBFFE79040FFE18B
      40FFD98440FFAC4A19FF01000158000000350000000000000000000000000606
      06FFAFAEAEFF484847FF494949FF4C4C4CFF4F4F4EFF202020FF5D5D5DFFCBCB
      CBFF393939FF0808089F00000000000000000000000000000000000000000000
      000000000000000000000000000000000000272727FFD7D7D7FF313131FF3333
      33FFD7D7D7FF2E2E2EFF00000000000000000000000000000000268B50FFF5FD
      F9FF73EB8BFF68E681FFF0FBF6FF2B9A5DFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000003180D603DBD
      7DFFD2F4E4FF60D879FF16C535FF16C435FF16C435FF16C435FF16C435FFA7E1
      C4FF37C27EFF000000000000000000000000CFCFCFFFFFFFFFFFFEFEFEFFFDFD
      FDFFFCFCFCFFFBFBFBFFFAFAFAFFF9F9F9FFF8F8F8FFF7F7F7FFF6F6F6FFF2F2
      F2FFEEEEEEFFECECECFFEAEAEAFFDEDEDEFFA3CCDEFF2DB0E9FF71C3E6FFFBFE
      FFFFF3FBFEFF537C8EC32DB0E9FF195683C32020BAFF2222BEFF2323C2FF2020
      B9FF1D1DB1FF1B1BAAFF1B1BACFF0A0A419F0000000000000008BB5514FFEA97
      4AFFEC9A4AFFEE9B4AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFCFBFCFFE79345FFE18E
      45FFD98745FFAC4A19FF01000158000000350000000000000000000000000505
      05FFCDCDCCFF504F4FFF50504FFF515150FF545453FF2F2E2EFF606060FFCECE
      CEFF1F1F1FFF0202025F00000000000000000000000000000000000000000000
      00000000000000000000000000000101012F3D3D3DFFC6C6C6FF333333FF3535
      35FFDBDBDBFF2E2E2EFF00000000000000000000000000000000258D51FFF7FD
      FAFF82F098FF75EC8EFFE2F9E9FF3DA56BFF0105022F00000000000000000000
      000000000000000000000000000000000000000000000000000003180D5F24B5
      6CFFD3F4E5FF61D87AFF16C435FF16C435FF16C435FF16C435FF16C435FFBDEA
      D4FF2DC47CFF000000000000000000000000D1D1D1FFFFFFFFFFFFFFFFFFCCCC
      CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFF7F7F7FFF3F3
      F3FFA5A5A5FFB2B2B2FFC1C1C1FFCECECEFFD5D5D5FF97C8DEFF2DB0E9FF3573
      8FC7577D8FC32DB0E9FF195683C32121BCFF2525C8FF2929D3FF2626CAFF2323
      C2FF1F1FB7FF1D1DB1FF0A0A439F000000000000000000000008BB5514FFEA9A
      4FFFEC9D4FFFEE9E4FFFFFFFFFFFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4
      D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4
      D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD3D3D3FFFCFBFCFFE8974CFFE291
      4CFFDA8A4BFFAC4A19FF01000158000000350000000000000000000000000404
      04FFE7E7E6FF545453FF555554FF585857FF5D5D5CFF4C4B4BFF191919FF8989
      89FFB9B9B9FF212121FF0101013F000000000000000000000000000000000000
      00000000000000000000000000000B0B0B8F767676FFA9A9A9FF353535FF4141
      41FFDFDFDFFF2D2D2DFF00000000000000000000000000000000258E52FFF8FE
      FBFF95F6A9FF84F19AFFCDF8D8FF7DC49EFF0A301B8F00000000000000000000
      00000000000000000000000000000000000000000000010A053F24B46CFFBDEB
      D4FF88E29DFF16C536FF16C435FF16C435FF16C435FF16C435FF16C435FFCFF3
      E2FF1FC576FF000000000000000000000000D3D3D3FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEFFFDFDFDFFFCFCFCFFFBFBFBFFFAFAFAFFF9F9F9FFF5F5
      F5FFB5B5B5FFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3FFD3D3D3FF6F99A9DA2DB0
      E9FF2DB0E9FF195683C32121BCFF2727CEFF2F2FE4FF2C2CDBFF2929D3FF2323
      C3FF1F1FB5FF0B0B459F00000000000000000000000000000008BB5514FFEA9D
      54FFECA054FFEEA154FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFCFBFCFFE89A52FFE294
      51FFDA8D50FFAC4A19FF01000158000000350000000000000000000000000303
      03FFEBEBEAFF5E5E5DFF5F5F5EFF7C7C7BFF81807EFF6D6D6CFF262625FF1D1D
      1DFF999999FFA1A1A1FF1E1E1EF00202024F0000000000000000000000000000
      000000000000000000000101012F222222FFCACACAFF606060FF373737FF6363
      63FFC0C0C0FF191919BF00000000000000000000000000000000144F2DBFD2EA
      DDFFC3FACFFF92F7A7FFA2F5B3FFDAF1E5FF1F9B59FF0105032F000000000000
      0000000000000000000000000000000000000210094F229E60F0A5E3C4FF97E5
      AAFF16C536FF16C435FF16C435FF1BC539FF1DC63BFF16C435FF16C435FFD9F7
      E9FF0EC56FFF000000000000000000000000D5D5D5FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFEFEFEFFFDFDFDFFFCFCFCFFFBFBFBFFFAFAFAFFF8F8
      F8FFC6C6C6FFFFFFFFFFF0F0F0FFE9E9E9FFD7D7D7FFADADADE1000000000618
      2160195683C32121BCFF2929D2FF3535F5FF3232EDFF2F2FE4FF2828D0FF2020
      BAFF0C0C469F0000000000000000000000000000000000000008BB5514FFEBA2
      5EFFEDA55EFFEFA65EFFFFFFFFFFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4
      D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4
      D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD3D3D3FFFCFBFCFFE9A15DFFE39B
      5CFFDB935BFFAC4A19FF01000158000000350000000000000000000000000202
      02FFEFEFEDFF686766FF949493FFE6E6E5FFDEDEDDFF7E7D7CFF595958FF1F1F
      1FFF202020FF787878FFBEBEBEFF3C3C3CFF0909099F0101013F000000000000
      00000101012F0909098F202020FF848484FFBABABAFF373737FF393939FF9191
      91FFACACACFF1010109F000000000000000000000000000000000D37209FB8DD
      C9FFE8FDEDFFB8FAC6FF99F7ADFFDBFAE2FF8ACDAAFF1E9F5BFF09321D8F0005
      032F0000000000000000010A053F0942259F3FBB7DFFC1ECD7FF71DC89FF16C5
      36FF16C536FF16C435FF18C537FF8CE2A8FFBCEFCFFF29C947FF16C435FFDBF7
      EAFF0EC66FFF000000000000000000000000D8D8D8FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFDFDFDFFFCFCFCFFFBFBFBFFFAFA
      FAFFD3D3D3FFFFFFFFFFEAEAEAFFE1E1E1FFC7C7C7F300000010000000000000
      000004041A602121BCFF2929D3FF3636F8FF3535F5FF2C2CDBFF2121BCFF0D0D
      489F000000000000000000000000000000000000000000000008BB5514FFECA9
      6AFFEEAB6BFFF0AD6BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFCFBFCFFEAA76AFFE3A1
      68FFDB9866FFAB4919FF01000158000000350000000000000000000000000101
      01FFF2F1F0FFD2D2D0FFE8E7E6FF535353FF7B7A7AFFDEDDDBFF8E8D8BFF3B3B
      3AFF222222FF242424FF575757FFD1D1D1FF9A9A9AFF4B4B4BFF191919FF1A1A
      1AFF363636FF696969FFB7B7B7FFBCBCBCFF424242FF393939FF3B3B3BFFB3B3
      B3FF707070FF0505055F0000000000000000000000000000000004140B5F75BC
      95FFFCFEFDFFDEFDE4FFBFFACCFFA5F8B7FFDBFBE4FFBFE6D2FF6CC497FF37AF
      70FF1BA65EFF1AA860FF4DBE86FF9DDDBDFFD4F6DEFF56D770FF1AC73AFF16C5
      36FF16C536FF1BC63AFF91E3A6FF1FC172FF38CA85FFD3F5E5FF32CC4FFFDCF8
      EBFF0DC770FF000000000000000000000000DADADAFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFDFDFDFFF8F8
      F8FFDADADAFFFFFFFFFFE8E8E8FFDADADAFF0707073000000000000000000000
      00000000000004041A602121BCFF2929D3FF2E2EE1FF2121BCFF0D0D489F0000
      0000000000000000000000000000000000000000000000000007BB5414FFEDB2
      7CFFF0B57DFFF1B67DFFFEFEFEFFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4
      D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4
      D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD2D2D2FFFBFAFBFFEBB07BFFE4A9
      79FFDCA076FFAA491AFF01000155000000320000000000000000000000000000
      00FFF5F5F3FFE9E8E7FF363636FF010101600303039FB1B1B0FFD0D0CEFF908F
      8DFF333232FF262626FF282828FF292929FF747474FFBEBEBEFFEDEDEDFFEDED
      EDFFCACACAFFA8A8A8FF6F6F6FFF373737FF393939FF3B3B3BFF525252FFE1E1
      E1FF333333FF000000100000000000000000000000000000000000000010309C
      60FFF0F9F4FFFFFFFFFFE5FDEAFFC6FBD1FFA7F9B8FFAFF8BEFFCBF9D5FFDCFA
      E4FFF2FCF7FFF1FCF7FFC9F5D5FF88E69CFF3ED55AFF33D150FF28CC46FF1BC8
      3BFF16C536FF76DD8DFF3AC784FF0649299F021B0F6037CC86FFD3F5E5FFDEF8
      ECFF0DC871FF000000000000000000000000DCDCDCFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFF2F2
      F2FFDCDCDCFFF1F1F1FFDCDCDCFF1F1F1F600000000000000000000000000000
      0000000000000000000004041A602121BCFF2121BCFF0D0D489F000000000000
      0000000000000000000000000000000000000000000000000006B95315FFECB8
      89FFF0BB8AFFF1BD8BFFFCFCFCFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFD
      FDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFD
      FDFFFDFDFDFFFDFDFDFFFDFDFDFFFCFCFCFFFBFBFBFFF9F8F9FFEBB688FFE4AE
      85FFDBA581FFA9481AFF01000147000000270000000000000000000000000000
      00FFCCCCCBFF303030FF000000600000000000000010050505CFBDBCBBFFD7D6
      D3FF9D9C99FF3F3F3FFF2A2A2AFF2B2B2BFF2D2D2DFF2F2F2FFF313131FF3232
      32FF343434FF363636FF383838FF393939FF3B3B3BFF3D3D3DFFB9B9B9FF8C8C
      8CFF0E0E0E9F0000000000000000000000000000000000000000000000000D3A
      219F91CCACFFFEFFFEFFFFFFFFFFECFEF0FFCDFBD7FFAEF9BEFF91F6A6FF85F2
      9CFF79ED91FF6EE987FF63E47CFF57DF71FF4CDB67FF41D65DFF35D253FF29CC
      47FF88E29EFF3AC784FF0C7C47CF0000001000000000021B0F6036D088FFD3F5
      E5FF0CCA71FF000000000000000000000000DFDFDFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFFE5E5
      E5FFDFDFDFFFDFDFDFFF1F1F1F60000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000002B75215FFEBBA
      92FFEEBE93FFF0C094FFFBFAFBFFD2D1D2FFD2D1D2FFD2D1D2FFD2D1D2FFD2D1
      D2FFD2D1D2FFD2D1D2FFD2D1D2FFD2D1D2FFD2D1D2FFD2D1D2FFD2D1D2FFD2D1
      D2FFD2D1D2FFD2D1D2FFD2D1D2FFD1D0D1FFD0CFD0FFF7F5F7FFE9B891FFE1B0
      8DFFD8A689FFA7461BFF0000002C000000150000000000000000000000000000
      00FF000000FF0000006000000000000000000000000000000010050505CFAFAF
      ADFFE7E6E3FFAFAEABFF686866FF2D2D2DFF2F2F2FFF313131FF333333FF3434
      34FF363636FF383838FF3A3A3AFF3B3B3BFF3D3D3DFFB0B0B0FFCDCDCDFF3131
      31FF000000200000000000000000000000000000000000000000000000000002
      01202E9F62FFD6EDE1FFFEFFFEFFFFFFFFFFF3FEF6FFD4FCDCFFB5FAC3FF96F7
      AAFF88F39EFF7CEE94FF71EA8AFF65E57EFF5AE174FF4FDC6AFF4DD968FFB5EE
      C6FF49CA8CFF0C7C46CF00000010000000000000000000000000021C106035D2
      89FF0CCB72FF000000000000000000000000DFDFDFFFDFDFDFFFDFDFDFFFDFDF
      DFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFC3C3
      C3EF585858A00707073000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000100000004B852
      15FFECBC95FFEEBF96FFF9F7F9FFF9F7F9FFF9F8F9FFF9F8F9FFF9F8F9FFF9F8
      F9FFF9F8F9FFF9F8F9FFF9F8F9FFF9F8F9FFF9F8F9FFF9F8F9FFF9F8F9FFF9F8
      F9FFF9F8F9FFF9F8F9FFF9F7F9FFF9F7F9FFF7F5F7FFF3F0F3FFE6B592FFDEAD
      8EFFAB491AFF0000002900000012000000060000000000000000000000000000
      00FF000000600000000000000000000000000000000000000000000000100707
      07CF989795FFF4F3F0FFCFCEC9FFB4B2AEFF757472FF464645FF343434FF3636
      36FF383838FF3A3A3AFF3C3C3CFF5D5D5CFFCACAC8FFD3D3D3FF2E2E2EFF0505
      0560000000000000000000000000000000000000000000000000000000000000
      000004150C602DA263FFD6EDE1FFFEFFFEFFFFFFFFFFFBFFFCFFDCFCE2FFBCFA
      C9FF9DF8B0FF8BF4A0FF7EEF96FF73EB8CFF68E682FF81E896FFCCF3DDFF3CC6
      84FF0C7B46CF000000100000000000000000000000000000000000000000011C
      10600BCC72FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0004B75215FFB95315FFBB5414FFBB5514FFBB5514FFBB5514FFBB5514FFBB55
      14FFBB5514FFBB5514FFBB5514FFBB5514FFBB5514FFBB5514FFBB5514FFBB55
      14FFBB5514FFBB5514FFBB5514FFBB5414FFBA5315FFB75215FFB34F17FFAD4B
      19FF0000001B0000000E00000004000000010000000000000000000000000000
      005F000000000000000000000000000000000000000000000000000000000000
      0010060606BF444443FFE4E2DEFFF2F1ECFFE3E2DCFFDCDAD5FFC7C4C0FFA6A5
      A2FFAEADA9FFC3C1BDFFE2E0DBFFF3F2F0FF919191FF2D2D2DFF040404600000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000004160C602CA665FF8FD1AEFFF1FAF5FFFDFEFEFFFEFFFEFFE5FD
      EAFFC3FBCFFFA4F8B6FFA0F6B3FFACF5BDFFD4F8DDFF92DEB9FF21BD71FF0B68
      3ABF000000100000000000000000000000000000000000000000000000000000
      0000011C10600000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000020000000500000007000000080000000800000008000000080000
      0008000000080000000800000008000000080000000800000008000000080000
      0008000000080000000800000008000000080000000800000008000000080000
      0007000000050000000200000001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000010101600B0B0BEF605F5EFFCAC9C6FFF0EEEAFFFFFDF8FFFFFD
      F8FFF0EFECFFCAC9C7FF7E7E7EFF292929FF151515DF02020240000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000020A0540147D46DF29AB68FF7ECEA5FFB7E4CDFFE0F4
      EAFFFAFEFCFFF9FEFBFFCEEFDFFF94DDBAFF31BF79FF12A15AEF031A0F600000
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
      000000000000000000000000000002020260060606B00D0D0DDF121212FF1414
      14FF151515FF0C0C0CC007070790010101400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000010A064008351E900F6137C018AD
      62FF18AF63FF17B164FF10894CDF095530B003190E6000000000000000000000
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
      0000BEB6AFFFBFB8B1FFC1BAB3FFC2BBB5FFC4BDB7FFC5BFB9FFC6C0BBFFC8C2
      BDFFC9C3BFFFCAC5C1FFCCC7C3FFCDC8C4FFCECAC6FFD0CCC9FFD1CECBFFD2CF
      CCFFD4D1CEFFD5D3D0FFD6D4D2FFD8D6D4FFD9D8D6FFDAD9D8FFDCDBDAFFDDDD
      DCFF000000000000000000000000000000000000000000000000000000000000
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
      0000BDB5ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFFCFCFCFFFAFAFAFFF6F6F6FFF3F3F3FFEEEEEEFFEAEAEAFFE5E5E5FFDCDB
      DAFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000010000000200000004000000050000
      0006000000080000000E070401410000000A0000000900000008000000070000
      0006000000050000000300000001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000100000002000000040000
      0005000000100603013A000000090000000A0000000A00000009000000080000
      0007000000060000000500000003000000010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BBB3ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFDFDFDFFFBFBFBFFF8F8F8FFF6F6F6FFF4F4F4FFF2F2F2FFF0F0F0FFEFEF
      EFFFEEEEEEFFEDEDEDFFEBEBEBFFEAEAEAFFE9E9E9FFE7E7E7FFEAEAEAFFDAD9
      D8FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000100000005000000070000000A0000000C0000000E000000100000
      0011000000130000001B7D441CF50A05024E0000001400000014000000130000
      0011000000100000000E0000000C0000000A0000000700000003000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000200000005000000080000000A0000000C0000000E0000
      0010010000207B431CF408040149000000140000001400000014000000140000
      001300000011000000100000000E0000000C0000000A000000070000000B8749
      1FFF87491FFF87491FFF81471EFA000000000000000000000000000000000000
      0000BAB1A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFDFDFDFFFBFBFBFFF9F9F9FFF7F7F7FFF5F5F5FFF2F2F2FFF0F0
      F0FFEFEFEFFFEEEEEEFFEDEDEDFFEBEBEBFFEAEAEAFFE9E9E9FFEEEEEEFFD9D8
      D6FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000010000
      0004000000070000000A0000000D0000000F0000001200000015000000170000
      00190000001B0000002486481FFE7F461EF70D07035C0000001D0000001B0000
      00190000001700000015000000120000000F0000000D0000000A000000070000
      0003000000000000000000000000000000000000000000000000000000000000
      000100000004000000070000000A0000000D0000000F00000012000000150000
      00170100002785491EFD7D451DF60B0602570000001F0000001E0000001D0000
      001B000000190000001700000015000000120000000F0000000D000000128347
      1FFCA56635FFA46434FF83471FFB000000000000000000000000000000000000
      0000B9B0A7FFFFFFFFFFFFFFFFFFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0
      A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0
      A5FFC0B6ACFFC7BEB5FFCCC5BDFFD1CBC4FFEBEBEBFFEAEAEAFFF3F3F3FFD8D6
      D4FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000030000
      0006000000090000000C0000000E0000001100000014000000170000001A0000
      001D000000200000002A83471FFCA06235FF7F471FF810080365000000200000
      001D0000001A0000001700000014000000120000000F0000000C000000090000
      0006000000020000000000000000000000000000000000000000000000000000
      000300000006000000090000000C0000000E0000001200000014000000170000
      001A0100002B81471FF9A06134FF7F461EF70E08036500000026000000230000
      00200000001D0000001A0000001700000014000000120000000E000000148347
      1FFCA66839FFA56737FF83471FFB000000000000000000000000000000000000
      0000B7AEA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFBFBFBFFF9F9F9FFF7F7F7FFF5F5
      F5FFF3F3F3FFF2F2F2FFF0F0F0FFEFEFEFFFEDEDEDFFECECECFFF6F6F6FFD6D4
      D3FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000010000
      0004000000070000000A0000000D0000000F0000001200000015000000170000
      00190000001B0000002483471FFCA96C3DFFA16435FF7F471EF7120A04680000
      00190000001700000015000000120000000F0000000D0000000A000000070000
      0004000000010000000000000000000000000000000000000000000000000000
      000100000004000000070000000A0000000D0000000F00000012000000150000
      00170100002781471FF9A96C3DFFA06435FF7F471EF7100803640000001D0000
      001B000000190000001700000015000000120000000F0000000D000000128347
      1FFCA86B3CFFA7693AFF83471FFB000000000000000000000000000000000000
      0000B6ACA3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFCFCFCFFFAFAFAFFF8F8
      F8FFF6F6F6FFF3F3F3FFF2F2F2FFF0F0F0FFEFEFEFFFEDEDEDFFFAFAFAFFD5D3
      D0FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000300000005000000070000000A0000000C0000000E000000100000
      0011000000130000001B83471FFCAA6E40FFA66839FFA26638FF80471FF7140B
      0469000000100000000E0000000C0000000A0000000800000005000000030000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000300000005000000080000000A0000000C0000000E0000
      001001000020814720F9AA6E40FFA66839FFA36538FF7F461FF6120904640000
      001300000011000000100000000E0000000C0000000A000000080000000D8347
      1FFCA96D3FFFA86C3DFF83471FFB000000000000000000000000000000000000
      0000B5ABA1FFFFFFFFFFFFFFFFFFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0
      A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0
      A5FFBBB0A5FFBBB0A5FFBCB1A6FFC0B6ACFFF0F0F0FFEEEEEEFFFCFCFCFFD4D1
      CEFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000020000000400000005000000070000
      0008000000090000001283471FFCAB6F42FFA46433FFA66839FFA4673AFF7F47
      1FF6160C056B0000000500000004000000020000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000200000004000000050000
      000700000017814720F9AB6F42FFA46433FFA66839FFA3663AFF7F471FF6140B
      0465000000080000000700000005000000040000000200000000000000088348
      20FCAB6F42FFA96E40FF83471FFB000000000000000000000000000000000000
      0000B3A99FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFCFC
      FCFFFAFAFAFFF8F8F8FFF6F6F6FFF4F4F4FFF2F2F2FFF1F1F1FFFEFEFEFFD2CF
      CDFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008147
      1EFA874A20FF874A20FF874A20FF874A20FF874A20FF874A20FF874A20FF874A
      20FF874A20FF874A20FF854A20FDAC7245FFA46433FFA46433FFA66839FFA568
      3BFF814720F51A0E067000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000087491FFF874A
      20FF874A20FF874A20FF874A20FF874A20FF874A20FF874A20FF874A20FF874A
      20FF874A20FF854A20FCAC7145FFA46433FFA46433FFA66839FFA4683BFF8046
      20F5160C05680000000000000000000000000000000000000000000000088348
      20FCAC7245FFAB7044FF83471FFB000000000000000000000000000000000000
      0000B2A79DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFDFDFDFFFBFBFBFFF8F8F8FFF6F6F6FFF4F4F4FFF2F2F2FFFFFFFFFFD1CE
      CBFF000000000000000000000000000000001F22CCFF1E21CAFF1E21C8FF1E21
      C5FF1D20C3FF1D20C1FF1D1FBFFF1C1FBCFF1C1FBAFF1C1EB8FF1B1EB6FF1B1D
      B4FF1B1DB2FF1B1CB1FF1B1CAEFF1B1CACFF1B1CAAFF1A1CA8FF1A1BA6FF1A1B
      A4FF191AA2FF191A9FFF191A9DFF18199AFF181998FF181895FF171793FF1617
      90FF16168EFF15168BFF151588FF151587FF0000000000000000000000008348
      20FBB48057FFB37E55FFB37D54FFB27C52FFB17A50FFB17A50FFB0794EFFAF77
      4CFFAF764BFFAE764AFFAE7448FFAD7347FFA46433FFA46433FFA46433FFA668
      39FFA6693CFF804621F51E11077A000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000874A20FFB481
      58FFB37E55FFB37D54FFB27C52FFB17A50FFB0794FFFB0794EFFAF774CFFAF76
      4BFFAE764AFFAE7448FFAD7246FFA46433FFA46433FFA46433FFA66839FFA66A
      3CFF804720F51B0E067200000000000000000000000000000000000000088348
      20FCAE7448FFAC7347FF83471FFB000000000000000000000000000000000000
      0000B1A69CFFFFFFFFFFFFFFFFFFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0
      A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0
      A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFF7F7F7FFF4F4F4FFFFFFFFFFD0CC
      C9FF000000000000000000000000000000001F22CEFFE6E6FBFFE4E5FBFFE3E3
      FBFFE2E2FBFFE0E1FBFFDFDFFAFFDDDEFAFFDCDDFAFFDBDBFAFFD6D7F9FFCCCC
      F7FFC2C3F5FFB9BAF3FFB0B0F0FFA6A6EDFF9D9DE9FF9494E5FF8B8BE1FF8182
      DDFF7777D7FF6E6ED2FF6465CCFF5C5CC6FF5353C0FF4A4AB8FF4141B1FF3939
      AAFF3030A2FF272798FF1E1E90FF151588FF0000000000000000000000008448
      21FBB48158FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFA66838FFA76B3DFF804822F4241408840000000000000000000000000000
      0000000000000000000000000000000000000000000000000000884A21FFB582
      59FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA668
      39FFA66B3EFF7F4721F42011077C000000000000000000000000000000088348
      20FCAF774CFFAE754AFF83471FFB000000000000000000000000000000000000
      0000AFA49AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFDFDFDFFFBFBFBFFF9F9F9FFF7F7F7FFFFFFFFFFCECA
      C6FF000000000000000000000000000000001F23D1FFE8E8FCFF6B6BEEFF6767
      EDFF6262ECFF5E5EEBFF5959EBFF5555EAFF5050E9FF4B4BE8FF4747E7FF4141
      E6FF3B3BE4FF3636E3FF3131E0FF2C2CDEFF2929DBFF2727D6FF2626D1FF2525
      CCFF2323C7FF2222C2FF2121BDFF2020B7FF1F1FB2FF1D1DACFF1C1CA7FF1B1B
      A1FF19199CFF181895FF222294FF15168AFF0000000000000000000000008448
      21FBB5835BFFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFA46433FFA66838FFA86B40FF814A22F42A16098E00000000000000000000
      0000000000000000000000000000000000000000000000000000884A21FFB684
      5CFFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFA66838FFA86B3FFF804922F4251408860000000000000000000000088348
      20FCB0794FFFAF774CFF83471FFB000000000000000000000000000000000000
      0000AEA298FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFBFBFBFFF9F9F9FFFFFFFFFFCDC9
      C5FF000000000000000000000000000000002023D3FFEAEAFCFF6D6DEEFF6969
      EDFF6464EDFF5F5FECFF5B5BEBFF5656EAFF5151E9FF4D4DE8FF4848E7FF4343
      E7FF3D3DE5FF3939E3FF3333E1FF2E2EDFFF2A2ADCFF2828D8FF2727D3FF2626
      CEFF2424CAFF2323C4FF2222BFFF2020BAFF1F1FB5FF1E1EAFFF1C1CA9FF1B1B
      A4FF1A1A9EFF191999FF272798FF16168DFF0000000000000000000000008448
      21FBB6855DFFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFA46433FFA46433FFA66838FFA96E40FF824A24F32F1A0B97000000010000
      0000000000000000000000000000000000000000000000000000884A21FFB786
      5EFFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFA46433FFA66838FFA96E41FF814A23F32B170A9000000000000000088348
      20FCB27B51FFB07950FF83471FFB000000000000000000000000000000000000
      0000ADA196FFFFFFFFFFFFFFFFFFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0
      A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0
      A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFFEFEFEFFFCFCFCFFFFFFFFFFCCC7
      C3FF000000000000000000000000000000002024D6FFECEDFCFF6F6FEFFF6B6B
      EEFF6666EDFF6161ECFF5D5DEBFF5858EAFF5353E9FF4F4FE9FF4A4AE8FF4545
      E7FF4040E6FF3A3AE4FF3636E2FF3030E0FF2C2CDEFF2929DAFF2727D6FF2626
      D0FF2525CCFF2323C7FF2222C1FF2121BCFF2020B7FF1E1EB1FF1D1DACFF1C1C
      A6FF1B1BA1FF19199CFF2B2B9DFF16178FFF0000000000000000000000008448
      21FBB88760FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFA46433FFA46433FFA46433FFA66737FFA96E42FF824B25F3371E0DA20000
      0002000000000000000000000000000000000000000000000000884A21FFB887
      60FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFA46433FFA46433FFA66838FFA96F42FF814A24F3311B0B9A000000098348
      20FCB37E55FFB27C53FF83471FFB000000000000000000000000000000000000
      0000AB9F94FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFCAC5
      C1FF000000000000000000000000000000002024D8FFEEEFFDFF7171EFFF6C6C
      EEFF6868EDFF6363ECFF5E5EECFF5A5AEBFF5555EAFF5050E9FF4C4CE8FF4747
      E7FF4242E6FF3C3CE5FF3737E3FF3232E1FF2D2DDFFF2929DCFF2828D7FF2727
      D3FF2525CDFF2424C9FF2A2AC5FF2727C0FF2323BAFF2121B5FF1E1EAEFF1C1C
      A9FF1B1BA4FF19199DFF3030A1FF161791FF0000000000000000000000008448
      21FBB98862FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFA46433FFA46433FFA46433FFA46433FFA66737FFAB7043FF834C25F33C21
      0EAA000000030000000000000000000000000000000000000000884A21FFB989
      63FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFA46433FFA46433FFA46433FFA66737FFAA6F44FF834B25F3391F0DA68348
      20FCB58158FFB37E55FF83471FFB000000000000000000000000000000000000
      0000AA9D92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9C4
      BFFF000000000000000000000000000000002124DAFFF1F1FDFF7272EFFF6E6E
      EEFF6969EEFF6565EDFF6060ECFF5C5CEBFF5757EAFF5252E9FF4E4EE8FF4949
      E8FF4D4DE8FF5252E8FF5959E8FF5B5BE7FF6060E7FF5D5DE5FF6161E3FF5A5A
      DEFF5252D9FF4A4AD3FF4343CEFF3B3BC8FF3232C1FF2A2ABAFF2222B2FF1D1D
      ACFF1C1CA6FF1A1AA0FF3334A4FF171793FF0000000000000000000000008448
      21FBC49773FFB17546FFB17546FFB17546FFB17546FFB17546FFB17546FFB175
      46FFB17546FFB17546FFB17546FFB17546FFB17546FFB17546FFB17546FFB175
      46FFB17546FFB17546FFB17546FFB17546FFB27748FFB88255FF955D36F8562F
      14CC0000000C0000000000000000000000000000000000000000894A22FFC498
      73FFB17546FFB17546FFB17546FFB17546FFB17546FFB17546FFB17546FFB175
      46FFB17546FFB17546FFB17546FFB17546FFB17546FFB17546FFB17546FFB175
      46FFB17546FFB17546FFB17546FFB27748FFB78157FF935D34F8542E14C9844A
      22FCBF8D63FFBD8A60FF83471FFB000000000000000000000000000000000000
      0000A99C90FFFFFFFFFFFEFEFEFFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0
      A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0
      A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFFFFFFFFFFFFFFFFFFFFFFFFFC8C2
      BDFF000000000000000000000000000000002125DDFFF3F3FDFF7474F0FF7474
      EFFF7E7EF0FF7A7AEFFF8282F0FF8888F0FF8989F0FF9595F2FF9090F1FFA0A0
      F3FF9999F2FF9292F0FF8989EFFF8181EDFF7878EBFF6E6EE9FF6666E6FF5E5E
      E1FF5757DDFF4F4FD6FF4747D1FF3F3FCBFF3737C4FF2E2EBDFF2626B6FF1E1E
      AEFF1C1CA9FF1B1BA4FF3838A8FF171895FF0000000000000000000000008448
      21FBC69C77FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB378
      49FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB378
      49FFB37849FFB37849FFB37849FFB47A4CFFBB875CFF955F38F74F2B13C30000
      0009000000000000000000000000000000000000000000000000884B22FFC79C
      78FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB378
      49FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB378
      49FFB37849FFB37849FFB47B4DFFBA875DFF945E36F74A2911BD0000000F8449
      22FCBF8F64FFBE8C63FF83471FFB000000000000000000000000000000000000
      0000A79A8EFFFFFFFFFFFDFDFDFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6C0
      BBFF000000000000000000000000000000002125DDFFFAFAFFFFC1C1F8FFC1C1
      F8FFBFBFF8FFBEBEF7FFBCBCF7FFB9B9F7FFB5B5F6FFB1B1F5FFACACF4FFA6A6
      F3FF9F9FF2FF9898F1FF9090F0FF8787EEFF7D7DEDFF7474EAFF6B6BE7FF6262
      E3FF5B5BDEFF5252DAFF4B4BD3FF4343CEFF3939C7FF3232C0FF2929B9FF2020
      B1FF1D1DABFF1C1CA6FF3D3EACFF171898FF0000000000000000000000008448
      21FBC79D79FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB378
      49FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB378
      49FFB37849FFB37849FFB57B4DFFBD895EFF925D36F7472711B9000000060000
      0000000000000000000000000000000000000000000000000000884B22FFC89D
      7AFFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB378
      49FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB378
      49FFB37849FFB57C4EFFBC895EFF915B34F642240FB200000005000000088449
      22FCC19066FFBF8E65FF83471FFB000000000000000000000000000000000000
      0000A6988CFFFFFFFFFFFCFCFBFFFDFDFCFFFEFEFDFFFFFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5BF
      B9FF000000000000000000000000000000002125DDFFFBFBFFFFC6C6F9FFC6C6
      F8FFC5C5F9FFC4C4F8FFC2C2F8FFC0C0F7FFBCBCF7FFB7B7F6FFB2B2F5FFABAB
      F5FFA5A5F4FF9E9EF2FF9595F1FF8D8DF0FF8383EDFF7A7AEBFF7070E9FF6666
      E5FF5F5FE0FF5757DCFF4F4FD6FF4646D0FF3E3ECAFF3535C4FF2B2BBCFF2222
      B4FF1D1DAEFF1C1CA9FF4242B1FF18199AFF0000000000000000000000008448
      21FBC89F7BFFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB378
      49FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB378
      49FFB37849FFB57C4FFFBD8B62FF905A34F63F230FAE00000004000000000000
      0000000000000000000000000000000000000000000000000000884B22FFC89F
      7CFFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB378
      49FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB378
      49FFB67D4FFFBC8C62FF8F5933F639200EA60000000200000000000000088449
      22FCC19168FFC08F67FF83471FFB000000000000000000000000000000000000
      0000A4978AFFFFFFFFFFFBFAFAFFC3B9AFFFC1B7ADFFBFB5ABFFBDB3A8FFBBB0
      A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0
      A5FFBBB0A5FFBBB0A5FFBBB0A5FFBBB0A5FFFFFFFFFFFFFFFFFFFFFFFFFFC4BD
      B7FF000000000000000000000000000000002125DDFFFDFDFFFFCACAF9FFC8C8
      F9FFC7C7F9FFC5C5F8FFC3C3F8FFC1C1F7FFBFBFF7FFBCBCF7FFB7B7F6FFB1B1
      F5FFAAAAF4FFA3A3F3FF9A9AF2FF9292F0FF8989EFFF7E7EEDFF7575EAFF6B6B
      E7FF6262E3FF5A5ADEFF5151D8FF4949D3FF4141CDFF3838C6FF2F2FBFFF2626
      B7FF1E1EB0FF1D1DABFF4747B4FF18199CFF0000000000000000000000008448
      21FBC9A17EFFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB378
      49FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB378
      49FFB67E51FFBE8E65FF8D5832F6371E0DA20000000200000000000000000000
      0000000000000000000000000000000000000000000000000000884B22FFCAA1
      80FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB378
      49FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB77E
      52FFBE8D64FF8D5731F6311B0C9A000000010000000000000000000000088449
      22FCC3936BFFC19169FF83471FFB000000000000000000000000000000000000
      0000A39588FFFFFFFFFFF9F9F8FFFBFAF9FFFCFBFBFFFCFCFCFFFDFDFDFFFEFE
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFBFBFAFFF0EEEDFFC2BB
      B5FF000000000000000000000000000000002125DDFFFDFDFFFFCBCBF9FFC9C9
      F9FFC7C7F9FFC5C5F8FFC3C3F8FFC1C1F8FFC0C0F7FFBEBEF7FFBCBCF7FFB7B7
      F6FFAFAFF5FFA8A8F4FF9F9FF3FF9696F1FF8E8EF0FF8383EDFF7979EBFF6F6F
      E9FF6565E5FF5D5DE0FF5454DAFF4C4CD5FF4343CFFF3B3BC9FF3131C2FF2828
      BAFF1F1FB3FF1D1DAEFF4C4CB7FF181A9FFF0000000000000000000000008448
      21FBCAA483FFC9A07EFFC89F7CFFC89E7BFFC89D7AFFC79C79FFC79C78FFC69B
      76FFC59A75FFC59974FFC59873FFC49771FFB37849FFB37849FFB37849FFB780
      53FFBF8F68FF8C5630F62E190B96000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000884B22FFCBA4
      83FFC9A07EFFC89F7CFFC89E7BFFC89D7AFFC79C79FFC69B77FFC69B76FFC59A
      75FFC59974FFC59873FFC39670FFB37849FFB37849FFB37849FFB88154FFBF8E
      68FF8B5530F62917098D00000000000000000000000000000000000000088449
      22FCC3956DFFC2926BFF83471FFB000000000000000000000000000000000000
      0000A29386FFFFFFFFFFF8F7F6FFF9F8F8FFFAFAF9FFFBFBFAFFFCFCFBFFFDFD
      FCFFFEFDFDFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFDFDFCFFFAF9F8FFF6F4F3FFF1F0EEFFBBB2ADF7ADA9
      A3F1000000000000000000000000000000002125DDFFFEFEFFFFFEFEFFFFFDFD
      FFFFFDFDFFFFFCFCFFFFFBFCFFFFFBFBFFFFFBFBFEFFFAFAFEFFF9F9FEFFF9F9
      FEFFF8F8FEFFF7F7FEFFF5F6FEFFF3F3FDFFEDEDFCFFE5E5FBFFDEDEF9FFD4D5
      F7FFCBCBF4FFC1C1F1FFB6B7EDFFABABE9FF9E9FE4FF9393DFFF8484D9FF7576
      D1FF6767C9FF5B5BC2FF5152BCFF191AA1FF0000000000000000000000008147
      1EFA894F27FC894F27FC894F27FC894F27FC894F27FC894F27FC894F27FC894F
      27FC894F26FC894F26FC8B5126FCC59A76FFB37849FFB37849FFB88256FFC092
      6AFF8B532EF62514088700000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000087491FFF894F
      27FC894F27FC894F27FC894F27FC894F27FC894F27FC894F27FC894F27FC894F
      26FC894F26FC8B5129FAC59A74FFB37849FFB37849FFB98457FFBF916AFF8953
      2BF62112077F0000000000000000000000000000000000000000000000088449
      22FCC4966FFFC3946DFF83471FFB000000000000000000000000000000000000
      0000A09284FFFFFFFFFFF6F5F4FF69D568FFF9F8F7FFC6BDB4FFC5BBB2FFC3B9
      B0FFC1B7ADFFBFB5ABFFBEB3A8FFBCB1A6FFFFFFFFFFFFFFFFFFFFFFFFFFBBB2
      AAFFBEB5AEFFC8C1BBFFD3CDC7FFD6D0CCFFC8C2BCFFC1BAB2FFC4BDB7FF615E
      5CB4000000000000000000000000000000002125DDFF2125DDFF2125DDFF2125
      DDFF2125DDFF2125DDFF2125DDFF2125DBFF2024D9FF2024D6FF2023D4FF1F23
      D2FF1F22D0FF1F22CDFF1E22CBFF1E21C8FF1E21C6FF1E20C4FF1D20C3FF1D1F
      C0FF1D1FBEFF1C1FBCFF1C1EBAFF1C1EB8FF1C1DB5FF1C1DB3FF1C1DB0FF1B1C
      ADFF1A1CABFF1A1BA9FF191BA6FF191AA4FF0000000000000000000000000000
      0007000000080000000800000008000000080000000800000008000000080000
      0008000000080000000F83471FFCC69B78FFB37849FFBA8559FFBF936CFF8853
      2BF51E11077A0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000080000
      0008000000080000000800000008000000080000000800000008000000080000
      000801000017814720F8C69A76FFB37849FFBA865AFFC0916BFF88512BF61B0F
      0672000000000000000000000000000000000000000000000000000000088449
      22FCC59871FFC3966FFF83471FFB000000000000000000000000000000000000
      00009F9082FFFFFFFFFFF5F4F2FF73D572FFF7F6F5FFF8F7F7FFF9F9F8FFFAFA
      F9FFFBFBFAFFFCFCFBFFFDFDFDFFFEFEFDFFFFFEFEFFFDFDFDFFFAFAF9FFBDB4
      ACFFBAB1A9FFBAB1A9FFBAB1A9FFBDB4ACFFCBC5BFFFC8C7C3F5C8C3BDFF0303
      0323000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000883471FFCC79D7AFFBB885DFFC0936EFF88502AF6180D
      056D000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000010814720F8C79C79FFBC895EFFC0936EFF864E29F6150B05640000
      0000000000000000000000000000000000000000000000000000000000088449
      22FCC69A73FFC59771FF83471FFB000000000000000000000000000000000000
      00009E8F80FFFFFFFFFFF3F1F0FFF4F3F1FFF5F4F3FFF7F6F5FFF8F7F6FFF9F8
      F7FFFAF9F9FFFBFAFAFFFCFBFBFFFBFBFAFFF7F7F6FFF4F3F2FFEFEEECFFC0B7
      AFFFBAB1A9FFBAB1A9FFCCC6C0FFEFEDEBFFEFEEECFECAC4BFFF1C1B1A640000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000883471FFCC89F7CFFC0946FFF854E27F6130A04600000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000010814720F8C89F7CFFC0926EFF834C26F610090359000000000000
      000000000000000000000000000000000000000000000000000000000008844A
      23FCC79B75FFC59873FF83471FFB000000000000000000000000000000000000
      00009C8D7DFFFFFFFFFFF1EFEDFFF2F1EFFFF4F2F1FFF5F4F3FFF6F5F4FFF8F6
      F6FFF8F8F7FFFAF9F8FFFBFAF9FFFCFBFBFFF3F1F0FFE8E5E3FFE2DFDAFFBFB7
      AFFFBAB1A9FFCFC9C3FFF1F0EEFFFAFAFAFFBCB5AFF64B4643A2000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000883471FFCBF936EFF834B25F60E070355000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000010814720F8BE916DFF824B24F60C07034F00000000000000000000
      000000000000000000000000000000000000000000000000000000000008844A
      23FCC89C77FFC69A75FF83471FFB000000000000000000000000000000000000
      00009B8B7BFFFFFFFFFFEFEDEBFFF0EFEDFFF2F0EFFFF3F2F0FFF5F3F2FFF6F4
      F4FFF7F6F5FFF8F7F6FFF9F8F8FFFAFAF9FFFBFBFAFFE8E5E2FFD8D4CFFFBBB1
      AAFFC6BFB8FFF3F2F1FFFBFBFAFFC6C0BDF8484541A100000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000886481FFE814923F50B06024A00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000010854A20FD814721F5090502440000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000008844A
      23FCC89C77FFC79A75FF83471FFB000000000000000000000000000000000000
      00009A8A79FFFFFFFFFFEDEAE8FFEEECEAFFF0EEECFFF1EFEEFFF3F1EFFFF4F2
      F1FFF5F4F3FFF7F5F4FFF8F7F6FFF9F8F7FFFAF9F9FFF8F8F7FFD7D1CDFFBEB6
      ADFFE5E1DEFFFEFEFEFFADA9A6E745413E9F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000087D441CF5080402410000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000107B431CF30703013B000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000088749
      1FFF87491FFF87491FFF81471EFA000000000000000000000000000000000000
      0000988877FFFFFFFFFFEBE7E5FFECE9E7FFEEEBE9FFEFEDEBFFF1EFEDFFF2F1
      EFFFF3F2F1FFF5F4F2FFF6F5F4FFF7F6F5FFF8F7F7FFF9F9F8FFE0DCD8FFC2BB
      B4FFFDFDFDFFACA8A3E7524D48AF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000506030139000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000A0503013400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000978676FFFFFFFFFFE8E5E3FFEAE7E5FFEBE9E7FFEDEBE9FFEFEDEBFFF0EE
      EDFFF2F0EEFFF3F1F0FFF4F3F1FFF5F4F3FFF6F5F4FFF9F8F8FFC7C1B9FFD4CF
      CBFF918F8BD2726B63CF00000010000000000000000000000000000000000000
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
      0000968574FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D2CCFFB3A89FFFAAA1
      99F05E5852BF0000001000000000000000000000000000000000000000000000
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
      0000968574FF968574FF978676FF988877FF9A8A79FF9B8B7BFF9D8D7EFF9E8F
      80FF9F9082FFA19284FFA29386FFA39588FFA6988BFFAB9F94FF7F766BDF2A27
      2480000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000200000005000000080000000D000000100000
      00150000001700000019000000190000001A0000001A00000019000000180000
      001600000014000000100000000B000000080000000400000003000000000000
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
      000000000000000000000000000000000000000000000000000B020101512D0F
      06C0431605D4150803A00001025A01020268030405740405067E050607860607
      088F0708099208090A95090A0A970A0A0A980A0A0A980A0A09960A0908940A09
      07910909068E080805850706047C050503740404026A0000005101010C831414
      8EF4040423940000002600000014000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000028973C10FFE073
      24FFF29945FFD66820FF431603C3000000000000000000000003000000070000
      000C000000100000001400000016000000170000001700000015000000120000
      000E0000000A0000000500000001000000000000000001010B631919AEFF1B1B
      B9FF7979EAFF3838A2D700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000100000002000000040000
      00050000000600000008000000090000000A0000000A000000090603013A0000
      0011000000060000000500000003000000010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000001000000020000
      0004000000050000000600000008000000090000000A070401410000000E0000
      0008000000070000000600000005000000030000000100000000000000000000
      000000000000000000000000000000000000000000004E2108B4CA5612FF7A40
      0FB736301B76F4A24AFFD65E13FF3F1400AC0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000707349F1A1AB8FF1717A4FF1A1A
      B5FFADADF2FFF9F9FDFF1515438B000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000081471EFA87491FFF8749
      1FFF87491FFF0000000A00000005000000080000000A0000000C0000000E0000
      00100000001100000013000000140000001400000014080401497B431CF40100
      002200000011000000100000000E0000000C0000000A00000007000000030000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000200000005000000080000000A0000000C0000
      000E000000100000001100000013000000140A05024F7D441CF50000001B0000
      00140000001200000011000000100000000E0000000C0000000A000000060000
      000300000000000000000000000000000000000000006D3310C7D15D15FF1004
      004C00000000E57A26FFE5863CFFCF6016FF451902A600000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000016169FFF2323C1FF1717A4FF1E1EB7FFA5A6
      F1FFB2B2F3FF3333D0FF4848E0FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000083471FFBA36332FFA464
      33FF83471FFC0000000F0000000A0000000D0000000F00000012000000150000
      0017000000190000001B0000001D0000001E0B0602587D461EF685491EFD0100
      0029000000190000001700000015000000120000000F0000000D0000000A0000
      0007000000030000000000000000000000000000000000000000000000000000
      00000000000100000004000000070000000A0000000D0000000F000000120000
      001500000017000000190000001B0D07035C7E451DF686481FFE000000250000
      001D0000001B000000190000001700000014000000120000000F0000000D0000
      000A00000007000000030000000000000000000000001008024FD7762DFFD362
      1AFFD05F18FFE48A42FFE28035FFEA9146FFC75A13FF220C0178000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000116169AFF2727C3FF16169BFF1B1CB5FFAEAEF2FFC2C3
      F5FF2E2EC9FF141593FF2423B9FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000002040042173104D0080D00A200000015000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000083471FFBA46534FFA566
      35FF83471FFC000000110000000C0000000E0000001200000014000000170000
      001A0000001D00000020000000230E0803627F461EF7A26639FF81471FF90100
      002E0000001D0000001A0000001700000014000000120000000E0000000C0000
      0009000000060000000200000000000000000000000000000000000000000000
      00000000000300000006000000090000000C0000000F00000012000000150000
      00170000001A0000001D100903657F461EF7A06335FF83471FFC0000002D0000
      0023000000200000001D0000001A0000001700000014000000110000000E0000
      000C00000009000000060000000200000000000000000000000041200A9CE288
      3DFFD6742DFFB8460CFFC14502FFDF782BFFEB974CFFC05511FF090300410000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000001151594FF2828C2FF151598FF1B1BB3FFB6B6F3FFC8C7F6FF2D2D
      CBFF151494FF16159DFF0000021A000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000705130083227C2DF831B942FF308000FF162400D2000000440000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000083471FFBA66738FFA668
      39FF83471FFC0000000F0000000A0000000D0000000F00000012000000150000
      0017000000190000001B1008036380471FF7A4693DFFAB7043FF814720F90100
      0029000000190000001700000015000000120000000F0000000D0000000A0000
      0007000000040000000100000000000000000000000000000000000000000000
      00000000000200000004000000070000000A0000000D0000000F000000120000
      001500000017130A0468804720F7A3673AFFA96C3DFF83471FFC000000250000
      001D0000001B000000190000001700000014000000120000000F0000000D0000
      000A000000070000000400000001000000000000000000000000000000006233
      12BED4762DFF922500FFA62A00FFC54C06FFE07E30FFE88F46FFB84F0DFF0000
      0012000000000000000000000000000000000000000000000000000000000000
      0000131387FF2424BDFF151496FF2122BEFFC6C5F5FFCCCDF6FF2C2CC8FF1515
      94FF141492FF0607206B00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000003
      00350A3F08C828AB48FF33D76FFF31C049FF329B00FF329500FF295300FA0505
      00850000000A0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000083471FFBA76A3BFFA86B
      3DFF83471FFC0000000B00000005000000080000000A0000000C0000000E0000
      00100000001112090463804721F6A76C41FFA86B3DFFAC7145FF814720F90100
      002200000011000000100000000E0000000C0000000A00000008000000050000
      0003000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000300000005000000080000000A0000000C0000
      000E150C046A7F4821F6A56A3DFFA7693AFFAA6E41FF83471FFC0000001B0000
      00140000001200000011000000100000000E0000000C0000000A000000070000
      0005000000030000000000000000000000000000000000000000000000000000
      00008E4E20E0CE722AFF891D00FFAB2F00FFC74F07FFE3873BFFE48A3EFF913D
      08E6000000000000000000000000000000000000000000000000000000000909
      47AA1B1BAFFF141596FF2221BFFFDDDCF9FFD5D5F8FF2C2CC8FF141494FF1414
      8DFF0C0C53B40000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000004001600781383
      24F72FC75FFF33D36AFF31CF69FF31BD47FF319600FF319B00FF329E00FF3177
      00FF131900C40000003300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000083471FFBA86C3EFFAA6E
      40FF83471FFC0000000800000000000000000000000200000004000000050000
      0007130A0464814921F6A86F45FFA96C3DFFA46433FFAD7347FF814720F90000
      0018000000080000000700000005000000040000000200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000200000004170D
      056D814921F6A86E42FFA86A3BFFA46534FFAB7043FF83471FFC000000120000
      000A000000090000000800000007000000050000000400000002000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000002AE652BF4C26322FF841900FFAE3300FFCA540AFFE99346FFE081
      30FF582504B60000000000000000000000000000000000000000000002211616
      9FFF16169BFF2221BDFFD3D3F8FFBBBBF4FF2A2AC7FF151494FF13138BFF1212
      81E6000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000004063804AE22AD43FF33D2
      6AFF32CF67FF31CC64FF31CF69FF31BD47FF319600FF319800FF319900FF319F
      00FF338F00FF284100F100000051000000000000000000000000000000000000
      0000000000000000000000000000000000000000000083471FFBAA6F41FFAB70
      43FF834820FC000000080000000000000000000000000000000000000000160C
      0568814922F5AA7348FFA96C3EFFA46433FFA46433FFAE7549FF864A21FC874A
      20FF874A20FF874A20FF874A20FF874A20FF874A20FF874A20FF87491FFF8749
      1FFF87491FFF87491FFF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001C0F06748149
      22F5AA7045FFA86A3BFFA46433FFA46534FFAC7245FF854A20FD874A20FF874A
      20FF874A20FF87491FFF87491FFF87491FFF87491FFF87491FFF87491FFF8749
      1FFF81471EFA0000000000000000000000000000000000000000000000000000
      00000000000000000011CA8143FFB95D22FF7A1200FFB43900FFD25F0FFFEF9E
      4FFFD87320FF200C006F00000000000000000000000000000000151597FF1515
      97FF1C1DB6FFC9C9F6FFBCBDF5FF2425C2FF141597FF13138BFF151595FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000177C18E934D46DFF31CD
      64FF31CC64FF31CC64FF31CF69FF30BB44FF319500FF319800FF319800FF3198
      00FF31A000FF338700FF05040084000000000000000000000000000000000000
      0000000000000000000000000000000000000000000083471FFBAB7144FFAD72
      46FF834820FC00000008000000000000000000000000000000001B0E0672824B
      24F5AD774CFFA96C3EFFA46433FFA46433FFA46433FFAF764BFFAE764AFFAE75
      49FFAD7448FFAD7347FFAC7245FFAC7145FFAB7043FFAB6F42FFAA6F41FFAA6E
      40FFA96D3FFF87491FFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002112077F814B24F4AC74
      4AFFA86B3CFFA46433FFA46433FFA46534FFAD7448FFAD7347FFAD7246FFAC71
      45FFAB7144FFAB6F42FFAA6F41FFAA6E41FFA96D3FFFA96C3EFFA86B3DFFA76A
      3BFF83471FFB0000000000000000000000000000000000000000000000000000
      0000000000000000000007030138D89A5FFFB3561EFF851700FFBF4100FFDD71
      1BFFF09E4FFFCB600FFF010000190000000000000000050522781616A4FF1818
      AFFFA6A6F2FFC4C4F6FF2C2CC8FF141497FF14148FFF14148FFF000000020000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000010807651A7F20F133D167FF31CC
      64FF31CC64FF30CB63FF30CD66FF39CB5AFF339D08FF319500FF319800FF3198
      00FF329C00FF308400FF080E19BC0000023E0000000000000000000000000000
      0000000000000000000000000000000000000000000083471FFBAD7348FFAE75
      49FF834820FC000000080000000000000000000000002011077C824B25F4AF79
      50FFA96C3EFFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFAA6F41FF87491FFF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000027150989824C27F4AE774EFFA86B
      3CFFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA86C
      3DFF83471FFB0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000C070248DEA975FFAF5018FF8C1B00FFC749
      00FFE47E28FFF09A47FFB15100E5000000000000052F1718AAFF1717ABFF9A99
      F0FFBCBDF5FF2C2CC8FF141495FF14138DFF101070DC00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000022500003EB70000B7FF1F8A37FF33D364FF31CC
      64FF2CC960FF34D067FF4BE67EFF4FEC87FF3FD465FF32A61BFF319500FF3197
      00FF329C00FF2F8100FF0D4E7DFF003ADCFA0003178500000009000000000000
      0000000000000000000000000000000000000000000083471FFBAE764BFFAF77
      4CFF834820FC00000008000000000000000025140886834E28F4B27B54FFA96C
      3EFFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFAB7043FF874A20FF00000000000000000000000000000000000000000000
      00000000000000000000000000002D180A93844E28F4B07A52FFA86B3CFFA464
      33FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA96E
      40FF83471FFB0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000006030133DDA46BFFA9440CFF9620
      00FFD05201FFEC8D37FF8A5590FF15159EFE1616ADFF15159BFF7676EBFFB1B1
      F3FF3231CDFF15159BFF141592FF010106340000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000001064000084EC0000F0FF0002F2FF228E36FF30D161FF2AC9
      5FFF4CDB79FF66F896FF5CF891FF4DE881FF40DD77FF34D069FF31B335FF3199
      02FF329A00FF2D8100FF0A5E79FF0071FFFF0051FAFF000F58C4000000330000
      0000000000000000000000000000000000000000000083471FFBB0784EFFB17A
      50FF834820FC00000008000000002B170A90855029F4B38058FFA96C3EFFA464
      33FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFAC7245FF874A20FF00000000000000000000000000000000000000000000
      00000000000000000001331C0C9D86512BF4B27D55FFA86B3CFFA46433FFA464
      33FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFAB70
      44FF83471FFB0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000006030134D8924CFFA43A
      02FF9F2700FF0D086FFF1816B0FF5759E6FF1E1DB7FF5252E5FF8888EDFF2525
      BFFF1615A2FF0B0B4AB000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      011B000038AB0000C5FF0000FFFF0000FFFF0002E8FF239234FF3BD66AFF7CEA
      99FF94FFB1FF6DFF9EFF58F58DFF4CE780FF3FDA72FF33CF67FF31D06BFF31C1
      50FF32A512FF2D8200FF095D77FF006DFFFF0070FFFF0063FFFF002AB6F10000
      0D70000000010000000000000000000000000000000083471FFBB17B51FFB27C
      53FF834820FC00000009311B0B9A87512DF4B5835BFFA96C3DFFA46433FFA464
      33FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFAD7448FF874A20FF00000000000000000000000000000000000000000000
      0000000000033A1F0DA789522EF4B48158FFA86B3CFFA46433FFA46433FFA464
      33FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFAC72
      46FF83471FFB0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000006030134D87D
      25FF1A1075FF1816B3FF1616A2FF3334D0FFE7E8FBFF8A8AEDFF1A19B3FF1515
      9CFF01010A410000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000F5B0000
      7AE20000EAFF0000FFFF0000FFFF0000FFFF0001EBFF31942EFFB1FDADFFC4FF
      D0FF8EFFADFF69FE9AFF58F48CFF4BE77EFF3ED971FF33CE66FF31CC64FF31D0
      6AFF34D467FF288C0BFF065D75FF006DFFFF006BFFFF006EFFFF006EFFFF0047
      F0FF00083BB00000002400000000000000000000000083471FFBB37D54FFB480
      56FF834820FC391F0DA689542FF4B6855FFFA96C3DFFA46433FFA46433FFA464
      33FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFAE764AFF874A20FF00000000000000000000000000000000000000000000
      000440230FB08B5631F4B6845CFFA86A3BFFA46433FFA46433FFA46433FFA464
      33FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA464
      33FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFA46433FFAD74
      48FF83471FFB0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000703
      003579519AFF716FE9FF2524C8FF7675EBFF9595EFFF7D7DECFF1B1ABAFF0101
      0A3F000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000008DF20000
      FEFF0000FFFF0000FFFF0000FFFF0000FFFF0000FBFF0B2792FF4E9C42FF9DF5
      91FF93FFB7FF68FF9BFF57F38BFF4BE67EFF3ED971FF32CD65FF33D068FF32CE
      61FF1E982BFF097250FF008ADEFF006CFFFF006BFFFF006BFFFF006CFFFF0072
      FFFF0051FEFF00021B9200000000000000000000000083471FFBBD8A60FFBE8D
      62FF834A21FC542E14C99B6944F9C1926DFFB3794BFFB17546FFB17546FFB175
      46FFB17546FFB17546FFB17546FFB17546FFB17546FFB17546FFB17546FFB175
      46FFB17546FFB17546FFB17546FFB17546FFB17546FFB17546FFB17546FFB175
      46FFBA875CFF884A21FF00000000000000000000000000000000000000000000
      000E5A3115D09F6C47F9C1916AFFB3784AFFB17546FFB17546FFB17546FFB175
      46FFB17546FFB17546FFB17546FFB17546FFB17546FFB17546FFB17546FFB175
      46FFB17546FFB17546FFB17546FFB17546FFB17546FFB17546FFB17546FFBA86
      5BFF83471FFB0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000100001E5544B6FFF3F8FDFF7C7DECFF1515A6FF1717B4FF393FE5FF0000
      0001000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000008FEC0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000F8FF0000DAFF0005B6FF1F61
      4AFF61D755FF6BFF99FF58F690FF4AE57DFF3DD971FF34D36CFF2BBD49FF0E82
      23FF007B8CFF00A5FFFF009DFFFF0067FFFF006AFFFF006BFFFF006BFFFF006E
      FFFF005CFFFF00041F9400000000000000000000000083471FFBBE8C62FFBF8E
      64FF844922FC0000000F4A2911BD9B6943F8C39671FFB67D4FFFB37849FFB378
      49FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB378
      49FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB378
      49FFBD8B61FF874B21FF00000000000000000000000000000000000000000000
      00000000000B532D14C79C6B47F8C3956FFFB57C4EFFB37849FFB37849FFB378
      49FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB378
      49FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFBD8A
      60FF83471FFB0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000302023FCCBDBAFFC3C8F7FF8E92EFFF1717C0FF191AC8FF5657BFFF912A
      00D3000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000008FEB0000
      FFFF0000FFFF0000FFFF0000FFFF1B1BFFFF6161FEFF4545ECFF0503D7FF0000
      D3FF0A2F78FF36A735FF53EF6FFF4DEC88FF3EDB6FFF26A92DFF087C42FF0091
      CFFF00A7FFFF00B1FFFF00BEFFFF0096FFFF006BFFFF0068FFFF006BFFFF006E
      FFFF005DFFFF00051F9300000000000000000000000083471FFBBF8D64FFC08F
      66FF844922FC000000080000000542240FB296633FF7C49771FFB67E51FFB378
      49FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB378
      49FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB378
      49FFBE8C63FF874B21FF00000000000000000000000000000000000000000000
      000000000000000000084B2911BD9A6743F8C49771FFB67D4FFFB37849FFB378
      49FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB378
      49FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFBD8B
      62FF83471FFB0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000506
      075ACDCFD4FFCCD2DAFF0B060A53835883FF3E49E6FF222068FFF78012FFDA51
      02FF29130A9A0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000091EB0000
      FFFF0000FFFF0101FFFF4141FFFF7D7DFFFF7B7BFFFF7575FFFF5858F8FF1817
      DCFF0000DAFF000CACFF1F6F3FFF3DCC45FF269F2CFF068580FF009EFAFF00AA
      FFFF00C2FFFF00D2FFFF00C7FFFF00BBFFFF009EFFFF0075FFFF0067FFFF006E
      FFFF005EFFFF0006209300000000000000000000000083471FFBC08F66FFC191
      68FF844922FC00000008000000000000000239200EA6935F3BF7C49873FFB780
      53FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB378
      49FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB378
      49FFBF8E65FF874B21FF00000000000000000000000000000000000000000000
      000000000000000000000000000542240FB295623EF7C49773FFB67E51FFB378
      49FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB378
      49FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFBF8D
      65FF83471FFB0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000007070961D0CF
      D3FFCCCED2FF3B3B3CA50000000003010027B64405FFC33D00FFDC600CFFB569
      3FFFBBB3BBFF888689F814141482050505470000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000092EB0000
      FFFF1A1AFFFF6D6DFFFF8E8EFFFF8080FFFF7575FFFF6D6DFFFF6A6AFFFF6565
      FFFF3333E8FF0000DBFF0000BDFF091C16CB11548BE800A5FFFF00B5FFFF00DD
      FFFF00E2FFFF00D2FFFF00C3FFFF00B5FFFF00ACFFFF00A5FFFF0086FFFF006C
      FFFF005EFFFF0007219300000000000000000000000083471FFBC09068FFC293
      6AFF844922FC00000008000000000000000000000001311B0C9A905C36F7C498
      73FFB88255FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB378
      49FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB378
      49FFC08F67FF874B21FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000002391F0EA6925F3AF7C49974FFB780
      53FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB378
      49FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFB37849FFC08F
      67FF83471FFB0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000303044FC8C9CBFFD2D2
      D5FF424243AE0000000000000000000000000100001ABC4E09FFB37959FFB6B3
      BDFFB6A5A6FFA0A1A4FFE4E3E3FFEFEEEEFF908F92F7939293F6626161AF0000
      00000000000000000000000000000000000000000000000000000303A3F64747
      FFFF9393FFFF9494FFFF8484FFFF7C7CFFFF7575FFFF6D6DFFFF6666FFFF6565
      FFFF6B6BFFFF5151F9FF1413D2FF00001BA412459CDD00DCFFFF00F8FFFF00EE
      FFFF00DDFFFF00D0FFFF00C2FFFF00B5FFFF00A8FFFF00A7FFFF00AAFFFF009A
      FFFF006EFFFF0009279A00000000000000000000000083471FFBC1926BFFC395
      6CFF844922FC00000008000000000000000000000000000000002917098D8D59
      34F7C49773FFB98457FFB37849FFB37849FFB37849FFC49671FFC49771FFC496
      71FFC3956FFFC3956FFFC2946EFFC2936CFFC2936CFFC1926BFFC1916AFFC091
      69FFC1916AFF874B21FF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000001311A0B99905B36F7C499
      75FFB88255FFB37849FFB37849FFB4794AFFC59974FFC59873FFC49772FFC496
      71FFC39670FFC3956FFFC3956FFFC2946DFFC2936CFFC1926BFFC1926AFFC091
      69FF83471FFB0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000303044BBEBEC2FFD4D5D9FF4B4B
      4DB90000000000000000000000000000000000000000080605499A8D96FFCCCC
      CDFFC2C2C3FF808183FF464548FFC8C7C8FFF6F6F5FFEEEDEDFF4D4D4DD20000
      0000000000000000000000000000000000000000000000000000010132944F4F
      C9FF9898FEFF9292FFFF8484FFFF7C7CFFFF7474FFFF6C6CFFFF6565FFFF6464
      FFFF6A6AFFFF6161FAFF1E1E93F90000065D0C173E8D12B7F6FF00FEFFFF00EF
      FFFF00DCFFFF00D0FFFF00C1FFFF00B4FFFF00A8FFFF00A6FFFF00ABFFFF00A7
      FFFF005CE0F80002085E00000000000000000000000083471FFBC3946DFFC496
      6EFF844922FC0000000800000000000000000000000000000000000000002112
      077F8B552FF7C39873FFBA8559FFB37849FFB37849FFC59A75FF8B5129FA894F
      26FC894F26FC894F26FC894F26FC894F26FC894F26FC884E26FC884E26FC884E
      26FC884E26FC87491FFF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002816098B8D57
      33F7C59A75FFB98458FFB37849FFB4794AFFC69B77FF8B5126FC894F26FC894F
      26FC894F26FC894F26FC894F26FC894F26FC894F26FC894F26FC884E26FC884D
      26FC81471EFA0000000000000000000000000000000000000000000000000000
      000000000000000000000000000008070966C5C5C7FFD4D6D7FF4E4D4EBB0000
      00000000000000000000000000000000000000000000000000008A8A8CF1D8D8
      DAFF9E9EA1FF414046FF59595BFFA8A8ABFFF6F6F6FFD2D1D1FF242425A20000
      0000000000000000000000000000000000000000000000000000000000000000
      0C4D1B1B87E17575EDFF8D8DFFFF7C7CFFFF7474FFFF6C6CFFFF6767FFFF6A6A
      FFFF4545DDFF080846CE0000003C000000000000000006092060186CC9EC04DA
      FCFF00E5FFFF00CFFFFF00C1FFFF00B3FFFF00AAFFFF00ACFFFF0094FFFF002F
      7DCD0000023A0000000000000000000000000000000083471FFBC3956EFFC598
      70FF844922FC0000000800000000000000000000000000000000000000000000
      00001B0F067289522CF6C39772FFBB885DFFB37849FFC69B77FF814720F80100
      0017000000080000000800000008000000080000000800000008000000080000
      0008000000080000000800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002012
      077D8B5630F6C49A76FFBA865BFFB4794AFFC79D79FF83471FFC0000000F0000
      0008000000080000000800000008000000080000000800000008000000080000
      0008000000070000000000000000000000000000000000000000000000000000
      0000000000000000000009080965CECED0FFD3D3D6FF4E4D4EBB000000000000
      00000000000000000000000000000000000000000000000000003B3C3DB3FFFF
      FFFFE3E3E4FF828184FF656467FFE6E8E7FFD9DADBFF7A7A7BFFD6D5D7FF2A29
      2AAE000000000000000000000000000000000000000000000000000000000000
      000000000119030341A84D4DD2FF8181FFFF7878FFFF7171FFFF6060FDFF2727
      B0FE0000118C0000000C0000000000000000000000000000000001010425132E
      78B80CABF7FF00D5FFFF00C3FFFF00B7FFFF01A8FFFF0673F4FD000B248B0000
      000B000000000000000000000000000000000000000083471FFBC59771FFC69A
      73FF844922FC0000000800000000000000000000000000000000000000000000
      000000000000150B0564874F2BF6C29672FFBD8A60FFC79D79FF814720F80000
      0010000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000190D066F89522CF6C49875FFBC895FFFC89E7BFF83471FFC000000080000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000009080964D0CFD0FFCECDD0FF49494AB600000000000000000000
      000000000000000000000000000000000000000000000000000026262697FFFF
      FFFFFFFFFFFFFEFEFEFFE5E3E4FFDDDDDCFF949396FF7D7C7EFFD2D2D3FF8D8C
      8FFF000000070000000000000000000000000000000000000000000000000000
      00000000000000000000000014611F1F94E86767F1FF4F4FE5FF090953D10000
      0144000000000000000000000000000000000000000000000000000000000000
      0001080E2D72146FD4F003B8FDFF079CFFFF083382D100010343000000000000
      0000000000000000000000000000000000000000000083471FFBC59873FFC79A
      75FF844A23FC0000000800000000000000000000000000000000000000000000
      0000000000000000000010090359844D27F6C19470FFC89F7CFF814720F80000
      0010000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000130B046286502AF6C29875FFC9A07EFF83471FFC000000080000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000009080965CFCFD2FFCFCED1FF434243AE0000000000000000000000000000
      00000000000000000000000000000000000000000000000000001515167BFFFE
      FFFFFFFFFFFFF7F7F7FFC4C4C4FFC9CAC9FF878789FF969597FFDEDEDFFFC9C8
      CAFF3E3E40BB0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000042C050564CC000027AA000000140000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000002030C3C1643ADD9071740AA0000001300000000000000000000
      0000000000000000000000000000000000000000000083471FFBC69A75FFC89C
      77FF844A23FC0000000800000000000000000000000000000000000000000000
      00000000000000000000000000000C07034F824B24F6BE916DFF814720F80000
      0010000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000F080356844C26F6C09470FF83471FFC000000080000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000D4C4B
      4CB1EEEDEDFFD7D5D8FF434344AE000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000009080956F9F9
      F9FFFFFFFFFFCCCCCEFFBDBCBFFF949395FF0D0D0E6D0000000028282899B1B2
      B3FF818183F90000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000083471FFBC79A75FFC89C
      77FF844A23FC0000000800000000000000000000000000000000000000000000
      00000000000000000000000000000000000009050244814721F5854A20FD0000
      0010000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000B06024B814922F686481FFE000000080000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A9A9A9EFF4F5
      F5FFEBEBECFF2F2F2F9400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C8C
      8DEFF6F6F6FFACACADFFBABABBFFCFCFD0FF0E0E0E7C00000000000000000606
      06492A2A2BA60000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000081471EFA87491FFF8749
      1FFF87491FFF0000000800000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000703013B7B431CF30000
      0010000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000080402417D441CF5000000080000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000444446ADFFFFFFFFEBEB
      EBFF858486FA0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000505
      0536CDCDCEFFC8C6C7FFC1C2C3FFD8D9D9FF918F92FF1515167C000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000050301340000
      000A000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000006030139000000050000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000101011FF4F3F4FFF9F9F9FF7675
      76DB0000001A0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000007080843C1C0C2FFE2E2E3FFE9E9E9FFF3F3F3FFEAE9EBFFA3A3A5FF1111
      114C000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000000000001B1B1C6D1E1D1E7E0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000F0F0F534F5051AC818183D26B6B6CBC2C2B2B790000
      000C000000000000000000000000000000000000000000000000000000000000
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
      2800000080000000C00000000100010000000000000C00000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
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
      000000000000}
  end
  inherited bhToolBar: TBalloonHint
    Left = 144
    Top = 80
  end
  inherited alToolBar: TActionList
    Left = 76
    Top = 80
    object actProjetar: TAction
      Caption = 'actProjetar'
      Hint = 'Projetar Parcelas'
      ImageIndex = 20
      OnExecute = actProjetarExecute
    end
    object actImprimir_Boleto: TAction
      Caption = 'actImprimirBoleto'
      Hint = 'Imprimir Boleto'
      ImageIndex = 21
      OnExecute = actImprimir_BoletoExecute
    end
  end
  inherited PngImageCollection: TPngImageCollection
    Left = 56
    Top = 280
  end
  object cdsContas_Receber: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA_CLIENTES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL_CLIENTES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FILIAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspContas_Receber'
    RemoteServer = dspcContas_Receber
    BeforeOpen = cdsContas_ReceberBeforeOpen
    BeforeInsert = cdsContas_ReceberBeforeInsert
    BeforeEdit = cdsContas_ReceberBeforeEdit
    BeforePost = cdsContas_ReceberBeforePost
    BeforeDelete = cdsContas_ReceberBeforeDelete
    AfterScroll = cdsContas_ReceberAfterScroll
    OnCalcFields = cdsContas_ReceberCalcFields
    OnDeleteError = cdsContas_ReceberDeleteError
    OnEditError = cdsContas_ReceberEditError
    OnNewRecord = cdsContas_ReceberNewRecord
    OnPostError = cdsContas_ReceberPostError
    OnReconcileError = cdsContas_ReceberReconcileError
    Left = 712
    Top = 392
    object cdsContas_ReceberEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object cdsContas_ReceberFILIAL: TStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsContas_ReceberEMISSAO: TDateField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'EMISSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object cdsContas_ReceberSITUACAO: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1
    end
    object cdsContas_ReceberPREFIXO: TStringField
      DisplayLabel = 'Prefixo'
      FieldName = 'PREFIXO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdsContas_ReceberNUMERO: TIntegerField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsContas_ReceberPARCELA: TIntegerField
      DisplayLabel = 'Parcela'
      FieldName = 'PARCELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsContas_ReceberTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      OnChange = cdsContas_ReceberTIPOChange
      Size = 3
    end
    object cdsContas_ReceberCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      OnValidate = cdsContas_ReceberCLIENTEValidate
    end
    object cdsContas_ReceberNOMECLIENTE: TStringField
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'NOMECLIENTE'
      ProviderFlags = []
      Size = 90
    end
    object cdsContas_ReceberBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
      ProviderFlags = [pfInUpdate]
      OnValidate = cdsContas_ReceberBANCOValidate
    end
    object cdsContas_ReceberAGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'AGENCIA'
      ProviderFlags = [pfInUpdate]
      OnValidate = cdsContas_ReceberBANCOValidate
      Size = 5
    end
    object cdsContas_ReceberCONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'CONTA'
      ProviderFlags = [pfInUpdate]
      OnValidate = cdsContas_ReceberBANCOValidate
      Size = 10
    end
    object cdsContas_ReceberNOMEBANCO: TStringField
      DisplayLabel = 'Nome do Banco'
      FieldKind = fkInternalCalc
      FieldName = 'NOMEBANCO'
      Size = 30
    end
    object cdsContas_ReceberCATEGORIA: TStringField
      DisplayLabel = 'Categoria'
      FieldName = 'CATEGORIA'
      ProviderFlags = [pfInUpdate]
      Required = True
      OnValidate = cdsContas_ReceberCATEGORIAValidate
      Size = 15
    end
    object cdsContas_ReceberDESCRICAOCATEGORIA: TStringField
      DisplayLabel = 'Descri'#231#227'o da Categoria'
      FieldKind = fkInternalCalc
      FieldName = 'DESCRICAOCATEGORIA'
      Size = 30
    end
    object cdsContas_ReceberVENCIMENTO: TDateField
      DisplayLabel = 'Vencimento'
      FieldName = 'VENCIMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      OnValidate = cdsContas_ReceberVENCIMENTOValidate
      EditMask = '!99/99/0000;1;_'
    end
    object cdsContas_ReceberVENCIMENTOREAL: TDateField
      DisplayLabel = 'Vencimento Real'
      FieldName = 'VENCIMENTOREAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object cdsContas_ReceberVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      OnChange = cdsContas_ReceberVALORChange
      OnValidate = cdsContas_ReceberVALORValidate
      currency = True
    end
    object cdsContas_ReceberJUROS: TFloatField
      DisplayLabel = 'Juros'
      FieldName = 'JUROS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.0000%'
      EditFormat = '0.0000'
    end
    object cdsContas_ReceberTAXAPERMANENCIA: TFloatField
      DisplayLabel = 'Taxa Perman'#234'ncia'
      FieldName = 'TAXAPERMANENCIA'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsContas_ReceberVENDEDOR: TIntegerField
      DisplayLabel = 'Vendedor'
      FieldName = 'VENDEDOR'
      ProviderFlags = [pfInUpdate]
      OnValidate = cdsContas_ReceberVENDEDORValidate
    end
    object cdsContas_ReceberNOMEVENDEDOR: TStringField
      DisplayLabel = 'Nome do Vendedor'
      FieldKind = fkInternalCalc
      FieldName = 'NOMEVENDEDOR'
      Size = 30
    end
    object cdsContas_ReceberCOMISSAO: TFloatField
      DisplayLabel = 'Comiss'#227'o'
      FieldName = 'COMISSAO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsContas_ReceberMOEDA: TStringField
      DisplayLabel = 'Moeda'
      FieldName = 'MOEDA'
      ProviderFlags = [pfInUpdate]
      OnValidate = cdsContas_ReceberMOEDAValidate
      Size = 10
    end
    object cdsContas_ReceberDESCRICAOMOEDA: TStringField
      DisplayLabel = 'Descri'#231#227'o da Moeda'
      FieldKind = fkInternalCalc
      FieldName = 'DESCRICAOMOEDA'
      Size = 30
    end
    object cdsContas_ReceberTAXAMOEDA: TFloatField
      DisplayLabel = 'Taxa Moeda'
      FieldName = 'TAXAMOEDA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.00000000'
      EditFormat = '0.00000000'
    end
    object cdsContas_ReceberFLUXO: TStringField
      DisplayLabel = 'Fluxo'
      FieldName = 'FLUXO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsContas_ReceberACRESCIMO: TFloatField
      DisplayLabel = 'Acr'#233'scimo'
      FieldName = 'ACRESCIMO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsContas_ReceberDECRESCIMO: TFloatField
      DisplayLabel = 'Decr'#233'scimo'
      FieldName = 'DECRESCIMO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsContas_ReceberDESCONTO: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'DESCONTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#0.0000%'
      EditFormat = '0.0000'
    end
    object cdsContas_ReceberDIASDESCONTO: TIntegerField
      DisplayLabel = 'Dias Desconto'
      FieldName = 'DIASDESCONTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContas_ReceberTIPODESCONTO: TStringField
      DisplayLabel = 'Tipo Desconto'
      FieldName = 'TIPODESCONTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsContas_ReceberSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsContas_ReceberFORMAPAGAMENTO: TStringField
      DisplayLabel = 'Forma Pagamento'
      FieldName = 'FORMAPAGAMENTO'
      ProviderFlags = [pfInUpdate]
      OnChange = cdsContas_ReceberFORMAPAGAMENTOChange
      Size = 2
    end
    object cdsContas_ReceberHISTORICO: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 40
    end
    object cdsContas_ReceberEMPRESAORIGEM: TStringField
      DisplayLabel = 'Empresa Origem'
      FieldName = 'EMPRESAORIGEM'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object cdsContas_ReceberFILIALORIGEM: TStringField
      DisplayLabel = 'Filial Origem'
      FieldName = 'FILIALORIGEM'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object cdsContas_ReceberORIGEM: TStringField
      DisplayLabel = 'Origem'
      FieldName = 'ORIGEM'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object cdsContas_ReceberFATURA: TIntegerField
      DisplayLabel = 'Fatura'
      FieldName = 'FATURA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContas_ReceberPEDIDO: TIntegerField
      DisplayLabel = 'Pedido'
      FieldName = 'PEDIDO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContas_ReceberSELECIONADO: TStringField
      DisplayLabel = 'Selecionado'
      FieldName = 'SELECIONADO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsContas_ReceberBORDERO: TIntegerField
      DisplayLabel = 'Border'#244
      FieldName = 'BORDERO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContas_ReceberNOSSONUMERO: TStringField
      DisplayLabel = 'Nosso N'#250'mero'
      FieldName = 'NOSSONUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContas_ReceberTIPOCOBRANCA: TStringField
      DisplayLabel = 'Tipo de Cobran'#231'a'
      FieldName = 'TIPOCOBRANCA'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object cdsContas_ReceberCARTEIRA: TStringField
      DisplayLabel = 'Carteira'
      FieldName = 'CARTEIRA'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object cdsContas_ReceberIDCNAB: TIntegerField
      DisplayLabel = 'Id CNAB'
      FieldName = 'IDCNAB'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContas_ReceberULTIMABAIXA: TDateField
      DisplayLabel = #218'ltima Baixa'
      FieldName = 'ULTIMABAIXA'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/0000;1;_'
    end
    object cdsContas_ReceberOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 124
    end
    object cdsContas_ReceberLOTE: TIntegerField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContas_ReceberBASE10925: TFloatField
      DisplayLabel = 'Base 10925'
      FieldName = 'BASE10925'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsContas_ReceberVALORPIS: TFloatField
      DisplayLabel = 'Valor do PIS'
      FieldName = 'VALORPIS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsContas_ReceberVALORCOFINS: TFloatField
      DisplayLabel = 'Valor do COFINS'
      FieldName = 'VALORCOFINS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsContas_ReceberVALORCSLL: TFloatField
      DisplayLabel = 'Valor do CSLL'
      FieldName = 'VALORCSLL'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsContas_ReceberVALORFGTS: TFloatField
      DisplayLabel = 'Valor do FGTS'
      FieldName = 'VALORFGTS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsContas_ReceberVALORINSS: TFloatField
      DisplayLabel = 'Valor do INSS'
      FieldName = 'VALORINSS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsContas_ReceberVALORIRRF: TFloatField
      DisplayLabel = 'Valor do IRRF'
      FieldName = 'VALORIRRF'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsContas_ReceberVALORISS: TFloatField
      DisplayLabel = 'Valor do ISS'
      FieldName = 'VALORISS'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsContas_ReceberVALORORIGINAL: TFloatField
      DisplayLabel = 'Valor Original'
      FieldName = 'VALORORIGINAL'
      ProviderFlags = [pfInUpdate]
      currency = True
    end
    object cdsContas_ReceberUSADOPCC: TStringField
      DisplayLabel = 'Usado PCC'
      FieldName = 'USADOPCC'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsContas_ReceberDIGITACAO: TDateField
      DisplayLabel = 'Digita'#231#227'o'
      FieldName = 'DIGITACAO'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/0000;1;_'
    end
    object cdsContas_ReceberCC: TStringField
      DisplayLabel = 'Centro de Custo'
      FieldName = 'CC'
      ProviderFlags = [pfInUpdate]
      OnValidate = cdsContas_ReceberCCValidate
      Size = 10
    end
    object cdsContas_ReceberDESCRICAOCC: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'DESCRICAOCC'
      Size = 25
    end
    object cdsContas_ReceberVALORCORRIGIDO: TFloatField
      DisplayLabel = 'Valor Total'
      FieldKind = fkCalculated
      FieldName = 'VALORCORRIGIDO'
      currency = True
      Calculated = True
    end
    object cdsContas_ReceberVALORDESCONTO: TCurrencyField
      DisplayLabel = 'Valor Desconto'
      FieldKind = fkCalculated
      FieldName = 'VALORDESCONTO'
      Calculated = True
    end
    object cdsContas_ReceberVALORTAXAPERMANENCIA: TCurrencyField
      DisplayLabel = 'Valor Taxa Perman'#234'ncia'
      FieldKind = fkCalculated
      FieldName = 'VALORTAXAPERMANENCIA'
      Calculated = True
    end
    object cdsContas_ReceberVALORJUROS: TCurrencyField
      DisplayLabel = 'Valor Juros'
      FieldKind = fkCalculated
      FieldName = 'VALORJUROS'
      OnValidate = cdsContas_ReceberVALORJUROSValidate
      Calculated = True
    end
    object cdsContas_ReceberVALORMULTA: TCurrencyField
      DisplayLabel = 'Valor Multa'
      FieldKind = fkCalculated
      FieldName = 'VALORMULTA'
      OnValidate = cdsContas_ReceberVALORMULTAValidate
      Calculated = True
    end
    object cdsContas_ReceberDATACRIACAO: TSQLTimeStampField
      DisplayLabel = 'Data Cria'#231#227'o'
      FieldName = 'DATACRIACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object cdsContas_RecebersqlContas_Receber_Rateios: TDataSetField
      FieldName = 'sqlContas_Receber_Rateios'
    end
    object cdsContas_RecebersqlContas_Receber_Cobrancas: TDataSetField
      FieldName = 'sqlContas_Receber_Cobrancas'
    end
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select a.cpf,a.pessoa,a.nome ,a.endereco,a.numero,a.bairro,a.mun' +
      'icipio ,a.uf ,a.cep ,a.cnpj,a.email from clientes a inner join c' +
      'ontas_receber b on (b.cliente=a.codigo) where b.numero=:NUMERO a' +
      'nd b.prefixo=:PREFIXO and b.parcela=:PARCELA ;'
    FieldDefs = <
      item
        Name = 'CPF'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'PESSOA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NOME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ENDERECO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NUMERO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 7
      end
      item
        Name = 'BAIRRO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'MUNICIPIO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'UF'
        Attributes = [faRequired]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CEP'
        Attributes = [faRequired]
        DataType = ftString
        Size = 8
      end
      item
        Name = 'CNPJ'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PREFIXO'
        ParamType = ptInput
        Size = 3
      end
      item
        DataType = ftInteger
        Name = 'PARCELA'
        ParamType = ptInput
      end>
    ProviderName = 'dspAS_Auxiliar'
    RemoteServer = dspcClientes
    StoreDefs = True
    Left = 360
    Top = 344
    object cdsClientesNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object cdsClientesENDERECO: TStringField
      FieldName = 'ENDERECO'
      Required = True
      Size = 60
    end
    object cdsClientesNUMERO: TStringField
      FieldName = 'NUMERO'
      Required = True
      Size = 7
    end
    object cdsClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Required = True
      Size = 30
    end
    object cdsClientesMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      Required = True
      Size = 30
    end
    object cdsClientesUF: TStringField
      FieldName = 'UF'
      Required = True
      Size = 2
    end
    object cdsClientesCEP: TStringField
      FieldName = 'CEP'
      Required = True
      Size = 8
    end
    object cdsClientesCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object cdsClientesPESSOA: TStringField
      FieldName = 'PESSOA'
      Required = True
      Size = 1
    end
    object cdsClientesCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object cdsClientesEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 60
    end
  end
  object cdsBancos: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from bancos'
    Params = <>
    ProviderName = 'dspBancos'
    RemoteServer = dspcBancos
    Left = 448
    Top = 344
    object cdsBancosEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Required = True
      Size = 2
    end
    object cdsBancosFILIAL: TStringField
      FieldName = 'FILIAL'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsBancosSTATUS: TStringField
      FieldName = 'STATUS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsBancosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsBancosDATACADASTRO: TDateField
      FieldName = 'DATACADASTRO'
      Required = True
    end
    object cdsBancosAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Required = True
      Size = 5
    end
    object cdsBancosDVAGENCIA: TStringField
      FieldName = 'DVAGENCIA'
      Size = 2
    end
    object cdsBancosCONTA: TStringField
      FieldName = 'CONTA'
      Required = True
      Size = 10
    end
    object cdsBancosDVCONTA: TStringField
      FieldName = 'DVCONTA'
      Size = 2
    end
    object cdsBancosNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
    object cdsBancosREDUZIDO: TStringField
      FieldName = 'REDUZIDO'
      Required = True
      Size = 30
    end
    object cdsBancosENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object cdsBancosNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 4
    end
    object cdsBancosCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 25
    end
    object cdsBancosUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsBancosMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      Size = 30
    end
    object cdsBancosCMUNICIPIO: TStringField
      FieldName = 'CMUNICIPIO'
      Size = 7
    end
    object cdsBancosBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object cdsBancosCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object cdsBancosEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 60
    end
    object cdsBancosHOMEPAGE: TStringField
      FieldName = 'HOMEPAGE'
      Size = 60
    end
    object cdsBancosDDI: TStringField
      FieldName = 'DDI'
      Size = 3
    end
    object cdsBancosDDD: TStringField
      FieldName = 'DDD'
      Size = 3
    end
    object cdsBancosTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 9
    end
    object cdsBancosFAX: TStringField
      FieldName = 'FAX'
      Size = 9
    end
    object cdsBancosCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 60
    end
    object cdsBancosLIMITECREDITO: TFloatField
      FieldName = 'LIMITECREDITO'
    end
    object cdsBancosOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 80
    end
    object cdsBancosEMITEBOLETO: TStringField
      FieldName = 'EMITEBOLETO'
      Size = 1
    end
    object cdsBancosGERANOSSONUMERO: TStringField
      FieldName = 'GERANOSSONUMERO'
      Size = 1
    end
    object cdsBancosJUNTAAGREGADOS: TStringField
      FieldName = 'JUNTAAGREGADOS'
      Size = 1
    end
    object cdsBancosINICIONUMERO: TStringField
      FieldName = 'INICIONUMERO'
      Size = 15
    end
    object cdsBancosFIMNUMERO: TStringField
      FieldName = 'FIMNUMERO'
      Size = 15
    end
    object cdsBancosPROXIMONUMERO: TStringField
      FieldName = 'PROXIMONUMERO'
      Size = 15
    end
    object cdsBancosNOTIFICAEMAIL: TStringField
      FieldName = 'NOTIFICAEMAIL'
      Size = 1
    end
    object cdsBancosINSTRUCAOBANCARIA: TStringField
      FieldName = 'INSTRUCAOBANCARIA'
      Size = 80
    end
    object cdsBancosDEMONSTRATIVO: TStringField
      FieldName = 'DEMONSTRATIVO'
      Size = 80
    end
    object cdsBancosLAYOUT: TStringField
      FieldName = 'LAYOUT'
      Size = 1
    end
    object cdsBancosDOCUMENTOINTERNO: TStringField
      FieldName = 'DOCUMENTOINTERNO'
      Size = 10
    end
    object cdsBancosCODIGOCEDENTE: TStringField
      FieldName = 'CODIGOCEDENTE'
      Size = 10
    end
    object cdsBancosDIASFLUTUANTES: TIntegerField
      FieldName = 'DIASFLUTUANTES'
    end
    object cdsBancosLICENCACOBREBEMX: TStringField
      FieldName = 'LICENCACOBREBEMX'
      Size = 35
    end
    object cdsBancosVARIACAOCARTEIRA: TStringField
      FieldName = 'VARIACAOCARTEIRA'
      Size = 3
    end
    object cdsBancosPADRAOLAYOUT: TStringField
      FieldName = 'PADRAOLAYOUT'
      Size = 15
    end
    object cdsBancosINSTRUCAOPROTESTO: TStringField
      FieldName = 'INSTRUCAOPROTESTO'
      Size = 1
    end
    object cdsBancosDIASPROTESTO: TIntegerField
      FieldName = 'DIASPROTESTO'
    end
    object cdsBancosINCLUIDO: TStringField
      FieldName = 'INCLUIDO'
      Size = 29
    end
    object cdsBancosALTERADO: TStringField
      FieldName = 'ALTERADO'
      Size = 29
    end
    object cdsBancosDATACRIACAO: TSQLTimeStampField
      FieldName = 'DATACRIACAO'
      Required = True
    end
    object cdsBancossqlBancos_Contatos: TDataSetField
      FieldName = 'sqlBancos_Contatos'
    end
  end
  object dspcContas_Receber: TDSProviderConnection
    ServerClassName = 'TDSSMLan'
    Connected = True
    SQLConnection = DMMain.DSServer
    Left = 624
    Top = 384
  end
  object dspcClientes: TDSProviderConnection
    ServerClassName = 'TDSSMLan'
    Connected = True
    SQLConnection = DMMain.DSServer
    Left = 360
    Top = 296
  end
  object dspcBancos: TDSProviderConnection
    ServerClassName = 'TDSSMCad'
    Connected = True
    SQLConnection = DMMain.DSServer
    Left = 448
    Top = 296
  end
end
