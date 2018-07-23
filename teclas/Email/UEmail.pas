unit UEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdMessage, Buttons, IdComponent,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP, IdPOP3,
  IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdtPara: TEdit;
    EdtAssunto: TEdit;
    MemMensagem: TMemo;
    LbxAnexos: TListBox;
    Label4: TLabel;
    ButAnexar: TBitBtn;
    ButEnviar: TBitBtn;
    ButFechar: TBitBtn;
    ODAnexos: TOpenDialog;
    IdMessage: TIdMessage;
    IdSMTP: TIdSMTP;
    IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket;
    IdPOP31: TIdPOP3;
    procedure ButAnexarClick(Sender: TObject);
    procedure ButFecharClick(Sender: TObject);
    procedure ButEnviarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ButAnexarClick(Sender: TObject);
begin
  if odAnexos.Execute then
    lbxAnexos.Items.Add(odAnexos.FileName);
end;

procedure TForm1.ButFecharClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.ButEnviarClick(Sender: TObject);
var Anexo : Integer;
begin
  // Dados da Mensagem
  IdMessage.Recipients.EMailAddresses := EdtPara.Text;  // email do Destinatário
  IdMessage.Subject := EdtAssunto.Text;                 // assunto
  IdMessage.Body := MemMensagem.Lines;                  // texto da mensagem
  IdMessage.From.Address := 'edson_feso@hotmail.com';    // Email do Remetente
  IdMessage.From.Name    := 'Edson';             // Nome do Remetente, que aparecerá qdo chegar.

  //Manipulando os Anexos
  for Anexo := 0 to lbxAnexos.Items.Count-1 do
    TIdAttachment.Create(IdMessage.MessageParts, TFileName(lbxAnexos.Items.Strings[Anexo]));

  // Configurações POP3
  //  !! -- É aqui onde a maioria dos códigos falham. Em alguns provedores é necessário receber mensagens
  //  !! -- para depois enviar. Não basta, portanto, só o SMTP. É necessário colocar o componente IdPOP3
  //  !! -- da paleta Indy Clients e configurá-lo.

  IdPOP31.Host     := 'pop.gmail.com'; // servidor POP3 do seu provedor
  IdPOP31.Username := 'edson.desbravador@gmail.com';              // seu login de e-mail
  IdPOP31.Password := 'bingola1987!';     // sua senha  -- Recomenda-se usar uma Edit com máscara!!
  IdPOP31.Connect;

  IdSMTP.Host  := 'smtp.gmail.com';         // servidor SMTP do seu provedor
  IdSMTP.AuthenticationType := atNone {atLogin}; // sem autenticação (já foi feita no POP3)
  // !! -- caso seu provedor não use POP3, apague as configurações POP3, mude a autenticação para atLogin
  // !! -- e habilite as 2 linhas abaixo:
  //IdSMTP.Username := 'fulano';              // seu login de e-mail
  //IdSMTP.Password := 'senha_do_fulano';     // sua senha  -- Recomenda-se usar uma Edit com máscara!!

  IdSMTP.Connect;
  try
    IdSMTP.Send(IdMessage);
  finally
    IdSMTP.Disconnect;
  end;
  Application.MessageBox('Email enviado com sucesso!', 'Confirmação',MB_ICONINFORMATION +   MB_OK);

end;

end.
