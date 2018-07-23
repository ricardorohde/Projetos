unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdMessageClient, IdSMTP;

type
  TForm1 = class(TForm)
    Button1: TButton;
    IdSMTP1: TIdSMTP;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  IdSMTP1.Port:=25;
  IdSMTP1.Host:='mail_seuprovedor.com';//seu servidor de e-mail
  IdSMTP1.Username:='seu_usuário da conta de e-mail';
  IdSMTP1.Password:='';
  IdSMTP1.AuthenticationType:=atLogin;
  IdSMTP1.Connect(0);

  //O seu endereço de e-mail
  IdMessage1.From.Address :='Email_originário_da_mensagem';
  //Aqui vai o endereço de e-mail para o qual você quer mandar o e-mail, se mais emails colocar separado por virgula
  IdMessage1.Recipients.EMailAddresses :='seu_mail_aqui';
  //O assunto da mensagem
  IdMessage1.Subject :='Feliz Aniversario';
  //conteudo da mensagem
  IdMessage1.Body.Add('Seu assunto de mensagem');


  try
    IdSMTP1.Send(IdMessage1);
  finally
    IdSMTP1.Disconnect;
  end;
  Application.MessageBox('Email enviado com sucesso!', 'Confirmação',
  MB_ICONINFORMATION +   MB_OK);
end;

end.
