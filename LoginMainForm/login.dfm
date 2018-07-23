object LoginForm: TLoginForm
  Left = 373
  Top = 268
  Width = 200
  Height = 93
  Caption = 'LogIn'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pwdLabel: TLabel
    Left = 8
    Top = 8
    Width = 50
    Height = 13
    Caption = 'Password:'
  end
  object LogInButton: TButton
    Left = 128
    Top = 20
    Width = 55
    Height = 25
    Caption = 'Log In'
    TabOrder = 0
    OnClick = LogInButtonClick
  end
  object edtSenha: TcxTextEdit
    Left = 8
    Top = 24
    AutoSize = False
    Properties.CharCase = ecUpperCase
    Properties.PasswordChar = '*'
    TabOrder = 1
    Height = 26
    Width = 105
  end
end
