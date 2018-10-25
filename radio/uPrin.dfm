object frmPrincipal: TfrmPrincipal
  Left = 236
  Top = 169
  Caption = 'Reinf'
  ClientHeight = 68
  ClientWidth = 175
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
  object Timer1: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 128
    Top = 8
  end
end
