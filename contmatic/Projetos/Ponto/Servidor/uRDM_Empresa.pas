unit uRDM_Empresa;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, ServidorPonto_TLB, StdVcl, uADStanIntf, uADStanOption,
  uADStanParam, uADStanError, uADDatSManager, uADPhysIntf, uADDAptIntf,
  uADStanAsync, uADDAptManager, DB, uADCompDataSet, uADCompClient, Provider;

type
  TRDM_Empresa = class(TRemoteDataModule, IRDM_EMPRESA)
    dsp_Empresa: TDataSetProvider;
    dspEmpresa_Parametros: TDataSetProvider;
    qry_Empresa: TADQuery;
    qryEmpresa_Parametros: TADQuery;
    qry_EmpresaID_EMPRESA: TIntegerField;
    qry_EmpresaCODIGO_EXTERNO: TIntegerField;
    qry_EmpresaRAZAO_SOCIAL: TWideStringField;
    qry_EmpresaNOME_FANTASIA: TWideStringField;
    qry_EmpresaCNPJ: TWideStringField;
    qry_EmpresaINSCRICAO_ESTADUAL: TWideStringField;
    qry_EmpresaCODIGO_MUNICIPIO: TIntegerField;
    qry_EmpresaENDERECO: TWideStringField;
    qry_EmpresaNUMERO: TIntegerField;
    qry_EmpresaCOMPLEMENTO: TWideStringField;
    qry_EmpresaBAIRRO: TWideStringField;
    qry_EmpresaCEP: TWideStringField;
    qry_EmpresaTELEFONE: TWideStringField;
    qry_EmpresaEMAIL: TWideStringField;
    qry_EmpresaDIA_FECHAMENTO: TIntegerField;
    qryEmpresa_ParametrosID_PARAMETROS_EMPRESA: TIntegerField;
    qryEmpresa_ParametrosEMPRESA_ID: TIntegerField;
    qryEmpresa_ParametrosPERIODO: TSQLTimeStampField;
    qryEmpresa_ParametrosTURNOS: TIntegerField;
    qryEmpresa_ParametrosPAGAMENTO_HE_ANTES_HORARIO: TBooleanField;
    qryEmpresa_ParametrosPAGAMENTO_HE_DEPOIS_HORARIO: TBooleanField;
    qryEmpresa_ParametrosTOLERANCIA_HORAEXTRA: TIntegerField;
    qryEmpresa_ParametrosTOLERANCIA_ATRASO: TIntegerField;
    qryEmpresa_ParametrosINICIO_EXPEDIENTE: TTimeField;
    qryEmpresa_ParametrosHORAS_BONIFICACAO: TTimeField;
    qryEmpresa_ParametrosPORC_HORAS_BONIFICACAO: TIntegerField;
    qryEmpresa_ParametrosPORC_BONIFICACAO_FERIADO_FOLGA: TIntegerField;
    qryEmpresa_ParametrosPORC_BONIFICACAO_DEMAIS_HORAS: TIntegerField;
    qryEmpresa_ParametrosHORA_INICIO_ADICIONALNOTURNO: TIntegerField;
    qryEmpresa_ParametrosHORA_FIM_ADICIONALNOTURNO: TIntegerField;
    qryEmpresa_ParametrosDESCONTO_INTERVALO_NOTURNO: TBooleanField;
    qryEmpresa_ParametrosTRABALHA_BANCOHORAS: TBooleanField;
    qryEmpresa_ParametrosALMOCO_FLEXIVEL: TBooleanField;
    qryEmpresa_ParametrosENTRADA_SAIDA_FLEXIVEL: TBooleanField;
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    procedure Deletar(ID: Double); safecall;
  public
    { Public declarations }
  end;

implementation

uses uDM_Conexao;

{$R *.DFM}

class procedure TRDM_Empresa.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

procedure TRDM_Empresa.Deletar(ID: Double);
var
  q : TADQuery;
begin
  q := TADQuery.Create(nil);
  try
    q.Close;
    q.Connection := DM_Conexao.con;
    q.SQL.Clear;
    q.SQL.Add('DELETE FROM "public"."EMPRESA_PARAMETROS"');
    q.SQL.Add('WHERE "ID_EMPRESA" = '+ FloatToStr(ID));
    q.ExecSQL;

    q.Close;
    q.Connection := DM_Conexao.con;
    q.SQL.Clear;
    q.SQL.Add('DELETE FROM "public"."EMPRESA"');
    q.SQL.Add('WHERE "ID_EMPRESA" = '+ FloatToStr(ID));
    q.ExecSQL;
  finally
    FreeAndNil( q );
  end;
end;

initialization
  TComponentFactory.Create(ComServer, TRDM_Empresa,
    Class_RDM_Empresa, ciMultiInstance, tmApartment);
end.
