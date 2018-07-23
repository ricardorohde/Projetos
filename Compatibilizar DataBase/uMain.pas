unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.CheckLst, Data.FMTBcd, Data.SqlExpr, Data.DB,
  Vcl.ImgList;

type
  TfrmMain = class(TForm)
    Notebook1: TNotebook;
    gboxSelecionarBanco: TGroupBox;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    edtCaminhoBancoModelo: TEdit;
    edtUsuarioModelo: TEdit;
    edtSenhaModelo: TEdit;
    btnTestarModelo: TBitBtn;
    btnProcurarBancoModelo: TBitBtn;
    btnSenhaDefault: TBitBtn;
    panBarraConfiguracao: TPanel;
    btnProximoConfiguracao: TBitBtn;
    btnCancelarConfiguracao: TBitBtn;
    chkTabelas: TCheckListBox;
    OpenDialog1: TOpenDialog;
    gbxDestino: TGroupBox;
    btnTestarDestino: TBitBtn;
    btnSenhaDestino: TBitBtn;
    btnProcurarBancoDestino: TBitBtn;
    edtSenhaDestino: TEdit;
    edtUsuarioDestino: TEdit;
    edtCaminhoBaseDadosDestino: TEdit;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnCompatibilizar: TBitBtn;
    gboxCabecalhoConfiguracao: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    gboxConfiguracoes: TGroupBox;
    Label1: TLabel;
    Image2: TImage;
    gpxStatus: TGroupBox;
    memoScripts: TMemo;
    procedure btnSenhaDefaultClick(Sender: TObject);
    procedure btnTestarModeloClick(Sender: TObject);
    procedure btnProcurarBancoModeloClick(Sender: TObject);
    procedure btnCancelarConfiguracaoClick(Sender: TObject);
    procedure chkTabelasClick(Sender: TObject);
    procedure btnProximoConfiguracaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btnSenhaDestinoClick(Sender: TObject);
    procedure btnProcurarBancoDestinoClick(Sender: TObject);
    procedure btnTestarDestinoClick(Sender: TObject);
    procedure btnCompatibilizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FTabelasDestino: TStringList;

    function Conectar(Conexao: TSQLConnection; FileName, Usuario, Senha: string): Boolean;
    function Validar(edtCaminho, edtUsuario, edtSenha: TEdit): Boolean;
    procedure ListarTabelas(Conexao: TSQLConnection; Tabelas: TStrings);
    function TabelaSelecionada(): Boolean;
    procedure CompatibilizarBaseDeDados();
    function GerarScripts(Tabela: String): string;
    procedure AplicarScript(Script: string);
    function CreateTable(Tabela: string): string;
    function AlterTable(Tabela: string): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
  udmMain;

{$R *.dfm}

procedure TfrmMain.ListarTabelas(Conexao: TSQLConnection; Tabelas: TStrings);
var
  qry: TSQLQuery;
begin
  Tabelas.Clear;
  try
    qry:= TSQLQuery.Create(nil);
    qry.SQLConnection:= dmMain.ConexaoOrigem;
    qry.SQL.Add('select rdb$relation_name from rdb$relations');
    qry.SQL.Add('where rdb$system_flag = 0;');
    qry.Open;

    if not qry.IsEmpty then
      Tabelas.Add('Todas');

    qry.First;
    while not qry.Eof do
    begin
      Tabelas.Add(Trim(qry.Fields[0].AsString));
      qry.Next;
    end;
  finally
    FreeAndNil( qry );
  end;
end;

function TfrmMain.Validar(edtCaminho, edtUsuario, edtSenha: TEdit): Boolean;
begin
  Result:= False;
  if Trim(TEdit(edtCaminho).Text) = EmptyStr then
  begin
    MessageDlg('Caminho da base de dados não informado. Verifique!', mtWarning, mbOKCancel, 0);
    TEdit(edtCaminho).SetFocus;
    Exit;
  end;

  if not FileExists( TEdit(edtCaminho).Text ) then
  begin
    MessageDlg('Arquivo da base de dados não existe. Verifique!', mtWarning, mbOKCancel, 0);
    TEdit(edtCaminho).SetFocus;
    Exit;
  end;

  if Trim( TEdit(edtUsuario).Text) = EmptyStr then
  begin
    MessageDlg('Usuário não informado. Verifique!', mtWarning, mbOKCancel, 0);
    TEdit(edtUsuario).SetFocus;
    Exit;
  end;

  if Trim( TEdit(edtSenha).Text) = EmptyStr then
  begin
    MessageDlg('Senha não informada. Verifique!', mtWarning, mbOKCancel, 0);
    TEdit(edtSenha).SetFocus;
    Exit;
  end;
  result:= True;
end;

function TfrmMain.Conectar(Conexao: TSQLConnection; FileName, Usuario, Senha: string): Boolean;
begin
  try
    Conexao.Close;
    Conexao.Params.Clear;
    Conexao.Params.Add('DriverName=Firebird');
    Conexao.Params.Add(Format('Database=%s', [FileName]));
    Conexao.Params.Add('RoleName=RoleName');
    Conexao.Params.Add(Format('User_Name=sysdba', [Usuario]));
    Conexao.Params.Add(Format('Password=masterkey', [Senha]));
    Conexao.Params.Add('ServerCharSet=');
    Conexao.Params.Add('SQLDialect=3');
    Conexao.Params.Add('ErrorResourceFile=');
    Conexao.Params.Add('LocaleCode=0000');
    Conexao.Params.Add('BlobSize=-1');
    Conexao.Params.Add('CommitRetain=False');
    Conexao.Params.Add('WaitOnLocks=True');
    Conexao.Params.Add('IsolationLevel=ReadCommitted');
    Conexao.Params.Add('Trim Char=False');
    Conexao.Params.Add('LibraryName=dbxfb.dll');
    Conexao.Params.Add('VendorLib=gds32.dll');
    Conexao.Params.Add('GetDriverFunc=getSQLDriverINTERBASE');
    Conexao.Params.Add('GetDriverRFunc=getSQLDriverINTERBASE');
    Conexao.Open;

    Result:= Conexao.Connected;
  except on e: exception do
    MessageDlg('Erro na conexão. Erro: '+ e.Message, mtWarning, mbOKCancel, 0);
  end;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil( FTabelasDestino );
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  Notebook1.ActivePage:= 'Pagina_1';
  FTabelasDestino:= TStringList.Create;
end;

procedure TfrmMain.BitBtn3Click(Sender: TObject);
begin
  edtUsuarioModelo.Text := 'SYSDBA';
  edtSenhaModelo.Text := 'masterkey';
end;

procedure TfrmMain.btnCancelarConfiguracaoClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.btnCompatibilizarClick(Sender: TObject);
begin
  if not dmMain.ConexaoOrigem.Connected then
    Conectar(dmMain.ConexaoOrigem, edtCaminhoBancoModelo.Text, edtUsuarioModelo.Text, edtSenhaModelo.Text);

  if not dmMain.ConexaoDestino.Connected then
  begin
    MessageDlg('Base de dados de destino não conectada. Verifique!', mtWarning, mbOKCancel, 0);
    edtCaminhoBaseDadosDestino.SetFocus;
    exit;
  end;

  CompatibilizarBaseDeDados();
end;

procedure TfrmMain.CompatibilizarBaseDeDados();
var
  i: Integer;
  lsScript: string;
begin
  for i:= 1 to chkTabelas.Count-1 do
    if chkTabelas.Checked[i] then
    begin
      lsScript:= GerarScripts( Trim(chkTabelas.Items[i]) );
      AplicarScript( lsScript );
    end;
end;

procedure TfrmMain.AplicarScript(Script: string);
begin

end;

function TfrmMain.CreateTable(Tabela: string): string;
begin

end;

function TfrmMain.AlterTable(Tabela: string): string;
var
  qryOrigem: TSQLQuery;
  qryDestino: TSQLQuery;
  lsCampo: string;
begin
  Result:= '';
  try
    qryOrigem:= TSQLQuery.Create(nil);
    qryOrigem.SQLConnection:= dmMain.ConexaoOrigem;
    qryOrigem.SQL.Add('SELECT');
    qryOrigem.SQL.Add('    RDB$FIELD_NAME AS NOME');
    qryOrigem.SQL.Add('  , RDB$FIELD_LENGTH  AS TAMANHO');
    qryOrigem.SQL.Add('  , CASE WHEN RDB$FIELD_TYPE = 7 THEN ''SMALLINT''');
    qryOrigem.SQL.Add('         WHEN RDB$FIELD_TYPE = 8 THEN ''INTEGER''');
    qryOrigem.SQL.Add('         WHEN RDB$FIELD_TYPE = 10 THEN ''FLOAT''');
    qryOrigem.SQL.Add('         WHEN RDB$FIELD_TYPE = 12 THEN ''DATE''');
    qryOrigem.SQL.Add('         WHEN RDB$FIELD_TYPE = 13 THEN ''TIME''');
    qryOrigem.SQL.Add('         WHEN RDB$FIELD_TYPE = 14 THEN ''CHAR''');
    qryOrigem.SQL.Add('         WHEN RDB$FIELD_TYPE = 16 THEN ''BIGINT''');
    qryOrigem.SQL.Add('         WHEN RDB$FIELD_TYPE = 27 THEN ''DOUBLE PRECISION''');
    qryOrigem.SQL.Add('         WHEN RDB$FIELD_TYPE = 35 THEN ''TIMESTAMP''');
    qryOrigem.SQL.Add('         WHEN RDB$FIELD_TYPE = 37 THEN ''VARCHAR''');
    qryOrigem.SQL.Add('         WHEN RDB$FIELD_TYPE = 261 THEN ''BLOB'' END TIPO');
    qryOrigem.SQL.Add('  , RDB$DEFAULT_SOURCE CAMPO_DEFAULT');
    qryOrigem.SQL.Add('  , RDB$FIELD_SUB_TYPE SUB_TIPO');
    qryOrigem.SQL.Add('FROM RDB$FIELDS');
    qryOrigem.SQL.Add(Format('WHERE  UPPER( RDB$FIELD_NAME ) LIKE ''%s''', [AnsiUpperCase( Tabela ) + '_%']));
    qryOrigem.Open;

    qryDestino:= TSQLQuery.Create(nil);
    qryDestino.SQLConnection:= dmMain.ConexaoDestino;
    qryDestino.SQL.Add('SELECT');
    qryDestino.SQL.Add('    RDB$FIELD_NAME AS NOME');
    qryDestino.SQL.Add('  , RDB$FIELD_LENGTH  AS TAMANHO');
    qryDestino.SQL.Add('  , CASE WHEN RDB$FIELD_TYPE = 7 THEN ''SMALLINT''');
    qryDestino.SQL.Add('         WHEN RDB$FIELD_TYPE = 8 THEN ''INTEGER''');
    qryDestino.SQL.Add('         WHEN RDB$FIELD_TYPE = 10 THEN ''FLOAT''');
    qryDestino.SQL.Add('         WHEN RDB$FIELD_TYPE = 12 THEN ''DATE''');
    qryDestino.SQL.Add('         WHEN RDB$FIELD_TYPE = 13 THEN ''TIME''');
    qryDestino.SQL.Add('         WHEN RDB$FIELD_TYPE = 14 THEN ''CHAR''');
    qryDestino.SQL.Add('         WHEN RDB$FIELD_TYPE = 16 THEN ''BIGINT''');
    qryDestino.SQL.Add('         WHEN RDB$FIELD_TYPE = 27 THEN ''DOUBLE PRECISION''');
    qryDestino.SQL.Add('         WHEN RDB$FIELD_TYPE = 35 THEN ''TIMESTAMP''');
    qryDestino.SQL.Add('         WHEN RDB$FIELD_TYPE = 37 THEN ''VARCHAR''');
    qryDestino.SQL.Add('         WHEN RDB$FIELD_TYPE = 261 THEN ''BLOB'' END TIPO');
    qryDestino.SQL.Add('  , RDB$DEFAULT_SOURCE CAMPO_DEFAULT');
    qryDestino.SQL.Add('  , RDB$FIELD_SUB_TYPE SUB_TIPO');
    qryDestino.SQL.Add('FROM RDB$FIELDS');
    qryDestino.SQL.Add(Format('WHERE  UPPER( RDB$FIELD_NAME ) LIKE ''%s''', [AnsiUpperCase( Tabela ) + '_%']));
    qryDestino.Open;

    qryOrigem.First;
    while not qryOrigem.Eof do
    begin
      if qryDestino.Locate('NOME', qryOrigem.FieldByName('NOME').AsString, []) then
      begin
        lsCampo:= StringReplace( Trim( qryOrigem.FieldByName('NOME').AsString ), AnsiUpperCase(Tabela) + '_', '', [rfReplaceAll]);
        Result:= Result + Format( 'ALTER TABLE %s ALTER %s TYPE %s (%s);',
          [AnsiUpperCase( Tabela ), lsCampo, qryOrigem.FieldByName('TIPO').AsString, qryOrigem.FieldByName('TAMANHO').AsString]);
      end;

      qryOrigem.Next;
    end;

  finally
    FreeAndNil( qryOrigem );
  end;
end;

function TfrmMain.GerarScripts(Tabela: String): string;
begin
  if FTabelasDestino.IndexOf( Tabela ) = -1 then
    Result:= CreateTable( Tabela )
  else
    Result:= AlterTable( Tabela );
end;

procedure TfrmMain.btnProcurarBancoDestinoClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edtCaminhoBaseDadosDestino.Text:= OpenDialog1.FileName;
end;

procedure TfrmMain.btnProcurarBancoModeloClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edtCaminhoBancoModelo.Text:= OpenDialog1.FileName;
end;

procedure TfrmMain.btnProximoConfiguracaoClick(Sender: TObject);
begin
  Notebook1.ActivePage:= 'Pagina_2';

  btnProximoConfiguracao.Visible:= False;
  btnCompatibilizar.Visible:= True;
end;

procedure TfrmMain.btnSenhaDefaultClick(Sender: TObject);
begin
  edtUsuarioModelo.Text := 'SYSDBA';
  edtSenhaModelo.Text := 'masterkey';
end;

procedure TfrmMain.btnSenhaDestinoClick(Sender: TObject);
begin
  edtUsuarioDestino.Text := 'SYSDBA';
  edtSenhaDestino.Text := 'masterkey';
end;

procedure TfrmMain.btnTestarDestinoClick(Sender: TObject);
begin
  if not Validar(edtCaminhoBaseDadosDestino, edtUsuarioDestino, edtSenhaDestino) then
    Exit;

  if not Conectar(dmMain.ConexaoDestino, edtCaminhoBaseDadosDestino.Text, edtUsuarioDestino.Text, edtSenhaDestino.Text) then
    Exit
  else
    MessageDlg('Conectado com sucesso!', mtInformation, mbOKCancel, 0);

  ListarTabelas(dmMain.ConexaoDestino, FTabelasDestino);
end;

procedure TfrmMain.btnTestarModeloClick(Sender: TObject);
begin
  if not Validar(edtCaminhoBancoModelo, edtUsuarioModelo, edtSenhaModelo) then
    Exit;

  if Conectar(dmMain.ConexaoOrigem, edtCaminhoBancoModelo.Text, edtUsuarioModelo.Text, edtSenhaModelo.Text) then
  begin
    ListarTabelas(dmMain.ConexaoOrigem, chkTabelas.Items);
    MessageDlg('Conectado com sucesso!', mtInformation, mbOKCancel, 0)
  end;
end;

function TfrmMain.TabelaSelecionada(): Boolean;
var
  i: integer;
begin
  result:= False;
  for i := 0 to chkTabelas.Items.Count - 1 do
    if chkTabelas.Checked[i] then
    begin
      Result:= True;
      Break;
    end;
end;

procedure TfrmMain.chkTabelasClick(Sender: TObject);
var
  i: integer;
begin
  if chkTabelas.Checked[0] then
    begin
      for i := 0 to chkTabelas.Items.Count - 1 do
        chkTabelas.Checked[i]:= True;
    end
  else
    if chkTabelas.ItemIndex = 0 then
    begin
      for i := 0 to chkTabelas.Items.Count - 1 do
        chkTabelas.Checked[i]:= False;
    end;

  btnProximoConfiguracao.Enabled:= TabelaSelecionada();
end;

end.



