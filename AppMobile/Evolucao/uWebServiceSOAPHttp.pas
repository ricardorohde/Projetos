unit uWebServiceSOAPHttp;

interface

uses System.SysUtils, System.Classes, WinINet, Soap.Win.CertHelper, Soap.SOAPHTTPTrans, Capicom_TLB, Variants,
  StrUtils, Forms;

type
  TGenericAcessWebServiceSOAP = class
  private
    procedure HTTPReqResp1BeforePost(const HTTPReqResp: THTTPReqResp; Data: Pointer);
    function GetCertificado: ICertificate2;
  protected
    URL: String;
    HTTPReqResp: THTTPReqResp;
    SerieCertificado: String;
    CertificadoSelecionado: ICertificate2;
    UsaCertificado: Boolean;
  public
    SOAPAction: String;
    Constructor Create(UsaCertificado: Boolean); overload;
    Constructor Create(UsaCertificado: Boolean; SerieCertificado: String); overload;
    Destructor Destroy; override;
    function Execute(XML: String): String;
    function setUrl(value: String): TGenericAcessWebServiceSOAP;
  end;

implementation

{ TWebServiceSOAP }

constructor TGenericAcessWebServiceSOAP.Create(UsaCertificado: Boolean);
begin
  HTTPReqResp := THTTPReqResp.Create(nil);
  self.UsaCertificado := UsaCertificado;
  if UsaCertificado then
    HTTPReqResp.OnBeforePost := HTTPReqResp1BeforePost;
end;

constructor TGenericAcessWebServiceSOAP.Create(UsaCertificado: Boolean; SerieCertificado: String);
begin
  Create(UsaCertificado);
  self.SerieCertificado := ReplaceStr(UpperCase(Trim(SerieCertificado)), ' ', EmptyStr);
end;

destructor TGenericAcessWebServiceSOAP.Destroy;
begin
  if Assigned(HTTPReqResp) then
    FreeAndNil(HTTPReqResp);

  if Assigned(CertificadoSelecionado) then
    CertificadoSelecionado := nil;
  inherited;
end;

function TGenericAcessWebServiceSOAP.Execute(XML: String): String;
var
  Retorno, Envio: TStringStream;
begin
  try
    Envio := TStringStream.Create(XML);
    Retorno := TStringStream.Create(EmptyStr);

    HTTPReqResp.URL := self.URL;
    HTTPReqResp.SOAPAction := self.SOAPAction;
    try
      HTTPReqResp.Execute(Envio, Retorno);

    Except
      on E: Exception do
      begin
        CertificadoSelecionado := nil;
        raise Exception.Create(E.Message);
      end;
    end;
    Result := Retorno.DataString;
  finally
    if Assigned(Envio) then
      FreeAndNil(Envio);
    if Assigned(Retorno) then
      FreeAndNil(Retorno);
  end;
end;

function TGenericAcessWebServiceSOAP.GetCertificado: ICertificate2;
var
  Store: IStore3;
  CertsLista: ICertificates2;
  CertDados: ICertificate;
  lSigner: TSigner;
  lSignedData: TSignedData;
  CertContext: ICertContext;
  PCertContext: PCCERT_CONTEXT;
  I: Integer;
begin
  try
    Store := CoStore.Create;
    Store.Open(CAPICOM_CURRENT_USER_STORE, 'My', CAPICOM_STORE_OPEN_MAXIMUM_ALLOWED);

    CertsLista := Store.Certificates as ICertificates2;
    if (SerieCertificado <> EmptyStr) and (SerieCertificado <> #0) then
      for I := 1 to CertsLista.Count do // Procura o certificado pelo numero de serie
        if (IInterface(CertsLista.Item[I]) as ICertificate2).SerialNumber = self.SerieCertificado then
          CertDados := IInterface(CertsLista.Item[I]) as ICertificate2;

    // caso nao encontre o certificado pela serie mostra a lista de certificados
    if not Assigned(CertDados) then
      CertDados := IInterface(CertsLista.Select('Certificado(s) Digital(is) disponível(is)',
        'Selecione o Certificado Digital para uso no aplicativo', false).Item[1]) as ICertificate2;

    if Assigned(CertDados) then
    begin
      { Configura o objeto responsável por fazer a assinatura,
        informando qual é o certificado a ser usado e o conteúdo a ser assinado }
      lSigner := TSigner.Create(nil);
      lSigner.Certificate := CertDados;
      lSignedData := TSignedData.Create(nil);
      lSignedData.Content := ' ';

      if CertDados.ValidFromDate > Now then
      begin
        raise Exception.Create('Certificado não liberado. aguardar ' + datetostr(CertDados.ValidFromDate));
        exit;
      end;

      if CertDados.ValidToDate < Now then
      begin
        raise Exception.Create('Certificado expirado');
        exit;
      end;

      { Solicita a senha }
      lSignedData.Sign(lSigner.DefaultInterface, false, CAPICOM_ENCODE_BASE64);

      Result := ICertificate2(CertDados);

      lSignedData.Free;
      lSigner.Free;
    end;
  finally
    if Assigned(Store) then
    begin
      Store.Close;
      Store := Nil;
    end;
  end;
end;

procedure TGenericAcessWebServiceSOAP.HTTPReqResp1BeforePost(const HTTPReqResp: THTTPReqResp; Data: Pointer);
var
  CertContext: ICertContext;
  PCertContext: PCCERT_CONTEXT;
begin
  if UsaCertificado then
  begin
    if not Assigned(CertificadoSelecionado) then
      CertificadoSelecionado := GetCertificado;

    if Assigned(CertificadoSelecionado) then
    begin
      if Supports(CertificadoSelecionado, ICertContext, CertContext) then
      begin
        CertContext.Get_CertContext(Integer(PCertContext));

        if not InternetSetOption(Data, INTERNET_OPTION_CLIENT_CERT_CONTEXT, PCertContext, Sizeof(CERT_CONTEXT) * 5) then
          raise Exception.Create('Falha ao atribuir o certificado a conexão!');
      end;
    end;
  end;
end;

function TGenericAcessWebServiceSOAP.setUrl(value: String): TGenericAcessWebServiceSOAP;
begin
  self.URL := value;
  Result := self;
end;

end.
