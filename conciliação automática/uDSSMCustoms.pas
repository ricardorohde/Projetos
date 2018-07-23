unit uDSSMCustoms;

interface

uses
  SysUtils, Classes, DSServer, FMTBcd, Provider, DB, DBClient, Variants, Math,
  SqlExpr, uDMInterface, DBXInterBase, DBXFirebird, uTypes, SqlTimSt, DateUtils;

type
  TDSSMCustoms = class(TDSServerModule)
    SQLConnection1: TSQLConnection;
    sqlMetas_Vendas_Dados_Santana: TSQLDataSet;
    dspMetas_Vendas_Dados_Santana: TDataSetProvider;
    sqlMetas_Vendas_Itens_Santana: TSQLDataSet;
    dtsMetas_Vendas_Dados_Santana: TDataSource;
    sqlCampanhas_Dados_Santana: TSQLDataSet;
    dspCampanhas_Dados_Santana: TDataSetProvider;
    dtsCampanhas_Dados_Santana: TDataSource;
    sqlMetas_Vendas_Dados_SantanaEMPRESA: TStringField;
    sqlMetas_Vendas_Dados_SantanaFILIAL: TStringField;
    sqlMetas_Vendas_Dados_SantanaCODIGO: TIntegerField;
    sqlMetas_Vendas_Dados_SantanaDESCRICAO: TStringField;
    sqlMetas_Vendas_Dados_SantanaPERIODODE: TDateField;
    sqlMetas_Vendas_Dados_SantanaPERIODOATE: TDateField;
    sqlMetas_Vendas_Dados_SantanaMETA: TFloatField;
    sqlMetas_Vendas_Dados_SantanaDATACRIACAO: TSQLTimeStampField;
    sqlMetas_Vendas_Itens_SantanaEMPRESA: TStringField;
    sqlMetas_Vendas_Itens_SantanaFILIAL: TStringField;
    sqlMetas_Vendas_Itens_SantanaCODIGO: TIntegerField;
    sqlMetas_Vendas_Itens_SantanaVENDEDOR: TIntegerField;
    sqlMetas_Vendas_Itens_SantanaMETA: TFloatField;
    sqlMetas_Vendas_Itens_SantanaPERCENTUAL: TStringField;
    sqlMetas_Vendas_Itens_SantanaDATACRIACAO: TSQLTimeStampField;
    sqlCampanhas_Dados_SantanaEMPRESA: TStringField;
    sqlCampanhas_Dados_SantanaFILIAL: TStringField;
    sqlCampanhas_Dados_SantanaCODIGO: TIntegerField;
    sqlCampanhas_Dados_SantanaDESCRICAO: TStringField;
    sqlCampanhas_Dados_SantanaINICIO: TDateField;
    sqlCampanhas_Dados_SantanaFINAL: TDateField;
    sqlCampanhas_Dados_SantanaDATACRIACAO: TSQLTimeStampField;
    sqlCotacoes_Vendas: TSQLDataSet;
    sqlCotacoes_VendasEMPRESA: TStringField;
    sqlCotacoes_VendasFILIAL: TStringField;
    sqlCotacoes_VendasSITUACAO: TStringField;
    sqlCotacoes_VendasNUMERO: TIntegerField;
    sqlCotacoes_VendasEMISSAO: TDateField;
    sqlCotacoes_VendasHORA: TStringField;
    sqlCotacoes_VendasCLIENTE: TIntegerField;
    sqlCotacoes_VendasFORMARECEBIMENTO: TStringField;
    sqlCotacoes_VendasTIPO: TStringField;
    sqlCotacoes_VendasNUMEROORCAMENTO: TIntegerField;
    sqlCotacoes_VendasDATACRIACAO: TSQLTimeStampField;
    dspCotacoes_Vendas: TDataSetProvider;
    sqlLista_Faltas: TSQLDataSet;
    sqlLista_FaltasEMPRESA: TStringField;
    sqlLista_FaltasFILIAL: TStringField;
    sqlLista_FaltasORIGEM: TStringField;
    sqlLista_FaltasSITUACAO: TStringField;
    sqlLista_FaltasDATA: TDateField;
    sqlLista_FaltasDOCUMENTO: TIntegerField;
    sqlLista_FaltasPRODUTO: TStringField;
    sqlLista_FaltasLOCAL: TStringField;
    sqlLista_FaltasDPRODUTO: TStringField;
    sqlLista_FaltasCOMPONENTE: TStringField;
    sqlLista_FaltasDCOMPONENTE: TStringField;
    sqlLista_FaltasPROPRIETARIO: TIntegerField;
    sqlLista_FaltasQUANTIDADE: TFloatField;
    sqlLista_FaltasSALDO: TFloatField;
    sqlLista_FaltasOBSERVACAO: TStringField;
    sqlLista_FaltasVENDEDOR: TIntegerField;
    sqlLista_FaltasDATACRIACAO: TSQLTimeStampField;
    dspLista_Faltas: TDataSetProvider;
    sqlImportacoes_Santana: TSQLDataSet;
    dspImportacoes_Santana: TDataSetProvider;
    dtsImportacoes_Historicos: TDataSource;
    sqlImportacoes_Historicos: TSQLDataSet;
    dtsImportacoes_Fornecedor: TDataSource;
    sqlImportacoes_Fornecedor: TSQLDataSet;
    sqlImportacoes_HistoricosEMPRESA: TStringField;
    sqlImportacoes_HistoricosFILIAL: TStringField;
    sqlImportacoes_HistoricosNUMERO: TIntegerField;
    sqlImportacoes_HistoricosITEM: TIntegerField;
    sqlImportacoes_HistoricosDATA: TDateField;
    sqlImportacoes_HistoricosHISTORICO: TStringField;
    sqlImportacoes_HistoricosUSUARIO: TStringField;
    sqlImportacoes_HistoricosDATACRIACAO: TSQLTimeStampField;
    sqlImportacoes_FornecedorEMPRESA: TStringField;
    sqlImportacoes_FornecedorFILIAL: TStringField;
    sqlImportacoes_FornecedorNUMERO: TIntegerField;
    sqlImportacoes_FornecedorFORNECEDOR: TIntegerField;
    sqlImportacoes_FornecedorINVOICE: TStringField;
    sqlImportacoes_FornecedorVALOR: TFloatField;
    sqlImportacoes_FornecedorPESO: TFloatField;
    sqlImportacoes_FornecedorCUBAGEM: TFloatField;
    sqlImportacoes_FornecedorTIPOFRETE: TStringField;
    sqlImportacoes_FornecedorARQUIVOINVOICE: TStringField;
    sqlImportacoes_FornecedorARQUIVOPACKINLIST: TStringField;
    sqlImportacoes_FornecedorARQUIVONCM: TStringField;
    sqlImportacoes_FornecedorRECINVOICE: TStringField;
    sqlImportacoes_FornecedorRECPACK: TStringField;
    sqlImportacoes_FornecedorRECNCM: TStringField;
    sqlImportacoes_FornecedorRECORIGINAL: TStringField;
    sqlImportacoes_FornecedorDATACRIACAO: TSQLTimeStampField;
    sqlImportacoes_SantanaEMPRESA: TStringField;
    sqlImportacoes_SantanaFILIAL: TStringField;
    sqlImportacoes_SantanaNUMERO: TIntegerField;
    sqlImportacoes_SantanaSITUACAO: TStringField;
    sqlImportacoes_SantanaPROCESSO: TStringField;
    sqlImportacoes_SantanaBL: TStringField;
    sqlImportacoes_SantanaDATACADASTRO: TDateField;
    sqlImportacoes_SantanaDATAEMBARQUE: TDateField;
    sqlImportacoes_SantanaDATACHEGADA: TDateField;
    sqlImportacoes_SantanaNOMENAVIO: TStringField;
    sqlImportacoes_SantanaTIPOFRETE: TStringField;
    sqlImportacoes_SantanaAGENTECARGA: TStringField;
    sqlImportacoes_SantanaPORTOORIGEM: TStringField;
    sqlImportacoes_SantanaOBSERVACAO: TStringField;
    sqlImportacoes_SantanaDATACRIACAO: TSQLTimeStampField;
    sqlImportacoes_Forn_Hist: TSQLDataSet;
    dtsImportacoes_Forn_Hist: TDataSource;
    sqlImportacoes_Forn_HistEMPRESA: TStringField;
    sqlImportacoes_Forn_HistFILIAL: TStringField;
    sqlImportacoes_Forn_HistNUMERO: TIntegerField;
    sqlImportacoes_Forn_HistFORNECEDOR: TIntegerField;
    sqlImportacoes_Forn_HistITEM: TIntegerField;
    sqlImportacoes_Forn_HistDATA: TDateField;
    sqlImportacoes_Forn_HistHISTORICO: TStringField;
    sqlImportacoes_Forn_HistUSUARIO: TStringField;
    sqlImportacoes_Forn_HistDATACRIACAO: TSQLTimeStampField;
    sqlImportacoes_SantanaVALORFRETE: TFloatField;
    sqlImportacoes_SantanaTIPOCONTAINER: TStringField;
    sqlImportacoes_SantanaBLAPROVADO: TStringField;
    sqlImportacoes_FornecedorPEDIDOCOMPRA1: TIntegerField;
    sqlImportacoes_FornecedorPEDIDOCOMPRA2: TIntegerField;
    sqlImportacoes_FornecedorPEDIDOCOMPRA3: TIntegerField;
    sqlImportacoes_FornecedorPEDIDOCOMPRA4: TIntegerField;
    sqlImportacoes_FornecedorPEDIDOCOMPRA5: TIntegerField;
    sqlImportacoes_FornecedorPEDIDOCOMPRA6: TIntegerField;
    sqlImportacoes_SantanaBLARQUIVO: TStringField;
    sqlImportacoes_FornecedorARQUIVOBL: TStringField;
    sqlImportacoes_SantanaARQUIVONUMERARIO: TStringField;
    sqlLista_FaltasUSUARIO: TIntegerField;
    sqlPre_Compra_Dados: TSQLDataSet;
    dspPre_Compra_Dados: TDataSetProvider;
    dtsPre_Compra_Dados: TDataSource;
    sqlPre_Compra_Itens: TSQLDataSet;
    sqlPre_Compra_DadosEMPRESA: TStringField;
    sqlPre_Compra_DadosFILIAL: TStringField;
    sqlPre_Compra_DadosSITUACAO: TStringField;
    sqlPre_Compra_DadosNUMERO: TIntegerField;
    sqlPre_Compra_DadosEMISSAO: TDateField;
    sqlPre_Compra_DadosFORNECEDOR: TIntegerField;
    sqlPre_Compra_DadosOBSERVACAO: TStringField;
    sqlPre_Compra_DadosDATACRIACAO: TSQLTimeStampField;
    sqlPre_Compra_ItensEMPRESA: TStringField;
    sqlPre_Compra_ItensFILIAL: TStringField;
    sqlPre_Compra_ItensNUMERO: TIntegerField;
    sqlPre_Compra_ItensITEM: TIntegerField;
    sqlPre_Compra_ItensPRODUTO: TStringField;
    sqlPre_Compra_ItensDESCRICAO: TStringField;
    sqlPre_Compra_ItensQUANTIDADEAEREO: TFloatField;
    sqlPre_Compra_ItensQUANTIDADEMARITIMO: TFloatField;
    sqlPre_Compra_ItensUNITARIO: TFloatField;
    sqlPre_Compra_ItensUNITARIOMOEDA: TFloatField;
    sqlPre_Compra_ItensTARGET: TFloatField;
    sqlPre_Compra_ItensTOTAL: TFloatField;
    sqlPre_Compra_ItensDATACRIACAO: TSQLTimeStampField;
    sqlPre_Compra_DadosUF: TStringField;
    sqlPre_Compra_DadosVALORMARITIMO: TFloatField;
    sqlPre_Compra_DadosVALORAEREO: TFloatField;
    sqlPre_Compra_DadosVALORTOTAL: TFloatField;
    sqlProdutos_Informacoes: TSQLDataSet;
    dspProdutos_Informacoes: TDataSetProvider;
    sqlProdutos_InformacoesEMPRESA: TStringField;
    sqlProdutos_InformacoesFILIAL: TStringField;
    sqlProdutos_InformacoesPRODUTO: TStringField;
    sqlProdutos_InformacoesMENSAGEM: TStringField;
    sqlProdutos_InformacoesDATACADASTRO: TDateField;
    sqlProdutos_InformacoesUSUARIO: TIntegerField;
    sqlProdutos_InformacoesDATACRIACAO: TSQLTimeStampField;
    sqlProdutos_InformacoesSITUACAO: TStringField;
    sqlCategorias_Grupos: TSQLDataSet;
    dspCategorias_Grupos: TDataSetProvider;
    sqlCategorias_GruposEMPRESA: TStringField;
    sqlCategorias_GruposFILIAL: TStringField;
    sqlCategorias_GruposCODIGO: TStringField;
    sqlCategorias_GruposDESCRICAO: TStringField;
    sqlCategorias_GruposTIPONAT: TStringField;
    sqlCategorias_GruposDATACRIACAO: TSQLTimeStampField;
    sqlPre_Compra_ItensMARCA: TStringField;
    sqlPre_Compra_ItensMULTIPLO: TFloatField;
    sqlPre_Compra_ItensEMBALAGEM: TStringField;
    sqlPre_Compra_DadosVALORMARITIMODOLAR: TFloatField;
    sqlPre_Compra_DadosVALORAEREODOLAR: TFloatField;
    sqlPre_Compra_DadosVALORTOTALDOLAR: TFloatField;
    sqlPre_Compra_ItensTOTALDOLAR: TFloatField;
    sqlCotacao_Rapida_Dados: TSQLDataSet;
    dspCotacao_Rapida_Dados: TDataSetProvider;
    cdsCotacao_RapidaEMPRESA: TStringField;
    cdsCotacao_RapidaFILIAL: TStringField;
    cdsCotacao_RapidaSTATUS: TStringField;
    cdsCotacao_RapidaDATACADASTRO: TDateField;
    cdsCotacao_RapidaNUMERO: TIntegerField;
    cdsCotacao_RapidaCLIENTE: TIntegerField;
    sqlCotacao_Rapida_DadosTRANSPORTADORA: TIntegerField;
    sqlCotacao_Rapida_DadosCONDICAOPAGAMENTO: TIntegerField;
    sqlCotacao_Rapida_DadosFORMAPAGAMENTO: TStringField;
    sqlCotacao_Rapida_DadosVENDEDOR: TIntegerField;
    sqlCotacao_Rapida_DadosNOMEVENDEDOR: TStringField;
    sqlCotacao_Rapida_DadosTIPOPRECO: TStringField;
    sqlCotacao_Rapida_DadosDATACRIACAO: TSQLTimeStampField;
    dtsCotacao_Rapida_Itens: TDataSource;
    sqlCotacao_Rapida_Itens: TSQLDataSet;
    sqlCotacao_Rapida_ItensEMPRESA: TStringField;
    sqlCotacao_Rapida_ItensFILIAL: TStringField;
    sqlCotacao_Rapida_ItensNUMERO: TIntegerField;
    sqlCotacao_Rapida_ItensITEM: TIntegerField;
    sqlCotacao_Rapida_ItensPRODUTO: TStringField;
    sqlCotacao_Rapida_ItensDESCRICAO: TStringField;
    sqlCotacao_Rapida_ItensQUANTIDADE: TFloatField;
    sqlCotacao_Rapida_ItensTARGET: TFloatField;
    sqlCotacao_Rapida_ItensUNITARIO: TFloatField;
    sqlCotacao_Rapida_ItensLOCAL: TStringField;
    sqlCotacao_Rapida_ItensREGRA: TIntegerField;
    sqlCotacao_Rapida_ItensCLASSIFICACAOFISCAL: TStringField;
    sqlCotacao_Rapida_ItensCODIGOFISCAL: TStringField;
    sqlCotacao_Rapida_ItensMARGEMLUCRO: TFloatField;
    sqlCotacao_Rapida_ItensIPI: TFloatField;
    sqlCotacao_Rapida_ItensBASEIPI: TFloatField;
    sqlCotacao_Rapida_ItensVALORIPI: TFloatField;
    sqlCotacao_Rapida_ItensCSTIPI: TStringField;
    sqlCotacao_Rapida_ItensICMS: TFloatField;
    sqlCotacao_Rapida_ItensBASEICMS: TFloatField;
    sqlCotacao_Rapida_ItensVALORICMS: TFloatField;
    sqlCotacao_Rapida_ItensORIGEMST: TStringField;
    sqlCotacao_Rapida_ItensCSTICMS: TStringField;
    sqlCotacao_Rapida_ItensBASEICMSST: TFloatField;
    sqlCotacao_Rapida_ItensVALORICMSST: TFloatField;
    sqlCotacao_Rapida_ItensISS: TFloatField;
    sqlCotacao_Rapida_ItensBASEISSA: TFloatField;
    sqlCotacao_Rapida_ItensVALORISSA: TFloatField;
    sqlCotacao_Rapida_ItensBASEISSR: TFloatField;
    sqlCotacao_Rapida_ItensVALORISSR: TFloatField;
    sqlCotacao_Rapida_ItensPISA: TFloatField;
    sqlCotacao_Rapida_ItensBASEPISA: TFloatField;
    sqlCotacao_Rapida_ItensVALORPISA: TFloatField;
    sqlCotacao_Rapida_ItensPISR: TFloatField;
    sqlCotacao_Rapida_ItensBASEPISR: TFloatField;
    sqlCotacao_Rapida_ItensVALORPISR: TFloatField;
    sqlCotacao_Rapida_ItensCOFINSA: TFloatField;
    sqlCotacao_Rapida_ItensBASECOFINSA: TFloatField;
    sqlCotacao_Rapida_ItensVALORCOFINSA: TFloatField;
    sqlCotacao_Rapida_ItensCOFINSR: TFloatField;
    sqlCotacao_Rapida_ItensBASECOFINSR: TFloatField;
    sqlCotacao_Rapida_ItensVALORCOFINSR: TFloatField;
    sqlCotacao_Rapida_ItensTIPOPRECO: TStringField;
    sqlCotacao_Rapida_ItensCSLLR: TFloatField;
    sqlCotacao_Rapida_ItensBASECSLLR: TFloatField;
    sqlCotacao_Rapida_ItensVALORCSLLR: TFloatField;
    sqlCotacao_Rapida_ItensIRRF: TFloatField;
    sqlCotacao_Rapida_ItensBASEIRRFA: TFloatField;
    sqlCotacao_Rapida_ItensVALORIRRFA: TFloatField;
    sqlCotacao_Rapida_ItensBASEIRRFR: TFloatField;
    sqlCotacao_Rapida_ItensVALORIRRFR: TFloatField;
    sqlCotacao_Rapida_ItensINSS: TFloatField;
    sqlCotacao_Rapida_ItensBASEINSSA: TFloatField;
    sqlCotacao_Rapida_ItensVALORINSSA: TFloatField;
    sqlCotacao_Rapida_ItensBASEINSSR: TFloatField;
    sqlCotacao_Rapida_ItensVALORINSSR: TFloatField;
    sqlCotacao_Rapida_ItensDATACRIACAO: TSQLTimeStampField;
    sqlPre_Compra_ItensUSUARIO: TIntegerField;
    sqlReclamacoes_Dados_Santana: TSQLDataSet;
    dspReclamacoes_Dados_Santana: TDataSetProvider;
    sqlReclamacoes_Dados_SantanaEMPRESA: TStringField;
    sqlReclamacoes_Dados_SantanaFILIAL: TStringField;
    sqlReclamacoes_Dados_SantanaPROTOCOLO: TIntegerField;
    sqlReclamacoes_Dados_SantanaSTATUSPRINCIPAL: TStringField;
    sqlReclamacoes_Dados_SantanaSTATUSSECUNDARIO: TStringField;
    sqlReclamacoes_Dados_SantanaDATAHORA: TSQLTimeStampField;
    sqlReclamacoes_Dados_SantanaCLIENTE: TIntegerField;
    sqlReclamacoes_Dados_SantanaUSUARIO: TIntegerField;
    sqlReclamacoes_Dados_SantanaCANALCONTATO: TStringField;
    sqlReclamacoes_Dados_SantanaMOTIVO: TStringField;
    sqlReclamacoes_Dados_SantanaRECLAMACAO: TStringField;
    sqlReclamacoes_Dados_SantanaLIMITESOLUCAO: TSQLTimeStampField;
    sqlReclamacoes_Dados_SantanaDATACRIACAO: TSQLTimeStampField;
    sqlReclamacoes_Dados_SantanaNOMECLIENTE: TStringField;
    dtsReclamacoes_Dados_Santana: TDataSource;
    sqlReclamacoes_Itens_Santana: TSQLDataSet;
    sqlReclamacoes_Itens_SantanaEMPRESA: TStringField;
    sqlReclamacoes_Itens_SantanaFILIAL: TStringField;
    sqlReclamacoes_Itens_SantanaPROTOCOLO: TIntegerField;
    sqlReclamacoes_Itens_SantanaITEM: TIntegerField;
    sqlReclamacoes_Itens_SantanaCOMENTARIO: TStringField;
    sqlReclamacoes_Itens_SantanaSETOR: TStringField;
    sqlReclamacoes_Itens_SantanaDATACRIACAO: TSQLTimeStampField;
    sqlReclamacoes_Itens_SantanaUSUARIO: TIntegerField;
    sqlControle_Embalagens_Dados: TSQLDataSet;
    dspControle_Embalagens_Dados: TDataSetProvider;
    dtsControle_Embalagens_Dados: TDataSource;
    sqlControle_Embalagens_Revisoes: TSQLDataSet;
    sqlControle_Embalagens_DadosEMPRESA: TStringField;
    sqlControle_Embalagens_DadosFILIAL: TStringField;
    sqlControle_Embalagens_DadosMODELO: TStringField;
    sqlControle_Embalagens_DadosDATAPEDIDO: TDateField;
    sqlControle_Embalagens_DadosSOLICITACAO: TDateField;
    sqlControle_Embalagens_DadosPRODUTO: TStringField;
    sqlControle_Embalagens_DadosCODIGOBARRAS: TStringField;
    sqlControle_Embalagens_DadosDOCUMENTO: TStringField;
    sqlControle_Embalagens_DadosADICIONAIS: TMemoField;
    sqlControle_Embalagens_DadosESPECIFICACOES: TMemoField;
    sqlControle_Embalagens_DadosRESPONSAVELCONFERENCIA: TStringField;
    sqlControle_Embalagens_DadosENTREGACONFERENCIA: TDateField;
    sqlControle_Embalagens_DadosMULTIPLO: TFloatField;
    sqlControle_Embalagens_DadosUNIDADEMEDIDA: TStringField;
    sqlControle_Embalagens_DadosARQUIVODIECUT: TStringField;
    sqlControle_Embalagens_DadosDATACRIACAO: TSQLTimeStampField;
    sqlControle_Embalagens_RevisoesEMPRESA: TStringField;
    sqlControle_Embalagens_RevisoesFILIAL: TStringField;
    sqlControle_Embalagens_RevisoesDOCUMENTO: TStringField;
    sqlControle_Embalagens_RevisoesREVISAO: TIntegerField;
    sqlControle_Embalagens_RevisoesDESCRICAO: TStringField;
    dtsReclamacoes_Correcoes_Santana: TDataSource;
    sqlReclamacoes_Cor_Santana: TSQLDataSet;
    sqlReclamacoes_Cor_SantanaEMPRESA: TStringField;
    sqlReclamacoes_Cor_SantanaFILIAL: TStringField;
    sqlReclamacoes_Cor_SantanaPROTOCOLO: TIntegerField;
    sqlReclamacoes_Cor_SantanaNUMERO: TIntegerField;
    sqlReclamacoes_Cor_SantanaSTATUS: TStringField;
    sqlReclamacoes_Cor_SantanaCLIENTE: TIntegerField;
    sqlReclamacoes_Cor_SantanaNOMECLIENTE: TStringField;
    sqlReclamacoes_Cor_SantanaDATACADASTRO: TSQLTimeStampField;
    sqlReclamacoes_Cor_SantanaPRODUTO: TStringField;
    sqlReclamacoes_Cor_SantanaDESCRICAO: TStringField;
    sqlReclamacoes_Cor_SantanaITEM1: TStringField;
    sqlReclamacoes_Cor_SantanaITEM2: TStringField;
    sqlReclamacoes_Cor_SantanaITEM3: TStringField;
    sqlReclamacoes_Cor_SantanaITEM4: TStringField;
    sqlReclamacoes_Cor_SantanaITEM5: TStringField;
    sqlReclamacoes_Cor_SantanaITEM6: TStringField;
    sqlReclamacoes_Cor_SantanaITEM7: TStringField;
    sqlReclamacoes_Cor_SantanaITEM8: TStringField;
    sqlReclamacoes_Cor_SantanaITEM9: TStringField;
    sqlReclamacoes_Cor_SantanaITEM10: TStringField;
    sqlReclamacoes_Cor_SantanaDETALHE: TStringField;
    sqlReclamacoes_Cor_SantanaACAO: TStringField;
    sqlReclamacoes_Cor_SantanaDESTINO: TStringField;
    sqlReclamacoes_Cor_SantanaDATAAVALIADOR: TSQLTimeStampField;
    sqlReclamacoes_Cor_SantanaCHECKAVALIADOR: TStringField;
    sqlReclamacoes_Cor_SantanaDATAGERENTEAREA: TSQLTimeStampField;
    sqlReclamacoes_Cor_SantanaCHECKGERENTEAREA: TStringField;
    sqlReclamacoes_Cor_SantanaDATAGERENTEGERAL: TSQLTimeStampField;
    sqlReclamacoes_Cor_SantanaCHECKGERENTEGERAL: TStringField;
    sqlReclamacoes_Cor_SantanaDATACRIACAO: TSQLTimeStampField;
    sqlReclamacoes_Cor_SantanaUSUARIO: TStringField;
    sqlReclamacoes_Cor_SantanaAVALIADOR: TStringField;
    sqlReclamacoes_Cor_SantanaGERENTEAREA: TStringField;
    sqlReclamacoes_Cor_SantanaGERENTEGERAL: TStringField;
    sqlReclamacoes_Dados_SantanaDATAHORASOLUCAO: TSQLTimeStampField;
    sqlControle_Embalagens_DadosIMAGEM: TStringField;
    sqlControle_Embalagens_DadosPDFCONFERENCIA: TStringField;
    sqlControle_Embalagens_DadosDESCRICAO: TStringField;
    sqlControle_Embalagens_DadosREDUZIDO: TStringField;
    sqlControle_Embalagens_RevisoesUSUARIO: TStringField;
    sqlControle_Embalagens_RevisoesDATACRIACAO: TSQLTimeStampField;
    sqlControle_Embalagens_DadosPEDIDOCOMPRA: TIntegerField;
    sqlControle_Embalagens_DadosDATACADASTRO: TDateField;
    dspPosicao_Catalogo: TDataSetProvider;
    sqlPosicao_Catalogo: TSQLDataSet;
    sqlReclamacoes_Itens_SantanaEMAILDESTINO: TStringField;
    sqlReclamacoes_Cor_SantanaEMAILDESTINO: TStringField;
    sqlControle_Embalagens_DadosSITUACAO: TStringField;
    sqlSolicitacoes_Reposicao: TSQLDataSet;
    dspSolicitacoes_Reposicao: TDataSetProvider;
    sqlSolicitacoes_ReposicaoEMPRESA: TStringField;
    sqlSolicitacoes_ReposicaoFILIAL: TStringField;
    sqlSolicitacoes_ReposicaoNUMERO: TIntegerField;
    sqlSolicitacoes_ReposicaoSITUACAO: TStringField;
    sqlSolicitacoes_ReposicaoSETOR: TStringField;
    sqlSolicitacoes_ReposicaoDATA: TDateField;
    sqlSolicitacoes_ReposicaoPRODUTO: TStringField;
    sqlSolicitacoes_ReposicaoQUANTIDADE: TFloatField;
    sqlSolicitacoes_ReposicaoDATAATENDIDA: TDateField;
    sqlSolicitacoes_ReposicaoOBSERVACAO1: TStringField;
    sqlSolicitacoes_ReposicaoOBSERVACAO2: TStringField;
    sqlSolicitacoes_ReposicaoDATACRIACAO: TSQLTimeStampField;
    sqlSaldos_Reposicao: TSQLDataSet;
    dspSaldos_Reposicao: TDataSetProvider;
    sqlSaldos_ReposicaoEMPRESA: TStringField;
    sqlSaldos_ReposicaoFILIAL: TStringField;
    sqlSaldos_ReposicaoPRODUTO: TStringField;
    sqlSaldos_ReposicaoLOCAL: TStringField;
    sqlSaldos_ReposicaoSALDO: TFloatField;
    sqlSaldos_ReposicaoDATACRIACAO: TSQLTimeStampField;
    sqlImportacoes_FornecedorSALDO: TFloatField;
    sqlProjetos_Historicos: TSQLDataSet;
    sqlProjetos_HistoricosEMPRESA: TStringField;
    sqlProjetos_HistoricosFILIAL: TStringField;
    sqlProjetos_HistoricosNUMERO: TIntegerField;
    sqlProjetos_HistoricosSEQUENCIAL: TIntegerField;
    sqlProjetos_HistoricosDATA: TDateField;
    sqlProjetos_HistoricosHISTORICO: TStringField;
    sqlProjetos_HistoricosTIPO: TStringField;
    sqlProjetos_HistoricosNOMEUSUARIO: TStringField;
    sqlProjetos_HistoricosDATACRIACAO: TSQLTimeStampField;
    dtsProjetos: TDataSource;
    dspProjetos: TDataSetProvider;
    sqlProjetos: TSQLDataSet;
    sqlProjetosEMPRESA: TStringField;
    sqlProjetosFILIAL: TStringField;
    sqlProjetosNUMERO: TIntegerField;
    sqlProjetosCLIENTE: TIntegerField;
    sqlProjetosSTATUS: TStringField;
    sqlProjetosTIPO: TStringField;
    sqlProjetosLIDER: TIntegerField;
    sqlProjetosPREVISAOHORAS: TIntegerField;
    sqlProjetosHORASEFETIVAS: TIntegerField;
    sqlProjetosETAPA: TStringField;
    sqlProjetosDATAINICIO: TDateField;
    sqlProjetosPREVISAODATAFIM: TDateField;
    sqlProjetosDATAFIM: TDateField;
    sqlProjetosDATACRIACAO: TSQLTimeStampField;
    sqlAgendamentos_Dias: TSQLDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField3: TStringField;
    IntegerField3: TIntegerField;
    StringField4: TStringField;
    StringField5: TStringField;
    DateField1: TDateField;
    SQLTimeStampField1: TSQLTimeStampField;
    dtsAgendamento_Visitas: TDataSource;
    dspAgendamento_Visitas: TDataSetProvider;
    sqlAgendamento_Visitas: TSQLDataSet;
    sqlAgendamento_VisitasEMPRESA: TStringField;
    sqlAgendamento_VisitasFILIAL: TStringField;
    sqlAgendamento_VisitasNUMERO: TIntegerField;
    sqlAgendamento_VisitasCLIENTE: TIntegerField;
    sqlAgendamento_VisitasSITUACAO: TStringField;
    sqlAgendamento_VisitasFUNCIONARIO: TIntegerField;
    sqlAgendamento_VisitasMOTIVO: TStringField;
    sqlAgendamento_VisitasHORARIO: TStringField;
    sqlAgendamento_VisitasDATAVISITA: TDateField;
    sqlAgendamento_VisitasDATACRIACAO: TSQLTimeStampField;
    sqlTarefas_Apontamentos: TSQLDataSet;
    sqlTarefas_ApontamentosEMPRESA: TStringField;
    sqlTarefas_ApontamentosFILIAL: TStringField;
    sqlTarefas_ApontamentosNUMERO: TIntegerField;
    sqlTarefas_ApontamentosSEQUENCIAL: TIntegerField;
    sqlTarefas_ApontamentosDATA: TDateField;
    sqlTarefas_ApontamentosHISTORICO: TStringField;
    sqlTarefas_ApontamentosUSUARIO: TIntegerField;
    sqlTarefas_ApontamentosSTATUS: TStringField;
    sqlTarefas_ApontamentosDATACRIACAO: TSQLTimeStampField;
    dtsTarefas: TDataSource;
    dspTarefas: TDataSetProvider;
    sqlTarefas: TSQLDataSet;
    sqlTarefasEMPRESA: TStringField;
    sqlTarefasFILIAL: TStringField;
    sqlTarefasNUMERO: TIntegerField;
    sqlTarefasSTATUS: TStringField;
    sqlTarefasPRIORIDADE: TStringField;
    sqlTarefasTIPO: TStringField;
    sqlTarefasDATACADASTRO: TDateField;
    sqlTarefasNOME: TStringField;
    sqlTarefasDESCRICAO: TStringField;
    sqlTarefasDATAINICIO: TDateField;
    sqlTarefasDATAFIM: TDateField;
    sqlTarefasFUNCIONARIO: TIntegerField;
    sqlTarefasCRIADOR: TStringField;
    sqlTarefasUSUARIO: TIntegerField;
    sqlTarefasDATACRIACAO: TSQLTimeStampField;
    dtsSetores: TDataSource;
    dspSetores: TDataSetProvider;
    sqlSetores: TSQLDataSet;
    sqlSetoresEMPRESA: TStringField;
    sqlSetoresFILIAL: TStringField;
    sqlSetoresNUMERO: TIntegerField;
    sqlSetoresDESCRICAO: TStringField;
    dtsFuncionarios: TDataSource;
    dspFuncionarios: TDataSetProvider;
    sqlFuncionarios: TSQLDataSet;
    sqlFuncionariosEMPRESA: TStringField;
    sqlFuncionariosFILIAL: TStringField;
    sqlFuncionariosCODIGO: TIntegerField;
    sqlFuncionariosSTATUS: TStringField;
    sqlFuncionariosNOME: TStringField;
    sqlFuncionariosREDUZIDO: TStringField;
    sqlFuncionariosDATACADASTRO: TDateField;
    sqlFuncionariosDATAADMISSAO: TDateField;
    sqlFuncionariosDATADEMISSAO: TDateField;
    sqlFuncionariosENDERECO: TStringField;
    sqlFuncionariosNUMERO: TStringField;
    sqlFuncionariosCEP: TStringField;
    sqlFuncionariosMUNICIPIO: TStringField;
    sqlFuncionariosUF: TStringField;
    sqlFuncionariosDDD: TStringField;
    sqlFuncionariosTELEFONE: TStringField;
    sqlFuncionariosCELULAR: TStringField;
    sqlFuncionariosCELULAREMPRESA: TStringField;
    sqlFuncionariosEMAIL: TStringField;
    sqlFuncionariosEMAILPESSOAL: TStringField;
    sqlFuncionariosSETOR: TStringField;
    sqlFuncionariosCARGO: TStringField;
    sqlFuncionariosTIPO: TStringField;
    sqlFuncionariosHIERARQUIA: TStringField;
    sqlFuncionariosFORMACAO: TStringField;
    sqlFuncionariosCONSULTOR: TStringField;
    sqlFuncionariosDIAPAGAMENTO: TDateField;
    sqlFuncionariosHABILITADO: TStringField;
    sqlFuncionariosNUMEROHABILITACAO: TStringField;
    sqlFuncionariosBANCO: TIntegerField;
    sqlFuncionariosAGENCIA: TStringField;
    sqlFuncionariosCONTA: TStringField;
    sqlFuncionariosOBSERVACAO: TMemoField;
    sqlFuncionariosUSUARIO: TIntegerField;
    sqlFuncionariosDATACRIACAO: TSQLTimeStampField;
    sqlSolicitacoes_ReposicaoQUANTIDADEMULTIPLO: TFloatField;
    sqlSolicitacoes_ReposicaoMULTIPLO: TIntegerField;
    sqlImportacoes_Cambio: TSQLDataSet;
    StringField6: TStringField;
    StringField7: TStringField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    DateField2: TDateField;
    StringField8: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField9: TStringField;
    dspImportacoes_Cambio: TDataSetProvider;
    dspPendencias_Pedidos_Vendas: TDataSetProvider;
    sqlPendencias_Pedidos_Vendas: TSQLDataSet;
    sqlPendencias_Pedidos_VendasEMPRESA: TStringField;
    sqlPendencias_Pedidos_VendasFILIAL: TStringField;
    sqlPendencias_Pedidos_VendasNUMERO: TIntegerField;
    sqlPendencias_Pedidos_VendasPENDENCIA: TStringField;
    sqlPendencias_Pedidos_VendasSITUACAO: TStringField;
    sqlPendencias_Pedidos_VendasUSUARIO: TIntegerField;
    sqlPendencias_Pedidos_VendasVENDEDOR: TIntegerField;
    sqlPendencias_Pedidos_VendasDATACRIACAO: TSQLTimeStampField;
    sqlPendencias_Pedidos_VendasUSUARIOFECHAMENTO: TIntegerField;
    sqlPre_Compra_ItensOBSERVACAO: TStringField;
    sqlSolicitacoes_ReposicaoPEDIDO: TIntegerField;
    sqlReclamacoes_Dados_SantanaSETOR: TIntegerField;
    sqlReclamacoes_Dados_SantanaPEDIDO: TIntegerField;
    sqlReclamacoes_Dados_SantanaPROCEDE: TStringField;
    sqlConcorrentes_Dados_Santana: TSQLDataSet;
    sqlConcorrentes_Dados_SantanaEMPRESA: TStringField;
    sqlConcorrentes_Dados_SantanaFILIAL: TStringField;
    sqlConcorrentes_Dados_SantanaCODIGO: TIntegerField;
    sqlConcorrentes_Dados_SantanaDESCRICAO: TStringField;
    sqlConcorrentes_Dados_SantanaDATAINICIO: TDateField;
    sqlConcorrentes_Dados_SantanaDATAFINAL: TDateField;
    sqlConcorrentes_Dados_SantanaMOEDA: TStringField;
    sqlConcorrentes_Dados_SantanaDATACRIACAO: TSQLTimeStampField;
    dspConcorrentes_Dados_Santana: TDataSetProvider;
    dtsConcorrentes_Dados_Santana: TDataSource;
    sqlConcorrentes_Itens_Santana: TSQLDataSet;
    sqlConcorrentes_Itens_SantanaEMPRESA: TStringField;
    sqlConcorrentes_Itens_SantanaFILIAL: TStringField;
    sqlConcorrentes_Itens_SantanaCODIGO: TIntegerField;
    sqlConcorrentes_Itens_SantanaPRODUTO: TStringField;
    sqlConcorrentes_Itens_SantanaREDUZIDO: TStringField;
    sqlConcorrentes_Itens_SantanaPRECOVENDA1: TFloatField;
    sqlConcorrentes_Itens_SantanaPRECOVENDA2: TFloatField;
    sqlConcorrentes_Itens_SantanaPRECOVENDA3: TFloatField;
    sqlConcorrentes_Itens_SantanaPRECOVENDA4: TFloatField;
    sqlConcorrentes_Itens_SantanaPRECOVENDA5: TFloatField;
    sqlConcorrentes_Itens_SantanaPRECOVENDA6: TFloatField;
    sqlConcorrentes_Itens_SantanaPRECOVENDA7: TFloatField;
    sqlConcorrentes_Itens_SantanaPRECOVENDA8: TFloatField;
    sqlConcorrentes_Itens_SantanaPRECOVENDA9: TFloatField;
    sqlConcorrentes_Itens_SantanaPRECOVENDA10: TFloatField;
    sqlConcorrentes_Itens_SantanaPRECOVENDA: TFloatField;
    sqlConcorrentes_Itens_SantanaOFERTA: TFloatField;
    sqlConcorrentes_Itens_SantanaCOTACAO: TFloatField;
    sqlConcorrentes_Itens_SantanaATUALIZACAO: TDateField;
    sqlConcorrentes_Itens_SantanaVIGENCIA: TDateField;
    sqlConcorrentes_Itens_SantanaDATACRIACAO: TSQLTimeStampField;
    sqlConcorrentes_Dados_SantanaPERCENTUAL: TFloatField;
    sqlPainel_Produtos_Concorrentes: TSQLDataSet;
    dspPainel_Produtos_Concorrentes: TDataSetProvider;
    cdsConcorrentesEMPRESA: TStringField;
    cdsConcorrentesFILIAL: TStringField;
    cdsConcorrentesCODIGO: TIntegerField;
    cdsConcorrentesDESCRICAO: TStringField;
    cdsConcorrentesPRODUTO: TStringField;
    sqlPainel_Produtos_ConcorrentesPRECOVENDA: TFloatField;
    sqlPainel_Produtos_ConcorrentesOFERTA: TFloatField;
    sqlPainel_Produtos_ConcorrentesCOTACAO: TFloatField;
    sqlPainel_Produtos_ConcorrentesSTATUS: TStringField;
    sqlPainel_Produtos_ConcorrentesATUALIZACAO: TDateField;
    sqlPainel_Produtos_ConcorrentesPERCENTUAL: TFloatField;
    dspProdutos: TDataSetProvider;
    sqlProdutos: TSQLDataSet;
    sqlProdutosEMPRESA: TStringField;
    sqlProdutosFILIAL: TStringField;
    sqlProdutosSTATUS: TStringField;
    sqlProdutosCODIGO: TStringField;
    sqlProdutosDATACADASTRO: TDateField;
    sqlProdutosDESCRICAO: TStringField;
    sqlProdutosREDUZIDO: TStringField;
    sqlProdutosGRUPO: TIntegerField;
    sqlProdutosSUBGRUPO: TIntegerField;
    sqlProdutosFABRICANTE: TStringField;
    sqlProdutosMARCA: TStringField;
    sqlProdutosMODELO: TStringField;
    sqlProdutosORIGEMPRODUTO: TStringField;
    sqlProdutosNUMEROSERIE: TStringField;
    sqlProdutosLOCALIZACAO: TStringField;
    sqlProdutosREGRAENTRADA: TIntegerField;
    sqlProdutosREGRASAIDA: TIntegerField;
    sqlProdutosULTIMACOMPRA: TDateField;
    sqlProdutosULTIMOPRECO: TFloatField;
    sqlProdutosULTIMOFORNECEDOR: TIntegerField;
    sqlProdutosCOMISSAO: TFloatField;
    sqlProdutosSITUACAOTRIBUTARIA: TStringField;
    sqlProdutosORIGEMST: TStringField;
    sqlProdutosCLASSIFICACAOFISCAL: TStringField;
    sqlProdutosTIPO: TStringField;
    sqlProdutosPRIMEIRAUNIDADE: TStringField;
    sqlProdutosLOCALPADRAO: TStringField;
    sqlProdutosSEGUNDAUNIDADE: TStringField;
    sqlProdutosTIPOCONVERSAO: TStringField;
    sqlProdutosFATORCONVERSAO: TFloatField;
    sqlProdutosCUSTOPADRAO: TFloatField;
    sqlProdutosMOEDACUSTO: TStringField;
    sqlProdutosCUSTOPADRAOMOEDA: TFloatField;
    sqlProdutosULTIMACOTACAO: TFloatField;
    sqlProdutosPESOLIQUIDO: TFloatField;
    sqlProdutosPESOBRUTO: TFloatField;
    sqlProdutosCODIGOBARRAS: TStringField;
    sqlProdutosOBSERVACAO: TStringField;
    sqlProdutosICMS: TFloatField;
    sqlProdutosIPI: TFloatField;
    sqlProdutosISS: TFloatField;
    sqlProdutosII: TFloatField;
    sqlProdutosMARGEMLUCRO: TFloatField;
    sqlProdutosTRIBUTOS: TFloatField;
    sqlProdutosESTOQUESEGURANCA: TFloatField;
    sqlProdutosPONTOPEDIDO: TFloatField;
    sqlProdutosULTIMOINVENTARIO: TDateField;
    sqlProdutosPINVENTARIO: TIntegerField;
    sqlProdutosESTOQUEMINIMO: TFloatField;
    sqlProdutosESTOQUEMAXIMO: TFloatField;
    sqlProdutosPRAZOENTREGA: TIntegerField;
    sqlProdutosTIPOPRAZO: TStringField;
    sqlProdutosLOTEECONOMICO: TFloatField;
    sqlProdutosLOTEMINIMO: TFloatField;
    sqlProdutosPRECOCUSTO1: TFloatField;
    sqlProdutosPRECOCUSTO2: TFloatField;
    sqlProdutosPRECOCUSTO3: TFloatField;
    sqlProdutosPRECOCUSTO4: TFloatField;
    sqlProdutosPRECOCUSTO5: TFloatField;
    sqlProdutosPRECOCUSTO6: TFloatField;
    sqlProdutosPRECOCUSTO7: TFloatField;
    sqlProdutosPRECOCUSTO8: TFloatField;
    sqlProdutosPRECOCUSTO9: TFloatField;
    sqlProdutosPRECOCUSTO10: TFloatField;
    sqlProdutosPRECOVENDA1: TFloatField;
    sqlProdutosPRECOVENDA2: TFloatField;
    sqlProdutosPRECOVENDA3: TFloatField;
    sqlProdutosPRECOVENDA4: TFloatField;
    sqlProdutosPRECOVENDA5: TFloatField;
    sqlProdutosPRECOVENDA6: TFloatField;
    sqlProdutosPRECOVENDA7: TFloatField;
    sqlProdutosPRECOVENDA8: TFloatField;
    sqlProdutosPRECOVENDA9: TFloatField;
    sqlProdutosPRECOVENDA10: TFloatField;
    sqlProdutosPRECOANTIGO1: TFloatField;
    sqlProdutosPRECOANTIGO2: TFloatField;
    sqlProdutosPRECOANTIGO3: TFloatField;
    sqlProdutosPRECOANTIGO4: TFloatField;
    sqlProdutosPRECOANTIGO5: TFloatField;
    sqlProdutosPRECOANTIGO6: TFloatField;
    sqlProdutosPRECOANTIGO7: TFloatField;
    sqlProdutosPRECOANTIGO8: TFloatField;
    sqlProdutosPRECOANTIGO9: TFloatField;
    sqlProdutosPRECOANTIGO10: TFloatField;
    sqlProdutosPRECOMINIMO: TFloatField;
    sqlProdutosPRECOMAXIMO: TFloatField;
    sqlProdutosCORDESTAQUE: TIntegerField;
    sqlProdutosIMAGEM: TStringField;
    sqlProdutosITEMNOVO: TStringField;
    sqlProdutosCONTROLALOTE: TStringField;
    sqlProdutosREGRAMULTIPLO: TIntegerField;
    sqlProdutosULTIMAALTERACAOPRECO: TDateField;
    sqlProdutosUSUARIOULTIMAALTERACAOPRECO: TIntegerField;
    sqlProdutosNROFCI: TStringField;
    sqlProdutosPERCENTUALFCI: TFloatField;
    sqlProdutosCOR: TStringField;
    sqlProdutosTAMANHO: TStringField;
    sqlProdutosDATACRIACAO: TSQLTimeStampField;
    sqlProdutosCOMPRIMENTO: TFloatField;
    sqlProdutosALTURA: TFloatField;
    sqlProdutosLARGURA: TFloatField;
    dtsProdutos: TDataSource;
    sqlProdutos_Estruturas: TSQLDataSet;
    sqlProdutos_EstruturasEMPRESA: TStringField;
    sqlProdutos_EstruturasFILIAL: TStringField;
    sqlProdutos_EstruturasCODIGO: TStringField;
    sqlProdutos_EstruturasCOMPONENTE: TStringField;
    sqlProdutos_EstruturasREDUZIDO: TStringField;
    sqlProdutos_EstruturasSEQUENCIA: TIntegerField;
    sqlProdutos_EstruturasQUANTIDADE: TFloatField;
    sqlProdutos_EstruturasPERDA: TFloatField;
    sqlProdutos_EstruturasOBSERVACAO: TStringField;
    sqlProdutos_EstruturasDATACRIACAO: TSQLTimeStampField;
    sqlCallback: TSQLDataSet;
    StringField10: TStringField;
    StringField11: TStringField;
    dspCallback: TDataSetProvider;
    sqlCallbackCODIGO: TIntegerField;
    sqlCallbackCLIENTE: TIntegerField;
    sqlCallbackNOMECLIENTE: TStringField;
    sqlCallbackRAMAL: TIntegerField;
    sqlCallbackDATAHORA: TSQLTimeStampField;
    sqlCallbackOBSERVACAO: TStringField;
    sqlCallbackDATACRIACAO: TSQLTimeStampField;
    sqlCallbackSTATUS: TStringField;
    sqlProdutosPRODUTOSITE: TStringField;
    sqlProdutosPRECOSITE: TFloatField;
    sqlProdutosPRECOVENDASITE: TFloatField;
    sqlProdutosMARGEMSITE: TFloatField;
    sqlRamais: TSQLDataSet;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    SQLTimeStampField3: TSQLTimeStampField;
    dspRamais: TDataSetProvider;
    sqlRamaisRAMAL: TIntegerField;
    sqlRamaisUSUARIO: TIntegerField;
    sqlRamaisNOMEUSUARIO: TStringField;
    sqlLigacoes_Passivas: TSQLDataSet;
    StringField15: TStringField;
    StringField16: TStringField;
    IntegerField6: TIntegerField;
    SQLTimeStampField2: TSQLTimeStampField;
    dspLigacoes_Passivas: TDataSetProvider;
    sqlLigacoes_Ativas: TSQLDataSet;
    dspLigacoes_Ativas: TDataSetProvider;
    sqlLigacoes_PassivasCODIGO: TIntegerField;
    sqlLigacoes_PassivasCLIENTE: TIntegerField;
    sqlLigacoes_PassivasDATAHORA: TSQLTimeStampField;
    sqlLigacoes_PassivasOBSERVACAO: TStringField;
    sqlLigacoes_PassivasNOMECLIENTE: TStringField;
    sqlLigacoes_AtivasEMPRESA: TStringField;
    sqlLigacoes_AtivasFILIAL: TStringField;
    sqlLigacoes_AtivasCODIGO: TIntegerField;
    sqlLigacoes_AtivasCLIENTE: TIntegerField;
    sqlLigacoes_AtivasNOMECLIENTE: TStringField;
    sqlLigacoes_AtivasRAMAL: TIntegerField;
    sqlLigacoes_AtivasDATAHORA: TSQLTimeStampField;
    sqlLigacoes_AtivasOBSERVACAO: TStringField;
    sqlLigacoes_AtivasDATACRIACAO: TSQLTimeStampField;
    dspHistorico_Contatos_Santana: TDataSetProvider;
    sqlHistorico_Contatos_Santana: TSQLDataSet;
    sqlHistorico_Contatos_SantanaEMPRESA: TStringField;
    sqlHistorico_Contatos_SantanaFILIAL: TStringField;
    sqlHistorico_Contatos_SantanaCLIENTE: TIntegerField;
    sqlHistorico_Contatos_SantanaTIPOCLIENTE: TStringField;
    sqlHistorico_Contatos_SantanaSEQUENCIA: TIntegerField;
    sqlHistorico_Contatos_SantanaDATA: TDateField;
    sqlHistorico_Contatos_SantanaMOTIVO: TStringField;
    sqlHistorico_Contatos_SantanaPROVIDENCIA: TStringField;
    sqlHistorico_Contatos_SantanaSETOR: TStringField;
    sqlHistorico_Contatos_SantanaOCORRENCIA: TStringField;
    sqlHistorico_Contatos_SantanaUSUARIO: TIntegerField;
    sqlHistorico_Contatos_SantanaOFERTA: TStringField;
    sqlHistorico_Contatos_SantanaCAMPANHA: TStringField;
    sqlHistorico_Contatos_SantanaTIPORETORNO: TStringField;
    sqlHistorico_Contatos_SantanaDATARETORNO: TDateField;
    sqlHistorico_Contatos_SantanaSITUACAORETORNO: TStringField;
    sqlHistorico_Contatos_SantanaDATACRIACAO: TSQLTimeStampField;
    sqlHistorico_Contatos_SantanaMOTIVOS: TStringField;
    sqlProdutosLIMITEESTOQUE: TFloatField;
    sqlProdutosORDEMCATALOGO: TIntegerField;
    sqlCallbackNUMERO: TStringField;
    sqlLigacoes_PassivasNUMERO: TStringField;
    sqlLigacoes_AtivasNUMERO: TStringField;
    sqlProdutos_Informacoes_Compras: TSQLDataSet;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    DateField3: TDateField;
    IntegerField7: TIntegerField;
    SQLTimeStampField4: TSQLTimeStampField;
    StringField21: TStringField;
    dspProdutos_Informacoes_Compras: TDataSetProvider;
    sqlSetores_Estoque: TSQLDataSet;
    StringField22: TStringField;
    StringField23: TStringField;
    dspSetores_Estoque: TDataSetProvider;
    sqlSetores_EstoqueCODIGO: TIntegerField;
    sqlSetores_EstoqueDESCRICAO: TStringField;
    sqlSetores_EstoqueRESPONSAVEL: TStringField;
    sqlSetores_EstoqueDATACRIACAO: TSQLTimeStampField;
    sqlPedidos_Compras_Dados: TSQLDataSet;
    sqlPedidos_Compras_DadosEMPRESA: TStringField;
    sqlPedidos_Compras_DadosFILIAL: TStringField;
    sqlPedidos_Compras_DadosSITUACAO: TStringField;
    sqlPedidos_Compras_DadosNUMERO: TIntegerField;
    sqlPedidos_Compras_DadosESPECIEDOCUMENTO: TStringField;
    sqlPedidos_Compras_DadosEMISSAO: TDateField;
    sqlPedidos_Compras_DadosFORNECEDOR: TIntegerField;
    sqlPedidos_Compras_DadosUF: TStringField;
    sqlPedidos_Compras_DadosCONDICAOPAGAMENTO: TIntegerField;
    sqlPedidos_Compras_DadosFORMAPAGAMENTO: TStringField;
    sqlPedidos_Compras_DadosMOEDA: TStringField;
    sqlPedidos_Compras_DadosTAXA: TFloatField;
    sqlPedidos_Compras_DadosTIPOPRECO: TStringField;
    sqlPedidos_Compras_DadosFILIALENTREGA: TStringField;
    sqlPedidos_Compras_DadosTABELA: TIntegerField;
    sqlPedidos_Compras_DadosVALORMERCADORIAS: TFloatField;
    sqlPedidos_Compras_DadosDESCONTO: TFloatField;
    sqlPedidos_Compras_DadosVALORDESCONTO: TFloatField;
    sqlPedidos_Compras_DadosTIPOFRETE: TStringField;
    sqlPedidos_Compras_DadosVALORFRETE: TFloatField;
    sqlPedidos_Compras_DadosVALORSEGURO: TFloatField;
    sqlPedidos_Compras_DadosVALORDESPESAS: TFloatField;
    sqlPedidos_Compras_DadosVALORFINANCEIRO: TFloatField;
    sqlPedidos_Compras_DadosVALORBRUTO: TFloatField;
    sqlPedidos_Compras_DadosVALORLIQUIDO: TFloatField;
    sqlPedidos_Compras_DadosVALORMOEDA: TFloatField;
    sqlPedidos_Compras_DadosBASEIPI: TFloatField;
    sqlPedidos_Compras_DadosVALORIPI: TFloatField;
    sqlPedidos_Compras_DadosBASEICMS: TFloatField;
    sqlPedidos_Compras_DadosVALORICMS: TFloatField;
    sqlPedidos_Compras_DadosBASEICMSST: TFloatField;
    sqlPedidos_Compras_DadosVALORICMSST: TFloatField;
    sqlPedidos_Compras_DadosBASEISSA: TFloatField;
    sqlPedidos_Compras_DadosVALORISSA: TFloatField;
    sqlPedidos_Compras_DadosBASEISSR: TFloatField;
    sqlPedidos_Compras_DadosVALORISSR: TFloatField;
    sqlPedidos_Compras_DadosBASEPISA: TFloatField;
    sqlPedidos_Compras_DadosVALORPISA: TFloatField;
    sqlPedidos_Compras_DadosBASEPISR: TFloatField;
    sqlPedidos_Compras_DadosVALORPISR: TFloatField;
    sqlPedidos_Compras_DadosBASECOFINSA: TFloatField;
    sqlPedidos_Compras_DadosVALORCOFINSA: TFloatField;
    sqlPedidos_Compras_DadosBASECOFINSR: TFloatField;
    sqlPedidos_Compras_DadosVALORCOFINSR: TFloatField;
    sqlPedidos_Compras_DadosBASECSLLR: TFloatField;
    sqlPedidos_Compras_DadosVALORCSLLR: TFloatField;
    sqlPedidos_Compras_DadosBASEIRRFA: TFloatField;
    sqlPedidos_Compras_DadosVALORIRRFA: TFloatField;
    sqlPedidos_Compras_DadosBASEIRRFR: TFloatField;
    sqlPedidos_Compras_DadosVALORIRRFR: TFloatField;
    sqlPedidos_Compras_DadosBASEINSSA: TFloatField;
    sqlPedidos_Compras_DadosVALORINSSA: TFloatField;
    sqlPedidos_Compras_DadosBASEINSSR: TFloatField;
    sqlPedidos_Compras_DadosVALORINSSR: TFloatField;
    sqlPedidos_Compras_DadosBASEFGTS: TFloatField;
    sqlPedidos_Compras_DadosVALORFGTS: TFloatField;
    sqlPedidos_Compras_DadosBASEII: TFloatField;
    sqlPedidos_Compras_DadosVALORII: TFloatField;
    sqlPedidos_Compras_DadosVALIDADE: TDateField;
    sqlPedidos_Compras_DadosULTIMAENTRADA: TDateField;
    sqlPedidos_Compras_DadosULTIMOPREFIXO: TStringField;
    sqlPedidos_Compras_DadosULTIMANOTA: TIntegerField;
    sqlPedidos_Compras_DadosOBSERVACAO: TStringField;
    sqlPedidos_Compras_DadosBASETRIBUTOS: TFloatField;
    sqlPedidos_Compras_DadosVALORTRIBUTOS: TFloatField;
    sqlPedidos_Compras_DadosDATACRIACAO: TSQLTimeStampField;
    dtsPedidos_Compras_Dados: TDataSource;
    sqlPedidos_Compras_Itens: TSQLDataSet;
    sqlPedidos_Compras_ItensEMPRESA: TStringField;
    sqlPedidos_Compras_ItensFILIAL: TStringField;
    sqlPedidos_Compras_ItensNUMERO: TIntegerField;
    sqlPedidos_Compras_ItensITEM: TIntegerField;
    sqlPedidos_Compras_ItensPRODUTO: TStringField;
    sqlPedidos_Compras_ItensDESCRICAO: TStringField;
    sqlPedidos_Compras_ItensPRIMEIRAUNIDADE: TStringField;
    sqlPedidos_Compras_ItensLOCAL: TStringField;
    sqlPedidos_Compras_ItensQUANTIDADE: TFloatField;
    sqlPedidos_Compras_ItensUNITARIO: TFloatField;
    sqlPedidos_Compras_ItensUNITARIOMOEDA: TFloatField;
    sqlPedidos_Compras_ItensTOTAL: TFloatField;
    sqlPedidos_Compras_ItensTOTALMOEDA: TFloatField;
    sqlPedidos_Compras_ItensDESCONTO: TFloatField;
    sqlPedidos_Compras_ItensVALORDESCONTO: TFloatField;
    sqlPedidos_Compras_ItensVALORDESPESAS: TFloatField;
    sqlPedidos_Compras_ItensVALORFRETE: TFloatField;
    sqlPedidos_Compras_ItensVALORSEGURO: TFloatField;
    sqlPedidos_Compras_ItensVALORFINANCEIRO: TFloatField;
    sqlPedidos_Compras_ItensVALORBRUTO: TFloatField;
    sqlPedidos_Compras_ItensVALORLIQUIDO: TFloatField;
    sqlPedidos_Compras_ItensPRECOLISTA: TFloatField;
    sqlPedidos_Compras_ItensENTREGA: TDateField;
    sqlPedidos_Compras_ItensREGRA: TIntegerField;
    sqlPedidos_Compras_ItensCODIGOFISCAL: TStringField;
    sqlPedidos_Compras_ItensCLASSIFICACAOFISCAL: TStringField;
    sqlPedidos_Compras_ItensIPI: TFloatField;
    sqlPedidos_Compras_ItensBASEIPI: TFloatField;
    sqlPedidos_Compras_ItensVALORIPI: TFloatField;
    sqlPedidos_Compras_ItensCSTIPI: TStringField;
    sqlPedidos_Compras_ItensBASEICMS: TFloatField;
    sqlPedidos_Compras_ItensICMS: TFloatField;
    sqlPedidos_Compras_ItensVALORICMS: TFloatField;
    sqlPedidos_Compras_ItensCSTICMS: TStringField;
    sqlPedidos_Compras_ItensORIGEMST: TStringField;
    sqlPedidos_Compras_ItensMARGEMLUCRO: TFloatField;
    sqlPedidos_Compras_ItensBASEICMSST: TFloatField;
    sqlPedidos_Compras_ItensVALORICMSST: TFloatField;
    sqlPedidos_Compras_ItensISS: TFloatField;
    sqlPedidos_Compras_ItensBASEISSA: TFloatField;
    sqlPedidos_Compras_ItensVALORISSA: TFloatField;
    sqlPedidos_Compras_ItensBASEISSR: TFloatField;
    sqlPedidos_Compras_ItensVALORISSR: TFloatField;
    sqlPedidos_Compras_ItensPISA: TFloatField;
    sqlPedidos_Compras_ItensBASEPISA: TFloatField;
    sqlPedidos_Compras_ItensVALORPISA: TFloatField;
    sqlPedidos_Compras_ItensPISR: TFloatField;
    sqlPedidos_Compras_ItensBASEPISR: TFloatField;
    sqlPedidos_Compras_ItensVALORPISR: TFloatField;
    sqlPedidos_Compras_ItensCOFINSA: TFloatField;
    sqlPedidos_Compras_ItensBASECOFINSA: TFloatField;
    sqlPedidos_Compras_ItensVALORCOFINSA: TFloatField;
    sqlPedidos_Compras_ItensCOFINSR: TFloatField;
    sqlPedidos_Compras_ItensBASECOFINSR: TFloatField;
    sqlPedidos_Compras_ItensVALORCOFINSR: TFloatField;
    sqlPedidos_Compras_ItensCSLLR: TFloatField;
    sqlPedidos_Compras_ItensBASECSLLR: TFloatField;
    sqlPedidos_Compras_ItensVALORCSLLR: TFloatField;
    sqlPedidos_Compras_ItensIRRF: TFloatField;
    sqlPedidos_Compras_ItensBASEIRRFA: TFloatField;
    sqlPedidos_Compras_ItensVALORIRRFA: TFloatField;
    sqlPedidos_Compras_ItensBASEIRRFR: TFloatField;
    sqlPedidos_Compras_ItensVALORIRRFR: TFloatField;
    sqlPedidos_Compras_ItensINSS: TFloatField;
    sqlPedidos_Compras_ItensBASEINSSA: TFloatField;
    sqlPedidos_Compras_ItensVALORINSSA: TFloatField;
    sqlPedidos_Compras_ItensBASEINSSR: TFloatField;
    sqlPedidos_Compras_ItensVALORINSSR: TFloatField;
    sqlPedidos_Compras_ItensBASEFGTS: TFloatField;
    sqlPedidos_Compras_ItensVALORFGTS: TFloatField;
    sqlPedidos_Compras_ItensII: TFloatField;
    sqlPedidos_Compras_ItensBASEII: TFloatField;
    sqlPedidos_Compras_ItensVALORII: TFloatField;
    sqlPedidos_Compras_ItensNUMEROSC: TIntegerField;
    sqlPedidos_Compras_ItensITEMSC: TIntegerField;
    sqlPedidos_Compras_ItensENTREGUE: TFloatField;
    sqlPedidos_Compras_ItensELIMINADO: TFloatField;
    sqlPedidos_Compras_ItensORIGEMPRODUTO: TStringField;
    sqlPedidos_Compras_ItensMARCAPRODUTO: TStringField;
    sqlPedidos_Compras_ItensNUMEROIMPORTACAO: TStringField;
    sqlPedidos_Compras_ItensTRIBUTOS: TFloatField;
    sqlPedidos_Compras_ItensBASETRIBUTOS: TFloatField;
    sqlPedidos_Compras_ItensVALORTRIBUTOS: TFloatField;
    sqlPedidos_Compras_ItensADICIONAIS: TStringField;
    sqlPedidos_Compras_ItensDATACRIACAO: TSQLTimeStampField;
    dspPedidos_Compras_Dados: TDataSetProvider;
    dspVendedores_Grupos: TDataSetProvider;
    sqlVendedores_Grupos: TSQLDataSet;
    StringField24: TStringField;
    StringField25: TStringField;
    IntegerField8: TIntegerField;
    StringField26: TStringField;
    SQLTimeStampField5: TSQLTimeStampField;
    sqlVendedores: TSQLDataSet;
    sqlVendedoresEMPRESA: TStringField;
    sqlVendedoresFILIAL: TStringField;
    sqlVendedoresSTATUS: TStringField;
    sqlVendedoresCODIGO: TIntegerField;
    sqlVendedoresDATACADASTRO: TDateField;
    sqlVendedoresNOME: TStringField;
    sqlVendedoresENDERECO: TStringField;
    sqlVendedoresPESSOA: TStringField;
    sqlVendedoresREDUZIDO: TStringField;
    sqlVendedoresCNPJ: TStringField;
    sqlVendedoresCPF: TStringField;
    sqlVendedoresIE: TStringField;
    sqlVendedoresIM: TStringField;
    sqlVendedoresRG: TStringField;
    sqlVendedoresNUMERO: TStringField;
    sqlVendedoresCOMPLEMENTO: TStringField;
    sqlVendedoresUF: TStringField;
    sqlVendedoresMUNICIPIO: TStringField;
    sqlVendedoresCMUNICIPIO: TStringField;
    sqlVendedoresBAIRRO: TStringField;
    sqlVendedoresCEP: TStringField;
    sqlVendedoresEMAIL: TStringField;
    sqlVendedoresHOMEPAGE: TStringField;
    sqlVendedoresDATANASCIMENTO: TDateField;
    sqlVendedoresDDI: TStringField;
    sqlVendedoresDDD: TStringField;
    sqlVendedoresTELEFONE: TStringField;
    sqlVendedoresFAX: TStringField;
    sqlVendedoresCELULAR: TStringField;
    sqlVendedoresCONTATO: TStringField;
    sqlVendedoresBANCO: TIntegerField;
    sqlVendedoresAGENCIA: TStringField;
    sqlVendedoresCONTA: TStringField;
    sqlVendedoresDATAADMISSAO: TDateField;
    sqlVendedoresUSUARIO: TIntegerField;
    sqlVendedoresTIPOCOMISSAO: TStringField;
    sqlVendedoresCOMISSAO: TFloatField;
    sqlVendedoresCOMISSAOEMISSAO: TFloatField;
    sqlVendedoresCOMISSAOBAIXA: TFloatField;
    sqlVendedoresCONSIDERADESPESAS: TStringField;
    sqlVendedoresCONSIDERAFRETE: TStringField;
    sqlVendedoresCONSIDERASEGURO: TStringField;
    sqlVendedoresCONSIDERADESCONTO: TStringField;
    sqlVendedoresCONSIDERAIPI: TStringField;
    sqlVendedoresCONSIDERAICMS: TStringField;
    sqlVendedoresCONSIDERAICMSST: TStringField;
    sqlVendedoresCONSIDERAISS: TStringField;
    sqlVendedoresDIAPAGAMENTO: TIntegerField;
    sqlVendedoresBASEPAGAMENTO: TStringField;
    sqlVendedoresOBSERVACAO: TStringField;
    sqlVendedoresGRUPO: TIntegerField;
    sqlVendedoresFAIXA: TIntegerField;
    sqlVendedoresFORNECEDOR: TIntegerField;
    sqlVendedoresHABILITAPRECOS: TStringField;
    sqlVendedoresUSASFA: TStringField;
    sqlVendedoresDATACRIACAO: TSQLTimeStampField;
    dspVendedores: TDataSetProvider;
    dtsVendedores_Contatos: TDataSource;
    sqlVendedores_Contatos: TSQLDataSet;
    sqlVendedores_ContatosEMPRESA: TStringField;
    sqlVendedores_ContatosFILIAL: TStringField;
    sqlVendedores_ContatosCODIGO: TIntegerField;
    sqlVendedores_ContatosITEM: TIntegerField;
    sqlVendedores_ContatosNOME: TStringField;
    sqlVendedores_ContatosAREA: TStringField;
    sqlVendedores_ContatosCARGO: TStringField;
    sqlVendedores_ContatosDDI: TStringField;
    sqlVendedores_ContatosDDD: TStringField;
    sqlVendedores_ContatosNUMERO: TStringField;
    sqlVendedores_ContatosRAMAL: TStringField;
    sqlVendedores_ContatosTIPO: TStringField;
    sqlVendedores_ContatosEMAIL: TStringField;
    sqlVendedores_ContatosDATACRIACAO: TSQLTimeStampField;
    dtsVendedores_Clientes: TDataSource;
    sqlVendedores_Clientes: TSQLDataSet;
    sqlVendedores_ClientesEMPRESA: TStringField;
    sqlVendedores_ClientesFILIAL: TStringField;
    sqlVendedores_ClientesCODIGO: TIntegerField;
    sqlVendedores_ClientesCLIENTE: TIntegerField;
    sqlVendedores_ClientesDATACRIACAO: TSQLTimeStampField;
    sqlVendedoresEMAILMETA: TStringField;
    sqlVendedoresNOTIFICAMETA: TStringField;
    sqlVendedores_GruposEMAILLIDER: TStringField;
    sqlProdutosDIASGARANTIA: TIntegerField;
    sqlSolicitacoes_Semicondutores: TSQLDataSet;
    StringField27: TStringField;
    StringField28: TStringField;
    SQLTimeStampField6: TSQLTimeStampField;
    dspSolicitacoes_Semicondutores: TDataSetProvider;
    sqlSolicitacoes_SemicondutoresNUMERO: TIntegerField;
    sqlSolicitacoes_SemicondutoresSITUACAO: TStringField;
    sqlSolicitacoes_SemicondutoresTIPO: TStringField;
    sqlSolicitacoes_SemicondutoresPRODUTO: TStringField;
    sqlSolicitacoes_SemicondutoresDESCRICAO: TStringField;
    sqlSolicitacoes_SemicondutoresPEDIDO: TIntegerField;
    sqlSolicitacoes_SemicondutoresQUANTIDADEPEDIDO: TFloatField;
    sqlSolicitacoes_SemicondutoresUSUARIOPEDIDO: TStringField;
    sqlProdutos_Solicitacoes: TSQLDataSet;
    StringField31: TStringField;
    StringField32: TStringField;
    StringField33: TStringField;
    dspProdutos_Solicitacoes: TDataSetProvider;
    sqlMovimentos_Semicondutores: TSQLDataSet;
    sqlMovimentos_SemicondutoresEMPRESA: TStringField;
    sqlMovimentos_SemicondutoresFILIAL: TStringField;
    sqlMovimentos_SemicondutoresREGRA: TIntegerField;
    sqlMovimentos_SemicondutoresEMISSAO: TDateField;
    sqlMovimentos_SemicondutoresPRODUTO: TStringField;
    sqlMovimentos_SemicondutoresDOCUMENTO: TIntegerField;
    sqlMovimentos_SemicondutoresQUANTIDADE: TFloatField;
    sqlMovimentos_SemicondutoresOBSERVACAO: TStringField;
    sqlMovimentos_SemicondutoresDATACRIACAO: TSQLTimeStampField;
    dspMovimentos_Semicondutores: TDataSetProvider;
    sqlSaldos_Semicondutores: TSQLDataSet;
    StringField29: TStringField;
    StringField30: TStringField;
    StringField34: TStringField;
    SQLTimeStampField7: TSQLTimeStampField;
    dspSaldos_Semicondutores: TDataSetProvider;
    sqlSaldos_SemicondutoresSALDO: TFloatField;
    sqlMovimentos_SemicondutoresDESCRICAOPRODUTO: TStringField;
    sqlSaldos_SemicondutoresDESCRICAOPRODUTO: TStringField;
    sqlClassificacao_Fiscal: TSQLDataSet;
    sqlClassificacao_FiscalEMPRESA: TStringField;
    sqlClassificacao_FiscalFILIAL: TStringField;
    sqlClassificacao_FiscalCF: TStringField;
    sqlClassificacao_FiscalCRITERIO: TStringField;
    sqlClassificacao_FiscalDESCRICAO: TStringField;
    sqlClassificacao_FiscalOBSERVACAO: TStringField;
    sqlClassificacao_FiscalDATACADASTRO: TDateField;
    sqlClassificacao_FiscalDATACRIACAO: TSQLTimeStampField;
    sqlClassificacao_FiscalCAMEX: TStringField;
    dspClassificacao_Fiscal: TDataSetProvider;
    dtsClassificacao_Fiscal: TDataSource;
    sqlClassificacao_Fiscal_Ufs: TSQLDataSet;
    sqlClassificacao_Fiscal_UfsEMPRESA: TStringField;
    sqlClassificacao_Fiscal_UfsFILIAL: TStringField;
    sqlClassificacao_Fiscal_UfsCF: TStringField;
    sqlClassificacao_Fiscal_UfsCRITERIO: TStringField;
    sqlClassificacao_Fiscal_UfsUF: TStringField;
    sqlClassificacao_Fiscal_UfsIVA: TFloatField;
    sqlClassificacao_Fiscal_UfsDATACRIACAO: TSQLTimeStampField;
    sqlClassificacao_Fiscal_UfsTEMREDUCAO: TStringField;
    sqlCF_Historico: TSQLDataSet;
    sqlCF_HistoricoEMPRESA: TStringField;
    sqlCF_HistoricoFILIAL: TStringField;
    sqlCF_HistoricoCF: TStringField;
    sqlCF_HistoricoCRITERIO: TStringField;
    sqlCF_HistoricoSEQUENCIA: TIntegerField;
    sqlCF_HistoricoUSUARIO: TIntegerField;
    sqlCF_HistoricoALTERACAO: TStringField;
    sqlCF_HistoricoDATACRIACAO: TSQLTimeStampField;
    sqlTarefasHORASGASTAS: TFloatField;
    sqlTarefasSOLUCAO: TStringField;
    sqlTarefasSOLICITANTE: TIntegerField;
    sqlTarefasESTIMATIVAHORAS: TFloatField;
    sqlClientes: TSQLDataSet;
    sqlClientesEMPRESA: TStringField;
    sqlClientesFILIAL: TStringField;
    sqlClientesCODIGO: TIntegerField;
    sqlClientesSTATUS: TStringField;
    sqlClientesDATACADASTRO: TDateField;
    sqlClientesNOME: TStringField;
    sqlClientesPESSOA: TStringField;
    sqlClientesREDUZIDO: TStringField;
    sqlClientesENDERECO: TStringField;
    sqlClientesNUMERO: TStringField;
    sqlClientesCOMPLEMENTO: TStringField;
    sqlClientesUF: TStringField;
    sqlClientesMUNICIPIO: TStringField;
    sqlClientesCMUNICIPIO: TStringField;
    sqlClientesBAIRRO: TStringField;
    sqlClientesCEP: TStringField;
    sqlClientesCNPJ: TStringField;
    sqlClientesCPF: TStringField;
    sqlClientesIE: TStringField;
    sqlClientesRG: TStringField;
    sqlClientesEMAIL: TStringField;
    sqlClientesEMAILNFE: TStringField;
    sqlClientesHOMEPAGE: TStringField;
    sqlClientesDATANASCIMENTO: TDateField;
    sqlClientesDDI: TStringField;
    sqlClientesDDD: TStringField;
    sqlClientesTELEFONE: TStringField;
    sqlClientesFAX: TStringField;
    sqlClientesCONTATO: TStringField;
    sqlClientesCPAIS: TStringField;
    sqlClientesNPAIS: TStringField;
    sqlClientesVENDEDOR: TIntegerField;
    sqlClientesCOMISSAO: TFloatField;
    sqlClientesBANCO: TIntegerField;
    sqlClientesAGENCIA: TStringField;
    sqlClientesCONTA: TStringField;
    sqlClientesGRUPO: TIntegerField;
    sqlClientesTRANSPORTADORA: TIntegerField;
    sqlClientesCONCEITO: TStringField;
    sqlClientesRISCO: TStringField;
    sqlClientesCLASSEVALOR: TStringField;
    sqlClientesTABELA: TStringField;
    sqlClientesLIMITECREDITO: TFloatField;
    sqlClientesVENCIMENTOLC: TDateField;
    sqlClientesPRIMEIRACOMPRA: TDateField;
    sqlClientesULTIMACOMPRA: TDateField;
    sqlClientesSEGMENTOMERCADO: TIntegerField;
    sqlClientesMAIORSALDOLC: TFloatField;
    sqlClientesMENORSALDOLC: TFloatField;
    sqlClientesMAIORCOMPRA: TFloatField;
    sqlClientesMENORCOMPRA: TFloatField;
    sqlClientesNUMEROPAGTOS: TIntegerField;
    sqlClientesMEDIAATRASO: TFloatField;
    sqlClientesSALDODEVEDOR: TFloatField;
    sqlClientesNUMEROCOMPRAS: TIntegerField;
    sqlClientesTITULOSABERTOS: TIntegerField;
    sqlClientesSALDOATRASADOS: TFloatField;
    sqlClientesTITULOSATRASADOS: TIntegerField;
    sqlClientesMAIORTITULO: TFloatField;
    sqlClientesMENORTITULO: TFloatField;
    sqlClientesCHEQUESDEVOLVIDOS: TIntegerField;
    sqlClientesULTIMADEVOLUCAO: TDateField;
    sqlClientesOBSERVACAO: TStringField;
    sqlClientesTIPOFRETE: TStringField;
    sqlClientesDESCONTO: TFloatField;
    sqlClientesCONDICAOPAGAMENTO: TIntegerField;
    sqlClientesFORMAPAGAMENTO: TStringField;
    sqlClientesCATEGORIA: TStringField;
    sqlClientesTIPOPRECO: TStringField;
    sqlClientesENDERECOENTREGA: TStringField;
    sqlClientesNUMEROENTREGA: TStringField;
    sqlClientesCOMPLEMENTOENTREGA: TStringField;
    sqlClientesUFENTREGA: TStringField;
    sqlClientesMUNICIPIOENTREGA: TStringField;
    sqlClientesBAIRROENTREGA: TStringField;
    sqlClientesCEPENTREGA: TStringField;
    sqlClientesENDERECOCOBRANCA: TStringField;
    sqlClientesNUMEROCOBRANCA: TStringField;
    sqlClientesCOMPLEMENTOCOBRANCA: TStringField;
    sqlClientesUFCOBRANCA: TStringField;
    sqlClientesMUNICIPIOCOBRANCA: TStringField;
    sqlClientesBAIRROCOBRANCA: TStringField;
    sqlClientesCEPCOBRANCA: TStringField;
    sqlClientesSUFRAMA: TStringField;
    sqlClientesNOTIFICAEMAIL: TStringField;
    sqlClientesFORNECEDOR: TIntegerField;
    sqlClientesULTIMACONSULTA: TDateField;
    sqlClientesSTATUSCONSULTA: TStringField;
    sqlClientesUSUARIOINC: TStringField;
    sqlClientesUSUARIOALT: TStringField;
    sqlClientesDATACRIACAO: TSQLTimeStampField;
    sqlClientesIM: TStringField;
    sqlClientesROTA: TStringField;
    sqlClientesTESTE: TStringField;
    sqlClientesGRUPOCLIENTE: TIntegerField;
    sqlClientesROWID: TIntegerField;
    sqlClientesCELULAR: TStringField;
    dspClientes_santana: TDataSetProvider;
    dtsClientes: TDataSource;
    sqlClientes_Contatos: TSQLDataSet;
    sqlClientes_ContatosEMPRESA: TStringField;
    sqlClientes_ContatosFILIAL: TStringField;
    sqlClientes_ContatosCODIGO: TIntegerField;
    sqlClientes_ContatosITEM: TIntegerField;
    sqlClientes_ContatosNOME: TStringField;
    sqlClientes_ContatosAREA: TStringField;
    sqlClientes_ContatosCARGO: TStringField;
    sqlClientes_ContatosDDI: TStringField;
    sqlClientes_ContatosDDD: TStringField;
    sqlClientes_ContatosNUMERO: TStringField;
    sqlClientes_ContatosRAMAL: TStringField;
    sqlClientes_ContatosTIPO: TStringField;
    sqlClientes_ContatosEMAIL: TStringField;
    sqlClientes_ContatosDATACRIACAO: TSQLTimeStampField;
    sqlClientes_Produtos: TSQLDataSet;
    sqlClientes_ProdutosEMPRESA: TStringField;
    sqlClientes_ProdutosFILIAL: TStringField;
    sqlClientes_ProdutosCODIGO: TIntegerField;
    sqlClientes_ProdutosITEM: TIntegerField;
    sqlClientes_ProdutosPRODUTO: TStringField;
    sqlClientes_ProdutosPRODUTOCLIENTE: TStringField;
    sqlClientes_ProdutosCODIGOBARRASCLIENTE: TStringField;
    sqlClientes_ProdutosDESCRICAOCLIENTE: TStringField;
    sqlClientes_ProdutosUNIDADEMEDIDA: TStringField;
    sqlClientes_ProdutosDATACRIACAO: TSQLTimeStampField;
    dspAuditoria_Produtos: TDataSetProvider;
    sqlAuditoria_produtos: TSQLDataSet;
    sqlAuditoria_produtosEMPRESA: TStringField;
    sqlAuditoria_produtosFILIAL: TStringField;
    sqlAuditoria_produtosPRODUTO: TStringField;
    sqlAuditoria_produtosSTATUS: TStringField;
    sqlAuditoria_produtosENTRADANF: TStringField;
    sqlAuditoria_produtosSAIDANF: TStringField;
    sqlAuditoria_produtosGARANTIA: TStringField;
    sqlAuditoria_produtosQUANTIDADEGRANDE: TStringField;
    sqlAuditoria_produtosQUANTIDADE: TFloatField;
    sqlAuditoria_produtosPRECOABAIXO: TStringField;
    sqlAuditoria_produtosDATADE: TDateField;
    sqlAuditoria_produtosDATAATE: TDateField;
    sqlAuditoria_produtosDATACRIACAO: TSQLTimeStampField;
    sqlAuditoria_produtosPRODUTODESCRICAO: TStringField;
    dspAuditoria_Clientes: TDataSetProvider;
    sqlAuditoria_Clientes: TSQLDataSet;
    StringField35: TStringField;
    StringField36: TStringField;
    StringField38: TStringField;
    sqlAuditoria_ClientesCLIENTE: TStringField;
    sqlAuditoria_ClientesCLIENTEDESCRICAO: TStringField;
    DateField4: TDateField;
    DateField5: TDateField;
    SQLTimeStampField8: TSQLTimeStampField;
    sqlAuditoria_ClientesORCAMENTO: TStringField;
    sqlAuditoria_ClientesPEDIDO: TStringField;
    sqlAuditoria_ClientesBAIXATITULO: TStringField;
    sqlAuditoria_ClientesNF: TStringField;
    sqlAuditoria_ClientesVENCIMENTOTITULO: TStringField;
    sqlAuditoria_ClientesATRASO: TStringField;
    sqlAuditoria_ClientesPASSOULIMITE: TStringField;
    sqlAuditoria_ClientesGARANTIA: TStringField;
    sqlProdutosQUANTIDADEMAXIMA: TFloatField;
    sqlProdutosFEDERAIS: TFloatField;
    sqlProdutosESTADUAIS: TFloatField;
    sqlProdutosMUNICIPAIS: TFloatField;
    sqlProdutosFEDERAISIMPORTADO: TFloatField;
    sqlConcorrentes_Codigos_Santana: TSQLDataSet;
    StringField37: TStringField;
    StringField39: TStringField;
    IntegerField9: TIntegerField;
    StringField40: TStringField;
    SQLTimeStampField9: TSQLTimeStampField;
    dtsConcorrentes_Codigos_Santana: TDataSource;
    sqlPre_Produto: TSQLDataSet;
    StringField42: TStringField;
    StringField43: TStringField;
    StringField44: TStringField;
    StringField45: TStringField;
    DateField8: TDateField;
    StringField46: TStringField;
    StringField47: TStringField;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    StringField48: TStringField;
    StringField49: TStringField;
    StringField50: TStringField;
    StringField51: TStringField;
    StringField52: TStringField;
    StringField53: TStringField;
    IntegerField12: TIntegerField;
    IntegerField13: TIntegerField;
    DateField9: TDateField;
    FloatField17: TFloatField;
    IntegerField14: TIntegerField;
    FloatField18: TFloatField;
    StringField54: TStringField;
    StringField55: TStringField;
    StringField56: TStringField;
    StringField57: TStringField;
    StringField58: TStringField;
    StringField59: TStringField;
    StringField60: TStringField;
    StringField61: TStringField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    StringField62: TStringField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    StringField63: TStringField;
    StringField64: TStringField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    FloatField27: TFloatField;
    FloatField28: TFloatField;
    FloatField29: TFloatField;
    FloatField30: TFloatField;
    FloatField31: TFloatField;
    FloatField32: TFloatField;
    DateField10: TDateField;
    IntegerField15: TIntegerField;
    FloatField33: TFloatField;
    FloatField34: TFloatField;
    FloatField35: TFloatField;
    IntegerField16: TIntegerField;
    StringField65: TStringField;
    FloatField36: TFloatField;
    FloatField37: TFloatField;
    FloatField38: TFloatField;
    FloatField39: TFloatField;
    FloatField40: TFloatField;
    FloatField41: TFloatField;
    FloatField42: TFloatField;
    FloatField43: TFloatField;
    FloatField44: TFloatField;
    FloatField45: TFloatField;
    FloatField46: TFloatField;
    FloatField47: TFloatField;
    FloatField48: TFloatField;
    FloatField49: TFloatField;
    FloatField50: TFloatField;
    FloatField51: TFloatField;
    FloatField52: TFloatField;
    FloatField53: TFloatField;
    FloatField54: TFloatField;
    FloatField55: TFloatField;
    FloatField56: TFloatField;
    FloatField57: TFloatField;
    FloatField58: TFloatField;
    FloatField59: TFloatField;
    FloatField60: TFloatField;
    FloatField61: TFloatField;
    FloatField62: TFloatField;
    FloatField63: TFloatField;
    FloatField64: TFloatField;
    FloatField65: TFloatField;
    FloatField66: TFloatField;
    FloatField67: TFloatField;
    FloatField68: TFloatField;
    FloatField69: TFloatField;
    IntegerField17: TIntegerField;
    StringField66: TStringField;
    StringField67: TStringField;
    StringField68: TStringField;
    IntegerField18: TIntegerField;
    DateField11: TDateField;
    IntegerField19: TIntegerField;
    StringField69: TStringField;
    FloatField70: TFloatField;
    StringField70: TStringField;
    StringField71: TStringField;
    SQLTimeStampField10: TSQLTimeStampField;
    FloatField71: TFloatField;
    FloatField72: TFloatField;
    FloatField73: TFloatField;
    StringField72: TStringField;
    FloatField74: TFloatField;
    FloatField75: TFloatField;
    FloatField76: TFloatField;
    IntegerField20: TIntegerField;
    IntegerField21: TIntegerField;
    FloatField77: TFloatField;
    FloatField78: TFloatField;
    FloatField79: TFloatField;
    FloatField80: TFloatField;
    FloatField81: TFloatField;
    dspPre_Produto: TDataSetProvider;
    sqlEmpresa_Grupo: TSQLDataSet;
    sqlEmpresa_GrupoEMPRESA: TStringField;
    sqlEmpresa_GrupoFILIAL: TStringField;
    sqlEmpresa_GrupoCODIGO: TIntegerField;
    sqlEmpresa_GrupoDESCRICAO: TStringField;
    sqlEmpresa_GrupoDATACRIACAO: TSQLTimeStampField;
    dspEmpresa_Grupo: TDataSetProvider;
    sqlEmpresa_Grupo_Clientes: TSQLDataSet;
    sqlEmpresa_Grupo_ClientesEMPRESA: TStringField;
    sqlEmpresa_Grupo_ClientesFILIAL: TStringField;
    sqlEmpresa_Grupo_ClientesCLIENTE: TIntegerField;
    sqlEmpresa_Grupo_ClientesGRUPO: TIntegerField;
    sqlEmpresa_Grupo_ClientesDATACRIACAO: TSQLTimeStampField;
    sqlEmpresa_Grupo_ClientesOBSERVACAO: TStringField;
    sqlEmpresa_Grupo_ClientesNOMECLIENTE: TStringField;
    dtsEmpresa_Grupo: TDataSource;
    sqlProdutosPRECOALTERNATIVO1: TFloatField;
    sqlProdutosPRECOALTERNATIVO2: TFloatField;
    sqlProdutosPRECOALTERNATIVO3: TFloatField;
    sqlProdutosPRECOALTERNATIVO4: TFloatField;
    sqlProdutosPRECOALTERNATIVO5: TFloatField;
    sqlProdutosPRECOALTERNATIVO6: TFloatField;
    sqlProdutosPRECOALTERNATIVO7: TFloatField;
    sqlProdutosPRECOALTERNATIVO8: TFloatField;
    sqlProdutosPRECOALTERNATIVO9: TFloatField;
    sqlProdutosPRECOALTERNATIVO10: TFloatField;
    sqlProdutosULTIMATRANSFERENCIAPRECO: TSQLTimeStampField;
    sqlProdutosUSUARIOTRANSFERENCIAPRECO: TIntegerField;
    sqlConsulta_Separacao_Setor: TSQLDataSet;
    sqlConsulta_Separacao_SetorEMPRESA: TStringField;
    sqlConsulta_Separacao_SetorFILIAL: TStringField;
    sqlConsulta_Separacao_SetorNUMERO: TIntegerField;
    sqlConsulta_Separacao_SetorSETOR: TStringField;
    sqlConsulta_Separacao_SetorQUANTIDADE: TFloatField;
    sqlConsulta_Separacao_SetorSEPARADO: TStringField;
    sqlConsulta_Separacao_SetorCONFERIDO: TStringField;
    sqlConsulta_Separacao_SetorDATACRIACAO: TSQLTimeStampField;
    sqlConsulta_Separacao_SetorDATACONFERIDO: TDateField;
    sqlConsulta_Separacao_SetorDATAHORAIMPRESSAO: TSQLTimeStampField;
    sqlConsulta_Separacao_SetorFINALSEPARACAO: TSQLTimeStampField;
    sqlConsulta_Separacao_SetorFINALCONFERENCIA: TSQLTimeStampField;
    sqlConsulta_Separacao_SetorUSUARIOIMPRESSAO: TStringField;
    sqlConsulta_Separacao_SetorUSUARIOSEPARACAO: TStringField;
    sqlConsulta_Separacao_SetorUSUARIOCONFERENCIA: TStringField;
    sqlConsulta_Separacao_SetorLOCALIZACAOEXPEDICAO: TStringField;
    sqlConsulta_Separacao_SetorPENDENCIA: TStringField;
    sqlConsulta_Separacao_SetorDATAHORAPENDENCIA: TSQLTimeStampField;
    sqlConsulta_Separacao_SetorUSUARIOPENDENCIA: TStringField;
    dspConsulta_Separacao_Setor: TDataSetProvider;
    sqlClientesORIGEMCADASTRO: TStringField;
    sqlProdutosUPGRADEEMBALAGEM: TStringField;
    sqlProdutosDATAUPGRADEEMBALAGEM: TDateField;
    sqlProdutosPAGINACATALOGO: TIntegerField;
    sqlProdutosARQUIVOINFORMACOES: TStringField;
    sqlProdutosEMBALAGEM: TStringField;
    sqlClientesINDICADORIE: TStringField;
    sqlClientesIDESTRANGEIRO: TStringField;
    sqlProdutos_Informacoes_ComprasMENSAGEMFORNECEDOR: TStringField;
    sqlClientesINFORMACOESCOMERCIAIS: TStringField;
    sqlCampanhas_Sugestoes: TSQLDataSet;
    StringField73: TStringField;
    StringField74: TStringField;
    dspCampanhas_Sugestoes: TDataSetProvider;
    sqlCampanhas_SugestoesNUMERO: TIntegerField;
    sqlCampanhas_SugestoesPRODUTO: TStringField;
    sqlCampanhas_SugestoesDESCRICAO: TStringField;
    sqlCampanhas_SugestoesQUANTIDADE: TIntegerField;
    sqlCampanhas_SugestoesUNITARIOFORASP: TFloatField;
    sqlCampanhas_SugestoesUNITARIOSP: TFloatField;
    sqlCampanhas_SugestoesOBSERVACAO: TStringField;
    sqlCampanhas_SugestoesDATACRIACAO: TSQLTimeStampField;
    sqlCampanhas_SugestoesSTATUS: TStringField;
    sqlOrdem_Producao_Santana: TSQLDataSet;
    sqlOrdem_Producao_SantanaEMPRESA: TStringField;
    sqlOrdem_Producao_SantanaFILIAL: TStringField;
    sqlOrdem_Producao_SantanaNUMERO: TIntegerField;
    sqlOrdem_Producao_SantanaPRODUTO: TStringField;
    sqlOrdem_Producao_SantanaDESCRICAO: TStringField;
    sqlOrdem_Producao_SantanaLOCAL: TStringField;
    sqlOrdem_Producao_SantanaDATA: TDateField;
    sqlOrdem_Producao_SantanaDATALIMITE: TDateField;
    sqlOrdem_Producao_SantanaQUANTIDADE: TFloatField;
    sqlOrdem_Producao_SantanaSITUACAO: TStringField;
    sqlOrdem_Producao_SantanaDATAINICIO: TDateField;
    sqlOrdem_Producao_SantanaHORAINICIO: TTimeField;
    sqlOrdem_Producao_SantanaUSUARIOINICIO: TIntegerField;
    sqlOrdem_Producao_SantanaDATAFINAL: TDateField;
    sqlOrdem_Producao_SantanaHORAFINAL: TTimeField;
    sqlOrdem_Producao_SantanaUSUARIOFINAL: TIntegerField;
    sqlOrdem_Producao_SantanaDATACRIACAO: TSQLTimeStampField;
    sqlOrdem_Producao_SantanaUSUARIO: TIntegerField;
    sqlOrdem_Producao_SantanaNOMEUSUARIOINICIO: TStringField;
    sqlOrdem_Producao_SantanaNOMEUSUARIOFINAL: TStringField;
    dspOrdem_Producao_Santana: TDataSetProvider;
    sqlConsulta_Lista_Faltas: TSQLDataSet;
    sqlConsulta_Lista_FaltasEMPRESA: TStringField;
    sqlConsulta_Lista_FaltasFILIAL: TStringField;
    sqlConsulta_Lista_FaltasORIGEM: TStringField;
    sqlConsulta_Lista_FaltasSITUACAO: TStringField;
    sqlConsulta_Lista_FaltasDATA: TDateField;
    sqlConsulta_Lista_FaltasDOCUMENTO: TIntegerField;
    sqlConsulta_Lista_FaltasPRODUTO: TStringField;
    sqlConsulta_Lista_FaltasLOCAL: TStringField;
    sqlConsulta_Lista_FaltasDPRODUTO: TStringField;
    sqlConsulta_Lista_FaltasCOMPONENTE: TStringField;
    sqlConsulta_Lista_FaltasDCOMPONENTE: TStringField;
    sqlConsulta_Lista_FaltasPROPRIETARIO: TIntegerField;
    sqlConsulta_Lista_FaltasQUANTIDADE: TFloatField;
    sqlConsulta_Lista_FaltasOBSERVACAO: TStringField;
    sqlConsulta_Lista_FaltasVENDEDOR: TIntegerField;
    sqlConsulta_Lista_FaltasUSUARIO: TIntegerField;
    sqlConsulta_Lista_FaltasDATACRIACAO: TSQLTimeStampField;
    sqlConsulta_Lista_FaltasNOMEPROPRIETARIO: TStringField;
    sqlConsulta_Lista_FaltasNOMEVENDEDOR: TStringField;
    sqlConsulta_Lista_FaltasDISPONIVEL: TFloatField;
    dspConsulta_Lista_Faltas: TDataSetProvider;
    dspAcompanhamento_Categorias: TDataSetProvider;
    sqlAcompanhamento_Categorias: TSQLDataSet;
    sqlClientesSITE: TStringField;
    sqlFornecedores: TSQLDataSet;
    StringField75: TStringField;
    StringField76: TStringField;
    IntegerField22: TIntegerField;
    StringField77: TStringField;
    DateField12: TDateField;
    StringField78: TStringField;
    StringField79: TStringField;
    StringField80: TStringField;
    StringField81: TStringField;
    StringField82: TStringField;
    StringField83: TStringField;
    StringField84: TStringField;
    StringField85: TStringField;
    StringField86: TStringField;
    StringField87: TStringField;
    StringField88: TStringField;
    StringField89: TStringField;
    StringField90: TStringField;
    StringField91: TStringField;
    StringField92: TStringField;
    StringField93: TStringField;
    StringField94: TStringField;
    StringField95: TStringField;
    StringField96: TStringField;
    StringField97: TStringField;
    StringField98: TStringField;
    StringField99: TStringField;
    StringField100: TStringField;
    StringField101: TStringField;
    StringField102: TStringField;
    IntegerField23: TIntegerField;
    IntegerField24: TIntegerField;
    StringField103: TStringField;
    StringField104: TStringField;
    IntegerField25: TIntegerField;
    IntegerField26: TIntegerField;
    sqlFornecedoresTABELA: TIntegerField;
    FloatField82: TFloatField;
    DateField13: TDateField;
    DateField14: TDateField;
    DateField15: TDateField;
    IntegerField27: TIntegerField;
    FloatField83: TFloatField;
    FloatField84: TFloatField;
    FloatField85: TFloatField;
    FloatField86: TFloatField;
    IntegerField28: TIntegerField;
    FloatField87: TFloatField;
    FloatField88: TFloatField;
    IntegerField29: TIntegerField;
    IntegerField30: TIntegerField;
    FloatField89: TFloatField;
    IntegerField31: TIntegerField;
    FloatField90: TFloatField;
    FloatField91: TFloatField;
    IntegerField32: TIntegerField;
    DateField16: TDateField;
    StringField105: TStringField;
    StringField106: TStringField;
    FloatField92: TFloatField;
    IntegerField33: TIntegerField;
    StringField107: TStringField;
    StringField108: TStringField;
    StringField109: TStringField;
    StringField123: TStringField;
    IntegerField34: TIntegerField;
    SQLTimeStampField11: TSQLTimeStampField;
    StringField127: TStringField;
    StringField130: TStringField;
    StringField131: TStringField;
    StringField132: TStringField;
    sqlFornecedoresIDESTRANGEIRO: TStringField;
    dspFornecedores: TDataSetProvider;
    sqlFornecedores_Contatos: TSQLDataSet;
    StringField133: TStringField;
    StringField134: TStringField;
    IntegerField37: TIntegerField;
    IntegerField38: TIntegerField;
    StringField135: TStringField;
    StringField136: TStringField;
    StringField137: TStringField;
    StringField138: TStringField;
    StringField139: TStringField;
    StringField140: TStringField;
    StringField141: TStringField;
    StringField142: TStringField;
    StringField143: TStringField;
    SQLTimeStampField12: TSQLTimeStampField;
    dtsFornecedores: TDataSource;
    sqlFornecedores_Produtos: TSQLDataSet;
    StringField144: TStringField;
    StringField145: TStringField;
    IntegerField39: TIntegerField;
    IntegerField40: TIntegerField;
    StringField146: TStringField;
    StringField147: TStringField;
    StringField148: TStringField;
    StringField149: TStringField;
    StringField150: TStringField;
    SQLTimeStampField13: TSQLTimeStampField;
    sqlFornecedores_ProdutosPRECOCUSTO: TFloatField;
    sqlClientes_ProdutosATUALIZACAO: TDateField;
    sqlClientesFACHADA: TStringField;
    sqlFicha_Cadastral: TSQLDataSet;
    dspFicha_Cadastral: TDataSetProvider;
    dtsFicha_Cadastral: TDataSource;
    sqlFicha_CadastralEMPRESA: TStringField;
    sqlFicha_CadastralFILIAL: TStringField;
    sqlFicha_CadastralCODIGO: TIntegerField;
    sqlFicha_CadastralSTATUS: TStringField;
    sqlFicha_CadastralCLIENTE: TIntegerField;
    sqlFicha_CadastralEMISSAO: TDateField;
    sqlFicha_CadastralNOME: TStringField;
    sqlFicha_CadastralREDUZIDO: TStringField;
    sqlFicha_CadastralCNPJ: TStringField;
    sqlFicha_CadastralIE: TStringField;
    sqlFicha_CadastralENDERECO: TStringField;
    sqlFicha_CadastralNUMERO: TStringField;
    sqlFicha_CadastralBAIRRO: TStringField;
    sqlFicha_CadastralMUNICIPIO: TStringField;
    sqlFicha_CadastralUF: TStringField;
    sqlFicha_CadastralCEP: TStringField;
    sqlFicha_CadastralHOMEPAGE: TStringField;
    sqlFicha_CadastralDDI: TStringField;
    sqlFicha_CadastralDDD: TStringField;
    sqlFicha_CadastralTELEFONE: TStringField;
    sqlFicha_CadastralFAX: TStringField;
    sqlFicha_CadastralCELULAR: TStringField;
    sqlFicha_CadastralCOMPRADOR: TStringField;
    sqlFicha_CadastralPROPRIETARIO: TStringField;
    sqlFicha_CadastralEMAILNFE: TStringField;
    sqlFicha_CadastralPOSSUISKYPE: TStringField;
    sqlFicha_CadastralOBSERVACAO: TStringField;
    sqlFicha_CadastralBANCO: TIntegerField;
    sqlFicha_CadastralCOMPLEMENTO: TStringField;
    sqlFicha_CadastralAGENCIA: TStringField;
    sqlFicha_CadastralCONTA: TStringField;
    sqlFicha_CadastralGERENTEBANCO: TStringField;
    sqlFicha_CadastralDDIBANCO: TStringField;
    sqlFicha_CadastralDDDBANCO: TStringField;
    sqlFicha_CadastralTELEFONEBANCO: TStringField;
    sqlFicha_CadastralOBSERVACAOGERAL: TStringField;
    sqlFicha_CadastralVENDEDOR: TIntegerField;
    sqlFicha_CadastralDATACADASTRO: TSQLTimeStampField;
    sqlFicha_CadastralDDDCELULAR: TStringField;
    sqlFicha_CadastralFORNECEDOR1: TStringField;
    sqlFicha_CadastralFORNECEDOR2: TStringField;
    sqlFicha_CadastralFORNECEDOR3: TStringField;
    sqlFicha_CadastralFORNECEDOR4: TStringField;
    sqlFicha_CadastralTELEFONEFORNECEDOR1: TStringField;
    sqlFicha_CadastralTELEFONEFORNECEDOR2: TStringField;
    sqlFicha_CadastralTELEFONEFORNECEDOR3: TStringField;
    sqlFicha_CadastralTELEFONEFORNECEDOR4: TStringField;
    sqlFicha_CadastralNOMEVENDEDOR: TStringField;
    sqlFicha_CadastralDDDFORNECEDOR1: TStringField;
    sqlFicha_CadastralDDDFORNECEDOR2: TStringField;
    sqlFicha_CadastralDDDFORNECEDOR3: TStringField;
    sqlFicha_CadastralDDDFORNECEDOR4: TStringField;
    sqlFicha_CadastralDATAFUNDACAO: TDateField;
    sqlFicha_CadastralCNAEPRINCIPAL: TStringField;
    sqlFicha_CadastralCNAESECUNDARIO: TStringField;
    sqlFicha_CadastralORIGEMCADASTRO: TStringField;
    sqlFicha_CadastralBANCO2: TIntegerField;
    sqlFicha_CadastralAGENCIA2: TStringField;
    sqlFicha_CadastralCONTA2: TStringField;
    sqlFicha_CadastralGERENTEBANCO2: TStringField;
    sqlFicha_CadastralDDIBANCO2: TStringField;
    sqlFicha_CadastralDDDBANCO2: TStringField;
    sqlFicha_CadastralTELEFONEBANCO2: TStringField;
    sqlFicha_CadastralBANCO3: TIntegerField;
    sqlFicha_CadastralAGENCIA3: TStringField;
    sqlFicha_CadastralCONTA3: TStringField;
    sqlFicha_CadastralGERENTEBANCO3: TStringField;
    sqlFicha_CadastralDDIBANCO3: TStringField;
    sqlFicha_CadastralDDDBANCO3: TStringField;
    sqlFicha_CadastralTELEFONEBANCO3: TStringField;
    sqlFicha_Documentos: TSQLDataSet;
    sqlFicha_DocumentosEMPRESA: TStringField;
    sqlFicha_DocumentosFILIAL: TStringField;
    sqlFicha_DocumentosCODIGO: TIntegerField;
    sqlFicha_DocumentosSEQUENCIA: TIntegerField;
    sqlFicha_DocumentosCAMINHO: TStringField;
    sqlFicha_DocumentosNOME: TStringField;
    sqlFicha_DocumentosDATACRIACAO: TSQLTimeStampField;
    sqlFicha_DocumentosUSUARIO: TIntegerField;
    sqlConsulta_Lista_FaltasPRENOTA: TFloatField;
    sqlClientesOPTANTESIMPLES: TStringField;
    dspOfertas_Especiais: TDataSetProvider;
    sqlOfertas_Especiais: TSQLDataSet;
    sqlOfertas_EspeciaisEMPRESA: TStringField;
    sqlOfertas_EspeciaisFILIAL: TStringField;
    sqlOfertas_EspeciaisCODIGO: TIntegerField;
    sqlOfertas_EspeciaisPRODUTO: TStringField;
    sqlOfertas_EspeciaisDATAINCLUSAO: TDateField;
    sqlOfertas_EspeciaisDATAFINALIZACAO: TDateField;
    sqlOfertas_EspeciaisQUANTIDADE1: TIntegerField;
    sqlOfertas_EspeciaisPRECOFORA1: TFloatField;
    sqlOfertas_EspeciaisPRECOSP1: TFloatField;
    sqlOfertas_EspeciaisQUANTIDADE2: TIntegerField;
    sqlOfertas_EspeciaisPRECOFORA2: TFloatField;
    sqlOfertas_EspeciaisPRECOSP2: TFloatField;
    sqlOfertas_EspeciaisQUANTIDADE3: TIntegerField;
    sqlOfertas_EspeciaisPRECOFORA3: TFloatField;
    sqlOfertas_EspeciaisPRECOSP3: TFloatField;
    sqlOfertas_EspeciaisOBSERVACAO: TStringField;
    sqlOfertas_EspeciaisDATACRIACAO: TSQLTimeStampField;
    sqlOfertas_EspeciaisDESCRICAO: TStringField;
    sqlOfertas_EspeciaisCORDESTAQUE: TIntegerField;
    sqlProdutosDATASHEET: TStringField;
    sqlFicha_CadastralFACHADA: TStringField;
    sqlOfertas_EspeciaisSTATUS: TStringField;
    sqlFicha_CadastralVISITACAMPO: TStringField;
    sqlClientesVISITACAMPO: TStringField;
    sqlConcorrentes_Codigos_SantanaCODIGOCONCORRENTE: TStringField;
    sqlProdutosLINKSITE: TStringField;
    sqlMunicipios_Braspress: TSQLDataSet;
    sqlMunicipios_BraspressEMPRESA: TStringField;
    sqlMunicipios_BraspressFILIAL: TStringField;
    sqlMunicipios_BraspressCMUNICIPIO: TStringField;
    sqlMunicipios_BraspressUF: TStringField;
    sqlMunicipios_BraspressTIPO: TStringField;
    sqlMunicipios_BraspressMUNICIPIO: TStringField;
    sqlMunicipios_BraspressTXMATE10KG: TFloatField;
    sqlMunicipios_BraspressPERCENTUALATE10KG: TFloatField;
    sqlMunicipios_BraspressTASATE10KG: TFloatField;
    sqlMunicipios_BraspressTXMATE20KG: TFloatField;
    sqlMunicipios_BraspressPERCENTUALATE20KG: TFloatField;
    sqlMunicipios_BraspressTASATE20KG: TFloatField;
    sqlMunicipios_BraspressTXMATE30KG: TFloatField;
    sqlMunicipios_BraspressPERCENTUALATE30KG: TFloatField;
    sqlMunicipios_BraspressTXMATE40KG: TFloatField;
    sqlMunicipios_BraspressTASATE40KG: TFloatField;
    sqlMunicipios_BraspressTXMATE50KG: TFloatField;
    sqlMunicipios_BraspressPERCENTUALATE50KG: TFloatField;
    sqlMunicipios_BraspressTASATE50KG: TFloatField;
    sqlMunicipios_BraspressTXMATE60KG: TFloatField;
    sqlMunicipios_BraspressPERCENTUALATE60KG: TFloatField;
    sqlMunicipios_BraspressTASATE60KG: TFloatField;
    sqlMunicipios_BraspressTXMATE70KG: TFloatField;
    sqlMunicipios_BraspressPERCENTUALATE70KG: TFloatField;
    sqlMunicipios_BraspressTASATE70KG: TFloatField;
    sqlMunicipios_BraspressTXMACIMA70KG: TFloatField;
    sqlMunicipios_BraspressPERCENTUALACIMA70KG: TFloatField;
    sqlMunicipios_BraspressTASACIMA70KG: TFloatField;
    sqlMunicipios_BraspressDATACRIACAO: TSQLTimeStampField;
    dspMunicipios_Braspress: TDataSetProvider;
    sqlMunicipios_BraspressTASATE30KG: TFloatField;
    sqlMunicipios_BraspressPERCENTUALATE40KG: TFloatField;
    sqlCadastro_Visita: TSQLDataSet;
    sqlCadastro_VisitaEMPRESA: TStringField;
    sqlCadastro_VisitaFILIAL: TStringField;
    sqlCadastro_VisitaCODIGO: TIntegerField;
    sqlCadastro_VisitaDATA: TDateField;
    sqlCadastro_VisitaALLSEMI: TStringField;
    sqlCadastro_VisitaMXT: TStringField;
    sqlCadastro_VisitaRICOPECAS: TStringField;
    sqlCadastro_VisitaHAYAMAX: TStringField;
    sqlCadastro_VisitaSTA: TStringField;
    sqlCadastro_VisitaELGIN: TStringField;
    sqlCadastro_VisitaMULTILASER: TStringField;
    sqlCadastro_VisitaDUALCOMP: TStringField;
    sqlCadastro_VisitaINTER: TStringField;
    sqlCadastro_VisitaODERSO: TStringField;
    sqlCadastro_VisitaOUTROSCONC: TStringField;
    sqlCadastro_VisitaOBSOUTROSCONC: TStringField;
    sqlCadastro_VisitaMENOR10K: TStringField;
    sqlCadastro_VisitaMENOR20K: TStringField;
    sqlCadastro_VisitaMENOR30K: TStringField;
    sqlCadastro_VisitaMENOR50K: TStringField;
    sqlCadastro_VisitaMENOR100K: TStringField;
    sqlCadastro_VisitaMAIOR100K: TStringField;
    sqlCadastro_VisitaCOMPONENTES: TStringField;
    sqlCadastro_VisitaACESSORIOS: TStringField;
    sqlCadastro_VisitaCOMPEACESS: TStringField;
    sqlCadastro_VisitaVOLUME: TStringField;
    sqlCadastro_VisitaMIX: TStringField;
    sqlCadastro_VisitaVOLEMIX: TStringField;
    sqlCadastro_VisitaPRECO: TStringField;
    sqlCadastro_VisitaATENDIMENTO: TStringField;
    sqlCadastro_VisitaINVESTIMENTO: TStringField;
    sqlCadastro_VisitaTABLOIDE: TStringField;
    sqlCadastro_VisitaAMBIENTACAO: TStringField;
    sqlCadastro_VisitaCAMPANHA: TStringField;
    sqlCadastro_VisitaEXPOSITOR: TStringField;
    sqlCadastro_VisitaUNIFORME: TStringField;
    sqlCadastro_VisitaFACHADA: TStringField;
    sqlCadastro_VisitaOBSOUTROSINVEST: TStringField;
    sqlCadastro_VisitaRESUMOVISITA: TStringField;
    dspCadastro_Visita: TDataSetProvider;
    sqlCadastro_VisitaVENDEDOR: TIntegerField;
    sqlCadastro_VisitaNOMEVENDEDOR: TStringField;
    sqlCadastro_VisitaCLIENTE: TIntegerField;
    sqlCadastro_VisitaNOMECLIENTE: TStringField;
    sqlCadastro_VisitaOBJETIVOVISITA: TStringField;
    sqlCadastro_VisitaDATACRIACAO: TSQLTimeStampField;
    sqlCadastro_VisitaINFCOMPLEMENTAR: TStringField;
    sqlCadastro_VisitaOUTROINVEST: TStringField;
    sqlCadastro_VisitaASCOMPONENTES: TStringField;
    sqlConsulta_Meta_Clientes: TSQLDataSet;
    sqlConsulta_Meta_ClientesEMPRESA: TStringField;
    sqlConsulta_Meta_ClientesFILIAL: TStringField;
    sqlConsulta_Meta_ClientesCODIGO: TIntegerField;
    sqlConsulta_Meta_ClientesNOME: TStringField;
    sqlConsulta_Meta_ClientesMAIORCOMPRA: TFloatField;
    sqlConsulta_Meta_ClientesMENORCOMPRA: TFloatField;
    sqlConsulta_Meta_ClientesULTIMACOMPRA: TDateField;
    sqlConsulta_Meta_ClientesNUMEROCOMPRAS: TIntegerField;
    sqlConsulta_Meta_ClientesLIMITECREDITO: TFloatField;
    sqlConsulta_Meta_ClientesSALDOCREDITO: TFloatField;
    sqlConsulta_Meta_ClientesMETA: TFloatField;
    sqlConsulta_Meta_ClientesVENDEDOR: TIntegerField;
    sqlConsulta_Meta_ClientesNOMEVENDEDOR: TStringField;
    sqlConsulta_Meta_ClientesDATACADASTRO: TDateField;
    sqlConsulta_Meta_ClientesTOTALPEDIDOSMES: TIntegerField;
    sqlConsulta_Meta_ClientesTOTALPEDIDOSDIA: TIntegerField;
    sqlConsulta_Meta_ClientesTOTALPEDIDOS1A6: TIntegerField;
    sqlConsulta_Meta_ClientesCOMPRASMES: TFloatField;
    dspConsulta_Meta_Clientes: TDataSetProvider;
    sqlControle_Cambio: TSQLDataSet;
    dspControle_Cambio: TDataSetProvider;
    sqlControle_CambioEMPRESA: TStringField;
    sqlControle_CambioFILIAL: TStringField;
    sqlControle_CambioFORNECEDOR: TIntegerField;
    sqlControle_CambioITEM: TIntegerField;
    sqlControle_CambioTIPO: TStringField;
    sqlControle_CambioDATAFECHAMENTO: TDateField;
    sqlControle_CambioIMPORTACAO: TIntegerField;
    sqlControle_CambioINVOICE: TStringField;
    sqlControle_CambioCONTRATO: TStringField;
    sqlControle_CambioDI: TStringField;
    sqlControle_CambioTIPOFRETE: TStringField;
    sqlControle_CambioVALOR: TFloatField;
    sqlControle_CambioTAXADOLAR: TFloatField;
    sqlControle_CambioOBSERVACAO: TStringField;
    sqlControle_CambioDATACRIACAO: TSQLTimeStampField;
    sqlClientesVALORSERASAPJ: TFloatField;
    sqlClientes_Visitas: TSQLDataSet;
    sqlClientes_VisitasEMPRESA: TStringField;
    sqlClientes_VisitasFILIAL: TStringField;
    sqlClientes_VisitasCODIGO: TIntegerField;
    sqlClientes_VisitasCLIENTE: TIntegerField;
    sqlClientes_VisitasDATA: TDateField;
    sqlClientes_VisitasINFCOMPLEMENTAR: TStringField;
    sqlClientes_VisitasALLSEMI: TStringField;
    sqlClientes_VisitasMXT: TStringField;
    sqlClientes_VisitasRICOPECAS: TStringField;
    sqlClientes_VisitasHAYAMAX: TStringField;
    sqlClientes_VisitasSTA: TStringField;
    sqlClientes_VisitasELGIN: TStringField;
    sqlClientes_VisitasMULTILASER: TStringField;
    sqlClientes_VisitasDUALCOMP: TStringField;
    sqlClientes_VisitasINTER: TStringField;
    sqlClientes_VisitasASCOMPONENTES: TStringField;
    sqlClientes_VisitasODERSO: TStringField;
    sqlClientes_VisitasOUTROSCONC: TStringField;
    sqlClientes_VisitasOBSOUTROSCONC: TStringField;
    sqlClientes_VisitasMENOR10K: TStringField;
    sqlClientes_VisitasMENOR20K: TStringField;
    sqlClientes_VisitasMENOR30K: TStringField;
    sqlClientes_VisitasMENOR50K: TStringField;
    sqlClientes_VisitasMENOR100K: TStringField;
    sqlClientes_VisitasMAIOR100K: TStringField;
    sqlClientes_VisitasCOMPONENTES: TStringField;
    sqlClientes_VisitasACESSORIOS: TStringField;
    sqlClientes_VisitasCOMPEACESS: TStringField;
    sqlClientes_VisitasVOLUME: TStringField;
    sqlClientes_VisitasMIX: TStringField;
    sqlClientes_VisitasVOLEMIX: TStringField;
    sqlClientes_VisitasPRECO: TStringField;
    sqlClientes_VisitasATENDIMENTO: TStringField;
    sqlClientes_VisitasINVESTIMENTO: TStringField;
    sqlClientes_VisitasTABLOIDE: TStringField;
    sqlClientes_VisitasAMBIENTACAO: TStringField;
    sqlClientes_VisitasCAMPANHA: TStringField;
    sqlClientes_VisitasEXPOSITOR: TStringField;
    sqlClientes_VisitasUNIFORME: TStringField;
    sqlClientes_VisitasFACHADA: TStringField;
    sqlClientes_VisitasOUTROSINVEST: TStringField;
    sqlClientes_VisitasOBSOUTROSINVEST: TStringField;
    sqlClientes_VisitasRESUMOVISITA: TStringField;
    dspClientes_Visitas: TDataSetProvider;
    sqlClientes_Visitas_Documentos: TSQLDataSet;
    sqlClientes_Visitas_DocumentosEMPRESA: TStringField;
    sqlClientes_Visitas_DocumentosFILIAL: TStringField;
    sqlClientes_Visitas_DocumentosCODIGO: TIntegerField;
    sqlClientes_Visitas_DocumentosSEQUENCIA: TIntegerField;
    sqlClientes_Visitas_DocumentosCAMINHO: TStringField;
    sqlClientes_Visitas_DocumentosNOME: TStringField;
    sqlClientes_Visitas_DocumentosDATACRIACAO: TSQLTimeStampField;
    dtsClientes_Visitas: TDataSource;
    sqlClientes_VisitasVENDEDOR: TIntegerField;
    sqlClientes_VisitasNOMEVENDEDOR: TStringField;
    sqlClientes_VisitasNOMECLIENTE: TStringField;
    sqlClientes_VisitasDATACRIACAO: TSQLTimeStampField;
    sqlClientes_VisitasOBJETIVOVISITA: TStringField;
    sqlControle_CambioDESCONTO: TFloatField;
    sqlGrupos_Clientes_Dados: TSQLDataSet;
    sqlGrupos_Clientes_DadosEMPRESA: TStringField;
    sqlGrupos_Clientes_DadosFILIAL: TStringField;
    sqlGrupos_Clientes_DadosCODIGO: TIntegerField;
    sqlGrupos_Clientes_DadosDESCRICAO: TStringField;
    sqlGrupos_Clientes_DadosDATACRIACAO: TSQLTimeStampField;
    dspGrupos_Clientes_Dados: TDataSetProvider;
    dtsGrupos_Clientes_Dados: TDataSource;
    sqlGrupos_Clientes_Itens: TSQLDataSet;
    sqlGrupos_Clientes_ItensEMPRESA: TStringField;
    sqlGrupos_Clientes_ItensFILIAL: TStringField;
    sqlGrupos_Clientes_ItensDATACRIACAO: TSQLTimeStampField;
    sqlGrupos_Clientes_ItensCLIENTE: TIntegerField;
    sqlGrupos_Clientes_ItensNOMECLIENTE: TStringField;
    sqlGrupos_Clientes_ItensOBSERVACAO: TStringField;
    sqlGrupos_Clientes_ItensUFCLIENTE: TStringField;
    sqlGrupos_Clientes_ItensMUNICIPIOCLIENTE: TStringField;
    sqlGrupos_Clientes_ItensENDERECOCLIENTE: TStringField;
    sqlImportacoes_FornecedorGERADOFINANCEIRO: TStringField;
    sqlGrupos_Clientes_ItensCODIGO: TIntegerField;
    sqlNotas_Concorrentes: TSQLDataSet;
    dspNotas_Concorrentes: TDataSetProvider;
    sqlNotas_ConcorrentesEMPRESA: TStringField;
    sqlNotas_ConcorrentesFILIAL: TStringField;
    sqlNotas_ConcorrentesCODIGO: TIntegerField;
    sqlNotas_ConcorrentesNUMERO: TIntegerField;
    sqlNotas_ConcorrentesSERIE: TStringField;
    sqlNotas_ConcorrentesITEM: TIntegerField;
    sqlNotas_ConcorrentesCLIENTESANTANA: TIntegerField;
    sqlNotas_ConcorrentesCNPJ: TStringField;
    sqlNotas_ConcorrentesNOME: TStringField;
    sqlNotas_ConcorrentesIE: TStringField;
    sqlNotas_ConcorrentesEMAIL: TStringField;
    sqlNotas_ConcorrentesENDERECO: TStringField;
    sqlNotas_ConcorrentesBAIRRO: TStringField;
    sqlNotas_ConcorrentesMUNICIPIO: TStringField;
    sqlNotas_ConcorrentesCMUNICIPIO: TStringField;
    sqlNotas_ConcorrentesUF: TStringField;
    sqlNotas_ConcorrentesCEP: TStringField;
    sqlNotas_ConcorrentesTELEFONE: TStringField;
    sqlNotas_ConcorrentesPRODUTO: TStringField;
    sqlNotas_ConcorrentesDESCRICAO: TStringField;
    sqlNotas_ConcorrentesEAN: TStringField;
    sqlNotas_ConcorrentesNCM: TStringField;
    sqlNotas_ConcorrentesCFOP: TStringField;
    sqlNotas_ConcorrentesUM: TStringField;
    sqlNotas_ConcorrentesQUANTIDADE: TFloatField;
    sqlNotas_ConcorrentesUNITARIO: TFloatField;
    sqlNotas_ConcorrentesTOTAL: TFloatField;
    sqlNotas_ConcorrentesICMS: TFloatField;
    sqlNotas_ConcorrentesMVA: TFloatField;
    sqlNotas_ConcorrentesBCICMSST: TFloatField;
    sqlNotas_ConcorrentesVALORICMSST: TFloatField;
    sqlNotas_ConcorrentesIPI: TFloatField;
    sqlNotas_ConcorrentesVALORTITULO: TFloatField;
    sqlNotas_ConcorrentesDATACRIACAO: TSQLTimeStampField;
    sqlNotas_ConcorrentesEMISSAO: TDateField;
    sqlNotas_ConcorrentesHORA: TTimeField;
    dspProdutos_Grupos_Relativos: TDataSetProvider;
    dtsProdutos_Grupos_Relativos: TDataSource;
    sqlProdutos_Grupos_Relativos: TSQLDataSet;
    sqlProdutos_Grupos_RelativosEMPRESA: TStringField;
    sqlProdutos_Grupos_RelativosFILIAL: TStringField;
    sqlProdutos_Grupos_RelativosSTATUS: TStringField;
    sqlProdutos_Grupos_RelativosCODIGO: TIntegerField;
    sqlProdutos_Grupos_RelativosDESCRICAO: TStringField;
    sqlProdutos_Grupos_RelativosTIPO: TStringField;
    sqlProdutos_Grupos_RelativosOBSERVACAO: TMemoField;
    sqlProdutos_Grupos_RelativosINCLUIDO: TStringField;
    sqlProdutos_Grupos_RelativosALTERADO: TStringField;
    sqlProdutos_Grupos_RelativosDATACRIACAO: TSQLTimeStampField;
    sqlProdutos_Alternativos: TSQLDataSet;
    sqlProdutos_AlternativosEMPRESA: TStringField;
    sqlProdutos_AlternativosFILIAL: TStringField;
    sqlProdutos_AlternativosCODIGO: TStringField;
    sqlProdutos_AlternativosDESCRICAO: TStringField;
    sqlProdutos_AlternativosREDUZIDO: TStringField;
    sqlProdutos_AlternativosFABRICANTE: TStringField;
    sqlProdutos_AlternativosMARCA: TStringField;
    sqlProdutos_AlternativosMODELO: TStringField;
    sqlProdutos_AlternativosLOCALIZACAO: TStringField;
    sqlProdutos_Relacionados: TSQLDataSet;
    sqlProdutos_RelacionadosEMPRESA: TStringField;
    sqlProdutos_RelacionadosFILIAL: TStringField;
    sqlProdutos_RelacionadosCODIGO: TStringField;
    sqlProdutos_RelacionadosDESCRICAO: TStringField;
    sqlProdutos_RelacionadosREDUZIDO: TStringField;
    sqlProdutos_RelacionadosFABRICANTE: TStringField;
    sqlProdutos_RelacionadosMARCA: TStringField;
    sqlProdutos_RelacionadosMODELO: TStringField;
    sqlProdutos_RelacionadosLOCALIZACAO: TStringField;
    sqlProdutosFUNCIONALIDADE: TMemoField;
    sqlProdutosGRUPORELACIONADO: TIntegerField;
    sqlProdutosGRUPOALTERNATIVO: TIntegerField;
    sqlLista_Rep_Dados: TSQLDataSet;
    StringField41: TStringField;
    StringField110: TStringField;
    SQLTimeStampField14: TSQLTimeStampField;
    dspLista_Rep_Dados: TDataSetProvider;
    sqlLista_Rep_DadosDESCRICAO: TStringField;
    sqlLista_Rep_DadosVALIDADEDE: TDateField;
    sqlLista_Rep_DadosVALIDADEATE: TDateField;
    sqlLista_Rep_DadosOBSERVACAO: TStringField;
    sqlLista_Rep_Itens: TSQLDataSet;
    StringField111: TStringField;
    StringField112: TStringField;
    dtsLista_Rep_Dados: TDataSource;
    sqlLista_Rep_ItensID: TIntegerField;
    sqlLista_Rep_ItensCODIGO: TStringField;
    sqlLista_Rep_ItensDESCRICAO: TStringField;
    sqlLista_Rep_ItensPRECOVENDA1: TFloatField;
    sqlLista_Rep_ItensPRECOVENDA2: TFloatField;
    sqlLista_Rep_ItensPRECOVENDA3: TFloatField;
    sqlLista_Rep_ItensPRECOVENDA4: TFloatField;
    sqlLista_Rep_ItensPRECOVENDA5: TFloatField;
    sqlLista_Rep_ItensPRECOVENDA6: TFloatField;
    sqlLista_Rep_ItensPRECOVENDA7: TFloatField;
    sqlLista_Rep_ItensPRECOSP1: TFloatField;
    sqlLista_Rep_ItensPRECOSP2: TFloatField;
    sqlLista_Rep_ItensPRECOSP3: TFloatField;
    sqlLista_Rep_ItensPRECOSP4: TFloatField;
    sqlLista_Rep_ItensPRECOSP5: TFloatField;
    sqlLista_Rep_ItensPRECOSP6: TFloatField;
    sqlLista_Rep_ItensPRECOSP7: TFloatField;
    sqlLista_Rep_ItensOBSERVACAO: TStringField;
    sqlLista_Rep_DadosID: TIntegerField;
    sqlClientesCNAEPRINCIPAL: TStringField;
    sqlClientesCNAESECUNDARIO: TStringField;
    sqlClientesCRITERIORFA: TStringField;
    sqlFicha_CadastralEMAIL: TStringField;
    cdsProdutosCEST: TStringField;
    cdsProdutosNCM: TStringField;
    sqlClientesNOMEFANTASIA: TStringField;
    sqlFechamento_Comissao_Dados: TSQLDataSet;
    dspFechamento_Comissao_Dados: TDataSetProvider;
    sqlFechamento_Comissao_Itens: TSQLDataSet;
    dtsFechamento_Comissao_Dados: TDataSource;
    sqlFechamento_Comissao_DadosEMPRESA: TStringField;
    sqlFechamento_Comissao_DadosFILIAL: TStringField;
    sqlFechamento_Comissao_DadosCODIGO: TIntegerField;
    sqlFechamento_Comissao_DadosANO: TStringField;
    sqlFechamento_Comissao_DadosMES: TStringField;
    sqlFechamento_Comissao_DadosDESCRICAO: TStringField;
    sqlFechamento_Comissao_DadosOBSERVACAO: TStringField;
    sqlFechamento_Comissao_DadosDATACRIACAO: TSQLTimeStampField;
    sqlFechamento_Comissao_ItensEMPRESA: TStringField;
    sqlFechamento_Comissao_ItensFILIAL: TStringField;
    sqlFechamento_Comissao_ItensCODIGO: TIntegerField;
    sqlFechamento_Comissao_ItensVENDEDOR: TIntegerField;
    sqlFechamento_Comissao_ItensNOMEVENDEDOR: TStringField;
    sqlFechamento_Comissao_ItensTOTALVENDIDO: TFloatField;
    sqlFechamento_Comissao_ItensTOTALDESCONTOS: TFloatField;
    sqlFechamento_Comissao_ItensTOTALESPECIAIS: TFloatField;
    sqlFechamento_Comissao_ItensTOTALDEVOLUCOES: TFloatField;
    sqlFechamento_Comissao_ItensPERCENTUAL: TFloatField;
    sqlFechamento_Comissao_ItensPERCENTUALESPECIAIS: TFloatField;
    sqlFechamento_Comissao_ItensMINIMO: TFloatField;
    sqlFechamento_Comissao_ItensVALORCOMISSAO: TFloatField;
    sqlFechamento_Comissao_ItensOBSERVACAO: TStringField;
    sqlFechamento_Comissao_ItensDATACRIACAO: TSQLTimeStampField;
    sqlFechamento_Comissao_ItensMETA: TFloatField;
    sqlFechamento_Comissao_ItensMETAESPECIAIS: TFloatField;
    sqlFechamento_Comissao_DadosTIPO: TStringField;
    sqlVendedoresCOMISSAOESPECIAL1: TFloatField;
    sqlVendedoresCOMISSAOESPECIAL2: TFloatField;
    sqlVendedoresCOMISSAOESPECIAL3: TFloatField;
    sqlVendedoresSALARIOMINIMO: TFloatField;
    sqlVendedoresFUNCAO: TStringField;
    sqlFechamento_Comissao_ItensFUNCAO: TStringField;
    sqlFechamento_Comissao_DadosDATADE: TDateField;
    sqlFechamento_Comissao_DadosDATAATE: TDateField;
    sqlFechamento_Comissao_ItensBASECOMISSAO: TFloatField;
    sqlFechamento_Comissao_ItensCOMISSAOLIQUIDA: TFloatField;
    sqlMetas_Vendas_Dados_SantanaTIPO: TStringField;
    sqlProdutosCOMPOSICAO: TStringField;
    sqlProdutosVALIDADE: TStringField;
    sqlProdutosRISCOS: TStringField;
    sqlFechamento_Comissao_ItensVALORVALE: TFloatField;
    sqlFechamento_Comissao_DadosVALEFECHADO: TStringField;
    sqlFechamento_Comissao_DadosDATAVALE: TDateField;
    sqlFechamento_Comissao_ItensCOMISSAOESPECIAL: TFloatField;
    sqlGNRE_Dados: TSQLDataSet;
    sqlGNRE_DadosEMPRESA: TStringField;
    sqlGNRE_DadosFILIAL: TStringField;
    sqlGNRE_DadosNUMERO: TIntegerField;
    sqlGNRE_DadosSITUACAO: TStringField;
    sqlGNRE_Itens: TSQLDataSet;
    sqlGNRE_ItensEMPRESA: TStringField;
    sqlGNRE_ItensFILIAL: TStringField;
    sqlGNRE_ItensNUMERO: TIntegerField;
    sqlGNRE_ItensITEM: TIntegerField;
    sqlGNRE_ItensSITUACAO: TStringField;
    sqlGNRE_ItensUF: TStringField;
    sqlGNRE_ItensRECEITA: TStringField;
    sqlGNRE_ItensDETALHAMENTORECEITA: TStringField;
    sqlGNRE_ItensPRODUTO: TStringField;
    sqlGNRE_ItensORIGEMRECEITA: TStringField;
    sqlGNRE_ItensNUMERORECEITA: TStringField;
    sqlGNRE_ItensPERIODO: TStringField;
    sqlGNRE_ItensPARCELA: TIntegerField;
    sqlGNRE_ItensMESREFERENCIA: TStringField;
    sqlGNRE_ItensANOREFERENCIA: TStringField;
    sqlGNRE_ItensCONVENIO: TStringField;
    sqlGNRE_ItensVENCIMENTO: TDateField;
    sqlGNRE_ItensPAGAMENTO: TDateField;
    sqlGNRE_ItensVALOR: TFloatField;
    sqlGNRE_ItensNOMECLIENTE: TStringField;
    sqlGNRE_ItensCLIENTE: TIntegerField;
    sqlGNRE_ItensJUROS: TFloatField;
    sqlGNRE_ItensMULTA: TFloatField;
    sqlGNRE_ItensATUALIZACAOMONETARIA: TFloatField;
    sqlGNRE_ItensREPRESENTACAONUMERICA: TStringField;
    sqlGNRE_ItensCODIGOBARRAS: TStringField;
    sqlGNRE_ItensVENCIMENTOLIMITE: TDateField;
    sqlGNRE_ItensINFORMACAOCOMPLEMENTAR: TStringField;
    sqlGNRE_ItensRECIBO: TStringField;
    sqlGNRE_ItensDATARECIBO: TSQLTimeStampField;
    sqlGNRE_ItensCONTROLE: TStringField;
    sqlGNRE_ItensPREFIXO: TStringField;
    sqlGNRE_ItensNOTA: TIntegerField;
    dspGNRE_Dados: TDataSetProvider;
    dtsGNRE_Dados: TDataSource;
    sqlGNRE_itens_Extra: TSQLDataSet;
    sqlGNRE_itens_ExtraEMPRESA: TStringField;
    sqlGNRE_itens_ExtraFILIAL: TStringField;
    sqlGNRE_itens_ExtraNUMERO: TIntegerField;
    sqlGNRE_itens_ExtraITEM: TIntegerField;
    sqlGNRE_itens_ExtraCODIGO: TIntegerField;
    sqlGNRE_itens_ExtraTIPO: TStringField;
    sqlGNRE_itens_ExtraVALOR: TStringField;
    dtsGNRE_ITENS: TDataSource;
    sqlRegra_Gnre: TSQLDataSet;
    sqlRegra_GnreEMPRESA: TStringField;
    sqlRegra_GnreFILIAL: TStringField;
    sqlRegra_GnreREGRA: TIntegerField;
    sqlRegra_GnreUF: TStringField;
    sqlRegra_GnreRECEITA: TStringField;
    sqlRegra_GnreDETALHAMENTORECEITA: TStringField;
    sqlRegra_GnrePRODUTO: TStringField;
    sqlRegra_GnreORIGEMRECEITA: TStringField;
    sqlRegra_GnrePERIODO: TStringField;
    sqlRegra_GnreCONVENIO: TStringField;
    sqlRegra_GnreSITUACAO: TStringField;
    sqlRegra_GnreNOMEREGRA: TStringField;
    dspRegra_Gnre: TDataSetProvider;
    dtsFechamento_Comissao_Equipes: TDataSource;
    sqlFechamento_Comissao_Equipes: TSQLDataSet;
    StringField113: TStringField;
    StringField114: TStringField;
    IntegerField35: TIntegerField;
    sqlFechamento_Comissao_EquipesEQUIPE: TIntegerField;
    sqlFechamento_Comissao_EquipesNOME: TStringField;
    sqlFechamento_Comissao_EquipesTOTALVENDIDO: TFloatField;
    sqlFechamento_Comissao_EquipesTOTALDESCONTOS: TFloatField;
    sqlFechamento_Comissao_EquipesTOTALESPECIAIS: TFloatField;
    sqlFechamento_Comissao_EquipesTOTALDEVOLUCOES: TFloatField;
    sqlFechamento_Comissao_EquipesPERCENTUAL: TFloatField;
    sqlFechamento_Comissao_EquipesPERCENTUALESPECIAIS: TFloatField;
    sqlFechamento_Comissao_EquipesVALORCOMISSAO: TFloatField;
    sqlFechamento_Comissao_EquipesBASECOMISSAO: TFloatField;
    sqlFechamento_Comissao_EquipesCOMISSAOLIQUIDA: TFloatField;
    sqlFechamento_Comissao_EquipesCOMISSAOESPECIAL: TFloatField;
    sqlFechamento_Comissao_EquipesVALORVALE: TFloatField;
    sqlFechamento_Comissao_EquipesDATACRIACAO: TSQLTimeStampField;
    sqlFechamento_Comissao_EquipesTOTALLIQUIDO: TFloatField;
    sqlRegra_GnreEXTRA1: TIntegerField;
    sqlRegra_GnreEXTRA2: TIntegerField;
    sqlRegra_GnreEXTRA3: TIntegerField;
    sqlGNRE_ItensVALORFECP: TFloatField;
    sqlMetas_Produtos_Especiais: TSQLDataSet;
    sqlMetas_Produtos_EspeciaisEMPRESA: TStringField;
    sqlMetas_Produtos_EspeciaisFILIAL: TStringField;
    sqlMetas_Produtos_EspeciaisPRODUTO: TStringField;
    sqlMetas_Produtos_EspeciaisVENDEDOR: TIntegerField;
    sqlMetas_Produtos_EspeciaisANO: TIntegerField;
    sqlMetas_Produtos_EspeciaisMES: TStringField;
    sqlMetas_Produtos_EspeciaisMETAQUANTIDADE: TFloatField;
    sqlMetas_Produtos_EspeciaisOBSERVACAO: TMemoField;
    sqlMetas_Produtos_EspeciaisNOMEPRODUTO: TStringField;
    sqlMetas_Produtos_EspeciaisNOMEVENDEDOR: TStringField;
    dspMetas_Produtos_Especiais: TDataSetProvider;
    sqlRotaCep_BrasPress: TSQLDataSet;
    sqlRotaCep_BrasPressMES: TStringField;
    sqlRotaCep_BrasPressANO: TStringField;
    sqlRotaCep_BrasPressNUMERO: TIntegerField;
    sqlRotaCep_BrasPressID: TStringField;
    sqlRotaCep_BrasPressCEPINICIO: TStringField;
    sqlRotaCep_BrasPressCEPFIM: TStringField;
    sqlRotaCep_BrasPressUF: TStringField;
    sqlRotaCep_BrasPressLOCALIDADE: TStringField;
    sqlRotaCep_BrasPressLOCALIDADECEP: TStringField;
    sqlRotaCep_BrasPressFROTANUMERO: TStringField;
    sqlRotaCep_BrasPressROTANUMERO: TStringField;
    sqlRotaCep_BrasPressFROTAID: TStringField;
    sqlRotaCep_BrasPressFILIALSIGLA: TStringField;
    sqlRotaCep_BrasPressFILIALID: TStringField;
    sqlRotaCep_BrasPressCLASSIFICADO: TStringField;
    sqlRotaCep_BrasPressSEQUENCIA: TStringField;
    dspRotaCep_BrasPress: TDataSetProvider;
    sqlCampanhas_Vendedores_Santana: TSQLDataSet;
    sqlCampanhas_Vendedores_SantanaEMPRESA: TStringField;
    sqlCampanhas_Vendedores_SantanaFILIAL: TStringField;
    sqlCampanhas_Vendedores_SantanaCODIGO: TIntegerField;
    sqlCampanhas_Vendedores_SantanaPRODUTO: TStringField;
    sqlCampanhas_Vendedores_SantanaVENDEDOR: TIntegerField;
    sqlCampanhas_Vendedores_SantanaNOMEVENDEDOR: TStringField;
    sqlCampanhas_Vendedores_SantanaQUANTIDADE: TFloatField;
    sqlCampanhas_Vendedores_SantanaEMISSAO: TDateField;
    sqlCampanhas_Vendedores_SantanaDATACRIACAO: TSQLTimeStampField;
    dtsCampanha_Itens_Santana: TDataSource;
    sqlCampanha_Itens_Santana: TSQLDataSet;
    sqlCampanha_Itens_SantanaEMPRESA: TStringField;
    sqlCampanha_Itens_SantanaFILIAL: TStringField;
    sqlCampanha_Itens_SantanaCODIGO: TIntegerField;
    sqlCampanha_Itens_SantanaPRODUTO: TStringField;
    sqlCampanha_Itens_SantanaMETA: TFloatField;
    sqlCampanha_Itens_SantanaUNITARIOMETA: TFloatField;
    sqlCampanha_Itens_SantanaDISPONIVELINICIO: TFloatField;
    sqlCampanha_Itens_SantanaDISPONIVELFINAL: TFloatField;
    sqlCampanha_Itens_SantanaUNITARIOMETASP: TFloatField;
    sqlCampanha_Itens_SantanaDESCRICAOPRODUTO: TStringField;
    sqlCampanha_Itens_SantanaTOTALMETA: TFloatField;
    sqlCampanha_Itens_SantanaPERCENTUALQUANTIDADE: TFloatField;
    sqlCampanha_Itens_SantanaPERCENTUALPRECO: TFloatField;
    sqlCampanha_Itens_SantanaRESERVA: TFloatField;
    sqlCampanha_Itens_SantanaQTDEREALIZADO: TFloatField;
    sqlCampanha_Itens_SantanaPRECOREALIZADO: TFloatField;
    sqlClientes_Pendencias: TSQLDataSet;
    sqlClientes_PendenciasEMPRESA: TStringField;
    sqlClientes_PendenciasFILIAL: TStringField;
    sqlClientes_PendenciasCLIENTE: TIntegerField;
    sqlClientes_PendenciasNOMECLIENTE: TStringField;
    sqlClientes_PendenciasSEQUENCIA: TIntegerField;
    sqlClientes_PendenciasSITUACAO: TStringField;
    sqlClientes_PendenciasEMISSAO: TDateField;
    sqlClientes_PendenciasFINALIZACAO: TDateField;
    sqlClientes_PendenciasDEPARTAMENTO: TStringField;
    sqlClientes_PendenciasMOTIVO: TMemoField;
    sqlClientes_PendenciasCOMENTARIO: TMemoField;
    sqlClientes_PendenciasUSUARIOABERTURA: TIntegerField;
    sqlClientes_PendenciasNOMEUSUARIOABERTURA: TStringField;
    sqlClientes_PendenciasUSUARIOFINALIZACAO: TIntegerField;
    sqlClientes_PendenciasNOMEUSUARIOFINALIZACAO: TStringField;
    sqlClientes_PendenciasDATACRIACAO: TSQLTimeStampField;
    sqlClientes_PendenciasARQUIVO: TMemoField;
    dspClientes_Pendencias: TDataSetProvider;
    sqlConsulta_Campanhas_Santana: TSQLDataSet;
    StringField115: TStringField;
    StringField116: TStringField;
    IntegerField36: TIntegerField;
    StringField117: TStringField;
    DateField6: TDateField;
    DateField7: TDateField;
    SQLTimeStampField15: TSQLTimeStampField;
    dspConsulta_Campanhas_Santana: TDataSetProvider;
    sqlProgramacao_Compras: TSQLDataSet;
    sqlProgramacao_Embarques: TSQLDataSet;
    dtsProgramacao_Embarques: TDataSource;
    dspProgramacao_Compras: TDataSetProvider;
    dtsProgramacao_Itens: TDataSource;
    sqlProgramacao_Embarques_Itens: TSQLDataSet;
    sqlProgramacao_ComprasEMPRESA: TStringField;
    sqlProgramacao_ComprasFILIAL: TStringField;
    sqlProgramacao_ComprasCODIGO: TIntegerField;
    sqlProgramacao_ComprasDESCRICAO: TStringField;
    sqlProgramacao_ComprasSTATUS: TStringField;
    sqlProgramacao_ComprasDATACADASTRO: TDateField;
    sqlProgramacao_ComprasEMBARQUES: TIntegerField;
    sqlProgramacao_ComprasOBSERVACAO: TStringField;
    sqlProgramacao_ComprasUSUARIO: TStringField;
    sqlProgramacao_EmbarquesEMPRESA: TStringField;
    sqlProgramacao_EmbarquesFILIAL: TStringField;
    sqlProgramacao_EmbarquesCOMPRA: TIntegerField;
    sqlProgramacao_EmbarquesEMBARQUE: TIntegerField;
    sqlProgramacao_EmbarquesSTATUS: TStringField;
    sqlProgramacao_EmbarquesDATAEMBARQUE: TDateField;
    sqlProgramacao_EmbarquesDATACHEGADA: TDateField;
    sqlProgramacao_EmbarquesDESCRICAO: TStringField;
    sqlProgramacao_EmbarquesOBSERVACAO: TStringField;
    sqlProgramacao_EmbarquesUSUARIO: TStringField;
    sqlProgramacao_Embarques_ItensEMPRESA: TStringField;
    sqlProgramacao_Embarques_ItensFILIAL: TStringField;
    sqlProgramacao_Embarques_ItensCOMPRA: TIntegerField;
    sqlProgramacao_Embarques_ItensEMBARQUE: TIntegerField;
    sqlProgramacao_Embarques_ItensPRODUTO: TStringField;
    sqlProgramacao_Embarques_ItensDESCRICAO: TStringField;
    sqlProgramacao_Embarques_ItensQUANTIDADE: TIntegerField;
    sqlProgramacao_Embarques_ItensTARGET: TFloatField;
    sqlProgramacao_Embarques_ItensSOLICITACAO: TIntegerField;
    sqlProgramacao_Embarques_ItensOBSERVACAO: TStringField;
    sqlProgramacao_Embarques_ItensUSUARIO: TStringField;
    sqlProgramacao_Embarques_ItensDATACRIACAO: TSQLTimeStampField;
    sqlProgramacao_EmbarquesDATACRIACAO: TSQLTimeStampField;
    sqlProgramacao_ComprasDATACRIACAO: TSQLTimeStampField;
    sqlProdutos_Politica_Precos: TSQLDataSet;
    dspProdutos_Politica_Precos: TDataSetProvider;
    sqlProdutos_Politica_PrecosCODIGO: TStringField;
    sqlProdutos_Politica_PrecosPPPRECO1: TFloatField;
    sqlProdutos_Politica_PrecosPPPRECO2: TFloatField;
    sqlProdutos_Politica_PrecosPPPRECO3: TFloatField;
    sqlProdutos_Politica_PrecosPPPRECO4: TFloatField;
    sqlProdutos_Politica_PrecosPPPRECO5: TFloatField;
    sqlProdutos_Politica_PrecosPPPRECO6: TFloatField;
    sqlProdutos_Politica_PrecosPPPRECO7: TFloatField;
    sqlProdutos_Politica_PrecosPPPRECO8: TFloatField;
    sqlProdutos_Politica_PrecosPPPRECO9: TFloatField;
    sqlProdutos_Politica_PrecosPPPRECO10: TFloatField;
    sqlProdutos_Politica_PrecosPPQUANTIDADE1: TFloatField;
    sqlProdutos_Politica_PrecosPPQUANTIDADE2: TFloatField;
    sqlProdutos_Politica_PrecosPPQUANTIDADE3: TFloatField;
    sqlProdutos_Politica_PrecosPPQUANTIDADE4: TFloatField;
    sqlProdutos_Politica_PrecosPPQUANTIDADE5: TFloatField;
    sqlProdutos_Politica_PrecosPPQUANTIDADE6: TFloatField;
    sqlProdutos_Politica_PrecosPPQUANTIDADE7: TFloatField;
    sqlProdutos_Politica_PrecosPPQUANTIDADE8: TFloatField;
    sqlProdutos_Politica_PrecosPPQUANTIDADE9: TFloatField;
    sqlProdutos_Politica_PrecosPPQUANTIDADE10: TFloatField;
    sqlProdutos_Politica_PrecosEMPRESA: TStringField;
    sqlProdutos_Politica_PrecosFILIAL: TStringField;
    sqlProdutos_Limite_Minimo: TSQLDataSet;
    StringField118: TStringField;
    StringField119: TStringField;
    StringField120: TStringField;
    dspProdutos_Limite_Minimo: TDataSetProvider;
    sqlProdutos_Limite_MinimoLIMITEESTOQUE: TFloatField;
    sqlGNRE_DadosEMISSAO: TDateField;
    sqlGNRE_DadosDATACRIACAO: TSQLTimeStampField;
    sqlGNRE_ItensEMISSAO: TDateField;
    sqlGNRE_ItensDATACRIACAO: TSQLTimeStampField;
    sqlGNRE_itens_ExtraEMISSAO: TDateField;
    sqlGNRE_itens_ExtraDATACRIACAO: TSQLTimeStampField;
    sqlProgramacao_Compras_Cons: TSQLDataSet;
    StringField121: TStringField;
    StringField122: TStringField;
    IntegerField41: TIntegerField;
    StringField124: TStringField;
    StringField125: TStringField;
    DateField17: TDateField;
    IntegerField42: TIntegerField;
    StringField126: TStringField;
    StringField128: TStringField;
    SQLTimeStampField16: TSQLTimeStampField;
    sqlProgramacao_Embarques_Cons: TSQLDataSet;
    StringField129: TStringField;
    StringField151: TStringField;
    IntegerField43: TIntegerField;
    IntegerField44: TIntegerField;
    StringField152: TStringField;
    DateField18: TDateField;
    DateField19: TDateField;
    StringField153: TStringField;
    StringField154: TStringField;
    StringField155: TStringField;
    SQLTimeStampField17: TSQLTimeStampField;
    dtsProgramacao_Embarques_Cons: TDataSource;
    dspProgramacao_Compras_Cons: TDataSetProvider;
    sqlProgramacao_Itens_Cons: TSQLDataSet;
    dtsProgramacao_Itens_Cons: TDataSource;
    sqlProgramacao_Itens_ConsEMPRESA: TStringField;
    sqlProgramacao_Itens_ConsFILIAL: TStringField;
    sqlProgramacao_Itens_ConsCOMPRA: TIntegerField;
    sqlProgramacao_Itens_ConsEMBARQUE: TIntegerField;
    sqlProgramacao_Itens_ConsPRODUTO: TStringField;
    sqlProgramacao_Itens_ConsDESCRICAO: TStringField;
    sqlProgramacao_Itens_ConsQUANTIDADE: TIntegerField;
    sqlProgramacao_Itens_ConsTARGET: TFloatField;
    sqlProgramacao_Itens_ConsSOLICITACAO: TIntegerField;
    sqlProgramacao_Itens_ConsOBSERVACAO: TStringField;
    sqlProgramacao_Itens_ConsUSUARIO: TStringField;
    sqlProgramacao_Itens_ConsDATACRIACAO: TSQLTimeStampField;
    sqlClientesENVIOCATALOGO: TStringField;
    sqlClientesDATAENVIOCATALOGO: TDateField;
    sqlClientesRECEBIDOCATALOGO: TStringField;
    sqlClientesDATARECEBIDOCATALOGO: TDateField;
    sqlClientesSTATUSRECEBIDOCATALOGO: TStringField;
    sqlClientesMETA: TFloatField;
    sqlClientesADICIONAISCLIENTE: TStringField;
    sqlClientesVENDEDOR2: TIntegerField;
    sqlClientesSIMPLESNACIONAL: TStringField;
    sqlClientesPRODUTOSITE: TStringField;
    sqlClientesBKPDDD: TStringField;
    sqlClientesBKPTELEFONE: TStringField;
    sqlClientesQUANTIDADEMAXPRODUTO: TFloatField;
    sqlClientesHASH: TStringField;
    sqlClientesDATAENVIOCATALOGO2013: TDateField;
    sqlClientesDATARECEBIDOCATALOGO2013: TDateField;
    sqlClientesTELEFONEALTERNATIVO: TStringField;
    sqlClientesREGIAO: TStringField;
    sqlClientesINCLUIDO: TStringField;
    sqlClientesALTERADO: TStringField;
    sqlClientesCRITERIOIMPOSTOS: TStringField;
    sqlClientesEMAILMARKETING: TStringField;
    sqlClientesCONTATOCATALOGO: TStringField;
    sqlClientesTIPOCATALOGO: TStringField;
    sqlClientesQUANTIDADECATALOGO: TIntegerField;
    sqlClientesBKPREDUZIDO: TStringField;
    sqlClientesMEUCAMPO: TStringField;
    sqlClientesCGC: TStringField;
    sqlClientes_Referencias_Comerciais: TSQLDataSet;
    sqlClientes_Referencias_Bancarias: TSQLDataSet;
    sqlClientes_Referencias_BancariasEMPRESA: TStringField;
    sqlClientes_Referencias_BancariasFILIAL: TStringField;
    sqlClientes_Referencias_BancariasCODIGO: TIntegerField;
    sqlClientes_Referencias_BancariasITEM: TIntegerField;
    sqlClientes_Referencias_BancariasBANCOREFERENCIA1: TStringField;
    sqlClientes_Referencias_BancariasAGENCIAREFERENCIA1: TStringField;
    sqlClientes_Referencias_BancariasCONTAREFERENCIA1: TStringField;
    sqlClientes_Referencias_BancariasGERENTEREFERENCIA1: TStringField;
    sqlClientes_Referencias_BancariasINICIOCLIENTEREFERENCIA1: TStringField;
    sqlClientes_Referencias_BancariasOBSERVACAOREFERENCIA1: TStringField;
    sqlClientes_Referencias_BancariasBANCOREFERENCIA2: TStringField;
    sqlClientes_Referencias_BancariasAGENCIAREFERENCIA2: TStringField;
    sqlClientes_Referencias_BancariasCONTAREFERENCIA2: TStringField;
    sqlClientes_Referencias_BancariasGERENTEREFERENCIA2: TStringField;
    sqlClientes_Referencias_BancariasINICIOCLIENTEREFERENCIA2: TStringField;
    sqlClientes_Referencias_BancariasOBSERVACAOREFERENCIA2: TStringField;
    sqlClientes_Referencias_BancariasBANCOREFERENCIA3: TStringField;
    sqlClientes_Referencias_BancariasAGENCIAREFERENCIA3: TStringField;
    sqlClientes_Referencias_BancariasCONTAREFERENCIA3: TStringField;
    sqlClientes_Referencias_BancariasGERENTEREFERENCIA3: TStringField;
    sqlClientes_Referencias_BancariasINICIOCLIENTEREFERENCIA3: TStringField;
    sqlClientes_Referencias_BancariasOBSERVACAOREFERENCIA3: TStringField;
    sqlClientes_Referencias_BancariasDATACRIACAO: TSQLTimeStampField;
    sqlClientes_Referencias_BancariasALTERADO: TStringField;
    sqlClientes_Referencias_BancariasINCLUIDO: TStringField;
    sqlClientes_Referencias_ComerciaisEMPRESA: TStringField;
    sqlClientes_Referencias_ComerciaisFILIAL: TStringField;
    sqlClientes_Referencias_ComerciaisCODIGO: TIntegerField;
    sqlClientes_Referencias_ComerciaisITEM: TIntegerField;
    sqlClientes_Referencias_ComerciaisEMPRESAREFERENCIA1: TStringField;
    sqlClientes_Referencias_ComerciaisCONTATOREFERENCIA1: TStringField;
    sqlClientes_Referencias_ComerciaisLIMITEREFERENCIA1: TFloatField;
    sqlClientes_Referencias_ComerciaisMAIORCOMPRAREFERENCIA1: TFloatField;
    sqlClientes_Referencias_ComerciaisACUMULOATUALREFERENCIA1: TFloatField;
    sqlClientes_Referencias_ComerciaisULTIMACOMPRAREFERENCIA1: TDateField;
    sqlClientes_Referencias_ComerciaisQUANTIDADECOMPRASREFERENCIA1: TIntegerField;
    sqlClientes_Referencias_ComerciaisFORMAPGTOREFERENCIA1: TStringField;
    sqlClientes_Referencias_ComerciaisHISTORICOPGTOREFERENCIA1: TStringField;
    sqlClientes_Referencias_ComerciaisEMPRESAREFERENCIA2: TStringField;
    sqlClientes_Referencias_ComerciaisCONTATOREFERENCIA2: TStringField;
    sqlClientes_Referencias_ComerciaisLIMITEREFERENCIA2: TFloatField;
    sqlClientes_Referencias_ComerciaisMAIORCOMPRAREFERENCIA2: TFloatField;
    sqlClientes_Referencias_ComerciaisACUMULOATUALREFERENCIA2: TFloatField;
    sqlClientes_Referencias_ComerciaisULTIMACOMPRAREFERENCIA2: TDateField;
    sqlClientes_Referencias_ComerciaisQUANTIDADECOMPRASREFERENCIA2: TIntegerField;
    sqlClientes_Referencias_ComerciaisFORMAPGTOREFERENCIA2: TStringField;
    sqlClientes_Referencias_ComerciaisHISTORICOPGTOREFERENCIA2: TStringField;
    sqlClientes_Referencias_ComerciaisEMPRESAREFERENCIA3: TStringField;
    sqlClientes_Referencias_ComerciaisCONTATOREFERENCIA3: TStringField;
    sqlClientes_Referencias_ComerciaisLIMITEREFERENCIA3: TFloatField;
    sqlClientes_Referencias_ComerciaisMAIORCOMPRAREFERENCIA3: TFloatField;
    sqlClientes_Referencias_ComerciaisACUMULOATUALREFERENCIA3: TFloatField;
    sqlClientes_Referencias_ComerciaisULTIMACOMPRAREFERENCIA3: TDateField;
    sqlClientes_Referencias_ComerciaisQUANTIDADECOMPRASREFERENCIA3: TIntegerField;
    sqlClientes_Referencias_ComerciaisFORMAPGTOREFERENCIA3: TStringField;
    sqlClientes_Referencias_ComerciaisHISTORICOPGTOREFERENCIA3: TStringField;
    sqlClientes_Referencias_ComerciaisEMPRESAREFERENCIA4: TStringField;
    sqlClientes_Referencias_ComerciaisCONTATOREFERENCIA4: TStringField;
    sqlClientes_Referencias_ComerciaisLIMITEREFERENCIA4: TFloatField;
    sqlClientes_Referencias_ComerciaisMAIORCOMPRAREFERENCIA4: TFloatField;
    sqlClientes_Referencias_ComerciaisACUMULOATUALREFERENCIA4: TFloatField;
    sqlClientes_Referencias_ComerciaisULTIMACOMPRAREFERENCIA4: TDateField;
    sqlClientes_Referencias_ComerciaisQUANTIDADECOMPRASREFERENCIA4: TIntegerField;
    sqlClientes_Referencias_ComerciaisFORMAPGTOREFERENCIA4: TStringField;
    sqlClientes_Referencias_ComerciaisHISTORICOPGTOREFERENCIA4: TStringField;
    sqlClientes_Referencias_ComerciaisEMPRESAREFERENCIA5: TStringField;
    sqlClientes_Referencias_ComerciaisCONTATOREFERENCIA5: TStringField;
    sqlClientes_Referencias_ComerciaisLIMITEREFERENCIA5: TFloatField;
    sqlClientes_Referencias_ComerciaisMAIORCOMPRAREFERENCIA5: TFloatField;
    sqlClientes_Referencias_ComerciaisACUMULOATUALREFERENCIA5: TFloatField;
    sqlClientes_Referencias_ComerciaisULTIMACOMPRAREFERENCIA5: TDateField;
    sqlClientes_Referencias_ComerciaisQUANTIDADECOMPRASREFERENCIA5: TIntegerField;
    sqlClientes_Referencias_ComerciaisFORMAPGTOREFERENCIA5: TStringField;
    sqlClientes_Referencias_ComerciaisHISTORICOPGTOREFERENCIA5: TStringField;
    sqlClientes_Referencias_ComerciaisDATACRIACAO: TSQLTimeStampField;
    sqlClientes_Referencias_ComerciaisALTERADO: TStringField;
    sqlClientes_Referencias_ComerciaisINCLUIDO: TStringField;
    sqlClientesANTEPENULTIMO_VALOR_CONSULTA: TFloatField;
    sqlClientesANTEPENULTIMA_DATA_CONSULTA: TDateField;
    sqlClientesVALOR_ATUAL_CONSULTA: TFloatField;
    sqlClientesDATA_ATUAL_CONSULTA: TDateField;
    sqlClientesPENULTIMO_VALOR_CONSULTA: TFloatField;
    sqlClientesPENULTIMA_DATA_CONSULTA: TDateField;
    sqlRevistas_Dados: TSQLDataSet;
    dtsRevistas_Dados: TDataSource;
    sqlRevistas_Itens: TSQLDataSet;
    sqlRevistas_DadosEMPRESA: TStringField;
    sqlRevistas_DadosFILIAL: TStringField;
    sqlRevistas_DadosSTATUS: TStringField;
    sqlRevistas_DadosDATACADASTRO: TDateField;
    sqlRevistas_DadosNOME: TStringField;
    sqlRevistas_DadosPESSOA: TStringField;
    sqlRevistas_DadosREDUZIDO: TStringField;
    sqlRevistas_DadosENDERECO: TStringField;
    sqlRevistas_DadosNUMERO: TStringField;
    sqlRevistas_DadosCOMPLEMENTO: TStringField;
    sqlRevistas_DadosUF: TStringField;
    sqlRevistas_DadosMUNICIPIO: TStringField;
    sqlRevistas_DadosCMUNICIPIO: TStringField;
    sqlRevistas_DadosBAIRRO: TStringField;
    sqlRevistas_DadosCEP: TStringField;
    sqlRevistas_DadosCNPJ: TStringField;
    sqlRevistas_DadosCPF: TStringField;
    sqlRevistas_DadosIE: TStringField;
    sqlRevistas_DadosRG: TStringField;
    sqlRevistas_DadosEMAIL: TStringField;
    sqlRevistas_DadosEMAILNFE: TStringField;
    sqlRevistas_DadosHOMEPAGE: TStringField;
    sqlRevistas_DadosDATANASCIMENTO: TDateField;
    sqlRevistas_DadosDDI: TStringField;
    sqlRevistas_DadosDDD: TStringField;
    sqlRevistas_DadosTELEFONE: TStringField;
    sqlRevistas_DadosFAX: TStringField;
    sqlRevistas_DadosCONTATO: TStringField;
    sqlRevistas_DadosCPAIS: TStringField;
    sqlRevistas_DadosNPAIS: TStringField;
    sqlRevistas_DadosALTERADO: TStringField;
    sqlRevistas_DadosINCLUIDO: TStringField;
    sqlRevistas_ItensEMPRESA: TStringField;
    sqlRevistas_ItensFILIAL: TStringField;
    sqlRevistas_ItensNUMERO: TIntegerField;
    sqlRevistas_ItensITEM: TIntegerField;
    sqlRevistas_ItensDESCRICAO: TStringField;
    sqlRevistas_ItensALTERADO: TStringField;
    sqlRevistas_ItensINCLUIDO: TStringField;
    sqlRevistas_DadosNOMEFANTASIA: TStringField;
    sqlRevistas_DadosSITE: TStringField;
    dspRevistas: TDataSetProvider;
    sqlRevistas_DadosDATACRIACAO: TSQLTimeStampField;
    sqlRevistas_ItensDATAINICIO: TDateField;
    sqlRevistas_ItensDATAFIM: TDateField;
    sqlRevistas_ItensTIPO: TStringField;
    sqlRevistas_DadosCLIENTE: TIntegerField;
    sqlRevistas_DadosCELULAR: TStringField;
    sqlMovimentos_Bancarios: TSQLDataSet;
    sqlMovimentos_BancariosEMPRESA: TStringField;
    sqlMovimentos_BancariosFILIAL: TStringField;
    sqlMovimentos_BancariosMOVIMENTO: TStringField;
    sqlMovimentos_BancariosEMISSAO: TDateField;
    sqlMovimentos_BancariosESPECIE: TStringField;
    sqlMovimentos_BancariosBANCO: TIntegerField;
    sqlMovimentos_BancariosAGENCIA: TStringField;
    sqlMovimentos_BancariosCONTA: TStringField;
    sqlMovimentos_BancariosDOCUMENTO: TStringField;
    sqlMovimentos_BancariosIDENTIFICADOR: TIntegerField;
    sqlMovimentos_BancariosBANCOCHEQUE: TIntegerField;
    sqlMovimentos_BancariosAGENCIACHEQUE: TStringField;
    sqlMovimentos_BancariosCONTACHEQUE: TStringField;
    sqlMovimentos_BancariosPROPRIETARIOCHEQUE: TStringField;
    sqlMovimentos_BancariosVALORBASE: TFloatField;
    sqlMovimentos_BancariosVALOR: TFloatField;
    sqlMovimentos_BancariosMOVIMENTACAO: TDateField;
    sqlMovimentos_BancariosCATEGORIA: TStringField;
    sqlMovimentos_BancariosPREFIXO: TStringField;
    sqlMovimentos_BancariosNUMERO: TIntegerField;
    sqlMovimentos_BancariosPARCELA: TIntegerField;
    sqlMovimentos_BancariosTIPO: TStringField;
    sqlMovimentos_BancariosPROPRIETARIO: TIntegerField;
    sqlMovimentos_BancariosBASE10925: TFloatField;
    sqlMovimentos_BancariosVALORPIS: TFloatField;
    sqlMovimentos_BancariosVALORCOFINS: TFloatField;
    sqlMovimentos_BancariosVALORCSLL: TFloatField;
    sqlMovimentos_BancariosDECRESCIMO: TFloatField;
    sqlMovimentos_BancariosOUTROSDESCONTOS: TFloatField;
    sqlMovimentos_BancariosRETENCAO10925: TFloatField;
    sqlMovimentos_BancariosACRESCIMO: TFloatField;
    sqlMovimentos_BancariosMULTA: TFloatField;
    sqlMovimentos_BancariosTAXAPERMANENCIA: TFloatField;
    sqlMovimentos_BancariosJUROS: TFloatField;
    sqlMovimentos_BancariosBENEFICIARIO: TStringField;
    sqlMovimentos_BancariosCONCILIADO: TStringField;
    sqlMovimentos_BancariosEMPRESAORIGEM: TStringField;
    sqlMovimentos_BancariosFILIALORIGEM: TStringField;
    sqlMovimentos_BancariosORIGEM: TStringField;
    sqlMovimentos_BancariosCONFIGURACAO: TStringField;
    sqlMovimentos_BancariosSELECIONADO: TStringField;
    sqlMovimentos_BancariosIDCMP: TStringField;
    sqlMovimentos_BancariosLOTE: TIntegerField;
    sqlMovimentos_BancariosCC: TStringField;
    sqlMovimentos_BancariosBORDERO: TIntegerField;
    sqlMovimentos_BancariosDATACRIACAO: TSQLTimeStampField;
    sqlMovimentos_BancariosINCLUIDO: TStringField;
    sqlMovimentos_BancariosALTERADO: TStringField;
    sqlMovimentos_BancariosID: TStringField;
    sqlMovimentos_BancariosHISTORICO: TStringField;
    dspMovimentos_Bancarios: TDataSetProvider;
    sqlMovimentos_Bancarios_Rateios: TSQLDataSet;
    sqlMovimentos_Bancarios_RateiosEMPRESA: TStringField;
    sqlMovimentos_Bancarios_RateiosFILIAL: TStringField;
    sqlMovimentos_Bancarios_RateiosMOVIMENTO: TStringField;
    sqlMovimentos_Bancarios_RateiosEMISSAO: TDateField;
    sqlMovimentos_Bancarios_RateiosESPECIE: TStringField;
    sqlMovimentos_Bancarios_RateiosBANCO: TIntegerField;
    sqlMovimentos_Bancarios_RateiosAGENCIA: TStringField;
    sqlMovimentos_Bancarios_RateiosCONTA: TStringField;
    sqlMovimentos_Bancarios_RateiosDOCUMENTO: TStringField;
    sqlMovimentos_Bancarios_RateiosIDENTIFICADOR: TIntegerField;
    sqlMovimentos_Bancarios_RateiosCATEGORIA: TStringField;
    sqlMovimentos_Bancarios_RateiosPERCENTUAL: TFloatField;
    sqlMovimentos_Bancarios_RateiosVALOR: TFloatField;
    sqlMovimentos_Bancarios_RateiosDATACRIACAO: TSQLTimeStampField;
    dtsMovimentos_Bancarios_Rateios: TDataSource;
    sqlMovimentos_BancariosTIPOMOVIMENTO: TStringField;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
    procedure dspCotacoes_VendasBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspMetas_Vendas_Dados_SantanaBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspCampanhas_Dados_SantanaBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspImportacoes_SantanaBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspPre_Compra_DadosBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspCotacao_Rapida_DadosBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspReclamacoes_Dados_SantanaBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspSolicitacoes_ReposicaoBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspTarefasBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dspFuncionariosBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspSetoresBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dspProjetosBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dspConcorrentes_Dados_SantanaAfterApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
    procedure dspConcorrentes_Dados_SantanaGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: WideString);
    procedure dspConcorrentes_Dados_SantanaBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspCallbackBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dspLigacoes_PassivasBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspLigacoes_AtivasBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspSetores_EstoqueBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspPedidos_Compras_DadosAfterApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
    procedure dspPedidos_Compras_DadosBeforeApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
    procedure dspPedidos_Compras_DadosBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspVendedoresAfterApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
    procedure dspVendedoresBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspVendedores_GruposBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspSolicitacoes_SemicondutoresBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspMovimentos_SemicondutoresBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspClientes_santanaBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dspEmpresa_GrupoAfterApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
    procedure dspEmpresa_GrupoBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure sqlEmpresa_Grupo_ClientesBeforeOpen(DataSet: TDataSet);
    procedure dspCampanhas_SugestoesBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure sqlCampanha_Itens_SantanaBeforeOpen(DataSet: TDataSet);
    procedure sqlConsulta_Lista_FaltasBeforeOpen(DataSet: TDataSet);
    procedure sqlFicha_Cadastral_____BeforeOpen(DataSet: TDataSet);
    procedure dspFicha_Cadastral_____BeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspFornecedoresBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspOrdem_Producao_SantanaBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspFicha_CadastralBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure sqlFicha_CadastralBeforeOpen(DataSet: TDataSet);
    procedure dspOfertas_EspeciaisBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure sqlOfertas_EspeciaisBeforeOpen(DataSet: TDataSet);
    procedure dspCadastro_VisitaBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure sqlConsulta_Meta_ClientesBeforeOpen(DataSet: TDataSet);
    procedure dspConsulta_Meta_ClientesGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: WideString);
    procedure dspControle_CambioBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspClientes_VisitasBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspGrupos_Clientes_DadosBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspProdutos_Grupos_RelativosBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure sqlProdutos_AlternativosBeforeOpen(DataSet: TDataSet);
    procedure sqlProdutosBeforeOpen(DataSet: TDataSet);
    procedure dspLista_Rep_DadosBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspFechamento_Comissao_DadosBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspGNRE_DadosBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspGNRE_DadosGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: WideString);
    procedure sqlGNRE_ItensBeforeOpen(DataSet: TDataSet);
    procedure sqlMetas_Produtos_EspeciaisBeforeOpen(DataSet: TDataSet);
    procedure sqlRotaCep_BrasPressBeforeOpen(DataSet: TDataSet);
    procedure sqlCampanhas_Vendedores_SantanaBeforeOpen(DataSet: TDataSet);
    procedure dspRotaCep_BrasPressBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspProgramacao_ComprasBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure dspRevistasBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dspMovimentos_BancariosBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
  private
    sysMasterId: Integer;
    _sql: TSQLDataSet;
    _dsp: TDataSetProvider;
    sysInfGenerica: Variant;
    procedure AtualizaEstoqueSemicondutores(const Operacao: TOpDoc;
      Movimento, Produto: String; Saldo: Double);
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TDSSMCustoms.dspCadastro_VisitaBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlCadastro_Visita);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
          sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'RELATORIO_VISITAS', 'CODIGO');
      end;
    end;

    if (sysMasterId > 0) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        begin
          Edit;

          FieldByName('CODIGO').NewValue := sysMasterId;

          Post;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspCallbackBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlCallback);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
          sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'CALLBACK', 'CODIGO');
      end;
    end;

    if (sysMasterId > 0) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        begin
          Edit;
          FieldByName('CODIGO').NewValue := sysMasterId;
          Post;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspCampanhas_Dados_SantanaBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlCampanhas_Dados_Santana);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
          sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'CAMPANHAS_DADOS_SANTANA', 'CODIGO');
      end;
    end;

    if (sysMasterId > 0) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        begin
          Edit;
          FieldByName('CODIGO').NewValue := sysMasterId;
          Post;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspCampanhas_SugestoesBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlCampanhas_Sugestoes);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
          sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'CAMPANHAS_SUGESTOES', 'NUMERO');
      end;
    end;

    if (sysMasterId > 0) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        begin
          Edit;
          FieldByName('NUMERO').NewValue := sysMasterId;
          Post;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspClientes_santanaBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlClientes);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
          sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'CLIENTES', 'CODIGO');
      end;
    end;

    if (sysMasterId > 0) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        begin
          Edit;
          FieldByName('CODIGO').NewValue := sysMasterId;
          Post;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspClientes_VisitasBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlClientes_Visitas);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
          sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'CLIENTES_VISITAS', 'CODIGO');
      end;
    end;

    if (sysMasterId > 0) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        begin
          Edit;

          FieldByName('CODIGO').NewValue := sysMasterId;

          Post;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspConcorrentes_Dados_SantanaAfterApplyUpdates(
  Sender: TObject; var OwnerData: OleVariant);
begin
  sysMasterId := 0;
end;

procedure TDSSMCustoms.dspConcorrentes_Dados_SantanaBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
var
  Header: Boolean;
begin
  Header := (SourceDS = sqlConcorrentes_Dados_Santana);
  // tratamento para o mestre
  if (Header)then
  begin
    if (UpdateKind = ukInsert) then
    begin
      with DeltaDS do
        sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'CONCORRENTES_DADOS', 'CODIGO');
    end;
  end;

  // atribuindo o id para o dataset em questão
  if (sysMasterId > 0) then
  begin
    if (UpdateKind = ukInsert) then
    begin
      with DeltaDS do
      begin
        Edit;
        FieldByName('CODIGO').NewValue := sysMasterId;
        Post;
      end;
    end;
  end;
end;

procedure TDSSMCustoms.dspConcorrentes_Dados_SantanaGetTableName(
  Sender: TObject; DataSet: TDataSet; var TableName: WideString);
begin
  if (DataSet = sqlConcorrentes_Dados_Santana) then
    TableName := 'CONCORRENTES_DADOS'
  else
    TableName := 'CONCORRENTES_ITENS';
end;

procedure TDSSMCustoms.dspConsulta_Meta_ClientesGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: WideString);
begin
  TableName := 'SP_METAS_CLIENTES';
end;

procedure TDSSMCustoms.dspControle_CambioBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlControle_Cambio);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
          sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'CONTROLE_CAMBIO', 'ITEM');
      end;
    end;

    if (sysMasterId > 0) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        begin
          Edit;

          FieldByName('ITEM').NewValue := sysMasterId;

          Post;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspCotacao_Rapida_DadosBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlCotacao_Rapida_Dados);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
          sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'COTACAO_RAPIDA_DADOS', 'NUMERO');
      end;
    end;

    if (sysMasterId > 0) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        begin
          Edit;
          FieldByName('NUMERO').NewValue := sysMasterId;
          Post;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspCotacoes_VendasBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  Header: Boolean;
begin
  Header := (SourceDS = sqlCotacoes_Vendas);

  if (Header) then
  begin
    if (UpdateKind = ukInsert) then
    begin
      with DeltaDS do
        sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'COTACOES_VENDAS', 'NUMERO');
    end;
  end;

  if (sysMasterId > 0) then
  begin
    if (UpdateKind = ukInsert) then
    begin
      with DeltaDS do
      begin
        Edit;
        FieldByName('NUMERO').NewValue := sysMasterId;
        Post;
      end;
    end;
  end;
end;

procedure TDSSMCustoms.dspEmpresa_GrupoAfterApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
  sysMasterId := 0;
end;

procedure TDSSMCustoms.dspEmpresa_GrupoBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlEmpresa_Grupo);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
          sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'EMPRESA_GRUPO', 'CODIGO');
      end;
    end;

    if (sysMasterId > 0) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        begin
          Edit;
          FieldByName('CODIGO').NewValue := sysMasterId;
          Post;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspFechamento_Comissao_DadosBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlFechamento_Comissao_Dados);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
          sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'FECHAMENTO_COMISSAO_DADOS', 'CODIGO');
      end;
    end;

    if (sysMasterId > 0) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        begin
          Edit;
          FieldByName('CODIGO').NewValue := sysMasterId;
          Post;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspFicha_CadastralBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlFicha_Cadastral);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'FICHA_CADASTRAL', 'CODIGO');
      end;

      if (sysMasterId > 0) then
      begin
        if (UpdateKind = ukInsert) then
        begin
          with DeltaDS do
          begin
            Edit;

            FieldByName('CODIGO').NewValue := sysMasterId;

            Post;
          end;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspFicha_Cadastral_____BeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlFicha_Cadastral);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'CLIENTES_FICHA', 'CODIGO');
      end;

      if (sysMasterId > 0) then
      begin
        if (UpdateKind = ukInsert) then
        begin
          with DeltaDS do
          begin
            Edit;

            FieldByName('CODIGO').NewValue := sysMasterId;

            Post;
          end;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspFornecedoresBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlFornecedores);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
          sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'FORNECEDORES', 'CODIGO');
      end;
    end;

    if (sysMasterId > 0) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        begin
          Edit;

          FieldByName('CODIGO').NewValue := sysMasterId;

          Post;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspFuncionariosBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlFuncionarios);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
          sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'FUNCIONARIOS', 'CODIGO');
      end;
    end;

    if (sysMasterId > 0) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        begin
          Edit;
          FieldByName('CODIGO').NewValue := sysMasterId;
          Post;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspGNRE_DadosBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlGNRE_Dados);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
          sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue,
            'GNRE_DADOS', 'NUMERO');
      end;
    end;

    if (sysMasterId > 0) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        begin
          Edit;
          FieldByName('NUMERO').NewValue := sysMasterId;
          Post;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspGNRE_DadosGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: WideString);
begin
  if (DataSet = sqlGNRE_Dados) then
    TableName := 'GNRE_DADOS'
  else
  if (DataSet = sqlGNRE_Itens) then
    TableName := 'GNRE_ITENS'
  else
  if (DataSet = sqlGNRE_itens_Extra) then
    TableName := 'GNRE_ITENS_EXTRA'
  else
    TableName := 'GNRE_DADOS';
end;

procedure TDSSMCustoms.dspGrupos_Clientes_DadosBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlGrupos_Clientes_Dados);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
          sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'GRUPOS_CLIENTES_DADOS', 'CODIGO');
      end;
    end;

    if (sysMasterId > 0) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        begin
          Edit;

          FieldByName('CODIGO').NewValue := sysMasterId;

          Post;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspImportacoes_SantanaBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlImportacoes_Santana);

    if (Header) then
      if (UpdateKind = ukInsert) then
        with DeltaDS do
          sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'IMPORTACOES_SANTANA', 'NUMERO');

    if (sysMasterId > 0) then
    begin
      if (UpdateKind = ukInsert) then
        with DeltaDS do
        begin
          Edit;
          FieldByName('NUMERO').NewValue := sysMasterId;
          Post;
        end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspLigacoes_AtivasBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlLigacoes_Ativas);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
          sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'LIGACOES_ATIVAS', 'CODIGO');
      end;
    end;

    if (sysMasterId > 0) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        begin
          Edit;
          FieldByName('CODIGO').NewValue := sysMasterId;
          Post;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspLigacoes_PassivasBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlLigacoes_Passivas);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
          sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'LIGACOES_PASSIVAS', 'CODIGO');
      end;
    end;

    if (sysMasterId > 0) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        begin
          Edit;
          FieldByName('CODIGO').NewValue := sysMasterId;
          Post;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspLista_Rep_DadosBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlLista_Rep_Dados);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
          sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'LISTA_REP_DADOS', 'CODIGO');
      end;
    end;

    if (sysMasterId > 0) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        begin
          Edit;

          FieldByName('CODIGO').NewValue := sysMasterId;

          Post;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspMetas_Vendas_Dados_SantanaBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlMetas_Vendas_Dados_Santana);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
          sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'METAS_VENDAS_DADOS_SANTANA', 'CODIGO');
      end;
    end;

    if (sysMasterId > 0) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        begin
          Edit;
          FieldByName('CODIGO').NewValue := sysMasterId;
          Post;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspMovimentos_BancariosBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
var Header: Boolean;
    Empresa: String;
    Filial: String;
    Operacao: TOpDoc;
    Movimento: String;
    Emissao: TDateTime;
    Especie: String;
    Banco: Integer;
    Agencia: String;
    Conta: String;
    Identificador: Integer;
    BancoCheque: Integer;
    AgenciaCheque: String;
    ContaCheque: String;
    ProprietarioCheque: String;
    Documento: String;
    Valor: Currency;
    Movimentacao: TDateTime;
    Prefixo: String;
    Numero: Integer;
    Parcela: Integer;
    Tipo: String;
    Proprietario: Integer;
    Beneficiario: String;
    Historico: String;
    Decrescimo: Currency;
    OutrosDescontos: Currency;
    Acrescimo: Currency;
    Multa: Currency;
    TaxaPermanencia: Currency;
    Juros: Currency;
    ValorEfetivo: Currency;
    Configuracao: String;
    Conciliado: String;
    Origem: String;
    Carteira: String;
    GeraMovimentacao: String;
    GeraComissao: String;
    GeraCheque: String;
    //
    ValorPago: Currency;
    ValorPIS: Currency;
    ValorCOFINS: Currency;
    ValorCSLL: Currency;
    Retencao10925: Currency;
    //
    VencimentoReal: TDateTime;
    DiasAtraso: Integer;
    //
    Bordero: Integer;
begin
  Header := (SourceDS = sqlMovimentos_Bancarios);
  if ( Header ) then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('SALDOS_BANCARIOS', Empresa, Filial);
      case UpdateKind of
        ukInsert:
          with DeltaDs do
            begin
              Operacao           := odIncluir;  // Incluir
              Movimento          := FieldByName('MOVIMENTO').NewValue;
              Emissao            := FieldByName('EMISSAO').NewValue;
              Especie            := FieldByName('ESPECIE').NewValue;
              Banco              := FieldByName('BANCO').NewValue;
              Agencia            := FieldByName('AGENCIA').NewValue;
              Conta              := FieldByName('CONTA').NewValue;
              Identificador      := FieldByName('IDENTIFICADOR').NewValue;
              BancoCheque        := FieldByName('BANCOCHEQUE').NewValue;
              AgenciaCheque      := FieldByName('AGENCIACHEQUE').NewValue;
              ContaCheque        := FieldByName('CONTACHEQUE').NewValue;
              ProprietarioCheque := FieldByName('PROPRIETARIOCHEQUE').NewValue;
              Documento          := FieldByName('DOCUMENTO').NewValue;
              Movimentacao       := FieldByName('MOVIMENTACAO').NewValue;
              Prefixo            := FieldByName('PREFIXO').NewValue;
              Numero             := FieldByName('NUMERO').NewValue;
              Parcela            := FieldByName('PARCELA').NewValue;
              Tipo               := FieldByName('TIPO').NewValue;
              Proprietario       := FieldByName('PROPRIETARIO').NewValue;
              Beneficiario       := FieldByName('BENEFICIARIO').NewValue;
              Historico          := FieldByName('HISTORICO').NewValue;
              Valor              := FieldByName('VALOR').NewValue;
              Decrescimo         := FieldByName('DECRESCIMO').NewValue;
              OutrosDescontos    := FieldByName('OUTROSDESCONTOS').NewValue;
              Retencao10925      := FieldByName('RETENCAO10925').NewValue;
              Acrescimo          := FieldByName('ACRESCIMO').NewValue;
              Multa              := FieldByName('MULTA').NewValue;
              TaxaPermanencia    := FieldByName('TAXAPERMANENCIA').NewValue;
              Juros              := FieldByName('JUROS').NewValue;
              ValorEfetivo       := (Valor + ((Decrescimo+OutrosDescontos+Retencao10925) - (Acrescimo+Multa+TaxaPermanencia+Juros)));
              Configuracao       := FieldByName('CONFIGURACAO').NewValue;
              Conciliado         := FieldByName('CONCILIADO').NewValue;
              Origem             := FieldByName('ORIGEM').NewValue;
              Bordero            :=  FieldByName('BORDERO').NewValue;
              Carteira           := Copy(Configuracao, 1, 1);
              GeraMovimentacao   := Copy(Configuracao, 2, 1);
              GeraComissao       := Copy(Configuracao, 3, 1);
              GeraCheque         := Copy(Configuracao, 4, 1);
              // Atualização dos saldos bancários se configurado
              if ( (GeraMovimentacao = VB_SIM) ) then
                __SuperClass.GenericsF.AtualizaSaldosBancarios(Operacao, Movimento, Banco, Agencia, Conta, Movimentacao, Valor);
              // Pagamento ou recebimento com cheque
              if ( ((GeraCheque = VB_SIM) and (Especie = '02')) or ((GeraCheque = VB_SIM) and (Especie = '03')) ) then
                begin
                  if  (BancoCheque <> 0) and (AgenciaCheque <> '') and (ContaCheque <> '') then
                     __SuperClass.GenericsF.GeraCheque(Operacao, Movimento, BancoCheque, AgenciaCheque, ContaCheque, ProprietarioCheque, Documento, Identificador, Valor, Movimentacao, Prefixo, Numero, Parcela, Tipo, Proprietario, Beneficiario, Historico);
              end;
              // Atualizando informações sobre o título em questão
              if ( (Prefixo <> '') and (Numero <> 0) and (Parcela <> 0) and (Tipo <> '') and (Proprietario <> 0) ) then
                begin
                  // Atualizando o título em questão
                  __SuperClass.GenericsF.AtualizaDadosBaixaTitulo(Operacao, Movimento, Prefixo, Numero, Parcela, Tipo, Proprietario, ValorEfetivo, VencimentoReal, Movimentacao);
                  // Calculando os dias de atraso
                  if (Movimentacao <= VencimentoReal) then
                    DiasAtraso := 0
                  else
                    DiasAtraso := DaysBetween(Movimentacao, VencimentoReal);
                  // Subtraindo o saldo devedor do cliente/fornecedor
                  __SuperClass.GenericsF.AtualizaDadosFinanceiros(Operacao, Movimento, Tipo, Proprietario, Valor, True, DiasAtraso);
              end;
              // Atualiza o Item do Bordero se o movimento estiver dentro de um bordero
              if (Bordero <> 0) then
                begin
                  __SuperClass.GenericsF.AtualizaSaldoItemBordero(Operacao, Bordero, Prefixo, Numero, Parcela, Tipo, Proprietario, ValorEfetivo);
                  __SuperClass.GenericsF.AtualizaStatusBordero(Bordero);
              end;
          end;
        ukDelete:
          with DeltaDs do
            begin
              Operacao         := odExcluir;  // Excluir
              Movimento        := FieldByName('MOVIMENTO').OldValue;
              Emissao            := FieldByName('EMISSAO').OldValue;
              Especie          := FieldByName('ESPECIE').OldValue;
              Banco            := FieldByName('BANCO').OldValue;
              Agencia          := FieldByName('AGENCIA').OldValue;
              Conta            := FieldByName('CONTA').OldValue;
              Identificador    := FieldByName('IDENTIFICADOR').OldValue;
              BancoCheque      := FieldByName('BANCOCHEQUE').OldValue;
              AgenciaCheque    := FieldByName('AGENCIACHEQUE').OldValue;
              ContaCheque      := FieldByName('CONTACHEQUE').OldValue;
              ProprietarioCheque := FieldByName('PROPRIETARIOCHEQUE').OldValue;
              Documento        := FieldByName('DOCUMENTO').OldValue;
              Movimentacao     := FieldByName('MOVIMENTACAO').OldValue;
              Prefixo          := FieldByName('PREFIXO').OldValue;
              Numero           := FieldByName('NUMERO').OldValue;
              Parcela          := FieldByName('PARCELA').OldValue;
              Tipo             := FieldByName('TIPO').OldValue;
              Proprietario     := FieldByName('PROPRIETARIO').OldValue;
              Beneficiario     := FieldByName('BENEFICIARIO').OldValue;
              Historico        := FieldByName('HISTORICO').OldValue;
              Valor            := FieldByName('VALOR').OldValue;
              Decrescimo       := FieldByName('DECRESCIMO').OldValue;
              OutrosDescontos  := FieldByName('OUTROSDESCONTOS').OldValue;
              Retencao10925    := FieldByName('RETENCAO10925').OldValue;
              Acrescimo        := FieldByName('ACRESCIMO').OldValue;
              Multa            := FieldByName('MULTA').OldValue;
              TaxaPermanencia  := FieldByName('TAXAPERMANENCIA').OldValue;
              Juros            := FieldByName('JUROS').OldValue;
              ValorEfetivo     := (Valor + ((Decrescimo+OutrosDescontos+Retencao10925) - (Acrescimo+Multa+TaxaPermanencia+Juros)));
              Configuracao     := FieldByName('CONFIGURACAO').OldValue;
              Conciliado       := FieldByName('CONCILIADO').OldValue;
              Origem           := FieldByName('ORIGEM').OldValue;
              Bordero            :=  FieldByName('BORDERO').OldValue;
              Carteira         := Copy(Configuracao, 1, 1);
              GeraMovimentacao := Copy(Configuracao, 2, 1);
              GeraComissao     := Copy(Configuracao, 3, 1);
              GeraCheque       := Copy(Configuracao, 4, 1);
              // Atualização dos saldos bancários se configurado
              if ( (GeraMovimentacao = VB_SIM) ) then
                __SuperClass.GenericsF.AtualizaSaldosBancarios(Operacao, Movimento, Banco, Agencia, Conta, Movimentacao, Valor);
              // Pagamento ou recebimento com cheque
              if ( ((GeraCheque = VB_SIM) and (Especie = '02')) or ((GeraCheque = VB_SIM) and (Especie = '03')) ) then
                begin
                  if  (BancoCheque <> 0) and (AgenciaCheque <> '') and (ContaCheque <> '') then
                    __SuperClass.GenericsF.GeraCheque(Operacao, Movimento, BancoCheque, AgenciaCheque, ContaCheque, ProprietarioCheque, Documento, Identificador, Valor, Movimentacao, Prefixo, Numero, Parcela, Tipo, Proprietario, Beneficiario, Historico);
              end;
              // Verifica se eh baixa de título
              if ( (Prefixo <> '') and (Numero <> 0) and (Parcela <> 0) and (Tipo <> '') and (Proprietario <> 0) ) then
                begin
                 // Atualizando o título em questão
                  __SuperClass.GenericsF.AtualizaDadosBaixaTitulo(Operacao, Movimento, Prefixo, Numero, Parcela, Tipo, Proprietario, ValorEfetivo, VencimentoReal, Movimentacao);
                  // Calculando os dias de atraso
                  if (Movimentacao <= VencimentoReal) then
                    DiasAtraso := 0
                  else
                    DiasAtraso := DaysBetween(Movimentacao, VencimentoReal);
                  // Somando o saldo devedor do cliente/fornecedor
                  __SuperClass.GenericsF.AtualizaDadosFinanceiros(Operacao, Movimento, Tipo, Proprietario, Valor, True, DiasAtraso);
              end;
              // Atualiza o Item do Bordero se o movimento estiver dentro de um bordero
              if (Bordero <> 0) then
                begin
                  __SuperClass.GenericsF.AtualizaSaldoItemBordero(Operacao, Bordero, Prefixo, Numero, Parcela, Tipo, Proprietario, ValorEfetivo);
                  __SuperClass.GenericsF.AtualizaStatusBordero(Bordero);
              end;
          end;
      end;
  end;
end;

procedure TDSSMCustoms.dspMovimentos_SemicondutoresBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
var
  Empresa, Filial: String;
  Regra: Integer;
  Emissao: TDateTime;
  Produto: String;
  Documento: Integer;
  Quantidade: Double;
  Observacao: String;

  Filtro: String;
  Header: Boolean;
  Campos: Variant;
  Operacao: TOpDoc;

  Tipo: String;
  UsaEstrutura: String;
  OperacaoInterna: TOpDoc;
begin
  Header := (SourceDS = sqlMovimentos_Semicondutores);

  // tratamento para o mestre
  if (Header)then
  begin
    if (UpdateKind = ukInsert) then
    begin
      with DeltaDS do
      begin
        Operacao   := odIncluir;
        Empresa    := FieldByName('EMPRESA').NewValue;
        Filial     := FieldByName('FILIAL').NewValue;
        Regra      := FieldByName('REGRA').NewValue;
        Produto    := FieldByName('PRODUTO').NewValue;
        Emissao    := FieldByName('EMISSAO').NewValue;
        Documento  := FieldByName('DOCUMENTO').NewValue;
        Quantidade := FieldByName('QUANTIDADE').NewValue;
        Observacao := FieldByName('OBSERVACAO').NewValue;
      end;
    end
    else if (UpdateKind = ukModify) then
    begin
      with DeltaDS do
      begin
        Operacao   := odExcluir;
        Empresa    := FieldByName('EMPRESA').OldValue;
        Filial     := FieldByName('FILIAL').OldValue;
        Regra      := FieldByName('REGRA').OldValue;
        Produto    := FieldByName('PRODUTO').OldValue;
        Emissao    := FieldByName('EMISSAO').OldValue;
        Documento  := FieldByName('DOCUMENTO').OldValue;
        Quantidade := FieldByName('QUANTIDADE').OldValue;
        Observacao := FieldByName('OBSERVACAO').OldValue;

        // Verificando a regra de estoque
        __SuperClass.DBFunctions.GetEntityOwner('REGRAS_ESTOQUE', Empresa, Filial);
        Campos := VarArrayOf(['TIPO']);
        Filtro := Format ('EMPRESA = %s AND FILIAL = %s AND CODIGO = %d', [QuotedStr(Empresa), QuotedStr(Filial), Regra]);
        Campos := __SuperClass.DBFunctions.GetFieldValues('REGRAS_ESTOQUE', Filtro, Campos);
        if ((VarType(Campos) = varNull) or (VarType(Campos) = varEmpty)) then
          raise Exception.Create('Servidor de Aplicação: Falha na pesquisa da regra de estoque.')
        else
        begin
          Tipo := Campos[0];
          UsaEstrutura := Campos[1];
          if (Tipo = MI_SAIDA) then
            // Neste local fazer as movimentações da nova tabela de saldo!!!
            AtualizaEstoqueSemicondutores(odIncluir, Tipo, Produto, Quantidade)
          else
            // Neste local fazer as movimentações da nova tabela de saldo!!!
            AtualizaEstoqueSemicondutores(odExcluir, Tipo, Produto, Quantidade);
        end;

        Operacao := odIncluir;

        if (not VarIsEmpty(FieldByName('EMPRESA').NewValue)) then
          Empresa := FieldByName('EMPRESA').NewValue
        else
          Empresa := FieldByName('EMPRESA').OldValue;
        if (not VarIsEmpty(FieldByName('FILIAL').NewValue)) then
          Filial := FieldByName('FILIAL').NewValue
        else
          Filial := FieldByName('FILIAL').OldValue;
        if (not VarIsEmpty(FieldByName('REGRA').NewValue)) then
          Regra := FieldByName('REGRA').NewValue
        else
          Regra := FieldByName('REGRA').OldValue;
        if (not VarIsEmpty(FieldByName('PRODUTO').NewValue)) then
          Produto := FieldByName('PRODUTO').NewValue
        else
          Produto := FieldByName('PRODUTO').OldValue;
        if (not VarIsEmpty(FieldByName('EMISSAO').NewValue)) then
          Emissao := FieldByName('EMISSAO').NewValue
        else
          Emissao := FieldByName('EMISSAO').OldValue;
        if (not VarIsEmpty(FieldByName('DOCUMENTO').NewValue)) then
          Documento := FieldByName('DOCUMENTO').NewValue
        else
          Documento := FieldByName('DOCUMENTO').OldValue;
        if (not VarIsEmpty(FieldByName('QUANTIDADE').NewValue)) then
          Quantidade := FieldByName('QUANTIDADE').NewValue
        else
          Quantidade := FieldByName('QUANTIDADE').OldValue;
        if (not VarIsEmpty(FieldByName('OBSERVACAO').NewValue)) then
          Observacao := FieldByName('OBSERVACAO').NewValue
        else
          Observacao := FieldByName('OBSERVACAO').OldValue;
      end;
    end
    else if (UpdateKind = ukDelete) then
    begin
      with DeltaDS do
      begin
        Operacao   := odExcluir;
        Empresa    := FieldByName('EMPRESA').OldValue;
        Filial     := FieldByName('FILIAL').OldValue;
        Regra      := FieldByName('REGRA').OldValue;
        Produto    := FieldByName('PRODUTO').OldValue;
        Emissao    := FieldByName('EMISSAO').OldValue;
        Documento  := FieldByName('DOCUMENTO').OldValue;
        Quantidade := FieldByName('QUANTIDADE').OldValue;
      end;
    end
    else
    begin
      with DeltaDS do
      begin
        Operacao   := odNenhum;
        Empresa    := '';
        Filial     := '';
        Regra      := 0;
        Produto    := '';
        Emissao    := 0;
        Documento  := 0;
        Quantidade := 0;
      end;
    end;

    // Verificando a regra de estoque
    __SuperClass.DBFunctions.GetEntityOwner('REGRAS_ESTOQUE', Empresa, Filial);
    Campos := VarArrayOf(['TIPO']);
    Filtro := Format ('EMPRESA = %s AND FILIAL = %s AND CODIGO = %d', [QuotedStr(Empresa), QuotedStr(Filial), Regra]);
    Campos := __SuperClass.DBFunctions.GetFieldValues('REGRAS_ESTOQUE', Filtro, Campos);
    if ((VarType(Campos) = varNull) or (VarType(Campos) = varEmpty)) then
      raise Exception.Create('Servidor de Aplicação: Falha na pesquisa da regra de estoque.')
    else
    begin
      Tipo := Campos[0];

      if (Operacao = odIncluir) then
      begin
        if (Tipo = MI_SAIDA) then
          OperacaoInterna := odExcluir // Troca para subtrair o estoque
        else
          OperacaoInterna := odIncluir; // Troca para somar o estoque
      end
      else
      begin
        if (Tipo = MI_SAIDA) then
          OperacaoInterna := odIncluir
        else
          OperacaoInterna := odExcluir;
      end;
    end;

    // Atualiza o estoque
    AtualizaEstoqueSemicondutores(OperacaoInterna, Tipo, Produto, Quantidade);
  end;
end;

procedure TDSSMCustoms.dspOfertas_EspeciaisBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlOfertas_Especiais);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
          sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'OFERTAS_ESPECIAIS', 'CODIGO');
      end;
    end;

    if (sysMasterId > 0) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        begin
          Edit;

          FieldByName('CODIGO').NewValue := sysMasterId;

          Post;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspOrdem_Producao_SantanaBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlOrdem_Producao_Santana);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
          sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'ORDEM_PRODUCAO_SANTANA', 'NUMERO');
      end;
    end;

    if (sysMasterId > 0) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        begin
          Edit;

          FieldByName('NUMERO').NewValue := sysMasterId;

          Post;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspPedidos_Compras_DadosAfterApplyUpdates(
  Sender: TObject; var OwnerData: OleVariant);
begin
  sysMasterId := 0;
  sysInfGenerica := Unassigned;
end;

procedure TDSSMCustoms.dspPedidos_Compras_DadosBeforeApplyUpdates(
  Sender: TObject; var OwnerData: OleVariant);
begin
  if ( (VarType(OwnerData) <> varNull) and (VarType(OwnerData) <> varEmpty) ) then
    sysInfGenerica := OwnerData;
end;

procedure TDSSMCustoms.dspPedidos_Compras_DadosBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
var
  Header: Boolean;
  Items: Boolean;
  Operacao: TOpDoc;
  Empresa: String;
  Filial: String;
  Campos: Variant;
  Filtro : String;
  Numero: Integer;
  Fornecedor: Integer;
  Produto: String;
  Descricao: String;
  Local: String;
  Quantidade: Double;
  Regra: Integer;
  GeraEstoque: String;
  Terceiros: String;
  EspecieDocumento: String;
  Estrutura: Variant;
  Contador: Integer;
  Saldo: Variant;
  Componente: String;
  QtdeComp: Double;
  EmTerceiros: Double;
  Necessidade: Double;
begin
  Header      := (SourceDS = sqlPedidos_Compras_Dados);
  Items       := (SourceDS = sqlPedidos_Compras_Itens);
  Regra       := 0;
  Quantidade  := 0;

  // tratamento para o mestre
  if (Header)then
    if (UpdateKind = ukInsert) then
      with DeltaDS do
        sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'PEDIDOS_COMPRAS_DADOS', 'NUMERO');

  // atribuindo o id para o dataset em questão
  if (sysMasterId > 0) then
  begin
    if (UpdateKind = ukInsert) then
    begin
      with DeltaDS do
      begin
        Edit;
        FieldByName('NUMERO').NewValue := sysMasterId;
        Post;
      end;
    end;
  end;

  // atualizando a previsao de entrada para o produto em questão
  if (Items) then
  begin
    if ((VarType(sysInfGenerica) <> varNull) and (VarType(sysInfGenerica) <> varEmpty)) then
    begin
      EspecieDocumento := VarAsType(sysInfGenerica[0], varString);
      Fornecedor       := VarAsType(sysInfGenerica[1], varInteger);
    end;

    // verificando o tipo de operação
    case UpdateKind of
      ukInsert: // Inclusão do item
        with DeltaDS do
        begin
          Operacao   := odIncluir;
          Empresa    := FieldByName('EMPRESA').NewValue;
          Filial     := FieldByName('FILIAL').NewValue;
          Numero     := FieldByName('NUMERO').NewValue;
          Produto    := FieldByName('PRODUTO').NewValue;
          Descricao  := FieldByName('DESCRICAO').NewValue;
          Local      := FieldByName('LOCAL').NewValue;
          Quantidade := FieldByName('QUANTIDADE').NewValue;
          Regra      := FieldByName('REGRA').NewValue;
        end;
      ukModify:  // Alteração do item
        with DeltaDS do
        begin
          Operacao   := odExcluir;
          Empresa    := FieldByName('EMPRESA').OldValue;
          Filial     := FieldByName('FILIAL').OldValue;
          Numero     := FieldByName('NUMERO').OldValue;
          Produto    := FieldByName('PRODUTO').OldValue;
          Descricao  := FieldByName('DESCRICAO').OldValue;
          Local      := FieldByName('LOCAL').OldValue;
          Quantidade := FieldByName('QUANTIDADE').OldValue;
          Regra      := FieldByName('REGRA').OldValue;
          // tratamento para quantidade prevista do produto
          if ((Quantidade > 0) and (Regra > 0)) then
          begin
            __SuperClass.DBFunctions.GetEntityOwner('REGRAS_FISCAIS', Empresa, Filial);
            Campos := VarArrayOf(['GERAESTOQUE', 'TERCEIROS']);
            Filtro := Format ('EMPRESA = %s AND FILIAL = %s AND CODIGO = %d', [QuotedStr(Empresa), QuotedStr(Filial), Regra]);
            Campos := __SuperClass.DBFunctions.GetFieldValues('REGRAS_FISCAIS', Filtro, Campos);
            if ((VarType(Campos) = varNull) or (VarType(Campos) = varEmpty)) then
              raise Exception.Create('Servidor de Aplicação: Falha na pesquisa da regra fiscal.')
            else
            begin
              GeraEstoque      := Campos[0];
              Terceiros        := Campos[1];
              if (GeraEstoque = VB_SIM) then
                __SuperClass.GenericsF.AtualizaPrevisaoPC(Operacao, Produto, Local, Quantidade);
              //
              // Tratamento de reserva de produtos em Terceiros
              //
              if (EspecieDocumento = 'DET') then
              begin
                if (Terceiros = CT_DEVOLUCAO) then
                begin
                  Estrutura := __SuperClass.GenericsF.ObtemEstrutura(Produto);
                  if (VarType(Estrutura) <> varNull) and (VarType(Estrutura) <> varEmpty) then
                  begin
                    for Contador := VarArrayLowBound(Estrutura, 1) to VarArrayHighBound(Estrutura, 1) do
                    begin
                      Componente := Estrutura[Contador][0];
                      QtdeComp   := Estrutura[Contador][3];
                      Saldo := __SuperClass.GenericsF.PegaSaldoAtualEstoque(Componente, Local);
//                      EmTerceiros := Saldo[SE_EMTERCEIROS] - Saldo[SE_RESERVAEMTERCEIROS];
                      Necessidade := QtdeComp * Quantidade;
                      // Exclui faltas independente de condição
                      __SuperClass.GenericsF.GeraListaFaltas(Operacao, Now, Numero, Produto, Descricao, Local, Componente, Estrutura[Contador][1], Fornecedor, IfThen(EmTerceiros < 0, Necessidade, (Necessidade - EmTerceiros)), IfThen(EmTerceiros < 0, Necessidade, (Necessidade - EmTerceiros)));
//                      __SuperClass.GenericsF.AtualizaReservaTerceiros(Operacao, CT_EM_TERCEIROS, Componente, Local, Necessidade, 0);
                    end;
                  end;
                end;
              end;
            end;
          end;

          Operacao := odIncluir;
          // atualizando a previsao de entrada
          if ( not VarIsEmpty(FieldByName('EMPRESA').NewValue) ) then
            Empresa     := FieldByName('EMPRESA').NewValue
          else
            Empresa     := FieldByName('EMPRESA').OldValue;

          if ( not VarIsEmpty(FieldByName('FILIAL').NewValue) ) then
            Filial      := FieldByName('FILIAL').NewValue
          else
            Filial      := FieldByName('FILIAL').OldValue;

          if ( not VarIsEmpty(FieldByName('NUMERO').NewValue) ) then
            Numero     := FieldByName('NUMERO').NewValue
          else
            Numero     := FieldByName('NUMERO').OldValue;

          if ( not VarIsEmpty(FieldByName('PRODUTO').NewValue) ) then
            Produto    := FieldByName('PRODUTO').NewValue
          else
            Produto    := FieldByName('PRODUTO').OldValue;

          if ( not VarIsEmpty(FieldByName('DESCRICAO').NewValue) ) then
            Descricao  := FieldByName('DESCRICAO').NewValue
          else
            Descricao  := FieldByName('DESCRICAO').OldValue;

          if ( not VarIsEmpty(FieldByName('LOCAL').NewValue) ) then
            Local      := FieldByName('LOCAL').NewValue
          else
            Local      := FieldByName('LOCAL').OldValue;

          if ( not VarIsEmpty(FieldByName('QUANTIDADE').NewValue) ) then
            Quantidade := FieldByName('QUANTIDADE').NewValue
          else
            Quantidade := FieldByName('QUANTIDADE').OldValue;

          if ( not VarIsEmpty(FieldByName('REGRA').NewValue) ) then
            Regra      := FieldByName('REGRA').NewValue
          else
            Regra      := FieldByName('REGRA').OldValue;
        end;
      ukDelete: // Exclusão do item
        with DeltaDS do
        begin
          Operacao   := odExcluir;
          Empresa    := FieldByName('EMPRESA').OldValue;
          Filial     := FieldByName('FILIAL').OldValue;
          Numero     := FieldByName('NUMERO').OldValue;
          Produto    := FieldByName('PRODUTO').OldValue;
          Descricao  := FieldByName('DESCRICAO').OldValue;
          Local      := FieldByName('LOCAL').OldValue;
          Quantidade := FieldByName('QUANTIDADE').OldValue;
          Regra      := FieldByName('REGRA').OldValue;
        end;
      end;

      // Tratamento para quantidade prevista do produto
      if (Regra > 0) then
      begin
        __SuperClass.DBFunctions.GetEntityOwner('REGRAS_FISCAIS', Empresa, Filial);
        Campos := VarArrayOf(['GERAESTOQUE', 'TERCEIROS']);
        Filtro := Format ('EMPRESA = %s AND FILIAL = %s AND CODIGO = %d', [QuotedStr(Empresa), QuotedStr(Filial), Regra]);
        Campos := __SuperClass.DBFunctions.GetFieldValues('REGRAS_FISCAIS', Filtro, Campos);
        if ( (VarType(Campos) = varNull) or (VarType(Campos) = varEmpty) ) then
          raise Exception.Create('Servidor de Aplicação: Falha na pesquisa da regra fiscal.')
        else
        begin
          GeraEstoque      := Campos[0];
          Terceiros        := Campos[1];
          if (GeraEstoque = VB_SIM) then
            __SuperClass.GenericsF.AtualizaPrevisaoPC(Operacao, Produto, Local, Quantidade);
          //
          // Tratamento de reserva de produtos em Terceiros
          //
          if (EspecieDocumento = 'DET') then
          begin
            if ( (Terceiros = CT_DEVOLUCAO) ) then
            begin
              Estrutura := __SuperClass.GenericsF.ObtemEstrutura(Produto);
              if (VarType(Estrutura) <> varNull) and (VarType(Estrutura) <> varEmpty) then
              begin
                for Contador := VarArrayLowBound(Estrutura, 1) to VarArrayHighBound(Estrutura, 1) do
                begin
                  Componente := Estrutura[Contador][0];
                  QtdeComp   := Estrutura[Contador][3];
                  Saldo := __SuperClass.GenericsF.PegaSaldoAtualEstoque(Componente, Local);
//                  EmTerceiros := Saldo[SE_EMTERCEIROS] - Saldo[SE_RESERVAEMTERCEIROS];
                  Necessidade := QtdeComp * Quantidade;
                  if (Operacao = odExcluir) or (EmTerceiros < Necessidade) then
                    __SuperClass.GenericsF.GeraListaFaltas(Operacao, Now, Numero, Produto, Descricao, Local, Componente, Estrutura[Contador][1], Fornecedor, IfThen(EmTerceiros < 0, Necessidade, (Necessidade - EmTerceiros)), IfThen(EmTerceiros < 0, Necessidade, (Necessidade - EmTerceiros)));
//                  __SuperClass.GenericsF.AtualizaReservaTerceiros(Operacao, CT_EM_TERCEIROS, Componente, Local, Necessidade, 0);
                end;
              end;
            end;
          end;
        end;
      end;
  end;
end;

procedure TDSSMCustoms.dspPre_Compra_DadosBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlPre_Compra_Dados);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
          sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'PRECOMPRA_DADOS_SANTANA', 'NUMERO');
      end;
    end;

    if (sysMasterId > 0) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        begin
          Edit;
          FieldByName('NUMERO').NewValue := sysMasterId;
          Post;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspProdutos_Grupos_RelativosBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlProdutos_Grupos_Relativos);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
          sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue,
            'PRODUTOS_GRUPOS_RELATIVOS', 'CODIGO');
      end;
    end;

    if (sysMasterId > 0) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        begin
          Edit;
          FieldByName('CODIGO').NewValue := sysMasterId;
          Post;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspProgramacao_ComprasBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlProgramacao_Compras);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
          sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'PROGRAMACAO_COMPRAS', 'CODIGO');
      end;
    end;

    if (sysMasterId > 0) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        begin
          Edit;
          FieldByName('CODIGO').NewValue := sysMasterId;
          Post;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspProjetosBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlProjetos);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
          sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'PROJETOS', 'NUMERO');
      end;
    end;

    if (sysMasterId > 0) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        begin
          Edit;
          FieldByName('NUMERO').NewValue := sysMasterId;
          Post;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspReclamacoes_Dados_SantanaBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
var
  Header: Boolean;
begin
  Header := (SourceDS = sqlReclamacoes_Dados_Santana);

  if (Header) then
  begin
    if (UpdateKind = ukInsert) then
    begin
      with DeltaDS do
        sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'RECLAMACOES_DADOS_SANTANA', 'PROTOCOLO');
    end;
  end;

  if (sysMasterId > 0) then
  begin
    if (UpdateKind = ukInsert) then
    begin
      with DeltaDS do
      begin
        Edit;
        FieldByName('PROTOCOLO').NewValue := sysMasterId;
        Post;
      end;
    end;
  end;
end;

procedure TDSSMCustoms.dspRevistasBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlRevistas_Dados);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
          sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'REVISTAS_DADOS', 'NUMERO');
      end;
    end;

    if (sysMasterId > 0) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        begin
          Edit;
          FieldByName('NUMERO').NewValue := sysMasterId;
          Post;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspRotaCep_BrasPressBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlClientes_Pendencias);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
          sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'CLIENTES_PENDENCIAS', 'SEQUENCIA');
      end;
    end;

    if (sysMasterId > 0) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        begin
          Edit;
          FieldByName('SEQUENCIA').NewValue := sysMasterId;
          Post;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspSetoresBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlSetores);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
          sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'SETORES', 'NUMERO');
      end;
    end;

    if (sysMasterId > 0) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        begin
          Edit;
          FieldByName('NUMERO').NewValue := sysMasterId;
          Post;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspSetores_EstoqueBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlSetores_Estoque);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
          sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'SETORES_ESTOQUE', 'CODIGO');
      end;
    end;

    if (sysMasterId > 0) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        begin
          Edit;
          FieldByName('CODIGO').NewValue := sysMasterId;
          Post;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspSolicitacoes_ReposicaoBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlSolicitacoes_Reposicao);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
          sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'SOLICITACOES_REPOSICAO', 'NUMERO');
      end;
    end;

    if (sysMasterId > 0) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        begin
          Edit;
          FieldByName('NUMERO').NewValue := sysMasterId;
          Post;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspSolicitacoes_SemicondutoresBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
var
  Header: Boolean;
begin
  Header := (SourceDS = sqlSolicitacoes_Semicondutores);

  if (Header) then
  begin
    if (UpdateKind = ukInsert) then
    begin
      with DeltaDS do
        sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'SOLICITACOES_SEMICONDUTORES', 'NUMERO');
    end;
  end;

  if (sysMasterId > 0) then
  begin
    if (UpdateKind = ukInsert) then
    begin
      with DeltaDS do
      begin
        Edit;
        FieldByName('NUMERO').NewValue := sysMasterId;
        Post;
      end;
    end;
  end;
end;

procedure TDSSMCustoms.dspTarefasBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  Header: Boolean;
begin
  try
    Header := (SourceDS = sqlTarefas);

    if (Header) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
          sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'TAREFAS', 'NUMERO');
      end;
    end;

    if (sysMasterId > 0) then
    begin
      if (UpdateKind = ukInsert) then
      begin
        with DeltaDS do
        begin
          Edit;
          FieldByName('NUMERO').NewValue := sysMasterId;
          Post;
        end;
      end;
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Servidor de Aplicação: %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.dspVendedoresAfterApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
  sysMasterId := 0;
end;

procedure TDSSMCustoms.dspVendedoresBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  Header: Boolean;
begin
  Header := (SourceDS = sqlVendedores);
  // tratamento para o mestre
  if (Header) then
  begin
    if (UpdateKind = ukInsert) then
    begin
      with DeltaDS do
        sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'VENDEDORES', 'CODIGO');
    end;
  end;

  // atribuindo o id para o dataset em questão
  if (sysMasterId > 0) then
  begin
    if (UpdateKind = ukInsert) then
    begin
      with DeltaDS do
      begin
        Edit;
        FieldByName('CODIGO').NewValue := sysMasterId;
        Post;
      end;
    end;
  end;
end;

procedure TDSSMCustoms.dspVendedores_GruposBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  Header: Boolean;
begin
  Header := (SourceDS = sqlVendedores_Grupos);

  // tratamento para o mestre
  if (Header) then
  begin
    if (UpdateKind = ukInsert) then
    begin
      with DeltaDS do
        sysMasterId := __SuperClass.DBFunctions.GetGeneratorId(FieldByName('EMPRESA').NewValue, FieldByName('FILIAL').NewValue, 'VENDEDORES_GRUPOS', 'CODIGO');
    end;
  end;

  // atribuindo o id para o dataset em questão
  if (sysMasterId > 0) then
  begin
    if (UpdateKind = ukInsert) then
    begin
      with DeltaDS do
      begin
        Edit;
        FieldByName('CODIGO').NewValue := sysMasterId;
        Post;
      end;
    end;
  end;
end;

procedure TDSSMCustoms.AtualizaEstoqueSemicondutores(const Operacao: TOpDoc; Movimento,
  Produto: String; Saldo: Double);
var
  Empresa, Filial: String;
  SQL: String;
  ExisteSaldo: Boolean;
  SaldoAnterior: Double;
  SQLTmp: TSQLDataSet;
begin
  try
    // Tipo E indica subtração do estoque
    if (Operacao = odExcluir) then
    begin
      if (Movimento = MI_ENTRADA) then
        Saldo := Saldo * -1
      else
        Saldo := Saldo * -1;
    end
    else
    begin
      if (Movimento = MI_ENTRADA) then
        Saldo := Saldo * +1
      else
        Saldo := Saldo * +1;
    end;

    SaldoAnterior := 0;
    Empresa       := '99';
    Filial        := '99';

    try
      SQLTmp := TSQLDataSet.Create(Nil);

      with SQLTmp do
      begin
        SQLConnection := __SuperClass.DBListConn.GetDBConn;
        GetMetaData   := False;
        SQL := ' SELECT SALDO FROM SALDOS_SEMICONDUTORES ';
        SQL := SQL + ' WHERE ';
        SQL := SQL + ' EMPRESA = :EMPRESA AND FILIAL = :FILIAL AND PRODUTO = :PRODUTO ';
        CommandText := SQL;

        with ParamByName('EMPRESA') do
        begin
          DataType  := ftString;
          ParamType := ptInput;
          AsString  := Empresa;
        end;
        with ParamByName('FILIAL') do
        begin
          DataType  := ftString;
          ParamType := ptInput;
          AsString  := Filial;
        end;
        with ParamByName('PRODUTO') do
        begin
          DataType  := ftString;
          ParamType := ptInput;
          AsString  := Produto;
        end;

        Open;

        ExisteSaldo := not ((Bof) and (Eof));

        if ExisteSaldo then
          SaldoAnterior := FieldByName('SALDO').Value;

        Close;

        if (not ExisteSaldo) then
        begin
          SQL := ' INSERT INTO SALDOS_SEMICONDUTORES ';
          SQL := SQL + ' (EMPRESA, FILIAL, PRODUTO, SALDO, DATACRIACAO) ';
          SQL := SQL + ' VALUES ';
          SQL := SQL + ' (:EMPRESA, :FILIAL, :PRODUTO, :SALDO, :DATACRIACAO) ';
          CommandText := SQL;

          with ParamByName('EMPRESA') do
          begin
            DataType  := ftString;
            ParamType := ptInput;
            AsString  := Empresa;
          end;
          with ParamByName('FILIAL') do
          begin
            DataType  := ftString;
            ParamType := ptInput;
            AsString  := Filial;
          end;
          with ParamByName('PRODUTO') do
          begin
            DataType  := ftString;
            ParamType := ptInput;
            AsString  := Produto;
          end;
          with ParamByName('SALDO') do
          begin
            DataType  := ftFloat;
            ParamType := ptInput;
            AsFloat   := Saldo;
          end;
          with ParamByName('DATACRIACAO') do
          begin
            DataType       := ftTimeStamp;
            ParamType      := ptInput;
            AsSQLTimeStamp := DateTimeToSqlTimeStamp(Now);
          end;

          ExecSql;
        end
        else
        begin
          SQL := 'UPDATE SALDOS_SEMICONDUTORES SET SALDO = SALDO + :SALDO ';
          SQL := SQL + ' WHERE ';
          SQL := SQL + ' EMPRESA = :EMPRESA AND FILIAL = :FILIAL AND PRODUTO = :PRODUTO ';
          CommandText := SQL;

          with ParamByName('SALDO') do
          begin
            DataType  := ftFloat;
            ParamType := ptInput;
            AsFloat   := Saldo;
          end;
          with ParamByName('EMPRESA') do
          begin
            DataType  := ftString;
            ParamType := ptInput;
            AsString  := Empresa;
          end;
          with ParamByName('FILIAL') do
          begin
            DataType  := ftString;
            ParamType := ptInput;
            AsString  := Filial;
          end;
          with ParamByName('PRODUTO') do
          begin
            DataType  := ftString;
            ParamType := ptInput;
            AsString  := Produto;
          end;

          ExecSql;
        end;
      end;
    finally
      FreeAndNil(SQLTmp);
    end;
  except
    on E: Exception do
      raise Exception.Create(Format('Falha na atualização do estoque de semicondutores. %s', [E.Message]));
  end;
end;

procedure TDSSMCustoms.DSServerModuleCreate(Sender: TObject);
var
  I: Integer;
  sqlRef: TSQLDataSet;
  dspRef: TDataSetProvider;
begin
  {$Region 'Criando um dataset temporário para uso geral - NÃO REMOVER'}
  _sql := TSQLDataSet.Create(Self);
  _sql.Name := 'sqlAS_Auxiliar';
  _dsp := TDataSetProvider.Create(Self);
  _dsp.DataSet := _sql;
  _dsp.Name := 'dspAS_Auxiliar';
  _dsp.Options := [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText] ;
  {$EndRegion}

  {$Region 'Configurando a conexão para o ServerModule - NÃO REMOVER'}
  // Atribuindo a conexão aos componentes de dados
  for I := 0 to ComponentCount - 1 do
  begin
    if (Components[I] is TSQLDataSet) then
    begin
      sqlRef := (Components[I] as TSQLDataSet);
      sqlRef.SQLConnection := __SuperClass.DBListConn.GetDBConn;
    end
    else if (Components[I] is TDataSetProvider) then
    begin
      dspRef := (Components[I] as TDataSetProvider);
      if not (Assigned(dspRef)) or not (Assigned(dspRef.DataSet)) then
        raise Exception.Create(Format('DataSetProvider %s não foi informado o DataSet.', [dspRef.Name]))
      else
        __SuperClass.SQLStatementList.InsertSQL(dspRef.Name, TSQLDataSet(dspRef.DataSet).CommandText);
    end;
  end;
  {$EndRegion}
end;

procedure TDSSMCustoms.DSServerModuleDestroy(Sender: TObject);
var
  I : Integer;
begin
  // Fecha os SQLDataSets
  for I := 0 to ComponentCount - 1 do
    if Components[i] is TSQLDataSet then
      (Components[i] as TSQLDataSet).Close;
end;

procedure TDSSMCustoms.sqlCampanhas_Vendedores_SantanaBeforeOpen(
  DataSet: TDataSet);
var
  I: Integer;
  Empresa, Filial: String;
begin
  for I := 0 to sqlCampanhas_Vendedores_Santana.Params.Count - 1 do
  begin
    if (Trim(UpperCase(sqlCampanhas_Vendedores_Santana.Params[I].Name)) = 'EMPRESA_VENDEDORES') then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('VENDEDORES', Empresa, Filial);
      sqlCampanhas_Vendedores_Santana.Params[I].DataType  := ftString;
      sqlCampanhas_Vendedores_Santana.Params[I].ParamType := ptInput;
      sqlCampanhas_Vendedores_Santana.Params[I].AsString  := Empresa;
    end;
    if (Trim(UpperCase(sqlCampanhas_Vendedores_Santana.Params[I].Name)) = 'FILIAL_VENDEDORES') then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('VENDEDORES', Empresa, Filial);
      sqlCampanhas_Vendedores_Santana.Params[I].DataType  := ftString;
      sqlCampanhas_Vendedores_Santana.Params[I].ParamType := ptInput;
      sqlCampanhas_Vendedores_Santana.Params[I].AsString  := Filial;
    end;
  end;
end;

procedure TDSSMCustoms.sqlCampanha_Itens_SantanaBeforeOpen(DataSet: TDataSet);
var
  I: Integer;
  Empresa, Filial: String;
begin
  __SuperClass.DBFunctions.GetEntityOwner('PRODUTOS', Empresa, Filial);
  for I := 0 to sqlCampanha_Itens_Santana.Params.Count - 1 do
    if Trim(UpperCase(sqlCampanha_Itens_Santana.Params[I].Name)) = 'EMPRESA_PRODUTOS' then
    begin
      sqlCampanha_Itens_Santana.Params[I].DataType := ftString;
      sqlCampanha_Itens_Santana.Params[I].ParamType := ptInput;
      sqlCampanha_Itens_Santana.Params[I].AsString := Empresa;
    end;
  for I := 0 to sqlCampanha_Itens_Santana.Params.Count - 1 do
    if Trim(UpperCase(sqlCampanha_Itens_Santana.Params[I].Name)) = 'FILIAL_PRODUTOS' then
    begin
      sqlCampanha_Itens_Santana.Params[I].DataType := ftString;
      sqlCampanha_Itens_Santana.Params[I].ParamType := ptInput;
      sqlCampanha_Itens_Santana.Params[I].AsString := Filial;
    end;

  __SuperClass.DBFunctions.GetEntityOwner('SALDOS_ESTOQUE', Empresa, Filial);
  for I := 0 to sqlCampanha_Itens_Santana.Params.Count - 1 do
    if Trim(UpperCase(sqlCampanha_Itens_Santana.Params[I].Name)) = 'EMPRESA_SALDOS' then
    begin
      sqlCampanha_Itens_Santana.Params[I].DataType := ftString;
      sqlCampanha_Itens_Santana.Params[I].ParamType := ptInput;
      sqlCampanha_Itens_Santana.Params[I].AsString := Empresa;
    end;
  for I := 0 to sqlCampanha_Itens_Santana.Params.Count - 1 do
    if Trim(UpperCase(sqlCampanha_Itens_Santana.Params[I].Name)) = 'FILIAL_SALDOS' then
    begin
      sqlCampanha_Itens_Santana.Params[I].DataType := ftString;
      sqlCampanha_Itens_Santana.Params[I].ParamType := ptInput;
      sqlCampanha_Itens_Santana.Params[I].AsString := Filial;
    end;

  __SuperClass.DBFunctions.GetEntityOwner('PEDIDOS_VENDAS_DADOS', Empresa, Filial);
  for I := 0 to sqlCampanha_Itens_Santana.Params.Count - 1 do
    if Trim(UpperCase(sqlCampanha_Itens_Santana.Params[I].Name)) = 'EMPRESA_PEDIDOS' then
    begin
      sqlCampanha_Itens_Santana.Params[I].DataType := ftString;
      sqlCampanha_Itens_Santana.Params[I].ParamType := ptInput;
      sqlCampanha_Itens_Santana.Params[I].AsString := Empresa;
    end;
  for I := 0 to sqlCampanha_Itens_Santana.Params.Count - 1 do
    if Trim(UpperCase(sqlCampanha_Itens_Santana.Params[I].Name)) = 'FILIAL_PEDIDOS' then
    begin
      sqlCampanha_Itens_Santana.Params[I].DataType := ftString;
      sqlCampanha_Itens_Santana.Params[I].ParamType := ptInput;
      sqlCampanha_Itens_Santana.Params[I].AsString := Filial;
    end;
end;

procedure TDSSMCustoms.sqlConsulta_Lista_FaltasBeforeOpen(DataSet: TDataSet);
var
  Empresa, Filial: String;
  I: Integer;
begin
  inherited;
  __SuperClass.DBFunctions.GetEntityOwner('REGRAS_FISCAIS', Empresa, Filial);
  for I := 0 to sqlConsulta_Lista_Faltas.Params.Count - 1 do
  begin
    if (sqlConsulta_Lista_Faltas.Params[I].Name = 'EMPRESA_REGRA') then
    begin
      sqlConsulta_Lista_Faltas.Params.ParamByName('EMPRESA_REGRA').DataType  := ftString;
      sqlConsulta_Lista_Faltas.Params.ParamByName('EMPRESA_REGRA').ParamType := ptInput;
      sqlConsulta_Lista_Faltas.Params.ParamByName('EMPRESA_REGRA').AsString  := Empresa;
    end;
    if (sqlConsulta_Lista_Faltas.Params[I].Name = 'FILIAL_REGRA') then
    begin
      sqlConsulta_Lista_Faltas.Params.ParamByName('FILIAL_REGRA').DataType  := ftString;
      sqlConsulta_Lista_Faltas.Params.ParamByName('FILIAL_REGRA').ParamType := ptInput;
      sqlConsulta_Lista_Faltas.Params.ParamByName('FILIAL_REGRA').AsString  := Filial;
    end;
  end;

  __SuperClass.DBFunctions.GetEntityOwner('SOLICITACAO_COMPRAS_DADOS_SANTANA', Empresa, Filial);
  for I := 0 to sqlConsulta_Lista_Faltas.Params.Count - 1 do
  begin
    if (sqlConsulta_Lista_Faltas.Params[I].Name = 'EMPRESA_SOLICITACAO') then
    begin
      sqlConsulta_Lista_Faltas.Params.ParamByName('EMPRESA_SOLICITACAO').DataType  := ftString;
      sqlConsulta_Lista_Faltas.Params.ParamByName('EMPRESA_SOLICITACAO').ParamType := ptInput;
      sqlConsulta_Lista_Faltas.Params.ParamByName('EMPRESA_SOLICITACAO').AsString := Empresa;
    end;
    if (sqlConsulta_Lista_Faltas.Params[I].Name = 'FILIAL_SOLICITACAO') then
    begin
      sqlConsulta_Lista_Faltas.Params.ParamByName('FILIAL_SOLICITACAO').DataType  := ftString;
      sqlConsulta_Lista_Faltas.Params.ParamByName('FILIAL_SOLICITACAO').ParamType := ptInput;
      sqlConsulta_Lista_Faltas.Params.ParamByName('FILIAL_SOLICITACAO').AsString  := Filial;
    end;
  end;

  __SuperClass.DBFunctions.GetEntityOwner('NOTAS_ENTRADA_DADOS', Empresa, Filial);
  for I := 0 to sqlConsulta_Lista_Faltas.Params.Count - 1 do
  begin
    if (sqlConsulta_Lista_Faltas.Params[I].Name = 'EMPRESA_PRENOTA') then
    begin
      sqlConsulta_Lista_Faltas.Params.ParamByName('EMPRESA_PRENOTA').DataType  := ftString;
      sqlConsulta_Lista_Faltas.Params.ParamByName('EMPRESA_PRENOTA').ParamType := ptInput;
      sqlConsulta_Lista_Faltas.Params.ParamByName('EMPRESA_PRENOTA').AsString  := Empresa;
    end;
    if (sqlConsulta_Lista_Faltas.Params[I].Name = 'FILIAL_PRENOTA') then
    begin
      sqlConsulta_Lista_Faltas.Params.ParamByName('FILIAL_PRENOTA').DataType  := ftString;
      sqlConsulta_Lista_Faltas.Params.ParamByName('FILIAL_PRENOTA').ParamType := ptInput;
      sqlConsulta_Lista_Faltas.Params.ParamByName('FILIAL_PRENOTA').AsString  := Filial;
    end;
  end;

  __SuperClass.DBFunctions.GetEntityOwner('PEDIDOS_ENTRADAS_DADOS', Empresa, Filial);
  for I := 0 to sqlConsulta_Lista_Faltas.Params.Count - 1 do
  begin
    if (sqlConsulta_Lista_Faltas.Params[I].Name = 'EMPRESA_PEDIDO_DADOS') then
    begin
      sqlConsulta_Lista_Faltas.Params.ParamByName('EMPRESA_PEDIDO_DADOS').DataType  := ftString;
      sqlConsulta_Lista_Faltas.Params.ParamByName('EMPRESA_PEDIDO_DADOS').ParamType := ptInput;
      sqlConsulta_Lista_Faltas.Params.ParamByName('EMPRESA_PEDIDO_DADOS').AsString  := Empresa;
    end;
    if (sqlConsulta_Lista_Faltas.Params[I].Name = 'FILIAL_PEDIDO_DADOS') then
    begin
      sqlConsulta_Lista_Faltas.Params.ParamByName('FILIAL_PEDIDO_DADOS').DataType  := ftString;
      sqlConsulta_Lista_Faltas.Params.ParamByName('FILIAL_PEDIDO_DADOS').ParamType := ptInput;
      sqlConsulta_Lista_Faltas.Params.ParamByName('FILIAL_PEDIDO_DADOS').AsString  := Filial;
    end;
  end;

  __SuperClass.DBFunctions.GetEntityOwner('PEDIDOS_ENTRADAS_ITENS', Empresa, Filial);
  for I := 0 to sqlConsulta_Lista_Faltas.Params.Count - 1 do
  begin
    if (sqlConsulta_Lista_Faltas.Params[I].Name = 'EMPRESA_PEDIDO_ITENS') then
    begin
      sqlConsulta_Lista_Faltas.Params.ParamByName('EMPRESA_PEDIDO_ITENS').DataType  := ftString;
      sqlConsulta_Lista_Faltas.Params.ParamByName('EMPRESA_PEDIDO_ITENS').ParamType := ptInput;
      sqlConsulta_Lista_Faltas.Params.ParamByName('EMPRESA_PEDIDO_ITENS').AsString  := Empresa;
    end;
    if (sqlConsulta_Lista_Faltas.Params[I].Name = 'FILIAL_PEDIDO_ITENS') then
    begin
      sqlConsulta_Lista_Faltas.Params.ParamByName('FILIAL_PEDIDO_ITENS').DataType  := ftString;
      sqlConsulta_Lista_Faltas.Params.ParamByName('FILIAL_PEDIDO_ITENS').ParamType := ptInput;
      sqlConsulta_Lista_Faltas.Params.ParamByName('FILIAL_PEDIDO_ITENS').AsString  := Filial;
    end;
  end;

  __SuperClass.DBFunctions.GetEntityOwner('CLIENTES', Empresa, Filial);
  for I := 0 to sqlConsulta_Lista_Faltas.Params.Count - 1 do
  begin
    if (sqlConsulta_Lista_Faltas.Params[I].Name = 'EMPRESA_CLIENTES') then
    begin
      sqlConsulta_Lista_Faltas.Params.ParamByName('EMPRESA_CLIENTES').DataType  := ftString;
      sqlConsulta_Lista_Faltas.Params.ParamByName('EMPRESA_CLIENTES').ParamType := ptInput;
      sqlConsulta_Lista_Faltas.Params.ParamByName('EMPRESA_CLIENTES').AsString  := Empresa;
    end;
    if (sqlConsulta_Lista_Faltas.Params[I].Name = 'FILIAL_CLIENTES') then
    begin
      sqlConsulta_Lista_Faltas.Params.ParamByName('FILIAL_CLIENTES').DataType  := ftString;
      sqlConsulta_Lista_Faltas.Params.ParamByName('FILIAL_CLIENTES').ParamType := ptInput;
      sqlConsulta_Lista_Faltas.Params.ParamByName('FILIAL_CLIENTES').AsString  := Filial;
    end;
  end;

  __SuperClass.DBFunctions.GetEntityOwner('VENDEDORES', Empresa, Filial);
  for I := 0 to sqlConsulta_Lista_Faltas.Params.Count - 1 do
  begin
    if (sqlConsulta_Lista_Faltas.Params[I].Name = 'EMPRESA_VENDEDORES') then
    begin
      sqlConsulta_Lista_Faltas.Params.ParamByName('EMPRESA_VENDEDORES').DataType  := ftString;
      sqlConsulta_Lista_Faltas.Params.ParamByName('EMPRESA_VENDEDORES').ParamType := ptInput;
      sqlConsulta_Lista_Faltas.Params.ParamByName('EMPRESA_VENDEDORES').AsString  := Empresa;
    end;
    if (sqlConsulta_Lista_Faltas.Params[I].Name = 'FILIAL_VENDEDORES') then
    begin
      sqlConsulta_Lista_Faltas.Params.ParamByName('FILIAL_VENDEDORES').DataType  := ftString;
      sqlConsulta_Lista_Faltas.Params.ParamByName('FILIAL_VENDEDORES').ParamType := ptInput;
      sqlConsulta_Lista_Faltas.Params.ParamByName('FILIAL_VENDEDORES').AsString  := Filial;
    end;
  end;

  __SuperClass.DBFunctions.GetEntityOwner('SALDOS_ESTOQUE', Empresa, Filial);
  for I := 0 to sqlConsulta_Lista_Faltas.Params.Count - 1 do
  begin
    if (sqlConsulta_Lista_Faltas.Params[I].Name = 'EMPRESA_SALDOS') then
    begin
      sqlConsulta_Lista_Faltas.Params.ParamByName('EMPRESA_SALDOS').DataType  := ftString;
      sqlConsulta_Lista_Faltas.Params.ParamByName('EMPRESA_SALDOS').ParamType := ptInput;
      sqlConsulta_Lista_Faltas.Params.ParamByName('EMPRESA_SALDOS').AsString  := Empresa;
    end;
    if (sqlConsulta_Lista_Faltas.Params[I].Name = 'FILIAL_SALDOS') then
    begin
      sqlConsulta_Lista_Faltas.Params.ParamByName('FILIAL_SALDOS').DataType  := ftString;
      sqlConsulta_Lista_Faltas.Params.ParamByName('FILIAL_SALDOS').ParamType := ptInput;
      sqlConsulta_Lista_Faltas.Params.ParamByName('FILIAL_SALDOS').AsString  := Filial;
    end;
  end;

  __SuperClass.DBFunctions.GetEntityOwner('FORNECEDORES', Empresa, Filial);
  for I := 0 to sqlConsulta_Lista_Faltas.Params.Count - 1 do
  begin
    if (sqlConsulta_Lista_Faltas.Params[I].Name = 'EMPRESA_FORNECEDORES') then
    begin
      sqlConsulta_Lista_Faltas.Params.ParamByName('EMPRESA_FORNECEDORES').DataType  := ftString;
      sqlConsulta_Lista_Faltas.Params.ParamByName('EMPRESA_FORNECEDORES').ParamType := ptInput;
      sqlConsulta_Lista_Faltas.Params.ParamByName('EMPRESA_FORNECEDORES').AsString  := Empresa;
    end;
    if (sqlConsulta_Lista_Faltas.Params[I].Name = 'FILIAL_FORNECEDORES') then
    begin
      sqlConsulta_Lista_Faltas.Params.ParamByName('FILIAL_FORNECEDORES').DataType  := ftString;
      sqlConsulta_Lista_Faltas.Params.ParamByName('FILIAL_FORNECEDORES').ParamType := ptInput;
      sqlConsulta_Lista_Faltas.Params.ParamByName('FILIAL_FORNECEDORES').AsString  := Filial;
    end;
  end;

  for I := 0 to sqlConsulta_Lista_Faltas.Params.Count - 1 do
  begin
    if (sqlConsulta_Lista_Faltas.Params[I].Name = '01') then
    begin
      sqlConsulta_Lista_Faltas.Params.ParamByName('01').DataType  := ftString;
      sqlConsulta_Lista_Faltas.Params.ParamByName('01').ParamType := ptInput;
      sqlConsulta_Lista_Faltas.Params.ParamByName('01').AsString  := '01';
    end;

    if (sqlConsulta_Lista_Faltas.Params[I].Name = '02') then
    begin
      sqlConsulta_Lista_Faltas.Params.ParamByName('02').DataType  := ftString;
      sqlConsulta_Lista_Faltas.Params.ParamByName('02').ParamType := ptInput;
      sqlConsulta_Lista_Faltas.Params.ParamByName('02').AsString  := '02';
    end;

    if (sqlConsulta_Lista_Faltas.Params[I].Name = '03') then
    begin
      sqlConsulta_Lista_Faltas.Params.ParamByName('03').DataType  := ftString;
      sqlConsulta_Lista_Faltas.Params.ParamByName('03').ParamType := ptInput;
      sqlConsulta_Lista_Faltas.Params.ParamByName('03').AsString  := '03';
    end;
  end;
end;

procedure TDSSMCustoms.sqlConsulta_Meta_ClientesBeforeOpen(DataSet: TDataSet);
var
  I: Integer;
  Empresa, Filial: String;
begin
  for I := 0 to sqlConsulta_Meta_Clientes.Params.Count - 1 do
  begin
    if sqlConsulta_Meta_Clientes.Params[I].Name = 'EMPRESA_VENDEDORES' then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('VENDEDORES', Empresa, Filial);
      sqlConsulta_Meta_Clientes.Params[I].DataType := ftString;
      sqlConsulta_Meta_Clientes.Params[I].ParamType := ptInput;
      sqlConsulta_Meta_Clientes.Params[I].AsString := Empresa;
    end;
    if sqlConsulta_Meta_Clientes.Params[I].Name = 'FILIAL_VENDEDORES' then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('VENDEDORES', Empresa, Filial);
      sqlConsulta_Meta_Clientes.Params[I].DataType := ftString;
      sqlConsulta_Meta_Clientes.Params[I].ParamType := ptInput;
      sqlConsulta_Meta_Clientes.Params[I].AsString := Filial;
    end;

    if sqlConsulta_Meta_Clientes.Params[I].Name = 'EMPRESA_CLIENTES' then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('CLIENTES', Empresa, Filial);
      sqlConsulta_Meta_Clientes.Params[I].DataType := ftString;
      sqlConsulta_Meta_Clientes.Params[I].ParamType := ptInput;
      sqlConsulta_Meta_Clientes.Params[I].AsString := Empresa;
    end;
    if sqlConsulta_Meta_Clientes.Params[I].Name = 'FILIAL_CLIENTES' then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('CLIENTES', Empresa, Filial);
      sqlConsulta_Meta_Clientes.Params[I].DataType := ftString;
      sqlConsulta_Meta_Clientes.Params[I].ParamType := ptInput;
      sqlConsulta_Meta_Clientes.Params[I].AsString := Filial;
    end;

    if sqlConsulta_Meta_Clientes.Params[I].Name = 'EMPRESA_PEDIDOS' then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('PEDIDOS_VENDAS_DADOS', Empresa, Filial);
      sqlConsulta_Meta_Clientes.Params[I].DataType := ftString;
      sqlConsulta_Meta_Clientes.Params[I].ParamType := ptInput;
      sqlConsulta_Meta_Clientes.Params[I].AsString := Empresa;
    end;
    if sqlConsulta_Meta_Clientes.Params[I].Name = 'FILIAL_PEDIDOS' then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('PEDIDOS_VENDAS_DADOS', Empresa, Filial);
      sqlConsulta_Meta_Clientes.Params[I].DataType := ftString;
      sqlConsulta_Meta_Clientes.Params[I].ParamType := ptInput;
      sqlConsulta_Meta_Clientes.Params[I].AsString := Filial;
    end;

    if sqlConsulta_Meta_Clientes.Params[I].Name = 'EMPRESA_CONTATOS_HISTORICOS' then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('CONTATOS_HISTORICOS', Empresa, Filial);
      sqlConsulta_Meta_Clientes.Params[I].DataType := ftString;
      sqlConsulta_Meta_Clientes.Params[I].ParamType := ptInput;
      sqlConsulta_Meta_Clientes.Params[I].AsString := Empresa;
    end;
    if sqlConsulta_Meta_Clientes.Params[I].Name = 'FILIAL_CONTATOS_HISTORICOS' then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('CONTATOS_HISTORICOS', Empresa, Filial);
      sqlConsulta_Meta_Clientes.Params[I].DataType := ftString;
      sqlConsulta_Meta_Clientes.Params[I].ParamType := ptInput;
      sqlConsulta_Meta_Clientes.Params[I].AsString := Filial;
    end;

    if sqlConsulta_Meta_Clientes.Params[I].Name = 'EMPRESA_NOTAS' then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('NOTAS_SAIDAS_DADOS', Empresa, Filial);
      sqlConsulta_Meta_Clientes.Params[I].DataType := ftString;
      sqlConsulta_Meta_Clientes.Params[I].ParamType := ptInput;
      sqlConsulta_Meta_Clientes.Params[I].AsString := Empresa;
    end;
    if sqlConsulta_Meta_Clientes.Params[I].Name = 'FILIAL_NOTAS' then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('NOTAS_SAIDAS_DADOS', Empresa, Filial);
      sqlConsulta_Meta_Clientes.Params[I].DataType := ftString;
      sqlConsulta_Meta_Clientes.Params[I].ParamType := ptInput;
      sqlConsulta_Meta_Clientes.Params[I].AsString := Filial;
    end;
  end;
end;

procedure TDSSMCustoms.sqlEmpresa_Grupo_ClientesBeforeOpen(DataSet: TDataSet);
var
  I: Integer;
  Empresa, Filial: String;
begin
  __SuperClass.DBFunctions.GetEntityOwner('CLIENTES', Empresa, Filial);
  for I := 0 to sqlEmpresa_Grupo_Clientes.Params.Count - 1 do
    if Trim(UpperCase(sqlEmpresa_Grupo_Clientes.Params[I].Name)) = 'EMPRESA_CLIENTES' then
    begin
      sqlEmpresa_Grupo_Clientes.Params[I].DataType  := ftString;
      sqlEmpresa_Grupo_Clientes.Params[I].ParamType := ptInput;
      sqlEmpresa_Grupo_Clientes.Params[I].AsString  := Empresa;
    end;

  for I := 0 to sqlEmpresa_Grupo_Clientes.Params.Count - 1 do
    if Trim(UpperCase(sqlEmpresa_Grupo_Clientes.Params[I].Name)) = 'FILIAL_CLIENTES' then
    begin
      sqlEmpresa_Grupo_Clientes.Params[I].DataType  := ftString;
      sqlEmpresa_Grupo_Clientes.Params[I].ParamType := ptInput;
      sqlEmpresa_Grupo_Clientes.Params[I].AsString  := Filial;
    end;
end;

procedure TDSSMCustoms.sqlFicha_CadastralBeforeOpen(DataSet: TDataSet);
var
  I: Integer;
  Empresa, Filial: String;
begin
  __SuperClass.DBFunctions.GetEntityOwner('VENDEDORES', Empresa, Filial);

  for I := 0 to sqlFicha_Cadastral.Params.Count - 1 do
  begin
    if (Trim(UpperCase(sqlFicha_Cadastral.Params[I].Name)) = 'EMPRESA_VENDEDORES') then
    begin
      sqlFicha_Cadastral.Params[I].DataType  := ftString;
      sqlFicha_Cadastral.Params[I].ParamType := ptInput;
      sqlFicha_Cadastral.Params[I].AsString  := Empresa;
    end;
  end;

  for I := 0 to sqlFicha_Cadastral.Params.Count - 1 do
  begin
    if (Trim(UpperCase(sqlFicha_Cadastral.Params[I].Name)) = 'FILIAL_VENDEDORES') then
    begin
      sqlFicha_Cadastral.Params[I].DataType := ftString;
      sqlFicha_Cadastral.Params[I].ParamType := ptInput;
      sqlFicha_Cadastral.Params[I].AsString := Filial;
    end;
  end;
end;

procedure TDSSMCustoms.sqlFicha_Cadastral_____BeforeOpen(DataSet: TDataSet);
var
  I: Integer;
  Empresa, Filial: String;
begin
  __SuperClass.DBFunctions.GetEntityOwner('VENDEDORES', Empresa, Filial);

  for I := 0 to sqlFicha_Cadastral.Params.Count - 1 do
  begin
    if (Trim(UpperCase(sqlFicha_Cadastral.Params[I].Name)) = 'EMPRESA_VENDEDORES') then
    begin
      sqlFicha_Cadastral.Params[I].DataType  := ftString;
      sqlFicha_Cadastral.Params[I].ParamType := ptInput;
      sqlFicha_Cadastral.Params[I].AsString  := Empresa;
    end;
  end;

  for I := 0 to sqlFicha_Cadastral.Params.Count - 1 do
  begin
    if (Trim(UpperCase(sqlFicha_Cadastral.Params[I].Name)) = 'FILIAL_VENDEDORES') then
    begin
      sqlFicha_Cadastral.Params[I].DataType := ftString;
      sqlFicha_Cadastral.Params[I].ParamType := ptInput;
      sqlFicha_Cadastral.Params[I].AsString := Filial;
    end;
  end;
end;

procedure TDSSMCustoms.sqlGNRE_ItensBeforeOpen(DataSet: TDataSet);
var
  Empresa, Filial: String;
  I: Integer;
begin
  __SuperClass.DBFunctions.GetEntityOwner('CLIENTES', Empresa, Filial);
  for I := 0 to TSQLDataSet(DataSet).Params.Count - 1 do
  begin
    if TSQLDataSet(DataSet).Params[I].Name = 'EMPRESA_CLIENTES' then
    begin
      TSQLDataSet(DataSet).Params[I].DataType := ftString;
      TSQLDataSet(DataSet).Params[I].ParamType := ptInput;
      TSQLDataSet(DataSet).Params[I].AsString := Empresa;
    end;
    if TSQLDataSet(DataSet).Params[I].Name = 'FILIAL_CLIENTES' then
    begin
      TSQLDataSet(DataSet).Params[I].DataType := ftString;
      TSQLDataSet(DataSet).Params[I].ParamType := ptInput;
      TSQLDataSet(DataSet).Params[I].AsString := Filial;
    end;
  end;
end;

procedure TDSSMCustoms.sqlMetas_Produtos_EspeciaisBeforeOpen(DataSet: TDataSet);
var
  I: Integer;
  Empresa, Filial: String;
begin
  for I := 0 to sqlConsulta_Meta_Clientes.Params.Count - 1 do
  begin
    if (sqlConsulta_Meta_Clientes.Params[I].Name = 'EMPRESA_VENDEDORES') then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('VENDEDORES', Empresa, Filial);
      sqlConsulta_Meta_Clientes.Params[I].DataType  := ftString;
      sqlConsulta_Meta_Clientes.Params[I].ParamType := ptInput;
      sqlConsulta_Meta_Clientes.Params[I].AsString  := Empresa;
    end;
    if (sqlConsulta_Meta_Clientes.Params[I].Name = 'FILIAL_VENDEDORES') then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('VENDEDORES', Empresa, Filial);
      sqlConsulta_Meta_Clientes.Params[I].DataType  := ftString;
      sqlConsulta_Meta_Clientes.Params[I].ParamType := ptInput;
      sqlConsulta_Meta_Clientes.Params[I].AsString  := Filial;
    end;

    if (sqlConsulta_Meta_Clientes.Params[I].Name = 'EMPRESA_CLIENTES') then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('CLIENTES', Empresa, Filial);
      sqlConsulta_Meta_Clientes.Params[I].DataType  := ftString;
      sqlConsulta_Meta_Clientes.Params[I].ParamType := ptInput;
      sqlConsulta_Meta_Clientes.Params[I].AsString  := Empresa;
    end;
    if (sqlConsulta_Meta_Clientes.Params[I].Name = 'FILIAL_CLIENTES') then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('CLIENTES', Empresa, Filial);
      sqlConsulta_Meta_Clientes.Params[I].DataType  := ftString;
      sqlConsulta_Meta_Clientes.Params[I].ParamType := ptInput;
      sqlConsulta_Meta_Clientes.Params[I].AsString  := Filial;
    end;

    if (sqlConsulta_Meta_Clientes.Params[I].Name = 'EMPRESA_PEDIDOS') then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('PEDIDOS_VENDAS_DADOS', Empresa, Filial);
      sqlConsulta_Meta_Clientes.Params[I].DataType  := ftString;
      sqlConsulta_Meta_Clientes.Params[I].ParamType := ptInput;
      sqlConsulta_Meta_Clientes.Params[I].AsString  := Empresa;
    end;
    if (sqlConsulta_Meta_Clientes.Params[I].Name = 'FILIAL_PEDIDOS') then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('PEDIDOS_VENDAS_DADOS', Empresa, Filial);
      sqlConsulta_Meta_Clientes.Params[I].DataType  := ftString;
      sqlConsulta_Meta_Clientes.Params[I].ParamType := ptInput;
      sqlConsulta_Meta_Clientes.Params[I].AsString  := Filial;
    end;

    if (sqlConsulta_Meta_Clientes.Params[I].Name = 'EMPRESA_CONTATOS_HISTORICOS') then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('CONTATOS_HISTORICOS', Empresa, Filial);
      sqlConsulta_Meta_Clientes.Params[I].DataType  := ftString;
      sqlConsulta_Meta_Clientes.Params[I].ParamType := ptInput;
      sqlConsulta_Meta_Clientes.Params[I].AsString  := Empresa;
    end;
    if (sqlConsulta_Meta_Clientes.Params[I].Name = 'FILIAL_CONTATOS_HISTORICOS') then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('CONTATOS_HISTORICOS', Empresa, Filial);
      sqlConsulta_Meta_Clientes.Params[I].DataType := ftString;
      sqlConsulta_Meta_Clientes.Params[I].ParamType := ptInput;
      sqlConsulta_Meta_Clientes.Params[I].AsString := Filial;
    end;

    if (sqlConsulta_Meta_Clientes.Params[I].Name = 'EMPRESA_NOTAS') then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('NOTAS_SAIDAS_DADOS', Empresa, Filial);
      sqlConsulta_Meta_Clientes.Params[I].DataType  := ftString;
      sqlConsulta_Meta_Clientes.Params[I].ParamType := ptInput;
      sqlConsulta_Meta_Clientes.Params[I].AsString  := Empresa;
    end;
    if (sqlConsulta_Meta_Clientes.Params[I].Name = 'FILIAL_NOTAS') then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('NOTAS_SAIDAS_DADOS', Empresa, Filial);
      sqlConsulta_Meta_Clientes.Params[I].DataType  := ftString;
      sqlConsulta_Meta_Clientes.Params[I].ParamType := ptInput;
      sqlConsulta_Meta_Clientes.Params[I].AsString  := Filial;
    end;
  end;
end;

procedure TDSSMCustoms.sqlOfertas_EspeciaisBeforeOpen(DataSet: TDataSet);
var
  I: Integer;
  Empresa, Filial: String;
begin
  __SuperClass.DBFunctions.GetEntityOwner('PRODUTOS', Empresa, Filial);

  for I := 0 to sqlOfertas_Especiais.Params.Count - 1 do
  begin
    if (Trim(UpperCase(sqlOfertas_Especiais.Params[I].Name)) = 'EMPRESA_PRODUTOS') then
    begin
      sqlOfertas_Especiais.Params[I].DataType  := ftString;
      sqlOfertas_Especiais.Params[I].ParamType := ptInput;
      sqlOfertas_Especiais.Params[I].AsString  := Empresa;
    end;
  end;

  for I := 0 to sqlOfertas_Especiais.Params.Count - 1 do
  begin
    if (Trim(UpperCase(sqlOfertas_Especiais.Params[I].Name)) = 'FILIAL_PRODUTOS') then
    begin
      sqlOfertas_Especiais.Params[I].DataType  := ftString;
      sqlOfertas_Especiais.Params[I].ParamType := ptInput;
      sqlOfertas_Especiais.Params[I].AsString  := Filial;
    end;
  end;
end;

procedure TDSSMCustoms.sqlProdutosBeforeOpen(DataSet: TDataSet);
var
  Empresa, Filial: String;
  I: Integer;
begin
  for I := 0 to TSQLDataSet(DataSet).Params.Count - 1 do
  begin
    if TSQLDataSet(DataSet).Params[I].Name = 'EMPRESA_GRUPORELATIVOS' then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('PRODUTOS_GRUPOS_RELATIVOS', Empresa, Filial);
      TSQLDataSet(DataSet).Params[I].DataType := ftString;
      TSQLDataSet(DataSet).Params[I].ParamType := ptInput;
      TSQLDataSet(DataSet).Params[I].AsString := Empresa;
    end;
    if TSQLDataSet(DataSet).Params[I].Name = 'FILIAL_GRUPORELATIVOS' then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('PRODUTOS_GRUPOS_RELATIVOS', Empresa, Filial);
      TSQLDataSet(DataSet).Params[I].DataType := ftString;
      TSQLDataSet(DataSet).Params[I].ParamType := ptInput;
      TSQLDataSet(DataSet).Params[I].AsString := Filial;
    end;
  end;
end;

procedure TDSSMCustoms.sqlProdutos_AlternativosBeforeOpen(DataSet: TDataSet);
var
  Empresa, Filial: String;
  I: Integer;
begin
  for I := 0 to TSQLDataSet(DataSet).Params.Count - 1 do
  begin
    if TSQLDataSet(DataSet).Params[I].Name = 'EMPRESA_GRUPORELATIVO' then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('PRODUTOS_GRUPOS_RELATIVOS', Empresa, Filial);
      TSQLDataSet(DataSet).Params[I].DataType := ftString;
      TSQLDataSet(DataSet).Params[I].ParamType := ptInput;
      TSQLDataSet(DataSet).Params[I].AsString := Empresa;
    end;
    if TSQLDataSet(DataSet).Params[I].Name = 'FILIAL_GRUPORELATIVO' then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('PRODUTOS_GRUPOS_RELATIVOS', Empresa, Filial);
      TSQLDataSet(DataSet).Params[I].DataType := ftString;
      TSQLDataSet(DataSet).Params[I].ParamType := ptInput;
      TSQLDataSet(DataSet).Params[I].AsString := Filial;
    end;
    if TSQLDataSet(DataSet).Params[I].Name = 'EMPRESA' then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('PRODUTOS', Empresa, Filial);
      TSQLDataSet(DataSet).Params[I].DataType := ftString;
      TSQLDataSet(DataSet).Params[I].ParamType := ptInput;
      TSQLDataSet(DataSet).Params[I].AsString := Empresa;
    end;
    if TSQLDataSet(DataSet).Params[I].Name = 'FILIAL' then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('PRODUTOS', Empresa, Filial);
      TSQLDataSet(DataSet).Params[I].DataType := ftString;
      TSQLDataSet(DataSet).Params[I].ParamType := ptInput;
      TSQLDataSet(DataSet).Params[I].AsString := Filial;
    end;
  end;
end;

procedure TDSSMCustoms.sqlRotaCep_BrasPressBeforeOpen(DataSet: TDataSet);
var
  I: Integer;
  Empresa, Filial: String;
begin
  for I := 0 to sqlConsulta_Meta_Clientes.Params.Count - 1 do
  begin
    if sqlConsulta_Meta_Clientes.Params[I].Name = 'EMPRESA_VENDEDORES' then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('VENDEDORES', Empresa, Filial);
      sqlConsulta_Meta_Clientes.Params[I].DataType := ftString;
      sqlConsulta_Meta_Clientes.Params[I].ParamType := ptInput;
      sqlConsulta_Meta_Clientes.Params[I].AsString := Empresa;
    end;
    if sqlConsulta_Meta_Clientes.Params[I].Name = 'FILIAL_VENDEDORES' then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('VENDEDORES', Empresa, Filial);
      sqlConsulta_Meta_Clientes.Params[I].DataType := ftString;
      sqlConsulta_Meta_Clientes.Params[I].ParamType := ptInput;
      sqlConsulta_Meta_Clientes.Params[I].AsString := Filial;
    end;

    if sqlConsulta_Meta_Clientes.Params[I].Name = 'EMPRESA_CLIENTES' then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('CLIENTES', Empresa, Filial);
      sqlConsulta_Meta_Clientes.Params[I].DataType := ftString;
      sqlConsulta_Meta_Clientes.Params[I].ParamType := ptInput;
      sqlConsulta_Meta_Clientes.Params[I].AsString := Empresa;
    end;
    if sqlConsulta_Meta_Clientes.Params[I].Name = 'FILIAL_CLIENTES' then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('CLIENTES', Empresa, Filial);
      sqlConsulta_Meta_Clientes.Params[I].DataType := ftString;
      sqlConsulta_Meta_Clientes.Params[I].ParamType := ptInput;
      sqlConsulta_Meta_Clientes.Params[I].AsString := Filial;
    end;

    if sqlConsulta_Meta_Clientes.Params[I].Name = 'EMPRESA_PEDIDOS' then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('PEDIDOS_VENDAS_DADOS', Empresa, Filial);
      sqlConsulta_Meta_Clientes.Params[I].DataType := ftString;
      sqlConsulta_Meta_Clientes.Params[I].ParamType := ptInput;
      sqlConsulta_Meta_Clientes.Params[I].AsString := Empresa;
    end;
    if sqlConsulta_Meta_Clientes.Params[I].Name = 'FILIAL_PEDIDOS' then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('PEDIDOS_VENDAS_DADOS', Empresa, Filial);
      sqlConsulta_Meta_Clientes.Params[I].DataType := ftString;
      sqlConsulta_Meta_Clientes.Params[I].ParamType := ptInput;
      sqlConsulta_Meta_Clientes.Params[I].AsString := Filial;
    end;

    if sqlConsulta_Meta_Clientes.Params[I].Name = 'EMPRESA_CONTATOS_HISTORICOS' then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('CONTATOS_HISTORICOS', Empresa, Filial);
      sqlConsulta_Meta_Clientes.Params[I].DataType := ftString;
      sqlConsulta_Meta_Clientes.Params[I].ParamType := ptInput;
      sqlConsulta_Meta_Clientes.Params[I].AsString := Empresa;
    end;
    if sqlConsulta_Meta_Clientes.Params[I].Name = 'FILIAL_CONTATOS_HISTORICOS' then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('CONTATOS_HISTORICOS', Empresa, Filial);
      sqlConsulta_Meta_Clientes.Params[I].DataType := ftString;
      sqlConsulta_Meta_Clientes.Params[I].ParamType := ptInput;
      sqlConsulta_Meta_Clientes.Params[I].AsString := Filial;
    end;

    if sqlConsulta_Meta_Clientes.Params[I].Name = 'EMPRESA_NOTAS' then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('NOTAS_SAIDAS_DADOS', Empresa, Filial);
      sqlConsulta_Meta_Clientes.Params[I].DataType := ftString;
      sqlConsulta_Meta_Clientes.Params[I].ParamType := ptInput;
      sqlConsulta_Meta_Clientes.Params[I].AsString := Empresa;
    end;
    if sqlConsulta_Meta_Clientes.Params[I].Name = 'FILIAL_NOTAS' then
    begin
      __SuperClass.DBFunctions.GetEntityOwner('NOTAS_SAIDAS_DADOS', Empresa, Filial);
      sqlConsulta_Meta_Clientes.Params[I].DataType := ftString;
      sqlConsulta_Meta_Clientes.Params[I].ParamType := ptInput;
      sqlConsulta_Meta_Clientes.Params[I].AsString := Filial;
    end;
  end;
end;

initialization
  RegisterClass(TDSSMCustoms);

finalization
  UnRegisterClass(TDSSMCustoms);

end.

