{ ********************************************************************* }
{ }
{ TRS Sistemas - Runtime Library Functions }
{ }
{ Copyright(c) 2006-2012 TRS Sistemas e Soluções em Informática Ltda. }
{ }
{ Author: Thiago Rodrigo da Silva }
{ ********************************************************************* }
{ Lançamento de Contas a Receber }
{ }
{ ********************************************************************* }
{ Data última alteração: }
{ Últimas alterações: }
{ }
{ ********************************************************************* }

unit uContas_Receber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ActnList, ImgList, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGrids, ComCtrls, DBCtrls, ToolWin, FMTBcd, DB, DBClient, Provider, SqlExpr,
  ComObj, Mask, SHFolder, uFBase_Mod2, uTypes, uUser_Types, uLibrary, uRecError,
  DSConnect, PngImageList, PngSpeedButton, pngimage;

type
  TfrmContas_Receber = class(TfrmFBase_Mod2)
    dtsContas_Receber: TDataSource;
    tbsRateios: TTabSheet;
    dbGridRateios: TDBGrid;
    cdsContas_Receber_Rateios: TClientDataSet;
    dtsContas_Receber_Rateios: TDataSource;
    cdsContas_Receber_RateiosFILIAL: TStringField;
    cdsContas_Receber_RateiosPREFIXO: TStringField;
    cdsContas_Receber_RateiosPARCELA: TIntegerField;
    cdsContas_Receber_RateiosTIPO: TStringField;
    cdsContas_Receber_RateiosCLIENTE: TIntegerField;
    cdsContas_Receber_RateiosDATACRIACAO: TSQLTimeStampField;
    cdsContas_Receber_RateiosCATEGORIA: TStringField;
    Label21: TLabel;
    Label23: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label35: TLabel;
    Label48: TLabel;
    spdClientes: TSpeedButton;
    Label24: TLabel;
    spdBancos: TSpeedButton;
    Label31: TLabel;
    Label51: TLabel;
    Label30: TLabel;
    spdCategorias: TSpeedButton;
    Label5: TLabel;
    spdMoedas: TSpeedButton;
    Label18: TLabel;
    Label19: TLabel;
    Label22: TLabel;
    Label25: TLabel;
    Label16: TLabel;
    Label10: TLabel;
    dbcboSituacao: TDBComboBox;
    dbedtEmissao: TDBEdit;
    dbedtPrefixo: TDBEdit;
    dbedtTitulo: TDBEdit;
    dbedtParcela: TDBEdit;
    dbcboTipo: TDBComboBox;
    dbedtVencimento: TDBEdit;
    dbedtVencimentoReal: TDBEdit;
    dbedtValor: TDBEdit;
    dbedtJuros: TDBEdit;
    dbedtTaxaPermanencia: TDBEdit;
    dbedtSaldo: TDBEdit;
    dbedtCliente: TDBEdit;
    dbedtConta: TDBEdit;
    dbedtBanco: TDBEdit;
    dbedtAgencia: TDBEdit;
    dbedtCategoriaFinanceira: TDBEdit;
    dbedtMoeda: TDBEdit;
    dbedtAcrescimo: TDBEdit;
    dbedtDecrescimo: TDBEdit;
    dbedtDiasDesconto: TDBEdit;
    dbcboTipoDesconto: TDBComboBox;
    dbedtTaxaMoeda: TDBEdit;
    dbcboFluxo: TDBComboBox;
    dbedtNomeCliente: TDBEdit;
    dbedtNomeBanco: TDBEdit;
    dbedtDescricaoMoeda: TDBEdit;
    dbedtDescricaoCategoria: TDBEdit;
    Label27: TLabel;
    spdVendedores: TSpeedButton;
    dbedtVendedor: TDBEdit;
    Label28: TLabel;
    dbedtValorComissao: TDBEdit;
    dbedtNomeVendedor: TDBEdit;
    cdsContas_Receber_RateiosNUMERO: TIntegerField;
    cdsContas_Receber_RateiosDESCRICAOCATEGORIA: TStringField;
    Label20: TLabel;
    dbeedtDesconto: TDBEdit;
    Label29: TLabel;
    dbmemObservacao: TLabel;
    Label32: TLabel;
    dbcboFilialOrigem: TDBComboBox;
    dbedtHistorico: TDBEdit;
    dbcboEmpresaOrigem: TDBComboBox;
    cdsContas_Receber_RateiosEMPRESA: TStringField;
    cdsContas_Receber_RateiosVALOR: TFloatField;
    cdsContas_Receber_RateiosPERCENTUAL: TFloatField;
    Label15: TLabel;
    dbcboFormaPagamento: TDBComboBox;
    tbsCobrancas: TTabSheet;
    scrCobrancas: TScrollBox;
    dbgridCobrancas: TDBGrid;
    cdsContas_Receber_Cobrancas: TClientDataSet;
    dtsContas_Receber_Cobrancas: TDataSource;
    cdsContas_Receber_CobrancasFILIAL: TStringField;
    cdsContas_Receber_CobrancasPREFIXO: TStringField;
    cdsContas_Receber_CobrancasNUMERO: TIntegerField;
    cdsContas_Receber_CobrancasPARCELA: TIntegerField;
    cdsContas_Receber_CobrancasTIPO: TStringField;
    cdsContas_Receber_CobrancasCLIENTE: TIntegerField;
    cdsContas_Receber_CobrancasDATA: TDateField;
    cdsContas_Receber_CobrancasEMPRESA: TStringField;
    cdsContas_Receber_CobrancasDATACRIACAO: TSQLTimeStampField;
    cdsContas_Receber_CobrancasUSUARIO: TIntegerField;
    cdsContas_Receber_CobrancasSEQUENCIA: TIntegerField;
    Label14: TLabel;
    dbedtNossoNumero: TDBEdit;
    Label12: TLabel;
    dbcboTipoCobranca: TDBComboBox;
    Label13: TLabel;
    dbedtBordero: TDBEdit;
    cdsContas_Receber: TClientDataSet;
    cdsContas_ReceberEMPRESA: TStringField;
    cdsContas_ReceberFILIAL: TStringField;
    cdsContas_ReceberEMISSAO: TDateField;
    cdsContas_ReceberSITUACAO: TStringField;
    cdsContas_ReceberPREFIXO: TStringField;
    cdsContas_ReceberNUMERO: TIntegerField;
    cdsContas_ReceberPARCELA: TIntegerField;
    cdsContas_ReceberTIPO: TStringField;
    cdsContas_ReceberCLIENTE: TIntegerField;
    cdsContas_ReceberBANCO: TIntegerField;
    cdsContas_ReceberAGENCIA: TStringField;
    cdsContas_ReceberCONTA: TStringField;
    cdsContas_ReceberCATEGORIA: TStringField;
    cdsContas_ReceberVENCIMENTO: TDateField;
    cdsContas_ReceberVENCIMENTOREAL: TDateField;
    cdsContas_ReceberVALOR: TFloatField;
    cdsContas_ReceberJUROS: TFloatField;
    cdsContas_ReceberTAXAPERMANENCIA: TFloatField;
    cdsContas_ReceberVENDEDOR: TIntegerField;
    cdsContas_ReceberCOMISSAO: TFloatField;
    cdsContas_ReceberMOEDA: TStringField;
    cdsContas_ReceberTAXAMOEDA: TFloatField;
    cdsContas_ReceberFLUXO: TStringField;
    cdsContas_ReceberACRESCIMO: TFloatField;
    cdsContas_ReceberDECRESCIMO: TFloatField;
    cdsContas_ReceberDESCONTO: TFloatField;
    cdsContas_ReceberDIASDESCONTO: TIntegerField;
    cdsContas_ReceberTIPODESCONTO: TStringField;
    cdsContas_ReceberSALDO: TFloatField;
    cdsContas_ReceberFORMAPAGAMENTO: TStringField;
    cdsContas_ReceberHISTORICO: TStringField;
    cdsContas_ReceberEMPRESAORIGEM: TStringField;
    cdsContas_ReceberFILIALORIGEM: TStringField;
    cdsContas_ReceberORIGEM: TStringField;
    cdsContas_ReceberFATURA: TIntegerField;
    cdsContas_ReceberPEDIDO: TIntegerField;
    cdsContas_ReceberSELECIONADO: TStringField;
    cdsContas_ReceberBORDERO: TIntegerField;
    cdsContas_ReceberNOSSONUMERO: TStringField;
    cdsContas_ReceberTIPOCOBRANCA: TStringField;
    cdsContas_ReceberCARTEIRA: TStringField;
    cdsContas_ReceberDATACRIACAO: TSQLTimeStampField;
    cdsContas_RecebersqlContas_Receber_Cobrancas: TDataSetField;
    cdsContas_RecebersqlContas_Receber_Rateios: TDataSetField;
    cdsContas_ReceberNOMEVENDEDOR: TStringField;
    cdsContas_ReceberDESCRICAOCATEGORIA: TStringField;
    cdsContas_ReceberDESCRICAOMOEDA: TStringField;
    cdsContas_ReceberNOMEBANCO: TStringField;
    cdsContas_ReceberIDCNAB: TIntegerField;
    cdsContas_Receber_CobrancasMOTIVO: TStringField;
    cdsContas_Receber_CobrancasPROVIDENCIA: TStringField;
    cdsContas_ReceberULTIMABAIXA: TDateField;
    cdsClientes: TClientDataSet;
    cdsClientesNOME: TStringField;
    cdsClientesENDERECO: TStringField;
    cdsClientesNUMERO: TStringField;
    cdsClientesBAIRRO: TStringField;
    cdsClientesMUNICIPIO: TStringField;
    cdsClientesUF: TStringField;
    cdsClientesCEP: TStringField;
    cdsClientesCNPJ: TStringField;
    cdsBancos: TClientDataSet;
    cdsClientesPESSOA: TStringField;
    cdsClientesCPF: TStringField;
    cdsClientesEMAIL: TStringField;
    cdsContas_ReceberOBSERVACAO: TStringField;
    Label17: TLabel;
    dbedtObservacao: TDBEdit;
    cdsContas_ReceberLOTE: TIntegerField;
    dspcContas_Receber: TDSProviderConnection;
    btnSeparador1: TToolButton;
    btnProjetar: TToolButton;
    actProjetar: TAction;
    actImprimir_Boleto: TAction;
    ToolButton9: TToolButton;
    btnImprimir_Boleto: TToolButton;
    dspcClientes: TDSProviderConnection;
    dspcBancos: TDSProviderConnection;
    cdsContas_ReceberVALORPIS: TFloatField;
    cdsContas_ReceberVALORCOFINS: TFloatField;
    cdsContas_ReceberVALORCSLL: TFloatField;
    cdsContas_ReceberVALORFGTS: TFloatField;
    cdsContas_ReceberVALORINSS: TFloatField;
    cdsContas_ReceberVALORIRRF: TFloatField;
    cdsContas_ReceberVALORISS: TFloatField;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label26: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    dbedtValorISS: TDBEdit;
    dbedtValorIRRF: TDBEdit;
    dbedtValorFGTS: TDBEdit;
    dbedtValorPIS: TDBEdit;
    dbedtValorCOFINS: TDBEdit;
    dbedtValorCSLL: TDBEdit;
    dbedtValorINSS: TDBEdit;
    cdsContas_ReceberVALORORIGINAL: TFloatField;
    dbedtValorOriginal: TDBEdit;
    Label42: TLabel;
    cdsContas_ReceberUSADOPCC: TStringField;
    cdsContas_ReceberBASE10925: TFloatField;
    cdsContas_ReceberDIGITACAO: TDateField;
    cdsContas_ReceberNOMECLIENTE: TStringField;
    cdsContas_ReceberCC: TStringField;
    cdsContas_ReceberDESCRICAOCC: TStringField;
    Label33: TLabel;
    spdbtnCC: TSpeedButton;
    dbedtCC: TDBEdit;
    dbedtDescricaoCC: TDBEdit;
    cdsBancosEMPRESA: TStringField;
    cdsBancosFILIAL: TStringField;
    cdsBancosSTATUS: TStringField;
    cdsBancosCODIGO: TIntegerField;
    cdsBancosDATACADASTRO: TDateField;
    cdsBancosAGENCIA: TStringField;
    cdsBancosDVAGENCIA: TStringField;
    cdsBancosCONTA: TStringField;
    cdsBancosDVCONTA: TStringField;
    cdsBancosNOME: TStringField;
    cdsBancosREDUZIDO: TStringField;
    cdsBancosENDERECO: TStringField;
    cdsBancosNUMERO: TStringField;
    cdsBancosCOMPLEMENTO: TStringField;
    cdsBancosUF: TStringField;
    cdsBancosMUNICIPIO: TStringField;
    cdsBancosCMUNICIPIO: TStringField;
    cdsBancosBAIRRO: TStringField;
    cdsBancosCEP: TStringField;
    cdsBancosEMAIL: TStringField;
    cdsBancosHOMEPAGE: TStringField;
    cdsBancosDDI: TStringField;
    cdsBancosDDD: TStringField;
    cdsBancosTELEFONE: TStringField;
    cdsBancosFAX: TStringField;
    cdsBancosCONTATO: TStringField;
    cdsBancosLIMITECREDITO: TFloatField;
    cdsBancosOBSERVACAO: TStringField;
    cdsBancosEMITEBOLETO: TStringField;
    cdsBancosGERANOSSONUMERO: TStringField;
    cdsBancosJUNTAAGREGADOS: TStringField;
    cdsBancosINICIONUMERO: TStringField;
    cdsBancosFIMNUMERO: TStringField;
    cdsBancosPROXIMONUMERO: TStringField;
    cdsBancosNOTIFICAEMAIL: TStringField;
    cdsBancosINSTRUCAOBANCARIA: TStringField;
    cdsBancosDEMONSTRATIVO: TStringField;
    cdsBancosLAYOUT: TStringField;
    cdsBancosDOCUMENTOINTERNO: TStringField;
    cdsBancosCODIGOCEDENTE: TStringField;
    cdsBancosDIASFLUTUANTES: TIntegerField;
    cdsBancosLICENCACOBREBEMX: TStringField;
    cdsBancosVARIACAOCARTEIRA: TStringField;
    cdsBancosPADRAOLAYOUT: TStringField;
    cdsBancosINSTRUCAOPROTESTO: TStringField;
    cdsBancosDIASPROTESTO: TIntegerField;
    cdsBancosINCLUIDO: TStringField;
    cdsBancosALTERADO: TStringField;
    cdsBancosDATACRIACAO: TSQLTimeStampField;
    cdsBancossqlBancos_Contatos: TDataSetField;
    cdsContas_ReceberVALORCORRIGIDO: TFloatField;
    cdsContas_ReceberVALORTAXAPERMANENCIA: TCurrencyField;
    cdsContas_ReceberVALORJUROS: TCurrencyField;
    cdsContas_ReceberVALORDESCONTO: TCurrencyField;
    cdsContas_ReceberVALORMULTA: TCurrencyField;
    Label34: TLabel;
    dbedtValorDesconto: TDBEdit;
    dbedtValorTaxaPermanencia: TDBEdit;
    Label43: TLabel;
    dbedtValorJuros: TDBEdit;
    Label44: TLabel;
    Label45: TLabel;
    dbedtValorMulta: TDBEdit;
    dbedtValorCorrigido: TDBEdit;
    Label46: TLabel;
    procedure cdsContas_ReceberCalcFields(DataSet: TDataSet);
    procedure dtsContas_ReceberDataChange(Sender: TObject; Field: TField);
    procedure cdsContas_Receber_CobrancasBeforeInsert(DataSet: TDataSet);
    procedure dbgridCobrancasEditButtonClick(Sender: TObject);
    procedure cdsContas_Receber_CobrancasNewRecord(DataSet: TDataSet);
    procedure cdsContas_Receber_CobrancasPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdsContas_Receber_CobrancasEditError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdsContas_Receber_CobrancasDeleteError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdsContas_Receber_CobrancasBeforePost(DataSet: TDataSet);
    procedure cdsContas_Receber_CobrancasBeforeDelete(DataSet: TDataSet);
    procedure cdsContas_Receber_RateiosCATEGORIAValidate(Sender: TField);
    procedure cdsContas_ReceberBeforeEdit(DataSet: TDataSet);
    procedure cdsContas_ReceberBeforeDelete(DataSet: TDataSet);
    procedure cdsContas_ReceberBeforePost(DataSet: TDataSet);
    procedure cdsContas_ReceberDeleteError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdsContas_ReceberEditError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdsContas_ReceberNewRecord(DataSet: TDataSet);
    procedure cdsContas_ReceberPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdsContas_ReceberReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure FormCreate(Sender: TObject);
    procedure dbGridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cdsContas_Receber_RateiosDeleteError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdsContas_Receber_RateiosEditError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdsContas_Receber_RateiosPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure spdBancosClick(Sender: TObject);
    procedure cdsContas_Receber_RateiosBeforeDelete(DataSet: TDataSet);
    procedure cdsContas_Receber_RateiosNewRecord(DataSet: TDataSet);
    procedure dbedtEmissaoDblClick(Sender: TObject);
    procedure cdsContas_ReceberVALORValidate(Sender: TField);
    procedure cdsContas_Receber_RateiosBeforePost(DataSet: TDataSet);
    procedure cdsContas_Receber_RateiosPERCENTUALValidate(Sender: TField);
    procedure dbGridRateiosEditButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cdsContas_Receber_RateiosReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsContas_ReceberVENCIMENTOValidate(Sender: TField);
    procedure cdsContas_ReceberTIPOChange(Sender: TField);
    procedure spdClientesClick(Sender: TObject);
    procedure spdCategoriasClick(Sender: TObject);
    procedure spdVendedoresClick(Sender: TObject);
    procedure spdMoedasClick(Sender: TObject);
    procedure dbedtVencimentoDblClick(Sender: TObject);
    procedure dbedtVencimentoRealDblClick(Sender: TObject);
    procedure actProjetarExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cdsContas_ReceberBeforeOpen(DataSet: TDataSet);
    procedure cdsContas_ReceberFORMAPAGAMENTOChange(Sender: TField);
    procedure btnImprimir_BoletoClick(Sender: TObject);
    procedure actCopiar_RegistroExecute(Sender: TObject);
    procedure cdsContas_ReceberCATEGORIAValidate(Sender: TField);
    procedure cdsContas_ReceberCLIENTEValidate(Sender: TField);
    procedure cdsContas_ReceberVENDEDORValidate(Sender: TField);
    procedure cdsContas_ReceberMOEDAValidate(Sender: TField);
    procedure cdsContas_ReceberBANCOValidate(Sender: TField);
    procedure actImprimir_BoletoExecute(Sender: TObject);
    procedure actCopy_RecnoExecute(Sender: TObject);
    procedure cdsContas_ReceberVALORChange(Sender: TField);
    procedure spdbtnCCClick(Sender: TObject);
    procedure cdsContas_ReceberCCValidate(Sender: TField);
    procedure cdsContas_ReceberAfterScroll(DataSet: TDataSet);
    procedure cdsContas_ReceberBeforeInsert(DataSet: TDataSet);
    procedure cdsContas_ReceberVALORMULTAValidate(Sender: TField);
    procedure cdsContas_ReceberVALORJUROSValidate(Sender: TField);
  protected
    TotalRateio: Single;
    LicencaCobreBemX: TLicencaCobreBemX;
    procedure VerificaRateios;
    procedure ImprimeBoleto;
    procedure CalculaValorLiquido(ValorBase: Currency);
  public
    procedure ShowFields; override;
  end;

var
  frmContas_Receber: TfrmContas_Receber;

implementation

uses uDMMain, uBancos, uCategorias_Financeiras, uClientes, uMoedas, uVendedores,
  uContas_Receber_Projetar, uCentros_Custos;

{$R *.dfm}

procedure TfrmContas_Receber.FormCreate(Sender: TObject);
var
  ImagemBoleto: String;
  StreamLicenca: TMemoryStream;
begin
  inherited;
  frmContas_Receber := Self;

  SetLength(DefaultDataSets, 1);
  DefaultDataSets[0] := cdsContas_Receber;
  ActivedDataSet := cdsContas_Receber;
  ActivedDataSource := dtsContas_Receber;
  EntityName := __SuperClass.DBFunctions.GetEntityName(ActivedDataSet);

  LockFields.Add('SITUACAO');
  LockFields.Add('PREFIXO');
  LockFields.Add('NUMERO');
  LockFields.Add('PARCELA');
  LockFields.Add('TIPO');
  LockFields.Add('CLIENTE');

  TotalRateio := 0;

  SetLength(LegendColors, 3);
  LegendColors[0].Color := GREEN_LEGEND_ICON;
  LegendColors[0].Legend := 'Em Aberto';
  LegendColors[1].Color := BLUE_LEGEND_ICON;
  LegendColors[1].Legend := 'Baixado Parcial';
  LegendColors[2].Color := RED_LEGEND_ICON;
  LegendColors[2].Legend := 'Baixado Total';

  // definir LicencaCobreBemX.Arquivo    := Format('%s\%s', [sysGetSystemPath, sysGetParamValue('SV_ARQUIVO_LICENCA_COBREBEMX')]);
  // LicencaCobreBemX.LogoTipo := Format('%s\%s', [sysGetImagesPath, sysGetParamValue('SV_ARQUIVO_IMAGEM_BOLETO')]);
  // LicencaCobreBemX.Habilitado := FileExists(LicencaCobreBemX.Arquivo);

  {
    ImagemBoleto := __SuperClass.DBFunctions.GetParamValue('SV_ARQUIVO_IMAGEM_BOLETO'); //cdsBancosLICENCACOBREBEMX.AsString;
    if FileExists(Format('%s\%s', [__Superclass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), ImagemBoleto])) then
    LicencaCobreBemX.LogoTipo := Format('%s\%s', [__Superclass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), ImagemBoleto])
    else
    begin
    try
    StreamLicenca := __SuperClass.GenericsF.LoadRemoteFile('System', ImagemBoleto);
    StreamLicenca.SaveToFile(Format('%s\%s', [__Superclass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), ImagemBoleto]));

    LicencaCobreBemX.LogoTipo := Format('%s\%s', [__Superclass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), ImagemBoleto]);
    finally
    StreamLicenca.Free;
    end;
    end;
  }
  EnableCopy := True;
end;

procedure TfrmContas_Receber.FormDestroy(Sender: TObject);
begin
  inherited;
  frmContas_Receber := Nil;
end;

procedure TfrmContas_Receber.btnImprimir_BoletoClick(Sender: TObject);
begin
  ImprimeBoleto;
end;

procedure TfrmContas_Receber.CalculaValorLiquido(ValorBase: Currency);
var
  ImpostosCategoria: TImpostosCategoria;
  ValorLiquido: Currency;
begin
  inherited;
  if (ValorBase > 0) then
  begin
    try
      cdsContas_ReceberVALORORIGINAL.AsCurrency := ValorBase;
      ValorLiquido := ValorBase;
      ImpostosCategoria := __SuperClass.GenericsF.ObtemRegrasImpostosCategoria(cdsContas_ReceberCATEGORIA.AsString);
      // Atribuindo a base do ISS
      ImpostosCategoria.ISS.Base.Value := cdsContas_ReceberVALORORIGINAL.AsCurrency;
      // Atribuindo a base do IRRF
      ImpostosCategoria.IRRF.Base.Value := cdsContas_ReceberVALORORIGINAL.AsCurrency;
      // Atribuindo a base do PCC
      ImpostosCategoria.Retencao10925.PIS.Base.Value := cdsContas_ReceberVALORORIGINAL.AsCurrency;
      ImpostosCategoria.Retencao10925.COFINS.Base.Value := cdsContas_ReceberVALORORIGINAL.AsCurrency;
      ImpostosCategoria.Retencao10925.CSLL.Base.Value := cdsContas_ReceberVALORORIGINAL.AsCurrency;
      // Atribuindo a base do INSS
      ImpostosCategoria.INSS.Base.Value := cdsContas_ReceberVALORORIGINAL.AsCurrency;
      // Atribuindo a base do FGTS
      ImpostosCategoria.FGTS.Base.Value := cdsContas_ReceberVALORORIGINAL.AsCurrency;
      // Calculando os impostos
      ImpostosCategoria.CalculaImpostos;
      // Atribuindo os valores dos impostos
      cdsContas_ReceberVALORISS.AsCurrency := ImpostosCategoria.ISS.Valor.Value;
      if not ImpostosCategoria.ISS.Recolhe then
        ValorLiquido := ValorLiquido - cdsContas_ReceberVALORISS.AsCurrency;

      cdsContas_ReceberVALORIRRF.AsCurrency := ImpostosCategoria.IRRF.Valor.Value;
      if ImpostosCategoria.IRRF.Valor.Value < __SuperClass.DBFunctions.GetParamValue('SV_LIMITE_RETENCAO_IRRF') then
        ImpostosCategoria.IRRF.Valor.Value := 0
      else if not ImpostosCategoria.IRRF.Recolhe then
        ValorLiquido := ValorLiquido - cdsContas_ReceberVALORIRRF.AsCurrency;
      cdsContas_ReceberBASE10925.AsCurrency := cdsContas_ReceberVALORORIGINAL.AsCurrency;
      cdsContas_ReceberVALORPIS.AsCurrency := ImpostosCategoria.Retencao10925.PIS.Valor.Value;
      cdsContas_ReceberVALORCOFINS.AsCurrency := ImpostosCategoria.Retencao10925.COFINS.Valor.Value;
      cdsContas_ReceberVALORCSLL.AsCurrency := ImpostosCategoria.Retencao10925.CSLL.Valor.Value;

      cdsContas_ReceberVALORINSS.AsCurrency := ImpostosCategoria.INSS.Valor.Value;
      if ImpostosCategoria.INSS.Valor.Value < __SuperClass.DBFunctions.GetParamValue('SV_LIMITE_RETENCAO_INSS') then
        ImpostosCategoria.INSS.Valor.Value := 0
      else if not ImpostosCategoria.INSS.Recolhe then
        ValorLiquido := ValorLiquido - cdsContas_ReceberVALORINSS.AsCurrency;
      cdsContas_ReceberVALORFGTS.AsCurrency := ImpostosCategoria.FGTS.Valor.Value;
      if not ImpostosCategoria.FGTS.Recolhe then
        ValorLiquido := ValorLiquido - cdsContas_ReceberVALORFGTS.AsCurrency;
      cdsContas_ReceberVALOR.AsCurrency := ValorLiquido;
      cdsContas_ReceberSALDO.AsCurrency := cdsContas_ReceberVALOR.AsCurrency;
    finally
      FreeAndNil(ImpostosCategoria);
    end;
  end;
end;

procedure TfrmContas_Receber.cdsContas_ReceberAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if cdsContas_ReceberORIGEM.AsString <> 'CRE' then
    dbedtValor.Enabled := False
  else
    dbedtValor.Enabled := True;
end;

procedure TfrmContas_Receber.cdsContas_ReceberBANCOValidate(Sender: TField);
var
  ApplyFields: TApplyFields;
begin
  inherited;
  if (cdsContas_ReceberBANCO.AsInteger <> 0) and (cdsContas_ReceberAGENCIA.AsString <> '') and
    (cdsContas_ReceberCONTA.AsString <> '') then
  begin
    try
      ApplyFields := TApplyFields.Create(__SuperClass);
      ApplyFields.EntityName := 'BANCOS';
      ApplyFields.SourceFilter := Format('CODIGO = %d AND AGENCIA = %s AND CONTA = %s',
        [cdsContas_ReceberBANCO.AsInteger, QuotedStr(cdsContas_ReceberAGENCIA.AsString),
        QuotedStr(cdsContas_ReceberCONTA.AsString)]);
      ApplyFields.SourceFList.Add('REDUZIDO');
      ApplyFields.CheckStatus := True;
      ApplyFields.ApplyFList.Add('NOMEBANCO');
      ApplyFields.ApplyDataSet := Sender.DataSet;
      if not ApplyFields.Execute then
      begin
        __SuperClass.GenericsF.DisplayMessage(ApplyFields.ResultMsg, '', 'Verifique o conteúdo do campo informado.', 'Informação',
          MB_ICONINFORMATION);
        Abort;
      end;
    finally
      FreeAndNil(ApplyFields);
    end;
  end;
end;

procedure TfrmContas_Receber.cdsContas_ReceberBeforeDelete(DataSet: TDataSet);
var
  Aborta: Boolean;
begin
  inherited;
  Aborta := False;
  if (MessageBox(Application.Handle, 'Deseja excluir o registro?', 'Pergunta', MB_YESNO + MB_ICONQUESTION) <> IDYES) then
    Aborta := True
  else
  begin
    // verificando se o título a ser excluído foi gerado pela rotina de contas a pagar
    if (cdsContas_ReceberORIGEM.AsString <> 'CRE') then
    begin
      __SuperClass.GenericsF.DisplayMessage('O título em questão não poder ser excluído, pois foi gerado por outra rotina.', '',
        'Exclua-o usando a rotina geradora.', 'Informação', MB_ICONEXCLAMATION);
      Aborta := True;
    end
    else
    begin
      // verificando se a lista poossui itens antes de exclui-la
      if (not(cdsContas_Receber_Rateios.Eof)) then
      begin
        __SuperClass.GenericsF.DisplayMessage('O título a receber atual ainda está relacionado com seus rateios.', '',
          'Exclua os rateios do título a receber antes de excluí-lo.', 'Informação', MB_ICONEXCLAMATION);
        Aborta := True;
      end
      else
      begin
        // verificando se a lista poossui itens antes de exclui-la
        if (not(cdsContas_Receber_Cobrancas.Eof)) then
        begin
          __SuperClass.GenericsF.DisplayMessage('O título a receber atual ainda está relacionado com suas cobranças.', '',
            'Exclua os rateios do título a receber antes de excluí-lo.', 'Informação', MB_ICONEXCLAMATION);
          Aborta := True;
        end
        else
        begin
          // Se o título estiver baixado, não deixar alterar
          if (cdsContas_ReceberSITUACAO.AsString <> '0') then
          begin
            __SuperClass.GenericsF.DisplayMessage('Impossível excluir este título, pois o mesmo já sofreu baixa(s).', '',
              'Exclua a(s) baixa(s) realizada(s) para este título.', 'Informação', MB_ICONEXCLAMATION);
            Aborta := True;
          end
          else
          begin
            if (cdsContas_ReceberTIPOCOBRANCA.AsString <> '') and (cdsContas_ReceberTIPOCOBRANCA.AsString <> ST_CARTEIRA) then
            // Carteira
            begin
              __SuperClass.GenericsF.DisplayMessage('Impossível excluir este título, pois o mesmo não está em carteira.', '',
                'Exclua o título pela rotina de borderôs.', 'Informação', MB_ICONEXCLAMATION);
              Aborta := True;
            end;
          end;
        end;
      end;
    end;
  end;

  if (Aborta) then
    Abort;
end;

procedure TfrmContas_Receber.cdsContas_ReceberBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (not __SuperClass.DBFunctions.CheckRequiredFields(DataSet)) then
    Abort
  else
    VerificaRateios();
end;

procedure TfrmContas_Receber.cdsContas_ReceberDeleteError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  __SuperClass.GenericsF.ShowException(E);
  Action := daAbort;
end;

procedure TfrmContas_Receber.cdsContas_ReceberEditError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  __SuperClass.GenericsF.ShowException(E);
  Action := daAbort;
end;

procedure TfrmContas_Receber.cdsContas_ReceberFORMAPAGAMENTOChange(Sender: TField);
begin
  inherited;
  if ((Sender.Value <> '') and (Pos('=', Sender.Value) > 0)) then
    Sender.Value := __SuperClass.GenericsF.GetValueFromList(Sender.Value);
end;

procedure TfrmContas_Receber.cdsContas_ReceberMOEDAValidate(Sender: TField);
const
  Entidade = 'MOEDAS';
var
  Empresa: String;
  Filial: String;
  Campos: String;
  Filtro: String;
  Auxiliar: TDataSet;
  Continua: Boolean;
begin
  inherited;
  Continua := True;
  try
    if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
    begin
      if (Sender.AsString <> '') then
      begin
        try
          __SuperClass.DBFunctions.GetEntityOwner(Entidade, Empresa, Filial);
          Campos := 'DESCRICAO';
          Filtro := Format('EMPRESA = %s AND FILIAL = %s AND CODIGO = %s', [QuotedStr(Empresa), QuotedStr(Filial),
            QuotedStr(Sender.AsString)]);
          Auxiliar := __SuperClass.DBFunctions.ExecuteQueryByXML(Campos, Entidade, Filtro, '');
          if (Auxiliar.BOF) and (Auxiliar.Eof) then
          begin
            __SuperClass.GenericsF.DisplayMessage('Moeda não encontrada.', '', 'Verifique o código informado.', 'Informação',
              MB_ICONEXCLAMATION);
            Continua := False;
          end
          else
            cdsContas_ReceberDESCRICAOMOEDA.AsString := Auxiliar.FieldByName('DESCRICAO').AsString;
        finally
          Auxiliar.Close;
          FreeAndNil(Auxiliar);
        end;
      end;
    end;
  except
    on E: Exception do
    begin
      __SuperClass.GenericsF.DisplayMessage('Falha ao pesquisar a moeda.', E.Message, 'Verifique o valor informado.',
        'Informação', MB_ICONEXCLAMATION);
      Continua := False;
    end;
  end;
  if not Continua then
    Abort;
end;

procedure TfrmContas_Receber.cdsContas_ReceberNewRecord(DataSet: TDataSet);
var
  Empresa: String;
  Filial: String;
begin
  inherited;
  __SuperClass.DBFunctions.GetEntityOwner('CONTAS_RECEBER', Empresa, Filial);
  cdsContas_ReceberEMPRESA.AsString := Empresa;
  cdsContas_ReceberFILIAL.AsString := Filial;
  cdsContas_ReceberSITUACAO.AsString := '0';
  cdsContas_ReceberEMISSAO.AsDateTime := __SuperClass.User.DataBase;
  cdsContas_ReceberFLUXO.AsString := VB_SIM;
  cdsContas_ReceberTIPODESCONTO.AsString := '0';
  cdsContas_ReceberEMPRESAORIGEM.AsString := __SuperClass.User.Company.Code;
  cdsContas_ReceberFILIALORIGEM.AsString := __SuperClass.User.Branch.Code;
  cdsContas_ReceberORIGEM.AsString := 'CRE';
  cdsContas_ReceberSELECIONADO.AsString := VB_NAO;
  cdsContas_ReceberDATACRIACAO.AsDateTime := __SuperClass.ServerDateTime;
end;

procedure TfrmContas_Receber.cdsContas_ReceberPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  __SuperClass.GenericsF.ShowException(E);
  Action := daAbort;
end;

procedure TfrmContas_Receber.cdsContas_ReceberReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TfrmContas_Receber.ShowFields;
begin
  inherited;
  with dbcboSituacao do
    ItemIndex := Items.IndexOfName(cdsContas_ReceberSITUACAO.AsString);
  with dbcboTipo do
    ItemIndex := Items.IndexOfName(cdsContas_ReceberTIPO.AsString);
  with dbcboFluxo do
    ItemIndex := Items.IndexOfName(cdsContas_ReceberFLUXO.AsString);
  with dbcboFormaPagamento do
    ItemIndex := Items.IndexOfName(cdsContas_ReceberFORMAPAGAMENTO.AsString);
  with dbcboTipoDesconto do
    ItemIndex := Items.IndexOfName(cdsContas_ReceberTIPODESCONTO.AsString);
  with dbcboEmpresaOrigem do
    ItemIndex := Items.IndexOfName(cdsContas_ReceberEMPRESAORIGEM.AsString);
  with dbcboFilialOrigem do
    ItemIndex := Items.IndexOfName(cdsContas_ReceberFILIALORIGEM.AsString);
  with dbcboTipoCobranca do
    ItemIndex := Items.IndexOfName(cdsContas_ReceberTIPOCOBRANCA.AsString);
end;

procedure TfrmContas_Receber.dbGridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (Column.Field = cdsContas_ReceberSITUACAO) then
  begin
    dbGrid.Canvas.FillRect(Rect);
    if cdsContas_ReceberSITUACAO.AsString = CR_EM_ABERTO then
      imgLegendas.Draw(dbGrid.Canvas, Rect.Left + (((Rect.Right - Rect.Left) - 16) div 2), Rect.Top + 1, GREEN_LEGEND_ICON)
    else if cdsContas_ReceberSITUACAO.AsString = CR_BAIXADO_PARCIAL then
      imgLegendas.Draw(dbGrid.Canvas, Rect.Left + (((Rect.Right - Rect.Left) - 16) div 2), Rect.Top + 1, BLUE_LEGEND_ICON)
    else if cdsContas_ReceberSITUACAO.AsString = CR_BAIXADO_TOTAL then
      imgLegendas.Draw(dbGrid.Canvas, Rect.Left + (((Rect.Right - Rect.Left) - 16) div 2), Rect.Top + 1, RED_LEGEND_ICON);
  end;
end;

procedure TfrmContas_Receber.cdsContas_Receber_RateiosDeleteError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  __SuperClass.GenericsF.ShowException(E);
  Action := daAbort;
end;

procedure TfrmContas_Receber.cdsContas_Receber_RateiosEditError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  __SuperClass.GenericsF.ShowException(E);
  Action := daAbort;
end;

procedure TfrmContas_Receber.cdsContas_Receber_RateiosPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  __SuperClass.GenericsF.ShowException(E);
  Action := daAbort;
end;

procedure TfrmContas_Receber.spdBancosClick(Sender: TObject);
var
  AFields: TUStringArray;
  SFields: TUStringArray;
begin
  inherited;
  frmBancos := TfrmBancos.Create(Self);
  try
    cdsContas_ReceberBANCO.OnValidate := Nil;
    cdsContas_ReceberAGENCIA.OnValidate := Nil;
    cdsContas_ReceberCONTA.OnValidate := Nil;
    // campos que receberão os dados
    SetLength(AFields, 4);
    AFields[0] := 'BANCO';
    AFields[1] := 'AGENCIA';
    AFields[2] := 'CONTA';
    AFields[3] := 'NOMEBANCO';
    // campos que proverão os dados
    SetLength(SFields, 4);
    SFields[0] := 'CODIGO';
    SFields[1] := 'AGENCIA';
    SFields[2] := 'CONTA';
    SFields[3] := 'REDUZIDO';
    __SuperClass.DBFunctions.ApplyFieldsInDataSet(frmBancos, frmBancos.cdsBancos, frmBancos.dtsBancos, ActivedDataSet,
      AFields, SFields);
  finally
    FreeAndNil(frmBancos);
    cdsContas_ReceberBANCO.OnValidate := cdsContas_ReceberBANCOValidate;
    cdsContas_ReceberAGENCIA.OnValidate := cdsContas_ReceberBANCOValidate;
    cdsContas_ReceberCONTA.OnValidate := cdsContas_ReceberBANCOValidate;
  end;
end;

procedure TfrmContas_Receber.spdbtnCCClick(Sender: TObject);
var
  AFields: TUStringArray;
  SFields: TUStringArray;
begin
  inherited;
  frmCentros_Custos := TfrmCentros_Custos.Create(Self);
  try
    // campos que receberão os dados
    SetLength(AFields, 2);
    AFields[0] := 'CC';
    AFields[1] := 'DESCRICAOCC';
    // campos que proverão os dados
    SetLength(SFields, 2);
    SFields[0] := 'CODIGO';
    SFields[1] := 'DESCRICAO';
    __SuperClass.DBFunctions.ApplyFieldsInDataSet(frmCentros_Custos, frmCentros_Custos.cdsCentros_Custos,
      frmCentros_Custos.dtsCentros_Custos, ActivedDataSet, AFields, SFields);
  finally
    FreeAndNil(frmCentros_Custos);
  end;
end;

procedure TfrmContas_Receber.cdsContas_Receber_RateiosBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if (MessageBox(Application.Handle, 'Deseja excluir o registro?', 'Pergunta', MB_YESNO + MB_ICONQUESTION) <> IDYES) then
    Abort
end;

procedure TfrmContas_Receber.cdsContas_Receber_RateiosNewRecord(DataSet: TDataSet);
begin
  inherited;
  // inicializando as variaveis dos contatos do fornecedor
  cdsContas_Receber_RateiosDATACRIACAO.AsDateTime := __SuperClass.ServerDateTime;
end;

procedure TfrmContas_Receber.dbedtEmissaoDblClick(Sender: TObject);
begin
  inherited;
  __SuperClass.DBFunctions.ShowCalendar(Sender, cdsContas_ReceberEMISSAO);
end;

procedure TfrmContas_Receber.cdsContas_ReceberVALORChange(Sender: TField);
begin
  inherited;
  try
    cdsContas_ReceberVALOR.OnChange := Nil;
    CalculaValorLiquido(Sender.AsCurrency);
  finally
    cdsContas_ReceberVALOR.OnChange := cdsContas_ReceberVALORChange;
  end;
end;

procedure TfrmContas_Receber.cdsContas_ReceberVALORJUROSValidate(
  Sender: TField);
begin
  inherited;
  //
end;

procedure TfrmContas_Receber.cdsContas_ReceberVALORMULTAValidate(
  Sender: TField);
begin
  inherited;
  //
end;

procedure TfrmContas_Receber.cdsContas_ReceberVALORValidate(Sender: TField);
begin
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    try
      if Sender.AsCurrency <= 0 then
        raise Exception.Create('Não é permitido valor zero ou negativo!')
    except
      on E: Exception do
      begin
        __SuperClass.GenericsF.DisplayMessage(E.Message, '', 'Informe valores positivos.', 'Informação', MB_ICONEXCLAMATION);
        Abort;
      end;
    end;
  end;
end;

procedure TfrmContas_Receber.cdsContas_Receber_RateiosBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (not __SuperClass.DBFunctions.CheckRequiredFields(DataSet)) then
    Abort
end;

procedure TfrmContas_Receber.cdsContas_Receber_RateiosPERCENTUALValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
    cdsContas_Receber_RateiosVALOR.AsCurrency :=
      (cdsContas_ReceberVALOR.AsCurrency * cdsContas_Receber_RateiosPERCENTUAL.AsFloat) * 0.01;
end;

procedure TfrmContas_Receber.dbGridRateiosEditButtonClick(Sender: TObject);
var
  AFields: TUStringArray;
  SFields: TUStringArray;
begin
  inherited;
  if (dbGridRateios.SelectedField = cdsContas_Receber_RateiosCATEGORIA) then
  begin
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
        frmCategorias_Financeiras.dtsCategorias, cdsContas_Receber_Rateios, AFields, SFields);
    finally
      FreeAndNil(frmCategorias_Financeiras);
    end;
  end;
end;

procedure TfrmContas_Receber.FormShow(Sender: TObject);
var
  Lista: TStringList;
begin
  inherited;
  // atribuindo os estados brasileiros em dbcboUF
  Lista := TStringList.Create;
  try
    __SuperClass.DBFunctions.GetListItems(TL_TIPOS_TITULOS, Lista);
    dbcboTipo.Items.AddStrings(Lista);
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
  // atribuindo os estados brasileiros em dbcboUF
  Lista := TStringList.Create;
  try
    // sysGetAllCompanies(Lista);
    dbcboEmpresaOrigem.Items.AddStrings(Lista);
    // sysGetAllBranches(Lista);
    dbcboFilialOrigem.Items.AddStrings(Lista);
  finally
    FreeAndNil(Lista);
  end;

  // Situacao de cobranca
  try
    Lista := TStringList.Create;
    __SuperClass.DBFunctions.GetListItems(TL_SITUACAO_COBRANCA, Lista);
    dbcboTipoCobranca.Items.AddStrings(Lista);
  finally
    FreeAndNil(Lista);
  end;
end;

procedure TfrmContas_Receber.ImprimeBoleto;
var
  SQL: WideString;
  CobreBemX: Variant;
  Boleto: Variant;
  EmailSacado: Variant;
  ProximoNumero: String;
  TOwner: TUEntityOwnerArray;
  Demonstrativo: String;
  Instrucoes: String;
  Confirmacao: Integer;
  StreamLicenca: TMemoryStream;
  ArquivoLicencaCobreBemX: String;
  ImagemBoleto: String;
  CodigoAgenciaCustomizado: function(CodigoAgencia: String): String;
  NumeroContaCorrenteCustomizado: function(NumeroContaCorrente: String): String;
  CodigoCedenteCustomizado: function(CodigoCedente: String): String;
  NossoNumeroCustomizado: function(cdsBanco: TClientDataSet): String;
  I: Integer;
  lStrAux: string;
begin
  inherited;
  SetLength(TOwner, 2);
  TOwner[0].Name := 'CLIENTES';
  TOwner[1].Name := 'BANCOS';
  __SuperClass.DBFunctions.GetEntityOwner(TOwner);

  try
    SQL := 'SELECT CPF, NOME, PESSOA, ENDERECO, NUMERO, BAIRRO, MUNICIPIO, UF, CEP, CNPJ ,EMAIL ';
    SQL := SQL + 'FROM CLIENTES WHERE EMPRESA = :EMPRESA AND FILIAL = :FILIAL AND CODIGO = :CLIENTE ';

    with cdsClientes, cdsClientes.Params do
    begin
      CommandText := SQL;

      with ParamByName('EMPRESA') do
      begin
        DataType := ftString;
        ParamType := ptInput;
        AsString := TOwner[0].Company;
      end;
      with ParamByName('FILIAL') do
      begin
        DataType := ftString;
        ParamType := ptInput;
        AsString := TOwner[0].Branch;
      end;
      with ParamByName('CLIENTE') do
      begin
        DataType := ftInteger;
        ParamType := ptInput;
        AsInteger := cdsContas_ReceberCLIENTE.AsInteger;
      end;

      __SuperClass.DBFunctions.OpenDataSet(cdsClientes, False, False, -1);
    end;

    SQL := 'SELECT * FROM BANCOS WHERE EMPRESA = :EMPRESA AND FILIAL = :FILIAL AND CODIGO = :BANCO AND AGENCIA = :AGENCIA AND CONTA = :CONTA';

    with cdsBancos, cdsBancos.Params do
    begin
      CommandText := SQL;

      with ParamByName('EMPRESA') do
      begin
        DataType := ftString;
        ParamType := ptInput;
        AsString := TOwner[1].Company;
      end;
      with ParamByName('FILIAL') do
      begin
        DataType := ftString;
        ParamType := ptInput;
        AsString := TOwner[1].Branch;
      end;
      with ParamByName('BANCO') do
      begin
        DataType := ftInteger;
        ParamType := ptInput;
        AsInteger := cdsContas_ReceberBANCO.AsInteger;
      end;
      with ParamByName('AGENCIA') do
      begin
        DataType := ftString;
        ParamType := ptInput;
        AsString := cdsContas_ReceberAGENCIA.AsString;
      end;
      with ParamByName('CONTA') do
      begin
        DataType := ftString;
        ParamType := ptInput;
        AsString := cdsContas_ReceberCONTA.AsString;
      end;

      __SuperClass.DBFunctions.OpenDataSet(cdsBancos, False, False, -1);
    end;

    if ((cdsClientes.BOF) and (cdsClientes.Eof)) or ((cdsBancos.BOF) and (cdsBancos.Eof)) then
      __SuperClass.GenericsF.DisplayMessage('Não existem dados a serem exibidos', '', 'Verifique o filtro informado.',
        'Informação', MB_ICONEXCLAMATION)
    else
    begin
      CobreBemX := CreateOleObject('CobreBemX.ContaCorrente');
      try

        ArquivoLicencaCobreBemX := cdsBancosLICENCACOBREBEMX.AsString;
        if FileExists(Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), ArquivoLicencaCobreBemX]))
        then
          CobreBemX.ArquivoLicenca := Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA),
            ArquivoLicencaCobreBemX])
        else
        begin
          try
            StreamLicenca := __SuperClass.GenericsF.LoadRemoteFile('System', ArquivoLicencaCobreBemX);
            StreamLicenca.SaveToFile(Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA),
              ArquivoLicencaCobreBemX]));

            CobreBemX.ArquivoLicenca := Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA),
              ArquivoLicencaCobreBemX]);
          finally
            StreamLicenca.Free;
          end;
        end;
        // Dados da conta
        I := 0;
        TryStrToInt(cdsBancosCODIGOCEDENTE.AsString, I);
        CobreBemX.CodigoCedente := Format('%s', [FormatFloat('000000000000000', I)]);
        case StrToIntDef(cdsBancosCODIGO.AsString, 0) of
          237: // Bradesco
            begin
              TryStrToInt(cdsContas_ReceberAGENCIA.AsString, I);
              CobreBemX.CodigoAgencia := Format('%s-%s', [FormatFloat('0000', I), cdsBancosDVAGENCIA.AsString]);
              TryStrToInt(cdsContas_ReceberCONTA.AsString, I);
              CobreBemX.NumeroContaCorrente := Format('%s-%s', [FormatFloat('0000000', I), cdsBancosDVCONTA.AsString]);
            end;
          341: //Itaú
            begin
              TryStrToInt(cdsContas_ReceberAGENCIA.AsString, I);
              CobreBemX.CodigoAgencia := Format('%s', [FormatFloat('0000', I)]);
              TryStrToInt(cdsContas_ReceberCONTA.AsString, I);
              CobreBemX.NumeroContaCorrente := Format('%s-%s', [FormatFloat('00000', I), cdsBancosDVCONTA.AsString]);
            end;
          33: //Santander
            begin
              TryStrToInt(cdsContas_ReceberAGENCIA.AsString, I);
              CobreBemX.CodigoAgencia := Format('%s-%s', [FormatFloat('0000', I), cdsBancosDVAGENCIA.AsString]);;
              TryStrToInt(cdsContas_ReceberCONTA.AsString, I);
              CobreBemX.NumeroContaCorrente := Format('%s-%s', [FormatFloat('000000000', I), cdsBancosDVCONTA.AsString]);
              TryStrToInt(cdsBancosCODIGOCEDENTE.AsString, I);
              lStrAux:= FormatFloat('0000000', I);
              CobreBemX.CodigoCedente := Format('%s-%s', [Copy(lStrAux, 1, 6), Copy(lStrAux, 7, 1)]);

              //Thiago disse que vai criar um campo para substituir o campo de observação
              TryStrToInt(cdsBancosOBSERVACAO.AsString, I);
              CobreBemX.OutroDadoConfiguracao1 := Format('%s', [FormatFloat('00000000000000000000', I)]);
            end;
        else
          begin
            TryStrToInt(cdsContas_ReceberAGENCIA.AsString, I);
            CobreBemX.CodigoAgencia := Format('%s%s', [FormatFloat('0000', I), cdsBancosDVAGENCIA.AsString]);
            TryStrToInt(cdsContas_ReceberCONTA.AsString, I);
            CobreBemX.NumeroContaCorrente := Format('%s%s', [FormatFloat('0000000', I), cdsBancosDVAGENCIA.AsString]);
          end;
        end;

        if (__SuperClass.GetPackage(BPL_ACCUSTOMS).Handle <> 0) then
        begin
          //
          @CodigoAgenciaCustomizado := GetProcAddress(__SuperClass.GetPackage(BPL_ACCUSTOMS).Handle,
            PChar('CodigoAgenciaCustomizado'));
          if Assigned(CodigoAgenciaCustomizado) then
            CobreBemX.CodigoAgencia := CodigoAgenciaCustomizado(CobreBemX.CodigoAgencia);
          //
          @NumeroContaCorrenteCustomizado := GetProcAddress(__SuperClass.GetPackage(BPL_ACCUSTOMS).Handle,
            PChar('NumeroContaCorrenteCustomizado'));
          if Assigned(NumeroContaCorrenteCustomizado) then
            CobreBemX.CodigoConta := NumeroContaCorrenteCustomizado(CobreBemX.NumeroContaCorrente);
          //
          @CodigoCedenteCustomizado := GetProcAddress(__SuperClass.GetPackage(BPL_ACCUSTOMS).Handle,
            PChar('CodigoCedenteCustomizado'));
          if Assigned(CodigoCedenteCustomizado) then
            CobreBemX.CodigoCedente := CodigoCedenteCustomizado(CobreBemX.CodigoCedente);
        end;
        // Dados nosso número
        CobreBemX.InicioNossoNumero := cdsBancosINICIONUMERO.AsString;
        CobreBemX.FimNossoNumero := cdsBancosFIMNUMERO.AsString;
        CobreBemX.ProximoNossoNumero := cdsBancosPROXIMONUMERO.AsString;

        if StrToIntDef(cdsBancosCODIGO.AsString, 0) <> 33 then
          CobreBemX.OutroDadoConfiguracao1 := cdsBancosVARIACAOCARTEIRA.AsString;

        ImagemBoleto := cdsBancosCODIGO.AsString;
        if Length(ImagemBoleto) = 1 then
          ImagemBoleto := '00' + ImagemBoleto
        else if Length(ImagemBoleto) = 2 then
          ImagemBoleto := '0' + ImagemBoleto;
        ImagemBoleto := ImagemBoleto + '.jpg';

        if FileExists(Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), ImagemBoleto])) then
          LicencaCobreBemX.LogoTipo := Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA),
            ImagemBoleto])
        else
          begin
            try
              StreamLicenca := __SuperClass.GenericsF.LoadRemoteFile('Images', ImagemBoleto);
              StreamLicenca.SaveToFile(Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA),
                ImagemBoleto]));
              LicencaCobreBemX.LogoTipo := Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA),
                ImagemBoleto]);
            finally
              StreamLicenca.Free;
            end;
          end;

        CobreBemX.PadroesBoleto.PadroesBoletoImpresso.ArquivoLogotipo := LicencaCobreBemX.LogoTipo;
        // CobreBemX.PadroesBoleto.PadroesBoletoImpresso.CaminhoImagensCodigoBarras := Format('%s\', [sysGetImagesPath]) ;

        CobreBemX.PadroesBoleto.PadroesBoletoImpresso.CaminhoImagensCodigoBarras :=
          Format('%s\', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA)]);
        CobreBemX.PadroesBoleto.IdentificacaoCedente := cdsBancosCODIGOCEDENTE.AsString;
        CobreBemX.PadroesBoleto.PadroesBoletoImpresso.MargemSuperior := 3;

        CobreBemX.DocumentosCobranca.Clear;
        Boleto := CobreBemX.DocumentosCobranca.Add;
        Boleto.NumeroDocumento := cdsContas_ReceberNUMERO.AsString;
        Boleto.NomeSacado := cdsClientesNOME.AsString;
        Boleto.EnderecoSacado := cdsClientesENDERECO.AsString;
        Boleto.BairroSacado := cdsClientesBAIRRO.AsString;
        Boleto.CidadeSacado := cdsClientesMUNICIPIO.AsString;
        Boleto.TipoDocumentoCobranca := cdsContas_ReceberTIPO.AsString;

        if (cdsClientesPESSOA.AsString = '1') then
          Boleto.CNPJSacado := cdsClientesCNPJ.AsString
        else
          Boleto.CPFSacado := cdsClientesCPF.AsString;

        Boleto.EstadoSacado := cdsClientesUF.AsString;
        Boleto.CepSacado := cdsClientesCEP.AsString;
        Boleto.DataDocumento := FormatDateTime('dd/mm/yyyy', cdsContas_ReceberEMISSAO.AsDateTime);
        Boleto.DataVencimento := FormatDateTime('dd/mm/yyyy', cdsContas_ReceberVENCIMENTO.AsDateTime);
        Boleto.ValorDocumento := cdsContas_ReceberSALDO.AsFloat;
        Boleto.PercentualJurosDiaAtraso := cdsContas_ReceberJUROS.AsFloat;
        Boleto.ValorDesconto := cdsContas_ReceberDECRESCIMO.AsFloat;
        Boleto.ValorOutrosAcrescimos := cdsContas_ReceberACRESCIMO.AsFloat;

        Demonstrativo := cdsBancosDEMONSTRATIVO.AsString;
        Demonstrativo := StringReplace(Demonstrativo, '%PREFIXO%', Format('[%s]', [cdsContas_ReceberPREFIXO.AsString]),
          [rfReplaceAll]);
        Demonstrativo := StringReplace(Demonstrativo, '%NOTA%', Format('[%s]', [cdsContas_ReceberNUMERO.AsString]),
          [rfReplaceAll]);
        Demonstrativo := StringReplace(Demonstrativo, '%IDCNAB%', Format('[%s]', [cdsContas_ReceberIDCNAB.AsString]),
          [rfReplaceAll]);
        Boleto.PadroesBoleto.Demonstrativo := Demonstrativo;

        Instrucoes := cdsBancosINSTRUCAOBANCARIA.AsString;
        Instrucoes := StringReplace(Instrucoes, '%PREFIXO%', Format('[%s]', [cdsContas_ReceberPREFIXO.AsString]),
          [rfReplaceAll]);;
        Instrucoes := StringReplace(Instrucoes, '%NOTA%', Format('[%s]', [cdsContas_ReceberNUMERO.AsString]), [rfReplaceAll]);;
        Demonstrativo := StringReplace(Instrucoes, '%IDCNAB%', Format('[%s]', [cdsContas_ReceberIDCNAB.AsString]),
          [rfReplaceAll]);
        Boleto.PadroesBoleto.InstrucoesCaixa := Instrucoes;

        if cdsContas_ReceberNOSSONUMERO.AsString = '' then
        begin
          if (__SuperClass.GetPackage(BPL_ACCUSTOMS).Handle <> 0) then
          begin
            @NossoNumeroCustomizado := GetProcAddress(__SuperClass.GetPackage(BPL_ACCUSTOMS).Handle,
              PChar('NossoNumeroCustomizado'));
            if Assigned(NossoNumeroCustomizado) then
            begin
              cdsContas_Receber.Edit;
              cdsContas_ReceberNOSSONUMERO.AsString := NossoNumeroCustomizado(cdsBancos);
              cdsContas_Receber.Post;
              __SuperClass.DBFunctions.dbApply(cdsContas_Receber);
              ProximoNumero := IntToStr(StrToInt64(cdsBancosPROXIMONUMERO.AsString) + 1);
              cdsBancos.Edit;
              cdsBancosPROXIMONUMERO.AsString := ProximoNumero;
              cdsBancos.Post;
              __SuperClass.DBFunctions.dbApply(cdsBancos);
            end
            else
            begin
              cdsContas_Receber.Edit;
              cdsContas_ReceberNOSSONUMERO.AsString := cdsBancosPROXIMONUMERO.AsString;
              cdsContas_Receber.Post;
              __SuperClass.DBFunctions.dbApply(cdsContas_Receber);
              ProximoNumero := IntToStr(StrToInt64(cdsBancosPROXIMONUMERO.AsString) + 1);
              cdsBancos.Edit;
              cdsBancosPROXIMONUMERO.AsString := ProximoNumero;
              cdsBancos.Post;
              __SuperClass.DBFunctions.dbApply(cdsBancos);
            end;
          end
          else
          begin
            cdsContas_Receber.Edit;
            cdsContas_ReceberNOSSONUMERO.AsString := cdsBancosPROXIMONUMERO.AsString;
            cdsContas_Receber.Post;
            __SuperClass.DBFunctions.dbApply(cdsContas_Receber);
            ProximoNumero := IntToStr(StrToInt64(cdsBancosPROXIMONUMERO.AsString) + 1);
            cdsBancos.Edit;
            cdsBancosPROXIMONUMERO.AsString := ProximoNumero;
            cdsBancos.Post;
            __SuperClass.DBFunctions.dbApply(cdsBancos);
          end;
        end;

        Boleto.NossoNumero := cdsContas_ReceberNOSSONUMERO.AsString;

        CobreBemX.PadroesBoleto.PadroesBoletoEmail.URLImagensCodigoBarras := 'http://www.bptob.com/imagenscbe/';
        CobreBemX.PadroesBoleto.PadroesBoletoEmail.URLLogotipo := 'http://www.cobrebemx.com/banners/BannerCBX.gif';
        CobreBemX.PadroesBoleto.PadroesBoletoEmail.PadroesEmail.Assunto := 'Boleto de Cobrança - ' +
          __SuperClass.User.Branch.FullName;
        CobreBemX.PadroesBoleto.PadroesBoletoEmail.PadroesEmail.FormaEnvio := 0;
        CobreBemX.PadroesBoleto.PadroesBoletoEmail.SMTP.Porta := 25;
        CobreBemX.PadroesBoleto.PadroesBoletoEmail.SMTP.Servidor := __SuperClass.User.SMTPServer;
        CobreBemX.PadroesBoleto.PadroesBoletoEmail.SMTP.Usuario := __SuperClass.User.MailAccount;
        CobreBemX.PadroesBoleto.PadroesBoletoEmail.SMTP.Senha := __SuperClass.User.MailPassword;

        CobreBemX.ConfiguraContaCorrente;
        CobreBemX.CalcularDadosBoletos;
        CobreBemX.ImprimeBoletos;

        Confirmacao := MessageDlg('Deseja Enviar por Email o Boleto?', mtWarning, mbOKCancel, 0);

        if (Confirmacao = mrOK) then
        begin
          EmailSacado := Boleto.EnderecosEmailSacado.Add;
          EmailSacado.Endereco := InputBox('Digite o Email', 'Entre com o Email do Destinatário', cdsClientesEMAIL.AsString);
          CobreBemX.EnviaBoletosPorEmail;
        end;

      finally
        CobreBemX := Unassigned;
      end;
    end;
{$ENDREGION}
  except
    on E: Exception do
      __SuperClass.GenericsF.DisplayMessage('Falha na impressão do boleto bancário.', Format('%s.', [E.Message]),
        'Verifique os dados do título em questão', 'Informação', MB_ICONEXCLAMATION);
  end;
end;

procedure TfrmContas_Receber.cdsContas_Receber_RateiosReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TfrmContas_Receber.VerificaRateios;
var
  Mark: TBookMark;
  TotalRateio: Single;
begin
  Mark := Nil;
  TotalRateio := 0;
  with cdsContas_Receber_Rateios do
  begin
    if (RecordCount > 0) then
      try
        Mark := GetBookMark;
        First;
        while (not Eof) do
        begin
          TotalRateio := TotalRateio + cdsContas_Receber_RateiosPERCENTUAL.AsFloat;
          Next;
        end;
        if ((100 - TotalRateio) <> 0) then
        begin
          __SuperClass.GenericsF.DisplayMessage('Os rateios para o título em questão não totalizam 100%.', '',
            'Verifique os percentuais dos rateios.', 'Informação', MB_ICONEXCLAMATION);
          Abort;
        end;
      finally
        GotoBookMark(Mark);
        FreeBookMark(Mark);
      end;
  end;
end;

procedure TfrmContas_Receber.cdsContas_ReceberVENCIMENTOValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
    cdsContas_ReceberVENCIMENTOREAL.AsDateTime := __SuperClass.GenericsF.DiaUtil(Sender.AsDateTime);
end;

procedure TfrmContas_Receber.cdsContas_ReceberVENDEDORValidate(Sender: TField);
const
  Entidade = 'VENDEDORES';
var
  Empresa: String;
  Filial: String;
  Campos: String;
  Filtro: String;
  Auxiliar: TDataSet;
  Continua: Boolean;
begin
  Continua := True;
  try
    if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
    begin
      if (Sender.AsInteger <> 0) then
      begin
        try
          __SuperClass.DBFunctions.GetEntityOwner(Entidade, Empresa, Filial);
          Filtro := Format('EMPRESA = %s AND FILIAL = %s AND CODIGO = %d', [QuotedStr(Empresa), QuotedStr(Filial),
            Sender.AsInteger]);
          Continua := __SuperClass.GenericsF.RegistroHabilitado(Entidade, Filtro, '');
          if (Continua) then
          begin
            Campos := 'REDUZIDO';
            Auxiliar := __SuperClass.DBFunctions.ExecuteQueryByXML(Campos, Entidade, Filtro, '');
            if (Auxiliar.BOF) and (Auxiliar.Eof) then
            begin
              __SuperClass.GenericsF.DisplayMessage('Vendedor não encontrado.', '', 'Verifique o código informado.', 'Informação',
                MB_ICONEXCLAMATION);
              Continua := False;
            end
            else
              cdsContas_ReceberNOMEVENDEDOR.AsString := Auxiliar.FieldByName('REDUZIDO').AsString;
          end;
        finally
          Auxiliar.Close;
          FreeAndNil(Auxiliar);
        end;
      end;
    end;
  except
    on E: Exception do
    begin
      __SuperClass.GenericsF.DisplayMessage('Falha ao pesquisar o vendedor.', E.Message, 'Verifique o valor informado.',
        'Informação', MB_ICONEXCLAMATION);
      Continua := False;
    end;
  end;
  if not Continua then
    Abort;
end;

procedure TfrmContas_Receber.cdsContas_ReceberTIPOChange(Sender: TField);
begin
  inherited;
  if (Sender.AsString <> '') and (Pos('=', Sender.AsString) > 0) then
    Sender.Value := __SuperClass.GenericsF.GetValueFromList(Sender.Value);
end;

procedure TfrmContas_Receber.spdClientesClick(Sender: TObject);
var
  AFields: TUStringArray;
  SFields: TUStringArray;
begin
  inherited;
  frmClientes := TfrmClientes.Create(Self);
  try
    // campos que receberão os dados
    SetLength(AFields, 2);
    AFields[0] := 'CLIENTE';
    AFields[1] := 'NOMECLIENTE';
    // campos que proverão os dados
    SetLength(SFields, 2);
    SFields[0] := 'CODIGO';
    SFields[1] := 'REDUZIDO';
    __SuperClass.DBFunctions.ApplyFieldsInDataSet(frmClientes, frmClientes.cdsClientes, frmClientes.dtsClientes, ActivedDataSet,
      AFields, SFields);
  finally
    FreeAndNil(frmClientes);
  end;
end;

procedure TfrmContas_Receber.spdCategoriasClick(Sender: TObject);
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

procedure TfrmContas_Receber.spdVendedoresClick(Sender: TObject);
var
  AFields: TUStringArray;
  SFields: TUStringArray;
begin
  inherited;
  frmVendedores := TfrmVendedores.Create(Self);
  try
    // campos que receberão os dados
    SetLength(AFields, 2);
    AFields[0] := 'VENDEDOR';
    AFields[1] := 'NOMEVENDEDOR';
    // campos que proverão os dados
    SetLength(SFields, 2);
    SFields[0] := 'CODIGO';
    SFields[1] := 'REDUZIDO';
    __SuperClass.DBFunctions.ApplyFieldsInDataSet(frmVendedores, frmVendedores.cdsVendedores, frmVendedores.dtsVendedores,
      ActivedDataSet, AFields, SFields);
  finally
    FreeAndNil(frmVendedores);
  end;
end;

procedure TfrmContas_Receber.spdMoedasClick(Sender: TObject);
var
  AFields: TUStringArray;
  SFields: TUStringArray;
begin
  inherited;
  frmMoedas := TfrmMoedas.Create(Self);
  try
    // campos que receberão os dados
    SetLength(AFields, 2);
    AFields[0] := 'MOEDA';
    AFields[1] := 'DESCRICAOMOEDA';
    // campos que proverão os dados
    SetLength(SFields, 2);
    SFields[0] := 'CODIGO';
    SFields[1] := 'DESCRICAO';
    __SuperClass.DBFunctions.ApplyFieldsInDataSet(frmMoedas, frmMoedas.cdsMoedas, frmMoedas.dtsMoedas, ActivedDataSet,
      AFields, SFields);
  finally
    FreeAndNil(frmMoedas);
  end;
end;

procedure TfrmContas_Receber.dbedtVencimentoDblClick(Sender: TObject);
begin
  inherited;
  __SuperClass.DBFunctions.ShowCalendar(Sender, cdsContas_ReceberVENCIMENTO);
end;

procedure TfrmContas_Receber.dbedtVencimentoRealDblClick(Sender: TObject);
begin
  inherited;
  __SuperClass.DBFunctions.ShowCalendar(Sender, cdsContas_ReceberVENCIMENTOREAL);
end;

procedure TfrmContas_Receber.actCopiar_RegistroExecute(Sender: TObject);
var
  CpoDados: TUStringArray;
begin
  inherited;
  try
    Copying := True;

    SetLength(CpoDados, 7);
    CpoDados[0] := 'EMPRESA';
    CpoDados[1] := 'FILIAL';
    CpoDados[2] := 'EMISSAO';
    CpoDados[3] := 'PREFIXO';
    CpoDados[4] := 'NUMERO';
    CpoDados[5] := 'PARCELA';
    CpoDados[6] := 'DATACRIACAO';

    if not __SuperClass.DBFunctions.CloneReg(cdsContas_Receber, CpoDados, False) then
      __SuperClass.GenericsF.DisplayMessage('Falha ao copiar.', '', 'Verifique o título a receber.', 'Informação',
        MB_ICONEXCLAMATION)
    else
      PageControl.ActivePage := tbsCadastrais;
  finally
    Copying := False;
  end;
end;

procedure TfrmContas_Receber.actCopy_RecnoExecute(Sender: TObject);
var
  CpoDados: TUStringArray;
begin
  inherited;
  try
    Copying := True;

    SetLength(CpoDados, 8);
    CpoDados[0] := 'EMPRESA';
    CpoDados[1] := 'FILIAL';
    CpoDados[2] := 'EMISSAO';
    CpoDados[3] := 'PREFIXO';
    CpoDados[4] := 'NUMERO';
    CpoDados[5] := 'PARCELA';
    CpoDados[6] := 'DATACRIACAO';
    CpoDados[7] := 'SITUACAO';

    if not __SuperClass.DBFunctions.CloneReg(cdsContas_Receber, CpoDados, False) then
      __SuperClass.GenericsF.DisplayMessage('Falha ao copiar.', '', 'Verifique o título a receber.', 'Informação',
        MB_ICONEXCLAMATION)
    else
      PageControl.ActivePage := tbsCadastrais;
    cdsContas_ReceberSALDO.AsFloat := cdsContas_ReceberVALOR.AsFloat;
  finally
    Copying := False;
  end;
end;

procedure TfrmContas_Receber.actImprimir_BoletoExecute(Sender: TObject);
begin
  inherited;
  if not(cdsContas_Receber.State in [dsInsert, dsEdit, dsInactive]) then
    ImprimeBoleto;
end;

procedure TfrmContas_Receber.actProjetarExecute(Sender: TObject);
begin
  inherited;
  frmContas_Receber_Projetar := TfrmContas_Receber_Projetar.Create(Self);
  try
    with frmContas_Receber_Projetar do
      ShowModal;
  finally
    FreeAndNil(frmContas_Receber_Projetar);
  end;
end;

procedure TfrmContas_Receber.cdsContas_ReceberBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  // Se o título estiver baixado, não deixar alterar
  if ((cdsContas_ReceberSITUACAO.AsString <> '0') and (cdsContas_ReceberSITUACAO.AsString <> '1')) then
  begin
    __SuperClass.GenericsF.DisplayMessage('Impossível alterar este título, pois o mesmo já sofreu baixa(s).', '',
      'Exclua a(s) baixa(s) realizada(s) para este título.', 'Informação', MB_ICONEXCLAMATION);
    Abort;
  end;
  if cdsContas_ReceberORIGEM.AsString <> 'CRE' then
    dbedtValor.Enabled := False
  else
    dbedtValor.Enabled := True;
end;

procedure TfrmContas_Receber.cdsContas_ReceberBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  dbedtValor.Enabled := True;
end;

procedure TfrmContas_Receber.cdsContas_Receber_RateiosCATEGORIAValidate(Sender: TField);
const
  Entidade = 'CATEGORIAS';
var
  Empresa: String;
  Filial: String;
  Campos: String;
  Filtro: String;
  Auxiliar: TDataSet;
  Continua: Boolean;
begin
  inherited;
  Continua := True;
  try
    if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
    begin
      if (Sender.AsString <> '') then
      begin
        try
          __SuperClass.DBFunctions.GetEntityOwner(Entidade, Empresa, Filial);
          Campos := 'DESCRICAO';
          Filtro := Format('EMPRESA = %s AND FILIAL = %s AND CODIGO = %s', [QuotedStr(Empresa), QuotedStr(Filial),
            QuotedStr(Sender.AsString)]);
          Auxiliar := __SuperClass.DBFunctions.ExecuteQueryByXML(Campos, Entidade, Filtro, '');
          if (Auxiliar.BOF) and (Auxiliar.Eof) then
          begin
            __SuperClass.GenericsF.DisplayMessage('Categoria financeira não encontrada.', '', 'Verifique o código informado.',
              'Informação', MB_ICONEXCLAMATION);
            Continua := False;
          end
          else
            cdsContas_Receber_RateiosDESCRICAOCATEGORIA.AsString := Auxiliar.FieldByName('DESCRICAO').AsString;
        finally
          Auxiliar.Close;
          FreeAndNil(Auxiliar);
        end;
      end;
    end;
  except
    on E: Exception do
    begin
      __SuperClass.GenericsF.DisplayMessage('Falha ao pesquisar a categoria financeira.', E.Message,
        'Verifique o valor informado.', 'Informação', MB_ICONEXCLAMATION);
      Continua := False;
    end;
  end;
  if not Continua then
    Abort;
end;

procedure TfrmContas_Receber.cdsContas_ReceberBeforeOpen(DataSet: TDataSet);
var
  Empresa: String;
  Filial: String;
begin
  inherited;
  __SuperClass.DBFunctions.GetEntityOwner('CLIENTES', Empresa, Filial);
  with cdsContas_Receber.Params do
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
end;

procedure TfrmContas_Receber.cdsContas_Receber_CobrancasBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if (MessageBox(Application.Handle, 'Deseja excluir o registro?', 'Pergunta', MB_YESNO + MB_ICONQUESTION) <> IDYES) then
    Abort
end;

procedure TfrmContas_Receber.cdsContas_Receber_CobrancasBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (not __SuperClass.DBFunctions.CheckRequiredFields(DataSet)) then
    Abort
end;

procedure TfrmContas_Receber.cdsContas_Receber_CobrancasDeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  inherited;
  __SuperClass.GenericsF.ShowException(E);
  Action := daAbort;
end;

procedure TfrmContas_Receber.cdsContas_Receber_CobrancasEditError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  __SuperClass.GenericsF.ShowException(E);
  Action := daAbort;
end;

procedure TfrmContas_Receber.cdsContas_Receber_CobrancasPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  __SuperClass.GenericsF.ShowException(E);
  Action := daAbort;
end;

procedure TfrmContas_Receber.cdsContas_Receber_CobrancasNewRecord(DataSet: TDataSet);
begin
  inherited;
  // inicializando as variaveis
  cdsContas_Receber_CobrancasSEQUENCIA.AsInteger := DetailItems;
  cdsContas_Receber_CobrancasDATA.AsDateTime := __SuperClass.User.DataBase;
  cdsContas_Receber_CobrancasUSUARIO.AsInteger := __SuperClass.User.id;
  cdsContas_Receber_CobrancasDATACRIACAO.AsDateTime := __SuperClass.ServerDateTime;
end;

procedure TfrmContas_Receber.dbgridCobrancasEditButtonClick(Sender: TObject);
begin
  inherited;
  if (dbgridCobrancas.SelectedField = cdsContas_Receber_CobrancasDATA) then
    __SuperClass.DBFunctions.ShowCalendar(Sender, cdsContas_Receber_CobrancasDATA);
end;

procedure TfrmContas_Receber.cdsContas_Receber_CobrancasBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  // obtendo o numero sequencial para o item de contatos de clientes
  DetailItems := __SuperClass.DBFunctions.GetNextNumber(DataSet, 'SEQUENCIA');
  //
end;

procedure TfrmContas_Receber.dtsContas_ReceberDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  ShowFields;
  // Habilita impressão de boletos
  // DEFInir   btnImprimir_Boleto.Enabled := (cdsContas_Receber.RecordCount > 0) and (LicencaCobreBemX.Habilitado);
end;

procedure TfrmContas_Receber.cdsContas_ReceberCalcFields(DataSet: TDataSet);
var CalculaJurosTitulo: function(cdsContas_Receber: TClientDataSet): Currency;
    Multa: Double;
    CalculaMultaTitulo: function(cdsContas_Receber: TClientDataSet): Currency;
begin
  inherited;
  cdsContas_ReceberVALORDESCONTO.AsCurrency := 0;
  cdsContas_ReceberVALORTAXAPERMANENCIA.AsCurrency := 0;

  try
    cdsContas_ReceberVALORMULTA.OnValidate := Nil;
    Multa := __SuperClass.DBFunctions.GetParamValue('SV_PERCENTUAL_MULTA_CR');
    if (__SuperClass.GetPackage(BPL_ACCUSTOMS).Handle <> 0) then
      begin
        @CalculaMultaTitulo := GetProcAddress(__SuperClass.GetPackage(BPL_ACCUSTOMS).Handle, 'CalculaMultaTituloCR');
        if Assigned(CalculaMultaTitulo) then
          cdsContas_ReceberVALORMULTA.AsCurrency := CalculaMultaTitulo(cdsContas_Receber)
        else
          cdsContas_ReceberVALORMULTA.AsCurrency := __SuperClass.GenericsF.CalculaMultaTitulo(cdsContas_ReceberVENCIMENTOREAL.AsDateTime, __SuperClass.GenericsF.DiaUtil(__SuperClass.User.DataBase),
                                                                                            cdsContas_ReceberSALDO.AsCurrency, Multa);
      end
    else
      cdsContas_ReceberVALORMULTA.AsCurrency := __SuperClass.GenericsF.CalculaMultaTitulo(cdsContas_ReceberVENCIMENTOREAL.AsDateTime, __SuperClass.GenericsF.DiaUtil(__SuperClass.User.DataBase),
                                                                                       cdsContas_ReceberSALDO.AsCurrency, Multa);
  finally
    cdsContas_ReceberVALORMULTA.OnValidate := cdsContas_ReceberVALORMULTAValidate;
  end;

  try
    cdsContas_ReceberVALORJUROS.OnValidate := Nil;
    if (__SuperClass.GetPackage(BPL_ACCUSTOMS).Handle <> 0) then
      begin
        @CalculaJurosTitulo := GetProcAddress(__SuperClass.GetPackage(BPL_ACCUSTOMS).Handle, 'CalculaJurosTituloCR');
        if Assigned(CalculaJurosTitulo) then
          cdsContas_ReceberVALORJUROS.AsCurrency := CalculaJurosTitulo(cdsContas_Receber)
        else
          cdsContas_ReceberVALORJUROS.AsCurrency := __SuperClass.GenericsF.CalculaJurosTitulo(cdsContas_ReceberVENCIMENTOREAL.AsDateTime, __SuperClass.GenericsF.DiaUtil(__SuperClass.User.DataBase),
          cdsContas_ReceberSALDO.AsCurrency, cdsContas_ReceberJUROS.AsFloat);
      end
    else
      cdsContas_ReceberVALORJUROS.AsCurrency := __SuperClass.GenericsF.CalculaJurosTitulo(cdsContas_ReceberVENCIMENTOREAL.AsDateTime, __SuperClass.GenericsF.DiaUtil(__SuperClass.User.DataBase),
      cdsContas_ReceberSALDO.AsCurrency, cdsContas_ReceberJUROS.AsFloat);
  finally
    cdsContas_ReceberVALORJUROS.OnValidate := cdsContas_ReceberVALORJUROSValidate;
  end;

  cdsContas_ReceberVALORCORRIGIDO.AsCurrency :=
  ((cdsContas_ReceberSALDO.AsCurrency + cdsContas_ReceberACRESCIMO.AsCurrency + cdsContas_ReceberVALORTAXAPERMANENCIA.AsCurrency + cdsContas_ReceberVALORJUROS.AsCurrency + cdsContas_ReceberVALORMULTA.AsCurrency)
   - (cdsContas_ReceberDECRESCIMO.AsCurrency+cdsContas_ReceberVALORDESCONTO.AsCurrency));
end;

procedure TfrmContas_Receber.cdsContas_ReceberCATEGORIAValidate(Sender: TField);
var
  ApplyFields: TApplyFields;
begin
  inherited;
  if not Copying then
  begin
    if (Sender.AsString <> '') then
    begin
      try
        ApplyFields := TApplyFields.Create(__SuperClass);
        ApplyFields.EntityName := 'CATEGORIAS';
        ApplyFields.SourceFilter := Format('CODIGO = %s', [QuotedStr(Sender.AsString)]);
        ApplyFields.SourceFList.Add('DESCRICAO');
        ApplyFields.CheckStatus := True;
        ApplyFields.ApplyFList.Add('DESCRICAOCATEGORIA');
        ApplyFields.ApplyDataSet := Sender.DataSet;
        if not ApplyFields.Execute then
        begin
          __SuperClass.GenericsF.DisplayMessage(ApplyFields.ResultMsg, '', 'Verifique o conteúdo do campo informado.',
            'Informação', MB_ICONINFORMATION);
          Abort;
        end;
      finally
        FreeAndNil(ApplyFields);
      end;

      try
        cdsContas_ReceberVALOR.OnChange := Nil;
        cdsContas_ReceberVALOR.OnValidate := Nil;
        CalculaValorLiquido(cdsContas_ReceberVALORORIGINAL.AsCurrency);
      finally
        cdsContas_ReceberVALOR.OnChange := cdsContas_ReceberVALORChange;
        cdsContas_ReceberVALOR.OnValidate := cdsContas_ReceberVALORValidate;
      end;

    end;
  end;
end;

procedure TfrmContas_Receber.cdsContas_ReceberCCValidate(Sender: TField);
var
  ApplyFields: TApplyFields;
begin
  inherited;
  if (Sender.AsString <> '') then
  begin
    try
      ApplyFields := TApplyFields.Create(__SuperClass);
      ApplyFields.EntityName := 'CENTROS_CUSTOS';
      ApplyFields.SourceFilter := Format('CODIGO = %s', [QuotedStr(Sender.AsString)]);
      ApplyFields.SourceFList.Add('DESCRICAO');
      ApplyFields.CheckStatus := False;
      ApplyFields.ApplyFList.Add('DESCRICAOCC');
      ApplyFields.ApplyDataSet := Sender.DataSet;
      if not ApplyFields.Execute then
      begin
        __SuperClass.GenericsF.DisplayMessage(ApplyFields.ResultMsg, '', 'Verifique o conteúdo do campo informado.', 'Informação',
          MB_ICONINFORMATION);
        Abort;
      end;
    finally
      FreeAndNil(ApplyFields);
    end;
  end;
end;

procedure TfrmContas_Receber.cdsContas_ReceberCLIENTEValidate(Sender: TField);
const
  Entidade = 'CLIENTES';
var
  Empresa: String;
  Filial: String;
  Campos: String;
  Filtro: String;
  Auxiliar: TDataSet;
  Continua: Boolean;
begin
  inherited;
  Continua := True;
  try
    if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
    begin
      if (Sender.AsInteger <> 0) then
      begin
        try
          __SuperClass.DBFunctions.GetEntityOwner(Entidade, Empresa, Filial);
          Filtro := Format('EMPRESA = %s AND FILIAL = %s AND CODIGO = %d', [QuotedStr(Empresa), QuotedStr(Filial),
            Sender.AsInteger]);
          Continua := __SuperClass.GenericsF.RegistroHabilitado(Entidade, Filtro, '');
          if (Continua) then
          begin
            Campos := 'REDUZIDO';
            Auxiliar := __SuperClass.DBFunctions.ExecuteQueryByXML(Campos, Entidade, Filtro, '');
            if (Auxiliar.BOF) and (Auxiliar.Eof) then
            begin
              __SuperClass.GenericsF.DisplayMessage('Cliente não encontrado.', '', 'Verifique o código informado.', 'Informação',
                MB_ICONEXCLAMATION);
              Continua := False;
            end
            else
              cdsContas_ReceberNOMECLIENTE.AsString := Auxiliar.FieldByName('REDUZIDO').AsString;
          end;
        finally
          Auxiliar.Close;
          FreeAndNil(Auxiliar);
        end;
      end;
    end;
  except
    on E: Exception do
    begin
      __SuperClass.GenericsF.DisplayMessage('Falha ao pesquisar o cliente.', E.Message, 'Verifique o valor informado.',
        'Informação', MB_ICONEXCLAMATION);
      Continua := False;
    end;
  end;

  if not Continua then
    Abort;
end;

{$REGION 'Inicialização/Finalização da classe'}

initialization

RegisterClass(TfrmContas_Receber);

finalization

UnRegisterClass(TfrmContas_Receber);
{$ENDREGION}

end.
