unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, MemDS, DBAccess, Uni, UniProvider,
  PostgreSQLUniProvider;

type
  TForm1 = class(TForm)
    PostgreSQLUniProvider1: TPostgreSQLUniProvider;
    UniConnection1: TUniConnection;
    UniQuery1: TUniQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
