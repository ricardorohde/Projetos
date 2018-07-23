unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, cxGraphics, cxControls, cxLookAndFeels,
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
  cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  StdCtrls, ExtCtrls, cxGridExportLink, ShellAPI, cxGridCustomPopupMenu,
  cxGridPopupMenu, cxLocalization;

type
  TForm1 = class(TForm)
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    tv: TcxGridDBTableView;
    lv: TcxGridLevel;
    Grade: TcxGrid;
    ClientDataSet1Data: TDateField;
    ClientDataSet1Descricao: TStringField;
    ClientDataSet1Valor: TFloatField;
    ClientDataSet1Cotacao: TFloatField;
    ClientDataSet1Fator: TIntegerField;
    ClientDataSet1visao: TStringField;
    ClientDataSet1Pontos: TFloatField;
    tvvisao: TcxGridDBColumn;
    tvData: TcxGridDBColumn;
    tvDescricao: TcxGridDBColumn;
    tvValor: TcxGridDBColumn;
    tvCotacao: TcxGridDBColumn;
    tvFator: TcxGridDBColumn;
    tvPontos: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    EstiloTurbo: TcxStyle;
    EstiloNivelGastos: TcxStyle;
    EstiloPadrao: TcxStyle;
    EstiloHeader: TcxStyle;
    ClientDataSet1Selecionado: TBooleanField;
    tvSelecionado: TcxGridDBColumn;
    Panel1: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label15: TLabel;
    Label20: TLabel;
    pnBottom: TPanel;
    Bevel1: TBevel;
    bbAnterior: TButton;
    bbProximo: TButton;
    Exporta_Fatura: TButton;
    pnTop: TPanel;
    Panel5: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    edNoCliente: TLabel;
    edProgram_Member: TLabel;
    edProduto: TLabel;
    edConta: TLabel;
    SaveDialog: TSaveDialog;
    cxGridPopupMenu1: TcxGridPopupMenu;
    ClientDataSet1Teste: TStringField;
    tvTeste: TcxGridDBColumn;
    cxLocalizer1: TcxLocalizer;
    procedure FormShow(Sender: TObject);
    procedure tvDataStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      out AStyle: TcxStyle);
    procedure Exporta_FaturaClick(Sender: TObject);
  private
    { Private declarations }
    FVisao : Integer;

    procedure Visao1();
    procedure Visao2_3();
    procedure Visao4();
    procedure RealizarTraducaoCxGrid();
  public
    { Public declarations }
    property Visao : Integer read FVisao write FVisao;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.RealizarTraducaoCxGrid();
begin
  if FileExists(ExtractFilePath(Application.ExeName)+'\TraduçãoDev.ini') then
  begin
    cxLocalizer1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\TraduçãoDev.ini');
    cxLocalizer1.LanguageIndex := 1;
    cxLocalizer1.Active := True;
  end;
end;

procedure TForm1.Visao1;
var
  i : Integer;
  valor : Double;
begin
  ClientDataSet1.CreateDataSet;

  valor := 0;
  for i := 0 to 4 do
  begin
    case i of
      0 : valor := 65.00;
      1 : valor := 120.00;
      2 : valor := 96.00;
      3 : valor := 78.00;
      4 : valor := 30.00;
    end;

    ClientDataSet1.Append;
    ClientDataSet1visao.AsString        := 'Movimentos';
    ClientDataSet1Data.AsDateTime       := StrToDate('01/06/2014')+ i;
    ClientDataSet1Descricao.AsString    := 'COMPRA';
    ClientDataSet1Valor.AsFloat         := valor;
    ClientDataSet1Cotacao.AsFloat       := 2.87;
    ClientDataSet1Fator.AsFloat         := 1;
    ClientDataSet1Pontos.AsFloat        := Round(valor/2.87*1);
    ClientDataSet1Selecionado.AsBoolean := False;
    ClientDataSet1Teste.AsString        := 'Teste';
    ClientDataSet1.Post;
  end;

  ClientDataSet1.Append;
  ClientDataSet1visao.AsString := 'Nível de Gastos';
  ClientDataSet1.Post;

  ClientDataSet1.Append;
  ClientDataSet1visao.AsString := 'Turbo Points';
  ClientDataSet1.Post;

//  for i := 0 to 4 do
//  begin
//    case i of
//      0 : valor := 65.00;
//      1 : valor := 120.00;
//      2 : valor := 96.00;
//      3 : valor := 78.00;
//      4 : valor := 30.00;
//    end;
//    ClientDataSet1.AppendRecord(['Nível de Gastos',
//                                 StrToDate('01/06/2014')+ i,
//                                 'COMPRA',
//                                 valor,
//                                 2.87,
//                                 1,
//                                 Round(valor/2.87*1)]);
//  end;
//
//  for i := 0 to 4 do
//  begin
//    case i of
//      0 : valor := 65.00;
//      1 : valor := 120.00;
//      2 : valor := 96.00;
//      3 : valor := 78.00;
//      4 : valor := 30.00;
//    end;
//    ClientDataSet1.AppendRecord(['Turbo Points',
//                                 StrToDate('01/06/2014')+ i,
//                                 'COMPRA',
//                                 valor,
//                                 2.87,
//                                 1,
//                                 Round(valor/2.87*1)]);
//  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  RealizarTraducaoCxGrid();

  edNoCliente.Caption := 'LINDEMAR REPECKA BAPTISTA';
  edProgram_Member.Caption := 'TAM ITAUCARD';
  edProduto.Caption        := 'TAM ITAUCARD INTERNACIONAL MC';
  edConta.Caption          := '23573';

  case FVisao of
   1: Visao1();
   2,3: Visao2_3();
   4 : Visao4();
  end;
  tv.ViewData.Expand(False);
end;

procedure TForm1.Visao2_3();
var
  i : Integer;
  valor : Double;
begin
  ClientDataSet1.CreateDataSet;

  valor := 0;
  for i := 0 to 4 do
  begin
    case i of
      0 : valor := 65.00;
      1 : valor := 120.00;
      2 : valor := 96.00;
      3 : valor := 78.00;
      4 : valor := 30.00;
    end;


    ClientDataSet1.Append;
    ClientDataSet1visao.AsString        := 'Movimentos';
    ClientDataSet1Data.AsDateTime       := StrToDate('01/06/2014')+ i;
    ClientDataSet1Descricao.AsString    := 'COMPRA';
    ClientDataSet1Valor.AsFloat         := valor;
    ClientDataSet1Selecionado.AsBoolean := (i in [0,1,2]);
    ClientDataSet1Teste.AsString        := 'Teste';
    ClientDataSet1.Post;
  end;

  ClientDataSet1.Append;
  ClientDataSet1visao.AsString  := 'Nível de Gastos';
  ClientDataSet1Data.AsDateTime := StrToDate('22/06/2014');
  ClientDataSet1Descricao.AsString := 'NÍVEL DE GASTOS';
  ClientDataSet1Cotacao.AsFloat    := 2.87;
  ClientDataSet1Fator.AsInteger    := 1;
  ClientDataSet1Pontos.AsFloat     := 98;
  ClientDataSet1Selecionado.AsBoolean := False;
  ClientDataSet1.Post;

  ClientDataSet1.Append;
  ClientDataSet1visao.AsString := 'Turbo Points';

  if FVisao = 3 then
  begin
    ClientDataSet1Data.AsDateTime := StrToDate('22/06/2014');
    ClientDataSet1Descricao.AsString := 'TURBO POINTS';
    ClientDataSet1Fator.AsInteger    := 1;
    ClientDataSet1Pontos.AsFloat     := 98;
    ClientDataSet1Selecionado.AsBoolean := False;    
  end;
  ClientDataSet1.Post;
end;

procedure TForm1.tvDataStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  AStyle := EstiloPadrao;

  if (FVisao = 1) then
    Exit;

  if (FVisao in [2, 3]) and (VarToStrDef(ARecord.Values[tvvisao.Index], '') = 'Movimentos')
    and (VarToStrDef(ARecord.Values[tvSelecionado.Index], '') <> '') and
    Boolean(ARecord.Values[tvSelecionado.Index]) then
    AStyle := EstiloNivelGastos;
//  else
//  if (FVisao = 4) and (VarToStrDef(ARecord.Values[tvvisao.Index], '') = 'Visão: Faturas com movimentos pontuados transação') then
//      AStyle := EstiloTurbo;
end;

procedure TForm1.Visao4;
var
  i : Integer;
  valor : Double;
begin
  ClientDataSet1.CreateDataSet;

  valor := 0;
  for i := 0 to 4 do
  begin
    case i of
      0 : valor := 65.00;
      1 : valor := 120.00;
      2 : valor := 96.00;
      3 : valor := 78.00;
      4 : valor := 30.00;
    end;
    ClientDataSet1.AppendRecord(['Movimentos',
                                 StrToDate('01/06/2014')+ i,
                                 'COMPRA',
                                 valor]);
  end;

  ClientDataSet1.Append;
  ClientDataSet1visao.AsString  := 'Nível de Gastos';
  ClientDataSet1.Post;

  ClientDataSet1.Append;
  ClientDataSet1visao.AsString := 'Turbo Points';

  ClientDataSet1Data.AsDateTime := StrToDate('22/06/2014');
  ClientDataSet1Descricao.AsString := 'TURBO POINTS';
  ClientDataSet1Fator.AsInteger    := 1;
  ClientDataSet1Pontos.AsFloat     := 98;
  ClientDataSet1Teste.AsString        := 'Teste';
  ClientDataSet1.Post;
end;

procedure TForm1.Exporta_FaturaClick(Sender: TObject);
var
  FileExt: String;
begin
  SaveDialog.Filter := 'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
  SaveDialog.Title := 'Exportar Dados';
  SaveDialog.DefaultExt:= 'xls';
  if SaveDialog.Execute then
  begin
    FileExt := LowerCase(ExtractFileExt(SaveDialog.FileName));
    if FileExt = '.xls' then
      ExportGridToExcel(SaveDialog.FileName, Grade, False)
    else if FileExt = '.xml' then
      ExportGridToXML(SaveDialog.FileName,Grade, False)
    else if FileExt = '.txt' then
      ExportGridToText(SaveDialog.FileName,Grade, False)
    else if FileExt = '.html' then
      ExportGridToHTML(SaveDialog.FileName,Grade, False);
    ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;
end.
