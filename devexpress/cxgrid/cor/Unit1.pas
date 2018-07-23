unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TForm1 = class(TForm)
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Flag: TStringField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DataSource1: TDataSource;
    cxGrid1DBTableView1Flag: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    EstiloAzul: TcxStyle;
    EstiloVermelho: TcxStyle;
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure cxGrid1DBTableView1FlagGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
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
begin
  ClientDataSet1.CreateDataSet;

  ClientDataSet1.Append;
  ClientDataSet1Flag.AsString := 'S';
  ClientDataSet1.Post;

  ClientDataSet1.Append;
  ClientDataSet1Flag.AsString := 'N';
  ClientDataSet1.Post;

  ClientDataSet1.Append;
  ClientDataSet1Flag.AsString := 'N';
  ClientDataSet1.Post;

  ClientDataSet1.Append;
  ClientDataSet1Flag.AsString := 'S';
  ClientDataSet1.Post;

  ClientDataSet1.Append;
  ClientDataSet1Flag.AsString := 'S';
  ClientDataSet1.Post;

  ClientDataSet1.Append;
  ClientDataSet1Flag.AsString := 'S';
  ClientDataSet1.Post;

  ClientDataSet1.Append;
  ClientDataSet1Flag.AsString := 'N';
  ClientDataSet1.Post;

  ClientDataSet1.Append;
  ClientDataSet1Flag.AsString := 'N';
  ClientDataSet1.Post;
end;

procedure TForm1.cxGrid1DBTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  AStyle := EstiloAzul;
  if VarToStrDef(ARecord.Values[cxGrid1DBTableView1Flag.Index], 'N') = 'N' then
    AStyle := EstiloVermelho;
end;

procedure TForm1.cxGrid1DBTableView1FlagGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  AText := 'Não';

  if VarToStrDef(ARecord.Values[cxGrid1DBTableView1Flag.Index], 'N') = 'S' then
    AText := 'Sim';
end;

end.
