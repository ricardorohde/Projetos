unit uRDM;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComServ, ComObj, VCLCom, StdVcl, bdemts, DataBkr, DBClient,
  MtsRdm, Mtx, AppServerCOMPlus_TLB, Provider, DB, ADODB;

type
  TRDM = class(TMtsDataModule, IRDM)
    ADOConnection1: TADOConnection;
    ADODataSet1: TADODataSet;
    DataSetProvider1: TDataSetProvider;
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
  public
    { Public declarations }
  end;

var
  RDM: TRDM;

implementation

{$R *.DFM}

class procedure TRDM.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
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
  TComponentFactory.Create(ComServer, TRDM,
    Class_RDM, ciMultiInstance, tmApartment);
end.