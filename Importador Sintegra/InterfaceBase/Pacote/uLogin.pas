unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxControls, cxContainer, cxEdit, dxSkinsCore, dxSkinsDefaultPainters,
  jpeg, cxImage, StdCtrls, cxButtons, ExtCtrls, cxMaskEdit, cxDropDownEdit,
  cxLabel, IniFiles, cxTextEdit, DB, DBAccess, Uni, UniProvider,
  PostgreSQLUniProvider;

type
  TConexao = (tcPostgres, tcSqlServer, tcSyBase);

  TfrmLogin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnLogin: TcxButton;
    btnCancelar: TcxButton;
    cxImage1: TcxImage;
    edtUsuario: TcxTextEdit;
    cxLabel1: TcxLabel;
    edtSenha: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    edtServidor: TcxTextEdit;
    edtDataBase: TcxTextEdit;
    PostgreSQLUniProvider1: TPostgreSQLUniProvider;
    procedure btnLoginClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FConnection : TUniConnection;
    FtpConexao  : TConexao;

    procedure LerConfiguracao();
    procedure GravarConfiguracao();
    function  Validacao() : Boolean;
    function  Conectar(pConexao: TUniConnection; tpConexao: TConexao;
      pUsuario, pSenha, pServidor, pDataBase : string): Boolean;
    procedure GetTipoConexao(const Value: TConexao);
    function  SetTipoConexao: TConexao;
  public
    { Public declarations }

    constructor Create(AOwner: TComponent; pConexao : TUniConnection); reintroduce;

    property tpConexao : TConexao read SetTipoConexao write GetTipoConexao;
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

{ TfrmLogin }

procedure TfrmLogin.GravarConfiguracao();
var
  lConfiguracao : TIniFile;
begin
  lConfiguracao := TInifile.Create( ExtractFilePath(Application.ExeName) + 'Configuracao.ini' );
  try
    lConfiguracao.WriteString('CONFIGURACAO', 'USUARIO',  edtUsuario.Text);
//    lConfiguracao.WriteString('CONFIGURACAO', 'SENHA',    edtSenha.Text);
    lConfiguracao.WriteString('CONFIGURACAO', 'DATABASE', edtDataBase.Text);
    lConfiguracao.WriteString('CONFIGURACAO', 'SERVIDOR', edtServidor.Text);
  finally
    FreeandNil(lConfiguracao);
  end; {try}
end;

procedure TfrmLogin.LerConfiguracao();
var
  lConfiguracao : TIniFile;
begin
  if not FileExists( ExtractFilePath(Application.ExeName) + 'Configuracao.ini' ) then
    Exit;

  lConfiguracao := TInifile.Create( ExtractFilePath(Application.ExeName) + 'Configuracao.ini' );
  try
    edtUsuario.Text  := lConfiguracao.ReadString('CONFIGURACAO','USUARIO','');
//    edtSenha.Text    := lConfiguracao.ReadString('CONFIGURACAO','SENHA','');
    edtServidor.Text := lConfiguracao.ReadString('CONFIGURACAO','SERVIDOR','');
    edtDataBase.Text := lConfiguracao.ReadString('CONFIGURACAO','DATABASE','');
  finally
    FreeandNil(lConfiguracao);
  end; {try}
end;

function TfrmLogin.Validacao(): Boolean;
begin
  Result := False;
  if edtUsuario.Text = '' then
  begin
    MessageDlg('Usuário não preenchido. Verifique!', mtWarning, [mbOK], 0);
    edtUsuario.SetFocus;
    Exit;
  end;

  if edtSenha.Text = '' then
  begin
    MessageDlg('Senha não preenchida. Verifique!', mtWarning, [mbOK], 0);
    edtSenha.SetFocus;
    Exit;
  end;

  if edtServidor.Text = '' then
  begin
    MessageDlg('Servidor não preenchida. Verifique!', mtWarning, [mbOK], 0);
    edtServidor.SetFocus;
    Exit;
  end;

  if edtDataBase.Text = '' then
  begin
    MessageDlg('Base de Dados não preenchida. Verifique!', mtWarning, [mbOK], 0);
    edtDataBase.SetFocus;
    Exit;
  end;

  result := True;
end;

function TfrmLogin.Conectar(pConexao: TUniConnection; tpConexao: TConexao;
      pUsuario, pSenha, pServidor, pDataBase : string): Boolean;
begin
  Result := False;
  try
    case tpConexao of
      tcPostgres  : pConexao.ProviderName := 'PostgreSQL';
      tcSqlServer : pConexao.ProviderName := 'SQL Server';
      tcSyBase    : pConexao.ProviderName := 'ASE';
    end;

    pConexao.Connected   := False;
    pConexao.Username    := pUsuario;
    pConexao.Password    := pSenha;
    pConexao.Server      := pServidor;
    pConexao.Database    := pDataBase;
    pConexao.LoginPrompt := False;
    pConexao.Connected   := True;

    result := pConexao.Connected;
  except on e:exception do
    MessageDlg(e.Message, mtWarning, [mbOK], 0);
  end;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
  if not Validacao() then
    Exit;

  if not Conectar(FConnection,
                  FtpConexao,
                  edtUsuario.Text,
                  edtSenha.Text,
                  edtServidor.Text,
                  edtDataBase.Text) then
    Exit;

  GravarConfiguracao();
  ModalResult := mrOk;
  Close;
end;

procedure TfrmLogin.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult <> mrOk then
    ModalResult := mrCancel;

//  Action := caFree;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  LerConfiguracao();
end;

constructor TfrmLogin.Create(AOwner: TComponent; pConexao : TUniConnection);
begin
  inherited Create(AOwner);
  FConnection := pConexao;
end;

procedure TfrmLogin.GetTipoConexao(const Value: TConexao);
begin
  FtpConexao := Value;
end;

function TfrmLogin.SetTipoConexao: TConexao;
begin
  Result := FtpConexao;
end;
end.
