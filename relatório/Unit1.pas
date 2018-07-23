unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, DBClient, Grids, DBGrids;

type
  TForm1 = class(TForm)
    ClientDataSet1: TClientDataSet;
    Button1: TButton;
    ClientDataSet1TESTE1: TStringField;
    ClientDataSet1TESTE2: TStringField;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ClientDataSet1Total: TFloatField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  i : Integer;
begin
  ClientDataSet1.CreateDataSet;

  for i := 1 to 10 do
    ClientDataSet1.AppendRecord(['TESTE'+ IntToStr(i), 'TESTE'+ IntToStr(i), (i * 120)]);

  Form2.QuickRep1.Preview;
end;

end.
