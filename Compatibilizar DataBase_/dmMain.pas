unit dmMain;

interface

uses
  SysUtils, Classes, {DBXFirebird,} DB, SqlExpr, WideStrings, DBXDevartInterBase;

type
  TDataModule1 = class(TDataModule)
    Conexao: TSQLConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
