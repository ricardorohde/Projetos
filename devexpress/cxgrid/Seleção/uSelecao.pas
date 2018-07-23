unit uSelecao;

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
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, StdCtrls, ExtCtrls,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, DBClient, cxButtonEdit,
  cxHyperLinkEdit;

type
  TForm1 = class(TForm)
    ClientDataSet1: TClientDataSet;
    tv: TcxGridDBTableView;
    lv: TcxGridLevel;
    cxGrid1: TcxGrid;
    DataSource1: TDataSource;
    ClientDataSet1CODIGO: TIntegerField;
    ClientDataSet1DESCRICAO: TStringField;
    tvCODIGO: TcxGridDBColumn;
    tvDESCRICAO: TcxGridDBColumn;
    tvSelecionar: TcxGridDBColumn;
    Panel1: TPanel;
    Button1: TButton;
    tvColumn1: TcxGridDBColumn;
    tvColumn2: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure tvSelecionarHeaderClick(Sender: TObject);
    procedure tvColumn1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
    FCheck : Boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
var
  i : Integer;
begin
  FCheck := False;
  ClientDataSet1.CreateDataSet;

  for i := 1 to 20 do
    ClientDataSet1.AppendRecord([i, 'RESGITRO - ' + IntToStr(i)]);

  tv.DataController.DataModeController.SmartRefresh := True;
end;

procedure TForm1.tvSelecionarHeaderClick(Sender: TObject);
var
  i : Integer;
begin
  tv.DataController.BeginUpdate;
  for i := 0 to tv.DataController.FilteredRecordCount -1 do
  begin
    tv.ViewData.Records[i].Values[tvSelecionar.Index] := not FCheck;
  end;
  tv.DataController.EndUpdate;

  FCheck := not FCheck;
end;

procedure TForm1.tvColumn1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  ShowMessage('teste');
end;

end.
