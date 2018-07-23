object Form1: TForm1
  Left = 337
  Top = 197
  Width = 928
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 296
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 4
    OnClick = Button1Click
  end
  object DBSearchEdit1: TDBSearchEdit
    Left = 120
    Top = 48
    Width = 121
    Height = 21
    CaseSensitive = True
    LookUpAll = True
    ListFields.Strings = (
      'C'#243'digo;codigo;40;Retorno;integer;'
      'Nome da Empresa;Nome_Empresa;200;;string;')
    TabOrder = 1
    SkipEdit = False
    DataField = 'Codigo'
    DataSource = DataSource1
    ListSource = DataSource2
  end
  object Edit1: TEdit
    Left = 128
    Top = 96
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Edit1'
  end
  object wwDBComboDlg1: TwwDBComboDlg
    Left = 80
    Top = 144
    Width = 121
    Height = 21
    ShowButton = True
    Style = csDropDown
    TabOrder = 3
    WordWrap = False
    UnboundDataType = wwDefault
  end
  object DBEditBtn1: TDBEditBtn
    Left = 120
    Top = 16
    Width = 121
    Height = 21
    ListFields.Strings = (
      'C'#243'digo;codigo;40;Retorno;integer;'
      'Nome da Empresa;Nome_Empresa;200;;string;')
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF4D74AB234179C5ABA7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF4173AF008EEC009AF41F4B80FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFF2F6EB22BA7
      F516C0FF00A0F3568BC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFEFFFF2974BB68C4F86BD4FF279CE66696C8FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3D8FD5A4E3FEB5EEFF4CAA
      E7669DD2FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEA188898A6A6A93736E866567B0
      9595BAA8B1359EE8BDF5FF77C4EF63A1DAFFFFFFFFFFFFFFFFFFFFFFFFD7CDCD
      7E5857DFD3CBFFFFF7FFFFE7FFFEDBD6BB9E90584D817B8E1794E46BB5E9FFFF
      FFFFFFFFFFFFFFFFFFFFEDE9E9886565FFFFFFFFFFFFFDF8E8FAF2DCF8EDCFFF
      F1CFF6DEBA9F5945C0C7D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA38889F6EFEA
      FFFFFFFEFBF5FBF7E8F9F4DAF5EBCCE6CEACF3DAB8E2BD99AB8B8EFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF937674FFFFFFFDFBF1FCF8EEFAF3E1FCF5E3F7F0D7F0
      DFC1E7C9A9F0D1ABA87E75F8F6F6FFFFFFFFFFFFFFFFFFFFFFFF997D7AFFFFFC
      F9F2E1FAF3DEFAF7E5FAF1DCF1DFC0EDD9BAECD8B9EDCAA5AF8679EDE8E9FFFF
      FFFFFFFFFFFFFFFFFFFF9C807BFFFFEBF9EED5FAF1D7F9F2DAF2E3C6FEFBF9FF
      FFF0EFDFC0E9C69EB0857BF5F2F3FFFFFFFFFFFFFFFFFFFFFFFFAF9596F7EAC8
      F9EBCCEFDCBEF4E4C7F0E1C5FDFCECFAF5DDEFDCBCDFB087B59A9AFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFDED4D7BA998CFDECC4EDD4B0E5CAA8EFDBBFF2E3C4F2
      DEBCEABF93BB8E7DE7DFE2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEBFC5
      BE9A8DE6C7A5EFCBA3ECC8A2E8BE94DCAA86BE9585DFD6D7FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E4E6C9B3B4B99C93C3A097BF9F96CC
      B9B7F1EEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    NumGlyphs = 1
    TabOrder = 0
    OnKeyPress = DBEditBtn1KeyPress
    ListSource = DataSource2
    DataSource = DataSource1
    FieldName = 'Codigo'
  end
  object Button2: TButton
    Left = 88
    Top = 248
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Button2'
    TabOrder = 5
    OnClick = Button2Click
  end
  object DBEditbtnDescricao1: TDBEditbtnDescricao
    Left = 144
    Top = 216
    Width = 121
    Height = 21
    NumGlyphs = 1
    TabOrder = 6
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet2
    Left = 416
    Top = 64
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 448
    Top = 32
    object ClientDataSet1Codigo: TIntegerField
      FieldName = 'Codigo'
      DisplayFormat = '00000'
    end
    object ClientDataSet1Nome_Empresa: TStringField
      FieldName = 'Nome_Empresa'
      Size = 30
    end
  end
  object DataSource2: TDataSource
    DataSet = ClientDataSet1
    Left = 448
    Top = 64
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 32
    object ClientDataSet2Codigo: TIntegerField
      FieldName = 'Codigo'
      DisplayFormat = '00000'
    end
    object ClientDataSet2Nome_Empresa: TStringField
      FieldName = 'Nome_Empresa'
      Size = 30
    end
  end
end
