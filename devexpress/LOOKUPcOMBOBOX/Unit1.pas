unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, DBClient, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxDBLookupComboBox, WinSkinData;

type
  TForm1 = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ClientDataSet1: TClientDataSet;
    ClientDataSet2: TClientDataSet;
    ClientDataSet3: TClientDataSet;
    ClientDataSet1DESCRICAO: TStringField;
    ClientDataSet1CODIGO: TIntegerField;
    ClientDataSet1TIPO: TStringField;
    ClientDataSet2CODPRG: TIntegerField;
    ClientDataSet2DESCRICAO: TStringField;
    ClientDataSet3TIPO: TStringField;
    ClientDataSet3DESCRICAO: TStringField;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    cxGrid1DBTableView1DESCRICAO: TcxGridDBColumn;
    cxGrid1DBTableView1CODIGO: TcxGridDBColumn;
    cxGrid1DBTableView1TIPO: TcxGridDBColumn;
    skdata: TSkinData;
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
  skdata.Active := True;
  ClientDataSet1.CreateDataSet;
  ClientDataSet2.CreateDataSet;
  ClientDataSet3.CreateDataSet;

  ClientDataSet1.Append;
  ClientDataSet1DESCRICAO.AsString := 'TESTE';
  ClientDataSet1CODIGO.AsInteger   := 1;
  ClientDataSet1TIPO.AsString      := 'TX';
  ClientDataSet1.Post;

  ClientDataSet2.Append;
  ClientDataSet2CODPRG.AsInteger := 1;
  ClientDataSet2DESCRICAO.AsString := 'Notebook';
  ClientDataSet2.Post;
  ClientDataSet2.Append;
  ClientDataSet2CODPRG.AsInteger := 2;
  ClientDataSet2DESCRICAO.AsString := 'Teclado';
  ClientDataSet2.Post;
  ClientDataSet2.Append;
  ClientDataSet2CODPRG.AsInteger := 3;
  ClientDataSet2DESCRICAO.AsString := 'Mouse';
  ClientDataSet2.Post;
  ClientDataSet2.Append;
  ClientDataSet2CODPRG.AsInteger := 4;
  ClientDataSet2DESCRICAO.AsString := 'Monitor';
  ClientDataSet2.Post;
  ClientDataSet2.Append;
  ClientDataSet2CODPRG.AsInteger := 5;
  ClientDataSet2DESCRICAO.AsString := 'Web-Cam';
  ClientDataSet2.Post;


  ClientDataSet3.Append;
  ClientDataSet3TIPO.AsString := 'TX';
  ClientDataSet3DESCRICAO.AsString := 'TIPO-TX';
  ClientDataSet3.Post;

  ClientDataSet3.Append;
  ClientDataSet3TIPO.AsString := 'BR';
  ClientDataSet3DESCRICAO.AsString := 'TIPO-BR';
  ClientDataSet3.Post;

  ClientDataSet3.Append;
  ClientDataSet3TIPO.AsString := 'RA';
  ClientDataSet3DESCRICAO.AsString := 'TIPO-RA';
  ClientDataSet3.Post;
end;

end.
