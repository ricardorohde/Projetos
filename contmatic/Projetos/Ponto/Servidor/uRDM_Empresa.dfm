object RDM_Empresa: TRDM_Empresa
  OldCreateOrder = False
  Left = 356
  Top = 223
  Height = 260
  Width = 348
  object dsp_Empresa: TDataSetProvider
    DataSet = qry_Empresa
    Left = 232
    Top = 40
  end
  object dspEmpresa_Parametros: TDataSetProvider
    DataSet = qryEmpresa_Parametros
    Left = 232
    Top = 96
  end
  object qry_Empresa: TADQuery
    Connection = DM_Conexao.con
    SQL.Strings = (
      '  SELECT "ID_EMPRESA"'
      #9',"CODIGO_EXTERNO"'
      #9',"RAZAO_SOCIAL"'
      #9',"NOME_FANTASIA"'
      #9',"CNPJ"'
      #9',"INSCRICAO_ESTADUAL"'
      #9',"CODIGO_MUNICIPIO"'
      #9',"ENDERECO"'
      #9',"NUMERO"'
      #9',"COMPLEMENTO"'
      #9',"BAIRRO"'
      #9',"CEP"'
      #9',"TELEFONE"'
      #9',"EMAIL"'
      #9',"DIA_FECHAMENTO"'
      '   FROM "public"."EMPRESA"'
      '  WHERE ("ID_EMPRESA" = :ID)'
      '     OR (:ID IS NULL)'
      '     ')
    Left = 88
    Top = 32
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qry_EmpresaID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
      Origin = '"ID_EMPRESA"'
    end
    object qry_EmpresaCODIGO_EXTERNO: TIntegerField
      FieldName = 'CODIGO_EXTERNO'
      Origin = '"CODIGO_EXTERNO"'
    end
    object qry_EmpresaRAZAO_SOCIAL: TWideStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = '"RAZAO_SOCIAL"'
      Size = 50
    end
    object qry_EmpresaNOME_FANTASIA: TWideStringField
      FieldName = 'NOME_FANTASIA'
      Origin = '"NOME_FANTASIA"'
      Size = 50
    end
    object qry_EmpresaCNPJ: TWideStringField
      FieldName = 'CNPJ'
      Origin = '"CNPJ"'
      Size = 14
    end
    object qry_EmpresaINSCRICAO_ESTADUAL: TWideStringField
      FieldName = 'INSCRICAO_ESTADUAL'
      Origin = '"INSCRICAO_ESTADUAL"'
    end
    object qry_EmpresaCODIGO_MUNICIPIO: TIntegerField
      FieldName = 'CODIGO_MUNICIPIO'
      Origin = '"CODIGO_MUNICIPIO"'
    end
    object qry_EmpresaENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Origin = '"ENDERECO"'
      Size = 50
    end
    object qry_EmpresaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = '"NUMERO"'
    end
    object qry_EmpresaCOMPLEMENTO: TWideStringField
      FieldName = 'COMPLEMENTO'
      Origin = '"COMPLEMENTO"'
      Size = 30
    end
    object qry_EmpresaBAIRRO: TWideStringField
      FieldName = 'BAIRRO'
      Origin = '"BAIRRO"'
      Size = 30
    end
    object qry_EmpresaCEP: TWideStringField
      FieldName = 'CEP'
      Origin = '"CEP"'
      Size = 10
    end
    object qry_EmpresaTELEFONE: TWideStringField
      FieldName = 'TELEFONE'
      Origin = '"TELEFONE"'
    end
    object qry_EmpresaEMAIL: TWideStringField
      FieldName = 'EMAIL'
      Origin = '"EMAIL"'
      Size = 30
    end
    object qry_EmpresaDIA_FECHAMENTO: TIntegerField
      FieldName = 'DIA_FECHAMENTO'
      Origin = '"DIA_FECHAMENTO"'
    end
  end
  object qryEmpresa_Parametros: TADQuery
    Connection = DM_Conexao.con
    SQL.Strings = (
      'SELECT "ID_PARAMETROS_EMPRESA"'
      '      ,"EMPRESA_ID"'
      '      ,"PERIODO"'
      '      ,"TURNOS"'
      '      ,"PAGAMENTO_HE_ANTES_HORARIO"'
      '      ,"PAGAMENTO_HE_DEPOIS_HORARIO"'
      '      ,"TOLERANCIA_HORAEXTRA"'
      '      ,"TOLERANCIA_ATRASO"'
      '      ,"INICIO_EXPEDIENTE"'
      '      ,"HORAS_BONIFICACAO"'
      '      ,"PORC_HORAS_BONIFICACAO"'
      '      ,"PORC_BONIFICACAO_FERIADO_FOLGA"'
      '      ,"PORC_BONIFICACAO_DEMAIS_HORAS"'
      '      ,"HORA_INICIO_ADICIONALNOTURNO"'
      '      ,"HORA_FIM_ADICIONALNOTURNO"'
      '      ,"DESCONTO_INTERVALO_NOTURNO"'
      '      ,"TRABALHA_BANCOHORAS"'
      '      ,"ALMOCO_FLEXIVEL"'
      '      ,"ENTRADA_SAIDA_FLEXIVEL"'
      '  FROM "public"."EMPRESA_PARAMETROS"'
      ' WHERE "EMPRESA_ID" = :ID_EMPRESA')
    Left = 88
    Top = 96
    ParamData = <
      item
        Name = 'ID_EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryEmpresa_ParametrosID_PARAMETROS_EMPRESA: TIntegerField
      FieldName = 'ID_PARAMETROS_EMPRESA'
      Origin = '"ID_PARAMETROS_EMPRESA"'
    end
    object qryEmpresa_ParametrosEMPRESA_ID: TIntegerField
      FieldName = 'EMPRESA_ID'
      Origin = '"EMPRESA_ID"'
    end
    object qryEmpresa_ParametrosPERIODO: TSQLTimeStampField
      FieldName = 'PERIODO'
      Origin = '"PERIODO"'
    end
    object qryEmpresa_ParametrosTURNOS: TIntegerField
      FieldName = 'TURNOS'
      Origin = '"TURNOS"'
    end
    object qryEmpresa_ParametrosPAGAMENTO_HE_ANTES_HORARIO: TBooleanField
      FieldName = 'PAGAMENTO_HE_ANTES_HORARIO'
      Origin = '"PAGAMENTO_HE_ANTES_HORARIO"'
    end
    object qryEmpresa_ParametrosPAGAMENTO_HE_DEPOIS_HORARIO: TBooleanField
      FieldName = 'PAGAMENTO_HE_DEPOIS_HORARIO'
      Origin = '"PAGAMENTO_HE_DEPOIS_HORARIO"'
    end
    object qryEmpresa_ParametrosTOLERANCIA_HORAEXTRA: TIntegerField
      FieldName = 'TOLERANCIA_HORAEXTRA'
      Origin = '"TOLERANCIA_HORAEXTRA"'
    end
    object qryEmpresa_ParametrosTOLERANCIA_ATRASO: TIntegerField
      FieldName = 'TOLERANCIA_ATRASO'
      Origin = '"TOLERANCIA_ATRASO"'
    end
    object qryEmpresa_ParametrosINICIO_EXPEDIENTE: TTimeField
      FieldName = 'INICIO_EXPEDIENTE'
      Origin = '"INICIO_EXPEDIENTE"'
    end
    object qryEmpresa_ParametrosHORAS_BONIFICACAO: TTimeField
      FieldName = 'HORAS_BONIFICACAO'
      Origin = '"HORAS_BONIFICACAO"'
    end
    object qryEmpresa_ParametrosPORC_HORAS_BONIFICACAO: TIntegerField
      FieldName = 'PORC_HORAS_BONIFICACAO'
      Origin = '"PORC_HORAS_BONIFICACAO"'
    end
    object qryEmpresa_ParametrosPORC_BONIFICACAO_FERIADO_FOLGA: TIntegerField
      FieldName = 'PORC_BONIFICACAO_FERIADO_FOLGA'
      Origin = '"PORC_BONIFICACAO_FERIADO_FOLGA"'
    end
    object qryEmpresa_ParametrosPORC_BONIFICACAO_DEMAIS_HORAS: TIntegerField
      FieldName = 'PORC_BONIFICACAO_DEMAIS_HORAS'
      Origin = '"PORC_BONIFICACAO_DEMAIS_HORAS"'
    end
    object qryEmpresa_ParametrosHORA_INICIO_ADICIONALNOTURNO: TIntegerField
      FieldName = 'HORA_INICIO_ADICIONALNOTURNO'
      Origin = '"HORA_INICIO_ADICIONALNOTURNO"'
    end
    object qryEmpresa_ParametrosHORA_FIM_ADICIONALNOTURNO: TIntegerField
      FieldName = 'HORA_FIM_ADICIONALNOTURNO'
      Origin = '"HORA_FIM_ADICIONALNOTURNO"'
    end
    object qryEmpresa_ParametrosDESCONTO_INTERVALO_NOTURNO: TBooleanField
      FieldName = 'DESCONTO_INTERVALO_NOTURNO'
      Origin = '"DESCONTO_INTERVALO_NOTURNO"'
    end
    object qryEmpresa_ParametrosTRABALHA_BANCOHORAS: TBooleanField
      FieldName = 'TRABALHA_BANCOHORAS'
      Origin = '"TRABALHA_BANCOHORAS"'
    end
    object qryEmpresa_ParametrosALMOCO_FLEXIVEL: TBooleanField
      FieldName = 'ALMOCO_FLEXIVEL'
      Origin = '"ALMOCO_FLEXIVEL"'
    end
    object qryEmpresa_ParametrosENTRADA_SAIDA_FLEXIVEL: TBooleanField
      FieldName = 'ENTRADA_SAIDA_FLEXIVEL'
      Origin = '"ENTRADA_SAIDA_FLEXIVEL"'
    end
  end
end
