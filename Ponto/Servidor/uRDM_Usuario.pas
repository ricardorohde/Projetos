unit uRDM_Usuario;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, ServidorPonto_TLB, StdVcl, uADStanIntf, uADStanOption,
  uADStanParam, uADStanError, uADDatSManager, uADPhysIntf, uADDAptIntf,
  uADStanAsync, uADDAptManager, DB, Provider, uADCompDataSet, uADCompClient;

type
  TRDM_Usuario = class(TRemoteDataModule, IRDM_Usuario)
    qryUsuario: TADQuery;
    dspUsuario: TDataSetProvider;
    qryUsuarioID_USUARIO: TIntegerField;
    qryUsuarioUSUARIO: TWideStringField;
    qryUsuarioSENHA: TWideStringField;
    qryUsuarioCODIGO_EXTERNO: TIntegerField;
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

class procedure TRDM_Usuario.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
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

procedure TRDM_Usuario.Deletar(ID: Double);
var
  q : TADQuery;
begin
  q := TADQuery.Create(nil);
  try
    q.Close;
    q.Connection := DM_Conexao.con;
    q.SQL.Clear;
    q.SQL.Add('DELETE FROM "public"."USUARIOS"');
    q.SQL.Add('WHERE "ID_USUARIO" = '+ FloatToStr(ID));
    q.ExecSQL;
  finally
    FreeAndNil( q );
  end;
end;

initialization
  TComponentFactory.Create(ComServer, TRDM_Usuario,
    Class_RDM_Usuario, ciMultiInstance, tmApartment);
end.
