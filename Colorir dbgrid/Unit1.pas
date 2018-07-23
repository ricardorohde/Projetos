unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids;

type
  TForm1 = class(TForm)
    ClientDataSet1: TClientDataSet;
    ClientDataSet1CODIGO: TIntegerField;
    ClientDataSet1DESCRICAO: TStringField;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
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
  ClientDataSet1.CreateDataSet;

  for i := 1 to 20 do
  begin
    ClientDataSet1.AppendRecord([i, 'REGISTRO - ' + IntToStr(i)]);
  end;
end;

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (ClientDataSet1CODIGO.AsInteger mod 2 = 0) then
    DBGrid1.Canvas.Brush.Color := $00819AFE;

  DBGrid1.Canvas.FillRect(Rect);
  DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
end;

end.
