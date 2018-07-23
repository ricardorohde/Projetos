{ ********************************************************************* }
{ }
{ TRS Sistemas - Runtime Library Functions }
{ }
{ Copyright(c) 2006-2012 TRS Sistemas e Soluções em Informática Ltda. }
{ }
{ Author: Thiago Rodrigo da Silva }
{ ********************************************************************* }
{ Liberação de Pedidos de Vendas }
{ }
{ ********************************************************************* }
{ Data última alteração: }
{ Últimas alterações: }
{ }
{ ********************************************************************* }

unit uLiberacao_Pedidos_Vendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Menus, ActnList, ExtCtrls, DBCtrls, ComCtrls, ToolWin,
  StdCtrls, Buttons, Grids, DBGrids, DB, DBClient, Math, uFBase_Mod1, uTypes,
  uUser_Types, uRecError, DSConnect, pngimage, PngImageList,
  PngSpeedButton;

type
  TfrmLiberacao_Pedidos_Vendas = class(TfrmFBase_Mod1)
    cdsPedidos_Vendas_Dados: TClientDataSet;
    cdsPedidos_Vendas_Itens: TClientDataSet;
    dtsPedidos_Vendas_Dados: TDataSource;
    dtsPedidos_Vendas_Itens: TDataSource;
    cdsPedidos_Vendas_DadosEMPRESA: TStringField;
    cdsPedidos_Vendas_DadosFILIAL: TStringField;
    cdsPedidos_Vendas_DadosNUMERO: TIntegerField;
    cdsPedidos_Vendas_DadosSITUACAO: TStringField;
    cdsPedidos_Vendas_DadosEMISSAO: TDateField;
    cdsPedidos_Vendas_DadosVENDEDOR: TIntegerField;
    cdsPedidos_Vendas_DadosCLIENTE: TIntegerField;
    cdsPedidos_Vendas_DadosUF: TStringField;
    cdsPedidos_Vendas_DadosTIPOENDERECO: TStringField;
    cdsPedidos_Vendas_DadosCLIENTEENTREGA: TIntegerField;
    cdsPedidos_Vendas_DadosCONDICAOPAGAMENTO: TIntegerField;
    cdsPedidos_Vendas_DadosFORMAPAGAMENTO: TStringField;
    cdsPedidos_Vendas_DadosTABELA: TIntegerField;
    cdsPedidos_Vendas_DadosMOEDA: TStringField;
    cdsPedidos_Vendas_DadosTAXA: TFloatField;
    cdsPedidos_Vendas_DadosTIPOPRECO: TStringField;
    cdsPedidos_Vendas_DadosTRANSPORTADORA: TIntegerField;
    cdsPedidos_Vendas_DadosCATEGORIA: TStringField;
    cdsPedidos_Vendas_DadosOBSERVACAO: TStringField;
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
    cdsPedidos_Vendas_DadosBASECOFINSA: TFloatField;
    cdsPedidos_Vendas_DadosVALORCOFINSA: TFloatField;
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
    cdsPedidos_Vendas_DadosDATACRIACAO: TSQLTimeStampField;
    cdsPedidos_Vendas_DadossqlPedidos_Vendas_Itens: TDataSetField;
    cdsPedidos_Vendas_ItensEMPRESA: TStringField;
    cdsPedidos_Vendas_ItensFILIAL: TStringField;
    cdsPedidos_Vendas_ItensNUMERO: TIntegerField;
    cdsPedidos_Vendas_ItensITEM: TIntegerField;
    cdsPedidos_Vendas_ItensPRODUTO: TStringField;
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
    cdsPedidos_Vendas_ItensICMS: TFloatField;
    cdsPedidos_Vendas_ItensBASEICMS: TFloatField;
    cdsPedidos_Vendas_ItensVALORICMS: TFloatField;
    cdsPedidos_Vendas_ItensBASEICMSST: TFloatField;
    cdsPedidos_Vendas_ItensVALORICMSST: TFloatField;
    cdsPedidos_Vendas_ItensISS: TFloatField;
    cdsPedidos_Vendas_ItensBASEISSA: TFloatField;
    cdsPedidos_Vendas_ItensVALORISSA: TFloatField;
    cdsPedidos_Vendas_ItensBASEISSR: TFloatField;
    cdsPedidos_Vendas_ItensVALORISSR: TFloatField;
    cdsPedidos_Vendas_ItensBASEPISA: TFloatField;
    cdsPedidos_Vendas_ItensVALORPISA: TFloatField;
    cdsPedidos_Vendas_ItensBASECOFINSA: TFloatField;
    cdsPedidos_Vendas_ItensVALORCOFINSA: TFloatField;
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
    cdsPedidos_Vendas_ItensNUMEROOV: TIntegerField;
    cdsPedidos_Vendas_ItensITEMOV: TIntegerField;
    cdsPedidos_Vendas_ItensQUANTIDADELIBERADA: TFloatField;
    cdsPedidos_Vendas_ItensPEDIDOCLIENTE: TStringField;
    cdsPedidos_Vendas_ItensDOCUMENTOORIGEM: TIntegerField;
    cdsPedidos_Vendas_ItensPREFIXOORIGEM: TStringField;
    cdsPedidos_Vendas_ItensITEMORIGEM: TIntegerField;
    cdsPedidos_Vendas_ItensFATURADO: TFloatField;
    cdsPedidos_Vendas_ItensELIMINADO: TFloatField;
    cdsPedidos_Vendas_ItensPRODUTOCLIENTE: TStringField;
    cdsPedidos_Vendas_ItensDATACRIACAO: TSQLTimeStampField;
    cdsPedidos_Vendas_ItensDESCRICAO: TStringField;
    cdsPedidos_Vendas_ItensTIPOPRECO: TStringField;
    cdsPedidos_Vendas_DadosPRIORIDADE: TIntegerField;
    cdsPedidos_Vendas_DadosSTATUS: TStringField;
    cdsPedidos_Vendas_DadosUSUARIO: TIntegerField;
    cdsPedidos_Vendas_ItensCSTIPI: TStringField;
    cdsPedidos_Vendas_ItensCSTICMS: TStringField;
    cdsPedidos_Vendas_ItensORIGEMST: TStringField;
    cdsPedidos_Vendas_ItensSITUACAO: TStringField;
    cdsPedidos_Vendas_Liberacao: TClientDataSet;
    cdsPedidos_Vendas_LiberacaoEMPRESA: TStringField;
    cdsPedidos_Vendas_LiberacaoFILIAL: TStringField;
    cdsPedidos_Vendas_LiberacaoNUMERO: TIntegerField;
    cdsPedidos_Vendas_LiberacaoITEM: TIntegerField;
    cdsPedidos_Vendas_LiberacaoSEQUENCIA: TIntegerField;
    cdsPedidos_Vendas_LiberacaoPRODUTO: TStringField;
    cdsPedidos_Vendas_LiberacaoLOCAL: TStringField;
    cdsPedidos_Vendas_LiberacaoQUANTIDADE: TFloatField;
    cdsPedidos_Vendas_LiberacaoLIBERACAO: TDateField;
    cdsPedidos_Vendas_LiberacaoUNITARIO: TFloatField;
    cdsPedidos_Vendas_LiberacaoUNITARIOMOEDA: TFloatField;
    cdsPedidos_Vendas_LiberacaoVALORDESPESAS: TFloatField;
    cdsPedidos_Vendas_LiberacaoVALORFRETE: TFloatField;
    cdsPedidos_Vendas_LiberacaoVALORSEGURO: TFloatField;
    cdsPedidos_Vendas_LiberacaoVOLUMES: TFloatField;
    cdsPedidos_Vendas_LiberacaoPESOLIQUIDO: TFloatField;
    cdsPedidos_Vendas_LiberacaoPESOBRUTO: TFloatField;
    cdsPedidos_Vendas_LiberacaoNOTA: TIntegerField;
    cdsPedidos_Vendas_LiberacaoPREFIXO: TStringField;
    cdsPedidos_Vendas_LiberacaoSITUACAO: TStringField;
    cdsPedidos_Vendas_LiberacaoSELECIONADO: TStringField;
    cdsPedidos_Vendas_LiberacaoDATACRIACAO: TSQLTimeStampField;
    cdsPedidos_Vendas_LiberacaoSEPARADO: TStringField;
    cdsPedidos_Vendas_LiberacaoCONFERIDO: TStringField;
    dtsPedidos_Vendas_Liberacao: TDataSource;
    cdsPedidos_Vendas_ItensUNITARIOPL: TFloatField;
    cdsPedidos_Vendas_ItensUNITARIOPB: TFloatField;
    cdsPesquisaOV: TClientDataSet;
    cdsPedidos_Vendas_DadosESPECIEDOCUMENTO: TStringField;
    cdsPedidos_Vendas_DadosUFEMBARQUE: TStringField;
    cdsPedidos_Vendas_DadosLOCALEMBARQUE: TStringField;
    cdsPedidos_Vendas_DadosIDNFEREF: TStringField;
    cdsPedidos_Vendas_DadosIDSFA: TStringField;
    cdsPedidos_Vendas_DadosIMPRESSO: TStringField;
    cdsPedidos_Vendas_DadossqlPedidos_Vendas_Historicos: TDataSetField;
    dspcPedidos_Vendas_Dados: TDSProviderConnection;
    cdsPedidos_Vendas_DadosCOLETA: TStringField;
    cdsPedidos_Vendas_DadosDATACOLETA: TDateField;
    cdsPedidos_Vendas_DadosHORACOLETA: TTimeField;
    cdsPedidos_Vendas_DadosSTATUSCOLETA: TStringField;
    cdsPedidos_Vendas_ItensLOTE: TStringField;
    cdsPedidos_Vendas_ItensVALIDADELOTE: TDateField;
    dscpPedidos_Vendas_Liberacao: TDSProviderConnection;
    dspcPesquisaOV: TDSProviderConnection;
    cdsPedidos_Vendas_ItensPISA: TFloatField;
    cdsPedidos_Vendas_ItensPISR: TFloatField;
    cdsPedidos_Vendas_ItensBASEPISR: TFloatField;
    cdsPedidos_Vendas_ItensVALORPISR: TFloatField;
    cdsPedidos_Vendas_ItensCOFINSA: TFloatField;
    cdsPedidos_Vendas_ItensCOFINSR: TFloatField;
    cdsPedidos_Vendas_ItensBASECOFINSR: TFloatField;
    cdsPedidos_Vendas_ItensVALORCOFINSR: TFloatField;
    cdsPedidos_Vendas_ItensCSLLR: TFloatField;
    cdsPedidos_Vendas_ItensBASECSLLR: TFloatField;
    cdsPedidos_Vendas_ItensVALORCSLLR: TFloatField;
    cdsPedidos_Vendas_ItensITEMPEDIDOCLIENTE: TIntegerField;
    cdsPedidos_Vendas_ItensVALORTRIBUTOS: TFloatField;
    cdsPedidos_Vendas_ItensTRIBUTOS: TFloatField;
    cdsPedidos_Vendas_DadosBASEPISR: TFloatField;
    cdsPedidos_Vendas_DadosVALORPISR: TFloatField;
    cdsPedidos_Vendas_DadosBASECOFINSR: TFloatField;
    cdsPedidos_Vendas_DadosVALORCOFINSR: TFloatField;
    cdsPedidos_Vendas_DadosBASECSLLR: TFloatField;
    cdsPedidos_Vendas_DadosVALORCSLLR: TFloatField;
    cdsPedidos_Vendas_DadosBASETRIBUTOS: TFloatField;
    cdsPedidos_Vendas_DadosVALORTRIBUTOS: TFloatField;
    cdsPedidos_Vendas_ItensBASETRIBUTOS: TFloatField;
    cdsPedidos_Vendas_DadosNOMECLIENTE: TStringField;
    cdsPedidos_Vendas_DadosCRITERIO: TStringField;
    cdsPedidos_Vendas_LiberacaoINCLUIDO: TStringField;
    cdsPedidos_Vendas_LiberacaoALTERADO: TStringField;
    cdsPedidos_Vendas_DadosNOMEVENDEDOR: TStringField;
    cdsPedidos_Vendas_DadosBASEICMSDIF: TFloatField;
    cdsPedidos_Vendas_DadosVALORICMSDIF: TFloatField;
    cdsPedidos_Vendas_DadosNOMELOCALEMBARQUE: TStringField;
    cdsPedidos_Vendas_DadosINCLUIDO: TStringField;
    cdsPedidos_Vendas_DadosALTERADO: TStringField;
    cdsPedidos_Vendas_DadossqlPedidos_Vendas_Referenciadas: TDataSetField;
    cdsPedidos_Vendas_ItensICMSDIF: TFloatField;
    cdsPedidos_Vendas_ItensBASEICMSDIF: TFloatField;
    cdsPedidos_Vendas_ItensVALORICMSDIF: TFloatField;
    cdsPedidos_Vendas_ItensADICIONAIS: TStringField;
    cdsPedidos_Vendas_ItensINCLUIDO: TStringField;
    cdsPedidos_Vendas_ItensALTERADO: TStringField;
    cdsPedidos_Vendas_DadosBASEICMSFCP: TFloatField;
    cdsPedidos_Vendas_DadosVALORICMSFCP: TFloatField;
    cdsPedidos_Vendas_DadosBASEICMSPUFD: TFloatField;
    cdsPedidos_Vendas_DadosVALORICMSPUFD: TFloatField;
    cdsPedidos_Vendas_DadosBASEICMSPUFO: TFloatField;
    cdsPedidos_Vendas_DadosVALORICMSPUFO: TFloatField;
    cdsPedidos_Vendas_ItensNCM: TStringField;
    cdsPedidos_Vendas_ItensCEST: TStringField;
    cdsPedidos_Vendas_ItensCSOSNICMS: TStringField;
    cdsPedidos_Vendas_ItensSALDODEVOLVER: TFloatField;
    cdsPedidos_Vendas_ItensBASEICMSFCP: TFloatField;
    cdsPedidos_Vendas_ItensVALORICMSFCP: TFloatField;
    cdsPedidos_Vendas_ItensBASEICMSPUFD: TFloatField;
    cdsPedidos_Vendas_ItensVALORICMSPUFD: TFloatField;
    cdsPedidos_Vendas_ItensBASEICMSPUFO: TFloatField;
    cdsPedidos_Vendas_ItensVALORICMSPUFO: TFloatField;
    cdsPedidos_Vendas_ItensOP: TIntegerField;
    cdsPedidos_Vendas_ItensITEMOP: TIntegerField;
    cdsPedidos_Vendas_LiberacaoLOTE: TStringField;
    cdsPedidos_Vendas_LiberacaoVALIDADELOTE: TDateField;
    cdsPedidos_Vendas_LiberacaosqlPV_Liberacao_Lotes: TDataSetField;
    cdsPedidos_Vendas_ItensESTOQUEATUAL: TFloatField;
    procedure cdsPedidos_Vendas_ItensQUANTIDADELIBERADAValidate(Sender: TField);
    procedure dbGridDblClick(Sender: TObject);
    procedure cdsPedidos_Vendas_DadosBeforeApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure cdsPedidos_Vendas_DadosReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure FormCreate(Sender: TObject);
    procedure cdsPedidos_Vendas_DadosBeforeDelete(DataSet: TDataSet);
    procedure cdsPedidos_Vendas_ItensBeforeDelete(DataSet: TDataSet);
    procedure cdsPedidos_Vendas_ItensBeforeInsert(DataSet: TDataSet);
    procedure dbGridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cdsPedidos_Vendas_DadosBeforeOpen(DataSet: TDataSet);
  protected
    EstoqueNegativo: Boolean;
    ControlePreco: Boolean;
    ControleCredito: Boolean;
    ControleEstoque: Boolean;
    ControleSeparacao: Boolean;
    ControleExpedicao: Boolean;
    ForcaBloqueioCredito: Boolean;
    HabilitaExpedicaoLiberacao: Boolean;
    Pedido: Integer;
    ValorMercadorias: Currency;
    ExibeDivergenciaNaLiberacao: Boolean;
    function EstoqueSuficiente: Boolean;
    function LiberaExpedicao: Boolean;
    function LiberacaoMultipla: Boolean;
    function SelecionaNumeroOV(Pedido: Integer): Integer;
    function GeraEstoque: Boolean;
  public
  end;

var
  frmLiberacao_Pedidos_Vendas: TfrmLiberacao_Pedidos_Vendas;

implementation

uses uDMMain, uInforma_Liberacao_Itens, uInforma_Expedicao,
  uRelatorio_Divergencias_OV_PV;

{$R *.dfm}

procedure TfrmLiberacao_Pedidos_Vendas.FormCreate(Sender: TObject);
var
  Empresa, Filial: String;
  SQL: String;
begin
  inherited;
  frmLiberacao_Pedidos_Vendas := Self;

  SetLength(DefaultDataSets, 1);
  DefaultDataSets[0] := cdsPedidos_Vendas_Dados;
  ActivedDataSet := cdsPedidos_Vendas_Dados;
  ActivedDataSource := dtsPedidos_Vendas_Dados;
  EntityName := __SuperClass.DBFunctions.GetEntityName(ActivedDataSet);

  SetLength(LegendColors, 9);
  LegendColors[0].Color := GREEN_LEGEND_ICON;
  LegendColors[0].Legend := 'Em aberto';
  LegendColors[1].Color := DARKBLUE_LEGEND_ICON;
  LegendColors[1].Legend := 'Bloqueado Preço';
  LegendColors[2].Color := BROWN_LEGEND_ICON;
  LegendColors[2].Legend := 'Bloqueado Crédito';
  LegendColors[3].Color := BLACK_LEGEND_ICON;
  LegendColors[3].Legend := 'Bloqueado Estoque';
  LegendColors[4].Color := DARKGREEN_LEGEND_ICON;
  LegendColors[4].Legend := 'Bloqueado Expedição';
  LegendColors[5].Color := YELLOW_LEGEND_ICON;
  LegendColors[5].Legend := 'Pronto para Faturar';
  LegendColors[6].Color := BLUE_LEGEND_ICON;
  LegendColors[6].Legend := 'Faturado Parcial';
  LegendColors[7].Color := RED_LEGEND_ICON;
  LegendColors[7].Legend := 'Faturado Totalmente';
  LegendColors[8].Color := PURPLE_LEGEND_ICON;
  LegendColors[8].Legend := 'Baixado por Resíduo';

  ControlePreco := __SuperClass.DBFunctions.GetParamValue('SV_CONTROLE_PRECO');
  ControleCredito := __SuperClass.DBFunctions.GetParamValue('SV_CONTROLE_CREDITO');
  ControleEstoque := __SuperClass.DBFunctions.GetParamValue('SV_CONTROLE_ESTOQUE');
  ControleSeparacao := __SuperClass.DBFunctions.GetParamValue('SV_CONTROLE_SEPARACAO');
  ControleExpedicao := __SuperClass.DBFunctions.GetParamValue('SV_CONTROLE_EXPEDICAO');

  EstoqueNegativo := __SuperClass.DBFunctions.GetParamValue('SV_ESTOQUE_NEGATIVO');

  ForcaBloqueioCredito := __SuperClass.DBFunctions.GetParamValue('SV_FORCA_BLOQUEIO_CREDITO');
  HabilitaExpedicaoLiberacao := __SuperClass.DBFunctions.GetParamValue('SV_HABILITA_EXP_NA_LIB');

  ExibeDivergenciaNaLiberacao := __SuperClass.DBFunctions.GetParamValue('EXIBE_DIVERGENCIA_NA_LIBERACAO');

  DefPar := False;

  __SuperClass.DBFunctions.GetEntityOwner('PEDIDOS_VENDAS_DADOS', Empresa, Filial);

  SQL := 'select a.*, b.REDUZIDO as NOMECLIENTE, c.REDUZIDO as NOMEVENDEDOR  ';
  SQL := SQL +
    'from PEDIDOS_VENDAS_DADOS a inner join CLIENTES b on (b.EMPRESA = :EMPRESA_CLIENTES and b.FILIAL = :FILIAL_CLIENTES and b.CODIGO = a.CLIENTE) ';
  SQL := SQL +
    'inner join VENDEDORES c on (c.EMPRESA = :EMPRESA_VENDEDORES and c.FILIAL = :FILIAL_VENDEDORES and c.CODIGO = a.VENDEDOR) ';
  SQL := SQL + Format('where a.EMPRESA = %s AND a.FILIAL = %s AND a.SITUACAO IN (%s)',
    [QuotedStr(Empresa), QuotedStr(Filial), QuotedStr(PV_EM_ABERTO) + ',' + QuotedStr(PV_FATURADO_PARCIAL)]);
  with cdsPedidos_Vendas_Dados do
    CommandText := SQL;

  DefFileName := 'LIBERACAO_PEDIDOS_VENDAS';

  Pedido := 0;
  ValorMercadorias := 0;
end;

function TfrmLiberacao_Pedidos_Vendas.GeraEstoque: Boolean;
const
  Entidade = 'REGRAS_FISCAIS';
var
  Ret: Boolean;
  Empresa: String;
  Filial: String;
  Filtro: String;
  SQL: String;
  Campos: TUStringArray;
  Auxiliar: TDataSet;
begin
  Ret := False;
  __SuperClass.DBFunctions.GetEntityOwner(Entidade, Empresa, Filial);

  Campos := __SuperClass.GenericsF.VarArrayOfStr(['GERAESTOQUE']);

  Filtro := Format('EMPRESA = %s AND FILIAL = %s AND CODIGO = %d', [QuotedStr(Empresa), QuotedStr(Filial),
    cdsPedidos_Vendas_ItensREGRA.AsInteger]);

  try
    Auxiliar := __SuperClass.DBFunctions.ExecuteQueryByXML(Campos, Entidade, Filtro);
    if (Auxiliar.BOF) and (Auxiliar.EOF) then
      __SuperClass.GenericsF.DisplayMessage('Regra Fiscal não encontrada para este produto.', '',
        'Verifique o código da regra fiscal informada.', 'Informação', MB_ICONEXCLAMATION)
    else
      Ret := Auxiliar.FieldByName('GERAESTOQUE').AsString = VB_SIM;
  finally
    if Assigned(Auxiliar) then
      Auxiliar.Close;
    FreeAndNil(Auxiliar);
  end;

  Result := Ret;

end;

function TfrmLiberacao_Pedidos_Vendas.EstoqueSuficiente: Boolean;
var
  SaldoEstoque: OleVariant;
  Estoque: Double;
  Reservado: Double;
  Disponivel: Extended;
  SDisponivel: String;
  Pedido: Extended;
  SPedido: String;
begin
  Result := True;
  with cdsPedidos_Vendas_Itens do
  begin
    First;
    while not EOF do
    begin
      if GeraEstoque then
      begin
        if (not EstoqueNegativo) then
        begin
          Estoque := __SuperClass.GenericsF.ObtemEstoque(cdsPedidos_Vendas_ItensPRODUTO.AsString,
            cdsPedidos_Vendas_ItensLOCAL.AsString);
          Reservado := __SuperClass.GenericsF.ObtemReservaPedidoVenda(cdsPedidos_Vendas_ItensNUMERO.AsInteger,
            cdsPedidos_Vendas_ItensITEM.AsInteger);

          Disponivel := RoundTo(Estoque + Reservado, -2);
          SDisponivel := FloatToStr(Disponivel);
          Pedido := RoundTo(cdsPedidos_Vendas_ItensQUANTIDADE.AsFloat, -2);
          SPedido := FloatToStr(Pedido);

          cdsPedidos_Vendas_Itens.Edit;

          cdsPedidos_Vendas_ItensESTOQUEATUAL.AsFloat := Disponivel;
          cdsPedidos_Vendas_ItensQUANTIDADELIBERADA.AsFloat := 0;

          cdsPedidos_Vendas_Itens.Post;

          if (Disponivel < Pedido) and
            (StrToBoolDef(VarToStrDef(__SuperClass.DBFunctions.GetParamValue('SV_BLOQUEIA_PV_SEM_ESTOQUE'), 'false'), False)) then
          begin
            __SuperClass.GenericsF.DisplayMessage(Format('Estoque insuficiente para o item [%s] [%s][%s].',
              [FormatFloat('0000', cdsPedidos_Vendas_ItensITEM.AsInteger), cdsPedidos_Vendas_ItensPRODUTO.AsString,
              cdsPedidos_Vendas_ItensLOCAL.AsString]), '', 'Escolha outro produto.', 'Informação', MB_ICONINFORMATION);
            Result := False;
            Break;
          end else
          begin
            cdsPedidos_Vendas_Itens.Edit;

            cdsPedidos_Vendas_ItensESTOQUEATUAL.AsFloat := cdsPedidos_Vendas_ItensQUANTIDADE.AsFloat;
            cdsPedidos_Vendas_ItensQUANTIDADELIBERADA.AsFloat := 0;

            cdsPedidos_Vendas_Itens.Post;
          end;
        end else begin
          cdsPedidos_Vendas_Itens.Edit;

          cdsPedidos_Vendas_ItensESTOQUEATUAL.AsFloat := cdsPedidos_Vendas_ItensQUANTIDADE.AsFloat;
          cdsPedidos_Vendas_ItensQUANTIDADELIBERADA.AsFloat := 0;

          cdsPedidos_Vendas_Itens.Post;
        end;

        Next;
      end;
    end;
  end;
end;

function TfrmLiberacao_Pedidos_Vendas.LiberaExpedicao: Boolean;
var
  Empresa, Filial: String;
  SQL: String;
  Confirma: Boolean;
begin
  Confirma := False;

  try
    with cdsPedidos_Vendas_Liberacao, cdsPedidos_Vendas_Liberacao.Params do
    begin
      __SuperClass.DBFunctions.GetEntityOwner('PEDIDOS_VENDAS_LIBERACAO', Empresa, Filial);
      SQL := 'select * from PEDIDOS_VENDAS_LIBERACAO ';
      SQL := SQL + 'where EMPRESA = :EMPRESA AND FILIAL = :FILIAL AND NUMERO = :NUMERO AND SITUACAO <> ''**'' ';
      SQL := SQL + 'order by EMPRESA, FILIAL, NUMERO, ITEM, SEQUENCIA';
      CommandText := SQL;
      // tratamento do campo Empresa
      with ParamByName('EMPRESA') do
      begin
        DataType := ftString;
        ParamType := ptInput;
        AsString := Empresa;
      end;
      // tratamento do campo Filial
      with ParamByName('FILIAL') do
      begin
        DataType := ftString;
        ParamType := ptInput;
        AsString := Filial;
      end;
      // tratamento do campo Filial
      with ParamByName('NUMERO') do
      begin
        DataType := ftinteger;
        ParamType := ptInput;
        AsInteger := Pedido;
      end;
      __SuperClass.DBFunctions.OpenDataSet(cdsPedidos_Vendas_Liberacao, False, False, -1);
      if (RecordCount = 0) then
        __SuperClass.GenericsF.DisplayMessage('Nenhum item liberado para o pedido selecionado.', '',
          'Verifique se o pedido de venda em questão possui algum item liberado.', 'Informação', MB_ICONINFORMATION)
      else
      begin
        if (LiberacaoMultipla) then
          __SuperClass.GenericsF.DisplayMessage('Para utilizar essa opção o pedido deve ter apenas 1 liberação pendente.', '',
            'Estorne as liberações deste pedido e faça novamente.', 'Informação', MB_ICONINFORMATION)
        else
        begin
          frmInforma_Expedicao := TfrmInforma_Expedicao.Create(Self);
          with frmInforma_Expedicao do
          begin
            cdsPedidos_Vendas_Liberacao := Self.cdsPedidos_Vendas_Liberacao;
            dtsPedidos_Vendas_Liberacao := Self.dtsPedidos_Vendas_Liberacao;
            ValorMercadorias := Self.ValorMercadorias;
            if (ShowModal = mrOk) then
              Confirma := __SuperClass.DBFunctions.dbApply(cdsPedidos_Vendas_Liberacao);
          end;
          FreeAndNil(frmInforma_Expedicao);
        end;
      end;
      __SuperClass.DBFunctions.CloseDataSet(cdsPedidos_Vendas_Liberacao);
    end;
  except
    on E: Exception do
      __SuperClass.GenericsF.DisplayMessage('Falha na efetivação do processo.', Format('%s.', [E.Message]), 'Tente novamente.',
        'Informação', MB_ICONEXCLAMATION);
  end;

  Result := Confirma;

end;

procedure TfrmLiberacao_Pedidos_Vendas.cdsPedidos_Vendas_DadosBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  Abort;
end;

procedure TfrmLiberacao_Pedidos_Vendas.cdsPedidos_Vendas_DadosBeforeOpen(DataSet: TDataSet);
var
  Empresa: String;
  Filial: String;
begin
  inherited;
  __SuperClass.DBFunctions.GetEntityOwner('CLIENTES', Empresa, Filial);
  with cdsPedidos_Vendas_Dados.Params do
  begin
    // tratamento do campo Empresa
    with ParamByName('EMPRESA_CLIENTES') do
    begin
      DataType := ftString;
      ParamType := ptInput;
      AsString := Empresa;
    end;
    // tratamento do campo Filial
    with ParamByName('FILIAL_CLIENTES') do
    begin
      DataType := ftString;
      ParamType := ptInput;
      AsString := Filial;
    end;
  end;
  __SuperClass.DBFunctions.GetEntityOwner('VENDEDORES', Empresa, Filial);
  with cdsPedidos_Vendas_Dados.Params do
  begin
    // tratamento do campo Empresa
    with ParamByName('EMPRESA_VENDEDORES') do
    begin
      DataType := ftString;
      ParamType := ptInput;
      AsString := Empresa;
    end;
    // tratamento do campo Filial
    with ParamByName('FILIAL_VENDEDORES') do
    begin
      DataType := ftString;
      ParamType := ptInput;
      AsString := Filial;
    end;
  end;
end;

procedure TfrmLiberacao_Pedidos_Vendas.cdsPedidos_Vendas_DadosReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TfrmLiberacao_Pedidos_Vendas.cdsPedidos_Vendas_DadosBeforeApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
var
  Preco: OleVariant;
  Credito: OleVariant;
  Estoque: OleVariant;
  Separacao: OleVariant;
  Expedicao: OleVariant;
begin
  inherited;

  Preco := VarArrayOf([ControlePreco, False]);
  Credito := VarArrayOf([ControleCredito, False]);
  Estoque := VarArrayOf([ControleEstoque, False]);
  Separacao := VarArrayOf([ControleSeparacao, False]);
  Expedicao := VarArrayOf([ControleExpedicao, False]);

  // Enviando dados personalizados para o servidor
  OwnerData := VarArrayOf([cdsPedidos_Vendas_DadosORIGEM.AsString, True, Preco, Credito, Estoque, Separacao, Expedicao,
    cdsPedidos_Vendas_DadosVALORFINANCEIRO.AsCurrency, cdsPedidos_Vendas_DadosCLIENTE.AsInteger, False]);

end;

procedure TfrmLiberacao_Pedidos_Vendas.dbGridDblClick(Sender: TObject);
begin
  inherited;

  with ActivedDataSet do
  begin
    if (BOF) and (EOF) then
      __SuperClass.GenericsF.DisplayMessage('Nenhum registro selecionado.', '', 'Selecione ao menos um registro.', 'Informação',
        MB_ICONINFORMATION)
    else
    begin
      if EstoqueSuficiente then
      begin
        frmInforma_Liberacao_Itens := TfrmInforma_Liberacao_Itens.Create(Self);
        try
          cdsPedidos_Vendas_Itens.Filter := 'ESTOQUEATUAL >= QUANTIDADE';
          cdsPedidos_Vendas_Itens.Filtered := True;

          if cdsPedidos_Vendas_Itens.RecordCount = 0 then
          begin
            __SuperClass.GenericsF.DisplayMessage('O pedido em questão não possui estoque para nenhum dos seu produtos@', '',
              'Verifique o estoque atual dos produtos e tente novamente!', 'Informação', MB_ICONWARNING);
          end
          else
            with frmInforma_Liberacao_Itens do
            begin
              if (ShowModal = mrOk) then
              begin
                cdsPedidos_Vendas_Dados.Post;
                Pedido := cdsPedidos_Vendas_DadosNUMERO.AsInteger;
                ValorMercadorias := cdsPedidos_Vendas_DadosVALORMERCADORIAS.AsCurrency;

                if not __SuperClass.DBFunctions.dbApply(cdsPedidos_Vendas_Dados) then
                  __SuperClass.GenericsF.DisplayMessage('Falha ao aplicar as modificações.', '', 'Tente novamente.',
                    'Infomação', MB_ICONEXCLAMATION);
                cdsPedidos_Vendas_Dados.Refresh;

                // Verifica se libera a expedição após a liberação do pedido de vendas
                if HabilitaExpedicaoLiberacao then
                  LiberaExpedicao;

                if ExibeDivergenciaNaLiberacao then
                begin
                  try
                    frmRelatorio_Divergencias_OV_PV := TfrmRelatorio_Divergencias_OV_PV.Create(Self);

                    with frmRelatorio_Divergencias_OV_PV do
                    begin
                      Show;
                      cdsPerguntasNUMERODE.AsInteger := SelecionaNumeroOV(Pedido);
                      cdsPerguntasNUMEROATE.AsInteger := SelecionaNumeroOV(Pedido);
                      cdsPerguntasEMISSAODE.AsString := '01/01/2000';
                      cdsPerguntasEMISSAOATE.AsString := '31/12/2049';
                      cdsPerguntasTIPO.AsString := '3';
                      cdsPerguntasCLIENTEDE.AsInteger := 0;
                      cdsPerguntasCLIENTEATE.AsInteger := 999999;
                      cdsPerguntasVENDEDORDE.AsInteger := 0;
                      cdsPerguntasVENDEDORATE.AsInteger := 999999;
                      btnConfirmar.Click;
                    end;
                  finally
                    FreeAndNil(frmRelatorio_Divergencias_OV_PV);
                  end;
                end;
              end
              else
                cdsPedidos_Vendas_Dados.CancelUpdates;
            end;
        finally
          cdsPedidos_Vendas_Itens.Filtered := False;
          FreeAndNil(frmInforma_Liberacao_Itens);
        end;
      end;
    end;
  end;

end;

procedure TfrmLiberacao_Pedidos_Vendas.dbGridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  inherited;

  if (Column.Field = cdsPedidos_Vendas_DadosSITUACAO) then
  begin
    dbGrid.Canvas.FillRect(Rect);
    if cdsPedidos_Vendas_DadosSITUACAO.AsString = PV_EM_ABERTO then
      imgLegendas.Draw(dbGrid.Canvas, Rect.Left + (((Rect.Right - Rect.Left) - 16) div 2), Rect.Top + 1, GREEN_LEGEND_ICON)
    else
      if cdsPedidos_Vendas_DadosSITUACAO.AsString = PV_BLOQUEADO_PRECO then
        imgLegendas.Draw(dbGrid.Canvas, Rect.Left + (((Rect.Right - Rect.Left) - 16) div 2), Rect.Top + 1, DARKBLUE_LEGEND_ICON)
      else
        if cdsPedidos_Vendas_DadosSITUACAO.AsString = PV_BLOQUEADO_CREDITO then
          imgLegendas.Draw(dbGrid.Canvas, Rect.Left + (((Rect.Right - Rect.Left) - 16) div 2), Rect.Top + 1, BROWN_LEGEND_ICON)
        else
          if cdsPedidos_Vendas_DadosSITUACAO.AsString = PV_BLOQUEADO_ESTOQUE then
            imgLegendas.Draw(dbGrid.Canvas, Rect.Left + (((Rect.Right - Rect.Left) - 16) div 2), Rect.Top + 1,
              BLACK_LEGEND_ICON)
          else
            if cdsPedidos_Vendas_DadosSITUACAO.AsString = PV_BLOQUEADO_SEPARACAO then
              imgLegendas.Draw(dbGrid.Canvas, Rect.Left + (((Rect.Right - Rect.Left) - 16) div 2), Rect.Top + 1,
                MIDDLEDARKGREEN_LEGEND_ICON)
            else
              if cdsPedidos_Vendas_DadosSITUACAO.AsString = PV_BLOQUEADO_EXPEDICAO then
                imgLegendas.Draw(dbGrid.Canvas, Rect.Left + (((Rect.Right - Rect.Left) - 16) div 2), Rect.Top + 1,
                  DARKGREEN_LEGEND_ICON)
              else
                if cdsPedidos_Vendas_DadosSITUACAO.AsString = PV_PRONTO_FATURAR then
                  imgLegendas.Draw(dbGrid.Canvas, Rect.Left + (((Rect.Right - Rect.Left) - 16) div 2), Rect.Top + 1,
                    YELLOW_LEGEND_ICON)
                else
                  if cdsPedidos_Vendas_DadosSITUACAO.AsString = PV_FATURADO_PARCIAL then
                    imgLegendas.Draw(dbGrid.Canvas, Rect.Left + (((Rect.Right - Rect.Left) - 16) div 2), Rect.Top + 1,
                      BLUE_LEGEND_ICON)
                  else
                    if cdsPedidos_Vendas_DadosSITUACAO.AsString = PV_FATURADO_TOTALMENTE then
                      imgLegendas.Draw(dbGrid.Canvas, Rect.Left + (((Rect.Right - Rect.Left) - 16) div 2), Rect.Top + 1,
                        RED_LEGEND_ICON)
                    else
                      if cdsPedidos_Vendas_DadosSITUACAO.AsString = PV_BAIXADO_RESIDUO then
                        imgLegendas.Draw(dbGrid.Canvas, Rect.Left + (((Rect.Right - Rect.Left) - 16) div 2), Rect.Top + 1,
                          PURPLE_LEGEND_ICON)
  end;

end;

procedure TfrmLiberacao_Pedidos_Vendas.cdsPedidos_Vendas_ItensBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  Abort;
end;

procedure TfrmLiberacao_Pedidos_Vendas.cdsPedidos_Vendas_ItensBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  Abort;
end;

procedure TfrmLiberacao_Pedidos_Vendas.cdsPedidos_Vendas_ItensQUANTIDADELIBERADAValidate(Sender: TField);
var
  Msg: ShortString;
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    Msg := '';

    // if ( Sender.AsFloat = 0 ) then
    // Msg := 'A quantidade a ser liberada não pode ser zero.'
    if (Sender.AsFloat > (cdsPedidos_Vendas_ItensQUANTIDADE.AsFloat - (cdsPedidos_Vendas_ItensFATURADO.AsFloat +
      cdsPedidos_Vendas_ItensELIMINADO.AsFloat))) then
      Msg := 'A quantidade não pode ser maior que a quantidade informada no item.';

    if (Msg <> '') then
    begin
      __SuperClass.GenericsF.DisplayMessage(Msg, '', 'Verifique o valor informado.', 'Informação', MB_ICONEXCLAMATION);
      Abort;
    end;
  end;

end;

function TfrmLiberacao_Pedidos_Vendas.LiberacaoMultipla: Boolean;
var
  Reg: TBookMark;
  Sequencia: Integer;
  Duplicada: Boolean;
begin
  Duplicada := False;

  with cdsPedidos_Vendas_Liberacao do
  begin
    Reg := GetBookMark;

    try
      First;
      Sequencia := FieldByName('SEQUENCIA').AsInteger;

      while not(EOF) and not(Duplicada) do
      begin
        Duplicada := (Sequencia <> FieldByName('SEQUENCIA').AsInteger);
        Next;
      end;
    finally
      GotoBookMark(Reg);
      FreeBookMark(Reg);
      EnableControls;
    end;
  end;

  Result := Duplicada;

end;

function TfrmLiberacao_Pedidos_Vendas.SelecionaNumeroOV(Pedido: Integer): Integer;
var
  SQL: WideString;
  Orcamento: Integer;
begin
  Orcamento := 0;

  SQL := 'SELECT NUMEROOV FROM PEDIDOS_VENDAS_ITENS WHERE NUMERO = :PEDIDO ROWS 1';

  with cdsPesquisaOV, cdsPesquisaOV.Params do
  begin
    CommandText := SQL;

    with ParamByName('PEDIDO') do
    begin
      DataType := ftinteger;
      ParamType := ptInput;
      AsInteger := Pedido;
    end;

    __SuperClass.DBFunctions.OpenDataSet(cdsPesquisaOV, False, False, -1);
    Orcamento := FieldByName('NUMEROOV').AsInteger;
    __SuperClass.DBFunctions.CloseDataSet(cdsPesquisaOV);
  end;

  Result := Orcamento;

end;

{$REGION 'Inicialização/Finalização da classe'}

initialization

RegisterClass(TfrmLiberacao_Pedidos_Vendas);

finalization

UnRegisterClass(TfrmLiberacao_Pedidos_Vendas);
{$ENDREGION}

end.
