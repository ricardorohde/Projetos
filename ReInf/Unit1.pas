unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, int_ReInf, Int_Nfse, BaseLibrary, DB, DBClient, StrUtils,
  spdNFSeConverterAdapter;

type
  TForm1 = class(TForm)
    btnIncluir: TButton;
    btnExcluir: TButton;
    btnNfse: TButton;
    GerarArquivo: TClientDataSet;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnNfseClick(Sender: TObject);
  private
    function IIf(Expressao, ParteTRUE, ParteFALSE: Variant): Variant;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnExcluirClick(Sender: TObject);
var
  Reinf: TReinf;
//  Reinf_Inclusao: TReinf_Inclusao;
  i: Integer;
begin
  Reinf:= TReinf.Create(Self);
  try
    Reinf.Tipo:= tpExcluir;
    Reinf.Config.CpfCnpjEmpregador:= '18582206000132';
    Reinf.Config.DiretorioTemplates:= 'C:\Program Files\TecnoSpeed\Reinf\Arquivos\Templates\';
    Reinf.Config.DiretorioEsquemas := 'C:\Program Files\TecnoSpeed\Reinf\Arquivos\Esquemas\';
    Reinf.Config.DiretorioImpressao:= ExtractFilePath(Application.ExeName) + 'DiretorioImpressao';
    for i := 1 to 10 do
    begin
      Reinf.Info:= Reinf.Info.Add;
      Reinf.Info.TipoAmbiente:= 2;
      Reinf.Info.ProcEmi:= 1;
      Reinf.Info.Versao:= '1.0';
      Reinf.Info.TipoInscricao:= 1;
      Reinf.Info.NumeroInscricao:= '18582206000132';
      Reinf.Info.ValidadeInicial:= '2018-03';
      Reinf.Info.ValidadeFinal:= '';
      Reinf.Incluir();
    end;

    Reinf.Processar();
  finally
    Reinf.Free;
  end;
end;

procedure TForm1.btnIncluirClick(Sender: TObject);
var
  Reinf: TReinf;
  i: Integer;
begin
  Reinf:= TReinf.Create(Self);
  try
    Reinf.Tipo:= tpIncluir;
    Reinf.SoftHouse.Cnpj:= '26764821000198';
    Reinf.SoftHouse.RazaoSocial:= 'Nome Razao Teste';
    Reinf.SoftHouse.Contato:= 'Nome Teste';
    Reinf.SoftHouse.Telefone:= '1234567897';
    Reinf.SoftHouse.Email:= 'eamil.teste@gmail.com';
    Reinf.SoftHouse.Token:= 'GRk7PBfmzx5QaeJFHpMUI3GlyFaZIGDUQAkezoPb';

    Reinf.Config.CpfCnpjEmpregador:= '18582206000132';
    Reinf.Config.DiretorioTemplates:= 'C:\Program Files\TecnoSpeed\Reinf\Arquivos\Templates\';
    Reinf.Config.DiretorioEsquemas := 'C:\Program Files\TecnoSpeed\Reinf\Arquivos\Esquemas\';
    Reinf.Config.DiretorioImpressao:= ExtractFilePath(Application.ExeName) + 'DiretorioImpressao';

    for i := 1 to 10 do
    begin
      Reinf.Info:= Reinf.Info.Add;
      Reinf.Info.ClassificacaoTributaria:= 'teste_' + IntToStr(i);
      Reinf.Info.TipoAmbiente:= 2;
      Reinf.Info.ProcEmi:= 1;
      Reinf.Info.Versao:= '1.0';
      Reinf.Info.TipoInscricao:= 1;
      Reinf.Info.NumeroInscricao:= '18582206000132';
      Reinf.Info.ValidadeInicial:= '2018-03';
      Reinf.Info.ValidadeFinal:= '';
      Reinf.Info.ClassificacaoTributaria:= '01';
      Reinf.Info.Escrituracao:= 0;
      Reinf.Info.Desoneracao:= 1;
      Reinf.Info.AcordoIsentoMulta:= 0;
      Reinf.Info.SituacaoPJ:= 0;
      Reinf.Info.NomeContato:= 'Nome do Contato Teste' + IntToStr(i);
      Reinf.Info.CPFContato:= '12345678909';
      Reinf.Info.TelefoneFixo:= '1123452345';
      Reinf.Info.Celular:= '';
      Reinf.Info.Email:= '';
      Reinf.Info.ideEFR:= '';
      Reinf.Info.CNPJ_EFR:= '';
      Reinf.Incluir();
    end;

    Reinf.Processar();
  finally
    Reinf.Free;
  end;
end;

function TForm1.IIf(Expressao: Variant; ParteTRUE, ParteFALSE: Variant): Variant;
 begin
   if Expressao then
      Result := ParteTRUE
   else
      Result := ParteFALSE;
 end;

procedure TForm1.btnNfseClick(Sender: TObject);
var
  Nfse: TNfse;
  i: Integer;
begin
  try
    Nfse:= TNfse.Create(self);
    Nfse.Config.CNPJSoftwareHouse:= '09186683000198';
    Nfse.Config.TokenSoftHouse:= '0000000000000000';
    Nfse.Config.GerarSomenteXML:= True;
    Nfse.Config.DiretorioNfse:= ExtractFilePath(Application.ExeName) + 'Nfse\';
    Nfse.Config.DiretorioImpressao:= Nfse.Config.DiretorioNfse + 'XmlImpressao\';
    Nfse.Config.DiretorioEsquemas:= Nfse.Config.DiretorioNfse + 'Esquemas\';
    Nfse.Config.DiretorioScripts:= Nfse.Config.DiretorioNfse + 'Scripts\';
    Nfse.Config.DiretorioTemplates:= Nfse.Config.DiretorioNfse + 'Templates\';
    Nfse.Config.CertificadoDigital:= '00 E6 DB E0 66 C1 13 38 80';
    Nfse.Config.Cnpj:= '12365478940454';
    Nfse.Config.Cidade:= 'Niteroi';
    Nfse.Config.InscricaoMunicipal:= '0042382';
    Nfse.Config.CodigoMunicipio:= '3303302';
    Nfse.Config.QuantidadeRps:= 10;
    Nfse.Config.Transacao:= False;
    Nfse.Config.DataInicio:= StrToDate('01/06/2018');
    Nfse.Config.DataFim:= StrToDate('30/06/2018');
    Nfse.Config.Versao:= '2.02';
    Nfse.Config.MetodoEnvio:= 'WS';
    Nfse.ValorTotalServicos:= 10000;
    Nfse.ValorTotalDeducoes:= 0;
    Nfse.ValorTotalBaseCalculo:= 10000;

    Nfse.IdLote:= 74;
    Nfse.NumeroLote:= 74;
    Nfse.Remetente.CpfCnpj:= '12365478940454';
    Nfse.Remetente.InscricaoMunicipal:= '51';
    Nfse.Remetente.RazaoSocial:= 'Sua Administradora';
    Nfse.Remetente.CodigoCidade:= '0042382';

    for I := 1 to 10 do
    begin
      Nfse.Nfse:= Nfse.Nfse.Add;
      Nfse.Nfse.InformacoesRPS.IdRps:= 1;
      Nfse.Nfse.InformacoesRPS.NumeroRps:= IntToStr(i);
      //Nfse.Nfse.InformacoesRPS.SerieRps:= GerarArquivo.FieldBName('SERIE_RPS').AsString;
      Nfse.Nfse.InformacoesRPS.SerieRps:= '1';
      Nfse.Nfse.InformacoesRPS.TipoRps:= '1';
      Nfse.Nfse.InformacoesRPS.DataEmissao:= StrToDate('01/06/2018');
      Nfse.Nfse.InformacoesRPS.OptanteSimplesNacional:= 1;
      Nfse.Nfse.InformacoesRPS.IncentivadorCultural:= 1;
      Nfse.Nfse.InformacoesRPS.SituacaoNota:= 1;
      Nfse.Nfse.InformacoesRPS.TipoTributacao:= 1;
      Nfse.Nfse.InformacoesRPS.NaturezaTributacao:= 0;
      Nfse.Nfse.InformacoesRPS.RegimeEspecialTributacao:= 0;
      Nfse.Nfse.InformacoesRPS.NumeroRpsSubstituido:= '';
      Nfse.Nfse.InformacoesRPS.SerieRpsSubstituido:= '';
      Nfse.Nfse.InformacoesRPS.TipoRpsSubstituido:= '';
      Nfse.Nfse.Servico.ValorServicos:= 1000;
      Nfse.Nfse.Servico.ValorDeducoes:= 0;
      Nfse.Nfse.Imposto.ValorPis:= 0;
      Nfse.Nfse.Imposto.ValorCofins:= 0;
      Nfse.Nfse.Imposto.ValorInss:= 0;
      Nfse.Nfse.Imposto.ValorIr:= 0;
      Nfse.Nfse.Imposto.ValorCsll:= 0;
      Nfse.Nfse.Imposto.IssRetido:= 2;
      Nfse.Nfse.Imposto.ValorIss:= 50;
      Nfse.Nfse.Imposto.ValorIssRetido:= 0.00;
      Nfse.Nfse.Imposto.BaseCalculo:= 1000;
      Nfse.Nfse.Imposto.ValorLiquidoNfse:= 1000;
      Nfse.Nfse.Imposto.DescontoIncondicionado:= 0;
      Nfse.Nfse.Imposto.DescontoCondicionado:= 0;
      Nfse.Nfse.Imposto.AliquotaISS:= 5;
      Nfse.Nfse.Imposto.AliquotaPIS:= 0;
      Nfse.Nfse.Imposto.AliquotaCOFINS:= 0;
      Nfse.Nfse.Imposto.AliquotaINSS:= 0.00;
      Nfse.Nfse.Imposto.AliquotaIR:= 0;
      Nfse.Nfse.Imposto.AliquotaCSLL:= 0;
      //Nfse.Nfse.Servico.CodigoItemListaServico:= GerarArquivo.FieldByName('SERV_PRESTADO_PROPRIO_MUNICIPIO').AsString;
      Nfse.Nfse.Servico.CodigoItemListaServico:= '1710';
      Nfse.Nfse.Servico.CodigoCnae:= '1717';
      Nfse.Nfse.Servico.CodigoTributacaoMunicipio:= '1710';

      Nfse.Nfse.Servico.DiscriminacaoServico:= '';
      Nfse.Nfse.Servico.DiscriminacaoServico:= StringReplace(Nfse.Nfse.Servico.DiscriminacaoServico, CRLF, ' ', [rfReplaceAll]);
      Nfse.Nfse.Servico.DiscriminacaoServico:= StringReplace(Nfse.Nfse.Servico.DiscriminacaoServico, CR, ' ', [rfReplaceAll]);
      Nfse.Nfse.Servico.DiscriminacaoServico:= StringReplace(Nfse.Nfse.Servico.DiscriminacaoServico, LF, ' ', [rfReplaceAll]);

      Nfse.Nfse.Servico.CodigoCidadePrestacao:= '3303302';
      Nfse.Nfse.Servico.DescricaoCidadePrestacao:= RetirarAcento('Niterói');

      Nfse.Nfse.Prestador.CpfCnpjPrestador:= '12365478940454';
      Nfse.Nfse.Prestador.InscricaoMunicipalPrestador:= '51';
      Nfse.Nfse.Prestador.RazaoSocialPrestador:= 'Sua Administradora';
      Nfse.Nfse.Prestador.DDDPrestador:= '';
      Nfse.Nfse.Prestador.TelefonePrestador:= '';

      Nfse.Nfse.Tomador.CpfCnpjTomador:= '60127871000100';
      Nfse.Nfse.Tomador.RazaoSocialTomador:= 'Condominio Teste GPS';
      Nfse.Nfse.Tomador.InscricaoMunicipalTomador:= '';
      //Nfse.Nfse.Tomador.InscricaoEstadualTomador:= GerarArquivo.FieldByName('INSCRICAO_ESTADUAL_TOMADOR').AsString;
      Nfse.Nfse.Tomador.InscricaoEstadualTomador:= '';
      Nfse.Nfse.Tomador.TipoLogradouroTomador:= '';
      Nfse.Nfse.Tomador.EnderecoTomador:= RetirarAcento('Uruguaiana 94');
      Nfse.Nfse.Tomador.NumeroTomador:= RetirarAcento('123');
      Nfse.Nfse.Tomador.ComplementoTomador:= RetirarAcento('complemento Teste');
      Nfse.Nfse.Tomador.TipoBairroTomador:= '';
      Nfse.Nfse.Tomador.BairroTomador:= RetirarAcento('Centro');
      Nfse.Nfse.Tomador.CodigoCidadeTomador:= '3303302';
      Nfse.Nfse.Tomador.DescricaoCidadeTomador:= RetirarAcento('Rio de Janeiro');
      Nfse.Nfse.Tomador.UfTomador:= 'RJ';
      Nfse.Nfse.Tomador.CepTomador:= '20050091';

      if Assigned(GerarArquivo.FindField('RESIDE_NO_EXTERIOR')) and (GerarArquivo.FieldByName('RESIDE_NO_EXTERIOR').AsInteger = 1) and
        (GerarArquivo.FieldByName('CODIGOMUNICIPIO_PRESTADOR').AsString = '3303302') then
      begin
        Nfse.Nfse.Tomador.CepTomador:= '';
        Nfse.Nfse.Tomador.CodigoCidadeTomador:= '9999999';
      end;
      //Nfse.Nfse.Tomador.DDDTomador:= '44';
      Nfse.Nfse.Tomador.DDDTomador:= '';
      Nfse.Nfse.Tomador.TelefoneTomador:= '';
      Nfse.Nfse.Tomador.EmailTomador:= '';

      Nfse.Nfse.Intermediario.RazaoSocialIntermediario:= '';
      Nfse.Nfse.Intermediario.CpfCnpjIntermediario:= '';
      Nfse.Nfse.Intermediario.InscricaoMunicipalIntermediario:= '';

      Nfse.Nfse.OutrasInformacoes.NumeroNfseSubstituida:= '';
//      if GerarArquivo.FieldByName('NUMERO_RPS_SUBSTITUIDO').AsString <> EmptyStr then
//        Nfse.Nfse.OutrasInformacoes.DataEmissaoNfseSubstituida:= GerarArquivo.FieldByName('DATA_DA_EMISSAO').AsDateTime
//      else
        Nfse.Nfse.OutrasInformacoes.DataEmissaoNfseSubstituida:= 0;

      Nfse.Nfse.OutrasInformacoes.SeriePrestacao:= '';
      Nfse.Nfse.OutrasInformacoes.MotCancelamento:= '';
      Nfse.Nfse.OutrasInformacoes.Operacao:= 'A';
      //Nfse.Nfse.OutrasInformacoes.CodigoObra:= GerarArquivo.FieldByName('CODIGO_OBRA').AsString;
      Nfse.Nfse.OutrasInformacoes.CodigoObra:= '';
      Nfse.Nfse.OutrasInformacoes.Art:= '';
      Nfse.Nfse.OutrasInformacoes.DeducaoPor:= '';
      Nfse.Nfse.OutrasInformacoes.TipoDeducao:= '';
      Nfse.Nfse.OutrasInformacoes.CPFCNPJReferencia:= '';
      Nfse.Nfse.OutrasInformacoes.NumeroNfReferencia:= '';
      Nfse.Nfse.OutrasInformacoes.ValorTotalReferencia:= 0;
      Nfse.Nfse.OutrasInformacoes.PercentualDeduzir:= 0;
      Nfse.Nfse.OutrasInformacoes.QuantidadeServicos:= 0;
      Nfse.Nfse.OutrasInformacoes.ValorUnitarioServico:= 0;
      Nfse.Nfse.OutrasInformacoes.Tributavel:= 0;
      Nfse.Nfse.OutrasInformacoes.IdentificadorSistemaLegado:= 0;
      Nfse.Nfse.OutrasInformacoes.TipoCodificacao:= '';
      Nfse.Nfse.OutrasInformacoes.Assinatura:= '';
      Nfse.Nfse.OutrasInformacoes.NumEmissorRps:= '';
      Nfse.Nfse.OutrasInformacoes.TipoDocumentoTomador:= '';
      Nfse.Nfse.OutrasInformacoes.DescricaoDocumentoTomador:= '';
      Nfse.Nfse.OutrasInformacoes.CidadeEstrangeiraTomador:= '';
      Nfse.Nfse.OutrasInformacoes.PaisTomador:= 1058;
      Nfse.Nfse.OutrasInformacoes.CodigoSubItemListaServico:= '';
      Nfse.Nfse.OutrasInformacoes.JustificativaDeducao:= '';
      Nfse.Nfse.OutrasInformacoes.ValorIssServico:= 0;
      Nfse.Nfse.OutrasInformacoes.ExigibilidadeISS:= 1;
      Nfse.Nfse.OutrasInformacoes.MunicipioIncidencia:= '3303302';
      Nfse.Nfse.OutrasInformacoes.IncentivoFiscal:= 2;
      Nfse.Nfse.OutrasInformacoes.Competencia:= StrToDate('01/06/2018');
      Nfse.Nfse.OutrasInformacoes.CodigoPais:= 1058;
      Nfse.Nfse.OutrasInformacoes.ResponsavelRetencao:= '';
      Nfse.Incluir();
    end;

    Nfse.Nome_Arquivo:= Nfse.Config.DiretorioImpressao + '\NF_ELETRONICA_'+FormatDateTime('MM_YYYY', Nfse.Config.DataFim)+ Nfse.Config.Cnpj +'_74_C.xml';
    Nfse.Processar();
  finally
    FreeAndNil( Nfse );
  end;
end;

end.
