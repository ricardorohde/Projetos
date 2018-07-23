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
  cxGridDBTableView, cxGrid, cxGridCardView, cxGridDBCardView;

type
  TForm1 = class(TForm)
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DataSource1: TDataSource;
    cdsCorte: TClientDataSet;
    cxGrid1DBCardView1: TcxGridDBCardView;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cdsCorteCampo1: TStringField;
    cdsCorteCampo2: TStringField;
    cdsCorteCampo3: TStringField;
    cdsCorteCampo4: TStringField;
    cdsCorteCampo5: TStringField;
    cdsCorteCampo6: TStringField;
    cdsCorteCampo7: TStringField;
    cdsCorteCampo8: TStringField;
    cdsCorteCampo9: TStringField;
    cxGrid1DBCardView1Campo1: TcxGridDBCardViewRow;
    cxGrid1DBCardView1Campo2: TcxGridDBCardViewRow;
    cxGrid1DBCardView1Campo3: TcxGridDBCardViewRow;
    cxGrid1DBCardView1Campo4: TcxGridDBCardViewRow;
    cxGrid1DBCardView1Campo5: TcxGridDBCardViewRow;
    cxGrid1DBCardView1Campo6: TcxGridDBCardViewRow;
    cxGrid1DBCardView1Campo7: TcxGridDBCardViewRow;
    cxGrid1DBCardView1Campo8: TcxGridDBCardViewRow;
    cxGrid1DBCardView1Campo9: TcxGridDBCardViewRow;
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
  cdsCorte.CreateDataSet;
  
  cdsCorte.Append;
  cdsCorteCampo1.AsString := 'N° da Fatura.....................:';
  cdsCorteCampo2.AsString := 'Referência........................:';
  cdsCorteCampo3.AsString := 'Vencimento.......................:';
  cdsCorteCampo4.AsString := 'Emissão............................:';
  cdsCorteCampo5.AsString := 'Geração...........................:';
  cdsCorteCampo6.AsString := 'Valor................................:';
  cdsCorteCampo7.AsString := 'N° Fidelidade....................: ';
  cdsCorte.Post;

  cdsCorte.Append;
  cdsCorteCampo1.AsString := 'Saldo Anterior...................: ';
  cdsCorteCampo2.AsString := 'Adquiridos nesta Fatura......:';
  cdsCorteCampo3.AsString := 'Bonificações.....................:';
  cdsCorteCampo4.AsString := 'Ajustes (+/-)......................:';
  cdsCorteCampo5.AsString := 'Resgates..........................:';
  cdsCorteCampo6.AsString := 'Expirados..........................:';
  cdsCorteCampo7.AsString := 'Turbinados........................:';
  cdsCorteCampo8.AsString := 'Total de Ptos a Expirar.......:';
  cdsCorteCampo9.AsString := 'Total de Pontos.................:';
  cdsCorte.Post;
end;

end.
