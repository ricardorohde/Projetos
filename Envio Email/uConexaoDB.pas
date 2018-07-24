unit uConexaoDB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Data.DB, Datasnap.DBClient, Data.Win.ADODB, System.IniFiles;

  type
    TConfiguracao = class
  private
    FServidor: string;
    FSenha: string;
    FDataBase: string;
    FUsuario: string;
    procedure SetDataBase(const Value: string);
    procedure SetSenha(const Value: string);
    procedure SetServidor(const Value: string);
    procedure SetUsuario(const Value: string);
    public
      property Servidor: string read FServidor write SetServidor;
      property DataBase: string read FDataBase write SetDataBase;
      property Usuario: string read FUsuario write SetUsuario;
      property Senha: string read FSenha write SetSenha;
    end;

    TConexao = class
      private
        Fcon: TADOConnection;
        Fconfiguracao: TConfiguracao;

        procedure Setcon(const Value: TADOConnection);
        procedure CriarEstrutura();
        function TabelaExiste(schema, tablename: string): Boolean;
        procedure CriarTabelaEmail();
        procedure LerConfiguracao();
    procedure CriarTabelaUsuario;
      public
        property con: TADOConnection read Fcon write Setcon;
        procedure Conectar();
    end;

implementation


{ TConexao }

procedure TConexao.LerConfiguracao();
var
  ArqIni: TIniFile;
  lsFileName: string;
begin
  lsFileName:= ExtractFilePath(Application.ExeName) + 'Configuracao.ini';
  if not FileExists(lsFileName) then
    raise Exception.Create('Arquivo de configuração não existe. Verifique!');

  ArqIni := TIniFile.Create(lsFileName);

  if not Assigned(Fconfiguracao) then
    Fconfiguracao:= TConfiguracao.Create;

  try
    Fconfiguracao.Servidor:= ArqIni.ReadString('CONFIG', 'SERVER', '');
    Fconfiguracao.DataBase:= ArqIni.ReadString('CONFIG', 'DATABASE', '');
    Fconfiguracao.Usuario:= ArqIni.ReadString('CONFIG', 'USER', '');
    Fconfiguracao.Senha:= ArqIni.ReadString('CONFIG', 'SENHA', '');
  finally
    FreeAndNil(ArqIni);
  end;
end;


procedure TConexao.Conectar();
begin
  LerConfiguracao();

  con.Connected:= False;
  try
//    con.ConnectionString:= Format('Provider=SQLOLEDB.1;Password=%s;Persist Security Info=True;User ID=%s;Initial Catalog=%s;Data Source=%s',
//                                 [Fconfiguracao.Senha, Fconfiguracao.Usuario, Fconfiguracao.DataBase, Fconfiguracao.Servidor]);
    con.ConnectionString:= 'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;User ID=sa;Initial Catalog=email;Data Source=EDSON-PC\SQLEXPRESS';
    con.Connected:= True;
  except on e:exception do
    raise Exception.Create('Erro: '+ e.Message);
  end;

  FreeAndNil(Fconfiguracao);

  if con.Connected then
    CriarEstrutura();
end;

function TConexao.TabelaExiste(schema, tablename: string): Boolean;
var
  Query: TADOQuery;
begin
  Query:= TADOQuery.Create(nil);
  try
    Query.Connection:= con;
    Query.SQL.Text:= 'SELECT case when EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES'+
                     Format(' WHERE TABLE_SCHEMA = %s AND  TABLE_NAME = %s) then 1 else 0 end', [QuotedStr( schema ), QuotedStr( tablename )]);
    Query.Open;

    Result:= Query.Fields[0].AsInteger = 1;
  finally
    FreeAndNil(Query);
  end;
end;

procedure TConexao.CriarEstrutura();
begin
  if not TabelaExiste('dbo', 'tblEmail') then
    CriarTabelaEmail();

  if not TabelaExiste('dbo', 'tblUsuario') then
    CriarTabelaUsuario();
end;

procedure TConexao.CriarTabelaEmail();
var
  Query: TADOQuery;
begin
  Query:= TADOQuery.Create(nil);
  try
    Query.Connection:= con;
    Query.SQL.Add('CREATE TABLE dbo.tblEmail (');
    Query.SQL.Add('	ID INT IDENTITY(1,1) PRIMARY KEY,');
    Query.SQL.Add('	remetente varchar(255),');
    Query.SQL.Add('	assunto varchar(255),');
    Query.SQL.Add('	texto text,');
    Query.SQL.Add('	IdUsuario int NOT NULL,');
    Query.SQL.Add('	idEmail int NOT NULL');
    Query.SQL.Add(')');
    Query.ExecSQL;
  finally
    FreeAndNil(Query);
  end;
end;

procedure TConexao.CriarTabelaUsuario();
var
  Query: TADOQuery;
begin
  Query:= TADOQuery.Create(nil);
  try
    Query.Connection:= con;
    Query.SQL.Add('CREATE TABLE dbo.tblUsuario (');
    Query.SQL.Add('	ID INT IDENTITY(1,1) PRIMARY KEY,');
    Query.SQL.Add('	Nome varchar(50),');
    Query.SQL.Add('	Login varchar(50),');
    Query.SQL.Add('	Senha varchar(50)');
    Query.SQL.Add(')');
    Query.ExecSQL;
  finally
    FreeAndNil(Query);
  end;
end;

procedure TConexao.Setcon(const Value: TADOConnection);
begin
  Fcon := Value;
end;

{ TConfiguracao }

procedure TConfiguracao.SetDataBase(const Value: string);
begin
  FDataBase := Value;
end;

procedure TConfiguracao.SetSenha(const Value: string);
begin
  FSenha := Value;
end;

procedure TConfiguracao.SetServidor(const Value: string);
begin
  FServidor := Value;
end;

procedure TConfiguracao.SetUsuario(const Value: string);
begin
  FUsuario := Value;
end;

end.
