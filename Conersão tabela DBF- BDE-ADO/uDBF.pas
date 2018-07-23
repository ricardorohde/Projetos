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
  cxGridDBTableView, cxGrid, ADODB, JvExControls, JvAnimatedImage,
  JvGIFCtrl;

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
    btnConverter: TButton;
    Conexao: TADOConnection;
    Tabela: TADOTable;
    pnlAguarde: TPanel;
    JvGIFAnimator1: TJvGIFAnimator;
    tv: TcxGridDBTableView;
    lv: TcxGridLevel;
    cxGrid1: TcxGrid;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConverterClick(Sender: TObject);
  private
    FArquivo : string;

    function Conectar(): Boolean;
    procedure ConectarDbf();
    procedure AbrirTabela();
    procedure Conversao(psTabela : string);
    function ExtractFileNameEX(const AFileName: String): String;
    function SoNumero(fField: String): String;
    function ConectarADO: Boolean;
    function RetornaNomeCampos(psFieldName: string): string;
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
    tv.ClearItems;
    tv.DataController.CreateAllItems;
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

procedure TForm1.btnConverterClick(Sender: TObject);
var
  lsTabela : string;
begin
  pnlAguarde.Visible := True;
  if not FileExists(edtArquivo.Text) then
  begin
    ShowMessage('Arquivo Inválido.Verifique!');
    Exit;
  end;

  lsTabela := ExtractFileNameEX(edtArquivo.Text);

  if ConectarADO() then
    Conversao( lsTabela );
  pnlAguarde.Visible := False;
end;

function TForm1.ExtractFileNameEX(const AFileName:String): String;
var
 I: integer;
begin
  I := LastDelimiter('.'+PathDelim+DriveDelim,AFileName);
  if (I=0)  or  (AFileName[I] <> '.') then
    I := MaxInt;

  Result := ExtractFileName(Copy(AFileName,1,I-1));
end;

function TForm1.ConectarADO(): Boolean;
var
  caminho_base : string;
begin
  Result := False;
  caminho_base := ExtractFileDir(edtArquivo.Text);

  if not DirectoryExists(caminho_base) then
  begin
    ShowMessage('Diretório inválido. Verifique!');
    Exit;
  end;

  Conexao.Close;
  Conexao.ConnectionString:='Provider=Microsoft.JET.OLEDB.4.0;Data Source='+caminho_base+';Extended Properties=dBase IV;';
  Conexao.LoginPrompt := False;
  Conexao.Open;

  Result := Conexao.Connected;
end;

function TForm1.RetornaNomeCampos(psFieldName : string): string;
begin
  result := StringReplace(psFieldName, 'CDOPERADOR_ALTERACAO', 'CD_OPE_ALT', [rfReplaceAll]);
  result := StringReplace(result, 'CDOPERADOR_INCLUSAO', 'CD_OPE_INC', [rfReplaceAll]);
  result := StringReplace(result, 'CDITEM_MENU_PAI', 'CD_IM_PAI', [rfReplaceAll]);
  result := StringReplace(result, 'CDITEM_MENU', 'CDITEMMENU', [rfReplaceAll]);

  result := StringReplace(result, 'CDPROGRAMA_FISICO', 'CDPRG_FIS', [rfReplaceAll]);
  result := StringReplace(result, 'CDPROGRAMA_CHAMADO', 'CDPRG_CHA', [rfReplaceAll]);

  result := StringReplace(result, 'SNCONFIRMACAO_INCLUSAO', 'SNINCLUSAO', [rfReplaceAll]);
  result := StringReplace(result, 'SNCONFIRMACAO_EXCLUSAO', 'SNEXCLUSAO', [rfReplaceAll]);
  result := StringReplace(result, 'SNCONFIRMACAO_ALTERACAO', 'SNALTERA', [rfReplaceAll]);

  result := StringReplace(result, 'SNPROGRAMA_SISTEMA', 'SNPRG_SIS', [rfReplaceAll]);
  result := StringReplace(result, 'SNPROGRAMA_LOGICO', 'SNPRG_LOG', [rfReplaceAll]);

  result := Copy(result, 1, 10);
end;

procedure TForm1.Conversao(psTabela : string);
var
  i : Integer;
  lsChar  : string;
  lsCampo : string;
  lQuery  : TADOQuery;
begin
  lQuery := TADOQuery.Create(nil);
  try
    lQuery.Connection := Conexao;
    //Tabela.TableName := psTabela + IntToStr(StrTointDef(SoNumero(psTabela), 0)+ 1);
    lQuery.SQL.Add('create table ' + psTabela + IntToStr(StrTointDef(SoNumero(psTabela), 0)+ 1));
    lQuery.SQL.Add('(');
    for i := 0 to qryDbf.FieldCount -1 do
    begin
      lsChar := ', ';
      if i = 0 then
        lsChar := '';

      lsCampo := RetornaNomeCampos(qryDbf.Fields[i].FieldName);
      if qryDbf.Fields[i] is TStringField then
        lQuery.SQL.Add(lsChar + lsCampo + ' VARCHAR( ' + IntToStr(qryDbf.Fields[i].Size) + ' )')
      else
      if qryDbf.Fields[i] is TIntegerField then
        lQuery.SQL.Add(lsChar + lsCampo + ' INTEGER')
      else
      if qryDbf.Fields[i] is TFloatField then
        lQuery.SQL.Add(lsChar + lsCampo + ' FLOAT')
      else
      if qryDbf.Fields[i] is TDateTimeField then
        lQuery.SQL.Add(lsChar + lsCampo + ' DATETIME')
      else
      if qryDbf.Fields[i] is TDateField then
        lQuery.SQL.Add(lsChar + lsCampo + ' DATE')
      else
//      if qryDbf.Fields[i] is TBlobField then
//        //lQuery.SQL.Add(lsChar + qryDbf.Fields[i].FieldName + ' BLOB' + IntToStr(qryDbf.Fields[i].Size))
//        lQuery.SQL.Add(lsChar + qryDbf.Fields[i].FieldName + ' BLOB' + IntToStr(qryDbf.Fields[i].Size))
//      else
      if (qryDbf.Fields[i] is TMemoField) then
        lQuery.SQL.Add(lsChar + lsCampo + ' MEMO')
      else
      if qryDbf.Fields[i] is TBooleanField then
        lQuery.SQL.Add(lsChar + lsCampo + ' BOOLEAN')
      else
      if (qryDbf.Fields[i].DataType = ftTypedBinary) then
        //lQuery.SQL.Add(lsChar + lsCampo + ' BINARY');
        lQuery.SQL.Add(lsChar + lsCampo + ' MEMO');
    end;

//    qryDbf.Fields[i].DataType

    lQuery.SQL.Add(');');
    lQuery.SQL.SaveToFile(ExtractFilePath(edtArquivo.Text) + psTabela + IntToStr(StrTointDef(SoNumero(psTabela), 0)+ 1) + '.txt');
    lQuery.ExecSQL;


    Tabela.Connection := Conexao;
    Tabela.TableName  := psTabela + IntToStr(StrTointDef(SoNumero(psTabela), 0)+ 1);
    Tabela.Open;

    qryDbf.First;
    while not qryDbf.Eof do
    begin
      Tabela.Append;
      for i := 0 to qryDbf.FieldCount -1 do
      begin
        lsCampo := RetornaNomeCampos(qryDbf.Fields[i].FieldName);

        if Assigned(Tabela.FindField(lsCampo)) and
           not (qryDbf.Fields[i].IsNull) then
        begin
          Tabela.FieldByName(lsCampo).Value :=
            qryDbf.Fields[i].Value;
        end;
      end;
      Tabela.Post;
      qryDbf.Next;
    end;

  finally
    FreeAndNil(lQuery);
  end;
end;

function TForm1.SoNumero(fField : String): String;
var
  I : Byte;
begin
  Result := '';
  for I := 1 To Length(fField) do
    if fField [I] In ['0'..'9'] Then
      Result := Result + fField [I];
end;

end.
