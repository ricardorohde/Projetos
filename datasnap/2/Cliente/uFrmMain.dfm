object FrmMain: TFrmMain
  Left = 346
  Top = 242
  Width = 438
  Height = 320
  Caption = 'DataSnap Client'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 41
    Width = 430
    Height = 252
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Dados'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 8
        Width = 417
        Height = 161
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Detalhe'
      ImageIndex = 1
      object Label1: TLabel
        Left = 6
        Top = 48
        Width = 73
        Height = 13
        Caption = 'codigo_externo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 6
        Top = 88
        Width = 46
        Height = 13
        Caption = 'descricao'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 6
        Top = 6
        Width = 46
        Height = 13
        Caption = 'id_horario'
        FocusControl = DBEdit3
      end
      object DBEdit1: TDBEdit
        Left = 6
        Top = 64
        Width = 134
        Height = 21
        DataField = 'codigo_externo'
        DataSource = DataSource1
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 6
        Top = 104
        Width = 300
        Height = 21
        DataField = 'descricao'
        DataSource = DataSource1
        TabOrder = 1
      end
      object DBCheckBox1: TDBCheckBox
        Left = 6
        Top = 128
        Width = 97
        Height = 17
        Caption = 'possui_escala'
        DataField = 'possui_escala'
        DataSource = DataSource1
        TabOrder = 2
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object DBEdit3: TDBEdit
        Left = 6
        Top = 22
        Width = 134
        Height = 21
        DataField = 'id_horario'
        DataSource = DataSource1
        TabOrder = 3
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 430
    Height = 41
    Align = alTop
    TabOrder = 1
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 96
      Top = 8
      Width = 75
      Height = 25
      Caption = 'CPF'
      TabOrder = 1
      OnClick = Button2Click
    end
    object DBNavigator1: TDBNavigator
      Left = 176
      Top = 8
      Width = 240
      Height = 25
      DataSource = DataSource1
      TabOrder = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = DM.ClientDataSet1
    Left = 256
    Top = 80
  end
end
