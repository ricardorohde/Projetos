unit uRDM_Funcionario;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, ServidorPonto_TLB, StdVcl, uADStanIntf, uADStanOption,
  uADStanParam, uADStanError, uADDatSManager, uADPhysIntf, uADDAptIntf,
  uADStanAsync, uADDAptManager, DB, uADCompDataSet, uADCompClient, Provider;

type
  TRDM_Funcionario = class(TRemoteDataModule, IRDM_Funcionario)
    qryFuncionario: TADQuery;
    dspFuncionario: TDataSetProvider;
    qryFuncionarioID_FUNCIONARIO: TIntegerField;
    qryFuncionarioCODIGO_EXTERNO: TIntegerField;
    qryFuncionarioNOME: TWideStringField;
    qryFuncionarioDATA_NASCIMENTO: TSQLTimeStampField;
    qryFuncionarioSALARIO: TFloatField;
    qryFuncionario_Dados_Complementar: TADQuery;
    qryFuncionario_Dados_Pessoais: TADQuery;
    qryFuncionario_Observacao: TADQuery;
    dspFuncionario_Dados_Complementar: TDataSetProvider;
    dspFuncionario_Dados_Pessoais: TDataSetProvider;
    dspFuncionario_Observacao: TDataSetProvider;
    qryFuncionario_Dados_ComplementarID_FUNCIONARIO_DADOS_C: TIntegerField;
    qryFuncionario_Dados_ComplementarID_FUNCIONARIO: TIntegerField;
    qryFuncionario_Dados_ComplementarID_HORARIO: TIntegerField;
    qryFuncionario_Dados_ComplementarID_TIPO_JORNADA: TIntegerField;
    qryFuncionario_Dados_ComplementarID_JORNADA: TIntegerField;
    qryFuncionario_Dados_ComplementarINICIO_EXPEDIENTE: TTimeField;
    qryFuncionario_Dados_ComplementarHORAS_FIXAS: TBooleanField;
    qryFuncionario_Dados_ComplementarQUANTIDADE_HORAS_FIXAS: TIntegerField;
    qryFuncionario_Dados_ComplementarID_DIGITAIS: TIntegerField;
    qryFuncionario_Dados_PessoaisID_FUNCIONARIO_DADOS_P: TIntegerField;
    qryFuncionario_Dados_PessoaisID_FUNCIONARIO: TIntegerField;
    qryFuncionario_Dados_PessoaisENDERECO: TWideStringField;
    qryFuncionario_Dados_PessoaisNUMERO: TIntegerField;
    qryFuncionario_Dados_PessoaisCOMPLEMENTO: TWideStringField;
    qryFuncionario_Dados_PessoaisBAIRRO: TWideStringField;
    qryFuncionario_Dados_PessoaisCEP: TWideStringField;
    qryFuncionario_Dados_PessoaisCODIGO_MUNICIPIO: TIntegerField;
    qryFuncionario_Dados_PessoaisTELEFONE: TWideStringField;
    qryFuncionario_Dados_PessoaisCELULAR: TWideStringField;
    qryFuncionario_ObservacaoID_FUNCIONARIO_OBSERVACAO: TIntegerField;
    qryFuncionario_ObservacaoID_FUNCIONARIO: TIntegerField;
    qryFuncionario_ObservacaoNOME_EXIBICAO: TWideStringField;
    qryFuncionario_ObservacaoSENHA_RELOGIO: TWideStringField;
    qryFuncionarioEMPRESA_ID: TIntegerField;
    qryFuncionarioPIS: TWideStringField;
    qryFuncionarioRG: TWideStringField;
    qryFuncionarioCTPS: TWideStringField;
    qryFuncionarioDATA_ADMISSAO: TSQLTimeStampField;
    qryFuncionarioDATA_DEMISSAO: TSQLTimeStampField;
    qryFuncionarioCPF: TWideStringField;
    qryFuncionarioCONFIGURACAO_INDIVIDUAL: TBooleanField;
    qryFuncionario_Parametros: TADQuery;
    dspFuncionario_Parametros: TDataSetProvider;
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

class procedure TRDM_Funcionario.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
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

procedure TRDM_Funcionario.Deletar(ID: Double);
var
  q : TADQuery;
begin
  q := TADQuery.Create(nil);
  try
    q.Close;
    q.Connection := DM_Conexao.con;
    q.SQL.Clear;
    q.SQL.Add('DELETE FROM "public"."FUNCIONARIO_DADOS_COMPLEMENTAR"');
    q.SQL.Add('WHERE "ID_FUNCIONARIO" = '+ FloatToStr(ID));
    q.ExecSQL;

    q.Close;
    q.Connection := DM_Conexao.con;
    q.SQL.Clear;
    q.SQL.Add('DELETE FROM "public"."FUNCIONARIO_DADOS_PESSOAIS"');
    q.SQL.Add('WHERE "ID_FUNCIONARIO" = '+ FloatToStr(ID));
    q.ExecSQL;

    q.Close;
    q.Connection := DM_Conexao.con;
    q.SQL.Clear;
    q.SQL.Add('DELETE FROM "public"."FUNCIONARIO_OBSERVACAO"');
    q.SQL.Add('WHERE "ID_FUNCIONARIO" = '+ FloatToStr(ID));
    q.ExecSQL;

    q.Close;
    q.Connection := DM_Conexao.con;
    q.SQL.Clear;
    q.SQL.Add('DELETE FROM "public"."FUNCIONARIO_PARAMETROS"');
    q.SQL.Add('WHERE "ID_FUNCIONARIO" = '+ FloatToStr(ID));
    q.ExecSQL;

    q.Close;
    q.Connection := DM_Conexao.con;
    q.SQL.Clear;
    q.SQL.Add('DELETE FROM "public"."FUNCIONARIO"');
    q.SQL.Add('WHERE "ID_FUNCIONARIO" = '+ FloatToStr(ID));
    q.ExecSQL;
  finally
    FreeAndNil( q );
  end;
end;

initialization
  TComponentFactory.Create(ComServer, TRDM_Funcionario,
    Class_RDM_Funcionario, ciMultiInstance, tmApartment);
end.
