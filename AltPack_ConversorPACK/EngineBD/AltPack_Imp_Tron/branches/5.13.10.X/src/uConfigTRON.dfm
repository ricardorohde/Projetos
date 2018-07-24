object frmConfigTron: TfrmConfigTron
  Left = 225
  Top = 144
  Width = 406
  Height = 281
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlConfigImportacao: TPanel
    Left = 0
    Top = 0
    Width = 390
    Height = 243
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnlAlterdata: TPanel
      Left = 0
      Top = 0
      Width = 390
      Height = 129
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object grpDiretorioCONVERSOR: TGroupBox
        Left = 5
        Top = 5
        Width = 381
        Height = 56
        Caption = 'Informe o diret'#243'rio de convers'#227'o:'
        TabOrder = 0
        object edtDiretorioCONVERSOR: TEdit
          Left = 6
          Top = 24
          Width = 341
          Height = 21
          TabOrder = 0
          OnExit = edtDiretorioCONVERSORExit
        end
        object btnDiretorioCONVERSOR: TBitBtn
          Left = 350
          Top = 21
          Width = 25
          Height = 25
          TabOrder = 1
          OnClick = btnDiretorioCONVERSORClick
          Glyph.Data = {
            52020000424D5202000000000000520100002800000010000000100000000100
            08000000000000010000340B0000340B00004700000047000000405058009860
            580031486000EAAB6A00A17373008F7B7300B67B7300A1847300AB847300F4AB
            7300AB7B7B00B67B7B00C07B7B00B6847B00C0987B00F4C07B00B68F8400C08F
            8400CA8F8400B6988400C0988400CA988400F4C08400F4CA840031608F00C098
            8F00CAA18F00D4AB8F00F4CA8F00D4AB9800D4B69800E0B69800FFD49800FFE0
            9800C0A1A100F4D4A100F4E0A100FFE0A100FFEAA100CAABAB00D4CAAB00E0D4
            AB00FFE0AB005084B600EAD4B600FFEAB600FFF4B600F4E0C000FFF4C000F4EA
            CA00F4F4CA00FFF4CA00FFFFCA00116AD400F4F4D400FFFFD4000B6AE0000B73
            E000FFFFE0000B73EA001173EA00A1CAEA00F4F4EA00FFF4EA00FFFFEA00FFFF
            F400FF00FF0031A1FF0038A1FF0038ABFF00FFFFFF0042020A42424242424242
            4242424242422B39180B42424242424242424242424243443C180B4242424242
            42424242424242444438180B424242424242424242424242444339180A424242
            424242424242424242444335004201101A114242424242424242453D05072F34
            3434291942424242424242221A2D34343437403E0442424242424206231C3034
            37404146284242424242421B210F30373A414140310D42424242421F20032434
            373A3A37321342424242421D25030F2D37373737311042424242420D2D2D1C16
            2430333429424242424242421E463F0F0316252E08424242424242424227312D
            21252314424242424242424242420E141B1B42424242}
        end
      end
      object grpSistemas: TGroupBox
        Left = 5
        Top = 65
        Width = 381
        Height = 56
        Caption = 'Sistemas que ser'#227'o importados:'
        TabOrder = 1
        object chkWdp: TCheckBox
          Left = 6
          Top = 24
          Width = 97
          Height = 17
          Caption = 'WDP'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = chkWdpClick
        end
      end
    end
    object PageControl: TPageControl
      Left = 0
      Top = 129
      Width = 390
      Height = 114
      ActivePage = tsConfiguracao
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 1
      object tsConfiguracao: TTabSheet
        Caption = 'Configura'#231#227'o'
        ImageIndex = 1
        object GroupBox2: TGroupBox
          Left = 1
          Top = 10
          Width = 381
          Height = 70
          Caption = 'Informe o diret'#243'rio principal da base de dados (Tron):'
          TabOrder = 0
          object edtUSERNAME: TEdit
            Left = 6
            Top = 39
            Width = 179
            Height = 21
            TabOrder = 0
            Text = 'SYSDBA'
            OnExit = edtUSERNAMEExit
          end
          object edtPASSWORD: TEdit
            Left = 189
            Top = 39
            Width = 182
            Height = 21
            TabOrder = 1
            Text = 'masterkey'
            OnExit = edtPASSWORDExit
          end
          object cxLabel1: TcxLabel
            Left = 6
            Top = 18
            Caption = 'Usu'#225'rio:'
          end
          object cxLabel2: TcxLabel
            Left = 189
            Top = 18
            Caption = 'Senha:'
          end
        end
      end
      object tsWdp: TTabSheet
        Caption = 'Departamento Pessoal'
        object GroupBox1: TGroupBox
          Left = 1
          Top = 10
          Width = 381
          Height = 56
          Caption = 'Informe o diret'#243'rio principal da base de dados (Tron):'
          TabOrder = 0
          object edtDiretorioDP: TEdit
            Left = 6
            Top = 24
            Width = 341
            Height = 21
            TabOrder = 0
            OnExit = edtDiretorioDPExit
          end
          object btnDiretorioDP: TBitBtn
            Left = 350
            Top = 21
            Width = 25
            Height = 25
            TabOrder = 1
            OnClick = btnDiretorioDPClick
            Glyph.Data = {
              52020000424D5202000000000000520100002800000010000000100000000100
              08000000000000010000340B0000340B00004700000047000000405058009860
              580031486000EAAB6A00A17373008F7B7300B67B7300A1847300AB847300F4AB
              7300AB7B7B00B67B7B00C07B7B00B6847B00C0987B00F4C07B00B68F8400C08F
              8400CA8F8400B6988400C0988400CA988400F4C08400F4CA840031608F00C098
              8F00CAA18F00D4AB8F00F4CA8F00D4AB9800D4B69800E0B69800FFD49800FFE0
              9800C0A1A100F4D4A100F4E0A100FFE0A100FFEAA100CAABAB00D4CAAB00E0D4
              AB00FFE0AB005084B600EAD4B600FFEAB600FFF4B600F4E0C000FFF4C000F4EA
              CA00F4F4CA00FFF4CA00FFFFCA00116AD400F4F4D400FFFFD4000B6AE0000B73
              E000FFFFE0000B73EA001173EA00A1CAEA00F4F4EA00FFF4EA00FFFFEA00FFFF
              F400FF00FF0031A1FF0038A1FF0038ABFF00FFFFFF0042020A42424242424242
              4242424242422B39180B42424242424242424242424243443C180B4242424242
              42424242424242444438180B424242424242424242424242444339180A424242
              424242424242424242444335004201101A114242424242424242453D05072F34
              3434291942424242424242221A2D34343437403E0442424242424206231C3034
              37404146284242424242421B210F30373A414140310D42424242421F20032434
              373A3A37321342424242421D25030F2D37373737311042424242420D2D2D1C16
              2430333429424242424242421E463F0F0316252E08424242424242424227312D
              21252314424242424242424242420E141B1B42424242}
          end
        end
      end
    end
  end
  object dlgOpen: TcxShellBrowserDialog
    Left = 344
    Top = 83
  end
end
