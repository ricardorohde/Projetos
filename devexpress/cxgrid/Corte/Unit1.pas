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
  cxGridCustomView, cxGrid, DBClient;

type
  TForm1 = class(TForm)
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Campo: TStringField;
    ClientDataSet1Valor: TStringField;
    tv: TcxGridDBTableView;
    lv: TcxGridLevel;
    cxGrid1: TcxGrid;
    DataSource1: TDataSource;
    tvCampo: TcxGridDBColumn;
    tvValor: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxGrid1TableView1: TcxGridTableView;
    cxGrid1TableView1Column1: TcxGridColumn;
    cxGrid1TableView1Column2: TcxGridColumn;
    procedure FormShow(Sender: TObject);
  private
    function Replicate(Valor, Caracter: String; Quant: Integer): String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function TForm1.Replicate(Valor, Caracter:String; Quant:Integer ): String;
var I : Integer;
begin
  Result := Valor;
  for I := Length(Valor) to Quant do
    Result := Result + Caracter;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  i : Integer;
begin
  ClientDataSet1.CreateDataSet;

  ClientDataSet1.Append;
  ClientDataSet1Campo.AsString := 'Saldo Anterior....................:';
//  ClientDataSet1Campo.AsString := Replicate('Saldo Anterior', '.', 33) + ':';
  ClientDataSet1.Post;
  ClientDataSet1.Append;
//  ClientDataSet1Campo.AsString := Replicate('Adquiridos nesta Fatura', '.', 33) + ':';
  ClientDataSet1Campo.AsString := 'Adquiridos nesta Fatura.......:';
  ClientDataSet1.Post;
  ClientDataSet1.Append;
//  ClientDataSet1Campo.AsString := Replicate('Bonificações', '.', 33) + ':';
  ClientDataSet1Campo.AsString := 'Bonificações......................:';
  ClientDataSet1.Post;
  ClientDataSet1.Append;
//  ClientDataSet1Campo.AsString := Replicate('Ajustes (+/-)', '.', 33) + ':';
  ClientDataSet1Campo.AsString := 'Ajustes (+/-).....................:';
  ClientDataSet1.Post;
  ClientDataSet1.Append;
//  ClientDataSet1Campo.AsString := Replicate('Resgates', '.', 33) + ':';
  ClientDataSet1Campo.AsString := 'Resgates..........................:';
  ClientDataSet1.Post;
  ClientDataSet1.Append;
//  ClientDataSet1Campo.AsString := Replicate('Expirados', '.', 33) + ':';
  ClientDataSet1Campo.AsString := 'Expirados.........................:';
  ClientDataSet1.Post;
  ClientDataSet1.Append;
//  ClientDataSet1Campo.AsString := Replicate('Turbinados', '.', 33) + ':';
  ClientDataSet1Campo.AsString := 'Turbinados.......................:';
  ClientDataSet1.Post;
  ClientDataSet1.Append;
//  ClientDataSet1Campo.AsString := Replicate('Total de Ptos a Expirar', '.', 33) + ':';
  ClientDataSet1Campo.AsString := 'Total de Ptos a Expirar......:';
  ClientDataSet1.Post;
  ClientDataSet1.Append;
//  ClientDataSet1Campo.AsString := Replicate('Total de Pontos', '.', 33) + ':';
  ClientDataSet1Campo.AsString := 'Total de Pontos................:';
  ClientDataSet1.Post;

  cxGrid1.Enabled := False;


//  cxGrid1TableView1.DataController.RecordCount := ClientDataSet1.RecordCount + 1;
//  ClientDataSet1.First;
//  while not ClientDataSet1.Eof do
//    begin
//      cxGrid1TableView1.DataController.SetValue(ClientDataSet1.RecNo, 0, ClientDataSet1Campo.AsString);
//      cxGrid1TableView1.DataController.SetValue(ClientDataSet1.RecNo, 1, ClientDataSet1Valor.AsString);
//      ClientDataSet1.Next;
//    end;
end;

end.
