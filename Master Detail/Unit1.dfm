object Form1: TForm1
  Left = 192
  Top = 142
  Caption = 'Form1'
  ClientHeight = 609
  ClientWidth = 873
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
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 513
    Height = 120
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 184
    Width = 521
    Height = 161
    DataSource = DataSource2
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 16
    Top = 152
    Width = 280
    Height = 25
    DataSource = DataSource1
    TabOrder = 2
  end
  object Button1: TButton
    Left = 407
    Top = 134
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 16
    Top = 392
    Width = 369
    Height = 89
    TabOrder = 4
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 24
    object ClientDataSet1IDMASTER: TIntegerField
      FieldName = 'IDMASTER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object ClientDataSet1DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'IdxPrimario'
        Fields = 'IDMASTER'
        Options = [ixPrimary]
      end>
    IndexName = 'IdxPrimario'
    MasterFields = 'IDMASTER'
    MasterSource = DataSource1
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'IDMASTER'
        ParamType = ptInput
      end>
    StoreDefs = True
    Left = 40
    Top = 104
    object ClientDataSet2ID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object ClientDataSet2IDMASTER: TIntegerField
      FieldName = 'IDMASTER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object ClientDataSet2DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 112
    Top = 32
  end
  object DataSource2: TDataSource
    DataSet = ClientDataSet2
    Left = 120
    Top = 112
  end
end
