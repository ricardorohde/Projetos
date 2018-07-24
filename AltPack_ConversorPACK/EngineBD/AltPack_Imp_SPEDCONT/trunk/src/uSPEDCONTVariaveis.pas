unit uSPEDCONTVariaveis;

interface

uses
  SysUtils, StdCtrls, DBTables, Windows, Classes, DB, StrUtils,
  Variants, ExtCtrls,  Controls, Dialogs, Alterdata, AltFStatus, AlterdataTypes,
  ComCtrls, Forms, ComObj, ActiveX;

Type
  TRegistro_0  = record
    //REG "0000"
    NOME         : string;//Nome empresarial do empres�rio ou sociedade empres�ria.
    DT_INI       : TDateTime;//Data inicial das informa��es contidas no arquivo.
    DT_FIN       : TDateTime;//Data final das informa��es contidas no arquivo.
    IND_SIT_ESP  : string;//Indicador de situa��o especial (conforme tabela publicada pelo Sped).
    UF           : string;//Sigla da unidade da federa��o do empres�rio ou sociedade empres�ria.
    IM           : string;//Inscri��o Municipal do empres�rio ou sociedade empres�ria.
    IE           : string;//Inscri��o Estadual do empres�rio ou sociedade empres�ria.
    CNPJ         : string;//N�mero de inscri��o do empres�rio ou sociedade empres�ria no CNPJ.
    COD_MUN      : string;//C�digo do munic�pio do domic�lio fiscal do empres�rio ou sociedade empres�ria, conforme tabela do IBGE - Instituto Brasileiro de Geografia e Estat�stica.

    IdPlanoContas: string;
    //REG "0001"
    IND_DAD      : string;//Indicador de movimento:
                          //0- Bloco com dados informados;
                          //1- Bloco sem dados informados.

    //REG "0007"
    COD_ENT_REF  : string;//C�digo da institui��o respons�vel pela administra��o do cadastro (conforme tabela publicada pelo Sped).
    COD_INSCR    : string;//C�digo cadastral do empres�rio ou sociedade empres�ria na institui��o identificada no campo 02.
    //REG "180"
    COD_REL      : string;//C�digo do relacionamento conforme tabela publicada pelo Sped.
    DT_INI_REL   : string;//Data do in�cio do relacionamento.
    DT_FIN_REL   : string;//Data do t�rmino do relacionamento.
end;

  TRegistro_I  = record
    //REG "I001"
    IND_DAD      : string;//Indicador de movimento:
                          //0- Bloco com dados informados;
                          //1- Bloco sem dados informados.

    //REG "I010"
    IND_ESC      : string;//Indicador da forma de escritura��o cont�bil:
                          //G - Livro Di�rio  (Completo sem escritura��o auxiliar);
                          //R - Livro Di�rio  com Escritura��o Resumida (com escritura��o auxiliar);
                          //A - Livro Di�rio Auxiliar ao Di�rio com Escritura��o Resumida;
                          //B - Livro Balancetes Di�rios e Balan�os;
                          //Z - Raz�o Auxiliar (Livro Cont�bil Auxiliar conforme leiaute definido nos registros I500 a I555).
    COD_VER_LC   : string;//C�digo da Vers�o do Leiaute Cont�bil (preencher com 1.00).
    //"I012"
//    NUM_ORD      : string;
//    NAT_LIVR     : string;
//    TIPO         : string;
//    COD_HASH_AUX : string;


    //REG "I050"
    DT_ALT      : string;//Data da inclus�o/altera��o.
    COD_NAT     : string;//C�digo da natureza da conta/grupo de contas, conforme tabela publicada pelo Sped.
    IND_CTA     : string;//Indicador do tipo de conta: S - Sint�tica (grupo de contas); A - Anal�tica (conta).
    NIVEL       : string;//N�vel da conta anal�tica/grupo de contas.
    COD_CTA     : string;//C�digo da conta anal�tica/grupo de contas.
    COD_CTA_SUP : string;//C�digo da conta sint�tica /grupo de contas de n�vel imediatamente superior.
    CTA         : string;//Nome da conta anal�tica/grupo de contas.


    //REG "I051".
    COD_ENT_REF : string;//C�digo da institui��o respons�vel pela manuten��o do plano de contas referencial.
    COD_CCUS    : string;//C�digo do centro de custo.
    COD_CTA_REF : string;//C�digo da conta de acordo com o plano de contas referencial, conforme tabela publicada pelos �rg�os indicados no campo 02- COD_ENT_REF.

    //REG "I052".
    COD_CCUS_DET : string;//C�digo do centro de custo.
    COD_AGL      : string;//C�digo de aglutina��o utilizado no Balan�o Patrimonial e na Demonstra��o de Resultado do Exerc�cio no Bloco J (somente para as contas anal�ticas).

    //REG "I075".
    COD_HIST     : string;//C�digo do hist�rico padronizado.
    DESCR_HIST   : string;//Descri��o do hist�rico padronizado.

    //REG "I100".
    //* J� existiam os campos
//    DT_ALT       : string;//Data da inclus�o/altera��o.
//    COD_CCUS     : string;//C�digo do centro de custos.
    CCUS         : string;//Nome do centro de custos.
end;

  //REGISTRO I030: TERMO DE ABERTURA
  TI030 = record
    DNRC_ABERT  : string;//Texto fixo contendo �TERMO DE ABERTURA�.
    NUM_ORD     : string;//N�mero de ordem do instrumento de escritura��o.
    NAT_LIVR    : string;//Natureza do livro; finalidade a que se destina o instrumento.
    QTD_LIN     : string;//Quantidade total de linhas do arquivo digital.
    NOME        : string;//Nome empresarial.
    NIRE        : string;//N�mero de Identifica��o do Registro de Empresas da Junta Comercial.
    CNPJ        : string;//N�mero de inscri��o no CNPJ .
    DT_ARQ      : string;//Data do arquivamento dos atos constitutivos.
    DT_ARQ_CONV : string;//Data de arquivamento do ato de convers�o de sociedade simples em sociedade empres�ria.
    DESC_MUN    : string;//Munic�pio.
end;

  TMovimento = record
    //REG "I200".
    NUM_LCTO  : string;//N�mero ou C�digo de identifica��o �nica do lan�amento cont�bil.
    DT_LCTO   : string;//Data do lan�amento.
    VL_LCTO   : string;//Valor do lan�amento
    IND_LCTO  : string;//Indicador do tipo de lan�amento:
                       //N - Lan�amento normal (todos os lan�amentos, exceto os de encerramento das contas de resultado);
                       //E - Lan�amento de encerramento de contas de resultado.
    //REG "I250".
    COD_CTA      : string;//C�digo da conta anal�tica debitada/creditada.
    COD_CCUS     : string;//C�digo do centro de custos.
    VL_DC        : string;//Valor da partida.
    IND_DC       : string;//Indicador da natureza da partida:
                                                           //D - D�bito;
                                                           //C - Cr�dito.
    NUM_ARQ      : string;//N�mero, C�digo ou caminho de localiza��o dos documentos arquivados.
    COD_HIST_PAD : string;//C�digo do hist�rico padr�o, conforme tabela I075.
    HIST         : string;//Hist�rico completo da partida ou hist�rico complementar.
    COD_PART     : string;//C�digo de identifica��o do participante na partida conforme tabela 0150
                          //(preencher somente quando identificado o tipo de participa��o no registro 0180).
    COD_CTA_02   : string;//COD_CTA posterior para adiconar no campo "IdContraPartida" da tabela "lancamento"
end;

  TSaldoContas = record
    //REG "I350".
    DT_RES : string; //Data da apura��o do resultado.
    //REG "I355".
    COD_CTA  : string;//C�digo da conta anal�tica de resultado.
    COD_CCUS : string;//C�digo do centro de custos.
    VL_CTA   : string;//Valor do saldo final antes do lan�amento de encerramento.
    IND_DC   : string;//Indicador da situa��o do saldo final: D - Devedor; C - Credor.
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
    IDENT_NOM    : string;//Nome do signat�rio.
    IDENT_CPF    : string;//CPF.
    IDENT_QUALIF : string;//Qualifica��o do assinante, conforme tabela do Departamento Nacional de Registro do Com�rcio � DNRC.
    COD_ASSIM    : string;//C�digo de qualifica��o do assinante, conforme tabela do Departamento Nacional de Registro do Com�rcio � DNRC.
    IND_CRC      : string;//(Reda��o dada pela IN RFB n� 926/09) N�mero de inscri��o do contabilista no Conselho Regional de Contabilidade.
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
