unit uMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs,
  ExtCtrls, xmldom, XMLIntf, WideStrings, DB, DBClient, SqlExpr, msxmldom,
  XMLDoc, FMTBcd, Provider, IniFiles, uTypes, MConnect, SConnect, Variants,
  Registry, DBXDataSnap, DBXCommon, DSConnect, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdFTP,
  IndyPeerImpl, Data.DBXMySQL, MidasLib, Data.DBXOdbc, Data.Win.ADODB, Math,
  Data.DBXFirebird, uAcessoSiteEvolucao, {System.Contnrs,} uLibrary, uEmail,
  Generics.Collections;

type
  TsrvMobile = class(TService)
    tmrMain: TTimer;
    DSServer: TSQLConnection;
    dspcLan: TDSProviderConnection;
    scnMysql: TSQLConnection;
    sqlPedidos_MySql_Dados: TSQLDataSet;
    sqlPedidos_MySql_Itens: TSQLDataSet;
    dspPedidos_MySql_Dados: TDataSetProvider;
    dspPedidos_MySql_Itens: TDataSetProvider;
    dtsPedidos_MySql_Dados: TDataSource;
    cdsPedidos_MySql_Itens: TClientDataSet;
    sqlPedidos_MySql_Dadosorders_id: TIntegerField;
    sqlPedidos_MySql_Dadosorders_comment: TMemoField;
    sqlPedidos_MySql_Dadoscustomers_id: TIntegerField;
    sqlPedidos_MySql_Dadoscustomers_name: TStringField;
    sqlPedidos_MySql_Dadoscustomers_lastname: TStringField;
    sqlPedidos_MySql_Dadoscustomers_firstname: TStringField;
    sqlPedidos_MySql_Dadoscustomers_company: TStringField;
    sqlPedidos_MySql_Dadoscustomers_street_address: TStringField;
    sqlPedidos_MySql_Dadoscustomers_street_number: TIntegerField;
    sqlPedidos_MySql_Dadoscustomers_street_complemento: TStringField;
    sqlPedidos_MySql_Dadoscustomers_suburb: TStringField;
    sqlPedidos_MySql_Dadoscustomers_city: TStringField;
    sqlPedidos_MySql_Dadoscustomers_postcode: TStringField;
    sqlPedidos_MySql_Dadoscustomers_state: TStringField;
    sqlPedidos_MySql_Dadoscustomers_country: TStringField;
    sqlPedidos_MySql_Dadoscustomers_ddd: TIntegerField;
    sqlPedidos_MySql_Dadoscustomers_telephone: TStringField;
    sqlPedidos_MySql_Dadoscustomers_email_address: TStringField;
    sqlPedidos_MySql_Dadoscustomers_address_format_id: TIntegerField;
    sqlPedidos_MySql_Dadosdelivery_firstname: TStringField;
    sqlPedidos_MySql_Dadosdelivery_lastname: TStringField;
    sqlPedidos_MySql_Dadosdelivery_company: TStringField;
    sqlPedidos_MySql_Dadosdelivery_street_address: TStringField;
    sqlPedidos_MySql_Dadosdelivery_street_number: TIntegerField;
    sqlPedidos_MySql_Dadosdelivery_street_complemento: TStringField;
    sqlPedidos_MySql_Dadosdelivery_suburb: TStringField;
    sqlPedidos_MySql_Dadosdelivery_city: TStringField;
    sqlPedidos_MySql_Dadosdelivery_postcode: TStringField;
    sqlPedidos_MySql_Dadosdelivery_state: TStringField;
    sqlPedidos_MySql_Dadosdelivery_country: TStringField;
    sqlPedidos_MySql_Dadosdelivery_address_format_id: TIntegerField;
    sqlPedidos_MySql_Dadosbilling_name: TStringField;
    sqlPedidos_MySql_Dadosbilling_company: TStringField;
    sqlPedidos_MySql_Dadosbilling_street_address: TStringField;
    sqlPedidos_MySql_Dadosbilling_street_number: TIntegerField;
    sqlPedidos_MySql_Dadosbilling_street_complemento: TStringField;
    sqlPedidos_MySql_Dadosbilling_suburb: TStringField;
    sqlPedidos_MySql_Dadosbilling_city: TStringField;
    sqlPedidos_MySql_Dadosbilling_postcode: TStringField;
    sqlPedidos_MySql_Dadosbilling_state: TStringField;
    sqlPedidos_MySql_Dadosbilling_country: TStringField;
    sqlPedidos_MySql_Dadosbilling_address_format_id: TIntegerField;
    sqlPedidos_MySql_Dadospayment_method: TStringField;
    sqlPedidos_MySql_Dadospayment_title: TStringField;
    sqlPedidos_MySql_Dadospayment_n_parcelas: TShortintField;
    sqlPedidos_MySql_Dadospayment_card_info: TMemoField;
    sqlPedidos_MySql_Dadospayment_url: TStringField;
    sqlPedidos_MySql_Dadosshipping_method: TStringField;
    sqlPedidos_MySql_Dadosshipping_date: TDateField;
    sqlPedidos_MySql_Dadosshipping_time: TStringField;
    sqlPedidos_MySql_Dadosshipping_tracking_code: TStringField;
    sqlPedidos_MySql_Dadoslast_modified: TSQLTimeStampField;
    sqlPedidos_MySql_Dadosdate_purchased: TSQLTimeStampField;
    sqlPedidos_MySql_Dadosorders_status: TIntegerField;
    sqlPedidos_MySql_Dadosorders_date_finished: TSQLTimeStampField;
    sqlPedidos_MySql_Dadoscurrency: TStringField;
    sqlPedidos_MySql_Dadoscurrency_value: TFMTBCDField;
    sqlPedidos_MySql_Dadosendereco_ip: TStringField;
    sqlPedidos_MySql_Dadosparceiro_id: TIntegerField;
    sqlPedidos_MySql_Dadosid_lista: TIntegerField;
    sqlPedidos_MySql_Dadosid_lista_customer_list: TIntegerField;
    sqlPedidos_MySql_Dadosorder_total: TSingleField;
    sqlPedidos_MySql_Dadosimportado: TIntegerField;
    sqlPedidos_MySql_Dadosabandoned_notify: TIntegerField;
    sqlPedidos_MySql_Dadosml_order_id: TIntegerField;
    sqlPedidos_MySql_Itensorders_products_id: TIntegerField;
    sqlPedidos_MySql_Itensorders_id: TIntegerField;
    sqlPedidos_MySql_Itensproducts_id: TIntegerField;
    sqlPedidos_MySql_Itensproducts_model: TStringField;
    sqlPedidos_MySql_Itensproducts_name: TStringField;
    sqlPedidos_MySql_Itensproducts_price: TFMTBCDField;
    sqlPedidos_MySql_Itensfinal_price: TFMTBCDField;
    sqlPedidos_MySql_Itensproducts_tax: TFMTBCDField;
    sqlPedidos_MySql_Itensproducts_quantity: TIntegerField;
    sqlPedidos_MySql_Itensproducts_weight: TSingleField;
    sqlPedidos_MySql_Itensproducts_peso_cubico: TSingleField;
    sqlPedidos_MySql_Itensproducts_cod_ref: TStringField;
    sqlPedidos_MySql_Itensanexo: TStringField;
    sqlPedidos_MySql_Itensdownload_count: TShortintField;
    sqlPedidos_MySql_Itensparceiro_id: TIntegerField;
    sqlPedidos_MySql_Itensconfiguracao: TStringField;
    sqlPedidos_MySql_Itensgift: TShortintField;
    sqlPedidos_MySql_Itensgift_card: TMemoField;
    sqlPedidos_MySql_Itensgift_price: TShortintField;
    sqlPedidos_MySql_Itensfree: TShortintField;
    cdsPedidos_MySql_Itensorders_products_id: TIntegerField;
    cdsPedidos_MySql_Itensorders_id: TIntegerField;
    cdsPedidos_MySql_Itensproducts_id: TIntegerField;
    cdsPedidos_MySql_Itensproducts_model: TStringField;
    cdsPedidos_MySql_Itensproducts_name: TStringField;
    cdsPedidos_MySql_Itensproducts_price: TFMTBCDField;
    cdsPedidos_MySql_Itensfinal_price: TFMTBCDField;
    cdsPedidos_MySql_Itensproducts_tax: TFMTBCDField;
    cdsPedidos_MySql_Itensproducts_quantity: TIntegerField;
    cdsPedidos_MySql_Itensproducts_weight: TSingleField;
    cdsPedidos_MySql_Itensproducts_peso_cubico: TSingleField;
    cdsPedidos_MySql_Itensproducts_cod_ref: TStringField;
    cdsPedidos_MySql_Itensanexo: TStringField;
    cdsPedidos_MySql_Itensdownload_count: TShortintField;
    cdsPedidos_MySql_Itensparceiro_id: TIntegerField;
    cdsPedidos_MySql_Itensconfiguracao: TStringField;
    cdsPedidos_MySql_Itensgift: TShortintField;
    cdsPedidos_MySql_Itensgift_card: TMemoField;
    cdsPedidos_MySql_Itensgift_price: TShortintField;
    cdsPedidos_MySql_Itensfree: TShortintField;
    cdsPedidos_MySql_Dados: TClientDataSet;
    cdsPedidos_MySql_Dadosorders_id: TIntegerField;
    cdsPedidos_MySql_Dadosorders_comment: TMemoField;
    cdsPedidos_MySql_Dadoscustomers_id: TIntegerField;
    cdsPedidos_MySql_Dadoscustomers_name: TStringField;
    cdsPedidos_MySql_Dadoscustomers_lastname: TStringField;
    cdsPedidos_MySql_Dadoscustomers_firstname: TStringField;
    cdsPedidos_MySql_Dadoscustomers_company: TStringField;
    cdsPedidos_MySql_Dadoscustomers_street_address: TStringField;
    cdsPedidos_MySql_Dadoscustomers_street_number: TIntegerField;
    cdsPedidos_MySql_Dadoscustomers_street_complemento: TStringField;
    cdsPedidos_MySql_Dadoscustomers_suburb: TStringField;
    cdsPedidos_MySql_Dadoscustomers_city: TStringField;
    cdsPedidos_MySql_Dadoscustomers_postcode: TStringField;
    cdsPedidos_MySql_Dadoscustomers_state: TStringField;
    cdsPedidos_MySql_Dadoscustomers_country: TStringField;
    cdsPedidos_MySql_Dadoscustomers_ddd: TIntegerField;
    cdsPedidos_MySql_Dadoscustomers_telephone: TStringField;
    cdsPedidos_MySql_Dadoscustomers_email_address: TStringField;
    cdsPedidos_MySql_Dadoscustomers_address_format_id: TIntegerField;
    cdsPedidos_MySql_Dadosdelivery_firstname: TStringField;
    cdsPedidos_MySql_Dadosdelivery_lastname: TStringField;
    cdsPedidos_MySql_Dadosdelivery_company: TStringField;
    cdsPedidos_MySql_Dadosdelivery_street_address: TStringField;
    cdsPedidos_MySql_Dadosdelivery_street_number: TIntegerField;
    cdsPedidos_MySql_Dadosdelivery_street_complemento: TStringField;
    cdsPedidos_MySql_Dadosdelivery_suburb: TStringField;
    cdsPedidos_MySql_Dadosdelivery_city: TStringField;
    cdsPedidos_MySql_Dadosdelivery_postcode: TStringField;
    cdsPedidos_MySql_Dadosdelivery_state: TStringField;
    cdsPedidos_MySql_Dadosdelivery_country: TStringField;
    cdsPedidos_MySql_Dadosdelivery_address_format_id: TIntegerField;
    cdsPedidos_MySql_Dadosbilling_name: TStringField;
    cdsPedidos_MySql_Dadosbilling_company: TStringField;
    cdsPedidos_MySql_Dadosbilling_street_address: TStringField;
    cdsPedidos_MySql_Dadosbilling_street_number: TIntegerField;
    cdsPedidos_MySql_Dadosbilling_street_complemento: TStringField;
    cdsPedidos_MySql_Dadosbilling_suburb: TStringField;
    cdsPedidos_MySql_Dadosbilling_city: TStringField;
    cdsPedidos_MySql_Dadosbilling_postcode: TStringField;
    cdsPedidos_MySql_Dadosbilling_state: TStringField;
    cdsPedidos_MySql_Dadosbilling_country: TStringField;
    cdsPedidos_MySql_Dadosbilling_address_format_id: TIntegerField;
    cdsPedidos_MySql_Dadospayment_method: TStringField;
    cdsPedidos_MySql_Dadospayment_title: TStringField;
    cdsPedidos_MySql_Dadospayment_n_parcelas: TShortintField;
    cdsPedidos_MySql_Dadospayment_card_info: TMemoField;
    cdsPedidos_MySql_Dadospayment_url: TStringField;
    cdsPedidos_MySql_Dadosshipping_method: TStringField;
    cdsPedidos_MySql_Dadosshipping_date: TDateField;
    cdsPedidos_MySql_Dadosshipping_time: TStringField;
    cdsPedidos_MySql_Dadosshipping_tracking_code: TStringField;
    cdsPedidos_MySql_Dadoslast_modified: TSQLTimeStampField;
    cdsPedidos_MySql_Dadosdate_purchased: TSQLTimeStampField;
    cdsPedidos_MySql_Dadosorders_status: TIntegerField;
    cdsPedidos_MySql_Dadosorders_date_finished: TSQLTimeStampField;
    cdsPedidos_MySql_Dadoscurrency: TStringField;
    cdsPedidos_MySql_Dadoscurrency_value: TFMTBCDField;
    cdsPedidos_MySql_Dadosendereco_ip: TStringField;
    cdsPedidos_MySql_Dadosparceiro_id: TIntegerField;
    cdsPedidos_MySql_Dadosid_lista: TIntegerField;
    cdsPedidos_MySql_Dadosid_lista_customer_list: TIntegerField;
    cdsPedidos_MySql_Dadosorder_total: TSingleField;
    cdsPedidos_MySql_Dadosimportado: TIntegerField;
    cdsPedidos_MySql_Dadosabandoned_notify: TIntegerField;
    cdsPedidos_MySql_Dadosml_order_id: TIntegerField;
    cdsPedidos_Vendas_Dados: TClientDataSet;
    cdsPedidos_Vendas_Itens: TClientDataSet;
    cdsPedidos_Vendas_DadosEMPRESA: TStringField;
    cdsPedidos_Vendas_DadosFILIAL: TStringField;
    cdsPedidos_Vendas_DadosNUMERO: TIntegerField;
    cdsPedidos_Vendas_DadosSITUACAO: TStringField;
    cdsPedidos_Vendas_DadosEMISSAO: TDateField;
    cdsPedidos_Vendas_DadosESPECIEDOCUMENTO: TStringField;
    cdsPedidos_Vendas_DadosVENDEDOR: TIntegerField;
    cdsPedidos_Vendas_DadosCLIENTE: TIntegerField;
    cdsPedidos_Vendas_DadosNOMECLIENTE: TStringField;
    cdsPedidos_Vendas_DadosUF: TStringField;
    cdsPedidos_Vendas_DadosTIPOENDERECO: TStringField;
    cdsPedidos_Vendas_DadosCLIENTEENTREGA: TIntegerField;
    cdsPedidos_Vendas_DadosCONDICAOPAGAMENTO: TIntegerField;
    cdsPedidos_Vendas_DadosFORMAPAGAMENTO: TStringField;
    cdsPedidos_Vendas_DadosCRITERIO: TStringField;
    cdsPedidos_Vendas_DadosTABELA: TIntegerField;
    cdsPedidos_Vendas_DadosMOEDA: TStringField;
    cdsPedidos_Vendas_DadosTAXA: TFloatField;
    cdsPedidos_Vendas_DadosTIPOPRECO: TStringField;
    cdsPedidos_Vendas_DadosTRANSPORTADORA: TIntegerField;
    cdsPedidos_Vendas_DadosCATEGORIA: TStringField;
    cdsPedidos_Vendas_DadosSTATUSENTREGA: TStringField;
    cdsPedidos_Vendas_DadosVALORMERCADORIAS: TFloatField;
    cdsPedidos_Vendas_DadosDESCONTO: TFloatField;
    cdsPedidos_Vendas_DadosVALORDESCONTO: TFloatField;
    cdsPedidos_Vendas_DadosCOMISSAO: TFloatField;
    cdsPedidos_Vendas_DadosBASECOMISSAO: TFloatField;
    cdsPedidos_Vendas_DadosVALORCOMISSAO: TFloatField;
    cdsPedidos_Vendas_DadosTIPOFRETE: TStringField;
    cdsPedidos_Vendas_DadosVALORFRETE: TFloatField;
    cdsPedidos_Vendas_DadosVALORSEGURO: TFloatField;
    cdsPedidos_Vendas_DadosVALORDESPESAS: TFloatField;
    cdsPedidos_Vendas_DadosVOLUMES: TFloatField;
    cdsPedidos_Vendas_DadosESPECIE: TStringField;
    cdsPedidos_Vendas_DadosMARCA: TStringField;
    cdsPedidos_Vendas_DadosPESOLIQUIDO: TFloatField;
    cdsPedidos_Vendas_DadosPESOBRUTO: TFloatField;
    cdsPedidos_Vendas_DadosVALORFINANCEIRO: TFloatField;
    cdsPedidos_Vendas_DadosVALORBRUTO: TFloatField;
    cdsPedidos_Vendas_DadosVALORLIQUIDO: TFloatField;
    cdsPedidos_Vendas_DadosBASEIPI: TFloatField;
    cdsPedidos_Vendas_DadosVALORIPI: TFloatField;
    cdsPedidos_Vendas_DadosBASEICMS: TFloatField;
    cdsPedidos_Vendas_DadosVALORICMS: TFloatField;
    cdsPedidos_Vendas_DadosBASEICMSST: TFloatField;
    cdsPedidos_Vendas_DadosVALORICMSST: TFloatField;
    cdsPedidos_Vendas_DadosBASEISSA: TFloatField;
    cdsPedidos_Vendas_DadosVALORISSA: TFloatField;
    cdsPedidos_Vendas_DadosBASEISSR: TFloatField;
    cdsPedidos_Vendas_DadosVALORISSR: TFloatField;
    cdsPedidos_Vendas_DadosBASEPISA: TFloatField;
    cdsPedidos_Vendas_DadosVALORPISA: TFloatField;
    cdsPedidos_Vendas_DadosBASEPISR: TFloatField;
    cdsPedidos_Vendas_DadosVALORPISR: TFloatField;
    cdsPedidos_Vendas_DadosBASECOFINSA: TFloatField;
    cdsPedidos_Vendas_DadosVALORCOFINSA: TFloatField;
    cdsPedidos_Vendas_DadosBASECOFINSR: TFloatField;
    cdsPedidos_Vendas_DadosVALORCOFINSR: TFloatField;
    cdsPedidos_Vendas_DadosBASECSLLR: TFloatField;
    cdsPedidos_Vendas_DadosVALORCSLLR: TFloatField;
    cdsPedidos_Vendas_DadosBASEIRRFA: TFloatField;
    cdsPedidos_Vendas_DadosVALORIRRFA: TFloatField;
    cdsPedidos_Vendas_DadosBASEIRRFR: TFloatField;
    cdsPedidos_Vendas_DadosVALORIRRFR: TFloatField;
    cdsPedidos_Vendas_DadosBASEINSSA: TFloatField;
    cdsPedidos_Vendas_DadosVALORINSSA: TFloatField;
    cdsPedidos_Vendas_DadosBASEINSSR: TFloatField;
    cdsPedidos_Vendas_DadosVALORINSSR: TFloatField;
    cdsPedidos_Vendas_DadosNUMEROINTERNO: TStringField;
    cdsPedidos_Vendas_DadosULTIMOORCAMENTO: TIntegerField;
    cdsPedidos_Vendas_DadosULTIMANOTA: TIntegerField;
    cdsPedidos_Vendas_DadosULTIMOPREFIXO: TStringField;
    cdsPedidos_Vendas_DadosULTIMOFATURAMENTO: TDateField;
    cdsPedidos_Vendas_DadosULTIMASAIDA: TDateField;
    cdsPedidos_Vendas_DadosCNPJCPF: TStringField;
    cdsPedidos_Vendas_DadosORIGEM: TStringField;
    cdsPedidos_Vendas_DadosPRIORIDADE: TIntegerField;
    cdsPedidos_Vendas_DadosSTATUS: TStringField;
    cdsPedidos_Vendas_DadosUSUARIO: TIntegerField;
    cdsPedidos_Vendas_DadosUFEMBARQUE: TStringField;
    cdsPedidos_Vendas_DadosLOCALEMBARQUE: TStringField;
    cdsPedidos_Vendas_DadosNOMELOCALEMBARQUE: TStringField;
    cdsPedidos_Vendas_DadosOBSERVACAO: TStringField;
    cdsPedidos_Vendas_DadosIDNFEREF: TStringField;
    cdsPedidos_Vendas_DadosIDSFA: TStringField;
    cdsPedidos_Vendas_DadosIMPRESSO: TStringField;
    cdsPedidos_Vendas_DadosCOLETA: TStringField;
    cdsPedidos_Vendas_DadosDATACOLETA: TDateField;
    cdsPedidos_Vendas_DadosHORACOLETA: TTimeField;
    cdsPedidos_Vendas_DadosSTATUSCOLETA: TStringField;
    cdsPedidos_Vendas_DadosBASETRIBUTOS: TFloatField;
    cdsPedidos_Vendas_DadosVALORTRIBUTOS: TFloatField;
    cdsPedidos_Vendas_DadosDATACRIACAO: TSQLTimeStampField;
    cdsPedidos_Vendas_DadossqlPedidos_Vendas_Itens: TDataSetField;
    cdsPedidos_Vendas_ItensEMPRESA: TStringField;
    cdsPedidos_Vendas_ItensFILIAL: TStringField;
    cdsPedidos_Vendas_ItensNUMERO: TIntegerField;
    cdsPedidos_Vendas_ItensITEM: TIntegerField;
    cdsPedidos_Vendas_ItensPRODUTO: TStringField;
    cdsPedidos_Vendas_ItensDESCRICAO: TStringField;
    cdsPedidos_Vendas_ItensPRIMEIRAUNIDADE: TStringField;
    cdsPedidos_Vendas_ItensLOCAL: TStringField;
    cdsPedidos_Vendas_ItensQUANTIDADE: TFloatField;
    cdsPedidos_Vendas_ItensUNITARIO: TFloatField;
    cdsPedidos_Vendas_ItensUNITARIOMOEDA: TFloatField;
    cdsPedidos_Vendas_ItensTOTAL: TFloatField;
    cdsPedidos_Vendas_ItensVALORFINANCEIRO: TFloatField;
    cdsPedidos_Vendas_ItensVALORBRUTO: TFloatField;
    cdsPedidos_Vendas_ItensVALORLIQUIDO: TFloatField;
    cdsPedidos_Vendas_ItensDESCONTO: TFloatField;
    cdsPedidos_Vendas_ItensVALORDESCONTO: TFloatField;
    cdsPedidos_Vendas_ItensCOMISSAO: TFloatField;
    cdsPedidos_Vendas_ItensBASECOMISSAO: TFloatField;
    cdsPedidos_Vendas_ItensVALORCOMISSAO: TFloatField;
    cdsPedidos_Vendas_ItensVALORDESPESAS: TFloatField;
    cdsPedidos_Vendas_ItensVALORFRETE: TFloatField;
    cdsPedidos_Vendas_ItensVALORSEGURO: TFloatField;
    cdsPedidos_Vendas_ItensPRECOLISTA: TFloatField;
    cdsPedidos_Vendas_ItensENTREGA: TDateField;
    cdsPedidos_Vendas_ItensREGRA: TIntegerField;
    cdsPedidos_Vendas_ItensCODIGOFISCAL: TStringField;
    cdsPedidos_Vendas_ItensCLASSIFICACAOFISCAL: TStringField;
    cdsPedidos_Vendas_ItensMARGEMLUCRO: TFloatField;
    cdsPedidos_Vendas_ItensIPI: TFloatField;
    cdsPedidos_Vendas_ItensBASEIPI: TFloatField;
    cdsPedidos_Vendas_ItensVALORIPI: TFloatField;
    cdsPedidos_Vendas_ItensCSTIPI: TStringField;
    cdsPedidos_Vendas_ItensICMS: TFloatField;
    cdsPedidos_Vendas_ItensBASEICMS: TFloatField;
    cdsPedidos_Vendas_ItensVALORICMS: TFloatField;
    cdsPedidos_Vendas_ItensBASEICMSST: TFloatField;
    cdsPedidos_Vendas_ItensCSTICMS: TStringField;
    cdsPedidos_Vendas_ItensORIGEMST: TStringField;
    cdsPedidos_Vendas_ItensVALORICMSST: TFloatField;
    cdsPedidos_Vendas_ItensISS: TFloatField;
    cdsPedidos_Vendas_ItensBASEISSA: TFloatField;
    cdsPedidos_Vendas_ItensVALORISSA: TFloatField;
    cdsPedidos_Vendas_ItensBASEISSR: TFloatField;
    cdsPedidos_Vendas_ItensVALORISSR: TFloatField;
    cdsPedidos_Vendas_ItensPISA: TFloatField;
    cdsPedidos_Vendas_ItensBASEPISA: TFloatField;
    cdsPedidos_Vendas_ItensVALORPISA: TFloatField;
    cdsPedidos_Vendas_ItensPISR: TFloatField;
    cdsPedidos_Vendas_ItensBASEPISR: TFloatField;
    cdsPedidos_Vendas_ItensVALORPISR: TFloatField;
    cdsPedidos_Vendas_ItensCOFINSA: TFloatField;
    cdsPedidos_Vendas_ItensBASECOFINSA: TFloatField;
    cdsPedidos_Vendas_ItensVALORCOFINSA: TFloatField;
    cdsPedidos_Vendas_ItensCOFINSR: TFloatField;
    cdsPedidos_Vendas_ItensBASECOFINSR: TFloatField;
    cdsPedidos_Vendas_ItensVALORCOFINSR: TFloatField;
    cdsPedidos_Vendas_ItensCSLLR: TFloatField;
    cdsPedidos_Vendas_ItensBASECSLLR: TFloatField;
    cdsPedidos_Vendas_ItensVALORCSLLR: TFloatField;
    cdsPedidos_Vendas_ItensIRRF: TFloatField;
    cdsPedidos_Vendas_ItensBASEIRRFA: TFloatField;
    cdsPedidos_Vendas_ItensVALORIRRFA: TFloatField;
    cdsPedidos_Vendas_ItensBASEIRRFR: TFloatField;
    cdsPedidos_Vendas_ItensVALORIRRFR: TFloatField;
    cdsPedidos_Vendas_ItensINSS: TFloatField;
    cdsPedidos_Vendas_ItensBASEINSSA: TFloatField;
    cdsPedidos_Vendas_ItensVALORINSSA: TFloatField;
    cdsPedidos_Vendas_ItensBASEINSSR: TFloatField;
    cdsPedidos_Vendas_ItensVALORINSSR: TFloatField;
    cdsPedidos_Vendas_ItensPESOLIQUIDO: TFloatField;
    cdsPedidos_Vendas_ItensPESOBRUTO: TFloatField;
    cdsPedidos_Vendas_ItensUNITARIOPL: TFloatField;
    cdsPedidos_Vendas_ItensUNITARIOPB: TFloatField;
    cdsPedidos_Vendas_ItensNUMEROOV: TIntegerField;
    cdsPedidos_Vendas_ItensITEMOV: TIntegerField;
    cdsPedidos_Vendas_ItensQUANTIDADELIBERADA: TFloatField;
    cdsPedidos_Vendas_ItensPEDIDOCLIENTE: TStringField;
    cdsPedidos_Vendas_ItensITEMPEDIDOCLIENTE: TIntegerField;
    cdsPedidos_Vendas_ItensDOCUMENTOORIGEM: TIntegerField;
    cdsPedidos_Vendas_ItensPREFIXOORIGEM: TStringField;
    cdsPedidos_Vendas_ItensITEMORIGEM: TIntegerField;
    cdsPedidos_Vendas_ItensFATURADO: TFloatField;
    cdsPedidos_Vendas_ItensELIMINADO: TFloatField;
    cdsPedidos_Vendas_ItensPRODUTOCLIENTE: TStringField;
    cdsPedidos_Vendas_ItensTIPOPRECO: TStringField;
    cdsPedidos_Vendas_ItensSITUACAO: TStringField;
    cdsPedidos_Vendas_ItensLOTE: TStringField;
    cdsPedidos_Vendas_ItensVALIDADELOTE: TDateField;
    cdsPedidos_Vendas_ItensTRIBUTOS: TFloatField;
    cdsPedidos_Vendas_ItensBASETRIBUTOS: TFloatField;
    cdsPedidos_Vendas_ItensVALORTRIBUTOS: TFloatField;
    cdsPedidos_Vendas_ItensADICIONAIS: TStringField;
    cdsPedidos_Vendas_ItensDATACRIACAO: TSQLTimeStampField;
    cdsClientes: TClientDataSet;
    dspcCad: TDSProviderConnection;
    cdsClientesEMPRESA: TStringField;
    cdsClientesFILIAL: TStringField;
    cdsClientesCODIGO: TIntegerField;
    cdsClientesSTATUS: TStringField;
    cdsClientesDATACADASTRO: TDateField;
    cdsClientesNOME: TStringField;
    cdsClientesPESSOA: TStringField;
    cdsClientesREDUZIDO: TStringField;
    cdsClientesENDERECO: TStringField;
    cdsClientesNUMERO: TStringField;
    cdsClientesCOMPLEMENTO: TStringField;
    cdsClientesUF: TStringField;
    cdsClientesMUNICIPIO: TStringField;
    cdsClientesCMUNICIPIO: TStringField;
    cdsClientesBAIRRO: TStringField;
    cdsClientesCEP: TStringField;
    cdsClientesCNPJ: TStringField;
    cdsClientesCPF: TStringField;
    cdsClientesIE: TStringField;
    cdsClientesINDICADORIE: TStringField;
    cdsClientesIM: TStringField;
    cdsClientesRG: TStringField;
    cdsClientesEMAIL: TStringField;
    cdsClientesHOMEPAGE: TStringField;
    cdsClientesDATANASCIMENTO: TDateField;
    cdsClientesDDI: TStringField;
    cdsClientesDDD: TStringField;
    cdsClientesTELEFONE: TStringField;
    cdsClientesFAX: TStringField;
    cdsClientesCELULAR: TStringField;
    cdsClientesCONTATO: TStringField;
    cdsClientesCPAIS: TStringField;
    cdsClientesNPAIS: TStringField;
    cdsClientesIDESTRANGEIRO: TStringField;
    cdsClientesVENDEDOR: TIntegerField;
    cdsClientesCOMISSAO: TFloatField;
    cdsClientesBANCO: TIntegerField;
    cdsClientesAGENCIA: TStringField;
    cdsClientesCONTA: TStringField;
    cdsClientesGRUPO: TIntegerField;
    cdsClientesTRANSPORTADORA: TIntegerField;
    cdsClientesCONCEITO: TStringField;
    cdsClientesRISCO: TStringField;
    cdsClientesCLASSEVALOR: TStringField;
    cdsClientesTABELA: TStringField;
    cdsClientesLIMITECREDITO: TFloatField;
    cdsClientesVENCIMENTOLC: TDateField;
    cdsClientesPRIMEIRACOMPRA: TDateField;
    cdsClientesULTIMACOMPRA: TDateField;
    cdsClientesSEGMENTOMERCADO: TIntegerField;
    cdsClientesMAIORSALDOLC: TFloatField;
    cdsClientesMENORSALDOLC: TFloatField;
    cdsClientesMAIORCOMPRA: TFloatField;
    cdsClientesMENORCOMPRA: TFloatField;
    cdsClientesMEDIAATRASO: TFloatField;
    cdsClientesSALDODEVEDOR: TFloatField;
    cdsClientesNUMEROCOMPRAS: TIntegerField;
    cdsClientesTITULOSABERTOS: TIntegerField;
    cdsClientesTITULOSATRASADOS: TIntegerField;
    cdsClientesSALDOATRASADOS: TFloatField;
    cdsClientesNUMEROPAGTOS: TIntegerField;
    cdsClientesMAIORTITULO: TFloatField;
    cdsClientesMENORTITULO: TFloatField;
    cdsClientesCHEQUESDEVOLVIDOS: TIntegerField;
    cdsClientesULTIMADEVOLUCAO: TDateField;
    cdsClientesOBSERVACAO: TStringField;
    cdsClientesTIPOFRETE: TStringField;
    cdsClientesDESCONTO: TFloatField;
    cdsClientesCONDICAOPAGAMENTO: TIntegerField;
    cdsClientesFORMAPAGAMENTO: TStringField;
    cdsClientesCATEGORIA: TStringField;
    cdsClientesTIPOPRECO: TStringField;
    cdsClientesENDERECOENTREGA: TStringField;
    cdsClientesNUMEROENTREGA: TStringField;
    cdsClientesCOMPLEMENTOENTREGA: TStringField;
    cdsClientesUFENTREGA: TStringField;
    cdsClientesMUNICIPIOENTREGA: TStringField;
    cdsClientesBAIRROENTREGA: TStringField;
    cdsClientesCEPENTREGA: TStringField;
    cdsClientesENDERECOCOBRANCA: TStringField;
    cdsClientesNUMEROCOBRANCA: TStringField;
    cdsClientesCOMPLEMENTOCOBRANCA: TStringField;
    cdsClientesUFCOBRANCA: TStringField;
    cdsClientesMUNICIPIOCOBRANCA: TStringField;
    cdsClientesBAIRROCOBRANCA: TStringField;
    cdsClientesCEPCOBRANCA: TStringField;
    cdsClientesSUFRAMA: TStringField;
    cdsClientesNOTIFICAEMAIL: TStringField;
    cdsClientesEMAILNFE: TStringField;
    cdsClientesFORNECEDOR: TIntegerField;
    cdsClientesULTIMACONSULTA: TDateField;
    cdsClientesSTATUSCONSULTA: TStringField;
    cdsClientesROTA: TStringField;
    cdsClientesREGIAO: TStringField;
    cdsClientesHASH: TStringField;
    cdsClientesDATACRIACAO: TSQLTimeStampField;
    sqlClientes_Mysql: TSQLDataSet;
    sqlClientes_Mysqlcustomers_id: TIntegerField;
    sqlClientes_Mysqlcustomers_tipo_pessoa: TStringField;
    sqlClientes_Mysqlcustomers_status: TShortintField;
    sqlClientes_Mysqlcustomers_grupo: TIntegerField;
    sqlClientes_Mysqlcustomers_desconto: TSingleField;
    sqlClientes_Mysqlcustomers_gender: TStringField;
    sqlClientes_Mysqlcustomers_firstname: TStringField;
    sqlClientes_Mysqlcustomers_lastname: TStringField;
    sqlClientes_Mysqlcustomers_cpf_cnpj: TStringField;
    sqlClientes_Mysqlcustomers_rg: TStringField;
    sqlClientes_Mysqlcustomers_comoconheceu: TStringField;
    sqlClientes_Mysqlcustomers_estadocivil: TStringField;
    sqlClientes_Mysqlcustomers_dob: TDateField;
    sqlClientes_Mysqlcustomers_email_address: TStringField;
    sqlClientes_Mysqlcustomers_default_address_id: TIntegerField;
    sqlClientes_Mysqlcustomers_ddd1: TIntegerField;
    sqlClientes_Mysqlcustomers_telephone: TStringField;
    sqlClientes_Mysqlcustomers_ddd2: TIntegerField;
    sqlClientes_Mysqlcustomers_fax: TStringField;
    sqlClientes_Mysqlcustomers_ddd3: TIntegerField;
    sqlClientes_Mysqlcustomers_celular: TStringField;
    sqlClientes_Mysqlcustomers_password: TStringField;
    sqlClientes_Mysqlcustomers_newsletter: TStringField;
    sqlClientes_Mysqlcustomers_prazo_boleto: TIntegerField;
    sqlClientes_Mysqlcustomers_newsletter_enviado: TShortintField;
    sqlClientes_Mysqlcustomers_num_orders: TShortintField;
    sqlClientes_Mysqlcustomers_credit: TSingleField;
    sqlClientes_Mysqlcustomers_info_date_of_last_logon: TSQLTimeStampField;
    sqlClientes_Mysqlcustomers_info_number_of_logons: TIntegerField;
    sqlClientes_Mysqlcustomers_info_date_account_created: TSQLTimeStampField;
    sqlClientes_Mysqlcustomers_info_date_account_last_modified: TSQLTimeStampField;
    sqlClientes_Mysqlglobal_product_notifications: TShortintField;
    sqlClientes_Mysqlcustomers_last_ip: TStringField;
    sqlClientes_MysqlImportado: TIntegerField;
    dspcServer: TDSProviderConnection;
    sqlPedidos_Mysql_Clientes: TSQLDataSet;
    sqlPedidos_Mysql_Clientescustomers_id: TIntegerField;
    sqlPedidos_Mysql_Clientescustomers_tipo_pessoa: TStringField;
    sqlPedidos_Mysql_Clientescustomers_status: TShortintField;
    sqlPedidos_Mysql_Clientescustomers_grupo: TIntegerField;
    sqlPedidos_Mysql_Clientescustomers_desconto: TSingleField;
    sqlPedidos_Mysql_Clientescustomers_gender: TStringField;
    sqlPedidos_Mysql_Clientescustomers_firstname: TStringField;
    sqlPedidos_Mysql_Clientescustomers_lastname: TStringField;
    sqlPedidos_Mysql_Clientescustomers_cpf_cnpj: TStringField;
    sqlPedidos_Mysql_Clientescustomers_rg: TStringField;
    sqlPedidos_Mysql_Clientescustomers_comoconheceu: TStringField;
    sqlPedidos_Mysql_Clientescustomers_estadocivil: TStringField;
    sqlPedidos_Mysql_Clientescustomers_dob: TDateField;
    sqlPedidos_Mysql_Clientescustomers_email_address: TStringField;
    sqlPedidos_Mysql_Clientescustomers_default_address_id: TIntegerField;
    sqlPedidos_Mysql_Clientescustomers_ddd1: TIntegerField;
    sqlPedidos_Mysql_Clientescustomers_telephone: TStringField;
    sqlPedidos_Mysql_Clientescustomers_ddd2: TIntegerField;
    sqlPedidos_Mysql_Clientescustomers_fax: TStringField;
    sqlPedidos_Mysql_Clientescustomers_ddd3: TIntegerField;
    sqlPedidos_Mysql_Clientescustomers_celular: TStringField;
    sqlPedidos_Mysql_Clientescustomers_password: TStringField;
    sqlPedidos_Mysql_Clientescustomers_newsletter: TStringField;
    sqlPedidos_Mysql_Clientescustomers_prazo_boleto: TIntegerField;
    sqlPedidos_Mysql_Clientescustomers_newsletter_enviado: TShortintField;
    sqlPedidos_Mysql_Clientescustomers_num_orders: TShortintField;
    sqlPedidos_Mysql_Clientescustomers_credit: TSingleField;
    sqlPedidos_Mysql_Clientescustomers_info_date_of_last_logon: TSQLTimeStampField;
    sqlPedidos_Mysql_Clientescustomers_info_number_of_logons: TIntegerField;
    sqlPedidos_Mysql_Clientescustomers_info_date_account_created: TSQLTimeStampField;
    sqlPedidos_Mysql_Clientescustomers_info_date_account_last_modified: TSQLTimeStampField;
    sqlPedidos_Mysql_Clientesglobal_product_notifications: TShortintField;
    sqlPedidos_Mysql_Clientescustomers_last_ip: TStringField;
    sqlPedidos_Mysql_ClientesImportado: TIntegerField;
    dspPedidos_Mysql_Clientes: TDataSetProvider;
    cdsPedidos_Mysql_Clientes: TClientDataSet;
    cdsPedidos_Mysql_Clientescustomers_id: TIntegerField;
    cdsPedidos_Mysql_Clientescustomers_tipo_pessoa: TStringField;
    cdsPedidos_Mysql_Clientescustomers_status: TShortintField;
    cdsPedidos_Mysql_Clientescustomers_grupo: TIntegerField;
    cdsPedidos_Mysql_Clientescustomers_desconto: TSingleField;
    cdsPedidos_Mysql_Clientescustomers_gender: TStringField;
    cdsPedidos_Mysql_Clientescustomers_firstname: TStringField;
    cdsPedidos_Mysql_Clientescustomers_lastname: TStringField;
    cdsPedidos_Mysql_Clientescustomers_cpf_cnpj: TStringField;
    cdsPedidos_Mysql_Clientescustomers_rg: TStringField;
    cdsPedidos_Mysql_Clientescustomers_comoconheceu: TStringField;
    cdsPedidos_Mysql_Clientescustomers_estadocivil: TStringField;
    cdsPedidos_Mysql_Clientescustomers_dob: TDateField;
    cdsPedidos_Mysql_Clientescustomers_email_address: TStringField;
    cdsPedidos_Mysql_Clientescustomers_default_address_id: TIntegerField;
    cdsPedidos_Mysql_Clientescustomers_ddd1: TIntegerField;
    cdsPedidos_Mysql_Clientescustomers_telephone: TStringField;
    cdsPedidos_Mysql_Clientescustomers_ddd2: TIntegerField;
    cdsPedidos_Mysql_Clientescustomers_fax: TStringField;
    cdsPedidos_Mysql_Clientescustomers_ddd3: TIntegerField;
    cdsPedidos_Mysql_Clientescustomers_celular: TStringField;
    cdsPedidos_Mysql_Clientescustomers_password: TStringField;
    cdsPedidos_Mysql_Clientescustomers_newsletter: TStringField;
    cdsPedidos_Mysql_Clientescustomers_prazo_boleto: TIntegerField;
    cdsPedidos_Mysql_Clientescustomers_newsletter_enviado: TShortintField;
    cdsPedidos_Mysql_Clientescustomers_num_orders: TShortintField;
    cdsPedidos_Mysql_Clientescustomers_credit: TSingleField;
    cdsPedidos_Mysql_Clientescustomers_info_date_of_last_logon: TSQLTimeStampField;
    cdsPedidos_Mysql_Clientescustomers_info_number_of_logons: TIntegerField;
    cdsPedidos_Mysql_Clientescustomers_info_date_account_created: TSQLTimeStampField;
    cdsPedidos_Mysql_Clientescustomers_info_date_account_last_modified: TSQLTimeStampField;
    cdsPedidos_Mysql_Clientesglobal_product_notifications: TShortintField;
    cdsPedidos_Mysql_Clientescustomers_last_ip: TStringField;
    cdsPedidos_Mysql_ClientesImportado: TIntegerField;
    sqlAux: TSQLDataSet;
    sqlProdutos: TSQLDataSet;
    sqlProdutosproducts_id: TIntegerField;
    sqlProdutosproducts_name: TStringField;
    sqlProdutosproducts_description: TMemoField;
    sqlProdutosproducts_description2: TStringField;
    sqlProdutosproducts_quantity: TIntegerField;
    sqlProdutosproducts_price: TSingleField;
    sqlProdutosproducts_cod_ref: TStringField;
    dspProdutos: TDataSetProvider;
    cdsProdutos: TClientDataSet;
    cdsProdutosproducts_id: TIntegerField;
    cdsProdutosproducts_cod_ref: TStringField;
    cdsProdutosproducts_name: TStringField;
    cdsProdutosproducts_description: TMemoField;
    cdsProdutosproducts_description2: TStringField;
    cdsProdutosproducts_quantity: TIntegerField;
    cdsProdutosproducts_price: TSingleField;
    dspClientes_Mysql: TDataSetProvider;
    cdsClientes_Mysql: TClientDataSet;
    dtsClientes_Mysql: TDataSource;
    cdsClientes_Mysqlcustomers_id: TIntegerField;
    cdsClientes_Mysqlcustomers_tipo_pessoa: TStringField;
    cdsClientes_Mysqlcustomers_status: TShortintField;
    cdsClientes_Mysqlcustomers_grupo: TIntegerField;
    cdsClientes_Mysqlcustomers_desconto: TSingleField;
    cdsClientes_Mysqlcustomers_gender: TStringField;
    cdsClientes_Mysqlcustomers_firstname: TStringField;
    cdsClientes_Mysqlcustomers_lastname: TStringField;
    cdsClientes_Mysqlcustomers_cpf_cnpj: TStringField;
    cdsClientes_Mysqlcustomers_rg: TStringField;
    cdsClientes_Mysqlcustomers_comoconheceu: TStringField;
    cdsClientes_Mysqlcustomers_estadocivil: TStringField;
    cdsClientes_Mysqlcustomers_dob: TDateField;
    cdsClientes_Mysqlcustomers_email_address: TStringField;
    cdsClientes_Mysqlcustomers_default_address_id: TIntegerField;
    cdsClientes_Mysqlcustomers_ddd1: TIntegerField;
    cdsClientes_Mysqlcustomers_telephone: TStringField;
    cdsClientes_Mysqlcustomers_ddd2: TIntegerField;
    cdsClientes_Mysqlcustomers_fax: TStringField;
    cdsClientes_Mysqlcustomers_ddd3: TIntegerField;
    cdsClientes_Mysqlcustomers_celular: TStringField;
    cdsClientes_Mysqlcustomers_password: TStringField;
    cdsClientes_Mysqlcustomers_newsletter: TStringField;
    cdsClientes_Mysqlcustomers_prazo_boleto: TIntegerField;
    cdsClientes_Mysqlcustomers_newsletter_enviado: TShortintField;
    cdsClientes_Mysqlcustomers_num_orders: TShortintField;
    cdsClientes_Mysqlcustomers_credit: TSingleField;
    cdsClientes_Mysqlcustomers_info_date_of_last_logon: TSQLTimeStampField;
    cdsClientes_Mysqlcustomers_info_number_of_logons: TIntegerField;
    cdsClientes_Mysqlcustomers_info_date_account_created: TSQLTimeStampField;
    cdsClientes_Mysqlcustomers_info_date_account_last_modified: TSQLTimeStampField;
    cdsClientes_Mysqlglobal_product_notifications: TShortintField;
    cdsClientes_Mysqlcustomers_last_ip: TStringField;
    cdsClientes_MysqlImportado: TIntegerField;
    cdsClientes_Endereco_Mysql: TClientDataSet;
    dspClientes_Endereco_Mysql: TDataSetProvider;
    sqlClientes_Endereco_Mysql: TSQLDataSet;
    sqlClientes_Endereco_Mysqladdress_book_id: TIntegerField;
    sqlClientes_Endereco_Mysqlcustomers_id: TIntegerField;
    sqlClientes_Endereco_Mysqlentry_gender: TStringField;
    sqlClientes_Endereco_Mysqlentry_company: TStringField;
    sqlClientes_Endereco_Mysqlentry_company_fantasia: TStringField;
    sqlClientes_Endereco_Mysqlentry_inscricao_estadual: TStringField;
    sqlClientes_Endereco_Mysqlentry_empresa_atividade: TStringField;
    sqlClientes_Endereco_Mysqlentry_firstname: TStringField;
    sqlClientes_Endereco_Mysqlentry_lastname: TStringField;
    sqlClientes_Endereco_Mysqlentry_street_address: TStringField;
    sqlClientes_Endereco_Mysqlentry_street_number: TIntegerField;
    sqlClientes_Endereco_Mysqlentry_street_complemento: TStringField;
    sqlClientes_Endereco_Mysqlentry_suburb: TStringField;
    sqlClientes_Endereco_Mysqlentry_postcode: TStringField;
    sqlClientes_Endereco_Mysqlentry_city: TStringField;
    sqlClientes_Endereco_Mysqlentry_country_id: TIntegerField;
    sqlClientes_Endereco_Mysqlentry_zone_id: TIntegerField;
    cdsClientes_Endereco_Mysqladdress_book_id: TIntegerField;
    cdsClientes_Endereco_Mysqlcustomers_id: TIntegerField;
    cdsClientes_Endereco_Mysqlentry_gender: TStringField;
    cdsClientes_Endereco_Mysqlentry_company: TStringField;
    cdsClientes_Endereco_Mysqlentry_company_fantasia: TStringField;
    cdsClientes_Endereco_Mysqlentry_inscricao_estadual: TStringField;
    cdsClientes_Endereco_Mysqlentry_empresa_atividade: TStringField;
    cdsClientes_Endereco_Mysqlentry_firstname: TStringField;
    cdsClientes_Endereco_Mysqlentry_lastname: TStringField;
    cdsClientes_Endereco_Mysqlentry_street_address: TStringField;
    cdsClientes_Endereco_Mysqlentry_street_number: TIntegerField;
    cdsClientes_Endereco_Mysqlentry_street_complemento: TStringField;
    cdsClientes_Endereco_Mysqlentry_suburb: TStringField;
    cdsClientes_Endereco_Mysqlentry_postcode: TStringField;
    cdsClientes_Endereco_Mysqlentry_city: TStringField;
    cdsClientes_Endereco_Mysqlentry_country_id: TIntegerField;
    cdsClientes_Endereco_Mysqlentry_zone_id: TIntegerField;
    sqlEstados_Mysql: TSQLDataSet;
    cdsEstados_Mysql: TClientDataSet;
    dspEstados_Mysql: TDataSetProvider;
    sqlEstados_Mysqlzone_id: TIntegerField;
    sqlEstados_Mysqlzone_country_id: TIntegerField;
    sqlEstados_Mysqlzone_code: TStringField;
    sqlEstados_Mysqlzone_name: TStringField;
    cdsEstados_Mysqlzone_id: TIntegerField;
    cdsEstados_Mysqlzone_country_id: TIntegerField;
    cdsEstados_Mysqlzone_code: TStringField;
    cdsEstados_Mysqlzone_name: TStringField;
    dtsClientes_Endereco_Mysql: TDataSource;
    cdsPedidos_Vendas_ItensNCM: TStringField;
    cdsPedidos_Vendas_ItensCEST: TStringField;
    cdsPedidos_Vendas_DadosBASEICMSDIF: TFloatField;
    cdsPedidos_Vendas_DadosVALORICMSDIF: TFloatField;
    cdsPedidos_Vendas_DadosBASEICMSFCP: TFloatField;
    cdsPedidos_Vendas_DadosVALORICMSFCP: TFloatField;
    cdsPedidos_Vendas_DadosBASEICMSPUFD: TFloatField;
    cdsPedidos_Vendas_DadosVALORICMSPUFD: TFloatField;
    cdsPedidos_Vendas_DadosBASEICMSPUFO: TFloatField;
    cdsPedidos_Vendas_DadosVALORICMSPUFO: TFloatField;
    cdsPedidos_Vendas_ItensICMSDIF: TFloatField;
    cdsPedidos_Vendas_ItensBASEICMSDIF: TFloatField;
    cdsPedidos_Vendas_ItensVALORICMSDIF: TFloatField;
    cdsPedidos_Vendas_ItensCSOSNICMS: TStringField;
    cdsPedidos_Vendas_ItensSALDODEVOLVER: TFloatField;
    cdsPedidos_Vendas_ItensBASEICMSFCP: TFloatField;
    cdsPedidos_Vendas_ItensVALORICMSFCP: TFloatField;
    cdsPedidos_Vendas_ItensBASEICMSPUFD: TFloatField;
    cdsPedidos_Vendas_ItensVALORICMSPUFD: TFloatField;
    cdsPedidos_Vendas_ItensBASEICMSPUFO: TFloatField;
    cdsPedidos_Vendas_ItensVALORICMSPUFO: TFloatField;
    cdsAuxiliar: TClientDataSet;
    cdsProdutos_Cadastro: TClientDataSet;
    cdsProdutos_CadastroEMPRESA: TStringField;
    cdsProdutos_CadastroFILIAL: TStringField;
    cdsProdutos_CadastroSTATUS: TStringField;
    cdsProdutos_CadastroCODIGO: TStringField;
    cdsProdutos_CadastroINTERNO: TStringField;
    cdsProdutos_CadastroDATACADASTRO: TDateField;
    cdsProdutos_CadastroDESCRICAO: TStringField;
    cdsProdutos_CadastroREDUZIDO: TStringField;
    cdsProdutos_CadastroGRUPO: TIntegerField;
    cdsProdutos_CadastroNOMEGRUPO: TStringField;
    cdsProdutos_CadastroSUBGRUPO: TIntegerField;
    cdsProdutos_CadastroFABRICANTE: TStringField;
    cdsProdutos_CadastroMARCA: TStringField;
    cdsProdutos_CadastroMODELO: TStringField;
    cdsProdutos_CadastroORIGEMPRODUTO: TStringField;
    cdsProdutos_CadastroNUMEROSERIE: TStringField;
    cdsProdutos_CadastroLOCALIZACAO: TStringField;
    cdsProdutos_CadastroREGRAENTRADA: TIntegerField;
    cdsProdutos_CadastroREGRASAIDA: TIntegerField;
    cdsProdutos_CadastroULTIMACOMPRA: TDateField;
    cdsProdutos_CadastroULTIMOPRECO: TFloatField;
    cdsProdutos_CadastroULTIMOFORNECEDOR: TIntegerField;
    cdsProdutos_CadastroCOMISSAO: TFloatField;
    cdsProdutos_CadastroSITUACAOTRIBUTARIA: TStringField;
    cdsProdutos_CadastroORIGEMST: TStringField;
    cdsProdutos_CadastroCLASSIFICACAOFISCAL: TStringField;
    cdsProdutos_CadastroNCM: TStringField;
    cdsProdutos_CadastroCEST: TStringField;
    cdsProdutos_CadastroTIPO: TStringField;
    cdsProdutos_CadastroPRIMEIRAUNIDADE: TStringField;
    cdsProdutos_CadastroLOCALPADRAO: TStringField;
    cdsProdutos_CadastroSEGUNDAUNIDADE: TStringField;
    cdsProdutos_CadastroTIPOCONVERSAO: TStringField;
    cdsProdutos_CadastroFATORCONVERSAO: TFloatField;
    cdsProdutos_CadastroCUSTOPADRAO: TFloatField;
    cdsProdutos_CadastroMOEDACUSTO: TStringField;
    cdsProdutos_CadastroCUSTOPADRAOMOEDA: TFloatField;
    cdsProdutos_CadastroULTIMACOTACAO: TFloatField;
    cdsProdutos_CadastroPESOLIQUIDO: TFloatField;
    cdsProdutos_CadastroPESOBRUTO: TFloatField;
    cdsProdutos_CadastroCODIGOBARRAS: TStringField;
    cdsProdutos_CadastroOBSERVACAO: TStringField;
    cdsProdutos_CadastroICMS: TFloatField;
    cdsProdutos_CadastroIPI: TFloatField;
    cdsProdutos_CadastroISS: TFloatField;
    cdsProdutos_CadastroII: TFloatField;
    cdsProdutos_CadastroMARGEMLUCRO: TFloatField;
    cdsProdutos_CadastroTRIBUTOS: TFloatField;
    cdsProdutos_CadastroFEDERAIS: TFloatField;
    cdsProdutos_CadastroESTADUAIS: TFloatField;
    cdsProdutos_CadastroMUNICIPAIS: TFloatField;
    cdsProdutos_CadastroESTOQUESEGURANCA: TFloatField;
    cdsProdutos_CadastroPONTOPEDIDO: TFloatField;
    cdsProdutos_CadastroULTIMOINVENTARIO: TDateField;
    cdsProdutos_CadastroPINVENTARIO: TIntegerField;
    cdsProdutos_CadastroESTOQUEMINIMO: TFloatField;
    cdsProdutos_CadastroESTOQUEMAXIMO: TFloatField;
    cdsProdutos_CadastroPRAZOENTREGA: TIntegerField;
    cdsProdutos_CadastroTIPOPRAZO: TStringField;
    cdsProdutos_CadastroLOTEECONOMICO: TFloatField;
    cdsProdutos_CadastroLOTEMINIMO: TFloatField;
    cdsProdutos_CadastroQUANTIDADEBASE: TFloatField;
    cdsProdutos_CadastroPRODUCAOMINIMA: TFloatField;
    cdsProdutos_CadastroPRECOCUSTO1: TFloatField;
    cdsProdutos_CadastroPRECOCUSTO2: TFloatField;
    cdsProdutos_CadastroPRECOCUSTO3: TFloatField;
    cdsProdutos_CadastroPRECOCUSTO4: TFloatField;
    cdsProdutos_CadastroPRECOCUSTO5: TFloatField;
    cdsProdutos_CadastroPRECOCUSTO6: TFloatField;
    cdsProdutos_CadastroPRECOCUSTO7: TFloatField;
    cdsProdutos_CadastroPRECOCUSTO8: TFloatField;
    cdsProdutos_CadastroPRECOCUSTO9: TFloatField;
    cdsProdutos_CadastroPRECOCUSTO10: TFloatField;
    cdsProdutos_CadastroPRECOVENDA1: TFloatField;
    cdsProdutos_CadastroPRECOVENDA2: TFloatField;
    cdsProdutos_CadastroPRECOVENDA3: TFloatField;
    cdsProdutos_CadastroPRECOVENDA4: TFloatField;
    cdsProdutos_CadastroPRECOVENDA5: TFloatField;
    cdsProdutos_CadastroPRECOVENDA6: TFloatField;
    cdsProdutos_CadastroPRECOVENDA7: TFloatField;
    cdsProdutos_CadastroPRECOVENDA8: TFloatField;
    cdsProdutos_CadastroPRECOVENDA9: TFloatField;
    cdsProdutos_CadastroPRECOVENDA10: TFloatField;
    cdsProdutos_CadastroPRECOANTIGO1: TFloatField;
    cdsProdutos_CadastroPRECOANTIGO2: TFloatField;
    cdsProdutos_CadastroPRECOANTIGO3: TFloatField;
    cdsProdutos_CadastroPRECOANTIGO4: TFloatField;
    cdsProdutos_CadastroPRECOANTIGO5: TFloatField;
    cdsProdutos_CadastroPRECOANTIGO6: TFloatField;
    cdsProdutos_CadastroPRECOANTIGO7: TFloatField;
    cdsProdutos_CadastroPRECOANTIGO8: TFloatField;
    cdsProdutos_CadastroPRECOANTIGO9: TFloatField;
    cdsProdutos_CadastroPRECOANTIGO10: TFloatField;
    cdsProdutos_CadastroPRECOMINIMO: TFloatField;
    cdsProdutos_CadastroPRECOMAXIMO: TFloatField;
    cdsProdutos_CadastroCORDESTAQUE: TIntegerField;
    cdsProdutos_CadastroIMAGEM: TStringField;
    cdsProdutos_CadastroCONTROLALOTE: TStringField;
    cdsProdutos_CadastroREGRAMULTIPLO: TIntegerField;
    cdsProdutos_CadastroULTIMAALTERACAOPRECO: TDateField;
    cdsProdutos_CadastroUSUARIOULTIMAALTERACAOPRECO: TIntegerField;
    cdsProdutos_CadastroNROFCI: TStringField;
    cdsProdutos_CadastroPERCENTUALFCI: TFloatField;
    cdsProdutos_CadastroCOR: TStringField;
    cdsProdutos_CadastroTAMANHO: TStringField;
    cdsProdutos_CadastroHASH: TStringField;
    cdsProdutos_CadastroINCLUIDO: TStringField;
    cdsProdutos_CadastroALTERADO: TStringField;
    cdsProdutos_CadastroDATACRIACAO: TSQLTimeStampField;
    dspcCustoms: TDSProviderConnection;
    cdsProdutos_CadastroCODIGOSERVICOISS: TStringField;
    cdsProdutos_CadastroUFICMSST: TStringField;
    cdsProdutos_CadastroFOTO: TBlobField;
    cdsProdutos_CadastroITEMNOVO: TStringField;
    cdsProdutos_CadastroATIVO: TStringField;
    cdsProdutos_CadastroNUMEROFCI: TStringField;
    cdsProdutos_CadastroVALIDADEMINIMA: TIntegerField;
    cdsProdutos_CadastroTIPOPRAZOVALIDADEMINIMA: TStringField;
    cdsProdutos_CadastroVALIDADEMINIMAMARKUP: TIntegerField;
    cdsProdutos_CadastroTIPOPRAZOVALIDADEMINIMAMARKUP: TStringField;
    cdsProdutos_CadastroPRODUZIDO: TStringField;
    cdsProdutos_CadastroIDESTOQUE: TIntegerField;
    SQLQuery1: TSQLQuery;
    procedure ServiceExecute(Sender: TService);
    procedure tmrMainTimer(Sender: TObject);
    procedure cdsPedidos_Vendas_DadosBeforeApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure cdsPedidos_Vendas_DadosReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure ServiceCreate(Sender: TObject);
    procedure ServiceAfterInstall(Sender: TService);
    procedure ServiceAfterUninstall(Sender: TService);
    procedure cdsClientesReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsClientesPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdsClientesEditError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdsClientesDeleteError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdsPedidos_Vendas_DadosPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdsPedidos_Vendas_DadosEditError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdsPedidos_Vendas_DadosDeleteError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdsPedidos_Vendas_DadosNewRecord(DataSet: TDataSet);
    procedure cdsPedidos_Vendas_ItensNewRecord(DataSet: TDataSet);
    procedure cdsPedidos_Vendas_ItensBeforePost(DataSet: TDataSet);
    procedure cdsPedidos_Vendas_DadosBeforePost(DataSet: TDataSet);
    procedure cdsPedidos_Vendas_ItensAfterPost(DataSet: TDataSet);
    procedure sqlPedidos_MySql_DadosBeforeOpen(DataSet: TDataSet);
    procedure sqlPedidos_MySql_DadosAfterOpen(DataSet: TDataSet);
    procedure ServicePause(Sender: TService; var Paused: Boolean);
    procedure ServiceContinue(Sender: TService; var Continued: Boolean);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure cdsClientesBeforePost(DataSet: TDataSet);
    procedure cdsPedidos_Vendas_DadosVALORFRETEValidate(Sender: TField);
    procedure AtribuiRateioItens(Campo: ShortString; ValorBase: Currency);
    procedure cdsPedidos_Vendas_DadosVALORDESCONTOValidate(Sender: TField);
    procedure cdsPedidos_Vendas_DadosBeforeOpen(DataSet: TDataSet);
    procedure cdsClientesBeforeOpen(DataSet: TDataSet);
    procedure cdsProdutos_CadastroBeforeOpen(DataSet: TDataSet);
    procedure cdsPedidos_Vendas_ItensBeforeInsert(DataSet: TDataSet);
  private
    DateTimeBase: TDateTime;
    PrecoExecutado: Boolean;
    Schedule: TSchedule;
    DetailItems: Integer;

    function FindCliente(Cliente: TCliente; const psEmpresa, psFilial: string): Boolean;overload;
    function FindProduto(Produto: TProduto; const psEmpresa, psFilial: string): Boolean;
    function FindCliente(const CPF_CNPJ, psEmpresa, psFilial: string): TCliente;overload;

    procedure ImportarClientes(const Codigo: Integer = 0);
    procedure ImportarProdutos(const Codigo: string = '');
    procedure ImportarPedidos();
    procedure ImportarClientesXLS(FileName: string);
    function UltimoProduto(const psEmpresa, psFilial: string): Integer;
    function UltimoCliente(const psEmpresa, psFilial: string): Integer;
    function FindPedido(Pedido: TPedido; const psEmpresa,
      psFilial: string): Boolean;
    function UltimoPedido(const psEmpresa, psFilial: string): Integer;
    procedure AtualizarEstoque();
  public
    procedure AtualizaValoresDados;
    procedure AtualizaValoresItens;
    procedure AtualizaTotais(Completo: Boolean);
    function GetServiceController: TServiceController; override;
  end;

var
  srvMobile: TsrvMobile;
  __SFACompany: String;
  __SFABranch: String;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

//uses {uAcessoSiteSol, uAcessoFtpTiggerComp,};

{$R *.DFM}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  srvMobile.Controller(CtrlCode);
end;

procedure TsrvMobile.AtualizaValoresItens;
var
  Tipo: String;
  CodigoFiscal: String;
  GeraFinanceiro: String;
  GeraEstoque: String;
  LiberaQuantidade: String;
  SituacaoTributaria: String;
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
  VarTributos: TTributos;
  VarICMSDiferido: TICMSDiferido;
  VarICMSFCP: TICMSFCP;
  VarICMSPUFD: TICMSPUFD;
  VarICMSPUFO: TICMSPUFO;
  Valores: TValores;
  Auxiliar: Double;
  //
  __Comissao: Single;
  dsAuxiliar: TDataSet;
  SchedulerCofiguration: TSchedule;
  Empresa, Filial: String;
begin

  TSuperClass.GetInstance.Config.Load(SchedulerCofiguration);

  if (cdsPedidos_Vendas_Itens.State in [dsEdit]) then
  begin
    if ((cdsPedidos_Vendas_ItensTOTAL.AsCurrency > 0) and (cdsPedidos_Vendas_ItensREGRA.AsCurrency > 0)) then
    begin
      try
        TSuperClass.GetInstance.DBFunctions.GetEntityOwner('REGRAS_FISCAIS', Empresa, Filial);
        dsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
          (Format('select * from REGRAS_FISCAIS where EMPRESA = %S and FILIAL = %S and CODIGO = %S',
          [QuotedStr(Empresa), QuotedStr(Filial), cdsPedidos_Vendas_ItensREGRA.AsString]));
        try
          // Pesquisando a regra de movimentação
          if Assigned(dsAuxiliar) then
            if not(dsAuxiliar.State in [dsInactive]) then
              if dsAuxiliar.RecordCount > 0 then
              begin
                Tipo := dsAuxiliar.FieldByName('TIPO').AsString;

                // Verificando o tipo de regra (entrada ou saída)
                if ((Tipo <> '1')) then
                  raise Exception.Create('Regra fiscal inválida para este tipo de documento')
                else
                begin
                  if ((dsAuxiliar.FieldByName('CODIGOFISCAL').AsString <> '0000')) then
                  begin
                    if (cdsPedidos_Vendas_DadosUF.AsString = 'EX') then // Exportação
                      CodigoFiscal := '7' + Copy(dsAuxiliar.FieldByName('CODIGOFISCAL').AsString, 2, 3)
                    else if (cdsPedidos_Vendas_DadosUF.AsString <> SchedulerCofiguration.State) then
                      CodigoFiscal := '6' + Copy(dsAuxiliar.FieldByName('CODIGOFISCAL').AsString, 2, 3)
                    else
                      CodigoFiscal := dsAuxiliar.FieldByName('CODIGOFISCAL').AsString;
                  end
                  else
                    CodigoFiscal := dsAuxiliar.FieldByName('CODIGOFISCAL').AsString;
                  GeraFinanceiro := dsAuxiliar.FieldByName('GERAFINANCEIRO').AsString;;
                  GeraEstoque := dsAuxiliar.FieldByName('GERAESTOQUE').AsString;
                  LiberaQuantidade := dsAuxiliar.FieldByName('LIBERAQUANTIDADE').AsString;
                  SituacaoTributaria := dsAuxiliar.FieldByName('SITUACAOTRIBUTARIA').AsString;;

                  // Tratamento para IPI
                  with VarIPI do
                  begin
                    Calcula := dsAuxiliar.FieldByName('CALCULAIPI').AsString;
                    if ((Calcula = uTypes.VB_YES)) then
                    begin
                      Aliquota := dsAuxiliar.FieldByName('IPI').AsFloat;
                      Despesas := dsAuxiliar.FieldByName('IPIDESPESAS').AsString;
                      Frete := dsAuxiliar.FieldByName('IPIFRETE').AsString;
                      Seguro := dsAuxiliar.FieldByName('IPISEGURO').AsString;
                      Desconto := dsAuxiliar.FieldByName('IPIDESCONTO').AsString;
                      II := dsAuxiliar.FieldByName('IPIII').AsString;
                      Reducao := dsAuxiliar.FieldByName('REDUCAOIPI').AsFloat;
                      AgregaValor := dsAuxiliar.FieldByName('AGREGAVALORIPI').AsString;
                    end;
                    CST := dsAuxiliar.FieldByName('CSTIPI').AsString;
                  end;

                  // Tratamento para ICMS
                  with VarICMS do
                  begin
                    Calcula := dsAuxiliar.FieldByName('CALCULAICMS').AsString;
                    if ((Calcula = uTypes.VB_YES)) then
                    begin
                      Aliquota := dsAuxiliar.FieldByName('ICMS').AsFloat; // Proveniente da regra fiscal
                      if (Aliquota = 0) then
                        Aliquota := TSuperClass.GetInstance.GenericsF.RetornaAliquotaICMSInterEstadual
                          (cdsPedidos_Vendas_DadosUF.AsString);
                      // Proveniente do estado destino
                      if (Aliquota = 0) then
                        Aliquota := cdsPedidos_Vendas_ItensICMS.AsFloat; // Proveniente do Produto
                      Despesas := dsAuxiliar.FieldByName('ICMSDESPESAS').AsString;
                      Frete := dsAuxiliar.FieldByName('ICMSFRETE').AsString;
                      Seguro := dsAuxiliar.FieldByName('ICMSSEGURO').AsString;
                      Desconto := dsAuxiliar.FieldByName('ICMSDESCONTO').AsString;
                      II := dsAuxiliar.FieldByName('ICMSII').AsString;
                      IPI := dsAuxiliar.FieldByName('ICMSIPI').AsString;
                      Reducao := dsAuxiliar.FieldByName('REDUCAOICMS').AsFloat;
                      AgregaValor := dsAuxiliar.FieldByName('AGREGAVALORICMS').AsString;
                    end;
                    OrigemST := dsAuxiliar.FieldByName('ORIGEMST').AsString;
                    if dsAuxiliar.FieldByName('ORIGEMST').AsString = '' then
                      VarICMS.OrigemST := cdsPedidos_Vendas_ItensORIGEMST.AsString;
                    CST := dsAuxiliar.FieldByName('CSTICMS').AsString;
                    CSOSN := dsAuxiliar.FieldByName('ICMSCSOSN').AsString;
                  end;

                  // Tratamento para ICMS Diferimento
                  with VarICMSDiferido do
                  begin
                    Calcula := dsAuxiliar.FieldByName('CALCULAICMSDIFERIDO').AsString;
                    if ((Calcula = '1') or (Calcula = '2')) then // Diferido ou diferido por redução
                    begin
                      Aliquota := dsAuxiliar.FieldByName('ICMSDIFERIDO').AsFloat;
                    end;
                  end;

                  // Tratamento para ICMS de Fundo de Combate a Pobreza
                  with VarICMSFCP do
                  begin
                    if (dsAuxiliar.FieldByName('ICMSFCP').AsFloat > 0) then
                      Calcula := uTypes.VB_YES
                    else
                      Calcula := uTypes.VB_NO;
                    Aliquota := dsAuxiliar.FieldByName('ICMSFCP').AsFloat;
                    AliquotaICMSInternaOrigem := TSuperClass.GetInstance.GenericsF.RetornaAliquotaICMSInterna
                      (cdsPedidos_Vendas_DadosUF.AsString);
                  end;

                  // Tratamento para ICMS de Fundo de Combate a Pobreza
                  with VarICMSPUFD do
                  begin
                    if (dsAuxiliar.FieldByName('ICMSPUFD').AsFloat > 0) then
                      Calcula := uTypes.VB_YES
                    else
                      Calcula := uTypes.VB_NO;
                    Aliquota := dsAuxiliar.FieldByName('ICMSPUFD').AsFloat;
                    AliquotaICMSInternaOrigem := TSuperClass.GetInstance.GenericsF.RetornaAliquotaICMSInterna
                      (cdsPedidos_Vendas_DadosUF.AsString);
                  end;

                  // Tratamento para ICMS de Fundo de Combate a Pobreza
                  with VarICMSPUFO do
                  begin
                    if (dsAuxiliar.FieldByName('ICMSPUFO').AsFloat > 0) then
                      Calcula := uTypes.VB_YES
                    else
                      Calcula := uTypes.VB_NO;
                    Aliquota := dsAuxiliar.FieldByName('ICMSPUFO').AsFloat;
                    AliquotaICMSInternaOrigem := TSuperClass.GetInstance.GenericsF.RetornaAliquotaICMSInterna
                      (cdsPedidos_Vendas_DadosUF.AsString);
                  end;

                  // Tratamento para ICMS - Substituição tributária
                  with VarICMSST do
                  begin
                    Calcula := dsAuxiliar.FieldByName('CALCULAICMSST').AsString;
                    if ((Calcula = uTypes.VB_YES)) then
                    begin
                      Aliquota := dsAuxiliar.FieldByName('ICMSST').AsFloat; // Proveniente da regra fiscal
                      if (Aliquota = 0) then
                        Aliquota := TSuperClass.GetInstance.GenericsF.RetornaAliquotaICMSInterna
                          (cdsPedidos_Vendas_DadosUF.AsString);
                      // sysRetornaAliquotaICMS(cdsOrcamentos_Vendas_DadosUF.AsString);  // Proveniente do estado destino
                      Despesas := dsAuxiliar.FieldByName('ICMSSTDESPESAS').AsString;
                      Frete := dsAuxiliar.FieldByName('ICMSSTFRETE').AsString;
                      Seguro := dsAuxiliar.FieldByName('ICMSSTSEGURO').AsString;
                      Desconto := dsAuxiliar.FieldByName('ICMSSTDESCONTO').AsString;
                      II := dsAuxiliar.FieldByName('ICMSSTII').AsString;
                      IPI := dsAuxiliar.FieldByName('ICMSSTIPI').AsString;
                      Reducao := dsAuxiliar.FieldByName('REDUCAOICMSST').AsFloat;
                      Tipo := dsAuxiliar.FieldByName('TIPOICMSST').AsString;
                      AgregaValor := dsAuxiliar.FieldByName('AGREGAVALORICMSST').AsString;
                    end;
                  end;

                  // Tratamento para ISS
                  with VarISS do
                  begin
                    Calcula := dsAuxiliar.FieldByName('CALCULAISS').AsString;
                    if ((Calcula = uTypes.VB_YES)) then
                    begin
                      Aliquota := dsAuxiliar.FieldByName('ISS').AsFloat;
                      Despesas := dsAuxiliar.FieldByName('ISSDESPESAS').AsString;
                      Frete := dsAuxiliar.FieldByName('ISSFRETE').AsString;
                      Seguro := dsAuxiliar.FieldByName('ISSSEGURO').AsString;
                      Desconto := dsAuxiliar.FieldByName('ISSDESCONTO').AsString;
                      Reducao := dsAuxiliar.FieldByName('REDUCAOISS').AsFloat;
                      Recolhe := dsAuxiliar.FieldByName('RECOLHEISS').AsString;
                    end;
                  end;

                  // Tratamento para PIS - Apuração
                  with VarPISApuracao do
                  begin
                    Calcula := dsAuxiliar.FieldByName('CALCULAPISAPURACAO').AsString;
                    if ((Calcula = uTypes.VB_YES)) then
                    begin
                      Aliquota := dsAuxiliar.FieldByName('PISAPURACAO').AsFloat;
                      Despesas := dsAuxiliar.FieldByName('PISAPURACAODESPESAS').AsString;
                      Frete := dsAuxiliar.FieldByName('PISAPURACAOFRETE').AsString;
                      Seguro := dsAuxiliar.FieldByName('PISAPURACAOSEGURO').AsString;
                      Desconto := dsAuxiliar.FieldByName('PISAPURACAODESCONTO').AsString;
                      ICMSST := dsAuxiliar.FieldByName('PISAPURACAOICMSST').AsString;
                      Reducao := dsAuxiliar.FieldByName('REDUCAOPISAPURACAO').AsFloat;
                    end;
                    CST := dsAuxiliar.FieldByName('CSTPIS').AsString;
                  end;

                  // Tratamento para COFINS - Apuração
                  with VarCOFINSApuracao do
                  begin
                    Calcula := dsAuxiliar.FieldByName('CALCULACOFINSAPURACAO').AsString;
                    if ((Calcula = uTypes.VB_YES)) then
                    begin
                      Aliquota := dsAuxiliar.FieldByName('COFINSAPURACAO').AsFloat;
                      Despesas := dsAuxiliar.FieldByName('COFINSAPURACAODESPESAS').AsString;
                      Frete := dsAuxiliar.FieldByName('COFINSAPURACAOFRETE').AsString;
                      Seguro := dsAuxiliar.FieldByName('COFINSAPURACAOSEGURO').AsString;
                      Desconto := dsAuxiliar.FieldByName('COFINSAPURACAODESCONTO').AsString;
                      ICMSST := dsAuxiliar.FieldByName('COFINSAPURACAOICMSST').AsString;
                      Reducao := dsAuxiliar.FieldByName('REDUCAOCOFINSAPURACAO').AsFloat;
                    end;
                    CST := dsAuxiliar.FieldByName('CSTCOFINS').AsString;
                  end;

                  // Tratamento para PIS - Retenção
                  with VarPISRetencao do
                  begin
                    Calcula := dsAuxiliar.FieldByName('CALCULAPISRETENCAO').AsString;
                    if ((Calcula = uTypes.VB_YES)) then
                    begin
                      Aliquota := dsAuxiliar.FieldByName('PISRETENCAO').AsFloat;
                      Despesas := dsAuxiliar.FieldByName('PISRETENCAODESPESAS').AsString;
                      Frete := dsAuxiliar.FieldByName('PISRETENCAOFRETE').AsString;
                      Seguro := dsAuxiliar.FieldByName('PISRETENCAOSEGURO').AsString;
                      Desconto := dsAuxiliar.FieldByName('PISRETENCAODESCONTO').AsString;
                      Reducao := dsAuxiliar.FieldByName('REDUCAOPISAPURACAO').AsFloat;
                      Importacao := (dsAuxiliar.FieldByName('CALCULAII').AsString = uTypes.VB_YES);
                    end;
                  end;

                  // Tratamento para COFINS - Retenção
                  with VarCOFINSRetencao do
                  begin
                    Calcula := dsAuxiliar.FieldByName('CALCULACOFINSRETENCAO').AsString;
                    if ((Calcula = uTypes.VB_YES)) then
                    begin
                      Aliquota := dsAuxiliar.FieldByName('COFINSRETENCAO').AsFloat;
                      Despesas := dsAuxiliar.FieldByName('COFINSRETENCAODESPESAS').AsString;
                      Frete := dsAuxiliar.FieldByName('COFINSRETENCAOFRETE').AsString;
                      Seguro := dsAuxiliar.FieldByName('COFINSRETENCAOSEGURO').AsString;
                      Desconto := dsAuxiliar.FieldByName('COFINSRETENCAODESCONTO').AsString;
                      Reducao := dsAuxiliar.FieldByName('REDUCAOCOFINSRETENCAO').AsFloat;
                      Importacao := (dsAuxiliar.FieldByName('CALCULAII').AsString = uTypes.VB_YES);
                    end;
                  end;

                  // Tratamento para CSLL - Retenção
                  with VarCSLLRetencao do
                  begin
                    Calcula := dsAuxiliar.FieldByName('CALCULACSLLRETENCAO').AsString;
                    if ((Calcula = uTypes.VB_YES)) then
                    begin
                      Aliquota := dsAuxiliar.FieldByName('CSLLRETENCAO').AsFloat;
                      Despesas := dsAuxiliar.FieldByName('CSLLRETENCAODESPESAS').AsString;
                      Frete := dsAuxiliar.FieldByName('CSLLRETENCAOFRETE').AsString;
                      Seguro := dsAuxiliar.FieldByName('CSLLRETENCAOSEGURO').AsString;
                      Desconto := dsAuxiliar.FieldByName('CSLLRETENCAODESCONTO').AsString;
                      Reducao := dsAuxiliar.FieldByName('REDUCAOCSLLRETENCAO').AsFloat;
                      Importacao := (dsAuxiliar.FieldByName('CALCULAII').AsString = uTypes.VB_YES);
                    end;
                  end;

                  // Tratamento para INSS
                  with VarINSS do
                  begin
                    Calcula := dsAuxiliar.FieldByName('CALCULAINSS').AsString;
                    if ((Calcula = uTypes.VB_YES)) then
                    begin
                      Aliquota := dsAuxiliar.FieldByName('INSS').AsFloat;
                      Despesas := dsAuxiliar.FieldByName('INSSDESPESAS').AsString;
                      Frete := dsAuxiliar.FieldByName('INSSFRETE').AsString;
                      Seguro := dsAuxiliar.FieldByName('INSSSEGURO').AsString;
                      Desconto := dsAuxiliar.FieldByName('INSSDESCONTO').AsString;
                      Reducao := dsAuxiliar.FieldByName('REDUCAOINSS').AsFloat;
                      Recolhe := dsAuxiliar.FieldByName('RECOLHEINSS').AsString;
                    end;
                  end;

                  // Tratamento para IRRF
                  with VarIRRF do
                  begin
                    Calcula := dsAuxiliar.FieldByName('CALCULAIRRF').AsString;
                    if ((Calcula = uTypes.VB_YES)) then
                    begin
                      Aliquota := dsAuxiliar.FieldByName('IRRF').AsFloat;
                      Despesas := dsAuxiliar.FieldByName('IRRFDESPESAS').AsString;
                      Frete := dsAuxiliar.FieldByName('IRRFFRETE').AsString;
                      Seguro := dsAuxiliar.FieldByName('IRRFSEGURO').AsString;
                      Desconto := dsAuxiliar.FieldByName('IRRFDESCONTO').AsString;
                      Reducao := dsAuxiliar.FieldByName('REDUCAOIRRF').AsFloat;
                      Recolhe := dsAuxiliar.FieldByName('RECOLHEIRRF').AsString;
                    end;
                  end;

                  // Calcula os Tributos
                  with VarTributos do
                  begin
                    Calcula := dsAuxiliar.FieldByName('CALCULATRIBUTOS').AsString;
                    if ((Calcula = uTypes.VB_YES)) then
                    begin
                      Aliquota := dsAuxiliar.FieldByName('TRIBUTOS').AsFloat;
                    end;
                  end;

                  // Inicializando os valores a serem calculados para o item
                  TSuperClass.GetInstance.GenericsF.InicializaValores(Valores);

                  // Calculando os impostos
                  with Valores do
                  begin
                    // Calculando os campos de impostos para o item em questão
                    BaseItem :=
                      RoundTo((cdsPedidos_Vendas_ItensQUANTIDADE.AsFloat * cdsPedidos_Vendas_ItensUNITARIO.AsFloat), -2);
                    ValorDespesas := cdsPedidos_Vendas_ItensVALORDESPESAS.AsCurrency;
                    ValorFrete := cdsPedidos_Vendas_ItensVALORFRETE.AsCurrency;
                    ValorSeguro := cdsPedidos_Vendas_ItensVALORSEGURO.AsCurrency;
                    Desconto := cdsPedidos_Vendas_ItensDESCONTO.AsFloat;
                    ValorDesconto := cdsPedidos_Vendas_ItensVALORDESCONTO.AsCurrency;
                    MargemLucro := cdsPedidos_Vendas_ItensMARGEMLUCRO.AsFloat;

                    // Calculando o IPI
                    IPI := TSuperClass.GetInstance.GenericsF.CalculaIPI(VarIPI, BaseItem, ValorDespesas, ValorFrete, ValorSeguro,
                      ValorDesconto, 0);

                    // Calculando o ICMS
                    ICMS := TSuperClass.GetInstance.GenericsF.CalculaICMS(VarICMS, BaseItem, ValorDespesas, ValorFrete,
                      ValorSeguro, ValorDesconto, IPI.Valor, 0, 0, 0);

                    // Calculando o ICMS Diferimento
                    ICMSDiferido := TSuperClass.GetInstance.GenericsF.CalculaICMSDif(VarICMSDiferido, ICMS.Valor);
                    if (ICMSDiferido.Valor > 0) then
                      ICMS.Valor := ICMS.Valor - ICMSDiferido.Valor;

                    // Calculando o Fundo de Amparo a Pobreza
                    ICMSFCP := TSuperClass.GetInstance.GenericsF.CalculaICMSFCP(VarICMSFCP, ICMS);

                    // Calculado o ICMS da Partilha de Destino
                    ICMSPUFD := TSuperClass.GetInstance.GenericsF.CalculaICMSPUFD(VarICMSPUFD, ICMS);

                    // Calculando o ICMS da Partilha Origem
                    ICMSPUFO := TSuperClass.GetInstance.GenericsF.CalculaICMSPUFO(VarICMSPUFO, ICMS);

                    // Calculando o ICMS ST
                    ICMSST := TSuperClass.GetInstance.GenericsF.CalculaICMSST(VarICMSST, ICMS.Valor, BaseItem, ValorDespesas,
                      ValorFrete, ValorSeguro, ValorDesconto, IPI.Valor, 0, 0, 0, MargemLucro);

                    // Calculando o ISS - Apuração/Retenção
                    if (VarISS.Recolhe = uTypes.VB_YES) then
                      ISSApuracao := TSuperClass.GetInstance.GenericsF.CalculaISS(VarISS, BaseItem, ValorDespesas, ValorFrete,
                        ValorSeguro, ValorDesconto)
                    else
                      ISSRetencao := TSuperClass.GetInstance.GenericsF.CalculaISS(VarISS, BaseItem, ValorDespesas, ValorFrete,
                        ValorSeguro, ValorDesconto);

                    // Calculando o PIS
                    PISApuracao := TSuperClass.GetInstance.GenericsF.CalculaPISApuracao(VarPISApuracao, BaseItem, ValorDespesas,
                      ValorFrete, ValorSeguro, ValorDesconto, ICMSST.Valor, 0, 0, 0, 0);

                    // Calculando o COFINS
                    COFINSApuracao := TSuperClass.GetInstance.GenericsF.CalculaCOFINSApuracao(VarCOFINSApuracao, BaseItem,
                      ValorDespesas, ValorFrete, ValorSeguro, ValorDesconto, ICMSST.Valor, 0, 0, 0, 0);

                    // Calculando o PIS (Retenção)
                    PISRetencao := TSuperClass.GetInstance.GenericsF.CalculaPISRetencao(VarPISRetencao, BaseItem, ValorDespesas,
                      ValorFrete, ValorSeguro, ValorDesconto);

                    // Calculando o COFINS (Retenção)
                    COFINSRetencao := TSuperClass.GetInstance.GenericsF.CalculaCOFINSRetencao(VarCOFINSRetencao, BaseItem,
                      ValorDespesas, ValorFrete, ValorSeguro, ValorDesconto);

                    // Calculando o CSLL (Retenção)
                    CSLLRetencao := TSuperClass.GetInstance.GenericsF.CalculaCSLLRetencao(VarCSLLRetencao, BaseItem,
                      ValorDespesas, ValorFrete, ValorSeguro, ValorDesconto);

                    // Calculando o INSS
                    if (VarINSS.Recolhe = uTypes.VB_NO) then
                      INSSApuracao := TSuperClass.GetInstance.GenericsF.CalculaINSS(VarINSS, BaseItem, ValorDespesas, ValorFrete,
                        ValorSeguro, ValorDesconto)
                    else
                    begin
                      INSSRetencao := TSuperClass.GetInstance.GenericsF.CalculaINSS(VarINSS, BaseItem, ValorDespesas, ValorFrete,
                        ValorSeguro, ValorDesconto);
                      if INSSRetencao.Valor < TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_LIMITE_RETENCAO_INSS') then
                      begin
                        INSSRetencao.Aliquota := 0;
                        INSSRetencao.Base := 0;
                        INSSRetencao.Valor := 0;
                      end;
                    end;

                    // Calculando o IRRF
                    if (VarIRRF.Recolhe = uTypes.VB_NO) then
                      IRRFApuracao := TSuperClass.GetInstance.GenericsF.CalculaIRRF(VarIRRF, BaseItem, ValorDespesas, ValorFrete,
                        ValorSeguro, ValorDesconto)
                    else
                    begin
                      IRRFRetencao := TSuperClass.GetInstance.GenericsF.CalculaIRRF(VarIRRF, BaseItem, ValorDespesas, ValorFrete,
                        ValorSeguro, ValorDesconto);
                      if IRRFRetencao.Valor < TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_LIMITE_RETENCAO_IRRF') then
                      begin
                        IRRFRetencao.Aliquota := 0;
                        IRRFRetencao.Base := 0;
                        IRRFRetencao.Valor := 0;
                      end;
                    end;

                    // Calculando os Tributos
                    if (VarTributos.Calcula = uTypes.VB_YES) then
                      Tributos := TSuperClass.GetInstance.GenericsF.CalculaTributos(VarTributos, BaseItem);

                    __Comissao := 0;

                    if (Comissao = 0) then
                    begin
                      BaseComissao := 0;
                      Comissao := 0;
                      ValorComissao := 0;
                    end;

                    // Verificando se gera financeiro
                    if ((GeraFinanceiro = uTypes.VB_YES)) then
                    begin
                      ValorFinanceiro :=
                        ((BaseItem + IfThen(VarIPI.AgregaValor = uTypes.VB_YES, IPI.Valor,
                        0) - IfThen(VarICMS.AgregaValor = uTypes.VB_YES, 0, ICMS.Valor) +
                        IfThen(VarICMSST.AgregaValor = uTypes.VB_YES, ICMSST.Valor, 0) + ValorDespesas + ValorFrete + ValorSeguro)
                        - ValorDesconto);

                      // Verificando se Recolhe ISS, Se sim, subtrai o valor
                      ValorFinanceiro := ValorFinanceiro - IfThen(VarISS.Recolhe = uTypes.VB_YES, ISSRetencao.Valor, 0);

                      // Verificando se Recolhe INSS, Se sim, subtrai o valor
                      ValorFinanceiro := ValorFinanceiro - IfThen(VarINSS.Recolhe = uTypes.VB_YES, INSSRetencao.Valor, 0);

                      // Verificando se Recolhe IRRF, Se sim, subtrai o valor
                      ValorFinanceiro := ValorFinanceiro - IfThen(VarIRRF.Recolhe = uTypes.VB_YES, IRRFRetencao.Valor, 0);
                    end;
                    //
                    ValorBruto := (BaseItem + IfThen(VarIPI.AgregaValor = uTypes.VB_YES, IPI.Valor, 0) +
                      IfThen(VarICMSST.AgregaValor = uTypes.VB_YES, ICMSST.Valor, 0) + ValorDespesas + ValorFrete + ValorSeguro);
                    ValorLiquido :=
                      ((BaseItem + IfThen(VarIPI.AgregaValor = uTypes.VB_YES, IPI.Valor,
                      0) - IfThen(VarICMS.AgregaValor = uTypes.VB_YES, 0, ICMS.Valor) +
                      IfThen(VarICMSST.AgregaValor = uTypes.VB_YES, ICMSST.Valor, 0) + ValorDespesas + ValorFrete + ValorSeguro) -
                      ValorDesconto);

                    // Verificando se Recolhe ISS, Se sim, subtrai o valor
                    ValorLiquido := ValorLiquido - IfThen(VarISS.Recolhe = uTypes.VB_YES, ISSRetencao.Valor, 0);

                    // Verificando se Recolhe INSS, Se sim, subtrai o valor
                    ValorLiquido := ValorLiquido - IfThen(VarINSS.Recolhe = uTypes.VB_YES, INSSRetencao.Valor, 0);

                    // Verificando se Recolhe IRRF, Se sim, subtrai o valor
                    ValorLiquido := ValorLiquido - IfThen(VarIRRF.Recolhe = uTypes.VB_YES, IRRFRetencao.Valor, 0);

                    // Atribuindo o valor financeiro
                    cdsPedidos_Vendas_ItensVALORFINANCEIRO.AsCurrency := ValorFinanceiro;

                    // Atribuindo o valor Bruto
                    cdsPedidos_Vendas_ItensVALORBRUTO.AsCurrency := ValorBruto;

                    // Atribuindo o valor Bruto
                    cdsPedidos_Vendas_ItensVALORLIQUIDO.AsCurrency := ValorLiquido;

                    // Atribuindo o valor da comissão
                    cdsPedidos_Vendas_ItensDESCONTO.AsCurrency := Desconto;
                    cdsPedidos_Vendas_ItensVALORDESCONTO.AsCurrency := ValorDesconto;

                    cdsPedidos_Vendas_ItensCODIGOFISCAL.AsString := CodigoFiscal;

                    // IPI
                    cdsPedidos_Vendas_ItensIPI.AsFloat := IPI.Aliquota;
                    cdsPedidos_Vendas_ItensBASEIPI.AsCurrency := IPI.Base;
                    cdsPedidos_Vendas_ItensVALORIPI.AsCurrency := IPI.Valor;
                    cdsPedidos_Vendas_ItensCSTIPI.AsString := VarIPI.CST;

                    // ICMS
                    cdsPedidos_Vendas_ItensICMS.AsFloat := ICMS.Aliquota;
                    cdsPedidos_Vendas_ItensBASEICMS.AsCurrency := ICMS.Base;
                    cdsPedidos_Vendas_ItensVALORICMS.AsCurrency := ICMS.Valor;
                    if (VarICMS.OrigemST <> '') then
                      cdsPedidos_Vendas_ItensORIGEMST.AsString := VarICMS.OrigemST;
                    cdsPedidos_Vendas_ItensCSTICMS.AsString := VarICMS.CST;
                    cdsPedidos_Vendas_ItensCSOSNICMS.AsString := VarICMS.CSOSN;

                    // Atribuindo o ICMS Diferimento
                    cdsPedidos_Vendas_ItensICMSDIF.AsFloat := ICMSDiferido.Aliquota;
                    cdsPedidos_Vendas_ItensBASEICMSDIF.AsCurrency := ICMSDiferido.Base;
                    cdsPedidos_Vendas_ItensVALORICMSDIF.AsCurrency := ICMSDiferido.Valor;

                    // Atribuindo o ICMS FCP
                    cdsPedidos_Vendas_ItensBASEICMSFCP.AsCurrency := ICMSFCP.Base;
                    cdsPedidos_Vendas_ItensVALORICMSFCP.AsCurrency := ICMSFCP.Valor;

                    // Atribuindo o ICMS Partilha Destino
                    cdsPedidos_Vendas_ItensBASEICMSPUFD.AsCurrency := ICMSPUFD.Base;
                    cdsPedidos_Vendas_ItensVALORICMSPUFD.AsCurrency := ICMSPUFD.Valor;

                    // Atribuindo o ICMS Partilha Origem
                    cdsPedidos_Vendas_ItensBASEICMSPUFO.AsCurrency := ICMSPUFO.Base;
                    cdsPedidos_Vendas_ItensVALORICMSPUFO.AsCurrency := ICMSPUFO.Valor;

                    // ICMS ST
                    // cdsPedidos_Vendas_ItensMARGEMLUCRO.OnValidate := Nil;
                    // cdsPedidos_Vendas_ItensMARGEMLUCRO.AsFloat    := ICMSST.Aliquota;
                    cdsPedidos_Vendas_ItensBASEICMSST.AsCurrency := ICMSST.Base;
                    cdsPedidos_Vendas_ItensVALORICMSST.AsCurrency := ICMSST.Valor;
                    // cdsPedidos_Vendas_ItensMARGEMLUCRO.OnValidate := cdsPedidos_Vendas_ItensMARGEMLUCROValidate;

                    // Tratamento para o ISS
                    cdsPedidos_Vendas_ItensISS.AsFloat := IfThen(VarISS.Recolhe = uTypes.VB_NO, ISSApuracao.Aliquota,
                      ISSRetencao.Aliquota);
                    cdsPedidos_Vendas_ItensBASEISSA.AsCurrency := ISSApuracao.Base;
                    cdsPedidos_Vendas_ItensVALORISSA.AsCurrency := ISSApuracao.Valor;
                    cdsPedidos_Vendas_ItensBASEISSR.AsCurrency := ISSRetencao.Base;
                    cdsPedidos_Vendas_ItensVALORISSR.AsCurrency := ISSRetencao.Valor;

                    // Tratamento para o PIS - Apuração
                    cdsPedidos_Vendas_ItensPISA.AsFloat := PISApuracao.Aliquota;
                    cdsPedidos_Vendas_ItensBASEPISA.AsCurrency := PISApuracao.Base;
                    cdsPedidos_Vendas_ItensVALORPISA.AsCurrency := PISApuracao.Valor;

                    // Tratamento para o COFINS - Apuração
                    cdsPedidos_Vendas_ItensCOFINSA.AsFloat := COFINSApuracao.Aliquota;
                    cdsPedidos_Vendas_ItensBASECOFINSA.AsCurrency := COFINSApuracao.Base;
                    cdsPedidos_Vendas_ItensVALORCOFINSA.AsCurrency := COFINSApuracao.Valor;

                    // Tratamento para o PIS Retenção
                    cdsPedidos_Vendas_ItensPISR.AsFloat := PISRetencao.Aliquota;
                    cdsPedidos_Vendas_ItensBASEPISR.AsFloat := PISRetencao.Base;
                    cdsPedidos_Vendas_ItensVALORPISR.AsCurrency := PISRetencao.Valor;

                    // Tratamento para o COFINS Retenção
                    cdsPedidos_Vendas_ItensCOFINSR.AsFloat := COFINSRetencao.Aliquota;
                    cdsPedidos_Vendas_ItensBASECOFINSR.AsCurrency := COFINSRetencao.Base;
                    cdsPedidos_Vendas_ItensVALORCOFINSR.AsCurrency := COFINSRetencao.Valor;

                    // Tratamento para o CSLL Retenção
                    cdsPedidos_Vendas_ItensCSLLR.AsFloat := CSLLRetencao.Aliquota;
                    cdsPedidos_Vendas_ItensBASECSLLR.AsCurrency := CSLLRetencao.Base;
                    cdsPedidos_Vendas_ItensVALORCSLLR.AsCurrency := CSLLRetencao.Valor;

                    // Tratamento para o INSS - Apuração
                    cdsPedidos_Vendas_ItensBASEINSSA.AsCurrency := INSSApuracao.Base;
                    cdsPedidos_Vendas_ItensVALORINSSA.AsCurrency := INSSApuracao.Valor;

                    // Tratamento para o INSS - Retenção

                    cdsPedidos_Vendas_ItensBASEINSSR.AsCurrency := INSSRetencao.Base;
                    cdsPedidos_Vendas_ItensVALORINSSR.AsCurrency := INSSRetencao.Valor;

                    // Tratamento para o IRRF - Apuração
                    cdsPedidos_Vendas_ItensBASEIRRFA.AsCurrency := IRRFApuracao.Base;
                    cdsPedidos_Vendas_ItensVALORIRRFA.AsCurrency := IRRFApuracao.Valor;

                    // Tratamento para o IRRF - Retenção
                    cdsPedidos_Vendas_ItensBASEIRRFR.AsCurrency := IRRFRetencao.Base;
                    cdsPedidos_Vendas_ItensVALORIRRFR.AsCurrency := IRRFRetencao.Valor;

                    cdsPedidos_Vendas_ItensIRRF.AsFloat := IfThen(VarIRRF.Recolhe = uTypes.VB_NO, IRRFApuracao.Aliquota,
                      IRRFRetencao.Aliquota);

                    cdsPedidos_Vendas_ItensINSS.AsFloat := IfThen(VarINSS.Recolhe = uTypes.VB_NO, INSSApuracao.Aliquota,
                      INSSRetencao.Aliquota);

                    // Tratamento para os Tributos
                    cdsPedidos_Vendas_ItensTRIBUTOS.AsFloat := Tributos.Aliquota;
                    cdsPedidos_Vendas_ItensBASETRIBUTOS.AsCurrency := Tributos.Base;
                    cdsPedidos_Vendas_ItensVALORTRIBUTOS.AsCurrency := Tributos.Valor;
                  end;
                end;
              end;
        except
          on E: Exception do
          begin
            if (Pos('Operation aborted', E.Message) = 0) then
              TSuperClass.GetInstance.Log.save(Format('Regra fiscal inválida. %s.', [E.Message]), mtError);
            Abort;
          end;
        end;
      finally
        if Assigned(dsAuxiliar) then
        begin
          dsAuxiliar.Close;
          FreeAndNil(dsAuxiliar);
        end;
      end;
    end;
  end;
end;

procedure TsrvMobile.cdsClientesBeforeOpen(DataSet: TDataSet);
var
  I: Integer;
  Empresa: string;
  Filial: string;
begin
  for I := 0 to TClientDataSet(DataSet).Params.Count - 1 do
  begin
    if TClientDataSet(DataSet).Params[I].Name = 'EMPRESA' then
    begin
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('CLIENTES', Empresa, Filial);
      TClientDataSet(DataSet).Params[I].DataType := ftString;
      TClientDataSet(DataSet).Params[I].ParamType := ptInput;
      TClientDataSet(DataSet).Params[I].AsString := Empresa;
    end;
    if TClientDataSet(DataSet).Params[I].Name = 'FILIAL' then
    begin
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('CLIENTES', Empresa, Filial);
      TClientDataSet(DataSet).Params[I].DataType := ftString;
      TClientDataSet(DataSet).Params[I].ParamType := ptInput;
      TClientDataSet(DataSet).Params[I].AsString := Filial;
    end;

    if TClientDataSet(DataSet).Params[I].Name = 'EMPRESA_VENDEDORES' then
    begin
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('VENDEDORES', Empresa, Filial);
      TClientDataSet(DataSet).Params[I].DataType := ftString;
      TClientDataSet(DataSet).Params[I].ParamType := ptInput;
      TClientDataSet(DataSet).Params[I].AsString := Empresa;
    end;
    if TClientDataSet(DataSet).Params[I].Name = 'FILIAL_VENDEDORES' then
    begin
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('VENDEDORES', Empresa, Filial);
      TClientDataSet(DataSet).Params[I].DataType := ftString;
      TClientDataSet(DataSet).Params[I].ParamType := ptInput;
      TClientDataSet(DataSet).Params[I].AsString := Filial;
    end;
  end;
end;

procedure TsrvMobile.cdsClientesBeforePost(DataSet: TDataSet);
begin
  TSuperClass.GetInstance.DBFunctions.CheckRequiredFields(DataSet);
end;

procedure TsrvMobile.cdsClientesDeleteError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  TSuperClass.GetInstance.Log.save(Format('[Clientes]Delete Error| Message: %s', [E.Message]), mtError)
end;

procedure TsrvMobile.cdsClientesEditError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  TSuperClass.GetInstance.Log.save(Format('[Clientes]Edit Error| Message: %s', [E.Message]), mtError)
end;

procedure TsrvMobile.cdsClientesPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  TSuperClass.GetInstance.Log.save(Format('[Clientes]Post Error| Message: %s', [E.Message]), mtError)
end;

procedure TsrvMobile.cdsClientesReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  TSuperClass.GetInstance.Log.save(Format('[Clientes]Reconcile Error| Context: %s| Message: %s', [E.Context, E.Message]), mtError)
end;

procedure TsrvMobile.cdsPedidos_Vendas_DadosBeforeApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
type
  TSituacao = record
    Avalia: Boolean;
    Libera: Boolean;
  end;
var
  Preco: OleVariant;
  Credito: OleVariant;
  Estoque: OleVariant;
  Separacao: OleVariant;
  Expedicao: OleVariant;
  Auxiliar: TSituacao;
  GenericInf: Variant;
begin
  inherited;
  if (VarType(GenericInf) <> varNull) and (VarType(GenericInf) <> varEmpty) then
    OwnerData := GenericInf
  else
  begin
    // Definindo as variaveis
    Preco := VarArrayOf([false, false]);
    Credito := VarArrayOf([false, false]);
    Estoque := VarArrayOf([false, false]);
    Separacao := VarArrayOf([false, false]);
    Expedicao := VarArrayOf([false, false]);

    // Enviando dados personalizados para o servidor
    OwnerData := VarArrayOf([cdsPedidos_Vendas_DadosORIGEM.AsString, True, Preco, Credito, Estoque, Separacao, Expedicao,
      cdsPedidos_Vendas_DadosVALORFINANCEIRO.AsCurrency, cdsPedidos_Vendas_DadosCLIENTE.AsInteger, false]);
  end;
end;

procedure TsrvMobile.cdsPedidos_Vendas_DadosBeforeOpen(DataSet: TDataSet);
var
  I: Integer;
  Empresa: string;
  Filial: string;
begin
  for I := 0 to cdsPedidos_Vendas_Dados.Params.Count - 1 do
  begin
    if cdsPedidos_Vendas_Dados.Params[I].Name = 'EMPRESA_CLIENTES' then
    begin
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('CLIENTES', Empresa, Filial);
      cdsPedidos_Vendas_Dados.Params[I].DataType := ftString;
      cdsPedidos_Vendas_Dados.Params[I].ParamType := ptInput;
      cdsPedidos_Vendas_Dados.Params[I].AsString := Empresa;
    end;
    if cdsPedidos_Vendas_Dados.Params[I].Name = 'FILIAL_CLIENTES' then
    begin
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('CLIENTES', Empresa, Filial);
      cdsPedidos_Vendas_Dados.Params[I].DataType := ftString;
      cdsPedidos_Vendas_Dados.Params[I].ParamType := ptInput;
      cdsPedidos_Vendas_Dados.Params[I].AsString := Filial;
    end;

    if cdsPedidos_Vendas_Dados.Params[I].Name = 'EMPRESA_VENDEDORES' then
    begin
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('VENDEDORES', Empresa, Filial);
      cdsPedidos_Vendas_Dados.Params[I].DataType := ftString;
      cdsPedidos_Vendas_Dados.Params[I].ParamType := ptInput;
      cdsPedidos_Vendas_Dados.Params[I].AsString := Empresa;
    end;
    if cdsPedidos_Vendas_Dados.Params[I].Name = 'FILIAL_VENDEDORES' then
    begin
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('VENDEDORES', Empresa, Filial);
      cdsPedidos_Vendas_Dados.Params[I].DataType := ftString;
      cdsPedidos_Vendas_Dados.Params[I].ParamType := ptInput;
      cdsPedidos_Vendas_Dados.Params[I].AsString := Filial;
    end;
  end;
end;

procedure TsrvMobile.cdsPedidos_Vendas_DadosBeforePost(DataSet: TDataSet);
begin
  TSuperClass.GetInstance.DBFunctions.CheckRequiredFields(DataSet);
  AtualizaValoresDados;
end;

procedure TsrvMobile.AtualizaValoresDados;
var
  Reg: TBookMark;
  Valores: TValores;
  Atual: Integer;
  Itens: Integer;
begin
  if ((cdsPedidos_Vendas_Dados.State in [dsInsert, dsEdit])) then
  begin
    try
      with cdsPedidos_Vendas_Itens do
      begin
        if (RecordCount > 0) then
        begin
          TSuperClass.GetInstance.GenericsF.InicializaValores(Valores);
          Reg := Nil;
          try
            Atual := 0;
            Itens := RecordCount;
            DisableControls;
            Reg := GetBookmark;
            First;

            AfterPost := Nil;

            while (not Eof) do
            begin

              Inc(Atual);
              Edit;
              AtualizaValoresItens;
              Post;

              with Valores do
              begin
                BaseItem := RoundTo(cdsPedidos_Vendas_ItensQUANTIDADE.AsFloat * cdsPedidos_Vendas_ItensUNITARIO.AsFloat, -2);
                ValorMercadorias := ValorMercadorias + BaseItem;
                ValorDespesas := ValorDespesas + cdsPedidos_Vendas_ItensVALORDESPESAS.AsCurrency;
                ValorFrete := ValorFrete + cdsPedidos_Vendas_ItensVALORFRETE.AsCurrency;
                ValorSeguro := ValorSeguro + cdsPedidos_Vendas_ItensVALORSEGURO.AsCurrency;
                ValorDesconto := ValorDesconto + cdsPedidos_Vendas_ItensVALORDESCONTO.AsCurrency;
                BaseComissao := BaseComissao + cdsPedidos_Vendas_ItensBASECOMISSAO.AsCurrency;
                ValorComissao := ValorComissao + cdsPedidos_Vendas_ItensVALORCOMISSAO.AsCurrency;
                ValorFinanceiro := ValorFinanceiro + cdsPedidos_Vendas_ItensVALORFINANCEIRO.AsCurrency;
                ValorBruto := ValorBruto + cdsPedidos_Vendas_ItensVALORBRUTO.AsCurrency;
                ValorLiquido := ValorLiquido + cdsPedidos_Vendas_ItensVALORLIQUIDO.AsCurrency;
                IPI.Base := IPI.Base + cdsPedidos_Vendas_ItensBASEIPI.AsCurrency;
                IPI.Valor := IPI.Valor + cdsPedidos_Vendas_ItensVALORIPI.AsCurrency;
                ICMS.Base := ICMS.Base + cdsPedidos_Vendas_ItensBASEICMS.AsCurrency;
                ICMS.Valor := ICMS.Valor + cdsPedidos_Vendas_ItensVALORICMS.AsCurrency;
                ICMSDiferido.Base := ICMSDiferido.Base + cdsPedidos_Vendas_ItensBASEICMSDIF.AsCurrency;
                ICMSDiferido.Valor := ICMSDiferido.Valor + cdsPedidos_Vendas_ItensVALORICMSDIF.AsCurrency;

                ICMSFCP.Base := ICMSFCP.Base + cdsPedidos_Vendas_ItensBASEICMSFCP.AsCurrency;
                ICMSFCP.Valor := ICMSFCP.Valor + cdsPedidos_Vendas_ItensVALORICMSFCP.AsCurrency;

                ICMSPUFD.Base := ICMSPUFD.Base + cdsPedidos_Vendas_ItensBASEICMSPUFD.AsCurrency;
                ICMSPUFD.Valor := ICMSPUFD.Valor + cdsPedidos_Vendas_ItensVALORICMSPUFD.AsCurrency;

                ICMSPUFO.Base := ICMSPUFO.Base + cdsPedidos_Vendas_ItensBASEICMSPUFO.AsCurrency;
                ICMSPUFO.Valor := ICMSPUFO.Valor + cdsPedidos_Vendas_ItensVALORICMSPUFO.AsCurrency;

                ICMSST.Base := ICMSST.Base + cdsPedidos_Vendas_ItensBASEICMSST.AsCurrency;
                ICMSST.Valor := ICMSST.Valor + cdsPedidos_Vendas_ItensVALORICMSST.AsCurrency;

                ISSApuracao.Base := ISSApuracao.Base + cdsPedidos_Vendas_ItensBASEISSA.AsCurrency;
                ISSApuracao.Valor := ISSApuracao.Valor + cdsPedidos_Vendas_ItensVALORISSA.AsCurrency;

                ISSRetencao.Base := ISSRetencao.Base + cdsPedidos_Vendas_ItensBASEISSR.AsCurrency;
                ISSRetencao.Valor := ISSRetencao.Valor + cdsPedidos_Vendas_ItensVALORISSR.AsCurrency;

                PISApuracao.Base := PISApuracao.Base + cdsPedidos_Vendas_ItensBASEPISA.AsCurrency;
                PISApuracao.Valor := PISApuracao.Valor + cdsPedidos_Vendas_ItensVALORPISA.AsCurrency;

                COFINSApuracao.Base := COFINSApuracao.Base + cdsPedidos_Vendas_ItensBASECOFINSA.AsCurrency;
                COFINSApuracao.Valor := COFINSApuracao.Valor + cdsPedidos_Vendas_ItensVALORCOFINSA.AsCurrency;

                // Retencao PCC
                PISRetencao.Base := PISRetencao.Base + cdsPedidos_Vendas_ItensBASEPISR.AsCurrency;
                PISRetencao.Valor := PISRetencao.Valor + cdsPedidos_Vendas_ItensVALORPISR.AsCurrency;
                COFINSRetencao.Base := COFINSRetencao.Base + cdsPedidos_Vendas_ItensBASECOFINSR.AsCurrency;
                COFINSRetencao.Valor := COFINSRetencao.Valor + cdsPedidos_Vendas_ItensVALORCOFINSR.AsCurrency;
                CSLLRetencao.Base := CSLLRetencao.Base + cdsPedidos_Vendas_ItensBASECSLLR.AsCurrency;
                CSLLRetencao.Valor := CSLLRetencao.Valor + cdsPedidos_Vendas_ItensVALORCSLLR.AsCurrency;

                INSSApuracao.Base := INSSApuracao.Base + cdsPedidos_Vendas_ItensBASEINSSA.AsCurrency;
                INSSApuracao.Valor := INSSApuracao.Valor + cdsPedidos_Vendas_ItensVALORINSSA.AsCurrency;

                INSSRetencao.Base := INSSRetencao.Base + cdsPedidos_Vendas_ItensBASEINSSR.AsCurrency;
                INSSRetencao.Valor := INSSRetencao.Valor + cdsPedidos_Vendas_ItensVALORINSSR.AsCurrency;

                IRRFApuracao.Base := IRRFApuracao.Base + cdsPedidos_Vendas_ItensBASEIRRFA.AsCurrency;
                IRRFApuracao.Valor := IRRFApuracao.Valor + cdsPedidos_Vendas_ItensVALORIRRFA.AsCurrency;

                IRRFRetencao.Base := IRRFRetencao.Base + cdsPedidos_Vendas_ItensBASEIRRFR.AsCurrency;
                IRRFRetencao.Valor := IRRFRetencao.Valor + cdsPedidos_Vendas_ItensVALORIRRFR.AsCurrency;

                Tributos.Base := Tributos.Base + cdsPedidos_Vendas_ItensBASETRIBUTOS.AsCurrency;
                Tributos.Valor := Tributos.Valor + cdsPedidos_Vendas_ItensVALORTRIBUTOS.AsCurrency;

                PesoBruto := PesoBruto + cdsPedidos_Vendas_ItensPESOBRUTO.AsFloat;
                PesoLiquido := PesoLiquido + cdsPedidos_Vendas_ItensPESOLIQUIDO.AsFloat;
              end;
              Next;
            end;
          finally
            GotoBookMark(Reg);
            FreeBookMark(Reg);
            EnableControls;
            AfterPost := cdsPedidos_Vendas_ItensAfterPost;
          end;

          // Desabilitando temporariamente os eventos, evitando overflow
          cdsPedidos_Vendas_Itens.AfterPost := Nil;
          cdsPedidos_Vendas_DadosVALORDESPESAS.OnValidate := Nil;
          cdsPedidos_Vendas_DadosVALORFRETE.OnValidate := Nil;
          cdsPedidos_Vendas_DadosVALORSEGURO.OnValidate := Nil;
          cdsPedidos_Vendas_DadosDESCONTO.OnValidate := Nil;
          cdsPedidos_Vendas_DadosVALORDESCONTO.OnValidate := Nil;
          cdsPedidos_Vendas_DadosPESOLIQUIDO.OnValidate := Nil;
          cdsPedidos_Vendas_DadosPESOBRUTO.OnValidate := Nil;
          // cdsPedidos_Vendas_DadosCOMISSAO.OnValidate         := Nil;
          // cdsPedidos_Vendas_DadosVALORCOMISSAO.OnValidate    := Nil;

          with Valores do
          begin
            // atribuindo os totais do pedido de vendas
            cdsPedidos_Vendas_DadosVALORMERCADORIAS.AsCurrency := ValorMercadorias;
            cdsPedidos_Vendas_DadosVALORDESPESAS.AsCurrency := ValorDespesas;
            cdsPedidos_Vendas_DadosVALORFRETE.AsCurrency := ValorFrete;
            cdsPedidos_Vendas_DadosVALORSEGURO.AsCurrency := ValorSeguro;
            if (ValorMercadorias = 0) then
              cdsPedidos_Vendas_DadosDESCONTO.AsFloat := 0
            else
              cdsPedidos_Vendas_DadosDESCONTO.AsFloat := RoundTo(((ValorDesconto * 100) / ValorMercadorias), -2);
            cdsPedidos_Vendas_DadosVALORDESCONTO.AsCurrency := ValorDesconto;
            cdsPedidos_Vendas_DadosBASECOMISSAO.AsCurrency := BaseComissao;
            if ((ValorMercadorias = 0) or (BaseComissao = 0)) then
              cdsPedidos_Vendas_DadosCOMISSAO.AsFloat := 0
            else
              cdsPedidos_Vendas_DadosCOMISSAO.AsFloat := RoundTo(((ValorComissao * 100) / BaseComissao), -2);

            cdsPedidos_Vendas_DadosVALORCOMISSAO.AsCurrency := ValorComissao;
            cdsPedidos_Vendas_DadosVALORFINANCEIRO.AsCurrency := ValorFinanceiro;
            cdsPedidos_Vendas_DadosVALORBRUTO.AsCurrency := ValorBruto;
            cdsPedidos_Vendas_DadosVALORLIQUIDO.AsCurrency := ValorLiquido;
            cdsPedidos_Vendas_DadosBASEIPI.AsCurrency := IPI.Base;
            cdsPedidos_Vendas_DadosVALORIPI.AsCurrency := IPI.Valor;
            cdsPedidos_Vendas_DadosBASEICMS.AsCurrency := ICMS.Base;
            cdsPedidos_Vendas_DadosVALORICMS.AsCurrency := ICMS.Valor;
            cdsPedidos_Vendas_DadosBASEICMSDIF.AsCurrency := ICMSDiferido.Base;
            cdsPedidos_Vendas_DadosVALORICMSDIF.AsCurrency := ICMSDiferido.Valor;

            cdsPedidos_Vendas_DadosBASEICMSFCP.AsCurrency := ICMSFCP.Base;
            cdsPedidos_Vendas_DadosVALORICMSFCP.AsCurrency := ICMSFCP.Valor;

            cdsPedidos_Vendas_DadosBASEICMSPUFD.AsCurrency := ICMSPUFD.Base;
            cdsPedidos_Vendas_DadosVALORICMSPUFD.AsCurrency := ICMSPUFD.Valor;

            cdsPedidos_Vendas_DadosBASEICMSPUFO.AsCurrency := ICMSPUFO.Base;
            cdsPedidos_Vendas_DadosVALORICMSPUFO.AsCurrency := ICMSPUFO.Valor;

            cdsPedidos_Vendas_DadosBASEICMSST.AsCurrency := ICMSST.Base;
            cdsPedidos_Vendas_DadosVALORICMSST.AsCurrency := ICMSST.Valor;

            cdsPedidos_Vendas_DadosBASEISSA.AsCurrency := ISSApuracao.Base;
            cdsPedidos_Vendas_DadosVALORISSA.AsCurrency := ISSApuracao.Valor;

            cdsPedidos_Vendas_DadosBASEISSR.AsCurrency := ISSRetencao.Base;
            cdsPedidos_Vendas_DadosVALORISSR.AsCurrency := ISSRetencao.Valor;

            cdsPedidos_Vendas_DadosBASEPISA.AsCurrency := PISApuracao.Base;
            cdsPedidos_Vendas_DadosVALORPISA.AsCurrency := PISApuracao.Valor;

            cdsPedidos_Vendas_DadosBASECOFINSA.AsCurrency := COFINSApuracao.Base;
            cdsPedidos_Vendas_DadosVALORCOFINSA.AsCurrency := COFINSApuracao.Valor;

            cdsPedidos_Vendas_DadosBASEPISR.AsCurrency := PISRetencao.Base;
            cdsPedidos_Vendas_DadosVALORPISR.AsCurrency := PISRetencao.Valor;

            cdsPedidos_Vendas_DadosBASECOFINSR.AsCurrency := COFINSRetencao.Base;
            cdsPedidos_Vendas_DadosVALORCOFINSR.AsCurrency := COFINSRetencao.Valor;

            cdsPedidos_Vendas_DadosBASECSLLR.AsCurrency := CSLLRetencao.Base;
            cdsPedidos_Vendas_DadosVALORCSLLR.AsCurrency := CSLLRetencao.Valor;

            cdsPedidos_Vendas_DadosBASEIRRFA.AsCurrency := IRRFApuracao.Base;
            cdsPedidos_Vendas_DadosVALORIRRFA.AsCurrency := IRRFApuracao.Valor;

            cdsPedidos_Vendas_DadosBASEIRRFR.AsCurrency := IRRFRetencao.Base;
            cdsPedidos_Vendas_DadosVALORIRRFR.AsCurrency := IRRFRetencao.Valor;

            cdsPedidos_Vendas_DadosBASEINSSA.AsCurrency := INSSApuracao.Base;
            cdsPedidos_Vendas_DadosVALORINSSA.AsCurrency := INSSApuracao.Valor;

            cdsPedidos_Vendas_DadosBASEINSSR.AsCurrency := INSSRetencao.Base;
            cdsPedidos_Vendas_DadosVALORINSSR.AsCurrency := INSSRetencao.Valor;

            cdsPedidos_Vendas_DadosBASETRIBUTOS.AsCurrency := Tributos.Base;
            cdsPedidos_Vendas_DadosVALORTRIBUTOS.AsCurrency := Tributos.Valor;

            cdsPedidos_Vendas_DadosPESOBRUTO.AsFloat := PesoBruto;
            cdsPedidos_Vendas_DadosPESOLIQUIDO.AsFloat := PesoLiquido;
          end;
          // Habilitando o evento AfterPost
          cdsPedidos_Vendas_Itens.AfterPost := cdsPedidos_Vendas_ItensAfterPost;
          cdsPedidos_Vendas_DadosVALORFRETE.OnValidate := cdsPedidos_Vendas_DadosVALORFRETEValidate;
          cdsPedidos_Vendas_DadosVALORDESCONTO.OnValidate := cdsPedidos_Vendas_DadosVALORDESCONTOValidate;
        end;
      end;
    except
      on E: Exception do
        TSuperClass.GetInstance.Log.save(Format('Ocorreu uma falha no processamento do somatório do pedido de venda. %s',
          [E.Message]), mtError);
    end;
  end;
end;

procedure TsrvMobile.cdsPedidos_Vendas_DadosDeleteError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  TSuperClass.GetInstance.Log.save(Format('[Sistema Impacto - Pedidos Vendas]Delete Error | Message: %s', [E.Message]), mtError)
end;

procedure TsrvMobile.cdsPedidos_Vendas_DadosEditError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  TSuperClass.GetInstance.Log.save(Format('[Sistema Impacto - Pedidos Vendas]Edit Error | Message: %s', [E.Message]), mtError)
end;

procedure TsrvMobile.cdsPedidos_Vendas_DadosNewRecord(DataSet: TDataSet);
var
  Empresa, Filial: String;
begin
  TSuperClass.GetInstance.DBFunctions.GetEntityOwner('PEDIDOS_VENDAS_DADOS', Empresa, Filial);
  cdsPedidos_Vendas_DadosEMPRESA.AsString := Empresa;
  cdsPedidos_Vendas_DadosFILIAL.AsString := Filial;
  cdsPedidos_Vendas_DadosNUMERO.AsInteger := UltimoPedido(Empresa, Filial);
//  cdsPedidos_Vendas_DadosNUMERO.AsInteger := 999999;
  cdsPedidos_Vendas_DadosSITUACAO.AsString := '0';
  cdsPedidos_Vendas_DadosEMISSAO.AsDateTime := now;
  cdsPedidos_Vendas_DadosESPECIEDOCUMENTO.AsString :=
    VarToStrDef(TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_ESPECIE_PEDIDO_SITE'), 'NFS');;
  cdsPedidos_Vendas_DadosORIGEM.AsString :=
    VarToStrDef(TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_ORIGEM_PEDIDO_SITE'), 'SIT');
  cdsPedidos_Vendas_DadosTIPOENDERECO.AsString := '0';
  cdsPedidos_Vendas_DadosTIPOFRETE.AsString := '0';
  cdsPedidos_Vendas_DadosCATEGORIA.AsString :=
    VarToStrDef(TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_CATEGORIA_PEDIDOS_VENDAS'), '000000000000001');
  cdsPedidos_Vendas_DadosPRIORIDADE.AsInteger := 999999;
  cdsPedidos_Vendas_DadosIMPRESSO.AsString := '0';
  cdsPedidos_Vendas_DadosDATACRIACAO.AsDateTime := now;
  cdsPedidos_Vendas_DadosTIPOPRECO.Asstring:= VarToStrDef(TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_TIPOPRECO_PEDIDO_SITE'), '01');

//  lsTipoPreco:= VarToStrDef(TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_TIPOPRECO_PEDIDO_SITE'), '01');
//  lsTipoPreco:= TSuperClass.GetInstance.GenericsF.IfThen((lsTipoPreco <> EmptyStr), lsTipoPreco, '01');
end;

procedure TsrvMobile.cdsPedidos_Vendas_DadosPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  TSuperClass.GetInstance.Log.save(Format('[Sistema Impacto - Pedidos Vendas]Post Error | Message: %s', [E.Message]), mtError)
end;

procedure TsrvMobile.cdsPedidos_Vendas_DadosReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  TSuperClass.GetInstance.Log.save(Format('[Sistema Impacto - Pedidos Vendas]Reconcile Error| Context: %s| Message: %s',
    [E.Context, E.Message]), mtError)
end;

procedure TsrvMobile.cdsPedidos_Vendas_DadosVALORDESCONTOValidate(Sender: TField);
var
  BaseDesconto: Currency;
  ValorDesconto: Currency;
  Percentual: Single;
  Aborta: Boolean;
begin
  inherited;
  if (Sender.DataSet.State in [dsEdit]) then
  begin
    Aborta := false;

    if ((Sender.AsCurrency > 0) and (Sender.AsCurrency >= cdsPedidos_Vendas_DadosVALORMERCADORIAS.AsCurrency)) then
    begin
      TSuperClass.GetInstance.Log.save('O Valor do desconto não pode ser maior ou igual ao valor do pedido de venda.', mtError);
      Aborta := True;
    end
    else
    begin
      BaseDesconto := cdsPedidos_Vendas_DadosVALORMERCADORIAS.AsCurrency;
      Percentual := 0;
      ValorDesconto := Sender.AsCurrency;
      try
        cdsPedidos_Vendas_DadosDESCONTO.OnValidate := Nil;
        cdsPedidos_Vendas_DadosVALORDESCONTO.OnValidate := Nil;
        if (BaseDesconto > 0) then
          Percentual := RoundTo(((ValorDesconto * 100) / BaseDesconto), -2);
        cdsPedidos_Vendas_DadosDESCONTO.AsFloat := Percentual;
        AtribuiRateioItens('VALORDESCONTO', ValorDesconto);
        AtualizaTotais(false);
      finally
        cdsPedidos_Vendas_DadosVALORDESCONTO.OnValidate := cdsPedidos_Vendas_DadosVALORDESCONTOValidate;
      end;
    end;
  end;
  if (Aborta) then
    Abort;
end;

procedure TsrvMobile.cdsPedidos_Vendas_DadosVALORFRETEValidate(Sender: TField);
var
  ValorFrete: Currency;
begin
  inherited;
  if (Sender.DataSet.State in [dsEdit]) then
  begin
    ValorFrete := Sender.AsCurrency;
    try
      cdsPedidos_Vendas_DadosVALORFRETE.OnValidate := Nil;
      AtribuiRateioItens('VALORFRETE', ValorFrete);
      AtualizaTotais(false);
    finally
      cdsPedidos_Vendas_DadosVALORFRETE.OnValidate := cdsPedidos_Vendas_DadosVALORFRETEValidate;
    end;
  end;
end;

procedure TsrvMobile.cdsPedidos_Vendas_ItensAfterPost(DataSet: TDataSet);
begin
  AtualizaValoresDados;
end;

procedure TsrvMobile.cdsPedidos_Vendas_ItensBeforeInsert(DataSet: TDataSet);
begin
  DetailItems:= TSuperClass.GetInstance.DBFunctions.GetNextNumber(DataSet, 'ITEM');
end;

procedure TsrvMobile.cdsPedidos_Vendas_ItensBeforePost(DataSet: TDataSet);
begin
  TSuperClass.GetInstance.DBFunctions.CheckRequiredFields(DataSet);
end;

procedure TsrvMobile.cdsPedidos_Vendas_ItensNewRecord(DataSet: TDataSet);
begin
  cdsPedidos_Vendas_ItensITEM.AsInteger:= DetailItems;
  cdsPedidos_Vendas_ItensEMPRESA.AsString := cdsPedidos_Vendas_DadosEMPRESA.AsString;
  cdsPedidos_Vendas_ItensFILIAL.AsString := cdsPedidos_Vendas_DadosFILIAL.AsString;
  cdsPedidos_Vendas_ItensNUMERO.AsInteger := cdsPedidos_Vendas_DadosNUMERO.AsInteger;
  cdsPedidos_Vendas_ItensDATACRIACAO.AsDateTime := now;
end;

procedure TsrvMobile.cdsProdutos_CadastroBeforeOpen(DataSet: TDataSet);
var
  I: Integer;
  Empresa: string;
  Filial: string;
begin
  for I := 0 to TClientDataSet(DataSet).Params.Count - 1 do
  begin
    if TClientDataSet(DataSet).Params[I].Name = 'EMPRESA' then
    begin
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('PRODUTOS', Empresa, Filial);
      TClientDataSet(DataSet).Params[I].DataType := ftString;
      TClientDataSet(DataSet).Params[I].ParamType := ptInput;
      TClientDataSet(DataSet).Params[I].AsString := Empresa;
    end;
    if TClientDataSet(DataSet).Params[I].Name = 'FILIAL' then
    begin
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('PRODUTOS', Empresa, Filial);
      TClientDataSet(DataSet).Params[I].DataType := ftString;
      TClientDataSet(DataSet).Params[I].ParamType := ptInput;
      TClientDataSet(DataSet).Params[I].AsString := Filial;
    end;

    if TClientDataSet(DataSet).Params[I].Name = 'EMPRESA_GRUPOS' then
    begin
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('PRODUTOS_GRUPOS', Empresa, Filial);
      TClientDataSet(DataSet).Params[I].DataType := ftString;
      TClientDataSet(DataSet).Params[I].ParamType := ptInput;
      TClientDataSet(DataSet).Params[I].AsString := Empresa;
    end;
    if TClientDataSet(DataSet).Params[I].Name = 'FILIAL_GRUPOS' then
    begin
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('PRODUTOS_GRUPOS', Empresa, Filial);
      TClientDataSet(DataSet).Params[I].DataType := ftString;
      TClientDataSet(DataSet).Params[I].ParamType := ptInput;
      TClientDataSet(DataSet).Params[I].AsString := Filial;
    end;
  end;
end;

function TsrvMobile.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TsrvMobile.ServiceAfterInstall(Sender: TService);
begin
  with TRegistry.Create(KEY_WRITE) do
    try
      RootKey := HKEY_LOCAL_MACHINE;
      { Description under Windows 2000 and higher }
      if Win32MajorVersion >= 5 then
        if OpenKey('System\CurrentControlSet\Services\' + Name, false) then
        begin
          WriteString('Description', 'Monitoramento das tarefas do Sistema Impacto - SFA');
          CloseKey;
        end;
    finally
      Free;
    end;
end;

procedure TsrvMobile.ServiceAfterUninstall(Sender: TService);
begin
  with TRegistry.Create(KEY_WRITE) do
    try
      RootKey := HKEY_LOCAL_MACHINE;
      { Description under Windows 2000 and higher }
      if Win32MajorVersion >= 5 then
        if OpenKey('System\CurrentControlSet\Services\' + Name, false) then
        begin
          DeleteValue('Description');
          CloseKey;
        end;
    finally
      Free;
    end;
end;

procedure TsrvMobile.ServiceContinue(Sender: TService; var Continued: Boolean);
begin
  // Qualquer exceção o serviço não irá iniciar
  TSuperClass.GetInstance.Log.save('Continuando', mtInfo);
end;

procedure TsrvMobile.ServiceCreate(Sender: TObject);
begin
  // Qualquer exceção o serviço não irá iniciar
  __SFACompany := '';
  __SFABranch := '';

  TSuperClass.GetInstance.setConnection(self.DSServer);
  DateTimeBase := now;
end;

procedure TsrvMobile.ServiceExecute(Sender: TService);
var
  interval: Integer;
begin
  // Qualquer exceção o serviço não irá iniciar
  tmrMain.Enabled := True;

  while not self.Terminated do
    ServiceThread.ProcessRequests(True);
end;

procedure TsrvMobile.ServicePause(Sender: TService; var Paused: Boolean);
begin
  // Qualquer exceção o serviço não irá iniciar
  TSuperClass.GetInstance.Log.save('Em Pause', mtInfo);
end;

procedure TsrvMobile.ServiceStart(Sender: TService; var Started: Boolean);
begin
  // Qualquer exceção o serviço não irá iniciar
  TSuperClass.GetInstance.Log.save('Iniciando Serviço', mtInfo);
end;

procedure TsrvMobile.sqlPedidos_MySql_DadosAfterOpen(DataSet: TDataSet);
begin
  TSuperClass.GetInstance.Log.save('Após abrir o Dataset de pedidos', mtInfo);
end;

procedure TsrvMobile.sqlPedidos_MySql_DadosBeforeOpen(DataSet: TDataSet);
begin
  TSuperClass.GetInstance.Log.save('Antes de abrir o Dataset de pedidos', mtInfo);
end;

procedure TsrvMobile.AtribuiRateioItens(Campo: ShortString; ValorBase: Currency);
var
  Atual: Integer;
  Itens: Integer;
  Reg: TBookMark;
  Parcial: Currency;
  Cursor: TCursor;
begin
  Atual := 0;
  Itens := cdsPedidos_Vendas_Itens.RecordCount;
  Reg := Nil;
  Parcial := 0;
  if ((cdsPedidos_Vendas_DadosVALORMERCADORIAS.AsCurrency > 0)) then
  begin
    try
      with cdsPedidos_Vendas_Itens do
        AfterPost := Nil;
      with cdsPedidos_Vendas_Itens do
      begin
        try
          DisableControls;
          Reg := GetBookmark;
          First;
          while (not Eof) do
          begin
            Inc(Atual);
            Edit;
            cdsPedidos_Vendas_Itens.FieldByName(Campo).AsCurrency :=
              RoundTo((cdsPedidos_Vendas_ItensTOTAL.AsCurrency / cdsPedidos_Vendas_DadosVALORMERCADORIAS.AsCurrency) *
              ValorBase, -2);
            Parcial := Parcial + cdsPedidos_Vendas_Itens.FieldByName(Campo).AsCurrency;
            Post;
            Next;
          end;
          if ((ValorBase - Parcial) <> 0) then
          begin
            First;
            Edit;
            cdsPedidos_Vendas_Itens.FieldByName(Campo).AsCurrency := cdsPedidos_Vendas_Itens.FieldByName(Campo).AsCurrency +
              (ValorBase - Parcial);
            Post;
          end;
        finally
          GotoBookMark(Reg);
          FreeBookMark(Reg);
          EnableControls;
        end;
      end;
    finally
      with cdsPedidos_Vendas_Itens do
        AfterPost := cdsPedidos_Vendas_ItensAfterPost;
    end;
  end;
end;

procedure TsrvMobile.AtualizaTotais(Completo: Boolean);
var
  Reg: TBookMark;
  Valores: TValores;
  Atual: Integer;
  Itens: Integer;
begin
  if ((cdsPedidos_Vendas_Dados.State in [dsInsert, dsEdit])) then
  begin
    try
      with cdsPedidos_Vendas_Itens do
      begin
        if (RecordCount > 0) then
        begin
          TSuperClass.GetInstance.GenericsF.InicializaValores(Valores);
          Reg := Nil;
          try
            Atual := 0;
            Itens := RecordCount;
            DisableControls;
            Reg := GetBookmark;
            First;

            AfterPost := Nil;

            while (not Eof) do
            begin

              if (Completo) then // and (RecordCount > 0) then
              begin
                Inc(Atual);
                Edit;
                AtualizaValoresItens;
                Post;
              end;

              with Valores do
              begin
                BaseItem := RoundTo(cdsPedidos_Vendas_ItensQUANTIDADE.AsFloat * cdsPedidos_Vendas_ItensUNITARIO.AsFloat, -2);
                ValorMercadorias := ValorMercadorias + BaseItem;
                ValorDespesas := ValorDespesas + cdsPedidos_Vendas_ItensVALORDESPESAS.AsCurrency;
                ValorFrete := ValorFrete + cdsPedidos_Vendas_ItensVALORFRETE.AsCurrency;
                ValorSeguro := ValorSeguro + cdsPedidos_Vendas_ItensVALORSEGURO.AsCurrency;
                ValorDesconto := ValorDesconto + cdsPedidos_Vendas_ItensVALORDESCONTO.AsCurrency;
                BaseComissao := BaseComissao + cdsPedidos_Vendas_ItensBASECOMISSAO.AsCurrency;
                ValorComissao := ValorComissao + cdsPedidos_Vendas_ItensVALORCOMISSAO.AsCurrency;
                ValorFinanceiro := ValorFinanceiro + cdsPedidos_Vendas_ItensVALORFINANCEIRO.AsCurrency;
                ValorBruto := ValorBruto + cdsPedidos_Vendas_ItensVALORBRUTO.AsCurrency;
                ValorLiquido := ValorLiquido + cdsPedidos_Vendas_ItensVALORLIQUIDO.AsCurrency;
                IPI.Base := IPI.Base + cdsPedidos_Vendas_ItensBASEIPI.AsCurrency;
                IPI.Valor := IPI.Valor + cdsPedidos_Vendas_ItensVALORIPI.AsCurrency;
                ICMS.Base := ICMS.Base + cdsPedidos_Vendas_ItensBASEICMS.AsCurrency;
                ICMS.Valor := ICMS.Valor + cdsPedidos_Vendas_ItensVALORICMS.AsCurrency;
                { ICMSDiferido.Base := ICMSDiferido.Base + cdsPedidos_Vendas_ItensBASEICMSDIF.AsCurrency;
                  ICMSDiferido.Valor := ICMSDiferido.Valor + cdsPedidos_Vendas_ItensVALORICMSDIF.AsCurrency; }

                ICMSST.Base := ICMSST.Base + cdsPedidos_Vendas_ItensBASEICMSST.AsCurrency;
                ICMSST.Valor := ICMSST.Valor + cdsPedidos_Vendas_ItensVALORICMSST.AsCurrency;

                ISSApuracao.Base := ISSApuracao.Base + cdsPedidos_Vendas_ItensBASEISSA.AsCurrency;
                ISSApuracao.Valor := ISSApuracao.Valor + cdsPedidos_Vendas_ItensVALORISSA.AsCurrency;

                ISSRetencao.Base := ISSRetencao.Base + cdsPedidos_Vendas_ItensBASEISSR.AsCurrency;
                ISSRetencao.Valor := ISSRetencao.Valor + cdsPedidos_Vendas_ItensVALORISSR.AsCurrency;

                PISApuracao.Base := PISApuracao.Base + cdsPedidos_Vendas_ItensBASEPISA.AsCurrency;
                PISApuracao.Valor := PISApuracao.Valor + cdsPedidos_Vendas_ItensVALORPISA.AsCurrency;

                COFINSApuracao.Base := COFINSApuracao.Base + cdsPedidos_Vendas_ItensBASECOFINSA.AsCurrency;
                COFINSApuracao.Valor := COFINSApuracao.Valor + cdsPedidos_Vendas_ItensVALORCOFINSA.AsCurrency;

                // Retencao PCC
                PISRetencao.Base := PISRetencao.Base + cdsPedidos_Vendas_ItensBASEPISR.AsCurrency;
                PISRetencao.Valor := PISRetencao.Valor + cdsPedidos_Vendas_ItensVALORPISR.AsCurrency;
                COFINSRetencao.Base := COFINSRetencao.Base + cdsPedidos_Vendas_ItensBASECOFINSR.AsCurrency;
                COFINSRetencao.Valor := COFINSRetencao.Valor + cdsPedidos_Vendas_ItensVALORCOFINSR.AsCurrency;
                CSLLRetencao.Base := CSLLRetencao.Base + cdsPedidos_Vendas_ItensBASECSLLR.AsCurrency;
                CSLLRetencao.Valor := CSLLRetencao.Valor + cdsPedidos_Vendas_ItensVALORCSLLR.AsCurrency;

                INSSApuracao.Base := INSSApuracao.Base + cdsPedidos_Vendas_ItensBASEINSSA.AsCurrency;
                INSSApuracao.Valor := INSSApuracao.Valor + cdsPedidos_Vendas_ItensVALORINSSA.AsCurrency;

                INSSRetencao.Base := INSSRetencao.Base + cdsPedidos_Vendas_ItensBASEINSSR.AsCurrency;
                INSSRetencao.Valor := INSSRetencao.Valor + cdsPedidos_Vendas_ItensVALORINSSR.AsCurrency;

                IRRFApuracao.Base := IRRFApuracao.Base + cdsPedidos_Vendas_ItensBASEIRRFA.AsCurrency;
                IRRFApuracao.Valor := IRRFApuracao.Valor + cdsPedidos_Vendas_ItensVALORIRRFA.AsCurrency;

                IRRFRetencao.Base := IRRFRetencao.Base + cdsPedidos_Vendas_ItensBASEIRRFR.AsCurrency;
                IRRFRetencao.Valor := IRRFRetencao.Valor + cdsPedidos_Vendas_ItensVALORIRRFR.AsCurrency;

                Tributos.Base := Tributos.Base + cdsPedidos_Vendas_ItensBASETRIBUTOS.AsCurrency;
                Tributos.Valor := Tributos.Valor + cdsPedidos_Vendas_ItensVALORTRIBUTOS.AsCurrency;

                PesoBruto := PesoBruto + cdsPedidos_Vendas_ItensPESOBRUTO.AsFloat;
                PesoLiquido := PesoLiquido + cdsPedidos_Vendas_ItensPESOLIQUIDO.AsFloat;
              end;
              Next;
            end;
          finally
            GotoBookMark(Reg);
            FreeBookMark(Reg);
            EnableControls;
            AfterPost := cdsPedidos_Vendas_ItensAfterPost;
          end;

          // Desabilitando temporariamente os eventos, evitando overflow
          cdsPedidos_Vendas_Itens.AfterPost := Nil;
          cdsPedidos_Vendas_DadosVALORDESPESAS.OnValidate := Nil;
          cdsPedidos_Vendas_DadosVALORFRETE.OnValidate := Nil;
          cdsPedidos_Vendas_DadosVALORSEGURO.OnValidate := Nil;
          cdsPedidos_Vendas_DadosDESCONTO.OnValidate := Nil;
          cdsPedidos_Vendas_DadosVALORDESCONTO.OnValidate := Nil;
          cdsPedidos_Vendas_DadosPESOLIQUIDO.OnValidate := Nil;
          cdsPedidos_Vendas_DadosPESOBRUTO.OnValidate := Nil;
          // cdsPedidos_Vendas_DadosCOMISSAO.OnValidate         := Nil;
          // cdsPedidos_Vendas_DadosVALORCOMISSAO.OnValidate    := Nil;

          with Valores do
          begin
            // atribuindo os totais do pedido de vendas
            cdsPedidos_Vendas_DadosVALORMERCADORIAS.AsCurrency := ValorMercadorias;
            cdsPedidos_Vendas_DadosVALORDESPESAS.AsCurrency := ValorDespesas;
            cdsPedidos_Vendas_DadosVALORFRETE.AsCurrency := ValorFrete;
            cdsPedidos_Vendas_DadosVALORSEGURO.AsCurrency := ValorSeguro;
            if (ValorMercadorias = 0) then
              cdsPedidos_Vendas_DadosDESCONTO.AsFloat := 0
            else
              cdsPedidos_Vendas_DadosDESCONTO.AsFloat := RoundTo(((ValorDesconto * 100) / ValorMercadorias), -2);
            cdsPedidos_Vendas_DadosVALORDESCONTO.AsCurrency := ValorDesconto;
            cdsPedidos_Vendas_DadosBASECOMISSAO.AsCurrency := BaseComissao;
            if ((ValorMercadorias = 0) or (BaseComissao = 0)) then
              cdsPedidos_Vendas_DadosCOMISSAO.AsFloat := 0
            else
              cdsPedidos_Vendas_DadosCOMISSAO.AsFloat := RoundTo(((ValorComissao * 100) / BaseComissao), -2);

            cdsPedidos_Vendas_DadosVALORCOMISSAO.AsCurrency := ValorComissao;
            cdsPedidos_Vendas_DadosVALORFINANCEIRO.AsCurrency := ValorFinanceiro;
            cdsPedidos_Vendas_DadosVALORBRUTO.AsCurrency := ValorBruto;
            cdsPedidos_Vendas_DadosVALORLIQUIDO.AsCurrency := ValorLiquido;
            cdsPedidos_Vendas_DadosBASEIPI.AsCurrency := IPI.Base;
            cdsPedidos_Vendas_DadosVALORIPI.AsCurrency := IPI.Valor;
            cdsPedidos_Vendas_DadosBASEICMS.AsCurrency := ICMS.Base;
            cdsPedidos_Vendas_DadosVALORICMS.AsCurrency := ICMS.Valor;
            { cdsPedidos_Vendas_DadosBASEICMSDIF.AsCurrency := ICMSDiferido.Base;
              cdsPedidos_Vendas_DadosVALORICMSDIF.AsCurrency := ICMSDiferido.Valor; }

            cdsPedidos_Vendas_DadosBASEICMSST.AsCurrency := ICMSST.Base;
            cdsPedidos_Vendas_DadosVALORICMSST.AsCurrency := ICMSST.Valor;

            cdsPedidos_Vendas_DadosBASEISSA.AsCurrency := ISSApuracao.Base;
            cdsPedidos_Vendas_DadosVALORISSA.AsCurrency := ISSApuracao.Valor;

            cdsPedidos_Vendas_DadosBASEISSR.AsCurrency := ISSRetencao.Base;
            cdsPedidos_Vendas_DadosVALORISSR.AsCurrency := ISSRetencao.Valor;

            cdsPedidos_Vendas_DadosBASEPISA.AsCurrency := PISApuracao.Base;
            cdsPedidos_Vendas_DadosVALORPISA.AsCurrency := PISApuracao.Valor;

            cdsPedidos_Vendas_DadosBASECOFINSA.AsCurrency := COFINSApuracao.Base;
            cdsPedidos_Vendas_DadosVALORCOFINSA.AsCurrency := COFINSApuracao.Valor;

            cdsPedidos_Vendas_DadosBASEPISR.AsCurrency := PISRetencao.Base;
            cdsPedidos_Vendas_DadosVALORPISR.AsCurrency := PISRetencao.Valor;

            cdsPedidos_Vendas_DadosBASECOFINSR.AsCurrency := COFINSRetencao.Base;
            cdsPedidos_Vendas_DadosVALORCOFINSR.AsCurrency := COFINSRetencao.Valor;

            cdsPedidos_Vendas_DadosBASECSLLR.AsCurrency := CSLLRetencao.Base;
            cdsPedidos_Vendas_DadosVALORCSLLR.AsCurrency := CSLLRetencao.Valor;

            cdsPedidos_Vendas_DadosBASEIRRFA.AsCurrency := IRRFApuracao.Base;
            cdsPedidos_Vendas_DadosVALORIRRFA.AsCurrency := IRRFApuracao.Valor;

            cdsPedidos_Vendas_DadosBASEIRRFR.AsCurrency := IRRFRetencao.Base;
            cdsPedidos_Vendas_DadosVALORIRRFR.AsCurrency := IRRFRetencao.Valor;

            cdsPedidos_Vendas_DadosBASEINSSA.AsCurrency := INSSApuracao.Base;
            cdsPedidos_Vendas_DadosVALORINSSA.AsCurrency := INSSApuracao.Valor;

            cdsPedidos_Vendas_DadosBASEINSSR.AsCurrency := INSSRetencao.Base;
            cdsPedidos_Vendas_DadosVALORINSSR.AsCurrency := INSSRetencao.Valor;

            cdsPedidos_Vendas_DadosBASETRIBUTOS.AsCurrency := Tributos.Base;
            cdsPedidos_Vendas_DadosVALORTRIBUTOS.AsCurrency := Tributos.Valor;

            cdsPedidos_Vendas_DadosPESOBRUTO.AsFloat := PesoBruto;
            cdsPedidos_Vendas_DadosPESOLIQUIDO.AsFloat := PesoLiquido;
          end;
          // Habilitando o evento AfterPost
          cdsPedidos_Vendas_Itens.AfterPost := cdsPedidos_Vendas_ItensAfterPost;
          // cdsPedidos_Vendas_DadosVALORDESPESAS.OnValidate := cdsPedidos_Vendas_DadosVALORDESPESASValidate;
          cdsPedidos_Vendas_DadosVALORFRETE.OnValidate := cdsPedidos_Vendas_DadosVALORFRETEValidate;
          // cdsPedidos_Vendas_DadosVALORSEGURO.OnValidate := cdsPedidos_Vendas_DadosVALORSEGUROValidate;
          // cdsPedidos_Vendas_DadosDESCONTO.OnValidate := cdsPedidos_Vendas_DadosDESCONTOValidate;
          cdsPedidos_Vendas_DadosVALORDESCONTO.OnValidate := cdsPedidos_Vendas_DadosVALORDESCONTOValidate;
          // cdsPedidos_Vendas_DadosPESOLIQUIDO.OnValidate := cdsPedidos_Vendas_DadosPESOLIQUIDOValidate;
          // cdsPedidos_Vendas_DadosPESOBRUTO.OnValidate := cdsPedidos_Vendas_DadosPESOBRUTOValidate;
        end;
      end;
    except
      on E: Exception do
        TSuperClass.GetInstance.Log.save(Format('Ocorreu uma falha no processamento do somatório do pedido de venda [%s]',
          [E.Message]), mtError);
    end;
  end;
end;

procedure TsrvMobile.tmrMainTimer(Sender: TObject);
var
  Owner: TUStringArray;
  Auxiliar: TUStringArray;
  I: Integer;
  List: TObjectList<TBodyEmail>;
  BodyEmail: TBodyEmail;
  dsAuxiliar: TDataSet;
  Empresa, Filial, EmpresaProdutos, FilialProdutos: String;
  SQL: string;
  K: Integer;
  X: Integer;
  Teste: string;
  dsAuxiliar_Saldos: TDataSet;
  interval: Integer;

  Count: Integer;
  CodigoCliente: Integer;
  acc: string;
  IdCliente: Integer;
  CMuncipio: string;
begin
  try
    TSuperClass.GetInstance.Log.save('Tentando Conectar...', mtInfo);
    TSuperClass.GetInstance.User.Login;
    TSuperClass.GetInstance.Log.save('Conectado!', mtInfo);
  except
    begin
      TSuperClass.GetInstance.Log.save('Falha na Conexão!!', mtError);
    end;
  end;

  if DSServer.Connected then
  begin
    tmrMain.Enabled := false;
    interval := StrToIntDef(Vartostr(TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_ATUALIZACAO_SITE')), 300000);
    if interval >= 1000 then
      tmrMain.interval := interval;

{$REGION 'LabTrade'}
    { try
      List := TObjectList<TBodyEmail>.Create;

      dsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
      ('select A.*, C.REDUZIDO AS "NOMECLIENTE" from ORCAMENTOS_VENDAS_DADOS A inner join' +
      ' ORCAMENTOS_VENDAS_ITENS B on (A.EMPRESA = B.EMPRESA and A.FILIAL = B.FILIAL and A.NUMERO = B.NUMERO and ' +
      ' A.SITUACAO not in (''2'')) inner join CLIENTES C on (C.EMPRESA = A.EMPRESA and C.FILIAL = A.FILIAL and C.CODIGO = A.CLIENTE) where datediff(hour, A.DATACRIACAO, current_timestamp) >= 24 and'
      + ' datediff(hour, A.DATACRIACAO, current_timestamp) <= 72 order by A.NUMERO');

      if Assigned(dsAuxiliar) then
      if not(dsAuxiliar.State in [dsInactive]) then
      if dsAuxiliar.RecordCount > 0 then
      begin
      for I := 0 to dsAuxiliar.RecordCount - 1 do
      begin
      BodyEmail := TBodyEmail.Create.setDestination('jhonny.ramos@trssistemas.com.br')
      .setSubject('Cotação em aberto!').setType(First).setName(dsAuxiliar.FieldByName('NOMECLIENTE').AsString)
      .setDate(dsAuxiliar.FieldByName('EMISSAO').AsDateTime)
      .setQuotation(dsAuxiliar.FieldByName('NUMERO').AsInteger);
      List.Add(BodyEmail);
      dsAuxiliar.Next;
      end;
      end;
      if List.Count > 0 then
      TSuperClass.GetInstance.GenericsF.SendEmail(List);

      finally
      if Assigned(List) then
      FreeAndNil(List);
      end; }
{$ENDREGION}
{$REGION 'Hunion'}
    (*
      {$REGION 'Preços Produtos'}
      try
      TSuperClass.GetInstance.log.Save(format('Interval %s', [IntToStr(tmrMain.interval)]), mtInfo);
      TSuperClass.GetInstance.Config.Load(Schedule);
      if not(PrecoExecutado) and (Schedule.HoraPreco >= now) then
      begin
      try
      TSuperClass.GetInstance.log.Save('[Produtos] Importando produtos!', mtInfo);
      if cdsProdutos.Active then
      cdsProdutos.Close;

      cdsProdutos.Open;
      for I := 0 to cdsProdutos.RecordCount - 1 do
      begin
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('PRODUTOS', Empresa, Filial);
      SQL := format
      ('select CODIGO, PRECOVENDA2 from PRODUTOS where EMPRESA = %s and FILIAL = %s and STATUS = ''0'' and CODIGO = %s',
      [QuotedStr(Empresa), QuotedStr(Filial), QuotedStr(cdsProdutosproducts_cod_ref.Asstring)]);
      dsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml(SQL);

      if Assigned(dsAuxiliar) then
      if not(dsAuxiliar.state in [dsInactive]) then
      if dsAuxiliar.RecordCount > 0 then
      begin
      TSuperClass.GetInstance.log.Save('[Produtos] Produtos obtidos!', mtInfo);
      TSuperClass.GetInstance.log.Save
      (format('[Produtos %s de %s] Verificado estoque do produto para a atualização do preço [%s]!',
      [IntToStr(I + 1), IntToStr(dsAuxiliar.RecordCount), dsAuxiliar.FieldByName('CODIGO').Asstring]), mtInfo);

      dsAuxiliar_Saldos := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
      (format('select PRODUTO, (SALDO - RESERVA) AS "SALDO"  from SALDOS_ESTOQUE where EMPRESA = %s and FILIAL = %s and PRODUTO = %S',
      [QuotedStr(Empresa), QuotedStr(Filial), QuotedStr(dsAuxiliar.FieldByName('CODIGO').Asstring)]));

      cdsProdutos.Edit;

      cdsProdutosproducts_price.AsFloat := dsAuxiliar.FieldByName('PRECOVENDA2').AsFloat;
      TSuperClass.GetInstance.log.Save('[Produtos] Atualizado Preço do produto no site!', mtInfo);

      if Assigned(dsAuxiliar_Saldos) then
      if not(dsAuxiliar_Saldos.state in [dsInactive]) then
      if dsAuxiliar_Saldos.RecordCount > 0 then
      try
      try
      TSuperClass.GetInstance.log.Save(format('[Produtos] Atualizando produto do site [%s]!',
      [dsAuxiliar.FieldByName('CODIGO').Asstring]), mtInfo);

      cdsProdutosproducts_quantity.AsFloat := dsAuxiliar_Saldos.FieldByName('SALDO').AsFloat;

      TSuperClass.GetInstance.log.Save('[Produtos] Atualizado estoque do produto no site!', mtInfo);
      except
      on E: Exception do
      TSuperClass.GetInstance.log.Save(E.Message, mtError);
      end;
      finally
      if Assigned(dsAuxiliar_Saldos) then
      FreeAndNil(dsAuxiliar_Saldos);
      end
      else
      TSuperClass.GetInstance.log.Save('[Produtos] Nenhum produto foi encontrado!', mtInfo)
      else
      TSuperClass.GetInstance.log.Save(format('[Produtos] Ocorreu algum problema na consulta %s', [QuotedStr(SQL)]
      ), mtError)
      else
      TSuperClass.GetInstance.log.Save(format('[Produtos] Ocorreu algum problema na consulta %s', [QuotedStr(SQL)]
      ), mtError);
      end;

      if cdsProdutos.state in [dsEdit] then
      cdsProdutos.Post;
      cdsProdutos.Next;
      end;
      if cdsProdutos.ApplyUpdates(-1) <= 0 then
      begin
      TSuperClass.GetInstance.log.Save('[Produtos] Os produtos foram atualizados com sucesso!', mtInfo);
      PrecoExecutado := True;
      end;
      except
      on E: Exception do
      TSuperClass.GetInstance.log.Save(E.Message, mtError);
      end;
      end;
      finally
      if Assigned(dsAuxiliar) then
      FreeAndNil(dsAuxiliar);
      end;
      {$ENDREGION}
      {$REGION 'Saldos Estoque'}
      try
      try
      if now >= TTime(DateTimeBase) + StrToTimeDef(IntToStr(Schedule.AtualizarEstoque) + ':00', now) then
      begin
      try
      TSuperClass.GetInstance.log.Save('[Produtos] Importando produtos!', mtInfo);
      if cdsProdutos.Active then
      cdsProdutos.Close;

      cdsProdutos.Open;
      for I := 0 to cdsProdutos.RecordCount - 1 do
      begin
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('PRODUTOS', Empresa, Filial);
      SQL := format
      ('select CODIGO, PRECOVENDA2 from PRODUTOS where EMPRESA = %s and FILIAL = %s and STATUS = ''0'' and CODIGO = %s',
      [QuotedStr(Empresa), QuotedStr(Filial), QuotedStr(cdsProdutosproducts_cod_ref.Asstring)]);
      dsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml(SQL);

      if Assigned(dsAuxiliar) then
      if not(dsAuxiliar.state in [dsInactive]) then
      if dsAuxiliar.RecordCount > 0 then
      begin
      TSuperClass.GetInstance.log.Save('[Produtos] Produtos obtidos!', mtInfo);
      TSuperClass.GetInstance.log.Save
      (format('[Produtos %s de %s] Verificado estoque do produto para a atualização do preço [%s]!',
      [IntToStr(I + 1), IntToStr(dsAuxiliar.RecordCount), dsAuxiliar.FieldByName('CODIGO').Asstring]), mtInfo);

      dsAuxiliar_Saldos := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
      (format('select PRODUTO, (SALDO - RESERVA) AS "SALDO"  from SALDOS_ESTOQUE where EMPRESA = %s and FILIAL = %s and PRODUTO = %S',
      [QuotedStr(Empresa), QuotedStr(Filial), QuotedStr(dsAuxiliar.FieldByName('CODIGO').Asstring)]));

      cdsProdutos.Edit;

      TSuperClass.GetInstance.log.Save('[Produtos] Atualizado Preço do produto no site!', mtInfo);

      if Assigned(dsAuxiliar_Saldos) then
      if not(dsAuxiliar_Saldos.state in [dsInactive]) then
      if dsAuxiliar_Saldos.RecordCount > 0 then
      try
      try
      TSuperClass.GetInstance.log.Save(format('[Produtos] Atualizando produto do site [%s]!',
      [dsAuxiliar.FieldByName('CODIGO').Asstring]), mtInfo);

      cdsProdutosproducts_quantity.AsFloat := dsAuxiliar_Saldos.FieldByName('SALDO').AsFloat;

      TSuperClass.GetInstance.log.Save('[Produtos] Atualizado estoque do produto no site!', mtInfo);
      except
      on E: Exception do
      TSuperClass.GetInstance.log.Save(E.Message, mtError);
      end;
      finally
      if Assigned(dsAuxiliar_Saldos) then
      FreeAndNil(dsAuxiliar_Saldos);
      end
      else
      TSuperClass.GetInstance.log.Save('[Produtos] Nenhum produto foi encontrado!', mtInfo)
      else
      TSuperClass.GetInstance.log.Save(format('[Produtos] Ocorreu algum problema na consulta %s',
      [QuotedStr(SQL)]), mtError)
      else
      TSuperClass.GetInstance.log.Save(format('[Produtos] Ocorreu algum problema na consulta %s', [QuotedStr(SQL)]
      ), mtError);
      end;

      if cdsProdutos.state in [dsEdit] then
      cdsProdutos.Post;
      cdsProdutos.Next;
      end;

      if cdsProdutos.ApplyUpdates(-1) <= 0 then
      begin
      TSuperClass.GetInstance.log.Save('[Produtos] Os produtos foram atualizados com sucesso!', mtInfo);
      PrecoExecutado := True;
      end;
      DateTimeBase := now;
      finally
      if Assigned(dsAuxiliar) then
      FreeAndNil(dsAuxiliar);
      end;
      end;
      finally

      end;
      except
      on E: Exception do
      TSuperClass.GetInstance.log.Save(E.Message, mtError);
      end;
      {$ENDREGION}
      {$REGION 'Clientes'}
      try
      try
      TSuperClass.GetInstance.log.Save('[Clientes] Importando clientes!', mtInfo);
      if not scnMysql.Connected then
      scnMysql.Connected := True;

      if cdsClientes_Mysql.Active then
      cdsClientes_Mysql.Close;

      if cdsClientes_Endereco_Mysql.Active then
      cdsClientes_Endereco_Mysql.Close;

      if cdsEstados_Mysql.Active then
      cdsEstados_Mysql.Close;

      cdsClientes_Mysql.Open;
      cdsClientes_Endereco_Mysql.Open;
      cdsEstados_Mysql.Open;

      TSuperClass.GetInstance.log.Save('[Clientes] Obtendo compartilhamento de clientes', mtInfo);
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('CLIENTES', Empresa, Filial);
      TSuperClass.GetInstance.log.Save(format('Número de clientes %d', [cdsClientes_Mysql.RecordCount]), mtInfo);

      for I := 0 to sqlClientes_Mysql.RecordCount - 1 do
      begin
      TSuperClass.GetInstance.log.Save(format('Contador de clientes %d', [I + 1]), mtInfo);
      cdsClientes.Close;
      cdsClientes.Open;
      try
      try
      TSuperClass.GetInstance.log.Save(format('[Clientes][%d,%d] Verificando se o cliente existe Id[%d][%s]!',
      [I + 1, cdsClientes_Mysql.RecordCount, cdsClientes_Mysqlcustomers_id.AsInteger,
      cdsClientes_Mysqlcustomers_cpf_cnpj.Asstring]), mtInfo);
      dsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
      (format('select * from CLIENTES where EMPRESA = %s and FILIAL = %S and %s = %s',
      [QuotedStr(Empresa), QuotedStr(Filial),
      TSuperClass.GetInstance.GenericsF.IfThen((UpperCase(cdsClientes_Mysqlcustomers_tipo_pessoa.Asstring) = 'F'),
      'CPF', 'CNPJ'), QuotedStr(StringReplace(StringReplace(StringReplace(cdsClientes_Mysqlcustomers_cpf_cnpj.Asstring,
      '.', '', [rfReplaceAll]), '-', '', [rfReplaceAll]), '/', '', [rfReplaceAll]))]));

      if Assigned(dsAuxiliar) then
      if not(dsAuxiliar.state in [dsInactive]) then
      if dsAuxiliar.RecordCount = 0 then
      begin
      TSuperClass.GetInstance.log.Save(format('[Clientes] Cadastrando um cliente novo com o [%s, %s]!',
      [TSuperClass.GetInstance.GenericsF.IfThen((UpperCase(cdsClientes_Mysqlcustomers_tipo_pessoa.Asstring)
      = 'F'), 'CPF', 'CNPJ'), cdsClientes_Mysqlcustomers_cpf_cnpj.Asstring]), mtInfo);

      cdsClientes.Insert;
      cdsClientesEMPRESA.Asstring := Empresa;
      cdsClientesFILIAL.Asstring := Filial;
      cdsClientesCODIGO.AsInteger := 999999;
      cdsClientesSTATUS.Asstring := '0';
      cdsClientesNOME.Asstring := cdsClientes_Mysqlcustomers_firstname.Asstring + ' ' +
      cdsClientes_Mysqlcustomers_lastname.Asstring;
      cdsClientesPESSOA.Asstring := TSuperClass.GetInstance.GenericsF.IfThen
      (UpperCase(cdsClientes_Mysqlcustomers_tipo_pessoa.Asstring) = 'F', '0', '1');
      cdsClientesREDUZIDO.Asstring := cdsClientes_Mysqlcustomers_firstname.Asstring;

      cdsClientesENDERECO.Asstring := cdsClientes_Endereco_Mysqlentry_street_address.Asstring;
      cdsClientesNUMERO.Asstring := cdsClientes_Endereco_Mysqlentry_street_number.Asstring;
      cdsClientesCOMPLEMENTO.Asstring := cdsClientes_Endereco_Mysqlentry_street_complemento.Asstring;
      cdsClientesUF.Asstring := cdsEstados_Mysqlzone_code.Asstring;
      cdsClientesMUNICIPIO.Asstring := cdsClientes_Endereco_Mysqlentry_city.Asstring;
      cdsClientesBAIRRO.Asstring := cdsClientes_Endereco_Mysqlentry_suburb.Asstring;
      cdsClientesCEP.Asstring := cdsClientes_Endereco_Mysqlentry_postcode.Asstring;
      cdsClientesTIPOPRECO.Asstring := '01';
      cdsClientesOBSERVACAO.Asstring := format('COD. DO SITE [%s]', [cdsClientes_Mysqlcustomers_id.Asstring]);

      if UpperCase(cdsClientes_Mysqlcustomers_tipo_pessoa.Asstring) = 'F' then
      cdsClientesCPF.Asstring :=
      StringReplace(StringReplace(StringReplace(cdsClientes_Mysqlcustomers_cpf_cnpj.Asstring, '.', '',
      [rfReplaceAll]), '-', '', [rfReplaceAll]), '/', '', [rfReplaceAll])
      else
      cdsClientesCNPJ.Asstring :=
      StringReplace(StringReplace(StringReplace(cdsClientes_Mysqlcustomers_cpf_cnpj.Asstring, '.', '',
      [rfReplaceAll]), '-', '', [rfReplaceAll]), '/', '', [rfReplaceAll]);

      cdsClientesRG.Asstring := cdsClientes_Mysqlcustomers_rg.Asstring;
      cdsClientesEMAIL.Asstring := cdsClientes_Mysqlcustomers_email_address.Asstring;
      cdsClientesDDD.Asstring := cdsClientes_Mysqlcustomers_ddd1.Asstring;
      cdsClientesTELEFONE.Asstring := cdsClientes_Mysqlcustomers_telephone.Asstring;
      cdsClientesCELULAR.Asstring := cdsClientes_Mysqlcustomers_celular.Asstring;
      cdsClientesDATACRIACAO.AsDateTime := now;
      cdsClientesDATACADASTRO.AsDateTime := cdsClientes_Mysqlcustomers_info_date_account_created.AsDateTime;

      cdsClientes.Post;

      if cdsClientes.ApplyUpdates(-1) <= 0 then
      begin
      TSuperClass.GetInstance.log.Save('[Clientes] Cliente cadastrado!', mtInfo);

      TSuperClass.GetInstance.log.Save(format('[Clientes] Atualizando cliente do site [%s]!',
      [sqlClientes_Mysqlcustomers_id.Asstring]), mtInfo);

      sqlAux.Close;

      sqlAux.CommandText := 'update clientes set IMPORTADO = :IMPORTADO where customers_id = :CLIENTE';

      sqlAux.Params.ParamByName('IMPORTADO').ParamType := ptInput;
      sqlAux.Params.ParamByName('IMPORTADO').DataType := ftInteger;
      sqlAux.Params.ParamByName('IMPORTADO').AsInteger := 1;

      sqlAux.Params.ParamByName('CLIENTE').ParamType := ptInput;
      sqlAux.Params.ParamByName('CLIENTE').DataType := ftInteger;
      sqlAux.Params.ParamByName('CLIENTE').AsInteger := cdsClientes_Mysqlcustomers_id.AsInteger;

      sqlAux.ExecSQL;
      TSuperClass.GetInstance.log.Save('[Clientes] Atualizado cliente do site!', mtInfo);

      end;

      end else begin
      TSuperClass.GetInstance.log.Save('[Clientes] Cliente ja existe e flag atualizada!', mtInfo);

      TSuperClass.GetInstance.log.Save(format('[Clientes] Atualizando cliente do site [%s]!',
      [cdsClientes_Mysqlcustomers_id.Asstring]), mtInfo);

      sqlAux.Close;

      sqlAux.CommandText := 'update clientes set IMPORTADO = :IMPORTADO where customers_id = :CLIENTE';

      sqlAux.Params.ParamByName('IMPORTADO').ParamType := ptInput;
      sqlAux.Params.ParamByName('IMPORTADO').DataType := ftInteger;
      sqlAux.Params.ParamByName('IMPORTADO').AsInteger := 1;

      sqlAux.Params.ParamByName('CLIENTE').ParamType := ptInput;
      sqlAux.Params.ParamByName('CLIENTE').DataType := ftInteger;
      sqlAux.Params.ParamByName('CLIENTE').AsInteger := cdsClientes_Mysqlcustomers_id.AsInteger;

      sqlAux.ExecSQL;
      TSuperClass.GetInstance.log.Save('[Clientes] Atualizado cliente do site!', mtInfo);
      end;
      except
      TSuperClass.GetInstance.log.Save('[Clientes] Cancelando o cadastro no cliente!', mtInfo);
      cdsClientes.Cancel;
      end;
      finally
      if Assigned(dsAuxiliar) then
      FreeAndNil(dsAuxiliar);
      end;
      cdsClientes_Mysql.Next;
      end;
      except
      on E: Exception do
      TSuperClass.GetInstance.log.Save(E.Message, mtError);
      end;
      finally
      if Assigned(dsAuxiliar) then
      FreeAndNil(dsAuxiliar);
      if scnMysql.Connected then
      scnMysql.Connected := False;
      end;

      {$ENDREGION}
      {$REGION 'Pedidos'}
      try
      try
      TSuperClass.GetInstance.log.Save('[Site - Pedidos de vendas] Conectando ao site!', mtInfo);
      if not scnMysql.Connected then
      scnMysql.Connected := True;

      if cdsPedidos_MySql_Dados.Active then
      cdsPedidos_MySql_Dados.Close;
      if cdsPedidos_MySql_Itens.Active then
      cdsPedidos_MySql_Itens.Close;
      if not sqlPedidos_Mysql_Clientes.Active then
      cdsPedidos_Mysql_Clientes.Close;

      TSuperClass.GetInstance.log.Save('[Site - Pedidos de vendas] Importando pedidos de vendas dados!', mtInfo);
      try
      cdsPedidos_MySql_Dados.Open;
      except
      On E: Exception do
      TSuperClass.GetInstance.log.Save(E.Message, mtError);
      end;
      TSuperClass.GetInstance.log.Save('[Site - Pedidos de vendas] Importando pedidos de vendas itens!', mtInfo);
      try
      cdsPedidos_MySql_Itens.Open;
      except
      On E: Exception do
      TSuperClass.GetInstance.log.Save(E.Message, mtError);
      end;
      TSuperClass.GetInstance.log.Save('[Site - Pedidos de vendas] Importando clientes de vendas!', mtInfo);
      try
      cdsPedidos_Mysql_Clientes.Open;
      except
      On E: Exception do
      TSuperClass.GetInstance.log.Save(E.Message, mtError);
      end;
      TSuperClass.GetInstance.log.Save('[Site - Pedidos de vendas] Obtido pedidos de vendas! Realizando Importação.', mtInfo);

      for I := 0 to cdsPedidos_MySql_Dados.RecordCount - 1 do
      begin
      try
      try
      if cdsPedidos_Vendas_Dados.Active then
      cdsPedidos_Vendas_Dados.Close;
      if cdsPedidos_Vendas_Itens.Active then
      cdsPedidos_Vendas_Itens.Close;

      TSuperClass.GetInstance.log.Save
      ('[Sistema Impacto - Pedidos de vendas] Importando pedidos de vendas dados!', mtInfo);
      cdsPedidos_Vendas_Dados.Open;
      TSuperClass.GetInstance.log.Save
      ('[Sistema Impacto - Pedidos de vendas] Importando pedidos de vendas itens!', mtInfo);
      cdsPedidos_Vendas_Itens.Open;

      TSuperClass.GetInstance.log.Save('[Sistema Impacto - Pedidos de vendas] Obtendo dados do cliente.', mtInfo);
      // Obtem as informações do cliente
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('CLIENTES', Empresa, Filial);
      dsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
      (format('select * from CLIENTES where EMPRESA = %s and FILIAL = %S and %s = %s',
      [QuotedStr(Empresa), QuotedStr(Filial),
      TSuperClass.GetInstance.GenericsF.IfThen((UpperCase(cdsPedidos_Mysql_Clientescustomers_tipo_pessoa.Asstring)
      = 'F'), 'CPF', 'CNPJ'),
      QuotedStr(StringReplace(StringReplace(StringReplace(cdsPedidos_Mysql_Clientescustomers_cpf_cnpj.Asstring, '.', '',
      [rfReplaceAll]), '-', '', [rfReplaceAll]), '/', '', [rfReplaceAll]))]));

      if Assigned(dsAuxiliar) then
      if not(dsAuxiliar.state in [dsInactive]) then
      if dsAuxiliar.RecordCount > 0 then
      begin
      TSuperClass.GetInstance.log.Save(format('Atualizando o cliente [%s]',
      [dsAuxiliar.FieldByName('CODIGO').Asstring]), mtInfo);

      TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
      (format('update CLIENTES set NOME = %s, REDUZIDO = %s, ENDERECO = %s, NUMERO = %s, ' +
      ' COMPLEMENTO = %s, MUNICIPIO = %s, BAIRRO = %s, CEP = %s, EMAIL = %s,' +
      ' TELEFONE = %s where (EMPRESA = %s) and (FILIAL = %s) and (CODIGO = %s) ',
      [QuotedStr(cdsPedidos_MySql_Dadoscustomers_firstname.Asstring +
      cdsPedidos_MySql_Dadoscustomers_lastname.Asstring),
      QuotedStr(cdsPedidos_MySql_Dadoscustomers_firstname.Asstring +
      cdsPedidos_MySql_Dadoscustomers_lastname.Asstring),
      QuotedStr(cdsPedidos_MySql_Dadoscustomers_street_address.Asstring),
      QuotedStr(cdsPedidos_MySql_Dadoscustomers_street_number.Asstring),
      QuotedStr(cdsPedidos_MySql_Dadoscustomers_street_complemento.Asstring),
      QuotedStr(cdsPedidos_MySql_Dadoscustomers_city.Asstring),
      QuotedStr(cdsPedidos_MySql_Dadoscustomers_suburb.Asstring),
      QuotedStr(cdsPedidos_MySql_Dadoscustomers_postcode.Asstring),
      QuotedStr(cdsPedidos_MySql_Dadoscustomers_email_address.Asstring),
      QuotedStr(cdsPedidos_MySql_Dadoscustomers_telephone.Asstring), QuotedStr(Empresa), QuotedStr(Filial),
      dsAuxiliar.FieldByName('CODIGO').Asstring]));

      // Preenche os campos do pedido conforme o cadastro do cliente
      cdsPedidos_Vendas_Dados.Insert;
      cdsPedidos_Vendas_DadosCLIENTE.AsInteger := dsAuxiliar.FieldByName('CODIGO').AsInteger;
      cdsPedidos_Vendas_DadosUF.Asstring := dsAuxiliar.FieldByName('UF').Asstring;
      TSuperClass.GetInstance.log.Save('[Site - Pedidos de vendas] Obtendo vendedor.', mtInfo);
      if (dsAuxiliar.FieldByName('VENDEDOR').AsInteger > 0) then
      cdsPedidos_Vendas_DadosVENDEDOR.AsInteger := dsAuxiliar.FieldByName('VENDEDOR').AsInteger
      else
      cdsPedidos_Vendas_DadosVENDEDOR.AsInteger :=
      StrToIntDef
      (VarToStrDef(TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_VENDEDOR_PEDIDO_SITE'), '0'), 0);

      TSuperClass.GetInstance.log.Save
      ('[Sistema Impacto - Pedidos de vendas] Obtendo condição de pagamento.', mtInfo);
      if (dsAuxiliar.FieldByName('CONDICAOPAGAMENTO').AsInteger > 0) then
      cdsPedidos_Vendas_DadosCONDICAOPAGAMENTO.AsInteger := dsAuxiliar.FieldByName('CONDICAOPAGAMENTO').AsInteger
      else
      cdsPedidos_Vendas_DadosCONDICAOPAGAMENTO.AsInteger :=
      StrToIntDef
      (VarToStrDef(TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_CONDICAO_PEDIDO_SITE'), '0'), 0);

      TSuperClass.GetInstance.log.Save('[Sistema Impacto - Pedidos de vendas] Obtendo tipo de preço.', mtInfo);
      if ((dsAuxiliar.FieldByName('TIPOPRECO').Asstring <> EmptyStr) and
      (dsAuxiliar.FieldByName('TIPOPRECO').Asstring <> #0)) then
      cdsPedidos_Vendas_DadosTIPOPRECO.Asstring := dsAuxiliar.FieldByName('TIPOPRECO').Asstring
      else
      cdsPedidos_Vendas_DadosTIPOPRECO.Asstring :=
      VarToStrDef(TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_TIPOPRECO_PEDIDO_SITE'), '01');

      cdsPedidos_Vendas_DadosEMISSAO.AsDateTime := cdsPedidos_MySql_Dadosdate_purchased.AsDateTime;
      cdsPedidos_Vendas_DadosSTATUSENTREGA.Asstring := '0';

      TSuperClass.GetInstance.log.Save
      ('[Sistema Impacto - Pedidos de vendas] Inserindo produtos do pedido.', mtInfo);
      for K := 0 to cdsPedidos_MySql_Itens.RecordCount - 1 do
      begin
      cdsPedidos_Vendas_Itens.Insert;

      cdsPedidos_Vendas_ItensITEM.AsInteger := K + 1;
      cdsPedidos_Vendas_ItensPRODUTO.Asstring := cdsPedidos_MySql_Itensproducts_cod_ref.Asstring;
      cdsPedidos_Vendas_ItensDESCRICAO.Asstring := cdsPedidos_MySql_Itensproducts_name.Asstring;

      cdsPedidos_Vendas_ItensQUANTIDADE.AsFloat := cdsPedidos_MySql_Itensproducts_quantity.AsFloat;
      cdsPedidos_Vendas_ItensUNITARIO.AsFloat := cdsPedidos_MySql_Itensproducts_price.AsFloat;
      cdsPedidos_Vendas_ItensTOTAL.AsFloat :=
      (cdsPedidos_Vendas_ItensQUANTIDADE.AsFloat * cdsPedidos_Vendas_ItensUNITARIO.AsFloat);
      TSuperClass.GetInstance.log.Save
      ('[Sistema Impacto - Pedidos de vendas] Obtendo REGRASAIDA, PRIMEIRAUNIDADE, LOCAL do produto.', mtInfo);
      try
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('PRODUTOS', Empresa, Filial);
      dsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
      (format('select * from PRODUTOS where EMPRESA = %S and FILIAL = %S and CODIGO = %s',
      [QuotedStr(Empresa), QuotedStr(Filial), QuotedStr(cdsPedidos_Vendas_ItensPRODUTO.Asstring)]));
      if Assigned(dsAuxiliar) then
      if not(dsAuxiliar.state in [dsInactive]) then
      if dsAuxiliar.RecordCount > 0 then
      begin
      if dsAuxiliar.FieldByName('REGRASAIDA').AsInteger > 0 then
      cdsPedidos_Vendas_ItensREGRA.AsInteger := dsAuxiliar.FieldByName('REGRASAIDA').AsInteger
      else
      cdsPedidos_Vendas_ItensREGRA.AsInteger :=
      StrToIntDef
      (VarToStrDef(TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_REGRA_SITE'), '0'), 0);
      cdsPedidos_Vendas_ItensDESCRICAO.Asstring := dsAuxiliar.FieldByName('DESCRICAO').Asstring;
      cdsPedidos_Vendas_ItensPRIMEIRAUNIDADE.Asstring :=
      dsAuxiliar.FieldByName('PRIMEIRAUNIDADE').Asstring;
      cdsPedidos_Vendas_ItensLOCAL.Asstring := dsAuxiliar.FieldByName('LOCALPADRAO').Asstring;
      end
      else
      TSuperClass.GetInstance.log.Save
      (format('[Sistema Impacto - Pedidos de vendas] Produto não encontrado [%s].',
      [cdsPedidos_Vendas_ItensPRODUTO.Asstring]), mtInfo);
      finally
      if Assigned(dsAuxiliar) then
      FreeAndNil(dsAuxiliar);
      end;
      TSuperClass.GetInstance.log.Save
      ('[Sistema Impacto - Pedidos de vendas] Obtendo configurações da regra fiscal.', mtInfo);
      try
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('REGRAS_FISCAIS', Empresa, Filial);
      dsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
      (format('select * from REGRAS_FISCAIS where EMPRESA = %S and FILIAL = %S and CODIGO = %s',
      [QuotedStr(Empresa), QuotedStr(Filial), QuotedStr(cdsPedidos_Vendas_ItensREGRA.Asstring)]));
      if Assigned(dsAuxiliar) then
      if not(dsAuxiliar.state in [dsInactive]) then
      if dsAuxiliar.RecordCount > 0 then
      begin
      cdsPedidos_Vendas_ItensCODIGOFISCAL.Asstring := dsAuxiliar.FieldByName('CODIGOFISCAL').Asstring;
      end;
      cdsPedidos_Vendas_ItensNUMEROOV.AsInteger := 0;
      cdsPedidos_Vendas_ItensITEMOV.AsInteger := 0;
      finally
      if Assigned(dsAuxiliar) then
      FreeAndNil(dsAuxiliar);
      end;

      cdsPedidos_Vendas_ItensSITUACAO.Asstring := cdsPedidos_Vendas_DadosSITUACAO.Asstring;
      cdsPedidos_Vendas_ItensTIPOPRECO.Asstring := cdsPedidos_Vendas_DadosTIPOPRECO.Asstring;
      cdsPedidos_Vendas_ItensDATACRIACAO.AsDateTime := now;

      cdsPedidos_Vendas_ItensVALORBRUTO.AsFloat := 0; // Alterar
      cdsPedidos_Vendas_ItensVALORLIQUIDO.AsFloat := 0; // Alterar
      cdsPedidos_Vendas_ItensVALORFINANCEIRO.AsFloat := 0;

      cdsPedidos_Vendas_ItensENTREGA.AsDateTime :=
      now + StrToIntDef(Vartostr(TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_ENTREGA_SITE')), 0);
      cdsPedidos_Vendas_ItensVALIDADELOTE.AsDateTime := now;

      cdsPedidos_Vendas_Itens.Post;
      cdsPedidos_MySql_Itens.Next;
      end;

      cdsPedidos_Vendas_Dados.Post;

      if cdsPedidos_Vendas_Dados.ApplyUpdates(-1) <= 0 then
      begin
      TSuperClass.GetInstance.log.Save
      ('[Sistema Impacto - Pedidos Vendas] Pedido de venda importado com sucesso!', mtInfo);
      TSuperClass.GetInstance.log.Save(format('[Site - Pedidos Vendas] Atualizando pedido de venda do site [%s]!',
      [cdsPedidos_MySql_Dadosorders_id.Asstring]), mtInfo);

      sqlAux.Close;

      sqlAux.CommandText := 'update pedidos set IMPORTADO = :IMPORTADO where ORDERS_ID = :PEDIDO';

      sqlAux.Params.ParamByName('IMPORTADO').ParamType := ptInput;
      sqlAux.Params.ParamByName('IMPORTADO').DataType := ftInteger;
      sqlAux.Params.ParamByName('IMPORTADO').AsInteger := 1;

      sqlAux.Params.ParamByName('PEDIDO').ParamType := ptInput;
      sqlAux.Params.ParamByName('PEDIDO').DataType := ftInteger;
      sqlAux.Params.ParamByName('PEDIDO').AsInteger := cdsPedidos_MySql_Dadosorders_id.AsInteger;

      sqlAux.ExecSQL;
      TSuperClass.GetInstance.log.Save('[Site - Pedidos Vendas] Pedido de venda do site atualizado!', mtInfo);

      end;
      end
      else
      TSuperClass.GetInstance.log.Save
      (format('[Sistema Impacto - Pedidos de vendas] Cadastro do cliente [%s] não encontrado.',
      [cdsPedidos_Mysql_Clientescustomers_cpf_cnpj.Asstring]), mtInfo)
      else
      TSuperClass.GetInstance.log.Save
      ('[Sistema Impacto - Pedidos de vendas] Problemas ao localiza o cadastro do cliente.', mtError)
      else
      TSuperClass.GetInstance.log.Save
      ('[Sistema Impacto - Pedidos de vendas] Problemas ao localiza o cadastro do cliente.', mtError);
      except
      on E: Exception do
      begin
      TSuperClass.GetInstance.log.Save(E.Message + format('| Pedido Site: %s',
      [cdsPedidos_MySql_Dadosorders_id.Asstring]), mtError);
      cdsPedidos_Vendas_Dados.Cancel;
      cdsPedidos_Vendas_Itens.Cancel;
      end;
      end;
      finally
      if Assigned(dsAuxiliar) then
      FreeAndNil(dsAuxiliar);
      end;
      cdsPedidos_MySql_Dados.Next;
      end;

      except
      on E: Exception do
      TSuperClass.GetInstance.log.Save(E.Message, mtError);
      end;
      finally
      TSuperClass.GetInstance.User.Disconnect;
      if Assigned(dsAuxiliar) then
      FreeAndNil(dsAuxiliar);
      if scnMysql.Connected then
      scnMysql.Connected := False;
      end;
      {$ENDREGION}
    *)
{$ENDREGION}
{$REGION 'Sol'}
    (*
      {$REGION 'Atualizar Preço'}
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('PRODUTOS', Empresa, Filial);
      try

      TSuperClass.GetInstance.Log.save('[Site - Pedidos de vendas] Atualizando preço!', mtInfo);
      AcessoSiteSol := TAcessoSiteSol.Create(True);
      dsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
      (Format('select CODIGO, PRECOVENDA9, PRECOVENDA10, CODIGOSITE from PRODUTOS where EMPRESA = %S and FILIAL = %S and ' +
      'PRECOVENDA10 > 0 and CODIGOSITE <> '''' and CODIGOSITE is not null order by CODIGOSITE',
      [QuotedStr(Empresa), QuotedStr(Filial)]));

      if Assigned(dsAuxiliar) then
      begin
      if not(dsAuxiliar.State in [dsInactive]) then
      begin
      TSuperClass.GetInstance.Log.save(Format('[Site - Pedidos de vendas] Record Count %d!', [dsAuxiliar.RecordCount]
      ), mtInfo);
      if dsAuxiliar.RecordCount > 0 then
      begin
      Produtos := TObjectList<TAcessoSiteSol.TProduto>.Create;

      for I := 0 to dsAuxiliar.RecordCount - 1 do
      begin
      Produto := TAcessoSiteSol.TProduto.Create;

      Produto.refId := dsAuxiliar.FieldByName('CODIGOSITE').AsString;
      Produto.price := dsAuxiliar.FieldByName('PRECOVENDA10').AsFloat;
      Produto.listPrice := dsAuxiliar.FieldByName('PRECOVENDA9').AsFloat;

      Produtos.Add(Produto);
      dsAuxiliar.Next;
      end;

      try
      AcessoSiteSol.setUser('jhonny.ramos@trssistemas.com.br').setPass('Solacessorios2016')
      .setApyKey('jhonny.ramos@trssistemas.com.br').setKey('Solacessorios2016')
      .setURL('https://solacessorios.vtexcommercestable.com.br/api/pricing/pvt/price-sheet').AlteraPreco(Produtos);
      except
      end;
      end;
      end;
      end;

      finally
      if Assigned(dsAuxiliar) then
      FreeAndNil(dsAuxiliar);
      if Assigned(AcessoSiteSol) then
      FreeAndNil(AcessoSiteSol);
      if Assigned(Produtos) then
      FreeAndNil(Produtos);
      end;
      {$ENDREGION}
      {$REGION 'Atualizar Estoque'}
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('SALDOS_ESTOQUE', Empresa, Filial);
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('PRODUTOS', EmpresaProdutos, FilialProdutos);
      try
      TSuperClass.GetInstance.Log.save('[Site - Pedidos de vendas] Atualizando Estoque!', mtInfo);
      AcessoSiteSol := TAcessoSiteSol.Create(True);
      dsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
      (Format('select A.PRODUTO, (A.SALDO - A.RESERVA) AS "SALDO", B.CODIGOSITE from SALDOS_ESTOQUE A' +
      ' inner join PRODUTOS B on (B.EMPRESA = %s and B.FILIAL = %s and B.CODIGO = A.PRODUTO and B.CODIGOSITE <> '''' and B.CODIGOSITE is not null)'
      + 'where A.EMPRESA = %s and A.FILIAL = %s and (A.SALDO - A.RESERVA) >= 0', [QuotedStr(EmpresaProdutos),
      QuotedStr(FilialProdutos), QuotedStr(Empresa), QuotedStr(Filial)]));

      if Assigned(dsAuxiliar) then
      if not(dsAuxiliar.State in [dsInactive]) then
      begin
      TSuperClass.GetInstance.Log.save(Format('[Site - Pedidos de vendas] Record Count %d!', [dsAuxiliar.RecordCount]
      ), mtInfo);
      if dsAuxiliar.RecordCount > 0 then
      begin
      Produtos := TObjectList<TAcessoSiteSol.TProduto>.Create;

      for I := 0 to dsAuxiliar.RecordCount - 1 do
      begin
      Produto := TAcessoSiteSol.TProduto.Create;

      Produto.refId := dsAuxiliar.FieldByName('CODIGOSITE').AsString;
      Produto.wareHouseId := VarToStrDef(TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_LOCAL_SALDO_SITE'), '');
      Produto.quantity := dsAuxiliar.FieldByName('SALDO').AsFloat;

      Produtos.Add(Produto);
      dsAuxiliar.Next;
      end;

      try
      AcessoSiteSol.setUser('jhonny.ramos@trssistemas.com.br').setPass('Solacessorios2016')
      .setApyKey('jhonny.ramos@trssistemas.com.br').setKey('Solacessorios2016')
      .setURL('https://solacessorios.vtexcommercestable.com.br/api/logistics/pvt/inventory/warehouseitems/setbalance/')
      .AlteraEstoque(Produtos);
      except
      end;
      end;
      end;

      finally
      if Assigned(dsAuxiliar) then
      FreeAndNil(dsAuxiliar);
      if Assigned(AcessoSiteSol) then
      FreeAndNil(AcessoSiteSol);
      if Assigned(Produtos) then
      FreeAndNil(Produtos);
      end;
      {$ENDREGION}
      {$REGION 'Obtem Pedidos'}
      try
      TSuperClass.GetInstance.Log.save('[Site - Pedidos de vendas] Conectando ao site!', mtInfo);

      AcessoSiteSol := TAcessoSiteSol.Create(True);

      Vendas := AcessoSiteSol.setUser('jhonny.ramos@trssistemas.com.br').setPass('Solacessorios2016')
      .setApyKey('jhonny.ramos@trssistemas.com.br').setKey('Solacessorios2016')
      .setURL('https://solacessorios.vtexcommercestable.com.br/api/oms/pvt/orders?f_status=ready-for-handling&per_page=50')
      .processaRequisicaoObterVendas;

      TSuperClass.GetInstance.Log.save(Format('[Site - Pedidos de vendas] Quantidade de Vendas %d!', [Vendas.Count]), mtInfo);

      try
      try
      TSuperClass.GetInstance.Log.save('[Site - Pedidos de vendas] Importando pedidos de vendas itens!', mtInfo);

      for Venda in Vendas do
      begin
      AcessoSiteSol.setURL(Format('https://solacessorios.vtexcommercestable.com.br/api/oms/pvt/orders/%s', [Venda.orderId]))
      .processaRequisicaoObterVendasCompleto(Venda);
      try
      try
      if cdsPedidos_Vendas_Dados.Active then
      cdsPedidos_Vendas_Dados.Close;
      if cdsPedidos_Vendas_Itens.Active then
      cdsPedidos_Vendas_Itens.Close;

      TSuperClass.GetInstance.Log.save
      ('[Sistema Impacto - Pedidos de vendas] Importando pedidos de vendas dados!', mtInfo);
      cdsPedidos_Vendas_Dados.Open;
      TSuperClass.GetInstance.Log.save
      ('[Sistema Impacto - Pedidos de vendas] Importando pedidos de vendas itens!', mtInfo);
      cdsPedidos_Vendas_Itens.Open;

      TSuperClass.GetInstance.Log.save('[Sistema Impacto - Pedidos de vendas] Obtendo dados do cliente.', mtInfo);
      // Obtem as informações do cliente
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('CLIENTES', Empresa, Filial);

      dsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
      (Format('select * from CLIENTES where EMPRESA = %s and FILIAL = %S and %s = %s',
      [QuotedStr(Empresa), QuotedStr(Filial),
      TSuperClass.GetInstance.GenericsF.IfThen((UpperCase(Venda.Cliente.documentType) = 'CPF'), 'CPF', 'CNPJ'),
      QuotedStr(StringReplace(StringReplace(StringReplace(Venda.Cliente.document, '.', '', [rfReplaceAll]), '-', '',
      [rfReplaceAll]), '/', '', [rfReplaceAll]))]));

      TSuperClass.GetInstance.Config.Load(Schedule);

      if Assigned(dsAuxiliar) then
      if not(dsAuxiliar.State in [dsInactive]) then
      begin
      if dsAuxiliar.RecordCount > 0 then // Cliente cadastro - Atualizar cadastro
      begin
      TSuperClass.GetInstance.Log.save(Format('Atualizando o cliente [%s]',
      [dsAuxiliar.FieldByName('CODIGO').AsString]), mtInfo);

      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('CLIENTES', Empresa, Filial);

      IdCliente := dsAuxiliar.FieldByName('CODIGO').AsInteger;

      try
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('SYS_LISTS_ITEMS', Empresa, Filial);
      dsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
      (Format('select VALOR from SYS_LISTS_ITEMS where EMPRESA = %s and FILIAL = %S and ID = %d and DESCRICAO = %S',
      [QuotedStr(Empresa), QuotedStr(Filial), 19, QuotedStr(UpperCase(Venda.Cliente.Endereco.city))]));
      if Assigned(dsAuxiliar) then
      if not(dsAuxiliar.State in [dsInactive]) then
      if dsAuxiliar.RecordCount > 0 then
      Cmunicipio := dsAuxiliar.FieldByName('VALOR').AsString;
      finally
      if Assigned(dsAuxiliar) then
      FreeAndNil(dsAuxiliar);
      end;

      cdsAuxiliar.Close;

      cdsAuxiliar.CommandText :=
      Format(' update CLIENTES set NOME = %s, REDUZIDO = %s, ENDERECO = %s, NUMERO = %s, ' +
      ' COMPLEMENTO = %s, MUNICIPIO = %s, BAIRRO = %s, CEP = %s, EMAIL = %s, TELEFONE = %s,  CMUNICIPIO = %s ' +
      ' where EMPRESA = %S and FILIAL = %S and CODIGO = %d',
      [QuotedStr(Venda.Cliente.firstName + ' ' + Venda.Cliente.lastName),
      QuotedStr(Venda.Cliente.firstName + ' ' + Venda.Cliente.lastName),
      QuotedStr(Venda.Cliente.Endereco.street), QuotedStr(Copy(Venda.Cliente.Endereco.number, 0, 5)),
      QuotedStr(Copy(Venda.Cliente.Endereco.complement, 0, 25)), QuotedStr(Venda.Cliente.Endereco.city),
      QuotedStr(Copy(Venda.Cliente.Endereco.neighborhood, 0, 30)),
      QuotedStr(StringReplace(Venda.Cliente.Endereco.postalCode, '-', EmptyStr, [])),
      QuotedStr(Venda.Cliente.email), QuotedStr(Copy(Venda.Cliente.phone, 6, 8)), QuotedStr(Cmunicipio),
      QuotedStr(Schedule.Company), QuotedStr(Schedule.Branch), IdCliente]);

      TSuperClass.GetInstance.Log.save(Format('Query de atualização de cliente [%s]', [cdsAuxiliar.CommandText]
      ), mtInfo);

      cdsAuxiliar.Execute;

      CodigoCliente := IdCliente;
      end
      else // Cliente não cadastrado - Cadastrar cliente
      begin
      TSuperClass.GetInstance.Log.save(Format('Inserindo Cliente o cliente %s [%s]',
      [Venda.Cliente.documentType, Venda.Cliente.document]), mtInfo);
      try
      dsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
      (Format('select MAX(CODIGO) AS "LASTCODIGO" from CLIENTES where EMPRESA = %S and FILIAL = %S',
      [QuotedStr(Empresa), QuotedStr(Filial)]));
      if Assigned(dsAuxiliar) then
      if NOT(dsAuxiliar.State in [dsInactive]) then
      if dsAuxiliar.RecordCount > 0 then
      begin

      IdCliente := dsAuxiliar.FieldByName('LASTCODIGO').AsInteger;

      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('CLIENTES', Empresa, Filial);

      cdsAuxiliar.Close;

      try
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('SYS_LISTS_ITEMS', Empresa, Filial);
      dsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
      (Format('select VALOR from SYS_LISTS_ITEMS where EMPRESA = %s and FILIAL = %S and ID = %d and DESCRICAO = %S',
      [QuotedStr(Empresa), QuotedStr(Filial), 19,
      QuotedStr(UpperCase(Venda.Cliente.Endereco.city))]));
      if Assigned(dsAuxiliar) then
      if not(dsAuxiliar.State in [dsInactive]) then
      if dsAuxiliar.RecordCount > 0 then
      Cmunicipio := dsAuxiliar.FieldByName('VALOR').AsString;
      finally
      if Assigned(dsAuxiliar) then
      FreeAndNil(dsAuxiliar);
      end;

      cdsAuxiliar.CommandText :=
      Format(' insert into CLIENTES (EMPRESA, FILIAL, CODIGO, STATUS, DATACADASTRO, NOME, PESSOA, REDUZIDO, ENDERECO, UF, DATACRIACAO,'
      + ' NUMERO, COMPLEMENTO, MUNICIPIO, BAIRRO, CEP, CMUNICIPIO, TELEFONE, %s)' +
      ' values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)',
      [TSuperClass.GetInstance.GenericsF.IfThen(Venda.Cliente.documentType = 'cpf', 'CPF', 'CNPJ, IE'),
      QuotedStr(Schedule.Company), QuotedStr(Schedule.Branch), IntToStr(IdCliente + 1), QuotedStr('0'),
      QuotedStr(FormatDateTime('mm/dd/yyyy', now)),
      QuotedStr(UpperCase(Copy(Venda.Cliente.firstName + ' ' + Venda.Cliente.lastName, 0, 120))),
      QuotedStr(TSuperClass.GetInstance.GenericsF.IfThen(Venda.Cliente.documentType = 'cpf', '0', '1')),
      QuotedStr(UpperCase(Copy(Venda.Cliente.firstName + ' ' + Venda.Cliente.lastName, 0, 120))),
      QuotedStr(UpperCase(Venda.Cliente.Endereco.street)),
      QuotedStr(UpperCase(Venda.Cliente.Endereco.State)), QuotedStr(FormatDateTime('mm/dd/yyyy', now)),
      QuotedStr(UpperCase(Copy(Venda.Cliente.Endereco.number, 0, 5))),
      QuotedStr(UpperCase(Copy(Venda.Cliente.Endereco.complement, 0, 25))),
      QuotedStr(UpperCase(Venda.Cliente.Endereco.city)),
      QuotedStr(UpperCase(Copy(Venda.Cliente.Endereco.neighborhood, 0, 30))),
      QuotedStr(StringReplace(Venda.Cliente.Endereco.postalCode, '-', EmptyStr, [rfReplaceAll])),
      QuotedStr(Cmunicipio), QuotedStr(Copy(Venda.Cliente.phone, 6, 8)),
      TSuperClass.GetInstance.GenericsF.IfThen(Venda.Cliente.documentType = 'cpf',
      QuotedStr(Venda.Cliente.document), QuotedStr(Venda.Cliente.document) + ', ' +
      QuotedStr(Venda.Cliente.stateInscription))]);

      TSuperClass.GetInstance.Log.save(Format('Query de cadastro de cliente [%s]',
      [cdsAuxiliar.CommandText]), mtInfo);

      cdsAuxiliar.Execute;

      CodigoCliente := IdCliente + 1;

      end
      else
      raise Exception.Create('Erro ao buscar ID novo para o cadastro do cliente')
      else
      raise Exception.Create('Erro na query de consulta do ultimo CODIGO de cliente')
      else
      raise Exception.Create('Erro na query de consulta do ultimo CODIFO de cliente');

      finally
      if Assigned(dsAuxiliar) then
      FreeAndNil(dsAuxiliar);
      end;
      end;

      // Preenche os campos do pedido conforme o cadastro do cliente
      cdsPedidos_Vendas_Dados.Insert;
      cdsPedidos_Vendas_DadosCLIENTE.AsInteger := CodigoCliente;
      cdsPedidos_Vendas_DadosUF.AsString := UpperCase(Venda.Cliente.Endereco.State);
      cdsPedidos_Vendas_DadosVENDEDOR.AsInteger :=
      StrToIntDef
      (VarToStrDef(TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_VENDEDOR_PEDIDO_SITE'), '0'), 0);

      cdsPedidos_Vendas_DadosCONDICAOPAGAMENTO.AsInteger :=
      StrToIntDef
      (VarToStrDef(TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_CONDICAO_PEDIDO_SITE'), '0'), 0);

      cdsPedidos_Vendas_DadosTIPOPRECO.AsString :=
      VarToStrDef(TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_TIPOPRECO_PEDIDO_SITE'), '01');

      cdsPedidos_Vendas_DadosEMISSAO.AsDateTime := now;
      cdsPedidos_Vendas_DadosSTATUSENTREGA.AsString := '0';

      TSuperClass.GetInstance.Log.save
      ('[Sistema Impacto - Pedidos de vendas] Inserindo produtos do pedido.', mtInfo);
      Count := 1;
      for Produto in Venda.items do
      begin
      cdsPedidos_Vendas_Itens.Insert;

      cdsPedidos_Vendas_ItensITEM.AsInteger := Count;
      cdsPedidos_Vendas_ItensPRODUTO.AsString := Produto.refId;
      cdsPedidos_Vendas_ItensDESCRICAO.AsString := Produto.Name;

      acc := StringReplace(FloatToStr(Produto.price), '.', ',', []);

      Insert(',', acc, Length(acc) - 1);

      if acc[1] = ',' then
      Insert('0', acc, 1);

      cdsPedidos_Vendas_ItensQUANTIDADE.AsFloat := Produto.quantity;
      cdsPedidos_Vendas_ItensUNITARIO.AsFloat := StrToFloatDef(acc, 0);

      cdsPedidos_Vendas_ItensTOTAL.AsFloat :=
      (cdsPedidos_Vendas_ItensQUANTIDADE.AsFloat * cdsPedidos_Vendas_ItensUNITARIO.AsFloat);
      try
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('PRODUTOS', Empresa, Filial);

      dsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
      (Format('select * from PRODUTOS where EMPRESA = %S and FILIAL = %S and CODIGO = %s',
      [QuotedStr(Empresa), QuotedStr(Filial), QuotedStr(cdsPedidos_Vendas_ItensPRODUTO.AsString)]));

      if Assigned(dsAuxiliar) then
      if not(dsAuxiliar.State in [dsInactive]) then
      if dsAuxiliar.RecordCount > 0 then
      begin
      if dsAuxiliar.FieldByName('REGRASAIDA').AsInteger > 0 then
      cdsPedidos_Vendas_ItensREGRA.AsInteger := dsAuxiliar.FieldByName('REGRASAIDA').AsInteger
      else
      cdsPedidos_Vendas_ItensREGRA.AsInteger :=
      StrToIntDef
      (VarToStrDef(TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_REGRA_SITE'), '0'), 0);
      cdsPedidos_Vendas_ItensDESCRICAO.AsString := dsAuxiliar.FieldByName('DESCRICAO').AsString;
      cdsPedidos_Vendas_ItensPRIMEIRAUNIDADE.AsString :=
      dsAuxiliar.FieldByName('PRIMEIRAUNIDADE').AsString;
      cdsPedidos_Vendas_ItensLOCAL.AsString := dsAuxiliar.FieldByName('LOCALPADRAO').AsString;
      cdsPedidos_Vendas_ItensNCM.AsString := dsAuxiliar.FieldByName('NCM').AsString;
      cdsPedidos_Vendas_ItensCEST.AsString := dsAuxiliar.FieldByName('CEST').AsString
      end
      else
      TSuperClass.GetInstance.Log.save
      (Format('[Sistema Impacto - Pedidos de vendas] Produto não encontrado [%s].',
      [cdsPedidos_Vendas_ItensPRODUTO.AsString]), mtInfo);
      finally
      if Assigned(dsAuxiliar) then
      FreeAndNil(dsAuxiliar);
      end;
      try
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('REGRAS_FISCAIS', Empresa, Filial);
      dsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
      (Format('select * from REGRAS_FISCAIS where EMPRESA = %S and FILIAL = %S and CODIGO = %s',
      [QuotedStr(Empresa), QuotedStr(Filial), QuotedStr(cdsPedidos_Vendas_ItensREGRA.AsString)]));
      if Assigned(dsAuxiliar) then
      if not(dsAuxiliar.State in [dsInactive]) then
      if dsAuxiliar.RecordCount > 0 then
      begin
      cdsPedidos_Vendas_ItensCODIGOFISCAL.AsString := dsAuxiliar.FieldByName('CODIGOFISCAL').AsString;
      end;
      cdsPedidos_Vendas_ItensNUMEROOV.AsInteger := 0;
      cdsPedidos_Vendas_ItensITEMOV.AsInteger := 0;
      finally
      if Assigned(dsAuxiliar) then
      FreeAndNil(dsAuxiliar);
      end;

      cdsPedidos_Vendas_ItensSITUACAO.AsString := cdsPedidos_Vendas_DadosSITUACAO.AsString;
      cdsPedidos_Vendas_ItensTIPOPRECO.AsString := cdsPedidos_Vendas_DadosTIPOPRECO.AsString;
      cdsPedidos_Vendas_ItensDATACRIACAO.AsDateTime := now;

      cdsPedidos_Vendas_ItensVALORBRUTO.AsFloat := 0; // Alterar
      cdsPedidos_Vendas_ItensVALORLIQUIDO.AsFloat := 0; // Alterar
      cdsPedidos_Vendas_ItensVALORFINANCEIRO.AsFloat := 0;

      cdsPedidos_Vendas_ItensENTREGA.AsDateTime :=
      now + StrToIntDef(Vartostr(TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_ENTREGA_SITE')), 0);
      cdsPedidos_Vendas_ItensVALIDADELOTE.AsDateTime := now;

      cdsPedidos_Vendas_Itens.Post;

      Inc(Count);
      end;

      cdsPedidos_Vendas_DadosVALORFRETE.AsFloat := Venda.shippingPrice;

      cdsPedidos_Vendas_Dados.Post;

      if cdsPedidos_Vendas_Dados.ApplyUpdates(-1) <= 0 then
      begin
      TSuperClass.GetInstance.Log.save
      ('[Sistema Impacto - Pedidos de vendas] Pedido de venda importado com sucesso! Alterado situação no site.',
      mtInfo);
      AcessoSiteSol.setUser('jhonny.ramos@trssistemas.com.br').setPass('Solacessorios2016')
      .setApyKey('jhonny.ramos@trssistemas.com.br').setKey('Solacessorios2016')
      .setURL(Format('https://solacessorios.vtexcommercestable.com.br/api/oms/pvt/orders/%s/start-handling',
      [Venda.orderId])).processaRequisicaoIniciarManuseio;
      { TSuperClass.GetInstance.log.Save
      ('[Sistema Impacto - Pedidos Vendas] Pedido de venda importado com sucesso!', mtInfo);
      TSuperClass.GetInstance.log.Save
      (format('[Site - Pedidos Vendas] Atualizando pedido de venda do site [%s]!',
      [cdsPedidos_MySql_Dadosorders_id.Asstring]), mtInfo);

      sqlAux.Close;

      sqlAux.CommandText := 'update pedidos set IMPORTADO = :IMPORTADO where ORDERS_ID = :PEDIDO';

      sqlAux.Params.ParamByName('IMPORTADO').ParamType := ptInput;
      sqlAux.Params.ParamByName('IMPORTADO').DataType := ftInteger;
      sqlAux.Params.ParamByName('IMPORTADO').AsInteger := 1;

      sqlAux.Params.ParamByName('PEDIDO').ParamType := ptInput;
      sqlAux.Params.ParamByName('PEDIDO').DataType := ftInteger;
      sqlAux.Params.ParamByName('PEDIDO').AsInteger := cdsPedidos_MySql_Dadosorders_id.AsInteger;

      sqlAux.ExecSQL;
      TSuperClass.GetInstance.log.Save('[Site - Pedidos Vendas] Pedido de venda do site atualizado!', mtInfo); }
      end;
      end
      else
      TSuperClass.GetInstance.Log.save
      ('[Sistema Impacto - Pedidos de vendas] Problemas ao localiza o cadastro do cliente.', mtError)
      else
      TSuperClass.GetInstance.Log.save
      ('[Sistema Impacto - Pedidos de vendas] Problemas ao localiza o cadastro do cliente.', mtError);
      except
      on E: Exception do
      begin
      TSuperClass.GetInstance.Log.save(E.Message + Format('| Pedido Site: %s', [Venda.orderId]), mtError);
      cdsPedidos_Vendas_Dados.Cancel;
      cdsPedidos_Vendas_Itens.Cancel;
      end;
      end;
      finally
      if Assigned(dsAuxiliar) then
      FreeAndNil(dsAuxiliar);
      end;
      end;
      except
      on E: Exception do
      TSuperClass.GetInstance.Log.save(E.Message, mtError);
      end;
      finally
      TSuperClass.GetInstance.User.Disconnect;
      if Assigned(dsAuxiliar) then
      FreeAndNil(dsAuxiliar);
      if scnMysql.Connected then
      scnMysql.Connected := false;
      end;

      finally
      if Assigned(AcessoSiteSol) then
      FreeAndNil(AcessoSiteSol);
      if Assigned(Vendas) then
      FreeAndNil(Vendas);
      end;
      {$ENDREGION}
    *)
{$ENDREGION}
{$REGION 'TiggerComp'}
{$REGION 'Cliente'}
    { *
      try
      try
      AcessoFtpTigger := TAcessoFTPTigger.Create;

      ClientesTigger := AcessoFtpTigger.setHost('tiggercomp.com.br').setUser('impactov4').setPass('trs2008impacto')
      .ObterClientes;

      for ClienteTigger in ClientesTigger do
      begin
      cdsClientes.Close;
      cdsClientes.Open;

      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('CLIENTES', Empresa, Filial);

      dsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
      (Format('select * from CLIENTES where EMPRESA = %s and FILIAL = %S and %s = %s',
      [QuotedStr(Empresa), QuotedStr(Filial), TSuperClass.GetInstance.GenericsF.IfThen(ClienteTigger.TipoConta = '0', 'CPF',
      'CNPJ'), QuotedStr(StringReplace(StringReplace(StringReplace(ClienteTigger.CpfCnpj, '.', '', [rfReplaceAll]), '-', '',
      [rfReplaceAll]), '/', '', [rfReplaceAll]))]));

      if Assigned(dsAuxiliar) then
      if not(dsAuxiliar.State in [dsInactive]) then
      if dsAuxiliar.RecordCount = 0 then
      begin
      TSuperClass.GetInstance.Log.save(Format('[Clientes] Cadastrando um cliente novo com o [%s, %s]!',
      [TSuperClass.GetInstance.GenericsF.IfThen((UpperCase(ClienteTigger.TipoConta) = '0'), 'CPF', 'CNPJ'),
      ClienteTigger.CpfCnpj]), mtInfo);

      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('CLIENTES', Empresa, Filial);

      cdsClientes.Insert;
      cdsClientesEMPRESA.AsString := Empresa;
      cdsClientesFILIAL.AsString := Filial;
      cdsClientesCODIGO.AsInteger := 999999;
      cdsClientesSTATUS.AsString := '0';
      cdsClientesNOME.AsString := ClienteTigger.Nome;
      cdsClientesPESSOA.AsString := ClienteTigger.TipoConta;
      cdsClientesREDUZIDO.AsString := ClienteTigger.Nome;
      cdsClientesCONTATO.AsString := ClienteTigger.Contato;

      cdsClientesENDERECO.AsString := ClienteTigger.Endereco;
      cdsClientesNUMERO.AsString := ClienteTigger.Numero;
      cdsClientesCOMPLEMENTO.AsString := ClienteTigger.Complemento;
      cdsClientesUF.AsString := ClienteTigger.UF;
      cdsClientesMUNICIPIO.AsString := ClienteTigger.Cidade;
      cdsClientesBAIRRO.AsString := ClienteTigger.Bairro;
      cdsClientesCEP.AsString := StringReplace(ClienteTigger.CEP, '-', EmptyStr, []);
      cdsClientesTIPOPRECO.AsString := '01';

      if UpperCase(ClienteTigger.TipoConta) = '0' then
      begin
      cdsClientesCPF.AsString :=
      StringReplace(StringReplace(StringReplace(ClienteTigger.CpfCnpj, '.', '', [rfReplaceAll]), '-', '',
      [rfReplaceAll]), '/', '', [rfReplaceAll]);
      cdsClientesRG.AsString := ClienteTigger.RgIe;
      end
      else
      begin
      cdsClientesCNPJ.AsString :=
      StringReplace(StringReplace(StringReplace(ClienteTigger.CpfCnpj, '.', '', [rfReplaceAll]), '-', '',
      [rfReplaceAll]), '/', '', [rfReplaceAll]);
      cdsClientesIE.AsString := ClienteTigger.RgIe;
      end;

      cdsClientesEMAIL.AsString := ClienteTigger.email;
      cdsClientesDDD.AsString := Copy(ClienteTigger.Telefone, 2, 2);
      cdsClientesTELEFONE.AsString := Copy(ClienteTigger.Telefone, 5, 8);
      cdsClientesDATACRIACAO.AsDateTime := now;
      cdsClientesDATACADASTRO.AsDateTime := now;

      try
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('SYS_LISTS_ITEMS', Empresa, Filial);
      dsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
      (Format('select VALOR from SYS_LISTS_ITEMS where EMPRESA = %s and FILIAL = %S and ID = %d and DESCRICAO = %S',
      [QuotedStr(Empresa), QuotedStr(Filial), 19, QuotedStr(UpperCase(ClienteTigger.Cidade))]));
      if Assigned(dsAuxiliar) then
      if not(dsAuxiliar.State in [dsInactive]) then
      if dsAuxiliar.RecordCount > 0 then
      cdsClientesCMUNICIPIO.AsString := dsAuxiliar.FieldByName('VALOR').AsString;
      finally
      if Assigned(dsAuxiliar) then
      FreeAndNil(dsAuxiliar);
      end;

      cdsClientes.Post;

      if cdsClientes.ApplyUpdates(-1) <= 0 then
      TSuperClass.GetInstance.Log.save(Format('[Clientes] Cliente cadastrado com sucesso[%s]!',
      [ClienteTigger.CpfCnpj]), mtInfo)

      end;
      end;

      AcessoFtpTigger.MoverParaServer('clientes');

      except
      on E: Exception do
      TSuperClass.GetInstance.Log.save(Format('[Clientes] Falha ao cadastrar o cliente %s', [E.Message]), mtError)
      end;
      finally
      if Assigned(ClientesTigger) then
      FreeAndNil(ClientesTigger);
      if Assigned(AcessoFtpTigger) then
      FreeAndNil(AcessoFtpTigger);
      end;
      TSuperClass.GetInstance.Log.save('[Clientes] Finalizado processo de importação de clientes!', mtError);
      * }
{$ENDREGION}
{$REGION 'Pedido de venda'}
    { *
      try
      try

      AcessoFtpTigger := TAcessoFTPTigger.Create;

      VendasTigger := AcessoFtpTigger.setHost('tiggercomp.com.br').setUser('impactov4').setPass('trs2008impacto').ObterPedidos;

      TSuperClass.GetInstance.Log.save('[Site - Pedidos de vendas] Importando pedidos de vendas!', mtInfo);

      for VendaTigger in VendasTigger do
      begin
      if cdsPedidos_Vendas_Dados.Active then
      cdsPedidos_Vendas_Dados.Close;
      if cdsPedidos_Vendas_Itens.Active then
      cdsPedidos_Vendas_Itens.Close;

      TSuperClass.GetInstance.Log.save('[Sistema Impacto - Pedidos de vendas] Importando pedidos de vendas dados!', mtInfo);
      cdsPedidos_Vendas_Dados.Open;
      TSuperClass.GetInstance.Log.save('[Sistema Impacto - Pedidos de vendas] Importando pedidos de vendas itens!', mtInfo);
      cdsPedidos_Vendas_Itens.Open;

      TSuperClass.GetInstance.Log.save('[Sistema Impacto - Pedidos de vendas] Obtendo dados do cliente.', mtInfo);

      // Obtem as informações do cliente
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('CLIENTES', Empresa, Filial);

      dsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
      (Format('select * from CLIENTES where EMPRESA = %s and FILIAL = %S and %s = %s',
      [QuotedStr(Empresa), QuotedStr(Filial),
      TSuperClass.GetInstance.GenericsF.IfThen((UpperCase(VendaTigger.Cliente.TipoConta) = '0'), 'CPF', 'CNPJ'),
      QuotedStr(StringReplace(StringReplace(StringReplace(VendaTigger.Cliente.CpfCnpj, '.', '', [rfReplaceAll]), '-', '',
      [rfReplaceAll]), '/', '', [rfReplaceAll]))]));

      if Assigned(dsAuxiliar) then
      if not(dsAuxiliar.State in [dsInactive]) then
      if dsAuxiliar.RecordCount > 0 then
      begin
      TSuperClass.GetInstance.Log.save(Format('Atualizando o cliente [%s]', [dsAuxiliar.FieldByName('CODIGO').AsString]
      ), mtInfo);
      try
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('SYS_LISTS_ITEMS', Empresa, Filial);
      dsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
      (Format('select VALOR from SYS_LISTS_ITEMS where EMPRESA = %s and FILIAL = %S and ID = %d and DESCRICAO = %S',
      [QuotedStr(Empresa), QuotedStr(Filial), 19, QuotedStr(UpperCase(VendaTigger.Cliente.Cidade))]));
      if Assigned(dsAuxiliar) then
      if not(dsAuxiliar.State in [dsInactive]) then
      if dsAuxiliar.RecordCount > 0 then
      CMuncipio := dsAuxiliar.FieldByName('VALOR').AsString;
      finally
      if Assigned(dsAuxiliar) then
      FreeAndNil(dsAuxiliar);
      end;

      cdsAuxiliar.Close;
      cdsAuxiliar.CommandText := Format('update CLIENTES set NOME = %s, REDUZIDO = %s, ENDERECO = %s, NUMERO = %s, ' +
      ' COMPLEMENTO = %s, MUNICIPIO = %s, BAIRRO = %s, CEP = %s, EMAIL = %s,' +
      ' TELEFONE = %s, RG = %s, UF = %S, CMUNICIPIO = %s, EMAILNFE = %S, DDD = %S where (EMPRESA = %s) and (FILIAL = %s) and (CODIGO = %s) ',
      [QuotedStr(VendaTigger.Cliente.Nome), QuotedStr(VendaTigger.Cliente.Nome),
      QuotedStr(VendaTigger.Cliente.Endereco), QuotedStr(VendaTigger.Cliente.Numero),
      QuotedStr(VendaTigger.Cliente.Complemento), QuotedStr(VendaTigger.Cliente.Cidade),
      QuotedStr(VendaTigger.Cliente.Bairro), QuotedStr(StringReplace(StringReplace(VendaTigger.Cliente.CEP, '-',
      EmptyStr, [rfReplaceAll]), '.', EmptyStr, [rfReplaceAll])), QuotedStr(VendaTigger.Cliente.email),
      QuotedStr(Copy(VendaTigger.Cliente.Telefone, 5, 8)), QuotedStr(VendaTigger.Cliente.RgIe),
      QuotedStr(VendaTigger.Cliente.UF), QuotedStr(CMuncipio), QuotedStr(VendaTigger.Cliente.email),
      QuotedStr(Copy(VendaTigger.Cliente.Telefone, 1, 2)), QuotedStr(Empresa), QuotedStr(Filial),
      dsAuxiliar.FieldByName('CODIGO').AsString]);
      cdsAuxiliar.Execute;
      end
      else
      begin
      TSuperClass.GetInstance.Log.save(Format('[Clientes] Cadastrando um cliente novo com o [%s, %s]!',
      [TSuperClass.GetInstance.GenericsF.IfThen((UpperCase(VendaTigger.Cliente.TipoConta) = '0'), 'CPF', 'CNPJ'),
      VendaTigger.Cliente.CpfCnpj]), mtInfo);

      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('CLIENTES', Empresa, Filial);

      cdsClientes.Insert;
      cdsClientesEMPRESA.AsString := Empresa;
      cdsClientesFILIAL.AsString := Filial;
      cdsClientesCODIGO.AsInteger := 999999;
      cdsClientesSTATUS.AsString := '0';
      cdsClientesNOME.AsString := VendaTigger.Cliente.Nome;
      cdsClientesPESSOA.AsString := VendaTigger.Cliente.TipoConta;
      cdsClientesREDUZIDO.AsString := VendaTigger.Cliente.Nome;
      cdsClientesCONTATO.AsString := VendaTigger.Cliente.Contato;

      cdsClientesENDERECO.AsString := VendaTigger.Cliente.Endereco;
      cdsClientesNUMERO.AsString := VendaTigger.Cliente.Numero;
      cdsClientesCOMPLEMENTO.AsString := VendaTigger.Cliente.Complemento;
      cdsClientesUF.AsString := VendaTigger.Cliente.UF;
      cdsClientesMUNICIPIO.AsString := VendaTigger.Cliente.Cidade;
      cdsClientesBAIRRO.AsString := VendaTigger.Cliente.Bairro;
      cdsClientesCEP.AsString := StringReplace(VendaTigger.Cliente.CEP, '-', EmptyStr, []);
      cdsClientesTIPOPRECO.AsString := '01';

      if UpperCase(VendaTigger.Cliente.TipoConta) = '0' then
      begin
      cdsClientesCPF.AsString :=
      StringReplace(StringReplace(StringReplace(VendaTigger.Cliente.CpfCnpj, '.', '', [rfReplaceAll]), '-', '',
      [rfReplaceAll]), '/', '', [rfReplaceAll]);
      cdsClientesRG.AsString := VendaTigger.Cliente.RgIe;
      end
      else
      begin
      cdsClientesCNPJ.AsString :=
      StringReplace(StringReplace(StringReplace(VendaTigger.Cliente.CpfCnpj, '.', '', [rfReplaceAll]), '-', '',
      [rfReplaceAll]), '/', '', [rfReplaceAll]);
      cdsClientesIE.AsString := VendaTigger.Cliente.RgIe;
      end;

      cdsClientesEMAIL.AsString := VendaTigger.Cliente.email;
      cdsClientesDDD.AsString := Copy(VendaTigger.Cliente.Telefone, 2, 2);
      cdsClientesTELEFONE.AsString := Copy(VendaTigger.Cliente.Telefone, 5, 8);
      cdsClientesDATACRIACAO.AsDateTime := now;
      cdsClientesDATACADASTRO.AsDateTime := now;

      try
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('SYS_LISTS_ITEMS', Empresa, Filial);
      dsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
      (Format('select VALOR from SYS_LISTS_ITEMS where EMPRESA = %s and FILIAL = %S and ID = %d and DESCRICAO = %S',
      [QuotedStr(Empresa), QuotedStr(Filial), 19, QuotedStr(UpperCase(VendaTigger.Cliente.Cidade))]));
      if Assigned(dsAuxiliar) then
      if not(dsAuxiliar.State in [dsInactive]) then
      if dsAuxiliar.RecordCount > 0 then
      cdsClientesCMUNICIPIO.AsString := dsAuxiliar.FieldByName('VALOR').AsString;
      finally
      if Assigned(dsAuxiliar) then
      FreeAndNil(dsAuxiliar);
      end;

      cdsClientes.Post;

      if cdsClientes.ApplyUpdates(-1) <= 0 then
      TSuperClass.GetInstance.Log.save(Format('[Clientes] Cliente cadastrado com sucesso[%s]!',
      [VendaTigger.Cliente.CpfCnpj]), mtInfo);
      end;

      // Preenche os campos do pedido conforme o cadastro do cliente
      cdsPedidos_Vendas_Dados.Insert;
      cdsPedidos_Vendas_DadosNUMEROINTERNO.AsString := VendaTigger.oID;
      cdsPedidos_Vendas_DadosCLIENTE.AsInteger := cdsClientesCODIGO.AsInteger;
      cdsPedidos_Vendas_DadosUF.AsString := cdsClientesUF.AsString;

      cdsPedidos_Vendas_DadosOBSERVACAO.AsString := Format('Pedido  site = %s - %d iten(s)',
      [VendaTigger.oID, VendaTigger.Produtos.Count]);

      TSuperClass.GetInstance.Log.save('[Site - Pedidos de vendas] Obtendo vendedor.', mtInfo);
      if (dsAuxiliar.FieldByName('VENDEDOR').AsInteger > 0) then
      cdsPedidos_Vendas_DadosVENDEDOR.AsInteger := dsAuxiliar.FieldByName('VENDEDOR').AsInteger
      else
      cdsPedidos_Vendas_DadosVENDEDOR.AsInteger :=
      StrToIntDef(VarToStrDef(TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_VENDEDOR_PEDIDO_SITE'), '0'), 0);

      TSuperClass.GetInstance.Log.save('[Sistema Impacto - Pedidos de vendas] Obtendo condição de pagamento.', mtInfo);
      if (dsAuxiliar.FieldByName('CONDICAOPAGAMENTO').AsInteger > 0) then
      cdsPedidos_Vendas_DadosCONDICAOPAGAMENTO.AsInteger := dsAuxiliar.FieldByName('CONDICAOPAGAMENTO').AsInteger
      else
      cdsPedidos_Vendas_DadosCONDICAOPAGAMENTO.AsInteger :=
      StrToIntDef(VarToStrDef(TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_CONDICAO_PEDIDO_SITE'), '0'), 0);

      TSuperClass.GetInstance.Log.save('[Sistema Impacto - Pedidos de vendas] Obtendo tipo de preço.', mtInfo);
      if ((dsAuxiliar.FieldByName('TIPOPRECO').AsString <> EmptyStr) and (dsAuxiliar.FieldByName('TIPOPRECO').AsString <> #0))
      then
      cdsPedidos_Vendas_DadosTIPOPRECO.AsString := dsAuxiliar.FieldByName('TIPOPRECO').AsString
      else
      cdsPedidos_Vendas_DadosTIPOPRECO.AsString :=
      VarToStrDef(TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_TIPOPRECO_PEDIDO_SITE'), '01');

      cdsPedidos_Vendas_DadosEMISSAO.AsDateTime := now;
      cdsPedidos_Vendas_DadosSTATUSENTREGA.AsString := '0';
      cdsPedidos_Vendas_DadosVALORFRETE.AsFloat := VendaTigger.Frete;
      cdsPedidos_Vendas_DadosTRANSPORTADORA.AsString := VendaTigger.Transportadora;
      cdsPedidos_Vendas_DadosFORMAPAGAMENTO.AsString := VendaTigger.impacto_forma_pagamento;

      TSuperClass.GetInstance.Log.save('[Sistema Impacto - Pedidos de vendas] Inserindo produtos do pedido.', mtInfo);
      Count := 1;
      for ProdutoTigger in VendaTigger.Produtos do
      begin
      cdsPedidos_Vendas_Itens.Insert;

      cdsPedidos_Vendas_ItensITEM.AsInteger := Count;
      cdsPedidos_Vendas_ItensPRODUTO.AsString := ProdutoTigger.model;
      // cdsPedidos_Vendas_ItensDESCRICAO.Asstring := ProdutoTigger.qty;

      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('PRODUTOS', Empresa, Filial);
      try
      dsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
      (Format('select DESCRICAO, NCM, CEST from PRODUTOS where EMPRESA = %S and FILIAL = %S and CODIGO = %S',
      [QuotedStr(Empresa), QuotedStr(Filial), QuotedStr(ProdutoTigger.model)]));
      if Assigned(dsAuxiliar) then
      if not(dsAuxiliar.State in [dsInactive]) then
      if dsAuxiliar.RecordCount > 0 then
      begin
      cdsPedidos_Vendas_ItensDESCRICAO.AsString := dsAuxiliar.FieldByName('DESCRICAO').AsString;
      cdsPedidos_Vendas_ItensNCM.AsString := dsAuxiliar.FieldByName('NCM').AsString;
      cdsPedidos_Vendas_ItensCEST.AsString := dsAuxiliar.FieldByName('CEST').AsString;
      end;
      finally
      if Assigned(dsAuxiliar) then
      FreeAndNil(dsAuxiliar);
      end;

      cdsPedidos_Vendas_ItensQUANTIDADE.AsFloat := StrToFloatDef(StringReplace(ProdutoTigger.qty, '.', ',', []), 0);
      cdsPedidos_Vendas_ItensUNITARIO.AsFloat := StrToFloatDef(StringReplace(ProdutoTigger.price, '.', ',', []), 0);
      cdsPedidos_Vendas_ItensTOTAL.AsFloat :=
      (cdsPedidos_Vendas_ItensQUANTIDADE.AsFloat * cdsPedidos_Vendas_ItensUNITARIO.AsFloat);
      TSuperClass.GetInstance.Log.save
      ('[Sistema Impacto - Pedidos de vendas] Obtendo REGRASAIDA, PRIMEIRAUNIDADE, LOCAL do produto.', mtInfo);
      try
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('PRODUTOS', Empresa, Filial);
      dsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
      (Format('select * from PRODUTOS where EMPRESA = %S and FILIAL = %S and CODIGO = %s',
      [QuotedStr(Empresa), QuotedStr(Filial), QuotedStr(cdsPedidos_Vendas_ItensPRODUTO.AsString)]));
      if Assigned(dsAuxiliar) then
      if not(dsAuxiliar.State in [dsInactive]) then
      if dsAuxiliar.RecordCount > 0 then
      begin
      if dsAuxiliar.FieldByName('REGRASAIDA').AsInteger > 0 then
      cdsPedidos_Vendas_ItensREGRA.AsInteger := dsAuxiliar.FieldByName('REGRASAIDA').AsInteger
      else
      cdsPedidos_Vendas_ItensREGRA.AsInteger :=
      StrToIntDef(VarToStrDef(TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_REGRA_SITE'), '0'), 0);
      cdsPedidos_Vendas_ItensDESCRICAO.AsString := dsAuxiliar.FieldByName('DESCRICAO').AsString;
      cdsPedidos_Vendas_ItensPRIMEIRAUNIDADE.AsString := dsAuxiliar.FieldByName('PRIMEIRAUNIDADE').AsString;
      cdsPedidos_Vendas_ItensLOCAL.AsString := dsAuxiliar.FieldByName('LOCALPADRAO').AsString;
      end
      else
      TSuperClass.GetInstance.Log.save(Format('[Sistema Impacto - Pedidos de vendas] Produto não encontrado [%s].',
      [cdsPedidos_Vendas_ItensPRODUTO.AsString]), mtInfo);
      finally
      if Assigned(dsAuxiliar) then
      FreeAndNil(dsAuxiliar);
      end;
      TSuperClass.GetInstance.Log.save
      ('[Sistema Impacto - Pedidos de vendas] Obtendo configurações da regra fiscal.', mtInfo);
      try
      TSuperClass.GetInstance.DBFunctions.GetEntityOwner('REGRAS_FISCAIS', Empresa, Filial);
      dsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
      (Format('select * from REGRAS_FISCAIS where EMPRESA = %S and FILIAL = %S and CODIGO = %s',
      [QuotedStr(Empresa), QuotedStr(Filial), QuotedStr(cdsPedidos_Vendas_ItensREGRA.AsString)]));
      if Assigned(dsAuxiliar) then
      if not(dsAuxiliar.State in [dsInactive]) then
      if dsAuxiliar.RecordCount > 0 then
      begin
      cdsPedidos_Vendas_ItensCODIGOFISCAL.AsString := dsAuxiliar.FieldByName('CODIGOFISCAL').AsString;
      end;
      cdsPedidos_Vendas_ItensNUMEROOV.AsInteger := 0;
      cdsPedidos_Vendas_ItensITEMOV.AsInteger := 0;
      finally
      if Assigned(dsAuxiliar) then
      FreeAndNil(dsAuxiliar);
      end;

      cdsPedidos_Vendas_ItensSITUACAO.AsString := cdsPedidos_Vendas_DadosSITUACAO.AsString;
      cdsPedidos_Vendas_ItensTIPOPRECO.AsString := cdsPedidos_Vendas_DadosTIPOPRECO.AsString;
      cdsPedidos_Vendas_ItensDATACRIACAO.AsDateTime := now;

      cdsPedidos_Vendas_ItensVALORBRUTO.AsFloat := 0; // Alterar
      cdsPedidos_Vendas_ItensVALORLIQUIDO.AsFloat := 0; // Alterar
      cdsPedidos_Vendas_ItensVALORFINANCEIRO.AsFloat := 0;

      cdsPedidos_Vendas_ItensENTREGA.AsDateTime :=
      now + StrToIntDef(Vartostr(TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_ENTREGA_SITE')), 0);
      cdsPedidos_Vendas_ItensVALIDADELOTE.AsDateTime := now;

      cdsPedidos_Vendas_Itens.Post;

      Inc(Count);
      end;

      cdsPedidos_Vendas_DadosVALORDESCONTO.AsFloat := VendaTigger.Desconto;
      cdsPedidos_Vendas_DadosVALORFRETE.AsFloat := VendaTigger.Frete;

      cdsPedidos_Vendas_Dados.Post;

      cdsPedidos_Vendas_Dados.ApplyUpdates(-1);
      end;

      AcessoFtpTigger.MoverParaServer('pedidos');

      except
      on E: Exception do
      TSuperClass.GetInstance.Log.save(Format('[Clientes] Falha ao cadastrar o pedido %s', [E.Message]), mtError)
      end;
      finally
      if Assigned(VendasTigger) then
      FreeAndNil(VendasTigger);
      if Assigned(AcessoFtpTigger) then
      FreeAndNil(AcessoFtpTigger);
      end;
      TSuperClass.GetInstance.Log.save('[Clientes] Finalizado processo de importação de Pedidos!', mtError);
      * }

{$ENDREGION}
{$ENDREGION}
{$REGION 'Evolução PET'}
    TSuperClass.GetInstance.Config.Load(Schedule);

//Não será usado
//    if Schedule.PrimeiraExecucao then
//      ImportarClientesXLS(ExtractFilePath(Schedule.LogPath) + 'Clientes.xls');
//
//    if ((Trunc(Schedule.DataHoraInicioImportacao) < Date) and
//        (Frac(Schedule.DataHoraInicioImportacao) >= Frac(Now))) or
//       Schedule.PrimeiraExecucao then
//    begin
//      ImportarClientes();
//      ImportarProdutos();
//    end;

    ImportarPedidos();
    AtualizarEstoque();
    Schedule.PrimeiraExecucao:= False;
    Schedule.DataHoraInicioImportacao:= Date + Frac(Schedule.DataHoraInicioImportacao);
    TSuperClass.GetInstance.Config.Save(Schedule);
    tmrMain.Enabled := True;
{$ENDREGION}
  end;
end;

function TsrvMobile.FindCliente(Cliente: TCliente; const psEmpresa, psFilial: string): Boolean;
var
  ldsAuxiliar: TDataSet;
  lsCNPJCPF: string;
begin
  lsCNPJCPF:= 'CPF';
  if Cliente.Pessoa = 'PJ' then
    lsCNPJCPF:= 'CNPJ';

  try
    ldsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
      (format('SELECT CODIGO FROM CLIENTES WHERE EMPRESA = %s and FILIAL = %s and TRIM( %s ) = %s',
        [QuotedStr(psEmpresa), QuotedStr(psFilial), lsCNPJCPF, QuotedStr( Trim( Cliente.CnpjCpf ) )]));

    result:= Assigned(ldsAuxiliar) and (not ldsAuxiliar.IsEmpty);
  finally
    FreeAndNil( ldsAuxiliar );
  end;
end;

function TsrvMobile.FindCliente(const CPF_CNPJ, psEmpresa, psFilial: string): TCliente;
var
  ldsAuxiliar: TDataSet;
begin
  result:= TCliente.Create;
  try
    ldsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
      (format('SELECT CODIGO, CASE WHEN pessoa = ''1'' THEN ''PJ'' ELSE ''PF'' END PESSOA FROM CLIENTES WHERE EMPRESA = %s AND FILIAL = %s AND ((CPF = %s) OR (CNPJ = %s))',
        [QuotedStr(psEmpresa), QuotedStr(psFilial), QuotedStr( CPF_CNPJ ), QuotedStr( CPF_CNPJ )]));

    if Assigned(ldsAuxiliar) and (not ldsAuxiliar.IsEmpty) then
      begin
        result.Codigo:= ldsAuxiliar.Fields[0].AsInteger;
        result.Pessoa:= ldsAuxiliar.Fields[1].AsString;
      end
    else
      FreeAndNil( result );
  finally
    FreeAndNil( ldsAuxiliar );
  end;
end;

procedure TsrvMobile.ImportarClientesXLS(FileName: string);
var
  i:Integer;
  loSolicitarClientesXLS: TSolicitarClientesXLS;
  loListaDeClientes: TObjectList<TCliente>;
  loCliente: TCliente;
  lsEmpresa: string;
  lsFilial: string;
begin
  if not FileExists(FileName) then
  begin
    TSuperClass.GetInstance.Log.save(Format('[Clientes] Arquivo: %s, não existe.', [FileName]), mtError);
    Exit;
  end;

  TSuperClass.GetInstance.Log.save('[Clientes] Iniciada a importação clientes em: '+ FormatDateTime('dd/mm/yyyy hh:mm:ss:zzz', Now), mtInfo);
  TSuperClass.GetInstance.DBFunctions.GetEntityOwner('CLIENTES', lsEmpresa, lsFilial);

  loSolicitarClientesXLS:= TSolicitarClientesXLS.Create;
  try
    cdsClientes.Close;
    cdsClientes.PacketRecords:= 0;
    cdsClientes.Open;
    try
      loSolicitarClientesXLS.FileName:= FileName;
      loListaDeClientes:= loSolicitarClientesXLS.ListaDeClientes;
    except on e: exception do
      begin
        tmrMain.Enabled:= True;
        TSuperClass.GetInstance.log.Save('[Clientes] Houve um erro no carregamento dos clientes. Motivo: ' + e.Message, mtInfo);
      end;
    end;

    for i := 0 to loListaDeClientes.Count -1 do
    begin
      TSuperClass.GetInstance.log.Save(format('[Clientes] Contador de clientes [%d, %d]', [I + 1, loListaDeClientes.Count]), mtInfo);
      loCliente:= (loListaDeClientes.Items[i] as TCliente);
      if not FindCliente(loCliente, lsEmpresa, lsFilial) and (Trim(loCliente.CnpjCpf) <> '') then
        begin
          try
            cdsClientes.Append;
            cdsClientesEMPRESA.AsString:= lsEmpresa;
            cdsClientesFILIAL.AsString:= lsFilial;
            cdsClientesCODIGO.AsInteger:= 99999;

            if Trim(loCliente.NomeReduzido) = EmptyStr then
              cdsClientesREDUZIDO.AsString:= loCliente.Nome
            else
              cdsClientesREDUZIDO.AsString:= loCliente.NomeReduzido;

            cdsClientesNOME.AsString:= loCliente.Nome;
            cdsClientesDATACADASTRO.AsDateTime:= Date;
            cdsClientesEMAIL.AsString:= loCliente.Email;
            if loCliente.DataNascimento > 0  then
              cdsClientesDATANASCIMENTO.AsDateTime:= loCliente.DataNascimento;
            cdsClientesHOMEPAGE.AsString:= loCliente.Homepage;
            cdsClientesSTATUS.AsString:= loCliente.StatusCliente;
            cdsClientesPESSOA.Asstring := TSuperClass.GetInstance.GenericsF.IfThen
              (loCliente.pessoa = 'PJ', '1', '0');

            if loCliente.pessoa = 'PJ' then
              cdsClientesCNPJ.AsString:= loCliente.CnpjCpf
            else
              cdsClientesCPF.AsString:= loCliente.CnpjCpf;

            cdsClientesTIPOPRECO.Asstring := '01';
            cdsClientesIE.AsString:= loCliente.RgIe;
            if StrTointDef(loCliente.Fornecedor, 0) > 0 then
              cdsClientesFORNECEDOR.AsInteger:= StrTointDef(loCliente.Fornecedor, 0);

            cdsClientesCPAIS.AsString:= loCliente.CodPais;
            cdsClientesNPAIS.AsString:= loCliente.NomePais;
            cdsClientesUF.AsString:= loCliente.Uf;
            cdsClientesENDERECO.AsString:= loCliente.Endereco;
            cdsClientesBAIRRO.AsString:= loCliente.Bairro;
            cdsClientesCEP.AsString:= loCliente.Cep;
            cdsClientesMUNICIPIO.AsString:= loCliente.Municipio;
            cdsClientesDDD.AsString:= loCliente.DDD;
            cdsClientesTELEFONE.AsString:= loCliente.Telefone;
            cdsClientesCELULAR.AsString:= loCliente.Celular;
            cdsClientesNUMERO.AsString:= loCliente.Numero;
            cdsClientesCOMPLEMENTO.AsString:= loCliente.Complemento;
            cdsClientesCONTATO.AsString:= loCliente.Contato;
            cdsClientesDATACRIACAO.AsDateTime:= Date;
            cdsClientes.Post;

            if cdsClientes.ApplyUpdates(-1) <= 0 then
              TSuperClass.GetInstance.log.Save(Format('[Clientes] Cliente [%s] importado com sucesso!', [loCliente.CnpjCpf]), mtInfo);
          except on E: Exception do
            begin
              tmrMain.Enabled:= True;
              TSuperClass.GetInstance.log.Save(Format('[Clientes] Houve um erro na inserção do cliente [%s]. Motivo: ', [loCliente.CnpjCpf])+ e.Message, mtError);
            end;
          end;
        end
      else
        if loCliente.CnpjCpf = EmptyStr then
          TSuperClass.GetInstance.log.Save('[Clientes] Cliente CNPJ OU CPF não preenchido!', mtError)
        else
          TSuperClass.GetInstance.log.Save(Format('[Clientes] Cliente [%s] já existe!', [loCliente.CnpjCpf]), mtInfo)
    end;
  finally
    FreeAndNil( loSolicitarClientesXLS );
    TSuperClass.GetInstance.Log.save('[Clientes] Finalizada a importação de clientes em: '+ FormatDateTime('dd/mm/yyyy hh:mm:ss:zzz', Now), mtInfo);
  end;
end;

procedure TsrvMobile.ImportarClientes(const Codigo: Integer = 0);
var
  i:Integer;
  loSolicitarClientes: TSolicitarClientes;
  loListaDeClientes: TObjectList<TCliente>;
  loCliente: TCliente;
  lsEmpresa: string;
  lsFilial: string;
begin
  TSuperClass.GetInstance.Log.save('[Clientes] Iniciada a importação clientes em: '+ FormatDateTime('dd/mm/yyyy hh:mm:ss:zzz', Now), mtInfo);
  TSuperClass.GetInstance.DBFunctions.GetEntityOwner('CLIENTES', lsEmpresa, lsFilial);

  loSolicitarClientes:= TSolicitarClientes.Create;
  try
    cdsClientes.Close;
    cdsClientes.PacketRecords:= 0;
    cdsClientes.Open;
    try
      loSolicitarClientes.UltimoClienteImportado:= 0;
      loSolicitarClientes.Codigo:= Codigo;
//      if not Schedule.PrimeiraExecucao then
//        loSolicitarClientes.UltimoClienteImportado:= UltimoCliente(lsEmpresa, lsFilial);

      loListaDeClientes:= loSolicitarClientes.ListaDeClientes;
      for i := 0 to loListaDeClientes.Count -1 do
      begin
        TSuperClass.GetInstance.log.Save(format('[Clientes] Contador de clientes [%d, %d]', [I + 1, loListaDeClientes.Count]), mtInfo);
        loCliente:= loListaDeClientes.Items[i] as TCliente;
        if not FindCliente(loCliente, lsEmpresa, lsFilial) and (Trim(loCliente.CnpjCpf) <> EmptyStr) then
          begin
            try
              cdsClientes.Append;
              cdsClientesEMPRESA.AsString:= lsEmpresa;
              cdsClientesFILIAL.AsString:= lsFilial;
              cdsClientesCODIGO.AsInteger:= 9999;
              cdsClientesREDUZIDO.AsString:= AnsiUpperCase( AnsiString(Trim(loCliente.NomeReduzido )));
              cdsClientesNOME.AsString:= UpperCase( AnsiString(Trim( loCliente.Nome )));
              cdsClientesDATACADASTRO.AsDateTime:= Date;
              cdsClientesEMAIL.AsString:= loCliente.Email;
              if loCliente.DataNascimento > 0  then
                cdsClientesDATANASCIMENTO.AsDateTime:= loCliente.DataNascimento;
              cdsClientesHOMEPAGE.AsString:= loCliente.Homepage;
              cdsClientesSTATUS.AsString:= loCliente.StatusCliente;
              cdsClientesPESSOA.Asstring := TSuperClass.GetInstance.GenericsF.IfThen
                (loCliente.pessoa = 'PJ', '1', '0');

              if loCliente.pessoa = 'PJ' then
                cdsClientesCNPJ.AsString:= loCliente.CnpjCpf
              else
                cdsClientesCPF.AsString:= loCliente.CnpjCpf;

              cdsClientesTIPOPRECO.Asstring := '01';
              cdsClientesIE.AsString:= loCliente.RgIe;
              if StrTointDef(loCliente.Fornecedor, 0) > 0 then
                cdsClientesFORNECEDOR.AsInteger:= StrTointDef(loCliente.Fornecedor, 0);

              cdsClientesCPAIS.AsString:= loCliente.CodPais;
              cdsClientesNPAIS.AsString:= loCliente.NomePais;
              cdsClientesUF.AsString:= loCliente.Uf;
              cdsClientesENDERECO.AsString:= loCliente.Endereco;
              cdsClientesBAIRRO.AsString:= loCliente.Bairro;
              cdsClientesCEP.AsString:= loCliente.Cep;
              cdsClientesMUNICIPIO.AsString:= loCliente.Municipio;
              cdsClientesDDD.AsString:= loCliente.DDD;
              cdsClientesDDI.AsString:= loCliente.DDI;
              cdsClientesTELEFONE.AsString:= loCliente.Telefone;
              cdsClientesCELULAR.AsString:= loCliente.Celular;
              //cdsClientesNUMERO.AsString:= IntToStr( loCliente.Codigo );
              cdsClientesNUMERO.AsString:= loCliente.Numero;
              cdsClientesCOMPLEMENTO.AsString:= loCliente.Complemento;
              cdsClientesDATACRIACAO.AsDateTime:= Date;
              cdsClientes.Post;

              if cdsClientes.ApplyUpdates(-1) <= 0 then
                TSuperClass.GetInstance.log.Save(Format('[Clientes] Cliente [%s] importado com sucesso!', [loCliente.CnpjCpf]), mtInfo);
            except on E: Exception do
              begin
                cdsClientes.Cancel;
                TSuperClass.GetInstance.log.Save(Format('[Clientes] Houve um erro na inserção do cliente [%s]. Motivo: ', [loCliente.CnpjCpf])+ e.Message, mtError);
              end;
            end;
          end
        else
          if (Trim(loCliente.CnpjCpf) = EmptyStr) then
            TSuperClass.GetInstance.log.Save('[Clientes] CNPJ OU CPF não preenchido!', mtError)
          else
            TSuperClass.GetInstance.log.Save(Format('[Clientes] Cliente [%s] já existe!', [loCliente.CnpjCpf]), mtInfo);
      end;
    except on e: exception do
      begin
        tmrMain.Enabled:= True;
        TSuperClass.GetInstance.log.Save('[Clientes] Houve um erro no carregamento dos clientes. Motivo: ' + e.Message, mtError);
      end;
    end;
  finally
    FreeAndNil( loSolicitarClientes );
    TSuperClass.GetInstance.Log.save('[Clientes] Finalizada a importação de clientes em: '+ FormatDateTime('dd/mm/yyyy hh:mm:ss:zzz', Now), mtInfo);
  end;
end;

function TsrvMobile.FindProduto(Produto: TProduto; const psEmpresa, psFilial: string): Boolean;
var
  ldsAuxiliar: TDataSet;
begin
  try
    ldsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
      (format('SELECT 1 FROM PRODUTOS WHERE EMPRESA = %s and FILIAL = %s and CODIGO = %s',
        [QuotedStr(psEmpresa), QuotedStr(psFilial), QuotedStr( Produto.Codigo )]));

    Result:= Assigned(ldsAuxiliar) and (not ldsAuxiliar.IsEmpty);
  finally
    FreeAndNil(ldsAuxiliar);
  end;
end;

function TsrvMobile.FindPedido(Pedido: TPedido; const psEmpresa, psFilial: string): Boolean;
var
  ldsAuxiliar: TDataSet;
begin
  try
    ldsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
      (format('SELECT 1 FROM PEDIDOS_VENDAS_DADOS WHERE EMPRESA = %s and FILIAL = %s and NUMEROINTERNO = %s',
        [QuotedStr(psEmpresa), QuotedStr(psFilial), QuotedStr( IntTostr(Pedido.Codigo) )]));

    Result:= Assigned(ldsAuxiliar) and (not ldsAuxiliar.IsEmpty);
  finally
    FreeAndNil(ldsAuxiliar);
  end;
end;

function TsrvMobile.UltimoProduto(const psEmpresa, psFilial: string): Integer;
var
  ldsAuxiliar: TDataSet;
  lsCNPJCPF: string;
begin
  Result:= 0;
  try
    ldsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
      (format('SELECT FIRST 1 INTERNO FROM PRODUTOS WHERE EMPRESA = %s and FILIAL = %s ORDER BY INTERNO DESC',
        [QuotedStr(psEmpresa), QuotedStr(psFilial)]));

    if  Assigned(ldsAuxiliar) and (not ldsAuxiliar.IsEmpty) then
      Result:= StrTointDef(ldsAuxiliar.FieldByName('INTERNO').AsString, 0);
  finally
    FreeAndNil(ldsAuxiliar);
  end;
end;

function TsrvMobile.UltimoCliente(const psEmpresa, psFilial: string): Integer;
var
  ldsAuxiliar: TDataSet;
  lsCNPJCPF: string;
begin
  Result:= 0;
  try
    ldsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
      (format('SELECT MAX( NUMERO ) CODIGO FROM CLIENTES WHERE EMPRESA = %s and FILIAL = %s',
        [QuotedStr(psEmpresa), QuotedStr(psFilial)]));

    if  Assigned(ldsAuxiliar) and (not ldsAuxiliar.IsEmpty) then
      Result:= StrToIntDef( ldsAuxiliar.FieldByName('CODIGO').AsString, 0);
  finally
    FreeAndNil(ldsAuxiliar);
  end;
end;

function TsrvMobile.UltimoPedido(const psEmpresa, psFilial: string): Integer;
var
  ldsAuxiliar: TDataSet;
begin
  Result:= 1;
  try
    ldsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
      (format('SELECT MAX( NUMERO ) NUMERO FROM PEDIDOS_VENDAS_DADOS WHERE EMPRESA = %s and FILIAL = %s',
        [QuotedStr(psEmpresa), QuotedStr(psFilial)]));

    if  Assigned(ldsAuxiliar) and (not ldsAuxiliar.IsEmpty) then
      Result:= ldsAuxiliar.FieldByName('NUMERO').AsInteger + 1;
  finally
    FreeAndNil(ldsAuxiliar);
  end;
end;

procedure TsrvMobile.ImportarProdutos(const Codigo: string = '');
var
  i:Integer;
  loSolicitarProdutos: TSolicitarProdutos;
  loListaDeProdutos: TObjectList<TProduto>;
  ldsAuxiliar: TDataSet;
  loProduto: TProduto;
  lsEmpresa: string;
  lsFilial: string;
  lsVariavel: string;
begin
  TSuperClass.GetInstance.DBFunctions.GetEntityOwner('PRODUTOS', lsEmpresa, lsFilial);

  TSuperClass.GetInstance.Log.save('[Produtos] Iniciada a importação dos produtos em: '+ FormatDateTime('dd/mm/yyyy hh:mm:ss:zzz', Now), mtInfo);

  loSolicitarProdutos:= TSolicitarProdutos.Create;
  try
    cdsProdutos_Cadastro.Close;
    cdsProdutos_Cadastro.PacketRecords:= 0;
    cdsProdutos_Cadastro.Open;

    try
      loSolicitarProdutos.Produto:= Codigo;
      loSolicitarProdutos.UltimoProdutoImportado:= 0;
      if not Schedule.PrimeiraExecucao then
        loSolicitarProdutos.UltimoProdutoImportado:= UltimoProduto(lsEmpresa, lsFilial);

      loListaDeProdutos:= loSolicitarProdutos.ListaDeProdutos;

      for i := 0 to loListaDeProdutos.Count -1 do
      begin
        TSuperClass.GetInstance.log.Save(format('[Produtos] Contador de produtos [%d, %d]', [I + 1, loListaDeProdutos.Count]), mtInfo);
        loProduto:= loListaDeProdutos.Items[i] as TProduto;

        if not FindProduto(loProduto, lsEmpresa, lsFilial) then
          begin
            try
              cdsProdutos_Cadastro.Append;
              cdsProdutos_CadastroEMPRESA.AsString:= lsEmpresa;
              cdsProdutos_CadastroFILIAL.AsString:= lsFilial;
              cdsProdutos_CadastroSTATUS.AsString:= loProduto.Status;
              cdsProdutos_CadastroCODIGO.AsString := loProduto.Codigo;
              cdsProdutos_CadastroINTERNO.AsString:= loProduto.Codigosite;
              cdsProdutos_CadastroDATACADASTRO.AsDateTime:= Date;
              cdsProdutos_CadastroREDUZIDO.AsString:= AnsiUppercase(AnsiString(Trim(loProduto.Nome)));
              //cdsProdutos_CadastroDESCRICAO.AsString:= AnsiString(Trim(loProduto.Descricao));
              cdsProdutos_CadastroDESCRICAO.AsString:= AnsiUppercase(AnsiString(Trim(loProduto.Nome)));
              cdsProdutos_CadastroGRUPO.AsInteger:= loProduto.CodGrupo;
              cdsProdutos_CadastroNOMEGRUPO.AsString:= loProduto.Grupo;
              cdsProdutos_CadastroFABRICANTE.AsString:= loProduto.Fabricante;
              cdsProdutos_CadastroCODIGOBARRAS.AsString:= loProduto.CodigoBarrasEAN;
              cdsProdutos_CadastroQUANTIDADEBASE.AsFloat:= loProduto.QuantidadeBase;
              cdsProdutos_CadastroESTOQUEMINIMO.AsFloat:= loProduto.EstoqueMinimo;
              cdsProdutos_CadastroPRECOCUSTO1.AsFloat:= loProduto.PrecoCusto1;
              cdsProdutos_CadastroPRECOVENDA1.AsFloat:= loProduto.PrecoVenda1;
              cdsProdutos_CadastroPRIMEIRAUNIDADE.AsString:= loProduto.PrimeiraUnidade;
              cdsProdutos_CadastroOBSERVACAO.AsString:= loProduto.Observacao;
              cdsProdutos_CadastroTIPO.AsString:= VarToStrDef( TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_TIPO_PADRAO_IMPORTACAO'), 'PA');
              cdsProdutos_CadastroLOCALPADRAO.AsString:= VarToStrDef( TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_LOCAL_PADRAO_IMPORTACAO'), '01');
              cdsProdutos_CadastroPRIMEIRAUNIDADE.AsString:= VarToStrDef( TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_PRIMEIRA_UNIDADE_IMPORTACAO'), 'PC');
              cdsProdutos_CadastroCUSTOPADRAO.AsFloat:= loProduto.VlrUnitario;
              cdsProdutos_CadastroDATACRIACAO.AsDateTime:= Date;
              cdsProdutos_CadastroNCM.AsString:= loProduto.NCM;
              cdsProdutos_CadastroIDESTOQUE.AsInteger:= loProduto.CodigoEstoque;
              cdsProdutos_Cadastro.Post;

              if cdsProdutos_Cadastro.ApplyUpdates(-1) <= 0 then
                TSuperClass.GetInstance.log.Save(Format('[Produtos] Produto [%s] importado com sucesso!', [loProduto.Codigo]), mtInfo);

            except on E: Exception do
              begin
                cdsProdutos_Cadastro.Cancel;
                TSuperClass.GetInstance.log.Save(Format('[Produtos] Houve um erro na inserção do produto [%s]. Motivo: ', [loProduto.Codigo])+ e.Message, mtInfo);
              end;
            end;
          end
        else
          TSuperClass.GetInstance.log.Save(Format('[Produtos] Produto [%s] já existe!', [loProduto.Codigo]), mtInfo);
      end;
    except on e: exception do
      begin
        tmrMain.Enabled:= True;
        TSuperClass.GetInstance.log.Save('[Produtos] Houve um erro no carregamento dos Produtos. Motivo: ' + e.Message, mtInfo);
      end;
    end;
  finally
    FreeAndNil( loSolicitarProdutos );
    TSuperClass.GetInstance.Log.save('[Produtos] Finalizada a importação dos produtos em: '+ FormatDateTime('dd/mm/yyyy hh:mm:ss:zzz', Now), mtInfo);
  end;
end;

procedure TsrvMobile.ImportarPedidos();
var
  i, j:Integer;
  loSolicitarPedidos: TSolicitarPedidos;
  loListaDePedidos: TObjectList<TPedido>;
  loPedido: TPedido;
  loItems: TProduto;
  ldsAuxiliar: TDataSet;
  lsEmpresa: string;
  lsFilial: string;
  lsEmpresa_Produto: string;
  lsFilial_Produto: string;
  lsEmpresa_RF: string;
  lsFilial_RF: string;
  lsEmpresa_Clientes: string;
  lsFilial_Clientes: string;
  ldDesconto: Double;
  liCodigoCliente: Integer;
  lsStatusImportar: string;
  loCliente: TCliente;
begin
  TSuperClass.GetInstance.Log.save('[Pedidos] Iniciada a importação dos pedidos em: '+ FormatDateTime('dd/mm/yyyy hh:mm:ss:zzz', Now), mtInfo);
  TSuperClass.GetInstance.DBFunctions.GetEntityOwner('PEDIDOS_VENDAS_DADOS', lsEmpresa, lsFilial);
  TSuperClass.GetInstance.DBFunctions.GetEntityOwner('PRODUTOS', lsEmpresa_Produto, lsFilial_Produto);
  TSuperClass.GetInstance.DBFunctions.GetEntityOwner('CLIENTES', lsEmpresa_Clientes, lsFilial_Clientes);

  loSolicitarPedidos:= TSolicitarPedidos.Create;
  try
    try
      loListaDePedidos:= loSolicitarPedidos.ListaDePedidos;

      for i := 0 to loListaDePedidos.Count -1 do
      begin
        try
          loPedido:= loListaDePedidos.Items[i] as TPedido;

          //Rotina feita para importar somente pedidos confirmados
          lsStatusImportar:= VarToStrDef( TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_STATUS_PEDIDO_SITE'), '0');
          lsStatusImportar:= ClearString(lsStatusImportar, ' ');
          if Pos(loPedido.Status + ',', lsStatusImportar) = 0 then
            Continue;

          if FindPedido(loPedido, lsEmpresa, lsFilial) then
          begin
            TSuperClass.GetInstance.log.Save(Format('[Pedidos] Pedido [%d] já existe!', [loPedido.Codigo]), mtInfo);
            Continue;
          end;

          TSuperClass.GetInstance.log.Save(format('[Pedidos] Contador de pedidos [%d, %d]', [I + 1, loListaDePedidos.Count]), mtInfo);
          cdsPedidos_Vendas_Dados.Close;
          cdsPedidos_Vendas_Dados.PacketRecords:= 0;
          cdsPedidos_Vendas_Dados.Open;
          cdsPedidos_Vendas_Dados.Insert;
          cdsPedidos_Vendas_DadosUF.AsString:= loPedido.Uf;

          //Tem que ser primeiro cliente entrega
          loCliente:= FindCliente( loPedido.CPF_CNPJ_ClienteEntrega, lsEmpresa_Clientes, lsFilial_Clientes );
          if not Assigned( loCliente ) then
            begin
              ImportarClientes(loPedido.ClienteEntrega);
              loCliente:= FindCliente( loPedido.CPF_CNPJ_ClienteEntrega, lsEmpresa_Clientes, lsFilial_Clientes );

              if Assigned( loCliente ) then
                cdsPedidos_Vendas_DadosCLIENTEENTREGA.AsInteger:= loCliente.Codigo;
            end
          else
            cdsPedidos_Vendas_DadosCLIENTEENTREGA.AsInteger:= loCliente.Codigo;

          loCliente:= FindCliente( loPedido.CPF_CNPJ_Cliente, lsEmpresa_Clientes, lsFilial_Clientes );
          if not Assigned( loCliente ) then
            begin
              ImportarClientes(loPedido.Cliente);
              loCliente:= FindCliente( loPedido.CPF_CNPJ_Cliente, lsEmpresa_Clientes, lsFilial_Clientes );
              if Assigned( loCliente ) then
                cdsPedidos_Vendas_DadosCLIENTE.AsInteger:= loCliente.Codigo;
            end
          else
            cdsPedidos_Vendas_DadosCLIENTE.AsInteger:= loCliente.Codigo;


          cdsPedidos_Vendas_DadosMOEDA.AsString:= loPedido.Moeda;
          cdsPedidos_Vendas_DadosTRANSPORTADORA.AsInteger:= loPedido.Transportadora;
          cdsPedidos_Vendas_DadosNUMEROINTERNO.AsString:= IntToStr( loPedido.codigo );
          cdsPedidos_Vendas_DadosVENDEDOR.AsInteger:= StrToIntDef( VarToStrDef(
            TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_VENDEDOR_PEDIDO_SITE'), '0'), 0);

          if AnsiPos('BCASH', AnsiUpperCase( loPedido.CondicaoPagamento )) > 0 then
            cdsPedidos_Vendas_DadosCONDICAOPAGAMENTO.AsInteger:= StrToIntDef( VarToStrDef(
              TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_CONDICAO_PEDIDO_SITE_CASH'), '0'), 0)
          else
          if AnsiPos('BOLETO', AnsiUpperCase( loPedido.CondicaoPagamento )) > 0 then
            cdsPedidos_Vendas_DadosCONDICAOPAGAMENTO.AsInteger:= StrToIntDef( VarToStrDef(
              TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_CONDICAO_PEDIDO_SITE_BOLETO'), '0'), 0)
          else
          if AnsiPos('TRANSFERÊNCIA', AnsiUpperCase( loPedido.CondicaoPagamento )) > 0 then
            cdsPedidos_Vendas_DadosCONDICAOPAGAMENTO.AsInteger:= StrToIntDef( VarToStrDef(
              TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_CONDICAO_PEDIDO_SITE_TRANS'), '0'), 0)
          else
          if AnsiPos('DEPÓSITO', AnsiUpperCase( loPedido.CondicaoPagamento )) > 0 then
            cdsPedidos_Vendas_DadosCONDICAOPAGAMENTO.AsInteger:= StrToIntDef( VarToStrDef(
              TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_CONDICAO_PEDIDO_SITE_TRANS'), '0'), 0)
          else
            cdsPedidos_Vendas_DadosCONDICAOPAGAMENTO.AsInteger:= StrToIntDef( VarToStrDef(
              TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_CONDICAO_PEDIDO_SITE'), '0'), 0);

          cdsPedidos_Vendas_DadosSTATUSENTREGA.Asstring := '0';

          ldDesconto:= 0;
          ldsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
            (format('SELECT ALIQUOTA_DESCONTO FROM CONDICOES_PAGAMENTOS WHERE CODIGO = %d',
              [cdsPedidos_Vendas_DadosCONDICAOPAGAMENTO.AsInteger]));
          try
            if Assigned(ldsAuxiliar) and not ldsAuxiliar.IsEmpty then
              ldDesconto:= ldsAuxiliar.Fields[0].AsFloat;
          finally
            if Assigned(ldsAuxiliar) then
              FreeAndNil( ldsAuxiliar );
          end;

          for j := 0 to loPedido.Items.Count -1 do
          begin
            loItems:= loPedido.Items.Items[j] as TProduto;

            cdsPedidos_Vendas_Itens.Insert;
            cdsPedidos_Vendas_ItensEMPRESA.AsString:= lsEmpresa;
            cdsPedidos_Vendas_ItensFILIAL.AsString:= lsFilial;
  //          cdsPedidos_Vendas_ItensPRODUTO.AsString:= loItems.Codigosite;
  //          cdsPedidos_Vendas_ItensPRODUTO.Asstring:= loItems.Nome;
            cdsPedidos_Vendas_ItensQUANTIDADE.AsFloat:= loItems.QuantidadeBase;
            cdsPedidos_Vendas_ItensUNITARIO.AsFloat:= loItems.VlrUnitario;
            cdsPedidos_Vendas_ItensTOTAL.AsFloat := (loItems.QuantidadeBase * loItems.VlrUnitario);
  //          cdsPedidos_Vendas_DadosVALORMERCADORIAS.AsFloat:= loPedido.ValorMercadorias;
            cdsPedidos_Vendas_ItensDESCONTO.AsFloat:= ldDesconto;
            TSuperClass.GetInstance.log.Save
            ('[Sistema Impacto - Pedidos de vendas] Obtendo REGRASAIDA, PRIMEIRAUNIDADE, LOCAL do produto.', mtInfo);
            try
              ldsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
                (format('SELECT * FROM PRODUTOS WHERE EMPRESA = %S and FILIAL = %S and INTERNO = %s',
                  [QuotedStr(lsEmpresa_Produto), QuotedStr(lsFilial_Produto), QuotedStr( loItems.Codigosite )]));

              cdsPedidos_Vendas_ItensDESCRICAO.Asstring:= ldsAuxiliar.FieldByName('DESCRICAO').AsString;
              if cdsPedidos_Vendas_ItensDESCRICAO.Asstring = EmptyStr then
                cdsPedidos_Vendas_ItensDESCRICAO.Asstring:= loItems.Nome;

              if Assigned(ldsAuxiliar) and ( not(ldsAuxiliar.state in [dsInactive]) ) then
                if ldsAuxiliar.RecordCount > 0 then
                  begin
                    cdsPedidos_Vendas_ItensPRODUTO.AsString:= ldsAuxiliar.FieldByName('CODIGO').AsString;
                    cdsPedidos_Vendas_ItensNCM.AsString:= ldsAuxiliar.FieldByName('NCM').AsString;

                    if ( UpperCase( loPedido.Uf ) <> 'SP') and
                       Assigned( loCliente ) and (loCliente.Pessoa = 'PF') then
                      begin
                        if ldsAuxiliar.FieldByName('REGRASAIDA').AsInteger > 0 then
                          cdsPedidos_Vendas_ItensREGRA.AsInteger := ldsAuxiliar.FieldByName('REGRASAIDA').AsInteger
                        else
                          cdsPedidos_Vendas_ItensREGRA.AsInteger:= StrToIntDef( VarToStrDef(TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_REGRA_SITE2'), '0'), 0);
                      end
                    else
                      begin
                        if ldsAuxiliar.FieldByName('REGRASAIDA').AsInteger > 0 then
                          cdsPedidos_Vendas_ItensREGRA.AsInteger := ldsAuxiliar.FieldByName('REGRASAIDA').AsInteger
                        else
                          cdsPedidos_Vendas_ItensREGRA.AsInteger:= StrToIntDef( VarToStrDef(TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_REGRA_SITE'), '0'), 0);
                      end;

                    cdsPedidos_Vendas_ItensDESCRICAO.Asstring := ldsAuxiliar.FieldByName('DESCRICAO').Asstring;
                    cdsPedidos_Vendas_ItensPRIMEIRAUNIDADE.Asstring :=
                    ldsAuxiliar.FieldByName('PRIMEIRAUNIDADE').Asstring;
                    cdsPedidos_Vendas_ItensLOCAL.Asstring := ldsAuxiliar.FieldByName('LOCALPADRAO').Asstring;
                  end
                else
                  begin
                    ImportarProdutos(ldsAuxiliar.FieldByName('CODIGO').AsString);
                    TSuperClass.GetInstance.log.Save(format('[Sistema Impacto - Pedidos de vendas] Produto não encontrado [%s].',
                      [cdsPedidos_Vendas_ItensPRODUTO.Asstring]), mtInfo);
                  end;
            finally
              if Assigned(ldsAuxiliar) then
                FreeAndNil(ldsAuxiliar);
            end;

            TSuperClass.GetInstance.log.Save
            ('[Sistema Impacto - Pedidos de vendas] Obtendo configurações da regra fiscal.', mtInfo);
            try
              TSuperClass.GetInstance.DBFunctions.GetEntityOwner('REGRAS_FISCAIS', lsEmpresa_RF, lsFilial_RF);
              ldsAuxiliar := TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
              (format('select * from REGRAS_FISCAIS where EMPRESA = %S and FILIAL = %S and CODIGO = %s',
              [QuotedStr(lsEmpresa_RF), QuotedStr(lsFilial_RF), QuotedStr(cdsPedidos_Vendas_ItensREGRA.Asstring)]));
              if Assigned(ldsAuxiliar) and (not(ldsAuxiliar.state in [dsInactive])) then
                if ldsAuxiliar.RecordCount > 0 then
                  cdsPedidos_Vendas_ItensCODIGOFISCAL.Asstring := ldsAuxiliar.FieldByName('CODIGOFISCAL').Asstring;

              cdsPedidos_Vendas_ItensNUMEROOV.AsInteger := 0;
              cdsPedidos_Vendas_ItensITEMOV.AsInteger := 0;
            finally
              if Assigned(ldsAuxiliar) then
                FreeAndNil(ldsAuxiliar);
            end;

            cdsPedidos_Vendas_ItensTIPOPRECO.Asstring := cdsPedidos_Vendas_DadosTIPOPRECO.Asstring;
            cdsPedidos_Vendas_ItensSITUACAO.Asstring := cdsPedidos_Vendas_DadosSITUACAO.Asstring;
            cdsPedidos_Vendas_ItensDATACRIACAO.AsDateTime := now;

            cdsPedidos_Vendas_ItensVALORBRUTO.AsFloat:= loPedido.ValorMercadorias;
            cdsPedidos_Vendas_ItensVALORLIQUIDO.AsFloat:= loPedido.ValorLiquido;
            cdsPedidos_Vendas_ItensVALORFINANCEIRO.AsFloat:= 0;
            cdsPedidos_Vendas_ItensQUANTIDADELIBERADA.AsFloat:= loItems.QuantidadeBase;

            cdsPedidos_Vendas_ItensENTREGA.AsDateTime := Now + StrToIntDef(Vartostr(TSuperClass.GetInstance.DBFunctions.GetParamValue('SV_ENTREGA_SITE')), 0);
            cdsPedidos_Vendas_ItensVALIDADELOTE.AsDateTime := Now;

            cdsPedidos_Vendas_DadosVALORFRETE.AsFloat:= loPedido.ValorFrete;
            cdsPedidos_Vendas_DadosVALORMERCADORIAS.AsFloat:= loPedido.ValorMercadorias;
            cdsPedidos_Vendas_DadosVALORDESCONTO.AsFloat:= loPedido.ValorDesconto;

            if cdsPedidos_Vendas_Itens.State in [dsInsert, dsEdit] then
              cdsPedidos_Vendas_Itens.Post;
          end;

          cdsPedidos_Vendas_Dados.Post;

          if cdsPedidos_Vendas_Dados.ApplyUpdates(-1) <= 0 then
            TSuperClass.GetInstance.log.Save(Format('[Pedidos] Pedido [%d] importado com sucesso!', [loPedido.Codigo]), mtInfo);

        except on e: exception do
          begin
            cdsPedidos_Vendas_Itens.Cancel;
            cdsPedidos_Vendas_Dados.Cancel;
            TSuperClass.GetInstance.log.Save(Format('[Pedidos] Houve um erro na inserção do pedido [%d]. Motivo: ', [loPedido.codigo]) + e.Message, mtInfo);
          end;
        end;
      end;
    except on e: exception do
      begin
        tmrMain.Enabled:= True;
        TSuperClass.GetInstance.log.Save('[Pedidos] Houve um erro no carregamento dos pedidos. Motivo: ' + e.Message, mtInfo);
      end;
    end;
  finally
    FreeAndNil( loSolicitarPedidos );
    TSuperClass.GetInstance.Log.save('[Pedidos] Finalizada a importação dos pedidos em: '+ FormatDateTime('dd/mm/yyyy hh:mm:ss:zzz', Now), mtInfo);
  end;
end;

procedure TsrvMobile.AtualizarEstoque();
var
  ldsAuxiliar: TDataSet;
  loEstoque: TEstoque;
begin
  TSuperClass.GetInstance.Log.save('[Estoque] Iniciada a exportação do estoque em: '+ FormatDateTime('dd/mm/yyyy hh:mm:ss:zzz', Now), mtInfo);
  try
    try
      ldsAuxiliar:= TSuperClass.GetInstance.DBFunctions.ExecuteQueryByXml
        ('SELECT (A.SALDO - (A.RESERVA + A.EMPENHO)) QUANTIDADE'+
         '  , B.IDESTOQUE'+
         '  , B.CODIGO '+
         '  , B.INTERNO '+
         'FROM SALDOS_ESTOQUE A '+
         'INNER JOIN PRODUTOS B ON (B.CODIGO = A.PRODUTO) '+
         'INNER JOIN (SELECT DISTINCT(PRODUTO) '+
         'FROM PEDIDOS_VENDAS_ITENS '+
         Format('WHERE DATACRIACAO BETWEEN ''%s'' AND ''%s'') C ON (C.PRODUTO = A.PRODUTO) ', [FormatDateTime('YYYY/MM/DD', Date -2), FormatDateTime('YYYY/MM/DD', Date)]));

      if Assigned(ldsAuxiliar) and not ldsAuxiliar.IsEmpty then
      begin
        ldsAuxiliar.First;
        while not ldsAuxiliar.Eof do
        begin
          TSuperClass.GetInstance.log.Save(format('[Estoque] Contador de estoque [%d, %d]', [ldsAuxiliar.RecNo, ldsAuxiliar.RecordCount]), mtInfo);
          loEstoque:= TEstoque.Create;
          try
            loEstoque.Codigo:= ldsAuxiliar.FieldByName('CODIGO').AsString;
            loEstoque.Codigosite:= ldsAuxiliar.FieldByName('INTERNO').AsString;
            loEstoque.CodigoEstoque:= ldsAuxiliar.FieldByName('IDESTOQUE').AsInteger;
            loEstoque.QuantidadeBase:= ldsAuxiliar.FieldByName('QUANTIDADE').AsFloat;
            loEstoque.AtualizarEstoque();

            TSuperClass.GetInstance.log.Save(Format('[Estoque] Estoque [%d] do produto [%s] exportado com sucesso!',
                                                   [ ldsAuxiliar.FieldByName('IDESTOQUE').AsInteger,
                                                     ldsAuxiliar.FieldByName('CODIGO').AsString ]), mtInfo);
          finally
            FreeAndNil( loEstoque );
          end;

          ldsAuxiliar.Next;
        end;
      end;
    except on e: exception do
      begin
        tmrMain.Enabled:= True;
        TSuperClass.GetInstance.log.Save('[Estoque] Houve um erro na exportação do estoque. Motivo: ' + e.Message, mtInfo);
      end;
    end;
  finally
    if Assigned(ldsAuxiliar) then
      FreeAndNil( ldsAuxiliar );
    TSuperClass.GetInstance.Log.save('[Estoque] Finalizada a exportação do estoque em: '+ FormatDateTime('dd/mm/yyyy hh:mm:ss:zzz', Now), mtInfo);
  end;
end;

end.
