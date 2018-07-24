inherited frmCadastro_Horarios: TfrmCadastro_Horarios
  Caption = 'Cadastro de Hor'#225'rios'
  ClientWidth = 582
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 582
    ActivePage = tsDados
    inherited tsDados: TTabSheet
      inherited DBGrid1: TDBGrid
        Width = 574
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_HORARIO'
            Title.Caption = 'C'#243'digo'
            Width = 112
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Width = 322
            Visible = True
          end>
      end
    end
    inherited tsDetalhe: TTabSheet
      object Label1: TLabel
        Left = 75
        Top = 0
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 3
        Top = 0
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit2
      end
      object DBEdit1: TDBEdit
        Left = 75
        Top = 16
        Width = 318
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DESCRICAO'
        DataSource = dtsTabela
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 3
        Top = 16
        Width = 62
        Height = 21
        DataField = 'ID_HORARIO'
        DataSource = dtsTabela
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  inherited Bar: TToolBar
    Width = 582
  end
  inherited StatusBar1: TStatusBar
    Width = 582
  end
  inherited dtsTabela: TDataSource
    DataSet = cdsTabela
  end
  inherited ImageList1: TImageList
    Left = 372
    Top = 9
  end
  inherited cdsTabela: TEMSTable
    TableName = 'HORARIO'
    PrimaryKey = 'ID_HORARIO'
    Schema = 'PUBLIC'
    object cdsTabelaID_HORARIO: TIntegerField
      FieldName = 'ID_HORARIO'
    end
    object cdsTabelaCODIGO_EXTERNO: TAutoIncField
      FieldName = 'CODIGO_EXTERNO'
    end
    object cdsTabelaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsTabelaPOSSUI_ESCALA: TBooleanField
      FieldName = 'POSSUI_ESCALA'
    end
  end
  object dtsHorario_Detalhe: TDataSource
    Left = 276
    Top = 72
  end
  object EMSTable1: TEMSTable
    Aggregates = <>
    Params = <>
    Left = 244
    Top = 72
    object EMSTable1codigo: TIntegerField
      FieldName = 'codigo'
    end
  end
end
