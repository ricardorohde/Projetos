object Form1: TForm1
  Left = 196
  Top = 220
  Width = 979
  Height = 563
  Caption = 'Form1'
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
    Left = 224
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Master: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'MasterIndex1'
        Fields = 'CdFornecedor'
        Options = [ixPrimary]
      end>
    IndexFieldNames = 'CdFornecedor'
    Params = <>
    StoreDefs = True
    Left = 224
    Top = 88
    object MasterCdFornecedor: TStringField
      FieldName = 'CdFornecedor'
    end
    object MasterNmFornecedor: TStringField
      FieldName = 'NmFornecedor'
    end
  end
  object Detail: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'DetailIndex1'
        Fields = 'CdFornecedor'
      end>
    IndexName = 'DetailIndex1'
    MasterFields = 'CdFornecedor'
    MasterSource = DataSource1
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 336
    Top = 96
    object DetailCdFornecedor: TStringField
      FieldName = 'CdFornecedor'
    end
    object DetailNrNota: TStringField
      FieldName = 'NrNota'
    end
  end
  object DataSource1: TDataSource
    DataSet = Master
    Left = 272
    Top = 88
  end
end
