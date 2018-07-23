unit untIdPop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, StdCtrls, Buttons, IdIOHandler, IdIOHandlerSocket,
  IdSSLOpenSSL, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdMessageClient, IdPOP3, IdSMTP, IdMessage;

type
  TForm1 = class(TForm)
    IdPOP31: TIdPOP3;
    IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket;
    btnConectar: TBitBtn;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    IdSMTP: TIdSMTP;
    IdMessage: TIdMessage;
    procedure btnConectarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  IdMessage.Recipients.EMailAddresses := 'edson_feso@hotmail.com';  // email do Destinatário
  IdMessage.Subject := 'teste';                 // assunto
  IdMessage.Body.Add('teste');                  // texto da mensagem
  IdMessage.From.Address := 'edson_feso@hotmail.com';    // Email do Remetente
  IdMessage.From.Name    := 'Edson';             // Nome do Remetente, que aparecerá qdo chegar.
  
  IdPOP31.Disconnect();
  btnConectar.Caption := 'Aguarde...';
  Application.ProcessMessages;
  IdPOP31.Username := edtUsuario.Text;
  IdPOP31.Password := edtSenha.Text;

  try
    IdPOP31.Connect();

    IdSMTP.Host  := 'smtp.gmail.com';         // servidor SMTP do seu provedor
    IdSMTP.AuthenticationType := atLogin; // sem autenticação (já foi feita no POP3)

    IdSMTP.Username := edtUsuario.Text;              // seu login de e-mail
    IdSMTP.Password := edtSenha.Text;
    IdSMTP.Connect(3000);
    try
      IdSMTP.Send(IdMessage);
    finally
      IdSMTP.Disconnect;
    end;
    MessageDlg('Conexão realizada com sucesso.', mtInformation, [mbOK], 0);
  except
    MessageDlg('Erro ao realizar a conexão. Usuário ou senha inválido(s).', mtError, [mbOK], 0);
  end;
  btnConectar.Caption := 'Conectar';



end;

procedure TForm1.FormShow(Sender: TObject);
begin
  edtUsuario.Text := 'edson.desbravador@gmail.com';
  edtSenha.Text   := 'bingola1987!';
end;

end.
