object frmLogin: TfrmLogin
  Left = 371
  Top = 178
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Login'
  ClientHeight = 283
  ClientWidth = 215
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 242
    Width = 215
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btnConectar: TcxButton
      Left = 49
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Conectar'
      TabOrder = 0
      OnClick = btnConectarClick
    end
    object btnCancelar: TcxButton
      Left = 129
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 215
    Height = 242
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 18
      Top = 8
      Width = 119
      Height = 13
      Caption = 'Tipo do Banco de Dados'
    end
    object Label2: TLabel
      Left = 18
      Top = 52
      Width = 36
      Height = 13
      Caption = 'Usu'#225'rio'
    end
    object Label3: TLabel
      Left = 18
      Top = 100
      Width = 31
      Height = 13
      Caption = 'Senha'
    end
    object Label4: TLabel
      Left = 18
      Top = 144
      Width = 39
      Height = 13
      Caption = 'Servidor'
    end
    object Label5: TLabel
      Left = 18
      Top = 184
      Width = 73
      Height = 13
      Caption = 'Base de Dados'
    end
    object cboTipo: TcxComboBox
      Left = 18
      Top = 24
      Properties.Items.Strings = (
        'Sql Server'
        'Postgres')
      TabOrder = 0
      Width = 145
    end
    object edtUsuario: TcxTextEdit
      Left = 18
      Top = 71
      Properties.MaxLength = 15
      TabOrder = 1
      Width = 145
    end
    object edtSenha: TcxTextEdit
      Left = 18
      Top = 119
      Properties.MaxLength = 15
      Properties.PasswordChar = '*'
      TabOrder = 2
      Width = 145
    end
    object cboServidor: TcxComboBox
      Left = 18
      Top = 160
      TabOrder = 3
      Width = 145
    end
    object cboBase: TcxComboBox
      Left = 18
      Top = 200
      TabOrder = 4
      Width = 145
    end
  end
  object UniConnection1: TUniConnection
    ProviderName = 'SQL Server'
    Left = 160
    Top = 40
  end
  object UniQuery1: TUniQuery
    Connection = UniConnection1
    Left = 152
    Top = 72
  end
end
