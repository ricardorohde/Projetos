unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids;

type
  TForm1 = class(TForm)
    db_source: TADOConnection;
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
var
  caminho_base : string;
begin
  caminho_base := 'C:\temp\exe\CONEXAO';

  db_source.Close;
//  db_source.ConnectionString:='Provider=MSDASQL.1;Persist Security Info=False;'+
//                              'Data Source=Arquivos do dBASE;'+
//                              'Extended Properties=DSN=Arquivos do dBASE;DBQ='+
//                              caminho_base+';DefaultDir='+caminho_base+';DriverId=533;'+
//                              'MaxBufferSize=2048;PageTimeout=5;;Initial Catalog='+
//                              caminho_base;

//  db_source.ConnectionString:='Provider=Microsoft.ACE.OLEDB.12.0;Data Source='+caminho_base+';Extended Properties=dBase IV;';
  db_source.ConnectionString:='Provider=Microsoft.JET.OLEDB.4.0;Data Source='+caminho_base+';Extended Properties=dBase IV;';
  db_source.LoginPrompt := False;
  db_source.Open;

  ADOQuery1.Open;
end;

end.
