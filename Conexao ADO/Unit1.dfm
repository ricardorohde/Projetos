object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 400
  ClientWidth = 455
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 359
    Width = 455
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btnEditar: TButton
      Left = 292
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 0
      OnClick = btnEditarClick
    end
    object btnDelete: TButton
      Left = 370
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Delete'
      TabOrder = 1
      OnClick = btnDeleteClick
    end
    object btnInsert: TButton
      Left = 213
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Insert'
      TabOrder = 2
      OnClick = btnInsertClick
    end
    object btnRefresh: TButton
      Left = 128
      Top = 8
      Width = 75
      Height = 25
      Caption = 'refresh'
      TabOrder = 3
      OnClick = FormShow
    end
    object btnPost: TButton
      Left = 47
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Post'
      TabOrder = 4
      OnClick = btnPostClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 455
    Height = 359
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Dados'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 447
        Height = 331
        Align = alClient
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Detalhe'
      ImageIndex = 1
      object Label1: TLabel
        Left = 3
        Top = 3
        Width = 44
        Height = 13
        Caption = 'CODORG'
        FocusControl = DBEdit2
      end
      object Label2: TLabel
        Left = 3
        Top = 43
        Width = 45
        Height = 13
        Caption = 'NOMORG'
        FocusControl = DBEdit3
      end
      object Label3: TLabel
        Left = 3
        Top = 83
        Width = 133
        Height = 13
        Caption = 'CDSTATUS_ORGANIZACAO'
        FocusControl = DBEdit4
      end
      object Label4: TLabel
        Left = 3
        Top = 123
        Width = 127
        Height = 13
        Caption = 'CDOPERADOR_INCLUSAO'
        FocusControl = DBEdit5
      end
      object Label5: TLabel
        Left = 3
        Top = 163
        Width = 64
        Height = 13
        Caption = 'DTINCLUSAO'
        FocusControl = DBEdit6
      end
      object Label6: TLabel
        Left = 3
        Top = 203
        Width = 66
        Height = 13
        Caption = 'CDSITUACAO'
        FocusControl = DBEdit7
      end
      object Label7: TLabel
        Left = 3
        Top = 243
        Width = 136
        Height = 13
        Caption = 'CDOPERADOR_ALTERACAO'
        FocusControl = DBEdit8
      end
      object Label8: TLabel
        Left = 3
        Top = 283
        Width = 73
        Height = 13
        Caption = 'DTALTERACAO'
        FocusControl = DBEdit9
      end
      object DBEdit2: TDBEdit
        Left = 3
        Top = 19
        Width = 134
        Height = 21
        DataField = 'CODORG'
        DataSource = DataSource1
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 3
        Top = 59
        Width = 300
        Height = 21
        DataField = 'NOMORG'
        DataSource = DataSource1
        TabOrder = 1
      end
      object DBEdit4: TDBEdit
        Left = 3
        Top = 99
        Width = 147
        Height = 21
        DataField = 'CDSTATUS_ORGANIZACAO'
        DataSource = DataSource1
        TabOrder = 2
      end
      object DBEdit5: TDBEdit
        Left = 3
        Top = 139
        Width = 199
        Height = 21
        DataField = 'CDOPERADOR_INCLUSAO'
        DataSource = DataSource1
        TabOrder = 3
      end
      object DBEdit6: TDBEdit
        Left = 3
        Top = 179
        Width = 238
        Height = 21
        DataField = 'DTINCLUSAO'
        DataSource = DataSource1
        TabOrder = 4
      end
      object DBEdit7: TDBEdit
        Left = 3
        Top = 219
        Width = 147
        Height = 21
        DataField = 'CDSITUACAO'
        DataSource = DataSource1
        TabOrder = 5
      end
      object DBEdit8: TDBEdit
        Left = 3
        Top = 259
        Width = 199
        Height = 21
        DataField = 'CDOPERADOR_ALTERACAO'
        DataSource = DataSource1
        TabOrder = 6
      end
      object DBEdit9: TDBEdit
        Left = 3
        Top = 299
        Width = 238
        Height = 21
        DataField = 'DTALTERACAO'
        DataSource = DataSource1
        TabOrder = 7
      end
    end
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=tusrmvkc;Persist Security Info=True;' +
      'User ID=sa;Data Source=SYBASE'
    LoginPrompt = False
    Mode = cmReadWrite
    Left = 376
    Top = 24
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 376
    Top = 80
    object ADOQuery1CODORG: TIntegerField
      FieldName = 'CODORG'
    end
    object ADOQuery1NOMORG: TStringField
      FieldName = 'NOMORG'
      Size = 60
    end
    object ADOQuery1CDSTATUS_ORGANIZACAO: TStringField
      FieldName = 'CDSTATUS_ORGANIZACAO'
      Size = 11
    end
    object ADOQuery1LOGOTP: TBlobField
      FieldName = 'LOGOTP'
    end
    object ADOQuery1CDOPERADOR_INCLUSAO: TStringField
      FieldName = 'CDOPERADOR_INCLUSAO'
      Size = 15
    end
    object ADOQuery1DTINCLUSAO: TDateTimeField
      FieldName = 'DTINCLUSAO'
    end
    object ADOQuery1CDSITUACAO: TStringField
      FieldName = 'CDSITUACAO'
      Size = 11
    end
    object ADOQuery1CDOPERADOR_ALTERACAO: TStringField
      FieldName = 'CDOPERADOR_ALTERACAO'
      Size = 15
    end
    object ADOQuery1DTALTERACAO: TDateTimeField
      FieldName = 'DTALTERACAO'
    end
    object ADOQuery1SNGESTOR: TStringField
      FieldName = 'SNGESTOR'
      Size = 1
    end
    object ADOQuery1CDPESSOA: TIntegerField
      FieldName = 'CDPESSOA'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 384
    Top = 128
  end
end
