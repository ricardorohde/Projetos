unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, MemDS, DBAccess, Uni, UniProvider,
  ODBCUniProvider, ASEUniProvider, DBTables, ItDatabase;

type
  TForm1 = class(TForm)
    UniConnection1: TUniConnection;
    UniQuery1: TUniQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ASEUniProvider1: TASEUniProvider;
    Session: TSession;
    dbMain: TItDatabase;
    procedure FormShow(Sender: TObject);
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
  sl : TStringList;
  lNow : TDateTime;
  qry  : TQuery;
begin
  sl := TStringList.Create;
  qry  := TQuery.Create(nil);
  try
    sl.Add('SELECT   O.CODORG CODORG,');
    sl.Add('         O.NOMORG NOMORG,');
    sl.Add('         O.CDSTATUS_ORGANIZACAO CDSTATUS_ORGANIZACAO,');
    sl.Add('         O.CDPESSOA CDPESSOA,');
    sl.Add('         O.LOGOTP LOGOTP,');
    sl.Add('         O.CDOPERADOR_INCLUSAO CDOPERADOR_INCLUSAO,');
    sl.Add('         O.DTINCLUSAO DTINCLUSAO,');
    sl.Add('         O.CDSITUACAO CDSITUACAO,');
    sl.Add('         O.CDOPERADOR_ALTERACAO CDOPERADOR_ALTERACAO,');
    sl.Add('         O.DTALTERACAO DTALTERACAO,');
    sl.Add('         O.SNGESTOR SNGESTOR');
    sl.Add('FROM   ORGANIZACAO O');
//    sl.Add('where 1 =3');
    sl.Add('ORDER BY   NOMORG');

    lNow := Now;
    qry.Close;
    qry.DatabaseName := 'dbMain';
    qry.SessionName  := 'Session';
    qry.SQL.Assign(sl);
    qry.Open;
    lNow := lNow - Now;

    ShowMessage('BDE  ' + FormatDateTime('hh:nn:zzz', lNow));

    lNow := Now;
    UniQuery1.Close;
    UniQuery1.SQL.Clear;
    UniQuery1.SQL.Assign(sl);
    UniQuery1.Open;
    lNow := lNow - Now;

    ShowMessage('UNIDAC  ' + FormatDateTime('hh:nn:zzz', lNow));
  finally
    FreeAndNil(Qry);
    FreeAndNil(sl);
  end;
end;

end.
