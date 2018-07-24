inherited frmCadastro_Funcionario: TfrmCadastro_Funcionario
  Left = 531
  Top = 260
  Caption = 'Cadastro de Funcion'#225'rio'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    inherited tsDados: TTabSheet
      inherited grid: TcxGrid
        inherited tv1: TcxGridDBTableView
          object tv1CODIGO_EXTERNO: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'CODIGO_EXTERNO'
            HeaderAlignmentHorz = taCenter
          end
          object tv1NOME: TcxGridDBColumn
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
      object Label2: TLabel
        Left = 0
        Top = 0
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = edtCodigo
      end
      object Label3: TLabel
        Left = 0
        Top = 40
        Width = 29
        Height = 13
        Caption = 'NOME'
        FocusControl = edtNome
      end
      object Label4: TLabel
        Left = 0
        Top = 80
        Width = 99
        Height = 13
        Caption = 'DATA_NASCIMENTO'
        FocusControl = edtDataNascimento
      end
      object Label5: TLabel
        Left = 0
        Top = 120
        Width = 44
        Height = 13
        Caption = 'SALARIO'
        FocusControl = edtSalario
      end
      object edtCodigo: TDBEdit
        Left = 0
        Top = 16
        Width = 134
        Height = 21
        DataField = 'CODIGO_EXTERNO'
        DataSource = dtsTabela
        TabOrder = 0
      end
      object edtNome: TDBEdit
        Left = 0
        Top = 56
        Width = 300
        Height = 21
        DataField = 'NOME'
        DataSource = dtsTabela
        TabOrder = 1
      end
      object edtDataNascimento: TDBEdit
        Left = 0
        Top = 96
        Width = 130
        Height = 21
        DataField = 'DATA_NASCIMENTO'
        DataSource = dtsTabela
        TabOrder = 2
      end
      object edtSalario: TDBEdit
        Left = 0
        Top = 136
        Width = 134
        Height = 21
        DataField = 'SALARIO'
        DataSource = dtsTabela
        TabOrder = 3
      end
    end
  end
  inherited Panel1: TPanel
    inherited Label1: TLabel
      Width = 41
      Caption = 'Empresa'
    end
    inherited edtCodigoMaster: TDBSearchEdit
      Hint = 'Informe o c'#243'digo  da empresa'
      ListFields.Strings = (
        'C'#243'digo;CODIGO_EXTERNO;40;Retorno;integer;'
        'Nome da Empresa;NOME_FANTASIA;200;;string;'
        'CNPJ;CNPJ;100;;string;')
      ListSource = dtsEmpresa
    end
  end
  inherited cdsTabela: TClientDataSet
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EMPRESA_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspFuncionario'
    RemoteServer = DM_Cadastro_Empresa.DCOMCon_Empresa
    BeforePost = cdsTabelaBeforePost
    BeforeDelete = cdsTabelaBeforeDelete
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
    object cdsTabelaEMPRESA_ID: TIntegerField
      FieldName = 'EMPRESA_ID'
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
    FieldCampoCodigo = 'CODIGO_EXTERNO'
    CampoCodigo = edtCodigo
    Left = 320
    Top = 56
  end
  object dtsEmpresa: TDataSource [7]
    DataSet = cdsEmpresa
    Left = 240
    Top = 72
  end
  object cdsEmpresa: TClientDataSet [8]
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    ProviderName = 'dsp_Empresa'
    RemoteServer = DM_Cadastro_Empresa.DCOMCon_Empresa
    Left = 272
    Top = 72
    object cdsEmpresaID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
    end
    object cdsEmpresaCODIGO_EXTERNO: TIntegerField
      FieldName = 'CODIGO_EXTERNO'
      DisplayFormat = '00000'
    end
    object cdsEmpresaRAZAO_SOCIAL: TWideStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 50
    end
    object cdsEmpresaNOME_FANTASIA: TWideStringField
      FieldName = 'NOME_FANTASIA'
      Size = 50
    end
    object cdsEmpresaCNPJ: TWideStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object cdsEmpresaINSCRICAO_ESTADUAL: TWideStringField
      FieldName = 'INSCRICAO_ESTADUAL'
    end
    object cdsEmpresaCODIGO_MUNICIPIO: TIntegerField
      FieldName = 'CODIGO_MUNICIPIO'
    end
    object cdsEmpresaENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object cdsEmpresaNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object cdsEmpresaCOMPLEMENTO: TWideStringField
      FieldName = 'COMPLEMENTO'
      Size = 30
    end
    object cdsEmpresaBAIRRO: TWideStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object cdsEmpresaCEP: TWideStringField
      FieldName = 'CEP'
      Size = 10
    end
    object cdsEmpresaTELEFONE: TWideStringField
      FieldName = 'TELEFONE'
    end
    object cdsEmpresaEMAIL: TWideStringField
      FieldName = 'EMAIL'
      Size = 30
    end
    object cdsEmpresaDIA_FECHAMENTO: TIntegerField
      FieldName = 'DIA_FECHAMENTO'
    end
  end
end
