unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, DBClient, StdCtrls, cxGridBandedTableView,
  cxGridDBBandedTableView;

type
  TForm1 = class(TForm)
    Button1: TButton;
    cdsMaster: TClientDataSet;
    cdsDetalhe: TClientDataSet;
    cdsMastercdEmpresa: TIntegerField;
    cdsMasterNmEmpresa: TStringField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dtsMaster: TDataSource;
    dtsDetalhe: TDataSource;
    cdsDetalheCdEmpresa: TIntegerField;
    cdsDetalheNmFuncionario: TStringField;
    cdsDetalheCdChamada: TStringField;
    cxGrid1DBTableView1cdEmpresa: TcxGridDBColumn;
    cxGrid1DBTableView1NmEmpresa: TcxGridDBColumn;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView2CdEmpresa: TcxGridDBColumn;
    cxGrid1DBTableView2NmFuncionario: TcxGridDBColumn;
    cxGrid1DBTableView2CdChamada: TcxGridDBColumn;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBTableView3: TcxGridDBTableView;
    cxGrid1DBBandedTableView2: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView2CdEmpresa: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView3: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView3NmFuncionario: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView3CdChamada: TcxGridDBBandedColumn;
    cxGrid1DBTableView3cdEmpresa: TcxGridDBColumn;
    cxGrid1DBTableView3NmEmpresa: TcxGridDBColumn;
    cxGrid1Level2: TcxGridLevel;
    cxGrid1DBBandedTableView4: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView4CdChamada: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView5: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView6: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView7: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView8: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView8NmFuncionario: TcxGridDBBandedColumn;
    dtsDetalhe2: TDataSource;
    cdsDetalhe2: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    cxGrid1DBBandedTableView7CdChamada: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView6CdEmpresa: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView6NmFuncionario: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView6CdChamada: TcxGridDBBandedColumn;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  cdsMaster.CreateDataSet;
  cdsDetalhe.CreateDataSet;

  cdsMaster.Append;
  cdsMastercdEmpresa.AsInteger := 1;
  cdsMasterNmEmpresa.AsString  := uppercase('Alterdata tecnologia em informatica');
  cdsMaster.Post;

  cdsDetalhe.Append;
  cdsDetalheCdEmpresa.AsInteger := 1;
  cdsDetalheNmFuncionario.AsString := 'Edson de Melo Santos';
  cdsDetalheCdChamada.AsString     := '00001';
  cdsDetalhe.Post;

  cdsDetalhe.Append;
  cdsDetalheCdEmpresa.AsInteger := 1;
  cdsDetalheNmFuncionario.AsString := 'Luana Aguiar';
  cdsDetalheCdChamada.AsString     := '00002';
  cdsDetalhe.Post;

  cdsDetalhe.Append;
  cdsDetalheCdEmpresa.AsInteger := 1;
  cdsDetalheNmFuncionario.AsString := 'Emerson Soares';
  cdsDetalheCdChamada.AsString     := '00003';
  cdsDetalhe.Post;
end;

end.
