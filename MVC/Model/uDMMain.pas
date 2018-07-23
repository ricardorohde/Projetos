unit uDMMain;

interface

uses
  SysUtils, Classes, WideStrings, DBXInterbase, DB, SqlExpr, IBCustomDataSet,
  IBQuery, IBDatabase;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

end.
