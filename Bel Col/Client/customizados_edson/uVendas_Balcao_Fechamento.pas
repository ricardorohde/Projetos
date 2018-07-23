{ ********************************************************************* }
{ }
{ TRS Sistemas - Runtime Library Functions }
{ }
{ Copyright(c) 2006-2012 TRS Sistemas e Soluções em Informática Ltda. }
{ }
{ Author: Thiago Rodrigo da Silva }
{ ********************************************************************* }
{ Fechamento de Vendas Balcão }
{ }
{ ********************************************************************* }
{ Data última alteração: }
{ Últimas alterações: }
{ }
{ ********************************************************************* }

unit uVendas_Balcao_Fechamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFBase, ExtCtrls, StdCtrls, Mask, DBCtrls, Buttons, Grids,
  DBGrids, DB, DBClient, Math, uTypes, uECF_DLL, SQLEXPR, DBXJSON, uDSClientProxy,
  pngimage, Generics.Collections, StrUtils;

const
  SE_NA_EMPRESA = '0';
  SE_EM_TRANSITO = '1';

const
  SV_OFICIAL = 0;
  SV_ALTERNATIVO = 1;

type

  TDados_NF = record
    Aliquotas: Boolean;
    Texto: Boolean;
    ClassificacaoFiscal: Boolean;
    LocalAliquotas: ShortString;
    LocalTexto: ShortString;
    LocalClassificacaoFiscal: ShortString;
    Corpo: string;
    Adicionais: string;
  end;

  TfrmVendas_Balcao_Fechamento = class(TfrmFBase)
    pnlPrincipal: TPanel;
    pnlCima: TPanel;
    Label2: TLabel;
    dbedtSubTotal: TDBEdit;
    Label1: TLabel;
    dbedtAcrescimo: TDBEdit;
    dbedtPercentualAcrescimo: TDBEdit;
    dbedtPercentualDesconto: TDBEdit;
    Label3: TLabel;
    dbedtDesconto: TDBEdit;
    Label4: TLabel;
    dbedtTotal: TDBEdit;
    Label5: TLabel;
    dbedtRecebido: TDBEdit;
    Label6: TLabel;
    dbedtTroco: TDBEdit;
    pnlParcelas: TPanel;
    pnlFormas_Pagamento: TPanel;
    pnlBaixo: TPanel;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    dbgridParcelas: TDBGrid;
    dbgridFormas: TDBGrid;
    cdsFormas: TClientDataSet;
    cdsFormasFORMAPAGAMENTO: TStringField;
    cdsFormasVALOR: TCurrencyField;
    cdsFormasPERCENTUAL: TFloatField;
    dtsFormas: TDataSource;
    dtsParcelas: TDataSource;
    cdsParcelas: TClientDataSet;
    cdsParcelasPARCELA: TIntegerField;
    cdsParcelasVENCIMENTO: TDateField;
    cdsParcelasVENCIMENTOREAL: TDateField;
    cdsParcelasVALOR: TCurrencyField;
    cdsDados: TClientDataSet;
    dtsDados: TDataSource;
    cdsDadosSUBTOTAL: TCurrencyField;
    cdsDadosACRESCIMO: TCurrencyField;
    cdsDadosPERCENTUALACRESCIMO: TFloatField;
    cdsDadosDESCONTO: TCurrencyField;
    cdsDadosPERCENTUALDESCONTO: TFloatField;
    cdsDadosTOTAL: TCurrencyField;
    cdsDadosRECEBIDO: TCurrencyField;
    cdsDadosTROCO: TCurrencyField;
    cdsDadosCONDICAOPAGAMENTO: TIntegerField;
    cdsDadosDESCRICAOCONDICAO: TStringField;
    Label8: TLabel;
    dbedtCondicoes_Pagamentos: TDBEdit;
    btnCondicoes_Pagamentos: TSpeedButton;
    dbedtDescricaoCondicao: TDBEdit;
    cdsDadosID: TIntegerField;
    cdsParcelasID: TIntegerField;
    cdsFormasID: TIntegerField;
    cdsFormasPARCELA: TIntegerField;
    cdsFormasDESCRICAO: TStringField;
    cdsFormasBANCO: TIntegerField;
    cdsFormasAGENCIA: TStringField;
    cdsFormasCONTA: TStringField;
    cdsFormasDOCUMENTO: TStringField;
    cdsFormasPROPRIETARIO: TStringField;
    cdsDadosVALORMERCADORIAS: TCurrencyField;
    imgTotal: TImage;
    imgTroco: TImage;
    imgRecebido: TImage;
    imgCondicaoPagamento: TImage;
    procedure btnConfirmarClick(Sender: TObject);
    procedure cdsFormasFORMAPAGAMENTOValidate(Sender: TField);
    procedure cdsParcelasVENCIMENTOValidate(Sender: TField);
    procedure cdsParcelasBeforeInsert(DataSet: TDataSet);
    procedure cdsFormasBeforeInsert(DataSet: TDataSet);
    procedure cdsFormasVALORValidate(Sender: TField);
    procedure cdsFormasPERCENTUALValidate(Sender: TField);
    procedure FormCreate(Sender: TObject);
    procedure cdsFormasPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdsFormasEditError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdsFormasDeleteError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdsParcelasPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdsParcelasEditError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdsParcelasDeleteError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdsDadosPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdsDadosEditError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdsDadosDeleteError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdsFormasBeforePost(DataSet: TDataSet);
    procedure cdsParcelasBeforePost(DataSet: TDataSet);
    procedure cdsDadosBeforePost(DataSet: TDataSet);
    procedure cdsDadosCONDICAOPAGAMENTOValidate(Sender: TField);
    procedure btnCondicoes_PagamentosClick(Sender: TObject);
    procedure dbedtTotalEnter(Sender: TObject);
    procedure cdsDadosDESCONTOValidate(Sender: TField);
    procedure cdsDadosACRESCIMOValidate(Sender: TField);
    procedure FormShow(Sender: TObject);
    procedure cdsDadosPERCENTUALDESCONTOValidate(Sender: TField);
    procedure cdsDadosPERCENTUALACRESCIMOValidate(Sender: TField);
    procedure cdsDadosRECEBIDOValidate(Sender: TField);
    procedure cdsParcelasBeforeDelete(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
  private
    IdNota: TIdNota;
    RegrasComissao: TRegrasComissao;
    ClassificacaoFiscal: TStringList;
    Texto: TStringList;
    Dados_NF: TDados_NF;
    Informa_Enderecos: Boolean;
    CupomFiscal: string;
    CNPJCPF: string;
    InformaChequeECF: Boolean;
    {
      IndiceTotalizadorICMSIsento: ShortString;
      IndiceTotalizadorICMS7: ShortString;
      IndiceTotalizadorICMS12: ShortString;
      IndiceTotalizadorICMS18: ShortString;
      IndiceTotalizadorICMS25: ShortString;
      IndiceTotalizadorICMSSTIsento: ShortString;
    }
    IndiceTotalizadorICMSIsento: String;
    IndiceTotalizadorICMS7: String;
    IndiceTotalizadorICMS12: String;
    IndiceTotalizadorICMS18: String;
    IndiceTotalizadorICMS25: String;
    IndiceTotalizadorICMSSTIsento: String;
    DiaUtilFechamento: Boolean;

    procedure CalculaTotal;
    procedure CalculaTroco;
    function GeraParcelas: Boolean;
    function GeraFormas: Boolean;
    function ValidaFormas: Boolean;
    function ObtemValoresInformados: Currency;
    function ImprimeCupomFiscal: Boolean;
    function FinalizaVenda: Boolean;
    procedure EstornaVenda;
    procedure ExcluiNotaFiscal;
    procedure ExcluiBaixaTitulos;
    function ValidaCNPJ(Numero: String): Boolean;
    function ValidaCPF(Numero: String): Boolean;

    function ObtemIdNotaSat(Prefixo: String): String;
    function ExistePagamento(value: String; List: TObjectList<TObject>): Boolean;
    function ImprimeCupomFiscalSat: Boolean;
    function ImprimeCupomFiscalNFCE(): Boolean;
  public
    ConfiguracaoEstacao: TConfiguracaoEstacao;
    ValorMercadorias: Currency;
    SubTotal: Currency;
    Acrescimo: Currency;
    Desconto: Currency;
    CondicaoPagamento: Integer;
    FormaPagamento: ShortString;
    MensagemPromocional: string;
    cdsVendas_Balcao_Dados: TClientDataSet;
    cdsVendas_Balcao_Itens: TClientDataSet;
    cdsVendas_Balcao_Parcelas: TClientDataSet;
    cdsVendas_Balcao_Formas: TClientDataSet;
    cdsNotas_Saidas_Dados: TClientDataSet;
    cdsNotas_Saidas_Itens: TClientDataSet;
    cdsMovimentos_Bancarios: TClientDataSet;
    cdsMovimentos_Bancarios_Rateios: TClientDataSet;
  end;

var
  frmVendas_Balcao_Fechamento: TfrmVendas_Balcao_Fechamento;

implementation

uses uCondicoes_Pagamentos, uDMMain, uProgressMsg, uVendas_Balcao,
  uVendas_Balcao_Baixas, uImpressao_Cupom_Fiscal, uSat, uInforma_CNPJ_CPF_Cupom, uAdicionais_Cupom_Sat, System.Generics.Defaults, uNFCE;

{$R *.dfm}

procedure TfrmVendas_Balcao_Fechamento.cdsDadosRECEBIDOValidate(Sender: TField);
var
  Aborta: Boolean;
  Msg: ShortString;
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    Aborta := False;
    Msg := '';
    if ((RoundTo(Sender.AsCurrency, -2) <= 0) or (RoundTo(Sender.AsCurrency, -2) < RoundTo(cdsDadosTOTAL.AsCurrency, -2))) then
      Msg := 'Valor recebido inválido.';

    if (Msg <> '') then
    begin
      __SuperClass.GenericsF.DisplayMessage(Msg, '', 'Verifique o valor informado.', 'Informação', MB_ICONINFORMATION);
      Aborta := True;
    end
    else
    begin
      CalculaTroco;
      if (cdsDadosCONDICAOPAGAMENTO.AsInteger > 0) then
      begin
        Aborta := not GeraParcelas;
        if (not Aborta) then
          Aborta := not GeraFormas;
      end;
    end;

    if Aborta then
      Abort;
  end;
end;

procedure TfrmVendas_Balcao_Fechamento.cdsDadosPERCENTUALACRESCIMOValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    cdsDadosACRESCIMO.OnValidate := Nil;
    cdsDadosACRESCIMO.AsCurrency := RoundTo(((cdsDadosVALORMERCADORIAS.AsCurrency * Sender.AsFloat) * 0.01), -2);
    CalculaTotal;
    CalculaTroco;
    cdsDadosACRESCIMO.OnValidate := cdsDadosACRESCIMOValidate;
  end;
end;

procedure TfrmVendas_Balcao_Fechamento.cdsDadosPERCENTUALDESCONTOValidate(Sender: TField);
var
  Aborta: Boolean;
  Msg: ShortString;
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    Aborta := False;
    Msg := '';
    if RoundTo(Sender.AsCurrency, -2) > 100 then
      Msg := 'Percentual de desconto inválido.'
    else
    begin
      cdsDadosDESCONTO.OnValidate := Nil;
      cdsDadosDESCONTO.AsCurrency := RoundTo(((cdsDadosVALORMERCADORIAS.AsCurrency * Sender.AsFloat) * 0.01), -2);
      CalculaTotal;
      CalculaTroco;
      cdsDadosDESCONTO.OnValidate := cdsDadosDESCONTOValidate;
    end;

    if (Msg <> '') then
    begin
      __SuperClass.GenericsF.DisplayMessage(Msg, '', 'Verifique o valor informado.', 'Informação', MB_ICONEXCLAMATION);
      Aborta := True;
    end;

    if (Aborta) then
      Abort;
  end;
end;

procedure TfrmVendas_Balcao_Fechamento.FormShow(Sender: TObject);
var
  Lista: TStringList;
begin
  inherited;
  Caption := Format('Vendas Balcão - Fechamento da Venda [%s]',
    [FormatFloat('000000', cdsVendas_Balcao_Dados.FieldByName('NUMERO').AsInteger)]);
  MensagemPromocional := MensagemPromocional + #13 + __SuperClass.DBFunctions.GetParamValue('SV_ECF_MENSAGEM_PROMOCIONAL');
  InformaChequeECF := __SuperClass.DBFunctions.GetParamValue('SV_INFORMA_CHEQUE_ECF');

  IndiceTotalizadorICMSIsento := __SuperClass.DBFunctions.GetParamValue('SV_INDICE_ECF_ICMSISENTO');
  IndiceTotalizadorICMS7 := __SuperClass.DBFunctions.GetParamValue('SV_INDICE_ECF_ICMS7');
  IndiceTotalizadorICMS12 := __SuperClass.DBFunctions.GetParamValue('SV_INDICE_ECF_ICMS12');
  IndiceTotalizadorICMS18 := __SuperClass.DBFunctions.GetParamValue('SV_INDICE_ECF_ICMS18');
  IndiceTotalizadorICMS25 := __SuperClass.DBFunctions.GetParamValue('SV_INDICE_ECF_ICMS25');
  IndiceTotalizadorICMSSTIsento := __SuperClass.DBFunctions.GetParamValue('SV_INDICE_ECF_ICMSSTISENTO');
  DiaUtilFechamento := __SuperClass.DBFunctions.GetParamValue('SV_DIA_UTIL_FECHAMENTO_CAIXA');

  Lista := TStringList.Create;
  try
    __SuperClass.DBFunctions.GetListItems(TL_FORMAS_PAGAMENTOS, Lista);
    dbgridFormas.Columns[__SuperClass.GenericsF.GetDBGridColumnPos(dbgridFormas, 'FORMAPAGAMENTO')].PickList.AddStrings(Lista);
  finally
    FreeAndNil(Lista);
  end;

  ClassificacaoFiscal := TStringList.Create;
  __SuperClass.DBFunctions.GetListItems(TL_CLASSIFICACOES_FISCAIS, ClassificacaoFiscal);

  Texto := TStringList.Create;

  try
    with Dados_NF do
    begin
      Aliquotas := __SuperClass.DBFunctions.GetParamValue('SV_RESUMO_ALIQUOTAS');
      Texto := __SuperClass.DBFunctions.GetParamValue('SV_RESUMO_TEXTO');
      ClassificacaoFiscal := __SuperClass.DBFunctions.GetParamValue('SV_RESUMO_CLASSIFICACAO_FISCAL');
      LocalAliquotas := __SuperClass.DBFunctions.GetParamValue('SV_LOCAL_ALIQUOTAS');
      LocalTexto := __SuperClass.DBFunctions.GetParamValue('SV_LOCAL_TEXTO');
      LocalClassificacaoFiscal := __SuperClass.DBFunctions.GetParamValue('SV_LOCAL_CLASSIFICACAO_FISCAL');
    end;
  except
    with Dados_NF do
    begin
      Aliquotas := False;
      Texto := False;
      ClassificacaoFiscal := False;
      LocalAliquotas := '';
      LocalTexto := '';
      LocalClassificacaoFiscal := '';
    end;
  end;
  Informa_Enderecos := __SuperClass.DBFunctions.GetParamValue('SV_INFORMA_ENDERECOS_NF');

  cdsDados.Insert;
  Randomize;
  cdsDadosID.AsInteger := Random(1000);
  cdsDadosVALORMERCADORIAS.AsCurrency := ValorMercadorias;
  cdsDadosSUBTOTAL.AsCurrency := SubTotal;
  cdsDadosACRESCIMO.AsCurrency := Acrescimo;
  cdsDadosDESCONTO.AsCurrency := Desconto;
  cdsDadosCONDICAOPAGAMENTO.AsInteger := CondicaoPagamento;
end;

procedure TfrmVendas_Balcao_Fechamento.cdsDadosACRESCIMOValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    cdsDadosPERCENTUALACRESCIMO.OnValidate := Nil;
    cdsDadosPERCENTUALACRESCIMO.AsFloat := RoundTo(((Sender.AsCurrency * 100) / cdsDadosVALORMERCADORIAS.AsCurrency), -2);
    CalculaTotal;
    CalculaTroco;
    cdsDadosPERCENTUALACRESCIMO.OnValidate := cdsDadosPERCENTUALACRESCIMOValidate;
  end;
end;

procedure TfrmVendas_Balcao_Fechamento.cdsDadosDESCONTOValidate(Sender: TField);
var
  Aborta: Boolean;
  Msg: ShortString;
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    Aborta := False;
    Msg := '';
    if RoundTo(Sender.AsCurrency, -2) >= RoundTo(cdsDadosTOTAL.AsCurrency, -2) then
      Msg := 'Desconto inválido.'
    else
    begin
      cdsDadosPERCENTUALDESCONTO.OnValidate := Nil;
      cdsDadosPERCENTUALDESCONTO.AsFloat := RoundTo(((Sender.AsCurrency * 100) / cdsDadosVALORMERCADORIAS.AsCurrency), -2);
      CalculaTotal;
      CalculaTroco;
      cdsDadosPERCENTUALDESCONTO.OnValidate := cdsDadosPERCENTUALDESCONTOValidate;
    end;

    if (Msg <> '') then
    begin
      __SuperClass.GenericsF.DisplayMessage(Msg, '', 'Verifique o valor informado.', 'Informação', MB_ICONEXCLAMATION);
      Aborta := True;
    end;

    if (Aborta) then
      Abort;
  end;
end;

procedure TfrmVendas_Balcao_Fechamento.dbedtTotalEnter(Sender: TObject);
begin
  inherited;
  Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmVendas_Balcao_Fechamento.EstornaVenda;
begin
  with cdsVendas_Balcao_Parcelas do
  begin
    First;
    while not Eof do
    begin
      // Apagando as parcelas
      with cdsVendas_Balcao_Formas do
      begin
        First;
        while not Eof do
          Delete;
      end;
      Delete;
    end;
  end;
  // Apagando as parcelas
  with cdsVendas_Balcao_Dados do
  begin
    Edit;
    FieldByName('CONDICAOPAGAMENTO').AsInteger := 0;
    FieldByName('FORMAPAGAMENTO').AsString := '01'; // Dinheiro
    FieldByName('VALORDESCONTO').AsCurrency := 0;
    FieldByName('VALORDESPESAS').AsCurrency := 0;
    FieldByName('VALORRECEBIDO').AsCurrency := 0;
    FieldByName('VALORTROCO').AsCurrency := 0;
    FieldByName('PREFIXOECF').AsString := '';
    FieldByName('NUMEROECF').AsString := '';
    FieldByName('CNPJCPF').AsString := '';
    FieldByName('SITUACAO').AsString := VB_EM_ABERTO;
    Post;
  end;
  cdsVendas_Balcao_Dados.RefreshRecord;
end;

procedure TfrmVendas_Balcao_Fechamento.ExcluiBaixaTitulos;
begin
  // Apaga os movimentos bancários
  with cdsMovimentos_Bancarios do
  begin
    First;
    while not Eof do
      Delete;
  end;
end;

procedure TfrmVendas_Balcao_Fechamento.ExcluiNotaFiscal;
begin
  // Exclui os Itens
  with cdsNotas_Saidas_Itens do
  begin
    First;
    while not Eof do
      Delete;
  end;
  // Exclui os Dados
  with cdsNotas_Saidas_Dados do
    Delete;

  cdsNotas_Saidas_Dados.RefreshRecord;
end;

function TfrmVendas_Balcao_Fechamento.ExistePagamento(value: String; List: TObjectList<TObject>): Boolean;
var
  Count: Integer;
  I: Integer;
begin
  Count := 0;
  result := False;
  for I := 0 to List.Count - 1 do
    if value = uSat.TVenda.TPagamento(List.Items[I]).Codigo then
      inc(Count);
  if Count = 0 then
    result := False
  else
    result := True;
end;

procedure TfrmVendas_Balcao_Fechamento.btnCondicoes_PagamentosClick(Sender: TObject);
var
  AFields: TUStringArray;
  SFields: TUStringArray;
begin
  inherited;
  frmCondicoes_Pagamentos := TfrmCondicoes_Pagamentos.Create(Self);
  try
    // campos que receberão os dados
    SetLength(AFields, 2);
    AFields[0] := 'CONDICAOPAGAMENTO';
    AFields[1] := 'DESCRICAOCONDICAO';
    // campos que proverão os dados
    SetLength(SFields, 2);
    SFields[0] := 'CODIGO';
    SFields[1] := 'DESCRICAO';
    __SuperClass.DBFunctions.ApplyFieldsInDataSet(frmCondicoes_Pagamentos, frmCondicoes_Pagamentos.cdsCondicoes_Pagamentos,
      frmCondicoes_Pagamentos.dtsCondicoes_Pagamentos, cdsDados, AFields, SFields);
  finally
    FreeAndNil(frmCondicoes_Pagamentos);
  end;
end;

procedure TfrmVendas_Balcao_Fechamento.cdsDadosCONDICAOPAGAMENTOValidate(Sender: TField);
const
  Entidade = 'CONDICOES_PAGAMENTOS';
var
  Empresa: String;
  Filial: String;
  Campos: TUStringArray;
  Filtro: String;
  Continua: Boolean;
  Auxiliar: TDataSet;
begin
  inherited;
  if (__SuperClass.DBFunctions.IsEditing(Sender.DataSet)) then
  begin
    Continua := False;
    if (Sender.AsInteger > 0) then
    begin
      if (RoundTo(cdsDadosRECEBIDO.AsCurrency, -2) > 0) then
      begin
        try
          __SuperClass.DBFunctions.GetEntityOwner(Entidade, Empresa, Filial);
          Campos := __SuperClass.GenericsF.VarArrayOfStr(['DESCRICAO']);
          Filtro := Format('EMPRESA = %s AND FILIAL = %s AND CODIGO = %d', [QuotedStr(Empresa), QuotedStr(Filial),
            Sender.AsInteger]);
          Continua := __SuperClass.GenericsF.RegistroHabilitado(Entidade, Filtro, '');
          if (Continua) then
          begin
            try
              Auxiliar := __SuperClass.DBFunctions.ExecuteQueryByXML(Campos, Entidade, Filtro);

              if ((Auxiliar.Eof) and (Auxiliar.Bof)) then
                Continua := False
              else
              begin
                cdsDadosDESCRICAOCONDICAO.AsString := Auxiliar.FieldByName('DESCRICAO').AsString;
                Continua := GeraParcelas;
                if (Continua) then
                  Continua := GeraFormas;
              end;
            finally
              FreeAndNil(Auxiliar);
            end;
          end;
        except
          on E: Exception do
            __SuperClass.GenericsF.DisplayMessage('Falha ao atribuir a condição de pagamento.', Format('%s.', [E.Message]),
              'Verifique o valor informado.', 'Informação', MB_ICONEXCLAMATION);
        end;

        if (not Continua) then
          Abort;
      end;
    end;
  end;
end;

(*
  Autor : Thiago Rodrigo da Silva
  Data : 05/04/2007
  Função :  CalculaTotal
  Descrição : Calcula o total da venda
  Parametros:
  Exemplo:
*)
procedure TfrmVendas_Balcao_Fechamento.CalculaTotal;
begin
  cdsDadosTOTAL.AsCurrency := RoundTo(((cdsDadosSUBTOTAL.AsCurrency + cdsDadosACRESCIMO.AsCurrency) -
    cdsDadosDESCONTO.AsCurrency), -2);
  cdsDadosRECEBIDO.OnValidate := Nil;
  cdsDadosRECEBIDO.AsCurrency := 0; // Zera recebido para recalcular os valores
  cdsDadosRECEBIDO.OnValidate := cdsDadosRECEBIDOValidate;
end;

(*
  Autor : Thiago Rodrigo da Silva
  Data : 05/04/2007
  Função :  GeraParcelas
  Descrição : Faz a geração das parcelas de acordo com a ocndição de pagamento informada na venda
  Parametros:
  Exemplo:
*)
function TfrmVendas_Balcao_Fechamento.GeraParcelas: Boolean;
var
  Empresa: String;
  Filial: String;
  Okay: Boolean;
  Auxiliar: TDataSet;
  Parcelas: TUParcelaArray;
  Proxy: TDSServerMethodsClient;
  I: Integer;
  Parcela: TParcela;
begin
  Okay := False;
  if (cdsDadosCONDICAOPAGAMENTO.AsInteger > 0) then
  begin
    if ((RoundTo(cdsDadosRECEBIDO.AsCurrency, -2) > 0)) then
    begin
      if ((RoundTo(cdsDadosTROCO.AsCurrency, -2) < 0)) then
        __SuperClass.GenericsF.DisplayMessage('Valor do troco inválido.', '', 'Informe o valor do troco para continuar.',
          'Informação', MB_ICONEXCLAMATION)
      else
      begin
        try
          cdsParcelas.BeforeInsert := Nil;
          __SuperClass.DBFunctions.GetEntityOwner('CONTAS_RECEBER', Empresa, Filial);
          Parcelas := __SuperClass.GenericsF.GeraTitulos(cdsDadosCONDICAOPAGAMENTO.AsInteger,
            RoundTo(cdsDadosTOTAL.AsCurrency, -2), StrToDate(DateToStr(now)));
          // Proxy.GeraTitulos(cdsDadosCONDICAOPAGAMENTO.AsInteger, RoundTo(cdsDadosTOTAL.AsCurrency, -2), StrToDate(DateToStr(now)));
          if (Length(Parcelas) = 0) then
            __SuperClass.GenericsF.DisplayMessage('Parcelas não geradas.', '', 'Verifique os dados informados e tente novamente.',
              'Informação', MB_ICONEXCLAMATION)
          else
          begin
            with cdsParcelas do
            begin
              try
                DisableControls;
                CancelUpdates;
                EmptyDataSet;

                for I := Low(Parcelas) to High(Parcelas) do
                begin
                  try
                    Parcela := Parcelas[I];
                    Insert;
                    cdsParcelasPARCELA.AsInteger := I + 1;
                    cdsParcelasVENCIMENTO.OnValidate := Nil;
                    cdsParcelasVENCIMENTO.AsDateTime := Parcela.Vencimento;
                    cdsParcelasVENCIMENTO.OnValidate := cdsParcelasVENCIMENTOValidate;
                    if DiaUtilFechamento then
                      cdsParcelasVENCIMENTOREAL.AsDateTime := Parcela.VencimentoReal
                    else
                      cdsParcelasVENCIMENTOREAL.AsDateTime := Parcela.Vencimento;
                    cdsParcelasVALOR.AsCurrency := Parcela.Valor.value;
                    Post;
                  finally
                    FreeAndNil(Parcela);
                  end;
                end;
                Okay := True;
              finally
                First;
                EnableControls;
              end;
            end;
          end;
          cdsParcelas.BeforeInsert := cdsParcelasBeforeInsert;
        except
          on E: Exception do
            __SuperClass.GenericsF.DisplayMessage('Falha ao tentar gerar as parcelas.', E.Message,
              'Verifique os dados informados e tente novamente.', 'Informação', MB_ICONEXCLAMATION);
        end;
      end;
    end;
  end;

  result := Okay;
end;

(*
  Autor : Thiago Rodrigo da Silva
  Data : 05/04/2007
  Função :  GeraFormas
  Descrição : Gera as formas de pagamento de acordo com as parcelas geradas
  Parametros:
  Exemplo:
*)
function TfrmVendas_Balcao_Fechamento.GeraFormas: Boolean;
var
  Okay: Boolean;
begin
  Okay := False;
  if ((cdsDadosCONDICAOPAGAMENTO.AsInteger > 0)) then
  begin
    if ((RoundTo(cdsDadosRECEBIDO.AsCurrency, -2) > 0)) then
    begin
      if ((RoundTo(cdsDadosTROCO.AsCurrency, -2) < 0)) then
        __SuperClass.GenericsF.DisplayMessage('Valor do troco inválido.', '', 'Informe o valor do troco para continuar.',
          'Informação', MB_ICONEXCLAMATION)
      else
      begin
        with cdsFormas do
        begin
          try
            DisableControls;
            CancelUpdates;
            EmptyDataSet;
            with cdsParcelas do
            begin
              try
                cdsFormas.BeforePost := Nil;
                DisableControls;
                First;
                while not Eof do
                begin
                  cdsFormas.Insert;
                  if ((FormaPagamento = '') or (FormaPagamento = '01')) then
                  begin
                    cdsFormasFORMAPAGAMENTO.AsString := '01'; // Dinheiro
                    cdsFormasVALOR.AsCurrency := RoundTo(cdsParcelasVALOR.AsCurrency, -2);
                    cdsFormasPERCENTUAL.AsFloat := 100;
                    cdsFormasDOCUMENTO.AsString := Format('R$ %s', [FormatDateTime('ddmmyyhhmm', __SuperClass.ServerDateTime)]);
                  end
                  else
                  begin
                    cdsFormasFORMAPAGAMENTO.AsString := FormaPagamento; // Forma de pagamento da venda
                    cdsFormasVALOR.AsCurrency := RoundTo(cdsParcelasVALOR.AsCurrency, -2);
                    cdsFormasPERCENTUAL.AsFloat := 100;
                    cdsFormasDOCUMENTO.AsString := 'CH';
                  end;
                  cdsFormas.Post;
                  Next;
                end;
                Okay := True;
              finally
                First;
                EnableControls;
                cdsFormas.BeforePost := cdsFormasBeforePost;
              end;
            end;
          finally
            First;
            EnableControls;
          end;
        end;
      end;
    end;
  end;
  result := Okay;
end;

procedure TfrmVendas_Balcao_Fechamento.cdsDadosBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (not __SuperClass.DBFunctions.CheckRequiredFields(DataSet)) then
    Abort;
end;

procedure TfrmVendas_Balcao_Fechamento.cdsParcelasBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (not __SuperClass.DBFunctions.CheckRequiredFields(DataSet)) then
    Abort;
end;

procedure TfrmVendas_Balcao_Fechamento.cdsFormasBeforePost(DataSet: TDataSet);
var
  Falha: Boolean;
begin
  inherited;
  Falha := not __SuperClass.DBFunctions.CheckRequiredFields(DataSet);
  if (not Falha) then
  begin
    if (Pos('CHEQUE', cdsFormasDESCRICAO.AsString) > 0) then
    begin
      if (InformaChequeECF) then
      begin
        if ((cdsFormasBANCO.AsInteger = 0) or (cdsFormasAGENCIA.AsString = '') or (cdsFormasCONTA.AsString = '')) then
        begin
          __SuperClass.GenericsF.DisplayMessage('Banco/Agência/Conta do cheque não preenchidos corretamente.', '',
            'Verifique os dados informados.', 'Informação', MB_ICONEXCLAMATION);
          Falha := True;
        end;
      end;
    end;
  end;
  if (Falha) then
    Abort;
end;

procedure TfrmVendas_Balcao_Fechamento.cdsDadosDeleteError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  __SuperClass.GenericsF.ShowException(E);
  Action := daAbort;
end;

procedure TfrmVendas_Balcao_Fechamento.cdsDadosEditError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  __SuperClass.GenericsF.ShowException(E);
  Action := daAbort;
end;

procedure TfrmVendas_Balcao_Fechamento.cdsDadosPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  __SuperClass.GenericsF.ShowException(E);
  Action := daAbort;
end;

procedure TfrmVendas_Balcao_Fechamento.cdsParcelasDeleteError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  __SuperClass.GenericsF.ShowException(E);
  Action := daAbort;
end;

procedure TfrmVendas_Balcao_Fechamento.cdsParcelasEditError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  __SuperClass.GenericsF.ShowException(E);
  Action := daAbort;
end;

procedure TfrmVendas_Balcao_Fechamento.cdsParcelasPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  __SuperClass.GenericsF.ShowException(E);
  Action := daAbort;
end;

procedure TfrmVendas_Balcao_Fechamento.cdsFormasDeleteError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  __SuperClass.GenericsF.ShowException(E);
  Action := daAbort;
end;

procedure TfrmVendas_Balcao_Fechamento.cdsFormasEditError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  __SuperClass.GenericsF.ShowException(E);
  Action := daAbort;
end;

procedure TfrmVendas_Balcao_Fechamento.cdsFormasPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  __SuperClass.GenericsF.ShowException(E);
  Action := daAbort;
end;

procedure TfrmVendas_Balcao_Fechamento.FormCreate(Sender: TObject);
begin
  inherited;
  frmVendas_Balcao_Fechamento := Self;

  ValorMercadorias := 0;
  SubTotal := 0;
  Acrescimo := 0;
  Desconto := 0;
  CondicaoPagamento := 0;
  FormaPagamento := '';
  CupomFiscal := '';
  MensagemPromocional := '';
  Randomize;
end;

procedure TfrmVendas_Balcao_Fechamento.FormDestroy(Sender: TObject);
begin
  inherited;
  frmVendas_Balcao_Fechamento := nil;
end;

procedure TfrmVendas_Balcao_Fechamento.cdsFormasPERCENTUALValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    cdsFormasVALOR.OnValidate := Nil;
    cdsFormasVALOR.AsCurrency := RoundTo(((cdsParcelasVALOR.AsCurrency * Sender.AsFloat) * 0.01), -2);
    cdsFormasVALOR.OnValidate := cdsFormasVALORValidate;
  end;
end;

procedure TfrmVendas_Balcao_Fechamento.cdsFormasVALORValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    cdsFormasPERCENTUAL.OnValidate := Nil;
    cdsFormasPERCENTUAL.AsFloat := RoundTo(((Sender.AsCurrency * 100) / cdsParcelasVALOR.AsCurrency), -2);
    cdsFormasPERCENTUAL.OnValidate := cdsFormasPERCENTUALValidate;
  end;
end;

procedure TfrmVendas_Balcao_Fechamento.cdsFormasBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  // iniciando o item na 1a coluna
  dbgridFormas.SelectedIndex := __SuperClass.DBFunctions.GetFirstAvaiableGridColumn(dbgridFormas);
end;

procedure TfrmVendas_Balcao_Fechamento.cdsParcelasBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  __SuperClass.GenericsF.DisplayMessage('Não é possível excluir.', '', 'Informe uma nova condição de pagamento.', 'Informação',
    MB_ICONEXCLAMATION);
  Abort;
end;

procedure TfrmVendas_Balcao_Fechamento.cdsParcelasBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  __SuperClass.GenericsF.DisplayMessage('Não é possível inserir parcelas.', '', 'Informe uma nova condição de pagamento.',
    'Informação', MB_ICONEXCLAMATION);
  Abort;
end;

procedure TfrmVendas_Balcao_Fechamento.cdsParcelasVENCIMENTOValidate(Sender: TField);
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
    cdsParcelasVENCIMENTOREAL.AsDateTime := __SuperClass.GenericsF.DiaUtil(Sender.AsDateTime);
end;

procedure TfrmVendas_Balcao_Fechamento.cdsFormasFORMAPAGAMENTOValidate(Sender: TField);
var
  FieldIndex: Integer;
  It: Integer;
begin
  inherited;
  if __SuperClass.DBFunctions.IsEditing(Sender.DataSet) then
  begin
    if ((Sender.value <> '')) then
    begin
      if not __SuperClass.GenericsF.CheckValueInList(Sender.value, TL_FORMAS_PAGAMENTOS) then
        Abort
      else
      begin
        FieldIndex := __SuperClass.GenericsF.GetDBGridColumnPos(dbgridFormas, 'FORMAPAGAMENTO');
        if (FieldIndex > -1) then
        begin
          with dbgridFormas.Columns[FieldIndex].PickList do
          begin
            It := IndexOfName(Sender.AsString);
            if (It > -1) then
              cdsFormasDESCRICAO.AsString := Copy(Strings[It], Pos('=', Strings[It]) + 1, Length(Strings[It]));
          end;
        end;
      end;
    end;
  end;
end;

function TfrmVendas_Balcao_Fechamento.ImprimeCupomFiscal: Boolean;
var
  ItemECF: TItemECF;
  TFormas: TUStringArray;
  TValores: TUDoubleArray;
  Existe: Boolean;
  Contador: Integer;
  NumeroItem: Integer;
  Continua: Boolean;
  CupomAberto: Boolean;
  CNPJCPFValido: Boolean;
begin
  if (MessageBox(Application.Handle, 'Deseja informar o CNPJ ou CPF do consumidor?', 'Pergunta', MB_YESNO + MB_ICONQUESTION)
    = IDYES) then
  begin
    repeat
      CNPJCPF := cdsVendas_Balcao_Dados.FieldByName('CNPJCPF').AsString;
      CNPJCPF := InputBox('Informe o Documento', 'CNPJ ou CPF:', CNPJCPF);
      CNPJCPFValido := False;
      if (CNPJCPF <> '') then
      begin
        if Length(CNPJCPF) = 14 then
          CNPJCPFValido := ValidaCNPJ(CNPJCPF)
        else
          CNPJCPFValido := ValidaCPF(CNPJCPF);
      end;
    until (CNPJCPFValido) or (CNPJCPF = '');
  end;
  CupomAberto := False;
  result := False;
  try
    Continua := sysECF_AbreCupom(CNPJCPF) = 1;
    if (Continua) then
    begin
      // Indica que o cupom foi aberto
      CupomAberto := True;
      // Retorna o número do cupom fiscal
      Continua := sysECF_ObtemCupom(CupomFiscal) = 1;
      // Verifica se conseguiu ler o código do cupom fiscal, caso contrário, cancela o cupom
      if (TrimLeft(TrimRight(CupomFiscal)) = '') then
        Continua := False;
      if (Continua) then
      begin
        //
        // Inicio do processo para TEF (Implementar futuramente)
        //
        with cdsVendas_Balcao_Itens do
        begin
          DisableControls;
          First;
          NumeroItem := 0;
          while (not Eof) do
          begin
            inc(NumeroItem);
            with ItemECF do
            begin
              Item := NumeroItem;
              Produto := FieldByName('PRODUTO').AsString;
              Descricao := Copy(FieldByName('DESCRICAO').AsString, 1, 29);
              Aliquota := FormatFloat('0000', FieldByName('ICMS').AsFloat * 100);
              if (FieldByName('CSOSNICMS').AsString <> '') and (FieldByName('CSOSNICMS').AsString = '500') then
                // tributado pelo simples e substituido icmsst
                Aliquota := IndiceTotalizadorICMSSTIsento
              else
              begin
                if (Aliquota = '0000') then
                  Aliquota := IndiceTotalizadorICMSIsento
                else if (Aliquota = '0700') then
                  Aliquota := IndiceTotalizadorICMS7
                else if (Aliquota = '1200') then
                  Aliquota := IndiceTotalizadorICMS12
                else if (Aliquota = '1800') then
                  Aliquota := IndiceTotalizadorICMS18
                else if (Aliquota = '2500') then
                  Aliquota := IndiceTotalizadorICMS25
                else
                  Aliquota := IndiceTotalizadorICMSIsento;
              end;

              { if (Aliquota = '0700') then
                Aliquota := '01'
                else if (Aliquota = '1200') then
                Aliquota := '02'
                else if (Aliquota = '1800') then
                Aliquota := '03'
                else if (Aliquota = '2500') then
                Aliquota := '04'
                else if (Aliquota = '0000') then
                Aliquota := 'NN'; }

              TipoQuantidade := 'F'; // Fracionária
              Quantidade := FormatFloat('#0.000', FieldByName('QUANTIDADE').AsFloat);
              Decimais := 2; // Decimais
              Valor := FormatFloat('#0.00', FieldByName('UNITARIO').AsFloat);
              TipoDesconto := '$';
              // Se a venda tiver acréscimo e desconto, considera o desconto no item e o acréscimo no total da venda
              if ((RoundTo(cdsDadosACRESCIMO.AsCurrency, -2) > 0) and (RoundTo(cdsDadosDESCONTO.AsCurrency, -2) > 0)) then
                Desconto := FormatFloat('#0.00', FieldByName('VALORDESCONTO').AsCurrency)
              else
                Desconto := '0,00';
            end;
            // Vendendo item
            Continua := sysECF_VendeItem(ItemECF) = 1;
            if (not Continua) then
              Break;
            Next;
          end;
          EnableControls;
        end;

        // Iniciando o fechamento do cupom fiscal - Com Acréscimo
        if ((Continua) and (RoundTo(cdsDadosACRESCIMO.AsCurrency, -2) > 0)) then
          Continua := sysECF_EfetuaAcrescimo(RoundTo(cdsDadosACRESCIMO.AsCurrency, -2)) = 1;
        // Iniciando o fechamento do cupom fiscal - Com Desconto
        if ((Continua) and (RoundTo(cdsDadosACRESCIMO.AsCurrency, -2) = 0) and (RoundTo(cdsDadosDESCONTO.AsCurrency, -2) > 0))
        then
          Continua := sysECF_EfetuaDesconto(cdsDadosDESCONTO.AsCurrency) = 1;
        // Caso não haja acréscimo e desconto, fecha cupom com desconto 0
        if ((Continua) and (RoundTo(cdsDadosACRESCIMO.AsCurrency, -2) = 0) and (RoundTo(cdsDadosDESCONTO.AsCurrency, -2) = 0))
        then
          Continua := sysECF_IniciaFechamentoCupom = 1;

        if ((Continua)) then
        begin
          // Efetuando as formas de pagamentos
          with cdsParcelas do
          begin
            DisableControls;
            First;
            while not Eof do
            begin
              with cdsFormas do
              begin
                DisableControls;
                First;
                while not Eof do
                begin
                  if ((Length(TFormas) = 0) and (Length(TValores) = 0)) then
                  begin
                    SetLength(TFormas, 1);
                    SetLength(TValores, 1);
                    TFormas[Low(TFormas)] := cdsFormasDESCRICAO.AsString;
                    TValores[Low(TValores)] := RoundTo(cdsFormasVALOR.AsCurrency, -2);
                  end
                  else
                  begin
                    Existe := False;
                    for Contador := Low(TFormas) to High(TFormas) do
                    begin
                      if (TFormas[Contador] = cdsFormasDESCRICAO.AsString) then
                      begin
                        TValores[Contador] := TValores[Contador] + RoundTo(cdsFormasVALOR.AsCurrency, -2);
                        Existe := True;
                      end;
                    end;

                    if (not Existe) then
                    begin
                      SetLength(TFormas, Length(TFormas) + 1);
                      SetLength(TValores, Length(TValores) + 1);
                      TFormas[High(TFormas)] := cdsFormasDESCRICAO.AsString;
                      TValores[High(TValores)] := RoundTo(cdsFormasVALOR.AsCurrency, -2);
                    end;
                  end;
                  Next;
                end;
                EnableControls;
              end;
              Next;
            end;
            EnableControls;
          end;
          // Tratamento para o troco
          if (RoundTo(cdsDadosTROCO.AsCurrency, -2) > 0) then
          begin
            Existe := (__SuperClass.GenericsF.ScanArray(TFormas, 'DINHEIRO', cmNormal) <> -1);
            if (Existe) then
              TValores[__SuperClass.GenericsF.ScanArray(TFormas, 'DINHEIRO', cmNormal)] :=
                TValores[__SuperClass.GenericsF.ScanArray(TFormas, 'DINHEIRO', cmNormal)] + RoundTo(cdsDadosTROCO.AsCurrency, -2)
            else
            begin
              SetLength(TFormas, Length(TFormas) + 1);
              SetLength(TValores, Length(TValores) + 1);
              TFormas[High(TFormas)] := 'DINHEIRO';
              TValores[High(TValores)] := RoundTo(cdsDadosTROCO.AsCurrency, -2);
            end;
          end;
          // Efetuando formas de pagamentos
          Continua := sysECF_EfetuaFormas(TFormas, TValores) = 1;
          // Finalizando o cupom fiscal
          if (Continua) then
            Continua := sysECF_FinalizaCupom(MensagemPromocional) = 1;
        end;
      end;
    end;
    // Verifica se cancela o cupom fiscal atual
    if (not Continua and CupomAberto) then
      sysECFCancelaCupomFiscal;
    result := Continua;
  except
    on E: Exception do
      __SuperClass.GenericsF.DisplayMessage('Falha na impressão do cupom fiscal.', E.Message, 'Tente novamente.', 'Informacão',
        MB_ICONEXCLAMATION);
  end;
end;

function TfrmVendas_Balcao_Fechamento.ImprimeCupomFiscalNFCE(): Boolean;
var
  lNFCE: TNfce;
begin
  lNFCE:= TNfce.Create;
  try
    with lNFCE.Venda do
    begin
      result:= RealizarVendaItemCompleta();
    end;
  finally
    FreeAndNil( lNFCE );
  end;
end;

function TfrmVendas_Balcao_Fechamento.ImprimeCupomFiscalSat: Boolean;
var
  Venda: uSat.TVenda;
  Produto: uSat.TVenda.TProduto;
  Pagamento: uSat.TVenda.TPagamento;
  ResultadoVenda: uSat.TSat.TResultado;
  SumPagamentos: TObjectList<uSat.TVenda.TPagamento>;
  I, K: Integer;
  Ret: String;
  Total: Real;
  dsAuxiliar: TDataSet;
  Empresa, Filial: String;
  ListaNCM: TStringList;
  CountParcelas: Integer;
  CountFormas: Integer;
  ValorMercadorias: Currency;
  ValorBase: Currency;
  Parcial: Currency;
begin
  try
    Venda := TVenda.Create;

    Venda.Caixa := __SuperClass.User.StationId;

    if StrToBoolDef(VarToStrDef(__SuperClass.DBFunctions.GetParamValue('SV_SAT_HOMOLOGAÇÃO'), 'false'), False) then
    begin
      Venda.Emitente.Cnpj := '82373077000171';
      Venda.Emitente.IE := '111111111111';
    end
    else
    begin
      Venda.Emitente.Cnpj := __SuperClass.User.Branch.Cnpj;
      Venda.Emitente.IE := __SuperClass.User.Branch.IE;
    end;

    // Venda.Emitente.IM := '123123';
    Venda.Emitente.ISSQN := issqnMicroempresaMunicipal;
    Venda.Emitente.RateioISSQN := False;
    Venda.Emitente.Nome := __SuperClass.User.Branch.FullName;
    Venda.Emitente.NomeFantasia := __SuperClass.User.Branch.ShortName;

    if (StrToBoolDef(VarToStrDef(__SuperClass.DBFunctions.GetParamValue('SV_SAT_DADOS_ADICIONAIS'), 'false'), False)) then
      try
        frmAdicionais_Cupom_Sat := TfrmAdicionais_Cupom_Sat.Create(Self);
        if frmAdicionais_Cupom_Sat.ShowModal = mrOk then
          Venda.Adicionais := frmAdicionais_Cupom_Sat.memAdicionais.Text;
      finally
        if Assigned(frmAdicionais_Cupom_Sat) then
          FreeAndNil(frmAdicionais_Cupom_Sat);
      end;

    try
      __SuperClass.DBFunctions.GetEntityOwner('CLIENTES', Empresa, Filial);
      dsAuxiliar := __SuperClass.DBFunctions.ExecuteQueryByXML
        (Format('select * from CLIENTES where EMPRESA = %S and FILIAL = %S and CODIGO = %S',
        [QuotedStr(Empresa), QuotedStr(Filial), cdsVendas_Balcao_Dados.FieldByName('CLIENTE').AsString]));
      if Assigned(dsAuxiliar) then
        if not(dsAuxiliar.State in [dsInactive]) then
          if dsAuxiliar.RecordCount > 0 then
            if dsAuxiliar.FieldByName('PESSOA').AsString = '0' then
              CNPJCPF := dsAuxiliar.FieldByName('CPF').AsString
            else
              CNPJCPF := dsAuxiliar.FieldByName('CNPJ').AsString;
    finally
      if Assigned(dsAuxiliar) then
        FreeAndNil(dsAuxiliar);
    end;

    try
      frmInforma_Cpf_Cnpj := TfrmInforma_Cpf_Cnpj.Create(Self);
      if Length(CNPJCPF) = 14 then // CPF
        frmInforma_Cpf_Cnpj.rbtCnpj.Checked := True
      else
        frmInforma_Cpf_Cnpj.rbtCpf.Checked := True;
      frmInforma_Cpf_Cnpj.medCpfCnpj.Text := CNPJCPF;
      if frmInforma_Cpf_Cnpj.ShowModal = mrOk then
      begin
        if frmInforma_Cpf_Cnpj.rbtCpf.Checked then
          Venda.Destinatario.Tipo := Cpf
        else if frmInforma_Cpf_Cnpj.rbtCnpj.Checked then
          Venda.Destinatario.Tipo := Cnpj
        else
          Venda.Destinatario.Tipo := Cpf;
        Venda.Destinatario.CNPJCPF := frmInforma_Cpf_Cnpj.medCpfCnpj.Text;
        CNPJCPF := Venda.Destinatario.CNPJCPF;
      end
    finally
      if Assigned(frmInforma_Cpf_Cnpj) then
        FreeAndNil(frmInforma_Cpf_Cnpj);
    end;

    try
      __SuperClass.DBFunctions.GetEntityOwner('CLIENTES', Empresa, Filial);
      dsAuxiliar := __SuperClass.DBFunctions.ExecuteQueryByXML
        (Format('select NOME from CLIENTES where EMPRESA = %S and FILIAL = %S and ' +
        __SuperClass.GenericsF.IfThen(Venda.Destinatario.Tipo = Cpf, ' CPF = %s',
        __SuperClass.GenericsF.IfThen(Venda.Destinatario.Tipo = Cnpj, ' CNPJ = %s', ' CPF = %S')),
        [QuotedStr(Empresa), QuotedStr(Filial), QuotedStr(Venda.Destinatario.CNPJCPF)]));

      if Assigned(dsAuxiliar) then
        if not(dsAuxiliar.State in [dsInactive]) then
          if (dsAuxiliar.RecordCount > 0) and (Venda.Destinatario.CNPJCPF <> EmptyStr) then
            Venda.Destinatario.Nome := Copy(dsAuxiliar.FieldByName('NOME').AsString, 0, 60)
          else
            Venda.Destinatario.Nome := 'CONSUMIDOR FINAL'
        else
          Venda.Destinatario.Nome := 'CONSUMIDOR FINAL'
      else
        Venda.Destinatario.Nome := 'CONSUMIDOR FINAL'
    finally
      if Assigned(dsAuxiliar) then
        FreeAndNil(dsAuxiliar);
    end;

    try
      __SuperClass.DBFunctions.GetEntityOwner('VENDAS_BALCAO_ITENS', Empresa, Filial);
      dsAuxiliar := __SuperClass.DBFunctions.ExecuteQueryByXML
        (Format('select * from VENDAS_BALCAO_ITENS where EMPRESA = %s and FILIAL = %S and NUMERO = %d',
        [QuotedStr(Empresa), QuotedStr(Filial), cdsVendas_Balcao_Dados.FieldByName('NUMERO').AsInteger]));
      if Assigned(dsAuxiliar) then
        if not(dsAuxiliar.State in [dsInactive]) then
          if dsAuxiliar.RecordCount > 0 then
            for I := 0 to dsAuxiliar.RecordCount - 1 do
            begin
              Produto := TVenda.TProduto.Create;

              Produto.Codigo := dsAuxiliar.FieldByName('PRODUTO').AsString;
              Produto.Descricao := dsAuxiliar.FieldByName('DESCRICAO').AsString;

              Produto.NCM := dsAuxiliar.FieldByName('NCM').AsString;

              Produto.CFOP := dsAuxiliar.FieldByName('CODIGOFISCAL').AsString;
              Produto.Medida := dsAuxiliar.FieldByName('PRIMEIRAUNIDADE').AsString;
              Produto.Quantidade := dsAuxiliar.FieldByName('QUANTIDADE').AsCurrency;
              Produto.Unitario := dsAuxiliar.FieldByName('UNITARIO').AsCurrency;
              Produto.ValorBruto := Produto.Quantidade * Produto.Unitario;
              Produto.Regra := Arredondamento;

              Produto.ValorDesconto := dsAuxiliar.FieldByName('VALORDESCONTO').AsCurrency;
              Produto.OutrasDespesas := dsAuxiliar.FieldByName('VALORDESPESAS').AsCurrency;

              Produto.Impostos.ICMS.Origem := dsAuxiliar.FieldByName('ORIGEMST').AsString;
              Produto.Impostos.ICMS.CST := dsAuxiliar.FieldByName('CSTICMS').AsString;
              Produto.Impostos.ICMS.BaseCalculo := Produto.ValorBruto;
              Produto.Impostos.ICMS.Aliquota := dsAuxiliar.FieldByName('ICMS').AsCurrency;
              Produto.Impostos.ICMS.CSOSN := dsAuxiliar.FieldByName('CSOSNICMS').AsString;

              Produto.Impostos.PIS.CST := '01';
              Produto.Impostos.PIS.BaseCalculo := Produto.ValorBruto;
              Produto.Impostos.PIS.Aliquota := 0;

              Produto.Impostos.COFINS.CST := '01';
              Produto.Impostos.COFINS.BaseCalculo := Produto.ValorBruto;
              Produto.Impostos.COFINS.Aliquota := 0;

              Produto.Impostos.PISST.BaseCalculo := 1;
              Produto.Impostos.PISST.Aliquota := 0;

              // Produto.Adicionais := 'Teste de envio do xml para o SAT';

              Venda.Produtos.Add(Produto);
              dsAuxiliar.Next;
            end;
    finally
      if Assigned(dsAuxiliar) then
        FreeAndNil(dsAuxiliar);
    end;
    Total := 0;

    for I := 0 to Venda.Produtos.Count - 1 do
      Total := Total + (Venda.Produtos.Items[I].Quantidade * Venda.Produtos.Items[I].Unitario);

    cdsParcelas.First;
    cdsFormas.First;

    SumPagamentos := TObjectList<uSat.TVenda.TPagamento>.Create;

    for CountParcelas := 0 to cdsParcelas.RecordCount - 1 do
    begin
      for CountFormas := 0 to cdsFormas.RecordCount - 1 do
      begin
        Pagamento := TVenda.TPagamento.Create;

        Pagamento.Codigo := cdsFormasFORMAPAGAMENTO.AsString;
        Pagamento.Valor := cdsFormasVALOR.AsCurrency;

        SumPagamentos.Add(Pagamento);
        cdsFormas.Next;
      end;
      cdsParcelas.Next;
    end;

    SumPagamentos.Sort(TComparer<uSat.TVenda.TPagamento>.Construct(
      function(const L, R: uSat.TVenda.TPagamento): Integer function SortList(L, R: uSat.TVenda.TPagamento): Integer;
      begin
        result := CompareStr(L.Codigo, R.Codigo);
      end;
      begin
        result := SortList(L, R);
      end));

    Pagamento := Nil;

    for I := 0 to SumPagamentos.Count - 1 do
      if not ExistePagamento(SumPagamentos.Items[I].Codigo, TObjectList<TObject>(Venda.Pagamentos)) then
      begin
        Pagamento := uSat.TVenda.TPagamento.Create;
        Pagamento.Codigo := SumPagamentos.Items[I].Codigo;
        Pagamento.Valor := SumPagamentos.Items[I].Valor;
        Venda.Pagamentos.Add(Pagamento);
      end
      else
        for K := 0 to Venda.Pagamentos.Count - 1 do
        begin
          if SumPagamentos.Items[I].Codigo = Venda.Pagamentos.Items[K].Codigo then
            Venda.Pagamentos.Items[K].Valor := Venda.Pagamentos.Items[K].Valor + SumPagamentos.Items[I].Valor
        end;

    for I := 0 to Venda.Produtos.Count - 1 do
      ValorMercadorias := ValorMercadorias + Venda.Produtos.Items[I].Quantidade * Venda.Produtos.Items[I].Unitario;
    if cdsVendas_Balcao_Dados.FieldByName('VALORTRIBUTOS').AsCurrency > 0 then
      Venda.Adicionais := Venda.Adicionais + ' Val Aprox dos Tributos R$ ' +
        FormatFloat('###,###,##0.00', cdsVendas_Balcao_Dados.FieldByName('VALORTRIBUTOS').AsCurrency) + ' (' +
        FormatFloat('#0.00 %', RoundTo(((cdsVendas_Balcao_Dados.FieldByName('VALORTRIBUTOS').AsCurrency / ValorMercadorias) *
        100), -2)) + ') Fonte: IBPT ';

    ValorBase := cdsDadosDESCONTO.AsCurrency;

    for I := 0 to Venda.Produtos.Count - 1 do
    begin
      Venda.Produtos.Items[I].ValorDesconto := RoundTo((Venda.Produtos.Items[I].ValorBruto / cdsDadosSUBTOTAL.AsCurrency) *
        ValorBase, -2);
      Parcial := Parcial + Venda.Produtos.Items[I].ValorDesconto;
    end;

    if ((ValorBase - Parcial) <> 0) then
      Venda.Produtos.Items[0].ValorDesconto := Venda.Produtos.Items[0].ValorDesconto + (ValorBase - Parcial);

    TSat.GetInstance.Uf := ufSP;
    if StrToBoolDef(VarToStrDef(__SuperClass.DBFunctions.GetParamValue('SV_SAT_HOMOLOGAÇÃO'), 'false'), False) then
    begin
      TSat.GetInstance.Cnpj := '16716114000172'; // cnpj de homologação, Cnpj da Bematech
      TSat.GetInstance.Nome := 'SGR-SAT SISTEMA DE GESTAO E RETAGUARDA DO SAT'; // Assinatura de homologação
    end
    else
    begin
      TSat.GetInstance.Cnpj := '16885463000118'; // Cnpj SoftHouse
      TSat.GetInstance.Nome := VarToStrDef(__SuperClass.DBFunctions.GetParamValue('SV_SAT_ASSINATURA'), EmptyStr);
      // Assinatura criptografada
      { 'VKpp7WxqpKiLGMffpoGR4/YiuPY+EtJv/9uCn06XPlFS2n3+iwwkMEN/GoGxCQnf6emFw+uaAh9nZfzQ/Xr9tV/u432kI7uR9SqHcK7' +
        'Pglwz2I1Frc+e3z3weA1uEmE3B7clMmqMNUiOuHnA5YZeXJw3E4Ud4kLTvkiCznMYkm/SMcYqloN+8Av/hgv2zesmwGxCwELrCIKfss8wgFsne3JVuIz' +
        'UQ2V9EOpDh4/j0gpr7PwfcEAFwdoqvqGejVZnayULftuiGvCnLZA55GHz3ZFHqt04TXm2O+WM3cyQRPzovmlpvydmDsBZ3RM667jfAlP41wvfOJy65rNPVrODvA=='; }
    end;

    TSat.GetInstance.CodigoAtivacao := __SuperClass.DBFunctions.GetParamValue('SV_SAT_CODIGO_ATIVACAO');
    TSat.GetInstance.Regime := __SuperClass.User.Branch.RegimeTributario;

    ResultadoVenda := TSat.GetInstance.RealizaVenda(Venda);

    if ResultadoVenda.Msg.Sat <> 06000 then
    begin
      __SuperClass.GenericsF.DisplayMessage('Ocorreu algum problema ou aviso da SEFAZ para a emissão do cupom fiscal!',
        Format('Problemas que ocorreram no Sat'#13#10'[Venda: %d - %s]'#13#10'[Sefaz: %d - %s]'#13#10'[Sat: %d - %s]'#13#10'[Outras Msg: %s]',
        [ResultadoVenda.Msg.Venda, ResultadoVenda.Msg.InfoVenda(ResultadoVenda.Msg.Venda), ResultadoVenda.Msg.Sefaz,
        ResultadoVenda.Msg.infoSefaz(ResultadoVenda.Msg.Sefaz), ResultadoVenda.Msg.Sat,
        ResultadoVenda.Msg.InfoSat(ResultadoVenda.Msg.Sat), ResultadoVenda.OutrasMsgs]),
        'Verifique a venda e emita novamente o cupom caso necessário!', 'Informação', MB_ICONWARNING);
    end;

    if ((ResultadoVenda.ChaveAcesso <> EmptyStr) and (ResultadoVenda.ChaveAcesso <> '')) and
      ((ResultadoVenda.QrCode <> EmptyStr) and (ResultadoVenda.QrCode <> '')) and
      ((ResultadoVenda.Arquivo <> EmptyStr) and (ResultadoVenda.Arquivo <> '')) then
    begin
      cdsVendas_Balcao_Dados.Edit;
      cdsVendas_Balcao_Dados.FieldByName('IDCFE').AsString := ResultadoVenda.ChaveAcesso;
      cdsVendas_Balcao_Dados.FieldByName('QRCODE').AsString := ResultadoVenda.QrCode;
      cdsVendas_Balcao_Dados.FieldByName('ARQUIVOCFESAT').AsString := ResultadoVenda.Arquivo;
      cdsVendas_Balcao_Dados.FieldByName('DATATRANSMISSAO').AsDateTime := ResultadoVenda.Data;
      cdsVendas_Balcao_Dados.FieldByName('HORATRANSMISSAO').AsDateTime := ResultadoVenda.Hora;
      cdsVendas_Balcao_Dados.FieldByName('CNPJCPF').AsString := Venda.Destinatario.CNPJCPF;
      cdsVendas_Balcao_Dados.FieldByName('ADICIONAIS').AsString := Venda.Adicionais;
      cdsVendas_Balcao_Dados.FieldByName('XMLCFE').AsString := ResultadoVenda.XML;
      cdsVendas_Balcao_Dados.Post;
      cdsVendas_Balcao_Dados.ApplyUpdates(-1);

      result := True;
    end;

  finally
    if Assigned(Venda) then
      FreeAndNil(Venda);
  end;
end;

procedure TfrmVendas_Balcao_Fechamento.btnConfirmarClick(Sender: TObject);
type
  TStatus = record
    CupomFiscal: Boolean;
    Aborta: Boolean;
  end;
var
  Status: TStatus;
  FechamentoSemCupomVB: function(): TIdNota;
begin
  inherited;
  try
    with btnConfirmar do
      Enabled := False;
    with btnCancelar do
      Enabled := False;

    Status.CupomFiscal := False;
    Status.Aborta := False;

    if (MessageBox(Application.Handle, 'Confirma o fechamento da venda?', 'Pergunta', MB_YESNO + MB_ICONQUESTION) = IDYES) then
    begin
      if (RoundTo(cdsDadosRECEBIDO.AsCurrency, -2) <= 0) then
      begin
        __SuperClass.GenericsF.DisplayMessage('Valor recebido não informado ou inválido.', '',
          'Informe corretamente o valor recebido.', 'Informação', MB_ICONINFORMATION);
        Status.Aborta := True;
      end
      else
      begin
        if (not ValidaFormas) then
          Status.Aborta := True
        else
        begin
          if ((RoundTo(ObtemValoresInformados, -2) <> RoundTo(cdsDadosTOTAL.AsCurrency, -2))) then
          begin
            __SuperClass.GenericsF.DisplayMessage('Os valores informados não conferem com o total da venda.', '',
              'Verifique os valores informados.', 'Informação', MB_ICONEXCLAMATION);
            Status.Aborta := True;
          end
          else
          begin
            try
              // Verifica se imprime o cupom fiscal
              with ConfiguracaoEstacao do
              begin
                if ((UsaECF = VB_SIM)) then
                begin
                  if (MessageBox(Application.Handle, 'Imprime o cupom fiscal?', 'Pergunta', MB_YESNO + MB_ICONQUESTION) = IDYES)
                  then
                  begin
                      if (StrToBoolDef(varToStr(__SuperClass.DBFunctions.GetParamValue('SV_UTILIZA_SAT')), False)) then
                        begin
                          Status.CupomFiscal := ImprimeCupomFiscalSat;
                          Status.Aborta := not Status.CupomFiscal;
                          CupomFiscal := ObtemIdNotaSat(ConfiguracaoEstacao.Prefixo);
                        end
                      else
                      if (StrToBoolDef(varToStr(__SuperClass.DBFunctions.GetParamValue('SV_UTILIZA_NFCE')), False)) then
                        begin
                          Status.CupomFiscal := ImprimeCupomFiscalNFCE();
                          Status.Aborta := not Status.CupomFiscal;
                          CupomFiscal := ObtemIdNotaSat(ConfiguracaoEstacao.Prefixo);
                        end
                      else
                        begin
                          Status.CupomFiscal := ImprimeCupomFiscal;
                          Status.Aborta := not Status.CupomFiscal;
                        end;
                  end;
                end;
              end;

              if (not(Status.Aborta)) then
              begin
                // Indica que a venda não teve cupom fiscal impresso
                if ((CupomFiscal = '')) then
                begin
                  Status.CupomFiscal := False;
                  Status.Aborta := False;

                  if (__SuperClass.GetPackage(BPL_ACCUSTOMS).Handle <> 0) then
                  begin
                    @FechamentoSemCupomVB := GetProcAddress(__SuperClass.GetPackage(BPL_ACCUSTOMS).Handle,
                      'FechamentoSemCupomVB');
                    if Assigned(FechamentoSemCupomVB) then
                      IdNota := FechamentoSemCupomVB()
                    else
                      IdNota := __SuperClass.GenericsF.PegaIdNota;
                  end
                  else
                    IdNota := __SuperClass.GenericsF.PegaIdNota;
                end
                else
                begin
                  IdNota.Prefixo := ConfiguracaoEstacao.Prefixo;
                  IdNota.Numero := StrToInt(CupomFiscal);
                end;

                Status.Aborta := (IdNota.Prefixo = '') or (IdNota.Numero = 0);

                // Finaliza a venda
                if not(Status.Aborta) then
                  Status.Aborta := not FinalizaVenda;

                if not(Status.Aborta) then
                begin
                  // Aplicando a venda balcão
                  if not __SuperClass.DBFunctions.dbApply(cdsVendas_Balcao_Dados) then
                  begin
                    __SuperClass.GenericsF.DisplayMessage('Falha ao atualizar a venda balcão.', '', 'Tente novamente.',
                      'Informação', MB_ICONEXCLAMATION);
                    Status.Aborta := True;
                  end
                  else if (StrToBoolDef(varToStr(__SuperClass.DBFunctions.GetParamValue('SV_UTILIZA_SAT')), False)) then
                    if CupomFiscal = '' then
                      if (StrToBoolDef(varToStr(__SuperClass.DBFunctions.GetParamValue('SV_IMPRIME_NAO_FISCAL')), False)) then
                        try
                          frmImpressao_Cupom_Fiscal := TfrmImpressao_Cupom_Fiscal.Create(Self);
                          frmImpressao_Cupom_Fiscal.Show;
                          frmImpressao_Cupom_Fiscal.cdsPerguntas.Edit;
                          frmImpressao_Cupom_Fiscal.cdsPerguntasNUMERO.AsString :=
                            cdsVendas_Balcao_Dados.FieldByName('NUMERO').AsString;
                          frmImpressao_Cupom_Fiscal.cdsPerguntas.Post;
                          frmImpressao_Cupom_Fiscal.btnConfirmar.Click;
                          frmImpressao_Cupom_Fiscal.Close;
                        finally
                          if Assigned(frmImpressao_Cupom_Fiscal) then
                            FreeAndNil(frmImpressao_Cupom_Fiscal);
                        end
                      else
                    else
                      try
                        frmImpressao_Cupom_Fiscal := TfrmImpressao_Cupom_Fiscal.Create(Self);
                        frmImpressao_Cupom_Fiscal.Show;
                        frmImpressao_Cupom_Fiscal.cdsPerguntas.Edit;
                        frmImpressao_Cupom_Fiscal.cdsPerguntasNUMERO.AsString :=
                          cdsVendas_Balcao_Dados.FieldByName('NUMERO').AsString;
                        frmImpressao_Cupom_Fiscal.cdsPerguntas.Post;
                        frmImpressao_Cupom_Fiscal.btnConfirmar.Click;
                        frmImpressao_Cupom_Fiscal.Close;
                      finally
                        if Assigned(frmImpressao_Cupom_Fiscal) then
                          FreeAndNil(frmImpressao_Cupom_Fiscal);
                      end
                end;

                // Se Imprimiu o cupom e deu problema na gravação, cancela o cupom fiscal
                if ((Status.CupomFiscal) and (Status.Aborta)) then
                begin
                  sysECFCancelaCupomFiscal;
                  EstornaVenda;
                  __SuperClass.DBFunctions.dbApply(cdsVendas_Balcao_Dados);
                end;
              end;
            except
              on E: Exception do
                __SuperClass.GenericsF.DisplayMessage('Falha na gravação da venda balcão.', Format('%s.', [E.Message]),
                  'Verifique a venda em questão.', 'Informação', MB_ICONEXCLAMATION);
            end;
          end;
        end;
      end;

      if (Status.Aborta) then
      begin
        ModalResult := mrNone;
        __SuperClass.GenericsF.DisplayMessage('Processo de baixa cancelado.', '', 'Nenhum.', 'Informação', MB_ICONINFORMATION);
      end
      else
      begin
        ModalResult := mrOk;
        // Gerou pelo número de serie da nota fiscal
        if not(Status.CupomFiscal) then
        begin
          // Incrementando o número de nota
          inc(IdNota.Numero);
          __SuperClass.GenericsF.GravaIdNota(IdNota.Prefixo, IdNota.Numero);
        end
        else if (StrToBoolDef(varToStr(__SuperClass.DBFunctions.GetParamValue('SV_UTILIZA_SAT')), False)) then
        begin
          // Incrementando o número de nota
          inc(IdNota.Numero);
          __SuperClass.GenericsF.GravaIdNota(IdNota.Prefixo, IdNota.Numero);
        end;
      end;
    end;
  finally
    with btnConfirmar do
      Enabled := True;
    with btnCancelar do
      Enabled := True;
  end;
end;

function TfrmVendas_Balcao_Fechamento.ObtemIdNotaSat(Prefixo: String): String;
var
  dsAuxiliar: TDataSet;
  Empresa, Filial: String;
begin
  try
    result := '000000';
    __SuperClass.DBFunctions.GetEntityOwner('SYS_LISTS_ITEMS', Empresa, Filial);
    dsAuxiliar := __SuperClass.DBFunctions.ExecuteQueryByXML
      (Format('select * from SYS_LISTS_ITEMS where EMPRESA = %S and FILIAL = %s and ID = %d and VALOR = %S',
      [QuotedStr(Empresa), QuotedStr(Filial), TL_SERIES_NOTAS_FISCAIS, QuotedStr(ConfiguracaoEstacao.Prefixo)]));

    if Assigned(dsAuxiliar) then
      if not(dsAuxiliar.State in [dsInactive]) then
        if dsAuxiliar.RecordCount > 0 then
          result := dsAuxiliar.FieldByName('DESCRICAO').AsString
        else
          result := '000000'
      else
        result := '000000'
    else
      result := '000000';
  finally
    if Assigned(dsAuxiliar) then
      FreeAndNil(dsAuxiliar);
  end;
end;

function TfrmVendas_Balcao_Fechamento.ObtemValoresInformados: Currency;
var
  Reg: array of TBookMark;
var
  VlrTotal: Currency;
begin
  try
    SetLength(Reg, 2);

    with cdsParcelas do
    begin
      Reg[0] := GetBookmark;
      // DisableControls; Desabilitado pois possui bug no delphi
    end;

    with cdsFormas do
    begin
      Reg[1] := GetBookmark;
      // DisableControls; Desabilitado pois possui bug no delphi
    end;

    VlrTotal := 0;

    with cdsParcelas do
    begin
      First;
      while (not Eof) do
      begin
        with cdsFormas do
        begin
          First;
          while (not Eof) do
          begin
            VlrTotal := VlrTotal + RoundTo(cdsFormasVALOR.AsCurrency, -2);
            Next;
          end;
        end;
        Next;
      end;
    end;

    result := VlrTotal;

  finally

    with cdsParcelas do
    begin
      GotoBookMark(Reg[0]);
      EnableControls;
    end;

    with cdsFormas do
    begin
      GotoBookMark(Reg[1]);
      EnableControls;
    end;

  end;
end;

procedure TfrmVendas_Balcao_Fechamento.CalculaTroco;
begin
  if (RoundTo(cdsDadosRECEBIDO.AsCurrency, -2) > 0) then
    cdsDadosTROCO.AsCurrency := RoundTo(cdsDadosRECEBIDO.AsCurrency - cdsDadosTOTAL.AsCurrency, -2);
end;

function TfrmVendas_Balcao_Fechamento.FinalizaVenda: Boolean;
begin
  result := True;
  try
    with cdsParcelas do
      First;
    with cdsFormas do
      First;
    // Atualizando os dados da venda
    with cdsVendas_Balcao_Dados do
    begin
      Edit;
      FieldByName('CONDICAOPAGAMENTO').AsInteger := cdsDadosCONDICAOPAGAMENTO.AsInteger;
      FieldByName('FORMAPAGAMENTO').AsString := cdsFormasFORMAPAGAMENTO.AsString; // Pega a 1a forma de pagamento
      FieldByName('VALORDESCONTO').AsCurrency := cdsDadosDESCONTO.AsCurrency;
      FieldByName('VALORFRETE').AsCurrency := 0; // Atribui zero pois eh aglutinado nas despesas
      FieldByName('VALORDESPESAS').AsCurrency := cdsDadosACRESCIMO.AsCurrency;
      FieldByName('VALORSEGURO').AsCurrency := 0; // Atribui zero pois eh aglutinado nas despesas
      FieldByName('VALORRECEBIDO').AsCurrency := cdsDadosRECEBIDO.AsCurrency;
      FieldByName('VALORTROCO').AsCurrency := cdsDadosTROCO.AsCurrency;
      FieldByName('PREFIXOECF').AsString := IdNota.Prefixo;
      FieldByName('NUMEROECF').AsString := IntToStr(IdNota.Numero);
      FieldByName('CNPJCPF').AsString := CNPJCPF;
      FieldByName('SITUACAO').AsString := VB_FATURADO_TOTALMENTE;
      Post;
    end;
    // Gravando as parcelas para vendas balcão
    with cdsParcelas do
    begin
      First;
      while not Eof do
      begin
        with cdsVendas_Balcao_Parcelas do
        begin
          Insert;
          FieldByName('PARCELA').AsInteger := cdsParcelasPARCELA.AsInteger;
          FieldByName('VENCIMENTO').AsDateTime := cdsParcelasVENCIMENTO.AsDateTime;
          FieldByName('VENCIMENTOREAL').AsDateTime := cdsParcelasVENCIMENTOREAL.AsDateTime;
          FieldByName('VALOR').AsCurrency := cdsParcelasVALOR.AsCurrency;
          FieldByName('DATACRIACAO').AsDateTime := __SuperClass.ServerDateTime;
          Post;
        end;
        // Gravando as formas de pagamentos para as parcelas
        with cdsFormas do
        begin
          First;
          while not Eof do
          begin
            with cdsVendas_Balcao_Formas do
            begin
              Insert;
              FieldByName('FORMAPAGAMENTO').AsString := cdsFormasFORMAPAGAMENTO.AsString;
              FieldByName('VALOR').AsCurrency := cdsFormasVALOR.AsCurrency;
              FieldByName('PERCENTUAL').AsFloat := cdsFormasPERCENTUAL.AsFloat;
              FieldByName('DOCUMENTO').AsString := cdsFormasDOCUMENTO.AsString;
              FieldByName('BANCO').AsInteger := cdsFormasBANCO.AsInteger;
              FieldByName('AGENCIA').AsString := cdsFormasAGENCIA.AsString;
              FieldByName('CONTA').AsString := cdsFormasCONTA.AsString;
              FieldByName('PROPRIETARIOCHEQUE').AsString := cdsFormasPROPRIETARIO.AsString;
              FieldByName('DATACRIACAO').AsDateTime := __SuperClass.ServerDateTime;
              Post;
            end;
            Next;
          end;
        end;
        Next;
      end;
    end;
  except
    on E: Exception do
      result := False;
  end;
end;

function TfrmVendas_Balcao_Fechamento.ValidaCNPJ(Numero: String): Boolean;
var
  N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12: Integer;
  D1, D2: Integer;
  Digitado, Calculado: string;
begin
  try
    N1 := StrToInt(Numero[1]);
    N2 := StrToInt(Numero[2]);
    N3 := StrToInt(Numero[3]);
    N4 := StrToInt(Numero[4]);
    N5 := StrToInt(Numero[5]);
    N6 := StrToInt(Numero[6]);
    N7 := StrToInt(Numero[7]);
    N8 := StrToInt(Numero[8]);
    N9 := StrToInt(Numero[9]);
    N10 := StrToInt(Numero[10]);
    N11 := StrToInt(Numero[11]);
    N12 := StrToInt(Numero[12]);

    if (N1 = N2) and (N2 = N3) and (N3 = N4) and (N4 = N5) and (N5 = N6) and (N6 = N7) and (N7 = N8) and (N8 = N9) and
      (N9 = N10) and (N10 = N11) and (N11 = N12) then
      result := False
    else
    begin
      D1 := N12 * 2 + N11 * 3 + N10 * 4 + N9 * 5 + N8 * 6 + N7 * 7 + N6 * 8 + N5 * 9 + N4 * 2 + N3 * 3 + N2 * 4 + N1 * 5;
      D1 := 11 - (D1 mod 11);
      if D1 >= 10 then
        D1 := 0;

      D2 := D1 * 2 + N12 * 3 + N11 * 4 + N10 * 5 + N9 * 6 + N8 * 7 + N7 * 8 + N6 * 9 + N5 * 2 + N4 * 3 + N3 * 4 + N2 * 5 + N1 * 6;
      D2 := 11 - (D2 mod 11);
      if D2 >= 10 then
        D2 := 0;

      Calculado := IntToStr(D1) + IntToStr(D2);
      Digitado := Numero[13] + Numero[14];
      result := Calculado = Digitado;
    end;
  except
    result := False;
  end;

  if not result then
    __SuperClass.GenericsF.DisplayMessage('CNPJ inválido.', '', 'Informe o CNPJ novamente.', 'Informação', MB_ICONEXCLAMATION);
end;

function TfrmVendas_Balcao_Fechamento.ValidaCPF(Numero: String): Boolean;
var
  N1, N2, N3, N4, N5, N6, N7, N8, N9: Integer;
  D1, D2: Integer;
  Digitado, Calculado: string;
begin
  try
    N1 := StrToInt(Numero[1]);
    N2 := StrToInt(Numero[2]);
    N3 := StrToInt(Numero[3]);
    N4 := StrToInt(Numero[4]);
    N5 := StrToInt(Numero[5]);
    N6 := StrToInt(Numero[6]);
    N7 := StrToInt(Numero[7]);
    N8 := StrToInt(Numero[8]);
    N9 := StrToInt(Numero[9]);

    if (N1 = N2) and (N2 = N3) and (N3 = N4) and (N4 = N5) and (N5 = N6) and (N6 = N7) and (N7 = N8) and (N8 = N9) then
      result := False
    else
    begin
      D1 := N9 * 2 + N8 * 3 + N7 * 4 + N6 * 5 + N5 * 6 + N4 * 7 + N3 * 8 + N2 * 9 + N1 * 10;
      D1 := 11 - (D1 mod 11);
      if D1 >= 10 then
        D1 := 0;

      D2 := D1 * 2 + N9 * 3 + N8 * 4 + N7 * 5 + N6 * 6 + N5 * 7 + N4 * 8 + N3 * 9 + N2 * 10 + N1 * 11;
      D2 := 11 - (D2 mod 11);
      if D2 >= 10 then
        D2 := 0;

      Calculado := IntToStr(D1) + IntToStr(D2);
      Digitado := Numero[10] + Numero[11];

      result := Calculado = Digitado;
    end;
  except
    result := False;
  end;

  if not result then
    __SuperClass.GenericsF.DisplayMessage('CPF inválido.', '', 'Informe o CPF novamente.', 'Informação', MB_ICONEXCLAMATION);
end;

function TfrmVendas_Balcao_Fechamento.ValidaFormas: Boolean;
var
  Reg: array of TBookMark;
  Falha: Boolean;
begin
  Falha := False;
  try
    SetLength(Reg, 2);
    with cdsParcelas do
    begin
      Reg[0] := GetBookmark;
      DisableControls;
    end;

    with cdsFormas do
    begin
      Reg[1] := GetBookmark;
      DisableControls;
    end;

    with cdsParcelas do
    begin
      DisableControls;
      First;
      while (not Eof) do
      begin
        with cdsFormas do
        begin
          DisableControls;
          First;
          while (not Eof) do
          begin
            if (Pos('CHEQUE', cdsFormasDESCRICAO.AsString) > 0) then
            begin
              if (InformaChequeECF) then
              begin
                if ((cdsFormasBANCO.AsInteger = 0) or (cdsFormasAGENCIA.AsString = '') or (cdsFormasCONTA.AsString = '')) then
                begin
                  __SuperClass.GenericsF.DisplayMessage('Banco/Agência/Conta do cheque não preenchidos corretamente.', '',
                    Format('Verifique os dados informados na parcela %d forma de pagamento %s.', [cdsParcelasPARCELA.AsInteger,
                    cdsFormasFORMAPAGAMENTO.AsString]), 'Informação', MB_ICONEXCLAMATION);
                  Falha := True;
                end;
              end;
            end;
            Next;
          end;
          EnableControls;
        end;
        Next;
      end;
      EnableControls;
    end;
    result := not Falha;
  finally

    with cdsParcelas do
    begin
      GotoBookMark(Reg[0]);
      EnableControls;
    end;

    with cdsFormas do
    begin
      GotoBookMark(Reg[1]);
      EnableControls;
    end;
  end;
end;

{$REGION 'Inicialização/Finalização da classe'}

initialization

RegisterClass(TfrmVendas_Balcao_Fechamento);

finalization

UnRegisterClass(TfrmVendas_Balcao_Fechamento);
{$ENDREGION}

end.
