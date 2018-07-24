unit uFrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, ExtCtrls, ComCtrls, Grids, DBGrids, Mask, DB;

type
  TFrmMain = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    DBNavigator1: TDBNavigator;
    DataSource1: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses uDM;

{$R *.dfm}

procedure TFrmMain.Button1Click(Sender: TObject);
begin
  dm.ClientDataSet1.ApplyUpdates(-1);
end;

procedure TFrmMain.Button2Click(Sender: TObject);
var
  CPF : string;
begin
  CPF:=InputBox('Chamando método remoto','Qual o nº do seu CPF?','');

  DM.DCOMConnection1.AppServer.VerificarCPF(CPF);

  ShowMessage('CPF válido');
end;

end.
