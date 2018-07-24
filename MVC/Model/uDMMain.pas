unit uDMMain;

interface

uses
  SysUtils, Classes, WideStrings, DBXInterbase, DB, SqlExpr, IBCustomDataSet,
  IBQuery, IBDatabase, IniFiles, Forms, BaseLibrary;

type
  TDataModule1 = class(TDataModule)
    IBDatabase1: TIBDatabase;
    IBQuery1: TIBQuery;
    IBDataSet1: TIBDataSet;
    IBTransaction1: TIBTransaction;
    IBDataSet1FILIAL: TIntegerField;
    IBDataSet1CODIGO: TIntegerField;
    IBDataSet1AVISO_STATUS: TIBStringField;
    IBDataSet1TIPO: TIBStringField;
    IBDataSet1FINALIDADE: TIBStringField;
    IBDataSet1NATUREZA: TIBStringField;
    IBDataSet1ENDERECO: TIBStringField;
    IBDataSet1COMPLEMENTO: TIBStringField;
    IBDataSet1BAIRRO: TIBStringField;
    IBDataSet1MUNICIPIO: TIBStringField;
    IBDataSet1ESTADO: TIBStringField;
    IBDataSet1CEP: TIBStringField;
    IBDataSet1AREA_UTIL: TIBBCDField;
    IBDataSet1VALOR: TIBBCDField;
    IBDataSet1VALOR_CONDOMINIO: TIBBCDField;
    IBDataSet1VALOR_IPTU: TIBBCDField;
    IBDataSet1CODIGO_PROPRIETARIO: TIntegerField;
    procedure IBDatabase1BeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

procedure TDataModule1.IBDatabase1BeforeConnect(Sender: TObject);
var
  ArquivoINI: TIniFile;
  Arquivo: string;
begin
  Arquivo:= ExtractFilePath(Application.ExeName)+'\Config.ini';
  if not FileExists(Arquivo) then
  begin
    Erro('Arquivo INI não encontrado.');
    Exit;
  end;

  try
    ArquivoINI := TIniFile.Create(Arquivo);
    try
      IBDatabase1.Connected:= False;
      IBDatabase1.DatabaseName:= ArquivoINI.ReadString('configuracao', 'Caminho', '');
      IBDatabase1.LoginPrompt:= False;
      IBDatabase1.Params.Clear;
      IBDatabase1.Params.Add(Format('user_name=%s', [ArquivoINI.ReadString('configuracao', 'user_name', 'SYSDBA')]));
      IBDatabase1.Params.Add(Format('password=%s', [ArquivoINI.ReadString('configuracao', 'password', 'masterkey')]));
    except on e:exception do
      Erro(e.message);
    end;
  finally
    ArquivoINI.Free;
  end;
end;

end.
