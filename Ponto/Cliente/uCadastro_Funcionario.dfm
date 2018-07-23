inherited frmCadastro_Funcionario: TfrmCadastro_Funcionario
  Left = 326
  Top = 110
  Caption = 'Cadastro de Funcion'#225'rio'
  ClientHeight = 549
  ClientWidth = 462
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 462
    Height = 460
    ActivePage = tsDetalhe
    inherited tsDados: TTabSheet
      inherited grid: TcxGrid
        Width = 454
        Height = 432
        inherited tv1: TcxGridDBTableView
          object tv1CODIGO_EXTERNO: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'CODIGO_EXTERNO'
            HeaderAlignmentHorz = taCenter
          end
          object tv1NOME: TcxGridDBColumn
            Caption = 'Nome'
            DataBinding.FieldName = 'NOME'
            HeaderAlignmentHorz = taCenter
          end
          object tv1DATA_NASCIMENTO: TcxGridDBColumn
            Caption = 'Data Nascimento'
            DataBinding.FieldName = 'DATA_NASCIMENTO'
            HeaderAlignmentHorz = taCenter
          end
          object tv1PIS: TcxGridDBColumn
            Caption = 'N'#250'mero do PIS'
            DataBinding.FieldName = 'PIS'
            HeaderAlignmentHorz = taCenter
            Width = 145
          end
          object tv1RG: TcxGridDBColumn
            DataBinding.FieldName = 'RG'
            HeaderAlignmentHorz = taCenter
            Width = 132
          end
          object tv1CPF: TcxGridDBColumn
            DataBinding.FieldName = 'CPF'
            HeaderAlignmentHorz = taCenter
            Width = 141
          end
          object tv1DATA_ADMISSAO: TcxGridDBColumn
            Caption = 'Adimiss'#227'o'
            DataBinding.FieldName = 'DATA_ADMISSAO'
            HeaderAlignmentHorz = taCenter
            Width = 120
          end
          object tv1DATA_DEMISSAO: TcxGridDBColumn
            Caption = 'Demiss'#227'o'
            DataBinding.FieldName = 'DATA_DEMISSAO'
            HeaderAlignmentHorz = taCenter
            Width = 120
          end
        end
      end
    end
    inherited tsDetalhe: TTabSheet
      object Label2: TLabel [0]
        Left = 0
        Top = 0
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label3: TLabel [1]
        Left = 0
        Top = 40
        Width = 29
        Height = 13
        Caption = 'NOME'
      end
      object Label4: TLabel [2]
        Left = 0
        Top = 80
        Width = 99
        Height = 13
        Caption = 'DATA_NASCIMENTO'
      end
      object Label5: TLabel [3]
        Left = 0
        Top = 120
        Width = 44
        Height = 13
        Caption = 'SALARIO'
      end
      inherited PageControle: TcxPageControl
        Width = 454
        Height = 432
        LookAndFeel.SkinName = ''
        Options = [pcoAlwaysShowGoDialogButton, pcoFixedTabWidthWhenRotated, pcoGradient, pcoGradientClientArea, pcoRedrawOnResize]
        ParentFont = False
        Style = 8
        ClientRectBottom = 431
        ClientRectRight = 453
        inherited tsPrincipal: TcxTabSheet
          object Label6: TLabel
            Left = 6
            Top = 4
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
            FocusControl = edtCodigo
          end
          object Label7: TLabel
            Left = 103
            Top = 4
            Width = 29
            Height = 13
            Caption = 'NOME'
            FocusControl = edtNome
          end
          object Label8: TLabel
            Left = 6
            Top = 46
            Width = 96
            Height = 13
            Caption = 'Data de Nascimento'
          end
          object Label9: TLabel
            Left = 135
            Top = 46
            Width = 71
            Height = 13
            Caption = 'Data Admiss'#227'o'
          end
          object Label10: TLabel
            Left = 264
            Top = 46
            Width = 71
            Height = 13
            Caption = 'Data Demiss'#227'o'
          end
          object edtCodigo: TDBEdit
            Left = 6
            Top = 20
            Width = 91
            Height = 21
            DataField = 'CODIGO_EXTERNO'
            DataSource = dtsTabela
            TabOrder = 0
          end
          object edtNome: TDBEdit
            Left = 103
            Top = 20
            Width = 300
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NOME'
            DataSource = dtsTabela
            TabOrder = 1
          end
          object edtDataNascimento: TcxDBDateEdit
            Left = 6
            Top = 60
            DataBinding.DataField = 'DATA_NASCIMENTO'
            DataBinding.DataSource = dtsTabela
            TabOrder = 2
            Width = 121
          end
          object edtDataAdmissao: TcxDBDateEdit
            Left = 135
            Top = 60
            DataBinding.DataField = 'DATA_ADMISSAO'
            DataBinding.DataSource = dtsTabela
            TabOrder = 3
            Width = 121
          end
          object edtDataDemissao: TcxDBDateEdit
            Left = 264
            Top = 60
            DataBinding.DataField = 'DATA_DEMISSAO'
            DataBinding.DataSource = dtsTabela
            TabOrder = 4
            Width = 121
          end
          object gpxDocumentos: TGroupBox
            Left = 6
            Top = 88
            Width = 395
            Height = 106
            Caption = 'Documentos '
            TabOrder = 5
            object Label11: TLabel
              Left = 5
              Top = 18
              Width = 16
              Height = 13
              Caption = 'PIS'
              FocusControl = edtPis
            end
            object Label12: TLabel
              Left = 132
              Top = 18
              Width = 14
              Height = 13
              Caption = 'RG'
              FocusControl = edtRG
            end
            object Label13: TLabel
              Left = 5
              Top = 58
              Width = 25
              Height = 13
              Caption = 'CTPS'
              FocusControl = edtCTPS
            end
            object Label14: TLabel
              Left = 259
              Top = 18
              Width = 19
              Height = 13
              Caption = 'CPF'
              FocusControl = edtCPF
            end
            object edtPis: TDBEdit
              Left = 5
              Top = 34
              Width = 120
              Height = 21
              DataField = 'PIS'
              DataSource = dtsTabela
              TabOrder = 0
            end
            object edtRG: TDBEdit
              Left = 132
              Top = 34
              Width = 120
              Height = 21
              DataField = 'RG'
              DataSource = dtsTabela
              TabOrder = 1
            end
            object edtCTPS: TDBEdit
              Left = 5
              Top = 74
              Width = 200
              Height = 21
              DataField = 'CTPS'
              DataSource = dtsTabela
              TabOrder = 2
            end
            object edtCPF: TDBEdit
              Left = 259
              Top = 34
              Width = 120
              Height = 21
              DataField = 'CPF'
              DataSource = dtsTabela
              TabOrder = 3
            end
          end
          object chkConfiguracaoIndividual: TDBCheckBox
            Left = 7
            Top = 204
            Width = 185
            Height = 17
            Caption = 'Possui Configura'#231#227'o Individual'
            DataField = 'CONFIGURACAO_INDIVIDUAL'
            DataSource = dtsTabela
            TabOrder = 6
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object cxPageControl1: TcxPageControl
            Left = 3
            Top = 227
            Width = 400
            Height = 198
            ActivePage = cxTabSheet1
            Style = 8
            TabOrder = 7
            ClientRectBottom = 198
            ClientRectRight = 400
            ClientRectTop = 24
            object cxTabSheet1: TcxTabSheet
              Caption = 'Dados Pessoais'
              ImageIndex = 0
              object Label15: TLabel
                Left = 1
                Top = 5
                Width = 45
                Height = 13
                Caption = 'Endere'#231'o'
                FocusControl = edtEndereco
              end
              object Label16: TLabel
                Left = 255
                Top = 5
                Width = 37
                Height = 13
                Caption = 'N'#250'mero'
                FocusControl = edtNumero
              end
              object Label17: TLabel
                Left = 1
                Top = 44
                Width = 65
                Height = 13
                Caption = 'Complemento'
                FocusControl = edtComplemento
              end
              object Label18: TLabel
                Left = 189
                Top = 44
                Width = 28
                Height = 13
                Caption = 'Bairro'
                FocusControl = edtBairro
              end
              object Label19: TLabel
                Left = 1
                Top = 83
                Width = 43
                Height = 13
                Caption = 'Munic'#237'pio'
                FocusControl = edtMunicipio
              end
              object Label20: TLabel
                Left = 189
                Top = 83
                Width = 19
                Height = 13
                Caption = 'CEP'
                FocusControl = edtCEP
              end
              object Label21: TLabel
                Left = 1
                Top = 122
                Width = 42
                Height = 13
                Caption = 'Telefone'
              end
              object Label22: TLabel
                Left = 189
                Top = 122
                Width = 33
                Height = 13
                Caption = 'Celular'
                FocusControl = edtCelular
              end
              object edtEndereco: TDBEdit
                Left = 1
                Top = 21
                Width = 250
                Height = 21
                DataField = 'ENDERECO'
                DataSource = dtsFuncionario_Dados_Pessoais
                TabOrder = 0
              end
              object edtNumero: TDBEdit
                Left = 255
                Top = 21
                Width = 134
                Height = 21
                DataField = 'NUMERO'
                DataSource = dtsFuncionario_Dados_Pessoais
                TabOrder = 1
              end
              object edtComplemento: TDBEdit
                Left = 1
                Top = 60
                Width = 180
                Height = 21
                DataField = 'COMPLEMENTO'
                DataSource = dtsFuncionario_Dados_Pessoais
                TabOrder = 2
              end
              object edtBairro: TDBEdit
                Left = 189
                Top = 60
                Width = 200
                Height = 21
                DataField = 'BAIRRO'
                DataSource = dtsFuncionario_Dados_Pessoais
                TabOrder = 3
              end
              object edtMunicipio: TDBEdit
                Left = 1
                Top = 99
                Width = 180
                Height = 21
                DataField = 'CODIGO_MUNICIPIO'
                DataSource = dtsFuncionario_Dados_Pessoais
                TabOrder = 4
              end
              object edtCEP: TDBEdit
                Left = 189
                Top = 99
                Width = 134
                Height = 21
                DataField = 'CEP'
                DataSource = dtsFuncionario_Dados_Pessoais
                TabOrder = 5
              end
              object edtCelular: TDBEdit
                Left = 189
                Top = 138
                Width = 150
                Height = 21
                DataField = 'CELULAR'
                DataSource = dtsFuncionario_Dados_Pessoais
                TabOrder = 6
              end
              object edtTelefone: TcxDBMaskEdit
                Left = 1
                Top = 138
                DataBinding.DataField = 'TELEFONE'
                DataBinding.DataSource = dtsFuncionario_Dados_Pessoais
                Properties.EditMask = '!\(99\)0000-0000;1; '
                Properties.MaxLength = 0
                TabOrder = 7
                Width = 121
              end
            end
          end
        end
      end
    end
  end
  inherited Status: TStatusBar
    Top = 530
    Width = 462
  end
  inherited pnlControles: TPanel
    Width = 462
  end
  inherited Panel1: TPanel
    Width = 462
    inherited Label1: TLabel
      Width = 41
      Caption = 'Empresa'
    end
    inherited edtCodigoMaster: TDBEditBtn
      ListFields.Strings = (
        'C'#243'digo;CODIGO_EXTERNO;40;Retorno;integer;'
        'Nome da Empresa;NOME_FANTASIA;200;;string;'
        'CNPJ;CNPJ;100;;string;')
      ListSource = dtsEmpresa
    end
  end
  inherited dtsTabela: TDataSource
    Left = 312
    Top = 248
  end
  inherited cdsTabela: TClientDataSet
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_FUNCIONARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_EMPRESA'
        ParamType = ptInput
      end>
    ProviderName = 'dspFuncionario'
    RemoteServer = DM_Cadastro_Funcionario.DCOMCon_Funcionario
    Left = 248
    Top = 248
    object cdsTabelaID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
    end
    object cdsTabelaCODIGO_EXTERNO: TIntegerField
      FieldName = 'CODIGO_EXTERNO'
      DisplayFormat = '00000'
    end
    object cdsTabelaNOME: TWideStringField
      FieldName = 'NOME'
      Size = 50
    end
    object cdsTabelaDATA_NASCIMENTO: TSQLTimeStampField
      FieldName = 'DATA_NASCIMENTO'
    end
    object cdsTabelaSALARIO: TFloatField
      FieldName = 'SALARIO'
    end
    object cdsTabelaID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
    end
    object cdsTabelaPIS: TWideStringField
      FieldName = 'PIS'
    end
    object cdsTabelaRG: TWideStringField
      FieldName = 'RG'
      Size = 10
    end
    object cdsTabelaCTPS: TWideStringField
      FieldName = 'CTPS'
      Size = 30
    end
    object cdsTabelaDATA_ADMISSAO: TSQLTimeStampField
      FieldName = 'DATA_ADMISSAO'
    end
    object cdsTabelaDATA_DEMISSAO: TSQLTimeStampField
      FieldName = 'DATA_DEMISSAO'
    end
    object cdsTabelaCPF: TWideStringField
      FieldName = 'CPF'
      Size = 14
    end
    object cdsTabelaCONFIGURACAO_INDIVIDUAL: TBooleanField
      FieldName = 'CONFIGURACAO_INDIVIDUAL'
    end
  end
  inherited Parametros: TEMSParameters
    ListFieldsPesquisa.Strings = (
      'Empresa;EMPRESA_ID;60;;integer;'
      'C'#243'digo;CODIGO_EXTERNO;40;Retorno;integer;'
      'Nome;NOME;200;;string;'
      'PIS;PIS;100;;string;'
      'CPF;CPF;100;;string;')
    ListDataSet.Strings = (
      'cdsTabela'
      'cdsEmpresa'
      'cdsFuncionario_Dados_Complementar'
      'cdsFuncionario_Dados_Pessoais')
    TableName = 'FUNCIONARIO'
    FieldCampoCodigo = 'CODIGO_EXTERNO'
    FieldCampoID = 'ID_FUNCIONARIO'
    CampoCodigo = edtCodigo
    MasterSource = dtsEmpresa
    MasterCampoID = 'ID_EMPRESA'
    MasterCampoCodigo = 'CODIGO_EXTERNO'
    MasterDescricaoField = 'NOME_FANTASIA'
    Left = 312
    Top = 312
  end
  object dtsEmpresa: TDataSource [7]
    DataSet = cdsEmpresa
    Left = 312
    Top = 280
  end
  object cdsEmpresa: TClientDataSet [8]
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_EMPRESA'
        ParamType = ptInput
      end>
    ProviderName = 'dsp_Empresa'
    ReadOnly = True
    RemoteServer = DM_Cadastro_Empresa.DCOMCon_Empresa
    StoreDefs = True
    Left = 248
    Top = 280
    object cdsEmpresaID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
      Origin = '"ID_EMPRESA"'
    end
    object cdsEmpresaCODIGO_EXTERNO: TIntegerField
      FieldName = 'CODIGO_EXTERNO'
      Origin = '"CODIGO_EXTERNO"'
      DisplayFormat = '00000'
    end
    object cdsEmpresaRAZAO_SOCIAL: TWideStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = '"RAZAO_SOCIAL"'
      Size = 50
    end
    object cdsEmpresaNOME_FANTASIA: TWideStringField
      FieldName = 'NOME_FANTASIA'
      Origin = '"NOME_FANTASIA"'
      Size = 50
    end
    object cdsEmpresaCNPJ: TWideStringField
      FieldName = 'CNPJ'
      Origin = '"CNPJ"'
      Size = 14
    end
    object cdsEmpresaINSCRICAO_ESTADUAL: TWideStringField
      FieldName = 'INSCRICAO_ESTADUAL'
      Origin = '"INSCRICAO_ESTADUAL"'
    end
    object cdsEmpresaCODIGO_MUNICIPIO: TIntegerField
      FieldName = 'CODIGO_MUNICIPIO'
      Origin = '"CODIGO_MUNICIPIO"'
    end
    object cdsEmpresaENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Origin = '"ENDERECO"'
      Size = 50
    end
    object cdsEmpresaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = '"NUMERO"'
    end
    object cdsEmpresaCOMPLEMENTO: TWideStringField
      FieldName = 'COMPLEMENTO'
      Origin = '"COMPLEMENTO"'
      Size = 30
    end
    object cdsEmpresaBAIRRO: TWideStringField
      FieldName = 'BAIRRO'
      Origin = '"BAIRRO"'
      Size = 30
    end
    object cdsEmpresaCEP: TWideStringField
      FieldName = 'CEP'
      Origin = '"CEP"'
      Size = 10
    end
    object cdsEmpresaTELEFONE: TWideStringField
      FieldName = 'TELEFONE'
      Origin = '"TELEFONE"'
    end
    object cdsEmpresaEMAIL: TWideStringField
      FieldName = 'EMAIL'
      Origin = '"EMAIL"'
      Size = 30
    end
    object cdsEmpresaDIA_FECHAMENTO: TIntegerField
      FieldName = 'DIA_FECHAMENTO'
      Origin = '"DIA_FECHAMENTO"'
    end
  end
  inherited cxStyleRepository1: TcxStyleRepository
    Left = 280
    Top = 280
  end
  object cdsFuncionario_Dados_Complementar: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_FUNCIONARIO'
        ParamType = ptInput
      end>
    ProviderName = 'dspFuncionario_Dados_Complementar'
    RemoteServer = DM_Cadastro_Funcionario.DCOMCon_Funcionario
    Left = 280
    Top = 248
    object cdsFuncionario_Dados_ComplementarID_FUNCIONARIO_DADOS_C: TIntegerField
      FieldName = 'ID_FUNCIONARIO_DADOS_C'
    end
    object cdsFuncionario_Dados_ComplementarID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
    end
    object cdsFuncionario_Dados_ComplementarID_HORARIO: TIntegerField
      FieldName = 'ID_HORARIO'
    end
    object cdsFuncionario_Dados_ComplementarID_TIPO_JORNADA: TIntegerField
      FieldName = 'ID_TIPO_JORNADA'
    end
    object cdsFuncionario_Dados_ComplementarID_JORNADA: TIntegerField
      FieldName = 'ID_JORNADA'
    end
    object cdsFuncionario_Dados_ComplementarINICIO_EXPEDIENTE: TTimeField
      FieldName = 'INICIO_EXPEDIENTE'
    end
    object cdsFuncionario_Dados_ComplementarHORAS_FIXAS: TBooleanField
      FieldName = 'HORAS_FIXAS'
    end
    object cdsFuncionario_Dados_ComplementarQUANTIDADE_HORAS_FIXAS: TIntegerField
      FieldName = 'QUANTIDADE_HORAS_FIXAS'
    end
    object cdsFuncionario_Dados_ComplementarID_DIGITAIS: TIntegerField
      FieldName = 'ID_DIGITAIS'
    end
  end
  object cdsFuncionario_Dados_Pessoais: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_FUNCIONARIO'
        ParamType = ptInput
      end>
    ProviderName = 'dspFuncionario_Dados_Pessoais'
    RemoteServer = DM_Cadastro_Funcionario.DCOMCon_Funcionario
    Left = 248
    Top = 312
    object cdsFuncionario_Dados_PessoaisID_FUNCIONARIO_DADOS_P: TIntegerField
      FieldName = 'ID_FUNCIONARIO_DADOS_P'
    end
    object cdsFuncionario_Dados_PessoaisID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
    end
    object cdsFuncionario_Dados_PessoaisENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object cdsFuncionario_Dados_PessoaisNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object cdsFuncionario_Dados_PessoaisCOMPLEMENTO: TWideStringField
      FieldName = 'COMPLEMENTO'
    end
    object cdsFuncionario_Dados_PessoaisBAIRRO: TWideStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object cdsFuncionario_Dados_PessoaisCEP: TWideStringField
      FieldName = 'CEP'
      Size = 10
    end
    object cdsFuncionario_Dados_PessoaisCODIGO_MUNICIPIO: TIntegerField
      FieldName = 'CODIGO_MUNICIPIO'
    end
    object cdsFuncionario_Dados_PessoaisTELEFONE: TWideStringField
      FieldName = 'TELEFONE'
    end
    object cdsFuncionario_Dados_PessoaisCELULAR: TWideStringField
      FieldName = 'CELULAR'
    end
  end
  object dtsFuncionario_Dados_Pessoais: TDataSource
    DataSet = cdsFuncionario_Dados_Pessoais
    Left = 280
    Top = 312
  end
end
