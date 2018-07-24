unit uRDM;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, AppServerDCOM_TLB, StdVcl, Provider, DB, ADODB, uADStanIntf,
  uADStanOption, uADStanError, uADGUIxIntf, uADPhysIntf, uADStanDef,
  uADStanPool, uADStanAsync, uADPhysManager, uADStanParam, uADDatSManager,
  uADDAptIntf, uADDAptManager, uADCompDataSet, uADCompClient, uADPhysPG;

type
  TRDM = class(TRemoteDataModule, IRDM)
    DataSetProvider1: TDataSetProvider;
    ADConnection1: TADConnection;
    ADPhysPgDriverLink1: TADPhysPgDriverLink;
    ADQuery1: TADQuery;
    ADQuery1ID_HORARIO: TIntegerField;
    ADQuery1CODIGO_EXTERNO: TIntegerField;
    ADQuery1DESCRICAO: TWideStringField;
    ADQuery1POSSUI_ESCALA: TBooleanField;
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    procedure VerificarCPF(const CPF: WideString); safecall;
  public
    { Public declarations }
  end;

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


//Criar método View -> Type Library
procedure TRDM.VerificarCPF(const CPF: WideString);
var
  d1,d2,n1,n2,na,loop : integer;
begin
  na:=1;
  for loop:=1 to Length(CPF)-2 do
  begin
    n1:=n1+(11-na)*StrToInt(CPF[loop]);
    n2:=n2+(12-na)*StrToInt(CPF[loop]);
    na:=na+1;
  end;

  d1:=0;
  if (n1 mod 11)>=2 then
      d1:=11-(n1 mod 11);

  d2:=0;
  n2:=n2+2*d1;
  if (n2 mod 11)>=2 then
    d2:=11-(n2 mod 11);

  if (inttostr(d1)<>CPF[10]) or
     (inttostr(d2)<>CPF[11]) then
    raise Exception.Create('CPF Inválido');
end;

initialization
  TComponentFactory.Create(ComServer, TRDM,
    Class_RDM, ciMultiInstance, tmApartment);
end.
