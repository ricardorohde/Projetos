unit uCadastro_Funcionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Tela_Cadastro_MasterDetail, DB, DBClient, EMSTable, ImgList,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, ToolWin, Grids, DBGrids, Mask,
  LookupEdit, dbLookUpEdit, DBFindEdit, DBSearchEdit, DBCtrls,
  EMSParameters, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters, cxNavigator,
  cxDBNavigator, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid;

type
  TfrmCadastro_Funcionario = class(TfrmTela_Cadastro_MasterDetail)
    cdsTabelaID_FUNCIONARIO: TIntegerField;
    cdsTabelaCODIGO_EXTERNO: TIntegerField;
    cdsTabelaNOME: TWideStringField;
    cdsTabelaDATA_NASCIMENTO: TSQLTimeStampField;
    cdsTabelaSALARIO: TFloatField;
    cdsTabelaEMPRESA_ID: TIntegerField;
    cdsTabelaPIS: TWideStringField;
    cdsTabelaRG: TWideStringField;
    cdsTabelaCTPS: TWideStringField;
    cdsTabelaDATA_ADMISSAO: TSQLTimeStampField;
    cdsTabelaDATA_DEMISSAO: TSQLTimeStampField;
    cdsTabelaCPF: TWideStringField;
    cdsTabelaCONFIGURACAO_INDIVIDUAL: TBooleanField;
    dtsEmpresa: TDataSource;
    cdsEmpresa: TClientDataSet;
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
    Label2: TLabel;
    edtCodigo: TDBEdit;
    Label3: TLabel;
    edtNome: TDBEdit;
    Label4: TLabel;
    edtDataNascimento: TDBEdit;
    Label5: TLabel;
    edtSalario: TDBEdit;
    tv1CODIGO_EXTERNO: TcxGridDBColumn;
    tv1NOME: TcxGridDBColumn;
    tv1DATA_NASCIMENTO: TcxGridDBColumn;
    tv1PIS: TcxGridDBColumn;
    tv1RG: TcxGridDBColumn;
    tv1DATA_ADMISSAO: TcxGridDBColumn;
    tv1DATA_DEMISSAO: TcxGridDBColumn;
    tv1CPF: TcxGridDBColumn;
    procedure cdsTabelaBeforeDelete(DataSet: TDataSet);
    procedure cdsTabelaBeforePost(DataSet: TDataSet);
    procedure edtCodigoMasterExit(Sender: TObject);
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

  cdsEmpresa.Active := True;
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
  inherited;

  DM_Cadastro_Funcionario.DCOMCon_Funcionario.AppServer.Deletar(cdsTabela.FieldByName('ID_FUNCIONARIO').AsInteger);
end;

procedure TfrmCadastro_Funcionario.cdsTabelaBeforePost(DataSet: TDataSet);
begin
  cdsTabela.Fields.FieldByName('EMPRESA_ID').AsInteger := StrToIntDef(edtCodigoMaster.Text, -1);
  inherited;
end;

procedure TfrmCadastro_Funcionario.edtCodigoMasterExit(Sender: TObject);
begin
  if edtCodigoMaster.Text <> '' then
  begin
    cdsEmpresa.Active := False;
    cdsEmpresa.Params.ParamByName('ID').AsInteger := StrToIntDef(edtCodigoMaster.Text, -1);
    cdsEmpresa.Active := True;
    edtNomeMaster.Text := cdsEmpresa.FieldByName('NOME_FANTASIA').AsString;

    cdsTabela.RemoteServer := DM_Cadastro_Funcionario.DCOMCon_Funcionario;
    cdsTabela.Active := False;
    cdsTabela.Params.ParamByName('EMPRESA_ID').AsInteger := StrToIntDef(edtCodigoMaster.Text, -1);
    cdsTabela.Active := True;
  end;
  inherited;
end;

end.
