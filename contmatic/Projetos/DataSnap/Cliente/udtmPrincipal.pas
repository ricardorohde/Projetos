unit udtmPrincipal;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect, SConnect;

type
  TdtmPrincipal = class(TDataModule)
    SocketConnection1: TSocketConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmPrincipal: TdtmPrincipal;

implementation

{$R *.dfm}

procedure TdtmPrincipal.DataModuleCreate(Sender: TObject);
begin
  SocketConnection1.Connected  := False;
  SocketConnection1.ServerName := 'Servidor.DataSnapServer';
  SocketConnection1.ServerGUID := '{773F1CB1-3295-49DD-940C-7EF7F47A2D37}';
  SocketConnection1.Host       := 'localhost';
  SocketConnection1.Connected  := True;  
end;

end.
