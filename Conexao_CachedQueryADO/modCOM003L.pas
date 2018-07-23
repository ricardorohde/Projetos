{**********************************************************************************
*** Programa : modCOM003L - DATA MODULE DE LOG E DUPLA CUSTODIA                 ***
*** Autor    : ISRAEL                                                           ***
*** Ação/RP  :                                                                  ***
*** Data     : 01/08/2006                                                       ***
*** Descrição: Rotinas para geracao de Log Manutencao e Controle Dupla Custodia ***
***********************************************************************************
***********************************************************************************
***              HISTORICO MANUTENCAO DA PROCEDURE                              ***
*** --------------------------------------------------------------------------- ***
***  Release/RP  : 59 - Projeto Gap Nível de Gastos - Fase 1                    ***
***  Analista    : Rodrigo Oriola                                               ***
***  Alteracao   : 11/03/2014                                                   ***
***  Comentarios : Inclusão da nova Tela "Regra Nível de Gastos (PRE268MA)"     ***
***                na Dupla Custódia nova.                                      ***
**********************************************************************************}
unit modCOM003L;

interface

uses
  SysUtils, Classes, DB, DBTables, udeclara, utool,dberro, modCOM002A,
  JvMemoryDataset, MemDS, DBAccess, Uni, ADODB, Variants;

type
  TReg_Log_Manutencao_Chave = record
     CDLOG_MANUTENCAO  : integer;
     SQREGISTRO        : integer;
     NOCAMPO           : String;
     DSCAMPO           : String;
     VLCAMPO           : String;
     DSVALOR           : String;
  end;
  TReg_Log_Manutencao_Campo = record
     CDLOG_MANUTENCAO  : integer;
     SQREGISTRO        : integer;
     NOCAMPO           : String;
     DSCAMPO           : String;
     VLANTERIOR        : String;
     DSVALOR_ANTERIOR  : String;
     VLATUAL           : String;
     DSVALOR_ATUAL     : String;
  end;
  TReg_Manutencao_Blob = record
     NOCAMPO           : String;
     VLATUAL           : Variant;
  end;

  TdmCOM003L = class(TDataModule)
    qyInsLog_Manutencao: TADOQuery;
    qyInsLog_Manutencao_Campo: TADOQuery;
    qyInsLog_Manutencao_Registro: TADOQuery;
    qyInsLog_Manutencao_Chave: TADOQuery;
    qyUpLog_Manutencao: TADOQuery;
    qyLog_Manutencao_Campo: TADOQuery;
    qyLog_Manutencao_Chave: TADOQuery;
    qyLog_Manutencao_Registro: TADOQuery;
    qyAplica_Manutencao: TADOQuery;
    qyPrograma: TADOQuery;
    JvMemData: TJvMemoryData;
    JvMemDataTABELA: TStringField;
    JvMemDataCAMPO: TStringField;
    JvMemDataCHAVE: TStringField;
    qyLista_Manutencao_Registro: TADOQuery;
  private
    procedure Setar_Parametros(psNoTabela,psTpMAnutencao: String;paCampos:TaCampos);
    { Private declarations }
  public
    { Public declarations }
    function grava_log_manutencao( psCdPrograma, psTpManutencao, psCdStatus_Manutencao: String) : integer;
    function grava_log_manutencao_registro( piCdLog_manutencao, piNrOrdem : integer; psNoTabela, psTpManutencao : String):integer;
    procedure grava_log_manutencao_chave( prLog_Manutencao_Chave :  TReg_Log_Manutencao_Chave );
    procedure grava_log_manutencao_campo( prLog_Manutencao_Campo : TReg_Log_Manutencao_Campo );
    procedure Atualiza_Log_Manutencao(piCdLog_Manutencao:integer;psCdStatus_Manutencao: String);
    procedure Confirma_Manutencao(piCdLog_Manutencao:integer;psTpMAnutencao:String);
    procedure Confirma_Alteracao(piCdLog_Manutencao, piSqRegistro:integer);
    procedure Confirma_Exclusao(piCdLog_Manutencao, piSqRegistro:integer);
    procedure Confirma_Inclusao(piCdLog_Manutencao, piSqRegistro:integer);
    function Verifica_Autorizacao(psCdPrograma,psTpManutencao:string):boolean;
    function Monta_Lista_Programas_Log(pbConfirmacao: boolean): string;
  end;

var
  dmCOM003L: TdmCOM003L;

implementation

uses dtmPrincipal;

//uses ModPrincipal;

{$R *.dfm}


function TdmCOM003L.grava_log_manutencao( psCdPrograma, psTpManutencao, psCdStatus_Manutencao : String):integer;
var viCdLog_Manutencao : integer;
begin
  viCdLog_Manutencao := dmPrincipal.nextVal_int('SEQ_LOG_MANUTENCAO');

  with qyInsLog_Manutencao do
  begin
    Parameters.ParamByName('CDLOG_MANUTENCAO').DataType := ftFloat;
    Parameters.ParamByName('CDLOG_MANUTENCAO').Value := viCdLog_Manutencao;
    Parameters.parambyname('CDPROGRAMA').DataType := ftString;
    Parameters.parambyname('CDPROGRAMA').Value    := psCdPrograma;
    Parameters.parambyname('TPMANUTENCAO').DataType := ftString;
    Parameters.parambyname('TPMANUTENCAO').Value := psTpManutencao;
    Parameters.parambyname('CDSTATUS_MANUTENCAO').DataType := ftString;
    Parameters.parambyname('CDSTATUS_MANUTENCAO').Value := psCdStatus_Manutencao;
    Parameters.parambyname('CDOPERADOR_MANUTENCAO').DataType := ftString;
    Parameters.parambyname('CDOPERADOR_MANUTENCAO').Value := AppSysOper;
    FSubstitui_Data_Sistema('DATA_SISTEMA',qyInsLog_Manutencao);
    execsql;
  end;
  result := viCdLog_Manutencao;
end;

function TdmCOM003L.grava_log_manutencao_registro( piCdLog_manutencao, piNrOrdem : integer; psNoTabela, psTpManutencao: String):integer;
var viSqRegistro : integer;
begin
  viSqRegistro := dmPrincipal.Proximo_Valor_int( 'LOG_MANUTENCAO_REGISTRO', 'SQREGISTRO',
                                             'WHERE CDLOG_MANUTENCAO = '+inttostr(piCdLog_manutencao));
  with qyInsLog_Manutencao_registro do
  begin
    Parameters.parambyname('CDLOG_MANUTENCAO').DataType  := ftInteger;
    Parameters.parambyname('CDLOG_MANUTENCAO').Value := piCdLog_Manutencao;
    Parameters.parambyname('SQREGISTRO').DataType  := ftInteger;
    Parameters.parambyname('SQREGISTRO').Value := viSqRegistro;
    Parameters.parambyname('NOTABELA').DataType := ftString;
    Parameters.parambyname('NOTABELA').Value := psNoTabela;
    Parameters.parambyname('TPMANUTENCAO').DataType := ftString;
    Parameters.parambyname('TPMANUTENCAO').Value := psTpManutencao;
    Parameters.parambyname('NRORDEM').DataType := ftInteger;
    Parameters.parambyname('NRORDEM').Value    := piNrOrdem;
    execsql;
  end;
  result := viSqRegistro;
end;

procedure TdmCOM003L.grava_log_manutencao_chave( prLog_Manutencao_Chave :  TReg_Log_Manutencao_Chave );
begin
  with qyInsLog_Manutencao_Chave do
  begin
//    Parameters.parambyname('CDLOG_MANUTENCAO').asInteger := prLog_Manutencao_Chave.CDLOG_MANUTENCAO;
//    Parameters.parambyname('SQREGISTRO').asInteger := prLog_Manutencao_Chave.SQREGISTRO;
//    Parameters.parambyname('NOCAMPO').asString  := prLog_Manutencao_Chave.NOCAMPO;
//    Parameters.parambyname('DSCAMPO').asString  := prLog_Manutencao_Chave.DSCAMPO;
//    Parameters.parambyname('VLCAMPO').asString  := prLog_Manutencao_Chave.VLCAMPO;
//    Parameters.parambyname('DSVALOR').asString  := prLog_Manutencao_Chave.DSVALOR;

    Parameters.parambyname('CDLOG_MANUTENCAO').Value := prLog_Manutencao_Chave.CDLOG_MANUTENCAO;
    Parameters.parambyname('SQREGISTRO').Value := prLog_Manutencao_Chave.SQREGISTRO;
    Parameters.parambyname('NOCAMPO').Value  := prLog_Manutencao_Chave.NOCAMPO;
    Parameters.parambyname('DSCAMPO').Value  := prLog_Manutencao_Chave.DSCAMPO;
    Parameters.parambyname('VLCAMPO').Value  := prLog_Manutencao_Chave.VLCAMPO;
    Parameters.parambyname('DSVALOR').Value  := prLog_Manutencao_Chave.DSVALOR;
    execsql;
  end;
end;


procedure TdmCOM003L.grava_log_manutencao_campo( prLog_Manutencao_Campo :  TReg_Log_Manutencao_Campo );
begin
  with qyInsLog_Manutencao_Campo do
  begin
//    parambyname('CDLOG_MANUTENCAO').asInteger := prLog_Manutencao_Campo.CDLOG_MANUTENCAO;
//    parambyname('SQREGISTRO').asInteger       := prLog_Manutencao_Campo.SQREGISTRO;
//    parambyname('NOCAMPO').asString           := prLog_Manutencao_Campo.NOCAMPO;
//    parambyname('DSCAMPO').asString           := prLog_Manutencao_Campo.DSCAMPO;

    Parameters.parambyname('CDLOG_MANUTENCAO').Value := prLog_Manutencao_Campo.CDLOG_MANUTENCAO;
    Parameters.parambyname('SQREGISTRO').Value       := prLog_Manutencao_Campo.SQREGISTRO;
    Parameters.parambyname('NOCAMPO').Value           := prLog_Manutencao_Campo.NOCAMPO;
    Parameters.parambyname('DSCAMPO').Value           := prLog_Manutencao_Campo.DSCAMPO;

    if(trim(prLog_Manutencao_Campo.VLANTERIOR) <> '' ) then
//       parambyname('VLANTERIOR').asString := prLog_Manutencao_Campo.VLANTERIOR
      Parameters.parambyname('VLANTERIOR').Value := prLog_Manutencao_Campo.VLANTERIOR
    else
//       Parameters.parambyname('VLANTERIOR').Clear;
       Parameters.parambyname('VLANTERIOR').Value := null;

    if(trim(prLog_Manutencao_Campo.DSVALOR_ANTERIOR) <> '' ) then
       //parambyname('DSVALOR_ANTERIOR').asString := prLog_Manutencao_Campo.DSVALOR_ANTERIOR
       Parameters.parambyname('DSVALOR_ANTERIOR').Value := prLog_Manutencao_Campo.DSVALOR_ANTERIOR
    else
//       Parameters.parambyname('DSVALOR_ANTERIOR').clear;
      Parameters.parambyname('DSVALOR_ANTERIOR').Value := null;

    if(trim(prLog_Manutencao_Campo.VLATUAL) <> '' ) then
       //parambyname('VLATUAL').asString := prLog_Manutencao_Campo.VLATUAL
       Parameters.parambyname('VLATUAL').Value := prLog_Manutencao_Campo.VLATUAL
    else
       //Parameters.parambyname('VLATUAL').clear;
       Parameters.parambyname('VLATUAL').Value := null;

    if(trim(prLog_Manutencao_Campo.DSVALOR_ATUAL) <> '' ) then
       //parambyname('DSVALOR_ATUAL').asString := prLog_Manutencao_Campo.DSVALOR_ATUAL
       Parameters.parambyname('DSVALOR_ATUAL').Value := prLog_Manutencao_Campo.DSVALOR_ATUAL
    else
       //parambyname('DSVALOR_ATUAL').clear;
       Parameters.parambyname('DSVALOR_ATUAL').Value := null;

    execsql;
  end;
end;

procedure TdmCOM003L.Atualiza_Log_Manutencao(piCdLog_Manutencao:integer;psCdStatus_Manutencao: String);
begin
  with qyUpLog_Manutencao do
  begin
    close;
//    Parameters.paramByName('CDLOG_MANUTENCAO').asInteger:= piCdLog_Manutencao;
//    Parameters.paramByName('CDSTATUS_MANUTENCAO').asString:= psCdStatus_Manutencao;
//    Parameters.paramByName('CDOPERADOR_DUPLA_CUSTODIA').asString:= AppSysOper;
    Parameters.paramByName('CDLOG_MANUTENCAO').Value:= piCdLog_Manutencao;
    Parameters.paramByName('CDSTATUS_MANUTENCAO').Value:= psCdStatus_Manutencao;
    Parameters.paramByName('CDOPERADOR_DUPLA_CUSTODIA').Value:= AppSysOper;
    FSubstitui_Data_Sistema('DATA_SISTEMA',qyUpLog_Manutencao);
    execSql;
  end;
end;


procedure TdmCOM003L.Confirma_Manutencao(piCdLog_Manutencao: integer;psTpMAnutencao:String);
begin
  dmprincipal.StartTransaction;
  try
    with qyLista_Manutencao_Registro do begin
       Close;
       SQL.Clear;
       SQL.Add('SELECT SQREGISTRO,NOTABELA,TPMANUTENCAO FROM LOG_MANUTENCAO_REGISTRO');
       SQL.Add('WHERE CDLOG_MANUTENCAO = :CDLOG_MANUTENCAO');
       if(psTpMAnutencao=csTpManutencao_Exclusao)then
          SQL.Add('ORDER BY NRORDEM DESC')
        else
         SQL.Add('ORDER BY NRORDEM,SQREGISTRO');
       //ParamByName('CDLOG_MANUTENCAO').AsInteger:= piCdLog_Manutencao;
       Parameters.ParamByName('CDLOG_MANUTENCAO').Value:= piCdLog_Manutencao;
       Open;
    end;
    qyLista_Manutencao_Registro.First;
    while not(qyLista_Manutencao_Registro.Eof)do
     begin
      if(qyLista_Manutencao_Registro.FieldByName('TPMANUTENCAO').Value <> '')then
        psTpMAnutencao := qyLista_Manutencao_Registro.FieldByName('TPMANUTENCAO').Value;

      if(psTpMAnutencao=csTpManutencao_Inclusao)then
        Confirma_Inclusao(piCdLog_Manutencao,qyLista_Manutencao_Registro.FieldByName('SQREGISTRO').Value)
      else
      if(psTpMAnutencao=csTpManutencao_Alteracao)then
        Confirma_Alteracao(piCdLog_Manutencao,qyLista_Manutencao_Registro.FieldByName('SQREGISTRO').Value)
      else
        Confirma_Exclusao(piCdLog_Manutencao,qyLista_Manutencao_Registro.FieldByName('SQREGISTRO').Value);
      qyLista_Manutencao_Registro.Next;
     end;
    Atualiza_Log_Manutencao(piCdLog_Manutencao,csCdStatus_Manutencao_Aprovado);
    dmprincipal.CommitTransaction;
  except
    on e:Exception do
    begin
      dmPrincipal.RollbackTransAction;
      TFmErro.showerror( self, e );
    end;
  end;
end;

procedure TdmCOM003L.Confirma_Alteracao(piCdLog_Manutencao, piSqRegistro:integer);
var vsSet,vsWhere,vsNoCampo,vsNoTabela, vSQL:String;
    vaCampos:TaCampos;
begin
  qyLog_Manutencao_Registro.Close;
  if(piSqRegistro <> 0)then
    begin
      qyLog_Manutencao_Registro.sql.Clear;
      vSQL:='SELECT SQREGISTRO,NOTABELA,TPMANUTENCAO FROM LOG_MANUTENCAO_REGISTRO WHERE CDLOG_MANUTENCAO = :CDLOG_MANUTENCAO AND SQREGISTRO = :SQREGISTRO ORDER BY NRORDEM,SQREGISTRO';
      qyLog_Manutencao_Registro.sql.Add(vSQL);
//      qyLog_Manutencao_Registro.ParamByName('CDLOG_MANUTENCAO').AsInteger:= piCdLog_Manutencao;
//      qyLog_Manutencao_Registro.ParamByName('SQREGISTRO').AsInteger:= piSqRegistro;
      qyLog_Manutencao_Registro.Parameters.ParamByName('CDLOG_MANUTENCAO').Value:= piCdLog_Manutencao;
      qyLog_Manutencao_Registro.Parameters.ParamByName('SQREGISTRO').Value:= piSqRegistro;
    end
  else
    begin
      qyLog_Manutencao_Registro.sql.Clear;
      vSQL:='SELECT SQREGISTRO,NOTABELA,TPMANUTENCAO FROM LOG_MANUTENCAO_REGISTRO WHERE CDLOG_MANUTENCAO = :CDLOG_MANUTENCAO ORDER BY NRORDEM,SQREGISTRO';
      qyLog_Manutencao_Registro.sql.Add(vSQL);
//      qyLog_Manutencao_Registro.ParamByName('CDLOG_MANUTENCAO').AsInteger:= piCdLog_Manutencao;
      qyLog_Manutencao_Registro.Parameters.ParamByName('CDLOG_MANUTENCAO').Value:= piCdLog_Manutencao;
    end;

  qyLog_Manutencao_Registro.Open;

  while not qyLog_Manutencao_Registro.Eof do
  begin
    vsNoTabela:= qyLog_Manutencao_Registro.FieldByName('NOTABELA').AsString;
    vaCampos:= dmCOM002A.Carrega_definicao_campos(vsNoTabela);

    vsSet:='';
    vsWhere:='';

    with qyLog_Manutencao_Campo do
    begin
      Close;
//      ParamByName('CDLOG_MANUTENCAO').AsInteger:= piCdLog_Manutencao;
//      ParamByName('SQREGISTRO').AsInteger:= qyLog_Manutencao_Registro.FieldByName('SQREGISTRO').AsInteger;
      Parameters.ParamByName('CDLOG_MANUTENCAO').Value:= piCdLog_Manutencao;
      Parameters.ParamByName('SQREGISTRO').Value:= qyLog_Manutencao_Registro.FieldByName('SQREGISTRO').AsInteger;
      Open;

      while not Eof do
      begin
        vsNoCampo:= FieldByName('NOCAMPO').AsString;
        // MONTA SET
        if(FieldByName('VLATUAL').AsString <>'')then begin
          if dmCOM002A.Obtem_Tipo_Campo(vsNoCampo,vaCampos) = '044N' then
           begin
             try
              StrToFloat(FieldByName('VLATUAL').AsString);
              if not(Pos('.',FieldByName('VLATUAL').AsString) >0)then
              if (Pos(',',FieldByName('VLATUAL').AsString) >0)then
              AddStrtoList(vsNoCampo+ '= '+ReplaceChar(',','.',FieldByName('VLATUAL').AsString),vsSet)
              else
              AddStrtoList(vsNoCampo+' = :'+vsNoCampo,vsSet);
             except
              AddStrtoList(vsNoCampo+' = :'+vsNoCampo,vsSet);
             end;
           end
          else if ((vsNoCampo = 'FATOR') or (vsNoCampo = 'VALCPP') or (vsNoCampo = 'NRFATOR_CONVERSAO')) then
             AddStrtoList(vsNoCampo+ '= '+ReplaceChar(',','.',FieldByName('VLATUAL').AsString),vsSet)
          else
             AddStrtoList(vsNoCampo+' = :'+vsNoCampo,vsSet)
        end else
             AddStrtoList(vsNoCampo+' = NULL',vsSet);

        // MONTA WHERE ( PARA VALIDAR DADOS DESATUALIZADOS )
        if(FieldByName('VLANTERIOR').AsString <>'')then begin
          if dmCOM002A.Obtem_Tipo_Campo(vsNoCampo,vaCampos) = '044N' then
           begin
             try
              StrToFloat(FieldByName('VLANTERIOR').AsString);
              if not(Pos('.',FieldByName('VLANTERIOR').AsString) >0)then
              if (Pos(',',FieldByName('VLANTERIOR').AsString) >0)then
              AddStrtoList(vsNoCampo+ '= '+ReplaceChar(',','.',FieldByName('VLANTERIOR').AsString),vsWhere,' AND ')
              else
              AddStrtoList(vsNoCampo+' = :'+vsNoCampo+'_OLD',vsWhere,' AND ');
             except
              AddStrtoList(vsNoCampo+' = :'+vsNoCampo+'_OLD',vsWhere,' AND ');
             end;
           end
          else if ((vsNoCampo = 'FATOR') or (vsNoCampo = 'VALCPP') or (vsNoCampo = 'NRFATOR_CONVERSAO')) then
             AddStrtoList(vsNoCampo+ '= '+ReplaceChar(',','.',FieldByName('VLANTERIOR').AsString),vsWhere,' AND ')
          else
             AddStrtoList(vsNoCampo+' = :'+vsNoCampo+'_OLD',vsWhere,' AND ')
        end else
             AddStrtoList(vsNoCampo+' IS NULL',vsWhere,' AND ');
        Next;
      end;
    end;
    with qyLog_Manutencao_Chave do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT NOCAMPO,VLCAMPO FROM LOG_MANUTENCAO_CHAVE');
      SQL.Add('WHERE');
      SQL.Add('CDLOG_MANUTENCAO = :CDLOG_MANUTENCAO');
      //ParamByName('CDLOG_MANUTENCAO').AsInteger:= piCdLog_Manutencao;
      Parameters.ParamByName('CDLOG_MANUTENCAO').Value:= piCdLog_Manutencao;
      //VERIFICA SE EH A PRIMEIRA TABELA, CASO SEJA ADICIONA SQREGISTRO IGUAL A 1
      //SE NAO FOR NAO ADICIONA USANDO ASSIM A CHAVE DA TABELA PRINCIPAL COMO CHAVE DA TABELA AUXILIAR
      if qyLog_Manutencao_Registro.FieldByName('SQREGISTRO').AsInteger = 1 then
      begin
        SQL.Add('AND SQREGISTRO = :SQREGISTRO');
        //ParamByName('SQREGISTRO').AsInteger:= qyLog_Manutencao_Registro.FieldByName('SQREGISTRO').AsInteger;
        Parameters.ParamByName('SQREGISTRO').Value:= qyLog_Manutencao_Registro.FieldByName('SQREGISTRO').AsInteger;
      end;
      Open;

      while not Eof do
      begin
        vsNoCampo:= FieldByName('NOCAMPO').AsString;
        if(FieldByName('VLCAMPO').AsString <>'')then
          AddStrtoList(vsNoCampo+' = :'+vsNoCampo,vsWhere,' AND ')
        else
          AddStrtoList(vsNoCampo+' IS NULL',vsWhere,' AND ');

        Next;
      end;
    end;

    if(dmCOM002A.Campo_Existe('CDOPERADOR_ALTERACAO',vaCampos))then
      AddStrtoList('CDOPERADOR_ALTERACAO = :CDOPERADOR',vsSet);

    if(dmCOM002A.Campo_Existe('DTALTERACAO',vaCampos))then
      AddStrtoList('DTALTERACAO = :DATA',vsSet);

    with qyAplica_Manutencao do
    begin
      Sql.Clear;
      SQL.Add('UPDATE '+vsNoTabela);
      SQL.Add('SET '+ vsSet);
      SQL.Add('WHERE '+vsWhere);
      //SETAR PARAMETROS
      Setar_Parametros(vsNoTabela,csTpManutencao_Alteracao,vaCampos);
      ExecSql;

      if(  RowsAffected<1)then
        raise Exception.Create('DADOS DESATUALIZADOS');
    end;

    qyLog_Manutencao_Registro.Next;
  end;
end;

procedure TdmCOM003L.Confirma_Exclusao(piCdLog_Manutencao, piSqRegistro:integer);
var vsWhere,vsNoCampo,vsNoTabela, vSQL:String;
    vaCampos:TaCampos;
begin
  vsWhere:='';

  qyLog_Manutencao_Registro.Close;
  if(piSqRegistro <> 0)then
    begin
      qyLog_Manutencao_Registro.sql.Clear;
      vSQL:='SELECT SQREGISTRO,NOTABELA,TPMANUTENCAO FROM LOG_MANUTENCAO_REGISTRO WHERE CDLOG_MANUTENCAO = :CDLOG_MANUTENCAO AND SQREGISTRO = :SQREGISTRO ORDER BY NRORDEM,SQREGISTRO';
      qyLog_Manutencao_Registro.sql.Add(vSQL);
//      qyLog_Manutencao_Registro.ParamByName('CDLOG_MANUTENCAO').AsInteger:= piCdLog_Manutencao;
//      qyLog_Manutencao_Registro.ParamByName('SQREGISTRO').AsInteger:= piSqRegistro;
      qyLog_Manutencao_Registro.Parameters.ParamByName('CDLOG_MANUTENCAO').Value:= piCdLog_Manutencao;
      qyLog_Manutencao_Registro.Parameters.ParamByName('SQREGISTRO').Value:= piSqRegistro;
    end
  else
    begin
      qyLog_Manutencao_Registro.sql.Clear;
      vSQL:='SELECT SQREGISTRO,NOTABELA,TPMANUTENCAO FROM LOG_MANUTENCAO_REGISTRO WHERE CDLOG_MANUTENCAO = :CDLOG_MANUTENCAO ORDER BY NRORDEM,SQREGISTRO';
      qyLog_Manutencao_Registro.sql.Add(vSQL);
      //qyLog_Manutencao_Registro.ParamByName('CDLOG_MANUTENCAO').AsInteger:= piCdLog_Manutencao;
      qyLog_Manutencao_Registro.Parameters.ParamByName('CDLOG_MANUTENCAO').Value:= piCdLog_Manutencao;
    end;

  qyLog_Manutencao_Registro.Open;
  qyLog_Manutencao_Registro.Last; //tenho que fazer esse loop de taz p/ frente p/ causa da ordem de exclusão das tabelas

  while not qyLog_Manutencao_Registro.Bof do
  begin
    vsNoTabela:= qyLog_Manutencao_Registro.FieldByName('NOTABELA').AsString;
    vaCampos:= dmCOM002A.Carrega_definicao_campos(vsNoTabela);

    vsWhere:='';

    with qyLog_Manutencao_Chave do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT NOCAMPO,VLCAMPO FROM LOG_MANUTENCAO_CHAVE');
      SQL.Add('WHERE');
      SQL.Add('CDLOG_MANUTENCAO = :CDLOG_MANUTENCAO');
      //ParamByName('CDLOG_MANUTENCAO').AsInteger:= piCdLog_Manutencao;
      Parameters.ParamByName('CDLOG_MANUTENCAO').Value := piCdLog_Manutencao;
      //VERIFICA SE EH A PRIMEIRA TABELA, CASO SEJA ADICIONA SQREGISTRO IGUAL A 1
      //SE NAO FOR NAO ADICIONA USANDO ASSIM A CHAVE DA TABELA PRINCIPAL COMO CHAVE DA TABELA AUXILIAR
      if qyLog_Manutencao_Registro.FieldByName('SQREGISTRO').AsInteger = 1 then
      begin
        SQL.Add('AND SQREGISTRO = :SQREGISTRO');
        //ParamByName('SQREGISTRO').AsInteger:= qyLog_Manutencao_Registro.FieldByName('SQREGISTRO').AsInteger;
        Parameters.ParamByName('SQREGISTRO').Value:= qyLog_Manutencao_Registro.FieldByName('SQREGISTRO').AsInteger;
      end;
      Open;

      while not Eof do
      begin
        vsNoCampo:= FieldByName('NOCAMPO').AsString;
        AddStrtoList(vsNoCampo+' = :'+vsNoCampo,vsWhere,' AND ');
        Next;
      end;
    end;

    with qyAplica_Manutencao do
    begin
      Sql.Clear;
      SQL.Add('DELETE FROM '+vsNoTabela);
      SQL.Add('WHERE '+vsWhere);

      //SETAR PARAMETROS
      Setar_Parametros(vsNoTabela,csTpManutencao_Exclusao,vaCampos);

      ExecSql;
    end;

    qyLog_Manutencao_Registro.Prior;
  end;
end;

procedure TdmCOM003L.Confirma_Inclusao(piCdLog_Manutencao, piSqRegistro:integer);
var vsCampos,vsValues,vsWhere,vsNoCampo,vsNoTabela, vSQL:String;
    vaCampos:TaCampos;
    vbIsFloat : boolean;
begin
  qyLog_Manutencao_Registro.Close;
  if(piSqRegistro <> 0)then
    begin
      qyLog_Manutencao_Registro.sql.Clear;
      vSQL:='SELECT SQREGISTRO,NOTABELA,TPMANUTENCAO FROM LOG_MANUTENCAO_REGISTRO WHERE CDLOG_MANUTENCAO = :CDLOG_MANUTENCAO AND SQREGISTRO = :SQREGISTRO ORDER BY NRORDEM,SQREGISTRO';
      qyLog_Manutencao_Registro.sql.Add(vSQL);
//      qyLog_Manutencao_Registro.ParamByName('CDLOG_MANUTENCAO').AsInteger:= piCdLog_Manutencao;
//      qyLog_Manutencao_Registro.ParamByName('SQREGISTRO').AsInteger:= piSqRegistro;
      qyLog_Manutencao_Registro.Parameters.ParamByName('CDLOG_MANUTENCAO').Value:= piCdLog_Manutencao;
      qyLog_Manutencao_Registro.Parameters.ParamByName('SQREGISTRO').Value:= piSqRegistro;
    end
  else
    begin
      qyLog_Manutencao_Registro.sql.Clear;
      vSQL:='SELECT SQREGISTRO,NOTABELA,TPMANUTENCAO FROM LOG_MANUTENCAO_REGISTRO WHERE CDLOG_MANUTENCAO = :CDLOG_MANUTENCAO ORDER BY NRORDEM,SQREGISTRO';
      qyLog_Manutencao_Registro.sql.Add(vSQL);
//      qyLog_Manutencao_Registro.ParamByName('CDLOG_MANUTENCAO').AsInteger:= piCdLog_Manutencao;
      qyLog_Manutencao_Registro.Parameters.ParamByName('CDLOG_MANUTENCAO').Value:= piCdLog_Manutencao;
    end;

  qyLog_Manutencao_Registro.Open;

  while not qyLog_Manutencao_Registro.Eof do
  begin
    vsNoTabela:= qyLog_Manutencao_Registro.FieldByName('NOTABELA').AsString;

    vaCampos:= dmCOM002A.Carrega_definicao_campos(vsNoTabela);

    vsCampos:='';
    vsValues:='';
    vsWhere:='';

    with qyLog_Manutencao_Chave do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT NOCAMPO,VLCAMPO FROM LOG_MANUTENCAO_CHAVE');
      SQL.Add('WHERE');
      SQL.Add('CDLOG_MANUTENCAO = :CDLOG_MANUTENCAO');
      SQL.Add('AND   SQREGISTRO = :SQREGISTRO');    
//      ParamByName('CDLOG_MANUTENCAO').AsInteger:= piCdLog_Manutencao;
//      ParamByName('SQREGISTRO').AsInteger:= qyLog_Manutencao_Registro.FieldByName('SQREGISTRO').AsInteger;
      Parameters.ParamByName('CDLOG_MANUTENCAO').Value:= piCdLog_Manutencao;
      Parameters.ParamByName('SQREGISTRO').Value:= qyLog_Manutencao_Registro.FieldByName('SQREGISTRO').AsInteger;
      Open;

      while not Eof do
      begin
        vsNoCampo:= FieldByName('NOCAMPO').AsString;
        AddStrtoList(vsNoCampo,vsCampos);
        AddStrtoList(':'+vsNoCampo,vsValues);
        Next;
      end;
    end;

    with qyLog_Manutencao_Campo do
    begin
      Close;
      //ParamByName('CDLOG_MANUTENCAO').AsInteger:= piCdLog_Manutencao;
      //ParamByName('SQREGISTRO').AsInteger:= qyLog_Manutencao_Registro.FieldByName('SQREGISTRO').AsInteger;
      Parameters.ParamByName('CDLOG_MANUTENCAO').Value:= piCdLog_Manutencao;
      Parameters.ParamByName('SQREGISTRO').Value:= qyLog_Manutencao_Registro.FieldByName('SQREGISTRO').AsInteger;
      Open;

      while not Eof do
      begin
        vsNoCampo:= FieldByName('NOCAMPO').AsString;
        AddStrtoList(vsNoCampo,vsCampos);
        vbIsFloat:= dmCOM002A.Campo_IsFloat(vsNoCampo,vaCampos);
        //
        if (vbIsFloat) then
          AddStrtoList(ReplaceChar(',','.',FieldByName('VLATUAL').AsString),vsValues)
        else
          AddStrtoList(':'+vsNoCampo,vsValues);

        Next;
      end;
    end;

    if(dmCOM002A.Campo_Existe('CDOPERADOR_INCLUSAO',vaCampos))then
    begin
      AddStrtoList('CDOPERADOR_INCLUSAO',vsCampos);
      AddStrtoList(':CDOPERADOR',vsValues);
    end;

    if(dmCOM002A.Campo_Existe('DTINCLUSAO',vaCampos))then
    begin
      AddStrtoList('DTINCLUSAO',vsCampos);
      AddStrtoList(':DATA',vsValues);
    end;

    if(dmCOM002A.Campo_Existe('CDOPERADOR_ALTERACAO',vaCampos))then
    begin
      AddStrtoList('CDOPERADOR_ALTERACAO',vsCampos);
      AddStrtoList(':CDOPERADOR',vsValues);
    end;

    if(dmCOM002A.Campo_Existe('DTALTERACAO',vaCampos))then
    begin
      AddStrtoList('DTALTERACAO',vsCampos);
      AddStrtoList(':DATA',vsValues);
    end;

    with qyAplica_Manutencao do
    begin
      Sql.Clear;
      SQL.Add('INSERT INTO '+vsNoTabela);
      SQL.Add('('+ vsCampos+')');
      SQL.Add('VALUES ('+vsValues+')');

      //SETAR PARAMETROS
      Setar_Parametros(vsNoTabela,csTpManutencao_Inclusao,vaCampos);

      ExecSql;
    end;

    qyLog_Manutencao_Registro.Next;
  end;
end;

procedure TdmCOM003L.Setar_Parametros(psNoTabela,psTpMAnutencao: String;paCampos:TaCampos);
var
  vsNoCampo,vsCdTipo_Campo:String;
  vbIsFloat : boolean;
begin

  if(psTpMAnutencao<>csTpManutencao_Exclusao)then
  begin
    // qyLog_Manutencao_Campo é aberta na rotina de confirmação
    qyLog_Manutencao_Campo.first;
    while not qyLog_Manutencao_Campo.Eof do
    begin
      vsNoCampo   := qyLog_Manutencao_Campo.FieldByName('NOCAMPO').AsString;
      //
      vsCdTipo_Campo:= dmCOM002A.Obtem_Tipo_Campo(vsNoCampo,paCampos);
      vbIsFloat     := dmCOM002A.Campo_IsFloat(vsNoCampo,paCampos);
      //
      if(qyAplica_Manutencao.Parameters.findparam(vsNoCampo)<>nil)then
      begin
        if( vsCdTipo_Campo = csCdDado_Caracter)then
          begin
            //qyAplica_Manutencao.Parameters.ParamByName(vsNoCampo).AsString := qyLog_Manutencao_Campo.FieldByName('VLATUAL').AsString
            qyAplica_Manutencao.Parameters.ParamByName(vsNoCampo).DataType := ftString;
            qyAplica_Manutencao.Parameters.ParamByName(vsNoCampo).Value := qyLog_Manutencao_Campo.FieldByName('VLATUAL').AsString
          end
        else
        if( vsCdTipo_Campo = csCdDado_Numerico) and (vbIsFloat) then
          begin
            //qyAplica_Manutencao.Parameters.ParamByName(vsNoCampo).AsFloat := qyLog_Manutencao_Campo.FieldByName('VLATUAL').AsFloat
            qyAplica_Manutencao.Parameters.ParamByName(vsNoCampo).DataType := ftFloat;
            qyAplica_Manutencao.Parameters.ParamByName(vsNoCampo).Value    := qyLog_Manutencao_Campo.FieldByName('VLATUAL').AsFloat
          end
        else
        if( vsCdTipo_Campo = csCdDado_Numerico) then
          begin
            //qyAplica_Manutencao.Parameters.ParamByName(vsNoCampo).AsInteger := qyLog_Manutencao_Campo.FieldByName('VLATUAL').AsInteger
            qyAplica_Manutencao.Parameters.ParamByName(vsNoCampo).DataType  := ftInteger;
            qyAplica_Manutencao.Parameters.ParamByName(vsNoCampo).Value := qyLog_Manutencao_Campo.FieldByName('VLATUAL').AsInteger
          end
        else
        if( vsCdTipo_Campo = csCdDado_Data)then
        begin
          //qyAplica_Manutencao.Parameters.ParamByName(vsNoCampo).AsDateTime := qyLog_Manutencao_Campo.FieldByName('VLATUAL').AsDateTime;
          qyAplica_Manutencao.Parameters.ParamByName(vsNoCampo).DataType := ftDateTime;
          qyAplica_Manutencao.Parameters.ParamByName(vsNoCampo).Value    := qyLog_Manutencao_Campo.FieldByName('VLATUAL').AsDateTime;
        end;
      end;

      if(psTpMAnutencao=csTpManutencao_Alteracao)then
      begin
        if(qyAplica_Manutencao.Parameters.findparam(vsNoCampo+'_OLD')<>nil)then
        begin
          if( vsCdTipo_Campo = csCdDado_Caracter)then
            begin
              //qyAplica_Manutencao.ParamByName(vsNoCampo+'_OLD').AsString := qyLog_Manutencao_Campo.FieldByName('VLANTERIOR').AsString
              qyAplica_Manutencao.Parameters.ParamByName(vsNoCampo+'_OLD').DataType := ftString;
              qyAplica_Manutencao.Parameters.ParamByName(vsNoCampo+'_OLD').Value := qyLog_Manutencao_Campo.FieldByName('VLANTERIOR').AsString
            end
          else
          if( vsCdTipo_Campo = csCdDado_Numerico) and (vbIsFloat) then
            begin
              //qyAplica_Manutencao.ParamByName(vsNoCampo+'_OLD').AsFloat := qyLog_Manutencao_Campo.FieldByName('VLANTERIOR').AsFloat
              qyAplica_Manutencao.Parameters.ParamByName(vsNoCampo+'_OLD').DataType := ftFloat;
              qyAplica_Manutencao.Parameters.ParamByName(vsNoCampo+'_OLD').Value    := qyLog_Manutencao_Campo.FieldByName('VLANTERIOR').AsFloat
            end
          else
          if( vsCdTipo_Campo = csCdDado_Numerico)then
            begin
              //qyAplica_Manutencao.ParamByName(vsNoCampo+'_OLD').AsInteger := qyLog_Manutencao_Campo.FieldByName('VLANTERIOR').AsInteger
              qyAplica_Manutencao.Parameters.ParamByName(vsNoCampo+'_OLD').DataType  := ftInteger;
              qyAplica_Manutencao.Parameters.ParamByName(vsNoCampo+'_OLD').Value := qyLog_Manutencao_Campo.FieldByName('VLANTERIOR').AsInteger
            end
          else
          if( vsCdTipo_Campo = csCdDado_Data)then
          begin
            //qyAplica_Manutencao.ParamByName(vsNoCampo+'_OLD').AsDateTime := qyLog_Manutencao_Campo.FieldByName('VLANTERIOR').AsDateTime
            qyAplica_Manutencao.Parameters.ParamByName(vsNoCampo+'_OLD').DataType := ftDateTime;
            qyAplica_Manutencao.Parameters.ParamByName(vsNoCampo+'_OLD').Value := qyLog_Manutencao_Campo.FieldByName('VLANTERIOR').AsDateTime
          end;
        end;
      end;
      qyLog_Manutencao_Campo.Next;
    end;
  end;

  // qyLog_Manutencao_Chave é aberta na rotina de confirmação
  qyLog_Manutencao_Chave.first;
  while not qyLog_Manutencao_Chave.Eof do
  begin
    vsNoCampo:= qyLog_Manutencao_Chave.FieldByName('NOCAMPO').AsString;

    if(qyAplica_Manutencao.Parameters.findparam(vsNoCampo)<>nil)then
    begin
      vsCdTipo_Campo:= dmCOM002A.Obtem_Tipo_Campo(vsNoCampo,paCampos);
      vbIsFloat     := dmCOM002A.Campo_IsFloat(vsNoCampo,paCampos);
      //
      if( vsCdTipo_Campo = csCdDado_Caracter)then
        begin
          //qyAplica_Manutencao.ParamByName(vsNoCampo).AsString := qyLog_Manutencao_Chave.FieldByName('VLCAMPO').AsString
          qyAplica_Manutencao.Parameters.ParamByName(vsNoCampo).DataType := ftString;
          qyAplica_Manutencao.Parameters.ParamByName(vsNoCampo).Value := qyLog_Manutencao_Chave.FieldByName('VLCAMPO').AsString
        end
      else
      if( vsCdTipo_Campo = csCdDado_Numerico) and (vbIsFloat) then
        begin
          //qyAplica_Manutencao.ParamByName(vsNoCampo).AsFloat := qyLog_Manutencao_Chave.FieldByName('VLCAMPO').AsFloat
          qyAplica_Manutencao.Parameters.ParamByName(vsNoCampo).DataType := ftFloat;
          qyAplica_Manutencao.Parameters.ParamByName(vsNoCampo).Value    := qyLog_Manutencao_Chave.FieldByName('VLCAMPO').AsFloat
        end
      else
      if( vsCdTipo_Campo = csCdDado_Numerico)then
        begin
          //qyAplica_Manutencao.ParamByName(vsNoCampo).AsInteger := qyLog_Manutencao_Chave.FieldByName('VLCAMPO').AsInteger
          qyAplica_Manutencao.Parameters.ParamByName(vsNoCampo).DataType := ftInteger;
          qyAplica_Manutencao.Parameters.ParamByName(vsNoCampo).Value    := qyLog_Manutencao_Chave.FieldByName('VLCAMPO').AsInteger
        end
      else
      if( vsCdTipo_Campo = csCdDado_Data)then
      begin
        //qyAplica_Manutencao.ParamByName(vsNoCampo).AsDateTime := qyLog_Manutencao_Chave.FieldByName('VLCAMPO').AsDateTime;
        qyAplica_Manutencao.Parameters.ParamByName(vsNoCampo).DataType := ftDateTime;
        qyAplica_Manutencao.Parameters.ParamByName(vsNoCampo).Value   := qyLog_Manutencao_Chave.FieldByName('VLCAMPO').AsDateTime;
      end;
    end;
    qyLog_Manutencao_Chave.Next;
  end;

  if(qyAplica_Manutencao.Parameters.findparam('CDOPERADOR')<>nil)then
  begin
    //qyAplica_Manutencao.ParamByName('CDOPERADOR').AsString := AppSysOper;
    qyAplica_Manutencao.Parameters.ParamByName('CDOPERADOR').DataType := ftString;
    qyAplica_Manutencao.Parameters.ParamByName('CDOPERADOR').Value := AppSysOper;
  end;

  if(qyAplica_Manutencao.Parameters.findparam('DATA')<>nil)then
  begin
    //qyAplica_Manutencao.ParamByName('DATA').AsDateTime := dmPrincipal.Data_Sistema;
    //qyAplica_Manutencao.ParamByName('DATA').AsDateTime := Date;
    qyAplica_Manutencao.Parameters.ParamByName('DATA').DataType := ftDateTime;
    qyAplica_Manutencao.Parameters.ParamByName('DATA').Value    := Date;
  end;
end;


function TdmCOM003L.Verifica_Autorizacao(psCdPrograma, psTpManutencao: string): boolean;
var vrPrograma : TReg_Programa;
    vbAutoriza: boolean;
begin
  vbAutoriza:=false;

  dmCOM002A.Autorizacao_Programa( psCdPrograma,vrPrograma);

  if(psTpManutencao = csTpManutencao_Inclusao )then
    vbAutoriza:= sntoboolean(vrPrograma.SNINCLUIR)
  else
  if(psTpManutencao = csTpManutencao_Alteracao )then
    vbAutoriza:= sntoboolean(vrPrograma.SNALTERAR)
  else
  if(psTpManutencao = csTpManutencao_Exclusao )then
    vbAutoriza:= sntoboolean(vrPrograma.SNEXCLUIR);

  result := vbAutoriza;
end;

//monta lista de programas que fazem dupla custodia
function TdmCOM003L.Monta_Lista_Programas_Log(pbConfirmacao: boolean): string;
var vsLista_Programas:string;
begin
  vsLista_Programas:='';
  with qyPrograma do
  begin
    close;
    Sql.Clear;
    Sql.Add('SELECT  CDPROGRAMA');
    Sql.Add('FROM PROGRAMA.DBF');
    Sql.Add('WHERE SNGRAVA_LOG_MANUTENCAO ='+quotedstr('S'));
    if(pbConfirmacao)then
    begin
      Sql.Add('AND ((SNCONFIRMACAO_INCLUSAO ='+quotedstr('S')+') OR ');
      Sql.Add('     (SNCONFIRMACAO_EXCLUSAO ='+quotedstr('S')+') OR');
      Sql.Add('     (SNCONFIRMACAO_ALTERACAO ='+quotedstr('S')+'))');
    end;
    Sql.Add('UNION');
    Sql.Add('SELECT CDPROGRAMA');
    Sql.Add('FROM PROGRAMA.DBF');
    Sql.Add('WHERE CDPROGRAMA IN (''PRE009MA'',''PRE010MA'',''PRE011MA'',''PRE110MA'',''PRE268MA'',''PRE039MA'')');

    open;

    while not eof do
    begin
      AddStrtoList(quotedstr(fieldByName('CDPROGRAMA').AsString),vsLista_Programas);
      next;
    end;

    close;
  end;
  result:=vsLista_Programas;
end;

end.
