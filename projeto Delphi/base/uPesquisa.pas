unit uPesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids;

type
  TfrmPesquisa = class(TForm)
    dbgrd1: TDBGrid;
    pnl1: TPanel;
    btn1: TBitBtn;
    dsPesquisa: TDataSource;
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FDataSet : TDataSet;

    procedure SetDataSet(const Value: TDataSet);

    { Private declarations }
  public
    { Public declarations }

    property DataSet : TDataSet write SetDataSet;
  end;

var
  frmPesquisa: TfrmPesquisa;

implementation

{$R *.dfm}

procedure TfrmPesquisa.btn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPesquisa.SetDataSet(const Value: TDataSet);
begin
  FDataSet := Value;
end;

procedure TfrmPesquisa.FormShow(Sender: TObject);
begin
  dsPesquisa.DataSet := FDataSet;
end;

end.
