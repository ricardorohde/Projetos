unit int_ReInf;

interface

uses Classes, Contnrs, SysUtils, StrUtils, Dialogs, Variants,
  OleCtrls, ReinfClientX_TLB, BaseLibrary;

type
  TReinf = class;
  TInfo = class;
  TRetorno = class;
  TConfiguracao = class;
  TTipo = (tpIncluir, tpExcluir);

  TInfo = class
    private
      FTelefoneFixo: string;
      FCPFContato: string;
      FClassificacaoTributaria: string;
      FEmail: string;
      FCNPJ_EFR: string;
      FideEFR: string;
      FSituacaoPJ: Byte;
      FAcordoIsentoMulta: Byte;
      FNomeContato: string;
      FEscrituracao: Byte;
      FCelular: string;
      FDesoneracao: Byte;
      FNumeroInscricao: String;
      FVersao: String;
      FTipoInscricao: Byte;
      FTipoAmbiente: Byte;
      FProcEmi: Byte;
      FValidadeFinal: String;
      FValidadeInicial: String;
      procedure SetAcordoIsentoMulta(const Value: Byte);
      procedure SetCelular(const Value: string);
      procedure SetClassificacaoTributaria(const Value: string);
      procedure SetCNPJ_EFR(const Value: string);
      procedure SetCPFContato(const Value: string);
      procedure SetDesoneracao(const Value: Byte);
      procedure SetEmail(const Value: string);
      procedure SetEscrituracao(const Value: Byte);
      procedure SetideEFR(const Value: string);
      procedure SetNomeContato(const Value: string);
      procedure SetSituacaoPJ(const Value: Byte);
      procedure SetTelefoneFixo(const Value: string);
      procedure SetNumeroInscricao(const Value: String);
      procedure SetProcEmi(const Value: Byte);
      procedure SetTipoAmbiente(const Value: Byte);
      procedure SetTipoInscricao(const Value: Byte);
      procedure SetValidadeFinal(const Value: String);
      procedure SetValidadeInicial(const Value: String);
      procedure SetVersao(const Value: String);
    published
      property TipoAmbiente: Byte read FTipoAmbiente write SetTipoAmbiente;
      property ProcEmi: Byte read FProcEmi write SetProcEmi;
      property Versao: String read FVersao write SetVersao;
      property TipoInscricao: Byte read FTipoInscricao write SetTipoInscricao;
      property NumeroInscricao: String read FNumeroInscricao write SetNumeroInscricao;
      property ValidadeInicial: String read FValidadeInicial write SetValidadeInicial;
      property ValidadeFinal: String read FValidadeFinal write SetValidadeFinal;
      property ClassificacaoTributaria: string read FClassificacaoTributaria write SetClassificacaoTributaria;
      property Escrituracao: Byte read FEscrituracao write SetEscrituracao;
      property Desoneracao: Byte read FDesoneracao write SetDesoneracao;
      property AcordoIsentoMulta: Byte read FAcordoIsentoMulta write SetAcordoIsentoMulta;
      property SituacaoPJ: Byte read FSituacaoPJ write SetSituacaoPJ;
      property NomeContato: string read FNomeContato write SetNomeContato;
      property CPFContato: string read FCPFContato write SetCPFContato;
      property TelefoneFixo: string read FTelefoneFixo write SetTelefoneFixo;
      property Celular: string read FCelular write SetCelular;
      property Email: string read FEmail write SetEmail;
      property ideEFR: string read FideEFR write SetideEFR;
      property CNPJ_EFR: string read FCNPJ_EFR write SetCNPJ_EFR;
    public
      function Add: TInfo;
  end;

  TSoftHouse = Class
  private
    FCnpj: string;
    FEmail: string;
    FRazaoSocial: string;
    FContato: string;
    FTelefone: string;
    FToken: string;
    procedure SetCnpj(const Value: string);
    procedure SetContato(const Value: string);
    procedure SetEmail(const Value: string);
    procedure SetRazaoSocial(const Value: string);
    procedure SetTelefone(const Value: string);
    procedure SetToken(const Value: string);
  published
    property Cnpj: string read FCnpj write SetCnpj;
    property RazaoSocial: string read FRazaoSocial write SetRazaoSocial;
    property Contato: string read FContato write SetContato;
    property Telefone: string read FTelefone write SetTelefone;
    property Email: string read FEmail write SetEmail;
    property Token: string read FToken write SetToken;
  end;

  TConfiguracao = class
  private
    FDiretorioEsquemas: string;
    FDiretorioTemplates: string;
    FCpfCnpjEmpregador: string;
    FDiretorioImpressao: string;
    procedure SetCpfCnpjEmpregador(const Value: string);
    procedure SetDiretorioEsquemas(const Value: string);
    procedure SetDiretorioTemplates(const Value: string);
    procedure SetDiretorioImpressao(const Value: string);
  public
    property CpfCnpjEmpregador: string read FCpfCnpjEmpregador write SetCpfCnpjEmpregador;
    property DiretorioTemplates: string read FDiretorioTemplates write SetDiretorioTemplates;
    property DiretorioEsquemas: string read FDiretorioEsquemas write SetDiretorioEsquemas;
    property DiretorioImpressao: string read FDiretorioImpressao write SetDiretorioImpressao;
  end;

  TReinf = class(TComponent)
    private
      FListaReinf: TObjectList;
      FInfo: TInfo;
      FSoftHouse: TSoftHouse;
      Reinf: TspdReinfClientX;
      FConfig: TConfiguracao;
      FRetorno: TRetorno;
      FTipo: TTipo;

      procedure SetInfo(const Value: TInfo);
      procedure SetSoftHouse(const Value: TSoftHouse);
      procedure SetConfig(const Value: TConfiguracao);
      procedure LoadConfig();
      procedure SetRetorno(const Value: TRetorno);
      procedure SetTipo(const Value: TTipo);
    public
      property Tipo: TTipo read FTipo write SetTipo;
      property Info: TInfo read FInfo write SetInfo;
      property SoftHouse: TSoftHouse read FSoftHouse write SetSoftHouse;
      property Config: TConfiguracao read FConfig write SetConfig;
      property Retorno: TRetorno read FRetorno write SetRetorno;

      procedure Incluir();
      procedure Processar();
      procedure AfterConstruction; override;
      procedure BeforeDestruction; override;
  end;

  TRetorno = Class
    private
      FIdLote: WideString;
      FMensagem: WideString;
      procedure SetIdLote(const Value: WideString);
      procedure SetMensagem(const Value: WideString);
    public
      property IdLote: WideString read FIdLote write SetIdLote;
      property Mensagem: WideString read FMensagem write SetMensagem;
  end;
implementation

{ TInfo }

function TInfo.Add: TInfo;
begin
  Result:= TInfo.Create;
end;

procedure TInfo.SetAcordoIsentoMulta(const Value: Byte);
begin
  FAcordoIsentoMulta := Value;
end;

procedure TInfo.SetCelular(const Value: string);
begin
  FCelular := Value;
end;

procedure TInfo.SetClassificacaoTributaria(const Value: string);
begin
  FClassificacaoTributaria := Value;
end;

procedure TInfo.SetCNPJ_EFR(const Value: string);
begin
  FCNPJ_EFR := Value;
end;

procedure TInfo.SetCPFContato(const Value: string);
begin
  FCPFContato := Value;
end;

procedure TInfo.SetDesoneracao(const Value: Byte);
begin
  FDesoneracao := Value;
end;

procedure TInfo.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TInfo.SetEscrituracao(const Value: Byte);
begin
  FEscrituracao := Value;
end;

procedure TInfo.SetideEFR(const Value: string);
begin
  FideEFR := Value;
end;

procedure TInfo.SetNomeContato(const Value: string);
begin
  FNomeContato := Value;
end;

procedure TInfo.SetNumeroInscricao(const Value: String);
begin
  FNumeroInscricao := Value;
end;

procedure TInfo.SetProcEmi(const Value: Byte);
begin
  FProcEmi := Value;
end;

procedure TInfo.SetSituacaoPJ(const Value: Byte);
begin
  FSituacaoPJ := Value;
end;

procedure TInfo.SetTelefoneFixo(const Value: string);
begin
  FTelefoneFixo := Value;
end;

procedure TInfo.SetTipoAmbiente(const Value: Byte);
begin
  FTipoAmbiente := Value;
end;

procedure TInfo.SetTipoInscricao(const Value: Byte);
begin
  FTipoInscricao := Value;
end;

procedure TInfo.SetValidadeFinal(const Value: String);
begin
  FValidadeFinal := Value;
end;

procedure TInfo.SetValidadeInicial(const Value: String);
begin
  FValidadeInicial := Value;
end;

procedure TInfo.SetVersao(const Value: String);
begin
  FVersao := Value;
end;

{ TSoftHouse }

procedure TSoftHouse.SetCnpj(const Value: string);
begin
  FCnpj := Value;
end;

procedure TSoftHouse.SetContato(const Value: string);
begin
  FContato := Value;
end;

procedure TSoftHouse.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TSoftHouse.SetRazaoSocial(const Value: string);
begin
  FRazaoSocial := Value;
end;

procedure TSoftHouse.SetTelefone(const Value: string);
begin
  FTelefone := Value;
end;


procedure TSoftHouse.SetToken(const Value: string);
begin
  FToken := Value;
end;

{ TReinf }

procedure TReinf.AfterConstruction;
begin
  inherited;

  FRetorno:= TRetorno.Create;
  FSoftHouse:= TSoftHouse.Create;
  FListaReinf:= TObjectList.Create;
  Reinf:= TspdReinfClientX.Create(Self);
  FConfig:= TConfiguracao.Create;
end;

procedure TReinf.BeforeDestruction;
begin
  inherited;

  FreeAndNil( Reinf );
  FreeAndNil( FConfig );
  FreeAndNil( FRetorno );
  FreeAndNil( FSoftHouse );
  FreeAndNil( FListaReinf );
end;

procedure TReinf.Incluir();
begin
  FListaReinf.Add(FInfo);
end;

procedure TReinf.LoadConfig();
begin
  Reinf.CpfCnpjEmpregador:= Config.CpfCnpjEmpregador;
//  Reinf.VersaoManual:= vm13;
  Reinf.DiretorioTemplates:= Config.DiretorioTemplates;
  Reinf.DiretorioEsquemas:= Config.DiretorioEsquemas;
  Reinf.Ambiente:= akPreProducaoReais;
  Reinf.ConfigurarSoftwareHouse(SoftHouse.Cnpj, SoftHouse.Token);
  //Reinf.NomeCertificado := cbbCertificados.Text;
end;

procedure TReinf.Processar();
//var
//  i: Integer;
//  lFileName: string;
//  ArquivoTx2: TStringList;
//  ArquivoXML: TStringList;
//  _Retorno: IspdRetEnviarLoteEventos;
begin
//  LoadConfig();
//  try
//    ArquivoTx2:= TStringList.Create;
//    ArquivoXML:= TStringList.Create;
//    for i := 0 to FListaReinf.Count - 1 do
//    begin
//      case Tipo of
//        tpIncluir: ArquivoTx2.Add('INCLUIRR1000');
//        tpExcluir: ArquivoTx2.Add('EXCLUIRR1000');
//      end;
//      ArquivoTx2.Add(Format('tpAmb_4=%d', [ TInfo(FListaReinf.Items[i]).TipoAmbiente]));
//      ArquivoTx2.Add(Format('procEmi_5=%d', [ TInfo(FListaReinf.Items[i]).ProcEmi]));
//      ArquivoTx2.Add(Format('verProc_6=%s', [ TInfo(FListaReinf.Items[i]).Versao]));
//      ArquivoTx2.Add(Format('tpInsc_8=%d', [ TInfo(FListaReinf.Items[i]).TipoInscricao]));
//      ArquivoTx2.Add(Format('nrInsc_9=%s', [ TInfo(FListaReinf.Items[i]).NumeroInscricao]));
//      ArquivoTx2.Add(Format('iniValid_13=%s', [ TInfo(FListaReinf.Items[i]).ValidadeInicial]));
//      ArquivoTx2.Add(Format('fimValid_14=%s', [ TInfo(FListaReinf.Items[i]).ValidadeFinal]));
//
//      if Tipo = tpIncluir then
//      begin
//        ArquivoTx2.Add(Format('classTrib_16=%s', [ TInfo(FListaReinf.Items[i]).ClassificacaoTributaria]));
//        ArquivoTx2.Add(Format('indEscrituracao_17=%d', [ TInfo(FListaReinf.Items[i]).Escrituracao]));
//        ArquivoTx2.Add(Format('indDesoneracao_18=%d', [ TInfo(FListaReinf.Items[i]).Desoneracao]));
//        ArquivoTx2.Add(Format('indAcordoIsenMulta_19=%d', [ TInfo(FListaReinf.Items[i]).AcordoIsentoMulta]));
//        ArquivoTx2.Add(Format('indSitPJ_20=%d', [ TInfo(FListaReinf.Items[i]).SituacaoPJ]));
//        ArquivoTx2.Add(Format('nmCtt_22=%s', [ TInfo(FListaReinf.Items[i]).NomeContato]));
//        ArquivoTx2.Add(Format('cpfCtt_23=%s', [ TInfo(FListaReinf.Items[i]).CPFContato]));
//        ArquivoTx2.Add(Format('foneFixo_24=%s', [ TInfo(FListaReinf.Items[i]).TelefoneFixo]));
//        ArquivoTx2.Add(Format('foneCel_25=%s', [ TInfo(FListaReinf.Items[i]).Celular]));
//        ArquivoTx2.Add(Format('email_26=%s', [ TInfo(FListaReinf.Items[i]).Email]));
//        ArquivoTx2.Add(Format('ideEFR_34=%s', [ TInfo(FListaReinf.Items[i]).ideEFR]));
//        ArquivoTx2.Add(Format('cnpjEFR_35=%s', [ TInfo(FListaReinf.Items[i]).CNPJ_EFR]));
//        ArquivoTx2.Add('INCLUIRSOFTHOUSE_27');
//        ArquivoTx2.Add(Format('cnpjSoftHouse_28=%s', [ Self.SoftHouse.Cnpj ]));
//        ArquivoTx2.Add(Format('nmRazao_29=%s', [ Self.SoftHouse.RazaoSocial ]));
//        ArquivoTx2.Add(Format('nmCont_30=%s', [ Self.SoftHouse.Contato ]));
//        ArquivoTx2.Add(Format('telefone_31=%s', [ Self.SoftHouse.Telefone ]));
//        ArquivoTx2.Add(Format('email_32=%s', [ Self.SoftHouse.Email ]));
//        ArquivoTx2.Add('SALVARSOFTHOUSE_27');
//      end;
//      ArquivoTx2.Add('SALVARR1000');
//    end;
//
//    if OpcaoDesenvolvedor() then
//    begin
//      lFileName:= Config.DiretorioImpressao + '\TX2';
//      if not DirectoryExists(lFileName) then
//        ForceDirectories(lFileName);
//
//      lFileName:= lFileName + '\_ArquivoTX2'+ FormatDateTime('YYYYMMDDHHMMSSZZZ', Now) + '.Tx2';
//      ArquivoTx2.SaveToFile(lFileName);
//    end;
//
//    //Gerar Arquivo XML
//    ArquivoXML.Text := Reinf.GerarXMLporTx2(ArquivoTx2.Text);
//    //Assinar Arquivo XML
//    ArquivoXML.Text := Reinf.AssinarEvento(ArquivoXML.Text);
//    ArquivoXML.SaveToFile(Config.DiretorioImpressao + '/_ArquivoXML'+ FormatDateTime('YYYYMMDDHHMMSSZZZ', Now) + '.xml');
//
//    //Enviar Arquivo XML
//    _Retorno := Reinf.EnviarLoteEventos(ArquivoXML.Text);
//    Retorno.IdLote:= _Retorno.IdLote;
//    Retorno.Mensagem:= _Retorno.Mensagem;
//  finally
//    FreeAndNil( ArquivoTx2 );
//    FreeAndNil( ArquivoXML );
//  end;
end;

procedure TReinf.SetConfig(const Value: TConfiguracao);
begin
  FConfig := Value;
end;

procedure TReinf.SetInfo(const Value: TInfo);
begin
  FInfo := Value;
end;

procedure TReinf.SetRetorno(const Value: TRetorno);
begin
  FRetorno := Value;
end;

procedure TReinf.SetSoftHouse(const Value: TSoftHouse);
begin
  FSoftHouse := Value;
end;

procedure TReinf.SetTipo(const Value: TTipo);
begin
  FTipo := Value;
end;

{ TConfiguracao }

procedure TConfiguracao.SetCpfCnpjEmpregador(const Value: string);
begin
  FCpfCnpjEmpregador := Value;
end;

procedure TConfiguracao.SetDiretorioEsquemas(const Value: string);
begin
  FDiretorioEsquemas := Value;
end;

procedure TConfiguracao.SetDiretorioImpressao(const Value: string);
begin
  FDiretorioImpressao := Value;
end;

procedure TConfiguracao.SetDiretorioTemplates(const Value: string);
begin
  FDiretorioTemplates := Value;
end;
{ TRetorno }

procedure TRetorno.SetIdLote(const Value: WideString);
begin
  FIdLote := Value;
end;

procedure TRetorno.SetMensagem(const Value: WideString);
begin
  FMensagem := Value;
end;

end.
