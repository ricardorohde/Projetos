object frmUsuarios: TfrmUsuarios
  Left = 358
  Top = 155
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Usu'#225'rios Conectados'
  ClientHeight = 289
  ClientWidth = 156
  Color = clBtnFace
  Constraints.MaxHeight = 328
  Constraints.MinHeight = 327
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 156
    Height = 289
    Align = alClient
    Color = clBackground
    TabOrder = 0
    object gridUsuarios: TDBGrid
      Left = 3
      Top = 2
      Width = 150
      Height = 284
      TabStop = False
      DataSource = frmPrincipal.dtsUsuarios
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      OnDblClick = gridUsuariosDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Usuario'
          Title.Alignment = taCenter
          Title.Caption = 'Usu'#225'rios'
          Width = 135
          Visible = True
        end>
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 32
    Top = 64
    object Editar1: TMenuItem
      Caption = 'Editar'
      OnClick = Editar1Click
    end
    object Excuir1: TMenuItem
      Caption = 'Excuir'
      OnClick = Excuir1Click
    end
  end
end
