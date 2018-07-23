unit uDM;

interface

uses
  SysUtils, Classes, IniFiles, Forms, IBDatabase, DB, Windows, Messages,
  IBCustomDataSet, IBQuery;

type
  TDM = class(TDataModule)
    Database: TIBDatabase;
    Transacao: TIBTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function SelecionarEstado(pUF: String): string;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
var
  Arquivo: string;
  data : TIniFile;
  DataBaseName: string;
  ServerName: string;
begin
  Arquivo:= ExtractFilePath(Application.ExeName)+ 'TestCondo.ini';
  try
    data := TIniFile.Create(Arquivo);
    if data.ReadString('Dados', 'Servidor', '') <> EmptyStr then
      ServerName:= data.ReadString('Dados', 'Servidor', EmptyStr);

    if data.ReadString('Dados', 'Caminho', '') <> EmptyStr then
      DataBaseName:= data.ReadString('Dados', 'Caminho', EmptyStr);

    if (DataBaseName <> EmptyStr) and (ServerName <> EmptyStr) then
      DataBaseName:= ServerName + ':' + DataBaseName;

    Database.DatabaseName:= DataBaseName;

    if DataBaseName = EmptyStr then
    begin
      Application.MessageBox(PWideChar('Arquivo INI não está configurado corretamente. Verifique!'), PWideChar('Aviso'), MB_OK + MB_ICONWARNING);
      Application.Terminate;
    end;
  finally
    data.Free;
  end;
end;

function TDM.SelecionarEstado(pUF: String): string;
var
  Query: TIBQuery;
begin
  Result := '';
  try
    Query:= TIBQuery.Create(nil);
    Query.Database:= Database;
    Query.Transaction:= Transacao;
    Query.SQL.Text:= Format('SELECT DESCRICAO_UF FROM GR_ESTADO WHERE UF = %s', [QuotedStr(pUF)]);
    Query.Open;

    if not Query.IsEmpty then
      Result:= Query.Fields[0].AsString;
  finally
    FreeAndNil(Query);
  end;
end;


end.
