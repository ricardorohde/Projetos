object Form1: TForm1
  Left = 192
  Top = 107
  Width = 928
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 920
    Height = 453
    Align = alClient
    TabOrder = 0
    object cxGrid1DBCardView1: TcxGridDBCardView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.CaptionSeparator = #0
      OptionsView.EmptyRows = False
      Styles.Content = cxStyle1
      object cxGrid1DBCardView1Campo1: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Campo1'
        Options.ShowCaption = False
        Position.BeginsLayer = True
      end
      object cxGrid1DBCardView1Campo2: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Campo2'
        Options.ShowCaption = False
        Position.BeginsLayer = True
      end
      object cxGrid1DBCardView1Campo3: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Campo3'
        Options.ShowCaption = False
        Position.BeginsLayer = True
      end
      object cxGrid1DBCardView1Campo4: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Campo4'
        Options.ShowCaption = False
        Position.BeginsLayer = True
      end
      object cxGrid1DBCardView1Campo5: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Campo5'
        Options.ShowCaption = False
        Position.BeginsLayer = True
      end
      object cxGrid1DBCardView1Campo6: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Campo6'
        Options.ShowCaption = False
        Position.BeginsLayer = True
      end
      object cxGrid1DBCardView1Campo7: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Campo7'
        Options.ShowCaption = False
        Position.BeginsLayer = True
      end
      object cxGrid1DBCardView1Campo8: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Campo8'
        Options.ShowCaption = False
        Position.BeginsLayer = True
      end
      object cxGrid1DBCardView1Campo9: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Campo9'
        Options.ShowCaption = False
        Position.BeginsLayer = True
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBCardView1
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsCorte
    Left = 600
    Top = 80
  end
  object cdsCorte: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 496
    Top = 128
    object cdsCorteCampo1: TStringField
      FieldName = 'Campo1'
      Size = 100
    end
    object cdsCorteCampo2: TStringField
      FieldName = 'Campo2'
      Size = 100
    end
    object cdsCorteCampo3: TStringField
      FieldName = 'Campo3'
      Size = 100
    end
    object cdsCorteCampo4: TStringField
      FieldName = 'Campo4'
      Size = 100
    end
    object cdsCorteCampo5: TStringField
      FieldName = 'Campo5'
      Size = 100
    end
    object cdsCorteCampo6: TStringField
      FieldName = 'Campo6'
      Size = 100
    end
    object cdsCorteCampo7: TStringField
      FieldName = 'Campo7'
      Size = 100
    end
    object cdsCorteCampo8: TStringField
      FieldName = 'Campo8'
      Size = 100
    end
    object cdsCorteCampo9: TStringField
      FieldName = 'Campo9'
      Size = 100
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 312
    Top = 160
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
  end
end
