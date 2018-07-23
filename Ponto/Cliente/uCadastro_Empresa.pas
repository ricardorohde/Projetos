unit uCadastro_Empresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Tela_Cadastro, DB, DBClient, EMSTable, ImgList, ComCtrls,
  ToolWin, Grids, DBGrids, StdCtrls, Mask, DBCtrls, EMSParameters,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinsDefaultPainters, cxNavigator, cxDBNavigator, Buttons,
  ExtCtrls, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, LookupEdit, dbLookUpEdit, DBSearchEdit, cxPC,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit,
  cxSpinEdit, cxTimeEdit, uDM_Cadastro_Empresa, uDM_Cadastro_Municipio,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, uEditButton, DBEditBtn,
  frxClass, frxDBSet;

type
  TfrmCadastro_Empresa = class(TfrmTelaDeCadastro)
    tv1CODIGO_EXTERNO: TcxGridDBColumn;
    tv1NOME_FANTASIA: TcxGridDBColumn;
    tv1CNPJ: TcxGridDBColumn;
    dtsEmpresa_Parametros: TDataSource;
    gpxDocumentos: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    edtCNPJ: TDBEdit;
    edtInscricaoEstadual: TDBEdit;
    gpxEndereco: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    edtLogradouro: TDBEdit;
    edtNumero: TDBEdit;
    edtComplemento: TDBEdit;
    edtBairro: TDBEdit;
    edtCEP: TDBEdit;
    gpxContato: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    edtTelefone: TDBEdit;
    edtEmail: TDBEdit;
    Label1: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    edtCodigo: TDBEdit;
    edtNome: TDBEdit;
    edtRazaoSocial: TDBEdit;
    edtFechamento: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    edtPeriodo: TcxDBDateEdit;
    edtTurnos: TDBEdit;
    Label2: TLabel;
    cdsEmpresa_Parametros: TClientDataSet;
    cdsEmpresa_ParametrosID_PARAMETROS_EMPRESA: TIntegerField;
    cdsEmpresa_ParametrosID_EMPRESA: TIntegerField;
    cdsEmpresa_ParametrosPERIODO: TSQLTimeStampField;
    cdsEmpresa_ParametrosTURNOS: TIntegerField;
    cdsEmpresa_ParametrosPAGAMENTO_HE_ANTES_HORARIO: TBooleanField;
    cdsEmpresa_ParametrosPAGAMENTO_HE_DEPOIS_HORARIO: TBooleanField;
    cdsEmpresa_ParametrosTOLERANCIA_HORAEXTRA: TIntegerField;
    cdsEmpresa_ParametrosTOLERANCIA_ATRASO: TIntegerField;
    cdsEmpresa_ParametrosINICIO_EXPEDIENTE: TTimeField;
    cdsEmpresa_ParametrosHORAS_BONIFICACAO: TTimeField;
    cdsEmpresa_ParametrosPORC_HORAS_BONIFICACAO: TIntegerField;
    cdsEmpresa_ParametrosPORC_BONIFICACAO_FERIADO_FOLGA: TIntegerField;
    cdsEmpresa_ParametrosPORC_BONIFICACAO_DEMAIS_HORAS: TIntegerField;
    cdsEmpresa_ParametrosHORA_INICIO_ADICIONALNOTURNO: TIntegerField;
    cdsEmpresa_ParametrosHORA_FIM_ADICIONALNOTURNO: TIntegerField;
    cdsEmpresa_ParametrosDESCONTO_INTERVALO_NOTURNO: TBooleanField;
    cdsEmpresa_ParametrosTRABALHA_BANCOHORAS: TBooleanField;
    cdsEmpresa_ParametrosALMOCO_FLEXIVEL: TBooleanField;
    cdsEmpresa_ParametrosENTRADA_SAIDA_FLEXIVEL: TBooleanField;
    gpxPagamentoHE: TGroupBox;
    chkAntesHorario: TDBCheckBox;
    chkDepoisHorario: TDBCheckBox;
    gpxTolerancia: TGroupBox;
    Label17: TLabel;
    edtToleranciaHE: TDBEdit;
    Label18: TLabel;
    edtToleranciaAtraso: TDBEdit;
    gpxInicioExpediente: TGroupBox;
    edtInicioExpediente: TcxDBTimeEdit;
    gpxHorasExtras: TGroupBox;
    gpxPrimeirasHE: TGroupBox;
    edtPrimeirasHE: TcxDBTimeEdit;
    Label21: TLabel;
    edtPorcentagemHE: TDBEdit;
    gpxFolgasFeriados: TGroupBox;
    Label22: TLabel;
    edtPorcentagemFolgasFeriados: TDBEdit;
    gpxDemaisHoras: TGroupBox;
    Label19: TLabel;
    edtPorcentagemHorasExtras: TDBEdit;
    gpxAdicionalNoturno: TGroupBox;
    Label20: TLabel;
    edtInicioAdicionalNoturno: TcxDBTimeEdit;
    Label23: TLabel;
    edtFimAdicionalNoturno: TcxDBTimeEdit;
    chkDescontarIntervaloNoturno: TDBCheckBox;
    gpxOutrasConfiguracoes: TGroupBox;
    chkUtilizaBH: TDBCheckBox;
    chkAlmocoFlexivel: TDBCheckBox;
    chkEntrada_SaidaFlexivel: TDBCheckBox;
    Label24: TLabel;
    DBEdit1: TDBEdit;
    cdsMunicipio: TClientDataSet;
    cdsMunicipioID_COD_MUNICIPIO: TIntegerField;
    cdsMunicipioCOD_MUNICIPIO: TFloatField;
    cdsMunicipioUF: TWideStringField;
    cdsMunicipioNOME: TWideStringField;
    cdsMunicipioNOME_SEM_ACENTO: TWideStringField;
    dtsMunicipio: TDataSource;
    cboEstado: TcxDBLookupComboBox;
    cdsTabelaID_EMPRESA: TIntegerField;
    cdsTabelaCODIGO_EXTERNO: TIntegerField;
    cdsTabelaRAZAO_SOCIAL: TWideStringField;
    cdsTabelaNOME_FANTASIA: TWideStringField;
    cdsTabelaCNPJ: TWideStringField;
    cdsTabelaINSCRICAO_ESTADUAL: TWideStringField;
    cdsTabelaCODIGO_MUNICIPIO: TIntegerField;
    cdsTabelaENDERECO: TWideStringField;
    cdsTabelaNUMERO: TIntegerField;
    cdsTabelaCOMPLEMENTO: TWideStringField;
    cdsTabelaBAIRRO: TWideStringField;
    cdsTabelaCEP: TWideStringField;
    cdsTabelaTELEFONE: TWideStringField;
    cdsTabelaEMAIL: TWideStringField;
    cdsTabelaDIA_FECHAMENTO: TIntegerField;
    cdsTabelaID_ESTADO: TIntegerField;
    dtsEstados: TDataSource;
    Label25: TLabel;
    edtMunicipio: TDBEditBtn;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    procedure cboEstadoPropertiesChange(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;

    { Public declarations }

  end;

var
  frmCadastro_Empresa: TfrmCadastro_Empresa;

implementation

uses uDM_Utils, LIB;

{$R *.dfm}

{ TfrmTelaDeCadastro1 }

procedure TfrmCadastro_Empresa.AfterConstruction;
begin
  inherited;
  DM_Cadastro_Empresa                := TDM_Cadastro_Empresa.Create(Self);
  DM_Cadastro_Municipio              := TDM_Cadastro_Municipio.Create(Self);
  DM_Utils                           := TDM_Utils.Create(Self);
  cdsTabela.RemoteServer             := DM_Cadastro_Empresa.DCOMCon_Empresa;
  cdsEmpresa_Parametros.RemoteServer := DM_Cadastro_Empresa.DCOMCon_Empresa;
  cdsMunicipio.RemoteServer          := DM_Cadastro_Municipio.DCOMCon_Municipio;
  DM_Utils.cdsEstados.RemoteServer   := DM_Utils.DCOMCon_Utils;
  DM_Utils.cdsEstados.Active         := True;
end;

procedure TfrmCadastro_Empresa.BeforeDestruction;
begin
  inherited;
  FreeAndNil( DM_Utils );
  FreeAndNil( DM_Cadastro_Empresa );
  FreeAndNil( DM_Cadastro_Municipio );
end;

procedure TfrmCadastro_Empresa.cboEstadoPropertiesChange(Sender: TObject);
begin
  inherited;

  edtMunicipio.Enabled := False;
  if not Empty(cboEstado.Text) then
  begin
    cdsMunicipio.Close;
    cdsMunicipio.Params.ParamByName('UF').AsString := dtsEstados.DataSet.FieldByName('UF').AsString;
    cdsMunicipio.Active := True;

    edtMunicipio.Enabled := not cdsMunicipio.IsEmpty;
  end;
end;

procedure TfrmCadastro_Empresa.btnImprimirClick(Sender: TObject);
var

  FReport : TfrxReport;
begin
  inherited;
//  frxReport1.ShowReport();
//  FReport := TfrxReport.Create(Self);
//
//  FReport.EngineOptions.DestroyForms := False;
//  FReport.DataSets.Add(frxDBDataset1);
//  FReport.LoadFromFile('C:\Users\Edson\Documents\teste.fr3');
//  FReport.DesignReport();
end;

end.
