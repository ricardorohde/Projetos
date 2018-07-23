object frmPrincipal: TfrmPrincipal
  Left = 236
  Top = 169
  Caption = 'Radio'
  ClientHeight = 35
  ClientWidth = 249
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object WebBrowser1: TWebBrowser
    Left = 0
    Top = 0
    Width = 249
    Height = 35
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 257
    ExplicitHeight = 47
    ControlData = {
      4C000000BC1900009E0300000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object PopupMenu1: TPopupMenu
    Left = 64
    Top = 8
    object Abrir: TMenuItem
      Caption = 'Restaurar Programa'
      OnClick = pmnuiOpenClick
    end
    object pmnuiExit: TMenuItem
      Caption = 'Fechar Programa'
      OnClick = pmnuiExitClick
    end
  end
end
