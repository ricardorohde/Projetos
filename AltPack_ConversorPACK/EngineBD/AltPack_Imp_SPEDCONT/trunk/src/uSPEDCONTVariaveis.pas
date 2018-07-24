unit uSPEDCONTVariaveis;

interface

uses
  SysUtils, StdCtrls, DBTables, Windows, Classes, DB, StrUtils,
  Variants, ExtCtrls,  Controls, Dialogs, Alterdata, AltFStatus, AlterdataTypes,
  ComCtrls, Forms, ComObj, ActiveX;

Type
  TRegistro_0  = record
    //REG "0000"
    NOME         : string;//Nome empresarial do empresário ou sociedade empresária.
    DT_INI       : TDateTime;//Data inicial das informações contidas no arquivo.
    DT_FIN       : TDateTime;//Data final das informações contidas no arquivo.
    IND_SIT_ESP  : string;//Indicador de situação especial (conforme tabela publicada pelo Sped).
    UF           : string;//Sigla da unidade da federação do empresário ou sociedade empresária.
    IM           : string;//Inscrição Municipal do empresário ou sociedade empresária.
    IE           : string;//Inscrição Estadual do empresário ou sociedade empresária.
    CNPJ         : string;//Número de inscrição do empresário ou sociedade empresária no CNPJ.
    COD_MUN      : string;//Código do município do domicílio fiscal do empresário ou sociedade empresária, conforme tabela do IBGE - Instituto Brasileiro de Geografia e Estatística.

    IdPlanoContas: string;
    //REG "0001"
    IND_DAD      : string;//Indicador de movimento:
                          //0- Bloco com dados informados;
                          //1- Bloco sem dados informados.

    //REG "0007"
    COD_ENT_REF  : string;//Código da instituição responsável pela administração do cadastro (conforme tabela publicada pelo Sped).
    COD_INSCR    : string;//Código cadastral do empresário ou sociedade empresária na instituição identificada no campo 02.
    //REG "180"
    COD_REL      : string;//Código do relacionamento conforme tabela publicada pelo Sped.
    DT_INI_REL   : string;//Data do início do relacionamento.
    DT_FIN_REL   : string;//Data do término do relacionamento.
end;

  TRegistro_I  = record
    //REG "I001"
    IND_DAD      : string;//Indicador de movimento:
                          //0- Bloco com dados informados;
                          //1- Bloco sem dados informados.

    //REG "I010"
    IND_ESC      : string;//Indicador da forma de escrituração contábil:
                          //G - Livro Diário  (Completo sem escrituração auxiliar);
                          //R - Livro Diário  com Escrituração Resumida (com escrituração auxiliar);
                          //A - Livro Diário Auxiliar ao Diário com Escrituração Resumida;
                          //B - Livro Balancetes Diários e Balanços;
                          //Z - Razão Auxiliar (Livro Contábil Auxiliar conforme leiaute definido nos registros I500 a I555).
    COD_VER_LC   : string;//Código da Versão do Leiaute Contábil (preencher com 1.00).
    //"I012"
//    NUM_ORD      : string;
//    NAT_LIVR     : string;
//    TIPO         : string;
//    COD_HASH_AUX : string;


    //REG "I050"
    DT_ALT      : string;//Data da inclusão/alteração.
    COD_NAT     : string;//Código da natureza da conta/grupo de contas, conforme tabela publicada pelo Sped.
    IND_CTA     : string;//Indicador do tipo de conta: S - Sintética (grupo de contas); A - Analítica (conta).
    NIVEL       : string;//Nível da conta analítica/grupo de contas.
    COD_CTA     : string;//Código da conta analítica/grupo de contas.
    COD_CTA_SUP : string;//Código da conta sintética /grupo de contas de nível imediatamente superior.
    CTA         : string;//Nome da conta analítica/grupo de contas.


    //REG "I051".
    COD_ENT_REF : string;//Código da instituição responsável pela manutenção do plano de contas referencial.
    COD_CCUS    : string;//Código do centro de custo.
    COD_CTA_REF : string;//Código da conta de acordo com o plano de contas referencial, conforme tabela publicada pelos órgãos indicados no campo 02- COD_ENT_REF.

    //REG "I052".
    COD_CCUS_DET : string;//Código do centro de custo.
    COD_AGL      : string;//Código de aglutinação utilizado no Balanço Patrimonial e na Demonstração de Resultado do Exercício no Bloco J (somente para as contas analíticas).

    //REG "I075".
    COD_HIST     : string;//Código do histórico padronizado.
    DESCR_HIST   : string;//Descrição do histórico padronizado.

    //REG "I100".
    //* Já existiam os campos
//    DT_ALT       : string;//Data da inclusão/alteração.
//    COD_CCUS     : string;//Código do centro de custos.
    CCUS         : string;//Nome do centro de custos.
end;

  //REGISTRO I030: TERMO DE ABERTURA
  TI030 = record
    DNRC_ABERT  : string;//Texto fixo contendo “TERMO DE ABERTURA”.
    NUM_ORD     : string;//Número de ordem do instrumento de escrituração.
    NAT_LIVR    : string;//Natureza do livro; finalidade a que se destina o instrumento.
    QTD_LIN     : string;//Quantidade total de linhas do arquivo digital.
    NOME        : string;//Nome empresarial.
    NIRE        : string;//Número de Identificação do Registro de Empresas da Junta Comercial.
    CNPJ        : string;//Número de inscrição no CNPJ .
    DT_ARQ      : string;//Data do arquivamento dos atos constitutivos.
    DT_ARQ_CONV : string;//Data de arquivamento do ato de conversão de sociedade simples em sociedade empresária.
    DESC_MUN    : string;//Município.
end;

  TMovimento = record
    //REG "I200".
    NUM_LCTO  : string;//Número ou Código de identificação única do lançamento contábil.
    DT_LCTO   : string;//Data do lançamento.
    VL_LCTO   : string;//Valor do lançamento
    IND_LCTO  : string;//Indicador do tipo de lançamento:
                       //N - Lançamento normal (todos os lançamentos, exceto os de encerramento das contas de resultado);
                       //E - Lançamento de encerramento de contas de resultado.
    //REG "I250".
    COD_CTA      : string;//Código da conta analítica debitada/creditada.
    COD_CCUS     : string;//Código do centro de custos.
    VL_DC        : string;//Valor da partida.
    IND_DC       : string;//Indicador da natureza da partida:
                                                           //D - Débito;
                                                           //C - Crédito.
    NUM_ARQ      : string;//Número, Código ou caminho de localização dos documentos arquivados.
    COD_HIST_PAD : string;//Código do histórico padrão, conforme tabela I075.
    HIST         : string;//Histórico completo da partida ou histórico complementar.
    COD_PART     : string;//Código de identificação do participante na partida conforme tabela 0150
                          //(preencher somente quando identificado o tipo de participação no registro 0180).
    COD_CTA_02   : string;//COD_CTA posterior para adiconar no campo "IdContraPartida" da tabela "lancamento"
end;

  TSaldoContas = record
    //REG "I350".
    DT_RES : string; //Data da apuração do resultado.
    //REG "I355".
    COD_CTA  : string;//Código da conta analítica de resultado.
    COD_CCUS : string;//Código do centro de custos.
    VL_CTA   : string;//Valor do saldo final antes do lançamento de encerramento.
    IND_DC   : string;//Indicador da situação do saldo final: D - Devedor; C - Credor.
end;

//  TSaldoPeriodico = record
//    DT_INI     : string;
//    COD_CTA    : string;
//    COD_CCUS   : string;
//    VL_SLD_INI : string;
//    IND_DC_INI : string;
//    VL_DEB     : string;
//    VL_CRED    : string;
//    VL_SLD_FIN : string;
//    IND_DC_FIN : string;
//end;

  TContador = record
    IDENT_NOM    : string;//Nome do signatário.
    IDENT_CPF    : string;//CPF.
    IDENT_QUALIF : string;//Qualificação do assinante, conforme tabela do Departamento Nacional de Registro do Comércio – DNRC.
    COD_ASSIM    : string;//Código de qualificação do assinante, conforme tabela do Departamento Nacional de Registro do Comércio – DNRC.
    IND_CRC      : string;//(Redação dada pela IN RFB nº 926/09) Número de inscrição do contabilista no Conselho Regional de Contabilidade.
end;

const
  cLibraryName  = 'SPEDCONT';
  DATABASE_NAME = 'SPEDCONT';
  cVersion      = '5.13.10.1';
//  CDatabaseFile : string = 'SPEDCONT.GDB';
  DRIVE_NAME    = 'STANDARD';
  DB_EXTENSION  = '.DB';

  //Nome das Tabelas
  TableName_01  = 'EMPRESAS';
  TableName_02  = 'CONTAS';
  TableName_03  = 'HISTPADRAO';
  TableName_04  = 'CCUSTO';
  TableName_05  = 'MOVIMENTO';
  TableName_06  = 'SALDOCONTAS';
//  TableName_07  : string = 'LOTE';
  TableName_07  = 'PLANCONTAS';
  TableName_08  = 'PLANCCUSTO';
  TableName_09  = 'CONTADOR';
  TableName_10  = 'TERMOABERTURA';

implementation

end.
