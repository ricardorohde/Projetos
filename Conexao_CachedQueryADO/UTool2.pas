unit uTool2;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, DBTables, Dialogs,
  StdCtrls, ExtCtrls, DBConsts, DBCtrls, Registry, Cript, uDeclara, shellApi,Variants,
  dbGrids, db, comctrls{,ELibFnc}, messages,inifiles, utool, dbErro, {gtQRCtrls,}DeclaraType;

//  type
//
//  TReg_Campo = record
//     NOTABELA         : String;
//     NOCAMPO          : string;
//     DSCAMPO          : string;
//     CDTIPO_DADO      : string;
//     NRTAMANHO        : integer;
//     NRDECIMAIS       : integer;
//     SNOBRIGATORIO    : string;
//     SNCHAVE_PRIMARIA : string;
//     NOSEQUENCIA      : string;
//     CDTIPO_DOMINIO   : integer;
//     TXVALOR_PADRAO   : string;
//     VLMINIMO         : real;
//     VLMAXIMO         : real;
//     TXOBSERVACAO     : string;
//  end;
//
//  TaCampos = array of TReg_Campo;
//
//  TReg_Manutencao_Blob = record
//     NOCAMPO           : String;
//     VLATUAL           : Variant;
//  end;
//
//  TReg_Programa = record
//     CDPROGRAMA              : string;
//     NOPROGRAMA              : string;
//     NOABREVIADO             : string;
//     NOTABELA                : string[30];
//     NOTABELA_AUXILIAR       : String[30];
//     SNPROGRAMA_SISTEMA      : String[1];
//     SNGERAL                 : string[1];
//     SNFILTRO_OBRIGATORIO    : string[1];
//     SNPROGRAMA_LOGICO       : string[1];
//     CDPROGRAMA_FISICO       : string;
//     TXPARAMETRO             : string;
//     NRINDICE_ICONE          : integer;
//     CDMODULO                : string;
//     SNGRAVA_LOG_MANUTENCAO  : String[1];
//     SNCONFIRMACAO_INCLUSAO  : String[1];
//     SNCONFIRMACAO_EXCLUSAO  : String[1];
//     SNCONFIRMACAO_ALTERACAO : String[1];
//     SNINCLUIR               : string[1];
//     SNALTERAR               : string[1];
//     SNEXCLUIR               : string[1];
//     SNCONSULTAR             : string[1];
//     SNTELA_SEMPRE_ONLINE    : string[1];
//  end;

  // Verificacao de Digito
  function CPFOK(CPF: string): Boolean;
  function CGCOK(CGC: string): Boolean;
  function INSSOK(INSS: string): Boolean;
  function EMAILOK(psEMail: string):boolean;
  function FrequentFlyerOK( psFrequentFlyer : string; piCdTipo_Validacao : integer ) : boolean;
  function FrequentFlyerOK_AA( psFrequentFlyer : string ) : boolean;
  function FrequentFlyerOK_TAM( psFrequentFlyer : string ) : boolean;
  function FrequentFlyerOK_Varig( psFrequentFlyer : string ) : boolean;
  function FrequentFlyerOK_Tap( psFrequentFlyer : string ) : boolean;
  function NumeroNoAir( psNumeroNoAir : string; piCdTipo_Validacao : string ) : boolean;
  function NumeroAClub( psNumeroNoAir : string ) : boolean;
  function chartoEBCDIC ( pcChar : char ) : integer;
  //

  // Registro
  function FindRegistry( raiz : DWORD; Chave, valor : String): string;
  procedure PostRegistry(Chave , Value: string);
  //

  // Mensagens
  procedure MsgAviso(Mensagem: PChar);
  //

  // String / Caracter
  function RemoveChar(Value : string; Ch : Char): string;
  function RemoveAcentuacao(Value : string): string;
  function ClearChar(S: string): string;
  function FillStr(Value: string; Ch: Char; Contador: Integer; Left: Boolean): string;
  function parentesis( psString : string; pbSpaces : boolean = true) : string;
  procedure Ordena_Tstrings(pStrings:TStrings);
  procedure Muda_Cor_Palavras_RichEdit(psLista_Palavras:string;pRE:TRichEdit;pCor:TColor);
  procedure Muda_Cor_Texo_RichEdit(pRE:TRichEdit;pCor:TColor);
//  function Tira_Caracteres_Controle(psNome:string):string;
  //

  // Datas
  function  MiliSegundoshora(milisegundo: LongInt): string;  
  function  DiasNoMes(piMes , piAno : Integer): Integer;
  function  CalculaData(DtaIni : tDatetime; QtdMes : Integer): TDatetime;
  function  strtoSafra ( psSafra : string ) : integer;
  function  SafraToStr ( piSafra : integer ) : String;
  function  StrZero(Zeros:string;Quant:integer):String;
  function  Formata_Safra ( pSafra : integer ) : string;
  function  Formata_Safra_Expiracao ( pSafra : integer ) : string;
  function  Datetosafra( pdata : tDateTime ) : integer;
  function  Inicio_Safra(pSafra : integer) :TDateTime;
  function  Fim_Safra(pSafra : integer) :TDateTime;

  function  incSafra(pSafra : integer; pIncremento : word = 1) : integer;
  function  DecSafra(pSafra : integer; pDecremento : word = 1) : integer;

  function  Periodo_Conflitante ( pP1DtInicio,pP1DtFim,pP2DtInicio,pP2DtFim:TDateTime):boolean;
  function Data_Periodo( pDtReferencia, pDtInicio, pDtFim : TDateTime) : boolean;
  //function  Data_no_Periodo ( pDtReferencia, pDtInicio, pDtFim : TDateTime;
                              //pNomeData : string; var pMsg : string ) : boolean;overload;
  function  Meses_Entre_Datas(pDtInicio, pDtFim:TDateTime): Integer;
  //

  // Ambiente
  function GetComp : string;
  function ExistInstance(Value : string): boolean;
  function ExistSameInstance(Value, Cap : string): boolean;
  //

  procedure Muda_CampoGrid(pGrid : TDBGrid; pNome_Original,pNovo_Nome,pCaption:string);
  procedure Carrega_Campo( pDataset : TDataSet; psNoCampo : string;
                           pValor : Variant; pbVerificaCampo : boolean);
  // Conexao
  function ConectaDb( Sender : TObject;pDataBase : TDataBase; psDriverName, psParametros, psPassword : string;
                      psMensagemErro : string = 'Erro Conectando ao Banco de Dados') : boolean;
  //

  function DelTree(Dir : String ): Boolean;
  function isNull( pvVariavel : variant) : boolean;
  function  Intervalo_Conflitante ( pI1VlInicio,pI1VlFim,pI2VlInicio,pI2VlFim:real):boolean;

  function PoeFoco( pComp : TWinControl) : boolean;
  procedure Posiciona(pComponente,pParent:TWinControl;pTab_Order,pLeft,pTop,pWidth:integer);
//  function Cria_QrLabel(Owner : TComponent; pParent : TWinControl ;psCaption: string;prLeft,prTop,prHeight,prwidth : real; pbBold : boolean = false) : TgtQRLabel;

  procedure LimpaTreeView(ptv:TtreeView);

  procedure Envia_Email( psDestinatario, psAssunto, psCorpo_Mensagem : string;
                         psAttachment : string =''; psCopia : string = ''; psCopia_oculta : string = '');



  implementation

function MiliSegundoshora(milisegundo: LongInt): string;
var
 Hrs,Minut,Seg,MSeg: word;
 Tempo: String;
begin
 Hrs := milisegundo div 3600000;
 milisegundo := milisegundo mod 3600000;
 Minut:= milisegundo div 60000;
 milisegundo := milisegundo mod 60000;
 Seg := milisegundo div 1000;
 MSeg := milisegundo mod 1000;

 if Hrs > 0 then
  Tempo := IntToStr(Hrs) + 'hs ';
 if Minut > 0 then
  Tempo := Tempo + IntToStr(Minut) + 'min ';
 if Seg > 0 then
  Tempo := Tempo + IntToStr(Seg) + 's ';
 if MSeg > 0 then
  Tempo := Tempo + IntToStr(MSeg) + 'ms ';

 Result := Tempo;
end;

{
  Funcao isNull
  objetivo   : verifica se uma variate e nula ou vazia
  Parametros : pvVariavel : variante a ser verificada
  retorno    : verdadeiro se a variante for nula
}
function isNull( pvVariavel : variant) : boolean;
begin
  result := VarIsEmpty(pvVariavel) or
            VarIsNull(pvVariavel) or
            ( ( varType(pvVariavel) = varString  ) and ( pvVariavel = '' ) );
end;

procedure MsgAviso(Mensagem: PChar);
begin
  Application.MessageBox(Mensagem,'Aviso',mb_OK);
end;

function FindRegistry( raiz : DWORD; Chave, valor : String): string;
var
  ProductReg : TRegistry;
begin
  ProductReg := TRegistry.Create;
  with ProductReg do
  begin
    RootKey := Raiz;
    if OpenKey(Chave,False)
    then result := ReadString(valor);
  end;
  ProductReg.Free;
end;

procedure PostRegistry(Chave , Value: string);
var
  ProductReg : TRegistry;
begin
  ProductReg := TRegistry.Create;
  with ProductReg do
  begin
    RootKey := HKEY_LOCAL_MACHINE;
    if OpenKey('Software\'+AppSystem, False)
    then WriteString(Chave, Value);
  end;
  ProductReg.Free;
end;

function RemoveChar(Value : string; Ch : Char): string;
var
  I : Integer;
begin
  Result := '';
  for I := 1 to Length(Value) do
    if Value[I] <> Ch then Result := Result + Value[I];
end;

function RemoveAcentuacao(Value : string): string;
var
  I : Integer;
begin
  Result := '';
  for I := 1 to Length(Value) do
  if not (Value[I] in [' ','.', ',' ,';',':','´','`','~','^','"','!','(',')','§',
                       '*','&','¨','%','#','@','-','_','+','=','[',']','{','}','ª',
                       'º','¢','£','\','/','|','ä','Ä','ã','Ã','ç','Ç','õ','Õ','â',
                       'Â','ê','Ê','é','É','è','È','ô','Ô','ò','Ò'])
  then Result := Result + Value[I];
end;

function ClearChar(S: string): string;
var
 I: Integer;
begin
 Result := '';
 for I := 1 to Length(S) do
 begin
    if S[I] in [#48..#57] then
    begin
       Result := Result + S[I];
    end;
 end;
end;

//function Tira_Caracteres_Controle(psNome:string):string;
//begin
//  psNome:=StrSubst(psNome,chr(13),' ',0);
//  psNome:=StrSubst(psNome,chr(10),' ',0);
//  result:=psNome;
//end;

function CPFOK(CPF: string): Boolean;
var
  I,J,Num,Len,Tot: Integer;
  ChkDig,Dig: string;
begin
 try
   CPF := ClearChar( CPF );
   if Length(CPF) <> 11 then
   begin
     Result := False;
     Exit;
   end;
   ChkDig := '';
   for I := 10 to 11 do
   begin
     Num := 0;
     Tot := 0;
     for J := I downto 2 do
     begin
       Inc( Num );
       Dig := Copy( CPF, Num, 1 );
       Tot := Tot + ( StrToInt( Dig ) * J );
     end;
     Len := ( Tot * 10 ) mod 11;
     if Len > 9 then Len := 0;
     ChkDig := ChkDig + FloatToStr( Len );
   end;
   Dig := Copy( CPF, 10, 2 );
   Result := ( Dig = ChkDig );
 except
   result:=False;
 end;
end;

function CGCOK(CGC: string): Boolean;
var
  Tot,Chk,Res: Double;
  I,J,Num: Integer;
  ChkDig,Dig,Aux: string;
begin
 try
   CGC := ClearChar( CGC );
   if Length(CGC) <> 14 then
   begin
     Result := False;
     Exit;
   end;
   Chk := 0;
   ChkDig := '';
   Aux := Copy( CGC, 1, 12 );
   for I := 5 to 6 do
   begin
     Num := 0;
     Tot := 0;
     for J := I downto 2 do
     begin
       Inc( Num );
       Dig := Copy( Aux, Num, 1 );
       Tot := Tot + ( StrToInt( Dig ) * J );
     end;
     for J := 9 downto 2 do
     begin
       Inc( Num );
       if Num <> 13 then
       begin
         Dig := Copy( Aux, Num, 1 );
         Tot := Tot + ( StrToInt( Dig ) * J );
       end
       else begin
         Tot := Tot + ( Chk * J );
         Chk := 0 ;
       end;
     end;
     Res := Tot - ( Int( Tot / 11 ) * 11 );
     if (Res = 0) or (Res = 1) then Chk := 0 else Chk := 11 - Res;
     ChkDig := ChkDig + FloatToStr( Chk );
   end;
   Dig := Copy( CGC, 13, 2 );
   Result := ( Dig = ChkDig );
 except
   result:=False;
 end;
end;

function INSSOK(INSS: string): Boolean;
var
  I, J, Chk, Soma: Integer;
  Valor, Dig: string;
begin
  try
    Dig := Copy(INSS, Length(INSS), Length(INSS));
    Valor := Copy(INSS, 0, Length(INSS) - 1);
    J := 2;
    Soma := 0;
    for I := Length(Valor) downto 1 do
    begin
      Soma := Soma + StrToInt(Valor[i]) * J;
      Inc(J);
      if J > 9 then J := 2;
    end;
    Chk := 11 - (Soma mod 11);
    if Chk > 9 then Chk := 0;
    result := (Chk = StrToInt(Dig));
  except
    result:=False;
  end;
end;

function EMAILOK(psEMail: string):boolean;
const
  CaraEsp: array[1..40] of string[1] =
  ( '!','#','$','%','¨','&','*',
  '(',')','+','=','§','¬','¢','¹','²',
  '³','£','´','`','ç','Ç',',',';',':',
  '<','>','~','^','?','/','','|','[',']','{','}',
  'º','ª','°');
var
  i,cont   : integer;
  EMail    : ShortString;
begin
  EMail := psEMail;
  Result := True;
  cont := 0;
  if EMail <> '' then
    if (Pos('@', EMail)<>0) and (Pos('.', EMail)<>0) then    // existe @ .
    begin
      if (Pos('@', EMail)=1) or (Pos('@', EMail)= Length(EMail)) or (Pos('.', EMail)=1) or (Pos('.', EMail)= Length(EMail)) or (Pos(' ', EMail)<>0) then
        Result := False
      else                                   // @ seguido de . e vice-versa
        if (abs(Pos('@', EMail) - Pos('.', EMail)) = 1) then
          Result := False
        else
          begin
            for i := 1 to 40 do            // se existe Caracter Especial
              if Pos(CaraEsp[i], EMail)<>0 then
                Result := False;
            for i := 1 to length(EMail) do
            begin                                 // se existe apenas 1 @
              if EMail[i] = '@' then
                cont := cont + 1;                    // . seguidos de .
              if (EMail[i] = '.') and (EMail[i+1] = '.') then
                Result := false;
            end;
                                   // . no f, 2ou+ @, . no i, - no i, _ no i
            if (cont >=2) or ( EMail[length(EMail)]= '.' )
              or ( EMail[1]= '.' ) or ( EMail[1]= '_' )
              or ( EMail[1]= '-' )  then
                Result := false;
                                            // @ seguido de COM e vice-versa
            if (abs(Pos('@', EMail) - Pos('com', EMail)) = 1) then
              Result := False;
                                              // @ seguido de - e vice-versa
            if (abs(Pos('@', EMail) - Pos('-', EMail)) = 1) then
              Result := False;
                                              // @ seguido de _ e vice-versa
            if (abs(Pos('@', EMail) - Pos('_', EMail)) = 1) then
              Result := False;
          end;
    end
    else
      Result := False;
end;


function CalculaData(DtaIni : tDatetime; QtdMes : Integer): TDatetime;
var
  Dia, Mes, Ano : Word;
begin
  DecodeDate(Dtaini, Ano, Mes, Dia);
  if QtdMes > 12 then
  begin
    Ano := Ano + Trunc(QtdMes / 12);
    Mes := Mes + (QtdMes Mod 12);
    if Mes > 12 then
    begin
      Mes := Mes - 12;
      Inc(Ano);
    end
  end
  else begin
    Mes := Mes + QtdMes;
    if Mes > 12 then
    begin
      Mes := Mes - 12;
      Inc(Ano);
    end
  end;
  Result := EncodeDate(Ano, Mes, Dia);
end;

function GetComp : string;
var
  CompName : array[0..MAX_COMPUTERNAME_LENGTH] of Char;
  CompSize : Dword;
begin
  CompSize := MAX_COMPUTERNAME_LENGTH;
  CompName := #0;
  try
    GetComputerName(CompName, CompSize);
  except on E:exception do ShowMessage(E.Message);
  end;
  result := CompName;
end;

{ recebe a safra no formato 'MM/YYYY' e devolve no formato 'YYYYMM'}
function  strtoSafra ( psSafra : string ) : integer;
var viMes, viAno : integer;
begin

   viMes := strtoint(copy(psSafra,1,2));

   if (viMes < 1 ) or ( viMes > 12 ) then
      raise exception.create('Mês inválido "'+inttostr(viMes)+'"');

   viAno := strtoint(copy(psSafra,4,4));

   result := (viAno*100)+viMes;
end;

function StrZero(Zeros:string;Quant:integer):String;
var
I,Tamanho:integer;
aux: string;
begin
  aux     := zeros;
  Tamanho := length(ZEROS);
  ZEROS   := '';
  for I:=1 to quant-tamanho do ZEROS := ZEROS + '0';
  aux     := zeros + aux;
  StrZero := aux;
end;

{ recebe a safra no formato 'YYYYMM' e devolve no formato 'MM/YYYY'}
function  SafraToStr ( piSafra : Integer ) : String;
var vAno,vMes : string;
begin
   vAno := copy(inttostr(piSafra),1,4);
   vMes := copy(inttostr(piSafra),5,2);
   result := StrZero(vMes,2) + '/' + vAno;
end;

{ recebe a safra no formato 'YYYYMM' e devolve no formato 'MMM/YYYY'}
function  Formata_Safra ( pSafra : integer ) : string;
var vAno,vMes : string;
begin
   vAno := copy(inttostr(pSafra),1,4);
   vMes := copy(inttostr(pSafra),5,2);
   try
     result := UpperCase(ShortMonthNames[StrToInt(vMes)]) + '/' + vAno;
   except
     result := '';
   end;
end;

{ recebe a safra no formato 'YYYYMM' e devolve no formato 'MMM/YYYY'
  se for 999999 999999 retornar "Não Expira".}
function  Formata_Safra_Expiracao ( pSafra : integer ) : string;
var vsAno,vsMes,vsSafra : string;
begin
   vsSafra :='';
   vsAno := copy(inttostr(pSafra),1,4);
   vsMes := copy(inttostr(pSafra),5,2);

   if(pSafra = 999999)then
     vsSafra :='NÃO EXPIRA'
   else
   begin
     try
       vsSafra := UpperCase(ShortMonthNames[StrToInt(vsMes)]) + '/' + vsAno;
     except
       vsSafra := '';
     end;
   end;
   
   result := vsSafra;
end;


// Retorna a safra a que pertence uma data
function  Datetosafra( pdata : tDateTime ) : integer;
var vDia,vMes,vAno : word;
begin
   decodedate(pdata,vAno,vMes,vdia);
   result := vAno*100+vMes;
end;

//retorna o primeiro dia de uma safra
function Inicio_Safra(pSafra : integer) :TDateTime;
var vsSafra,vMes,vAno : string;
begin
   vsSafra := inttostr(pSafra);
   vano := copy(vsSafra,1,4);
   vMes := copy(vsSafra,5,2);
   result := Strtodate( '01'+'/'+vMes+'/'+vAno);
end;

//retorna o ultimo dia de uma safra
function  Fim_Safra(pSafra : integer) :TDateTime;
var vsSafra : string;
    viMes,viAno, viDia : integer;

begin
   vsSafra := inttostr(pSafra);
   viano := strtoint(copy(vsSafra,1,4));
   viMes := strtoint(copy(vsSafra,5,2));
   viDia := DiasNoMes(viMes,viAno);
   result := encodedate( viAno,viMes,viDia);
end;

//retorna o numero de dias em um dado mes/ano
function DiasNoMes(piMes , piAno : Integer): Integer;
  const aUltimoDiaMes: array[1..12] of integer = (31,28,31,30,31,30,31,31,30,31,30,31);
begin
  Result := aUltimoDiaMes[piMes];
  //Ano Bissexto
  if (piMes = 2) and IsLeapYear(piAno) then
    Result := result + 1;
end;

{
  Funcao Data_No_Periodo
  objetivo   : verifica se a data está no periodo informado
  Parametros : pDtReferencia : Data que sera verificada
               pDtInicio     : Data de Inicio do periodo
               pDtFim        : data de Fim do Perido]
  retorno    : verdadeiro se a data esta no periodo,
               ou a pDtFim esta vazia e a data e maior que pDtInicio
}
function Data_Periodo( pDtReferencia, pDtInicio, pDtFim : TDateTime) : boolean;
begin
   result := (pDtReferencia >= pDtInicio)and( pDtReferencia <= pDtFim );
end;

{
  Funcao Data_No_Periodo
  objetivo   : verifica se a data está no periodo informado
  Parametros : pDtReferencia : Data que sera verificada
               pDtInicio     : Data de Inicio do periodo
               pDtFim        : data de Fim do Perido]
               pNomeData     : "Nome" do campo, que será utilizado na Mensagem de erro de Erro
               pMsg          : Mensagem de erro, retornada por referencia (parametro de saida)
  retorno    : verdadeiro se a data esta no periodo,
               ou a pDtFim esta vazia e a data e maior que pDtInicio

function Data_no_Periodo ( pDtReferencia, pDtInicio, pDtFim : TDateTime;
                           pNomeData : string; var pMsg : string        ) : boolean;
var vbData_Periodo:boolean;

begin
  vbData_Periodo:= Data_no_Periodo ( pDtReferencia, pDtInicio, pDtFim) ;

  if(not vbData_Periodo)then
  begin
    pMsg := ' O Campo "'+pNomeData+'" deve ';
    if pDtFim <> 0 then
    begin
       pMsg := pMsg + 'estar entre '+FormatDateTime('dd/mm/yyyy', pDtInicio)+
                      ' e '+ FormatDateTime('dd/mm/yyyy', pDtFim);
    end
    else
       pMsg := pMsg + 'ser maior que '+FormatDateTime('dd/mm/yyyy', pDtInicio);
  end;
  result:= vbData_Periodo;
end;
}
{
  Funcao Intervalo_Conflitante
  objetivo   : verifica se a dois Intervalos coincidem
  Parametros : pI1VlInicio     : Data de Inicio do 1ºIntervalo
               pI1VlFim        : data de Fim do 1º Intervalo
               pI2VlInicio     : Data de Inicio do 2ºIntervalo
               pI2VlFim        : data de Fim do 2º Intervalo)
  retorno    : verdadeiro se as Intervalos coincidem
  observação : tanto so valores de inicio como os de fim não são obrigatorios
}
function  Intervalo_Conflitante ( pI1VlInicio,pI1VlFim,pI2VlInicio,pI2VlFim:real):boolean;
var vbConflito:boolean;
begin
  vbConflito:=false;
  //verifico se nenhum dos Intervalos tem fim
  if(( pI1VlFim = 0) and (pI2VlFim = 0 ) )then
    vbConflito:=true
  else
  //verifico se nenhum dos Intervalos tem Inicio
  if((pI1VlInicio = 0) and ( pI2VlInicio = 0 ) )then
    vbConflito:=true
  else
  //verifico se um dos Intervalos ñ tem fim e a dtincio do outro e maior
  if( ( (pI1VlFim = 0) and (pI2VlFim >= pI1VlInicio) ) or
      ( (pI2VlFim = 0) and (pI1VlFim >= pI2VlInicio) ))then
    vbConflito:=true
  else
  //verifico se um dos Intervalos ñ tem Inicio e a dtincio de um e menor que a da de fim do outror
  if( ( (pI1VlInicio = 0) and (pI2VlInicio <= pI1VlFim) ) or
      ( (pI2VlInicio = 0) and (pI1VlInicio <= pI2VlFim) ))then
    vbConflito:=true
  else
  //verifico se um dos Intervalos está dentro do outro
  if (not ((pI1VlFim = 0) or (pI2VlFim = 0)) )then
  begin
    if((pI1VlInicio <= pI2VlFim )   and (pI1VlFim >= pI2VlInicio) ) or
      ((pI1VlFim    >= pI2VlInicio) and (pI1VlFim <= pI2VlFim   ) ) then
    vbConflito:=true;
  end;
  result:=vbConflito;
end;

{
  Funcao Periodo_Conflitante
  objetivo   : verifica se a dois periodos coincidem
  Parametros : pP1DtInicio     : Data de Inicio do 1ºperiodo
               pP1DtFim        : data de Fim do 1º perido
               pP2DtInicio     : Data de Inicio do 2ºperiodo
               pP2DtFim        : data de Fim do 2º perido)
  retorno    : verdadeiro se as datas coincidem(conflito entre os periodos)
}
function  Periodo_Conflitante ( pP1DtInicio, pP1DtFim,pP2DtInicio, pP2DtFim:TDateTime):boolean;
var vbConflito:boolean;
begin
  vbConflito:=false;
  //verifico se nenhum dos periodos tem fim
  if(( pP1DtFim = 0) and (pP2DtFim = 0 ) )then
    vbConflito:=true
  else
  //verifico se um dos periodos ñ tem fim e a dtincio do outro e maior
  if( ( (pP1DtFim = 0) and (pP2DtFim >= pP1DtInicio) ) or
      ( (pP2DtFim = 0) and (pP1DtFim >= pP2DtInicio) ))then
    vbConflito:=true
  else
  //verifico se um dos periodos está dentro do outro
  if (not ((pP1DtFim = 0) or (pP2DtFim = 0)) )then
  begin
    if((pP1DtInicio <= pP2DtFim )   and (pP1DtFim >= pP2DtInicio) ) or
      ((pP1DtFim    >= pP2DtInicio) and (pP1DtFim <= pP2DtFim   ) ) then
    vbConflito:=true;
  end;
  result:=vbConflito;
end;

function  Meses_Entre_Datas(pDtInicio, pDtFim:TDateTime): Integer;
var iQtMeses,iDay_Aux, imes_Ini,imes_Fim,iAno_Ini,iAno_Fim :word;
begin
  iQtMeses:=0;

  while pDtFim > pDtInicio do
  begin
    DecodeDate(pDtInicio, iAno_Ini, imes_Ini, iDay_Aux);
    DecodeDate(pDtFim, iAno_Fim, imes_Fim, iDay_Aux);
    //imes_Ini := Month(pDtInicio);
    //imes_Fim := Month(pDtFim);
    //iAno_Ini := Year(pDtInicio);
    //iAno_Fim := Year(pDtFim);

    if(imes_Ini<>imes_Fim)or(iAno_Ini<>iAno_Fim)then
      inc(iQtMeses);
    pDtFim:=IncMonth(pDtFim,-1);
  end;

  result:=iQtMeses;
end;

function Replicate( psCaracter : char; piQuantidade : integer) : string ;
var i : integer;
begin
    result := '';
    for i := 1 to piQuantidade do
       result := result + psCaracter;
end;

function FillStr(Value: string; Ch: Char; Contador: Integer; Left: Boolean): string;
var
  I : Integer;
begin
  result := Value;
  for I := 1 to Contador do
    if Left
    then Result := Ch + Result
    else Result := Result + Ch;
end;

function ExistInstance(Value : string): boolean;
var
  I : Integer;
begin
  result := False;
  for I := 0 to Screen.FormCount -1 do
    if ('fm'+ Copy(Value, 3, Length(Value)) = Screen.Forms[I].Name) then
    begin
      result := True;
      Break;
    end;
end;

function ExistSameInstance(Value, Cap : string): boolean;
var
  I : Integer;
  sAux : String;
begin
  result := False;
  for I := 0 to Screen.FormCount -1 do
  begin
    sAux := Screen.Forms[I].Name;
    if Pos('_', sAux) > 0
    then sAux := Copy(sAux, 0, Pos('_', sAux) - 1);
    if ('fm'+ Copy(Value, 3, Length(Value)) = sAux) and
       (Cap = Screen.Forms[I].Caption) then
    begin
      result := True;
      Break;
    end;
  end;
end;

procedure Muda_CampoGrid(pGrid : TDBGrid; pNome_Original,pNovo_Nome,pCaption:string);//Muda o nome dos Campos do grid(FildName)
var i:integer;
begin
  with pGrid do
  begin
    for i:=0 to columns.Count-1 do
    begin
      if (columns.Items[i].FieldName= pNome_Original)then
      begin
        columns.Items[i].FieldName:= pNovo_Nome;
        if(pCaption<>'') then
          columns.Items[i].Title.Caption:=pCaption;
      end;
    end
  end;
end;

{
  Procedure Carrega_Campo
  objetivo   : Carregar o Valor de um campo do dataset Passado como parametro
  Parametros : pDataset  : Dataset do campo a ser carregado
               psNoCampo : Nome da Campo onde será carregado o valor
               pValor    : Valor a Ser carrega
               pbVerificaCampo : parametro que indica se deve ser verifaca a
                                 existencia do campo no dataset, se for false e
                                 o campo não existir gera uma exceção
}
procedure Carrega_Campo( pDataset : TDataSet; psNoCampo : string;
                         pValor : Variant; pbVerificaCampo : boolean);
var vfiCampo : TField;
begin
   vfiCampo := pDataset.fields.findField(psNoCampo);
   if pbVerificaCampo then
   begin
      if ( vfiCampo <> nil ) then
         vfiCampo.Value := pValor
   end
   else
      vfiCampo.Value := pValor;
end;

function ConectaDb( Sender : TObject;pDataBase : TDataBase; psDriverName, psParametros, psPassword : string;
                    psMensagemErro : string = 'Erro Conectando ao Banco de Dados') : boolean;
begin
   result := false;
   with pDataBase do
   begin
      SessionName:='Session';
      close;
      SessionName:='Session';

      LoginPrompt := false;
      DriverName := psDriverName;
      Params.Clear;
      Params.TEXT := psParametros;
      Params.Add('PASSWORD='+psPassword);
      try
         open;
         result := true;
      except
         on e:Exception do
            TfmErro.showError(Sender,e,psMensagemErro);
      end;
   end;
end;

function PoeFoco( pComp : TWinControl) : boolean;
begin
   result:=false;
   if ( TWinControl(pComp).parent <> nil       ) and
      ( TWinControl(pComp).parent is TTabSheet ) and
      ( not TWinControl(pComp).parent.visible  ) then
   begin
      TPageControl(TWinControl(pComp).parent.parent).activePage := TTabSheet(TWinControl(pComp).parent);
   end;
   if TWinControl(pComp).CanFocus then
   begin
      TWinControl(pComp).setFocus;
      result := true;
   end;
end;

procedure Posiciona(pComponente,pParent:TWinControl;pTab_Order,pLeft,pTop,pWidth:integer);
begin
  pComponente.Parent:=pParent;
  pComponente.Left:=pLeft;
  pComponente.Top:=pTop;
  pComponente.Width:=pWidth;
  pComponente.TabOrder:=pTab_Order;
end;

//function Cria_QrLabel(Owner : TComponent; pParent : TWinControl ;psCaption: string;prLeft,prTop,prHeight,prwidth : real; pbBold : boolean = false) : TgtQRLabel;
//var vqrLabel : TgtQRLabel;
//begin
//   vqrLabel := TgtQRLabel.Create(Owner);
//   with vqrLabel do
//   begin
//      Parent := pParent;
//      autosize := false;
//      WordWrap := false;
//      Caption := psCaption;
//      size.left := prleft;
//      size.top  := prtop;
//      size.height := prheight;
//      size.width := prwidth;
//      if pbBold then
//         font.Style := font.Style+[fsBold];
//   end;
//   result := vqrLabel;
//end;

function  incSafra(pSafra : integer; pIncremento : word = 1) : integer;
var vMeses, vAnos, vMeses_Inc, vAnos_Inc : integer;
begin

   vMeses_Inc := pIncremento mod 12;
   vAnos_Inc := pIncremento div 12;

   vMeses := strtoint(copy(inttostr(pSafra),5,2)) + vMeses_Inc;
   vAnos  := strtoint(copy(inttostr(pSafra),1,4)) + vAnos_Inc;

   if vMeses > 12 then
   begin
      vMeses := vMeses -12;
      vAnos  := vAnos +1;
   end;
   result := (vAnos * 100) + vMeses;
end;

function  DecSafra(pSafra : integer; pDecremento : word = 1) : integer;
var vMeses, vAnos, vMeses_Dec, vAnos_Dec : integer;
begin
  vMeses_Dec := pDecremento mod 12;
  vAnos_Dec := pDecremento div 12;

  vMeses := strtoint(copy(inttostr(pSafra),5,2)) - vMeses_Dec;
  vAnos  := strtoint(copy(inttostr(pSafra),1,4)) - vAnos_Dec;

  if vMeses < 1 then
  begin
     vMeses := vMeses +12;
     vAnos  := vAnos -1;
  end;
  result := (vAnos * 100) + vMeses;
end;

function FrequentFlyerOK( psFrequentFlyer : string; piCdTipo_Validacao : integer ) : boolean;
Begin
  case piCdTipo_Validacao of
  0: result := true;
  1: result := FrequentFlyerOK_Varig( psFrequentFlyer );
  2: result := FrequentFlyerOK_Tam( psFrequentFlyer );
  3: result := FrequentFlyerOK_AA( psFrequentFlyer );
  4: result := FrequentFlyerOK_Tap( psFrequentFlyer );
  else
     raise Exception.create('Validação de "Frequent flyer" inexistente! ( CdTipo_Validacao = '+inttostr(piCdTipo_Validacao)+')');
  end;
end;

function FrequentFlyerOK_Varig( psFrequentFlyer : string ) : boolean;
begin
  if (Length(psFrequentFlyer) < 9) or (StrToFloat(psFrequentFlyer) = 0) then
    result := false
  else
    result := (Copy(psFrequentFlyer, 0, 8) + IntToStr((StrToInt(Copy(psFrequentFlyer, 0, 8)) Mod 7)) = psFrequentFlyer);
end;

function FrequentFlyerOK_TAM( psFrequentFlyer : string ) : boolean;
var vsAux : string;
    I : integer;
    viAux : Longint;
begin
  psFrequentFlyer := FillStr(psFrequentFlyer, '0', 10 - Length(psFrequentFlyer), True);
  vsAux := psFrequentFlyer;
  if StrToFloat(psFrequentFlyer) < 10000000 then
  begin
    viAux := 0;
    vsAux := Copy(vsAux, 3, 7);
    for I := 1 to Length(vsAux) do viAux := viAux + (StrToInt(vsAux[I]) * I);
    vsAux := FillStr(vsAux, '0', 9 - Length(vsAux), True) +  IntToStr(viAux Mod 7);
  end
  else
  begin
    viAux := 0;
    vsAux := Copy(vsAux, 1, 9);
    viAux := viAux + (StrToInt(vsAux[1]) * 2);
    viAux := viAux + (StrToInt(vsAux[2]) * 9);
    viAux := viAux + (StrToInt(vsAux[3]) * 8);
    viAux := viAux + (StrToInt(vsAux[4]) * 7);
    viAux := viAux + (StrToInt(vsAux[5]) * 6);
    viAux := viAux + (StrToInt(vsAux[6]) * 5);
    viAux := viAux + (StrToInt(vsAux[7]) * 4);
    viAux := viAux + (StrToInt(vsAux[8]) * 3);
    viAux := viAux + (StrToInt(vsAux[9]) * 2);
    if (viAux Mod 10) >=2
    then viAux := 10 - (viAux Mod 10)
    else viAux := 0;
    vsAux := FillStr(vsAux, '0', 9 - Length(vsAux), True) +  IntToStr(viAux);
  end;
  result := (vsAux = psFrequentFlyer);
end;

function FrequentFlyerOK_AA( psFrequentFlyer : string ) : boolean;
var vrAux : real;
begin
  if (Length(psFrequentFlyer) <> 7) then // deve ter 7 digitos
    result := false
  else
  if (pos('I',psFrequentFlyer) <> 0) or
     (pos('O',psFrequentFlyer) <> 0) or
     (pos('Q',psFrequentFlyer) <> 0) or
     (pos('Z',psFrequentFlyer) <> 0) then // I,O,Q,Z nao sao permitidos
    result := false
  else
  if (pos('G',copy(psFrequentFlyer,2,6)) <> 0) or
     (pos('S',copy(psFrequentFlyer,2,6)) <> 0)then // G e S soh podem estar no primeiro Caracter
    result := false
  else
  if not ( psFrequentFlyer[7] in ['0'..'9'] ) then // checkdigit deve ser numerico
    result := false
  else
  begin
     vrAux := ( chartoebcdic(psFrequentFlyer[1])+( 2 * chartoebcdic(psFrequentFlyer[3]) )+
              chartoebcdic(psFrequentFlyer[4])+chartoebcdic(psFrequentFlyer[5])+
              chartoebcdic(psFrequentFlyer[6]) ) / 5;

    vrAux := int(Frac(vrAux)*10);
    result := ( vrAux = strtoint(psFrequentFlyer[7]) );
  end;

end;

function FrequentFlyerOK_Tap( psFrequentFlyer : string ) : boolean;
begin
  if (Length(psFrequentFlyer) <> 11) then
    result := false
  else
  if (copy(psFrequentFlyer,0,2) <> 'TP') then
    result := false
  else
    result := (Copy(psFrequentFlyer, 0, 10) + IntToStr((StrToInt(Copy(psFrequentFlyer, 3, 8)) Mod 7)) = psFrequentFlyer);
end;

function NumeroNoAir( psNumeroNoAir : string; piCdTipo_Validacao : string ) : boolean;
Begin
  if piCdTipo_Validacao = '153NV' then result := true
  else
  if piCdTipo_Validacao = '153LECLUB' then result := NumeroAClub( psNumeroNoAir )
  else
     raise Exception.create('Validação de "Número No Air" inexistente! ( CdTipo_Validacao = '+ piCdTipo_Validacao +')');
end;

function NumeroAClub( psNumeroNoAir : string ) : boolean;
var i,c,v,t: integer;
    b: boolean;
begin
  result :=false;
  i := Length(psNumeroNoAir);
  b := false;
  t := 0;
  try
    if(i < 10)then
    begin
     result := false;
    end
    else
    begin
    for  c:= i-1 downto 1 do
    begin
      b := not b;
      v := StrToInt(copy(psNumeroNoAir,c,1));
      if b=true then
      begin
        v:=((v*2) div 10)+((v*2) mod 10);
      end;
      t := t + v;
    end;
    v:= ((10-(t mod 10)) mod 10)- (StrToInt(copy(psNumeroNoAir,i,1)));
    if v=0 then result := true;
    end;
  except
    result :=false;
  end;  
end;

function chartoEBCDIC ( pcChar : char) : integer;
begin
 case pcChar of
   '0' : result := 240;
   '1' : result := 241;
   '2' : result := 242;
   '3' : result := 243;
   '4' : result := 244;
   '5' : result := 245;
   '6' : result := 246;
   '7' : result := 247;
   '8' : result := 248;
   '9' : result := 249;
   'A' : result := 193;
   'B' : result := 194;
   'C' : result := 195;
   'D' : result := 196;
   'E' : result := 197;
   'F' : result := 198;
   'G' : result := 199;
   'H' : result := 200;
   'I' : result := 201;
   'J' : result := 209;
   'K' : result := 210;
   'L' : result := 211;
   'M' : result := 212;
   'N' : result := 213;
   'O' : result := 214;
   'P' : result := 215;
   'Q' : result := 216;
   'R' : result := 217;
   'S' : result := 226;
   'T' : result := 227;
   'U' : result := 228;
   'V' : result := 229;
   'W' : result := 230;
   'X' : result := 231;
   'Y' : result := 232;
   'Z' : result := 233;
 else
   raise exception.create('Caracter Invalido :'+pcChar);
 end;
end;

function parentesis( psString : string; pbSpaces : boolean = true) : string;
begin
   if pbSpaces then
      result := '( '+psString+' )'
   else
      result := '('+psString+')';
end;

procedure Envia_Email( psDestinatario, psAssunto, psCorpo_Mensagem : string;
                       psAttachment : string =''; psCopia : string = ''; psCopia_oculta : string = '');
var sEmail: string;
begin
  sEmail := '';
  sEmail := sEmail+'mailto:'+psDestinatario;
  sEmail := sEmail+'?Subject='+psAssunto;
  sEmail := sEmail+'&Body='+psCorpo_Mensagem;
  if psCopia <> '' then
    sEmail := sEmail+ '&CC='+psCopia;
  if psCopia_Oculta <> '' then
    sEmail := sEmail+'&BCC='+psCopia_Oculta;
  if psAttachment <> '' then
    sEmail := sEmail+'&Attach="'+psAttachment+'"';
  ShellExecute(Application.Handle, 'open', PChar(sEmail), nil, nil, SW_SHOW);
end;

procedure LimpaTreeView(ptv:TtreeView);
  procedure Desaloca(pnd:TtreeNode);
  var i:integer;
  begin
    for i:=0 to pnd.Count-1 do
    begin
      if(pnd.Item[i].Data <> nil)then
        dispose(pnd.Item[i].Data);
      Desaloca(pnd.Item[i]);
    end;
  end;
begin
  if(ptv.Items.Count>0)then
  begin
    Desaloca(ptv.Items[0]);
    ptv.Items.Clear;
  end;
end;

procedure Ordena_Tstrings(pStrings:TStrings);
var i , j :integer;
    vsTemp:string;
begin
  for i:= pStrings.Count -1  downto 0 do
  begin
    for j:=0  to i-1 do
    begin
      if(pStrings[j]>pStrings[j+1]) then
      begin
        vsTemp:=pStrings[j+1];
        pStrings[j+1]:=pStrings[j];
        pStrings[j]  :=vsTemp;
      end;
    end;
  end;
end;

procedure Muda_Cor_Texo_RichEdit(pRE:TRichEdit;pCor:TColor);
var selstart:integer;
begin
  selstart:=pRE.SelStart;
  pRE.SelStart:=0;
  pRE.SelLength:=Length(pRE.text);

  pRE.SelAttributes.Color := pCor;
  pRE.SelStart:=selstart;
end;

procedure Muda_Cor_Palavras_RichEdit(psLista_Palavras:string;pRE:TRichEdit;pCor:TColor);
var i,selstart,viPos,viPos_Total:integer;
    vsTexto:string;
    vaLista_Palavras:aString;
begin
  selstart:=pRE.SelStart;

  vaLista_Palavras:= StrtoArray(psLista_Palavras,';');

  for i:=low(vaLista_Palavras) to high(vaLista_Palavras)do
  begin
    vsTexto:=pRE.text;
    viPos_Total:=0;
    while (Pos_Palavra_Exata(vaLista_Palavras[i],vsTexto)<>0) do
    begin
      viPos :=Pos_Palavra_Exata(vaLista_Palavras[i],vsTexto);

      pRE.SelStart:=viPos_Total+viPos- 1;

      viPos_Total:=viPos_Total+(viPos-1)+length(vaLista_Palavras[i]);

      pRE.SelLength:=Length(vaLista_Palavras[i]);
      pRE.SelAttributes.Color := pCor;
      vsTexto:=copy(vsTexto,viPos+length(vaLista_Palavras[i]),length(vsTexto));
    end;
  end;
  pRE.SelStart:=selstart;
end;

function DelTree(Dir : String ): Boolean;
var
  SHFileOpStruct : TSHFileOpStruct;
  Buf: Array [0..255] of Char;
begin
  try
    if not DirectoryExists(Dir) then
    begin
      Result := False;
      Exit;
    end;
    Fillchar(SHFileOpStruct, Sizeof(SHFileOpStruct), 0 );
    FillChar(Buf, Sizeof(Buf),0 );
    StrPCopy(Buf, Dir);
    with SHFileOpStruct do
    begin
      Wnd    := 0;
      wFunc := FO_DELETE;
      pFrom  := @Buf;
      fFlags := fFlags or FOF_SIMPLEPROGRESS;
      fFlags := fFlags or FOF_NOCONFIRMATION;
    end;
    Result := (SHFileOperation(SHFileOpStruct) = 0);
  except
    Result := False;
  end;
end;
end.
