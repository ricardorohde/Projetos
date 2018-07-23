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

program PrjClient;

uses
  MidasLib,
  Vcl.Forms,
  uFrmMain in 'uFrmMain.pas' {FrmMain},
  uDMClient in 'uDMClient.pas' {DMClient: TDataModule},
  uFrmEmployee in 'uFrmEmployee.pas' {FrmEmployee},
  uFrmEditEmployee in 'uFrmEditEmployee.pas' {FrmEditEmployee},
  uCC in 'uCC.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMClient, DMClient);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
