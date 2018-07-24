object frmConfigSPEDCONT: TfrmConfigSPEDCONT
  Left = 226
  Top = 152
  Width = 412
  Height = 277
  Caption = 'frmConfigSPEDCONT'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlConfigImportacao: TPanel
    Left = 0
    Top = 0
    Width = 396
    Height = 238
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnlAlterdata: TPanel
      Left = 0
      Top = 0
      Width = 396
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
        object chkWcont: TCheckBox
          Left = 8
          Top = 24
          Width = 97
          Height = 17
          Caption = 'WCONT'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = chkWcontClick
        end
      end
    end
    object PageControl: TPageControl
      Left = 0
      Top = 129
      Width = 396
      Height = 109
      ActivePage = TabSheet2
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 1
      object TabSheet2: TTabSheet
        Caption = 'Configura'#231#227'o'
        ImageIndex = 1
        object GroupBox2: TGroupBox
          Left = 2
          Top = 3
          Width = 381
          Height = 76
          Caption = 'Informe o diret'#243'rio principal do arquivo do SPED Cont'#225'bil:'
          TabOrder = 0
          object edtTxtSPEDContabil: TEdit
            Left = 6
            Top = 45
            Width = 341
            Height = 21
            TabOrder = 0
            OnExit = edtTxtSPEDContabilExit
          end
          object btnSPEDContabil: TBitBtn
            Left = 350
            Top = 42
            Width = 25
            Height = 25
            TabOrder = 1
            OnClick = btnSPEDContabilClick
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
          object chkImportarMultiplosArquivos: TCheckBox
            Left = 8
            Top = 23
            Width = 193
            Height = 17
            Caption = 'Importar M'#250'ltiplos Arquivos'
            TabOrder = 2
            OnClick = chkImportarMultiplosArquivosClick
          end
        end
      end
    end
  end
  object dlgSPED: TOpenDialog
    DefaultExt = '*.txt'
    Filter = '*.txt|*.txt'
    InitialDir = 'C:'
    Left = 352
    Top = 72
  end
  object dlgOpen: TcxShellBrowserDialog
    Left = 320
    Top = 72
  end
end
