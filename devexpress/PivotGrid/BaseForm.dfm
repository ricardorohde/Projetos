object fmBase: TfmBase
  Left = 340
  Top = 166
  Caption = 'BaseForm'
  ClientHeight = 562
  ClientWidth = 788
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object paMenu: TPanel
    Left = 0
    Top = 0
    Width = 788
    Height = 27
    Align = alTop
    TabOrder = 0
    object paBaseClose: TPanel
      Left = 602
      Top = 1
      Width = 185
      Height = 25
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 466
      ExplicitTop = 2
      ExplicitHeight = 26
      DesignSize = (
        185
        25)
      object Label5: TLabel
        Left = 63
        Top = 5
        Width = 40
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'F1=Help'
      end
      object btnCloseWindow: TButton
        Left = 110
        Top = 0
        Width = 75
        Height = 25
        Action = actCloseWindow
        Anchors = [akTop, akRight]
        Cancel = True
        TabOrder = 0
      end
    end
  end
  object alMain: TActionList
    Left = 720
    Top = 48
    object actCloseWindow: TAction
      Caption = 'Close'
      OnExecute = actCloseWindowExecute
    end
    object actHelp: TAction
      Caption = 'actHelp'
      ShortCut = 112
      OnExecute = actHelpExecute
    end
  end
end
