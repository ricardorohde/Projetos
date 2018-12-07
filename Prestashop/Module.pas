unit Module;

interface

uses
  System.SysUtils, System.Classes, IniFiles, Forms, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Data.Bind.Components,
  Data.Bind.ObjectScope, REST.Client;


type
  TConfigBanco = record
    DataBase: string;
    Servidor: string;
    Usuario: string;
    Senha: string;
    Porta: string;
    DriverID: string;
  end;

  TDataModule1 = class(TDataModule)
    Conexao: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    function LerConfiguracaoBanco: TConfigBanco;
    { Private declarations }
  public
    { Public declarations }
    function MaxId(Tabela, Campo: string): Integer;
    function Find(Tabela, Filtro: String): Boolean;
    procedure AtualizaIdPrestashop(Tabela, Filtro, CampoId: String; ValorId: Integer);
  end;

var
  DataModule1: TDataModule1;

implementation

uses
  Lib;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

Function TDataModule1.LerConfiguracaoBanco(): TConfigBanco;
begin
  with TIniFile.Create(ExtractFilePath(Application.Exename) + 'IntPrestashop.ini') do
  try
    if ReadString('Dados', 'DataBase', '') <> ''  then
    begin
      Result.DataBase:=ReadString('Dados', 'DataBase', '');
      Result.Servidor:=ReadString('Dados', 'Servidor', '');
      Result.Usuario:=ReadString('Dados', 'User_name', '');
      Result.Senha:=ReadString('Dados', 'password', '');
      Result.Porta:=ReadString('Dados', 'Porta', '');
      Result.DriverID:=ReadString('Dados', 'DriverID', '');
    end;
  finally
    free;
  end;
end;

Function TDataModule1.MaxId(Tabela, Campo: string): Integer;
var
  Query: TFDQuery;
begin
  result:= 1;
  try
    Query:= TFDQuery.Create(nil);
    Query.Connection:= Conexao;
    Query.Open(Format('SELECT Max(%s) FROM %s', [Campo, Tabela]));

    if not Query.IsEmpty and not Query.Fields[0].IsNull then
      result:= Query.Fields[0].AsInteger + 1;
  finally
    FreeAndNil( Query );
  end;
end;

function TDataModule1.Find(Tabela, Filtro: String): Boolean;
var
  Query: TFDQuery;
begin
  try
    Query:= TFDQuery.Create(nil);
    Query.Connection:= Conexao;
    Query.Open(Format('SELECT 1 FROM %s WHERE %s LIMIT 1', [Tabela, Filtro]));
    result:= not Query.IsEmpty;
  finally
    FreeAndNil( Query );
  end;
end;

procedure TDataModule1.AtualizaIdPrestashop(Tabela, Filtro, CampoId: String; ValorId: Integer);
var
  Query: TFDQuery;
begin
  try
    Query:= TFDQuery.Create(nil);
    Query.Connection:= Conexao;
    Query.SQL.Text:= Format('update %s set %s = %d where %s', [Tabela, CampoId, ValorId, Filtro]);
    Query.ExecSQL
  finally
    FreeAndNil( Query );
  end;
end;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
var
  ConfigBanco: TConfigBanco;
begin
  ConfigBanco:= LerConfiguracaoBanco();
  try
    Conexao.Close;
    Conexao.Params.Clear;
    Conexao.Params.Add(Format('Server=%s', [ConfigBanco.Servidor]));
    Conexao.Params.Add(Format('Database=%s', [ConfigBanco.Database]));
    Conexao.Params.Add(Format('User_Name=%s', [ConfigBanco.Usuario]));
    Conexao.Params.Add(Format('Password=%s', [ConfigBanco.Senha]));
    Conexao.Params.Add(Format('Port=%s', [ConfigBanco.Porta]));
    Conexao.Params.Add(Format('DriverID=%s', [ConfigBanco.DriverID]));
    Conexao.Connected:= True;
    if not Conexao.Connected then
    begin
      Erro('Não foi possivel realizar a conexão');
      Application.Terminate;
    end;
  except on E:exception do
    begin
      Erro('Não foi possivel realizar a conexão');
      Application.Terminate;
    end;
  end;
end;



end.
