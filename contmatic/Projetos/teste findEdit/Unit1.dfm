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
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 296
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
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
    ListSource = DataSource2
  end
  object EMSTable1: TEMSTable
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 32
    object EMSTable1codigo: TIntegerField
      FieldName = 'codigo'
    end
    object EMSTable1descricao: TStringField
      FieldName = 'descricao'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = EMSTable1
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
end
