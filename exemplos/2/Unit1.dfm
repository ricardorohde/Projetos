object Form1: TForm1
  Left = 192
  Top = 150
  Width = 234
  Height = 131
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 112
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Load'
    TabOrder = 5
    OnClick = Button2Click
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
    Left = 72
    Top = 64
    DockControlHeights = (
      0
      0
      26
      0)
    object dxBarManager1Bar1: TdxBar
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 142
      FloatTop = 150
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarSubItem1'
        end
        item
          Visible = True
          ItemName = 'dxBarButton4'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarButton1: TdxBarButton
      Caption = 'Test1'
      Category = 0
      Hint = 'Test1'
      Visible = ivAlways
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'SubItem1'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton2'
        end
        item
          Visible = True
          ItemName = 'dxBarButton3'
        end>
    end
    object dxBarButton2: TdxBarButton
      Caption = 'Test3'
      Category = 0
      Hint = 'Test3'
      Visible = ivAlways
    end
    object dxBarButton3: TdxBarButton
      Caption = 'Test4'
      Category = 0
      Hint = 'Test4'
      Visible = ivAlways
    end
    object dxBarButton4: TdxBarButton
      Caption = 'Test2'
      Category = 0
      Hint = 'Test2'
      Visible = ivAlways
    end
  end
end
