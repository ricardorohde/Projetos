unit uCadastro_Funcionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Tela_Cadastro_MasterDetail, DB, DBClient, EMSTable, ImgList,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, ToolWin, Grids, DBGrids, Mask,
  LookupEdit, dbLookUpEdit, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxContainer, DBCtrls, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxDBEdit, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, EMSParameters, cxNavigator,
  cxDBNavigator, cxPC, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, DBSearchEdit, uEditButton, DBEditBtn;

type
  TfrmCadastro_Funcionario = class(TfrmTela_Cadastro_MasterDetail)
    dtsEmpresa: TDataSource;
    cdsEmpresa: TClientDataSet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    tv1CODIGO_EXTERNO: TcxGridDBColumn;
    tv1NOME: TcxGridDBColumn;
    tv1DATA_NASCIMENTO: TcxGridDBColumn;
    tv1PIS: TcxGridDBColumn;
    tv1RG: TcxGridDBColumn;
    tv1DATA_ADMISSAO: TcxGridDBColumn;
    tv1DATA_DEMISSAO: TcxGridDBColumn;
    tv1CPF: TcxGridDBColumn;
    cdsEmpresaID_EMPRESA: TIntegerField;
    cdsEmpresaCODIGO_EXTERNO: TIntegerField;
    cdsEmpresaRAZAO_SOCIAL: TWideStringField;
    cdsEmpresaNOME_FANTASIA: TWideStringField;
    cdsEmpresaCNPJ: TWideStringField;
    cdsEmpresaINSCRICAO_ESTADUAL: TWideStringField;
    cdsEmpresaCODIGO_MUNICIPIO: TIntegerField;
    cdsEmpresaENDERECO: TWideStringField;
    cdsEmpresaNUMERO: TIntegerField;
    cdsEmpresaCOMPLEMENTO: TWideStringField;
    cdsEmpresaBAIRRO: TWideStringField;
    cdsEmpresaCEP: TWideStringField;
    cdsEmpresaTELEFONE: TWideStringField;
    cdsEmpresaEMAIL: TWideStringField;
    cdsEmpresaDIA_FECHAMENTO: TIntegerField;
    cdsTabelaID_FUNCIONARIO: TIntegerField;
    cdsTabelaCODIGO_EXTERNO: TIntegerField;
    cdsTabelaNOME: TWideStringField;
    cdsTabelaDATA_NASCIMENTO: TSQLTimeStampField;
    cdsTabelaSALARIO: TFloatField;
    cdsTabelaID_EMPRESA: TIntegerField;
    cdsTabelaPIS: TWideStringField;
    cdsTabelaRG: TWideStringField;
    cdsTabelaCTPS: TWideStringField;
    cdsTabelaDATA_ADMISSAO: TSQLTimeStampField;
    cdsTabelaDATA_DEMISSAO: TSQLTimeStampField;
    cdsTabelaCPF: TWideStringField;
    cdsTabelaCONFIGURACAO_INDIVIDUAL: TBooleanField;
    Label6: TLabel;
    edtCodigo: TDBEdit;
    Label7: TLabel;
    edtNome: TDBEdit;
    Label8: TLabel;
    edtDataNascimento: TcxDBDateEdit;
    edtDataAdmissao: TcxDBDateEdit;
    Label9: TLabel;
    Label10: TLabel;
    edtDataDemissao: TcxDBDateEdit;
    gpxDocumentos: TGroupBox;
    Label11: TLabel;
    edtPis: TDBEdit;
    Label12: TLabel;
    edtRG: TDBEdit;
    Label13: TLabel;
    edtCTPS: TDBEdit;
    Label14: TLabel;
    edtCPF: TDBEdit;
    chkConfiguracaoIndividual: TDBCheckBox;
    cdsFuncionario_Dados_Complementar: TClientDataSet;
    cdsFuncionario_Dados_ComplementarID_FUNCIONARIO_DADOS_C: TIntegerField;
    cdsFuncionario_Dados_ComplementarID_FUNCIONARIO: TIntegerField;
    cdsFuncionario_Dados_ComplementarID_HORARIO: TIntegerField;
    cdsFuncionario_Dados_ComplementarID_TIPO_JORNADA: TIntegerField;
    cdsFuncionario_Dados_ComplementarID_JORNADA: TIntegerField;
    cdsFuncionario_Dados_ComplementarINICIO_EXPEDIENTE: TTimeField;
    cdsFuncionario_Dados_ComplementarHORAS_FIXAS: TBooleanField;
    cdsFuncionario_Dados_ComplementarQUANTIDADE_HORAS_FIXAS: TIntegerField;
    cdsFuncionario_Dados_ComplementarID_DIGITAIS: TIntegerField;
    cdsFuncionario_Dados_Pessoais: TClientDataSet;
    cdsFuncionario_Dados_PessoaisID_FUNCIONARIO_DADOS_P: TIntegerField;
    cdsFuncionario_Dados_PessoaisID_FUNCIONARIO: TIntegerField;
    cdsFuncionario_Dados_PessoaisENDERECO: TWideStringField;
    cdsFuncionario_Dados_PessoaisNUMERO: TIntegerField;
    cdsFuncionario_Dados_PessoaisCOMPLEMENTO: TWideStringField;
    cdsFuncionario_Dados_PessoaisBAIRRO: TWideStringField;
    cdsFuncionario_Dados_PessoaisCEP: TWideStringField;
    cdsFuncionario_Dados_PessoaisCODIGO_MUNICIPIO: TIntegerField;
    cdsFuncionario_Dados_PessoaisTELEFONE: TWideStringField;
    cdsFuncionario_Dados_PessoaisCELULAR: TWideStringField;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    Label15: TLabel;
    edtEndereco: TDBEdit;
    dtsFuncionario_Dados_Pessoais: TDataSource;
    Label16: TLabel;
    edtNumero: TDBEdit;
    Label17: TLabel;
    edtComplemento: TDBEdit;
    Label18: TLabel;
    edtBairro: TDBEdit;
    Label19: TLabel;
    edtMunicipio: TDBEdit;
    Label20: TLabel;
    edtCEP: TDBEdit;
    Label21: TLabel;
    Label22: TLabel;
    edtCelular: TDBEdit;
    edtTelefone: TcxDBMaskEdit;
    procedure cdsTabelaBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    { Public declarations }

  end;

var
  frmCadastro_Funcionario: TfrmCadastro_Funcionario;

implementation

uses uDM_Cadastro_Funcionario, LIB, uDM_Cadastro_Empresa;

{$R *.dfm}

{ TfrmTela_Cadastro_MasterDetail1 }

procedure TfrmCadastro_Funcionario.AfterConstruction;
begin
  inherited;
  DM_Cadastro_Empresa     := TDM_Cadastro_Empresa.Create(Self);
  DM_Cadastro_Funcionario := TDM_Cadastro_Funcionario.Create(Self);
  cdsTabela.RemoteServer  := DM_Cadastro_Funcionario.DCOMCon_Funcionario;
  cdsEmpresa.RemoteServer := DM_Cadastro_Empresa.DCOMCon_Empresa;
end;

procedure TfrmCadastro_Funcionario.BeforeDestruction;
begin
  FreeAndNil( DM_Cadastro_Empresa );
  FreeAndNil( DM_Cadastro_Funcionario );

  inherited;
end;

procedure TfrmCadastro_Funcionario.cdsTabelaBeforeDelete(
  DataSet: TDataSet);
begin
  DM_Cadastro_Funcionario.DCOMCon_Funcionario.AppServer.Deletar(cdsTabela.FieldByName('ID_FUNCIONARIO').AsInteger);
  inherited;
end;

end.
