object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 209
  ClientWidth = 406
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
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 406
    Height = 209
    Align = alClient
    TabOrder = 0
    object cxGrid1TableView1: TcxGridTableView
      Navigator.Visible = True
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsView.GroupByBox = False
      object cxGrid1TableView1Column1: TcxGridColumn
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.DropDownListStyle = lsEditFixedList
        Properties.ImmediatePost = True
        Properties.Items.Strings = (
          'Item 1'
          'Item needs additional Info'
          'Item 3'
          'Item 4')
        Properties.OnEditValueChanged = cxGrid1TableView1Column1PropertiesEditValueChanged
        Width = 185
      end
      object cxGrid1TableView1Column2: TcxGridColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ValidateOnEnter = True
        Properties.OnEditValueChanged = cxGrid1TableView1Column2PropertiesEditValueChanged
        Properties.OnValidate = cxGrid1TableView1Column2PropertiesValidate
        Width = 171
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1TableView1
    end
  end
  object BalloonHint1: TBalloonHint
    Images = ImageList1
    Delay = 1
    Left = 184
    Top = 56
  end
  object ImageList1: TImageList
    ColorDepth = cd32Bit
    Height = 32
    Width = 32
    Left = 136
    Top = 56
  end
end
