object Form1: TForm1
  Left = 367
  Top = 124
  Width = 1305
  Height = 675
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
  object cxGrid1: TcxGrid
    Left = 8
    Top = 8
    Width = 625
    Height = 513
    TabOrder = 0
    object cxGrid1Level1: TcxGridLevel
    end
  end
  object Button1: TButton
    Left = 280
    Top = 536
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object DS: TDataSource
    DataSet = dxMemData1
    Left = 184
    Top = 560
  end
  object dxMemData1: TdxMemData
    Active = True
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F0200000014000000010005004E616D650004000000
      0300060061736461730001050000004E616D6531010100000001050000004E61
      6D6532010200000001050000004E616D65330103000000}
    SortOptions = []
    Left = 224
    Top = 560
    object dxMemData1Name: TStringField
      FieldName = 'Name'
    end
    object dxMemData1asdas: TIntegerField
      FieldName = 'asdas'
    end
  end
end
