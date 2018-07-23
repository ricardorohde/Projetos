unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxmdaset, AltSetupMemData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  StdCtrls, Buttons, ExtCtrls;

type
  TForm1 = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    SetupMemData1: TSetupMemData;
    DataSource1: TDataSource;
    SetupMemData1Selecao: TBooleanField;
    SetupMemData1Ano: TIntegerField;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cxGrid1DBTableView1Selecao: TcxGridDBColumn;
    cxGrid1DBTableView1Ano: TcxGridDBColumn;
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
begin
  SetupMemData1.Close;
  SetupMemData1.Open;
  SetupMemData1.Append;
  SetupMemData1Ano.AsInteger := 2010;
  SetupMemData1.Post;
  SetupMemData1.Append;
  SetupMemData1Ano.AsInteger := 2011;
  SetupMemData1.Post;
  SetupMemData1.Append;
  SetupMemData1Ano.AsInteger := 2012;
  SetupMemData1.Post;
  SetupMemData1.Append;
  SetupMemData1Ano.AsInteger := 2013;
  SetupMemData1.Post;
end;

end.
