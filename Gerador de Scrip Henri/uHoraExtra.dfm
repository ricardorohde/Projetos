object frmhoraExtra: TfrmhoraExtra
  Left = 214
  Top = 152
  Width = 353
  Height = 134
  Caption = 'Gerador de SCRIP Leitora Henry'
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
    Height = 54
    Align = alClient
    TabOrder = 0
    object Label2: TLabel
      Left = 10
      Top = 2
      Width = 41
      Height = 13
      Caption = 'Arquivo:'
    end
    object edtArquivo: TEdit
      Left = 10
      Top = 18
      Width = 257
      Height = 21
      TabOrder = 0
    end
    object Button1: TButton
      Left = 270
      Top = 16
      Width = 32
      Height = 25
      Caption = '...'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 54
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
    object Button2: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'LayOut'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 307
    Top = 11
  end
end
