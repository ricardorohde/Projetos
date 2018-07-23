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

unit uFrmEditEmployee;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls;

type
  TFrmEditEmployee = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsEMPLOYEE: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    BtGravar: TButton;
    BtBusiness: TButton;
    EdMediaSalario: TEdit;
    procedure BtGravarClick(Sender: TObject);
    procedure BtBusinessClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEditEmployee: TFrmEditEmployee;

implementation

{$R *.dfm}

uses uDMClient;

procedure TFrmEditEmployee.BtBusinessClick(Sender: TObject);
var
  MediaSalario: Currency;
begin
  MediaSalario := DMClient.mediaSalario();
  // chama método de negócio
  EdMediaSalario.Text := CurrToStr(MediaSalario);
end;

procedure TFrmEditEmployee.BtGravarClick(Sender: TObject);
begin
  DMClient.cdsEMPLOYEE.Post();
  DMClient.cdsEMPLOYEE.ApplyUpdates(0);
  DMClient.cdsEMPLOYEE.Close();
  Close();
end;

end.
