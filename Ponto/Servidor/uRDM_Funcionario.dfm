object RDM_Funcionario: TRDM_Funcionario
  OldCreateOrder = False
  Left = 456
  Top = 202
  Height = 444
  Width = 416
  object qryFuncionario: TADQuery
    Connection = DM_Conexao.con
    SQL.Strings = (
      '  SELECT "ID_FUNCIONARIO"'
      #9',"CODIGO_EXTERNO"'
      #9',"NOME"'
      #9',"DATA_NASCIMENTO"'
      #9',"SALARIO"'
      #9',"ID_EMPRESA"'
      #9',"PIS"'
      #9',"RG"'
      #9',"CTPS"'
      #9',"DATA_ADMISSAO"'
      #9',"DATA_DEMISSAO"'
      #9',"CPF"'
      '        ,"CONFIGURACAO_INDIVIDUAL"'
      '    FROM "public"."FUNCIONARIO"'
      '   WHERE(("ID_FUNCIONARIO" = :ID_FUNCIONARIO) '
      '      OR (:ID_FUNCIONARIO IS NULL))'
      '     AND "ID_EMPRESA" = :ID_EMPRESA'
      'ORDER BY "CODIGO_EXTERNO"')
    Left = 88
    Top = 16
    ParamData = <
      item
        Name = 'ID_FUNCIONARIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID_EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryFuncionarioID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
      Origin = '"ID_FUNCIONARIO"'
    end
    object qryFuncionarioCODIGO_EXTERNO: TIntegerField
      FieldName = 'CODIGO_EXTERNO'
      Origin = '"CODIGO_EXTERNO"'
    end
    object qryFuncionarioNOME: TWideStringField
      FieldName = 'NOME'
      Origin = '"NOME"'
      Size = 50
    end
    object qryFuncionarioDATA_NASCIMENTO: TSQLTimeStampField
      FieldName = 'DATA_NASCIMENTO'
      Origin = '"DATA_NASCIMENTO"'
    end
    object qryFuncionarioSALARIO: TFloatField
      FieldName = 'SALARIO'
      Origin = '"SALARIO"'
    end
    object qryFuncionarioID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
      Origin = '"ID_EMPRESA"'
    end
    object qryFuncionarioPIS: TWideStringField
      FieldName = 'PIS'
      Origin = '"PIS"'
    end
    object qryFuncionarioRG: TWideStringField
      FieldName = 'RG'
      Origin = '"RG"'
      Size = 10
    end
    object qryFuncionarioCTPS: TWideStringField
      FieldName = 'CTPS'
      Origin = '"CTPS"'
      Size = 30
    end
    object qryFuncionarioDATA_ADMISSAO: TSQLTimeStampField
      FieldName = 'DATA_ADMISSAO'
      Origin = '"DATA_ADMISSAO"'
    end
    object qryFuncionarioDATA_DEMISSAO: TSQLTimeStampField
      FieldName = 'DATA_DEMISSAO'
      Origin = '"DATA_DEMISSAO"'
    end
    object qryFuncionarioCPF: TWideStringField
      FieldName = 'CPF'
      Origin = '"CPF"'
      Size = 14
    end
    object qryFuncionarioCONFIGURACAO_INDIVIDUAL: TBooleanField
      FieldName = 'CONFIGURACAO_INDIVIDUAL'
      Origin = '"CONFIGURACAO_INDIVIDUAL"'
    end
  end
  object dspFuncionario: TDataSetProvider
    DataSet = qryFuncionario
    Left = 312
    Top = 16
  end
  object qryFuncionario_Dados_Complementar: TADQuery
    Connection = DM_Conexao.con
    SQL.Strings = (
      ' SELECT "ID_FUNCIONARIO_DADOS_C"'
      '       ,"ID_FUNCIONARIO"'
      '       ,"ID_HORARIO"'
      '       ,"ID_TIPO_JORNADA"'
      '       ,"ID_JORNADA"'
      '       ,"INICIO_EXPEDIENTE"'
      '       ,"HORAS_FIXAS"'
      '       ,"QUANTIDADE_HORAS_FIXAS"'
      '       ,"ID_DIGITAIS"'
      '  FROM "public"."FUNCIONARIO_DADOS_COMPLEMENTAR"'
      ' WHERE ("ID_FUNCIONARIO" = :ID_FUNCIONARIO) OR'
      '       (:ID_FUNCIONARIO IS NULL)'
      'ORDER BY "ID_FUNCIONARIO_DADOS_C"')
    Left = 88
    Top = 88
    ParamData = <
      item
        Name = 'ID_FUNCIONARIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryFuncionario_Dados_ComplementarID_FUNCIONARIO_DADOS_C: TIntegerField
      FieldName = 'ID_FUNCIONARIO_DADOS_C'
      Origin = '"ID_FUNCIONARIO_DADOS_C"'
    end
    object qryFuncionario_Dados_ComplementarID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
      Origin = '"ID_FUNCIONARIO"'
    end
    object qryFuncionario_Dados_ComplementarID_HORARIO: TIntegerField
      FieldName = 'ID_HORARIO'
      Origin = '"ID_HORARIO"'
    end
    object qryFuncionario_Dados_ComplementarID_TIPO_JORNADA: TIntegerField
      FieldName = 'ID_TIPO_JORNADA'
      Origin = '"ID_TIPO_JORNADA"'
    end
    object qryFuncionario_Dados_ComplementarID_JORNADA: TIntegerField
      FieldName = 'ID_JORNADA'
      Origin = '"ID_JORNADA"'
    end
    object qryFuncionario_Dados_ComplementarINICIO_EXPEDIENTE: TTimeField
      FieldName = 'INICIO_EXPEDIENTE'
      Origin = '"INICIO_EXPEDIENTE"'
    end
    object qryFuncionario_Dados_ComplementarHORAS_FIXAS: TBooleanField
      FieldName = 'HORAS_FIXAS'
      Origin = '"HORAS_FIXAS"'
    end
    object qryFuncionario_Dados_ComplementarQUANTIDADE_HORAS_FIXAS: TIntegerField
      FieldName = 'QUANTIDADE_HORAS_FIXAS'
      Origin = '"QUANTIDADE_HORAS_FIXAS"'
    end
    object qryFuncionario_Dados_ComplementarID_DIGITAIS: TIntegerField
      FieldName = 'ID_DIGITAIS'
      Origin = '"ID_DIGITAIS"'
    end
  end
  object qryFuncionario_Dados_Pessoais: TADQuery
    Connection = DM_Conexao.con
    SQL.Strings = (
      'SELECT "ID_FUNCIONARIO_DADOS_P"'
      '      ,"ID_FUNCIONARIO"'
      '      ,"ENDERECO"'
      '      ,"NUMERO"'
      '      ,"COMPLEMENTO"'
      '      ,"BAIRRO"'
      '      ,"CEP"'
      '      ,"CODIGO_MUNICIPIO"'
      '      ,"TELEFONE"'
      '      ,"CELULAR"'
      '  FROM "public"."FUNCIONARIO_DADOS_PESSOAIS"'
      ' WHERE ("ID_FUNCIONARIO" = :ID_FUNCIONARIO) OR'
      '       (:ID_FUNCIONARIO IS NULL)'
      'ORDER BY "ID_FUNCIONARIO_DADOS_P"')
    Left = 88
    Top = 168
    ParamData = <
      item
        Name = 'ID_FUNCIONARIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryFuncionario_Dados_PessoaisID_FUNCIONARIO_DADOS_P: TIntegerField
      FieldName = 'ID_FUNCIONARIO_DADOS_P'
      Origin = '"ID_FUNCIONARIO_DADOS_P"'
    end
    object qryFuncionario_Dados_PessoaisID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
      Origin = '"ID_FUNCIONARIO"'
    end
    object qryFuncionario_Dados_PessoaisENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Origin = '"ENDERECO"'
      Size = 50
    end
    object qryFuncionario_Dados_PessoaisNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = '"NUMERO"'
    end
    object qryFuncionario_Dados_PessoaisCOMPLEMENTO: TWideStringField
      FieldName = 'COMPLEMENTO'
      Origin = '"COMPLEMENTO"'
    end
    object qryFuncionario_Dados_PessoaisBAIRRO: TWideStringField
      FieldName = 'BAIRRO'
      Origin = '"BAIRRO"'
      Size = 30
    end
    object qryFuncionario_Dados_PessoaisCEP: TWideStringField
      FieldName = 'CEP'
      Origin = '"CEP"'
      Size = 10
    end
    object qryFuncionario_Dados_PessoaisCODIGO_MUNICIPIO: TIntegerField
      FieldName = 'CODIGO_MUNICIPIO'
      Origin = '"CODIGO_MUNICIPIO"'
    end
    object qryFuncionario_Dados_PessoaisTELEFONE: TWideStringField
      FieldName = 'TELEFONE'
      Origin = '"TELEFONE"'
    end
    object qryFuncionario_Dados_PessoaisCELULAR: TWideStringField
      FieldName = 'CELULAR'
      Origin = '"CELULAR"'
    end
  end
  object qryFuncionario_Observacao: TADQuery
    Connection = DM_Conexao.con
    SQL.Strings = (
      'SELECT "ID_FUNCIONARIO_OBSERVACAO"'
      '      ,"ID_FUNCIONARIO"'
      '      ,"NOME_EXIBICAO"'
      '      ,"SENHA_RELOGIO"'
      '  FROM "public"."FUNCIONARIO_OBSERVACAO"'
      ' WHERE ("ID_FUNCIONARIO" = :ID_FUNCIONARIO) OR'
      '       (:ID_FUNCIONARIO IS NULL)'
      'ORDER BY "ID_FUNCIONARIO_OBSERVACAO"')
    Left = 80
    Top = 240
    ParamData = <
      item
        Name = 'ID_FUNCIONARIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryFuncionario_ObservacaoID_FUNCIONARIO_OBSERVACAO: TIntegerField
      FieldName = 'ID_FUNCIONARIO_OBSERVACAO'
      Origin = '"ID_FUNCIONARIO_OBSERVACAO"'
    end
    object qryFuncionario_ObservacaoID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
      Origin = '"ID_FUNCIONARIO"'
    end
    object qryFuncionario_ObservacaoNOME_EXIBICAO: TWideStringField
      FieldName = 'NOME_EXIBICAO'
      Origin = '"NOME_EXIBICAO"'
      Size = 50
    end
    object qryFuncionario_ObservacaoSENHA_RELOGIO: TWideStringField
      FieldName = 'SENHA_RELOGIO'
      Origin = '"SENHA_RELOGIO"'
      Size = 50
    end
  end
  object dspFuncionario_Dados_Complementar: TDataSetProvider
    DataSet = qryFuncionario_Dados_Complementar
    Left = 312
    Top = 96
  end
  object dspFuncionario_Dados_Pessoais: TDataSetProvider
    DataSet = qryFuncionario_Dados_Pessoais
    Left = 304
    Top = 168
  end
  object dspFuncionario_Observacao: TDataSetProvider
    DataSet = qryFuncionario_Observacao
    Left = 304
    Top = 248
  end
  object qryFuncionario_Parametros: TADQuery
    Connection = DM_Conexao.con
    SQL.Strings = (
      '  SELECT "ID_FUNCIONARIO_PARAMETROS"'
      '        ,"ID_FUNCIONARIO"'
      #9',"PERIODO"'
      '        ,"TURNOS"'
      '        ,"PAGTO_HE_ANTES_HORARIO"'
      '        ,"PAGTO_HE_DEPOIS_HORARIO"'
      '        ,"TOLERANCIA_HORAEXTRA"'
      '        ,"TOLERANCIA_ATRASO"'
      '        ,"INICIO_EXPEDIENTE"'
      '        ,"HORAS_BONIFICACAO"'
      '        ,"PORC_HORAS_BONIFICACAO"'
      '        ,"PORCENTAGEM_FERIADO_FOLGA"'
      '        ,"PORCENTAGEM_DEMAIS_HORAS"'
      '        ,"HORA_INICIO_ADICIONALNOTURNO"'
      '        ,"HORA_FIM_ADICIONALNOTURNO"'
      '        ,"DESC_INTERVALO_NOTURNO"'
      '        ,"TRABALHA_BANCOHORAS"'
      '        ,"ALMOCO_FLEXIVEL"'
      '        ,"ENT_SAI_FLEXIVEL"'
      '    FROM "public"."FUNCIONARIO_PARAMETROS"'
      '   WHERE ("ID_FUNCIONARIO" = :ID_FUNCIONARIO) OR'
      '         (:ID_FUNCIONARIO IS NULL)'
      'ORDER BY "ID_FUNCIONARIO_PARAMETROS"')
    Left = 80
    Top = 320
    ParamData = <
      item
        Name = 'ID_FUNCIONARIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dspFuncionario_Parametros: TDataSetProvider
    DataSet = qryFuncionario_Parametros
    Left = 304
    Top = 320
  end
end
