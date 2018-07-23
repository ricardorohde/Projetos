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
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, DBClient, cxGridDBDataDefinitions, StdCtrls,
  ExtCtrls;

type
  TForm1 = class(TForm)
    cds1: TClientDataSet;
    cds1id: TIntegerField;
    cds1Descricao: TStringField;
    cds1Valor: TFloatField;
    dts1: TDataSource;
    tv: TcxGridDBTableView;
    lv: TcxGridLevel;
    cxGrid1: TcxGrid;
    tvid: TcxGridDBColumn;
    tvDescricao: TcxGridDBColumn;
    tvValor: TcxGridDBColumn;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
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
  cds1.CreateDataSet;


  cds1.Append;
  cds1id.AsInteger := 1;
  cds1Descricao.AsString := 'Teste1';
  cds1Valor.AsFloat      := 1000;
  cds1.Post;

  cds1.Append;
  cds1id.AsInteger := 1;
  cds1Descricao.AsString := 'Teste2';
  cds1Valor.AsFloat      := 1000;
  cds1.Post;

  cds1.Append;
  cds1id.AsInteger := 2;
  cds1Descricao.AsString := 'Teste3';
  cds1Valor.AsFloat      := 2000;
  cds1.Post;

  cds1.Append;
  cds1id.AsInteger := 2;
  cds1Descricao.AsString := 'Teste4';
  cds1Valor.AsFloat      := 500;
  cds1.Post;

  cds1.Append;
  cds1id.AsInteger := 3;
  cds1Descricao.AsString := 'Teste5';
  cds1Valor.AsFloat      := 600;
  cds1.Post;

  cds1.Append;
  cds1id.AsInteger := 3;
  cds1Descricao.AsString := 'Teste6';
  cds1Valor.AsFloat      := 700;
  cds1.Post;


  tv.ViewData.Expand(False);
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin

  end;
end;

end.
