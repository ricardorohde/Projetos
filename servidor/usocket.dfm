object frmPrincipal: TfrmPrincipal
  Left = 586
  Top = 162
  Width = 285
  Height = 90
  BorderIcons = [biSystemMenu]
  Caption = 'Servidor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 269
    Height = 51
    Align = alClient
    TabOrder = 0
    object Label3: TLabel
      Left = 10
      Top = 19
      Width = 28
      Height = 13
      Caption = 'Porta:'
    end
    object edtPorta: TEdit
      Left = 53
      Top = 19
      Width = 121
      Height = 21
      TabOrder = 0
      Text = '8080'
    end
    object btnConectar: TButton
      Left = 185
      Top = 15
      Width = 75
      Height = 25
      Caption = 'Conectar'
      TabOrder = 1
      OnClick = btnConectarClick
    end
  end
  object ServerSocket1: TServerSocket
    Active = False
    Port = 3100
    ServerType = stNonBlocking
    OnClientConnect = ServerSocket1ClientConnect
    OnClientDisconnect = ServerSocket1ClientDisconnect
    OnClientRead = ServerSocket1ClientRead
    Left = 32
    Top = 8
  end
  object PopupMenu1: TPopupMenu
    Left = 64
    Top = 8
    object pmnuiOpen: TMenuItem
      Caption = 'Restaurar Programa'
      OnClick = pmnuiOpenClick
    end
    object pmnuiExit: TMenuItem
      Caption = 'Fechar Programa'
      OnClick = pmnuiExitClick
    end
  end
end
