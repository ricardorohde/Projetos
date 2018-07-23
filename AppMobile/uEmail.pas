unit uEmail;

interface

uses IdBaseComponent, IdMessage, IdSMTPBase, IdSMTP, IdText, IdAttachmentFile, IdSASLLogin,
  IdUserPassProvider, generics.collections, Classes, SysUtils;

type
  TTypeTemplateBodyEmail = (First, Second, Third, Other);

Type
  TTypeAuthenticate = (None, Default, SASL);

type
  TBodyEmail = Class
  protected
    FDestination: String;
    FCc: String;
    FCco: String;
    FSubject: String;
    FType: TTypeTemplateBodyEmail;
    FName: String;
    FDate: TDate;
    FQuotation: Integer;

  public
    function setDestination(Value: String): TBodyEmail;
    function setCc(Value: String): TBodyEmail;
    function setCco(Value: String): TBodyEmail;
    function setSubject(Value: String): TBodyEmail;
    function setType(Value: TTypeTemplateBodyEmail): TBodyEmail;
    function setName(Value: String): TBodyEmail;
    function setDate(Value: TDate): TBodyEmail;
    function setQuotation(Value: Integer): TBodyEmail;

    function getDestination: String;
    function getCc: String;
    function getCco: String;
    function getSubject: String;
    function getType: TTypeTemplateBodyEmail;
    function getName: String;
    function getDate: TDate;
    function getQuotation: Integer;
  End;

Type
  TEmail = Class // This is Singleton
  protected
    FSender: String;
    FPort: Integer;
    FSmtp: String;
    FPassword: String;
    FAuthenticate: TTypeAuthenticate;
    FContentType: String;
    FName: String;
    class var FInstance: TEmail;

  public
    function send(List: TObjectList<TBodyEmail>): Boolean;
    class function GetInstance: TEmail;
    class destructor DestroyClass;

    function setSender(Value: String): TEmail;
    function setPort(Value: Integer): TEmail;
    function setSmtp(Value: String): TEmail;
    function setPassword(Value: String): TEmail;
    function setAuthenticate(Value: TTypeAuthenticate): TEmail;
    function setContentType(Value: String): TEmail;
    function setName(Value: String): TEmail;

    function getSender: String;
    function getPort: Integer;
    function getSmtp: String;
    function getPassword: String;
    function getAuthenticate: TTypeAuthenticate;
    function getContentType: String;
    function getName: String;
    function getTemplateBody(BodyEmail: TBodyEmail): String;

  End;

implementation

{ TEmail }

class destructor TEmail.DestroyClass;
begin
  if Assigned(FInstance) then
    FInstance.Free;
end;

class function TEmail.GetInstance: TEmail;
begin
  if not Assigned(FInstance) then
    FInstance := TEmail.Create;
  Result := FInstance;
end;

function TEmail.send(List: TObjectList<TBodyEmail>): Boolean;
var
  IdSMTP: TIdSMTP;
  IdSASLLogin: TIdSASLLogin;
  IdUserPassProvider: TIdUserPassProvider;
  IdMessage: TIdMessage;
  IdText: TIdText;
  I: Integer;
  Msg: String;
begin
  try
    Result := False;
    IdSMTP := TIdSMTP.Create(nil);

    IdSMTP.Host := self.getSmtp;
    IdSMTP.Username := self.getSender;
    IdSMTP.Password := self.getPassword;
    IdSMTP.Port := self.getPort;

    case self.getAuthenticate of
      None:
        IdSMTP.AuthType := satNone;
      Default:
        IdSMTP.AuthType := satDefault;
      SASL:
        begin
          IdSMTP.AuthType := satSASL;
          IdSMTP.SASLMechanisms.Add.SASL := IdSASLLogin;

          IdSASLLogin := TIdSASLLogin.Create(IdSMTP);
          IdUserPassProvider := TIdUserPassProvider.Create(IdSMTP);

          IdUserPassProvider.Username := self.getSender;
          IdUserPassProvider.Password := self.getPassword;
          IdSASLLogin.UserPassProvider := IdUserPassProvider;
        end;
    else
      IdSMTP.AuthType := satDefault;
    end;

    for I := 0 to List.Count - 1 do
    begin
      IdMessage := TIdMessage.Create(IdSMTP);
      IdMessage.From.Address := self.getSender;
      IdMessage.From.Name := self.getName;
      IdMessage.Recipients.EMailAddresses := List.Items[I].getDestination;
      IdMessage.CCList.EMailAddresses := List.Items[I].getCc;
      IdMessage.BccList.EMailAddresses := List.Items[I].getCco;
      IdMessage.ContentType := self.getContentType;
      IdMessage.Subject := List.Items[I].getSubject;

      IdText := TIdText.Create(IdMessage.MessageParts);

      IdText.ContentType := 'text/html';

      IdText.Body.Add(self.getTemplateBody(List.Items[I]));

      IdSMTP.Connect;
      try
        if IdSMTP.Connected and IdSMTP.Authenticate then
          IdSMTP.send(IdMessage);
      finally
        IdSMTP.Disconnect;
      end;
    end;
    Result := True;

  finally
    if Assigned(IdSMTP) then
      FreeAndNil(IdSMTP);
  end;
end;

function TEmail.getAuthenticate: TTypeAuthenticate;
begin
  Result := FAuthenticate;
end;

function TEmail.getContentType: String;
begin
  Result := FContentType;
end;

function TEmail.getName: String;
begin
  Result := self.FName;
end;

function TEmail.getPassword: String;
begin
  Result := self.FPassword;
end;

function TEmail.getPort: Integer;
begin
  Result := self.FPort;
end;

function TEmail.getSender: String;
begin
  Result := self.FSender;
end;

function TEmail.getSmtp: String;
begin
  Result := self.FSmtp;
end;

function TEmail.getTemplateBody(BodyEmail: TBodyEmail): String;
begin
  case BodyEmail.getType of
    First:
      begin
        Result := Format('<html><body><br>Prezado(a) %s,<br>' + '<br>Conforme solicitado segue anexada a cotação n&#186; %s .<br>'
          + '<br>Ficamos a sua disposição para esclarecer qualquer informação pertinente aos produtos ou preços presentes neste' +
          ' documento.<br>' +
          '<br>Caso tenha alguma dúvida ou questão pedimos que responda este e-mail ou entre em contato no telefone ' +
          '(11) 4612.5448 ou 4614.8070.<br><br>Muito obrigado por cotar conosco!<br><br>Atenciosamente,<br>' +
          '<br><u><b>(Usuário que criou a cotação)</b></u><u><b><br>' +
          '</b></u>Departamento de Customer Service<br>Labtrade do Brasil &amp; LGC Biotecnologia<br>' +
          '(+55.11) 4612.5448<br>(+55.11) 4614.8070<br>' +
          'Sites: <a href="http://www.labtrade.com.br" target="_blank">Labtrade</a> &amp;' +
          '<a href="http://www.lgcbio.com.br" target="_blank">LGCBio</a> &amp; <a href="http://www.facebook.com/LgcBiotecnologia" target="_blank">Facebook</a><br>'
          + '</body></html>', [BodyEmail.getName, IntToStr(BodyEmail.getQuotation)]);
      end;
    Second:
      begin
        Result := Format('<html><body><br>Prezado(a) %s,<br>' + '<br>Conforme solicitado anteriormente e já enviada na data de ' +
          '%s segue novamente a cotação n&#186; %s para sua avaliação.<br><br>' +
          'Caso tenha alguma dúvida ou questão relacionada aos produtos ou aos ' +
          'seus respectivos preços pedimos que entre em contato conosco, nossa ' +
          'intensão é tentar atendê-lo da melhor maneira.<br><br>Muito obrigado por cotar conosco!<br><br>' +
          'Atenciosamente,<br><br><u><b>(Usuário que criou a cotação)</b></u><u><b><br>' +
          '</b></u>Departamento de Customer Service<br>' + 'Labtrade do Brasil &amp; LGC Biotecnologia<br>' + '(+55.11) 4612.5448'
          + '<br>(+55.11) 4614.8070<br>' + 'Sites: <a href="http://www.labtrade.com.br" target="_blank">Labtrade</a> &amp;' +
          '<a href="http://www.lgcbio.com.br" target="_blank">LGCBio</a> &amp; <a href="http://www.facebook.com/LgcBiotecnologia" target="_blank">Facebook</a><br>'
          + '</body></html>', [BodyEmail.getName, IntToStr(BodyEmail.getQuotation), FormatDateTime('dd/mm/yyyy aaaa',
          BodyEmail.getDate)]);
      end;
    Third:
      begin

      end;
    Other:
      begin
        Result := Format('<html><body><br>Prezado(a) %s,<br>' + '<br>Conforme solicitado segue anexada a cotação n&#186; %s.<br>'
          + '<br>Ficamos a sua disposição para esclarecer qualquer informação pertinente aos produtos ou preços presentes neste' +
          ' documento.<br>' +
          '<br>Caso tenha alguma dúvida ou questão pedimos que responda este e-mail ou entre em contato no telefone ' +
          '(11) 4612.5448 ou 4614.8070.<br><br>Muito obrigado por cotar conosco!<br><br>Atenciosamente,<br>' +
          '<br><u><b>(Usuário que criou a cotação)</b></u><u><b><br>' +
          '</b></u>Departamento de Customer Service<br>Labtrade do Brasil &amp; LGC Biotecnologia<br>' +
          '(+55.11) 4612.5448<br>(+55.11) 4614.8070<br>' +
          'Sites: <a href="http://www.labtrade.com.br" target="_blank">Labtrade</a> &amp;' +
          '<a href="http://www.lgcbio.com.br" target="_blank">LGCBio</a> &amp; <a href="http://www.facebook.com/LgcBiotecnologia" target="_blank">Facebook</a><br>'
          + '</body></html>', [BodyEmail.getName, IntToStr(BodyEmail.getQuotation)]);
      end;
  end;
end;

function TEmail.setAuthenticate(Value: TTypeAuthenticate): TEmail;
begin
  self.FAuthenticate := Value;
  Result := self;
end;

function TEmail.setContentType(Value: String): TEmail;
begin
  self.FContentType := Value;
  Result := self;
end;

function TEmail.setName(Value: String): TEmail;
begin
  self.FName := Value;
  Result := self;
end;

function TEmail.setPassword(Value: String): TEmail;
begin
  self.FPassword := Value;
  Result := self;
end;

function TEmail.setPort(Value: Integer): TEmail;
begin
  self.FPort := Value;
  Result := self;
end;

function TEmail.setSender(Value: String): TEmail;
begin
  self.FSender := Value;
  Result := self;
end;

function TEmail.setSmtp(Value: String): TEmail;
begin
  self.FSmtp := Value;
  Result := self;
end;

{ TBodyEmail }

function TBodyEmail.getCc: String;
begin
  Result := self.FCc;
end;

function TBodyEmail.getCco: String;
begin
  Result := self.FCco;
end;

function TBodyEmail.getDate: TDate;
begin
  Result := self.FDate;
end;

function TBodyEmail.getDestination: String;
begin
  Result := self.FDestination;
end;

function TBodyEmail.getName: String;
begin
  Result := self.FName;
end;

function TBodyEmail.getQuotation: Integer;
begin
  Result := self.FQuotation;
end;

function TBodyEmail.getSubject: String;
begin
  Result := self.FSubject;
end;

function TBodyEmail.getType: TTypeTemplateBodyEmail;
begin
  Result := self.FType;
end;

function TBodyEmail.setCc(Value: String): TBodyEmail;
begin
  self.FCc := Value;
  Result := self;
end;

function TBodyEmail.setCco(Value: String): TBodyEmail;
begin
  self.FCco := Value;
  Result := self;
end;

function TBodyEmail.setDate(Value: TDate): TBodyEmail;
begin
  self.FDate := Value;
  Result := self;
end;

function TBodyEmail.setDestination(Value: String): TBodyEmail;
begin
  self.FDestination := Value;
  Result := self;
end;

function TBodyEmail.setName(Value: String): TBodyEmail;
begin
  self.FName := Value;
  Result := self;
end;

function TBodyEmail.setQuotation(Value: Integer): TBodyEmail;
begin
  self.FQuotation := Value;
  Result := self;
end;

function TBodyEmail.setSubject(Value: String): TBodyEmail;
begin
  self.FSubject := Value;
  Result := self;
end;

function TBodyEmail.setType(Value: TTypeTemplateBodyEmail): TBodyEmail;
begin
  self.FType := Value;
  Result := self;
end;

end.
