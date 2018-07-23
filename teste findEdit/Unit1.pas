unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, EMSTable, StdCtrls, Mask, LookupEdit,
  dbLookUpEdit, DBFindEdit, DBSearchEdit, wwdbedit, Wwdotdot, uEditButton,
  DBEditBtn, DBEditbtnDescricao;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    Button1: TButton;
    ClientDataSet1: TClientDataSet;
    DataSource2: TDataSource;
    ClientDataSet1Codigo: TIntegerField;
    ClientDataSet1Nome_Empresa: TStringField;
    DBSearchEdit1: TDBSearchEdit;
    ClientDataSet2: TClientDataSet;
    ClientDataSet2Codigo: TIntegerField;
    ClientDataSet2Nome_Empresa: TStringField;
    Edit1: TEdit;
    wwDBComboDlg1: TwwDBComboDlg;
    DBEditBtn1: TDBEditBtn;
    Button2: TButton;
    DBEditbtnDescricao1: TDBEditbtnDescricao;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBEditBtn1KeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
var
  i : Integer;
begin
  ClientDataSet2.CreateDataSet;
  ClientDataSet1.CreateDataSet;
  for i := 0 to 20 do
  begin
    ClientDataSet2.AppendRecord([i, 'Descrição - ' + IntToStr(i)]);
    ClientDataSet1.AppendRecord([i, 'Empresa - ' + IntToStr(i)]);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ClientDataSet2.Append;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Perform(Wm_NextDlgCtl,0,0);
end;

procedure TForm1.DBEditBtn1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    ShowMessage('tralha');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Close;
end;

end.
