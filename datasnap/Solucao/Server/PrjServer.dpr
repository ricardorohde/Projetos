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

program PrjServer;

uses
  Vcl.Forms,
  uFrmMain in 'uFrmMain.pas' {FrmMain},
  uSC in 'uSC.pas' {SC: TDataModule},
  uDMServer in '..\ClientServer\uDMServer.pas' {DMServer: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TSC, SC);
  Application.CreateForm(TDMServer, DMServer);
  Application.Run;
end.

