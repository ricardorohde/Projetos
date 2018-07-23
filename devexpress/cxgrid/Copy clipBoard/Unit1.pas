unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit,
  DB, cxDBData, Grids, DBGrids, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, StdCtrls, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, DBTables, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxDataStorage, cxCurrencyEdit,
  ExtCtrls, DBClient, ClipBrd, Variants;

type
  TForm1 = class(TForm)
    DataSource2: TDataSource;
    tv: TcxGridDBTableView;
    lv: TcxGridLevel;
    cxGrid1: TcxGrid;
    tvOrderNo: TcxGridDBColumn;
    tvCustNo: TcxGridDBColumn;
    tvFreight: TcxGridDBColumn;
    tvAmountPaid: TcxGridDBColumn;
    Panel1: TPanel;
    Button1: TButton;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1OrderNo: TIntegerField;
    ClientDataSet1CustNo: TIntegerField;
    ClientDataSet1Freight: TFloatField;
    ClientDataSet1AmountPaid: TFloatField;
    procedure cxGrid1DBTableView1AmountPaidPropertiesEditValueChanged(
      Sender: TObject);
    procedure tvKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tvCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    procedure AlimentarDados();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses cxVariants, cxDataUtils, Gerar_CSV;

procedure TForm1.AlimentarDados();
begin
  ClientDataSet1.CreateDataSet;

  ClientDataSet1.Append;
  ClientDataSet1OrderNo.AsInteger := 1023;
  ClientDataSet1CustNo.AsInteger  := 1221;
  ClientDataSet1Freight.AsFloat   := 0;
  ClientDataSet1AmountPaid.AsFloat:= 4674;
  ClientDataSet1.Post;

  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1076	; ClientDataSet1CustNo.AsInteger  := 1221;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 17781     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1123	; ClientDataSet1CustNo.AsInteger  := 1221;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 13945     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1169	; ClientDataSet1CustNo.AsInteger  := 1221;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 9471.95   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1176	; ClientDataSet1CustNo.AsInteger  := 1221;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 4178.85   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1269	; ClientDataSet1CustNo.AsInteger  := 1221;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 1400      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1060	; ClientDataSet1CustNo.AsInteger  := 1231;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 15355     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1073	; ClientDataSet1CustNo.AsInteger  := 1231;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 19414     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1102	; ClientDataSet1CustNo.AsInteger  := 1231;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 2844      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1160	; ClientDataSet1CustNo.AsInteger  := 1231;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 2206.85   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1173	; ClientDataSet1CustNo.AsInteger  := 1231;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 54        ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1178	; ClientDataSet1CustNo.AsInteger  := 1231;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 5511.75   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1202	; ClientDataSet1CustNo.AsInteger  := 1231;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 4205      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1278	; ClientDataSet1CustNo.AsInteger  := 1231;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 11568     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1302	; ClientDataSet1CustNo.AsInteger  := 1231;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 24485     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1003	; ClientDataSet1CustNo.AsInteger  := 1351;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 0         ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1052	; ClientDataSet1CustNo.AsInteger  := 1351;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 16788     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1055	; ClientDataSet1CustNo.AsInteger  := 1351;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 23406     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1067	; ClientDataSet1CustNo.AsInteger  := 1351;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 4495      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1075	; ClientDataSet1CustNo.AsInteger  := 1351;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 8560      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1087	; ClientDataSet1CustNo.AsInteger  := 1351;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 14045     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1152	; ClientDataSet1CustNo.AsInteger  := 1351;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 97698.6   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1155	; ClientDataSet1CustNo.AsInteger  := 1351;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 13935.95  ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1163	; ClientDataSet1CustNo.AsInteger  := 1351;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 342       ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1255	; ClientDataSet1CustNo.AsInteger  := 1351;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 64115.75  ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1275	; ClientDataSet1CustNo.AsInteger  := 1351;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 16939.5   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1104	; ClientDataSet1CustNo.AsInteger  := 1354;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 51673.15  ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1292	; ClientDataSet1CustNo.AsInteger  := 1354;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 7986.9    ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1005	; ClientDataSet1CustNo.AsInteger  := 1356;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 4807      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1059	; ClientDataSet1CustNo.AsInteger  := 1356;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 2150      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1072	; ClientDataSet1CustNo.AsInteger  := 1356;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 3596      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1080	; ClientDataSet1CustNo.AsInteger  := 1356;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 9634      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1105	; ClientDataSet1CustNo.AsInteger  := 1356;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 31219.95  ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1180	; ClientDataSet1CustNo.AsInteger  := 1356;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 3640      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1266	; ClientDataSet1CustNo.AsInteger  := 1356;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 6935      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1280	; ClientDataSet1CustNo.AsInteger  := 1356;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 4317.75   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1305	; ClientDataSet1CustNo.AsInteger  := 1356;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 3065      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1006	; ClientDataSet1CustNo.AsInteger  := 1380;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 0         ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1079	; ClientDataSet1CustNo.AsInteger  := 1380;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 4445      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1106	; ClientDataSet1CustNo.AsInteger  := 1380;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 3531.8    ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1153	; ClientDataSet1CustNo.AsInteger  := 1380;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 3860.85   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1253	; ClientDataSet1CustNo.AsInteger  := 1380;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 4774.85   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1007	; ClientDataSet1CustNo.AsInteger  := 1384;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 6500      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1027	; ClientDataSet1CustNo.AsInteger  := 1384;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 25210     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1033	; ClientDataSet1CustNo.AsInteger  := 1384;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 1238      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1100	; ClientDataSet1CustNo.AsInteger  := 1384;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 0         ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1107	; ClientDataSet1CustNo.AsInteger  := 1384;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 28389     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1124	; ClientDataSet1CustNo.AsInteger  := 1384;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 33071     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1127	; ClientDataSet1CustNo.AsInteger  := 1384;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 25071     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1200	; ClientDataSet1CustNo.AsInteger  := 1384;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 1827      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1207	; ClientDataSet1CustNo.AsInteger  := 1384;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 12949.7   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1300	; ClientDataSet1CustNo.AsInteger  := 1384;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 52729.25  ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1008	; ClientDataSet1CustNo.AsInteger  := 1510;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 0         ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1025	; ClientDataSet1CustNo.AsInteger  := 1510;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 930       ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1125	; ClientDataSet1CustNo.AsInteger  := 1510;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 6583.8    ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1139	; ClientDataSet1CustNo.AsInteger  := 1510;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 47710.75  ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1009	; ClientDataSet1CustNo.AsInteger  := 1513;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 0         ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1056	; ClientDataSet1CustNo.AsInteger  := 1513;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 19293.7   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1086	; ClientDataSet1CustNo.AsInteger  := 1513;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 14049.95  ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1090	; ClientDataSet1CustNo.AsInteger  := 1513;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 8507      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1109	; ClientDataSet1CustNo.AsInteger  := 1513;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 203       ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1156	; ClientDataSet1CustNo.AsInteger  := 1513;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 12367     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1165	; ClientDataSet1CustNo.AsInteger  := 1513;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 2692.85   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1197	; ClientDataSet1CustNo.AsInteger  := 1513;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 6731      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1209	; ClientDataSet1CustNo.AsInteger  := 1513;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 20711.9   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1010	; ClientDataSet1CustNo.AsInteger  := 1551;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 4996      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1077	; ClientDataSet1CustNo.AsInteger  := 1551;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 156       ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1082	; ClientDataSet1CustNo.AsInteger  := 1551;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 1416.45   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1170	; ClientDataSet1CustNo.AsInteger  := 1551;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 5654.8    ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1011	; ClientDataSet1CustNo.AsInteger  := 1560;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 2679.85   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1035	; ClientDataSet1CustNo.AsInteger  := 1560;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 560       ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1071	; ClientDataSet1CustNo.AsInteger  := 1560;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 103041    ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1111	; ClientDataSet1CustNo.AsInteger  := 1560;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 4720.8    ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1154	; ClientDataSet1CustNo.AsInteger  := 1560;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 13226.8   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1171	; ClientDataSet1CustNo.AsInteger  := 1560;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 2356.9    ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1271	; ClientDataSet1CustNo.AsInteger  := 1560;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 304       ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1012	; ClientDataSet1CustNo.AsInteger  := 1563;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 5201      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1057	; ClientDataSet1CustNo.AsInteger  := 1563;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 1975      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1061	; ClientDataSet1CustNo.AsInteger  := 1563;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 24277.3   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1083	; ClientDataSet1CustNo.AsInteger  := 1563;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 11164.8   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1091	; ClientDataSet1CustNo.AsInteger  := 1563;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 1950      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1148	; ClientDataSet1CustNo.AsInteger  := 1563;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 5011      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1161	; ClientDataSet1CustNo.AsInteger  := 1563;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 102453.6  ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1168	; ClientDataSet1CustNo.AsInteger  := 1563;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 104       ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1212	; ClientDataSet1CustNo.AsInteger  := 1563;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 3975.75   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1261	; ClientDataSet1CustNo.AsInteger  := 1563;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 1999      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1283	; ClientDataSet1CustNo.AsInteger  := 1563;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 7134      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1013	; ClientDataSet1CustNo.AsInteger  := 1624;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 3115      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1026	; ClientDataSet1CustNo.AsInteger  := 1624;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 2920      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1113	; ClientDataSet1CustNo.AsInteger  := 1624;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 0         ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1126	; ClientDataSet1CustNo.AsInteger  := 1624;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 10107     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1014	; ClientDataSet1CustNo.AsInteger  := 1645;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 134.85    ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1029	; ClientDataSet1CustNo.AsInteger  := 1645;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 20108     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1038	; ClientDataSet1CustNo.AsInteger  := 1645;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 10152     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1129	; ClientDataSet1CustNo.AsInteger  := 1645;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 1004.8    ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1015	; ClientDataSet1CustNo.AsInteger  := 1651;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 20321.75  ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1028	; ClientDataSet1CustNo.AsInteger  := 1651;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 343.8     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1128	; ClientDataSet1CustNo.AsInteger  := 1651;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 8294      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1215	; ClientDataSet1CustNo.AsInteger  := 1651;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 8305.95   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1315	; ClientDataSet1CustNo.AsInteger  := 1651;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 5037.1    ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1016	; ClientDataSet1CustNo.AsInteger  := 1680;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 0         ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1034	; ClientDataSet1CustNo.AsInteger  := 1680;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 18532     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1084	; ClientDataSet1CustNo.AsInteger  := 1680;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 1185      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1093	; ClientDataSet1CustNo.AsInteger  := 1680;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 479.8     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1116	; ClientDataSet1CustNo.AsInteger  := 1680;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 0         ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1017	; ClientDataSet1CustNo.AsInteger  := 1984;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 0         ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1037	; ClientDataSet1CustNo.AsInteger  := 1984;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 3117      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1074	; ClientDataSet1CustNo.AsInteger  := 1984;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 2195      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1099	; ClientDataSet1CustNo.AsInteger  := 1984;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 0         ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1117	; ClientDataSet1CustNo.AsInteger  := 1984;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 0         ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1137	; ClientDataSet1CustNo.AsInteger  := 1984;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 6785.4    ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1217	; ClientDataSet1CustNo.AsInteger  := 1984;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 51730.8   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1294	; ClientDataSet1CustNo.AsInteger  := 1984;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 3304.85   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1317	; ClientDataSet1CustNo.AsInteger  := 1984;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 7572      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1018	; ClientDataSet1CustNo.AsInteger  := 2118;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 0         ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1031	; ClientDataSet1CustNo.AsInteger  := 2118;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 12685     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1058	; ClientDataSet1CustNo.AsInteger  := 2118;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 12736     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1062	; ClientDataSet1CustNo.AsInteger  := 2118;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 18320     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1064	; ClientDataSet1CustNo.AsInteger  := 2118;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 395       ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1118	; ClientDataSet1CustNo.AsInteger  := 2118;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 21614     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1131	; ClientDataSet1CustNo.AsInteger  := 2118;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 11989.2   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1162	; ClientDataSet1CustNo.AsInteger  := 2118;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 3153      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1019	; ClientDataSet1CustNo.AsInteger  := 2135;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 0         ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1004	; ClientDataSet1CustNo.AsInteger  := 2156;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 7885      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1020	; ClientDataSet1CustNo.AsInteger  := 2156;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 9955      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1095	; ClientDataSet1CustNo.AsInteger  := 2156;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 0         ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1120	; ClientDataSet1CustNo.AsInteger  := 2156;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 784.9     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1295	; ClientDataSet1CustNo.AsInteger  := 2156;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 17917     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1021	; ClientDataSet1CustNo.AsInteger  := 2163;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 3719      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1022	; ClientDataSet1CustNo.AsInteger  := 2163;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 10064.65  ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1032	; ClientDataSet1CustNo.AsInteger  := 2163;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 775       ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1121	; ClientDataSet1CustNo.AsInteger  := 2163;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 820       ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1122	; ClientDataSet1CustNo.AsInteger  := 2163;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 44854     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1132	; ClientDataSet1CustNo.AsInteger  := 2163;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 906       ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1136	; ClientDataSet1CustNo.AsInteger  := 2163;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 2971      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1221	; ClientDataSet1CustNo.AsInteger  := 2163;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 2099      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1051	; ClientDataSet1CustNo.AsInteger  := 2165;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 325       ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1101	; ClientDataSet1CustNo.AsInteger  := 2165;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 0         ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1046	; ClientDataSet1CustNo.AsInteger  := 2315;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 766.8     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1098	; ClientDataSet1CustNo.AsInteger  := 2315;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 0         ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1146	; ClientDataSet1CustNo.AsInteger  := 2315;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 15052     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1198	; ClientDataSet1CustNo.AsInteger  := 2315;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 72089.9   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1298	; ClientDataSet1CustNo.AsInteger  := 2315;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 9897      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1096	; ClientDataSet1CustNo.AsInteger  := 2354;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 0         ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1196	; ClientDataSet1CustNo.AsInteger  := 2354;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 5983      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1069	; ClientDataSet1CustNo.AsInteger  := 2975;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 33829.45  ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1201	; ClientDataSet1CustNo.AsInteger  := 2984;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 7990      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1078	; ClientDataSet1CustNo.AsInteger  := 3041;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 79116     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1260	; ClientDataSet1CustNo.AsInteger  := 3041;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 2577.85   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1063	; ClientDataSet1CustNo.AsInteger  := 3042;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 61869.3   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1081	; ClientDataSet1CustNo.AsInteger  := 3042;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 30566     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1103	; ClientDataSet1CustNo.AsInteger  := 3042;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 39797.7   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1175	; ClientDataSet1CustNo.AsInteger  := 3051;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 13814.05  ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1050	; ClientDataSet1CustNo.AsInteger  := 3052;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 6287.85   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1150	; ClientDataSet1CustNo.AsInteger  := 3052;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 7671.9    ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1250	; ClientDataSet1CustNo.AsInteger  := 3052;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 45160.1   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1350	; ClientDataSet1CustNo.AsInteger  := 3052;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 8939.6    ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1204	; ClientDataSet1CustNo.AsInteger  := 3053;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 10263.75  ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1263	; ClientDataSet1CustNo.AsInteger  := 3053;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 158922.65 ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1355	; ClientDataSet1CustNo.AsInteger  := 3053;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 13908     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1066	; ClientDataSet1CustNo.AsInteger  := 3054;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 19812     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1166	; ClientDataSet1CustNo.AsInteger  := 3054;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 28862     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1205	; ClientDataSet1CustNo.AsInteger  := 3054;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 4029.55   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1024	; ClientDataSet1CustNo.AsInteger  := 3151;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 6897      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1089	; ClientDataSet1CustNo.AsInteger  := 3151;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 2706      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1133	; ClientDataSet1CustNo.AsInteger  := 3151;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 2419      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1039	; ClientDataSet1CustNo.AsInteger  := 3158;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 536.8     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1030	; ClientDataSet1CustNo.AsInteger  := 3615;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 559.6     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1097	; ClientDataSet1CustNo.AsInteger  := 3615;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 0         ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1309	; ClientDataSet1CustNo.AsInteger  := 3615;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 465       ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1860	; ClientDataSet1CustNo.AsInteger  := 3615;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 0         ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1042	; ClientDataSet1CustNo.AsInteger  := 3984;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 971.7     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1142	; ClientDataSet1CustNo.AsInteger  := 3984;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 3546      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1130	; ClientDataSet1CustNo.AsInteger  := 4312;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 6300      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1068	; ClientDataSet1CustNo.AsInteger  := 4531;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 31847     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1112	; ClientDataSet1CustNo.AsInteger  := 4531;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 0         ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1183	; ClientDataSet1CustNo.AsInteger  := 4531;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 3650      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1041	; ClientDataSet1CustNo.AsInteger  := 4652;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 7807      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1141	; ClientDataSet1CustNo.AsInteger  := 4652;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 1846      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1115	; ClientDataSet1CustNo.AsInteger  := 4684;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 0         ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1043	; ClientDataSet1CustNo.AsInteger  := 5132;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 12455     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1143	; ClientDataSet1CustNo.AsInteger  := 5132;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 3087      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1134	; ClientDataSet1CustNo.AsInteger  := 5151;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 6675.95   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1094	; ClientDataSet1CustNo.AsInteger  := 5163;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 0         ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1199	; ClientDataSet1CustNo.AsInteger  := 5163;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 716       ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1158	; ClientDataSet1CustNo.AsInteger  := 5165;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 9793.55   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1036	; ClientDataSet1CustNo.AsInteger  := 5384;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 4110      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1119	; ClientDataSet1CustNo.AsInteger  := 5384;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 14557.95  ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1195	; ClientDataSet1CustNo.AsInteger  := 5384;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 7868      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1296	; ClientDataSet1CustNo.AsInteger  := 5412;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 7423.35   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1048	; ClientDataSet1CustNo.AsInteger  := 5432;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 7346      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1054	; ClientDataSet1CustNo.AsInteger  := 5432;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 14188     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1044	; ClientDataSet1CustNo.AsInteger  := 5515;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 64050     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1047	; ClientDataSet1CustNo.AsInteger  := 5515;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 15365     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1144	; ClientDataSet1CustNo.AsInteger  := 5515;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 10054     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1070	; ClientDataSet1CustNo.AsInteger  := 6215;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 22354     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1065	; ClientDataSet1CustNo.AsInteger  := 6312;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 17814     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1053	; ClientDataSet1CustNo.AsInteger  := 6516;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 24650     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1092	; ClientDataSet1CustNo.AsInteger  := 6582;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 76698.75  ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1040	; ClientDataSet1CustNo.AsInteger  := 6812;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 3632      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1140	; ClientDataSet1CustNo.AsInteger  := 6812;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 1240      ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1045	; ClientDataSet1CustNo.AsInteger  := 9841;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 787.8     ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1049	; ClientDataSet1CustNo.AsInteger  := 9841;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 1809.85   ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1145	; ClientDataSet1CustNo.AsInteger  := 9841;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 4229.8    ;  ClientDataSet1.Post;
  ClientDataSet1.Append;  ClientDataSet1OrderNo.AsInteger := 1149	; ClientDataSet1CustNo.AsInteger  := 9841;	ClientDataSet1Freight.AsFloat   := 0; ClientDataSet1AmountPaid.AsFloat:= 12900.75  ;  ClientDataSet1.Post;
  ClientDataSet1.First;
end;

procedure TForm1.cxGrid1DBTableView1AmountPaidPropertiesEditValueChanged(
  Sender: TObject);
var
  Edit: TcxCustomEdit;
  Value: Double;
  View: TcxGridDBTableView;
  FreightColumn: TcxGridColumn;
begin
  Edit := Sender as TcxCustomEdit;
  if VarIsNumericEx(Edit.EditValue) then
  begin
    Value := Edit.EditValue;

    View := cxGrid1.FocusedView as TcxGridDBTableView;
    FreightColumn := View.GetColumnByFieldName('Freight');
    View.DataController.SetEditValue(FreightColumn.Index, Value / 5, evsValue);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  lCSV : TGerar_CSV;
begin
  lCSV := TGerar_CSV.Create;
  lCSV.Gerar_CSV([ClientDataSet1], [''], [tv]);
  FreeAndNil(lCSV);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  AlimentarDados();
end;

procedure TForm1.tvKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Ord('C')) and (Shift = [ssCtrl]) then
  begin
    if TcxGridSite(Sender).GridView is TcxGridDBTableView then
      Clipboard.AsText := VarToStrDef(tv.Controller.FocusedColumn.EditValue, '');
    Key := 0;
  end;
end;

procedure TForm1.tvCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
//  FIndex := AViewInfo.
//  if (VarToStrDef(AViewInfo.Value, '') <> '') then
//  FValue := VarToStrDef(AViewInfo.Value, '');
end;

end.
