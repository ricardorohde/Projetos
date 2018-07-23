unit uDBF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, DBTables, Grids, DBGrids, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    edtArquivo: TEdit;
    Button1: TButton;
    qryDbf: TQuery;
    dbConDbf: TDatabase;
    DataSource1: TDataSource;
    Session: TSession;
    DBGrid1: TDBGrid;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FArquivo : string;
    function Conectar(): Boolean;
    procedure ConectarDbf();
    procedure AbrirTabela();
//    procedure Script();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

const
  DATABASE_NAME  = 'Conversao';
  DRIVE_NAME     = 'STANDARD';

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edtArquivo.Text := OpenDialog1.FileName;

  if Conectar() then
    AbrirTabela();
end;

//procedure TForm1.Script();
//var
//  i : Integer;
//  Sl : TStringList;
//begin
//  Sl := TStringList.Create;
//  try
//    for i := 0 to qryDbf.FieldCount -1 do
//    begin
//      if qryDbf.Fields[i] is TStringField then
//        Sl.Add(qryDbf.Fields[i].FieldName + ' STRING ' + IntToStr(qryDbf.Fields[i].Size));
//      if qryDbf.Fields[i] is TIntegerField then
//        Sl.Add(qryDbf.Fields[i].FieldName + ' INTEGER');
//      if qryDbf.Fields[i] is TFloatField then
//        Sl.Add(qryDbf.Fields[i].FieldName + ' FLOAT');
//      if qryDbf.Fields[i] is TDateTimeField then
//        Sl.Add(qryDbf.Fields[i].FieldName + ' DATETIME');
//      if qryDbf.Fields[i] is TDateField then
//        Sl.Add(qryDbf.Fields[i].FieldName + ' DATE');
//      if qryDbf.Fields[i] is TBlobField then
//        Sl.Add(qryDbf.Fields[i].FieldName + ' BLOB' + IntToStr(qryDbf.Fields[i].Size));
//      if qryDbf.Fields[i] is TMemoField then
//        Sl.Add(qryDbf.Fields[i].FieldName + ' MEMO' + IntToStr(qryDbf.Fields[i].Size));
//      if qryDbf.Fields[i] is TBooleanField then
//        Sl.Add(qryDbf.Fields[i].FieldName + ' BOOLEAN');
//    end;
//    Sl.SaveToFile('C:\campos.txt');
//  finally
//    FreeAndNil(Sl);
//  end;
//end;

procedure TForm1.AbrirTabela();
begin
  try
    qryDbf.Close;
    qryDbf.DatabaseName   := DATABASE_NAME;
    qryDbf.SQL.Clear;
    qryDbf.SQL.Add('select *');
    qryDbf.SQL.Add('from ' + ExtractFileName(edtArquivo.Text));
    qryDbf.Open;

//    Script();
  except on e: Exception do
    begin
      ShowMessage(e.Message);
      qryDbf.Close;
    end;
  end;
end;

procedure TForm1.ConectarDbf();
begin
  if (dbConDbf.Connected) or (FArquivo = edtArquivo.Text) then
    Exit;

  FArquivo := edtArquivo.Text;

  Session.PrivateDir := ExtractFileDir(edtArquivo.Text);
  dbConDbf.Close;
  dbConDbf.DatabaseName := DATABASE_NAME;
  dbConDbf.DriverName   := DRIVE_NAME;
  dbConDbf.Params.Add('PATH='+ ExtractFileDir(edtArquivo.Text));
end;

function TForm1.Conectar() : Boolean;
begin
  result := False;

  if not FileExists(edtArquivo.Text) then
    Exit;

  try
    ConectarDbf();
  except on e: Exception do
    begin
      ShowMessage(e.Message);
      Exit;
    end;
  end;

  Result := True;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  FArquivo := '';
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbConDbf.Close;
end;

end.
