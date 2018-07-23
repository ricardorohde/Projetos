{ ********************************************************************* }
{ }
{ TRS Sistemas - Runtime Library Functions }
{ }
{ Copyright(c) 2006-2012 TRS Sistemas e Soluções em Informática Ltda. }
{ }
{ Author: Thiago Rodrigo da Silva }
{ ********************************************************************* }
{ Lançamento de Notas de Entrada }
{ }
{ ********************************************************************* }
{ Data última alteração: }
{ Últimas alterações: }
{ }
{ ********************************************************************* }

unit uNotas_Entradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Menus, ActnList, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  ComCtrls, DBCtrls, ToolWin, DB, DBClient, Mask, Math, MaskUtils, ComObj,
  uTypes, uUser_Types, uFBase_Mod3, uLibrary, uRecError,
  uNFE_DLL, DSConnect, uProgressMsg, pngimage, PngSpeedButton, PngImageList,
  SHFolder, XMLDoc, XMLIntf, frxClass, frxDBSet;

type
  TfrmNotas_Entradas = class(TfrmFBase_Mod3)
    cdsNotas_Entradas_Dados: TClientDataSet;
    dtsNotas_Entradas_Dados: TDataSource;
    cdsNotas_Entradas_Itens: TClientDataSet;
    dtsNotas_Entradas_Itens: TDataSource;
    Label48: TLabel;
    spdFornecedores: TSpeedButton;
    dbedtFornecedor: TDBEdit;
    Label27: TLabel;
    spdMoedas: TSpeedButton;
    Label49: TLabel;
    dbedtMoeda: TDBEdit;
    dbedtTaxa: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbedtNumero: TDBEdit;
    dbedtEmissao: TDBEdit;
    Label6: TLabel;
    dbcboFormularioProprio: TDBComboBox;
    Label9: TLabel;
    dbedtPrefixo: TDBEdit;
    Label10: TLabel;
    dbcboEspecieDocumento: TDBComboBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    dbedtValorMercadorias: TDBEdit;
    dbedtValorFrete: TDBEdit;
    dbedtOutrasDespesas: TDBEdit;
    dbedtDesconto: TDBEdit;
    dbedtValorSeguro: TDBEdit;
    dbedtValorDesconto: TDBEdit;
    Label18: TLabel;
    Label19: TLabel;
    dbedtValorBruto: TDBEdit;
    dbedtValorLiquido: TDBEdit;
    dbedtNomeFornecedor: TDBEdit;
    dbedtDescricaoMoeda: TDBEdit;
    Label5: TLabel;
    spdCondicoesPagamentos: TSpeedButton;
    dbedtCondicaoPagamento: TDBEdit;
    dbedtDescricaoCondicao: TDBEdit;
    Label36: TLabel;
    spdCategorias: TSpeedButton;
    dbedtCategoriaFinanceira: TDBEdit;
    dbedtDescricaoCategoria: TDBEdit;
    Label1: TLabel;
    dbedtValorFinanceiro: TDBEdit;
    Label34: TLabel;
    dbedtUF: TDBEdit;
    Label35: TLabel;
    dbcboTipoPreco: TDBComboBox;
    Label4: TLabel;
    dbcboFormaPagamento: TDBComboBox;
    dbcboTipoFrete: TDBComboBox;
    Label39: TLabel;
    dbedtTabelaPreco: TDBEdit;
    Label8: TLabel;
    spdTabelasPrecos: TSpeedButton;
    dbedtDescricaoTabela: TDBEdit;
    Label54: TLabel;
    dbedtValorMoeda: TDBEdit;
    Label7: TLabel;
    dbedtPesoLiquido: TDBEdit;
    dbedtEspecie: TDBEdit;
    Label53: TLabel;
    dbedtVolumes: TDBEdit;
    Label55: TLabel;
    Label56: TLabel;
    dbedtPesoBruto: TDBEdit;
    dbedtMarca: TDBEdit;
    Label57: TLabel;
    Label58: TLabel;
    dbedtTransportadora: TDBEdit;
    spdTransportadoras: TSpeedButton;
    dbedtNomeTransportadora: TDBEdit;
    cdsNotas_Entradas_DadosEMPRESA: TStringField;
    cdsNotas_Entradas_DadosFILIAL: TStringField;
    cdsNotas_Entradas_DadosNUMERO: TIntegerField;
    cdsNotas_Entradas_DadosPREFIXO: TStringField;
    cdsNotas_Entradas_DadosFORMULARIOPROPRIO: TStringField;
    cdsNotas_Entradas_DadosEMISSAO: TDateField;
    cdsNotas_Entradas_DadosFORNECEDOR: TIntegerField;
    cdsNotas_Entradas_DadosUF: TStringField;
    cdsNotas_Entradas_DadosESPECIEDOCUMENTO: TStringField;
    cdsNotas_Entradas_DadosCONDICAOPAGAMENTO: TIntegerField;
    cdsNotas_Entradas_DadosFORMAPAGAMENTO: TStringField;
    cdsNotas_Entradas_DadosTABELA: TIntegerField;
    cdsNotas_Entradas_DadosTRANSPORTADORA: TIntegerField;
    cdsNotas_Entradas_DadosCATEGORIA: TStringField;
    cdsNotas_Entradas_DadosVOLUMES: TFloatField;
    cdsNotas_Entradas_DadosESPECIE: TStringField;
    cdsNotas_Entradas_DadosMARCA: TStringField;
    cdsNotas_Entradas_DadosPESOLIQUIDO: TFloatField;
    cdsNotas_Entradas_DadosPESOBRUTO: TFloatField;
    cdsNotas_Entradas_DadosMOEDA: TStringField;
    cdsNotas_Entradas_DadosTAXA: TFloatField;
    cdsNotas_Entradas_DadosTIPOPRECO: TStringField;
    cdsNotas_Entradas_DadosVALORMERCADORIAS: TFloatField;
    cdsNotas_Entradas_DadosDESCONTO: TFloatField;
    cdsNotas_Entradas_DadosVALORDESCONTO: TFloatField;
    cdsNotas_Entradas_DadosTIPOFRETE: TStringField;
    cdsNotas_Entradas_DadosVALORFRETE: TFloatField;
    cdsNotas_Entradas_DadosVALORSEGURO: TFloatField;
    cdsNotas_Entradas_DadosVALORDESPESAS: TFloatField;
    cdsNotas_Entradas_DadosVALORFINANCEIRO: TFloatField;
    cdsNotas_Entradas_DadosVALORBRUTO: TFloatField;
    cdsNotas_Entradas_DadosVALORLIQUIDO: TFloatField;
    cdsNotas_Entradas_DadosVALORALTERNATIVO: TFloatField;
    cdsNotas_Entradas_DadosBASEIPI: TFloatField;
    cdsNotas_Entradas_DadosVALORIPI: TFloatField;
    cdsNotas_Entradas_DadosBASEICMS: TFloatField;
    cdsNotas_Entradas_DadosVALORICMS: TFloatField;
    cdsNotas_Entradas_DadosBASEFGTS: TFloatField;
    cdsNotas_Entradas_DadosVALORFGTS: TFloatField;
    cdsNotas_Entradas_DadosBASEII: TFloatField;
    cdsNotas_Entradas_DadosVALORII: TFloatField;
    cdsNotas_Entradas_DadosVALORMOEDA: TFloatField;
    cdsNotas_Entradas_DadosCORPO: TStringField;
    cdsNotas_Entradas_DadosDATACRIACAO: TSQLTimeStampField;
    cdsNotas_Entradas_DadossqlNotas_Entradas_Itens: TDataSetField;
    cdsNotas_Entradas_ItensEMPRESA: TStringField;
    cdsNotas_Entradas_ItensFILIAL: TStringField;
    cdsNotas_Entradas_ItensNUMERO: TIntegerField;
    cdsNotas_Entradas_ItensPREFIXO: TStringField;
    cdsNotas_Entradas_ItensFORNECEDOR: TIntegerField;
    cdsNotas_Entradas_ItensITEM: TIntegerField;
    cdsNotas_Entradas_ItensPRODUTO: TStringField;
    cdsNotas_Entradas_ItensPRIMEIRAUNIDADE: TStringField;
    cdsNotas_Entradas_ItensLOCAL: TStringField;
    cdsNotas_Entradas_ItensUNITARIO: TFloatField;
    cdsNotas_Entradas_ItensUNITARIOMOEDA: TFloatField;
    cdsNotas_Entradas_ItensTOTAL: TFloatField;
    cdsNotas_Entradas_ItensCUSTOTOTAL: TFloatField;
    cdsNotas_Entradas_ItensCUSTOMEDIO: TFloatField;
    cdsNotas_Entradas_ItensTOTALMOEDA: TFloatField;
    cdsNotas_Entradas_ItensDESCONTO: TFloatField;
    cdsNotas_Entradas_ItensVALORDESCONTO: TFloatField;
    cdsNotas_Entradas_ItensVALORDESPESAS: TFloatField;
    cdsNotas_Entradas_ItensVALORFRETE: TFloatField;
    cdsNotas_Entradas_ItensVALORSEGURO: TFloatField;
    cdsNotas_Entradas_ItensVALORFINANCEIRO: TFloatField;
    cdsNotas_Entradas_ItensVALORBRUTO: TFloatField;
    cdsNotas_Entradas_ItensVALORLIQUIDO: TFloatField;
    cdsNotas_Entradas_ItensVALORALTERNATIVO: TFloatField;
    cdsNotas_Entradas_ItensPRECOLISTA: TFloatField;
    cdsNotas_Entradas_ItensREGRA: TIntegerField;
    cdsNotas_Entradas_ItensCODIGOFISCAL: TStringField;
    cdsNotas_Entradas_ItensIPI: TFloatField;
    cdsNotas_Entradas_ItensBASEIPI: TFloatField;
    cdsNotas_Entradas_ItensVALORIPI: TFloatField;
    cdsNotas_Entradas_ItensICMS: TFloatField;
    cdsNotas_Entradas_ItensBASEICMS: TFloatField;
    cdsNotas_Entradas_ItensVALORICMS: TFloatField;
    cdsNotas_Entradas_ItensISS: TFloatField;
    cdsNotas_Entradas_ItensBASEFGTS: TFloatField;
    cdsNotas_Entradas_ItensVALORFGTS: TFloatField;
    cdsNotas_Entradas_ItensII: TFloatField;
    cdsNotas_Entradas_ItensBASEII: TFloatField;
    cdsNotas_Entradas_ItensVALORII: TFloatField;
    cdsNotas_Entradas_ItensNUMEROPC: TIntegerField;
    cdsNotas_Entradas_ItensITEMPC: TIntegerField;
    cdsNotas_Entradas_ItensDOCUMENTOORIGEM: TIntegerField;
    cdsNotas_Entradas_ItensPREFIXOORIGEM: TStringField;
    cdsNotas_Entradas_ItensITEMORIGEM: TIntegerField;
    cdsNotas_Entradas_ItensORIGEMPRODUTO: TStringField;
    cdsNotas_Entradas_ItensDATACRIACAO: TSQLTimeStampField;
    cdsNotas_Entradas_DadosNOMETRANSPORTADORA: TStringField;
    cdsNotas_Entradas_DadosDESCRICAOTABELA: TStringField;
    cdsNotas_Entradas_DadosDESCRICAOCONDICAO: TStringField;
    cdsNotas_Entradas_DadosDESCRICAOCATEGORIA: TStringField;
    cdsNotas_Entradas_DadosDESCRICAOMOEDA: TStringField;
    cdsNotas_Entradas_ItensQUANTIDADE: TFloatField;
    cdsNotas_Entradas_DadosBASEICMSST: TFloatField;
    cdsNotas_Entradas_DadosVALORICMSST: TFloatField;
    cdsNotas_Entradas_ItensBASEICMSST: TFloatField;
    cdsNotas_Entradas_ItensVALORICMSST: TFloatField;
    cdsNotas_Entradas_ItensPESOLIQUIDO: TFloatField;
    cdsNotas_Entradas_ItensPESOBRUTO: TFloatField;
    cdsNotas_Entradas_ItensCLASSIFICACAOFISCAL: TStringField;
    btnPercentualPrecoVenda: TButton;
    cdsImpostos: TClientDataSet;
    cdsImpostosIMPOSTO: TStringField;
    cdsImpostosBASE: TCurrencyField;
    cdsImpostosVALOR: TCurrencyField;
    cdsImpostosID: TIntegerField;
    dtsImpostos: TDataSource;
    cdsNotas_Entradas_DadosBASEISSA: TFloatField;
    cdsNotas_Entradas_DadosVALORISSA: TFloatField;
    cdsNotas_Entradas_DadosBASEISSR: TFloatField;
    cdsNotas_Entradas_DadosVALORISSR: TFloatField;
    cdsNotas_Entradas_DadosBASEPISA: TFloatField;
    cdsNotas_Entradas_DadosVALORPISA: TFloatField;
    cdsNotas_Entradas_DadosBASECOFINSA: TFloatField;
    cdsNotas_Entradas_DadosVALORCOFINSA: TFloatField;
    cdsNotas_Entradas_DadosBASEIRRFA: TFloatField;
    cdsNotas_Entradas_DadosVALORIRRFA: TFloatField;
    cdsNotas_Entradas_DadosBASEIRRFR: TFloatField;
    cdsNotas_Entradas_DadosVALORIRRFR: TFloatField;
    cdsNotas_Entradas_DadosBASEINSSA: TFloatField;
    cdsNotas_Entradas_DadosVALORINSSA: TFloatField;
    cdsNotas_Entradas_DadosBASEINSSR: TFloatField;
    cdsNotas_Entradas_DadosVALORINSSR: TFloatField;
    cdsNotas_Entradas_DadosEXPORTADO: TStringField;
    cdsNotas_Entradas_ItensMARGEMLUCRO: TFloatField;
    cdsNotas_Entradas_ItensBASEISSA: TFloatField;
    cdsNotas_Entradas_ItensVALORISSA: TFloatField;
    cdsNotas_Entradas_ItensBASEISSR: TFloatField;
    cdsNotas_Entradas_ItensVALORISSR: TFloatField;
    cdsNotas_Entradas_ItensBASEPISA: TFloatField;
    cdsNotas_Entradas_ItensVALORPISA: TFloatField;
    cdsNotas_Entradas_ItensBASECOFINSA: TFloatField;
    cdsNotas_Entradas_ItensVALORCOFINSA: TFloatField;
    cdsNotas_Entradas_ItensIRRF: TFloatField;
    cdsNotas_Entradas_ItensBASEIRRFA: TFloatField;
    cdsNotas_Entradas_ItensVALORIRRFA: TFloatField;
    cdsNotas_Entradas_ItensBASEIRRFR: TFloatField;
    cdsNotas_Entradas_ItensVALORIRRFR: TFloatField;
    cdsNotas_Entradas_ItensINSS: TFloatField;
    cdsNotas_Entradas_ItensBASEINSSA: TFloatField;
    cdsNotas_Entradas_ItensVALORINSSA: TFloatField;
    cdsNotas_Entradas_ItensBASEINSSR: TFloatField;
    cdsNotas_Entradas_ItensVALORINSSR: TFloatField;
    cdsNotas_Entradas_ItensDESCRICAO: TStringField;
    cdsNotas_Entradas_DadosVALORDESCONTOALTERNATIVO: TFloatField;
    cdsNotas_Entradas_ItensUNITARIOALTERNATIVO: TFloatField;
    cdsNotas_Entradas_ItensVALORDESCONTOALTERNATIVO: TFloatField;
    cdsNotas_Entradas_ItensUNITARIOORIGINAL: TFloatField;
    btnDespesasImportacao: TButton;
    cdsNotas_Entradas_DadosIDNFE: TStringField;
    cdsNotas_Entradas_DadosLOTENFE: TStringField;
    cdsNotas_Entradas_DadosDESPESASIMPORTACAO: TFloatField;
    cdsNotas_Entradas_DadosLIBERANFE: TStringField;
    cdsNotas_Entradas_DadosPGERACAONFE: TStringField;
    cdsNotas_Entradas_DadosCONTINGENCIANFE: TStringField;
    tbsImpostos: TTabSheet;
    tbsDados_Adicionais: TTabSheet;
    tbsNFe: TTabSheet;
    scrImpostos: TScrollBox;
    dbgridImpostos: TDBGrid;
    scrDados_Adicionais: TScrollBox;
    grpDados_Corpo: TGroupBox;
    dbmemCorpo: TDBMemo;
    grpDados_Adicionais: TGroupBox;
    dbmemAdicionais: TDBMemo;
    scrNFe: TScrollBox;
    Label28: TLabel;
    Label29: TLabel;
    dbedtNFe: TDBEdit;
    dbedtLoteProcessado: TDBEdit;
    btnImprimir_DANFE: TButton;
    btnEnviar_XML: TButton;
    btnGerar_PDF: TButton;
    cdsNotas_Entradas_DadosDIGITACAO: TDateField;
    cdsNotas_Entradas_ItensCSTIPI: TStringField;
    cdsNotas_Entradas_ItensCSTICMS: TStringField;
    cdsNotas_Entradas_ItensORIGEMST: TStringField;
    cdsNotas_Saidas: TClientDataSet;
    cdsNotas_SaidasEMISSAO: TDateField;
    cdsNotas_SaidasPREFIXO: TStringField;
    cdsNotas_SaidasNUMERO: TIntegerField;
    cdsNotas_SaidasQUANTIDADE: TFloatField;
    cdsNotas_SaidasLOCAL: TStringField;
    dtsNotas_Saidas: TDataSource;
    cdsNotas_SaidasUNITARIO: TFloatField;
    cdsNotas_SaidasUNITARIOORIGINAL: TFloatField;
    cdsNotas_SaidasTOTAL: TFloatField;
    cdsNotas_SaidasTOTALORIGINAL: TFloatField;
    cdsNotas_SaidasITEM: TIntegerField;
    cdsImpressao_Garantia: TClientDataSet;
    cdsImpressao_GarantiaCLIENTE: TStringField;
    cdsImpressao_GarantiaDATA: TDateField;
    cdsImpressao_GarantiaNUMERO: TIntegerField;
    cdsImpressao_GarantiaVALORBRUTO: TCurrencyField;
    cdsImpressao_GarantiaCODIGO: TStringField;
    cdsImpressao_GarantiaDOCUMENTOORIGEM: TIntegerField;
    cdsImpressao_GarantiaDESCRICAOPRODUTO: TStringField;
    cdsImpressao_GarantiaQUANTIDADE: TIntegerField;
    cdsImpressao_GarantiaUNITARIO: TFloatField;
    cdsImpressao_GarantiaTOTALFINAL: TFloatField;
    cdsImpressao_GarantiaVALORIPI: TFloatField;
    cdsAuxiliar: TClientDataSet;
    cdsImpressao_GarantiaEMISSAO: TStringField;
    cdsAuxiliarEMISSAO: TDateField;
    cdsImpressao_GarantiaNOMECLIENTE: TStringField;
    cdsAuxiliarNOME: TStringField;
    Label30: TLabel;
    Label31: TLabel;
    dbedtProtocoloGerado: TDBEdit;
    dbedtProtocoloAutorizacao: TDBEdit;
    Label32: TLabel;
    dbedtInfAutorizacao: TDBEdit;
    cdsNotas_Entradas_DadosPAUTORIZACAONFE: TStringField;
    cdsNotas_Entradas_DadosINFAUTORIZACAONFE: TStringField;
    cdsNotas_Entradas_ItensNUMERODI: TStringField;
    cdsNotas_Entradas_ItensDATADI: TDateField;
    cdsNotas_Entradas_ItensLOCALDESEMBARACO: TStringField;
    cdsNotas_Entradas_ItensUFDESEMBARACO: TStringField;
    cdsNotas_Entradas_ItensEXPORTADOR: TStringField;
    cdsNotas_Entradas_ItensDATADESEMBARACO: TDateField;
    cdsNotas_Entradas_ItensADICAO: TStringField;
    cdsNotas_Entradas_ItensFABRICANTE: TStringField;
    cdsNotas_Entradas_ItensDESCONTODI: TFloatField;
    cdsNotas_Entradas_ItensSEQADICAO: TStringField;
    cdsImpressao_GarantiaLOCAL: TStringField;
    cdsSaldos_Terceiros: TClientDataSet;
    dtsSaldos_Terceiros: TDataSource;
    cdsSaldos_TerceirosEMISSAO: TDateField;
    cdsSaldos_TerceirosPREFIXO: TStringField;
    cdsSaldos_TerceirosNUMERO: TIntegerField;
    cdsSaldos_TerceirosITEM: TIntegerField;
    cdsSaldos_TerceirosPRIMEIRAUNIDADE: TStringField;
    cdsSaldos_TerceirosLOCAL: TStringField;
    cdsSaldos_TerceirosQUANTIDADE: TFloatField;
    cdsSaldos_TerceirosUNITARIO: TFloatField;
    cdsSaldos_TerceirosTOTAL: TFloatField;
    cdsSaldos_TerceirosCUSTOMEDIO: TFloatField;
    cdsSaldos_TerceirosSALDO: TFloatField;
    cdsSaldos_TerceirosREGRA: TIntegerField;
    cdsDevolucoes: TClientDataSet;
    cdsDevolucoesNUMERO: TIntegerField;
    cdsDevolucoesQUANTIDADE: TFloatField;
    cdsDevolucoesPRODUTO: TStringField;
    cdsDevolucoesLOCAL: TStringField;
    cdsNotas_Entradas_DadosPERCENTUALVENDA: TFloatField;
    cdsNotas_Entradas_DadosADICIONAIS: TStringField;
    cdsNotas_Entradas_DadosDSAIDA: TDateField;
    cdsNotas_Entradas_DadosHSAIDA: TStringField;
    Label33: TLabel;
    dbedtDataSaida: TDBEdit;
    dbedtHoraSaida: TDBEdit;
    Label37: TLabel;
    cdsNotas_Entradas_DadosIDNFEREF: TStringField;
    Label15: TLabel;
    bedtIdNFeRef: TDBEdit;
    cdsNotas_Entradas_ItensLOTE: TStringField;
    cdsNotas_Entradas_ItensVALIDADELOTE: TDateField;
    cdsNotas_Entradas_ItensDOCUMENTOLOTE: TStringField;
    cdsNotas_Entradas_DadosTAXANEGOCIADA: TFloatField;
    cdsNotas_Entradas_ItensDESPESASIMPORTACAO: TFloatField;
    Label20: TLabel;
    dbedtTaxaNegociada: TDBEdit;
    cdsNotas_Entradas_ItensOP: TIntegerField;
    cdsNotas_Entradas_ItensITEMOP: TIntegerField;
    dspcNotas_Entradas_Dados: TDSProviderConnection;
    dspcNotas_Saidas: TDSProviderConnection;
    dspcAuxiliar: TDSProviderConnection;
    dspcDevolucoes: TDSProviderConnection;
    dspcSaldos_Terceiros: TDSProviderConnection;
    actPedidos_Compras: TAction;
    actImprimir_Garantias: TAction;
    btnSeparador1: TToolButton;
    btnImprimir_Garantias: TToolButton;
    btnSeparador2: TToolButton;
    btnMostrar_Pedidos_Compras: TToolButton;
    btnSeparador3: TToolButton;
    btnImportar_XML: TToolButton;
    OpenDialog: TOpenDialog;
    cdsNotas_Entradas_DadosBASEPISR: TFloatField;
    cdsNotas_Entradas_DadosVALORPISR: TFloatField;
    cdsNotas_Entradas_DadosVALORCOFINSR: TFloatField;
    cdsNotas_Entradas_DadosBASECOFINSR: TFloatField;
    cdsNotas_Entradas_DadosBASECSLLR: TFloatField;
    cdsNotas_Entradas_DadosVALORCSLLR: TFloatField;
    cdsNotas_Entradas_ItensPISR: TFloatField;
    cdsNotas_Entradas_ItensBASEPISR: TFloatField;
    cdsNotas_Entradas_ItensVALORPISR: TFloatField;
    cdsNotas_Entradas_ItensCOFINSR: TFloatField;
    cdsNotas_Entradas_ItensBASECOFINSR: TFloatField;
    cdsNotas_Entradas_ItensVALORCOFINSR: TFloatField;
    cdsNotas_Entradas_ItensCSLLR: TFloatField;
    cdsNotas_Entradas_ItensBASECSLLR: TFloatField;
    cdsNotas_Entradas_ItensVALORCSLLR: TFloatField;
    cdsNotas_Entradas_ItensPISA: TFloatField;
    cdsNotas_Entradas_ItensCOFINSA: TFloatField;
    dspcProduto_Fornecedor: TDSProviderConnection;
    cdsProduto_Fornecedor: TClientDataSet;
    cdsProduto_FornecedorEMPRESA: TStringField;
    cdsProduto_FornecedorFILIAL: TStringField;
    cdsProduto_FornecedorCODIGOFORNECEDOR: TIntegerField;
    cdsProduto_FornecedorCNPJ: TStringField;
    cdsProduto_FornecedorCODIGOPRODUTO: TIntegerField;
    cdsProduto_FornecedorPRODUTO: TStringField;
    cdsProduto_FornecedorPRODUTOFORNECEDOR: TStringField;
    dspcFornecedor: TDSProviderConnection;
    cdsFornecedor: TClientDataSet;
    cdsFornecedorEMPRESA: TStringField;
    cdsFornecedorFILIAL: TStringField;
    cdsFornecedorSTATUS: TStringField;
    cdsFornecedorCODIGO: TIntegerField;
    cdsFornecedorDATACADASTRO: TDateField;
    cdsFornecedorNOME: TStringField;
    cdsFornecedorPESSOA: TStringField;
    cdsFornecedorREDUZIDO: TStringField;
    cdsFornecedorENDERECO: TStringField;
    cdsFornecedorNUMERO: TStringField;
    cdsFornecedorCOMPLEMENTO: TStringField;
    cdsFornecedorUF: TStringField;
    cdsFornecedorMUNICIPIO: TStringField;
    cdsFornecedorCMUNICIPIO: TStringField;
    cdsFornecedorBAIRRO: TStringField;
    cdsFornecedorCEP: TStringField;
    cdsFornecedorCNPJ: TStringField;
    cdsFornecedorCPF: TStringField;
    cdsFornecedorIE: TStringField;
    cdsFornecedorIM: TStringField;
    cdsFornecedorRG: TStringField;
    cdsFornecedorEMAIL: TStringField;
    cdsFornecedorHOMEPAGE: TStringField;
    cdsFornecedorDDI: TStringField;
    cdsFornecedorDDD: TStringField;
    cdsFornecedorTELEFONE: TStringField;
    cdsFornecedorFAX: TStringField;
    cdsFornecedorCONTATO: TStringField;
    cdsFornecedorCPAIS: TStringField;
    cdsFornecedorNPAIS: TStringField;
    cdsFornecedorBANCO: TIntegerField;
    cdsFornecedorAGENCIA: TStringField;
    cdsFornecedorCONTA: TStringField;
    cdsFornecedorGRUPO: TIntegerField;
    cdsFornecedorTRANSPORTADORA: TIntegerField;
    cdsFornecedorTABELA: TIntegerField;
    cdsFornecedorLIMITECREDITO: TFloatField;
    cdsFornecedorVENCIMENTOLC: TDateField;
    cdsFornecedorPRIMEIRACOMPRA: TDateField;
    cdsFornecedorULTIMACOMPRA: TDateField;
    cdsFornecedorSEGMENTOMERCADO: TIntegerField;
    cdsFornecedorMAIORSALDOLC: TFloatField;
    cdsFornecedorMENORSALDOLC: TFloatField;
    cdsFornecedorMAIORCOMPRA: TFloatField;
    cdsFornecedorMENORCOMPRA: TFloatField;
    cdsFornecedorSALDODEVEDOR: TFloatField;
    cdsFornecedorTITULOSABERTOS: TIntegerField;
    cdsFornecedorNUMEROCOMPRAS: TIntegerField;
    cdsFornecedorSALDOATRASADOS: TFloatField;
    cdsFornecedorTITULOSATRASADOS: TIntegerField;
    cdsFornecedorMAIORTITULO: TFloatField;
    cdsFornecedorMENORTITULO: TFloatField;
    cdsFornecedorCHEQUESDEVOLVIDOS: TIntegerField;
    cdsFornecedorULTIMADEVOLUCAO: TDateField;
    cdsFornecedorOBSERVACAO: TStringField;
    cdsFornecedorTIPOFRETE: TStringField;
    cdsFornecedorDESCONTO: TFloatField;
    cdsFornecedorCONDICAOPAGAMENTO: TIntegerField;
    cdsFornecedorFORMAPAGAMENTO: TStringField;
    cdsFornecedorCATEGORIA: TStringField;
    cdsFornecedorTIPOPRECO: TStringField;
    cdsFornecedorNUMEROPAGTOS: TIntegerField;
    cdsFornecedorMEDIAATRASO: TFloatField;
    cdsFornecedorNOTIFICAEMAIL: TStringField;
    cdsFornecedorEMAILNFE: TStringField;
    cdsFornecedorCLIENTE: TIntegerField;
    cdsFornecedorVENDEDOR: TIntegerField;
    cdsFornecedorDATACRIACAO: TSQLTimeStampField;
    cdsFornecedorsqlFornecedores_Produtos: TDataSetField;
    cdsFornecedorsqlFornecedores_Contatos: TDataSetField;
    cdsProduto_FornecedorUNIDADEMEDIDA: TStringField;
    frxReport1: TfrxReport;
    Garantia: TfrxDBDataset;
    cdsNotas_Entradas_DadossqlNotas_Entradas_CCe: TDataSetField;
    tbsDadosCCe: TTabSheet;
    ScrollBox1: TScrollBox;
    dbgridCCe: TDBGrid;
    cdsNotas_Entradas_CCe: TClientDataSet;
    cdsNotas_Entradas_CCeEMPRESA: TStringField;
    cdsNotas_Entradas_CCeFILIAL: TStringField;
    cdsNotas_Entradas_CCePREFIXO: TStringField;
    cdsNotas_Entradas_CCeNUMERO: TIntegerField;
    cdsNotas_Entradas_CCeFORNECEDOR: TIntegerField;
    cdsNotas_Entradas_CCeSEQUENCIAL: TIntegerField;
    cdsNotas_Entradas_CCeEVENTO: TStringField;
    cdsNotas_Entradas_CCeDATAEVENTO: TStringField;
    cdsNotas_Entradas_CCeCORRECAO: TStringField;
    cdsNotas_Entradas_CCeINCLUIDO: TStringField;
    cdsNotas_Entradas_CCeALTERADO: TStringField;
    cdsNotas_Entradas_CCeDATACRIACAO: TSQLTimeStampField;
    dtsNotas_Entradas_CCe: TDataSource;
    cdsNotas_Entradas_DadosVALORTRIBUTOS: TFloatField;
    cdsNotas_Entradas_ItensVALORTRIBUTOS: TFloatField;
    cdsNotas_Entradas_ItensTRIBUTOS: TFloatField;
    cdsNotas_Entradas_DadosBASETRIBUTOS: TFloatField;
    cdsNotas_Entradas_ItensBASETRIBUTOS: TFloatField;
    cdsNotas_Entradas_ItensADICIONAIS: TStringField;
    cdsNotas_Entradas_DadosNOMEFORNECEDOR: TStringField;
    cdsNotas_Entradas_DadosORIGEM: TStringField;
    cdsNotas_Entradas_ItensORIGEM: TStringField;
    cdsNotas_Entradas_DadosHORA: TStringField;
    Label21: TLabel;
    dbedtHora: TDBEdit;
    cdsNotas_Entradas_DadosTIPOCONTINGENCIANFE: TStringField;
    cdsNotas_Entradas_ItensVIATRANSPORTE: TStringField;
    cdsNotas_Entradas_ItensTIPOINTERMEDIACAO: TStringField;
    actImportar_XML: TAction;
    cdsNotas_Entradas_Referenciadas: TClientDataSet;
    dtsNotas_Entradas_Referenciadas: TDataSource;
    cdsNotas_Entradas_DadossqlNotas_Entradas_Referenciadas: TDataSetField;
    cdsNotas_Entradas_ReferenciadasEMPRESA: TStringField;
    cdsNotas_Entradas_ReferenciadasFILIAL: TStringField;
    cdsNotas_Entradas_ReferenciadasPREFIXO: TStringField;
    cdsNotas_Entradas_ReferenciadasNUMERO: TIntegerField;
    cdsNotas_Entradas_ReferenciadasFORNECEDOR: TIntegerField;
    cdsNotas_Entradas_ReferenciadasSEQUENCIAL: TIntegerField;
    cdsNotas_Entradas_ReferenciadasIDNFEREF: TStringField;
    cdsNotas_Entradas_ReferenciadasINCLUIDO: TStringField;
    cdsNotas_Entradas_ReferenciadasALTERADO: TStringField;
    cdsNotas_Entradas_ReferenciadasDATACRIACAO: TSQLTimeStampField;
    tbsReferenciadas: TTabSheet;
    dbgridReferenciadas: TDBGrid;
    cdsNotas_Entradas_ItensNCM: TStringField;
    cdsNotas_Entradas_ItensCEST: TStringField;
    cdsNotas_Entradas_ItensICMSDIF: TFloatField;
    cdsNotas_Entradas_ItensBASEICMSDIF: TFloatField;
    cdsNotas_Entradas_ItensVALORICMSDIF: TFloatField;
    cdsNotas_Entradas_ItensINCLUIDO: TStringField;
    cdsNotas_Entradas_ItensALTERADO: TStringField;
    cdsNotas_Entradas_ItensSALDODEVOLVER: TFloatField;
    cdsNotas_SaidasSALDODEVOLVER: TFloatField;
    cdsNotas_Entradas_DadosBASEICMSDIF: TFloatField;
    cdsNotas_Entradas_DadosVALORICMSDIF: TFloatField;
    cdsNotas_Entradas_DadosBASEICMSFCP: TFloatField;
    cdsNotas_Entradas_DadosVALORICMSFCP: TFloatField;
    cdsNotas_Entradas_DadosBASEICMSPUFD: TFloatField;
    cdsNotas_Entradas_DadosVALORICMSPUFD: TFloatField;
    cdsNotas_Entradas_DadosBASEICMSPUFO: TFloatField;
    cdsNotas_Entradas_DadosVALORICMSPUFO: TFloatField;
    cdsNotas_Entradas_DadosINCLUIDO: TStringField;
    cdsNotas_Entradas_DadosALTERADO: TStringField;
    cdsNotas_Entradas_ItensBASEICMSFCP: TFloatField;
    cdsNotas_Entradas_ItensVALORICMSFCP: TFloatField;
    cdsNotas_Entradas_ItensBASEICMSPUFD: TFloatField;
    cdsNotas_Entradas_ItensVALORICMSPUFD: TFloatField;
    cdsNotas_Entradas_ItensBASEICMSPUFO: TFloatField;
    cdsNotas_Entradas_ItensVALORICMSPUFO: TFloatField;
    cdsNotas_Entradas_ItensCSOSNICMS: TStringField;
    cdsNotas_Entradas_DadosBASECOMISSAO: TFloatField;
    cdsNotas_Entradas_DadosVALORCOMISSAO: TFloatField;
    cdsNotas_Entradas_ItensBASECOMISSAO: TFloatField;
    cdsNotas_Entradas_ItensVALORCOMISSAO: TFloatField;
    cdsNotas_SaidasBASECOMISSAO: TFloatField;
    cdsNotas_SaidasVALORCOMISSAO: TFloatField;
    procedure cdsNotas_Entradas_DadosAfterInsert(DataSet: TDataSet);
    procedure spdTransportadorasClick(Sender: TObject);
    procedure cdsNotas_Entradas_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure cdsNotas_Entradas_ItensTOTALMOEDAValidate(Sender: TField);
    procedure cdsNotas_Entradas_ItensISSValidate(Sender: TField);
    procedure cdsNotas_Entradas_DadosBeforeEdit(DataSet: TDataSet);
    procedure cdsNotas_Entradas_ItensIIValidate(Sender: TField);
    procedure cdsNotas_Entradas_ItensVALORSEGUROValidate(Sender: TField);
    procedure cdsNotas_Entradas_ItensVALORFRETEValidate(Sender: TField);
    procedure cdsNotas_Entradas_ItensVALORDESPESASValidate(Sender: TField);
    procedure cdsNotas_Entradas_DadosFORMULARIOPROPRIOValidate(Sender: TField);
    procedure cdsNotas_Entradas_DadosVALORDESPESASValidate(Sender: TField);
    procedure cdsNotas_Entradas_DadosVALORSEGUROValidate(Sender: TField);
    procedure cdsNotas_Entradas_DadosVALORFRETEValidate(Sender: TField);
    procedure cdsNotas_Entradas_DadosVALORDESCONTOValidate(Sender: TField);
    procedure cdsNotas_Entradas_DadosDESCONTOValidate(Sender: TField);
    procedure cdsNotas_Entradas_ItensLOCALValidate(Sender: TField);
    procedure cdsNotas_Entradas_ItensPRIMEIRAUNIDADEValidate(Sender: TField);
    procedure cdsNotas_Entradas_DadosTAXAValidate(Sender: TField);
    procedure FormCreate(Sender: TObject);
    procedure cdsNotas_Entradas_DadosNewRecord(DataSet: TDataSet);
    procedure cdsNotas_Entradas_ItensNewRecord(DataSet: TDataSet);
    procedure spdFornecedoresClick(Sender: TObject);
    procedure spdCondicoesPagamentosClick(Sender: TObject);
    procedure spdMoedasClick(Sender: TObject);
    procedure dbgridItensEditButtonClick(Sender: TObject);
    procedure dbgridItensExit(Sender: TObject);
    procedure cdsNotas_Entradas_DadosBeforeDelete(DataSet: TDataSet);
    procedure cdsNotas_Entradas_DadosBeforePost(DataSet: TDataSet);
    procedure cdsNotas_Entradas_DadosDeleteError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdsNotas_Entradas_DadosEditError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdsNotas_Entradas_DadosPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdsNotas_Entradas_DadosReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsNotas_Entradas_ItensAfterDelete(DataSet: TDataSet);
    procedure cdsNotas_Entradas_ItensAfterPost(DataSet: TDataSet);
    procedure cdsNotas_Entradas_ItensBeforeInsert(DataSet: TDataSet);
    procedure cdsNotas_Entradas_ItensBeforePost(DataSet: TDataSet);
    procedure cdsNotas_Entradas_ItensPRODUTOValidate(Sender: TField);
    procedure cdsNotas_Entradas_ItensQUANTIDADEValidate(Sender: TField);
    procedure cdsNotas_Entradas_ItensUNITARIOValidate(Sender: TField);
    procedure cdsNotas_Entradas_ItensTOTALValidate(Sender: TField);
    procedure cdsNotas_Entradas_ItensDESCONTOValidate(Sender: TField);
    procedure cdsNotas_Entradas_ItensVALORDESCONTOValidate(Sender: TField);
    procedure cdsNotas_Entradas_ItensREGRAValidate(Sender: TField);
    procedure cdsNotas_Entradas_ItensIPIValidate(Sender: TField);
    procedure cdsNotas_Entradas_ItensICMSValidate(Sender: TField);
    procedure FormShow(Sender: TObject);
    procedure spdTabelasPrecosClick(Sender: TObject);
    procedure cdsNotas_Entradas_DadosMOEDAValidate(Sender: TField);
    procedure cdsNotas_Entradas_DadosTABELAValidate(Sender: TField);
    procedure dbedtEmissaoDblClick(Sender: TObject);
    procedure cdsNotas_Entradas_ItensUNITARIOMOEDAValidate(Sender: TField);
    procedure spdCategoriasClick(Sender: TObject);
    procedure cdsNotas_Entradas_ItensDeleteError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdsNotas_Entradas_ItensEditError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdsNotas_Entradas_ItensPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdsNotas_Entradas_DadosEMISSAOValidate(Sender: TField);
    procedure cdsNotas_Entradas_DadosBeforeApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure cdsNotas_Entradas_ItensUNITARIOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsNotas_Entradas_ItensUNITARIOMOEDAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsNotas_Entradas_ItensTOTALGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure btnPercentualPrecoVendaClick(Sender: TObject);
    procedure cdsNotas_Entradas_DadosAfterScroll(DataSet: TDataSet);
    procedure cdsNotas_Entradas_ItensIRRFValidate(Sender: TField);
    procedure cdsNotas_Entradas_ItensINSSValidate(Sender: TField);
    procedure cdsNotas_Entradas_ItensPISRValidate(Sender: TField);
    procedure cdsNotas_Entradas_ItensCOFINSRValidate(Sender: TField);
    procedure cdsNotas_Entradas_ItensCSLLRValidate(Sender: TField);
    procedure cdsNotas_Entradas_DadosFORNECEDORValidate(Sender: TField);
    procedure cdsNotas_Entradas_DadosTRANSPORTADORAValidate(Sender: TField);
    procedure cdsNotas_Entradas_DadosCONDICAOPAGAMENTOValidate(Sender: TField);
    procedure cdsNotas_Entradas_DadosCATEGORIAValidate(Sender: TField);
    procedure cdsNotas_Entradas_ItensMARGEMLUCROValidate(Sender: TField);
    procedure actPedidos_ComprasExecute(Sender: TObject);
    procedure cdsNotas_Entradas_ItensUNITARIOORIGINALValidate(Sender: TField);
    procedure btnDespesasImportacaoClick(Sender: TObject);
    procedure btnImprimir_DANFEClick(Sender: TObject);
    procedure btnEnviar_XMLClick(Sender: TObject);
    procedure btnGerar_PDFClick(Sender: TObject);
    procedure cdsNotas_Entradas_DadosCalcFields(DataSet: TDataSet);
    procedure actImprimir_GarantiasExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cdsNotas_Entradas_ItensOPValidate(Sender: TField);
    procedure cdsNotas_Entradas_ItensQUANTIDADEGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsNotas_Entradas_ItensUNITARIOALTERNATIVOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsNotas_Entradas_ItensUNITARIOORIGINALGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsNotas_Entradas_ItensTOTALMOEDAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsNotas_Entradas_ItensCUSTOTOTALGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsNotas_Entradas_ItensPISAValidate(Sender: TField);
    procedure cdsNotas_Entradas_ItensCOFINSAValidate(Sender: TField);
    procedure cdsNotas_Entradas_ItensTRIBUTOSValidate(Sender: TField);
    procedure cdsNotas_Entradas_DadosBeforeOpen(DataSet: TDataSet);
    procedure actImportar_XMLExecute(Sender: TObject);
    procedure cdsNotas_Entradas_ItensICMSDIFValidate(Sender: TField);
    procedure cdsNotas_Entradas_DadosAfterPost(DataSet: TDataSet);
    procedure cdsNotas_Entradas_ReferenciadasNewRecord(DataSet: TDataSet);
    procedure cdsNotas_Entradas_ReferenciadasBeforePost(DataSet: TDataSet);
    procedure cdsNotas_Entradas_ReferenciadasBeforeInsert(DataSet: TDataSet);
  protected
    SequenciaRef: Integer;
    InicializaItem: Boolean;
    Rateando: Boolean;
    IdNota: TIdNota;
    Inserir: Boolean;
    ItensIguais: Boolean;
    DecimaisUnitario: Integer;
    DecimaisQuantidade: Integer;
    Copiando: Boolean;
    DI: TDI;
    MostraSaldosEstoque: Boolean;
    AtribuiDespesasNFE: function: TUDoubleArray;
    procedure HabilitaIdNota(Habilita: Boolean);
    procedure AtualizaTotais;
    procedure AtualizaValoresItem;
    procedure CalculaUnitarioReal;
    procedure AtribuiRateioItens(Campo: ShortString; ValorBase: Currency);
    procedure CarregaImpostos;
    function MostraNotasSaidas(Cliente: Integer; NomeCliente: String; EmissaoDe: TDateTime; EmissaoAte: TDateTime;
      Produto: ShortString; Descricao: ShortString; var LocalOrigem: ShortString; var SaldoDevolver: Double;
      var UnitarioOrigem: Double; var UnitarioOriginalOrigem: Double; var PrefixoOrigem: ShortString;
      var DocumentoOrigem: Integer; var ItemOrigem: Integer; var BaseComissao: Currency; var ValorComissao: Currency): Boolean;
    function MostraNotasTerceiros(Cliente: Integer; NomeCliente: String; EmissaoDe: TDateTime; EmissaoAte: TDateTime;
      Produto: ShortString; Descricao: ShortString; var LocalOrigem: ShortString; var QuantidadeOrigem: Double;
      var UnitarioOrigem: Double; var PrefixoOrigem: ShortString; var DocumentoOrigem: Integer; var ItemOrigem: Integer): Boolean;
    function MostraItensDevolvidos(Fornecedor: Integer; Produto: ShortString; EspecieDocumento: ShortString): Integer;
    procedure AtribuiDadosDI;
    function CancelaNFe: TNFeStatusCancelamento;
    function PegaDescricaoProduto(Produto: String): String;
    procedure LoadLists;
  public
    procedure ShowFields; override;
    procedure DataChange(Sender: TObject; Field: TField); override;
  end;

var
  frmNotas_Entradas: TfrmNotas_Entradas;

implementation

uses uDMMain, uFornecedores, uCondicoes_Pagamentos, uMoedas, uProdutos,
  uRegras_Fiscais, uFornecedores_Tabelas,
  uCategorias_Financeiras, (*uVerifica_Titulos*,*) uTransportadoras,
  uEdita_Parcelas, uSend_Email, uMostra_Notas_Fiscais_Terceiros,
  uInforma_Dados_DI, uNFE_Cancelamento, uMostra_Saldos_Estoque_Lote,
  uDespesas_Importacao, uMostra_Notas_Fiscais, uMostra_Pedidos_Compras,
  uOrdens_Producao;

{$R *.dfm}

procedure TfrmNotas_Entradas.FormCreate(Sender: TObject);
begin
  inherited;
  frmNotas_Entradas := Self;

  SetLength(DefaultDataSets, 1);
  DefaultDataSets[0] := cdsNotas_Entradas_Dados;
  ActivedDataSet := cdsNotas_Entradas_Dados;
  ActivedDataSource := dtsNotas_Entradas_Dados;
  EntityName := __SuperClass.DBFunctions.GetEntityName(ActivedDataSet);

  LockFields.Add('FORMULARIOPROPRIO');
  LockFields.Add('NUMERO');
  LockFields.Add('PREFIXO');
  LockFields.Add('FORNECEDOR');
  LockFields.Add('CONDICAOPAGAMENTO');
  LockFields.Add('CATEGORIA');

  with IdNota do
  begin
    Prefixo := '';
    Numero := 0;
  end;

  Inserir := False;
  ItensIguais := __SuperClass.DBFunctions.GetParamValue('SV_HABILITA_ITENS_IGUAIS_NFE');
  MostraSaldosEstoque := __SuperClass.DBFunctions.GetParamValue('SV_MOSTRA_SALDOS_ESTOQUE');
  Rateando := False;

  DataEntity := cdsNotas_Entradas_Dados;
  ItemsEntity := cdsNotas_Entradas_Itens;

  LoadLists;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_DadosNewRecord(DataSet: TDataSet);
var
  Empresa: String;
  Filial: String;
begin
  inherited;

  __SuperClass.DBFunctions.GetEntityOwner('NOTAS_ENTRADAS_DADOS', Empresa, Filial);
  cdsNotas_Entradas_DadosEMPRESA.AsString := Empresa;
  cdsNotas_Entradas_DadosFILIAL.AsString := Filial;
  cdsNotas_Entradas_DadosFORMULARIOPROPRIO.AsString := VB_NAO;
  cdsNotas_Entradas_DadosEMISSAO.AsDateTime := __SuperClass.User.DataBase;
  cdsNotas_Entradas_DadosHORA.AsString := FormatDateTime('hhmmss', __SuperClass.User.DataBase);
  cdsNotas_Entradas_DadosTIPOFRETE.AsString := TF_CIF;
  cdsNotas_Entradas_DadosDIGITACAO.AsDateTime := __SuperClass.User.DataBase;
  cdsNotas_Entradas_DadosDSAIDA.AsDateTime := __SuperClass.User.DataBase;
  cdsNotas_Entradas_DadosHSAIDA.AsString := FormatDateTime('hhmmss', __SuperClass.ServerDateTime);
  cdsNotas_Entradas_DadosORIGEM.AsString := 'COM'; // Via Compras
  cdsNotas_Entradas_DadosDATACRIACAO.AsDateTime := __SuperClass.ServerDateTime;

  HabilitaIdNota(True);

  DI.Numero := '';
  DI.Data := __SuperClass.User.DataBase;
  DI.LocalDesembaraco := '';
  DI.UFDesembaraco := '';
  DI.DataDesembaraco := __SuperClass.User.DataBase;
  DI.Exportador := '';
  DI.Adicao.Adicao := '';
  DI.Adicao.Sequencia := '';
  DI.Fabricante := '';
  DI.Desconto := 0;
  DI.ViaTransporte := '';
  DI.TipoIntermediacao := '';
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensNewRecord(DataSet: TDataSet);
begin
  inherited;
  // inicializando as variaveis da nota de entrada
  cdsNotas_Entradas_ItensITEM.AsInteger := DetailItems;
  AtribuiDadosDI;
  cdsNotas_Entradas_ItensORIGEM.AsString := 'COM';
  cdsNotas_Entradas_ItensDATACRIACAO.AsDateTime := __SuperClass.ServerDateTime;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensOPValidate(Sender: TField);
function CheckStatusValidation(): TCheckStatusValidation;
begin
  Result := function(StatusField: String; DataSet: TDataSet): String
    begin
      Result := '';
      if DataSet.FieldByName(StatusField).AsString = OP_BAIXADO then
        Result := 'Ordem de produção baixada totalmente.';
   end;
end;
var ApplyFields: TApplyFields;
begin
  inherited;
  if ( Sender.AsInteger <> 0 ) then
    begin
      try
        ApplyFields := TApplyFields.Create(__SuperClass);
        ApplyFields.EntityName := 'ORDENS_PRODUCAO';
        ApplyFields.SourceFilter := Format ('NUMERO = %s', [QuotedStr(Sender.AsString)]);
        ApplyFields.SourceFList.Add('ITEM');
        ApplyFields.CheckStatus := True;
        ApplyFields.StatusField := 'SITUACAO';
        ApplyFields.CheckStatusValidation := CheckStatusValidation();
        ApplyFields.ApplyFList.Add('ITEMOP');
        ApplyFields.ApplyDataSet := Sender.DataSet;
        if not ApplyFields.Execute then
          begin
            __SuperClass.GenericsF.DisplayMessage(ApplyFields.ResultMsg, '', 'Verifique o conteúdo do campo informado.', 'Informação', MB_ICONINFORMATION);
            Abort;
        end;
      finally
        FreeAndNil(ApplyFields);
      end;

  end;
end;

procedure TfrmNotas_Entradas.spdFornecedoresClick(Sender: TObject);
var
  AFields: TUStringArray;
  SFields: TUStringArray;
begin
  inherited;
  frmFornecedores := TfrmFornecedores.Create(Self);
  try
    // campos que receberão os dados
    SetLength(AFields, 3);
    AFields[0] := 'FORNECEDOR';
    AFields[1] := 'NOMEFORNECEDOR';
    AFields[2] := 'UF';
    // campos que proverão os dados
    SetLength(SFields, 3);
    SFields[0] := 'CODIGO';
    SFields[1] := 'REDUZIDO';
    SFields[2] := 'UF';
    __SuperClass.DBFunctions.ApplyFieldsInDataSet(frmFornecedores, frmFornecedores.cdsFornecedores,
      frmFornecedores.dtsFornecedores, ActivedDataSet, AFields, SFields);
  finally
    FreeAndNil(frmFornecedores);
  end;
end;

procedure TfrmNotas_Entradas.spdCondicoesPagamentosClick(Sender: TObject);
var
  AFields: TUStringArray;
  SFields: TUStringArray;
begin
  inherited;
  frmCondicoes_Pagamentos := TfrmCondicoes_Pagamentos.Create(Self);
  try
    // campos que receberão os dados
    SetLength(AFields, 2);
    AFields[0] := 'CONDICAOPAGAMENTO';
    AFields[1] := 'DESCRICAOCONDICAO';
    // campos que proverão os dados
    SetLength(SFields, 2);
    SFields[0] := 'CODIGO';
    SFields[1] := 'DESCRICAO';
    __SuperClass.DBFunctions.ApplyFieldsInDataSet(frmCondicoes_Pagamentos, frmCondicoes_Pagamentos.cdsCondicoes_Pagamentos,
      frmCondicoes_Pagamentos.dtsCondicoes_Pagamentos, ActivedDataSet, AFields, SFields);
  finally
    FreeAndNil(frmCondicoes_Pagamentos);
  end;
end;

procedure TfrmNotas_Entradas.spdMoedasClick(Sender: TObject);
var
  AFields: TUStringArray;
  SFields: TUStringArray;
begin
  inherited;
  frmMoedas := TfrmMoedas.Create(Self);
  try
    // campos que receberão os dados
    SetLength(AFields, 3);
    AFields[0] := 'MOEDA';
    AFields[1] := 'DESCRICAOMOEDA';
    AFields[2] := 'TAXA';
    // campos que proverão os dados
    SetLength(SFields, 3);
    SFields[0] := 'CODIGO';
    SFields[1] := 'DESCRICAO';
    SFields[2] := 'ULTIMOVALOR';
    __SuperClass.DBFunctions.ApplyFieldsInDataSet(frmMoedas, frmMoedas.cdsMoedas, frmMoedas.dtsMoedas, ActivedDataSet,
      AFields, SFields);
  finally
    FreeAndNil(frmMoedas);
  end;
end;

procedure TfrmNotas_Entradas.dbgridItensEditButtonClick(Sender: TObject);
var
  AFields: TUStringArray;
  SFields: TUStringArray;
  ProdBeneficiamento: String;
begin
  inherited;
  if (dbgridItens.SelectedField = cdsNotas_Entradas_ItensPRODUTO) then
  begin
    frmProdutos := TfrmProdutos.Create(Self);
    with frmProdutos do
    begin
      try
        // campos que receberão os dados
        SetLength(AFields, 1);
        AFields[0] := 'PRODUTO';
        // campos que proverão os dados
        SetLength(SFields, 1);
        SFields[0] := 'CODIGO';
        __SuperClass.DBFunctions.ApplyFieldsInDataSet(frmProdutos, frmProdutos.cdsProdutos, frmProdutos.dtsProdutos,
          cdsNotas_Entradas_Itens, AFields, SFields);
      finally
        FreeAndNil(frmProdutos);
      end;
    end;
  end else if (dbgridItens.SelectedField = cdsNotas_Entradas_ItensREGRA) then
  begin
    frmRegras_Fiscais := TfrmRegras_Fiscais.Create(Self);
    try
      // campos que receberão os dados
      SetLength(AFields, 5);
      AFields[0] := 'REGRA';
      AFields[1] := 'CODIGOFISCAL';
      AFields[2] := 'IPI';
      AFields[3] := 'ICMS';
      AFields[4] := 'II';
      // campos que proverão os dados
      SetLength(SFields, 5);
      SFields[0] := 'CODIGO';
      SFields[1] := 'CODIGOFISCAL';
      SFields[2] := 'IPI';
      SFields[3] := 'ICMS';
      SFields[4] := 'II';
      __SuperClass.DBFunctions.ApplyFieldsInDataSet(frmRegras_Fiscais, frmRegras_Fiscais.cdsRegras_Fiscais,
        frmRegras_Fiscais.dtsRegras_Fiscais, cdsNotas_Entradas_Itens, AFields, SFields);
      // implementando as regras para os impostos
    finally
      FreeAndNil(frmRegras_Fiscais);
    end;
  end else if (dbgridItens.SelectedField = cdsNotas_Entradas_ItensPRIMEIRAUNIDADE) then
    __SuperClass.DBFunctions.ApplyItemFromList(TL_UNIDADES_MEDIDAS, cdsNotas_Entradas_ItensPRIMEIRAUNIDADE)
  else
    if (dbgridItens.SelectedField = cdsNotas_Entradas_ItensLOCAL) then
      __SuperClass.DBFunctions.ApplyItemFromList(TL_LOCAIS_ARMAZENAGEM, cdsNotas_Entradas_ItensLOCAL)
    else
      if (dbgridItens.SelectedField = cdsNotas_Entradas_ItensDESCRICAO) then
        __SuperClass.DBFunctions.GetMemoValue(dtsNotas_Entradas_Itens, 'DESCRICAO', False)
      else
        if (dbgridItens.SelectedField = cdsNotas_Entradas_ItensLOTE) then
          begin
            frmMostra_Saldos_Estoque_Lote := TfrmMostra_Saldos_Estoque_Lote.Create(Self);
            frmMostra_Saldos_Estoque_Lote.FProduto := cdsNotas_Entradas_ItensPRODUTO.AsString;
            frmMostra_Saldos_Estoque_Lote.FDescricao := cdsNotas_Entradas_ItensDESCRICAO.AsString;
            // frmMostra_Saldos_Estoque_Lote.FLocal := cdsNotas_Entradas_ItensLOCAL.AsString;
            frmMostra_Saldos_Estoque_Lote.FQOriginal := -1;
            if (frmMostra_Saldos_Estoque_Lote.ShowModal = mrOk) then
              begin
                if not(cdsNotas_Entradas_Itens.State in [dsInsert, dsEdit]) then
                  cdsNotas_Entradas_Itens.Edit;
                cdsNotas_Entradas_ItensLOTE.AsString := frmMostra_Saldos_Estoque_Lote.FLote;
                cdsNotas_Entradas_ItensVALIDADELOTE.AsDateTime := frmMostra_Saldos_Estoque_Lote.FValidadeLote;
            end;
          end
        else if (dbgridItens.SelectedField = cdsNotas_Entradas_ItensVALIDADELOTE) then
          __SuperClass.DBFunctions.ShowCalendar(Self, cdsNotas_Entradas_ItensVALIDADELOTE)
        else
          if (dbgridItens.SelectedField = cdsNotas_Entradas_ItensNUMERODI) then
            begin
              frmInforma_Dados_DI := TfrmInforma_Dados_DI.Create(Self);
              try
                frmInforma_Dados_DI.DI := DI;
                frmInforma_Dados_DI.ShowModal;
                DI := frmInforma_Dados_DI.DI;
                AtribuiDadosDI;
              finally
                FreeAndNil(frmInforma_Dados_DI);
              end;
            end
          else if (dbgridItens.SelectedField = cdsNotas_Entradas_ItensOP) then
            begin
              frmOrdens_Producao := TfrmOrdens_Producao.Create(Self);
              try
                SetLength(AFields, 2);
                AFields[0] := 'OP';
                AFields[1] := 'ITEMOP';

                SetLength(SFields, 2);
                SFields[0] := 'NUMERO';
                SFields[1] := 'ITEM';

                __SuperClass.DBFunctions.ApplyFieldsInDataSet(frmOrdens_Producao, frmOrdens_Producao.cdsOrdens_Producao, frmOrdens_Producao.dtsOrdens_Producao, cdsNotas_Entradas_Itens, AFields, SFields);
              finally
                FreeAndNil(frmOrdens_Producao);
              end;
          end;
end;

procedure TfrmNotas_Entradas.dbgridItensExit(Sender: TObject);
begin
  inherited;
  // verifica se o dataset de itens está em modo de edição
  with cdsNotas_Entradas_Itens do
    if ((State in [dsInsert, dsEdit])) then
      Post;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_DadosBeforeApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  inherited;
  if (VarType(GenericInf) <> varNull) and (VarType(GenericInf) <> varEmpty) then
    OwnerData := GenericInf
  else
    OwnerData := VarArrayOf([Null, cdsNotas_Entradas_DadosESPECIEDOCUMENTO.AsString, cdsNotas_Entradas_DadosEMISSAO.AsDateTime,
                             cdsNotas_Entradas_DadosDIGITACAO.AsDateTime]);
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_DadosBeforeDelete(DataSet: TDataSet);
var
  PodeExcluir: Boolean;
  SQL: String;
  Aborta: Boolean;
  Ret: TNFeStatusCancelamento;
begin
  inherited;
  Aborta := False;
  if (MessageBox(Application.Handle, 'Deseja excluir o registro?', 'Pergunta', MB_YESNO + MB_ICONQUESTION) <> IDYES) then
    Aborta := True
  else
  begin
    PodeExcluir := not __SuperClass.GenericsF.TemBaixasPagar(cdsNotas_Entradas_Dados.FieldByName('PREFIXO').AsString,
      cdsNotas_Entradas_Dados.FieldByName('NUMERO').AsInteger, 'NF', cdsNotas_Entradas_Dados.FieldByName('FORNECEDOR').AsInteger);
    if (not PodeExcluir) then
    begin
      __SuperClass.GenericsF.DisplayMessage
        ('A nota fiscal em questão não pode ser excluída enquanto houver ao menos 1 título a pagar baixado.', '',
        'Estorne a(s) baixa(s) do(s) título(s) a pagar. ', 'Informação', MB_ICONEXCLAMATION);
      Aborta := True;
    end else begin
      // excluíndo os itens do pedido de compras
      if (cdsNotas_Entradas_DadosIDNFE.AsString <> '') and (cdsNotas_Entradas_DadosPAUTORIZACAONFE.AsString <> '') then
      begin
        // Tenta cancelar a NF-e
        Ret := CancelaNFe;
        if (Ret = scHomologado) then
          Aborta := False
        else
          if (Ret = scJaCancelada) then
            Aborta := MessageBox(Application.Handle, 'A NF-e já está cancelada. Deseja excluir o documento mesmo assim?',
              'Pergunta', MB_YESNO + MB_ICONQUESTION) <> IDYES
          else
            Aborta := True;
      end;
    end;
    //
    if not Aborta then
    begin
      GenericInf := VarArrayOf([Null, cdsNotas_Entradas_DadosESPECIEDOCUMENTO.AsString, cdsNotas_Entradas_DadosEMISSAO.AsDateTime,
        cdsNotas_Entradas_DadosDIGITACAO.AsDateTime]);
      // excluíndo os itens da Notas Fiscal
      __SuperClass.DBFunctions.DeleteDetailItems(cdsNotas_Entradas_Itens);
      __SuperClass.DBFunctions.DeleteDetailItems(cdsNotas_Entradas_CCe);
    end;
  end;
  if (Aborta) then
    Abort;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_DadosBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (not __SuperClass.DBFunctions.CheckRequiredFields(DataSet)) then
    Abort
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_DadosCalcFields(DataSet: TDataSet);
var
  Empresa: String;
  Filial: String;
  Campos: OleVariant;
  Filtro: String;
begin
  inherited;
  (* try
    if ( EnabledForeign ) then
    begin

    // Atribuindo dados do Forncedor - Pasta no rodapé
    sysGetEntityOwner('FORNECEDORES', Empresa, Filial);
    Campos := VarArrayOf(['REDUZIDO']);
    Filtro := Format ('EMPRESA = %s AND FILIAL = %s AND CODIGO = %d', [QuotedStr(Empresa), QuotedStr(Filial), cdsNotas_Entradas_DadosFORNECEDOR.AsInteger]);
    Campos := dmEstrutura.AppConnectionBroker.AppServer.sysGetFieldValues('FORNECEDORES', Filtro, Campos);
    if ( (VarType(Campos) <> varNull) and (VarType(Campos) <> varEmpty) ) then
    cdsNotas_Entradas_DadosNOMEFORNECEDOR.AsString    := Campos[0];

    sysGetEntityOwner('CONDICOES_PAGAMENTOS', Empresa, Filial);
    Campos := VarArrayOf(['DESCRICAO']);
    Filtro := Format ('EMPRESA = %s AND FILIAL = %s AND CODIGO = %d', [QuotedStr(Empresa), QuotedStr(Filial), cdsNotas_Entradas_DadosCONDICAOPAGAMENTO.AsInteger]);
    Campos := dmEstrutura.AppConnectionBroker.AppServer.sysGetFieldValues('CONDICOES_PAGAMENTOS', Filtro, Campos);
    if ( (VarType(Campos) <> varNull) and (VarType(Campos) <> varEmpty) ) then
    cdsNotas_Entradas_DadosDESCRICAOCONDICAO.AsString := Campos[0];
    //   Atribuindo dados do Transportadora
    sysGetEntityOwner('TRANSPORTADORAS', Empresa, Filial);
    Campos := VarArrayOf(['REDUZIDO']);
    Filtro := Format ('EMPRESA = %s AND FILIAL = %s AND CODIGO = %d', [QuotedStr(Empresa), QuotedStr(Filial), cdsNotas_Entradas_DadosTRANSPORTADORA.AsInteger]);
    Campos := dmEstrutura.AppConnectionBroker.AppServer.sysGetFieldValues('TRANSPORTADORAS', Filtro, Campos);
    if ( (VarType(Campos) <> varNull) and (VarType(Campos) <> varEmpty) ) then
    cdsNotas_Entradas_DadosNOMETRANSPORTADORA.AsString := Campos[0];
    // Atribuindo dados da Moeda
    sysGetEntityOwner('CATEGORIAS', Empresa, Filial);
    Campos := VarArrayOf(['DESCRICAO']);
    Filtro := Format ('EMPRESA = %s AND FILIAL = %s AND CODIGO = %s', [QuotedStr(Empresa), QuotedStr(Filial), QuotedStr(cdsNotas_Entradas_DadosCATEGORIA.AsString)]);
    Campos := dmEstrutura.AppConnectionBroker.AppServer.sysGetFieldValues('CATEGORIAS', Filtro, Campos);
    if ( (VarType(Campos) <> varNull) and (VarType(Campos) <> varEmpty) ) then
    cdsNotas_Entradas_DadosDESCRICAOCATEGORIA.AsString := Campos[0];

    end;
    except
    on E:Exception do
    DisplayMessage('Falha ao atribuir dados estrangeiros.', Format('%s.', [E.Message]), 'Tente novamente.', 'Informação', MB_ICONEXCLAMATION);
    end; *)
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_DadosCATEGORIAValidate(Sender: TField);
const
  Entidade = 'CATEGORIAS';
var
  Empresa: String;
  Filial: String;
  Campos: String;
  Filtro: String;
  Continua: Boolean;
  Auxiliar: TDataSet;
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      Continua := False;
      if ((Sender.AsString <> '')) then
      begin
        try
          __SuperClass.DBFunctions.GetEntityOwner(Entidade, Empresa, Filial);
          Campos := 'DESCRICAO';
          Filtro := Format('EMPRESA = %s AND FILIAL = %s AND CODIGO = %s', [QuotedStr(Empresa), QuotedStr(Filial),
            QuotedStr(cdsNotas_Entradas_DadosCATEGORIA.AsString)]);
          Continua := __SuperClass.GenericsF.RegistroHabilitado(Entidade, Filtro, '');
          if (Continua) then
          begin
            try
              Auxiliar := __SuperClass.DBFunctions.ExecuteQueryByXML(Campos, Entidade, Filtro);
              if Auxiliar.Eof then
                Continua := False
              else
                cdsNotas_Entradas_DadosDESCRICAOCATEGORIA.AsString := Auxiliar.FieldByName('DESCRICAO').AsString;
            finally
              if Assigned(Auxiliar) then
                Auxiliar.Close;
              FreeAndNil(Auxiliar);
            end;
          end;
        except
          on E: Exception do
            __SuperClass.GenericsF.DisplayMessage('Falha ao atribuir a categoria financeira.', Format('%s.', [E.Message]),
              'Verifique o valor informado.', 'Informação', MB_ICONEXCLAMATION);
        end;
        if (not Continua) then
          Abort;
      end;
    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_DadosCONDICAOPAGAMENTOValidate(Sender: TField);
const
  Entidade = 'CONDICOES_PAGAMENTOS';
var
  Empresa: String;
  Filial: String;
  Campos: String;
  Filtro: String;
  Continua: Boolean;
  Auxiliar: TDataSet;
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      Continua := False;
      if ((Sender.AsInteger <> 0)) then
      begin
        try
          __SuperClass.DBFunctions.GetEntityOwner(Entidade, Empresa, Filial);
          Campos := 'DESCRICAO';
          Filtro := Format('EMPRESA = %s AND FILIAL = %s AND CODIGO = %d', [QuotedStr(Empresa), QuotedStr(Filial),
            Sender.AsInteger]);
          Continua := __SuperClass.GenericsF.RegistroHabilitado(Entidade, Filtro, '');
          if (Continua) then
          begin
            try
              Auxiliar := __SuperClass.DBFunctions.ExecuteQueryByXML(Campos, Entidade, Filtro);
              if Auxiliar.Eof then
                Continua := False
              else
                cdsNotas_Entradas_DadosDESCRICAOCONDICAO.AsString := Auxiliar.FieldByName('DESCRICAO').AsString;
            finally
              if Assigned(Auxiliar) then
                Auxiliar.Close;
              FreeAndNil(Auxiliar);
            end;
          end;
        except
          on E: Exception do
            __SuperClass.GenericsF.DisplayMessage('Falha ao atribuir a condição de pagamento.', Format('%s.', [E.Message]),
              'Verifique o valor informado.', 'Informação', MB_ICONEXCLAMATION);
        end;
        if (not Continua) then
          Abort;
      end;
    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_DadosDeleteError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  __SuperClass.GenericsF.ShowException(E);
  Action := daAbort;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_DadosEditError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  __SuperClass.GenericsF.ShowException(E);
  Action := daAbort;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_DadosEMISSAOValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not __SuperClass.GenericsF.AceitaMovimentoEstoque(Sender.AsDateTime) then
      Abort;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_DadosPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  __SuperClass.GenericsF.ShowException(E);
  Action := daAbort;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_DadosReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensAfterDelete(DataSet: TDataSet);
begin
  inherited;
  AtualizaTotais;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensAfterPost(DataSet: TDataSet);
begin
  inherited;
  AtualizaTotais;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  DetailItems := __SuperClass.DBFunctions.GetNextNumber(DataSet, 'ITEM');

  dbgridItens.SelectedIndex := __SuperClass.DBFunctions.GetFirstAvaiableGridColumn(dbgridItens);

  if ((cdsNotas_Entradas_DadosFORMULARIOPROPRIO.AsString = VB_SIM)) then
  begin
    if ((DetailItems > __SuperClass.DBFunctions.GetParamValue('SV_ITENS_NOTA_FISCAL'))) then
    begin
      __SuperClass.GenericsF.DisplayMessage('Excedeu a quantidade de itens permitidos na nota fiscal.', '',
        'Crie outro documento fiscal com o restante dos itens.', 'Informação', MB_ICONEXCLAMATION);
      Abort;
    end;
  end;

end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensBeforePost(DataSet: TDataSet);
var
  Grava: Boolean;
begin
  inherited;
  if not(Rateando) then
  begin
    Grava := (__SuperClass.DBFunctions.CheckRequiredFields(DataSet));
    if ((Grava) and not(ItensIguais)) then
      Grava := not __SuperClass.DBFunctions.TemItensIguais(DataSet as TClientDataSet);
    if (not Grava) then
      Abort;
  end;

end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensCOFINSAValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      InicializaItem := False;
      AtualizaValoresItem;
    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensCOFINSRValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      InicializaItem := False;
      AtualizaValoresItem;
    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensCSLLRValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      InicializaItem := False;
      AtualizaValoresItem;
    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensCUSTOTOTALGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  inherited;
  if __SuperClass.User.HasRuleAccess(urEscondePrecoCusto) then
    Text := __SuperClass.GenericsF.HideFieldValue(Sender, 2, True)
  else
    Text := __SuperClass.GenericsF.FormatFloatValue(Sender, 2, True);
end;

procedure TfrmNotas_Entradas.ShowFields;
begin
  inherited;
  with dbcboFormularioProprio do
    ItemIndex := Items.IndexOfName(cdsNotas_Entradas_DadosFORMULARIOPROPRIO.AsString);
  with dbcboEspecieDocumento do
    ItemIndex := Items.IndexOfName(cdsNotas_Entradas_DadosESPECIEDOCUMENTO.AsString);
  with dbcboTipoPreco do
    ItemIndex := Items.IndexOfName(cdsNotas_Entradas_DadosTIPOPRECO.AsString);
  with dbcboTipoFrete do
    ItemIndex := Items.IndexOfName(cdsNotas_Entradas_DadosTIPOFRETE.AsString);
  with dbcboFormaPagamento do
    ItemIndex := Items.IndexOfName(cdsNotas_Entradas_DadosFORMAPAGAMENTO.AsString);
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensPRODUTOValidate(Sender: TField);
const
  Entidade = 'PRODUTOS';
var
  Empresa: String;
  Filial: String;
  Campos: TUStringArray;
  Filtro: String;
  TipoPreco: String;
  Local: String;
  Continua: Boolean;
  LocalOrigem: ShortString;
  QuantidadeOrigem: Double;
  UnitarioOrigem: Double;
  UnitarioOriginalOrigem: Double;
  PrefixoOrigem: ShortString;
  DocumentoOrigem: Integer;
  ItemOrigem: Integer;
  SaldoDevolver: Double;
  BaseComissao: Currency;
  ValorComissao: Currency;
  RegraDevolucao: Integer;
  DadosRegraFiscal: TDadosRegraFiscal;
  Auxiliar: TDataSet;
  Cliente: Integer;
  NomeCliente: String;
  CNPJCliente: String;
  Erro: Boolean;
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      try
        TipoPreco := IntToStr(cdsNotas_Entradas_DadosTIPOPRECO.AsInteger);
        __SuperClass.DBFunctions.GetEntityOwner(Entidade, Empresa, Filial);
        Campos := __SuperClass.GenericsF.VarArrayOfStr(['DESCRICAO', 'PRIMEIRAUNIDADE', 'LOCALPADRAO', 'PRECOCUSTO' + TipoPreco,
          'REGRAENTRADA', 'CLASSIFICACAOFISCAL', 'IPI', 'ORIGEMST', 'ICMS', 'MARGEMLUCRO', 'TRIBUTOS', 'ISS', 'II',
          'ORIGEMPRODUTO', 'NCM', 'CEST']);
        Filtro := Format('EMPRESA = %s AND FILIAL = %s AND CODIGO = %s', [QuotedStr(Empresa), QuotedStr(Filial),
          QuotedStr(Sender.AsString)]);
        Continua := __SuperClass.GenericsF.RegistroHabilitado(Entidade, Filtro, '');
        if (Continua) then
        begin
          try
            Auxiliar := __SuperClass.DBFunctions.ExecuteQueryByXML(Campos, Entidade, Filtro);
            if Assigned(Auxiliar) then
            begin
              if ((Auxiliar.Eof) and (Auxiliar.Bof)) then
                raise Exception.Create('Produto não encontrado.')
              else
              begin
                InicializaItem := True;
                cdsNotas_Entradas_ItensIPI.OnValidate := Nil;
                cdsNotas_Entradas_ItensICMS.OnValidate := Nil;
                cdsNotas_Entradas_ItensISS.OnValidate := Nil;
                cdsNotas_Entradas_ItensMARGEMLUCRO.OnValidate := Nil;
                cdsNotas_Entradas_ItensTRIBUTOS.OnValidate := Nil;
                cdsNotas_Entradas_ItensII.OnValidate := Nil;
                cdsNotas_Entradas_ItensTOTAL.OnValidate := Nil;
                cdsNotas_Entradas_ItensTOTALMOEDA.OnValidate := Nil;
                cdsNotas_Entradas_ItensVALORDESPESAS.OnValidate := Nil;
                cdsNotas_Entradas_ItensVALORFRETE.OnValidate := Nil;
                cdsNotas_Entradas_ItensVALORSEGURO.OnValidate := Nil;
                cdsNotas_Entradas_ItensREGRA.OnValidate := Nil;

                cdsNotas_Entradas_ItensDESCRICAO.AsString := Auxiliar.FieldByName('DESCRICAO').AsString;
                cdsNotas_Entradas_ItensPRIMEIRAUNIDADE.AsString := Auxiliar.FieldByName('PRIMEIRAUNIDADE').AsString;
                cdsNotas_Entradas_ItensLOCAL.AsString := Auxiliar.FieldByName('LOCALPADRAO').AsString;
                cdsNotas_Entradas_ItensUNITARIO.AsFloat := Auxiliar.FieldByName('PRECOCUSTO' + TipoPreco).AsFloat;
                cdsNotas_Entradas_ItensPRECOLISTA.AsFloat := Auxiliar.FieldByName('PRECOCUSTO' + TipoPreco).AsFloat;
                cdsNotas_Entradas_ItensREGRA.AsInteger := Auxiliar.FieldByName('REGRAENTRADA').AsInteger;
                cdsNotas_Entradas_ItensCLASSIFICACAOFISCAL.AsString := Auxiliar.FieldByName('CLASSIFICACAOFISCAL').AsString;
                cdsNotas_Entradas_ItensNCM.AsString := Auxiliar.FieldByName('NCM').AsString;
                cdsNotas_Entradas_ItensCEST.AsString := Auxiliar.FieldByName('CEST').AsString;
                cdsNotas_Entradas_ItensIPI.AsFloat := Auxiliar.FieldByName('IPI').AsFloat;
                cdsNotas_Entradas_ItensORIGEMST.AsString := Auxiliar.FieldByName('ORIGEMST').AsString;
                cdsNotas_Entradas_ItensICMS.AsFloat := Auxiliar.FieldByName('ICMS').AsFloat;
                cdsNotas_Entradas_ItensMARGEMLUCRO.AsFloat := Auxiliar.FieldByName('MARGEMLUCRO').AsFloat;
                cdsNotas_Entradas_ItensTRIBUTOS.AsFloat := Auxiliar.FieldByName('TRIBUTOS').AsFloat;
                cdsNotas_Entradas_ItensISS.AsFloat := Auxiliar.FieldByName('ISS').AsFloat;
                cdsNotas_Entradas_ItensII.AsFloat := Auxiliar.FieldByName('II').AsFloat;
                cdsNotas_Entradas_ItensORIGEMPRODUTO.AsString := Auxiliar.FieldByName('ORIGEMPRODUTO').AsString;
              end;
            end;
          finally
            if Assigned(Auxiliar) then
              Auxiliar.Close;
            FreeAndNil(Auxiliar);
          end;
          if ((cdsNotas_Entradas_DadosESPECIEDOCUMENTO.AsString = 'DEV') or
            (cdsNotas_Entradas_DadosESPECIEDOCUMENTO.AsString = 'NFD') or
            (cdsNotas_Entradas_DadosESPECIEDOCUMENTO.AsString = 'DET')) then
          begin
            RegraDevolucao := __SuperClass.DBFunctions.GetParamValue('SV_REGRA_FISCAL_DEVOLUCAO');
            if (RegraDevolucao <> 0) then
              cdsNotas_Entradas_ItensREGRA.AsInteger := RegraDevolucao;
          end;

          cdsNotas_Entradas_ItensIPI.OnValidate := cdsNotas_Entradas_ItensIPIValidate;
          cdsNotas_Entradas_ItensICMS.OnValidate := cdsNotas_Entradas_ItensICMSValidate;
          cdsNotas_Entradas_ItensISS.OnValidate := cdsNotas_Entradas_ItensISSValidate;
          cdsNotas_Entradas_ItensMARGEMLUCRO.OnValidate := cdsNotas_Entradas_ItensMARGEMLUCROValidate;
          cdsNotas_Entradas_ItensTRIBUTOS.OnValidate := cdsNotas_Entradas_ItensTRIBUTOSValidate;
          cdsNotas_Entradas_ItensII.OnValidate := cdsNotas_Entradas_ItensIIValidate;
          cdsNotas_Entradas_ItensTOTAL.OnValidate := cdsNotas_Entradas_ItensTOTALValidate;
          cdsNotas_Entradas_ItensTOTALMOEDA.OnValidate := cdsNotas_Entradas_ItensTOTALMOEDAValidate;
          cdsNotas_Entradas_ItensVALORDESPESAS.OnValidate := cdsNotas_Entradas_ItensVALORDESPESASValidate;
          cdsNotas_Entradas_ItensVALORFRETE.OnValidate := cdsNotas_Entradas_ItensVALORFRETEValidate;
          cdsNotas_Entradas_ItensVALORSEGURO.OnValidate := cdsNotas_Entradas_ItensVALORSEGUROValidate;
          cdsNotas_Entradas_ItensREGRA.OnValidate := cdsNotas_Entradas_ItensREGRAValidate;

          if (cdsNotas_Entradas_DadosTABELA.AsInteger <> 0) then
          begin
            __SuperClass.DBFunctions.GetEntityOwner('FORNECEDORES_TABELAS_ITENS', Empresa, Filial);
            Campos := VarArrayOf(['VIGENCIA', 'PRECOCOMPRA' + TipoPreco]);
            Filtro := Format('EMPRESA = %s AND FILIAL = %s AND CODIGO = %s AND PRODUTO = %s',
              [QuotedStr(Empresa), QuotedStr(Filial), cdsNotas_Entradas_DadosTABELA.AsString, QuotedStr(Sender.AsString)]);
            try
              Auxiliar := __SuperClass.DBFunctions.ExecuteQueryByXML(Campos, 'FORNECEDORES_TABELAS_ITENS', Filtro);
              if Assigned(Auxiliar) then
              begin
                if Auxiliar.Eof then
                  __SuperClass.GenericsF.DisplayMessage('Valores não encontrados na tabela de preço.', '',
                    'Verifique a tabela de preço informada.', 'Informação', MB_ICONEXCLAMATION)
                else
                begin
                  if (Auxiliar.FieldByName('VIGENCIA').AsDateTime < __SuperClass.User.DataBase) then
                    __SuperClass.GenericsF.DisplayMessage('Item fora da vigência estipulada na tabela de preço.', '',
                      'Verifique a vigência do item na tabela de preço informada.', 'Informação', MB_ICONEXCLAMATION)
                  else
                  begin
                    cdsNotas_Entradas_ItensUNITARIO.AsFloat := Auxiliar.FieldByName('PRECOCOMPRA' + TipoPreco).AsFloat;
                    cdsNotas_Entradas_ItensPRECOLISTA.AsFloat := Auxiliar.FieldByName('PRECOCOMPRA' + TipoPreco).AsFloat;
                  end;
                end;
              end;
            finally
              if Assigned(Auxiliar) then
                Auxiliar.Close;
              FreeAndNil(Auxiliar);
            end;
          end;

          if not Copying then
          begin
            if MostraSaldosEstoque then
            begin
              Local := __SuperClass.GenericsF.MostraSaldosEstoque(cdsNotas_Entradas_ItensPRODUTO.AsString,
                cdsNotas_Entradas_ItensDESCRICAO.AsString);
              if ((Local <> '') and (cdsNotas_Entradas_ItensLOCAL.AsString <> Local)) then
                cdsNotas_Entradas_ItensLOCAL.AsString := Local;
            end;
          end;

          DadosRegraFiscal := __SuperClass.GenericsF.ObtemDadosRegraFiscalAut(nfeEntrada, cdsNotas_Entradas_DadosUF.AsString,
            Sender.AsString, cdsNotas_Entradas_ItensCLASSIFICACAOFISCAL.AsString, cdsNotas_Entradas_ItensLOCAL.AsString,
            cdsNotas_Entradas_ItensFORNECEDOR.AsInteger);
          with DadosRegraFiscal do
          begin
            if (RegraFiscal <> 0) then
            begin
              cdsNotas_Entradas_ItensREGRA.OnValidate := Nil;
              cdsNotas_Entradas_ItensREGRA.AsFloat := RegraFiscal;
              cdsNotas_Entradas_ItensREGRA.OnValidate := cdsNotas_Entradas_ItensREGRAValidate;
            end;

            if (MargemLucro <> 0) then
            begin
              cdsNotas_Entradas_ItensMARGEMLUCRO.OnValidate := Nil;
              cdsNotas_Entradas_ItensMARGEMLUCRO.AsFloat := MargemLucro;
              cdsNotas_Entradas_ItensMARGEMLUCRO.OnValidate := cdsNotas_Entradas_ItensMARGEMLUCROValidate;
            end;
          end;

          if ((cdsNotas_Entradas_DadosESPECIEDOCUMENTO.AsString = 'DEV') or
            (cdsNotas_Entradas_DadosESPECIEDOCUMENTO.AsString = 'NFD') or
            (cdsNotas_Entradas_DadosESPECIEDOCUMENTO.AsString = 'DET')) then
          begin
            if ((cdsNotas_Entradas_DadosESPECIEDOCUMENTO.AsString = 'DEV') or
              (cdsNotas_Entradas_DadosESPECIEDOCUMENTO.AsString = 'NFD')) then
            begin
              __SuperClass.GenericsF.RetornaCliente(cdsNotas_Entradas_DadosFORNECEDOR.AsInteger, Cliente, NomeCliente,
                CNPJCliente, Erro);
              if MostraNotasSaidas(Cliente, NomeCliente, __SuperClass.User.DataBase - (365 * 2), __SuperClass.User.DataBase,
                Sender.AsString, cdsNotas_Entradas_ItensDESCRICAO.AsString, LocalOrigem, SaldoDevolver, UnitarioOrigem,
                UnitarioOriginalOrigem, PrefixoOrigem, DocumentoOrigem, ItemOrigem, BaseComissao, ValorComissao) then
              begin
                cdsNotas_Entradas_ItensLOCAL.AsString := LocalOrigem;
                cdsNotas_Entradas_ItensUNITARIO.AsFloat := UnitarioOrigem;
                cdsNotas_Entradas_ItensUNITARIOORIGINAL.AsFloat := UnitarioOriginalOrigem;
                cdsNotas_Entradas_ItensPREFIXOORIGEM.AsString := PrefixoOrigem;
                cdsNotas_Entradas_ItensDOCUMENTOORIGEM.AsInteger := DocumentoOrigem;
                cdsNotas_Entradas_ItensITEMORIGEM.AsInteger := ItemOrigem;
                cdsNotas_Entradas_ItensQUANTIDADE.AsFloat := SaldoDevolver;
                cdsNotas_Entradas_ItensBASECOMISSAO.AsCurrency := BaseComissao;
                cdsNotas_Entradas_ItensVALORCOMISSAO.AsCurrency := ValorComissao;
              end;
            end else begin
              __SuperClass.GenericsF.RetornaCliente(cdsNotas_Entradas_DadosFORNECEDOR.AsInteger, Cliente, NomeCliente,
                CNPJCliente, Erro);
              if MostraNotasTerceiros(Cliente, NomeCliente, __SuperClass.User.DataBase - (365 * 2), __SuperClass.User.DataBase,
                Sender.AsString, cdsNotas_Entradas_ItensDESCRICAO.AsString, LocalOrigem, QuantidadeOrigem, UnitarioOrigem,
                PrefixoOrigem, DocumentoOrigem, ItemOrigem) then
              begin
                cdsNotas_Entradas_ItensLOCAL.AsString := LocalOrigem;
                cdsNotas_Entradas_ItensQUANTIDADE.AsFloat := QuantidadeOrigem;
                cdsNotas_Entradas_ItensUNITARIO.AsFloat := UnitarioOrigem;
                cdsNotas_Entradas_ItensPREFIXOORIGEM.AsString := PrefixoOrigem;
                cdsNotas_Entradas_ItensDOCUMENTOORIGEM.AsInteger := DocumentoOrigem;
                cdsNotas_Entradas_ItensITEMORIGEM.AsInteger := ItemOrigem;
              end;
            end;
          end;
          AtualizaValoresItem;
        end;
        if (not Continua) then
          Abort;
      except
        on E: Exception do
        begin
          if (Pos('Operation aborted', E.Message) = 0) then
            __SuperClass.GenericsF.DisplayMessage('Falha ao pesquisar o produto.', E.Message, 'Verifique o valor informado.',
              'Informação', MB_ICONEXCLAMATION);
          Abort;
        end;
      end;
    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensQUANTIDADEGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  inherited;
  with __SuperClass do
    Text := GenericsF.FormatFloatValue(Sender, DecimaisQuantidade, False);
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensQUANTIDADEValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      cdsNotas_Entradas_ItensTOTAL.AsCurrency :=
        RoundTo(cdsNotas_Entradas_ItensQUANTIDADE.AsFloat * cdsNotas_Entradas_ItensUNITARIO.AsFloat, -2);

      cdsNotas_Entradas_ItensTOTALMOEDA.AsCurrency :=
        RoundTo(cdsNotas_Entradas_ItensQUANTIDADE.AsFloat * cdsNotas_Entradas_ItensUNITARIOMOEDA.AsFloat, -2);

      cdsNotas_Entradas_ItensUNITARIOALTERNATIVO.AsFloat := cdsNotas_Entradas_ItensUNITARIOORIGINAL.AsFloat -
        cdsNotas_Entradas_ItensUNITARIO.AsFloat;

      cdsNotas_Entradas_ItensVALORALTERNATIVO.AsCurrency := cdsNotas_Entradas_ItensUNITARIOALTERNATIVO.AsFloat *
        cdsNotas_Entradas_ItensQUANTIDADE.AsFloat;

      // Atribui somente se não for devolução, pois é verificado o saldo a devolver na carteira inversa
      if (cdsNotas_Entradas_DadosESPECIEDOCUMENTO.AsString <> 'DEV') and
        (cdsNotas_Entradas_DadosESPECIEDOCUMENTO.AsString <> 'NFD') then
        cdsNotas_Entradas_ItensSALDODEVOLVER.AsFloat := cdsNotas_Entradas_ItensQUANTIDADE.AsFloat;

    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensUNITARIOValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      cdsNotas_Entradas_ItensTOTAL.AsCurrency :=
        RoundTo(cdsNotas_Entradas_ItensQUANTIDADE.AsFloat * cdsNotas_Entradas_ItensUNITARIO.AsFloat, -2);

      cdsNotas_Entradas_ItensTOTALMOEDA.AsCurrency :=
        RoundTo(cdsNotas_Entradas_ItensQUANTIDADE.AsFloat * cdsNotas_Entradas_ItensUNITARIOMOEDA.AsFloat, -2);

      cdsNotas_Entradas_ItensUNITARIOALTERNATIVO.AsFloat := cdsNotas_Entradas_ItensUNITARIOORIGINAL.AsFloat -
        cdsNotas_Entradas_ItensUNITARIO.AsFloat;

      cdsNotas_Entradas_ItensVALORALTERNATIVO.AsCurrency := cdsNotas_Entradas_ItensUNITARIOALTERNATIVO.AsFloat *
        cdsNotas_Entradas_ItensQUANTIDADE.AsFloat;

    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensTOTALValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
      AtualizaValoresItem;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensTRIBUTOSValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copying then
    begin
      InicializaItem := False;
      AtualizaValoresItem;
    end;
  end;
end;

procedure TfrmNotas_Entradas.AtualizaTotais;
var
  Mark: TBookMark;
  Valores: TValores;
begin
  // indicando atualização internal das variaveis - Evitar OverFlow
  Mark := Nil;
  if ((cdsNotas_Entradas_Dados.State in [dsInsert, dsEdit])) then
    try
      __SuperClass.GenericsF.InicializaValores(Valores);
      // processando os itens
      with cdsNotas_Entradas_Itens do
      begin
        try
          DisableControls;
          Mark := GetBookmark;
          First;
          cdsNotas_Entradas_Itens.AfterPost := Nil;
          while (not Eof) do
          begin
            with Valores do
            begin
              BaseItem := RoundTo(cdsNotas_Entradas_ItensQUANTIDADE.AsFloat * cdsNotas_Entradas_ItensUNITARIO.AsFloat, -2);
              ValorMercadorias := ValorMercadorias + BaseItem;
              ValorDespesas := ValorDespesas + cdsNotas_Entradas_ItensVALORDESPESAS.AsCurrency;
              ValorFrete := ValorFrete + cdsNotas_Entradas_ItensVALORFRETE.AsCurrency;
              ValorSeguro := ValorSeguro + cdsNotas_Entradas_ItensVALORSEGURO.AsCurrency;
              ValorDesconto := ValorDesconto + cdsNotas_Entradas_ItensVALORDESCONTO.AsCurrency;
              Comissao := 0;
              BaseComissao := 0;
              ValorComissao := 0;
              ValorFinanceiro := ValorFinanceiro + cdsNotas_Entradas_ItensVALORFINANCEIRO.AsCurrency;
              ValorBruto := ValorBruto + cdsNotas_Entradas_ItensVALORBRUTO.AsCurrency;
              ValorLiquido := ValorLiquido + cdsNotas_Entradas_ItensVALORLIQUIDO.AsCurrency;
              IPI.Base := IPI.Base + cdsNotas_Entradas_ItensBASEIPI.AsCurrency;
              IPI.Valor := IPI.Valor + cdsNotas_Entradas_ItensVALORIPI.AsCurrency;
              ICMS.Base := ICMS.Base + cdsNotas_Entradas_ItensBASEICMS.AsCurrency;
              ICMS.Valor := ICMS.Valor + cdsNotas_Entradas_ItensVALORICMS.AsCurrency;

              ICMSDiferido.Base := ICMSDiferido.Base + cdsNotas_Entradas_ItensBASEICMSDIF.AsCurrency;
              ICMSDiferido.Valor := ICMSDiferido.Valor + cdsNotas_Entradas_ItensVALORICMSDIF.AsCurrency;

              ICMSFCP.Base := ICMSFCP.Base + cdsNotas_Entradas_ItensBASEICMSFCP.AsCurrency;
              ICMSFCP.Valor := ICMSFCP.Valor + cdsNotas_Entradas_ItensVALORICMSFCP.AsCurrency;

              ICMSPUFD.Base := ICMSPUFD.Base + cdsNotas_Entradas_ItensBASEICMSPUFD.AsCurrency;
              ICMSPUFD.Valor := ICMSPUFD.Valor + cdsNotas_Entradas_ItensVALORICMSPUFD.AsCurrency;

              ICMSPUFO.Base := ICMSPUFO.Base + cdsNotas_Entradas_ItensBASEICMSPUFO.AsCurrency;
              ICMSPUFO.Valor := ICMSPUFO.Valor + cdsNotas_Entradas_ItensVALORICMSPUFO.AsCurrency;

              ICMSST.Base := ICMSST.Base + cdsNotas_Entradas_ItensBASEICMSST.AsCurrency;
              ICMSST.Valor := ICMSST.Valor + cdsNotas_Entradas_ItensVALORICMSST.AsCurrency;

              ISSApuracao.Base := ISSApuracao.Base + cdsNotas_Entradas_ItensBASEISSA.AsCurrency;
              ISSApuracao.Valor := ISSApuracao.Valor + cdsNotas_Entradas_ItensVALORISSA.AsCurrency;

              ISSRetencao.Base := ISSRetencao.Base + cdsNotas_Entradas_ItensBASEISSR.AsCurrency;
              ISSRetencao.Valor := ISSRetencao.Valor + cdsNotas_Entradas_ItensVALORISSR.AsCurrency;

              PISApuracao.Base := PISApuracao.Base + cdsNotas_Entradas_ItensBASEPISA.AsCurrency;
              PISApuracao.Valor := PISApuracao.Valor + cdsNotas_Entradas_ItensVALORPISA.AsCurrency;

              COFINSApuracao.Base := COFINSApuracao.Base + cdsNotas_Entradas_ItensBASECOFINSA.AsCurrency;
              COFINSApuracao.Valor := COFINSApuracao.Valor + cdsNotas_Entradas_ItensVALORCOFINSA.AsCurrency;

              // Retencao PCC
              PISRetencao.Base := PISRetencao.Base + cdsNotas_Entradas_ItensBASEPISR.AsCurrency;
              PISRetencao.Valor := PISRetencao.Valor + cdsNotas_Entradas_ItensVALORPISR.AsCurrency;
              COFINSRetencao.Base := COFINSRetencao.Base + cdsNotas_Entradas_ItensBASECOFINSR.AsCurrency;
              COFINSRetencao.Valor := COFINSRetencao.Valor + cdsNotas_Entradas_ItensVALORCOFINSR.AsCurrency;
              CSLLRetencao.Base := CSLLRetencao.Base + cdsNotas_Entradas_ItensBASECSLLR.AsCurrency;
              CSLLRetencao.Valor := CSLLRetencao.Valor + cdsNotas_Entradas_ItensVALORCSLLR.AsCurrency;

              INSSApuracao.Base := INSSApuracao.Base + cdsNotas_Entradas_ItensBASEINSSA.AsCurrency;
              INSSApuracao.Valor := INSSApuracao.Valor + cdsNotas_Entradas_ItensVALORINSSA.AsCurrency;

              INSSRetencao.Base := INSSRetencao.Base + cdsNotas_Entradas_ItensBASEINSSR.AsCurrency;
              INSSRetencao.Valor := INSSRetencao.Valor + cdsNotas_Entradas_ItensVALORINSSR.AsCurrency;

              IRRFApuracao.Base := IRRFApuracao.Base + cdsNotas_Entradas_ItensBASEIRRFA.AsCurrency;
              IRRFApuracao.Valor := IRRFApuracao.Valor + cdsNotas_Entradas_ItensVALORIRRFA.AsCurrency;

              IRRFRetencao.Base := IRRFRetencao.Base + cdsNotas_Entradas_ItensBASEIRRFR.AsCurrency;
              IRRFRetencao.Valor := IRRFRetencao.Valor + cdsNotas_Entradas_ItensVALORIRRFR.AsCurrency;

              FGTS.Base := FGTS.Base + cdsNotas_Entradas_ItensBASEFGTS.AsCurrency;
              FGTS.Valor := FGTS.Valor + cdsNotas_Entradas_ItensVALORFGTS.AsCurrency;

              II.Base := II.Base + cdsNotas_Entradas_ItensBASEII.AsCurrency;
              II.Valor := II.Valor + cdsNotas_Entradas_ItensVALORII.AsCurrency;

              Tributos.Base := Tributos.Base + cdsNotas_Entradas_ItensBASETRIBUTOS.AsCurrency;
              Tributos.Valor := Tributos.Valor + cdsNotas_Entradas_ItensVALORTRIBUTOS.AsCurrency;

              ValorMoeda := ValorMoeda + cdsNotas_Entradas_ItensTOTALMOEDA.AsCurrency;
              ValorAlternativo := ValorAlternativo + cdsNotas_Entradas_ItensVALORALTERNATIVO.AsCurrency;

              //
              BaseComissao := BaseComissao + cdsNotas_Entradas_ItensBASECOMISSAO.AsCurrency;
              ValorComissao := ValorComissao + cdsNotas_Entradas_ItensVALORCOMISSAO.AsCurrency;

            end;
            Next;
          end;
        finally
          GotoBookMark(Mark);
          FreeBookMark(Mark);
          EnableControls;
          cdsNotas_Entradas_Itens.AfterPost := cdsNotas_Entradas_ItensAfterPost;
        end;
      end;

      // Desabilitando temporariamente os eventos, evitando overflow
      cdsNotas_Entradas_Itens.AfterPost := Nil;
      cdsNotas_Entradas_DadosVALORDESPESAS.OnValidate := Nil;
      cdsNotas_Entradas_DadosVALORFRETE.OnValidate := Nil;
      cdsNotas_Entradas_DadosVALORSEGURO.OnValidate := Nil;
      cdsNotas_Entradas_DadosVALORDESCONTO.OnValidate := Nil;
      cdsNotas_Entradas_DadosDESCONTO.OnValidate := Nil;

      with Valores do
      begin
        // atribuindo os totais do pedido de compras
        cdsNotas_Entradas_DadosVALORMERCADORIAS.AsCurrency := ValorMercadorias;
        cdsNotas_Entradas_DadosVALORDESPESAS.AsCurrency := ValorDespesas;
        cdsNotas_Entradas_DadosVALORFRETE.AsCurrency := ValorFrete;
        cdsNotas_Entradas_DadosVALORSEGURO.AsCurrency := ValorSeguro;
        if (ValorMercadorias = 0) then
          cdsNotas_Entradas_DadosDESCONTO.AsFloat := 0
        else
          cdsNotas_Entradas_DadosDESCONTO.AsFloat := RoundTo(((ValorDesconto * 100) / ValorMercadorias), -2);
        cdsNotas_Entradas_DadosVALORDESCONTO.AsCurrency := ValorDesconto;
        cdsNotas_Entradas_DadosVALORFINANCEIRO.AsCurrency := ValorFinanceiro;
        cdsNotas_Entradas_DadosVALORBRUTO.AsCurrency := ValorBruto;
        cdsNotas_Entradas_DadosVALORLIQUIDO.AsCurrency := ValorLiquido;
        cdsNotas_Entradas_DadosBASEIPI.AsCurrency := IPI.Base;
        cdsNotas_Entradas_DadosVALORIPI.AsCurrency := IPI.Valor;
        cdsNotas_Entradas_DadosBASEICMS.AsCurrency := ICMS.Base;
        cdsNotas_Entradas_DadosVALORICMS.AsCurrency := ICMS.Valor;
        cdsNotas_Entradas_DadosBASEICMSDIF.AsCurrency := ICMSDiferido.Base;
        cdsNotas_Entradas_DadosVALORICMSDIF.AsCurrency := ICMSDiferido.Valor;

        cdsNotas_Entradas_DadosBASEICMSFCP.AsCurrency := ICMSFCP.Base;
        cdsNotas_Entradas_DadosVALORICMSFCP.AsCurrency := ICMSFCP.Valor;

        cdsNotas_Entradas_DadosBASEICMSPUFD.AsCurrency := ICMSPUFD.Base;
        cdsNotas_Entradas_DadosVALORICMSPUFD.AsCurrency := ICMSPUFD.Valor;

        cdsNotas_Entradas_DadosBASEICMSPUFO.AsCurrency := ICMSPUFO.Base;
        cdsNotas_Entradas_DadosVALORICMSPUFO.AsCurrency := ICMSPUFO.Valor;

        cdsNotas_Entradas_DadosBASEICMSST.AsCurrency := ICMSST.Base;
        cdsNotas_Entradas_DadosVALORICMSST.AsCurrency := ICMSST.Valor;

        cdsNotas_Entradas_DadosBASEISSA.AsCurrency := ISSApuracao.Base;
        cdsNotas_Entradas_DadosVALORISSA.AsCurrency := ISSApuracao.Valor;

        cdsNotas_Entradas_DadosBASEISSR.AsCurrency := ISSRetencao.Base;
        cdsNotas_Entradas_DadosVALORISSR.AsCurrency := ISSRetencao.Valor;

        cdsNotas_Entradas_DadosBASEPISA.AsCurrency := PISApuracao.Base;
        cdsNotas_Entradas_DadosVALORPISA.AsCurrency := PISApuracao.Valor;

        cdsNotas_Entradas_DadosBASECOFINSA.AsCurrency := COFINSApuracao.Base;
        cdsNotas_Entradas_DadosVALORCOFINSA.AsCurrency := COFINSApuracao.Valor;

        cdsNotas_Entradas_DadosBASEPISR.AsCurrency := PISRetencao.Base;
        cdsNotas_Entradas_DadosVALORPISR.AsCurrency := PISRetencao.Valor;
        cdsNotas_Entradas_DadosBASECOFINSR.AsCurrency := COFINSRetencao.Base;
        cdsNotas_Entradas_DadosVALORCOFINSR.AsCurrency := COFINSRetencao.Valor;
        cdsNotas_Entradas_DadosBASECSLLR.AsFloat := CSLLRetencao.Base;
        cdsNotas_Entradas_DadosVALORCSLLR.AsCurrency := CSLLRetencao.Valor;

        cdsNotas_Entradas_DadosBASEIRRFA.AsCurrency := IRRFApuracao.Base;
        cdsNotas_Entradas_DadosVALORIRRFA.AsCurrency := IRRFApuracao.Valor;

        cdsNotas_Entradas_DadosBASEIRRFR.AsCurrency := IRRFRetencao.Base;
        cdsNotas_Entradas_DadosVALORIRRFR.AsCurrency := IRRFRetencao.Valor;

        cdsNotas_Entradas_DadosBASEINSSA.AsCurrency := INSSApuracao.Base;
        cdsNotas_Entradas_DadosVALORINSSA.AsCurrency := INSSApuracao.Valor;

        cdsNotas_Entradas_DadosBASEINSSR.AsCurrency := INSSRetencao.Base;
        cdsNotas_Entradas_DadosVALORINSSR.AsCurrency := INSSRetencao.Valor;

        cdsNotas_Entradas_DadosBASEFGTS.AsCurrency := FGTS.Base;
        cdsNotas_Entradas_DadosVALORFGTS.AsCurrency := FGTS.Valor;
        cdsNotas_Entradas_DadosBASEII.AsCurrency := II.Base;
        cdsNotas_Entradas_DadosVALORII.AsCurrency := II.Valor;
        cdsNotas_Entradas_DadosBASETRIBUTOS.AsCurrency := Tributos.Base;
        cdsNotas_Entradas_DadosVALORTRIBUTOS.AsCurrency := Tributos.Valor;
        cdsNotas_Entradas_DadosVALORMOEDA.AsCurrency := ValorMoeda;
        cdsNotas_Entradas_DadosVALORALTERNATIVO.AsCurrency := ValorAlternativo;
        //
        cdsNotas_Entradas_DadosBASECOMISSAO.AsCurrency := BaseComissao;
        cdsNotas_Entradas_DadosVALORCOMISSAO.AsCurrency := ValorComissao;

      end;

      // Carrega os impostos
      CarregaImpostos;

      // Habilitando o evento AfterPost
      cdsNotas_Entradas_Itens.AfterPost := cdsNotas_Entradas_ItensAfterPost;
      // Habilitando os eventos OnValidate
      cdsNotas_Entradas_DadosVALORDESPESAS.OnValidate := cdsNotas_Entradas_DadosVALORDESPESASValidate;
      cdsNotas_Entradas_DadosVALORFRETE.OnValidate := cdsNotas_Entradas_DadosVALORFRETEValidate;
      cdsNotas_Entradas_DadosVALORSEGURO.OnValidate := cdsNotas_Entradas_DadosVALORSEGUROValidate;
      cdsNotas_Entradas_DadosDESCONTO.OnValidate := cdsNotas_Entradas_DadosDESCONTOValidate;
      cdsNotas_Entradas_DadosVALORDESCONTO.OnValidate := cdsNotas_Entradas_DadosVALORDESCONTOValidate;

    except
      on E: Exception do
        __SuperClass.GenericsF.DisplayMessage('Ocorreu uma falha no processamento do somatório da nota de entrada.', E.Message,
          'Tente novamente.', 'Informação', MB_ICONEXCLAMATION);
    end;
end;

procedure TfrmNotas_Entradas.AtualizaValoresItem;
var
  Tipo: String;
  CodigoFiscal: String;
  GeraFinanceiro: String;
  GeraEstoque: String;
  LiberaQuantidade: String;
  PreNota: String;
  VarCustoMedio: TCustoMedio;
  VarIPI: TIPI;
  VarICMS: TICMS;
  VarICMSST: TICMSST;
  VarISS: TISS;
  VarPISApuracao: TPISApuracao;
  VarCOFINSApuracao: TCOFINSApuracao;
  VarPISRetencao: TPISRetencao;
  VarCOFINSRetencao: TCOFINSRetencao;
  VarCSLLRetencao: TCSLLRetencao;
  VarINSS: TINSS;
  VarIRRF: TIRRF;
  VarFGTS: TFGTS;
  VarII: TII;
  VarTributos: TTributos;
  VarICMSDiferido: TICMSDiferido;
  VarICMSFCP: TICMSFCP;
  VarICMSPUFD: TICMSPUFD;
  VarICMSPUFO: TICMSPUFO;
  Valores: TValores;
  Auxiliar: array of TImposto;
  // Desvio de Fluxo acionado apos leitura das definicoes dos impostos na regra fiscal (permite troca de valores antes dos calculos)
  AposDefinicaoRegrasImpostosNFE: procedure(cdsDados, cdsItens: TClientDataSet; var VarIPI: TIPI; var VarICMS: TICMS;
    var VarICMSST: TICMSST; var VarISS: TISS; var VarPISApuracao: TPISApuracao; var VarCOFINSApuracao: TCOFINSApuracao;
    var VarPISRetencao: TPISRetencao; var VarCOFINSRetencao: TCOFINSRetencao; var VarCSLLRetencao: TCSLLRetencao;
    var VarINSS: TINSS; var VarIRRF: TIRRF; var VarFGTS: TFGTS; var VarII; var Tributos: TTributos;
    var VarICMSDiferido: TICMSDiferido; var VarICMSFCP: TICMSFCP; var VarICMSPUFD: TICMSPUFD; var VarICMSPUFO: TICMSPUFO);
  AposCalculoImpostosNFE: procedure(cdsDados, cdsItens: TClientDataSet; var IPI: TImposto; var ICMS: TImposto;
    var ICMSST: TImposto; var ISS: TImposto; var PISApuracao: TImposto; var COFINSApuracao: TImposto; var PISRetencao: TImposto;
    var COFINSRetencao: TImposto; var CSLLRetencao: TImposto; var INSS: TImposto; var IRRFApuracao: TImposto;
    var IRRFRetencao: TImposto; var FGTS: TImposto; var II: TImposto; var Tributos: TImposto; var ICMSDiferido: TImposto;
    var ICMSFCP: TImposto; var ICMSPUFD: TImposto; var ICMSPUFO: TImposto);
  //
  __Comissao: Single;
begin
  with DMMain do
  begin
    if (cdsNotas_Entradas_Itens.State in [dsInsert, dsEdit]) then
      if ((cdsNotas_Entradas_ItensTOTAL.AsCurrency > 0) and (cdsNotas_Entradas_ItensREGRA.AsInteger > 0)) then
        try
          // Pesquisando a regra de movimentação
          if (not cdsRegras_Fiscais.FindKey([cdsNotas_Entradas_ItensREGRA.AsInteger])) then
            raise Exception.Create('Regra fiscal não encontrada')
          else
          begin
            Tipo := cdsRegras_FiscaisTIPO.AsString;
            // Verificando o tipo de regra (entrada ou saída)
            if ((Tipo <> '0')) then
              raise Exception.Create('Regra fiscal inválida para este tipo de documento')
            else
            begin
              if ((cdsRegras_FiscaisCODIGOFISCAL.AsString <> '0000')) then
              begin
                if (cdsNotas_Entradas_DadosUF.AsString = 'EX') then // Exportação
                  CodigoFiscal := '3' + Copy(cdsRegras_FiscaisCODIGOFISCAL.AsString, 2, 3)
                else
                  if (cdsNotas_Entradas_DadosUF.AsString <> __SuperClass.User.Branch.State) then
                    CodigoFiscal := '2' + Copy(cdsRegras_FiscaisCODIGOFISCAL.AsString, 2, 3)
                  else
                    CodigoFiscal := cdsRegras_FiscaisCODIGOFISCAL.AsString;
              end
              else
                CodigoFiscal := cdsRegras_FiscaisCODIGOFISCAL.AsString;
              GeraFinanceiro := cdsRegras_FiscaisGERAFINANCEIRO.AsString;;
              GeraEstoque := cdsRegras_FiscaisGERAESTOQUE.AsString;
              LiberaQuantidade := cdsRegras_FiscaisLIBERAQUANTIDADE.AsString;
              PreNota := cdsRegras_FiscaisPRENOTA.AsString;
              // Tratamento para Custo Médio
              with VarCustoMedio do
              begin
                Zerado := cdsRegras_FiscaisCUSTOZERO.AsString = VB_SIM;
                AgregaFrete := cdsRegras_FiscaisAGREGAFRETE.AsString;
                AgregaDespesas := cdsRegras_FiscaisAGREGADESPESAS.AsString;
                AgregaSeguro := cdsRegras_FiscaisAGREGASEGURO.AsString;
                AgregaIPI := cdsRegras_FiscaisAGREGAIPI.AsString;
                AgregaICMS := cdsRegras_FiscaisAGREGAICMS.AsString;
                AgregaICMSST := cdsRegras_FiscaisAGREGAICMSST.AsString;
                AgregaPISApur := cdsRegras_FiscaisAGREGAPISAPUR.AsString;
                AgregaCOFINSApur := cdsRegras_FiscaisAGREGACOFINSAPUR.AsString;
                AgregaII := cdsRegras_FiscaisAGREGAII.AsString;
              end;
              // Tratamento para IPI
              with VarIPI do
              begin
                Calcula := cdsRegras_FiscaisCALCULAIPI.AsString;
                if ((Calcula = VB_SIM)) then
                begin
                  if (InicializaItem) then
                    Aliquota := cdsRegras_FiscaisIPI.AsFloat;
                  if (Aliquota = 0) then
                    Aliquota := cdsNotas_Entradas_ItensIPI.AsFloat;
                  Despesas := cdsRegras_FiscaisIPIDESPESAS.AsString;
                  Frete := cdsRegras_FiscaisIPIFRETE.AsString;
                  Seguro := cdsRegras_FiscaisIPISEGURO.AsString;
                  Desconto := cdsRegras_FiscaisIPIDESCONTO.AsString;
                  II := cdsRegras_FiscaisIPIII.AsString;
                  Reducao := cdsRegras_FiscaisREDUCAOIPI.AsFloat;
                  AgregaValor := cdsRegras_FiscaisAGREGAVALORIPI.AsString;
                  Importacao := (cdsRegras_FiscaisCALCULAII.AsString = VB_SIM);
                end;
                CST := cdsRegras_FiscaisCSTIPI.AsString;
              end;
              // Tratamento para ICMS
              with VarICMS do
              begin
                Calcula := cdsRegras_FiscaisCALCULAICMS.AsString;
                if ((Calcula = VB_SIM)) then
                begin
                  if (InicializaItem) then
                  begin
                    Aliquota := cdsRegras_FiscaisICMS.AsFloat; // Proveniente da regra fiscal
                    if (Aliquota = 0) then
                      Aliquota := __SuperClass.GenericsF.RetornaAliquotaICMSInterEstadual(cdsNotas_Entradas_DadosUF.AsString);
                    // Proveniente do estado destino
                  end;
                  if (Aliquota = 0) then
                    Aliquota := cdsNotas_Entradas_ItensICMS.AsFloat; // Proveniente do Produto
                  Despesas := cdsRegras_FiscaisICMSDESPESAS.AsString;
                  Frete := cdsRegras_FiscaisICMSFRETE.AsString;
                  Seguro := cdsRegras_FiscaisICMSSEGURO.AsString;
                  Desconto := cdsRegras_FiscaisICMSDESCONTO.AsString;
                  II := cdsRegras_FiscaisICMSII.AsString;
                  IPI := cdsRegras_FiscaisICMSIPI.AsString;
                  PISApuracao := cdsRegras_FiscaisICMSPISAPURACAO.AsString;
                  COFINSApuracao := cdsRegras_FiscaisICMSCOFINSAPURACAO.AsString;
                  Reducao := cdsRegras_FiscaisREDUCAOICMS.AsFloat;
                  AgregaValor := cdsRegras_FiscaisAGREGAVALORICMS.AsString;
                  Importacao := (cdsRegras_FiscaisCALCULAII.AsString = VB_SIM);
                end;
                OrigemST := cdsRegras_FiscaisORIGEMST.AsString;
                CST := cdsRegras_FiscaisCSTICMS.AsString;
                CSOSN := cdsRegras_FiscaisICMSCSOSN.AsString;
              end;
              // Tratamento para ICMS Diferimento
              with VarICMSDiferido do
              begin
                Calcula := cdsRegras_FiscaisCALCULAICMSDIFERIDO.AsString;
                if ((Calcula = '1') or (Calcula = '2')) then // Diferido ou diferido por redução
                begin
                  if (InicializaItem) then
                    Aliquota := cdsRegras_FiscaisICMSDIFERIDO.AsFloat;
                  if (Aliquota = 0) then
                    Aliquota := cdsNotas_Entradas_ItensICMSDIF.AsFloat;
                end;
              end;
              // Tratamento para ICMS de Fundo de Combate a Pobreza
              with VarICMSFCP do
              begin
                if (cdsRegras_FiscaisICMSFCP.AsFloat > 0) then
                  Calcula := VB_SIM
                else
                  Calcula := VB_NAO;
                Aliquota := cdsRegras_FiscaisICMSFCP.AsFloat;
                AliquotaICMSInternaOrigem := __SuperClass.GenericsF.RetornaAliquotaICMSInterna
                  (cdsNotas_Entradas_DadosUF.AsString);
              end;
              // Tratamento para ICMS de Fundo de Combate a Pobreza
              with VarICMSPUFD do
              begin
                if (cdsRegras_FiscaisICMSPUFD.AsFloat > 0) then
                  Calcula := VB_SIM
                else
                  Calcula := VB_NAO;
                Aliquota := cdsRegras_FiscaisICMSPUFD.AsFloat;
                AliquotaICMSInternaOrigem := __SuperClass.GenericsF.RetornaAliquotaICMSInterna
                  (cdsNotas_Entradas_DadosUF.AsString);
              end;
              // Tratamento para ICMS de Fundo de Combate a Pobreza
              with VarICMSPUFO do
              begin
                if (cdsRegras_FiscaisICMSPUFO.AsFloat > 0) then
                  Calcula := VB_SIM
                else
                  Calcula := VB_NAO;
                Aliquota := cdsRegras_FiscaisICMSPUFO.AsFloat;
                AliquotaICMSInternaOrigem := __SuperClass.GenericsF.RetornaAliquotaICMSInterna
                  (cdsNotas_Entradas_DadosUF.AsString);
              end;
              // Tratamento para ICMS - Substituição tributária
              with VarICMSST do
              begin
                Calcula := cdsRegras_FiscaisCALCULAICMSST.AsString;
                if ((Calcula = VB_SIM)) then
                begin
                  Aliquota := cdsRegras_FiscaisICMSST.AsFloat; // Proveniente da regra fiscal
                  if (Aliquota = 0) then
                    Aliquota := __SuperClass.GenericsF.RetornaAliquotaICMSInterna(cdsNotas_Entradas_DadosUF.AsString);
                  // Proveniente do estado destino
                  Despesas := cdsRegras_FiscaisICMSSTDESPESAS.AsString;
                  Frete := cdsRegras_FiscaisICMSSTFRETE.AsString;
                  Seguro := cdsRegras_FiscaisICMSSTSEGURO.AsString;
                  Desconto := cdsRegras_FiscaisICMSSTDESCONTO.AsString;
                  II := cdsRegras_FiscaisICMSSTII.AsString;
                  IPI := cdsRegras_FiscaisICMSSTIPI.AsString;
                  Reducao := cdsRegras_FiscaisREDUCAOICMSST.AsFloat;
                  Tipo := cdsRegras_FiscaisTIPOICMSST.AsString;
                  AgregaValor := cdsRegras_FiscaisAGREGAVALORICMSST.AsString;
                  Importacao := (cdsRegras_FiscaisCALCULAII.AsString = VB_SIM);
                end;
              end;
              // Tratamento para ISS
              with VarISS do
              begin
                Calcula := cdsRegras_FiscaisCALCULAISS.AsString;
                if ((Calcula = VB_SIM)) then
                begin
                  if (InicializaItem) then
                    Aliquota := cdsRegras_FiscaisISS.AsFloat;
                  if (Aliquota = 0) then
                    Aliquota := cdsNotas_Entradas_ItensISS.AsFloat;
                  Despesas := cdsRegras_FiscaisISSDESPESAS.AsString;
                  Frete := cdsRegras_FiscaisISSFRETE.AsString;
                  Seguro := cdsRegras_FiscaisISSSEGURO.AsString;
                  Desconto := cdsRegras_FiscaisISSDESCONTO.AsString;
                  Reducao := cdsRegras_FiscaisREDUCAOISS.AsFloat;
                  Recolhe := cdsRegras_FiscaisRECOLHEISS.AsString;
                  Importacao := (cdsRegras_FiscaisCALCULAII.AsString = VB_SIM);
                end;
              end;

              // Tratamento para PIS - Apuração
              with VarPISApuracao do
              begin
                Calcula := cdsRegras_FiscaisCALCULAPISAPURACAO.AsString;
                if ((Calcula = VB_SIM)) then
                begin
                  if (InicializaItem) then
                    Aliquota := cdsRegras_FiscaisPISAPURACAO.AsFloat;
                  if (Aliquota = 0) then
                    Aliquota := cdsNotas_Entradas_ItensPISA.AsFloat;
                  Despesas := cdsRegras_FiscaisPISAPURACAODESPESAS.AsString;
                  Frete := cdsRegras_FiscaisPISAPURACAOFRETE.AsString;
                  Seguro := cdsRegras_FiscaisPISAPURACAOSEGURO.AsString;
                  Desconto := cdsRegras_FiscaisPISAPURACAODESCONTO.AsString;
                  ICMSST := cdsRegras_FiscaisPISAPURACAOICMSST.AsString;
                  Reducao := cdsRegras_FiscaisREDUCAOPISAPURACAO.AsFloat;
                  AgregaValor := cdsRegras_FiscaisAGREGAVALORPISAPUR.AsString;
                  Importacao := (cdsRegras_FiscaisCALCULAII.AsString = VB_SIM);
                end;
              end;

              // Tratamento para COFINS - Apuração
              with VarCOFINSApuracao do
              begin
                Calcula := cdsRegras_FiscaisCALCULACOFINSAPURACAO.AsString;
                if ((Calcula = VB_SIM)) then
                begin
                  if (InicializaItem) then
                    Aliquota := cdsRegras_FiscaisCOFINSAPURACAO.AsFloat;
                  if (Aliquota = 0) then
                    Aliquota := cdsNotas_Entradas_ItensCOFINSA.AsFloat;
                  Despesas := cdsRegras_FiscaisCOFINSAPURACAODESPESAS.AsString;
                  Frete := cdsRegras_FiscaisCOFINSAPURACAOFRETE.AsString;
                  Seguro := cdsRegras_FiscaisCOFINSAPURACAOSEGURO.AsString;
                  Desconto := cdsRegras_FiscaisCOFINSAPURACAODESCONTO.AsString;
                  ICMSST := cdsRegras_FiscaisCOFINSAPURACAOICMSST.AsString;
                  Reducao := cdsRegras_FiscaisREDUCAOCOFINSAPURACAO.AsFloat;
                  AgregaValor := cdsRegras_FiscaisAGREGAVALORCOFINSAPUR.AsString;
                  Importacao := (cdsRegras_FiscaisCALCULAII.AsString = VB_SIM);
                end;
              end;

              // Tratamento para PIS - Retenção
              with VarPISRetencao do
              begin
                Calcula := cdsRegras_FiscaisCALCULAPISRETENCAO.AsString;
                if ((Calcula = VB_SIM)) then
                begin
                  if (InicializaItem) then
                    Aliquota := cdsRegras_FiscaisPISRETENCAO.AsFloat;
                  if (Aliquota = 0) then
                    Aliquota := cdsNotas_Entradas_ItensPISR.AsFloat;
                  Despesas := cdsRegras_FiscaisPISRETENCAODESPESAS.AsString;
                  Frete := cdsRegras_FiscaisPISRETENCAOFRETE.AsString;
                  Seguro := cdsRegras_FiscaisPISRETENCAOSEGURO.AsString;
                  Desconto := cdsRegras_FiscaisPISRETENCAODESCONTO.AsString;
                  Reducao := cdsRegras_FiscaisREDUCAOPISAPURACAO.AsFloat;
                  Importacao := (cdsRegras_FiscaisCALCULAII.AsString = VB_SIM);
                end;
              end;
              // Tratamento para COFINS - Retenção
              with VarCOFINSRetencao do
              begin
                Calcula := cdsRegras_FiscaisCALCULACOFINSRETENCAO.AsString;
                if ((Calcula = VB_SIM)) then
                begin
                  if (InicializaItem) then
                    Aliquota := cdsRegras_FiscaisCOFINSRETENCAO.AsFloat;
                  if (Aliquota = 0) then
                    Aliquota := cdsNotas_Entradas_ItensCOFINSR.AsFloat;
                  Despesas := cdsRegras_FiscaisCOFINSRETENCAODESPESAS.AsString;
                  Frete := cdsRegras_FiscaisCOFINSRETENCAOFRETE.AsString;
                  Seguro := cdsRegras_FiscaisCOFINSRETENCAOSEGURO.AsString;
                  Desconto := cdsRegras_FiscaisCOFINSRETENCAODESCONTO.AsString;
                  Reducao := cdsRegras_FiscaisREDUCAOCOFINSRETENCAO.AsFloat;
                  Importacao := (cdsRegras_FiscaisCALCULAII.AsString = VB_SIM);
                end;
              end;
              // Tratamento para CSLL - Retenção
              with VarCSLLRetencao do
              begin
                Calcula := cdsRegras_FiscaisCALCULACSLLRETENCAO.AsString;
                if ((Calcula = VB_SIM)) then
                begin
                  if (InicializaItem) then
                    Aliquota := cdsRegras_FiscaisCSLLRETENCAO.AsFloat;
                  if (Aliquota = 0) then
                    Aliquota := cdsNotas_Entradas_ItensCSLLR.AsFloat;
                  Despesas := cdsRegras_FiscaisCSLLRETENCAODESPESAS.AsString;
                  Frete := cdsRegras_FiscaisCSLLRETENCAOFRETE.AsString;
                  Seguro := cdsRegras_FiscaisCSLLRETENCAOSEGURO.AsString;
                  Desconto := cdsRegras_FiscaisCSLLRETENCAODESCONTO.AsString;
                  Reducao := cdsRegras_FiscaisREDUCAOCSLLRETENCAO.AsFloat;
                  Importacao := (cdsRegras_FiscaisCALCULAII.AsString = VB_SIM);
                end;
              end;
              // Tratamento para INSS
              with VarINSS do
              begin
                Calcula := cdsRegras_FiscaisCALCULAINSS.AsString;
                if ((Calcula = VB_SIM)) then
                begin
                  if (InicializaItem) then
                    Aliquota := cdsRegras_FiscaisINSS.AsFloat;
                  if (Aliquota = 0) then
                    Aliquota := cdsNotas_Entradas_ItensINSS.AsFloat;
                  Despesas := cdsRegras_FiscaisINSSDESPESAS.AsString;
                  Frete := cdsRegras_FiscaisINSSFRETE.AsString;
                  Seguro := cdsRegras_FiscaisINSSSEGURO.AsString;
                  Desconto := cdsRegras_FiscaisINSSDESCONTO.AsString;
                  Reducao := cdsRegras_FiscaisREDUCAOINSS.AsFloat;
                  Recolhe := cdsRegras_FiscaisRECOLHEINSS.AsString;
                  Importacao := (cdsRegras_FiscaisCALCULAII.AsString = VB_SIM);
                end;
              end;
              // Tratamento para IRRF
              with VarIRRF do
              begin
                Calcula := cdsRegras_FiscaisCALCULAIRRF.AsString;
                if ((Calcula = VB_SIM)) then
                begin
                  if (InicializaItem) then
                    Aliquota := cdsRegras_FiscaisIRRF.AsFloat;
                  if (Aliquota = 0) then
                    Aliquota := cdsNotas_Entradas_ItensIRRF.AsFloat;
                  Despesas := cdsRegras_FiscaisIRRFDESPESAS.AsString;
                  Frete := cdsRegras_FiscaisIRRFFRETE.AsString;
                  Seguro := cdsRegras_FiscaisIRRFSEGURO.AsString;
                  Desconto := cdsRegras_FiscaisIRRFDESCONTO.AsString;
                  Reducao := cdsRegras_FiscaisREDUCAOIRRF.AsFloat;
                  Recolhe := cdsRegras_FiscaisRECOLHEIRRF.AsString;
                  Importacao := (cdsRegras_FiscaisCALCULAII.AsString = VB_SIM);
                end;
              end;
              // Tratamento para FGTS
              with VarFGTS do
              begin
                Calcula := cdsRegras_FiscaisCALCULAFGTS.AsString;
                if ((Calcula = VB_SIM)) then
                begin
                  if (InicializaItem) then
                    Aliquota := cdsRegras_FiscaisFGTS.AsFloat;
                  Despesas := cdsRegras_FiscaisFGTSDESPESAS.AsString;
                  Frete := cdsRegras_FiscaisFGTSFRETE.AsString;
                  Seguro := cdsRegras_FiscaisFGTSSEGURO.AsString;
                  Desconto := cdsRegras_FiscaisFGTSDESCONTO.AsString;
                  Reducao := cdsRegras_FiscaisREDUCAOFGTS.AsFloat;
                  Importacao := (cdsRegras_FiscaisCALCULAII.AsString = VB_SIM);
                end;
              end;
              // Tratamento para II
              with VarII do
              begin
                Calcula := cdsRegras_FiscaisCALCULAII.AsString;
                if ((Calcula = VB_SIM)) then
                begin
                  if (InicializaItem) then
                    Aliquota := cdsRegras_FiscaisII.AsFloat;
                  if (Aliquota = 0) then
                    Aliquota := cdsNotas_Entradas_ItensII.AsFloat;
                  Despesas := cdsRegras_FiscaisIIDESPESAS.AsString;
                  Frete := cdsRegras_FiscaisIIFRETE.AsString;
                  Seguro := cdsRegras_FiscaisIISEGURO.AsString;
                  Desconto := cdsRegras_FiscaisIIDESCONTO.AsString;
                  Reducao := cdsRegras_FiscaisREDUCAOII.AsFloat;
                  AgregaValor := cdsRegras_FiscaisAGREGAVALORII.AsString;
                  Importacao := (cdsRegras_FiscaisCALCULAII.AsString = VB_SIM);
                end;
              end;
              // Calcula os Tributos
              with VarTributos do
              begin
                Calcula := cdsRegras_FiscaisCALCULATRIBUTOS.AsString;
                if ((Calcula = VB_SIM)) then
                begin
                  if (InicializaItem) then
                    Aliquota := cdsRegras_FiscaisTRIBUTOS.AsFloat;
                  if (Aliquota = 0) then
                    Aliquota := cdsNotas_Entradas_ItensTRIBUTOS.AsFloat;
                end;
              end;
              if (__SuperClass.GetPackage(BPL_ACCUSTOMS).Handle <> 0) then
              begin
                @AposDefinicaoRegrasImpostosNFE := GetProcAddress(__SuperClass.GetPackage(BPL_ACCUSTOMS).Handle,
                  'AposDefinicaoRegrasImpostosNFE');
                if Assigned(AposDefinicaoRegrasImpostosNFE) then
                  AposDefinicaoRegrasImpostosNFE(cdsNotas_Entradas_Dados, cdsNotas_Entradas_Itens, VarIPI, VarICMS, VarICMSST,
                    VarISS, VarPISApuracao, VarCOFINSApuracao, VarPISRetencao, VarCOFINSRetencao, VarCSLLRetencao, VarINSS,
                    VarIRRF, VarFGTS, VarII, VarTributos, VarICMSDiferido, VarICMSFCP, VarICMSPUFD, VarICMSPUFO);
              end;
              // Inicializando os valores a serem calculados para o item
              __SuperClass.GenericsF.InicializaValores(Valores);
              // Calculando os impostos
              with Valores do
              begin
                // Calculando os campos de impostos para o item em questão
                BaseItem := RoundTo((cdsNotas_Entradas_ItensQUANTIDADE.AsFloat * cdsNotas_Entradas_ItensUNITARIO.AsFloat), -2);
                ValorDespesas := cdsNotas_Entradas_ItensVALORDESPESAS.AsCurrency;
                ValorFrete := cdsNotas_Entradas_ItensVALORFRETE.AsCurrency;
                ValorSeguro := cdsNotas_Entradas_ItensVALORSEGURO.AsCurrency;
                Desconto := cdsNotas_Entradas_ItensDESCONTO.AsFloat;
                // Calculando o valor do desconto
                if (Desconto = 0) then
                  Desconto := cdsNotas_Entradas_DadosDESCONTO.AsFloat;
                ValorDesconto := cdsNotas_Entradas_ItensVALORDESCONTO.AsCurrency;

                MargemLucro := cdsNotas_Entradas_ItensMARGEMLUCRO.AsFloat;
                // Calculando o IPI
                SetLength(Auxiliar, 1);
                Auxiliar[0] := __SuperClass.GenericsF.CalculaII(VarII, BaseItem, ValorDespesas, ValorFrete, ValorSeguro,
                  ValorDesconto);
                IPI := __SuperClass.GenericsF.CalculaIPI(VarIPI, BaseItem, ValorDespesas, ValorFrete, ValorSeguro, ValorDesconto,
                  Auxiliar[0].Valor);
                // Calculando o ICMS
                SetLength(Auxiliar, 6);
                Auxiliar[0] := __SuperClass.GenericsF.CalculaII(VarII, BaseItem, ValorDespesas, ValorFrete, ValorSeguro,
                  ValorDesconto);
                Auxiliar[1] := __SuperClass.GenericsF.CalculaIPI(VarIPI, BaseItem, ValorDespesas, ValorFrete, ValorSeguro,
                  ValorDesconto, Auxiliar[0].Valor);
                Auxiliar[2] := __SuperClass.GenericsF.CalculaICMS(VarICMS, BaseItem, ValorDespesas, ValorFrete, ValorSeguro,
                  ValorDesconto, Auxiliar[1].Valor, Auxiliar[2].Valor, Auxiliar[3].Valor, Auxiliar[0].Valor);
                Auxiliar[3] := __SuperClass.GenericsF.CalculaICMSST(VarICMSST, ICMS.Valor, BaseItem, ValorDespesas, ValorFrete,
                  ValorSeguro, ValorDesconto, IPI.Valor, 0, 0, 0, MargemLucro);
                Auxiliar[4] := __SuperClass.GenericsF.CalculaPISApuracao(VarPISApuracao, BaseItem, ValorDespesas, ValorFrete,
                  ValorSeguro, ValorDesconto, Auxiliar[3].Valor, VarIPI.Aliquota, VarICMS.Aliquota, VarCOFINSApuracao.Aliquota,
                  VarII.Aliquota);
                Auxiliar[5] := __SuperClass.GenericsF.CalculaCOFINSApuracao(VarCOFINSApuracao, BaseItem, ValorDespesas,
                  ValorFrete, ValorSeguro, ValorDesconto, Auxiliar[3].Valor, VarIPI.Aliquota, VarICMS.Aliquota,
                  VarPISApuracao.Aliquota, VarII.Aliquota);
                ICMS := __SuperClass.GenericsF.CalculaICMS(VarICMS, BaseItem, ValorDespesas, ValorFrete, ValorSeguro,
                  ValorDesconto, Auxiliar[1].Valor, Auxiliar[4].Valor, Auxiliar[5].Valor, Auxiliar[0].Valor);
                // Calculando o ICMS Diferimento
                ICMSDiferido := __SuperClass.GenericsF.CalculaICMSDif(VarICMSDiferido, ICMS.Valor);
                if (ICMSDiferido.Valor > 0) then
                  ICMS.Valor := ICMS.Valor - ICMSDiferido.Valor;
                if __SuperClass.GenericsF.CalculaPartilhaICMS(nfeEntrada, cdsNotas_Entradas_DadosFORNECEDOR.AsInteger) then
                  begin
                    // Calculando o Fundo de Amparo a Pobreza
                    ICMSFCP := __SuperClass.GenericsF.CalculaICMSFCP(VarICMSFCP, ICMS);
                    // Calculado o ICMS da Partilha de Destino
                    ICMSPUFD := __SuperClass.GenericsF.CalculaICMSPUFD(VarICMSPUFD, ICMS);
                    // Calculando o ICMS da Partilha Origem
                    ICMSPUFO := __SuperClass.GenericsF.CalculaICMSPUFO(VarICMSPUFO, ICMS);
                end;
                // Calculando o ICMS Substituição Tributaria
                ICMSST := __SuperClass.GenericsF.CalculaICMSST(VarICMSST, ICMS.Valor, BaseItem, ValorDespesas, ValorFrete,
                  ValorSeguro, ValorDesconto, IPI.Valor, 0, 0, 0, MargemLucro);
                // Calculando o ICMS-ST
                ICMSST := __SuperClass.GenericsF.CalculaICMSST(VarICMSST, ICMS.Valor, BaseItem, ValorDespesas, ValorFrete,
                  ValorSeguro, ValorDesconto, IPI.Valor, 0, 0, 0, MargemLucro);
                // Calculando o ISS - Apuração/Retenção
                if (VarISS.Recolhe = VB_NAO) then
                  ISSApuracao := __SuperClass.GenericsF.CalculaISS(VarISS, BaseItem, ValorDespesas, ValorFrete, ValorSeguro,
                    ValorDesconto)
                else
                  ISSRetencao := __SuperClass.GenericsF.CalculaISS(VarISS, BaseItem, ValorDespesas, ValorFrete, ValorSeguro,
                    ValorDesconto);
                // Calculando o PIS (Apuração)
                PISApuracao := __SuperClass.GenericsF.CalculaPISApuracao(VarPISApuracao, BaseItem, ValorDespesas, ValorFrete,
                  ValorSeguro, ValorDesconto, ICMSST.Valor, VarIPI.Aliquota, VarICMS.Aliquota, VarCOFINSApuracao.Aliquota,
                  VarII.Aliquota);
                // Calculando o COFINS (Apuração)
                COFINSApuracao := __SuperClass.GenericsF.CalculaCOFINSApuracao(VarCOFINSApuracao, BaseItem, ValorDespesas,
                  ValorFrete, ValorSeguro, ValorDesconto, ICMSST.Valor, VarIPI.Aliquota, VarICMS.Aliquota,
                  VarPISApuracao.Aliquota, VarII.Aliquota);
                // Calculando o PIS (Retenção)
                PISRetencao := __SuperClass.GenericsF.CalculaPISRetencao(VarPISRetencao, BaseItem, ValorDespesas, ValorFrete,
                  ValorSeguro, ValorDesconto);
                // Calculando o COFINS (Retenção)
                COFINSRetencao := __SuperClass.GenericsF.CalculaCOFINSRetencao(VarCOFINSRetencao, BaseItem, ValorDespesas,
                  ValorFrete, ValorSeguro, ValorDesconto);
                // Calculando o CSLL (Retenção)
                CSLLRetencao := __SuperClass.GenericsF.CalculaCSLLRetencao(VarCSLLRetencao, BaseItem, ValorDespesas, ValorFrete,
                  ValorSeguro, ValorDesconto);
                // Calculando o INSS
                if (VarINSS.Recolhe = VB_NAO) then
                  INSSApuracao := __SuperClass.GenericsF.CalculaINSS(VarINSS, BaseItem, ValorDespesas, ValorFrete, ValorSeguro,
                    ValorDesconto)
                else
                  INSSRetencao := __SuperClass.GenericsF.CalculaINSS(VarINSS, BaseItem, ValorDespesas, ValorFrete, ValorSeguro,
                    ValorDesconto);
                // Calculando o IRRF
                if (VarIRRF.Recolhe = VB_NAO) then
                  IRRFApuracao := __SuperClass.GenericsF.CalculaIRRF(VarIRRF, BaseItem, ValorDespesas, ValorFrete, ValorSeguro,
                    ValorDesconto)
                else
                  IRRFRetencao := __SuperClass.GenericsF.CalculaIRRF(VarIRRF, BaseItem, ValorDespesas, ValorFrete, ValorSeguro,
                    ValorDesconto);
                // Calculando o FGTS
                FGTS := __SuperClass.GenericsF.CalculaFGTS(VarFGTS, BaseItem, ValorDespesas, ValorFrete, ValorSeguro,
                  ValorDesconto);
                // Calculando o II
                II := __SuperClass.GenericsF.CalculaII(VarII, BaseItem, ValorDespesas, ValorFrete, ValorSeguro, ValorDesconto);
                // Calculando os Tributos
                if (VarTributos.Calcula = VB_SIM) then
                  Tributos := __SuperClass.GenericsF.CalculaTributos(VarTributos, BaseItem);
                if (__SuperClass.GetPackage(BPL_ACCUSTOMS).Handle <> 0) then
                begin
                  @AposCalculoImpostosNFE := GetProcAddress(__SuperClass.GetPackage(BPL_ACCUSTOMS).Handle,
                    'AposCalculoImpostosNFE');
                  if Assigned(AposCalculoImpostosNFE) then
                    AposCalculoImpostosNFE(cdsNotas_Entradas_Dados, cdsNotas_Entradas_Itens, IPI, ICMS, ICMSST, ISS, PISApuracao,
                      COFINSApuracao, PISRetencao, COFINSRetencao, CSLLRetencao, INSS, IRRFApuracao, IRRFRetencao, FGTS, II,
                      Tributos, ICMSDiferido, ICMSFCP, ICMSPUFD, ICMSPUFO);
                end;
                // Calculo da comissão
                (*with RegrasComissao do
                begin
                  if not Carregado then
                    RegrasComissao := __SuperClass.GenericsF.CarregaRegrasComissao(cdsPedidos_Vendas_DadosVENDEDOR.AsInteger);
                  // Obtendo os valores base
                  BaseComissao := BaseItem;
                  if (ConsideraDespesas = VB_SIM) then
                    BaseComissao := BaseComissao + ValorDespesas;
                  if (ConsideraFrete = VB_SIM) then
                    BaseComissao := BaseComissao + ValorFrete;
                  if (ConsideraSeguro = VB_SIM) then
                    BaseComissao := BaseComissao + ValorSeguro;
                  if (ConsideraDesconto = VB_SIM) then
                    BaseComissao := BaseComissao - ValorDesconto;
                  if (ConsideraIPI = VB_SIM) and (VarIPI.AgregaValor = VB_SIM) then
                    BaseComissao := BaseComissao + IPI.Valor;
                  if (ConsideraICMS = VB_NAO) or (VarICMS.AgregaValor = VB_NAO) then
                    BaseComissao := BaseComissao - ICMS.Valor;
                  if (ConsideraICMSST = VB_SIM) and (VarICMSST.AgregaValor = VB_SIM) then
                    BaseComissao := BaseComissao + ICMSST.Valor;
                  if (ConsideraISS = VB_NAO) then
                    BaseComissao := BaseComissao - ISS.Valor;
                  if ((TipoCalculo = TC_DOCUMENTO)) then // Cálculo por documento
                  begin
                    if __Comissao <> 0 then
                      Comissao := __Comissao
                    else
                      Comissao := ComissaoVendedor; // cdsPedidos_Vendas_DadosCOMISSAO.AsFloat;
                    ValorComissao := RoundTo(((BaseComissao * Comissao) * 0.01), -3); // -8
                  end
                  else if (TipoCalculo = TC_ITEM_DOCUMENTO) then // Cálculo por item (produto)
                  begin
                    if ZeraComissao then
                      Comissao := 0
                    else
                    begin
                      Comissao := cdsPedidos_Vendas_ItensCOMISSAO.AsFloat;
                      if Comissao = 0 then
                        Comissao := __Comissao;
                    end;
                    ValorComissao := RoundTo(((BaseComissao * Comissao) * 0.01), -3); // -8
                  end
                  else if (TipoCalculo = TC_FAIXA_PRECO) then // Cálculo por faixa de comissão
                  begin
                    with FaixaComissao do
                    begin
                      if not(Carregado) or (cdsPedidos_Vendas_ItensPRODUTO.AsString <> Produto) then
                        FaixaComissao := __SuperClass.GenericsF.CarregaFaixaComissao(GrupoFaixa,
                          cdsPedidos_Vendas_ItensPRODUTO.AsString, cdsPedidos_Vendas_ItensTIPOPRECO.AsString);
                      if ((PrecoMinimo > 0) and (PrecoMaximo > 0)) then
                      begin
                        if (cdsPedidos_Vendas_ItensUNITARIO.AsFloat < PrecoMinimo) or
                          (cdsPedidos_Vendas_ItensUNITARIO.AsFloat > PrecoMaximo) then
                        begin
                          __SuperClass.GenericsF.DisplayMessage
                            ('Preço informado fora da faixa de comissão definida para o produto.' + #13#13#13 +
                            Format('Preço Mínimo: %s Preço Máximo: %s', [FormatFloat('R$ #0.00000000', PrecoMinimo),
                            FormatFloat('R$ #0.00000000', PrecoMaximo)]), '',
                            'Troque o tipo de preço para obter a faixa de comissão.', 'Informação', MB_ICONINFORMATION);
                        end
                        else
                        begin
                          Auxiliar := RoundTo((cdsPedidos_Vendas_ItensUNITARIO.AsFloat - PrecoMinimo) /
                            IfThen(PrecoMaximo <> PrecoMinimo, (PrecoMaximo - PrecoMinimo), 1), -2);
                          Comissao := RoundTo((((ComissaoMaximo - ComissaoMinimo) * Auxiliar) + ComissaoMinimo), -2);
                          ValorComissao := RoundTo(((BaseComissao * Comissao) * 0.01), -3); // -8
                        end;
                      end;
                    end;
                  end;

                  if (Comissao = 0) then
                  begin
                    BaseComissao := 0;
                    Comissao := 0;
                    ValorComissao := 0;
                  end;
                end;  *)
                // Verificando se gera financeiro
                if ((GeraFinanceiro = VB_SIM)) then
                begin
                  ValorFinanceiro :=
                    ((BaseItem + IfThen(VarIPI.AgregaValor = VB_SIM, IPI.Valor, 0) - IfThen(VarICMS.AgregaValor = VB_SIM, 0,
                    ICMS.Valor) + IfThen(VarICMSST.AgregaValor = VB_SIM, ICMSST.Valor, 0) + ValorDespesas + ValorFrete +
                    ValorSeguro) - ValorDesconto);
                  // Verificando se soma o valor do icms para notas fiscais de importação
                  ValorFinanceiro := ValorFinanceiro + IfThen((VarICMS.Importacao) and (VarICMS.AgregaValor = VB_SIM),
                    ICMS.Valor, 0);
                  // Verificando se Recolhe ISS, Se sim, subtrai o valor
                  ValorFinanceiro := ValorFinanceiro - IfThen(VarISS.Recolhe = VB_SIM, ISSRetencao.Valor, 0);
                  // Verificando se Recolhe INSS, Se sim, subtrai o valor
                  ValorFinanceiro := ValorFinanceiro - IfThen(VarINSS.Recolhe = VB_SIM, INSSRetencao.Valor, 0);
                  // Verificando se Recolhe IRRF, Se sim, subtrai o valor
                  ValorFinanceiro := ValorFinanceiro - IfThen(VarIRRF.Recolhe = VB_SIM, IRRFRetencao.Valor, 0);
                  // Verificando se soma o valor do PIS para notas fiscais de importação
                  ValorFinanceiro := ValorFinanceiro +
                    IfThen((VarPISApuracao.Importacao) and (VarPISApuracao.AgregaValor = VB_SIM), PISApuracao.Valor, 0);
                  // Verificando se soma o valor do COFINS para notas fiscais de importação
                  ValorFinanceiro := ValorFinanceiro + IfThen((VarCOFINSApuracao.Importacao) and
                    (VarCOFINSApuracao.AgregaValor = VB_SIM), COFINSApuracao.Valor, 0);
                  // Verificando se soma o valor do II para notas fiscais de importação
                  ValorFinanceiro := ValorFinanceiro + IfThen((VarII.Importacao) and (VarII.AgregaValor = VB_SIM), II.Valor, 0);
                end;
                //
                ValorBruto := (BaseItem + IfThen(VarIPI.AgregaValor = VB_SIM, IPI.Valor, 0) +
                  IfThen(VarICMSST.AgregaValor = VB_SIM, ICMSST.Valor, 0) + ValorDespesas + ValorFrete + ValorSeguro);
                // Verificando se soma o valor do icms para notas fiscais de importação
                ValorBruto := ValorBruto + IfThen((VarICMS.Importacao) and (VarICMS.AgregaValor = VB_SIM), ICMS.Valor, 0);
                // Verificando se soma o valor do PIS para notas fiscais de importação
                ValorBruto := ValorBruto + IfThen((VarPISApuracao.Importacao) and (VarPISApuracao.AgregaValor = VB_SIM),
                  PISApuracao.Valor, 0);
                // Verificando se soma o valor do COFINS para notas fiscais de importação
                ValorBruto := ValorBruto + IfThen((VarCOFINSApuracao.Importacao) and (VarCOFINSApuracao.AgregaValor = VB_SIM),
                  COFINSApuracao.Valor, 0);
                // Verificando se soma o valor do II para notas fiscais de importação
                ValorBruto := ValorBruto + IfThen((VarII.Importacao) and (VarII.AgregaValor = VB_SIM), II.Valor, 0);
                //
                ValorLiquido :=
                  ((BaseItem + IfThen(VarIPI.AgregaValor = VB_SIM, IPI.Valor, 0) - IfThen(VarICMS.AgregaValor = VB_SIM, 0,
                  ICMS.Valor) + IfThen(VarICMSST.AgregaValor = VB_SIM, ICMSST.Valor, 0) + ValorDespesas + ValorFrete +
                  ValorSeguro) - ValorDesconto);
                // Verificando se soma o valor do icms para notas fiscais de importação
                ValorLiquido := ValorLiquido + IfThen((VarICMS.Importacao) and (VarICMS.AgregaValor = VB_SIM), ICMS.Valor, 0);
                // Verificando se Recolhe ISS, Se sim, subtrai o valor
                ValorLiquido := ValorLiquido - IfThen(VarISS.Recolhe = VB_SIM, ISSRetencao.Valor, 0);
                // Verificando se Recolhe INSS, Se sim, subtrai o valor
                ValorLiquido := ValorLiquido - IfThen(VarINSS.Recolhe = VB_SIM, INSSRetencao.Valor, 0);
                // Verificando se Recolhe IRRF, Se sim, subtrai o valor
                ValorLiquido := ValorLiquido - IfThen(VarIRRF.Recolhe = VB_SIM, IRRFRetencao.Valor, 0);
                // Verificando se soma o valor do PIS para notas fiscais de importação
                ValorLiquido := ValorLiquido + IfThen((VarPISApuracao.Importacao) and (VarPISApuracao.AgregaValor = VB_SIM),
                  PISApuracao.Valor, 0);
                // Verificando se soma o valor do COFINS para notas fiscais de importação
                ValorLiquido := ValorLiquido + IfThen((VarCOFINSApuracao.Importacao) and (VarCOFINSApuracao.AgregaValor = VB_SIM),
                  COFINSApuracao.Valor, 0);
                // Verificando se soma o valor do II para notas fiscais de importação
                ValorLiquido := ValorLiquido + IfThen((VarII.Importacao) and (VarII.AgregaValor = VB_SIM), II.Valor, 0);
                // Atribuindo o valor financeiro
                cdsNotas_Entradas_ItensVALORFINANCEIRO.AsCurrency := ValorFinanceiro;
                // Atribuindo o valor Bruto
                cdsNotas_Entradas_ItensVALORBRUTO.AsCurrency := ValorBruto;
                // Atribuindo o valor Bruto
                cdsNotas_Entradas_ItensVALORLIQUIDO.AsCurrency := ValorLiquido;
                // Atribuindo o valor da comissão
                cdsNotas_Entradas_ItensDESCONTO.OnValidate := Nil;
                cdsNotas_Entradas_ItensVALORDESCONTO.OnValidate := Nil;
                cdsNotas_Entradas_ItensDESCONTO.AsCurrency := Desconto;
                cdsNotas_Entradas_ItensVALORDESCONTO.AsCurrency := ValorDesconto;
                cdsNotas_Entradas_ItensDESCONTO.OnValidate := cdsNotas_Entradas_ItensDESCONTOValidate;
                cdsNotas_Entradas_ItensVALORDESCONTO.OnValidate := cdsNotas_Entradas_ItensVALORDESCONTOValidate;

                // Atribuindo o CFOP
                cdsNotas_Entradas_ItensCODIGOFISCAL.AsString := CodigoFiscal;
                // Atribuindo IPI
                cdsNotas_Entradas_ItensIPI.OnValidate := Nil;
                cdsNotas_Entradas_ItensIPI.AsFloat := IPI.Aliquota;
                cdsNotas_Entradas_ItensBASEIPI.AsCurrency := IPI.Base;
                cdsNotas_Entradas_ItensVALORIPI.AsCurrency := IPI.Valor;
                cdsNotas_Entradas_ItensCSTIPI.AsString := VarIPI.CST;
                cdsNotas_Entradas_ItensIPI.OnValidate := cdsNotas_Entradas_ItensIPIValidate;
                // Atribuindo ICMS
                cdsNotas_Entradas_ItensICMS.OnValidate := Nil;
                cdsNotas_Entradas_ItensICMS.AsFloat := ICMS.Aliquota;
                cdsNotas_Entradas_ItensBASEICMS.AsCurrency := ICMS.Base;
                cdsNotas_Entradas_ItensVALORICMS.AsCurrency := ICMS.Valor;
                if (VarICMS.OrigemST <> '') then
                  cdsNotas_Entradas_ItensORIGEMST.AsString := VarICMS.OrigemST;
                cdsNotas_Entradas_ItensCSTICMS.AsString := VarICMS.CST;
                cdsNotas_Entradas_ItensCSOSNICMS.AsString := VarICMS.CSOSN;
                cdsNotas_Entradas_ItensICMS.OnValidate := cdsNotas_Entradas_ItensICMSValidate;

                // Atribuindo o ICMS Diferimento
                cdsNotas_Entradas_ItensICMSDIF.OnValidate := Nil;
                cdsNotas_Entradas_ItensICMSDIF.AsFloat := ICMSDiferido.Aliquota;
                cdsNotas_Entradas_ItensBASEICMSDIF.AsCurrency := ICMSDiferido.Base;
                cdsNotas_Entradas_ItensVALORICMSDIF.AsCurrency := ICMSDiferido.Valor;
                cdsNotas_Entradas_ItensICMSDIF.OnValidate := cdsNotas_Entradas_ItensICMSDIFValidate;

                // Atribuindo o ICMS FCP
                cdsNotas_Entradas_ItensBASEICMSFCP.AsCurrency := ICMSFCP.Base;
                cdsNotas_Entradas_ItensVALORICMSFCP.AsCurrency := ICMSFCP.Valor;

                // Atribuindo o ICMS Partilha Destino
                cdsNotas_Entradas_ItensBASEICMSPUFD.AsCurrency := ICMSPUFD.Base;
                cdsNotas_Entradas_ItensVALORICMSPUFD.AsCurrency := ICMSPUFD.Valor;

                // Atribuindo o ICMS Partilha Origem
                cdsNotas_Entradas_ItensBASEICMSPUFO.AsCurrency := ICMSPUFO.Base;
                cdsNotas_Entradas_ItensVALORICMSPUFO.AsCurrency := ICMSPUFO.Valor;

                // ICMS ST
                cdsNotas_Entradas_ItensMARGEMLUCRO.OnValidate := Nil;
                // cdsNotas_Entradas_ItensMARGEMLUCRO.AsFloat    := ICMSST.Aliquota;
                cdsNotas_Entradas_ItensBASEICMSST.AsCurrency := ICMSST.Base;
                cdsNotas_Entradas_ItensVALORICMSST.AsCurrency := ICMSST.Valor;
                cdsNotas_Entradas_ItensMARGEMLUCRO.OnValidate := cdsNotas_Entradas_ItensMARGEMLUCROValidate;

                // Tratamento para o ISS
                cdsNotas_Entradas_ItensISS.OnValidate := Nil;
                cdsNotas_Entradas_ItensISS.AsFloat := IfThen(VarISS.Recolhe = VB_NAO, ISSApuracao.Aliquota, ISSRetencao.Aliquota);
                cdsNotas_Entradas_ItensBASEISSA.AsCurrency := ISSApuracao.Base;
                cdsNotas_Entradas_ItensVALORISSA.AsCurrency := ISSApuracao.Valor;
                cdsNotas_Entradas_ItensBASEISSR.AsCurrency := ISSRetencao.Base;
                cdsNotas_Entradas_ItensVALORISSR.AsCurrency := ISSRetencao.Valor;
                cdsNotas_Entradas_ItensISS.OnValidate := cdsNotas_Entradas_ItensISSValidate;
                // Tratamento para o PIS Apuração
                cdsNotas_Entradas_ItensPISA.OnValidate := Nil;
                cdsNotas_Entradas_ItensPISA.AsFloat := PISApuracao.Aliquota;
                cdsNotas_Entradas_ItensBASEPISA.AsFloat := PISApuracao.Base;
                cdsNotas_Entradas_ItensVALORPISA.AsCurrency := PISApuracao.Valor;
                cdsNotas_Entradas_ItensPISA.OnValidate := cdsNotas_Entradas_ItensPISAValidate;
                // Tratamento para o COFINS Apuração
                cdsNotas_Entradas_ItensCOFINSA.OnValidate := Nil;
                cdsNotas_Entradas_ItensCOFINSA.AsFloat := COFINSApuracao.Aliquota;
                cdsNotas_Entradas_ItensBASECOFINSA.AsCurrency := COFINSApuracao.Base;
                cdsNotas_Entradas_ItensVALORCOFINSA.AsCurrency := COFINSApuracao.Valor;
                cdsNotas_Entradas_ItensCOFINSA.OnValidate := cdsNotas_Entradas_ItensCOFINSAValidate;
                // Tratamento para o PIS Retenção
                cdsNotas_Entradas_ItensPISR.OnValidate := Nil;
                cdsNotas_Entradas_ItensPISR.AsFloat := PISRetencao.Aliquota;
                cdsNotas_Entradas_ItensBASEPISR.AsFloat := PISRetencao.Base;
                cdsNotas_Entradas_ItensVALORPISR.AsCurrency := PISRetencao.Valor;
                cdsNotas_Entradas_ItensPISR.OnValidate := cdsNotas_Entradas_ItensPISRValidate;
                // Tratamento para o COFINS Retenção
                cdsNotas_Entradas_ItensCOFINSR.OnValidate := Nil;
                cdsNotas_Entradas_ItensCOFINSR.AsFloat := COFINSRetencao.Aliquota;
                cdsNotas_Entradas_ItensBASECOFINSR.AsCurrency := COFINSRetencao.Base;
                cdsNotas_Entradas_ItensVALORCOFINSR.AsCurrency := COFINSRetencao.Valor;
                cdsNotas_Entradas_ItensCOFINSR.OnValidate := cdsNotas_Entradas_ItensCOFINSRValidate;
                // Tratamento para o CSLL Retenção
                cdsNotas_Entradas_ItensCSLLR.OnValidate := Nil;
                cdsNotas_Entradas_ItensCSLLR.AsFloat := CSLLRetencao.Aliquota;
                cdsNotas_Entradas_ItensBASECSLLR.AsCurrency := CSLLRetencao.Base;
                cdsNotas_Entradas_ItensVALORCSLLR.AsCurrency := CSLLRetencao.Valor;
                cdsNotas_Entradas_ItensCSLLR.OnValidate := cdsNotas_Entradas_ItensCSLLRValidate;
                // Tratamento para o INSS - Apuração / Retenção
                cdsNotas_Entradas_ItensINSS.OnValidate := Nil;
                cdsNotas_Entradas_ItensINSS.AsFloat := IfThen(VarINSS.Recolhe = VB_NAO, INSSApuracao.Aliquota,
                  INSSRetencao.Aliquota);
                cdsNotas_Entradas_ItensBASEINSSA.AsCurrency := INSSApuracao.Base;
                cdsNotas_Entradas_ItensVALORINSSA.AsCurrency := INSSApuracao.Valor;
                cdsNotas_Entradas_ItensBASEINSSR.AsCurrency := INSSRetencao.Base;
                cdsNotas_Entradas_ItensVALORINSSR.AsCurrency := INSSRetencao.Valor;
                cdsNotas_Entradas_ItensINSS.OnValidate := cdsNotas_Entradas_ItensINSSValidate;
                // Tratamento para o IRRF - Apuração / Retenção
                cdsNotas_Entradas_ItensIRRF.OnValidate := Nil;
                cdsNotas_Entradas_ItensIRRF.AsFloat := IfThen(VarIRRF.Recolhe = VB_NAO, IRRFApuracao.Aliquota,
                  IRRFRetencao.Aliquota);
                cdsNotas_Entradas_ItensBASEIRRFA.AsCurrency := IRRFApuracao.Base;
                cdsNotas_Entradas_ItensVALORIRRFA.AsCurrency := IRRFApuracao.Valor;
                cdsNotas_Entradas_ItensBASEIRRFR.AsCurrency := IRRFRetencao.Base;
                cdsNotas_Entradas_ItensVALORIRRFR.AsCurrency := IRRFRetencao.Valor;
                cdsNotas_Entradas_ItensIRRF.OnValidate := cdsNotas_Entradas_ItensIRRFValidate;
                // Tratamento para o II
                cdsNotas_Entradas_ItensII.OnValidate := Nil;
                cdsNotas_Entradas_ItensII.AsFloat := II.Aliquota;
                cdsNotas_Entradas_ItensBASEII.AsCurrency := II.Base;
                cdsNotas_Entradas_ItensVALORII.AsCurrency := II.Valor;
                cdsNotas_Entradas_ItensII.OnValidate := cdsNotas_Entradas_ItensIIValidate;

                // Tratamento para os Tributos
                cdsNotas_Entradas_ItensTRIBUTOS.OnValidate := Nil;
                cdsNotas_Entradas_ItensTRIBUTOS.AsFloat := Tributos.Aliquota;
                cdsNotas_Entradas_ItensBASETRIBUTOS.AsCurrency := Tributos.Base;
                cdsNotas_Entradas_ItensVALORTRIBUTOS.AsCurrency := Tributos.Valor;
                cdsNotas_Entradas_ItensTRIBUTOS.OnValidate := cdsNotas_Entradas_ItensTRIBUTOSValidate;

                // Calculando o custo do item
                if (GeraEstoque = VB_SIM) then
                begin
                  with VarCustoMedio do
                  begin
                    if not(Zerado) then // Somente quando for movimentar o custo
                    begin
                      CustoTotal := BaseItem;
                      if AgregaFrete = VB_SIM then
                        CustoTotal := CustoTotal + ValorFrete;
                      if AgregaDespesas = VB_SIM then
                        CustoTotal := CustoTotal + ValorDespesas;
                      if AgregaSeguro = VB_SIM then
                        CustoTotal := CustoTotal + ValorSeguro;
                      if AgregaIPI = VB_SIM then
                        CustoTotal := CustoTotal + IPI.Valor;
                      if AgregaICMS = VB_NAO then
                        CustoTotal := CustoTotal - ICMS.Valor;
                      if AgregaICMSST = VB_SIM then
                        CustoTotal := CustoTotal + ICMSST.Valor;
                      if AgregaPISApur = VB_SIM then
                        CustoTotal := CustoTotal + PISApuracao.Valor;
                      if AgregaCOFINSApur = VB_SIM then
                        CustoTotal := CustoTotal + COFINSApuracao.Valor;
                      if AgregaII = VB_SIM then
                        CustoTotal := CustoTotal + II.Valor;

                      // Subtraindo o desconto
                      CustoTotal := CustoTotal - ValorDesconto;
                      // Custo total
                      cdsNotas_Entradas_ItensCUSTOTOTAL.AsCurrency := CustoTotal;
                      // Custo médio
                      cdsNotas_Entradas_ItensCUSTOMEDIO.AsFloat := cdsNotas_Entradas_ItensCUSTOTOTAL.AsCurrency /
                        cdsNotas_Entradas_ItensQUANTIDADE.AsFloat;
                    end else begin
                      cdsNotas_Entradas_ItensCUSTOTOTAL.AsCurrency := 0;
                      cdsNotas_Entradas_ItensCUSTOMEDIO.AsFloat := 0;
                    end;
                  end;
                end;
              end;
            end;
          end;
        except
          on E: Exception do
          begin
            __SuperClass.GenericsF.DisplayMessage('Regra fiscal inválida.', Format('%s.', [E.Message]), 'Tente novamente.',
              'Informação', MB_ICONEXCLAMATION);
            Abort;
          end;
        end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensDESCONTOValidate(Sender: TField);
var
  BaseDesconto: Currency;
  Percentual: Single;
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      BaseDesconto := cdsNotas_Entradas_ItensTOTAL.AsCurrency;
      Percentual := Sender.AsFloat;
      try
        cdsNotas_Entradas_ItensDESCONTO.OnValidate := Nil;
        cdsNotas_Entradas_ItensVALORDESCONTO.OnValidate := Nil;
        cdsNotas_Entradas_ItensVALORDESCONTO.AsCurrency := RoundTo(((BaseDesconto * Percentual) * 0.01), -2);
        AtualizaValoresItem;
      finally
        cdsNotas_Entradas_ItensDESCONTO.OnValidate := cdsNotas_Entradas_ItensDESCONTOValidate;
        cdsNotas_Entradas_ItensVALORDESCONTO.OnValidate := cdsNotas_Entradas_ItensVALORDESCONTOValidate;
      end;
    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensVALORDESCONTOValidate(Sender: TField);
var
  BaseDesconto: Currency;
  ValorDesconto: Currency;
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      BaseDesconto := cdsNotas_Entradas_ItensTOTAL.AsCurrency;
      ValorDesconto := Sender.AsCurrency;
      if (BaseDesconto > 0) then
      begin
        try
          cdsNotas_Entradas_ItensDESCONTO.OnValidate := Nil;
          cdsNotas_Entradas_ItensVALORDESCONTO.OnValidate := Nil;
          cdsNotas_Entradas_ItensDESCONTO.AsFloat := RoundTo(((ValorDesconto * 100) / BaseDesconto), -2);
          AtualizaValoresItem;
        finally
          cdsNotas_Entradas_ItensDESCONTO.OnValidate := cdsNotas_Entradas_ItensDESCONTOValidate;
          cdsNotas_Entradas_ItensVALORDESCONTO.OnValidate := cdsNotas_Entradas_ItensVALORDESCONTOValidate;
        end;
      end;
    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensREGRAValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      InicializaItem := True;
      AtualizaValoresItem;
    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensIPIValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      InicializaItem := False;
      AtualizaValoresItem;
    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensIRRFValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      InicializaItem := False;
      AtualizaValoresItem;
    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensICMSDIFValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copying then
    begin
      InicializaItem := False;
      AtualizaValoresItem;
    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensICMSValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      InicializaItem := False;
      AtualizaValoresItem;
    end;
  end;
end;

procedure TfrmNotas_Entradas.FormShow(Sender: TObject);
var
  PrecoCusto: TUStringArray;
  Contador: Integer;
begin
  inherited;
  //
  DecimaisUnitario := __SuperClass.DBFunctions.GetParamValue('SV_CASAS_DECIMAIS_UNITARIO_NFE');
  DecimaisQuantidade := __SuperClass.DBFunctions.GetParamValue('SV_CASAS_DECIMAIS_QUANTIDADE');

  try
    PrecoCusto := __SuperClass.GenericsF.Split(__SuperClass.DBFunctions.GetParamValue('SV_NOMES_PRECOS_CUSTOS'), ',');
  except
    SetLength(PrecoCusto, 0);
  end;

  if (Length(PrecoCusto) > 0) and (Length(PrecoCusto) = 10) then
  begin
    dbcboTipoPreco.Items.Clear;
    for Contador := Low(PrecoCusto) to High(PrecoCusto) do
      dbcboTipoPreco.Items.Add(Format('%s=%s', [FormatFloat('00', Contador + 1),
        __SuperClass.GenericsF.UpperFirstChar(PrecoCusto[Contador], ' ')]));
  end;

  pgcResumo.ActivePage := tbsResumo_Valores;

end;

procedure TfrmNotas_Entradas.spdTabelasPrecosClick(Sender: TObject);
var
  AFields: TUStringArray;
  SFields: TUStringArray;
begin
  inherited;
  frmFornecedores_Tabelas := TfrmFornecedores_Tabelas.Create(Self);
  try
    // campos que receberão os dados
    SetLength(AFields, 2);
    AFields[0] := 'TABELA';
    AFields[1] := 'DESCRICAOTABELA';
    // campos que proverão os dados
    SetLength(SFields, 2);
    SFields[0] := 'CODIGO';
    SFields[1] := 'DESCRICAO';
    __SuperClass.DBFunctions.ApplyFieldsInDataSet(frmFornecedores_Tabelas, frmFornecedores_Tabelas.cdsFornecedores_Tabelas_Dados,
      frmFornecedores_Tabelas.dtsFornecedores_Tabelas_Dados, ActivedDataSet, AFields, SFields);
  finally
    FreeAndNil(frmFornecedores_Tabelas);
  END;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_DadosMOEDAValidate(Sender: TField);
const
  Entidade = 'MOEDAS';
var
  Empresa: String;
  Filial: String;
  Campos: String;
  Filtro: String;
  Continua: Boolean;
  Auxiliar: TDataSet;
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      Continua := False;
      if ((Sender.AsString <> '')) then
      begin
        try
          __SuperClass.DBFunctions.GetEntityOwner(Entidade, Empresa, Filial);
          Campos := 'DESCRICAO';
          Filtro := Format('EMPRESA = %s AND FILIAL = %s AND CODIGO = %s', [QuotedStr(Empresa), QuotedStr(Filial),
            QuotedStr(Sender.AsString)]);
          Continua := __SuperClass.GenericsF.RegistroHabilitado(Entidade, Filtro, '');
          if (Continua) then
          begin
            try
              Auxiliar := __SuperClass.DBFunctions.ExecuteQueryByXML(Campos, Entidade, Filtro);
              if Auxiliar.Eof then
                Continua := False
              else
                cdsNotas_Entradas_DadosDESCRICAOMOEDA.AsString := Auxiliar.FieldByName('DESCRICAO').AsString;
              cdsNotas_Entradas_DadosTAXA.AsFloat := __SuperClass.GenericsF.ObtemMoeda(Sender.AsString,
                __SuperClass.User.DataBase);
            finally
              if Assigned(Auxiliar) then
                Auxiliar.Close;
              FreeAndNil(Auxiliar);
            end;
          end;
        except
          on E: Exception do
          begin
            if (Pos('Operation aborted', E.Message) = 0) then
              __SuperClass.GenericsF.DisplayMessage('Falha ao atribuir a moeda.', Format('%s.', [E.Message]),
                'Verifique o valor informado.', 'Informação', MB_ICONEXCLAMATION);
            Continua := False
          end;
        end;
        if (not Continua) then
          Abort;
      end;
    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_DadosTABELAValidate(Sender: TField);
const
  Entidade = 'FORNECEDORES_TABELAS_DADOS';
var
  Empresa: String;
  Filial: String;
  Campos: OleVariant;
  Filtro: String;
  Continua: Boolean;
  Auxiliar: TDataSet;
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      Continua := True;
      if (Sender.AsInteger <> 0) then
      begin
        try
          __SuperClass.DBFunctions.GetEntityOwner(Entidade, Empresa, Filial);
          Campos := VarArrayOf(['DESCRICAO']);
          Filtro := Format('EMPRESA = %s AND FILIAL = %s AND CODIGO = %d', [QuotedStr(Empresa), QuotedStr(Filial),
            Sender.AsInteger]);
          Continua := __SuperClass.GenericsF.RegistroHabilitado(Entidade, Filtro, '');
          if (Continua) then
          begin
            try
              Auxiliar := __SuperClass.DBFunctions.ExecuteQueryByXML(Campos, Entidade, Filtro);
              if Auxiliar.Eof then
              begin
                __SuperClass.GenericsF.DisplayMessage('Tabela de preços não encontrada.', '', 'Verifique o código informado.',
                  'Informação', MB_ICONEXCLAMATION);
                Continua := False;
              end
              else
                cdsNotas_Entradas_DadosDESCRICAOTABELA.AsString := Auxiliar.FieldByName('DESCRICAO').AsString;
            finally
              if Assigned(Auxiliar) then
                Auxiliar.Close;
              FreeAndNil(Auxiliar);
            end;
          end;
        except
          on E: Exception do
            __SuperClass.GenericsF.DisplayMessage('Falha ao pesquisar a tabela de preços.', E.Message,
              'Verifique o valor informado.', 'Informação', MB_ICONEXCLAMATION);
        end;
        if (not Continua) then
          Abort;
      end;
    end;
  end;
end;

procedure TfrmNotas_Entradas.dbedtEmissaoDblClick(Sender: TObject);
begin
  inherited;
  __SuperClass.DBFunctions.ShowCalendar(Self, cdsNotas_Entradas_DadosEMISSAO);
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensUNITARIOALTERNATIVOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  inherited;
  with __SuperClass do
  begin
    if User.HasRuleAccess(urEscondePrecoCusto) then
      Text := GenericsF.HideFieldValue(Sender, DecimaisUnitario, True)
    else
      Text := GenericsF.FormatFloatValue(Sender, DecimaisUnitario, True);
    // if not dbGridItens.Columns[__SuperClass.GenericsF.GetDBGridColumnPos(dbGridItens, Sender.FieldName)].ReadOnly then
    dbgridItens.Columns[GenericsF.GetDBGridColumnPos(dbgridItens, Sender.FieldName)].ReadOnly :=
      not User.HasRuleAccess(urPermiteAlterarPrecoCusto);
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensUNITARIOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  inherited;
  with __SuperClass do
  begin
    if User.HasRuleAccess(urEscondePrecoCusto) then
      Text := GenericsF.HideFieldValue(Sender, DecimaisUnitario, True)
    else
      Text := GenericsF.FormatFloatValue(Sender, DecimaisUnitario, True);
    // if not dbGridItens.Columns[__SuperClass.GenericsF.GetDBGridColumnPos(dbGridItens, Sender.FieldName)].ReadOnly then
    dbgridItens.Columns[GenericsF.GetDBGridColumnPos(dbgridItens, Sender.FieldName)].ReadOnly :=
      not User.HasRuleAccess(urPermiteAlterarPrecoCusto);
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensUNITARIOMOEDAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  inherited;
  with __SuperClass do
  begin
    if User.HasRuleAccess(urEscondePrecoCusto) then
      Text := GenericsF.HideFieldValue(Sender, DecimaisUnitario, True)
    else
      Text := GenericsF.FormatFloatValue(Sender, DecimaisUnitario, True);
    // if not dbGridItens.Columns[__SuperClass.GenericsF.GetDBGridColumnPos(dbGridItens, Sender.FieldName)].ReadOnly then
    dbgridItens.Columns[GenericsF.GetDBGridColumnPos(dbgridItens, Sender.FieldName)].ReadOnly :=
      not User.HasRuleAccess(urPermiteAlterarPrecoCusto);
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensUNITARIOMOEDAValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
      CalculaUnitarioReal;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensUNITARIOORIGINALGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  inherited;
  with __SuperClass do
  begin
    if User.HasRuleAccess(urEscondePrecoCusto) then
      Text := GenericsF.HideFieldValue(Sender, DecimaisUnitario, True)
    else
      Text := GenericsF.FormatFloatValue(Sender, DecimaisUnitario, True);
    // if not dbGridItens.Columns[__SuperClass.GenericsF.GetDBGridColumnPos(dbGridItens, Sender.FieldName)].ReadOnly then
    dbgridItens.Columns[GenericsF.GetDBGridColumnPos(dbgridItens, Sender.FieldName)].ReadOnly :=
      not User.HasRuleAccess(urPermiteAlterarPrecoCusto);
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensUNITARIOORIGINALValidate(Sender: TField);
begin
  inherited;
  cdsNotas_Entradas_ItensUNITARIOALTERNATIVO.AsFloat := cdsNotas_Entradas_ItensUNITARIOORIGINAL.AsFloat -
    cdsNotas_Entradas_ItensUNITARIO.AsFloat;
  cdsNotas_Entradas_ItensVALORALTERNATIVO.AsCurrency := cdsNotas_Entradas_ItensUNITARIOALTERNATIVO.AsFloat *
    cdsNotas_Entradas_ItensQUANTIDADE.AsFloat;
end;

procedure TfrmNotas_Entradas.spdCategoriasClick(Sender: TObject);
var
  AFields: TUStringArray;
  SFields: TUStringArray;
begin
  inherited;
  frmCategorias_Financeiras := TfrmCategorias_Financeiras.Create(Self);
  try
    // campos que receberão os dados
    SetLength(AFields, 2);
    AFields[0] := 'CATEGORIA';
    AFields[1] := 'DESCRICAOCATEGORIA';
    // campos que proverão os dados
    SetLength(SFields, 2);
    SFields[0] := 'CODIGO';
    SFields[1] := 'DESCRICAO';
    __SuperClass.DBFunctions.ApplyFieldsInDataSet(frmCategorias_Financeiras, frmCategorias_Financeiras.cdsCategorias,
      frmCategorias_Financeiras.dtsCategorias, ActivedDataSet, AFields, SFields);
  finally
    FreeAndNil(frmCategorias_Financeiras);
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensDeleteError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  __SuperClass.GenericsF.ShowException(E);
  Action := daAbort;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensEditError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  __SuperClass.GenericsF.ShowException(E);
  Action := daAbort;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensPISAValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      InicializaItem := False;
      AtualizaValoresItem;
    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensPISRValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      InicializaItem := False;
      AtualizaValoresItem;
    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  __SuperClass.GenericsF.ShowException(E);
  Action := daAbort;
end;

procedure TfrmNotas_Entradas.btnImprimir_DANFEClick(Sender: TObject);
var
  IdNFe: ShortString;
  LoteNFe: ShortString;
  PAutorizacaoNFe: ShortString;
  InfAutorizacaoNFe: ShortString;
  ArquivoXML: ShortString;
  Dt: TDateTime;
  Pasta: ShortString;
  Ano, Mes, Dia: Word;
  StreamNFe: TMemoryStream;
begin
  inherited;
  if (cdsNotas_Entradas_DadosLIBERANFE.AsString <> VB_SIM) then
    __SuperClass.GenericsF.DisplayMessage(Format('Documento fiscal sem liberação da SEFAZ de %s.',
      [__SuperClass.User.Branch.State]), '', 'Verifique o protocolo do processamento deste documento fiscal.', 'Informação',
      MB_ICONINFORMATION)
  else
  begin
    IdNFe := cdsNotas_Entradas_DadosIDNFE.AsString;
    LoteNFe := cdsNotas_Entradas_DadosLOTENFE.AsString;
    PAutorizacaoNFe := cdsNotas_Entradas_DadosPAUTORIZACAONFE.AsString;
    InfAutorizacaoNFe := cdsNotas_Entradas_DadosINFAUTORIZACAONFE.AsString;

    if (PAutorizacaoNFe <> '') and (InfAutorizacaoNFe <> '') then
    begin
      Dt := cdsNotas_Entradas_DadosEMISSAO.AsDateTime;
      DecodeDate(Dt, Ano, Mes, Dia);
      Pasta := FormatFloat('0000', Ano) + FormatFloat('00', Mes);

      if FileExists(Format('%s\%s-procNFe.xml', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), IdNFe])) then
        ArquivoXML := Format('%s\%s-procNFe.xml', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), IdNFe])
      else
      begin
        try
          StreamNFe := __SuperClass.GenericsF.LoadRemoteFile(Format('Binary\Client\Nfe\Arquivos\procNFe\%s\', [Pasta]),
            Format('%s-procNFe.xml', [IdNFe]));
          StreamNFe.SaveToFile(Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA),
            Format('%s-procNFe.xml', [IdNFe])]));
          ArquivoXML := Format('%s\%s-procNFe.xml', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), IdNFe]);
        finally
          StreamNFe.Free;
        end;
      end;

    end else if (PAutorizacaoNFe <> '') and (InfAutorizacaoNFe = '') then
    begin
      if FileExists(Format('%s\NFe%s-%s-env-lot.xml', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), IdNFe,
        LoteNFe])) then
        ArquivoXML := Format('%s\NFe%s-%s-env-lot.xml', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA),
          IdNFe, LoteNFe])
      else
      begin
        try
          StreamNFe := __SuperClass.GenericsF.LoadRemoteFile('Binary\Client\Nfe\Arquivos\Assinado\',
            Format('NFe%s-%s-env-lot.xml', [IdNFe, LoteNFe]));
          StreamNFe.SaveToFile(Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA),
            Format('NFe%s-%s-env-lot.xml', [IdNFe, LoteNFe])]));

          ArquivoXML := Format('%s\NFe%s-%s-env-lot.xml', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA),
            IdNFe, LoteNFe]);
        finally
          StreamNFe.Free;
        end;
      end;

    end
    else
      ArquivoXML := '';

    if ArquivoXML = '' then
      __SuperClass.GenericsF.DisplayMessage('Documento fiscal não liberado.', '', 'Verifique a situação do documento.',
        'Informação', MB_ICONEXCLAMATION)
    else
      sysNFE_ImprimeDANFE(ArquivoXML, '', 3, False, '', False);
  end;
end;

procedure TfrmNotas_Entradas.btnPercentualPrecoVendaClick(Sender: TObject);
var
  I: Double;
begin
  inherited;
  I := __SuperClass.GenericsF.InformaValor('% para Preço de Venda', I, False, '#0.00%', '0.00');
  if not(cdsNotas_Entradas_Dados.State in [dsInsert, dsEdit]) then
    cdsNotas_Entradas_Dados.Edit;
  cdsNotas_Entradas_DadosPERCENTUALVENDA.AsFloat := I;
end;

procedure TfrmNotas_Entradas.btnDespesasImportacaoClick(Sender: TObject);
var
  I: Integer;
  DadosDespesas: TUStringArray;
  Reg: TBookMark;
begin
  inherited;

  frmDespesas_Importacao := TfrmDespesas_Importacao.Create(Self);

  with frmDespesas_Importacao do
  begin
    try
      PNota := cdsNotas_Entradas_DadosNUMERO.AsInteger;
      PSerie := cdsNotas_Entradas_DadosPREFIXO.AsString;
      ShowModal;
    finally
      for I := 0 to Length(DadosClassificacao) - 1 do
      begin
        cdsNotas_Entradas_Itens.First;
        while not cdsNotas_Entradas_Itens.Eof do
        begin
          DadosDespesas := __SuperClass.GenericsF.Split(DadosClassificacao[I], '|');
          if (cdsNotas_Entradas_ItensCLASSIFICACAOFISCAL.AsString = DadosDespesas[0]) then
          begin
            cdsNotas_Entradas_Itens.Edit;
            cdsNotas_Entradas_ItensDESPESASIMPORTACAO.AsString := DadosDespesas[1];
            cdsNotas_Entradas_Itens.Post;
          end;
          cdsNotas_Entradas_Itens.Next;
        end;
      end;
      cdsNotas_Entradas_Itens.First;
      FreeAndNil(frmDespesas_Importacao);
    end;
  end;
end;

procedure TfrmNotas_Entradas.Button1Click(Sender: TObject);
var
  CalculaPesoLiquido: function(cds: TClientDataSet): Double;
  Ret: Double;
  cds: TClientDataSet;
begin
  inherited;
  // Verificando se existe a package
  { if (sysGetCustomPackageHandle <> 0) then
    begin
    cds := TClientDataSet.Create(Self);
    cds.RemoteServer := dmEstrutura.AppConnectionBroker;
    cds.ProviderName := 'dspAppPRovider_Dados';
    cds.CommandText := 'SELECT * FROM PRODUTOS WHERE CODIGO = ''STR50103''';
    @CalculaPesoLiquido := GetProcAddress(sysGetCustomPackageHandle, 'CalculaPesoLiquido');
    if Assigned(CalculaPesoLiquido) then
    begin
    Ret := CalculaPesoLiquido(dmEstrutura.AppConnectionBroker);
    showmessage(floattostr(ret));
    end;
    end; }
end;

procedure TfrmNotas_Entradas.btnEnviar_XMLClick(Sender: TObject);
var
  IdNFe: ShortString;
  LoteNFe: ShortString;
  PAutorizacaoNFe: ShortString;
  InfAutorizacaoNFe: ShortString;
  ArquivoXML: ShortString;
  ArquivoPDF: ShortString;
  Assunto: ShortString;
  ListaEmails: TStringList;
  Empresa: String;
  Filial: String;
  Campos: TUStringArray;
  Filtro: String;
  Pessoa: ShortString;
  Fornecedor: ShortString;
  CNPJ: ShortString;
  Emails: OleVariant;
  Msg: TStringList;
  I: Integer;
  Dt: TDateTime;
  Pasta: ShortString;
  Ano, Mes, Dia: Word;
  Auxiliar: TDataSet;
  StreamXML: TMemoryStream;
  StreamPDF: TMemoryStream;
  CaminhoNFe: String;
begin
  inherited;
  if (cdsNotas_Entradas_DadosLIBERANFE.AsString <> VB_SIM) then
    __SuperClass.GenericsF.DisplayMessage(Format('Documento fiscal sem liberação da SEFAZ de %s.',
      [__SuperClass.User.Branch.State]), '', 'Verifique o protocolo do processamento deste documento fiscal.', 'Informação',
      MB_ICONINFORMATION)
  else
  begin
    IdNFe := cdsNotas_Entradas_DadosIDNFE.AsString;
    LoteNFe := cdsNotas_Entradas_DadosLOTENFE.AsString;
    PAutorizacaoNFe := cdsNotas_Entradas_DadosPAUTORIZACAONFE.AsString;
    InfAutorizacaoNFe := cdsNotas_Entradas_DadosINFAUTORIZACAONFE.AsString;
    Dt := cdsNotas_Entradas_DadosEMISSAO.AsDateTime;
    DecodeDate(Dt, Ano, Mes, Dia);
    Pasta := FormatFloat('0000', Ano) + FormatFloat('00', Mes);

    if (Ano <= 2011) and (Mes <= 09) then
      CaminhoNFe := 'Binary\Client\Nfe\Arquivos\procNFe'
    else
      CaminhoNFe := Format('Binary\Client\Nfe\Arquivos\procNFe\%s', [Pasta]);

    if (PAutorizacaoNFe <> '') and (InfAutorizacaoNFe <> '') then
    begin
      if FileExists(Format('%s\%s-procNFe.xml', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), IdNFe])) then
        __SuperClass.GenericsF.DeleteFile(Format('%s\%s-procNFe.xml',
          [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), IdNFe]));
      try
        StreamXML := __SuperClass.GenericsF.LoadRemoteFile(Format('%s\', [CaminhoNFe]), Format('%s-procNFe.xml', [IdNFe]));
        StreamXML.SaveToFile(Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA),
          Format('%s-procNFe.xml', [IdNFe])]));

        ArquivoXML := Format('%s\%s-procNFe.xml', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), IdNFe]);
      finally
        StreamXML.Free;
      end;

      if FileExists(Format('%s\%s-procNFe.pdf', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), IdNFe])) then
        __SuperClass.GenericsF.DeleteFile(Format('%s\%s-procNFe.pdf',
          [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), IdNFe]));
      try
        StreamPDF := __SuperClass.GenericsF.LoadRemoteFile(Format('%s\', [CaminhoNFe]), Format('%s-procNFe.pdf', [IdNFe]));
        StreamPDF.SaveToFile(Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA),
          Format('%s-procNFe.pdf', [IdNFe])]));

        ArquivoPDF := Format('%s\%s-procNFe.pdf', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), IdNFe]);
      finally
        StreamPDF.Free;
      end;
    end else if (PAutorizacaoNFe <> '') and (InfAutorizacaoNFe = '') then
    begin
      if FileExists(Format('%s\NFe%s-%s-env-lot.xml', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), IdNFe,
        LoteNFe])) then
        __SuperClass.GenericsF.DeleteFile(Format('%s\NFe%s-%s-env-lot.xml',
          [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), IdNFe, LoteNFe]));
      try
        StreamXML := __SuperClass.GenericsF.LoadRemoteFile('Binary\Client\NFe\Arquivos\Assinado\',
          Format('NFe%s-%s-env-lot.xml', [IdNFe, LoteNFe]));
        StreamXML.SaveToFile(Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA),
          Format('NFe%s-%s-env-lot.xml', [IdNFe, LoteNFe])]));

        ArquivoXML := Format('%s\NFe%s-%s-env-lot.xml', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), IdNFe,
          LoteNFe]);
      finally
        StreamXML.Free;
      end;

      if FileExists(Format('%s\NFe%s.pdf', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), IdNFe])) then
        __SuperClass.GenericsF.DeleteFile(Format('%s\NFe%s.pdf',
          [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), IdNFe]));
      try
        StreamPDF := __SuperClass.GenericsF.LoadRemoteFile('Binary\Client\NFe\Arquivos\Assinado\', Format('NFe%s.pdf', [IdNFe]));
        StreamPDF.SaveToFile(Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA),
          Format('NFe%s.pdf', [IdNFe])]));

        ArquivoPDF := Format('%s\NFe%s.pdf', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), IdNFe]);
      finally
        StreamPDF.Free;
      end;
    end else begin
      ArquivoXML := '';
      ArquivoPDF := '';
    end;

    ListaEmails := TStringList.Create;
    Msg := TStringList.Create;
    try
      Emails := __SuperClass.GenericsF.ObtemEmails('FORNECEDORES', cdsNotas_Entradas_DadosFORNECEDOR.AsInteger);

      for I := VarArrayLowBound(Emails, 1) to VarArrayHighBound(Emails, 1) do
        if (Emails[I] <> '') then
          ListaEmails.Add(Emails[I]);

      __SuperClass.DBFunctions.GetEntityOwner('FONRECEDORES', Empresa, Filial);
      Campos := __SuperClass.GenericsF.VarArrayOfStr(['PESSOA', 'NOME, CNPJ']);
      Filtro := Format('EMPRESA = %s AND FILIAL = %s AND CODIGO = %d', [QuotedStr(Empresa), QuotedStr(Filial),
        cdsNotas_Entradas_DadosFORNECEDOR.AsInteger]);
      try
        Auxiliar := __SuperClass.DBFunctions.ExecuteQueryByXML(Campos, 'FORNECEDORES', Filtro);
        // qdmEstrutura.AppConnectionBroker.AppServer.sysGetFieldValues('FORNECEDORES', Filtro, Campos);
        if not(Auxiliar.Eof and Auxiliar.Bof) then
        begin
          if Auxiliar.FieldByName('PESSOA').AsString <> '' then
            Pessoa := Auxiliar.FieldByName('PESSOA').AsString
          else
            Pessoa := '';
          if Auxiliar.FieldByName('NOME').AsString <> '' then
            Fornecedor := Auxiliar.FieldByName('NOME').AsString
          else
            Fornecedor := '';
          if Auxiliar.FieldByName('CNPJ').AsString <> '' then
            CNPJ := __SuperClass.GenericsF.IfThen(Pessoa = '0', FormatMaskText('999.999.999-99;0; ',
              Auxiliar.FieldByName('CNPJ').AsString), FormatMaskText('99.999.999/9999-99;0; ',
              Auxiliar.FieldByName('CNPJ').AsString))
          else
            CNPJ := '';
        end else begin
          Pessoa := '';
          Fornecedor := '';
          CNPJ := '';
        end;
      finally
        if Assigned(Auxiliar) then
          Auxiliar.Close;
        FreeAndNil(Auxiliar);
      end;

      if (ListaEmails.Count > 0) then
      begin
        Assunto := Format('Envio de NF-e - [%s]', [IdNFe]);

        Msg := __SuperClass.GenericsF.ObtemHtmlNFe(cdsNotas_Entradas_DadosPREFIXO.AsString,
          cdsNotas_Entradas_DadosNUMERO.AsInteger, Fornecedor, CNPJ, IdNFe, PAutorizacaoNFe, InfAutorizacaoNFe);

        frmSend_Email := TfrmSend_Email.Create(Self);
        try
          with frmSend_Email do
          begin
            ForcaTipoGerenciador := tgProprio;
            MailSubject := Assunto;
            ToList := ListaEmails;
            BodyMsg := Msg;

            InsertAttachment(ArquivoXML);

            InsertAttachment(ArquivoPDF);

            ShowModal;
          end;
        finally
          FreeAndNil(frmSend_Email);
        end;
      end;

    finally
      FreeAndNil(ListaEmails);
      FreeAndNil(Msg);

      __SuperClass.GenericsF.DeleteFile(ArquivoXML);
      __SuperClass.GenericsF.DeleteFile(ArquivoPDF);
    end;
  end;
end;

procedure TfrmNotas_Entradas.btnGerar_PDFClick(Sender: TObject);
var
  IdNFe: ShortString;
  LoteNFe: ShortString;
  PAutorizacaoNFe: ShortString;
  InfAutorizacaoNFe: ShortString;
  ArquivoXML: ShortString;
  ArquivoPDF: ShortString;
  Dt: TDateTime;
  Pasta: ShortString;
  Ano, Mes, Dia: Word;
  StreamXML: TMemoryStream;
  StreamPDF: TMemoryStream;
begin
  inherited;
  if (cdsNotas_Entradas_DadosLIBERANFE.AsString <> VB_SIM) then
    __SuperClass.GenericsF.DisplayMessage(Format('Documento fiscal sem liberação da SEFAZ de %s.',
      [__SuperClass.User.Branch.State]), '', 'Verifique o protocolo do processamento deste documento fiscal.', 'Informação',
      MB_ICONINFORMATION)
  else
  begin
    IdNFe := cdsNotas_Entradas_DadosIDNFE.AsString;
    LoteNFe := cdsNotas_Entradas_DadosLOTENFE.AsString;
    PAutorizacaoNFe := cdsNotas_Entradas_DadosPAUTORIZACAONFE.AsString;
    InfAutorizacaoNFe := cdsNotas_Entradas_DadosINFAUTORIZACAONFE.AsString;

    Dt := cdsNotas_Entradas_DadosEMISSAO.AsDateTime;
    DecodeDate(Dt, Ano, Mes, Dia);
    Pasta := FormatFloat('0000', Ano) + FormatFloat('00', Mes);

    if (PAutorizacaoNFe <> '') and (InfAutorizacaoNFe <> '') then
    begin
      if FileExists(Format('%s\%s-procNFe.xml', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), IdNFe])) then
        ArquivoXML := Format('%s\%s-procNFe.xml', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), IdNFe])
      else
      begin
        try
          StreamXML := __SuperClass.GenericsF.LoadRemoteFile(Format('Binary\Client\Nfe\Arquivos\procNFe\%s\', [Pasta]),
            Format('%s-procNFe.xml', [IdNFe]));
          StreamXML.SaveToFile(Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA),
            Format('%s-procNFe.xml', [IdNFe])]));

          ArquivoXML := Format('%s\%s-procNFe.xml', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), IdNFe]);
        finally
          StreamXML.Free;
        end;
      end;

      ArquivoPDF := Format('%s\%s-procNFe.pdf', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), IdNFe]);
    end else if (PAutorizacaoNFe <> '') and (InfAutorizacaoNFe = '') then
    begin
      if FileExists(Format('%s\NFe%s-%s-env-lot.xml', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), IdNFe,
        LoteNFe])) then
        ArquivoXML := Format('%s\NFe%s-%s-env-lot.xml', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA),
          IdNFe, LoteNFe])
      else
      begin
        try
          StreamXML := __SuperClass.GenericsF.LoadRemoteFile('Binary\Client\Nfe\Arquivos\Assinado\',
            Format('NFe%s-%s-env-lot.xml', [IdNFe, LoteNFe]));
          StreamXML.SaveToFile(Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA),
            Format('NFe%s-%s-env-lot.xml', [IdNFe, LoteNFe])]));

          ArquivoXML := Format('%s\NFe%s-%s-env-lot.xml', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA),
            IdNFe, LoteNFe]);
        finally
          StreamXML.Free;
        end;
      end;

      if FileExists(Format('%s\NFe%s.pdf', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), IdNFe])) then
        ArquivoXML := Format('%s\NFe%s.pdf', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), IdNFe])
      else
      begin
        try
          StreamXML := __SuperClass.GenericsF.LoadRemoteFile('Binary\Client\Nfe\Arquivos\Assinado\',
            Format('NFe%s.pdf', [IdNFe]));
          StreamXML.SaveToFile(Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA),
            Format('NFe%s.pdf', [IdNFe])]));

          ArquivoXML := Format('%s\NFe%s.pdf', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), IdNFe]);
        finally
          StreamXML.Free;
        end;
      end;
    end else begin
      ArquivoXML := '';
      ArquivoPDF := '';
    end;

    if (ArquivoXML = '') or (ArquivoPDF = '') then
      __SuperClass.GenericsF.DisplayMessage('Documento fiscal não liberado.', '', 'Verifique a situação do documento.',
        'Informação', MB_ICONEXCLAMATION)
    else
    begin
      sysNFE_ImprimeDANFE(ArquivoXML, ArquivoPDF, 2, False, '', False);
      if FileExists(Format('%s\%s-procNFe.pdf', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), IdNFe])) then
        __SuperClass.GenericsF.SaveRemoteFile(Format('Binary\Client\NFe\Arquivos\procNFe\', [Pasta]),
          Format('%s\%s-procNFe.pdf', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), IdNFe]));
    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_DadosTAXAValidate(Sender: TField);
var
  Msg: TProgressMsg;
  Reg: TBookMark;
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      Reg := Nil;
      if ((Sender.Value > 0)) then
      begin
        with cdsNotas_Entradas_Itens do
        begin
          try
            __SuperClass.GenericsF.DisplayInformation(itBegin, Msg, '');
            __SuperClass.GenericsF.DisplayInformation(itUpdate, Msg, 'Aguarde, atualizando itens...');
            try
              Reg := GetBookmark;
              DisableControls;
              First;
              while (not Eof) do
              begin
                Edit;
                CalculaUnitarioReal;
                Post;
                Next;
              end;
            finally
              GotoBookMark(Reg);
              FreeBookMark(Reg);
            end;
          finally
            EnableControls;
            __SuperClass.GenericsF.DisplayInformation(itClose, Msg, '');
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_DadosTRANSPORTADORAValidate(Sender: TField);
const
  Entidade = 'TRANSPORTADORAS';
var
  Empresa, Filial: String;
  Campos: TUStringArray;
  Filtro: String;
  Continua: Boolean;
  Auxiliar: TDataSet;
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      Continua := False;

      if ((Sender.AsInteger <> 0)) then
      begin
        try
          __SuperClass.DBFunctions.GetEntityOwner(Entidade, Empresa, Filial);
          Campos := __SuperClass.GenericsF.VarArrayOfStr(['REDUZIDO']);
          Filtro := Format('EMPRESA = %s AND FILIAL = %s AND CODIGO = %d', [QuotedStr(Empresa), QuotedStr(Filial),
            cdsNotas_Entradas_DadosTRANSPORTADORA.AsInteger]);
          Continua := __SuperClass.GenericsF.RegistroHabilitado(Entidade, Filtro, '');

          if (Continua) then
          begin
            try
              Auxiliar := __SuperClass.DBFunctions.ExecuteQueryByXML(Campos, Entidade, Filtro);
              if Auxiliar.Eof then
                Continua := False
              else
                cdsNotas_Entradas_DadosNOMETRANSPORTADORA.AsString := Auxiliar.FieldByName('REDUZIDO').AsString;
            finally
              if Assigned(Auxiliar) then
              begin
                Auxiliar.Close;
                FreeAndNil(Auxiliar);
              end;
            end;
          end;
        except
          on E: Exception do
            __SuperClass.GenericsF.DisplayMessage('Falha ao atribuir a transportadora.', Format('%s.', [E.Message]),
              'Verifique o valor informado.', 'Informação', MB_ICONEXCLAMATION);
        end;

        if (not Continua) then
          Abort;
      end;
    end;
  end;
end;

procedure TfrmNotas_Entradas.CalculaUnitarioReal;
var
  Empresa: String;
  Filial: String;
  Origem: String;
  Valor: Double;
  TaxaPadrao: Double;
begin
  inherited;
  if ((cdsNotas_Entradas_DadosMOEDA.AsString <> '')) then
  begin
    __SuperClass.DBFunctions.GetEntityOwner('MOEDAS', Empresa, Filial);
    Origem := cdsNotas_Entradas_DadosMOEDA.AsString;
    Valor := cdsNotas_Entradas_ItensUNITARIOMOEDA.AsFloat;
    TaxaPadrao := cdsNotas_Entradas_DadosTAXA.AsFloat;
    cdsNotas_Entradas_ItensUNITARIO.AsFloat := __SuperClass.GenericsF.ConverteMoeda(Valor, Origem,
      __SuperClass.GenericsF.ObtemMoedaPaisOrigem, __SuperClass.User.DataBase, TaxaPadrao, 0);
  end;
end;

function TfrmNotas_Entradas.CancelaNFe: TNFeStatusCancelamento;
begin
  Result := scNenhum;
  frmNFe_Cancelamento := TfrmNFe_Cancelamento.Create(Self);
  try
    frmNFe_Cancelamento.IdNFe := cdsNotas_Entradas_DadosIDNFE.AsString;
    frmNFe_Cancelamento.PAutorizacaoNFe := cdsNotas_Entradas_DadosPAUTORIZACAONFE.AsString;
    if (frmNFe_Cancelamento.ShowModal = mrOk) then
      Result := frmNFe_Cancelamento.NFeStatusCancelamento;
  finally
    FreeAndNil(frmNFe_Cancelamento);
  end;
end;

procedure TfrmNotas_Entradas.CarregaImpostos;
begin
  with cdsImpostos do
    try
      DisableControls;
      EmptyDataSet;

      if ((cdsNotas_Entradas_DadosBASEIPI.AsCurrency > 0) and (cdsNotas_Entradas_DadosVALORIPI.AsCurrency > 0)) then
      begin
        Insert;
        cdsImpostosID.AsInteger := 1;
        cdsImpostosIMPOSTO.AsString := 'IPI';
        cdsImpostosBASE.AsCurrency := cdsNotas_Entradas_DadosBASEIPI.AsCurrency;
        cdsImpostosVALOR.AsCurrency := cdsNotas_Entradas_DadosVALORIPI.AsCurrency;
        Post;
      end;

      if ((cdsNotas_Entradas_DadosBASEICMSDIF.AsCurrency > 0) and (cdsNotas_Entradas_DadosVALORICMSDIF.AsCurrency > 0)) then
      begin
        Insert;
        cdsImpostosID.AsInteger := 2;
        cdsImpostosIMPOSTO.AsString := 'ICMS por Diferimento';
        cdsImpostosBASE.AsCurrency := cdsNotas_Entradas_DadosBASEICMSDIF.AsCurrency;
        cdsImpostosVALOR.AsCurrency := cdsNotas_Entradas_DadosVALORICMSDIF.AsCurrency;
        Post;
      end;

      if ((cdsNotas_Entradas_DadosBASEICMS.AsCurrency > 0) and (cdsNotas_Entradas_DadosVALORICMS.AsCurrency > 0)) then
      begin
        Insert;
        cdsImpostosID.AsInteger := 3;
        cdsImpostosIMPOSTO.AsString := 'ICMS';
        cdsImpostosBASE.AsCurrency := cdsNotas_Entradas_DadosBASEICMS.AsCurrency;
        cdsImpostosVALOR.AsCurrency := cdsNotas_Entradas_DadosVALORICMS.AsCurrency;
        Post;
      end;

      if ((cdsNotas_Entradas_DadosBASEICMSFCP.AsCurrency > 0) and (cdsNotas_Entradas_DadosVALORICMSFCP.AsCurrency > 0)) then
      begin
        Insert;
        cdsImpostosID.AsInteger := 4;
        cdsImpostosIMPOSTO.AsString := 'ICMS Relativo ao FCP';
        cdsImpostosBASE.AsCurrency := cdsNotas_Entradas_DadosBASEICMSFCP.AsCurrency;
        cdsImpostosVALOR.AsCurrency := cdsNotas_Entradas_DadosVALORICMSFCP.AsCurrency;
        Post;
      end;

      if ((cdsNotas_Entradas_DadosBASEICMSPUFD.AsCurrency > 0) and (cdsNotas_Entradas_DadosVALORICMSPUFD.AsCurrency > 0)) then
      begin
        Insert;
        cdsImpostosID.AsInteger := 5;
        cdsImpostosIMPOSTO.AsString := Format('ICMS Partilha UF Destino - Relativo ao Ano de %s',
          [FormatDateTime('yyyy', __SuperClass.User.DataBase)]);
        cdsImpostosBASE.AsCurrency := cdsNotas_Entradas_DadosBASEICMSPUFD.AsCurrency;
        cdsImpostosVALOR.AsCurrency := cdsNotas_Entradas_DadosVALORICMSPUFD.AsCurrency;
        Post;
      end;

      if ((cdsNotas_Entradas_DadosBASEICMSPUFO.AsCurrency > 0) and (cdsNotas_Entradas_DadosVALORICMSPUFO.AsCurrency > 0)) then
      begin
        Insert;
        cdsImpostosID.AsInteger := 6;
        cdsImpostosIMPOSTO.AsString := Format('ICMS Partilha UF Origem - Relativo ao Ano de %s',
          [FormatDateTime('yyyy', __SuperClass.User.DataBase)]);
        cdsImpostosBASE.AsCurrency := cdsNotas_Entradas_DadosBASEICMSPUFO.AsCurrency;
        cdsImpostosVALOR.AsCurrency := cdsNotas_Entradas_DadosVALORICMSPUFO.AsCurrency;
        Post;
      end;

      if ((cdsNotas_Entradas_DadosBASEICMSST.AsCurrency > 0) and (cdsNotas_Entradas_DadosVALORICMSST.AsCurrency > 0)) then
      begin
        Insert;
        cdsImpostosID.AsInteger := 7;
        cdsImpostosIMPOSTO.AsString := 'ICMS - Retido Sobre Substituição Tributária';
        cdsImpostosBASE.AsCurrency := cdsNotas_Entradas_DadosBASEICMSST.AsCurrency;
        cdsImpostosVALOR.AsCurrency := cdsNotas_Entradas_DadosVALORICMSST.AsCurrency;
        Post;
      end;

      if ((cdsNotas_Entradas_DadosBASEISSA.AsCurrency > 0) and (cdsNotas_Entradas_DadosVALORISSA.AsCurrency > 0)) then
      begin
        Insert;
        cdsImpostosID.AsInteger := 8;
        cdsImpostosIMPOSTO.AsString := 'ISS - Sem Retenção';
        cdsImpostosBASE.AsCurrency := cdsNotas_Entradas_DadosBASEISSA.AsCurrency;
        cdsImpostosVALOR.AsCurrency := cdsNotas_Entradas_DadosVALORISSA.AsCurrency;
        Post;
      end;

      if ((cdsNotas_Entradas_DadosBASEISSR.AsCurrency > 0) and (cdsNotas_Entradas_DadosVALORISSR.AsCurrency > 0)) then
      begin
        Insert;
        cdsImpostosID.AsInteger := 9;
        cdsImpostosIMPOSTO.AsString := 'ISS - Com Retenção (Retido na Emissão)';
        cdsImpostosBASE.AsCurrency := cdsNotas_Entradas_DadosBASEISSR.AsCurrency;
        cdsImpostosVALOR.AsCurrency := cdsNotas_Entradas_DadosVALORISSR.AsCurrency;
        Post;
      end;

      if ((cdsNotas_Entradas_DadosBASEPISA.AsCurrency > 0) and (cdsNotas_Entradas_DadosVALORPISA.AsCurrency > 0)) then
      begin
        Insert;
        cdsImpostosID.AsInteger := 10;
        cdsImpostosIMPOSTO.AsString := 'PIS - Apuração';
        cdsImpostosBASE.AsFloat := cdsNotas_Entradas_DadosBASEPISA.AsFloat;
        cdsImpostosVALOR.AsCurrency := cdsNotas_Entradas_DadosVALORPISA.AsCurrency;
        Post;
      end;

      if ((cdsNotas_Entradas_DadosBASECOFINSA.AsCurrency > 0) and (cdsNotas_Entradas_DadosVALORCOFINSA.AsCurrency > 0)) then
      begin
        Insert;
        cdsImpostosID.AsInteger := 11;
        cdsImpostosIMPOSTO.AsString := 'COFINS - Apuração';
        cdsImpostosBASE.AsCurrency := cdsNotas_Entradas_DadosBASECOFINSA.AsCurrency;
        cdsImpostosVALOR.AsCurrency := cdsNotas_Entradas_DadosVALORCOFINSA.AsCurrency;
        Post;
      end;

      if ((cdsNotas_Entradas_DadosBASEPISR.AsCurrency > 0) and (cdsNotas_Entradas_DadosVALORPISR.AsCurrency > 0)) then
      begin
        Insert;
        cdsImpostosID.AsInteger := 12;
        cdsImpostosIMPOSTO.AsString := 'PIS - Com Retenção (Retido na Baixa)';
        cdsImpostosBASE.AsCurrency := cdsNotas_Entradas_DadosBASEPISR.AsCurrency;
        cdsImpostosVALOR.AsCurrency := cdsNotas_Entradas_DadosVALORPISR.AsCurrency;
        Post;
      end;

      if ((cdsNotas_Entradas_DadosBASECOFINSR.AsCurrency > 0) and (cdsNotas_Entradas_DadosVALORCOFINSR.AsCurrency > 0)) then
      begin
        Insert;
        cdsImpostosID.AsInteger := 13;
        cdsImpostosIMPOSTO.AsString := 'COFINS - Com Retenção (Retido na Baixa)';
        cdsImpostosBASE.AsCurrency := cdsNotas_Entradas_DadosBASECOFINSR.AsCurrency;
        cdsImpostosVALOR.AsCurrency := cdsNotas_Entradas_DadosVALORCOFINSR.AsCurrency;
        Post;
      end;

      if ((cdsNotas_Entradas_DadosBASECSLLR.AsCurrency > 0) and (cdsNotas_Entradas_DadosVALORCSLLR.AsCurrency > 0)) then
      begin
        Insert;
        cdsImpostosID.AsInteger := 14;
        cdsImpostosIMPOSTO.AsString := 'CSLL - Com Retenção (Retido na Baixa)';
        cdsImpostosBASE.AsCurrency := cdsNotas_Entradas_DadosBASECSLLR.AsCurrency;
        cdsImpostosVALOR.AsCurrency := cdsNotas_Entradas_DadosVALORCSLLR.AsCurrency;
        Post;
      end;

      if ((cdsNotas_Entradas_DadosBASEINSSA.AsCurrency > 0) and (cdsNotas_Entradas_DadosVALORINSSA.AsCurrency > 0)) then
      begin
        Insert;
        cdsImpostosID.AsInteger := 15;
        cdsImpostosIMPOSTO.AsString := 'INSS - Sem Retenção';
        cdsImpostosBASE.AsCurrency := cdsNotas_Entradas_DadosBASEINSSA.AsCurrency;
        cdsImpostosVALOR.AsCurrency := cdsNotas_Entradas_DadosVALORINSSA.AsCurrency;
        Post;
      end;

      if ((cdsNotas_Entradas_DadosBASEINSSR.AsCurrency > 0) and (cdsNotas_Entradas_DadosVALORINSSR.AsCurrency > 0)) then
      begin
        Insert;
        cdsImpostosID.AsInteger := 16;
        cdsImpostosIMPOSTO.AsString := 'INSS - Com Retenção (Retido na Emissão)';
        cdsImpostosBASE.AsCurrency := cdsNotas_Entradas_DadosBASEINSSR.AsCurrency;
        cdsImpostosVALOR.AsCurrency := cdsNotas_Entradas_DadosVALORINSSR.AsCurrency;
        Post;
      end;

      if ((cdsNotas_Entradas_DadosBASEIRRFA.AsCurrency > 0) and (cdsNotas_Entradas_DadosVALORIRRFA.AsCurrency > 0)) then
      begin
        Insert;
        cdsImpostosID.AsInteger := 17;
        cdsImpostosIMPOSTO.AsString := 'IRRF - Sem Retenção';
        cdsImpostosBASE.AsCurrency := cdsNotas_Entradas_DadosBASEIRRFA.AsCurrency;
        cdsImpostosVALOR.AsCurrency := cdsNotas_Entradas_DadosVALORIRRFA.AsCurrency;
        Post;
      end;

      if ((cdsNotas_Entradas_DadosBASEIRRFR.AsCurrency > 0) and (cdsNotas_Entradas_DadosVALORIRRFR.AsCurrency > 0)) then
      begin
        Insert;
        cdsImpostosID.AsInteger := 18;
        cdsImpostosIMPOSTO.AsString := 'IRRF - Com Retenção (Retido na Emissão)';
        cdsImpostosBASE.AsCurrency := cdsNotas_Entradas_DadosBASEIRRFR.AsCurrency;
        cdsImpostosVALOR.AsCurrency := cdsNotas_Entradas_DadosVALORIRRFR.AsCurrency;
        Post;
      end;

      if ((cdsNotas_Entradas_DadosBASEFGTS.AsCurrency > 0) and (cdsNotas_Entradas_DadosVALORFGTS.AsCurrency > 0)) then
      begin
        Insert;
        cdsImpostosID.AsInteger := 19;
        cdsImpostosIMPOSTO.AsString := 'FGTS - Sem Retenção';
        cdsImpostosBASE.AsCurrency := cdsNotas_Entradas_DadosBASEIRRFR.AsCurrency;
        cdsImpostosVALOR.AsCurrency := cdsNotas_Entradas_DadosVALORIRRFR.AsCurrency;
        Post;
      end;

      if ((cdsNotas_Entradas_DadosBASEII.AsCurrency > 0) and (cdsNotas_Entradas_DadosVALORII.AsCurrency > 0)) then
      begin
        Insert;
        cdsImpostosID.AsInteger := 20;
        cdsImpostosIMPOSTO.AsString := 'II - Sem Retenção';
        cdsImpostosBASE.AsCurrency := cdsNotas_Entradas_DadosBASEII.AsCurrency;
        cdsImpostosVALOR.AsCurrency := cdsNotas_Entradas_DadosVALORII.AsCurrency;
        Post;
      end;

      if ((cdsNotas_Entradas_DadosBASETRIBUTOS.AsCurrency > 0) and (cdsNotas_Entradas_DadosVALORTRIBUTOS.AsCurrency > 0)) then
      begin
        Insert;
        cdsImpostosID.AsInteger := 32;
        cdsImpostosIMPOSTO.AsString := 'Valor Aproximado dos Tributos';
        cdsImpostosBASE.AsCurrency := cdsNotas_Entradas_DadosBASETRIBUTOS.AsCurrency;
        cdsImpostosVALOR.AsCurrency := cdsNotas_Entradas_DadosVALORTRIBUTOS.AsCurrency;
        Post;
      end;

    finally
      First;
      EnableControls;
    end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensPRIMEIRAUNIDADEValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      if ((Sender.Value <> '')) then
        if not __SuperClass.GenericsF.CheckValueInList(Sender.Value, TL_UNIDADES_MEDIDAS) then
          Sender.Value := ''
    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensLOCALValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      if ((Sender.Value <> '')) then
        if not __SuperClass.GenericsF.CheckValueInList(Sender.Value, TL_LOCAIS_ARMAZENAGEM) then
          Sender.Value := ''
    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensMARGEMLUCROValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      InicializaItem := False;
      AtualizaValoresItem;
    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_DadosDESCONTOValidate(Sender: TField);
var
  BaseDesconto: Currency;
  Percentual: Single;
  ValorDesconto: Currency;
  Aborta: Boolean;
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      Aborta := False;
      if (cdsNotas_Entradas_DadosVALORMERCADORIAS.AsCurrency > 0) then
      begin
        if (Sender.AsFloat >= 100) then
        begin
          __SuperClass.GenericsF.DisplayMessage('O Valor do desconto não pode ser maior ou igual ao valor do pedido de venda.',
            '', 'Informe um valor inferior ao total do pedido de venda.', 'Informação', MB_ICONEXCLAMATION);
          Aborta := True;
        end else begin
          try
            cdsNotas_Entradas_DadosDESCONTO.OnValidate := Nil;
            cdsNotas_Entradas_DadosVALORDESCONTO.OnValidate := Nil;
            BaseDesconto := cdsNotas_Entradas_DadosVALORMERCADORIAS.AsCurrency;
            Percentual := Sender.AsFloat;
            ValorDesconto := RoundTo(((BaseDesconto * Percentual) * 0.01), -2);
            cdsNotas_Entradas_DadosVALORDESCONTO.AsCurrency := ValorDesconto;
            AtribuiRateioItens('VALORDESCONTO', ValorDesconto);
            AtualizaTotais;
          finally
            cdsNotas_Entradas_DadosDESCONTO.OnValidate := cdsNotas_Entradas_DadosDESCONTOValidate;
            cdsNotas_Entradas_DadosVALORDESCONTO.OnValidate := cdsNotas_Entradas_DadosVALORDESCONTOValidate;
          end;
        end;
        if (Aborta) then
          Abort;
      end;
    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_DadosVALORDESCONTOValidate(Sender: TField);
var
  BaseDesconto: Currency;
  ValorDesconto: Currency;
  Percentual: Single;
  Aborta: Boolean;
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      Aborta := False;
      if ((Sender.AsCurrency > 0) and (Sender.AsCurrency >= cdsNotas_Entradas_DadosVALORMERCADORIAS.AsCurrency)) then
      begin
        __SuperClass.GenericsF.DisplayMessage('O Valor do desconto não pode ser maior ou igual ao valor do pedido de venda.', '',
          'Informe um valor inferior ao total do pedido de venda.', 'Informação', MB_ICONEXCLAMATION);
        Aborta := True;
      end else begin
        BaseDesconto := cdsNotas_Entradas_DadosVALORMERCADORIAS.AsCurrency;
        Percentual := 0;
        ValorDesconto := Sender.AsCurrency;
        try
          cdsNotas_Entradas_DadosDESCONTO.OnValidate := Nil;
          cdsNotas_Entradas_DadosVALORDESCONTO.OnValidate := Nil;
          if (BaseDesconto > 0) then
            Percentual := RoundTo(((ValorDesconto * 100) / BaseDesconto), -2);
          cdsNotas_Entradas_DadosDESCONTO.AsFloat := Percentual;
          AtribuiRateioItens('VALORDESCONTO', ValorDesconto);
          AtualizaTotais;
        finally
          cdsNotas_Entradas_DadosDESCONTO.OnValidate := cdsNotas_Entradas_DadosDESCONTOValidate;
          cdsNotas_Entradas_DadosVALORDESCONTO.OnValidate := cdsNotas_Entradas_DadosVALORDESCONTOValidate;
        end;
      end;
      if (Aborta) then
        Abort;
    end;
  end;

end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_DadosVALORFRETEValidate(Sender: TField);
var
  ValorFrete: Currency;
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      ValorFrete := Sender.AsCurrency;
      try
        cdsNotas_Entradas_DadosVALORFRETE.OnValidate := Nil;
        AtribuiRateioItens('VALORFRETE', ValorFrete);
        AtualizaTotais;
      finally
        cdsNotas_Entradas_DadosVALORFRETE.OnValidate := cdsNotas_Entradas_DadosVALORFRETEValidate;
      end;
    end;
  end;

end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_DadosVALORSEGUROValidate(Sender: TField);
var
  ValorSeguro: Currency;
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      ValorSeguro := Sender.AsCurrency;
      try
        cdsNotas_Entradas_DadosVALORSEGURO.OnValidate := Nil;
        AtribuiRateioItens('VALORSEGURO', ValorSeguro);
        AtualizaTotais;
      finally
        cdsNotas_Entradas_DadosVALORSEGURO.OnValidate := cdsNotas_Entradas_DadosVALORSEGUROValidate;
      end;
    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_DadosVALORDESPESASValidate(Sender: TField);
var
  ValorDespesas: Currency;
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      ValorDespesas := Sender.AsCurrency;
      try
        cdsNotas_Entradas_DadosVALORDESPESAS.OnValidate := Nil;
        AtribuiRateioItens('VALORDESPESAS', ValorDespesas);
        AtualizaTotais;
      finally
        cdsNotas_Entradas_DadosVALORDESPESAS.OnValidate := cdsNotas_Entradas_DadosVALORDESPESASValidate;
      end;
    end;
  end;
end;

procedure TfrmNotas_Entradas.actImportar_XMLExecute(Sender: TObject);
var
  Empresa, EmpresaProduto: String;
  Filial, FilialProduto: String;
  CNPJ: String;
  Doc: TXMLDocument;
  Child, Ide, ChildSec, ChildTemp: IXMLNode;
  Dados: string;

  // Itens
  Produto: string;
  DescricaoProduto: string;
  UnitarioProduto: Double;
  QuantidadeProduto: Double;
  TotalProduto: Double;
  DescontoProduto: Double;

  // Totais
  ValorICMS: string;
  BCST: string;
  ST: string;
  ValorMercadoria: string;
  Frete: string;
  Seguro: string;
  Desconto: string;
  II: string;
  IPI: string;
  PIS: string;
  COFINS: string;
  Outros: string;
  NF: string;

  // Transportadora
  modFrete: string;
  Volume: string;
  PesoLiquido: string;
  PesoBruto: string;

  Campos: TUStringArray;
  Filtro: string;
  Auxiliar: TDataSet;
  Continua: String;
  Aux: string;
  I: Integer;
  J: Integer;
  SQL: string;

  CProd: string;

  NumNota: String;
  SerieNota: String;
begin
  inherited;
  try
    OpenDialog.InitialDir := 'C:\';

    if OpenDialog.Execute then
    begin
      Doc := TXMLDocument.Create(Self);
      Doc.LoadFromFile(OpenDialog.FileName);

      with cdsNotas_Entradas_Dados do
      begin
        Insert;

        __SuperClass.DBFunctions.GetEntityOwner('NOTAS_ENTRADAS_DADOS', Empresa, Filial);

        cdsNotas_Entradas_DadosEMPRESA.AsString := Empresa;
        cdsNotas_Entradas_DadosFILIAL.AsString := Filial;
        cdsNotas_Entradas_DadosFORMULARIOPROPRIO.AsString := VB_NAO;
        cdsNotas_Entradas_DadosEMISSAO.AsDateTime := __SuperClass.User.DataBase;
        cdsNotas_Entradas_DadosTIPOFRETE.AsString := TF_CIF;
        cdsNotas_Entradas_DadosDIGITACAO.AsDateTime := __SuperClass.User.DataBase;
        cdsNotas_Entradas_DadosDSAIDA.AsDateTime := __SuperClass.User.DataBase;
        cdsNotas_Entradas_DadosHSAIDA.AsString := FormatDateTime('hhmmss', __SuperClass.User.DataBase);
        cdsNotas_Entradas_DadosDATACRIACAO.AsDateTime := __SuperClass.ServerDateTime;
        cdsNotas_Entradas_DadosHORA.AsString := cdsNotas_Entradas_DadosHSAIDA.AsString;
        cdsNotas_Entradas_DadosHSAIDA.AsString := FormatDateTime('hhmmss', __SuperClass.User.DataBase);

        DI.Numero := '';
        DI.Data := __SuperClass.User.DataBase;
        DI.LocalDesembaraco := '';
        DI.UFDesembaraco := '';
        DI.DataDesembaraco := __SuperClass.User.DataBase;
        DI.Exportador := '';
        DI.Adicao.Adicao := '';
        DI.Adicao.Sequencia := '';
        DI.Fabricante := '';
        DI.Desconto := 0;
        DI.ViaTransporte := '';
        DI.TipoIntermediacao := '';

        Child := Doc.DocumentElement.ChildNodes.First;
        Child := Child.ChildNodes.FindNode('infNFe');

        // ** Dados
        Ide := Child.ChildNodes.FindNode('ide');
        // NumNota   := Ide.ChildValues['cNF'];
        NumNota := Ide.ChildValues['nNF'];
        SerieNota := Ide.ChildValues['serie'];
        // cdsNotas_Entradas_DadosNUMERO.AsInteger := Random(9999999999);
        cdsNotas_Entradas_DadosNUMERO.AsString := NumNota;
        cdsNotas_Entradas_DadosPREFIXO.AsString := SerieNota;

        HabilitaIdNota(True);

        cdsNotas_Entradas_DadosCATEGORIA.AsString := __SuperClass.DBFunctions.GetParamValue('SV_CATEGORIA_FINANCEIRA_XML');
        cdsNotas_Entradas_DadosESPECIEDOCUMENTO.AsString := __SuperClass.DBFunctions.GetParamValue('SV_ESPECIE_DOCUMENTO_XML');
        cdsNotas_Entradas_DadosCONDICAOPAGAMENTO.AsInteger := __SuperClass.DBFunctions.GetParamValue('SV_CONDICAO_PAGAMENTO_XML');
        cdsNotas_Entradas_DadosTIPOPRECO.AsString := __SuperClass.DBFunctions.GetParamValue('SV_TIPO_PRECO_XML');

        // ** Fornecedor
        Child := Child.ChildNodes.FindNode('emit');

        for I := 0 to Child.ChildNodes.Count - 1 do
        begin
          if Child <> Nil then
          begin
            Aux := (Child.ChildValues['CNPJ']);
            CNPJ := (Child.ChildValues['CNPJ']);
            try
              // Consulta Fornecedor
              __SuperClass.DBFunctions.GetEntityOwner('FORNECEDORES', Empresa, Filial);
              Campos := __SuperClass.GenericsF.VarArrayOfStr(['CODIGO', 'NOME, UF']);
              Filtro := Format('EMPRESA = %s AND FILIAL = %s AND CNPJ = %s', [QuotedStr(Empresa), QuotedStr(Filial),
                QuotedStr(Aux)]);

              Auxiliar := __SuperClass.DBFunctions.ExecuteQueryByXML(Campos, 'FORNECEDORES', Filtro);

              if not(Auxiliar.Eof and Auxiliar.Bof) then
              begin
                if Auxiliar.FieldByName('CODIGO').AsInteger <> Null then
                  cdsNotas_Entradas_DadosFORNECEDOR.AsInteger := Auxiliar.FieldByName('CODIGO').AsInteger
                else
                  cdsNotas_Entradas_DadosFORNECEDOR.AsInteger := 0;

                if Auxiliar.FieldByName('NOME').AsString <> '' then
                  cdsNotas_Entradas_DadosNOMEFORNECEDOR.AsString := Auxiliar.FieldByName('NOME').AsString
                else
                  cdsNotas_Entradas_DadosNOMEFORNECEDOR.AsString := '';
              end else begin
                // Gera fornecedor referente ao xml
                __SuperClass.DBFunctions.OpenDataSet(cdsFornecedor, False, False, -1);

                cdsFornecedor.Insert;

                cdsFornecedorEMPRESA.AsString := Empresa;
                cdsFornecedorFILIAL.AsString := Filial;
                cdsFornecedorSTATUS.AsString := '0';
                cdsFornecedorCODIGO.AsInteger := 999999999;
                cdsFornecedorDATACADASTRO.AsDateTime := __SuperClass.ServerDateTime;
                cdsFornecedorPESSOA.AsString := '1';
                cdsFornecedorDATACRIACAO.AsDateTime := __SuperClass.ServerDateTime;

                cdsFornecedorNOME.AsString := (Child.ChildValues['xNome']);
                if Assigned(Child.ChildNodes.FindNode('xFant')) then
                  cdsFornecedorREDUZIDO.AsString := (Child.ChildValues['xFant'])
                else
                  cdsFornecedorREDUZIDO.AsString := (Child.ChildValues['xNome']);

                cdsFornecedorIE.AsString := (Child.ChildValues['IE']);
                cdsFornecedorCNPJ.AsString := (Child.ChildValues['CNPJ']);

                Child := Child.ChildNodes.FindNode('enderEmit');

                cdsFornecedorENDERECO.AsString := (Child.ChildValues['xLgr']);
                cdsFornecedorNUMERO.AsString := (Child.ChildValues['nro']);
                cdsFornecedorBAIRRO.AsString := (Child.ChildValues['xBairro']);
                cdsFornecedorCMUNICIPIO.AsString := (Child.ChildValues['cMun']);
                cdsFornecedorMUNICIPIO.AsString := (Child.ChildValues['xMun']);
                cdsFornecedorUF.AsString := (Child.ChildValues['UF']);
                cdsFornecedorCEP.AsString := (Child.ChildValues['CEP']);
                cdsFornecedorCPAIS.AsString := (Child.ChildValues['cPais']);
                cdsFornecedorNPAIS.AsString := (Child.ChildValues['xPais']);
                cdsFornecedorTELEFONE.AsString := (Child.ChildValues['fone']);

                cdsFornecedor.Post;

                __SuperClass.DBFunctions.dbApply(cdsFornecedor);

                cdsNotas_Entradas_DadosFORNECEDOR.AsInteger := cdsFornecedorCODIGO.AsInteger;
                cdsNotas_Entradas_DadosNOMEFORNECEDOR.AsString := cdsFornecedorNOME.AsString;
                cdsNotas_Entradas_DadosUF.AsString := cdsFornecedorUF.AsString;

                cdsNotas_Entradas_Dados.Post;

                __SuperClass.DBFunctions.CloseDataSet(cdsFornecedor);
                __SuperClass.GenericsF.DisplayMessage('Fornecedor não encontrado', '',
                  'Novo fornecedor cadastrado: ' + cdsNotas_Entradas_DadosFORNECEDOR.AsString, 'Validação do Forcenecedor',
                  MB_ICONINFORMATION);
              end;
            finally
              if Assigned(Auxiliar) then
                Auxiliar.Close;
              FreeAndNil(Auxiliar);
            end;

            Break;
          end;
        end;

        // ** Itens
        Child := Doc.DocumentElement.ChildNodes.First;
        Child := Child.ChildNodes.FindNode('infNFe');
        Child := Child.ChildNodes.FindNode('det');

        J := 0;

        repeat
          ChildSec := Child.ChildNodes.First;

          if ChildSec.ChildValues['cProd'] <> Null then
          begin
            with cdsNotas_Entradas_Itens do
            begin
              Insert;

              Inc(J);

              cdsNotas_Entradas_ItensEMPRESA.AsString := cdsNotas_Entradas_DadosEMPRESA.AsString;
              cdsNotas_Entradas_ItensFILIAL.AsString := cdsNotas_Entradas_DadosFILIAL.AsString;
              cdsNotas_Entradas_ItensNUMERO.AsInteger := cdsNotas_Entradas_DadosNUMERO.AsInteger;
              cdsNotas_Entradas_ItensITEM.AsInteger := J;

              cdsProduto_Fornecedor.Params.ParamByName('PRODUTO').AsString := (ChildSec.ChildValues['cProd']);
              cdsProduto_Fornecedor.Params.ParamByName('CNPJ').AsString := CNPJ;

              cdsProduto_Fornecedor.Open;
              Aux := cdsProduto_FornecedorPRODUTO.AsString;

              if not(cdsProduto_Fornecedor.Eof and cdsProduto_Fornecedor.Bof) then
              begin
                // Código Produto
                cdsNotas_Entradas_ItensPRODUTO.AsString := cdsProduto_FornecedorPRODUTO.AsString; // Aux;

                // Desabilitar a validação da regra para evitar erros, já que a regra será reinformada
                cdsNotas_Entradas_ItensREGRA.OnValidate := nil;

                // Descrição
                Aux := PegaDescricaoProduto(cdsNotas_Entradas_ItensPRODUTO.AsString); // (ChildSec.ChildValues['xProd']);
                // ShowMessage(Aux);
                cdsNotas_Entradas_ItensDESCRICAO.AsString := Aux;

                // Quantidade
                Aux := (ChildSec.ChildValues['qCom']);
                cdsNotas_Entradas_ItensQUANTIDADE.AsFloat :=
                  StrToFloat(StringReplace(Aux, '.', ',', [rfReplaceAll, rfIgnoreCase]));

                // Unitário
                Aux := (ChildSec.ChildValues['vUnCom']);
                cdsNotas_Entradas_ItensUNITARIO.AsCurrency :=
                  StrToFloat(StringReplace(Aux, '.', ',', [rfReplaceAll, rfIgnoreCase]));

                // Total
                Aux := (ChildSec.ChildValues['vProd']);
                cdsNotas_Entradas_ItensTOTAL.AsCurrency := StrToFloat(StringReplace(Aux, '.', ',', [rfReplaceAll, rfIgnoreCase]));

                // Habilitando novamente a validação da regra
                cdsNotas_Entradas_ItensREGRA.OnValidate := cdsNotas_Entradas_ItensREGRAValidate;

                // Regra
                cdsNotas_Entradas_ItensREGRA.AsInteger := __SuperClass.DBFunctions.GetParamValue('SV_REGRA_XML');

                Post;

                cdsProduto_Fornecedor.Close;
              end else begin
                cdsNotas_Entradas_Dados.Cancel;
                cdsNotas_Entradas_Itens.Cancel;

                cdsProduto_Fornecedor.Close;

                Raise Exception.CreateFmt('%s', ['Produto não cadastrado na rotina de fornecedores: ' + ChildSec.ChildValues
                  ['cProd'] + #13#13 + '     O processo será abortado!']);
                // __SuperClass.GenericsF.DisplayMessage('Produto não cadastrado na rotina de fornecedores: ' + ChildSec.ChildValues['cProd'] + #13#13 + '     O processo será abortado!',  '', 'Entre no cadastro de fornecedores, na aba produtos e cadastre o produto do fornecedor.', '', MB_ICONERROR);
              end;
            end;
          end;

          Child := Child.NextSibling;

        until Child = nil;

        // ** Totais
        Child := Doc.DocumentElement.ChildNodes.First;
        Child := Child.ChildNodes.FindNode('infNFe');
        Child := Child.ChildNodes.FindNode('total');
        Child := Child.ChildNodes.FindNode('ICMSTot');

        ValorMercadoria := (Child.ChildValues['vProd']);
        cdsNotas_Entradas_DadosVALORMERCADORIAS.AsCurrency :=
          StrToFloat(StringReplace(ValorMercadoria, '.', ',', [rfReplaceAll, rfIgnoreCase]));

        Frete := (Child.ChildValues['vFrete']);
        cdsNotas_Entradas_DadosVALORFRETE.AsCurrency := StrToFloat(StringReplace(Frete, '.', ',', [rfReplaceAll, rfIgnoreCase]));

        Seguro := (Child.ChildValues['vSeg']);
        cdsNotas_Entradas_DadosVALORSEGURO.AsCurrency :=
          StrToFloat(StringReplace(Seguro, '.', ',', [rfReplaceAll, rfIgnoreCase]));

        Outros := (Child.ChildValues['vOutro']);
        cdsNotas_Entradas_DadosVALORDESPESAS.AsCurrency :=
          StrToFloat(StringReplace(Outros, '.', ',', [rfReplaceAll, rfIgnoreCase]));

        Desconto := (Child.ChildValues['vDesc']);
        cdsNotas_Entradas_DadosDESCONTO.AsFloat := StrToFloat(StringReplace(Desconto, '.', ',', [rfReplaceAll, rfIgnoreCase]));

        // ** Transportadora
        Child := Doc.DocumentElement.ChildNodes.First;
        Child := Child.ChildNodes.FindNode('infNFe');
        Child := Child.ChildNodes.FindNode('transp');
        Child := Child.ChildNodes.FindNode('vol');

        if Assigned(Child.ChildNodes.FindNode('pesoL')) then
        begin
          PesoLiquido := (Child.ChildValues['pesoL']);
          cdsNotas_Entradas_DadosPESOLIQUIDO.AsFloat :=
            StrToFloat(StringReplace(PesoLiquido, '.', ',', [rfReplaceAll, rfIgnoreCase]));
        end;

        if Assigned(Child.ChildNodes.FindNode('pesoB')) then
        begin
          PesoBruto := (Child.ChildValues['pesoB']);
          cdsNotas_Entradas_DadosPESOBRUTO.AsFloat :=
            StrToFloat(StringReplace(PesoBruto, '.', ',', [rfReplaceAll, rfIgnoreCase]));
        end;

        PesoBruto := (Child.ChildValues['pesoB']);
        cdsNotas_Entradas_DadosPESOBRUTO.AsFloat := StrToFloat(StringReplace(PesoBruto, '.', ',', [rfReplaceAll, rfIgnoreCase]));

        cdsNotas_Entradas_Dados.Post;

        if __SuperClass.DBFunctions.dbApply(cdsNotas_Entradas_Dados) then
          __SuperClass.GenericsF.DisplayMessage('Processo concluído com sucesso! ', '',
            'NF Gerada: ' + cdsNotas_Entradas_DadosPREFIXO.AsString + ' ' + cdsNotas_Entradas_DadosNUMERO.AsString, '',
            MB_ICONINFORMATION);
      end;
    end;
  except
    on E: Exception do
    begin
      cdsNotas_Entradas_Dados.CancelUpdates;
      cdsNotas_Entradas_Itens.CancelUpdates;
      __SuperClass.GenericsF.DisplayMessage(E.Message, '', 'Tente novamente!', '', MB_ICONERROR);
    end;
  end;
end;

procedure TfrmNotas_Entradas.actImprimir_GarantiasExecute(Sender: TObject);
var
  Reg: TBookMark;
  ValorFinal: Double;
  SQL: String;
  Excel: Variant;
  Contador: Integer;
  Cliente: Integer;
  NomeCliente: String;
  CNPJCliente: String;
  Erro: Boolean;
begin
  inherited;
  if ((cdsNotas_Entradas_Dados.Eof) and (cdsNotas_Entradas_Dados.Bof)) then
    __SuperClass.GenericsF.DisplayMessage('Nenhuma nota de devolução selecionada.', '', 'Selecione uma nota de devolução.',
      'Informação', MB_ICONEXCLAMATION)
  else
  begin
    ValorFinal := 0;
    with cdsImpressao_Garantia do
    begin
      CreateDataSet;
      Reg := cdsNotas_Entradas_Itens.GetBookmark;
      try
        cdsNotas_Entradas_Itens.DisableControls;
        cdsNotas_Entradas_Itens.First;
        while not cdsNotas_Entradas_Itens.Eof do
        begin
          Insert;
          __SuperClass.GenericsF.RetornaCliente(cdsNotas_Entradas_DadosFORNECEDOR.AsInteger, Cliente, NomeCliente,
            CNPJCliente, Erro);
          cdsImpressao_GarantiaCLIENTE.AsInteger := Cliente;
          cdsImpressao_GarantiaDATA.AsDateTime := cdsNotas_Entradas_DadosDATACRIACAO.AsDateTime;
          cdsImpressao_GarantiaCODIGO.AsString := cdsNotas_Entradas_ItensPRODUTO.AsString;
          cdsImpressao_GarantiaDESCRICAOPRODUTO.AsString := cdsNotas_Entradas_ItensDESCRICAO.AsString;
          cdsImpressao_GarantiaNUMERO.AsInteger := cdsNotas_Entradas_DadosNUMERO.AsInteger;
          cdsImpressao_GarantiaDOCUMENTOORIGEM.AsInteger := cdsNotas_Entradas_ItensDOCUMENTOORIGEM.AsInteger;
          cdsImpressao_GarantiaUNITARIO.AsFloat := cdsNotas_Entradas_ItensUNITARIOORIGINAL.AsFloat;
          cdsImpressao_GarantiaQUANTIDADE.AsInteger := cdsNotas_Entradas_ItensQUANTIDADE.AsInteger;
          cdsImpressao_GarantiaVALORIPI.AsFloat := cdsNotas_Entradas_ItensVALORIPI.AsFloat;
          cdsImpressao_GarantiaVALORBRUTO.AsFloat :=
            (cdsNotas_Entradas_ItensQUANTIDADE.AsFloat * cdsNotas_Entradas_ItensUNITARIOORIGINAL.AsFloat) +
            cdsNotas_Entradas_ItensVALORIPI.AsFloat;
          ValorFinal := ValorFinal + cdsImpressao_GarantiaVALORBRUTO.AsFloat;
          cdsImpressao_GarantiaTOTALFINAL.AsFloat := ValorFinal;

          SQL := EmptyStr;
          SQL := 'SELECT A.EMISSAO, B.NOME FROM NOTAS_SAIDAS_DADOS A JOIN CLIENTES B ON (A.EMPRESA = B.EMPRESA AND A.FILIAL = B.FILIAL AND A.CLIENTE = B.CODIGO) WHERE A.NUMERO = ';
          SQL := SQL + Format('%s', [QuotedStr(IntToStr(cdsImpressao_GarantiaDOCUMENTOORIGEM.AsInteger))]);
          SQL := SQL + ' AND A.PREFIXO = ';
          SQL := SQL + Format('%s', [QuotedStr(cdsNotas_Entradas_ItensPREFIXOORIGEM.AsString)]);

          with cdsAuxiliar do
          begin
            CommandText := SQL;
            cdsAuxiliar.Open;
            cdsImpressao_GarantiaEMISSAO.AsString := cdsAuxiliarEMISSAO.AsString;
            cdsImpressao_GarantiaNOMECLIENTE.AsString := cdsAuxiliarNOME.AsString;
            cdsAuxiliar.Close;
          end;

          Post;
          cdsNotas_Entradas_Itens.Next;
        end;
        First;

        if (RecordCount > 0) then
        begin
          // __SuperClass.GenericsF.BuildReport('rptGarantia_Santana', 'Relátorio de Garantias', Null, True, Nil);
          __SuperClass.GenericsF.BuildReport('rptGarantia_Santana', 'Relátorio de Garantias', Null, True, Nil, Garantia);

          if (MessageBox(Application.Handle, 'Deseja exportar garantia para o Excel?', 'Pergunta', MB_YESNO + MB_ICONQUESTION)
            = IDYES) then
          begin
            First;
            Excel := CreateOleObject('Excel.Application');
            Excel.Visible := True;
            Excel.WorkBooks.Add(1);

            Excel.WorkBooks[1].Sheets[1].Cells[1, 1] := 'Cliente :';
            Excel.WorkBooks[1].Sheets[1].Cells[1, 2] := cdsImpressao_GarantiaNOMECLIENTE.AsString;

            Excel.WorkBooks[1].Sheets[1].Cells[1, 4] := 'Referente a Nota de Devolução :';
            Excel.WorkBooks[1].Sheets[1].Cells[1, 5] := cdsImpressao_GarantiaNUMERO.AsString;

            Excel.WorkBooks[1].Sheets[1].Cells[3, 1] := 'Emissão';
            Excel.WorkBooks[1].Sheets[1].Cells[3, 2] := 'Número da Nota';
            Excel.WorkBooks[1].Sheets[1].Cells[3, 3] := 'Código';
            Excel.WorkBooks[1].Sheets[1].Cells[3, 4] := 'Descricao Produto';
            Excel.WorkBooks[1].Sheets[1].Cells[3, 5] := 'Quantidade';
            Excel.WorkBooks[1].Sheets[1].Cells[3, 6] := 'Local';
            Excel.WorkBooks[1].Sheets[1].Cells[3, 7] := 'Valor Unitário';
            Excel.WorkBooks[1].Sheets[1].Cells[3, 8] := 'Valor IPI';
            Excel.WorkBooks[1].Sheets[1].Cells[3, 9] := 'Total';

            while not Eof do
            begin
              for Contador := 4 to RecordCount + 3 do
              begin
                Excel.WorkBooks[1].Sheets[1].Cells[Contador, 1] := cdsImpressao_GarantiaEMISSAO.AsString;
                Excel.WorkBooks[1].Sheets[1].Cells[Contador, 2] := cdsImpressao_GarantiaDOCUMENTOORIGEM.AsString;
                Excel.WorkBooks[1].Sheets[1].Cells[Contador, 3] := cdsImpressao_GarantiaCODIGO.AsString;
                Excel.WorkBooks[1].Sheets[1].Cells[Contador, 4] := cdsImpressao_GarantiaDESCRICAOPRODUTO.AsString;
                Excel.WorkBooks[1].Sheets[1].Cells[Contador, 5] := cdsImpressao_GarantiaQUANTIDADE.AsFloat;
                Excel.WorkBooks[1].Sheets[1].Cells[Contador, 6] := cdsImpressao_GarantiaLOCAL.AsString;
                Excel.WorkBooks[1].Sheets[1].Cells[Contador, 7] := cdsImpressao_GarantiaUNITARIO.AsCurrency;
                Excel.WorkBooks[1].Sheets[1].Cells[Contador, 8] := cdsImpressao_GarantiaVALORIPI.AsCurrency;
                Excel.WorkBooks[1].Sheets[1].Cells[Contador, 9] := cdsImpressao_GarantiaVALORBRUTO.AsCurrency;
                Next;
              end;
            end;
          end;
        end;
      finally
        GotoBookMark(Reg);
        FreeBookMark(Reg);
        Close;
      end;
    end;
  end;

end;

procedure TfrmNotas_Entradas.actPedidos_ComprasExecute(Sender: TObject);
const
  Entidade = 'FORNECEDORES';
var
  Empresa: String;
  Filial: String;
  Campos: TUStringArray;
  Filtro: String;
  Auxiliar: TDataSet;
begin
  inherited;
  try
    try
      __SuperClass.DBFunctions.GetEntityOwner(Entidade, Empresa, Filial);
      Campos := __SuperClass.GenericsF.VarArrayOfStr(['GRUPO']);
      Filtro := Format('EMPRESA = %s AND FILIAL = %s AND CODIGO = %d', [QuotedStr(Empresa), QuotedStr(Filial),
        cdsNotas_Entradas_DadosFORNECEDOR.AsInteger]);
      Auxiliar := __SuperClass.DBFunctions.ExecuteQueryByXML(Campos, Entidade, Filtro);
      if ((Auxiliar.Eof) and (Auxiliar.Bof)) then
        __SuperClass.GenericsF.DisplayMessage('Condição de pagamento não encontrada.', '', 'Verifique o código informado.',
          'Informação', MB_ICONEXCLAMATION)
      else
      begin
        frmMostra_Pedidos_Compras := TfrmMostra_Pedidos_Compras.Create(Self);
        try
          frmMostra_Pedidos_Compras.Grupo := Auxiliar.FieldByName('GRUPO').AsInteger;
          frmMostra_Pedidos_Compras.ShowModal;
          DI := frmMostra_Pedidos_Compras.DI;
        finally
          FreeAndNil(frmMostra_Pedidos_Compras);
        end;
      end;
    finally
      if Assigned(Auxiliar) then
      begin
        Auxiliar.Close;
        FreeAndNil(Auxiliar);
      end;
    end;
  except
    on E: Exception do
      __SuperClass.GenericsF.DisplayMessage('Falha ao pesquisar a condição de pagamento.', E.Message,
        'Verifique o valor informado.', 'Informação', MB_ICONEXCLAMATION);
  end;
end;

procedure TfrmNotas_Entradas.AtribuiDadosDI;
begin

  if not(cdsNotas_Entradas_Itens.State in [dsInsert, dsEdit]) then
  begin
    if (MessageBox(Application.Handle, 'Deseja copiar para todos os registros ?', 'Pergunta', MB_YESNO + MB_ICONQUESTION) = IDYES)
    then
    begin
      while not cdsNotas_Entradas_Itens.Eof do
      begin
        cdsNotas_Entradas_Itens.Edit;
        cdsNotas_Entradas_ItensNUMERODI.AsString := DI.Numero;
        cdsNotas_Entradas_ItensDATADI.AsDateTime := DI.Data;
        cdsNotas_Entradas_ItensLOCALDESEMBARACO.AsString := DI.LocalDesembaraco;
        cdsNotas_Entradas_ItensUFDESEMBARACO.AsString := DI.UFDesembaraco;
        cdsNotas_Entradas_ItensDATADESEMBARACO.AsDateTime := DI.DataDesembaraco;
        cdsNotas_Entradas_ItensEXPORTADOR.AsString := DI.Exportador;
        cdsNotas_Entradas_ItensADICAO.AsString := DI.Adicao.Adicao;
        cdsNotas_Entradas_ItensSEQADICAO.AsString := DI.Adicao.Sequencia;
        cdsNotas_Entradas_ItensFABRICANTE.AsString := DI.Fabricante;
        cdsNotas_Entradas_ItensDESCONTODI.AsCurrency := DI.Desconto;
        cdsNotas_Entradas_ItensORIGEMPRODUTO.AsString := DI.OrigemProduto;
        cdsNotas_Entradas_ItensVIATRANSPORTE.AsString := DI.ViaTransporte;
        cdsNotas_Entradas_ItensTIPOINTERMEDIACAO.AsString := DI.TipoIntermediacao;
        cdsNotas_Entradas_Itens.Next;
      end;
    end else begin
      cdsNotas_Entradas_Itens.Edit;
      cdsNotas_Entradas_ItensNUMERODI.AsString := DI.Numero;
      cdsNotas_Entradas_ItensDATADI.AsDateTime := DI.Data;
      cdsNotas_Entradas_ItensLOCALDESEMBARACO.AsString := DI.LocalDesembaraco;
      cdsNotas_Entradas_ItensUFDESEMBARACO.AsString := DI.UFDesembaraco;
      cdsNotas_Entradas_ItensDATADESEMBARACO.AsDateTime := DI.DataDesembaraco;
      cdsNotas_Entradas_ItensEXPORTADOR.AsString := DI.Exportador;
      cdsNotas_Entradas_ItensADICAO.AsString := DI.Adicao.Adicao;
      cdsNotas_Entradas_ItensSEQADICAO.AsString := DI.Adicao.Sequencia;
      cdsNotas_Entradas_ItensFABRICANTE.AsString := DI.Fabricante;
      cdsNotas_Entradas_ItensDESCONTODI.AsCurrency := DI.Desconto;
      cdsNotas_Entradas_ItensORIGEMPRODUTO.AsString := DI.OrigemProduto;
      cdsNotas_Entradas_ItensVIATRANSPORTE.AsString := DI.ViaTransporte;
      cdsNotas_Entradas_ItensTIPOINTERMEDIACAO.AsString := DI.TipoIntermediacao;
      cdsNotas_Entradas_Itens.Next;
    end;
  end;
end;

procedure TfrmNotas_Entradas.AtribuiRateioItens(Campo: ShortString; ValorBase: Currency);
var
  Atual: Integer;
  Itens: Integer;
  Mark: TBookMark;
  Parcial: Currency;
  Cursor: TCursor;
begin
  Atual := 0;
  Itens := cdsNotas_Entradas_Itens.RecordCount;
  Mark := Nil;
  Parcial := 0;

  if (cdsNotas_Entradas_DadosVALORMERCADORIAS.AsCurrency > 0) then
  begin
    Rateando := True;
    Cursor := Screen.Cursor;
    InitProgressBar(Atual, Itens);

    try
      with cdsNotas_Entradas_Itens do
        AfterPost := Nil;
      with cdsNotas_Entradas_Itens do
      begin
        try
          DisableControls;
          Mark := GetBookmark;
          First;
          while (not Eof) do
          begin
            Inc(Atual);
            SetProgressBar(Atual);
            Edit;
            cdsNotas_Entradas_Itens.FieldByName(Campo).AsCurrency :=
              RoundTo((cdsNotas_Entradas_ItensTOTAL.AsCurrency / cdsNotas_Entradas_DadosVALORMERCADORIAS.AsCurrency) *
              ValorBase, -2);
            Parcial := Parcial + cdsNotas_Entradas_Itens.FieldByName(Campo).AsCurrency;
            Post;
            Next;
          end;

          if ((ValorBase - Parcial) <> 0) then
          begin
            First;
            Edit;
            cdsNotas_Entradas_Itens.FieldByName(Campo).AsCurrency := cdsNotas_Entradas_Itens.FieldByName(Campo).AsCurrency +
              (ValorBase - Parcial);
            Post;
          end;
        finally
          GotoBookMark(Mark);
          FreeBookMark(Mark);
          EnableControls;
        end;
      end;
    finally
      Rateando := False;
      Screen.Cursor := Cursor;
      InitProgressBar(0, 0);

      with cdsNotas_Entradas_Itens do
        AfterPost := cdsNotas_Entradas_ItensAfterPost;
    end;
  end;

end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_DadosFORMULARIOPROPRIOValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      if (cdsNotas_Entradas_DadosFORMULARIOPROPRIO.AsString = VB_SIM) then
      begin
        // Pegando a série o número da nota fiscal
        IdNota := __SuperClass.GenericsF.PegaIdNota;
        if ((IdNota.Prefixo <> '') and (IdNota.Numero <> 0)) then
        begin
          cdsNotas_Entradas_DadosNUMERO.AsInteger := IdNota.Numero;
          cdsNotas_Entradas_DadosPREFIXO.AsString := IdNota.Prefixo;
          HabilitaIdNota(False);
        end;
      end else begin
        cdsNotas_Entradas_DadosNUMERO.AsInteger := 0;
        cdsNotas_Entradas_DadosPREFIXO.AsString := '';
        HabilitaIdNota(True);
      end;
    end;
  end;

end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_DadosFORNECEDORValidate(Sender: TField);
const
  Entidade = 'FORNECEDORES';
var
  Empresa: String;
  Filial: String;
  Campos: TUStringArray;
  Filtro: String;
  Continua: Boolean;
  Auxiliar: TDataSet;
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      Continua := False;
      if ((Sender.AsInteger <> 0)) then
      begin
        try
          __SuperClass.DBFunctions.GetEntityOwner(Entidade, Empresa, Filial);
          Campos := __SuperClass.GenericsF.VarArrayOfStr(['REDUZIDO', 'UF', 'CONDICAOPAGAMENTO', 'DESCONTO', 'TIPOPRECO',
            'CATEGORIA']);
          Filtro := Format('EMPRESA = %s AND FILIAL = %s AND CODIGO = %d', [QuotedStr(Empresa), QuotedStr(Filial),
            cdsNotas_Entradas_DadosFORNECEDOR.AsInteger]);
          Continua := __SuperClass.GenericsF.RegistroHabilitado(Entidade, Filtro, '');
          if (Continua) then
          begin
            try
              Auxiliar := __SuperClass.DBFunctions.ExecuteQueryByXML(Campos, Entidade, Filtro);
              if Auxiliar.Eof then
                Continua := False
              else
              begin
                cdsNotas_Entradas_DadosNOMEFORNECEDOR.AsString := Auxiliar.FieldByName('REDUZIDO').AsString;
                cdsNotas_Entradas_DadosUF.AsString := Auxiliar.FieldByName('UF').AsString;
                if ((cdsNotas_Entradas_DadosCONDICAOPAGAMENTO.AsInteger = 0)) then
                  cdsNotas_Entradas_DadosCONDICAOPAGAMENTO.AsInteger := Auxiliar.FieldByName('CONDICAOPAGAMENTO').AsInteger;
                if (Auxiliar.FieldByName('DESCONTO').AsFloat > 0) then // Atribui somente se tiver desconto no cliente
                  cdsNotas_Entradas_DadosDESCONTO.AsFloat := Auxiliar.FieldByName('DESCONTO').AsFloat;
                if ((cdsNotas_Entradas_DadosTIPOPRECO.AsString = '')) then
                  cdsNotas_Entradas_DadosTIPOPRECO.AsString := Auxiliar.FieldByName('TIPOPRECO').AsString;
                if ((cdsNotas_Entradas_DadosCATEGORIA.AsString = '')) then
                  cdsNotas_Entradas_DadosCATEGORIA.AsString := Auxiliar.FieldByName('CATEGORIA').AsString;
              end;
            finally
              if Assigned(Auxiliar) then
              begin
                Auxiliar.Close;
                FreeAndNil(Auxiliar);
              end;
            end;
          end;
        except
          on E: Exception do
            __SuperClass.GenericsF.DisplayMessage('Falha ao atribuir o fornecedor.', Format('%s.', [E.Message]),
              'Verifique o valor informado.', 'Informação', MB_ICONEXCLAMATION);
        end;
        if (not Continua) then
          Abort;
      end;
    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensVALORDESPESASValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      InicializaItem := False;
      AtualizaValoresItem;
    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensVALORFRETEValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      InicializaItem := False;
      AtualizaValoresItem;
    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensVALORSEGUROValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      InicializaItem := False;
      AtualizaValoresItem;
    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ReferenciadasBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  SequenciaRef := __SuperClass.DBFunctions.GetNextNumber(DataSet, 'SEQUENCIAL');
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ReferenciadasBeforePost(DataSet: TDataSet);
var
  Aborta: Boolean;
begin
  inherited;
  Aborta := False;
  if (not __SuperClass.DBFunctions.CheckRequiredFields(DataSet)) then
    Aborta := True;
  if (Aborta) then
    Abort;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ReferenciadasNewRecord(DataSet: TDataSet);
var
  InUser: String;
  InDate: String;
  InStr: String;
begin
  inherited;
  with __SuperClass do
  begin
    InUser := GenericsF.FillChar(fmRight, User.ShortName, 15, #32);
    InDate := FormatDateTime('ddmmyyyyhhmmss', ServerDateTime);
    InStr := Format('%s%s', [InUser, InDate]);
  end;
  // inicializando as variaveis
  cdsNotas_Entradas_ReferenciadasSEQUENCIAL.AsInteger := SequenciaRef;
  cdsNotas_Entradas_ReferenciadasINCLUIDO.AsString := __SuperClass.GenericsF.Encrypter(True, InStr, 8, 12, 16);
  cdsNotas_Entradas_ReferenciadasALTERADO.AsString := __SuperClass.GenericsF.Encrypter(True, InStr, 8, 12, 16);
  cdsNotas_Entradas_ReferenciadasDATACRIACAO.AsDateTime := __SuperClass.ServerDateTime;
end;

procedure TfrmNotas_Entradas.DataChange(Sender: TObject; Field: TField);
begin
  inherited;
  with ActivedDataSet do
  begin
    btnDespesasImportacao.Enabled := (Active) and (RecordCount > 0) and (State in [dsInsert, dsEdit]);
    btnPercentualPrecoVenda.Enabled := (Active) and (RecordCount > 0) and (State in [dsInsert, dsEdit]);
  end;
  spdFornecedores.Enabled := dbedtFornecedor.Enabled;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensIIValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      InicializaItem := False;
      AtualizaValoresItem;
    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensINSSValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      InicializaItem := False;
      AtualizaValoresItem;
    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_DadosBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  __SuperClass.User.CheckRoutineAccess(RoutineInf, doModify);
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_DadosBeforeOpen(DataSet: TDataSet);
var
  Empresa: String;
  Filial: String;
begin
  inherited;
  __SuperClass.DBFunctions.GetEntityOwner('FORNECEDORES', Empresa, Filial);
  with cdsNotas_Entradas_Dados.Params do
  begin
    // tratamento do campo Empresa
    with ParamByName('EMPRESA_FORNECEDORES') do
    begin
      DataType := ftString;
      ParamType := ptInput;
      AsString := Empresa;
    end;
    // tratamento do campo Filial
    with ParamByName('FILIAL_FORNECEDORES') do
    begin
      DataType := ftString;
      ParamType := ptInput;
      AsString := Filial;
    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensISSValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
    begin
      InicializaItem := False;
      AtualizaValoresItem;
    end;
  end;
end;

procedure TfrmNotas_Entradas.HabilitaIdNota(Habilita: Boolean);
begin
  dbedtNumero.Enabled := Habilita;
  dbedtPrefixo.Enabled := Habilita;
end;

procedure TfrmNotas_Entradas.LoadLists;
var
  Lista: TStringList;
begin
  // pegando a lista de formas de pagamentos
  Lista := TStringList.Create;
  try
    __SuperClass.DBFunctions.GetListItems(TL_ESPECIES_NOTAS_FISCAIS, Lista);
    dbcboEspecieDocumento.Items.AddStrings(Lista);
  finally
    FreeAndNil(Lista);
  end;
  // pegando a lista de formas de pagamentos
  Lista := TStringList.Create;
  try
    __SuperClass.DBFunctions.GetListItems(TL_FORMAS_PAGAMENTOS, Lista);
    dbcboFormaPagamento.Items.AddStrings(Lista);
  finally
    FreeAndNil(Lista);
  end;

end;

function TfrmNotas_Entradas.MostraItensDevolvidos(Fornecedor: Integer; Produto, EspecieDocumento: ShortString): Integer;
var
  SQL: String;
  TotalDevolucao: Integer;
  TOwner: TUEntityOwnerArray;
begin
  TotalDevolucao := 0;

  SetLength(TOwner, 2);
  TOwner[0].Name := 'NOTAS_ENTRADAS_DADOS';
  TOwner[1].Name := 'NOTAS_ENTRADAS_ITENS';
  __SuperClass.DBFunctions.GetEntityOwner(TOwner);

  SQL := ' SELECT A.NUMERO, B.QUANTIDADE, B.PRODUTO, B.LOCAL FROM NOTAS_ENTRADAS_DADOS A INNER JOIN NOTAS_ENTRADAS_ITENS B ';
  SQL := SQL + ' ON ( A.EMPRESA = B.EMPRESA AND A.FILIAL = B.FILIAL AND A.NUMERO = B.NUMERO AND A.PREFIXO = B.PREFIXO) ';
  SQL := SQL + ' WHERE B.PRODUTO = :PRODUTO ';
  SQL := SQL + ' AND A.ESPECIEDOCUMENTO = ''DEV'' ';
  SQL := SQL + ' AND A.FORNECEDOR = :FORNECEDOR';

  with cdsDevolucoes, cdsDevolucoes.Params do
  begin
    with ParamByName('PRODUTO') do
    begin
      DataType := ftString;
      ParamType := ptInput;
      AsString := Produto;
    end;
    with ParamByName('FORNECEDOR') do
    begin
      DataType := ftInteger;
      ParamType := ptInput;
      AsInteger := Fornecedor;
    end;

    CommandText := SQL;
    __SuperClass.DBFunctions.OpenDataSet(cdsDevolucoes, False, False, -1);

    while not Eof do
    begin
      TotalDevolucao := TotalDevolucao + cdsDevolucoesQUANTIDADE.AsInteger;
      Next;
    end;

    __SuperClass.DBFunctions.CloseDataSet(cdsDevolucoes);

  end;
  Result := TotalDevolucao;
end;

function TfrmNotas_Entradas.MostraNotasSaidas(Cliente: Integer; NomeCliente: String; EmissaoDe: TDateTime; EmissaoAte: TDateTime;
  Produto: ShortString; Descricao: ShortString; var LocalOrigem: ShortString; var SaldoDevolver: Double;
  var UnitarioOrigem: Double; var UnitarioOriginalOrigem: Double; var PrefixoOrigem: ShortString; var DocumentoOrigem: Integer;
  var ItemOrigem: Integer; var BaseComissao: Currency; var ValorComissao: Currency): Boolean;
var
  TOwner: TUEntityOwnerArray;
  Empresa: String;
  Filial: String;
  SQL: String;
  TotalItensDevolvidos: Integer;
  TotalItensComprados: Integer;
begin
  inherited;
  Result := False;

  SetLength(TOwner, 2);
  TOwner[0].Name := 'REGRAS_FISCAIS';
  TOwner[1].Name := 'NOTAS_SAIDAS_DADOS';
  __SuperClass.DBFunctions.GetEntityOwner(TOwner);

  with cdsNotas_Saidas do
  begin
    SQL := 'select a.EMISSAO, a.PREFIXO, a.NUMERO, b.ITEM, b.QUANTIDADE, b.SALDODEVOLVER, b.LOCAL, b.UNITARIO, (b.UNITARIO + b.UNITARIOALTERNATIVO) as UNITARIOORIGINAL, ';
    SQL := SQL + 'b.TOTAL, ((b.UNITARIO + b.UNITARIOALTERNATIVO) * b.QUANTIDADE) as TOTALORIGINAL, b.BASECOMISSAO, b.VALORCOMISSAO ';
    SQL := SQL + 'from NOTAS_SAIDAS_DADOS a ';
    SQL := SQL +
      'inner join NOTAS_SAIDAS_ITENS b on (b.EMPRESA = a.EMPRESA and b.FILIAL = a.FILIAL and b.PREFIXO = a.PREFIXO and b.NUMERO = a.NUMERO and b.CLIENTE = a.CLIENTE) ';
    SQL := SQL +
      'inner join REGRAS_FISCAIS c on (c.EMPRESA = :EMPRESA_REGRAS and c.FILIAL = :FILIAL_REGRAS and c.CODIGO = b.REGRA) ';
    SQL := SQL +
      'where a.EMPRESA = :EMPRESA_NOTAS and A.FILIAL = :FILIAL_NOTAS and a.CLIENTE = :CLIENTE and a.EMISSAO BETWEEN :EMISSAODE and :EMISSAOATE and b.PRODUTO = :PRODUTO ';
    SQL := SQL + ' and c.TERCEIROS IN ('''', ''N'') and b.SALDODEVOLVER > 0 ';
    SQL := SQL + 'order by a.EMPRESA, a.FILIAL, a.EMISSAO';

    CommandText := SQL;

    // tratamento do campo Empresa
    with Params.ParamByName('EMPRESA_REGRAS') do
    begin
      DataType := ftString;
      ParamType := ptInput;
      AsString := TOwner[0].Company;
    end;
    // tratamento do campo Filial
    with Params.ParamByName('FILIAL_REGRAS') do
    begin
      DataType := ftString;
      ParamType := ptInput;
      AsString := TOwner[0].Branch;
    end;
    // tratamento do campo Empresa
    with Params.ParamByName('EMPRESA_NOTAS') do
    begin
      DataType := ftString;
      ParamType := ptInput;
      AsString := TOwner[1].Company;
    end;
    // tratamento do campo Filial
    with Params.ParamByName('FILIAL_NOTAS') do
    begin
      DataType := ftString;
      ParamType := ptInput;
      AsString := TOwner[1].Branch;
    end;
    // tratamento do campo Empresa
    with Params.ParamByName('CLIENTE') do
    begin
      DataType := ftInteger;
      ParamType := ptInput;
      AsInteger := Cliente;
    end;
    // tratamento do campo Filial
    with Params.ParamByName('EMISSAODE') do
    begin
      DataType := ftDate;
      ParamType := ptInput;
      AsDate := EmissaoDe;
    end;
    // tratamento do campo Filial
    with Params.ParamByName('EMISSAOATE') do
    begin
      DataType := ftDate;
      ParamType := ptInput;
      AsDate := EmissaoAte;
    end;
    // tratamento do campo Filial
    with Params.ParamByName('PRODUTO') do
    begin
      DataType := ftString;
      ParamType := ptInput;
      AsString := Produto;
    end;

    __SuperClass.DBFunctions.OpenDataSet(cdsNotas_Saidas, False, False, -1);

    with cdsNotas_Saidas do
    begin
      if ((Eof) and (Bof)) then
        __SuperClass.GenericsF.DisplayMessage('Nenhum documento fiscal encontrado para o cliente em questão.', '',
          'Verifique os documentos fiscais para o cliente selecionado.', 'Informação', MB_ICONEXCLAMATION)
      else
      begin
        while not Eof do
        begin
          TotalItensComprados := TotalItensComprados + cdsNotas_SaidasQUANTIDADE.AsInteger;
          Next;
        end;
        First;

        frmMostra_Notas_Fiscais := TfrmMostra_Notas_Fiscais.Create(Self);
        with frmMostra_Notas_Fiscais do
        begin
          cdsNotas := Self.cdsNotas_Saidas;
          dtsNotas := Self.dtsNotas_Saidas;
          FCliente := Cliente;
          FNome := NomeCliente;
          FProduto := Produto;
          FDescricao := Descricao;
          FItensDevolvidos := 0;
          // MostraItensDevolvidos(cdsNotas_Entradas_DadosFORNECEDOR.AsInteger, Produto, cdsNotas_Entradas_DadosESPECIEDOCUMENTO.AsString);
          FItensComprados := 0; // TotalItensComprados;
          if (ShowModal = mrOk) then
          begin
            LocalOrigem := FLocal;
            UnitarioOrigem := FUnitario;
            UnitarioOriginalOrigem := FUnitarioOriginal;
            PrefixoOrigem := FPrefixo;
            DocumentoOrigem := FDocumento;
            ItemOrigem := FItem;
            SaldoDevolver := FDevolver;
//            BaseComissao := FBaseComissao;
//            ValorComissao := FValorComissao;
            Result := True;
          end;
        end;
        FreeAndNil(frmMostra_Notas_Fiscais);
      end;
    end;
    __SuperClass.DBFunctions.CloseDataSet(cdsNotas_Saidas)
  end;
end;

function TfrmNotas_Entradas.MostraNotasTerceiros(Cliente: Integer; NomeCliente: String; EmissaoDe: TDateTime;
  EmissaoAte: TDateTime; Produto: ShortString; Descricao: ShortString; var LocalOrigem: ShortString; var QuantidadeOrigem: Double;
  var UnitarioOrigem: Double; var PrefixoOrigem: ShortString; var DocumentoOrigem: Integer; var ItemOrigem: Integer): Boolean;
var
  Empresa: String;
  Filial: String;
  SQL: String;
begin
  inherited;
  Result := False;

  __SuperClass.DBFunctions.GetEntityOwner('SALDOS_TERCEIROS', Empresa, Filial);

  with cdsSaldos_Terceiros do
  begin
    SQL := 'select EMISSAO, PREFIXO, NUMERO, ITEM, PRIMEIRAUNIDADE, LOCAL, QUANTIDADE, ';
    SQL := SQL + 'UNITARIO, TOTAL, CUSTOMEDIO, SALDO, REGRA ';
    SQL := SQL + 'from SALDOS_TERCEIROS ';
    SQL := SQL +
      'where EMPRESA = :EMPRESA_TERCEIROS and FILIAL = :FILIAL_TERCEIROS and MOVIMENTO = ''R'' and TIPO = ''E'' and PROPRIETARIO = :CLIENTE and ';
    SQL := SQL + 'EMISSAO BETWEEN :EMISSAODE and :EMISSAOATE and PRODUTO = :PRODUTO and SALDO > 0 ';
    SQL := SQL + 'order by EMPRESA, FILIAL, EMISSAO';

    CommandText := SQL;

    // tratamento do campo Empresa
    with Params.ParamByName('EMPRESA_TERCEIROS') do
    begin
      DataType := ftString;
      ParamType := ptInput;
      AsString := Empresa;
    end;
    // tratamento do campo Filial
    with Params.ParamByName('FILIAL_TERCEIROS') do
    begin
      DataType := ftString;
      ParamType := ptInput;
      AsString := Filial;
    end;
    // tratamento do campo Empresa
    with Params.ParamByName('CLIENTE') do
    begin
      DataType := ftInteger;
      ParamType := ptInput;
      AsInteger := Cliente;
    end;
    // tratamento do campo Filial
    with Params.ParamByName('EMISSAODE') do
    begin
      DataType := ftDate;
      ParamType := ptInput;
      AsDate := EmissaoDe;
    end;
    // tratamento do campo Filial
    with Params.ParamByName('EMISSAOATE') do
    begin
      DataType := ftDate;
      ParamType := ptInput;
      AsDate := EmissaoAte;
    end;
    // tratamento do campo Filial
    with Params.ParamByName('PRODUTO') do
    begin
      DataType := ftString;
      ParamType := ptInput;
      AsString := Produto;
    end;

    __SuperClass.DBFunctions.OpenDataSet(cdsSaldos_Terceiros, False, False, -1);

    with cdsSaldos_Terceiros do
    begin
      if ((Eof) and (Bof)) then
        __SuperClass.GenericsF.DisplayMessage('Nenhum documento fiscal encontrado para o cliente em questão.', '',
          'Verifique os documentos fiscais para o cliente selecionado.', 'Informação', MB_ICONEXCLAMATION)
      else
      begin
        frmMostra_Notas_Fiscais_Terceiros := TfrmMostra_Notas_Fiscais_Terceiros.Create(Self);
        with frmMostra_Notas_Fiscais_Terceiros do
        begin
          cdsSaldos_Terceiros := Self.cdsSaldos_Terceiros;
          dtsSaldos_Terceiros := Self.dtsSaldos_Terceiros;
          FProprietario := Cliente;
          FNome := NomeCliente;
          FProduto := Produto;
          FDescricao := Descricao;
          if (ShowModal = mrOk) then
          begin
            LocalOrigem := FLocal;
            UnitarioOrigem := FUnitario;
            PrefixoOrigem := FPrefixo;
            DocumentoOrigem := FDocumento;
            ItemOrigem := FItem;
            QuantidadeOrigem := FQuantidade;
            Result := True;
          end;
        end;
        FreeAndNil(frmMostra_Notas_Fiscais_Terceiros);
      end;
    end;
    __SuperClass.DBFunctions.CloseDataSet(cdsSaldos_Terceiros);
  end;
end;

function TfrmNotas_Entradas.PegaDescricaoProduto(Produto: String): String;
var
  Ret: String;
  SQL: String;
  Empresa, Filial: String;
  Auxiliar: TDataSet;
begin
  Ret := '';

  __SuperClass.DBFunctions.GetEntityOwner('PRODUTOS', Empresa, Filial);

  SQL := 'SELECT DESCRICAO FROM PRODUTOS ';
  SQL := SQL + Format('WHERE EMPRESA = %s AND FILIAL = %s AND ', [QuotedStr(Empresa), QuotedStr(Filial)]);
  SQL := SQL + Format('CODIGO = %s ', [QuotedStr(Produto)]);

  try
    Auxiliar := __SuperClass.DBFunctions.ExecuteQueryByXML(SQL);
    if not(Auxiliar.Bof and Auxiliar.Eof) then
      Ret := Auxiliar.FieldByName('DESCRICAO').AsString;
  finally
    if Assigned(Auxiliar) then
      Auxiliar.Close;
    FreeAndNil(Auxiliar);
  end;

  Result := Ret;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensTOTALGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  inherited;
  if __SuperClass.User.HasRuleAccess(urEscondePrecoCusto) then
    Text := __SuperClass.GenericsF.HideFieldValue(Sender, 2, True)
  else
    Text := __SuperClass.GenericsF.FormatFloatValue(Sender, 2, True);
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensTOTALMOEDAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  inherited;
  if __SuperClass.User.HasRuleAccess(urEscondePrecoCusto) then
    Text := __SuperClass.GenericsF.HideFieldValue(Sender, 2, True)
  else
    Text := __SuperClass.GenericsF.FormatFloatValue(Sender, 2, True);
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_ItensTOTALMOEDAValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if not Copiando then
      AtualizaValoresItem;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_DadosAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
  inherited;
  if (Inserir) then
  begin
    // refazer acima
    __SuperClass.GenericsF.EditaParcelas(MB_CONTAS_PAGAR, cdsNotas_Entradas_DadosCONDICAOPAGAMENTO.AsInteger,
      cdsNotas_Entradas_DadosPREFIXO.AsString, cdsNotas_Entradas_DadosNUMERO.AsInteger,
      __SuperClass.GenericsF.IfThen((cdsNotas_Entradas_DadosESPECIEDOCUMENTO.AsString <> 'DEV') and
      (cdsNotas_Entradas_DadosESPECIEDOCUMENTO.AsString <> 'NFD'), 'NF', 'CRD'), cdsNotas_Entradas_DadosFORNECEDOR.AsInteger);
    if (cdsNotas_Entradas_DadosFORMULARIOPROPRIO.AsString = VB_SIM) then
    begin
      // Incrementando e gravando o número de nota
      Inc(IdNota.Numero);
      // Gravando o número de série
      __SuperClass.GenericsF.GravaIdNota(IdNota.Prefixo, IdNota.Numero);
    end;
  end;
  Inserir := False;
end;

procedure TfrmNotas_Entradas.spdTransportadorasClick(Sender: TObject);
var
  AFields: TUStringArray;
  SFields: TUStringArray;
begin
  inherited;
  frmTransportadoras := TfrmTransportadoras.Create(Self);
  try
    // campos que receberão os dados
    SetLength(AFields, 2);
    AFields[0] := 'TRANSPORTADORA';
    AFields[1] := 'NOMETRANSPORTADORA';
    // campos que proverão os dados
    SetLength(SFields, 2);
    SFields[0] := 'CODIGO';
    SFields[1] := 'REDUZIDO';
    __SuperClass.DBFunctions.ApplyFieldsInDataSet(frmTransportadoras, frmTransportadoras.cdsTransportadoras,
      frmTransportadoras.dtsTransportadoras, cdsNotas_Entradas_Dados, AFields, SFields);
  finally
    FreeAndNil(frmTransportadoras);
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_DadosAfterInsert(DataSet: TDataSet);
begin
  inherited;
  Inserir := True;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_DadosAfterPost(DataSet: TDataSet);
begin
  inherited;
  with cdsNotas_Entradas_Referenciadas do
  begin
    if (Eof) and (Bof) then
    begin
      if (cdsNotas_Entradas_DadosIDNFEREF.AsString <> '') then
      begin
        Insert;
        FieldByName('IDNFEREF').AsString := cdsNotas_Entradas_DadosIDNFEREF.AsString;
        Post;
      end;
    end;
  end;
end;

procedure TfrmNotas_Entradas.cdsNotas_Entradas_DadosAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CarregaImpostos;
  // Habilita a impressao da DANFE somente para entradas com formulário próprio
  btnImprimir_DANFE.Enabled := (cdsNotas_Entradas_DadosFORMULARIOPROPRIO.AsString = VB_SIM) and
    (cdsNotas_Entradas_DadosIDNFE.AsString <> '') and (cdsNotas_Entradas_DadosPGERACAONFE.AsString <> '') and
    (cdsNotas_Entradas_DadosPAUTORIZACAONFE.AsString <> '') and (cdsNotas_Entradas_DadosLIBERANFE.AsString = VB_SIM);

  btnGerar_PDF.Enabled := (cdsNotas_Entradas_DadosIDNFE.AsString <> '') and (cdsNotas_Entradas_DadosPGERACAONFE.AsString <> '')
    and (cdsNotas_Entradas_DadosPAUTORIZACAONFE.AsString <> '') and (cdsNotas_Entradas_DadosLIBERANFE.AsString = VB_SIM);

  btnEnviar_XML.Enabled := (cdsNotas_Entradas_DadosIDNFE.AsString <> '') and (cdsNotas_Entradas_DadosPGERACAONFE.AsString <> '')
    and (cdsNotas_Entradas_DadosPAUTORIZACAONFE.AsString <> '') and (cdsNotas_Entradas_DadosLIBERANFE.AsString = VB_SIM);

end;

{$REGION 'Inicialização/Finalização da classe'}

initialization

RegisterClass(TfrmNotas_Entradas);

finalization

UnRegisterClass(TfrmNotas_Entradas);
{$ENDREGION}

end.
