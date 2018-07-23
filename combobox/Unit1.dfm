object Form1: TForm1
  Left = 190
  Top = 151
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
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 200
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 144
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object cxComboBox1: TcxComboBox
    Left = 400
    Top = 104
    Properties.Items.Strings = (
      'teste1'
      'teste2'
      'teste3')
    Properties.ReadOnly = True
    TabOrder = 2
    Text = 'cxComboBox1'
    Width = 177
  end
  object cxDBNavigator1: TcxDBNavigator
    Left = 392
    Top = 40
    Width = 450
    Height = 25
    DataSource = DataSource1
    InfoPanel.Font.Charset = DEFAULT_CHARSET
    InfoPanel.Font.Color = clDefault
    InfoPanel.Font.Height = -11
    InfoPanel.Font.Name = 'MS Sans Serif'
    InfoPanel.Font.Style = []
    TabOrder = 3
  end
  object cxDBImageComboBox1: TcxDBImageComboBox
    Left = 608
    Top = 96
    DataBinding.DataField = 'teste'
    DataBinding.DataSource = DataSource1
    Properties.ImmediatePost = True
    Properties.Items = <
      item
        Description = 'TESTE1'
        ImageIndex = 0
        Value = 'teste1'
      end
      item
        Description = 'TESTE2'
        Value = 'teste2'
      end
      item
        Description = 'TESTE3'
        Value = 'teste3'
      end>
    Properties.OnButtonClick = cxDBImageComboBox1PropertiesButtonClick
    Properties.OnInitPopup = cxDBImageComboBox1PropertiesPopup
    Properties.OnPopup = cxDBImageComboBox1PropertiesPopup
    TabOrder = 4
    Width = 121
  end
  object JvDBComboBox1: TJvDBComboBox
    Left = 608
    Top = 216
    Width = 145
    Height = 21
    DataField = 'teste'
    DataSource = DataSource1
    ItemHeight = 13
    Items.Strings = (
      'TESTE1'
      'TESTE2'
      'TESTE3')
    ReadOnly = True
    TabOrder = 5
    Values.Strings = (
      'TESTE1'
      'TESTE2'
      'TESTE3')
    ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
    ListSettings.OutfilteredValueFont.Color = clRed
    ListSettings.OutfilteredValueFont.Height = -11
    ListSettings.OutfilteredValueFont.Name = 'MS Sans Serif'
    ListSettings.OutfilteredValueFont.Style = []
  end
  object CheckBox1: TCheckBox
    Left = 152
    Top = 120
    Width = 97
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 6
    OnClick = CheckBox1Click
  end
  object DBComboBox1: TDBComboBox
    Left = 296
    Top = 144
    Width = 145
    Height = 21
    DataField = 'teste'
    DataSource = DataSource1
    ItemHeight = 13
    Items.Strings = (
      'TESTE1'
      'TESTE2'
      'TESTE3')
    ReadOnly = True
    TabOrder = 7
    OnDropDown = DBComboBox1DropDown
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 704
    Top = 144
    object ClientDataSet1teste: TStringField
      FieldName = 'teste'
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 448
    Top = 224
  end
end
