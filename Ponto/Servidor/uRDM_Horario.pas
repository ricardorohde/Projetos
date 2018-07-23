unit uRDM_Horario;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, ServidorPonto_TLB, StdVcl, uADStanIntf, uADStanOption,
  uADStanParam, uADStanError, uADDatSManager, uADPhysIntf, uADDAptIntf,
  uADStanAsync, uADDAptManager, DB, uADCompDataSet, uADCompClient, Provider;

type
  TRDM_Horario = class(TRemoteDataModule, IRDM_Horario)
    dspHORARIO: TDataSetProvider;
    dspHORARIO_DETALHE: TDataSetProvider;
    qryHORARIO: TADQuery;
    qryHORARIO_DETALHE: TADQuery;
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

class procedure TRDM_Horario.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
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

procedure TRDM_Horario.Deletar(ID: Double);
var
  q : TADQuery;
begin
  q := TADQuery.Create(nil);
  try
    q.Close;
    q.Connection := DM_Conexao.con;
    q.SQL.Clear;
    q.SQL.Add('DELETE FROM "public"."HORARIO_DETALHE"');
    q.SQL.Add('WHERE "ID_HORARIO" = '+ FloatToStr(ID));
    q.ExecSQL;

    q.Close;
    q.Connection := DM_Conexao.con;
    q.SQL.Clear;
    q.SQL.Add('DELETE FROM "public"."HORARIO"');
    q.SQL.Add('WHERE "ID_HORARIO" = '+ FloatToStr(ID));
    q.ExecSQL;
  finally
    FreeAndNil( q );
  end;
end;

initialization
  TComponentFactory.Create(ComServer, TRDM_Horario,
    Class_RDM_Horario, ciMultiInstance, tmApartment);
end.
