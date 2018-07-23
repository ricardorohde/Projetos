inherited frmCadastro_Feriado: TfrmCadastro_Feriado
  Caption = 'Cadastro de Feriado'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    inherited tsDados: TTabSheet
      inherited grid: TcxGrid
        inherited tv1: TcxGridDBTableView
          object tv1ABRANGENCIA: TcxGridDBColumn
            Caption = 'Abrang'#234'ncia'
            DataBinding.FieldName = 'ABRANGENCIA'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Items = <
              item
                Description = 'Nacional'
                ImageIndex = 0
                Value = 0
              end
              item
                Description = 'Estadual'
                Value = 1
              end
              item
                Description = 'Municipal'
                Value = 2
              end>
            GroupIndex = 0
            HeaderAlignmentHorz = taCenter
            Width = 97
          end
          object tv1CODIGO_EXTERNO: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'CODIGO_EXTERNO'
            HeaderAlignmentHorz = taCenter
            Width = 84
          end
          object tv1DATA_FERIADO: TcxGridDBColumn
            Caption = 'Data do Feriado'
            DataBinding.FieldName = 'DATA_FERIADO'
            HeaderAlignmentHorz = taCenter
            Width = 120
          end
          object tv1DESCRICAO: TcxGridDBColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'DESCRICAO'
            HeaderAlignmentHorz = taCenter
            Width = 200
          end
        end
      end
    end
    inherited tsDetalhe: TTabSheet
      inherited PageControle: TcxPageControl
        LookAndFeel.SkinName = ''
        inherited tsPrincipal: TcxTabSheet
          object Label1: TLabel
            Left = 8
            Top = 8
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
            FocusControl = edtCodigo
          end
          object Label2: TLabel
            Left = 336
            Top = 8
            Width = 77
            Height = 13
            Caption = 'Data do Feriado'
          end
          object Label3: TLabel
            Left = 96
            Top = 8
            Width = 46
            Height = 13
            Caption = 'Descri'#231#227'o'
            FocusControl = edtDescricao
          end
          object edtCodigo: TDBEdit
            Left = 8
            Top = 24
            Width = 81
            Height = 21
            DataField = 'CODIGO_EXTERNO'
            DataSource = dtsTabela
            TabOrder = 0
          end
          object edtDescricao: TDBEdit
            Left = 96
            Top = 24
            Width = 233
            Height = 21
            CharCase = ecUpperCase
            DataField = 'DESCRICAO'
            DataSource = dtsTabela
            TabOrder = 1
          end
          object edtDataFeriado: TcxDBDateEdit
            Left = 336
            Top = 24
            DataBinding.DataField = 'DATA_FERIADO'
            DataBinding.DataSource = dtsTabela
            TabOrder = 2
            Width = 121
          end
          object rgbAbrangencia: TDBRadioGroup
            Left = 8
            Top = 53
            Width = 257
            Height = 105
            Caption = 'Abrang'#234'ncia'
            DataField = 'ABRANGENCIA'
            DataSource = dtsTabela
            Items.Strings = (
              'Nacional'
              'Estadual'
              'Municipal')
            TabOrder = 3
            Values.Strings = (
              '0'
              '1'
              '2')
            OnClick = rgbAbrangenciaClick
          end
          object edtMunicipio: TDBSearchEdit
            Left = 103
            Top = 130
            Width = 148
            Height = 21
            CaseSensitive = True
            LookUpAll = True
            TabOrder = 4
            Visible = False
            SkipEdit = False
            DataField = 'CODIGO_MUNICIPIO'
            DataSource = dtsTabela
          end
        end
      end
    end
  end
  inherited dtsTabela: TDataSource
    Left = 27
    Top = 248
  end
  inherited cdsTabela: TClientDataSet
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_FERIADO'
        ParamType = ptInput
      end>
    ProviderName = 'dspFERIADO'
    RemoteServer = DM_Cadastro_Feriado.DCOMCon_Feriado
    Left = 96
    Top = 248
    object cdsTabelaID_FERIADO: TIntegerField
      FieldName = 'ID_FERIADO'
    end
    object cdsTabelaCODIGO_EXTERNO: TIntegerField
      FieldName = 'CODIGO_EXTERNO'
    end
    object cdsTabelaDATA_FERIADO: TSQLTimeStampField
      FieldName = 'DATA_FERIADO'
    end
    object cdsTabelaDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsTabelaABRANGENCIA: TIntegerField
      FieldName = 'ABRANGENCIA'
    end
    object cdsTabelaCODIGO_MUNICIPIO: TIntegerField
      FieldName = 'CODIGO_MUNICIPIO'
    end
  end
  inherited Parametros: TEMSParameters
    ListFieldsPesquisa.Strings = (
      'C'#243'digo;CODIGO_EXTERNO;40;Retorno;integer;'
      'Nome da Empresa;NOME_FANTASIA;200;;string;'
      'Data;DATA_FERIADO;120;;string;')
    ListDataSet.Strings = (
      'cdsTabela')
    TableName = 'FERIADO'
    FieldCampoCodigo = 'CODIGO_EXTERNO'
    FieldCampoID = 'ID_FERIADO'
    CampoCodigo = edtCodigo
    Left = 60
    Top = 248
  end
  inherited cxStyleRepository1: TcxStyleRepository
    Left = 129
    Top = 249
  end
end
