unit uCertificado;

interface

uses System.SysUtils, System.Classes, WinINet, Soap.Win.CertHelper, Soap.SOAPHTTPTrans, Capicom_TLB, Variants,
  StrUtils, Forms, MSXML2_TLB, IdHashSHA, Winapi.ActiveX, uNFSeUtil, System.Win.ComObj, Windows, Assinatura_Nfse_TLB;

type
  TCertificado = class
    private
      Handle: THandle;
      FCertificadoSelecionado: ICertificate2;
      FCertStoreMem: IStore3;

      FSerieCertificado: string;
      procedure SetCertificadoSelecionado(const Value: ICertificate2);
      function GetCertificado: ICertificate2;
      procedure SetSerieCertificado(const Value: string);
      procedure VerificarValoresPadrao(var SignatureNode,
        SelectionNamespaces: String);
      function AdicionarSignatureElement(ConteudoXML: String;
        AddX509Data: Boolean; docElement, IdSignature: String): String;
      function SignatureElement(const URI: String; AddX509Data: Boolean;
        IdSignature: String): String;
      function AjustarXMLAssinado(const ConteudoXML: String; X509DER: String = ''): String;
    public
      function Assinar(Value: string): WideString;overload;
      function Assinar(const ConteudoXML, docElement, infElement: String;
        SignatureNode, SelectionNamespaces, IdSignature: String): String;overload;

      property SerieCertificado: string read FSerieCertificado write SetSerieCertificado;
      property CertificadoSelecionado: ICertificate2 read GetCertificado write SetCertificadoSelecionado;
  end;
const
  DSIGNS = 'xmlns:ds="http://www.w3.org/2000/09/xmldsig#"';
  CAPICOM_STORE_NAME = 'My'; //My CA Root AddressBook
  CAPICOM_SIGNATURE_NODE = './/ds:Signature';
  CTagX509Ini = '<X509Certificate>';
  CTagX509Fim = '</X509Certificate>';
implementation

function TCertificado.Assinar(Value: string): WideString;
var
  Assinatura_Nfse: IAssinatura_Nfse;
begin
  //A dll Assinatura_Nfse.DLL foi compilada no .net framework 4.0
  Assinatura_Nfse:= CoAssinarNFSe.Create;
  try
    Result:= Assinatura_Nfse.AssinaturaRPS(Value, FSerieCertificado);
  finally
    Assinatura_Nfse:= nil;
  end;
end;

procedure TCertificado.SetCertificadoSelecionado(const Value: ICertificate2);
begin
  FCertificadoSelecionado := Value;
end;

procedure TCertificado.SetSerieCertificado(const Value: string);
begin
  FSerieCertificado := Value;
end;

function TCertificado.GetCertificado: ICertificate2;
var
  Store: IStore3;
  CertsLista: ICertificates2;
  CertDados: ICertificate;
  lSigner: TSigner;
  lSignedData: TSignedData;
  CertContext: ICertContext;
  PCertContext: PCCERT_CONTEXT;
  lSerial: string;
  I: Integer;
begin
  try
    Store := CoStore.Create;
    Store.Open(CAPICOM_CURRENT_USER_STORE, 'My', CAPICOM_STORE_OPEN_MAXIMUM_ALLOWED);

    CertsLista := Store.Certificates as ICertificates2;
    if (SerieCertificado <> EmptyStr) and (SerieCertificado <> #0) then
      for I := 1 to CertsLista.Count do // Procura o certificado pelo numero de serie
      begin
        lSerial:= (IInterface(CertsLista.Item[I]) as ICertificate2).SerialNumber;
        if lSerial = AnsiUpperCase(Trim(self.SerieCertificado)) then
          CertDados := IInterface(CertsLista.Item[I]) as ICertificate2;
      end;

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

procedure TCertificado.VerificarValoresPadrao(var SignatureNode: String;
  var SelectionNamespaces: String);
begin
  if SignatureNode = '' then
    SignatureNode := CAPICOM_SIGNATURE_NODE;

  if SelectionNamespaces = '' then
    SelectionNamespaces := DSIGNS
  else
  begin
    if LeftStr(SelectionNamespaces, Length(DSIGNS)) <> DSIGNS then
      SelectionNamespaces := DSIGNS + ' ' + SelectionNamespaces;
  end;
end;

function TCertificado.Assinar(const ConteudoXML, docElement, infElement: String;
  SignatureNode: String; SelectionNamespaces: String; IdSignature: String
  ): String;
var
  AXml, XmlAss: AnsiString;
  xmldoc: IXMLDOMDocument3;
  xmldsig: IXMLDigitalSignature;
  dsigKey: IXMLDSigKey;
  signedKey: IXMLDSigKey;
  PrivateKey: IPrivateKey;
  Inicializado: Boolean;
  lSigner : TSigner;
begin
  FCertStoreMem := nil;
  Inicializado := (CoInitialize(nil) in [ S_OK, S_FALSE ]);
  try
    try
      FCertificadoSelecionado:= GetCertificado;
      // Criando memória de Store de Certificados para o ACBr, e adicionado certificado lido nela //
      FCertStoreMem := CoStore.Create;
      FCertStoreMem.Open(CAPICOM_MEMORY_STORE, 'MemoriaACBr', CAPICOM_STORE_OPEN_READ_ONLY);
      FCertStoreMem.Add( FCertificadoSelecionado );

      // IXMLDOMDocument3 deve usar a String Nativa da IDE //
//      {$IfDef FPC2}
//       AXml := ACBrUTF8ToAnsi(ConteudoXML);
//      {$Else}
       AXml := UTF8ToNativeString(ConteudoXML);
//      {$EndIf}
      XmlAss := '';

      // Usa valores default, se não foram informados //
      VerificarValoresPadrao(SignatureNode, SelectionNamespaces);

      // Inserindo Template da Assinatura digital //
      if (not XmlEstaAssinado(AXml)) or (SignatureNode <> CAPICOM_SIGNATURE_NODE) then
        AXml := AdicionarSignatureElement(AXml, False, docElement, IdSignature);

      try
        // Criando XMLDOC //
        xmldoc := CoDOMDocument50.Create;
        xmldoc.async := False;
        xmldoc.validateOnParse := False;
        xmldoc.preserveWhiteSpace := True;

        // Carregando o AXml em XMLDOC
        if (not xmldoc.loadXML( WideString(AXml) )) then
          raise Exception.Create('Não foi possível carregar XML'+sLineBreak+ AXml);

        xmldoc.setProperty('SelectionNamespaces', SelectionNamespaces);

        //DEBUG
        //xmldoc.save('c:\temp\xmldoc.xml');

        // Criando Elemento de assinatura //
        xmldsig := CoMXDigitalSignature50.Create;

        // Lendo elemento de Assinatura de XMLDOC //
        xmldsig.signature := xmldoc.selectSingleNode( WideString(SignatureNode) );
        if (xmldsig.signature = nil) then
          raise Exception.Create('É preciso carregar o template antes de assinar.');

        // Lendo Chave Privada do Certificado //
        OleCheck(IDispatch(FCertificadoSelecionado.PrivateKey).QueryInterface(IPrivateKey, PrivateKey));
        xmldsig.store := FCertStoreMem;
        dsigKey := xmldsig.createKeyFromCSP(PrivateKey.ProviderType,
          PrivateKey.ProviderName, PrivateKey.ContainerName, 0);
        if (dsigKey = nil) then
          raise Exception.Create('Erro ao criar a chave do CSP.');

        // Assinando com MSXML e CryptoLib //
        signedKey := xmldsig.sign(dsigKey, $00000002);
        if (signedKey = nil) then
          raise Exception.Create('Assinatura Falhou.');

        //DEBUG
        //xmldoc.save('c:\temp\ass.xml');
        XmlAss := AnsiString(xmldoc.xml);

        // Convertendo novamente para UTF8
//        {$IfDef FPC2}
//         XmlAss := ACBrAnsiToUTF8( XmlAss );
//        {$Else}
         XmlAss := NativeStringToUTF8( String(XmlAss) );
//        {$EndIf}

        // Ajustando o XML... CAPICOM insere um cabeçalho inválido
        XmlAss := AjustarXMLAssinado(XmlAss);
      finally
        dsigKey := nil;
        signedKey := nil;
        xmldoc := nil;
        xmldsig := nil;
      end;

      Result := DefinirEnvelopeSoap(XmlAss);

//      FCertificadoSelecionado.Disconnect;
    finally
      FreeAndNil( lSigner );
    end;
  finally
    if Inicializado then
      CoUninitialize;
  end;
end;

function TCertificado.AdicionarSignatureElement(ConteudoXML: String;
  AddX509Data: Boolean; docElement, IdSignature: String): String;
var
  URI, TagEndDocElement: String;
  I: Integer;
begin
  URI := ExtraiURI(ConteudoXML);

  TagEndDocElement := '</' + docElement + '>';
  I := PosLast(TagEndDocElement, ConteudoXML);
  if I = 0 then
    raise Exception.Create('Não encontrei final do elemento: ' + TagEndDocElement);

  Result := copy(ConteudoXML, 1, I - 1) +
            SignatureElement(URI, AddX509Data, IdSignature) + TagEndDocElement;
end;

function TCertificado.SignatureElement(const URI: String; AddX509Data: Boolean;
  IdSignature: String): String;
begin
  {(*}
  Result :=
  '<Signature xmlns="http://www.w3.org/2000/09/xmldsig#"' + IdSignature + '>' +
    '<SignedInfo>' +
      '<CanonicalizationMethod Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315" />' +
      '<SignatureMethod Algorithm="http://www.w3.org/2000/09/xmldsig#rsa-sha1" />' +
      '<Reference URI="' + IfThen(URI = '', '', '#' + URI) + '">' +
        '<Transforms>' +
          '<Transform Algorithm="http://www.w3.org/2000/09/xmldsig#enveloped-signature" />' +
          '<Transform Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315" />' +
        '</Transforms>' +
        '<DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1" />' +
        '<DigestValue></DigestValue>' +
      '</Reference>' +
    '</SignedInfo>' +
    '<SignatureValue></SignatureValue>' +
    '<KeyInfo>' +
    IfThen(AddX509Data,
      '<X509Data>' +
        CTagX509Ini+CTagX509Fim+
      '</X509Data>',
      '')+
    '</KeyInfo>'+
  '</Signature>';
  {*)}
end;

function TCertificado.AjustarXMLAssinado(const ConteudoXML: String;
  X509DER: String): String;
var
  XmlAss: String;
  PosSig, PosIni, PosFim: Integer;

  function RemoveEspacos( const AXML, TagIni, TagFim : String): String;
  begin
    Result := '';
    PosIni := PosLast(TagIni, AXML);
    if PosIni > 0 then
    begin
      PosFim := PosEx(TagFim, AXML, PosIni + 1);
      if PosFim > 0 then
        Result := copy(AXML, 1, PosIni - 1) +
                  StringReplace(copy(AXML, PosIni, PosFim-PosIni), ' ', '', [rfReplaceAll])+
                  copy(AXML, PosFim, Length(AXML));
    end;

    if Result = '' then
      Result := AXML;
  end;
begin
  XmlAss := ConteudoXML;

  // Removendo Declaração sem UTF8 Ex: <?xml version="1.0"?> //
  if not XmlEhUTF8(ObtemDeclaracaoXML(XmlAss)) then
    XmlAss := RemoverDeclaracaoXML(XmlAss);

  // Removendo quebras de linha //
  XmlAss := StringReplace(XmlAss, #10, '', [rfReplaceAll]);
  XmlAss := StringReplace(XmlAss, #13, '', [rfReplaceAll]);

  PosSig := PosLast('<SignatureValue>', XmlAss);
  if PosSig > 0 then
  begin
    PosIni := PosEx(CTagX509Ini, XmlAss, PosSig)-1;

    if X509DER = '' then
    begin
      // Considerando apenas o último Certificado X509, da assinatura //
      if PosIni >= 0 then
      begin
        PosFim := PosLast(CTagX509Ini, XmlAss);
        XmlAss := copy(XmlAss, 1, PosIni) + copy(XmlAss, PosFim, length(XmlAss));
      end;
    end
    else
    begin
      // Remove todos Certificados adicionados, e Adiciona o X509DER informado //
      PosFim := 0;
      if PosIni <= 0 then
      begin
        PosIni := PosEx('<X509Certificate/>', XmlAss, PosSig)-1;
        if PosIni >= 0 then
          PosFim := PosIni + 18 ;
      end
      else
      begin
        PosFim := PosLast('</X509Certificate>', XmlAss);
        if PosFim > 0 then
          PosFim := PosFim + 18;
      end;

      if (PosIni > 0) and (PosFim > 0) then
      begin
        XmlAss := copy(XmlAss, 1, PosIni) +
                  CTagX509Ini + X509DER + CTagX509Fim +
                  copy(XmlAss, PosFim, length(XmlAss));
      end;
    end;
  end;

  // CAPICOM insere espaços em alguns Elementos da Assinatura //
  XmlAss := RemoveEspacos(XmlAss, '<SignatureValue>', '</KeyInfo>');

  Result := XmlAss;
end;

end.
