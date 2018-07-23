{ ********************************************************************* }
{ }
{ TRS Sistemas - Runtime Library Functions }
{ }
{ Copyright(c) 2006-2012 TRS Sistemas e Soluções em Informática Ltda. }
{ }
{ Author: Thiago Rodrigo da Silva }
{ ********************************************************************* }
{ Seleciona Títulos da Remessa }
{ }
{ ********************************************************************* }
{ Data última alteração: }
{ Últimas alterações: }
{ }
{ ********************************************************************* }

unit uSeleciona_Titulos_Remessa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ImgList, DB, DBClient, ComObj,
  Menus, SHFolder, uTypes, uFBase, uRecError, uProgressMsg, StrUtils, System.Character;

type
  TfrmSeleciona_Titulos_Remessa = class(TfrmFBase)
    pnlPrincipal: TPanel;
    pnlBottom: TPanel;
    btnAplicar: TButton;
    btnCancelar: TButton;
    imgLegendas: TImageList;
    lblValor_Total: TLabel;
    lblTotal_Titulos: TLabel;
    lblValor_Selecionado: TLabel;
    lblTitulos_Selecionado: TLabel;
    imgPrincipal: TImageList;
    dbgrid: TDBGrid;
    appSaveDialog: TSaveDialog;
    AppPopupMenu: TPopupMenu;
    popVisualizar_Titulos: TMenuItem;
    mnuSeparador3: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbgridDblClick(Sender: TObject);
    procedure dbgridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure popVisualizar_TitulosClick(Sender: TObject);
  private
    TiposTitulos: TStringList;

    ArquivoRemessa: string;

{$REGION 'CLIENTS TEMPORARIOS'}
    // TABELAS UTILIZADAS NA PESQUISA DOS TITULOS DA REMESSA
    cdsTabelaParam: TClientDataSet;
    dsTabelaParam: TDataSource;
{$ENDREGION}
{$REGION 'EVENTOS DOS CLIENTS TEMPORARIOS'}
    // RESPONSÁVEL POR CRIAR AS TABELAS TEMPORÁRIAS
    procedure criaCDS(CdsdoDM: TClientDataSet; var CdsaCriar: TClientDataSet);
    // RESPONSÁVEL POR CRIAR OS DATASOURCES TEMPORÁRIOS
    procedure criaDS(var DsaCriar: TDataSource; CdsCriado: TClientDataSet);
    // RESPONSÁVEL POR FINALIZAR AS TABELAS ATIVAS
    procedure finalizaCDS;
    // RESPONSÁVEL POR PESQUISAS OS ITENS DO BORDERO.
    procedure pesquisaBorderosItens;
{$ENDREGION}
    procedure CalculaTotal;
    procedure CalculaSelecao(var Total: Double; var Itens: Integer);
    procedure PassaDadosContaCorrenteParaCobreBemX;
    procedure PassaDadosBoletosParaCobreBemX;
    function sysObtemArquivoRemessa: string;
    function sysObtemNomeArquivo(NomeArquivo: String): String;
  public
    cdsBorderos: TClientDataSet;
    dtsBorderos: TDataSource;
    Proprietario: Integer;
    Banco: String;
    Agencia: String;
    Conta: String;
    Carteira: String;
    ArquivoLicencaCobreBemX: string;
    SituacaoCobranca: string;
    Selecionado: Boolean;
  end;

var
  frmSeleciona_Titulos_Remessa: TfrmSeleciona_Titulos_Remessa;

implementation

uses uDMMain, uVisualiza_Titulos_Remessa;

{$R *.dfm}

var
  CobreBemX: Variant;
  intNroArquivoSequencia: Integer;

const
  strPasta_Envio: String = '\Remessa\Envio\';
  feeSMTPBoletoHTML = $00000000;
  feeSMTPMensagemBoletoHTMLAnexo = $00000001;
  feeSMTPMensagemBoletoPDFAnexo = $00000002;
  feeSMTPMensagemLinhaDigitavelURLCobreBemECommerce = $00000003;
  feeSMTPMensagemURLCobreBemECommerce = $00000004;
  feeSMTPMensagemLinhaDigitavel = $00000005;
  feeOutlookBoletoHTML = $00000006;
  feeOutlookMensagemBoletoHTMLAnexo = $00000007;
  feeOutlookMensagemBoletoPDFAnexo = $00000008;
  feeOutlookMensagemLinhaDigitavelURLCobreBemECommerce = $00000009;
  feeOutlookMensagemURLCobreBemECommerce = $0000000A;
  feeOutlookMensagemLinhaDigitavel = $0000000B;
  scpExecutar = $00000000;
  scpOK = $00000001;
  scpInvalido = $00000002;
  scpErro = $00000003;

procedure TfrmSeleciona_Titulos_Remessa.CalculaTotal;
var
  Total, Total_Selecionado: Double;
  Itens, Itens_Selecionado: Integer;
  Reg: TBookMark;
begin
  // Seta as variaveis para o valor default
  Total := 0;
  Itens := 0;
  Total_Selecionado := 0;
  Itens_Selecionado := 0;
  Reg := Nil;

{$REGION 'EFETUA O CALCULO DOS ITENS SELECIONADOS E DO TOTAL DE ITENS'}
  try
    // Recebe a posição do ponteiro do client para posterior atribuição.
    Reg := cdsBorderos.GetBookmark;
    // Region desabilita controles do grid
    cdsBorderos.DisableControls;
    // Move para o para o primeiro registro
    cdsBorderos.First;
    // Efetua um loop nos registros encontrados
    while not cdsBorderos.Eof do
    begin
      Total := Total + cdsBorderos.FieldByName('VALORTOTAL').AsCurrency;
      Inc(Itens);
      if (cdsBorderos.FieldByName('SELECIONADO').AsString = VB_SIM) then
      begin
        Total_Selecionado := Total_Selecionado + cdsBorderos.FieldByName('VALORTOTAL').AsCurrency;
        Inc(Itens_Selecionado);
      end;
      cdsBorderos.Next;
    end;
  finally
    cdsBorderos.GotoBookMark(Reg);
    cdsBorderos.FreeBookMark(Reg);
    cdsBorderos.EnableControls;
  end;
{$ENDREGION}
  // Atribui os valores as labels de apresentação.
  lblValor_Total.Caption := Format('Valor Total: %s', [FormatFloat('R$ #,###,###,##0.00', Total)]);
  lblTotal_Titulos.Caption := Format('Título(s): %s', [IntToStr(Itens)]);

  lblValor_Selecionado.Caption := Format('Valor Total Selecionado: %s', [FormatFloat('R$ #,###,###,##0.00', Total_Selecionado)]);
  lblTitulos_Selecionado.Caption := Format('Títulos Selecionados: %s', [IntToStr(Itens_Selecionado)]);

end;

procedure TfrmSeleciona_Titulos_Remessa.criaCDS(CdsdoDM: TClientDataSet; var CdsaCriar: TClientDataSet);
begin
{$REGION 'INICIALIZA AS TABELAS TEMPORÁRIAS'}
  with CdsaCriar do
  begin
    CdsaCriar := TClientDataSet.Create(Nil);
    Close;
    RemoteServer := CdsdoDM.RemoteServer;
    ProviderName := CdsdoDM.ProviderName;
  end;
{$ENDREGION}
end;

procedure TfrmSeleciona_Titulos_Remessa.criaDS(var DsaCriar: TDataSource; CdsCriado: TClientDataSet);
begin
{$REGION 'INICIALIZA OS DATASOURCE'}
  with DsaCriar do
  begin
    DsaCriar := TDataSource.Create(Nil);
    DataSet := CdsCriado;
  end;
{$ENDREGION}
end;

procedure TfrmSeleciona_Titulos_Remessa.dbgridDblClick(Sender: TObject);
begin
  inherited;
{$REGION 'REALIZA A SELEÇÃO DO TITULO'}
  with cdsBorderos do
  begin
    Edit;
    if (FieldByName('SELECIONADO').AsString = VB_SIM) then
      FieldByName('SELECIONADO').AsString := VB_NAO
    else
      FieldByName('SELECIONADO').AsString := VB_SIM;
    Post;
  end;
  // Efetua o calculo dos titulos selecionados
  CalculaTotal;
{$ENDREGION}
end;

procedure TfrmSeleciona_Titulos_Remessa.dbgridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  inherited;
{$REGION 'PINTA O CHECKED NA LINHA DO GRID'}
  if (Column.FieldName = 'SELECIONADO') then
  begin
    dbgrid.Canvas.FillRect(Rect);
    imgPrincipal.Draw(dbgrid.Canvas, Rect.Left + 5, Rect.Top + 1, 0);
    if (Column.Field.Value = VB_SIM) then
      imgPrincipal.Draw(dbgrid.Canvas, Rect.Left + 5, Rect.Top + 1, 2)
    else
      imgPrincipal.Draw(dbgrid.Canvas, Rect.Left + 5, Rect.Top + 1, 1);
  end;
{$ENDREGION}
end;

procedure TfrmSeleciona_Titulos_Remessa.finalizaCDS;
begin
{$REGION 'FINALIZA AS TABELAS ATIVAS'}
  cdsTabelaParam.Close;
  FreeAndNil(cdsTabelaParam);
{$ENDREGION}
end;

procedure TfrmSeleciona_Titulos_Remessa.CalculaSelecao(var Total: Double; var Itens: Integer);
begin
end;

procedure TfrmSeleciona_Titulos_Remessa.FormCreate(Sender: TObject);
var
  StreamLicenca: TMemoryStream;
begin
  inherited;
  frmSeleciona_Titulos_Remessa := Self;

  TiposTitulos := TStringList.Create;
  __SuperClass.DBFunctions.GetListItems(TL_RELACIONAMENTO_TIPOS_TITULOS, TiposTitulos);

  CobreBemX := CreateOleObject('CobreBemX.ContaCorrente');

end;

procedure TfrmSeleciona_Titulos_Remessa.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(TiposTitulos);
  finalizaCDS;
end;

procedure TfrmSeleciona_Titulos_Remessa.FormShow(Sender: TObject);
begin
  inherited;

  criaCDS(cdsBorderos, cdsTabelaParam);

  criaDS(dsTabelaParam, cdsTabelaParam);

  dbgrid.DataSource := dtsBorderos;

  CalculaTotal;
end;

procedure TfrmSeleciona_Titulos_Remessa.PassaDadosBoletosParaCobreBemX;
var
  MarcaPosicao: TBookMark;
  Boleto: Variant;
  EmailSacado: Variant;
  NumeroDocumento: string;
  Indice: Integer;
  TipoDocumento: ShortString;
  Demonstrativo: String;
  Instrucoes: String;
begin
  // Monta o Numero do Documento
  NumeroDocumento := EmptyStr;
  NumeroDocumento := NumeroDocumento + FormatFloat('00', cdsTabelaParam.FieldByName('EMPRESA').AsVariant);
  NumeroDocumento := NumeroDocumento + FormatFloat('00', cdsTabelaParam.FieldByName('FILIAL').AsVariant);
  NumeroDocumento := NumeroDocumento + FormatFloat('000000', cdsTabelaParam.FieldByName('IDCNAB').AsInteger);

  // Inicializa o CobreBemX
  Boleto := CobreBemX.DocumentosCobranca.Add;
  Boleto.BancoEmiteBoleto := (cdsBorderos.FieldByName('EMITEBOLETO').AsString = VB_SIM);
  Boleto.BancoGeraNossoNumero := (cdsBorderos.FieldByName('GERANOSSONUMERO').AsString = VB_SIM);

  ShowMEssage(cdsBorderos.FieldByName('DIASPROTESTO').AsString);
  if ((cdsBorderos.FieldByName('DIASPROTESTO').AsString <> '')) then
  begin
    Boleto.DiasProtesto := (cdsBorderos.FieldByName('DIASPROTESTO').AsString);
  end;

  // Definir os tipos de documentos por lista
  Indice := TiposTitulos.IndexOfName(cdsTabelaParam.FieldByName('TIPO').AsString);
  if (Indice > -1) then
  begin
    TipoDocumento := TiposTitulos.Strings[Indice];
    TipoDocumento := Copy(TipoDocumento, Pos('=', TipoDocumento) + 1, Length(TipoDocumento));
    Boleto.TipoDocumentoCobranca := TipoDocumento;
  end else begin
    __SuperClass.GenericsF.DisplayMessage('Relacionamento dos tipos de titulos não definido.', '',
      'Verifique a lista com código 17.', 'Informação', MB_ICONINFORMATION);
    Boleto.TipoDocumentoCobranca := '';
  end;

  Boleto.NumeroDocumento := NumeroDocumento;
  Boleto.NomeSacado := cdsTabelaParam.FieldByName('NOME').AsString;

  // Verifica se é CPF ou CNPJ
  if (cdsTabelaParam.FieldByName('PESSOA').AsString = '0') then // PESSOA (0= Fisica , 1 = Juridica)
    Boleto.CPFSacado := cdsTabelaParam.FieldByName('CPF').AsString
  else
    Boleto.CNPJSacado := cdsTabelaParam.FieldByName('CNPJ').AsString;

  // Verifica se é contas a pagar ou a receber
  if (cdsBorderos.FieldByName('CARTEIRA').AsString = MB_CONTAS_RECEBER) then
  begin
    // Verifica se o endereço de cobrança esta preenchido
    if cdsTabelaParam.FieldByName('CEPCOBRANCA').AsString <> '' then
    begin
      // Pega o endereço de cobrança.
      Boleto.EnderecoSacado := Format('%s, %s-%s', [cdsTabelaParam.FieldByName('ENDERECOCOBRANCA').AsString,
        cdsTabelaParam.FieldByName('NUMEROCOBRANCA').AsString, cdsTabelaParam.FieldByName('COMPLEMENTOCOBRANCA').AsString]);
      Boleto.BairroSacado := cdsTabelaParam.FieldByName('BAIRROCOBRANCA').AsString;
      Boleto.CidadeSacado := cdsTabelaParam.FieldByName('MUNICIPIOCOBRANCA').AsString;
      Boleto.EstadoSacado := cdsTabelaParam.FieldByName('UFCOBRANCA').AsString;
      Boleto.CepSacado := cdsTabelaParam.FieldByName('CEPCOBRANCA').AsString;
    end else begin
      // Pega o endereço normal.
      Boleto.EnderecoSacado := Format('%s, %s-%s', [cdsTabelaParam.FieldByName('ENDERECO').AsString,
        cdsTabelaParam.FieldByName('NUMERO').AsString, cdsTabelaParam.FieldByName('COMPLEMENTO').AsString]);
      Boleto.BairroSacado := cdsTabelaParam.FieldByName('BAIRRO').AsString;
      Boleto.CidadeSacado := cdsTabelaParam.FieldByName('MUNICIPIO').AsString;
      Boleto.EstadoSacado := cdsTabelaParam.FieldByName('UF').AsString;
      Boleto.CepSacado := cdsTabelaParam.FieldByName('CEP').AsString;
    end;
  end else begin
    // Pega o endereço do fornecedor.
    Boleto.EnderecoSacado := Format('%s, %s-%s', [cdsTabelaParam.FieldByName('ENDERECO').AsString,
      cdsTabelaParam.FieldByName('NUMERO').AsString, cdsTabelaParam.FieldByName('COMPLEMENTO').AsString]);
    Boleto.BairroSacado := cdsTabelaParam.FieldByName('BAIRRO').AsString;
    Boleto.CidadeSacado := cdsTabelaParam.FieldByName('MUNICIPIO').AsString;
    Boleto.EstadoSacado := cdsTabelaParam.FieldByName('UF').AsString;
    Boleto.CepSacado := cdsTabelaParam.FieldByName('CEP').AsString;
  end;

  // Emissão do contas a receber
  Boleto.DataDocumento := FormatDateTime('dd/mm/yyyy', cdsBorderos.FieldByName('EMISSAO').AsDateTime);

  // Buscar no contas a receber o vencimento
  Boleto.DataVencimento := FormatDateTime('dd/mm/yyyy', cdsTabelaParam.FieldByName('VENCIMENTO').AsDateTime);
  Boleto.DataProcessamento := FormatDateTime('dd/mm/yyyy', __SuperClass.User.DataBase);

  Boleto.PercentualJurosDiaAtraso := 0.30;
  Boleto.PercentualMultaAtraso := 2;
  // Boleto.PercentualDesconto       := 0;

  Demonstrativo := cdsBorderos.FieldByName('DEMONSTRATIVO').AsString;
  Demonstrativo := StringReplace(Demonstrativo, '%PREFIXO%', Format('[%s]', [cdsTabelaParam.FieldByName('PREFIXO').AsString]),
    [rfReplaceAll]);
  Demonstrativo := StringReplace(Demonstrativo, '%NOTA%', Format('[%s]', [cdsTabelaParam.FieldByName('TITULO').AsString]),
    [rfReplaceAll]);
  Boleto.PadroesBoleto.Demonstrativo := Demonstrativo;

  Instrucoes := cdsBorderos.FieldByName('INSTRUCAOBANCARIA').AsString;
  Instrucoes := StringReplace(Instrucoes, '%PREFIXO%', Format('[%s]', [cdsTabelaParam.FieldByName('PREFIXO').AsString]),
    [rfReplaceAll]);;
  Instrucoes := StringReplace(Instrucoes, '%NOTA%', Format('[%s]', [cdsTabelaParam.FieldByName('TITULO').AsString]),
    [rfReplaceAll]);;
  Boleto.PadroesBoleto.InstrucoesCaixa := Instrucoes;

  // Boleto.PadroesBoleto.Demonstrativo := cdsBorderos.FieldByName('DEMONSTRATIVO').AsString;
  // Boleto.PadroesBoleto.InstrucoesCaixa := cdsBorderos.FieldByName('INSTRUCAOBANCARIA').AsString;
  Boleto.ControleProcessamentoDocumento.GravaRemessa := scpExecutar;

  // Boleto.CalculaDacNossoNumero := False;

  if (cdsBorderos.FieldByName('JUNTAAGREGADOS').AsString = VB_SIM) then
  begin
    Boleto.ValorOutrosAcrescimos := cdsTabelaParam.FieldByName('ACRESCIMO').AsFloat;
    Boleto.ValorDesconto := cdsTabelaParam.FieldByName('DECRESCIMO').AsFloat;
    Boleto.ValorDocumento := cdsTabelaParam.FieldByName('SALDO').AsFloat;
    /// cdsTabelaParam.FieldByName('VALOR').AsFloat
  end else begin
    Boleto.ValorDocumento := cdsTabelaParam.FieldByName('SALDO').AsFloat // cdsTabelaParam.FieldByName('VALOR').AsFloat
      + cdsTabelaParam.FieldByName('ACRESCIMO').AsFloat - cdsTabelaParam.FieldByName('DECRESCIMO').AsFloat;
  end;
  Boleto.NossoNumero := cdsTabelaParam.FieldByName('NOSSONUMERO').AsString;
  Boleto.InstrucaoCobranca1 := cdsBorderos.FieldByName('INSTRUCAOCOBRANCA1').AsString;
  Boleto.InstrucaoCobranca2 := cdsBorderos.FieldByName('INSTRUCAOCOBRANCA2').AsString;
  Boleto.InstrucaoCobranca3 := cdsBorderos.FieldByName('INSTRUCAOCOBRANCA3').AsString;
end;

procedure TfrmSeleciona_Titulos_Remessa.PassaDadosContaCorrenteParaCobreBemX;
var
  StreamLicenca: TMemoryStream;
  I: Integer;
  CodigoAgenciaCustomizado: function(CodigoAgencia: String): String;
  NumeroContaCorrenteCustomizado: function(NumeroContaCorrente: String): String;
  CodigoCedenteCustomizado: function(CodigoCedente: String): String;
  NossoNumeroCustomizado: function(cdsBanco: TClientDataSet): String;
  lStrAux: string;
begin

  ArquivoLicencaCobreBemX := cdsBorderos.FieldByName('LICENCACOBREBEMX').AsString;

  if FileExists(Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA), ArquivoLicencaCobreBemX])) then
    CobreBemX.ArquivoLicenca := Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA),
      ArquivoLicencaCobreBemX])
  else
  begin
    try
      StreamLicenca := __SuperClass.GenericsF.LoadRemoteFile('System', ArquivoLicencaCobreBemX);
      StreamLicenca.SaveToFile(Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA),
        ArquivoLicencaCobreBemX]));

      CobreBemX.ArquivoLicenca := Format('%s\%s', [__SuperClass.GenericsF.GetSpecialFolderPath(CSIDL_LOCAL_APPDATA),
        ArquivoLicencaCobreBemX]);
    finally
      StreamLicenca.Free;
    end;
  end;

  CobreBemX.ArquivoRemessa.Diretorio := ExtractFilePath(ArquivoRemessa);
  CobreBemX.ArquivoRemessa.Arquivo := ExtractFileName(ArquivoRemessa);

  CobreBemX.OutroDadoConfiguracao1 := cdsBorderos.FieldByName('VARIACAOCARTEIRA').AsString;

  try
    intNroArquivoSequencia := cdsBorderos.FieldByName('DOCUMENTOINTERNO').AsInteger
  except
    intNroArquivoSequencia := 1;
  end;
  // Seta dados da conta corrente
  CobreBemX.ArquivoRemessa.Sequencia := intNroArquivoSequencia;
  I := 0;

  case cdsBorderos.FieldByName('BANCO').AsInteger of
    1:
      begin
        TryStrToInt(cdsBorderos.FieldByName('AGENCIA').AsString, I);
        CobreBemX.CodigoAgencia := Format('%s-%s', [FormatFloat('00000', I), Copy(cdsBorderos.FieldByName('AGENCIA').AsString,
          Length(cdsBorderos.FieldByName('AGENCIA').AsString), 1)]);

        TryStrToInt(cdsBorderos.FieldByName('CONTA').AsString, I);
        CobreBemX.NumeroContaCorrente :=
          Format('%s-%s', [FormatFloat('000000000', I), Copy(cdsBorderos.FieldByName('CONTA').AsString,
          Length(cdsBorderos.FieldByName('CONTA').AsString), 1)]);

        TryStrToInt(cdsBorderos.FieldByName('CODIGOCEDENTE').AsString, I);
        CobreBemX.CodigoCedente := Format('%s', [FormatFloat('000000', I)]);
      end;
    237:
      begin
        TryStrToInt(cdsBorderos.FieldByName('AGENCIA').AsString, I);
        CobreBemX.CodigoAgencia := Format('%s-%s', [FormatFloat('0000', I), cdsBorderos.FieldByName('DVAGENCIA').AsString]);

        TryStrToInt(cdsBorderos.FieldByName('CONTA').AsString, I);
        CobreBemX.NumeroContaCorrente :=
          Format('%s-%s', [FormatFloat('0000000', I), cdsBorderos.FieldByName('DVCONTA').AsString]);

            TryStrToInt(cdsBorderos.FieldByName('CODIGOCEDENTE').AsString, I);
        CobreBemX.CodigoCedente := Format('%s', [FormatFloat('000000000000000', I)]);
      end;
    341:
      begin
        TryStrToInt(cdsBorderos.FieldByName('AGENCIA').AsString, I);
        CobreBemX.CodigoAgencia := Format('%s', [FormatFloat('0000', I)]);

        TryStrToInt(cdsBorderos.FieldByName('CONTA').AsString, I);
        CobreBemX.NumeroContaCorrente := Format('%s-%s', [FormatFloat('00000', I), cdsBorderos.FieldByName('DVCONTA').AsString]);

        CobreBemX.ArquivoRemessa.NaoGerarRegistroDetalhe3 := false;
      end;
    33: //Santander
      begin
        TryStrToInt(cdsBorderos.FieldByName('AGENCIA').AsString, I);
        CobreBemX.CodigoAgencia := Format('%s-%s', [FormatFloat('0000', I), cdsBorderos.FieldByName('DVAGENCIA').AsString]);;
        TryStrToInt(cdsBorderos.FieldByName('CONTA').AsString, I);
        CobreBemX.NumeroContaCorrente := Format('%s-%s', [FormatFloat('000000000', I), cdsBorderos.FieldByName('DVCONTA').AsString]);

        TryStrToInt(cdsBorderos.FieldByName('CODIGOCEDENTE').AsString, I);
        lStrAux:= FormatFloat('0000000', I);
        CobreBemX.CodigoCedente := Format('%s-%s', [Copy(lStrAux, 1, 6), Copy(lStrAux, 7, 1)]);

        //Thiago disse que vai criar um campo para substituir o campo de observação
        TryStrToInt(cdsBorderos.FieldByName('OBSERVACAO').AsString, I);
        CobreBemX.OutroDadoConfiguracao1 := Format('%s', [FormatFloat('00000000000000000000', I)]);
      end;
    else
      begin
        TryStrToInt(cdsBorderos.FieldByName('AGENCIA').AsString, I);
        CobreBemX.CodigoAgencia := Format('%s%s', [FormatFloat('0000', I), cdsBorderos.FieldByName('DVAGENCIA').AsString]);

        TryStrToInt(cdsBorderos.FieldByName('CONTA').AsString, I);
        CobreBemX.NumeroContaCorrente := Format('%s%s', [FormatFloat('0000000', I), cdsBorderos.FieldByName('DVCONTA').AsString]);

        TryStrToInt(cdsBorderos.FieldByName('CODIGOCEDENTE').AsString, I);
        CobreBemX.CodigoCedente := Format('%s', [FormatFloat('000000000000000', I)]);
      end;
  end;
  // DF
  if (__SuperClass.GetPackage(BPL_ACCUSTOMS).Handle <> 0) then
  begin
    //
    @CodigoAgenciaCustomizado := GetProcAddress(__SuperClass.GetPackage(BPL_ACCUSTOMS).Handle, PChar('CodigoAgenciaCustomizado'));
    if Assigned(CodigoAgenciaCustomizado) then
      CobreBemX.CodigoAgencia := CodigoAgenciaCustomizado(CobreBemX.CodigoAgencia);
    //
    @NumeroContaCorrenteCustomizado := GetProcAddress(__SuperClass.GetPackage(BPL_ACCUSTOMS).Handle,
      PChar('NumeroContaCorrenteCustomizado'));
    if Assigned(NumeroContaCorrenteCustomizado) then
      CobreBemX.CodigoConta := NumeroContaCorrenteCustomizado(CobreBemX.NumeroContaCorrente);
    //
    @CodigoCedenteCustomizado := GetProcAddress(__SuperClass.GetPackage(BPL_ACCUSTOMS).Handle, PChar('CodigoCedenteCustomizado'));
    if Assigned(CodigoCedenteCustomizado) then
      CobreBemX.CodigoCedente := CodigoCedenteCustomizado(CobreBemX.CodigoCedente);
  end;

  // Seta o nosso número.
  CobreBemX.InicioNossoNumero := cdsBorderos.FieldByName('INICIONUMERO').AsString;
  CobreBemX.FimNossoNumero := cdsBorderos.FieldByName('FIMNUMERO').AsString;
  CobreBemX.ProximoNossoNumero := cdsBorderos.FieldByName('PROXIMONUMERO').AsString;
end;

procedure TfrmSeleciona_Titulos_Remessa.pesquisaBorderosItens;
var
  TOwner: TUEntityOwnerArray;
  strSQL: String;
begin
  if not cdsBorderos.IsEmpty then
  begin
    if Trim(cdsBorderos.FieldByName('Carteira').AsString) = MB_CONTAS_PAGAR then
    begin
      SetLength(TOwner, 3);
      TOwner[0].Name := 'Borderos_Itens';
      TOwner[1].Name := 'Contas_Pagar';
      TOwner[2].Name := 'Fornecedores';
      __SuperClass.DBFunctions.GetEntityOwner(TOwner);

      strSQL := EmptyStr;
      strSQL := strSQL + '  Select  ';
      strSQL := strSQL + '    Borderos_Itens.Item,';
      strSQL := strSQL + '    Borderos_Itens.Prefixo,';
      strSQL := strSQL + '    Borderos_Itens.Titulo,';
      strSQL := strSQL + '    Borderos_Itens.Parcela,';
      strSQL := strSQL + '    Borderos_Itens.Tipo,';
      strSQL := strSQL + '    Borderos_Itens.Valor,';
      strSQL := strSQL + '    Borderos_Itens.Saldo,';
      strSQL := strSQL + '    Borderos_Itens.Juros,';
      strSQL := strSQL + '    Borderos_Itens.TaxaPermanencia,';
      strSQL := strSQL + '    Borderos_Itens.Acrescimo,';
      strSQL := strSQL + '    Borderos_Itens.Decrescimo,';
      strSQL := strSQL + '    Borderos_Itens.Desconto,';
      strSQL := strSQL + '    Contas_Pagar.Empresa,';
      strSQL := strSQL + '    Contas_Pagar.Filial,';
      strSQL := strSQL + '    Contas_Pagar.Vencimento,';
      strSQL := strSQL + '    Contas_Pagar.VencimentoReal,';
      strSQL := strSQL + '    Contas_Pagar.Historico,';
      strSQL := strSQL + '    Contas_Pagar.IDCNAB,';
      strSQL := strSQL + '    Fornecedores.Codigo,';
      strSQL := strSQL + '    Fornecedores.Nome,';
      strSQL := strSQL + '    Fornecedores.Pessoa,';
      strSQL := strSQL + '    Fornecedores.Cpf,';
      strSQL := strSQL + '    Fornecedores.Cnpj,';
      strSQL := strSQL + '    Fornecedores.Endereco,';
      strSQL := strSQL + '    Fornecedores.Numero,';
      strSQL := strSQL + '    Fornecedores.Complemento,';
      strSQL := strSQL + '    Fornecedores.Bairro,';
      strSQL := strSQL + '    Fornecedores.Municipio,';
      strSQL := strSQL + '    Fornecedores.Uf,';
      strSQL := strSQL + '    Fornecedores.Cep';
      strSQL := strSQL + '  From Borderos_Itens';
      strSQL := strSQL + '  Inner Join Contas_Pagar on';
      strSQL := strSQL + '  (';
      strSQL := strSQL + '    Contas_Pagar.Empresa        = :Empresa_Pagar';
      strSQL := strSQL + '    And Contas_Pagar.Filial     = :Filial_Pagar';
      strSQL := strSQL + '    And Contas_Pagar.Prefixo    = Borderos_Itens.Prefixo';
      strSQL := strSQL + '    And Contas_Pagar.Numero     = Borderos_Itens.Titulo';
      strSQL := strSQL + '    And Contas_Pagar.Parcela    = Borderos_Itens.Parcela';
      strSQL := strSQL + '    And Contas_Pagar.Tipo       = Borderos_Itens.Tipo';
      strSQL := strSQL + '    And Contas_Pagar.Fornecedor = Borderos_Itens.Proprietario';
      strSQL := strSQL + '  )';
      strSQL := strSQL + '  Inner Join Fornecedores on';
      strSQL := strSQL + '  (';
      strSQL := strSQL + '    Fornecedores.Empresa    = :Empresa_Fornecedores';
      strSQL := strSQL + '    And Fornecedores.Filial = :Filial_Fornecedores';
      strSQL := strSQL + '    And Fornecedores.Codigo = Borderos_Itens.Proprietario';
      strSQL := strSQL + '  )';
      strSQL := strSQL + '  Where Borderos_Itens.Empresa  = :Empresa_Itens';
      strSQL := strSQL + '  And Borderos_Itens.Filial     = :Filial_Itens';
      strSQL := strSQL + '  And Borderos_Itens.Numero     = :Bordero_Numero';

      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      with cdsTabelaParam do
      begin
        Close;
        CommandText := EmptyStr;
        CommandText := strSQL;

        with Params do
        begin
          with ParamByName('Empresa_Itens') do
          begin
            ParamType := ptInput;
            DataType := ftString;
            Value := TOwner[0].Company;
          end;
          with ParamByName('Filial_Itens') do
          begin
            ParamType := ptInput;
            DataType := ftString;
            Value := TOwner[0].Branch;
          end;
          with ParamByName('Empresa_Pagar') do
          begin
            ParamType := ptInput;
            DataType := ftString;
            Value := TOwner[1].Company;
          end;
          with ParamByName('Filial_Pagar') do
          begin
            ParamType := ptInput;
            DataType := ftString;
            Value := TOwner[1].Branch;
          end;
          with ParamByName('Empresa_Fornecedores') do
          begin
            ParamType := ptInput;
            DataType := ftString;
            Value := TOwner[2].Company;
          end;
          with ParamByName('Filial_Fornecedores') do
          begin
            ParamType := ptInput;
            DataType := ftString;
            Value := TOwner[2].Branch;
          end;
          with ParamByName('Bordero_Numero') do
          begin
            ParamType := ptInput;
            DataType := ftInteger;
            Value := cdsBorderos.FieldByName('Numero').AsInteger;
          end;
        end;

        Open;
      end;

      Screen.Cursor := crArrow;
      Application.ProcessMessages;
    end else begin
      SetLength(TOwner, 3);
      TOwner[0].Name := 'Borderos_Itens';
      TOwner[1].Name := 'Contas_Receber';
      TOwner[2].Name := 'Clientes';
      __SuperClass.DBFunctions.GetEntityOwner(TOwner);

      strSQL := EmptyStr;
      strSQL := strSQL + '  Select  ';
      strSQL := strSQL + '    Borderos_Itens.Item,';
      strSQL := strSQL + '    Borderos_Itens.Prefixo,';
      strSQL := strSQL + '    Borderos_Itens.Titulo,';
      strSQL := strSQL + '    Borderos_Itens.Parcela,';
      strSQL := strSQL + '    Borderos_Itens.Tipo,';
      strSQL := strSQL + '    Borderos_Itens.Valor,';
      strSQL := strSQL + '    Borderos_Itens.Saldo,';
      strSQL := strSQL + '    Borderos_Itens.Juros,';
      strSQL := strSQL + '    Borderos_Itens.TaxaPermanencia,';
      strSQL := strSQL + '    Borderos_Itens.Acrescimo,';
      strSQL := strSQL + '    Borderos_Itens.Decrescimo,';
      strSQL := strSQL + '    Borderos_Itens.Desconto,';
      strSQL := strSQL + '    Contas_Receber.Empresa,';
      strSQL := strSQL + '    Contas_Receber.Filial,';
      strSQL := strSQL + '    Contas_Receber.Vencimento,';
      strSQL := strSQL + '    Contas_Receber.NossoNumero,';
      strSQL := strSQL + '    Contas_Receber.VencimentoReal,';
      strSQL := strSQL + '    Contas_Receber.Historico,';
      strSQL := strSQL + '    Contas_Receber.IDCNAB,';
      strSQL := strSQL + '    Clientes.Codigo,';
      strSQL := strSQL + '    Clientes.Nome,';
      strSQL := strSQL + '    Clientes.Pessoa,';
      strSQL := strSQL + '    Clientes.Cpf,';
      strSQL := strSQL + '    Clientes.Cnpj,';
      strSQL := strSQL + '    Clientes.CepCobranca,';
      strSQL := strSQL + '    Clientes.EnderecoCobranca,';
      strSQL := strSQL + '    Clientes.NumeroCobranca,';
      strSQL := strSQL + '    Clientes.ComplementoCobranca,';
      strSQL := strSQL + '    Clientes.BairroCobranca,';
      strSQL := strSQL + '    Clientes.MunicipioCobranca,';
      strSQL := strSQL + '    Clientes.UfCobranca,';
      strSQL := strSQL + '    Clientes.CepCobranca,';
      strSQL := strSQL + '    Clientes.Endereco,';
      strSQL := strSQL + '    Clientes.Numero,';
      strSQL := strSQL + '    Clientes.Complemento,';
      strSQL := strSQL + '    Clientes.Bairro,';
      strSQL := strSQL + '    Clientes.Municipio,';
      strSQL := strSQL + '    Clientes.Uf,';
      strSQL := strSQL + '    Clientes.Cep';
      strSQL := strSQL + '  From Borderos_Itens';
      strSQL := strSQL + '  Inner Join Contas_Receber on';
      strSQL := strSQL + '  (';
      strSQL := strSQL + '    Contas_Receber.Empresa        = :Empresa_Receber';
      strSQL := strSQL + '    And Contas_Receber.Filial     = :Filial_Receber';
      strSQL := strSQL + '    And Contas_Receber.Prefixo    = Borderos_Itens.Prefixo';
      strSQL := strSQL + '    And Contas_Receber.Numero     = Borderos_Itens.Titulo';
      strSQL := strSQL + '    And Contas_Receber.Parcela    = Borderos_Itens.Parcela';
      strSQL := strSQL + '    And Contas_Receber.Tipo       = Borderos_Itens.Tipo';
      strSQL := strSQL + '    And Contas_Receber.Cliente    = Borderos_Itens.Proprietario';
      strSQL := strSQL + '  )';
      strSQL := strSQL + '  Inner Join Clientes on';
      strSQL := strSQL + '  (';
      strSQL := strSQL + '    Clientes.Empresa     = :Empresa_Clientes';
      strSQL := strSQL + '    And Clientes.Filial  = :Filial_Clientes';
      strSQL := strSQL + '    And Clientes.Codigo  = Borderos_Itens.Proprietario';
      strSQL := strSQL + '  )';
      strSQL := strSQL + '  Where Borderos_Itens.Empresa  = :Empresa_Itens';
      strSQL := strSQL + '  And Borderos_Itens.Filial     = :Filial_Itens';
      strSQL := strSQL + '  And Borderos_Itens.Numero     = :Bordero_Numero';

      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      with cdsTabelaParam do
      begin
        Close;
        CommandText := EmptyStr;
        CommandText := strSQL;
        with Params do
        begin
          with ParamByName('Empresa_Itens') do
          begin
            ParamType := ptInput;
            DataType := ftString;
            Value := TOwner[0].Company;
          end;
          with ParamByName('Filial_Itens') do
          begin
            ParamType := ptInput;
            DataType := ftString;
            Value := TOwner[0].Branch;
          end;
          with ParamByName('Empresa_Receber') do
          begin
            ParamType := ptInput;
            DataType := ftString;
            Value := TOwner[1].Company;
          end;
          with ParamByName('Filial_Receber') do
          begin
            ParamType := ptInput;
            DataType := ftString;
            Value := TOwner[1].Branch;
          end;
          with ParamByName('Empresa_Clientes') do
          begin
            ParamType := ptInput;
            DataType := ftString;
            Value := TOwner[2].Company;
          end;
          with ParamByName('Filial_Clientes') do
          begin
            ParamType := ptInput;
            DataType := ftString;
            Value := TOwner[2].Branch;
          end;
          with ParamByName('Bordero_Numero') do
          begin
            ParamType := ptInput;
            DataType := ftInteger;
            Value := cdsBorderos.FieldByName('Numero').AsInteger;
          end;
        end;

        Open;
      end;

      Screen.Cursor := crArrow;
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfrmSeleciona_Titulos_Remessa.popVisualizar_TitulosClick(Sender: TObject);
begin
  inherited;
  pesquisaBorderosItens;
  if cdsTabelaParam.RecordCount > 0 then
  begin
    TNumericField(cdsTabelaParam.FieldByName('Item')).DisplayFormat := '000';
    TNumericField(cdsTabelaParam.FieldByName('NossoNumero')).DisplayFormat := '0000000000';
    TNumericField(cdsTabelaParam.FieldByName('Parcela')).DisplayFormat := '000';
    TNumericField(cdsTabelaParam.FieldByName('Valor')).DisplayFormat := '###,###,##0.00';
    TNumericField(cdsTabelaParam.FieldByName('Saldo')).DisplayFormat := '###,###,##0.00';
    TNumericField(cdsTabelaParam.FieldByName('Juros')).DisplayFormat := '###,###,##0.00';
    TNumericField(cdsTabelaParam.FieldByName('TaxaPermanencia')).DisplayFormat := '###,###,##0.00';
    TNumericField(cdsTabelaParam.FieldByName('Acrescimo')).DisplayFormat := '###,###,##0.00';
    TNumericField(cdsTabelaParam.FieldByName('Decrescimo')).DisplayFormat := '###,###,##0.00';
    TNumericField(cdsTabelaParam.FieldByName('Desconto')).DisplayFormat := '###,###,##0.00';

    frmVisualiza_Titulos_Remessa := TfrmVisualiza_Titulos_Remessa.Create(Self);
    try
      with frmVisualiza_Titulos_Remessa do
      begin
        cdsTitulos := Self.cdsTabelaParam;
        dsTitulos := Self.dsTabelaParam;
        ShowModal;
      end;
    finally
      FreeAndNil(frmVisualiza_Titulos_Remessa);
    end;

  end;
end;

function TfrmSeleciona_Titulos_Remessa.sysObtemArquivoRemessa: string;
var
  Auxiliar: String;
  NomeArquivo: String;
  Inverte: String;
begin
  NomeArquivo := '';

  repeat
    appSaveDialog.FileName := '';
    appSaveDialog.InitialDir := ''; // definir sysGetSystemPath + strPasta_Envio;
    if (appSaveDialog.Execute) then
    begin
      if (appSaveDialog.FileName <> '') then
      begin
        Auxiliar := appSaveDialog.FileName;
        Auxiliar := StringReplace(Auxiliar, '.rem', '', [rfReplaceAll]);
        NomeArquivo := Format('%s.rem', [Auxiliar]);
      end;
    end;
  until NomeArquivo <> '';

  Result := NomeArquivo;
end;

function TfrmSeleciona_Titulos_Remessa.sysObtemNomeArquivo(NomeArquivo: String): String;
var
  Inverte: String;
begin
  Inverte := ReverseString(NomeArquivo);
  Inverte := Copy(Inverte, 0, Pos('\', Inverte) - 1);

  NomeArquivo := ReverseString(Inverte);

  Result := NomeArquivo;
end;

procedure TfrmSeleciona_Titulos_Remessa.btnAplicarClick(Sender: TObject);
var
  TOwner: TUEntityOwnerArray;
  strSQL: String;
  Msg: TProgressMsg;
  Falha: Boolean;
  Reg: TBookMark;
  SQL: String;
begin
  inherited;
  Falha := False;

  try
    Reg := cdsBorderos.GetBookmark;

    cdsBorderos.DisableControls;
    cdsBorderos.First;

    cdsBorderos.Filtered := False;
    cdsBorderos.Filter := '[SELECIONADO] = ' + VB_SIM;
    cdsBorderos.Filtered := true;

    if cdsBorderos.IsEmpty then
    begin
      __SuperClass.GenericsF.DisplayMessage('Nenhum borderô selecionado.', '', 'Selecione ao menos 1 borderô.', 'Informação',
        MB_ICONEXCLAMATION);
      ModalResult := mrNone;
    end else begin
      if (MessageBox(Application.Handle, 'Confirma a geração da remessa?', 'Pergunta', MB_YESNO + MB_ICONQUESTION) = IDYES) then
      begin
        try
          ArquivoRemessa := sysObtemArquivoRemessa;

          cdsBorderos.First;

          PassaDadosContaCorrenteParaCobreBemX;

          CobreBemX.DocumentosCobranca.Clear;

          while not cdsBorderos.Eof do
          begin
            pesquisaBorderosItens;
            while not cdsTabelaParam.Eof do
            begin
              PassaDadosBoletosParaCobreBemX;
              cdsTabelaParam.Next;
            end;

            with cdsTabelaParam do
            begin
              Close;
              CommandText := EmptyStr;
              SQL := ' UPDATE BORDEROS_DADOS SET       ' + ' ARQUIVO = ' + QuotedStr(sysObtemNomeArquivo(ArquivoRemessa)) + ',' +
                ' GERACAOARQUIVO = :pm_dtGeracao  ' + ' WHERE EMPRESA = :pm_Empresa     ' + ' AND FILIAL = :pm_Filial         ' +
                ' AND NUMERO = :pm_Numero';

              CommandText := SQL;

              with Params do
              begin
                with ParamByName('pm_dtGeracao') do
                begin
                  ParamType := ptInput;
                  DataType := ftDate;
                  Value := __SuperClass.User.DataBase;
                end;
                with ParamByName('pm_Empresa') do
                begin
                  ParamType := ptInput;
                  DataType := ftString;
                  Value := cdsBorderos.FieldByName('EMPRESA').AsString;
                end;

                with ParamByName('pm_Filial') do
                begin
                  ParamType := ptInput;
                  DataType := ftString;
                  Value := cdsBorderos.FieldByName('FILIAL').AsString;
                end;
                with ParamByName('pm_Numero') do
                begin
                  ParamType := ptInput;
                  DataType := ftInteger;
                  Value := cdsBorderos.FieldByName('NUMERO').AsInteger;
                end;
              end;
              Execute;
            end;

            cdsBorderos.Next;
          end;

          CobreBemX.ConfiguraContaCorrente;

          CobreBemX.GravaArquivoRemessa;

          with cdsTabelaParam do
          begin
            Close;
            CommandText := EmptyStr;
            CommandText := ' UPDATE BANCOS SET                    ' + ' DOCUMENTOINTERNO = :pm_nroSequencia  ' +
              ' WHERE EMPRESA = :pm_Empresa          ' + ' AND FILIAL  = :pm_Filial             ' +
              ' AND CODIGO  = :pm_Codigo             ' + ' AND AGENCIA = :pm_Agencia            ' +
              ' AND CONTA   = :pm_Conta              ';
            with Params do
            begin
              with ParamByName('pm_nroSequencia') do
              begin
                ParamType := ptInput;
                DataType := ftString;
                Value := IntToStr(intNroArquivoSequencia + 1);
              end;
              with ParamByName('pm_Empresa') do
              begin
                ParamType := ptInput;
                DataType := ftString;
                Value := cdsBorderos.FieldByName('EMPRESA_BANCOS').AsString;
              end;
              with ParamByName('pm_Filial') do
              begin
                ParamType := ptInput;
                DataType := ftString;
                Value := cdsBorderos.FieldByName('FILIAL_BANCOS').AsString;
              end;
              with ParamByName('pm_Codigo') do
              begin
                ParamType := ptInput;
                DataType := ftInteger;
                Value := cdsBorderos.FieldByName('CODIGO').AsInteger;
              end;
              with ParamByName('pm_Agencia') do
              begin
                ParamType := ptInput;
                DataType := ftString;
                Value := cdsBorderos.FieldByName('AGENCIA').AsString;
              end;
              with ParamByName('pm_Conta') do
              begin
                ParamType := ptInput;
                DataType := ftString;
                Value := cdsBorderos.FieldByName('CONTA').AsString;
              end;
            end;
            Execute;
          end;
        except
          on E: Exception do
          begin
            Screen.Cursor := crArrow;
            Application.ProcessMessages;
            Falha := true;
            __SuperClass.GenericsF.DisplayMessage('Falha na geração da remessa.', Format('%s.', [E.Message]), 'Tente novamente.',
              'Informação', MB_ICONINFORMATION);
          end;
        end;
      end;
    end;
  finally
    Screen.Cursor := crArrow;
    Application.ProcessMessages;

    cdsBorderos.Filtered := False;

    cdsBorderos.GotoBookMark(Reg);
    cdsBorderos.FreeBookMark(Reg);
    cdsBorderos.EnableControls;

    __SuperClass.GenericsF.DisplayInformation(itClose, Msg, '');
  end;
end;

end.
