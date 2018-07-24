object DM_Cadastro_Funcionario: TDM_Cadastro_Funcionario
  OldCreateOrder = False
  Left = 327
  Top = 144
  Height = 308
  Width = 440
  object DCOMCon_Funcionario: TDCOMConnection
    Connected = True
    ServerGUID = '{24470B2D-9AC3-49F4-8D37-691FD30652DB}'
    ServerName = 'ServidorPonto.RDM_Funcionario'
    Left = 40
    Top = 16
  end
  object cdsFuncionario: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_EMPRESA'
        ParamType = ptInput
      end>
    ProviderName = 'dspFuncionario'
    RemoteServer = DCOMCon_Funcionario
    Left = 144
    Top = 16
    object cdsFuncionarioID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
    end
    object cdsFuncionarioCODIGO_EXTERNO: TIntegerField
      FieldName = 'CODIGO_EXTERNO'
    end
    object cdsFuncionarioNOME: TWideStringField
      FieldName = 'NOME'
      Size = 50
    end
    object cdsFuncionarioDATA_NASCIMENTO: TSQLTimeStampField
      FieldName = 'DATA_NASCIMENTO'
    end
    object cdsFuncionarioSALARIO: TFloatField
      FieldName = 'SALARIO'
    end
    object cdsFuncionarioEMPRESA_ID: TIntegerField
      FieldName = 'EMPRESA_ID'
    end
    object cdsFuncionarioPIS: TWideStringField
      FieldName = 'PIS'
    end
    object cdsFuncionarioRG: TWideStringField
      FieldName = 'RG'
      Size = 10
    end
    object cdsFuncionarioCTPS: TWideStringField
      FieldName = 'CTPS'
      Size = 30
    end
    object cdsFuncionarioDATA_ADMISSAO: TSQLTimeStampField
      FieldName = 'DATA_ADMISSAO'
    end
    object cdsFuncionarioDATA_DEMISSAO: TSQLTimeStampField
      FieldName = 'DATA_DEMISSAO'
    end
    object cdsFuncionarioCPF: TWideStringField
      FieldName = 'CPF'
      Size = 14
    end
    object cdsFuncionarioCONFIGURACAO_INDIVIDUAL: TBooleanField
      FieldName = 'CONFIGURACAO_INDIVIDUAL'
    end
  end
  object cdsFuncionario_Dados_Complementar: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspFuncionario_Dados_Complementar'
    RemoteServer = DCOMCon_Funcionario
    Left = 64
    Top = 88
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
        Name = 'ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspFuncionario_Dados_Pessoais'
    RemoteServer = DCOMCon_Funcionario
    Left = 264
    Top = 88
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
  object cdsFuncionario_Observacao: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspFuncionario_Observacao'
    RemoteServer = DCOMCon_Funcionario
    Left = 56
    Top = 168
    object cdsFuncionario_ObservacaoID_FUNCIONARIO_OBSERVACAO: TIntegerField
      FieldName = 'ID_FUNCIONARIO_OBSERVACAO'
    end
    object cdsFuncionario_ObservacaoID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
    end
    object cdsFuncionario_ObservacaoNOME_EXIBICAO: TWideStringField
      FieldName = 'NOME_EXIBICAO'
      Size = 50
    end
    object cdsFuncionario_ObservacaoSENHA_RELOGIO: TWideStringField
      FieldName = 'SENHA_RELOGIO'
      Size = 50
    end
  end
  object cdsFuncionario_Parametros: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspFuncionario_Parametros'
    RemoteServer = DCOMCon_Funcionario
    Left = 248
    Top = 168
    object cdsFuncionario_ParametrosID_FUNCIONARIO_PARAMETROS: TIntegerField
      FieldName = 'ID_FUNCIONARIO_PARAMETROS'
    end
    object cdsFuncionario_ParametrosID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
    end
    object cdsFuncionario_ParametrosPERIODO: TSQLTimeStampField
      FieldName = 'PERIODO'
    end
    object cdsFuncionario_ParametrosTURNOS: TIntegerField
      FieldName = 'TURNOS'
    end
    object cdsFuncionario_ParametrosPAGAMENTO_HE_ANTES_HORARIO: TBooleanField
      FieldName = 'PAGAMENTO_HE_ANTES_HORARIO'
    end
    object cdsFuncionario_ParametrosPAGAMENTO_HE_DEPOIS_HORARIO: TBooleanField
      FieldName = 'PAGAMENTO_HE_DEPOIS_HORARIO'
    end
    object cdsFuncionario_ParametrosTOLERANCIA_HORAEXTRA: TIntegerField
      FieldName = 'TOLERANCIA_HORAEXTRA'
    end
    object cdsFuncionario_ParametrosTOLERANCIA_ATRASO: TIntegerField
      FieldName = 'TOLERANCIA_ATRASO'
    end
    object cdsFuncionario_ParametrosINICIO_EXPEDIENTE: TTimeField
      FieldName = 'INICIO_EXPEDIENTE'
    end
    object cdsFuncionario_ParametrosHORAS_BONIFICACAO: TTimeField
      FieldName = 'HORAS_BONIFICACAO'
    end
    object cdsFuncionario_ParametrosPORC_HORAS_BONIFICACAO: TIntegerField
      FieldName = 'PORC_HORAS_BONIFICACAO'
    end
    object cdsFuncionario_ParametrosPORC_BONIFICACAO_FERIADO_FOLGA: TIntegerField
      FieldName = 'PORC_BONIFICACAO_FERIADO_FOLGA'
    end
    object cdsFuncionario_ParametrosPORC_BONIFICACAO_DEMAIS_HORAS: TIntegerField
      FieldName = 'PORC_BONIFICACAO_DEMAIS_HORAS'
    end
    object cdsFuncionario_ParametrosHORA_INICIO_ADICIONALNOTURNO: TIntegerField
      FieldName = 'HORA_INICIO_ADICIONALNOTURNO'
    end
    object cdsFuncionario_ParametrosHORA_FIM_ADICIONALNOTURNO: TIntegerField
      FieldName = 'HORA_FIM_ADICIONALNOTURNO'
    end
    object cdsFuncionario_ParametrosDESCONTO_INTERVALO_NOTURNO: TBooleanField
      FieldName = 'DESCONTO_INTERVALO_NOTURNO'
    end
    object cdsFuncionario_ParametrosTRABALHA_BANCOHORAS: TBooleanField
      FieldName = 'TRABALHA_BANCOHORAS'
    end
    object cdsFuncionario_ParametrosALMOCO_FLEXIVEL: TBooleanField
      FieldName = 'ALMOCO_FLEXIVEL'
    end
    object cdsFuncionario_ParametrosENTRADA_SAIDA_FLEXIVEL: TBooleanField
      FieldName = 'ENTRADA_SAIDA_FLEXIVEL'
    end
  end
end
