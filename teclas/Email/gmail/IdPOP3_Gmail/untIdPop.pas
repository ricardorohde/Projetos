unit untIdPop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, StdCtrls, Buttons, IdIOHandler, IdIOHandlerSocket,
  IdSSLOpenSSL, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdMessageClient, IdPOP3;

type
  TForm1 = class(TForm)
    IdPOP31: TIdPOP3;
    IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket;
    btnConectar: TBitBtn;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnConectarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnConectarClick(Sender: TObject);
begin
  IdPOP31.Disconnect();
  btnConectar.Caption := 'Aguarde...';
  Application.ProcessMessages;
  IdPOP31.Username := edtUsuario.Text;
  IdPOP31.Password := edtSenha.Text;
  try
    IdPOP31.Connect();
    MessageDlg('Conexão realizada com sucesso.', mtInformation, [mbOK], 0);
  except
    MessageDlg('Erro ao realizar a conexão. Usuário ou senha inválido(s).', mtError, [mbOK], 0);
  end;
  btnConectar.Caption := 'Conectar';
end;

end.
