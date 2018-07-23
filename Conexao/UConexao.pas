unit UConexao;

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
  dxSkinscxPCPainter, dxSkinsdxBarPainter, dxBar, cxClasses, cxPC, DB,
  ADODB, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, ImgList, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxNavigator, cxDBNavigator,
  ToolWin, ComCtrls, JvExComCtrls, JvToolBar, Menus, am2000menuitem,
  ITMenuItem;

type
  TfmConexao = class(TForm)
    cxPageControl1: TcxPageControl;
    tbGeral: TcxTabSheet;
    tbDetalhe: TcxTabSheet;
    dxBarManager1: TdxBarManager;
    OpenDialog1: TOpenDialog;
    Conexao: TADOConnection;
    tv: TcxGridDBTableView;
    lv: TcxGridLevel;
    grid: TcxGrid;
    dxBarSubItem1: TdxBarSubItem;
    cxImageList1: TcxImageList;
    cxImageList2: TcxImageList;
    qryConexao: TADOQuery;
    tvNOCONEXAO: TcxGridDBColumn;
    tvNODRIVER: TcxGridDBColumn;
    dtsConexao: TDataSource;
    dxBarSubItem2: TdxBarSubItem;
    JvToolBar1: TJvToolBar;
    Navigator: TcxDBNavigator;
    ToolButton1: TToolButton;
    ITMenuItem1: TITMenuItem;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FFileName : string;
    procedure CriarNovoArquivo();
    function Conectar(): Boolean;
    procedure AbrirTabela(psNomeTabela: string);

  public
    { Public declarations }
  end;

var
  fmConexao: TfmConexao;

implementation

uses USelecionarArquivo;

{$R *.dfm}

procedure TfmConexao.FormShow(Sender: TObject);
var
  fmselecionar : TfmSelecionar;
  lsTabela     : string;
begin
  fmselecionar := TfmSelecionar.Create(nil);
  try
    if not (fmselecionar.ShowModal = mrOK) then
      Close;

    FFileName := fmselecionar.FileName;

    if not Conectar() then
    begin
      ShowMessage('Não foi possível conectar à base de dados. Verifiquer!');
      Close;
    end;

    if not FileExists(FFileName) then
    begin
      CriarNovoArquivo();
    end;

    lsTabela := StringReplace(UpperCase(ExtractFileName(FFileName)), '.DBF', '', [rfReplaceAll]);

    AbrirTabela(lsTabela);
  finally
    FreeAndNil(fmselecionar);
  end;
end;

function TfmConexao.Conectar(): Boolean;
var
  lsConexaoString : string;
  lsDiretorio     : string;
begin
  Result      := False;
  lsDiretorio := ExtractFileDir(FFileName);

  if DirectoryExists(lsDiretorio) then
  begin
    lsConexaoString := 'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=' + lsDiretorio + ';'+
                       'Mode=Share Deny None;Jet OLEDB:System database="";Jet OLEDB:Registry Path="";'+
                       'Jet OLEDB:Database Password="";Jet OLEDB:Engine Type=17;Jet OLEDB'+
                       ':Database Locking Mode=0;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:'+
                       'Global Bulk Transactions=1;Jet OLEDB:New Database Password="";Jet OLEDB:'+
                       'Create System Database=False;Jet OLEDB:Encrypt Database=False;Jet OLEDB:'+
                       'Don' + Chr(39) + 't Copy Locale on Compact=False;Jet OLEDB:Compact Without '+
                       'Replica Repair=False;Jet OLEDB:SFP=False;';
    Conexao.Close;
    Conexao.ConnectionString := lsConexaoString;
    Conexao.LoginPrompt := False;
    Conexao.Open;

    Result := Conexao.Connected;
  end;
end;

procedure TfmConexao.CriarNovoArquivo();
var
  lQry : TADOQuery;
begin
  lQry := TADOQuery.Create(nil);
  try
    lQry.Connection := Conexao;

    lQry.SQL.Add('CREATE TABLE Conexao (');
    lQry.SQL.Add('  NOCONEXAO VARCHAR( 60 )');
    lQry.SQL.Add(', CDPASSWORD VARCHAR( 60 )');
    lQry.SQL.Add(', NODRIVER VARCHAR( 60 )');
    lQry.SQL.Add(', TXPARAMETRO MEMO');
    lQry.SQL.Add(', TIPO_SER VARCHAR( 20 )');
    lQry.SQL.Add(', VERSAO_SER VARCHAR( 20 )');
    lQry.SQL.Add(', DISPONIVEL VARCHAR( 1 )');
    lQry.SQL.Add(', PRIORIDADE FLOAT');
    lQry.SQL.Add(', SENHA VARCHAR( 1 )');
    lQry.SQL.Add(', ARQ_SENHA VARCHAR( 254 ));');
    lQry.ExecSQL;
  finally
    FreeAndNil(lQry);
  end;
end;

procedure TfmConexao.AbrirTabela(psNomeTabela : string);
begin
  qryConexao.Close;
  qryConexao.Connection := Conexao;
  qryConexao.SQL.Clear;
  qryConexao.SQL.Add('SELECT *');
  qryConexao.SQL.Add('FROM '+ psNomeTabela);
  qryConexao.Open;
end;

end.
