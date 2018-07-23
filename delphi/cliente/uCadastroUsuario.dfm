object frmCadUsuarios: TfrmCadUsuarios
  Left = 248
  Top = 255
  BorderStyle = bsSingle
  Caption = 'Usu'#225'rio'
  ClientHeight = 138
  ClientWidth = 146
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 97
    Width = 146
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btnOk: TButton
      Left = 8
      Top = 8
      Width = 64
      Height = 25
      Caption = 'Ok'
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnCancelar: TButton
      Left = 77
      Top = 8
      Width = 60
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 146
    Height = 97
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 9
      Width = 26
      Height = 13
      Caption = 'Login'
    end
    object Label2: TLabel
      Left = 8
      Top = 49
      Width = 13
      Height = 13
      Caption = 'IP:'
    end
    object edtLogin: TEdit
      Left = 8
      Top = 27
      Width = 121
      Height = 21
      MaxLength = 20
      TabOrder = 0
    end
    object edtIP: TEdit
      Left = 8
      Top = 66
      Width = 121
      Height = 21
      MaxLength = 20
      TabOrder = 1
    end
  end
end
