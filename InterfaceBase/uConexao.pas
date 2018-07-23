unit uConexao;

interface

uses DB, DBAccess, Uni, Dialogs;

type
  TTipoConexao = (tcSqlServer, tcPostgres);

  procedure Conectar(Con : TUniConnection; Tipo : TTipoConexao; Usuario, Senha, Servidor, DataBase : string);

implementation

procedure Conectar(Con : TUniConnection; Tipo : TTipoConexao; Usuario, Senha, Servidor, DataBase : string);
//var
//  lSqlServerProvider : TSQLServerUniProvider;
//  lPGProvider        : PostgreSQLUniProvider;
begin
//  lSqlServerProvider := TSQLServerUniProvider.Create(con);
//  lPGProvider        := TPostgreSQLUniProvider.Create(con);
  try
    with con do
      begin
        ProviderName := 'SQL Server';
        if (Tipo = tcPostgres) then
          ProviderName := 'PostgreSQL';
        Password := Senha;
        Username := Usuario;
        Server   := Servidor;
        Database := DataBase;
        Connect;
      end;
  except
    ShowMessage('Erro ao conectar.');
  end;
end;
end.
