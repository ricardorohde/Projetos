unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, IniFiles, {PostgreSQLUniProvider, UniProvider, SQLServerUniProvider, DB,
  DBAccess, Uni, MemDS,} StdCtrls, uADStanIntf, uADStanOption,
  uADStanError, uADGUIxIntf, uADPhysIntf, uADStanDef, uADStanPool,
  uADStanAsync, uADPhysManager, uADPhysPG, DB, uADCompClient;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    procedure GravarConfiguracao;
    procedure LerConfiguracao;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses uConexao;

{$R *.dfm}

procedure TfrmLogin.LerConfiguracao;
//var
//  lConfiguracao : TIniFile;
begin
//  if FileExists( ExtractFilePath(Application.ExeName) + 'ConfiguracaoVersao.ini' ) then
//    begin
//      lConfiguracao := TInifile.Create( ExtractFilePath(Application.ExeName) + 'ConfiguracaoVersao.ini' );
//      try
//        cboTipo.ItemIndex := lConfiguracao.ReadInteger('Configuracao','Tipo', -1);
//        edtUsuario.Text   := lConfiguracao.ReadString('Configuracao','Nome', '');
//        edtSenha.Text     := lConfiguracao.ReadString('Configuracao','Senha', '');
//        cboServidor.Text  := lConfiguracao.ReadString('Configuracao','Servidor', '');
//        cboBase.Text      := lConfiguracao.ReadString('Configuracao','Base', '');
//        //edtVersao.Text    := lConfiguracao.ReadString('Configuracao','Versao', '');
//      finally
//        FreeandNil(lConfiguracao);
//      end; {try}
//    end;
end;

procedure TfrmLogin.GravarConfiguracao;
//var
//  lConfiguracao : TIniFile;
begin
//  lConfiguracao := TInifile.Create( ExtractFilePath(Application.ExeName) + 'ConfiguracaoVersao.ini' );
//  try
//    lConfiguracao.WriteInteger('Configuracao','Tipo', cboTipo.ItemIndex);
//    lConfiguracao.WriteString('Configuracao','Nome', edtUsuario.Text);
//    lConfiguracao.WriteString('Configuracao','Senha', edtSenha.Text);
//    lConfiguracao.WriteString('Configuracao','Servidor', cboServidor.Text);
//    lConfiguracao.WriteString('Configuracao','Base', cboBase.Text);
//    //lConfiguracao.WriteString('Configuracao','Versao', edtVersao.Text);
//  finally
//    FreeandNil(lConfiguracao);
//  end; {try}
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  LerConfiguracao;
end;

procedure TfrmLogin.btnConectarClick(Sender: TObject);
begin
  GravarConfiguracao;
//  Conectar(UniConnection1, tcPostgres, 'postgres', 'abc123!', 'localhost', 'postgres');
  ModalResult := mrOk;
  Close;
end;

procedure TfrmLogin.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

end.
