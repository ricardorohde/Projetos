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
  cxGridDBTableView, cxGrid, Provider, DBClient, StdCtrls;

type
  TForm1 = class(TForm)
    cds1: TClientDataSet;
    ds1: TDataSource;
    DataSetProvider1: TDataSetProvider;
    tv: TcxGridDBTableView;
    lv: TcxGridLevel;
    cxGrid1: TcxGrid;
    pnl1: TPanel;
    btnAnteriorpagina: TSpeedButton;
    btnProximapagina: TSpeedButton;
    lbllbpaginas: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ds1DataChange(Sender: TObject; Field: TField);
    procedure btnProximapaginaClick(Sender: TObject);
    procedure btnAnteriorpaginaClick(Sender: TObject);
  private
    { Private declarations }
    FPagina        : Integer;
    FiQtdRegistros : Integer;

    procedure DropTable;
    function Pesquisa_pag(pagina: integer): Boolean;
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
var
  q : TQuery;
begin
  q := TQuery.Create(nil);
  try
    q.SessionName  := 'Session';
    q.DatabaseName := 'dbMain';
    q.SQL.Add('SELECT ROW_NUMBER=IDENTITY(10),');
    q.SQL.Add('  CDCONTA_MOVIMENTO, 			  CODORG,  			  		   CODCLI,    			   CODPRG,  		CODPRO,');
    q.SQL.Add('  CONTA,              			  CODTRA,  			  		   DATTRA,    			   VALTRA,  		DEBCRE,');
    q.SQL.Add('  NUMDOC,             			  ORIGEM,  			  		   DESORI,    			   TXACON,  		VLTAXA_CONVERSAO_DIA,');
    q.SQL.Add('  VLTAXA_CONVERSAO_ULT_FATURA,    FATORP, 			  		   ORIPTO,    			   PONTOS,  		CDTIPO_PONTO,');
    q.SQL.Add('  CDSITUACAO_PONTO,				  NUMREG,  			  		   CODCAM,    			   NUMPCS,  		CODPCS,');
    q.SQL.Add('  DATPRO,						  NUMEXT,  			  		   SQFATURA,               SQPAGAMENTO, 	REFERENCIA_FATURA,');
    q.SQL.Add('  CDDATA_BASE_SAFRA_APROPRIACAO,  SAFRA_APROPRIACAO,  		   CDDATA_BASE_SAFRA_REAL, SAFRA_REAL,  	DTLIBERACAO_PONTO,');
    q.SQL.Add('  CDOPERADOR_INCLUSAO,			  DTINCLUSAO,		  		   CDOPERADOR_ALTERACAO,   DTALTERACAO,     DTAEXP,');
    q.SQL.Add('  DTAEXPR,						  CDVARIANTE,		  		   NRPARCELA,			   QTPARCELAS,  	NRCARTAO,');
    q.SQL.Add('  DTULTIMO_VENCTO,				  VLTAXA_CONVERSAO_ULT_VENCTO, RAMO_ATIVIDADE,		   UNIDADE_NEGOCIO, DTOCORRENCIA_TRANSACAO');
    q.SQL.Add('  INTO #temp from PARTICIPANTE_CONTA_MOVIMENTO');
    q.ExecSQL;

    q.Close;
    q.SQL.Clear;
    q.SQL.Add('SELECT Count(*) contador FROM #temp');
    q.Open;

    FiQtdRegistros := q.fieldByName('contador').AsInteger;

    q.Close;
    q.SQL.Clear;
    q.SQL.Add('SELECT * FROM #temp WHERE ROW_NUMBER between 1 and ' + IntToStr(QTDREGISTROSPAG));
    q.Open;

    DataSetProvider1.DataSet := q;
    cds1.AppendData(DataSetProvider1.Data, False);
    tv.DataController.CreateAllItems();
  finally
    FreeAndNil(q);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  dmPrincipal := TdmPrincipal.Create(nil);

  dmPrincipal.dbMain.Connected := False;
  dmPrincipal.dbMain.Connected := True;
end;

procedure TForm1.DropTable();
var
  q : TQuery;
begin
  q := TQuery.Create(nil);
  try
    q.SessionName  := 'Session';
    q.DatabaseName := 'dbMain';
    q.SQL.Add('DROP TABLE #temp');
    q.ExecSQL;
  finally
    FreeAndNil(q);
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DropTable();
  dmPrincipal.dbMain.Connected := False;
  dmPrincipal.Free;
end;

procedure TForm1.ds1DataChange(Sender: TObject; Field: TField);
begin
  btnAnteriorpagina.Enabled := (FPagina > 0);
  btnProximapagina.Enabled  := ds1.DataSet.RecordCount > 0;
end;

procedure TForm1.btnProximapaginaClick(Sender: TObject);
begin
  Inc(FPagina);

  Pesquisa_pag(FPagina);
end;

function TForm1.Pesquisa_pag(pagina: integer): Boolean;
var
  qtdpag: real;
  q : TQuery;
begin
  inherited;
  result := False;
  btnAnteriorpagina.Enabled := False;
  btnProximapagina.Enabled := False;
  lbllbpaginas.Enabled := True;
  btnAnteriorpagina.Visible := True;
  btnProximapagina.Visible := True;

  if FiQtdRegistros < 1 then
  begin
    // ShowMessage('Nenhum registro encontrado');
    lbllbpaginas.Caption := 'Nenhum registro encontrado';
  end
  else
  begin
    qtdpag := (FiQtdRegistros / QTDREGISTROSPAG) + 1;
//    vQtdPag := trunc(qtdpag);
    lbllbpaginas.Caption := 'Página ' + inttostr(pagina) + ' de ' + FloatToStr(trunc(qtdpag));

    q := TQuery.Create(nil);
    try
      q.SessionName  := 'Session';
      q.DatabaseName := 'dbMain';
      q.SQL.Add('SELECT * FROM #temp WHERE ROW_NUMBER BETWEEN ' + inttostr(((QTDREGISTROSPAG * pagina) - (QTDREGISTROSPAG - 1))) + ' AND ' +
        inttostr((QTDREGISTROSPAG * pagina)));
      q.Open;

      cds1.EmptyDataSet;
      cds1.Close;

      DataSetProvider1.DataSet := q;
      cds1.AppendData(DataSetProvider1.Data, False);
      tv.DataController.CreateAllItems();
    finally
      FreeAndNil(q);
    end;

    if (pagina > 1) then
      btnAnteriorpagina.Enabled := True
    else
      btnAnteriorpagina.Enabled := False;

    if (trunc(qtdpag) > pagina) then
      btnProximapagina.Enabled := True
    else
      btnProximapagina.Enabled := False;
    result := True;
  end;
end;

procedure TForm1.btnAnteriorpaginaClick(Sender: TObject);
begin
  FPagina := FPagina - 1;

  Pesquisa_pag(FPagina);
end;

end.
