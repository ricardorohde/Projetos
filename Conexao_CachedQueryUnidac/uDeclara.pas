unit uDeclara;

interface
  uses classes, controls, inifiles, messages;

var
  AppSystem  : string;
  AppTitle   : PChar;
  AppCdEmpresa : String;
  AppNoEmpresa : String;
  AppCdFilial  : String;

  AppSysOper : string;
  AppSysGrupo : integer;
  AppNoSysGrupo : String;
  AppSysAlcada : String;
  AppOperAdmin : string[1]; // indica se o operador logado e administrador ( S/N )
  AppOldPsw  : string;

  AppDirTemp     : string;
  AppDirTempInst : string;
  AppDirLog      : string;
  AppPathKey     : string;
  AppSetClientASE: string;
  AppDir         : string;
  AppSybase      : string;
  AppPath        : string;

  AppCallExt : string;
  AppConexao : String;
  AppAutenticacao : String;
  AppModo_Debug : boolean;
  AppModo_Carga : boolean;  
  AppModo_Geral : boolean; // se true entao serao exibidos somente os programas marcados com SNGERAL = 'S'
                           // se Falso serão exibidos todos os programas
  AppModo_Consulta : boolean;
  AppMsgModo_Consulta : string;
  versys     : integer;
  AppIni : TIniFile;
  vParams : TStrings;

Const
  //VERSAO POLARIS
  csAppVersaoPolaris = '61';

  { Constantes Autenticação}
  csAutenticacao_Auto = 'AUTO'; // AUTENTICACAO AUTOMATICA
  csAutenticacao_Padrao = 'PADRAO'; // AUTENTICACAO PADRAO DO SISTEMA
  csAutenticacao_MS  = 'MS'; // AUTENTICACAO MICROSOFT
  csAutenticacao_MSO = 'MSO'; // AUTENTICACAO MICROSOFT - ORBITALL
  csAutenticacao_NW  = 'NW';// AUTENTICACAO NETWARE
  csAutenticacao_NWO = 'NWO'; // AUTENTICACAO NETWARE - ORBITALL

  { Constantes Gerais }
  //Margem superior do mdi
  ciMargem_MDI = 22;

  // Dias da Semana
  ciDia_Semana_Domingo = 1;
  ciDia_Semana_Segunda = 2;
  ciDia_Semana_Terca   = 3;
  ciDia_Semana_Quarta  = 4;
  ciDia_Semana_Quinta  = 5;
  ciDia_Semana_Sexta   = 6;
  ciDia_Semana_Sabado  = 7;

  //Tipo de comparadores
  csComparador_Diferente       = '121DD';
  csComparador_Fora_intervalo  = '121FI';
  csComparador_No_Intervalo    = '121NI';
  csComparador_Igual           = '121IA';
  csComparador_Termina         = '121LKF';
  csComparador_Comeca          = '121LKI';
  csComparador_Contem          = '121LKM';
  csComparador_Maior           = '121MA';
  csComparador_Maior_Igual     = '121MAI';
  csComparador_Menor           = '121ME';
  csComparador_Menor_Igual     = '121MEI';
  csComparador_In              = '121IN';

  //Tipo de movimento de Estoque
  csCdTpMov_Estoque_Entrada='E';
  csCdTpMov_Estoque_Saida  ='S';

  //Tipo de endereço
  csCdTipo_endereco_Residencial='006R';
  csCdTipo_endereco_Comercial  ='006C';
  csCdTipo_endereco_Outros     ='006O';

  //Tipo de Requisicao de compra
  csCdTpReq_Todos = 'T';
  csCdTpReq_Nao_Req = 'N';
  csCdTpReq_Manual = 'M';

  //Tipo de Item de menu
  ciTpSeparador=0;
  ciTpNo=1;
  ciTpPrograma=2;
  ciTpRotina=3;

  //Parametro de sistema
  csCdParCript = 'VERSAO_CRIPTOGRAFIA';

  //Chave_Criptografia
  csChave_Criptografia = '@#$%';

  //Versao criptografia
  csCdVersaoCriptOriginal = '1';
  csCdVersaoCriptConpativelJava = '2';

  csQuebra_Linha = chr(13)+chr(10);

  //
  {Constantes de Tipo de Dominio }

  {Constantes de Dominio}
  //Situacao
  csCdSit_Ativo            = '004A';
  csCdSit_Inativo          = '004I';
  csCdSit_Cancelado        = '004C';

  //Situacao Funcionario
  csCdSitFunc_Ativo        = '020A';
  csCdSitFunc_Demitido     = '020D';
  csCdSitFunc_Ferias       = '020F';

  // Status
  csCdStatus_Normal        = '022N';
  csCdStatus_Bloqueado     = '022B';

  // Status_requisicao_Compra
  csCdStatus_Req_Aberto        = '112A';
  csCdStatus_Req_Cancelado     = '112C';
  csCdStatus_Req_Atendido      = '112AT';

  //Abrangencia
  csCdAbrangencia_Municipal    = '037M';
  csCdAbrangencia_Estadual     = '037E';
  csCdAbrangencia_Federal      = '037F';
  csCdAbrangencia_Internacional= '037I';

  //Tipo de telefone
  csTpFone_Residencial      ='0071';
  csTpFone_Comercial        ='0072';
  csTpFone_Fax_comercial    ='0073';
  csTpFone_Celular          ='0074';
  csTpFone_Fax_residencial  ='0075';
  csTpFone_Carro            ='0076';
  csTpFone_Outro            ='0077';

  //Tipo de Unidade de Medida
  csTpUni_Med_Tempo        = '036T';
  csTpUni_Med_Area         = '036A';
  csTpUni_Med_Volume       = '036V';
  csTpUni_Med_Distancia    = '036D';

  //Tipo de Cliente
  csCdTpCli_Cliente        = '033C';
  csCdTpCli_Prospecto      = '033P';

  //Tipo de Pessoa
  csCdPessoa_Juridica      = '015J';
  csCdPessoa_Fisica        = '015F';

  // Sexo
  csCdSexo_Masculino       = '011M';
  csCdSexo_Feminino        = '011F';

  //Grau de Parentesco
  csCDParen_Conjuge        = '023C';

  //Estado Civil
  csCdEstadoCivil_Casado     = '009C';
  csCdEstadoCivil_Solteiro   = '009S';
  csCdEstadoCivil_Divorciado = '009D';
  csCdEstadoCivil_Desquitado = '009Q';
  csCdEstadoCivil_Outros     = '009O';
  csCdEstadoCivil_Viuvo      = '009V';

  //Tipo de Dados
  csCdDado_Caracter        = '044C';
  csCdDado_Numerico        = '044N';
  csCdDado_Data            = '044D';
  csCdDado_Binario         = '044B';

  //Tipo de Valor
  csCdTpValor_Valor        = '021V';
  csCdTpValor_Percentual   = '021P';

  //Tipo de Imagem
  csCdTpImagem_Assinatura  = '017A';
  csCdTpImagem_Fotografia  = '017F';

  //Tipo de Provento\Desconto
  csCdTpProvento_Desconto_Fixo       = '031F';
  csCdTpProvento_Desconto_Parcelado  = '031P';

  //status Faturamento
  csCdStatus_Fat_Faturado              = '058F';
  csCdStatus_Fat_Nao_Faturado          = '058N';
  csCdStatus_Fat_Faturado_Parcialmento = '058PF';

  //Prioridade
  csCdPrioridade_Alta = '0560';
  csCdPrioridade_Media = '0565';
  csCdPrioridade_Baixa = '0569';

  //Meio de envio
  csMeio_Envio_Correio             = '0521';
  csMeio_Envio_Motoboy             = '0522';
  csMeio_Envio_Cliente_Retira      = '0523';
  csMeio_Envio_Fax                 = '0524';
  csMeio_Envio_Email               = '0525';
  csMeio_Envio_Laboratorio_Entrega = '0526';

  //Periodicidade
  csPer_Semanal   = '070S';
  csPer_Quinzenal = '070Q';
  csPer_Mensal    = '070M';
  csPer_Bimestral = '070B';
  csPer_Semestral = '070SE';
  csPer_Anual     = '070A';

  //Tipo de Cobranca
  csTipCob_Boleto = '087BOL';
  csTipCob_Debito = '087DEB';
  csTipCob_Manual = '087MAN';

  //Tipo de Arredondamento
  csCdTpArredond_HIGH   = '073H';
  csCdTpArredond_LOW    = '073L';
  csCdTpArredond_NAO    = '073N';
  csCdTpArredond_PADRAO = '073P';

  // Codigos de Papel
  ciCdConjuge   = 5;
  ciCdLocatario = 7;
  ciCdLocador   = 8;
  ciCdFiador    = 9;
  ciCdSolidario = 10;

  // situacao da parcela a receber
  csCdAberta           = '1070';
  csCdRecebeu_aLancar  = '1071';
  csCDRecebeu_Lancada  = '1072';
  csCdParcial_aLancar  = '1073';
  csCdParcial_Lancada  = '1074';
  csCdCancelada        = '1075';


  //STATUS DE MANUTENCAO
  csCdStatus_Manutencao_Pendente  = '132P';
  csCdStatus_Manutencao_Cancelado = '132C';
  csCdStatus_Manutencao_Aprovado  = '132A';
  //
  csCdStatus_Manutencao_Pendente_Dupla_Processo  = '132PDP';
  csCdStatus_Manutencao_Aprovado_Dupla_Processo  = '132ADP';
  csCdStatus_Manutencao_Cancelado_Dupla_Processo = '132CDP';

  //TIPO DE MANUTENCAO
  csTpManutencao_Inclusao  = 'I';
  csTpManutencao_Alteracao = 'A';
  csTpManutencao_Exclusao  = 'E';

implementation

initialization
  AppMsgModo_Consulta := 'Sistema dísponivel apenas para consulta.'
end.
