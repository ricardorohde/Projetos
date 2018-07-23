unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IBDatabase, DB, IBCustomDataSet, IBQuery, IBSQLMonitor,
  IBEvents, DBClient, Grids, DBGrids, FIBSQLMonitor;

type
  TForm1 = class(TForm)
    IBQuery1: TIBQuery;
    IBSQLMonitor1: TIBSQLMonitor;
    Transacao: TIBTransaction;
    sqs2000: TIBDatabase;
    ListBox1: TListBox;
    FIBSQLMonitor1: TFIBSQLMonitor;
    procedure Button1Click(Sender: TObject);
    procedure IBSQLMonitor1SQL(EventText: string; EventTime: TDateTime);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FIBSQLMonitor1SQL(EventText: string; EventTime: TDateTime);
  private
    { Private declarations }
//    Sl: TStringList;


    Function RetirarAcento(Valor : String):String;
    function TrocaCaracterEspecial(aTexto : string; aLimExt : boolean) : string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
//var
//  i: Integer;
//  Teste: TDateTime;
begin
//  Sl.SaveToFile(ExtractFilePath(Application.ExeName)+ 'log.txt');

(*  Teste:= Now;
  for I := 0 to 10000 do
  begin
    IBQuery1.Close;
    IBQuery1.SQL.Clear;
    IBQuery1.SQL.Text:= ' SELECT CP.DATA_DO_VENCIMENTO,'
    +'        CP.NUMERO_DE_LANCAMENTO_CP,'
    +'        CP.CODIGO_DO_PROPRIETARIO,'
    +'        CP.CODIGO_DO_IMOVEL,'
    +'        CP.TIPO_DE_CONTA,'
    +'        CP.CHAVE,'
    +'        CP.CODIGO_DO_FORNECEDOR,'
    +'        CP.CODIGO_FORNECEDOR_FAVOREC,'
    +'        CP.CODIGO_DO_BANCO,'
    +'        CP.CODIGO_DA_AGENCIA,'
    +'        CP.NUMERO_DA_CONTA_CORRENTE,'
    +'        CP.CODIGO_FORMA_PAG,'
    +'        CP.CODIGO_DO_HISTORICO_PADRA,'
    +'        CP.REFERENCIA_PARCELA,'
    +'        CP.COMPLEMENTO,'
    +'        CP.VALOR,'
    +'        CP.CODIGO_UNIDADE_CONSUMO,'
    +'        CP.QUANTIDADE_DE_CONSUMO,'
    +'        CP.DIAS_DE_CONSUMO,'
    +'        CP.NUMERO_DE_MATRICULA,'
    +'        CP.RECOLHE_INSS,'
    +'        CP.RECOLHE_ISS,'
    +'        CP.MESES_CALCULO_MEDIA,'
    +'        CP.PERIODICIDADE,'
    +'        CP.REPASSE,'
    +'        CP.VENCIMENTO,'
    +'        CP.REFERENCIA_REPASSE,'
    +'        CP.VALOR_REPASSE,'
    +'        CP.NUMERO_VOUCHER,'
    +'        CP.NUMERO_CHEQUE,'
    +'        CP.AUTORIZADO_VOUCHER,'
    +'        CP.INCREMENTADO,'
    +'        CP.BAIXADO,'
    +'        CP.VALOR_BASE_CTPAG,'
    +'        CP.VALOR_BASE_REP,'
    +'        CP.REPASSADO,'
    +'        CP.CODIGO_DE_BARRAS,'
    +'        CP.CONCILIACAO,'
    +'        CP.DATA_CONCILIADO,'
    +'        CP.LANCAMENTO_CP_ORIGEM,'
    +'        CP.DIA_BASE_VENCTO,'
    +'        PER.DESCRICAO_DA_PERIODICIDAD,'
    +'        PROP.NOME_DA_ENTIDADE AS PROPRIETARIO,'
    +'        HP.DESC_HISTORICO_PADRAO,'
    +'        ENT1.NOME_DA_ENTIDADE || COALESCE('' - '' || ENT1.CPF, '' - '' || ENT1.CGC, '''') FORNECEDOR,'
    +'        ENT2.NOME_DA_ENTIDADE || COALESCE('' - '' || ENT2.CPF, '' - '' || ENT2.CGC, '''') FAVORECIDO,'
    +'        IM.TITULO_DO_IMOVEL,'
    +'        IM.SITUACAO SITUACAO_IMOVEL,'
    +'        UC.DESCRICAO_UNIDADE_CONSUMO,'
    +'        FP.DESCRICAO_FORMA_PAG,'
    +'        CP.IDENTIFICADOR,'
    +'        CP.CODIGO_TIPO_DOC,'
    +'        COALESCE((SELECT GR_TIPO_PAGAMENTO.DESCRICAO_TIPO_PAGAMENTO'
    +'                  FROM GR_TIPO_PAGAMENTO'
    +'                  WHERE GR_TIPO_PAGAMENTO.CODIGO_TIPO_PAGAMENTO = CP.CODIGO_TIPO_DOC AND'
    +'                        GR_TIPO_PAGAMENTO.CODIGO_FORMA_PAGAMENTO = CP.CODIGO_FORMA_PAG), '''') AS DESC_TIPO_PAGAMENTO,'
    +'        V.DATA_PAGAMENTO,'
    +'        V.DATA_BAIXA,'
    +'        CP.CODIGO_DA_INSTALACAO,'
    +'        CP.DESMEMBRAMENTO,'
    +'        CP.VALOR_ORIGEM_DESMEMBRAMENTO,'
    +'        CP.DESMEMBRAMENTO_PARTILHA,'
    +'        PROP.SITUACAO,'
    +'        FP.CONTAS_PAGAR_ELETRONICO,'
    +'        CP.SEQUENCIAL_CONTA_CORRENTE,'
    +'        CP.URL_NOTAFISCAL,'
    +'        CP.ID_IMAGEM_BASEDOC,'
    +'        CP.CODIGO_ETIQUETA_PRE_IMPRESSA,'
    +'        UUID_TO_CHAR(CP.ID_IMAGEM_BASEDOC) CID,'
    +'        CP.PRIORIDADE_PGTO,'
    +'        CP.DATA_EMISSAO_NF,'
    +'        CP.NUMERO_NOTA_FISCAL,'
    +'        CP.BASE_CALCULO_IMPOSTO'
    +' FROM GR_CONTAS_PAGAR CP'
    +'    INNER JOIN LC_HISTORICO_PADRAO HP ON (CP.CODIGO_DO_HISTORICO_PADRA = HP.CODIGO_HISTORICO_PADRAO)'
    +'    LEFT OUTER JOIN GR_ENTIDADE ENT1 ON (CP.CODIGO_DO_FORNECEDOR = ENT1.CODIGO_DA_ENTIDADE)'
    +'    LEFT OUTER JOIN GR_ENTIDADE ENT2 ON (CP.CODIGO_FORNECEDOR_FAVOREC = ENT2.CODIGO_DA_ENTIDADE)'
    +'    INNER JOIN GR_ENTIDADE PROP ON (CP.CODIGO_DO_PROPRIETARIO = PROP.CODIGO_DA_ENTIDADE)'
    +'    LEFT OUTER JOIN GR_IMOVEL IM ON (CP.CODIGO_DO_IMOVEL = IM.CODIGO_DO_IMOVEL)'
    +'    LEFT OUTER JOIN GR_FORMA_PAGAMENTO FP ON (CP.CODIGO_FORMA_PAG = FP.CODIGO_FORMA_PAG)'
    +'    LEFT OUTER JOIN GR_UNIDADE_CONSUMO UC ON (CP.CODIGO_UNIDADE_CONSUMO = UC.CODIGO_UNIDADE_CONSUMO)'
    +'    LEFT JOIN GR_PERIODICIDADE PER ON (CP.PERIODICIDADE = PER.CODIGO_DA_PERIODIDICADE)'
    +'    LEFT JOIN GR_VOUCHER V ON (CP.NUMERO_VOUCHER = V.SEQUENCIAL_DO_VOUCHER)   '
    +'  Where (CP.DATA_DO_VENCIMENTO BETWEEN ''12/01/2017'' AND ''12/31/2017'')  and ((CP.DESMEMBRAMENTO IS NULL) AND (LANCAMENTO_CP_ORIGEM IS NULL))'
    +'  AND CP.BAIXADO = 0 ORDER BY CP.DATA_DO_VENCIMENTO,CP.NUMERO_DE_LANCAMENTO_CP ';



//    IBQuery1.SQL.Add('SELECT CP.DATA_DO_VENCIMENTO,');
//    IBQuery1.SQL.Add('       CP.NUMERO_DE_LANCAMENTO_CP,');
//    IBQuery1.SQL.Add('       CP.CODIGO_DO_PROPRIETARIO,');
//    IBQuery1.SQL.Add('       CP.CODIGO_DO_IMOVEL,');
//    IBQuery1.SQL.Add('       CP.TIPO_DE_CONTA,');
//    IBQuery1.SQL.Add('       CP.CHAVE,');
//    IBQuery1.SQL.Add('       CP.CODIGO_DO_FORNECEDOR,');
//    IBQuery1.SQL.Add('       CP.CODIGO_FORNECEDOR_FAVOREC,');
//    IBQuery1.SQL.Add('       CP.CODIGO_DO_BANCO,');
//    IBQuery1.SQL.Add('       CP.CODIGO_DA_AGENCIA,');
//    IBQuery1.SQL.Add('       CP.NUMERO_DA_CONTA_CORRENTE,');
//    IBQuery1.SQL.Add('       CP.CODIGO_FORMA_PAG,');
//    IBQuery1.SQL.Add('       CP.CODIGO_DO_HISTORICO_PADRA,');
//    IBQuery1.SQL.Add('       CP.REFERENCIA_PARCELA,');
//    IBQuery1.SQL.Add('       CP.COMPLEMENTO,');
//    IBQuery1.SQL.Add('       CP.VALOR,');
//    IBQuery1.SQL.Add('       CP.CODIGO_UNIDADE_CONSUMO,');
//    IBQuery1.SQL.Add('       CP.QUANTIDADE_DE_CONSUMO,');
//    IBQuery1.SQL.Add('       CP.DIAS_DE_CONSUMO,');
//    IBQuery1.SQL.Add('       CP.NUMERO_DE_MATRICULA,');
//    IBQuery1.SQL.Add('       CP.RECOLHE_INSS,');
//    IBQuery1.SQL.Add('       CP.RECOLHE_ISS,');
//    IBQuery1.SQL.Add('       CP.MESES_CALCULO_MEDIA,');
//    IBQuery1.SQL.Add('       CP.PERIODICIDADE,');
//    IBQuery1.SQL.Add('       CP.REPASSE,');
//    IBQuery1.SQL.Add('       CP.VENCIMENTO,');
//    IBQuery1.SQL.Add('       CP.REFERENCIA_REPASSE,');
//    IBQuery1.SQL.Add('       CP.VALOR_REPASSE,');
//    IBQuery1.SQL.Add('       CP.NUMERO_VOUCHER,');
//    IBQuery1.SQL.Add('       CP.NUMERO_CHEQUE,');
//    IBQuery1.SQL.Add('       CP.AUTORIZADO_VOUCHER,');
//    IBQuery1.SQL.Add('       CP.INCREMENTADO,');
//    IBQuery1.SQL.Add('       CP.BAIXADO,');
//    IBQuery1.SQL.Add('       CP.VALOR_BASE_CTPAG,');
//    IBQuery1.SQL.Add('       CP.VALOR_BASE_REP,');
//    IBQuery1.SQL.Add('       CP.REPASSADO,');
//    IBQuery1.SQL.Add('       CP.CODIGO_DE_BARRAS,');
//    IBQuery1.SQL.Add('       CP.CONCILIACAO,');
//    IBQuery1.SQL.Add('       CP.DATA_CONCILIADO,');
//    IBQuery1.SQL.Add('       CP.LANCAMENTO_CP_ORIGEM,');
//    IBQuery1.SQL.Add('       CP.DIA_BASE_VENCTO,');
//    IBQuery1.SQL.Add('       PER.DESCRICAO_DA_PERIODICIDAD,');
//    IBQuery1.SQL.Add('       PROP.NOME_DA_ENTIDADE AS PROPRIETARIO,');
//    IBQuery1.SQL.Add('       HP.DESC_HISTORICO_PADRAO,');
//    IBQuery1.SQL.Add('       ENT1.NOME_DA_ENTIDADE || COALESCE('' - '' || ENT1.CPF, '' - '' || ENT1.CGC, '''') FORNECEDOR,');
//    IBQuery1.SQL.Add('       ENT2.NOME_DA_ENTIDADE || COALESCE('' - '' || ENT2.CPF, '' - '' || ENT2.CGC, '''') FAVORECIDO,');
//    IBQuery1.SQL.Add('       IM.TITULO_DO_IMOVEL,');
//    IBQuery1.SQL.Add('       IM.SITUACAO SITUACAO_IMOVEL,');
//    IBQuery1.SQL.Add('       UC.DESCRICAO_UNIDADE_CONSUMO,');
//    IBQuery1.SQL.Add('       FP.DESCRICAO_FORMA_PAG,');
//    IBQuery1.SQL.Add('       CP.IDENTIFICADOR,');
//    IBQuery1.SQL.Add('       CP.CODIGO_TIPO_DOC,');
//    IBQuery1.SQL.Add('       COALESCE((SELECT GR_TIPO_PAGAMENTO.DESCRICAO_TIPO_PAGAMENTO');
//    IBQuery1.SQL.Add('                 FROM GR_TIPO_PAGAMENTO');
//    IBQuery1.SQL.Add('                 WHERE GR_TIPO_PAGAMENTO.CODIGO_TIPO_PAGAMENTO = CP.CODIGO_TIPO_DOC AND');
//    IBQuery1.SQL.Add('                       GR_TIPO_PAGAMENTO.CODIGO_FORMA_PAGAMENTO = CP.CODIGO_FORMA_PAG), '''') AS DESC_TIPO_PAGAMENTO,');
//    IBQuery1.SQL.Add('       V.DATA_PAGAMENTO,');
//    IBQuery1.SQL.Add('       V.DATA_BAIXA,');
//    IBQuery1.SQL.Add('       CP.CODIGO_DA_INSTALACAO,');
//    IBQuery1.SQL.Add('       CP.DESMEMBRAMENTO,');
//    IBQuery1.SQL.Add('       CP.VALOR_ORIGEM_DESMEMBRAMENTO,');
//    IBQuery1.SQL.Add('       CP.DESMEMBRAMENTO_PARTILHA,');
//    IBQuery1.SQL.Add('       PROP.SITUACAO,');
//    IBQuery1.SQL.Add('       FP.CONTAS_PAGAR_ELETRONICO,');
//    IBQuery1.SQL.Add('       CP.SEQUENCIAL_CONTA_CORRENTE,');
//    IBQuery1.SQL.Add('       CP.URL_NOTAFISCAL,');
//    IBQuery1.SQL.Add('       CP.ID_IMAGEM_BASEDOC,');
//    IBQuery1.SQL.Add('       CP.CODIGO_ETIQUETA_PRE_IMPRESSA,');
//    IBQuery1.SQL.Add('       UUID_TO_CHAR(CP.ID_IMAGEM_BASEDOC) CID,');
//    IBQuery1.SQL.Add('       CP.PRIORIDADE_PGTO,');
//    IBQuery1.SQL.Add('       CP.DATA_EMISSAO_NF,');
//    IBQuery1.SQL.Add('       CP.NUMERO_NOTA_FISCAL,');
//    IBQuery1.SQL.Add('       CP.BASE_CALCULO_IMPOSTO');
//    IBQuery1.SQL.Add('FROM GR_CONTAS_PAGAR CP');
//    IBQuery1.SQL.Add('   INNER JOIN LC_HISTORICO_PADRAO HP ON (CP.CODIGO_DO_HISTORICO_PADRA = HP.CODIGO_HISTORICO_PADRAO)');
//    IBQuery1.SQL.Add('   LEFT OUTER JOIN GR_ENTIDADE ENT1 ON (CP.CODIGO_DO_FORNECEDOR = ENT1.CODIGO_DA_ENTIDADE)');
//    IBQuery1.SQL.Add('   LEFT OUTER JOIN GR_ENTIDADE ENT2 ON (CP.CODIGO_FORNECEDOR_FAVOREC = ENT2.CODIGO_DA_ENTIDADE)');
//    IBQuery1.SQL.Add('   INNER JOIN GR_ENTIDADE PROP ON (CP.CODIGO_DO_PROPRIETARIO = PROP.CODIGO_DA_ENTIDADE)');
//    IBQuery1.SQL.Add('   LEFT OUTER JOIN GR_IMOVEL IM ON (CP.CODIGO_DO_IMOVEL = IM.CODIGO_DO_IMOVEL)');
//    IBQuery1.SQL.Add('   LEFT OUTER JOIN GR_FORMA_PAGAMENTO FP ON (CP.CODIGO_FORMA_PAG = FP.CODIGO_FORMA_PAG)');
//    IBQuery1.SQL.Add('   LEFT OUTER JOIN GR_UNIDADE_CONSUMO UC ON (CP.CODIGO_UNIDADE_CONSUMO = UC.CODIGO_UNIDADE_CONSUMO)');
//    IBQuery1.SQL.Add('   LEFT JOIN GR_PERIODICIDADE PER ON (CP.PERIODICIDADE = PER.CODIGO_DA_PERIODIDICADE)');
//    IBQuery1.SQL.Add('   LEFT JOIN GR_VOUCHER V ON (CP.NUMERO_VOUCHER = V.SEQUENCIAL_DO_VOUCHER)');
//    IBQuery1.SQL.Add(' Where (CP.DATA_DO_VENCIMENTO BETWEEN ''12/01/2017'' AND ''12/31/2017'')  and ((CP.DESMEMBRAMENTO IS NULL) AND (LANCAMENTO_CP_ORIGEM IS NULL))');
//    IBQuery1.SQL.Add(' AND CP.BAIXADO = 0 ORDER BY CP.DATA_DO_VENCIMENTO,CP.NUMERO_DE_LANCAMENTO_CP');
    IBQuery1.Open
  end;

  ShowMessage(FormatDateTime('hh:mm:ss:zzz', now - Teste));*)
end;

procedure TForm1.FIBSQLMonitor1SQL(EventText: string; EventTime: TDateTime);
begin
//var
//  i: Integer;
//  StrAux: string;
//  ArrayOfChar: Array of Char;
//begin
//  SetLength(ArrayOfChar, Length(EventText));
//
//  for I := 0 to Length(EventText) do
//    if (EventText[i] <> #0) then
//      StrAux:= StrAux + EventText[i];
//
//  //  StrAux:= StringReplace(NativeStringToUTF8(EventText), #10, '', [rfReplaceAll]);
//  StrAux:= StringReplace(StrAux, #$D#$A, '', [rfReplaceAll]);
////  StrAux:= StringReplace(StrAux, Chr(39)+Chr(39), '', [rfReplaceAll]);
////  StrAux:= StringReplace(StrAux, #13, '', [rfReplaceAll]);
////  StrAux:= StringReplace(StrAux, #10#13, '', [rfReplaceAll]);
////  Sl.Add(FormatDateTime('hh:mm:ss:zzz', EventTime)+ ' : ' + EventText);
//  ListBox1.Items.Add(FormatDateTime('hh:mm:ss:zzz', EventTime)+ ' : ' + StrAux);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  FreeAndNil(Sl);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  ListBox1.Items.Clear;
//  Sl:= TStringList.Create;
end;

function UTF8ToNativeString(AUTF8String: AnsiString): String;
begin
//  {$IfDef FPC}
//   Result := AUTF8String;  // FPC usa UTF8 de forma nativa
//  {$Else}
//   {$IfDef UNICODE}
//    {$IfDef DELPHI12_UP}  // delphi 2009 em diante
     Result := UTF8ToString(AUTF8String);
//    {$Else}
//     Result := UTF8Decode(AUTF8String);
//    {$EndIf}
//   {$Else}
//    Result := Utf8ToAnsi(AUTF8String) ;
//   {$EndIf}
//  {$EndIf}
end;

function NativeStringToUTF8( AString : String ) : AnsiString;
//{$IFNDEF FPC}
// {$IFDEF UNICODE}
  var
    RBS: RawByteString;
// {$ENDIF}
//{$ENDIF}
begin
//  {$IFDEF FPC}
//    Result := AString;  // FPC usa UTF8 de forma nativa
//  {$ELSE}
//    {$IFDEF UNICODE}
      RBS := UTF8Encode(AString);
      SetCodePage(RBS, 0, False);
      Result := AnsiString(RBS);
//    {$ELSE}
//      Result := UTF8Encode(AString);
//    {$ENDIF}
//  {$ENDIF}
end;

procedure TForm1.IBSQLMonitor1SQL(EventText: string; EventTime: TDateTime);
var
  i: Integer;
  StrAux: string;
  ArrayOfChar: Array of Char;
begin
  SetLength(ArrayOfChar, Length(EventText));

  for I := 0 to Length(EventText) do
    if (EventText[i] <> #0) then
      StrAux:= StrAux + EventText[i];

  //  StrAux:= StringReplace(NativeStringToUTF8(EventText), #10, '', [rfReplaceAll]);
  StrAux:= StringReplace(StrAux, #$D#$A, '', [rfReplaceAll]);
//  StrAux:= StringReplace(StrAux, Chr(39)+Chr(39), '', [rfReplaceAll]);
//  StrAux:= StringReplace(StrAux, #13, '', [rfReplaceAll]);
//  StrAux:= StringReplace(StrAux, #10#13, '', [rfReplaceAll]);
//  Sl.Add(FormatDateTime('hh:mm:ss:zzz', EventTime)+ ' : ' + EventText);
  ListBox1.Items.Add(FormatDateTime('hh:mm:ss:zzz', EventTime)+ ' : ' + StrAux);
end;

Function TForm1.RetirarAcento(Valor : String):String;
  const CR = #13;
  const LF = #10;
  const CRLF = #13#10;
begin
  Valor := StringReplace(Valor, 'Â','A', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'â','a', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Ê','E', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'ê','e', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Î','I', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'î','i', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Ô','O', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'ô','o', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Û','U', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'û','u', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Á','A', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'á','a', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'É','E', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'é','e', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Í','I', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'í','i', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Ó','O', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'ó','o', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Ú','U', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'ú','u', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'ç','c', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Ç','C', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'À','A', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'à','a', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'È','E', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'è','e', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Ì','I', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'ì','i', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Ò','O', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'ò','o', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Ù','U', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'ù','u', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Ä','A', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'ä','a', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Ë','E', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'ë','e', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Ï','I', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'ï','i', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Ö','O', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'ö','o', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Ü','U', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'ü','u', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Ã','A', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'ã','a', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'Õ','O', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'õ','o', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'ª','a', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'º','o', [rfReplaceAll]);
  Valor := StringReplace(Valor, '&',' ', [rfReplaceAll]);
  Valor := StringReplace(Valor, 'º','o', [rfReplaceAll]);
  Valor := StringReplace(Valor, CR,' ', [rfReplaceAll]);
  Valor := StringReplace(Valor, LF,' ', [rfReplaceAll]);
  Valor := StringReplace(Valor, CRLF, ' ', [rfReplaceAll]);
  Valor := TrocaCaracterEspecial(valor, True);
  result:= UTF8ToString(Valor);
end;

function TForm1.TrocaCaracterEspecial(aTexto : string; aLimExt : boolean) : string;
const
  //Lista de caracteres especiais
  xCarEsp: array[1..38] of String = ('á', 'à', 'ã', 'â', 'ä','Á', 'À', 'Ã', 'Â', 'Ä',
                                     'é', 'è','É', 'È','í', 'ì','Í', 'Ì',
                                     'ó', 'ò', 'ö','õ', 'ô','Ó', 'Ò', 'Ö', 'Õ', 'Ô',
                                     'ú', 'ù', 'ü','Ú','Ù', 'Ü','ç','Ç','ñ','Ñ');
  //Lista de caracteres para troca
  xCarTro: array[1..38] of String = ('a', 'a', 'a', 'a', 'a','A', 'A', 'A', 'A', 'A',
                                     'e', 'e','E', 'E','i', 'i','I', 'I',
                                     'o', 'o', 'o','o', 'o','O', 'O', 'O', 'O', 'O',
                                     'u', 'u', 'u','u','u', 'u','c','C','n', 'N');
  //Lista de Caracteres Extras
  xCarExt: array[1..48] of string = ('<','>','!','@','#','$','%','¨','&','*',
                                     '(',')','_','+','=','{','}','[',']','?',
                                     ';',':',',','|','*','"','~','^','´','`',
                                     '¨','æ','Æ','ø','£','Ø','ƒ','ª','º','¿',
                                     '®','½','¼','ß','µ','þ','ý','Ý');
var
  xTexto : string;
  i : Integer;
begin
   xTexto := aTexto;
   for i:=1 to 38 do
     xTexto := StringReplace(xTexto, xCarEsp[i], xCarTro[i], [rfReplaceAll]);
   //De acordo com o parâmetro aLimExt, elimina caracteres extras.
   if (aLimExt) then
     for i:=1 to 48 do
       xTexto := StringReplace(xTexto, xCarExt[i], '', [rfReplaceAll]);
   Result := xTexto;
end;

end.
