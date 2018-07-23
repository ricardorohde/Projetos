unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxNavigator, cxDBNavigator,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  StdCtrls, StrUtils, ExtCtrls, DBTables, DBClient, cxImageComboBox,
  cxDBLookupComboBox, cxButtonEdit, Menus, cxButtons;

type
  TForm1 = class(TForm)
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    Grid: TcxGrid;
    tv1: TcxGridDBTableView;
    lv1: TcxGridLevel;
    qryMensagem: TQuery;
    dtsMensagem: TDataSource;
    tv1CODIGO: TcxGridDBColumn;
    tv1MENSAGEM: TcxGridDBColumn;
    cdsMensagem_Detalhe: TClientDataSet;
    lv2: TcxGridLevel;
    tv2: TcxGridDBTableView;
    cdsMensagem_DetalheCODIGO: TIntegerField;
    cdsMensagem_DetalheTIPO: TIntegerField;
    cdsMensagem_DetalheCODPRE: TStringField;
    cdsMensagem_DetalheTIPPRE: TStringField;
    cdsMensagem_DetalheCODPRO: TIntegerField;
    dtsMensagem_Detalhe: TDataSource;
    Panel1: TPanel;
    tv: TcxGridDBTableView;
    lv: TcxGridLevel;
    grdMensagem_Detalhe: TcxGrid;
    tvTIPO: TcxGridDBColumn;
    tvCODPRE: TcxGridDBColumn;
    tvTIPPRE: TcxGridDBColumn;
    tvCODPRO: TcxGridDBColumn;
    mmoMensagem: TMemo;
    tv2TIPO: TcxGridDBColumn;
    tv2CODPRE: TcxGridDBColumn;
    tv2TIPPRE: TcxGridDBColumn;
    tv2CODPRO: TcxGridDBColumn;
    qryPremio: TQuery;
    qryProduto: TQuery;
    qryPremioCODIGO: TIntegerField;
    qryPremioCODPRE: TStringField;
    qryPremioTIPPRE: TStringField;
    dtsPremio: TDataSource;
    dtsProduto: TDataSource;
    qryProdutoCODIGO: TIntegerField;
    qryProdutoNOMPRO: TStringField;
    cdsMensagem_DetalheBOTAO: TIntegerField;
    Panel2: TPanel;
    btnNovaMensagem: TcxButton;
    cxDBNavigator1: TcxDBNavigator;
    cdsMensagem_Aux: TClientDataSet;
    dtsMensagem_Aux: TDataSource;
    cdsMensagem_AuxCODIGO: TIntegerField;
    cdsMensagem_AuxTIPO: TIntegerField;
    cdsMensagem_AuxCODPRE: TStringField;
    cdsMensagem_AuxTIPPRE: TStringField;
    cdsMensagem_AuxCODPRO: TIntegerField;
    cdsMensagem_AuxBOTAO: TIntegerField;
    procedure cxDBNavigator1ButtonsButtonClick(Sender: TObject;
      AButtonIndex: Integer; var ADone: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnNovaMensagemClick(Sender: TObject);
    procedure cdsMensagem_AuxAfterPost(DataSet: TDataSet);
    procedure cdsMensagem_AuxBeforePost(DataSet: TDataSet);
    procedure cxPageControl1Change(Sender: TObject);
  private
    { Private declarations }
    dbConDb  : TDatabase;
    qryDb    : TQuery;
    FPathDB  : string;
    FCodigo  : Integer;

    procedure ConectarDb();
    procedure ExecuteQueryDB(ComandText: string);
    procedure CriarTabelas;
    procedure CriaTabelaMensagem;
    procedure SelecionarMensagem();
    procedure RefreshMensagem;

    function BuscarCodigo() : Integer;
    procedure InserirMensagem;
    procedure CriaTabelaPremio();
    procedure CriaTabelaProduto;
  public
    { Public declarations }
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
  end;

var
  Form1: TForm1;

implementation

const
  DATABASE_NAME  = 'MENSAGEM';
  DRIVE_NAME     = 'STANDARD';
  DB_EXTENSION   = '.DB';

{$R *.dfm}

{ TForm1 }

procedure TForm1.AfterConstruction;
begin
  inherited;
  ConectarDb();
  CriarTabelas();
end;

procedure TForm1.CriarTabelas();
begin
  CriaTabelaMensagem();
  CriaTabelaPremio();
  CriaTabelaProduto();
  SelecionarMensagem();
end;

procedure TForm1.SelecionarMensagem();
begin
  qryMensagem.DisableControls;
  qryMensagem.Close;
  qryMensagem.DatabaseName := DATABASE_NAME;
  qryMensagem.SQL.Clear;
  qryMensagem.SQL.Add('SELECT CODIGO');
  qryMensagem.SQL.Add('     , MENSAGEM');
  qryMensagem.SQL.Add('     , TIPO');
  qryMensagem.SQL.Add('     , CODPRE');
  qryMensagem.SQL.Add('     , TIPPRE');
  qryMensagem.SQL.Add('     , CODPRO');
  qryMensagem.SQL.Add('FROM MENSAGEM');
  qryMensagem.Open;

  cdsMensagem_Detalhe.CreateDataSet;
  cdsMensagem_Aux.CreateDataSet;
  qryMensagem.First;
  while not qryMensagem.Eof do
  begin
    cdsMensagem_Detalhe.Append;
    cdsMensagem_DetalheCODIGO.AsInteger := qryMensagem.FieldByName('CODIGO').AsInteger;
    cdsMensagem_DetalheTIPO.AsInteger   := qryMensagem.FieldByName('TIPO').AsInteger;
    cdsMensagem_DetalheCODPRE.AsString  := qryMensagem.FieldByName('CODPRE').AsString;
    cdsMensagem_DetalheTIPPRE.AsString  := qryMensagem.FieldByName('TIPPRE').AsString;
    cdsMensagem_DetalheCODPRO.AsInteger := qryMensagem.FieldByName('CODPRO').AsInteger;
    cdsMensagem_Detalhe.Post;
    qryMensagem.Next;
  end;

  RefreshMensagem();

  qryMensagem.EnableControls;
end;

procedure TForm1.CriaTabelaMensagem();
begin
  if not FileExists((FPathDB) + '\MENSAGEM' + DB_EXTENSION) then
    ExecuteQueryDB('CREATE TABLE ' + 'MENSAGEM' + '(CODIGO INTEGER' +
                                            ', MENSAGEM VARCHAR(255)' +
                                            ', TIPO INTEGER'+
                                            ', CODPRE VARCHAR(30)'+
                                            ', TIPPRE VARCHAR(30)'+
                                            ', BOTAO INTEGER'+
                                            ', CODPRO INTEGER);' );
end;

procedure TForm1.CriaTabelaPremio();
begin
  if not FileExists((FPathDB) + '\PREMIO' + DB_EXTENSION) then
  begin
    ExecuteQueryDB('CREATE TABLE ' + 'PREMIO' + '(CODIGO INTEGER' +
                                               ', CODPRE VARCHAR(30)' +
                                               ', TIPPRE VARCHAR(30));');

    qryPremio.Close;
    qryPremio.DatabaseName := DATABASE_NAME;
    qryPremio.RequestLive  := True;
    qryPremio.SQL.Clear;
    qryPremio.SQL.Add('SELECT CODIGO');
    qryPremio.SQL.Add('     , CODPRE');
    qryPremio.SQL.Add('     , TIPPRE');
    qryPremio.SQL.Add('FROM PREMIO');
    qryPremio.Open;

    if qryPremio.IsEmpty then
    begin
      qryPremio.Append;
      qryPremio.FieldByName('CODIGO').AsInteger := 1;
      qryPremio.FieldByName('CODPRE').AsString := 'MILHAS TAM';
      qryPremio.FieldByName('TIPPRE').AsString := 'NO AIR';
      qryPremio.Post;

      qryPremio.Append;
      qryPremio.FieldByName('CODIGO').AsInteger := 2;
      qryPremio.FieldByName('CODPRE').AsString := 'MILHAS AZUL';
      qryPremio.FieldByName('TIPPRE').AsString := 'MILHAS';
      qryPremio.Post;

      qryPremio.Append;
      qryPremio.FieldByName('CODIGO').AsInteger := 3;
      qryPremio.FieldByName('CODPRE').AsString := 'BONUS';
      qryPremio.FieldByName('TIPPRE').AsString := 'ITAUCARD';
      qryPremio.Post;
    end;
  end;

  qryPremio.Close;
  qryPremio.DatabaseName := DATABASE_NAME;
  qryPremio.RequestLive  := False;
  qryPremio.SQL.Clear;
  qryPremio.SQL.Add('SELECT CODIGO');
  qryPremio.SQL.Add('     , CODPRE');
  qryPremio.SQL.Add('     , TIPPRE');
  qryPremio.SQL.Add('FROM PREMIO');
  qryPremio.Open;
end;

procedure TForm1.CriaTabelaProduto();
begin
  if not FileExists((FPathDB) + '\PRODUTO' + DB_EXTENSION) then
  begin
    ExecuteQueryDB('CREATE TABLE ' + 'PRODUTO' + '(CODIGO INTEGER' +
                                                ', NOMPRO VARCHAR(50));');

    qryProduto.Close;
    qryProduto.DatabaseName := DATABASE_NAME;
    qryProduto.RequestLive  := True;
    qryProduto.SQL.Clear;
    qryProduto.SQL.Add('SELECT CODIGO');
    qryProduto.SQL.Add('     , NOMPRO');
    qryProduto.SQL.Add('FROM PRODUTO');
    qryProduto.Open;

    if qryProduto.IsEmpty then
    begin
      qryProduto.Append;
      qryProduto.FieldByName('CODIGO').AsInteger := 1;
      qryProduto.FieldByName('NOMPRO').AsString := 'AZUL';
      qryProduto.Post;

      qryProduto.Append;
      qryProduto.FieldByName('CODIGO').AsInteger := 2;
      qryProduto.FieldByName('NOMPRO').AsString := 'TAM';
      qryProduto.Post;

      qryProduto.Append;
      qryProduto.FieldByName('CODIGO').AsInteger := 3;
      qryProduto.FieldByName('NOMPRO').AsString := 'ITAU';
      qryProduto.Post;
    end;
  end;

  qryProduto.Close;
  qryProduto.DatabaseName := DATABASE_NAME;
  qryProduto.RequestLive  := False;
  qryProduto.SQL.Clear;
  qryProduto.SQL.Add('SELECT CODIGO');
  qryProduto.SQL.Add('     , NOMPRO');
  qryProduto.SQL.Add('FROM PRODUTO');
  qryProduto.Open;
end;

procedure TForm1.ConectarDb();
begin
  FPathDB := ExtractFilePath(Application.ExeName)+ 'DB';
  dbConDb := TDatabase.Create(nil);
  qryDb   := TQuery.Create(nil);

  dbConDb.DatabaseName := DATABASE_NAME;
  dbConDb.DriverName   := DRIVE_NAME;
  dbConDb.Params.Add('PATH='+ FPathDB);

  qryDb.DatabaseName   := DATABASE_NAME;
end;

procedure TForm1.RefreshMensagem();
begin
  qryMensagem.Close;
  qryMensagem.DatabaseName := DATABASE_NAME;
  qryMensagem.SQL.Clear;
  qryMensagem.SQL.Add('SELECT DISTINCT CODIGO');
  qryMensagem.SQL.Add('     , MENSAGEM');
  qryMensagem.SQL.Add('FROM MENSAGEM');
  qryMensagem.Open;
end;

procedure TForm1.ExecuteQueryDB(ComandText: string);
begin
  qryDb.SQL.Clear;
  qryDb.SQL.Add(ComandText);
  qryDb.ExecSQL();
end;

procedure TForm1.BeforeDestruction;
begin
  qryDb.Close;
  dbConDb.Close;
  FreeAndNil(qryDb);
  FreeAndNil(dbConDb);
  inherited;
end;

procedure TForm1.cxDBNavigator1ButtonsButtonClick(Sender: TObject;
  AButtonIndex: Integer; var ADone: Boolean);
var
  i : Integer;
begin
  case AButtonIndex of
    6 :
      begin
        FCodigo := qryMensagem.FieldByName('CODIGO').AsInteger;
        mmoMensagem.Text := qryMensagem.FieldByName('MENSAGEM').AsString;
        cxPageControl1.ActivePageIndex := 1;
      end;
    9 :
      begin
        mmoMensagem.Text := qryMensagem.FieldByName('MENSAGEM').AsString;
        cdsMensagem_Aux.Edit;
        for i := 0 to cdsMensagem_Detalhe.FieldCount -1 do
          cdsMensagem_Aux.Fields[i].Value := cdsMensagem_Detalhe.Fields[i].Value;
        cxPageControl1.ActivePageIndex := 1;
      end;
  else
    begin
      cxPageControl1.ActivePageIndex := 0;
      mmoMensagem.Clear;
    end;
  end;
end;

function TForm1.BuscarCodigo(): Integer;
var
 qry : TQuery;
begin
  qry := TQuery.Create(nil);
  try
    qry.DatabaseName := DATABASE_NAME;
    qry.SQL.Add('SELECT MAX(CODIGO) AS CODIGO');
    qry.SQL.Add('FROM MENSAGEM');
    qry.Open;

    Result := qry.FieldByName('CODIGO').AsInteger + 1;

    qry.Close;
  finally
    FreeAndNil(qry);
  end;
end;

procedure TForm1.InserirMensagem();
var
  qry : TQuery;
  i   : Integer;
begin
  qry := TQuery.Create(nil);
  try
    qry.DatabaseName := DATABASE_NAME;
    qry.RequestLive  := True;
    qry.SQL.Add('SELECT CODIGO');
    qry.SQL.Add('     , MENSAGEM');
    qry.SQL.Add('     , TIPO');
    qry.SQL.Add('     , CODPRE');
    qry.SQL.Add('     , TIPPRE');
    qry.SQL.Add('     , CODPRO');
    qry.SQL.Add('FROM MENSAGEM');
    qry.SQL.Add('WHERE CODIGO = ' + cdsMensagem_AuxCODIGO.AsString);
    qry.Open;

    if qry.IsEmpty then
      begin
        qry.Append;
        cdsMensagem_Detalhe.Append;
      end
    else
      begin
        if cdsMensagem_Detalhe.Locate('CODIGO', cdsMensagem_AuxCODIGO.AsString, [loCaseInsensitive]) then
          cdsMensagem_Detalhe.Edit;
        qry.Edit;
      end;

    qry.FieldByName('CODIGO').AsInteger  := cdsMensagem_AuxCODIGO.AsInteger;
    qry.FieldByName('MENSAGEM').AsString := mmoMensagem.Text;
    qry.FieldByName('TIPO').AsInteger    := cdsMensagem_AuxTIPO.AsInteger;
    qry.FieldByName('CODPRE').AsString   := cdsMensagem_AuxCODPRE.AsString;
    qry.FieldByName('TIPPRE').AsString   := cdsMensagem_AuxTIPPRE.AsString;
    qry.FieldByName('CODPRO').AsInteger  := cdsMensagem_AuxCODPRO.AsInteger;
    qry.Post;

    if cdsMensagem_Detalhe.State in [dsedit, dsinsert] then
    begin
      for i := 0 to cdsMensagem_Detalhe.FieldCount -1 do
        cdsMensagem_Detalhe.Fields[i].Value := cdsMensagem_Aux.Fields[i].Value;

      cdsMensagem_Detalhe.Post;
    end;
  finally
    FreeAndNil(qry)
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  cxPageControl1.ActivePageIndex := 0;
end;

procedure TForm1.btnNovaMensagemClick(Sender: TObject);
begin
  FCodigo := BuscarCodigo();
  cdsMensagem_Aux.Append;
  cdsMensagem_AuxCODIGO.AsInteger := FCodigo;
  cxPageControl1.ActivePageIndex := 1;
end;

procedure TForm1.cdsMensagem_AuxAfterPost(DataSet: TDataSet);
begin
  RefreshMensagem();
end;

procedure TForm1.cdsMensagem_AuxBeforePost(DataSet: TDataSet);
begin
  InserirMensagem();
end;

procedure TForm1.cxPageControl1Change(Sender: TObject);
begin
  if (cxPageControl1.ActivePageIndex = 0) and
    (cdsMensagem_Aux.State in [dsInsert, dsEdit]) then
  begin
    mmoMensagem.Clear;
    cdsMensagem_Aux.Cancel;
  end;
end;

end.
