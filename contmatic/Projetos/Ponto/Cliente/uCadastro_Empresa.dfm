inherited frmCadastro_Empresa: TfrmCadastro_Empresa
  Left = 403
  Top = 232
  Caption = 'Cadastro de Empresas'
  ClientWidth = 478
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 478
    inherited tsDados: TTabSheet
      inherited grid: TcxGrid
        Width = 470
        inherited tv1: TcxGridDBTableView
          object tv1CODIGO_EXTERNO: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'CODIGO_EXTERNO'
            HeaderAlignmentHorz = taCenter
            Width = 136
          end
          object tv1NOME_FANTASIA: TcxGridDBColumn
            Caption = 'Nome Fantasia'
            DataBinding.FieldName = 'NOME_FANTASIA'
            HeaderAlignmentHorz = taCenter
            Width = 344
          end
          object tv1CNPJ: TcxGridDBColumn
            DataBinding.FieldName = 'CNPJ'
            HeaderAlignmentHorz = taCenter
            Width = 172
          end
        end
      end
    end
    inherited tsDetalhe: TTabSheet
      inherited PageControle: TcxPageControl
        Width = 470
        ActivePage = tsConfiguracao
        Color = clBtnFace
        LookAndFeel.SkinName = ''
        ClientRectLeft = 79
        ClientRectRight = 470
        inherited tsPrincipal: TcxTabSheet
          TabVisible = True
          object Label1: TLabel
            Left = 3
            Top = 2
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
            Color = 16119285
            FocusControl = edtCodigo
            ParentColor = False
          end
          object Label4: TLabel
            Left = 3
            Top = 41
            Width = 60
            Height = 13
            Caption = 'Raz'#227'o Social'
            Color = 16119285
            FocusControl = edtRazaoSocial
            ParentColor = False
          end
          object Label7: TLabel
            Left = 311
            Top = 41
            Width = 77
            Height = 13
            Caption = 'Dia Fechamento'
            Color = 16119285
            FocusControl = edtFechamento
            ParentColor = False
          end
          object Label2: TLabel
            Left = 81
            Top = 2
            Width = 71
            Height = 13
            Caption = 'Nome Fantasia'
            Color = 16119285
            FocusControl = edtNome
            ParentColor = False
          end
          object gpxDocumentos: TGroupBox
            Left = 3
            Top = 84
            Width = 385
            Height = 58
            Caption = 'Documentos'
            Color = 16119285
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 4
            object Label3: TLabel
              Left = 5
              Top = 14
              Width = 25
              Height = 13
              Caption = 'CNPJ'
              Color = 16119285
              FocusControl = edtCNPJ
              ParentColor = False
            end
            object Label5: TLabel
              Left = 200
              Top = 14
              Width = 87
              Height = 13
              Caption = 'Inscri'#231#227'o Estadual'
              Color = 16119285
              FocusControl = edtInscricaoEstadual
              ParentColor = False
            end
            object edtCNPJ: TDBEdit
              Left = 5
              Top = 30
              Width = 186
              Height = 21
              DataField = 'CNPJ'
              DataSource = dtsTabela
              TabOrder = 0
            end
            object edtInscricaoEstadual: TDBEdit
              Left = 200
              Top = 30
              Width = 170
              Height = 21
              DataField = 'INSCRICAO_ESTADUAL'
              DataSource = dtsTabela
              TabOrder = 1
            end
          end
          object gpxEndereco: TGroupBox
            Left = 3
            Top = 145
            Width = 385
            Height = 144
            Caption = 'Endere'#231'o'
            Color = 16119285
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 5
            object Label8: TLabel
              Left = 5
              Top = 17
              Width = 55
              Height = 13
              Caption = 'Logradouro'
              Color = 16119285
              FocusControl = edtLogradouro
              ParentColor = False
            end
            object Label9: TLabel
              Left = 312
              Top = 17
              Width = 37
              Height = 13
              Caption = 'N'#250'mero'
              Color = 16119285
              FocusControl = edtNumero
              ParentColor = False
            end
            object Label10: TLabel
              Left = 5
              Top = 58
              Width = 65
              Height = 13
              Caption = 'Complemento'
              Color = 16119285
              FocusControl = edtComplemento
              ParentColor = False
            end
            object Label11: TLabel
              Left = 109
              Top = 58
              Width = 28
              Height = 13
              Caption = 'Bairro'
              Color = 16119285
              FocusControl = edtBairro
              ParentColor = False
            end
            object Label6: TLabel
              Left = 241
              Top = 58
              Width = 43
              Height = 13
              Caption = 'Munic'#237'pio'
              Color = 16119285
              ParentColor = False
            end
            object Label12: TLabel
              Left = 5
              Top = 98
              Width = 19
              Height = 13
              Caption = 'CEP'
              Color = 16119285
              FocusControl = edtCEP
              ParentColor = False
            end
            object edtLogradouro: TDBEdit
              Left = 5
              Top = 32
              Width = 300
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ENDERECO'
              DataSource = dtsTabela
              TabOrder = 0
            end
            object edtNumero: TDBEdit
              Left = 312
              Top = 32
              Width = 65
              Height = 21
              DataField = 'NUMERO'
              DataSource = dtsTabela
              TabOrder = 1
            end
            object edtComplemento: TDBEdit
              Left = 5
              Top = 74
              Width = 100
              Height = 21
              DataField = 'COMPLEMENTO'
              DataSource = dtsTabela
              TabOrder = 2
            end
            object edtBairro: TDBEdit
              Left = 109
              Top = 74
              Width = 127
              Height = 21
              CharCase = ecUpperCase
              DataField = 'BAIRRO'
              DataSource = dtsTabela
              TabOrder = 3
            end
            object DBSearchEdit1: TDBSearchEdit
              Left = 241
              Top = 74
              Width = 136
              Height = 21
              CaseSensitive = True
              LookUpAll = True
              TabOrder = 4
              SkipEdit = False
              DataField = 'CODIGO_MUNICIPIO'
              DataSource = dtsTabela
            end
            object edtCEP: TDBEdit
              Left = 5
              Top = 114
              Width = 100
              Height = 21
              DataField = 'CEP'
              DataSource = dtsTabela
              TabOrder = 5
            end
          end
          object gpxContato: TGroupBox
            Left = 3
            Top = 294
            Width = 385
            Height = 70
            Caption = 'Contato'
            Color = 16119285
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 6
            object Label13: TLabel
              Left = 4
              Top = 16
              Width = 42
              Height = 13
              Caption = 'Telefone'
              Color = 16119285
              FocusControl = edtTelefone
              ParentColor = False
            end
            object Label14: TLabel
              Left = 138
              Top = 16
              Width = 28
              Height = 13
              Caption = 'E-Mail'
              Color = 16119285
              FocusControl = edtEmail
              ParentColor = False
            end
            object edtTelefone: TDBEdit
              Left = 4
              Top = 32
              Width = 130
              Height = 21
              DataField = 'TELEFONE'
              DataSource = dtsTabela
              TabOrder = 0
            end
            object edtEmail: TDBEdit
              Left = 138
              Top = 32
              Width = 235
              Height = 21
              CharCase = ecLowerCase
              DataField = 'EMAIL'
              DataSource = dtsTabela
              TabOrder = 1
            end
          end
          object edtCodigo: TDBEdit
            Left = 3
            Top = 18
            Width = 70
            Height = 21
            DataField = 'CODIGO_EXTERNO'
            DataSource = dtsTabela
            TabOrder = 0
          end
          object edtNome: TDBEdit
            Left = 81
            Top = 18
            Width = 305
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NOME_FANTASIA'
            DataSource = dtsTabela
            TabOrder = 1
          end
          object edtRazaoSocial: TDBEdit
            Left = 3
            Top = 57
            Width = 300
            Height = 21
            CharCase = ecUpperCase
            DataField = 'RAZAO_SOCIAL'
            DataSource = dtsTabela
            TabOrder = 2
          end
          object edtFechamento: TDBEdit
            Left = 311
            Top = 57
            Width = 76
            Height = 21
            DataField = 'DIA_FECHAMENTO'
            DataSource = dtsTabela
            TabOrder = 3
          end
        end
        object tsConfiguracao: TcxTabSheet
          Caption = 'Configura'#231#227'o'
          Color = 16119285
          ImageIndex = 1
          ParentColor = False
          object Label15: TLabel
            Left = 5
            Top = 6
            Width = 46
            Height = 13
            Caption = 'PERIODO'
          end
          object Label16: TLabel
            Left = 136
            Top = 6
            Width = 41
            Height = 13
            Caption = 'TURNOS'
            FocusControl = DBEdit12
          end
          object Label17: TLabel
            Left = 24
            Top = 120
            Width = 131
            Height = 13
            Caption = 'TOLERANCIA_HORAEXTRA'
            FocusControl = DBEdit1
          end
          object Label18: TLabel
            Left = 32
            Top = 176
            Width = 111
            Height = 13
            Caption = 'TOLERANCIA_ATRASO'
            FocusControl = DBEdit2
          end
          object Label19: TLabel
            Left = 24
            Top = 224
            Width = 100
            Height = 13
            Caption = 'INICIO_EXPEDIENTE'
            FocusControl = DBEdit3
          end
          object Label20: TLabel
            Left = 192
            Top = 208
            Width = 112
            Height = 13
            Caption = 'HORAS_BONIFICACAO'
            FocusControl = DBEdit4
          end
          object cxDBDateEdit1: TcxDBDateEdit
            Left = 5
            Top = 22
            DataBinding.DataField = 'PERIODO'
            DataBinding.DataSource = dtsEmpresa_Parametros
            TabOrder = 0
            Width = 121
          end
          object DBEdit12: TDBEdit
            Left = 136
            Top = 22
            Width = 134
            Height = 21
            DataField = 'TURNOS'
            DataSource = dtsEmpresa_Parametros
            TabOrder = 1
          end
          object DBCheckBox1: TDBCheckBox
            Left = 8
            Top = 53
            Width = 265
            Height = 17
            Caption = 'PAGAMENTO_HE_ANTES_HORARIO'
            DataField = 'PAGAMENTO_HE_ANTES_HORARIO'
            DataSource = dtsEmpresa_Parametros
            TabOrder = 2
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox2: TDBCheckBox
            Left = 8
            Top = 72
            Width = 265
            Height = 17
            Caption = 'PAGAMENTO_HE_DEPOIS_HORARIO'
            DataField = 'PAGAMENTO_HE_DEPOIS_HORARIO'
            DataSource = dtsEmpresa_Parametros
            TabOrder = 3
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBEdit1: TDBEdit
            Left = 24
            Top = 136
            Width = 134
            Height = 21
            DataField = 'TOLERANCIA_HORAEXTRA'
            DataSource = dtsEmpresa_Parametros
            TabOrder = 4
          end
          object DBEdit2: TDBEdit
            Left = 32
            Top = 192
            Width = 134
            Height = 21
            DataField = 'TOLERANCIA_ATRASO'
            DataSource = dtsEmpresa_Parametros
            TabOrder = 5
          end
          object DBEdit3: TDBEdit
            Left = 24
            Top = 240
            Width = 134
            Height = 21
            DataField = 'INICIO_EXPEDIENTE'
            DataSource = dtsEmpresa_Parametros
            TabOrder = 6
          end
          object DBEdit4: TDBEdit
            Left = 192
            Top = 224
            Width = 134
            Height = 21
            DataField = 'HORAS_BONIFICACAO'
            DataSource = dtsEmpresa_Parametros
            TabOrder = 7
          end
        end
      end
    end
  end
  inherited Status: TStatusBar
    Width = 478
  end
  inherited pnlControles: TPanel
    Width = 478
    inherited Navigator: TcxDBNavigator
      Left = 221
    end
    inherited btnSair: TBitBtn
      Left = 409
    end
  end
  inherited dtsTabela: TDataSource
    Left = 360
    Top = 32
  end
  inherited cdsTabela: TClientDataSet
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    ProviderName = 'dsp_Empresa'
    RemoteServer = DM_Cadastro_Empresa.DCOMCon_Empresa
    AfterDelete = cdsTabelaAfterDelete
    Left = 296
    Top = 32
    object cdsTabelaID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
    end
    object cdsTabelaCODIGO_EXTERNO: TIntegerField
      FieldName = 'CODIGO_EXTERNO'
      DisplayFormat = '00000'
    end
    object cdsTabelaRAZAO_SOCIAL: TWideStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 50
    end
    object cdsTabelaNOME_FANTASIA: TWideStringField
      FieldName = 'NOME_FANTASIA'
      Size = 50
    end
    object cdsTabelaCNPJ: TWideStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object cdsTabelaINSCRICAO_ESTADUAL: TWideStringField
      FieldName = 'INSCRICAO_ESTADUAL'
    end
    object cdsTabelaCODIGO_MUNICIPIO: TIntegerField
      FieldName = 'CODIGO_MUNICIPIO'
    end
    object cdsTabelaENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object cdsTabelaNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object cdsTabelaCOMPLEMENTO: TWideStringField
      FieldName = 'COMPLEMENTO'
      Size = 30
    end
    object cdsTabelaBAIRRO: TWideStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object cdsTabelaCEP: TWideStringField
      FieldName = 'CEP'
      Size = 10
    end
    object cdsTabelaTELEFONE: TWideStringField
      FieldName = 'TELEFONE'
    end
    object cdsTabelaEMAIL: TWideStringField
      FieldName = 'EMAIL'
      Size = 30
    end
    object cdsTabelaDIA_FECHAMENTO: TIntegerField
      FieldName = 'DIA_FECHAMENTO'
    end
  end
  inherited Parametros: TEMSParameters
    ListFieldsPesquisa.Strings = (
      'C'#243'digo;CODIGO_EXTERNO;40;Retorno;integer;'
      'Nome da Empresa;NOME_FANTASIA;200;;string;'
      'CNPJ;CNPJ;100;;string;')
    FieldCampoCodigo = 'CODIGO_EXTERNO'
    CampoCodigo = edtCodigo
    Left = 360
    Top = 64
  end
  inherited cxStyleRepository1: TcxStyleRepository
    Left = 328
    Top = 32
  end
  object cdsEmpresa_Parametros: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'EMPRESA_ID'
    MasterFields = 'ID_EMPRESA'
    MasterSource = dtsTabela
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_EMPRESA'
        ParamType = ptInput
      end>
    ProviderName = 'dspEmpresa_Parametros'
    RemoteServer = DM_Cadastro_Empresa.DCOMCon_Empresa
    Left = 296
    Top = 64
    object cdsEmpresa_ParametrosID_PARAMETROS_EMPRESA: TIntegerField
      FieldName = 'ID_PARAMETROS_EMPRESA'
      Origin = '"ID_PARAMETROS_EMPRESA"'
    end
    object cdsEmpresa_ParametrosEMPRESA_ID: TIntegerField
      FieldName = 'EMPRESA_ID'
      Origin = '"EMPRESA_ID"'
    end
    object cdsEmpresa_ParametrosPERIODO: TSQLTimeStampField
      FieldName = 'PERIODO'
      Origin = '"PERIODO"'
    end
    object cdsEmpresa_ParametrosTURNOS: TIntegerField
      FieldName = 'TURNOS'
      Origin = '"TURNOS"'
    end
    object cdsEmpresa_ParametrosPAGAMENTO_HE_ANTES_HORARIO: TBooleanField
      FieldName = 'PAGAMENTO_HE_ANTES_HORARIO'
      Origin = '"PAGAMENTO_HE_ANTES_HORARIO"'
    end
    object cdsEmpresa_ParametrosPAGAMENTO_HE_DEPOIS_HORARIO: TBooleanField
      FieldName = 'PAGAMENTO_HE_DEPOIS_HORARIO'
      Origin = '"PAGAMENTO_HE_DEPOIS_HORARIO"'
    end
    object cdsEmpresa_ParametrosTOLERANCIA_HORAEXTRA: TIntegerField
      FieldName = 'TOLERANCIA_HORAEXTRA'
      Origin = '"TOLERANCIA_HORAEXTRA"'
    end
    object cdsEmpresa_ParametrosTOLERANCIA_ATRASO: TIntegerField
      FieldName = 'TOLERANCIA_ATRASO'
      Origin = '"TOLERANCIA_ATRASO"'
    end
    object cdsEmpresa_ParametrosINICIO_EXPEDIENTE: TTimeField
      FieldName = 'INICIO_EXPEDIENTE'
      Origin = '"INICIO_EXPEDIENTE"'
    end
    object cdsEmpresa_ParametrosHORAS_BONIFICACAO: TTimeField
      FieldName = 'HORAS_BONIFICACAO'
      Origin = '"HORAS_BONIFICACAO"'
    end
    object cdsEmpresa_ParametrosPORC_HORAS_BONIFICACAO: TIntegerField
      FieldName = 'PORC_HORAS_BONIFICACAO'
      Origin = '"PORC_HORAS_BONIFICACAO"'
    end
    object cdsEmpresa_ParametrosPORC_BONIFICACAO_FERIADO_FOLGA: TIntegerField
      FieldName = 'PORC_BONIFICACAO_FERIADO_FOLGA'
      Origin = '"PORC_BONIFICACAO_FERIADO_FOLGA"'
    end
    object cdsEmpresa_ParametrosPORC_BONIFICACAO_DEMAIS_HORAS: TIntegerField
      FieldName = 'PORC_BONIFICACAO_DEMAIS_HORAS'
      Origin = '"PORC_BONIFICACAO_DEMAIS_HORAS"'
    end
    object cdsEmpresa_ParametrosHORA_INICIO_ADICIONALNOTURNO: TIntegerField
      FieldName = 'HORA_INICIO_ADICIONALNOTURNO'
      Origin = '"HORA_INICIO_ADICIONALNOTURNO"'
    end
    object cdsEmpresa_ParametrosHORA_FIM_ADICIONALNOTURNO: TIntegerField
      FieldName = 'HORA_FIM_ADICIONALNOTURNO'
      Origin = '"HORA_FIM_ADICIONALNOTURNO"'
    end
    object cdsEmpresa_ParametrosDESCONTO_INTERVALO_NOTURNO: TBooleanField
      FieldName = 'DESCONTO_INTERVALO_NOTURNO'
      Origin = '"DESCONTO_INTERVALO_NOTURNO"'
    end
    object cdsEmpresa_ParametrosTRABALHA_BANCOHORAS: TBooleanField
      FieldName = 'TRABALHA_BANCOHORAS'
      Origin = '"TRABALHA_BANCOHORAS"'
    end
    object cdsEmpresa_ParametrosALMOCO_FLEXIVEL: TBooleanField
      FieldName = 'ALMOCO_FLEXIVEL'
      Origin = '"ALMOCO_FLEXIVEL"'
    end
    object cdsEmpresa_ParametrosENTRADA_SAIDA_FLEXIVEL: TBooleanField
      FieldName = 'ENTRADA_SAIDA_FLEXIVEL'
      Origin = '"ENTRADA_SAIDA_FLEXIVEL"'
    end
  end
  object dtsEmpresa_Parametros: TDataSource
    DataSet = cdsEmpresa_Parametros
    Left = 328
    Top = 64
  end
end
