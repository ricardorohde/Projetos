object Form1: TForm1
  Left = 486
  Top = 112
  Width = 707
  Height = 542
  Caption = 'absDB601dvx45_tibTracker_102'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 56
    Top = 256
    Width = 553
    Height = 121
    Color = clMoneyGreen
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 216
    Top = 440
    Width = 200
    Height = 25
    DataSource = DataSource1
    TabOrder = 1
  end
  object cxGrid1: TcxGrid
    Left = 56
    Top = 24
    Width = 609
    Height = 193
    BevelInner = bvLowered
    BevelKind = bkSoft
    BorderWidth = 1
    TabOrder = 2
    LookAndFeel.Kind = lfUltraFlat
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnCellClick = cxGrid1DBTableView1CellClick
      OnCellDblClick = cxGrid1DBTableView1CellDblClick
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Navigator = True
      object cxGrid1DBTableView1date: TcxGridDBColumn
        DataBinding.FieldName = 'date'
        HeaderAlignmentHorz = taCenter
      end
      object cxGrid1DBTableView1timeStart: TcxGridDBColumn
        DataBinding.FieldName = 'timeStart'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Kind = ckDateTime
        OnGetDisplayText = cxGrid1DBTableView1timeStartGetDisplayText
        OnGetProperties = cxGrid1DBTableView1timeStartGetProperties
        HeaderAlignmentHorz = taCenter
        Width = 136
      end
      object cxGrid1DBTableView1timeStop: TcxGridDBColumn
        DataBinding.FieldName = 'timeStop'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Kind = ckDateTime
        HeaderAlignmentHorz = taCenter
        Width = 140
      end
      object cxGrid1DBTableView1duration: TcxGridDBColumn
        DataBinding.FieldName = 'duration'
        OnGetDataText = cxGrid1DBTableView1durationGetDataText
        OnGetDisplayText = cxGrid1DBTableView1durationGetDisplayText
        HeaderAlignmentHorz = taCenter
      end
      object cxGrid1DBTableView1timeExt: TcxGridDBColumn
        DataBinding.FieldName = 'timeExt'
        HeaderAlignmentHorz = taCenter
      end
      object cxGrid1DBTableView1string: TcxGridDBColumn
        DataBinding.FieldName = 'string'
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        MinWidth = 5
        Width = 100
      end
      object cxGrid1DBTableView1memo: TcxGridDBColumn
        DataBinding.FieldName = 'memo'
        HeaderAlignmentHorz = taCenter
      end
      object cxGrid1DBTableView1blob: TcxGridDBColumn
        DataBinding.FieldName = 'blob'
        HeaderAlignmentHorz = taCenter
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object DBEdit1: TDBEdit
    Left = 56
    Top = 400
    Width = 97
    Height = 21
    Color = clMoneyGreen
    DataField = 'timeStart'
    DataSource = DataSource1
    TabOrder = 3
  end
  object cxBut_export: TcxButton
    Left = 88
    Top = 224
    Width = 81
    Height = 17
    Caption = 'Export'
    TabOrder = 4
    OnClick = cxBut_exportClick
  end
  object cxDateEdit1: TcxDateEdit
    Left = 176
    Top = 224
    Properties.OnCloseUp = cxDateEdit1PropertiesCloseUp
    TabOrder = 5
    Width = 121
  end
  object ABSTable1: TABSTable
    CurrentVersion = '5.18 '
    DatabaseName = 'defaults'
    InMemory = False
    ReadOnly = False
    Active = True
    OnCalcFields = ABSTable1CalcFields
    StoreDefs = True
    FieldDefs = <
      item
        Name = 'date'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'timeStart'
        Attributes = [faRequired]
        DataType = ftDateTime
      end
      item
        Name = 'timeStop'
        Attributes = [faRequired]
        DataType = ftDateTime
      end
      item
        Name = 'duration'
        DataType = ftTime
      end
      item
        Name = 'timeExt'
        DataType = ftTime
      end
      item
        Name = 'string'
        DataType = ftString
        Size = 256
      end
      item
        Name = 'memo'
        DataType = ftMemo
      end
      item
        Name = 'blob'
        DataType = ftBlob
      end>
    TableName = 'table_dttdtsmb'
    Exclusive = True
    Top = 56
  end
  object ABSDatabase1: TABSDatabase
    Connected = True
    CurrentVersion = '5.18 '
    DatabaseFileName = 
      'C:\_dev.delphi\_D7\absDB601dvx45_tibTracker_101\absDB_T1F8dateTi' +
      'me_tibTracker.ABS'
    DatabaseName = 'defaults'
    Exclusive = False
    MaxConnections = 2
    MultiUser = False
    SessionName = 'Default'
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = ABSTable1
    Top = 88
  end
end
