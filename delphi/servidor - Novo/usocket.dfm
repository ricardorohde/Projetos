object frmPrincipal: TfrmPrincipal
  Left = 586
  Top = 162
  Width = 257
  Height = 69
  BorderIcons = []
  Caption = 'Servidor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
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
    Width = 241
    Height = 30
    Align = alClient
    TabOrder = 0
    object Label3: TLabel
      Left = 78
      Top = 1
      Width = 67
      Height = 23
      Alignment = taCenter
      Caption = 'Servidor'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtPorta: TEdit
      Left = 13
      Top = 59
      Width = 121
      Height = 21
      TabOrder = 0
      Text = '8080'
      Visible = False
    end
    object btnConectar: TButton
      Left = 145
      Top = 63
      Width = 75
      Height = 25
      Caption = 'Conectar'
      TabOrder = 1
      Visible = False
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
    object pmnuiExit: TMenuItem
      Caption = 'Fechar Programa'
      OnClick = pmnuiExitClick
    end
  end
end
