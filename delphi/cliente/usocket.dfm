object frmPrincipal: TfrmPrincipal
  Left = 259
  Top = 211
  BorderStyle = bsSingle
  Caption = 'EMSN'
  ClientHeight = 269
  ClientWidth = 631
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnHide = FormHide
  OnKeyPress = FormKeyPress
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 226
    Width = 631
    Height = 43
    Align = alBottom
    TabOrder = 0
    object btnEnviar: TButton
      Left = 533
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Enviar'
      TabOrder = 0
      TabStop = False
      OnClick = btnEnviarClick
    end
    object edtTexto: TEdit
      Left = 7
      Top = 9
      Width = 520
      Height = 21
      TabOrder = 1
      OnExit = edtTextoExit
      OnKeyDown = edtTextoKeyDown
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 593
    Height = 226
    Align = alLeft
    TabOrder = 1
    object Label2: TLabel
      Left = 7
      Top = 209
      Width = 184
      Height = 16
      Caption = 'Mensagem n'#227'o codificada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 295
      Top = 209
      Width = 154
      Height = 16
      Caption = 'Mensagem codificada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pgConversas: TPageControl
      Left = 4
      Top = 4
      Width = 581
      Height = 207
      ActivePage = TabSheet1
      PopupMenu = PopupMenu2
      TabOrder = 0
      TabStop = False
      OnChange = pgConversasChange
      object TabSheet1: TTabSheet
        Caption = 'TabSheet1'
        TabVisible = False
      end
    end
    object mmoConversa: TRichEdit
      Left = 8
      Top = 43
      Width = 281
      Height = 166
      TabStop = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 1
      OnExit = mmoConversaExit
    end
    object mmoCrip: TRichEdit
      Left = 293
      Top = 42
      Width = 283
      Height = 166
      TabStop = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 2
    end
  end
  object Panel1: TPanel
    Left = 629
    Top = 0
    Width = 2
    Height = 226
    Align = alRight
    Locked = True
    TabOrder = 2
    OnClick = Panel1Click
    object gridUsuarios: TDBGrid
      Left = 4
      Top = 8
      Width = 137
      Height = 209
      TabStop = False
      DataSource = dtsUsuarios
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = gridUsuariosDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Usuario'
          PopupMenu = PopupMenu3
          Title.Caption = 'Usuarios'
          Visible = True
        end>
    end
  end
  object Panel4: TPanel
    Left = 593
    Top = 0
    Width = 36
    Height = 226
    Align = alClient
    TabOrder = 3
    object Label1: TLabel
      Left = 2
      Top = 5
      Width = 20
      Height = 18
      Caption = '>>'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Nina'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      OnClick = Label1Click
    end
  end
  object Client: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = ClientConnect
    OnDisconnect = ClientDisconnect
    OnRead = ClientRead
    OnError = ClientError
    Left = 248
  end
  object PopupMenu1: TPopupMenu
    Left = 216
    object pmnuiOpen: TMenuItem
      Caption = 'Restaurar Programa'
      OnClick = pmnuiOpenClick
    end
    object pmnuiExit: TMenuItem
      Caption = 'Fechar Programa'
      OnClick = pmnuiExitClick
    end
  end
  object ClientUsuarios: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'IdxPrimario'
        Fields = 'IP'
        Options = [ixPrimary]
      end
      item
        Name = 'IdxUsuario'
        Fields = 'Usuario'
      end>
    Params = <>
    StoreDefs = True
    Left = 329
    object ClientUsuariosUsuario: TStringField
      FieldName = 'Usuario'
    end
    object ClientUsuariosIP: TStringField
      FieldName = 'IP'
    end
    object ClientUsuariosConversa: TBlobField
      FieldName = 'Conversa'
    end
  end
  object dtsUsuarios: TDataSource
    DataSet = ClientUsuarios
    Left = 297
  end
  object PopupMenu2: TPopupMenu
    Left = 184
    object Sair1: TMenuItem
      Caption = 'Fechar'
      OnClick = Sair1Click
    end
  end
  object MainMenu1: TMainMenu
    Left = 72
    object Configuracoes: TMenuItem
      Caption = 'Configura'#231#245'es'
      OnClick = ConfiguracoesClick
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 160
    object Novo1: TMenuItem
      Caption = 'Novo'
      OnClick = AdicionarUsurio1Click
    end
    object Excluir2: TMenuItem
      Caption = 'Excluir'
      OnClick = Excluir2Click
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 30000
    OnTimer = Timer1Timer
    Left = 360
    Top = 2
  end
end
