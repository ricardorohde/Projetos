unit uRDM_Feriado;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, ServidorPonto_TLB, StdVcl, uADStanIntf, uADStanOption,
  uADStanParam, uADStanError, uADDatSManager, uADPhysIntf, uADDAptIntf,
  uADStanAsync, uADDAptManager, Provider, DB, uADCompDataSet, uADCompClient;

type
  TRDM_Feriado = class(TRemoteDataModule, IRDM_Feriado)
    qryFERIADO: TADQuery;
    dspFERIADO: TDataSetProvider;
    qryFERIADOID_FERIADO: TIntegerField;
    qryFERIADOCODIGO_EXTERNO: TIntegerField;
    qryFERIADODATA_FERIADO: TSQLTimeStampField;
    qryFERIADODESCRICAO: TWideStringField;
    qryFERIADOABRANGENCIA: TIntegerField;
    qryFERIADOCODIGO_MUNICIPIO: TIntegerField;
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

class procedure TRDM_Feriado.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
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

procedure TRDM_Feriado.Deletar(ID: Double);
var
  q : TADQuery;
begin
  q := TADQuery.Create(nil);
  try
    q.Close;
    q.Connection := DM_Conexao.con;
    q.SQL.Clear;
    q.SQL.Add('DELETE FROM "public"."FERIADO"');
    q.SQL.Add('WHERE "ID_FERIADO" = '+ FloatToStr(ID));
    q.ExecSQL;
  finally
    FreeAndNil( q );
  end;
end;

initialization
  TComponentFactory.Create(ComServer, TRDM_Feriado,
    Class_RDM_Feriado, ciMultiInstance, tmApartment);
end.
