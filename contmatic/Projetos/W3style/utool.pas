unit UTool;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, dbTables,  db,
  CadVirtual, declaraType, dialogs, ELibFnc,Variants, ADODB;

  //Query
  //procedure InsertFilter(qy : TQuery; psFiltro : string);overload;
  procedure InsertFilter(qy : TADOQuery; psFiltro : string; psConector:string='AND');overload;
  procedure InsertFilter(qy : TADOQuery; prFiltro : TReg_Filtro);overload;
  procedure InsertFilter(qy : TADOQuery; psFiltro : String; psParametro : String ; pValor : Variant);overload;

  function Insert_string(piPos:integer;psSql,psFiltro:string):string;

  procedure InsertFilterOr(qy : TADOQuery; Filter : string);
  procedure GetFieldNames2(qy : TADOQuery; pFields : TStrings);overload;
  procedure GetFieldNames2(qy : TADOQuery);overload;

  procedure Carrega_QueryResult(qy : TADOQuery; QueryResult : TStrings);
  //CadVirtual
  function CriaForm(psNoForm : String; Owner : TComponent ) : TFmCadVirtual;
  Procedure ShowForm(psNoForm : String);
  // String / Caracter
  function ReplaceChar(Ori, Des : Char; Valor : string): string; //duplicado
  function RemoveChar(Value : string; Ch : Char): string;
  function Desacentua( pString : string ) : string ;

  function F_CharOK ( vTipo_Dado : TFieldType; vcCaracter : char ) : boolean;
  function F_Cria_TField( pFieldType : TFieldType;
                          Owner : TComponent;
                          pDataset : TDataSet; psFieldName, psName : String;
                          piSize : integer; pbCalculated : boolean = false ) : TField;

  function isInteger(ps:string):boolean;

  //Data
  function FDriverName( ) : String;
  function FData_Sistema( psDriverName : String ) : String;
  procedure FSubstitui_Data_Sistema( pS: String; pQy : TADOQuery) ;
  procedure FSubstitui_Valor( pS,psValor: String;pQy:TADOQuery) ;
  function FDb_upper( psDriverName : String ) : String;
  //

  function GetTemporaryPath : String;

  function Selecao_reg_Atual( qy : TDataSet; paChave, paChave_Alias : Array of string) : String;

  procedure RefreshQuery(qy : TADOQuery;psChave : string);
  function StrtoArray( psLista : string; psDelimitador : string = ',' ) : aString;
  function ArraytoStr( paLista : aString; psDelimitador : string = ',' ) : string;
  procedure AddStrtoList(psString : string; var psLista : String; psDelimitador : String = ',' );
  function BooleanToSn(pbBoolean:Boolean):string;
  function SnToBoolean(psString:string):Boolean;
  function Pos_Palavra_Exata(pSubstr: string; pS: string):integer;

  function NumeroPar(pNumero : Integer): boolean;
  function strtohex(pString : string): string;
  function hextostr(pString : string): string;
  procedure Cria_Campos_Calculados(qy:TADOQuery;psLista_Campos:string);
  procedure Gera_Inserts( psNotabela : string; pResult : TStrings;
                          pDataSet : TDataSet; psDriverName : string);
const
  csDriver_Name_ORACLE    = 'ORACLE';
  csDriver_Name_SYBASE    = 'SYBASE';
  csDriver_Name_INTERBASE = 'INTRBASE';
  csDriver_Name_MSSQL     = 'MSSQL'; // SQLSERVER
  csDriver_Name_DB2       = 'DB2';
  csDriver_Name_ACCESS    = 'MSACCESS';
  csDriver_Name_STANDARD  = 'STANDARD';
implementation


{procedure InsertFilter(qy : TQuery; prFiltro : TReg_Filtro);
begin
   InsertFilter(qy, prFiltro.Filtro,prFiltro.Parametro, prFiltro.Valor);
end;

procedure InsertFilter(qy : TQuery; psFiltro : String; psParametro : String ; pValor : Variant);
begin
   if trim(psFiltro) <> '' then
   begin
      InsertFilter(qy, psFiltro);
      if trim(psParametro) <> '' then
      begin
         qy.parambyname(psParametro).value := pValor;
      end;
   end;
end;

procedure InsertFilter(qy : TQuery; psFiltro : string);
var
  iPos :  Integer;
begin
  iPos := qy.sql.IndexOf('WHERE');
  if iPos <> -1 then
  begin
     qy.sql.Insert(iPos + 1, psFiltro + ' AND ')
  end
  else
  begin
    iPos := qy.sql.IndexOf('ORDER BY');
    if iPos <> -1 then
    begin
      qy.sql.Insert(iPos, 'WHERE');
      qy.sql.Insert(iPos + 1, psFiltro);
    end
    else
    begin
      qy.sql.Add('WHERE');
      qy.sql.Add(psFiltro);
    end;
  end;
end;
}

procedure InsertFilter(qy : TADOQuery; prFiltro : TReg_Filtro);
begin
   InsertFilter(qy, prFiltro.Filtro,prFiltro.Parametro, prFiltro.Valor);
end;

procedure InsertFilter(qy : TADOQuery; psFiltro : String; psParametro : String ; pValor : Variant);
begin
   if trim(psFiltro) <> '' then
   begin
      InsertFilter(qy, psFiltro);
      if trim(psParametro) <> '' then
      begin
         qy.Parameters.parambyname(psParametro).value := pValor;
      end;
   end;
end;

procedure InsertFilter(qy : TADOQuery; psFiltro : string; psConector: string='AND');
var
  viPos    :Integer;
  Sql_Aux :string;
  vsConector:string;
begin
  if trim(qy.sql.Text) = '' then
      raise exception.create('Comando SQl não disponivel - função "Utool.InsertFilter"');

  if(trim(psConector)='')then
    vsConector:='AND'
  else
  begin
    if(trim(uppercase(psConector))<>'AND')and(trim(uppercase(psConector))<>'OR')then
    begin
      raise exception.create('Operador Invalido "'+psConector+'"');
    end
    else
      vsConector:=psConector;
  end;

  if(trim(psFiltro)='')then
  begin
    raise exception.create('Filtro em branco');
  end;

  Sql_Aux:=UpperCase(qy.sql.Text);

  if(Pos_Palavra_Exata('WHERE',Sql_Aux)=0)then
    vsConector:='WHERE';

  viPos := Pos_Palavra_Exata('GROUP',Sql_Aux);

  if viPos = 0 then//não tem group by
    viPos :=Pos_Palavra_Exata('ORDER',Sql_Aux);

  if viPos = 0 then//não tem order by
    viPos := Length(Sql_Aux);

  if copy(psFiltro,1,8) = 'ORDER BY' then
     qy.sql.Text:=Insert_string(viPos-1,qy.sql.Text,' '+psFiltro)
  else
     qy.sql.Text:=Insert_string(viPos-1,qy.sql.Text,' '+vsconector+' ( '+psFiltro+' ) ');

end;

function Pos_Palavra_Exata(pSubstr: string; pS: string):integer;
  function Caractere_valido(pCaractere:string):boolean;
  var viCaractere:integer;
  begin
    if(pCaractere<>'')then
    begin
      viCaractere:=ord(uppercase(pCaractere)[1]);
      result:=not((viCaractere in [ord('A')..ord('Z')])or
                 (viCaractere in [ord('0')..ord('9')])or
                 (viCaractere=ord('_')));
    end
    else
      result:=true;
  end;
var vipos,vipos_aux,i:integer;
    vbEncontrou:boolean;
begin
  vipos:=0;
  i:=1;
  vbEncontrou:=true;

  while (vbEncontrou) and (vipos=0) do
  begin
    vipos_aux:=StrPos(pSubstr,pS,i);
    if(vipos_aux<>0)then
    begin
      if((vipos_aux=1)or(Caractere_valido(copy(ps,vipos_aux-1,1))))and(Caractere_valido(copy(ps,vipos_aux+length(psubstr),1)))then
      begin
        vipos:=vipos_aux;
      end;
      inc(i);
    end
    else
      vbEncontrou:=false;
    
  end;

  result:=vipos;
end;

function Insert_string(piPos:integer;psSql,psFiltro:string):string;
var vsSql_Antes,vsSql_Depois:string;
begin
  vsSql_Antes:=copy(psSql,0,pipos);
  vsSql_Depois:=copy(psSql,pipos+1,length(psSql));

  result:=vsSql_Antes + psFiltro + vsSql_Depois;
end;

procedure GetFieldNames2(qy : TADOQuery);
var vFields : TStrings;
begin
  vFields := TStringList.Create;
  GetFieldNames2(qy,vFields);
  vFields.Free;
end;

procedure GetFieldNames2(qy : TADOQuery; pFields : TStrings);
var vSqlAux : TStrings;
    vParams : TParams;
begin
  vSqlAux := TStringList.Create;
  vParams := TParams.Create;

  vSqlAux.clear;
  vSqlAux.assign( qy.sql );
  vParams.Assign(qy.Parameters);

  try
    insertFilter( Qy, ' 3 = 2 '); // Nao retorna nenhum registro, apenas a estrutura da tabela
    qy.Parameters.Assign(vParams);
    qy.GetFieldNames(pFields);
  finally
    qy.sql.clear;
    qy.sql.Assign( vSqlAux );
    qy.Parameters.Assign(vParams);
  end;
  vSqlAux.free;
  vParams.Free;
end;

function ReplaceChar(Ori, Des : Char; Valor : string): string;
var
  Posic : Byte;
begin
  result := '';
  while Pos(Ori,Valor) > 0 do
  begin
    Posic := Pos(Ori,Valor);
    Delete(Valor, Posic, 1);
    Insert(Des, Valor, Posic);
  end;
  result := valor;
end;

{
  Funcao F_CharOK
  objetivo   : verificar se o caracter e valido para um tipo de dados
  Parametros : vTipo_Dado : Tipo de Dado em questao
               vcCaracter : Caracter a ser validado
  retorno    : retorna verdadeiro, se o caracter informado pode ser inserido no tipo de campo,
               e falso caso contrario
}
function F_CharOK ( vTipo_Dado : TFieldType; vcCaracter : char ) : boolean;
begin
   if ( vTipo_Dado = ftString     ) and
      ( vcCaracter in [#32..#255] ) then
      result := true
   else
   if ( vTipo_Dado in [ftDateTime, ftDate]  ) and
      ( vcCaracter in ['0'..'9' ,':' , '/'] ) then
      result := true
   else
   if ( vTipo_Dado in [ftInteger, ftSmallInt, ftWord, ftFloat, ftCurrency, ftBCD]  ) and
      ( vcCaracter in ['0'..'9']                                            ) then
      result := true
   else
      result := false
end;
function Desacentua( pString : string ) : string ;
begin

   result := pString;

   result := ReplaceChar('á','a', result );
   result := ReplaceChar('ã','a', result );
   result := ReplaceChar('à','a', result );
   result := ReplaceChar('â','a', result );
   result := ReplaceChar('Á','A', result );
   result := ReplaceChar('Ã','A', result );
   result := ReplaceChar('À','A', result );
   result := ReplaceChar('Â','A', result );

   result := ReplaceChar('é','e', result );
   result := ReplaceChar('è','e', result );
   result := ReplaceChar('ê','e', result );
   result := ReplaceChar('É','E', result );
   result := ReplaceChar('È','E', result );
   result := ReplaceChar('Ê','E', result );

   result := ReplaceChar('í','i', result );
   result := ReplaceChar('ì','i', result );
   result := ReplaceChar('î','i', result );
   result := ReplaceChar('Í','I', result );
   result := ReplaceChar('Ì','I', result );
   result := ReplaceChar('Î','I', result );

   result := ReplaceChar('ó','o', result );
   result := ReplaceChar('õ','o', result );
   result := ReplaceChar('ò','o', result );
   result := ReplaceChar('ô','o', result );
   result := ReplaceChar('Ó','O', result );
   result := ReplaceChar('Õ','O', result );
   result := ReplaceChar('Ò','O', result );
   result := ReplaceChar('Ô','O', result );

   result := ReplaceChar('ú','u', result );
   result := ReplaceChar('ù','u', result );
   result := ReplaceChar('û','u', result );
   result := ReplaceChar('ü','u', result );
   result := ReplaceChar('Ú','U', result );
   result := ReplaceChar('Ù','U', result );
   result := ReplaceChar('Û','U', result );
   result := ReplaceChar('Ü','U', result );

   result := ReplaceChar('ç','c', result );
   result := ReplaceChar('Ç','C', result );
end;

function RemoveChar(Value : string; Ch : Char): string;
var
  I : Integer;
begin
  Result := '';
  for I := 1 to Length(Value) do
    if Value[I] <> Ch then Result := Result + Value[I];
end;

procedure InsertFilterOr(qy : TADOQuery; Filter : string);
var
  iPos :  Integer;
begin
  iPos := qy.sql.IndexOf('WHERE');
  if iPos <> -1 then
  begin
     qy.sql.Insert(iPos + 1, Filter + ' OR ')
  end
  else
  begin
    iPos := qy.sql.IndexOf('ORDER BY');
    if iPos <> -1 then
    begin
      qy.sql.Insert(iPos, 'WHERE');
      qy.sql.Insert(iPos + 1, Filter);
    end
    else
    begin
      qy.sql.Add('WHERE');
      qy.sql.Add(Filter);
    end;
  end;
end;

procedure Carrega_QueryResult(qy : TADOQuery; QueryResult : TStrings);
var i : integer;
begin
   QueryResult.Clear;
   for I := 0 to qy.FieldCount - 1 do
   begin
      QueryResult.Add(qy.Fields[I].FieldName+'='+qy.Fields[I].AsString);
   end;
end;

function CriaForm(psNoForm : String; Owner : TComponent ) : TFmCadVirtual;
var vClass : TPersistentClass;
begin
   vClass := getClass('T'+psNoForm);
   if Assigned(vClass) then
   begin
      result := TClassFmCadVirtual(vClass).CriaInstancia(Owner)
   end
   else
   begin
      raise exception.create('Classe "T'+psNoForm +'" não foi registrada !');
   end;
end;

Procedure ShowForm(psNoForm : String);
var vForm : TFmCadVirtual;
begin
   vForm := TFmCadVirtual(Application.FindComponent(psNoForm));
   if ( vForm = nil ) or (not vForm.Enabled) then
      vForm := CriaForm(psNoForm,Application);
   if vForm <> nil then
      vForm.ExibeForm;
end;

function F_Cria_TField( pFieldType : TFieldType;
                          Owner : TComponent;
                          pDataset : TDataSet; psFieldName, psName : String;
                          piSize : integer; pbCalculated : boolean = false ) : TField;
begin
  case pFieldType of
    ftString :
      result := TStringField.Create(Owner);
    ftSmallint, ftInteger, ftWord :
      result := TIntegerField.Create(Owner);
    ftCurrency :
      result := TCurrencyField.Create(Owner);
    ftFloat :
      result := TFloatField.Create(Owner);
    ftDate :
      result := TDateField.Create(Owner);
    ftDateTime :
      result := TDateTimeField.Create(Owner);
    ftBlob :
      result := TBlobField.Create(Owner);
    ftMemo :
      result := TMemoField.Create(Owner);
    ftBCD :
      result := TBCDField.Create(Owner);
    else
      result := nil;
  end;
  if assigned(result) then
  begin
    with result do
    begin
      Name       := psName;
      FieldName  := psFieldName;
      Calculated := pbCalculated;
      Dataset    := pDataset;
      size       := piSize;
    end;
  end;
end;

{
  Funcao FDriverName
  objetivo   : Verificar qual o DriverName Utilizado por um database
  Parametros : psSessionName : Nome da sessao onde o database esta conectado
               psDataBasename
  retorno    : retorna um string com o nome do driver utilizado
}
function FDriverName() : String;
//var vSession : TSession;
//    vDataBase : TDataBase;
begin
  Result := 'SYBASE';
//   vSession  := Sessions.findsession(psSessionName);
//   vDataBase := vSession.FindDatabase(psdatabasename);
//   if vDataBase.AliasName = '' then
//      result := vDataBase.DriverName
//   else
//      result := vSession.GetAliasDriverName(vDataBase.AliasName);
end;


{
  Funcao FData_Sistema
  objetivo   : Verificar qual a funcao de data do banco de dados
  Parametros : psDriverName : nome do driver de Banco de Dados
  retorno    : retorna um string com o nome da funcao de data para o banco de dados
}
function FData_Sistema( psDriverName : String ) : String;
begin
  if UPPERCASE(psDriverName) = csDriver_Name_ORACLE then
    result := 'SYSDATE'
  else
  if UPPERCASE(psDriverName) = csDriver_Name_SYBASE then
    result := 'CONVERT(DATETIME,CONVERT(CHAR(10),GETDATE(),103) +'' '' + CONVERT(CHAR(10),GETDATE(),108),103)'
  else
  if UPPERCASE(psDriverName) = csDriver_Name_MSSQL then
    result := 'CONVERT(DATETIME,CONVERT(CHAR(10),GETDATE(),103) +'' '' + CONVERT(CHAR(10),GETDATE(),108),103)'
  else
  if UPPERCASE(psDriverName) = csDriver_Name_INTERBASE then
    result := 'CAST( '+quotedstr('NOW')+' AS DATE )'
  else
  if UPPERCASE(psDriverName) = csDriver_Name_DB2 then
    result := 'TIMESTAMP(CURRENT DATE, CURRENT TIME )'
  else
  if UPPERCASE(psDriverName) = csDriver_Name_ACCESS then
    result := 'NOW()'
  else
    raise exception.create('Não há função de "Data do Sistema" para o Banco de Dados "'+UPPERCASE(psDriverName)+'"');
end;

{
  Funcao FDb_upper
  objetivo   : Verificar qual a funcao de "UpperCase" do banco de dados
  Parametros : psDriverName : nome do driver de Banco de Dados
  retorno    : retorna um string com o nome da funcao de "uppercase" para o banco de dados
}
function FDb_upper( psDriverName : String ) : String;
begin
  if UPPERCASE(psDriverName) = csDriver_Name_ORACLE then
    result := 'UPPER'
  else
  if UPPERCASE(psDriverName) = csDriver_Name_SYBASE then
    result := 'UPPER'
  else
  if UPPERCASE(psDriverName) = csDriver_Name_MSSQL then
    result := 'UPPER'
//  else
//  if UPPERCASE(psDriverName) = csDriver_Name_INTERBASE then
//    result := 'CAST( '+quotedstr('NOW')+' AS DATE )'
//  else
//  if UPPERCASE(psDriverName) = csDriver_Name_DB2 then
//    result := 'TIMESTAMP(CURRENT DATE, CURRENT TIME )'
//  else
//  if UPPERCASE(psDriverName) = csDriver_Name_ACCESS then
//    result := 'NOW()'
  else
  if UPPERCASE(psDriverName) = csDriver_Name_STANDARD then
    result := 'UPPER'
  else
    raise exception.create('Não há função de "Uppercase" para o Banco de Dados "'+UPPERCASE(psDriverName)+'"');
end;
{
  Funcao FSubitui_Data_Sistema
}
procedure FSubstitui_Data_Sistema( pS: String;pQy:TADOQuery) ;
var
  Sql_Aux          : string;
  vsNoData_Sistema : string;
  vsAntes          : string;
  vsDepois         : string;
  vS               : string;
  viPos            : integer;
begin
  if trim(pqy.sql.Text) = '' then
    raise exception.create('Comando SQl não disponivel - função "Utool.FSubitui_Data_Sistema"');

  vsNoData_Sistema:=FData_Sistema(FDriverName());

  Sql_Aux:=UpperCase(pqy.sql.Text);
  vS:=UpperCase(pS);

  while Pos_Palavra_Exata(vS,Sql_Aux)<>0 do
  begin
    viPos:= Pos_Palavra_Exata(vS,Sql_Aux);

    vsAntes :=copy(pqy.sql.Text,0,viPos-1);
    vsDepois:=copy(pqy.sql.Text,viPos+length(ps),length(pqy.sql.Text));

    pqy.sql.Text:=vsAntes+ vsNoData_Sistema +vsDepois;

    Sql_Aux:=UpperCase(pqy.sql.Text);
  end;
end;

procedure FSubstitui_Valor( pS,psValor: String;pQy:TADOQuery) ;
var
  Sql_Aux  : string;
  vsAntes  : string;
  vsDepois : string;
  vS       : string;
  viPos    : integer;
begin
  if trim(pqy.sql.Text) = '' then
    raise exception.create('Comando SQl não disponivel - função "Utool.FSubstitui_Valor"');

  Sql_Aux:=UpperCase(pqy.sql.Text);
  vS:=UpperCase(pS);

  while Pos_Palavra_Exata(vS,Sql_Aux)<>0 do
  begin
    viPos:= Pos_Palavra_Exata(vS,Sql_Aux);

    vsAntes :=copy(pqy.sql.Text,0,viPos-1);
    vsDepois:=copy(pqy.sql.Text,viPos+length(ps),length(pqy.sql.Text));

    pqy.sql.Text:=vsAntes+ psValor +vsDepois;

    Sql_Aux:=UpperCase(pqy.sql.Text);
  end;                        
end;

function GetTemporaryPath : String;
var
  vPath : array[0..1024] of Char;
begin
  GetTempPath(1024,vPath);
  result := vPath;
end;
{
  Rotina RefreshQuery
  objetivo   : Atualizar Dados de uma query reposicionando no registro selecionado
  Parametros : qy : query a ser atualizada
               psChave : Lista dos campos de chave separados por virgula
}
procedure RefreshQuery(qy : TADOQuery;psChave : string);
var vaChave : aString;
    vvValores : variant;
    i : integer;
begin
   vaChave := StrtoArray(psChave,';');
   vvValores := VarArrayCreate([low(vaChave), high(vaChave)], varVariant);
   if qy.State = dsInactive then
      qy.Open
   else
   begin
     for i := low(vaChave) to high(vaChave) do
     begin
        vvValores[i] := qy.fieldbyname(vaChave[i]).value;
     end;
     qy.close;
     qy.open;
     if length(vaChave) = 1 then
        qy.Locate(psChave,vvValores[low(vaChave)],[loCaseInsensitive, loPartialKey])
     else
        qy.Locate(psChave,vvValores,[loCaseInsensitive, loPartialKey])     
   end;
end;
{
  Funcao StrtoArray
  objetivo   : Converte um string delimitado num array de string
  Parametros : psLista       : String que contem a lista a ser processada
               psDelimitador : caracter(es) usado(s) para marcar a separacao
               entre os itens do string
  retorno    : um array de Strings

  exemplo    : procedure teste;
               var vSTRING : string;
                   vArray : aString;
                   vQtItems : integer;
               begin
                  //cria a lista em string
                  vSTRING := 'a,b,c';
                  //Gera a lista e atribui a variavel vArray
                  vArray := StrtoArray( vSTRING, ',' );
                  //exibe o numero de items do array
                  vQtItems := length(vArray);
                  showmessage( inttostr(vQtItems)+' items');
               end;
}

function StrtoArray( psLista : string; psDelimitador : string = ',' ) : aString;
var vaString : aString;
    vsLista : String;
begin
   vaString := nil;
   vsLista := psLista;
   while Pos( psDelimitador, vsLista ) > 0 do
   begin
     setLength(vaString,length(vaString)+1);
     vaString[High(vaString)] := Copy(vsLista, 0, Pos(psDelimitador, vsLista) - 1);
     vsLista := Copy(vsLista, Pos(psDelimitador, vsLista) + 1, Length(vsLista));
   end;
   if trim(vsLista) <> '' then
   begin
     setLength(vaString,length(vaString)+1);
     vaString[High(vaString)] := vsLista;
   end;

   result := vaString;
end;
{
  Funcao ArraytoStr
  objetivo   : Converte um array de string em um string delimidado
  Parametros : paLista       : Array de strings a ser convertido
               psDelimitador : caracter(es) usado(s) para separar os itens no string
  retorno    : um Strings delimitado, contendo os items do array

  exemplo    : procedure exibe_array( pArray : aString);
               var vSTRING : string;
               begin
                  //Gera o String e atribui a variavel vString
                  vSTRING := ArraytoStr( pArray, ',' );
                  //exibe o string
                  showmessage( vSTRING );
               end;
}

function ArraytoStr( paLista : aString; psDelimitador : string = ',' ) : string;
var vString : String;
    i : integer;
begin
   vString := '';
   for i := low(paLista) to high(paLista) do
      AddStrtoList(paLista[i],vString,psDelimitador);
   result := vString;
end;

{
  Funcao AddStrtoList
  objetivo   : Adicionar um item a uma lista contida em um string
  Parametros : psString      : item a ser adicionado a lista
               psLista       : string que contem a lista
               psDelimitador : caracter(es) usado(s) para separar os itens no string
  retorno    : um string contendo uma lista
}
procedure AddStrtoList(psString : string; var psLista : String; psDelimitador : String = ',' );
var vString : String;
begin
   psLista := trim(psLista);
   vString := psString;
   if (length(psLista) <> 0 )then
      vString := psDelimitador+vString;
   psLista := psLista + vString;
end;

function Selecao_reg_Atual( qy : TDataSet; paChave, paChave_Alias : Array of string) : String;
var i : integer;
    vsValor_Campo : string;
    vfiCampo      : Tfield;
    vsFiltro : string;
begin
   vsFiltro := '';
   for i := low( paChave ) to high(paChave) do
   begin
      vfiCampo := qy.findField(paChave[i]);
      if vfiCampo <> nil then
      begin
         if vfiCampo.Datatype = ftString then
            vsValor_Campo := quotedStr(vfiCampo.asstring)
         else
            vsValor_Campo := vfiCampo.asstring;
         AddStrtoList(paChave_Alias[i]+'='+vsValor_Campo,vsFiltro,' AND ');
      end
      else
      begin
         exception.Create(' Não Encontrado o Campo '+ paChave[i] );
      end ;
   end;
   if trim(vsFiltro) <> '' then
      vsFiltro := '( ' + vsFiltro + ' ) ';
   result := vsFiltro;
end;

function BooleanToSn(pbBoolean:Boolean):string;
begin
 if(pbBoolean)then
   result:='S'
 else
   result:='N'
end;

function SnToBoolean(psString:string):Boolean;
begin
 result:=(Uppercase(psString)='S');
end;

//valida se o string contem numeros inteiros
function isInteger(ps:string):boolean;
begin
  result:=false;
  try
    strtoint(ps);
    result:=true;
  except
  end;
end;

function NumeroPar(pNumero : Integer): boolean;
begin
   result := (pNumero mod 2) = 0;
end;

function strtohex(pString : string): string;
var i : integer;
begin
   result := '';
   for i := 1 to (length(pString)) do
   begin
      result := result + (inttohex(ord(pString[i]),2));
   end;
end;

function hextostr(pString : string): string;
var i : integer;
    vsCaracter : string[2];
begin
   result := '';
   i := 1;
   if not NumeroPar(length(pString)) then
      raise exception.create('O numero de Caracteres do string deve ser par!');
   while i < length(pString) do
   begin
      vsCaracter := pString[i]+pString[i+1];
      result := result + chr(strtoint('$'+ vsCaracter));
      inc(i,2);
   end;
end;

procedure Gera_Inserts( psNotabela : string; pResult : TStrings;
                        pDataSet : TDataSet; psDriverName : string);
var vsCampos, vsValores : string;
    i : integer;
    vsShortDateformat : String;
    vsData : string;
begin
   vsCampos := '';
   pResult.clear;
   vsShortDateformat := ShortDateFormat;
   ShortDateFormat       := 'MM/dd/yyyy';

   with pDataset do
   begin
      First;
      while not eof do
      begin
         vsCampos := '';
         vsValores :='';
         for i := 0 to FieldCount - 1 do
         begin
            if ( fields[i].fieldkind = fkData ) then
            begin
               if not fields[i].IsNull then
               begin
                  if fields[i].DataType in [ftSmallint,ftFloat,ftInteger,ftWord ] then
                  begin
                     AddStrtolist(fields[i].value , vsValores);
                     addStrtolist(fields[i].fieldname,vsCampos);
                  end
                  else
                  if fields[i].DataType = ftString then
                  begin
                     AddStrtolist(quotedstr(fields[i].value) , vsValores);
                     addStrtolist(fields[i].fieldname,vsCampos);
                  end
                  else
                  if fields[i].DataType = ftDateTime then
                  begin
                     vsData :=quotedstr(datetimetostr(fields[i].value));
                     if UpperCase(psDriverName) = csDriver_Name_SYBASE then
                        AddStrtolist(vsData , vsValores)
                     else
                     if UpperCase(psDriverName) = csDriver_Name_MSSQL then
                        AddStrtolist(vsData , vsValores)
                     else
                     if UpperCase(psDriverName) = csDriver_Name_ORACLE then
                        AddStrtolist('TO_DATE('+vsData+','+quotedstr('MM/dd/yyyy HH24:MI:SS')+')' , vsValores);

                     addStrtolist(fields[i].fieldname,vsCampos);
                  end;
               end;
            end;
         end;
         pResult.add( 'INSERT INTO '+ psNoTabela );
         pResult.add( ' ( ' + vsCampos + ' )' );
         pResult.add( '  VALUES ');
         pResult.add( ' ( ' +vsValores +' )');

         if UpperCase(psDriverName) = csDriver_Name_SYBASE then
            pResult.add( 'GO ')
         else
         if UpperCase(psDriverName) = csDriver_Name_MSSQL then
            pResult.add( 'GO ')
         else
         if UpperCase(psDriverName) = csDriver_Name_ORACLE then
            pResult.add( ';');

         pResult.add( '');
         next;
      end;
   end;
   ShortDateFormat := vsShortDateformat;

end;

procedure Cria_Campos_Calculados(qy:TADOQuery;psLista_Campos:string);
var aCampos_Calculados:aString;
    i:integer;
begin
  aCampos_Calculados:=nil;
  if(qy.Fields.Count<1)then
  begin
    //cria tField para os outros campos
    GetFieldNames2(qy);
    for I := 0 to qy.FieldDefs.Count - 1 do
    begin
      F_Cria_TField ( qy.FieldDefs.Items[i].Datatype,
                      qy,qy,qy.FieldDefs.Items[i].Name,
                      qy.Name + qy.FieldDefs.Items[i].Name,
                      qy.FieldDefs.Items[i].Size);
    end;

    //cria Campos Calculados
    aCampos_Calculados:=strtoarray(psLista_Campos,';');
    for i:=low(aCampos_Calculados) to high(aCampos_Calculados) do
    begin
      F_Cria_TField (ftString,qy,qy,aCampos_Calculados[i],qy.Name+aCampos_Calculados[i],255,true);
    end;
  end;
end;

end.
