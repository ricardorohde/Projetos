object frmPrincipal: TfrmPrincipal
  Left = 259
  Top = 211
  BorderStyle = bsSingle
  Caption = 'S'#243' com a gente'
  ClientHeight = 269
  ClientWidth = 400
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 226
    Width = 400
    Height = 43
    Align = alBottom
    TabOrder = 0
    object btnEnviar: TButton
      Left = 275
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Enviar'
      TabOrder = 0
      TabStop = False
      OnClick = btnEnviarClick
    end
    object edtTexto: TEdit
      Left = 8
      Top = 8
      Width = 262
      Height = 21
      TabOrder = 1
      OnExit = edtTextoExit
      OnKeyDown = edtTextoKeyDown
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 372
    Height = 226
    Align = alLeft
    TabOrder = 1
    object pgConversas: TPageControl
      Left = 4
      Top = 4
      Width = 362
      Height = 214
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
      Width = 353
      Height = 166
      TabStop = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 1
      OnExit = mmoConversaExit
    end
  end
  object Panel1: TPanel
    Left = 400
    Top = 0
    Width = 0
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
    Left = 372
    Top = 0
    Width = 28
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
    Params = <>
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
    object Excluir1: TMenuItem
      Caption = 'Excluir'
      OnClick = Excluir1Click
    end
  end
  object MainMenu1: TMainMenu
    Left = 72
    object AdicionarUsurio1: TMenuItem
      Caption = 'Adicionar Usu'#225'rio'
      OnClick = AdicionarUsurio1Click
    end
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
end
