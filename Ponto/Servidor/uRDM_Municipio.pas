unit uRDM_Municipio;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, ServidorPonto_TLB, StdVcl, uADStanIntf, uADStanOption,
  uADStanParam, uADStanError, uADDatSManager, uADPhysIntf, uADDAptIntf,
  uADStanAsync, uADDAptManager, Provider, DB, uADCompDataSet, uADCompClient;

type
  TRDM_Municipio = class(TRemoteDataModule, IRDM_Municipio)
    qryMunicipio: TADQuery;
    dspMunicipio: TDataSetProvider;
    qryMunicipioID_COD_MUNICIPIO: TIntegerField;
    qryMunicipioCOD_MUNICIPIO: TFloatField;
    qryMunicipioUF: TWideStringField;
    qryMunicipioNOME: TWideStringField;
    qryMunicipioNOME_SEM_ACENTO: TWideStringField;
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

class procedure TRDM_Municipio.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
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

procedure TRDM_Municipio.Deletar(ID: Double);
var
  q : TADQuery;
begin
  q := TADQuery.Create(nil);
  try
    q.Close;
    q.Connection := DM_Conexao.con;
    q.SQL.Clear;
    q.SQL.Add('DELETE FROM "public"."CODIGO_MUNICIPIO"');
    q.SQL.Add('WHERE "ID_COD_MUNICIPIO" = '+ FloatToStr(ID));
    q.ExecSQL;
  finally
    FreeAndNil( q );
  end;
end;

initialization
  TComponentFactory.Create(ComServer, TRDM_Municipio,
    Class_RDM_Municipio, ciMultiInstance, tmApartment);
end.
