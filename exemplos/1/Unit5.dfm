object Form5: TForm5
  Left = 474
  Top = 140
  Width = 536
  Height = 260
  Caption = 'Form5'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 97
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 178
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Load'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 16
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Create'
    TabOrder = 6
    OnClick = Button3Click
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 16
    Top = 80
    DockControlHeights = (
      0
      0
      26
      0)
    object dxBar1: TdxBar
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 168
      FloatTop = 81
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
  end
end
