unit uAcessaBanco;

interface
  uses SysUtils, StdCtrls, Windows, Classes, DB, StrUtils,
  Variants, ExtCtrls,  Controls, Dialogs, IBCustomDataSet, IBQuery,
  IBDatabase;

  Type TState = (tsInsert, tsEdit, tsDelete, tsSearch); // tipo state para verificar se é insert, edit ou delete


  Type TRegistro = record  //struct que contem os dados da form
    Codigo     : Integer;
    Nome       : string;
    Cnpj       : string;
    Logradouro : string;
    Numero     : Integer;
    Cidade     : string;
    Bairro     : String;
    Uf         : string;
  end;

type TAcessaBanco = class
  private
    FRegistro   : TRegistro;
    FState      : TState;
    dbEmpresa   : TIBDatabase;
    qryEmpresa  : TIBQuery;
    Transaction : TIBTransaction;           //o firebid usa Transaction

    function GetRegistro: TRegistro;
    procedure SetRegistro(const Value: TRegistro);

    procedure Conectar;
    procedure Gravar(TableName  : string);
    procedure Deletar(TableName : string);
    procedure Editar(TableName  : string);

    procedure CriarTabela(TableName : string);

    function FindTableInDatabase(TableName: String): Boolean;

    function GetState: TState;
    procedure SetState(const Value: TState);

  public
    property Registro : TRegistro read GetRegistro write SetRegistro;
    property State    : TState    read GetState    write SetState;

    procedure Execute;

    function  Selecionar(TableName : string) : TDataSet;

    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;

end;

implementation

const
  cDatabaseName  = 'localhost';
//  CDatabaseFile  = 'AC.gdb';
  Directory_Base = 'localhost:C:\Users\thiago.dsn.pack\Documents\projeto Delphi\base\AC.gdb';    // mudar o diretorio do banco
  tblEmpresa     = 'EMPRESA';


{ TAcessaBanco }

procedure TAcessaBanco.AfterConstruction;        // depois que a classe é chamada
begin
  inherited;
  Conectar;
  CriarTabela(tblEmpresa);
end;

procedure TAcessaBanco.BeforeDestruction;
begin
  FreeAndNil(dbEmpresa);
  FreeAndNil(qryEmpresa);
  FreeAndNil(Transaction);

  inherited;
end;

procedure TAcessaBanco.Conectar;
begin
  // crio componentes para conexão e seleção das informações
  dbEmpresa   := TIBDatabase.Create(nil);
  qryEmpresa  := TIBQuery.Create(nil);
  Transaction := TIBTransaction.Create(nil);

  qryEmpresa.Database         := dbEmpresa;
  Transaction.DefaultDatabase := dbEmpresa;
  qryEmpresa.Transaction      := Transaction;

  // passo os parâmetros para conexão do IB.
  dbEmpresa.AllowStreamedConnected := True;
  dbEmpresa.DatabaseName           := Directory_Base;
  dbEmpresa.LoginPrompt            := False;
  dbEmpresa.Params.Add('user_name=SYSDBA');
  dbEmpresa.Params.Add('password=masterkey');
  dbEmpresa.SQLDialect   := 3;
  dbEmpresa.Connected    := True;
end;

procedure TAcessaBanco.CriarTabela(TableName : string);
begin
  if not FindTableInDatabase(TableName) then
    begin
      with qryEmpresa do
        begin
          Close;
          SQL.Clear;
          SQL.Add('CREATE TABLE ' + TableName);
          SQL.Add('(codEmpresa INTEGER');
          SQL.Add(' ,NmEmpresa VARCHAR(45)');
          SQL.Add(' ,Cnpj VARCHAR(20)');
          SQL.Add(' ,Logradouro VARCHAR(60)');
          SQL.Add(' ,Numero INTEGER');
          SQL.Add(',Cidade VARCHAR(40)');
          SQL.Add(',Bairro VARCHAR(35)');
          SQL.Add(', Uf VARCHAR(2));');
          ExecSQL;
        end;
    end;
end;

procedure TAcessaBanco.Execute;
begin
  case FState of
    tsInsert  : Gravar(tblEmpresa);
    tsDelete  : Deletar(tblEmpresa);
    tsEdit    : Editar(tblEmpresa);
  end;
end;

function TAcessaBanco.FindTableInDatabase(TableName: String): Boolean;
begin
  with qryEmpresa do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT RDB$RELATION_NAME AS TableName');
      SQL.Add('FROM RDB$RELATIONS');
      SQL.Add('WHERE RDB$VIEW_BLR IS NULL');
      SQL.Add('  AND (RDB$SYSTEM_FLAG = 0 OR RDB$SYSTEM_FLAG IS NULL)');
      SQL.Add('  and RDB$RELATION_NAME = '+ QuotedStr(TableName));
      Open;

      result := not IsEmpty;
    end;
end;

function TAcessaBanco.GetRegistro: TRegistro;
begin
  Result := FRegistro;
end;

function TAcessaBanco.GetState: TState;
begin
  result := FState;
end;

procedure TAcessaBanco.Gravar(TableName : string);
begin
  if (TableName = tblempresa) and
     FindTableInDatabase(TableName) then
    begin
      with qryEmpresa do
         begin
           Close;
           SQL.Clear;
           SQL.Add('INSERT INTO ' + tblEmpresa);
           SQL.Add('VALUES ('+ IntToStr(FRegistro.Codigo));
           SQL.Add('   ,'+ QuotedStr(FRegistro.Nome));
           SQL.Add('   ,'+ QuotedStr(FRegistro.Cnpj));
           SQL.Add('   ,'+ QuotedStr(FRegistro.Logradouro));
           SQL.Add('   ,'+ IntToStr(FRegistro.Numero));
           SQL.Add('   ,'+ QuotedStr(FRegistro.Cidade));
           SQL.Add('   ,'+ QuotedStr(FRegistro.Bairro));
           SQL.Add('   ,'+ QuotedStr(FRegistro.Uf) + ');');
           ExecSQL;
         end;
    end;
end;

procedure TAcessaBanco.Deletar(TableName: string);
begin
  if (TableName = tblempresa) and
     FindTableInDatabase(TableName) then
    begin
      with qryEmpresa do
        begin
          Close;
          SQL.Clear;
          SQL.Add('DELETE FROM ' + tblEmpresa);
          SQL.Add('WHERE CODEMPRESA = '+ IntToStr(FRegistro.Codigo));
          ExecSQL;
        end;
    end;

end;

procedure TAcessaBanco.SetRegistro(const Value: TRegistro);
begin
  FRegistro := Value;
end;

procedure TAcessaBanco.SetState(const Value: TState);
begin
  FState := Value;
end;

procedure TAcessaBanco.Editar(TableName: string);
begin
  if (TableName = tblempresa) and
     FindTableInDatabase(TableName) then
    begin
      with qryEmpresa do
        begin
          Close;
          SQL.Clear;
          SQL.Add('UPDATE ' + tblEmpresa + ' SET ');
          SQL.Add('   NMEMPRESA = '+ QuotedStr(FRegistro.Nome));
          SQL.Add('   ,CNPJ = '+ QuotedStr(FRegistro.Cnpj));
          SQL.Add('   ,LOGRADOURO = '+ QuotedStr(FRegistro.Logradouro));
          SQL.Add('   ,NUMERO = '+ IntToStr(FRegistro.Numero));
          SQL.Add('   ,CIDADE = '+ QuotedStr(FRegistro.Cidade));
          SQL.Add('   ,BAIRRO = '+ QuotedStr(FRegistro.Bairro));
          SQL.Add('   ,UF = '+ QuotedStr(FRegistro.Uf));
          SQL.Add('WHERE CODEMPRESA = ' + IntToStr(FRegistro.Codigo) + ';');
          ExecSQL;
        end;
    end;
end;

function TAcessaBanco.Selecionar(TableName: string): TDataSet;
begin
  Result := nil;
  if (TableName = tblempresa) and
     FindTableInDatabase(TableName) then
    begin
      with qryEmpresa do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select * ');
          SQL.Add('from '+ TableName);
          //SQL.Add('WHERE CODEMPRESA = ' + IntToStr(FRegistro.Codigo) + ';');
          Open;
        end;

      Result := qryEmpresa;
    end;
end;

end.
