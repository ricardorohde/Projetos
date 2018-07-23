object frmhoraExtra: TfrmhoraExtra
  Left = 214
  Top = 152
  Width = 353
  Height = 492
  Caption = 'C'#225'lculo Hora Extra'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 337
    Height = 412
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 2
      Width = 17
      Height = 13
      Caption = 'Pis:'
    end
    object Label2: TLabel
      Left = 10
      Top = 57
      Width = 41
      Height = 13
      Caption = 'Arquivo:'
    end
    object Shape1: TShape
      Left = 7
      Top = 99
      Width = 322
      Height = 2
    end
    object edtArquivo: TEdit
      Left = 10
      Top = 73
      Width = 257
      Height = 21
      TabOrder = 1
    end
    object Button1: TButton
      Left = 270
      Top = 71
      Width = 32
      Height = 25
      Caption = '...'
      TabOrder = 3
      OnClick = Button1Click
    end
    object edtPIS: TEdit
      Left = 10
      Top = 19
      Width = 135
      Height = 21
      MaxLength = 12
      TabOrder = 0
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 106
      Width = 321
      Height = 295
      Caption = 'Informa'#231#245'es '
      TabOrder = 2
      object Label3: TLabel
        Left = 5
        Top = 58
        Width = 25
        Height = 13
        Caption = 'Login'
      end
      object Label4: TLabel
        Left = 8
        Top = 152
        Width = 52
        Height = 13
        Caption = 'Hora Saida'
      end
      object Label5: TLabel
        Left = 8
        Top = 193
        Width = 32
        Height = 13
        Caption = 'Motivo'
      end
      object Label6: TLabel
        Left = 112
        Top = 152
        Width = 75
        Height = 13
        Caption = 'Autorizado por:'
      end
      object Label7: TLabel
        Left = 6
        Top = 17
        Width = 57
        Height = 13
        Caption = 'Data Inicial:'
      end
      object Label8: TLabel
        Left = 134
        Top = 17
        Width = 52
        Height = 13
        Caption = 'Data Final;'
      end
      object edtLogin: TEdit
        Left = 5
        Top = 74
        Width = 305
        Height = 21
        TabOrder = 2
      end
      object GroupBox2: TGroupBox
        Left = 6
        Top = 100
        Width = 302
        Height = 51
        Caption = 'Ocorr'#234'ncia'
        TabOrder = 3
        object rbHoraExtra: TRadioButton
          Left = 6
          Top = 21
          Width = 83
          Height = 17
          Caption = 'Hora-Extra'
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object rbAtraso: TRadioButton
          Left = 97
          Top = 21
          Width = 72
          Height = 17
          Caption = 'Atraso'
          TabOrder = 1
        end
        object rbFalta: TRadioButton
          Left = 176
          Top = 21
          Width = 65
          Height = 17
          Caption = 'Falta'
          TabOrder = 2
        end
      end
      object edtHrSaida: TMaskEdit
        Left = 8
        Top = 166
        Width = 89
        Height = 21
        EditMask = '!90:00;1; '
        MaxLength = 5
        TabOrder = 4
        Text = '  :  '
      end
      object mmoMotivo: TMemo
        Left = 8
        Top = 209
        Width = 297
        Height = 78
        TabOrder = 5
      end
      object edtAutorizado: TEdit
        Left = 112
        Top = 166
        Width = 193
        Height = 21
        TabOrder = 6
      end
      object edtDataIni: TMaskEdit
        Left = 6
        Top = 32
        Width = 120
        Height = 21
        EditMask = '!99/99/0000;1; '
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
      end
      object edtDataFim: TMaskEdit
        Left = 134
        Top = 32
        Width = 120
        Height = 21
        EditMask = '!99/99/0000;1; '
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
      end
    end
    object chkMultiplos: TCheckBox
      Left = 11
      Top = 41
      Width = 150
      Height = 17
      Caption = 'Multiplos Arquivos'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 412
    Width = 337
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnExecutar: TButton
      Left = 256
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Executar'
      TabOrder = 0
      OnClick = btnExecutarClick
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 307
    Top = 11
  end
  object shlGetDirectory: TcxShellBrowserDialog
    FolderLabelCaption = 'Selecione o diret'#243'rio'
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = True
    Path = 'C:\'
    Left = 280
    Top = 8
  end
end
