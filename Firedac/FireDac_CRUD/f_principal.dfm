object frm_principal: Tfrm_principal
  Left = 0
  Top = 0
  Caption = 'CRUD'
  ClientHeight = 482
  ClientWidth = 693
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_descricao: TLabel
    Left = 8
    Top = 66
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object dbg_mestre: TDBGrid
    Left = 0
    Top = 128
    Width = 693
    Height = 354
    Align = alBottom
    DataSource = dts_mestre
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'id'
        Title.Alignment = taCenter
        Title.Caption = 'Id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 299
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ativo'
        Title.Alignment = taCenter
        Title.Caption = 'Ativo'
        Width = 40
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'data_alteracao'
        Title.Alignment = taCenter
        Title.Caption = 'Data Altera'#231#227'o'
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'data_criacao'
        Title.Alignment = taCenter
        Title.Caption = 'Data Cria'#231#227'o'
        Width = 120
        Visible = True
      end>
  end
  object btn_open: TBitBtn
    Left = 6
    Top = 8
    Width = 103
    Height = 35
    Caption = 'Open'
    TabOrder = 0
    OnClick = btn_openClick
  end
  object btn_incluir: TBitBtn
    Left = 115
    Top = 8
    Width = 103
    Height = 35
    Caption = 'Incluir'
    TabOrder = 1
    OnClick = btn_incluirClick
  end
  object btn_salvar: TBitBtn
    Left = 329
    Top = 8
    Width = 103
    Height = 35
    Caption = 'Salvar'
    TabOrder = 3
    OnClick = btn_salvarClick
  end
  object btn_cancelar: TBitBtn
    Left = 436
    Top = 8
    Width = 103
    Height = 35
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = btn_cancelarClick
  end
  object btn_excluir: TBitBtn
    Left = 543
    Top = 8
    Width = 103
    Height = 35
    Caption = 'Excluir'
    TabOrder = 5
    OnClick = btn_excluirClick
  end
  object edt_descricao: TDBEdit
    Left = 8
    Top = 80
    Width = 482
    Height = 21
    DataField = 'descricao'
    DataSource = dts_mestre
    TabOrder = 6
  end
  object ckb_ativo: TDBCheckBox
    Left = 496
    Top = 82
    Width = 97
    Height = 17
    Caption = 'Ativo'
    DataField = 'ativo'
    DataSource = dts_mestre
    TabOrder = 7
  end
  object btn_editar: TBitBtn
    Left = 222
    Top = 8
    Width = 103
    Height = 35
    Caption = 'Alterar'
    TabOrder = 2
    OnClick = btn_editarClick
  end
  object fdcon_principal: TFDConnection
    Params.Strings = (
      'Database=teste'
      'User_Name=root'
      'DriverID=MySQL')
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmTotal
    Connected = True
    LoginPrompt = False
    Left = 600
    Top = 200
  end
  object fdgxwtcrsr_principal: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 600
    Top = 264
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'D:\sistemas\Aulas\FireDac\CRUD\libmysql.dll'
    Left = 600
    Top = 336
  end
  object fdq_mestre: TFDQuery
    Connection = fdcon_principal
    SQL.Strings = (
      'SELECT * FROM tabela_mestre')
    Left = 72
    Top = 208
  end
  object dts_mestre: TDataSource
    DataSet = fdq_mestre
    Left = 72
    Top = 272
  end
end
