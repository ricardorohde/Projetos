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

unit uFrmEmployee;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Data.DB;

type
  TFrmEmployee = class(TForm)
    DBGrid1: TDBGrid;
    EdtName: TEdit;
    BtPesquisar: TButton;
    Label1: TLabel;
    dsEmployee: TDataSource;
    procedure BtPesquisarClick(Sender: TObject);
    procedure EditEmployee(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEmployee: TFrmEmployee;

implementation

{$R *.dfm}

uses uDMClient, uFrmEditEmployee;

procedure TFrmEmployee.BtPesquisarClick(Sender: TObject);
begin
  DMClient.cdsAUX.Close();
  DMClient.cdsAUX.Params[0].AsString := EdtName.Text + '%';
  DMClient.cdsAUX.Open();
end;

procedure TFrmEmployee.EditEmployee(Sender: TObject);
begin
  // edição state-less
  FrmEditEmployee := TFrmEditEmployee.Create(Application);
  try
    DMClient.cdsEMPLOYEE.Params[0].AsInteger :=
      DMClient.cdsAUX.Fields[0].AsInteger;
    DMClient.cdsEMPLOYEE.Open();
    DMClient.cdsAUX.Close();
    FrmEditEmployee.ShowModal();
  finally
    FrmEditEmployee.Release();
  end;
end;

end.
