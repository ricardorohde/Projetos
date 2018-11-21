unit Module;

interface

uses
  System.SysUtils, System.Classes, uADStanIntf, uADStanOption, uADStanError,
  uADGUIxIntf, uADPhysIntf, uADStanDef, uADStanPool, uADStanAsync,
  uADPhysManager, uADPhysMySQL, Data.DB, uADCompClient, Inifiles, Forms, LIB;

type
  TConfigBanco = record
    DataBase: string;
    Servidor: string;
    Usuario: string;
    Senha: string;
    DriverID: string;
  end;

  TDataModule1 = class(TDataModule)
    ADConnection1: TADConnection;
    ADPhysMySQLDriverLink1: TADPhysMySQLDriverLink;
    procedure DataModuleCreate(Sender: TObject);
    procedure ADConnection1Error(ASender: TObject;
      const AInitiator: IADStanObject; var AException: Exception);
  private
    function LerConfiguracaoBanco: TConfigBanco;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

Function TDataModule1.LerConfiguracaoBanco(): TConfigBanco;
begin
  with TIniFile.Create(ExtractFilePath(Application.Exename) + 'IntPrestashop.ini') do
  try
    if ReadString('Dados', 'DataBase', '') = ''  then
    else
    begin
      Result.DataBase:=ReadString('Dados', 'DataBase', '');
      Result.Servidor:=ReadString('Dados', 'Servidor', '');
      Result.Usuario:=ReadString('Dados', 'User_name', '');
      Result.Senha:=ReadString('Dados', 'password', '');
      Result.DriverID:=ReadString('Dados', 'DriverID', '');
    end
  finally
    free;
  end;
end;

procedure TDataModule1.ADConnection1Error(ASender: TObject;
  const AInitiator: IADStanObject; var AException: Exception);
begin
  Erro('Não foi possivel realizar a conexão');
  Application.Terminate;
end;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
var
  ConfigBanco: TConfigBanco;
begin
  ConfigBanco:= LerConfiguracaoBanco();
  try
    ADConnection1.Close;
    ADConnection1.Params.Clear;
    ADConnection1.Params.Add(Format('Server=%s', [ConfigBanco.Servidor]));
    ADConnection1.Params.Add(Format('Database=%s', [ConfigBanco.Database]));
    ADConnection1.Params.Add(Format('User_Name=%s', [ConfigBanco.Usuario]));
    ADConnection1.Params.Add(Format('Password=%s', [ConfigBanco.Senha]));
    ADConnection1.Params.Add(Format('DriverID=%s', [ConfigBanco.DriverID]));
    ADConnection1.Connected:= True;
    if not ADConnection1.Connected then
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
