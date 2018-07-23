unit dtmPrincipal;

interface

uses
  Dialogs, SysUtils, Classes, Sockets, DB, DBTables, ItDatabase, DbErro,
  UniProvider, ODBCUniProvider, ASEUniProvider, DBAccess, Uni, MemDS, ADODB;

type
  TdmPrincipal = class(TDataModule)
    TcpClient: TTcpClient;
    sprb0033: TStoredProc;
    dbExterno: TItDatabase;
    Session: TSession;
    con: TADOConnection;
    qyTmp: TADOQuery;
    Query1: TADOQuery;
    qyTmp2: TADOQuery;
    qyParametro: TADOQuery;
    qyTipo_Dominio: TADOQuery;
    qyDominio: TADOQuery;
    procedure dbMainBeforeConnect(Sender: TObject);
    function  F_Localiza_Dominio( psCdDominio : string  ) : string;
  private
    { Private declarations }
    vaSequencia    : array of record
                                 NoSequencia : String;
                                 Sistema : Boolean
                              end;

    vaDominio      : array of record
                                 CDDOMINIO       : string;
                                 CDTIPO_DOMINIO  : integer;
                                 IDDOMINIO       : string;
                                 NODOMINIO       : string;
                              end;
    vaTipo_Dominio : array of record
                                 CDTIPO_DOMINIO    : integer;
                                 NOTIPO_DOMINIO    : string;
                              end;

    function Proximo_Valor_Sequencia(psNoSequencia: string;
      pbSistema: boolean): real;
    function Proximo_Valor_Sequencia_int(psNoSequencia: string;
      pbSistema: boolean): integer;
  public
    { Public declarations }
    function RemoverCaracteres(pValue, pTipo : String) : string;
    function SelecionarEstado(pUF : String) : string;
    function NextVal(psNoSequencia: string): real;
    function NextVal_int(psNoSequencia: string): integer;
    function Proximo_Valor_int(pTabela, pCampo : string; pFiltro: string = ''): integer;
    function Decode_SN(psSN: string): string;
    procedure MarcaOperador( psCdOperador, psSNLogado : string) ;
    function Valida_Parametro(psCDPARAMETRO : string ; psValor_Default : string = '') : string;
    function CriaQuery(psDataBaseName : string = 'dbMain' ) : TQuery;
    Function Procura_Descricao( pTabela,pCampo,pFiltro:string;psDataBaseName:string = 'dbMain'):string;

    function  StartTransaction : boolean;
    procedure CommitTransaction;
    procedure RollBackTransaction;
  end;

var
  dmPrincipal: TdmPrincipal;

const AppCdEmpresa = '1';

implementation

{$R *.dfm}


///////////////////////////////////////////////////////////////////////////
//Criar funcões int
///////////////////////////////////////////////////////////////////////////
function TDmPrincipal.NextVal_int(psNoSequencia : string) : integer;
var vbSistema,vbEncontrou : boolean;
    i : integer;
begin
   vbEncontrou := false;
   vbSistema := false;
   i := low(vaSequencia);
   while  ( i <= high(vaSequencia) ) and not vbEncontrou do
   begin
      if vaSequencia[i].NoSequencia = psNoSequencia then
      begin
         vbSistema := vaSequencia[i].Sistema;
         vbEncontrou := true
      end
      else
         inc(i);
   end;

   if not vbEncontrou then
   begin
      raise exception.create('Sequencia "'+psNoSequencia+'" não encontrada na tabela de Sequencias!');
      result := 0;
   end
   else
   // Faz o tratamento de Sequencia
   begin
      result := Proximo_Valor_Sequencia_int(psNoSequencia,vbSistema);
   end;
end;

// falta implementar tratamento de vlminimo, vlmaximo, snciclica
function TdmPrincipal.Proximo_Valor_Sequencia_int( psNoSequencia : string; pbSistema : boolean ) : integer;
begin
  with qyTmp do
  begin
    close;
    sql.clear;
    sql.add('SELECT VLATUAL, VLINCREMENTO, VLMINIMO, VLMAXIMO, SNCICLICA ');
    if pbSistema then
      sql.add('FROM SEQUENCIA')
    else
      sql.add('FROM SEQUENCIA_EMPRESA');
    sql.add('WHERE NOSEQUENCIA = '+quotedstr(psNoSequencia));
    if not pbSistema then
      sql.add('AND CDEMPRESA = '+AppCdEmpresa);
    open;
    if eof then
    begin
      if pbSistema then
        raise exception.create('Sequencia "'+psNoSequencia+'" não encontrada.')
      else
        raise exception.create('Sequencia de Empresa "'+psNoSequencia+'" não encontrada.')
    end;
  end;

  with qytmp2 do
  begin
    close;
    sql.clear;
    if pbSistema then
      sql.add('UPDATE SEQUENCIA')
    else
      sql.add('UPDATE SEQUENCIA_EMPRESA');
    sql.add('SET VLATUAL = :VLATUAL');
    sql.add('WHERE NOSEQUENCIA = '+quotedstr(psNoSequencia));

    if not pbSistema then
      sql.add('AND CDEMPRESA = '+AppCdEmpresa);

    sql.add('AND VLATUAL = '+qyTmp.fieldbyname('VLATUAL').asstring);
    // tenta a primeira atu
    result := qyTmp.fieldbyname('VLATUAL').AsInteger + qyTmp.fieldbyname('VLINCREMENTO').AsInteger;
    Parameters.ParamByName('VLATUAL').DataType := ftInteger;
    Parameters.ParamByName('VLATUAL').Value    := result;
    execsql;
    // EXECUTA RECURSIVAMENTE, ATE CONSEGUIR ATUALIZAR UM VALOR
    if rowsAffected = 0 then
      result := Proximo_Valor_Sequencia_int( psNoSequencia, pbSistema );
  end;
  qyTmp.close;
end;

function TDmPrincipal.NextVal(psNoSequencia : string) : real;
var vbSistema,vbEncontrou : boolean;
    i : integer;
begin
   vbEncontrou := false;
   vbSistema := false;
   i := low(vaSequencia);
   while  ( i <= high(vaSequencia) ) and not vbEncontrou do
   begin
      if vaSequencia[i].NoSequencia = psNoSequencia then
      begin
         vbSistema := vaSequencia[i].Sistema;
         vbEncontrou := true
      end
      else
         inc(i);
   end;

   if not vbEncontrou then
   begin
      raise exception.create('Sequencia "'+psNoSequencia+'" não encontrada na tabela de Sequencias!');
      result := 0;
   end
   else
   // Faz o tratamento de Sequencia
   begin
      result := Proximo_Valor_Sequencia(psNoSequencia,vbSistema);
   end;
end;

function TdmPrincipal.Proximo_Valor_Sequencia( psNoSequencia : string; pbSistema : boolean ) : real;
begin
  with qyTmp do
  begin
    close;
    sql.clear;
    sql.add('SELECT VLATUAL, VLINCREMENTO, VLMINIMO, VLMAXIMO, SNCICLICA ');
    if pbSistema then
      sql.add('FROM SEQUENCIA')
    else
      sql.add('FROM SEQUENCIA_EMPRESA');
    sql.add('WHERE NOSEQUENCIA = '+quotedstr(psNoSequencia));
    if not pbSistema then
      sql.add('AND CDEMPRESA = '+AppCdEmpresa);
    open;
    if eof then
    begin
      if pbSistema then
        raise exception.create('Sequencia "'+psNoSequencia+'" não encontrada.')
      else
        raise exception.create('Sequencia de Empresa "'+psNoSequencia+'" não encontrada.')
    end;
  end;

  with qytmp2 do
  begin
    close;
    sql.clear;
    if pbSistema then
      sql.add('UPDATE SEQUENCIA')
    else
      sql.add('UPDATE SEQUENCIA_EMPRESA');
    sql.add('SET VLATUAL = :VLATUAL');
    sql.add('WHERE NOSEQUENCIA = '+quotedstr(psNoSequencia));

    if not pbSistema then
      sql.add('AND CDEMPRESA = '+AppCdEmpresa);

    sql.add('AND VLATUAL = '+qyTmp.fieldbyname('VLATUAL').asstring);
    // tenta a primeira atu
    result := qyTmp.fieldbyname('VLATUAL').AsFloat + qyTmp.fieldbyname('VLINCREMENTO').AsFloat;


    Parameters.ParamByName('VLATUAL').DataType := ftFloat;
    Parameters.ParamByName('VLATUAL').Value := result;
    execsql;
    // EXECUTA RECURSIVAMENTE, ATE CONSEGUIR ATUALIZAR UM VALOR
    if rowsAffected = 0 then
      result := Proximo_Valor_Sequencia( psNoSequencia, pbSistema );
  end;
  qyTmp.close;
end;


procedure TdmPrincipal.CommitTransaction;
begin
  //if ( dbMain.DriverName <> csDriver_Name_ACCESS ) then
  //dbMain.Commit;
  con.CommitTrans;
end;

function TdmPrincipal.CriaQuery(psDataBaseName: string): TQuery;
var vQuery : TQuery;
begin
  vQuery := TQuery.create(self);
  with vQuery do
  begin
    close;
    sql.clear;
    SessionName  := 'Session';
    DataBaseName := psDataBaseName;
  end;
  result := vQuery
end;

procedure TdmPrincipal.dbMainBeforeConnect(Sender: TObject);
//var HostName:String;
begin
//  HostName :=  TcpClient.LocalHostAddr+ '; sa' ;// + '; ' + TcpClient.LocalHostName;
//
//  dbMain.params.values['DATABASE NAME'] := '';
//  dbMain.params.values['HOST NAME'] := HostName;
//  dbMain.params.values['APPLICATION NAME'] := TcpClient.LocalHostName;
end;

function TdmPrincipal.RemoverCaracteres(pValue, pTipo: String): string;
begin
  with sprb0033 do
  begin
    ParamByName('@PSTRING_ORIGEM').AsString := pValue;
    ParamByName('@PTIPO').AsString          := pTipo;
    ExecProc;

    result := ParamByName('@PSTRING_ALTERADO').AsString;
  end;
end;

procedure TdmPrincipal.RollBackTransaction;
begin
  //if ( dbMain.DriverName <> csDriver_Name_ACCESS ) then
  //dbMain.Rollback;
  con.RollbackTrans;
end;

function TdmPrincipal.SelecionarEstado(pUF: String): string;
begin
  Query1.Close;
//  Query1.SessionName  := Session.Name;
//  Query1.DatabaseName := dbMain.DatabaseName;
  Query1.Connection := con;
  Query1.SQL.Clear;
  Query1.SQL.Add('SELECT NOESTADO FROM ESTADO');
  Query1.SQL.Add('WHERE CDSIGLA_ESTADO = ' + QuotedStr(pUF));
//  Query1.SQL.SaveToFile('c:\edson.txt');
  Query1.Open;

  if not Query1.IsEmpty then
  begin
    Query1.First;
    Result := Query1.Fields.fieldByName('NOESTADO').AsString;
  end;
end;

function TdmPrincipal.StartTransaction: boolean;
begin
  // Não utilizar tratamento de transacao para o acces
  if ( con.InTransaction ) {or ( dbMain.DriverName = csDriver_Name_ACCESS )} then
      result := false
  else
  begin
     result := true;
     con.BeginTrans;
  end;
end;

function TdmPrincipal.Decode_SN(psSN:string):string;
begin
 if (psSN<>'') then
 begin
   if (psSN= 'N') then
     result:='Não'
   else
   if (psSN= 'S') then
      result:='Sim';
 end;
end;

function TdmPrincipal.F_Localiza_Dominio(psCdDominio: string): string;
var I : integer;
    vbEncontrou : boolean;
    viCdTipo_Dominio : integer;
begin
  try
    vbEncontrou := false;
    if psCdDominio = '' then
    begin
      result := '';
    end
    else
    begin
      // Acha o Dominio
      viCdTipo_Dominio := strtoint(copy(psCdDominio,1,3));

      // Verifica se o Dominio ja foi carregado...
      i := low(vaTipo_Dominio);
      while  ( i <= high(vaTipo_Dominio) ) and not vbEncontrou do
      begin
        if vaTipo_Dominio[i].CDTIPO_DOMINIO = viCdTipo_Dominio then
          vbEncontrou := true
        else
          inc(i);
      end;

      // Se nao encontrou carrega o tipo de dominio e o dominio
      if Not vbEncontrou then
      begin
        with qyTipo_Dominio do
        begin
          close;
          Parameters.ParamByName('CdTipo_Dominio').DataType := ftInteger;
          Parameters.ParamByName('CdTipo_Dominio').Value    := viCdTipo_Dominio;
          open;
          if not eof then
          begin
            // Carregando o Dominio
            vbEncontrou := true;
            setLength(vaTipo_Dominio,Length(vaTipo_Dominio)+1);
            vaTipo_Dominio[high(vaTipo_Dominio)].CDTIPO_DOMINIO    := fieldbyname('CDTIPO_DOMINIO').asInteger;
            vaTipo_Dominio[high(vaTipo_Dominio)].NOTIPO_DOMINIO    := fieldbyname('NOTIPO_DOMINIO').asString;
            close;
            // Carregando
            with qyDominio do
            begin
              close;
              Parameters.ParamByName('CdTipo_Dominio').DataType := ftInteger;
              Parameters.ParamByName('CdTipo_Dominio').Value := viCdTipo_Dominio;
              open;
              while not eof do
              begin
                setLength(vaDominio,Length(vaDominio)+1);
                vaDominio[high(vaDominio)].CDDOMINIO      := fieldbyname('CDDOMINIO').asstring;
                vaDominio[high(vaDominio)].CDTIPO_DOMINIO := fieldbyname('CDTIPO_DOMINIO').asInteger;
                vaDominio[high(vaDominio)].IDDOMINIO      := fieldbyname('IDDOMINIO').asstring;
                vaDominio[high(vaDominio)].NODOMINIO      := fieldbyname('NODOMINIO').asstring;
                next;
              end;
              close;
            end;
          end;
        end;
      end;
      // Se encontrou o Tipo de Dominio Progura o dominio
      if vbEncontrou then
      begin
        vbEncontrou := false;
        i := low(vaDominio);
        while ( i <= high(vaDominio) ) and not vbEncontrou do
        begin
          if vaDominio[i].CDDOMINIO = psCdDominio then
          begin
            vbEncontrou := true;
            result := vaDominio[i].NODOMINIO;
          end
          else
            inc(i);
        end;
      end;
      if not vbEncontrou then
        result := 'Não Encontrado';
    end;
  except
    on ve:exception do
    begin
      TFmErro.showerror(self,ve, 'Erro Função "dmPrincipal.F_Localiza_Dominio" '+ chr(13)+
                                 'Dominio: "'+psCdDominio+'"' );
    end;
  end;
end;

procedure TdmPrincipal.MarcaOperador(psCdOperador, psSNLogado: string);
var vsSncontrola_conexao : string;
begin
  with qytmp do
  begin
    close;
    sql.clear;
    sql.add('SELECT SNCONTROLA_CONEXAO FROM OPERADOR');
    sql.add('WHERE CDOPERADOR = '+ quotedstr(psCdOperador));
    open;
    vsSncontrola_conexao:=FieldByname('SNCONTROLA_CONEXAO').asstring;
  end;

  if vsSncontrola_conexao = 'S' then
  begin
     with qyTmp do
     begin
       close;
       sql.clear;
       sql.add( ' UPDATE OPERADOR                   ');
       sql.add( ' SET SNLOGADO      = :SNLOGADO   , ');
       //sql.add( '     DTALTERACAO   = '+ FData_Sistema(FDriverName(SessionName, DataBasename  )));
       sql.add( '     DTALTERACAO   = '+ DateToStr(Date));
   //    sql.add( '     DTALTERACAO   = :DTALTERACAO  ');
       sql.add( ' WHERE CDOPERADOR  = :CDOPERADOR   ');
       Parameters.ParamByName('CDOPERADOR').DataType := ftString;
       Parameters.ParamByName('CDOPERADOR').Value := psCdOperador;
   //    parambyname('DTALTERACAO').asDatetime := dmPrincipal.data_Sistema;
       Parameters.ParamByName('SNLOGADO').DataType := ftString;
       Parameters.ParamByName('SNLOGADO').Value     := psSNLogado;
       try
         execSql;
       except
         on ve : Exception do
           TFmErro.showerror(self,ve,'Erro na função "TdmPrincipal.MarcaOperador"' );
       end;
     end;
  end;
end;

function TdmPrincipal.Procura_Descricao(pTabela, pCampo, pFiltro,
  psDataBaseName: string): string;
begin
  with CriaQuery(psDataBaseName) do
  begin
    close;
    sql.clear;
    sql.add('SELECT '+pCampo+' AS NOME FROM '+ pTabela + ' ' + pFiltro );
    try
      open;
      result := fieldbyname('NOME').asstring;
    except
      on ve : Exception do
      begin
        TFmErro.showerror(self,ve,'Erro Função "dmPrincipal.Procura_Descricao" '+ chr(13)+Sql.text);
      end;
    end;
    close;
    free;
  end;
end;

Function TdmPrincipal.Proximo_Valor_int( pTabela, pCampo : string ; pFiltro : string ='') : integer;
begin
  result := 0;
  with qyTmp do
  begin
    close;
    sql.clear;
    sql.add('SELECT ISNULL(MAX('+pCampo+'),0) AS PROXIMO FROM '+ pTabela + ' ' + pFiltro );
    try
      open;
      result := fieldbyname('PROXIMO').AsInteger + 1;
    except
      on ve : Exception do
      begin
        TFmErro.showerror(self,ve,'Erro Função "dmPrincipal.Proximo_Valor_int" '+ chr(13)+Sql.text);
      end;
    end;
    close;
  end;
end;

function TdmPrincipal.Valida_Parametro(psCDPARAMETRO : string ; psValor_Default : string = '') : string;
begin
  with qyParametro do
  begin
    close;
    Parameters.ParamByName('CDPARAMETRO').DataType := ftString;
    Parameters.ParamByName('CDPARAMETRO').Value    := psCdParametro;
    open;
    if eof then
    begin
      if psValor_Default = '' then
      begin
        result := '';
        showMessage('Parametro '+psCdParametro+' não encontrado!');
      end
      else
        result := psValor_Default;
    end
    else
      result := fieldbyname('VLPARAMETRO').asstring;
    close;
  end;
end;

end.
