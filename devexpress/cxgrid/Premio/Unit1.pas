unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, Buttons, ExtCtrls, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Provider, DBClient, StdCtrls, cxLocalization;

type
  TForm1 = class(TForm)
    ds1: TDataSource;
    pnl1: TPanel;
    btnAnteriorpagina: TSpeedButton;
    btnProximapagina: TSpeedButton;
    lbllbpaginas: TLabel;
    qry: TQuery;
    cds1: TClientDataSet;
    strngfldcds1NOMPRE: TStringField;
    strngfldcds1NOMTRA: TStringField;
    strngfldcds1NOMPRO: TStringField;
    strngfldcds1TXGRUPO_ESTABELECIMENTO: TStringField;
    fltfldcds1CODCLI: TFloatField;
    cds1CODORG: TIntegerField;
    cds1CODPRG: TIntegerField;
    fltfldcds1NUMSOL: TFloatField;
    cds1SQITEM_RESGATE: TIntegerField;
    strngfldcds1NUMSOLX: TStringField;
    cxGrid1: TcxGrid;
    tv: TcxGridDBTableView;
    tvNOMPRO: TcxGridDBColumn;
    tvTXGRUPO_ESTABELECIMENTO: TcxGridDBColumn;
    tvCODCLI: TcxGridDBColumn;
    tvCODORG: TcxGridDBColumn;
    tvCODPRG: TcxGridDBColumn;
    tvNUMSOL: TcxGridDBColumn;
    tvSQITEM_RESGATE: TcxGridDBColumn;
    tvNUMSOLX: TcxGridDBColumn;
    tvCDGRUPO_ESTABELECIMENTO: TcxGridDBColumn;
    tvCODPRO: TcxGridDBColumn;
    tvCODTRA: TcxGridDBColumn;
    tvTXDESCRICAO: TcxGridDBColumn;
    tvVLLANCAMENTO: TcxGridDBColumn;
    tvDTLANCAMENTO: TcxGridDBColumn;
    tvDEBCRE: TcxGridDBColumn;
    tvTPLANCAMENTO: TcxGridDBColumn;
    tvCDOPERADOR_INCLUSAO: TcxGridDBColumn;
    tvCDOPERADOR_ALTERACAO: TcxGridDBColumn;
    tvDTINCLUSAO: TcxGridDBColumn;
    tvDTALTERACAO: TcxGridDBColumn;
    tvCDCONTA_MOVIMENTO: TcxGridDBColumn;
    tvNRDOCUMENTO: TcxGridDBColumn;
    tvCODPRE: TcxGridDBColumn;
    tvCODEST: TcxGridDBColumn;
    lv: TcxGridLevel;
    cxLocalizer1: TcxLocalizer;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FPagina        : Integer;
    FiQtdRegistros : Integer;
    procedure RealizarTraducaoCxGrid;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

const QTDREGISTROSPAG = 20;

implementation

uses dtmPrincipal;

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
begin
  RealizarTraducaoCxGrid;
  
  qry.SessionName  := 'Session';
  qry.DatabaseName := 'dbMain';

  qry.SQL.Add('SELECT');
  //qry.SQL.Add('   P.NOMPRE,');
  //qry.SQL.Add('   E.NOMTRA,');
  qry.SQL.Add('   PRO.NOMPRO,');
  qry.SQL.Add('   GE.TXGRUPO_ESTABELECIMENTO,');
  qry.SQL.Add('   RC.CODCLI CODCLI,');
  qry.SQL.Add('   RC.CODORG CODORG,');
  qry.SQL.Add('   RC.CODPRG CODPRG,');
  qry.SQL.Add('   RC.NUMSOL NUMSOL,');
  qry.SQL.Add('   RC.SQITEM_RESGATE SQITEM_RESGATE,');
  qry.SQL.Add('   RC.NUMSOLX NUMSOLX,');
  qry.SQL.Add('   RC.CDGRUPO_ESTABELECIMENTO CDGRUPO_ESTABELECIMENTO,');
  qry.SQL.Add('   RC.CODPRO CODPRO,');
  qry.SQL.Add('   RC.CODTRA CODTRA,');
  qry.SQL.Add('   RC.TXDESCRICAO TXDESCRICAO,');
  qry.SQL.Add('   VLLANCAMENTO = CASE WHEN RC.DEBCRE = ''D'' THEN ( RC.VLLANCAMENTO * -1) ELSE RC.VLLANCAMENTO END,');
  qry.SQL.Add('   RC.DTLANCAMENTO DTLANCAMENTO,');
  qry.SQL.Add('   RC.DEBCRE DEBCRE,');
  qry.SQL.Add('   RC.TPLANCAMENTO TPLANCAMENTO,');
  qry.SQL.Add('   RC.CDOPERADOR_INCLUSAO CDOPERADOR_INCLUSAO,');
  qry.SQL.Add('   RC.CDOPERADOR_ALTERACAO CDOPERADOR_ALTERACAO,');
  qry.SQL.Add('   RC.DTINCLUSAO DTINCLUSAO,');
  qry.SQL.Add('   RC.DTALTERACAO DTALTERACAO,');
  qry.SQL.Add('   RC.CDCONTA_MOVIMENTO CDCONTA_MOVIMENTO,');
  qry.SQL.Add('   RC.NRDOCUMENTO NRDOCUMENTO,');
  qry.SQL.Add('   RI.CODPRE CODPRE,');
  qry.SQL.Add('   RC.CODEST CODEST');
  qry.SQL.Add('FROM');
  qry.SQL.Add('   RESGATE_CONTA_CORRENTE RC');
  qry.SQL.Add('LEFT JOIN PRODUTO PRO ON (PRO.CODPRO = RC.CODPRO)');
  qry.SQL.Add('LEFT JOIN RESGATE_ITEM RI ON (RI.NUMSOL = RC.NUMSOL)');
  qry.SQL.Add('LEFT JOIN PREMIO P ON (P.CODPRE = RI.CODPRE)');
  qry.SQL.Add('LEFT JOIN EVENTO E ON (E.CODTRA = RC.CODTRA)');
  qry.SQL.Add('LEFT JOIN GRUPO_ESTABELECIMENTO GE ON (GE.CDGRUPO_ESTABELECIMENTO = RC.CDGRUPO_ESTABELECIMENTO)');
//  qry.SQL.Add('WHERE');
//  qry.SQL.Add('  RC.CODORG = 4');
//  qry.SQL.Add('AND');
//  qry.SQL.Add('  RC.CODCLI IN (11453, (SELECT LUS.ORIGEM FROM LOG_UNIFICA_SEPARA LUS WHERE LUS.DESTINO = 11453 AND LUS.UNI_SEP = ''U''))');
//  qry.SQL.Add('AND');
//  qry.SQL.Add('  RC.CODPRG = 1');
//  qry.SQL.Add('AND');
//  qry.SQL.Add(' (RC.CDSTATUS_LANCAMENTO =  ''L''  OR RC.CDSTATUS_LANCAMENTO =  ''C''  OR RC.CDSTATUS_LANCAMENTO IS NULL)');
//  qry.SQL.Add('AND');
//  qry.SQL.Add(' RC.DEBCRE <> ''O''');
  qry.SQL.Add('ORDER BY');
  qry.SQL.Add('  RC.NUMSOL,RC.DTLANCAMENTO');
//  qry.SQL.SaveToFile('C:\edson.txt');
  qry.Open;



//  tv.DataController.CreateAllItems();
end;

procedure TForm1.RealizarTraducaoCxGrid;
begin
  if FileExists(ExtractFilePath(Application.ExeName)+'\TraduçãoDev.ini') then
  begin
    cxLocalizer1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\TraduçãoDev.ini');
    cxLocalizer1.LanguageIndex := 1;
    cxLocalizer1.Active := True;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  dmPrincipal := TdmPrincipal.Create(nil);

  dmPrincipal.dbMain.Connected := False;
  dmPrincipal.dbMain.Connected := True;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmPrincipal.dbMain.Connected := False;
  dmPrincipal.Free;
end;

end.
