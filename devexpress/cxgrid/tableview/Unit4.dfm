object Form4: TForm4
  Left = 0
  Top = 0
  Width = 897
  Height = 774
  Caption = 'Form4'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 8
    Top = 16
    Width = 689
    Height = 377
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid1DBTableView1Name: TcxGridDBColumn
        DataBinding.FieldName = 'Name'
      end
      object cxGrid1DBTableView1Capital: TcxGridDBColumn
        DataBinding.FieldName = 'Capital'
      end
      object cxGrid1DBTableView1Continent: TcxGridDBColumn
        DataBinding.FieldName = 'Continent'
      end
      object cxGrid1DBTableView1Area: TcxGridDBColumn
        DataBinding.FieldName = 'Area'
      end
      object cxGrid1DBTableView1Population: TcxGridDBColumn
        DataBinding.FieldName = 'Population'
      end
    end
    object cxGrid1DBBandedTableView1: TcxGridDBBandedTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Bands = <
        item
        end>
      object cxGrid1DBBandedTableView1Name: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Name'
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1Capital: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Capital'
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1Continent: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Continent'
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1Area: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Area'
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1Population: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Population'
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
    object cxGrid1Level2: TcxGridLevel
      GridView = cxGrid1DBBandedTableView1
    end
  end
  object Button1: TButton
    Left = 8
    Top = 407
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object cxComboBox1: TcxComboBox
    Left = 168
    Top = 409
    TabOrder = 2
    Text = 'cxComboBox1'
    Width = 121
  end
  object cxGrid2: TcxGrid
    Left = 8
    Top = 464
    Width = 689
    Height = 257
    TabOrder = 3
    object cxGrid2DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DataSource2
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid2DBTableView1RecId: TcxGridDBColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
      end
      object cxGrid2DBTableView1caption: TcxGridDBColumn
        DataBinding.FieldName = 'caption'
      end
      object cxGrid2DBTableView1mezonev: TcxGridDBColumn
        DataBinding.FieldName = 'mezonev'
      end
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = cxGrid2DBTableView1
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 112
    Top = 344
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    TableName = 'country.db'
    Left = 72
    Top = 344
  end
  object dxMemData1: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 96
    Top = 408
    object dxMemData1caption: TStringField
      FieldName = 'caption'
    end
    object dxMemData1mezonev: TStringField
      FieldName = 'mezonev'
    end
  end
  object DataSource2: TDataSource
    DataSet = dxMemData1
    Left = 136
    Top = 408
  end
end
