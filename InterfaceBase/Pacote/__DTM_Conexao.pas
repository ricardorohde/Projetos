unit __DTM_Conexao;

interface

uses
  SysUtils, Classes, DBTables, Sockets, DB, ItDatabase, UniProvider,
  PostgreSQLUniProvider, DBAccess, Uni, ODBCUniProvider, ASEUniProvider,
  SQLServerUniProvider;

type
  TdtmConexao = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmConexao: TdtmConexao;

implementation

{$R *.dfm}

end.
