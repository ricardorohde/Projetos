unit dtmPrincipal;

interface

uses
  SysUtils, Classes, Sockets, DB, DBTables, ItDatabase;

type
  TdmPrincipal = class(TDataModule)
    Session: TSession;
    dbMain: TItDatabase;
    TcpClient: TTcpClient;
    sprb0033: TStoredProc;
    Query1: TQuery;
    procedure dbMainBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function RemoverCaracteres(pValue, pTipo : String) : string;
    function SelecionarEstado(pUF : String) : string;
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{$R *.dfm}

procedure TdmPrincipal.dbMainBeforeConnect(Sender: TObject);
//var HostName:String;
begin
//  HostName :=  TcpClient.LocalHostAddr+ '; sa' ;// + '; ' + TcpClient.LocalHostName;
//
//  dbMain.params.values['DATABASE NAME'] := '';
//  dbMain.params.values['HOST NAME'] := HostName;
//  dbMain.params.values['APPLICATION NAME'] := TcpClient.LocalHostName;
end;

function TdmPrincipal.RemoverCaracteres(pValue, pTipo: String): string;
begin
  with sprb0033 do
  begin
    ParamByName('@PSTRING_ORIGEM').AsString := pValue;
    ParamByName('@PTIPO').AsString          := pTipo;
    ExecProc;

    result := ParamByName('@PSTRING_ALTERADO').AsString;
  end;
end;

function TdmPrincipal.SelecionarEstado(pUF: String): string;
begin
  Query1.Close;
  Query1.SessionName  := Session.Name;
  Query1.DatabaseName := dbMain.DatabaseName;
  Query1.SQL.Clear;
  Query1.SQL.Add('SELECT NOESTADO FROM ESTADO');
  Query1.SQL.Add('WHERE CDSIGLA_ESTADO = ' + QuotedStr(pUF));
//  Query1.SQL.SaveToFile('c:\edson.txt');
  Query1.Open;

  if not Query1.IsEmpty then
  begin
    Query1.First;
    Result := Query1.Fields.fieldByName('NOESTADO').AsString;
  end;
end;

end.
