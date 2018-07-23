unit uRDM_Utils;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, ServidorPonto_TLB, StdVcl, uADStanIntf, uADStanOption,
  uADStanParam, uADStanError, uADDatSManager, uADPhysIntf, uADDAptIntf,
  uADStanAsync, uADDAptManager, DB, Provider, uADCompDataSet, uADCompClient;

type
  TRDM_Utils = class(TRemoteDataModule, IRDM_Utils)
    qryRetornoID: TADQuery;
    dspRetornoID: TDataSetProvider;
    qryRetornoIDid: TLargeintField;
    qryEstados: TADQuery;
    dspEstados: TDataSetProvider;
    qryEstadosID_ESTADO: TIntegerField;
    qryEstadosUF: TWideStringField;
    qryEstadosNOME: TWideStringField;
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
  public
    { Public declarations }
  end;

implementation

uses uDM_Conexao;

{$R *.DFM}

class procedure TRDM_Utils.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
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

initialization
  TComponentFactory.Create(ComServer, TRDM_Utils,
    Class_RDM_Utils, ciMultiInstance, tmApartment);
end.
