object flCustomForm: TflCustomForm
  Left = 200
  Top = 72
  Width = 600
  Height = 408
  Caption = 'flCustomForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TStatusBar
    Left = 0
    Top = 364
    Width = 592
    Height = 17
    Panels = <
      item
        Text = 'Fun'#231#227'o:'
        Width = 50
      end
      item
        Width = 50
      end>
  end
end
