inherited frmCadastro_Municipio: TfrmCadastro_Municipio
  Left = 289
  Top = 217
  Caption = 'Cadastro de Munic'#237'pio'
  ClientHeight = 436
  ClientWidth = 594
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 594
    Height = 389
    ActivePage = tsDetalhe
    inherited tsDados: TTabSheet
      inherited grid: TcxGrid
        Width = 586
        Height = 361
        inherited tv1: TcxGridDBTableView
          object tv1COD_MUNICIPIO: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'COD_MUNICIPIO'
            HeaderAlignmentHorz = taCenter
            Width = 108
          end
          object tv1UF: TcxGridDBColumn
            DataBinding.FieldName = 'UF'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Items = <
              item
                Description = 'Acre'
                ImageIndex = 0
                Value = 'AC'
              end
              item
                Description = 'Alagoas'
                Value = 'AL'
              end
              item
                Description = 'Amap'#225
                Value = 'AP'
              end
              item
                Description = 'Amazonas'
                Value = 'AM'
              end
              item
                Description = 'Bahia'
                Value = 'BA'
              end
              item
                Description = 'Cear'#225
                Value = 'CE'
              end
              item
                Description = 'Distrito Federal'
                Value = 'DF'
              end
              item
                Description = 'Esp'#237'rito Santo'
                Value = 'ES'
              end
              item
                Description = 'Goi'#225's'
                Value = 'GO'
              end
              item
                Description = 'Maranh'#227'o'
                Value = 'MA'
              end
              item
                Description = 'Mato Grosso'
                Value = 'MT'
              end
              item
                Description = 'Mato Grosso do Sul'
                Value = 'MS'
              end
              item
                Description = 'Minas Gerais'
                Value = 'MG'
              end
              item
                Description = 'Par'#225
                Value = 'PA'
              end
              item
                Description = 'Para'#237'ba'
                Value = 'PB'
              end
              item
                Description = 'Paran'#225
                Value = 'PR'
              end
              item
                Description = 'Pernambuco'
                Value = 'PE'
              end
              item
                Description = 'Piau'#237
                Value = 'PI'
              end
              item
                Description = 'Rio de Janeiro'
                Value = 'RJ'
              end
              item
                Description = 'Rio Grande do Norte'
                Value = 'RN'
              end
              item
                Description = 'Rio Grande do Sul'
                Value = 'RS'
              end
              item
                Description = 'Rond'#244'nia'
                Value = 'RO'
              end
              item
                Description = 'Roraima'
                Value = 'RR'
              end
              item
                Description = 'Santa Catarina'
                Value = 'SC'
              end
              item
                Description = 'S'#227'o Paulo'
                Value = 'SP'
              end
              item
                Description = 'Sergipe'
                Value = 'SE'
              end
              item
                Description = 'Tocantins'
                Value = 'TO'
              end>
            Visible = False
            GroupIndex = 0
            HeaderAlignmentHorz = taCenter
            Width = 173
          end
          object tv1NOME: TcxGridDBColumn
            Caption = 'Munic'#237'pio'
            DataBinding.FieldName = 'NOME'
            HeaderAlignmentHorz = taCenter
            Width = 315
          end
        end
      end
    end
    inherited tsDetalhe: TTabSheet
      inherited PageControle: TcxPageControl
        Width = 586
        Height = 361
        LookAndFeel.SkinName = ''
        ClientRectBottom = 360
        ClientRectRight = 585
        inherited tsPrincipal: TcxTabSheet
          object Label1: TLabel
            Left = 7
            Top = 5
            Width = 94
            Height = 13
            Caption = 'C'#243'digo do Munic'#237'pio'
            FocusControl = edtCodigo
          end
          object Label2: TLabel
            Left = 107
            Top = 5
            Width = 13
            Height = 13
            Caption = 'UF'
          end
          object Label3: TLabel
            Left = 231
            Top = 5
            Width = 43
            Height = 13
            Caption = 'Munic'#237'pio'
            FocusControl = edtNome
          end
          object edtCodigo: TDBEdit
            Left = 7
            Top = 21
            Width = 98
            Height = 21
            DataField = 'COD_MUNICIPIO'
            DataSource = dtsTabela
            MaxLength = 12
            TabOrder = 0
          end
          object edtNome: TDBEdit
            Left = 231
            Top = 21
            Width = 346
            Height = 21
            DataField = 'NOME'
            DataSource = dtsTabela
            TabOrder = 1
          end
          object cboUF: TcxDBImageComboBox
            Left = 107
            Top = 21
            DataBinding.DataField = 'UF'
            DataBinding.DataSource = dtsTabela
            Properties.Items = <
              item
                Description = 'Acre'
                ImageIndex = 0
                Value = 'AC'
              end
              item
                Description = 'Alagoas'
                Value = 'AL'
              end
              item
                Description = 'Amap'#225
                Value = 'AP'
              end
              item
                Description = 'Amazonas'
                Value = 'AM'
              end
              item
                Description = 'Bahia'
                Value = 'BA'
              end
              item
                Description = 'Cear'#225
                Value = 'CE'
              end
              item
                Description = 'Distrito Federal'
                Value = 'DF'
              end
              item
                Description = 'Esp'#237'rito Santo'
                Value = 'ES'
              end
              item
                Description = 'Goi'#225's'
                Value = 'GO'
              end
              item
                Description = 'Maranh'#227'o'
                Value = 'MA'
              end
              item
                Description = 'Mato Grosso'
                Value = 'MT'
              end
              item
                Description = 'Mato Grosso do Sul'
                Value = 'MS'
              end
              item
                Description = 'Minas Gerais'
                Value = 'MG'
              end
              item
                Description = 'Par'#225
                Value = 'PA'
              end
              item
                Description = 'Para'#237'ba'
                Value = 'PB'
              end
              item
                Description = 'Paran'#225
                Value = 'PR'
              end
              item
                Description = 'Pernambuco'
                Value = 'PE'
              end
              item
                Description = 'Piau'#237
                Value = 'PI'
              end
              item
                Description = 'Rio de Janeiro'
                Value = 'RJ'
              end
              item
                Description = 'Rio Grande do Norte'
                Value = 'RN'
              end
              item
                Description = 'Rio Grande do Sul'
                Value = 'RS'
              end
              item
                Description = 'Rond'#244'nia'
                Value = 'RO'
              end
              item
                Description = 'Roraima'
                Value = 'RR'
              end
              item
                Description = 'Santa Catarina'
                Value = 'SC'
              end
              item
                Description = 'S'#227'o Paulo'
                Value = 'SP'
              end
              item
                Description = 'Sergipe'
                Value = 'SE'
              end
              item
                Description = 'Tocantins'
                Value = 'TO'
              end>
            TabOrder = 2
            Width = 121
          end
        end
      end
    end
  end
  inherited Status: TStatusBar
    Top = 417
    Width = 594
  end
  inherited pnlControles: TPanel
    Width = 594
  end
  inherited cdsTabela: TClientDataSet
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_COD_MUNICIPIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UF'
        ParamType = ptInput
      end>
    ProviderName = 'dspMunicipio'
    RemoteServer = DM_Cadastro_Municipio.DCOMCon_Municipio
    object cdsTabelaID_COD_MUNICIPIO: TIntegerField
      FieldName = 'ID_COD_MUNICIPIO'
    end
    object cdsTabelaCOD_MUNICIPIO: TFloatField
      FieldName = 'COD_MUNICIPIO'
    end
    object cdsTabelaUF: TWideStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsTabelaNOME: TWideStringField
      FieldName = 'NOME'
      Size = 255
    end
    object cdsTabelaNOME_SEM_ACENTO: TWideStringField
      FieldName = 'NOME_SEM_ACENTO'
      Size = 255
    end
  end
  inherited Parametros: TEMSParameters
    ListFieldsPesquisa.Strings = (
      'C'#243'digo do Munic'#237'pio;COD_MUNICIPIO;80;Retorno;integer;'
      'Munic'#237'pio;NOME;200;;string;')
    ListDataSet.Strings = (
      'cdsTabela')
    TableName = 'CODIGO_MUNICIPIO'
    FieldCampoCodigo = 'COD_MUNICIPIO'
    FieldCampoID = 'ID_COD_MUNICIPIO'
    CampoCodigo = edtCodigo
  end
end
