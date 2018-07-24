unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, EMSTable, StdCtrls, Mask, LookupEdit,
  dbLookUpEdit, DBFindEdit, DBSearchEdit;

type
  TForm1 = class(TForm)
    EMSTable1: TEMSTable;
    DataSource1: TDataSource;
    EMSTable1codigo: TIntegerField;
    EMSTable1descricao: TStringField;
    Button1: TButton;
    ClientDataSet1: TClientDataSet;
    DataSource2: TDataSource;
    ClientDataSet1Codigo: TIntegerField;
    ClientDataSet1Nome_Empresa: TStringField;
    DBSearchEdit1: TDBSearchEdit;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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
  EMSTable1.CreateDataSet;
  ClientDataSet1.CreateDataSet;
  for i := 0 to 20 do
  begin
    EMSTable1.AppendRecord([i, 'Descrição - ' + IntToStr(i)]);
    ClientDataSet1.AppendRecord([i, 'Empresa - ' + IntToStr(i)]);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  EMSTable1.Append;
end;

end.
