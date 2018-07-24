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
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit;

type
  TfrmCadastro_Empresa = class(TfrmTelaDeCadastro)
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
    tv1CODIGO_EXTERNO: TcxGridDBColumn;
    tv1NOME_FANTASIA: TcxGridDBColumn;
    tv1CNPJ: TcxGridDBColumn;
    cdsEmpresa_Parametros: TClientDataSet;
    dtsEmpresa_Parametros: TDataSource;
    cdsEmpresa_ParametrosID_PARAMETROS_EMPRESA: TIntegerField;
    cdsEmpresa_ParametrosEMPRESA_ID: TIntegerField;
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
    DBSearchEdit1: TDBSearchEdit;
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
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    DBEdit12: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label2: TLabel;
    procedure cdsTabelaAfterDelete(DataSet: TDataSet);
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

uses uDM_Cadastro_Empresa;

{$R *.dfm}

{ TfrmTelaDeCadastro1 }

procedure TfrmCadastro_Empresa.AfterConstruction;
begin
  inherited;
  DM_Cadastro_Empresa  := TDM_Cadastro_Empresa.Create(Self);
end;

procedure TfrmCadastro_Empresa.BeforeDestruction;
begin
  inherited;
  FreeAndNil( DM_Cadastro_Empresa );
end;

procedure TfrmCadastro_Empresa.cdsTabelaAfterDelete(DataSet: TDataSet);
begin
  inherited;
  DM_Cadastro_Empresa.DCOMCon_Empresa.AppServer.Deletar(cdsTabela.FieldByName('ID_EMPRESA').AsInteger);
end;

end.
