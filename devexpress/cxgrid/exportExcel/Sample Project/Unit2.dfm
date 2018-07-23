object Form2: TForm2
  Left = 91
  Top = 195
  Caption = 'Form2'
  ClientHeight = 453
  ClientWidth = 688
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
    Left = 8
    Top = 8
    Width = 672
    Height = 379
    TabOrder = 0
    object cxGrid1TableView1: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid1TableView1Column1: TcxGridColumn
        Caption = 'String Data (OK)'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 124
      end
      object cxGrid1TableView1Column2: TcxGridColumn
        Caption = 'Double Data (OK)'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxCalcEditProperties'
        Width = 117
      end
      object cxGrid1TableView1Column3: TcxGridColumn
        Caption = 'String or Double with CalcEdit(Not OK)'
        PropertiesClassName = 'TcxCalcEditProperties'
        Width = 213
      end
      object cxGrid1TableView1Column4: TcxGridColumn
        Caption = 'Variant with CalcEdit (OK)'
        DataBinding.ValueType = 'Variant'
        PropertiesClassName = 'TcxCalcEditProperties'
        Width = 185
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1TableView1
    end
  end
  object Button1: TButton
    Left = 308
    Top = 400
    Width = 75
    Height = 25
    Caption = '&Export Excel'
    TabOrder = 1
    OnClick = Button1Click
  end
end
