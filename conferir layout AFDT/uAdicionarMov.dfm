object frmAdicionarMov: TfrmAdicionarMov
  Left = 431
  Top = 306
  Width = 581
  Height = 179
  Caption = 'Adicionar Movimenta'#231#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 565
    Height = 99
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 154
      Top = 7
      Width = 27
      Height = 13
      Caption = 'Data:'
      Color = clWhite
      ParentColor = False
    end
    object Label2: TLabel
      Left = 9
      Top = 48
      Width = 36
      Height = 13
      Caption = 'Hora 1:'
      Color = clWhite
      ParentColor = False
    end
    object Label3: TLabel
      Left = 118
      Top = 48
      Width = 36
      Height = 13
      Caption = 'Hora 3:'
      Color = clWhite
      ParentColor = False
    end
    object Label4: TLabel
      Left = 63
      Top = 48
      Width = 36
      Height = 13
      Caption = 'Hora 2:'
      Color = clWhite
      ParentColor = False
    end
    object Label6: TLabel
      Left = 173
      Top = 48
      Width = 36
      Height = 13
      Caption = 'Hora 4:'
      Color = clWhite
      ParentColor = False
    end
    object Label7: TLabel
      Left = 227
      Top = 48
      Width = 36
      Height = 13
      Caption = 'Hora 5:'
      Color = clWhite
      ParentColor = False
    end
    object Label8: TLabel
      Left = 281
      Top = 48
      Width = 36
      Height = 13
      Caption = 'Hora 6:'
      Color = clWhite
      ParentColor = False
    end
    object Label9: TLabel
      Left = 333
      Top = 48
      Width = 36
      Height = 13
      Caption = 'Hora 7:'
      Color = clWhite
      ParentColor = False
    end
    object Label10: TLabel
      Left = 386
      Top = 48
      Width = 36
      Height = 13
      Caption = 'Hora 8:'
      Color = clWhite
      ParentColor = False
    end
    object Label11: TLabel
      Left = 442
      Top = 48
      Width = 36
      Height = 13
      Caption = 'Hora 9:'
      Color = clWhite
      ParentColor = False
    end
    object Label12: TLabel
      Left = 499
      Top = 48
      Width = 42
      Height = 13
      Caption = 'Hora 10:'
      Color = clWhite
      ParentColor = False
    end
    object Label5: TLabel
      Left = 9
      Top = 7
      Width = 20
      Height = 13
      Caption = 'PIS:'
      Color = clWhite
      ParentColor = False
    end
    object edtData: TMaskEdit
      Left = 154
      Top = 20
      Width = 77
      Height = 21
      EditMask = '!99/99/0000;1; '
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
    object edtHora1: TMaskEdit
      Left = 9
      Top = 65
      Width = 50
      Height = 21
      EditMask = '!90:00;1; '
      MaxLength = 5
      TabOrder = 2
      Text = '  :  '
    end
    object edtHora2: TMaskEdit
      Left = 63
      Top = 65
      Width = 50
      Height = 21
      EditMask = '!90:00;1; '
      MaxLength = 5
      TabOrder = 3
      Text = '  :  '
    end
    object edtHora3: TMaskEdit
      Left = 118
      Top = 65
      Width = 50
      Height = 21
      EditMask = '!90:00;1; '
      MaxLength = 5
      TabOrder = 4
      Text = '  :  '
    end
    object edtHora4: TMaskEdit
      Left = 173
      Top = 65
      Width = 50
      Height = 21
      EditMask = '!90:00;1; '
      MaxLength = 5
      TabOrder = 5
      Text = '  :  '
    end
    object edtHora5: TMaskEdit
      Left = 227
      Top = 65
      Width = 50
      Height = 21
      EditMask = '!90:00;1; '
      MaxLength = 5
      TabOrder = 6
      Text = '  :  '
    end
    object edtHora6: TMaskEdit
      Left = 281
      Top = 65
      Width = 50
      Height = 21
      EditMask = '!90:00;1; '
      MaxLength = 5
      TabOrder = 7
      Text = '  :  '
    end
    object edtHora7: TMaskEdit
      Left = 333
      Top = 65
      Width = 50
      Height = 21
      EditMask = '!90:00;1; '
      MaxLength = 5
      TabOrder = 8
      Text = '  :  '
    end
    object edtHora8: TMaskEdit
      Left = 386
      Top = 65
      Width = 50
      Height = 21
      EditMask = '!90:00;1; '
      MaxLength = 5
      TabOrder = 9
      Text = '  :  '
    end
    object edtHora9: TMaskEdit
      Left = 442
      Top = 65
      Width = 50
      Height = 21
      EditMask = '!90:00;1; '
      MaxLength = 5
      TabOrder = 10
      Text = '  :  '
    end
    object edtHora10: TMaskEdit
      Left = 499
      Top = 65
      Width = 50
      Height = 21
      EditMask = '!90:00;1; '
      MaxLength = 5
      TabOrder = 11
      Text = '  :  '
    end
    object edtPIS: TEdit
      Left = 9
      Top = 20
      Width = 136
      Height = 21
      MaxLength = 12
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 99
    Width = 565
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnAdicionar: TButton
      Left = 388
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Adicionar'
      TabOrder = 0
      OnClick = btnAdicionarClick
    end
    object btnCancelar: TButton
      Left = 476
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
end
