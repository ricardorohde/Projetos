object frmPrincipal: TfrmPrincipal
  Left = 399
  Top = 287
  BorderStyle = bsSingle
  Caption = 'Principal'
  ClientHeight = 250
  ClientWidth = 495
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 56
    Top = 48
    object N1: TMenuItem
      Caption = 'Arquivos'
      object Horarios1: TMenuItem
        Caption = 'Horarios'
        OnClick = Horarios1Click
      end
    end
  end
end
