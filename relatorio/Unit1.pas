unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, dxmdaset, AltSetupMemData, DBClient;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Master: TClientDataSet;
    MasterCdFornecedor: TStringField;
    MasterNmFornecedor: TStringField;
    Detail: TClientDataSet;
    DetailCdFornecedor: TStringField;
    DetailNrNota: TStringField;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Master.Close;
  Detail.Close;

  if not Master.Active then
    Master.CreateDataSet;

  if not Detail.Active then
    Detail.CreateDataSet;

  Master.Append;
  MasterCdFornecedor.AsString := '1';
  MasterNmFornecedor.AsString := 'Fornecedor 1';
  Master.Post;

  Master.Append;
  MasterCdFornecedor.AsString := '2';
  MasterNmFornecedor.AsString := 'Fornecedor 2';
  Master.Post;

//********************************************************************

  Detail.Append;
  DetailNrNota.AsString := '0001';
  DetailCdFornecedor.AsString := '1';
  Detail.Post;

  Detail.Append;
  DetailNrNota.AsString := '0002';
  DetailCdFornecedor.AsString := '1';
  Detail.Post;

  Detail.Append;
  DetailNrNota.AsString := '0003';
  DetailCdFornecedor.AsString := '1';
  Detail.Post;

  Detail.Append;
  DetailNrNota.AsString := '0004';
  DetailCdFornecedor.AsString := '1';
  Detail.Post;

  Detail.Append;
  DetailNrNota.AsString := '0005';
  DetailCdFornecedor.AsString := '2';
  Detail.Post;

  Detail.Append;
  DetailNrNota.AsString := '0006';
  DetailCdFornecedor.AsString := '2';
  Detail.Post;

  Detail.Append;
  DetailNrNota.AsString := '0007';
  DetailCdFornecedor.AsString := '2';
  Detail.Post;

  Detail.Append;
  DetailNrNota.AsString := '0008';
  DetailCdFornecedor.AsString := '2';
  Detail.Post;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form2.QuickRep1.Preview;
end;

end.
