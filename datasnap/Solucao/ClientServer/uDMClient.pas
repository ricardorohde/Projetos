{
Desenvolvido por:
Guinther Pauli
Emails: guintherpauli@gmail.com; guinther@gpauli.com
GPauli Cursos e Treinamentos
Delphi Certified Professional - 3,5,6,7,2005,2006,Delphi Web,Kylix,XE
Microsoft Certified Professional - MCP,MCAD,MCSD.NET,MCTS,MCPD (C#,ASP.NET, Arquitetura)
Colaborador Editorial Revistas .net Magazine e ClubeDelphi
MVP (Most Valuable Professional) - Embarcadero Technologies - US
http://www.gpauli.com
http://www.facebook.com/guintherpauli
http://www.twitter.com/guintherpauli
http://br.linkedin.com/in/guintherpauli
}

unit uDMClient;

interface

uses
  System.SysUtils, System.Classes, Data.DBXFirebird, Data.FMTBcd, Data.DB,
  Data.SqlExpr, Datasnap.DBClient, Datasnap.Provider, Data.DBXDataSnap,
  IPPeerClient, Data.DBXCommon, Datasnap.DSConnect, uCC;

type
  TDMClient = class(TDataModule)
    cdsEMPLOYEE: TClientDataSet;
    cdsAUX: TClientDataSet;
    cdsEMPLOYEEEMP_NO: TSmallintField;
    cdsEMPLOYEEFIRST_NAME: TStringField;
    cdsEMPLOYEELAST_NAME: TStringField;
    cdsEMPLOYEEPHONE_EXT: TStringField;
    cdsEMPLOYEEHIRE_DATE: TSQLTimeStampField;
    cdsEMPLOYEEDEPT_NO: TStringField;
    cdsEMPLOYEEJOB_CODE: TStringField;
    cdsEMPLOYEEJOB_GRADE: TSmallintField;
    cdsEMPLOYEEJOB_COUNTRY: TStringField;
    cdsEMPLOYEESALARY: TFMTBCDField;
    cdsEMPLOYEEFULL_NAME: TStringField;
    conEMPLOYEE: TSQLConnection;
    prvEMPLOYEE: TDSProviderConnection;
  private
    { Private declarations }
    // Client Module
    FInstanceOwner: Boolean;
    FDMServerClient: TDMServerClient;
    function GetDMServerClient: TDMServerClient;
  public
    { Public declarations }
    function mediaSalario(): Currency;
    // Client Module
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property DMServerClient: TDMServerClient read GetDMServerClient write FDMServerClient;

  end;

var
  DMClient: TDMClient;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

//uses uDMServer;

{$R *.dfm}

{ TDMClient }

function TDMClient.mediaSalario: Currency;
begin
  result := DMServerClient.mediaSalario();
  //result := DMServer.mediaSalario();
end;

constructor TDMClient.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor TDMClient.Destroy;
begin
  FDMServerClient.Free;
  inherited;
end;

function TDMClient.GetDMServerClient: TDMServerClient;
begin
  if FDMServerClient = nil then
  begin
    conEMPLOYEE.Open;
    FDMServerClient:= TDMServerClient.Create(conEMPLOYEE.DBXConnection, FInstanceOwner);
  end;
  Result := FDMServerClient;
end;


end.
