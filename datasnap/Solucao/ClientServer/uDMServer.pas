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

unit uDMServer;

interface

uses
  System.SysUtils, System.Classes, Data.DBXFirebird, Data.FMTBcd, Data.SqlExpr,
  Datasnap.Provider, Data.DB, Datasnap.DBClient, Datasnap.Win.TConnect,
  Datasnap.DSServer;

type
  TDMServer = class(TDSServerModule)
    conEMPLOYEE: TSQLConnection;
    qryEMPLOYEE: TSQLDataSet;
    qryEMPLOYEEEMP_NO: TSmallintField;
    qryEMPLOYEEFIRST_NAME: TStringField;
    qryEMPLOYEELAST_NAME: TStringField;
    qryEMPLOYEEPHONE_EXT: TStringField;
    qryEMPLOYEEHIRE_DATE: TSQLTimeStampField;
    qryEMPLOYEEDEPT_NO: TStringField;
    qryEMPLOYEEJOB_CODE: TStringField;
    qryEMPLOYEEJOB_GRADE: TSmallintField;
    qryEMPLOYEEJOB_COUNTRY: TStringField;
    qryEMPLOYEESALARY: TFMTBCDField;
    qryEMPLOYEEFULL_NAME: TStringField;
    dspEMPLOYEE: TDataSetProvider;
    qryAUX: TSQLDataSet;
    dspAUX: TDataSetProvider;
    qryMediaSalario: TSQLQuery;
    qryMediaSalarioMEDIA_SALARIO: TFMTBCDField;
    LocalConnection: TLocalConnection;
  private
    { Private declarations }
  public
    { Public declarations }
     function mediaSalario: Currency;
  end;

var
  DMServer: TDMServer;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TDMServer.mediaSalario: Currency;
begin
  // processa um cálculo remoto, pesado, business, regra
  qryMediaSalario.Open();
  result := qryMediaSalario.Fields[0].AsCurrency;
  qryMediaSalario.Close();
end;

end.
