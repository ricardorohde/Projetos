object frmConexao: TfrmConexao
  Left = 256
  Top = 107
  BorderStyle = bsSingle
  Caption = 'Conex'#227'o'
  ClientHeight = 91
  ClientWidth = 289
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 289
    Height = 91
    Align = alClient
    TabOrder = 0
    object Label2: TLabel
      Left = 16
      Top = 26
      Width = 42
      Height = 13
      Caption = 'Servidor:'
    end
    object Label3: TLabel
      Left = 16
      Top = 56
      Width = 28
      Height = 13
      Caption = 'Porta:'
    end
    object edtServidor: TEdit
      Left = 64
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'localhost'
    end
    object edtPorta: TEdit
      Left = 64
      Top = 56
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '3100'
    end
    object btnConectar: TButton
      Left = 201
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Conectar'
      TabOrder = 2
      OnClick = btnConectarClick
    end
  end
end
