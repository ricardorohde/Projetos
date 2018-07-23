unit udmMain;

interface

uses
  SysUtils, Classes, {DBXFirebird,} DB, SqlExpr, WideStrings, DBXDevartInterBase;

type
  TdmMain = class(TDataModule)
    ConexaoOrigem: TSQLConnection;
    ConexaoDestino: TSQLConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMain: TdmMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
