unit uMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SUIForm, SUIButton, dxCore, dxButton, DB, XPMan,
  DBTables, StdCtrls, DBCtrls, TFlatPanelUnit, Mask, AdvEdit, SUIEdit,
  ColEnter, dbAleNavegador, Grids, DBGrids, dbAleGrids, ColLabel;

type
  TForm1 = class(TForm)
    suiForm1: TsuiForm;
    Query1: TQuery;
    XPManifest1: TXPManifest;
    dsCep: TDataSource;
    suiButton1: TsuiButton;
    edtCep: TAdvMaskEdit;
    Label1: TLabel;
    Panel: TFlatPanel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBComboBox1: TDBComboBox;
    suiButton6: TsuiButton;
    btNova: TsuiButton;
    btCadastar: TsuiButton;
    btExcluir: TsuiButton;
    btGravar: TsuiButton;
    Query1CEP: TStringField;
    Query1CIDADE: TStringField;
    Query1LOGRADOURO: TStringField;
    Query1BAIRRO: TStringField;
    Query1UF: TStringField;
    btCancelar: TsuiButton;
    Table1: TTable;
    ColEnter1: TColEnter;
    panel2: TFlatPanel;
    tAleDBNav1: tAleDBNav;
    suiButton2: TsuiButton;
    AleDBGrid1: TAleDBGrid;
    btavancado: TsuiButton;
    Registro: TLabel;
    procedure dxButton2Click(Sender: TObject);
    procedure suiButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure suiButton6Click(Sender: TObject);
    procedure btNovaClick(Sender: TObject);
    procedure btCadastarClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure edtCepExit(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure suiButton2Click(Sender: TObject);
    procedure btavancadoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.dxButton2Click(Sender: TObject);
begin
close;
end;

procedure TForm1.suiButton1Click(Sender: TObject);
begin
close;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
count:integer;
begin
count:=table1.RecordCount;
registro.Caption:='Quantidade de Ceps Cadastrados : ' + IntToStr(count);
panel.Hide;
panel2.Hide;
btnova.Hide;
btCadastar.Hide;
btExcluir.Hide;
btgravar.Hide;
btcancelar.Hide;
end;

procedure TForm1.suiButton6Click(Sender: TObject);
begin
if edtCep.Text <> '' then
    begin
    panel.Show;
    Query1.SQL.Text := 'select * from Cep where CEP='+''''+edtCep.Text+''''+'';
    Query1.Open;
    btnova.Show;
    btCadastar.Show;
    btExcluir.Show;
    btgravar.Show;
    btcancelar.Show;
end;
end;

procedure TForm1.btNovaClick(Sender: TObject);
begin
panel.Hide;
btnova.Hide;
edtcep.Clear;
btCadastar.Hide;
btExcluir.Hide;
btgravar.Hide;
btcancelar.Hide;
end;

procedure TForm1.btCadastarClick(Sender: TObject);
begin
query1.Close;
dscep.DataSet:=table1;
table1.Insert;
dbedit1.SetFocus;
end;

procedure TForm1.btGravarClick(Sender: TObject);
var
count:integer;
begin
Table1.FieldByName('cep').AsString:=edtcep.Text;
table1.Post;
begin
count:=table1.RecordCount;
registro.Caption:='Quantidade de Ceps Cadastrados : ' + IntToStr(count);
dscep.DataSet:=query1;
panel.Hide;
btnova.Hide;
edtcep.Clear;
btCadastar.Hide;
btExcluir.Hide;
btgravar.Hide;
btcancelar.Hide;
end;
end;

procedure TForm1.btExcluirClick(Sender: TObject);
var
count:integer;
begin
if application.MessageBox('Deseja Excluir Este Cep do Banco de Dados?','Confirmação!',+mb_iconquestion + mb_yesno)=idyes then
query1.Delete;
panel.Hide;
btnova.Hide;
edtcep.Clear;
btCadastar.Hide;
btExcluir.Hide;
btgravar.Hide;
btcancelar.Hide;
count:=table1.RecordCount;
registro.Caption:='Quantidade de Ceps Cadastrados : ' + IntToStr(count);
end;

procedure TForm1.edtCepExit(Sender: TObject);
begin
suibutton6.SetFocus;
end;

procedure TForm1.btCancelarClick(Sender: TObject);
begin
query1.Cancel;
panel.Hide;
btnova.Hide;
edtcep.Clear;
btCadastar.Hide;
btExcluir.Hide;
btgravar.Hide;
btcancelar.Hide;
end;

procedure TForm1.suiButton2Click(Sender: TObject);
begin
dscep.DataSet:=query1;
panel2.Hide;
btavancado.Show;
end;

procedure TForm1.btavancadoClick(Sender: TObject);
begin
dscep.DataSet:=table1;
panel2.Show;
panel2.Align:=alclient;
btavancado.Hide;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
form1:=nil;
end;

end.
