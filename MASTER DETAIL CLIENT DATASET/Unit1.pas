unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, Grids, DBGrids, DB, DBClient;

type
  TForm1 = class(TForm)
    cdsMaster: TClientDataSet;
    cdsDetalhe: TClientDataSet;
    cdsMasterID: TAutoIncField;
    cdsMasterNome: TStringField;
    cdsDetalheID: TAutoIncField;
    cdsDetalheID_MASTER: TIntegerField;
    cdsDetalhedescricao: TStringField;
    dtsMaster: TDataSource;
    dtsDetalhe: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    DBNavigator1: TDBNavigator;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
//
  cdsMaster.CreateDataSet;
  cdsDetalhe.CreateDataSet;
end;

end.
