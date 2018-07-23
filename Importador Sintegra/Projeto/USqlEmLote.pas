unit USqlEmLote;

interface

uses
  SysUtils, Dialogs, Classes, Globalf, PhQuery, UDmPostgres;

type

  TSqlEmLote = class
  private
    FNumSql: Integer;
    FInstrucaoAcum: String;
    FQuery: Tphquery;
    Fcampos: String;
    Ftabela: String;
    Fcondicao: String;
    Fvalores: String;
    FGeralList: TStringList;
    FAnoMesList: TStringList;
    FAnoList: TStringList;
    FZeroList: TStringList;
    Fincluicommit: Boolean;
    FLimitSql: Integer;
    Ftabelausing: String;

    procedure LoadList;
    procedure Inicializa;
    procedure MontaComando(ptabela,pcampos,pvalores,pcondicao : String);
    procedure MontaComandoDelete(ptabela, ptabelausing, pcondicao : String);

    constructor createPrivate;
    procedure SetInstrucaoAcum(const Value: String);
    procedure SetLimitSql(const Value: Integer);
  public
    property InstrucaoAcum: String  read FInstrucaoAcum write SetInstrucaoAcum;
    property NumSql: Integer read FNumSql;
    property LimitSql: Integer read FLimitSql write SetLimitSql;
    property Query : Tphquery read FQuery;

    property tabela: String read Ftabela;
    property tabelausing: String read Ftabelausing;
    property campos: String read Fcampos;
    property valores: String read Fvalores;
    property condicao: String read Fcondicao;
    property incluicommit: Boolean read Fincluicommit;

    procedure SetAcumula(const Value: String; Acumula : Boolean = false); Overload;
    function Truncate(ptabela: String; restarid : Boolean):TSqlEmLote;
    function Delete(ptabela,pcondicao: String):TSqlEmLote;
    function DeleteUsing(ptabela,ptabelausing,pcondicao: String):TSqlEmLote;
    function DeleteStr(ptabela,pcondicao: String):String;
    function InsertOrUpdate(ptabela,pcampos,pvalores,pcondicao: String; pAtualiza : Boolean):TSqlEmLote;
    function Insert(ptabela,pcampos,pvalores,pcondicao : String):TSqlEmLote;
    function Update(ptabela,pcampos,pvalores,pcondicao : String):TSqlEmLote;
    function Select(ptabela,pcampos,pcondicao : String; porderby : String = ''; plimit : Integer = -1):String;
    function SelectCount(ptabela,pcondicao : String):Integer;
    function SelectCountAgrupado(ptabela,pcondicao : String):TSqlEmLote;
    function SelectSum(ptabela,pcampos,pcondicao : String):Integer;
    function SelectSumCurrency(ptabela,pcampos,pcondicao : String):Currency;
    function SelectAgregar(ptabela,pcondicao : String):TSqlEmLote;
    function Sum(pcampo : String):TSqlEmLote;
    function Count:TSqlEmLote;
    function ExisteTabela(ptabela : String) : Boolean;
    procedure Executar;
    Function Open(InstrucaoSQL:String):TSqlEmLote; Overload;
    Function Open:TSqlEmLote; Overload;

    constructor create;
  end;

function GetSqlEmLote : TSqlEmLote;
var
  SqlEmLote: TSqlEmLote;
  tabelaSQL, camposSQL,valoresSQL,condicaoSQL : String;

implementation

uses DB;

function GetSqlEmLote : TSqlEmLote;
begin
  if not Assigned(SqlEmLote) then
    SqlEmLote := TSqlEmLote.createPrivate;

  Result := SqlEmLote;
end;

{ TSqlEmLote }

constructor TSqlEmLote.create;
begin
  raise Exception.Create('Para obter uma instância de TSqlEmLote utilize GetSqlEmLote !');
end;

constructor TSqlEmLote.createPrivate;
begin
  inherited Create;
  FQuery := TPhQuery.Create(nil);
  FQuery.Connection := DmPostgres.ADConnection1;
  FLimitSql := 100;
  Inicializa;
  LoadList;  
end;

function TSqlEmLote.DeleteStr(ptabela,pcondicao: String):String;
begin  
  MontaComando(ptabela,'','',pcondicao);

  Fincluicommit := false;

  FInstrucaoAcum :=
                  'DO $$' +#13+
                  'BEGIN' +#13+
                  '   delete from '+Ftabela+#13+
                  '   '+Fcondicao +';'+#13+
                  'END' +#13+
                  '$$;';

  Result := FInstrucaoAcum;
end;

function TSqlEmLote.Delete(ptabela,pcondicao: String): TSqlEmLote;
begin
  MontaComando(ptabela,'','',pcondicao);

  FInstrucaoAcum := FInstrucaoAcum +
                  'DO $$' +#13+
                  'BEGIN' +#13+
                  '   delete from '+Ftabela+#13+
                  '   '+Fcondicao +';'+#13+
                  'END' +#13+
                  '$$;';

  if (FNumSql >= FLimitSql) then
    Executar;
  Result := Self;

end;

procedure TSqlEmLote.Executar;
var
  sql : TStringList;
begin
  if trim(FInstrucaoAcum) = '' then
    exit;

  if incluicommit then
    FInstrucaoAcum := FInstrucaoAcum +#13+ 'COMMIT;';

  try
  FQuery := TPhQuery.Create(nil);
  FQuery.Connection := DmPostgres.ADConnection1;

    FQuery.close;
    FQuery.ExecSQL(FInstrucaoAcum);
    FQuery.close;

  FreeAndNil(FQuery);

    sql := TStringList.Create;
    sql.Text := FInstrucaoAcum;
    FreeAndNil(sql);
  except
    on E: Exception do
    begin
      sql := TStringList.Create;
      sql.Text := FInstrucaoAcum;
      sql.SaveToFile(GG_DIR_PROGRAM+'\log.txt');
      FreeAndNil(sql);
      ShowMessage('Problemas na execução do script - Erro: '+E.Message);
    end;
  end;
  Inicializa;
end;

procedure TSqlEmLote.Inicializa;
begin
  FInstrucaoAcum := '';
  FNumSql := 0;
  Fincluicommit := false;
end;

function TSqlEmLote.Insert(ptabela,pcampos,pvalores,pcondicao: String): TSqlEmLote;
begin
  MontaComando(ptabela,pcampos,pvalores,pcondicao);
  
  FInstrucaoAcum := FInstrucaoAcum +
                  'DO $$' +#13+
                  'BEGIN' +#13+
                  '   perform * from '+Ftabela+#13+
                  '   '+Fcondicao +#13+
                  '   limit 1 '+';'+#13+
                  '   if not found then' +#13+
                  '     insert into '+Ftabela+#13+
                  '     ('+Fcampos+') values ('+Fvalores+');' +#13+
                  '   end if;' +#13+
                  'END' +#13+
                  '$$;';

  if (FNumSql >= FLimitSql) then
    Executar;
  Result := Self;

end;

function TSqlEmLote.InsertOrUpdate(ptabela,pcampos,pvalores,pcondicao : String; pAtualiza: Boolean): TSqlEmLote;
var valoresUpdate : TStringList;
    limparcampos : TStringList;
    cont : Integer;
    tamanho : String;
begin
  MontaComando(ptabela,pcampos,pvalores,pcondicao);

  limparcampos := TStringList.Create;
  limparcampos.Delimiter := ',';
  limparcampos.DelimitedText := FCampos;

  valoresUpdate := TStringList.Create;
  valoresUpdate.Delimiter := ',';
  valoresUpdate.DelimitedText := StringReplace(Fvalores,' ','%_',[rfReplaceAll]);

  //Validar campo vazio antes de alterar. Informar antes do campos a validar ('c_','i_').
  for cont := 0 to limparcampos.Count - 1 do
  begin
    if LowerCase(Copy(limparcampos[cont],1,2)) = 'c_' then
    begin
      limparcampos[cont] := Copy(limparcampos[cont],3,length(limparcampos[cont]));
      if UpperCase(limparcampos[cont]) = 'CEP' then
      begin
        valoresUpdate[cont] := ' case when Trim(coalesce('+limparcampos[cont]+','+quotedStr('')+')) not in (' + quotedStr('') + ',' + quotedStr('-') + ') then '+limparcampos[cont]+' else '+valoresUpdate[cont]+' end ';
      end
      else if (Ftabela = 'cadgw') and (UpperCase(limparcampos[cont]) = 'X6EXTRA') then
      begin
        valoresUpdate[cont] := ' case when Trim(coalesce('+limparcampos[cont]+','+quotedStr('')+')) not in (' + quotedStr('') + ',' + quotedStr('.    .  -') + ') then '+limparcampos[cont]+' else '+valoresUpdate[cont]+' end ';
      end
      else
      begin
        valoresUpdate[cont] := ' case when Trim(coalesce('+limparcampos[cont]+','+quotedStr('')+')) not in (' + quotedStr('') + ') then '+limparcampos[cont]+' else '+valoresUpdate[cont]+' end ';
      end;
    end
    else if Copy(limparcampos[cont],1,2) = 'i_' then
    begin
      limparcampos[cont] := Copy(limparcampos[cont],3,length(limparcampos[cont]));
      valoresUpdate[cont] := ' case when coalesce('+limparcampos[cont]+',0) not in (' + quotedStr('0') + ') then '+limparcampos[cont]+' else '+valoresUpdate[cont]+' end ';
    end
    else if Copy(limparcampos[cont],1,2) = 's_' then
    begin
      limparcampos[cont] := Copy(limparcampos[cont],3,length(limparcampos[cont]));
      valoresUpdate[cont] := limparcampos[cont]+' + '+valoresUpdate[cont];
    end
    else if Copy(limparcampos[cont],1,2) = 'u_' then
    begin
      tamanho := Copy(limparcampos[cont],3,3);
      limparcampos[cont] := Copy(limparcampos[cont],6,length(limparcampos[cont]));
      valoresUpdate[cont] := limparcampos[cont]+'||'+'substring('+valoresUpdate[cont]+' from 1 for '+tamanho+' - length('+limparcampos[cont]+'))';
    end;
  end;

  valoresUpdate.Text := StringReplace(StringReplace(valoresUpdate.DelimitedText,'%_',' ',[rfReplaceAll]),'"','',[rfReplaceAll]);
  Fcampos := limparcampos.DelimitedText;

  if pAtualiza then
  begin
    FInstrucaoAcum := FInstrucaoAcum +
                    'DO $$' +#13+
                    'DECLARE retorno integer;' +#13+
                    'BEGIN' +#13+
                    '   update '+Ftabela+' set ('+Fcampos+') = ('+valoresUpdate.Text+')' +#13+
                    '   '+Fcondicao +';'+#13+
                    '   get diagnostics retorno := row_count;' +#13+
                    '   if retorno = 0 then' +#13+
                    '     insert into '+tabela+#13+
                    '     ('+Fcampos+') values ('+Fvalores+');' +#13+
                    '   end if;' +#13+
                    'END' +#13+
                    '$$;';
  end
  else
  begin
    FInstrucaoAcum := FInstrucaoAcum +
                    'DO $$' +#13+
                    'BEGIN' +#13+
                    '   perform * from '+Ftabela+#13+
                    '   '+Fcondicao +#13+
                    '   limit 1 '+';'+#13+
                    '   if not found then' +#13+
                    '     insert into '+Ftabela+#13+
                    '     ('+Fcampos+') values ('+Fvalores+');' +#13+
                    '   end if;' +#13+
                    'END' +#13+
                    '$$;';
  end;

  FreeAndNil(limparcampos);
  FreeAndNil(valoresUpdate);

  if (FNumSql >= FLimitSql) then
    Executar;
  Result := Self;

end;

procedure TSqlEmLote.LoadList;
begin
  FGeralList := TStringList.Create;
  FGeralList.Add('ARQEXPC');
  FGeralList.Add('ADCCONTA');
  FGeralList.Add('ATIVORCC');
  FGeralList.Add('ADVERT');
  FGeralList.Add('BANCOAUX');
  FGeralList.Add('BANCOS');
  FGeralList.Add('BNCHIST');
  FGeralList.Add('CADCOSIN');
  FGeralList.Add('CADDMED');
  FGeralList.Add('CADGW');
  FGeralList.Add('CADGWSLD');
  FGeralList.Add('CALEND2');
  FGeralList.Add('CARGOAUX');
  FGeralList.Add('CARGORQS');
  FGeralList.Add('CARGOS');
  FGeralList.Add('CADRTDO');
  FGeralList.Add('CADTERMO');
  FGeralList.Add('CADUFIR');
  FGeralList.Add('CADUMED');
  FGeralList.Add('CARTA');
  FGeralList.Add('CCDARF');
  FGeralList.Add('CCONTG');
  FGeralList.Add('CCONTGR');
  FGeralList.Add('CCONTGRD');
  FGeralList.Add('CCUSTO');
  FGeralList.Add('CDGSERV');
  FGeralList.Add('CDGSERVH');
  FGeralList.Add('CFGATIVO');
  FGeralList.Add('CFGCMV');
  FGeralList.Add('CFGCONTA');
  FGeralList.Add('CFGDESTL');
  FGeralList.Add('CFGDIPJ2');
  FGeralList.Add('CFGDOAR');
  FGeralList.Add('CFGDPJ06');
  FGeralList.Add('CFGDPJ07');
  FGeralList.Add('CFGDPJ08');
  FGeralList.Add('CFGDPJ09');
  FGeralList.Add('CFGDPJ0D');
  FGeralList.Add('CFGDPJ10');
  FGeralList.Add('CFGDPJ11');
  FGeralList.Add('CFGDPJ12');
  FGeralList.Add('CFGDPJ13');
  FGeralList.Add('CFGDPJ14');
  FGeralList.Add('CFGDPJ1D');
  FGeralList.Add('CFGDPJ2D');
  FGeralList.Add('CFGDPJ3D');
  FGeralList.Add('CFGDPJ4D');
  FGeralList.Add('CFGDPJ7D');
  FGeralList.Add('CFGDPJ8D');
  FGeralList.Add('CFGDPJ9D');
  FGeralList.Add('CFGPLREF');
  FGeralList.Add('CLLALUR');
  FGeralList.Add('CFOP');
  FGeralList.Add('CIDSPL');
  FGeralList.Add('CONTADOR');
  FGeralList.Add('CONVENIO');
  FGeralList.Add('COORDIE');
  FGeralList.Add('CPRECAD');
  FGeralList.Add('CRMIDF');
  FGeralList.Add('CTBSDEMP');
  FGeralList.Add('CTCAIXAG');
  FGeralList.Add('CTRLCCC');
  FGeralList.Add('CADGWN');
  FGeralList.Add('CTRLFECH');
  FGeralList.Add('GORCTO');
  FGeralList.Add('GORCTOIT');
  FGeralList.Add('GTPORCIT');
  FGeralList.Add('GTPORCTO');
  FGeralList.Add('GIRPJESP');
  FGeralList.Add('DADOISEN');
  FGeralList.Add('DNF');
  FGeralList.Add('DCFGDOAR');
  FGeralList.Add('DEMORESU');
  FGeralList.Add('DETDRECC');
  FGeralList.Add('DETSTDRE');
  FGeralList.Add('DFCCONTA');
  FGeralList.Add('DMPLCFG');
  FGeralList.Add('DRE3ORD');
  FGeralList.Add('DRE3TOT');
  FGeralList.Add('DVACONTA');
  FGeralList.Add('DVATIT');
  FGeralList.Add('EMPRCFG');
  FGeralList.Add('EVENTOGC');
  FGeralList.Add('EVENTOUS');
  FGeralList.Add('EVPROGCL');
  FGeralList.Add('EVPROGGE');
  FGeralList.Add('EMPFOLHA');
  FGeralList.Add('EMPTPATV');
  FGeralList.Add('ENCMES');
  FGeralList.Add('EVENTEMP');
  FGeralList.Add('EVENTGER');
  FGeralList.Add('EVENTOS');
  FGeralList.Add('EVENTSIN');
  FGeralList.Add('EVTOFOL1');
  FGeralList.Add('FAROL');
  FGeralList.Add('FERG5');
  FGeralList.Add('FERIADO2');
  FGeralList.Add('FERSIND');
  FGeralList.Add('FORNEC');
  FGeralList.Add('FORNECCT');
  FGeralList.Add('FORNECG');
  FGeralList.Add('FORNECP');
  FGeralList.Add('FOLHAAUX');
  FGeralList.Add('FPAS');
  FGeralList.Add('FPASLNK');
  FGeralList.Add('FPASSIT');
  FGeralList.Add('GGF');
  FGeralList.Add('GAGENCIA');
  FGeralList.Add('GBANCO');
  FGeralList.Add('GBOLAGP');
  FGeralList.Add('GBOLAGPI');
  FGeralList.Add('GCHEQUE');
  FGeralList.Add('GCPAGAR');
  FGeralList.Add('GCRECCOP');
  FGeralList.Add('GCRECEB');
  FGeralList.Add('GCRMATEN');
  FGeralList.Add('GCRMMOTI');
  FGeralList.Add('GCRMTRAN');
  FGeralList.Add('GCTACOR');
  FGeralList.Add('GCUSTFUN');
  FGeralList.Add('GDESPREC');
  FGeralList.Add('GDIANUTI');
  FGeralList.Add('GEXTFRAN');
  FGeralList.Add('GFORMPAG');
  FGeralList.Add('GFORNEC');
  FGeralList.Add('GFUNC');
  FGeralList.Add('GBENS');
  FGeralList.Add('GBENSEXT');
  FGeralList.Add('GGC');
  FGeralList.Add('GGG');
  FGeralList.Add('GGG5');
  FGeralList.Add('GGJR');
  FGeralList.Add('GHORAFUN');
  FGeralList.Add('GINTCTB');
  FGeralList.Add('GITEMND');
  FGeralList.Add('GITEMNF');
  FGeralList.Add('GITEMPAG');
  FGeralList.Add('GITEMREC');
  FGeralList.Add('GLANCONT');
  FGeralList.Add('GLANEXTR');
  FGeralList.Add('GLANFRAN');
  FGeralList.Add('GLUCRAT');
  FGeralList.Add('GMATER');
  FGeralList.Add('GMOVFUN');
  FGeralList.Add('GNOTADES');
  FGeralList.Add('GNOTAFIS');
  FGeralList.Add('GORDPAG');
  FGeralList.Add('GORDREC');
  FGeralList.Add('GPESOSDT');
  FGeralList.Add('GPESOSPC');
  FGeralList.Add('GPRECPAG');
  FGeralList.Add('GPROTIT');
  FGeralList.Add('AGENINTG');
  FGeralList.Add('GProtItX');
  FGeralList.Add('GProtItH');
  FGeralList.Add('PrtcExp');
  FGeralList.Add('PrtcIExp');
  FGeralList.Add('GRATEIO');
  FGeralList.Add('GRATMAT');
  FGeralList.Add('GSETOR');
  FGeralList.Add('GTIMESHT');
  FGeralList.Add('GTIPODOC');
  FGeralList.Add('GTRABCLI');
  FGeralList.Add('GTRABFLU');
  FGeralList.Add('GTRABTAR');
  FGeralList.Add('LANCEVTO');
  FGeralList.Add('GTARCLI');
  FGeralList.Add('GCTACOB');
  FGeralList.Add('GFRASREG');
  FGeralList.Add('GCARTCOB');
  FGeralList.Add('GPROTDOC');
  FGeralList.Add('GFUNCCLI');
  FGeralList.Add('GRESDARF');
  FGeralList.Add('GNOTADEX');
  FGeralList.Add('GITEMNDX');
  FGeralList.Add('GTIPSERV');
  FGeralList.Add('GENDECLI');
  FGeralList.Add('GPROTAUX');
  FGeralList.Add('GTIPGUIA');
  FGeralList.Add('CADGWNAX');
  FGeralList.Add('GCALCIMP');
  FGeralList.Add('GCODREC');
  FGeralList.Add('GCRMAUX');
  FGeralList.Add('GNFELETR');
  FGeralList.Add('GVINCFER');
  FGeralList.Add('GSELIC');
  FGeralList.Add('GLANCX');
  FGeralList.Add('ADCXTERM');
  FGeralList.Add('GARQMAIL');
  FGeralList.Add('GAUXMAIL');
  FGeralList.Add('GMAILCFG');
  FGeralList.Add('GCONTRAT');
  FGeralList.Add('GCONTRIT');
  FGeralList.Add('GMODCONT');
  FGeralList.Add('GOBRIGAC');
  FGeralList.Add('GOBRIGBX');
  FGeralList.Add('GOBRIGCL');
  FGeralList.Add('GDEFDOCV');
  FGeralList.Add('GDOCVAL');
  FGeralList.Add('GCRREN');
  FGeralList.Add('GCRRENOR');
  FGeralList.Add('GCRRENPA');
  FGeralList.Add('GIMPLPHX');
  FGeralList.Add('GMCONFIS');
  FGeralList.Add('GMCONFIT');
  FGeralList.Add('GCONTATO');
  FGeralList.Add('GPRMROPE');
  FGeralList.Add('GPARAMS');
  FGeralList.Add('GRPATCTA');
  FGeralList.Add('GRPATIVO');
  FGeralList.Add('HISTFAP');
  FGeralList.Add('HORARAUX');
  FGeralList.Add('HORARIOS');
  FGeralList.Add('HLALURA');
  FGeralList.Add('HPADRAO');
  FGeralList.Add('IEFORNEC');
  FGeralList.Add('ICONTCTR');
  FGeralList.Add('INTGC');
  FGeralList.Add('INCIDAUX');
  FGeralList.Add('ICONTREG');
  FGeralList.Add('INSTENSI');
  FGeralList.Add('IRCOMPL');
  FGeralList.Add('LAYOUTCP');
  FGeralList.Add('LAYOUTS');
  FGeralList.Add('LCTOAUTO');
  FGeralList.Add('MOEDA');
  FGeralList.Add('MOEDAIND');
  FGeralList.Add('MUNICIP');
  FGeralList.Add('NBM');
  FGeralList.Add('OPSCFG');
  FGeralList.Add('ORIGEMFL');
  FGeralList.Add('PARAMGER');
  FGeralList.Add('PHINTDGN');
  FGeralList.Add('PHINTERR');
  FGeralList.Add('PHCODDES');
  FGeralList.Add('PLANOSLD');
  FGeralList.Add('PLCONTAS');
  FGeralList.Add('PLRINCID');
  FGeralList.Add('PRARQS');
  FGeralList.Add('RAISE');
  FGeralList.Add('RAISF');
  FGeralList.Add('REAJVT');
  FGeralList.Add('RECAELAY');
  FGeralList.Add('RECAELDT');
  FGeralList.Add('RUBHNET');
  FGeralList.Add('SALAULA');
  FGeralList.Add('SALTAREF');
  FGeralList.Add('SELICJR');
  FGeralList.Add('SUBDRECC');
  FGeralList.Add('SINDCATG');
  FGeralList.Add('SINDCOMP');
  FGeralList.Add('SINDCONV');
  FGeralList.Add('SINDFUNC');
  FGeralList.Add('SINDICAT');
  FGeralList.Add('SINDPAT');
  FGeralList.Add('SINDPAT2');
  FGeralList.Add('SINDPISO');
  FGeralList.Add('SUSPEN');
  FGeralList.Add('TABAUTO');
  FGeralList.Add('TABINCID');
  FGeralList.Add('SUBTITDR');
  FGeralList.Add('TDRECC');
  FGeralList.Add('TERMO');
  FGeralList.Add('TERMOCX');
  FGeralList.Add('TERMODET');
  FGeralList.Add('TERMOTXT');
  FGeralList.Add('TERMOLMC');
  FGeralList.Add('TITDRE');
  FGeralList.Add('TURBOISS');
  FGeralList.Add('UFIR');
  FGeralList.Add('UFIRFESP');
  FGeralList.Add('UNITARIO');
  FGeralList.Add('USUARIOS');
  FGeralList.Add('USUAUXI');
  FGeralList.Add('USUCTRL');
  FGeralList.Add('USUEMP');
  FGeralList.Add('USUMOD');
  FGeralList.Add('USUMODP');
  FGeralList.Add('USUSIS');
  FGeralList.Add('VALETRA');
  FGeralList.Add('VTEXPORT');
  FGeralList.Add('VENCTO');
  FGeralList.Add('CFGCONTA');
  FGeralList.Add('CFGDPJ0D');
  FGeralList.Add('CFGDPJ10');
  FGeralList.Add('CFGDPJ13');
  FGeralList.Add('CFGDPJ14');
  FGeralList.Add('CFGDPJ3D');
  FGeralList.Add('CFGDPJ4D');
  FGeralList.Add('CFGPLREF');
  FGeralList.Add('CTRLFECH');
  FGeralList.Add('GRPCAD');
  FGeralList.Add('GRPEMP');
  FGeralList.Add('GRPITEM');
  FGeralList.Add('GRPSIS');
  FGeralList.Add('LOGTSHEE');
  FGeralList.Add('NCCUSTO');
  FGeralList.Add('NPCCTB');
  FGeralList.Add('PARTCSLD');
  FGeralList.Add('PLCTAAUX');
  FGeralList.Add('PLCTASCC');

  //Tabelas criadas somente no Postgres
  FGeralList.Add('CONTROLESCRIPT');
  FGeralList.Add('CONTROLE');
  FGeralList.Add('TEMP_FISCCSLD');
  FGeralList.Add('TEMP_FISCSLD');
  FGeralList.Add('PG_TABLES');

  FAnoList := TStringList.Create;
  FAnoList.Add('CAT207');
  FAnoList.Add('CAT207EI');
  FAnoList.Add('COD75DIP');
  FAnoList.Add('COMB88T');
  FAnoList.Add('COMBNFTQ');
  FAnoList.Add('CORODFFN');
  FAnoList.Add('CPREV');
  FAnoList.Add('CPREVAJ');
  FAnoList.Add('CPREVDA');
  FAnoList.Add('CRONTE');
  FAnoList.Add('CRONTERT');
  FAnoList.Add('CSCOMPL');
  FAnoList.Add('CSDEDEX');
  FAnoList.Add('CSDETOR');
  FAnoList.Add('CSDETREC');
  FAnoList.Add('CTBINTDI');
  FAnoList.Add('CTDARF');
  FAnoList.Add('CTRLRTDM');
  FAnoList.Add('DACONFOL');
  FAnoList.Add('DADOSIR');
  FAnoList.Add('DARFCTB');
  FAnoList.Add('DCPA1');
  FAnoList.Add('DCPA2');
  FAnoList.Add('DCPA4');
  FAnoList.Add('DCPARESS');
  FAnoList.Add('DEDISS');
  FAnoList.Add('DEDISSCP');
  FAnoList.Add('DFCPROC');
  FAnoList.Add('DMPLSLD');
  FAnoList.Add('DMPLTIT');
  FAnoList.Add('DIFALIQ');
  FAnoList.Add('DIPI');
  FAnoList.Add('DIPIFF');
  FAnoList.Add('DIPITT');
  FAnoList.Add('DIPITT2');
  FAnoList.Add('DIPJFOL');
  FAnoList.Add('DISTMUN');
  FAnoList.Add('DOARPROC');
  FAnoList.Add('DRA');
  FAnoList.Add('DRAPROC');
  FAnoList.Add('ECDCOMPL');
  FAnoList.Add('EDIGDOM');
  FAnoList.Add('EDIGFUN');
  FAnoList.Add('EVEDIGCC');
  FAnoList.Add('EVENTDIG');
  FAnoList.Add('EFDCMPCC');
  FAnoList.Add('EFDCOMP2');
  FAnoList.Add('EFDCOMPL');
  FAnoList.Add('EFDCREDA');
  FAnoList.Add('EFDCTEXP');
  FAnoList.Add('EFDINFDC');
  FAnoList.Add('EFDPISFO');
  FAnoList.Add('EFDPROC');
  FAnoList.Add('EFDSUBF2');
  FAnoList.Add('EFDSUBFT');
  FAnoList.Add('EISS');
  FAnoList.Add('EISSCOMP');
  FAnoList.Add('EXTRCTB');
  FAnoList.Add('FISCCSLD');
  FAnoList.Add('FISCSLD');
  FAnoList.Add('FRASESLD');
  FAnoList.Add('G5GENANO');
  FAnoList.Add('IN86ISSI');
  FAnoList.Add('IN86ITTO');
  FAnoList.Add('IN86NFM');
  FAnoList.Add('IN86NFM2');
  FAnoList.Add('INFCOMPL');
  FAnoList.Add('ISS');
  FAnoList.Add('ISSCOMPL');
  FAnoList.Add('INTCTB');
  FAnoList.Add('LANCAIXA');
  FAnoList.Add('LANCDMED');
  FAnoList.Add('LANCINVE');
  FAnoList.Add('LANCREC');
  FAnoList.Add('LANLALUR');
  FAnoList.Add('LCTOCTCC');
  FAnoList.Add('LCTOCTCE');
  FAnoList.Add('LCTOS');
  FAnoList.Add('LCTOSCC');
  FAnoList.Add('LCTOSE');
  FAnoList.Add('LCTOSEFIN');
  FAnoList.Add('LCTOSEXT');
  FAnoList.Add('LCTOSFIN');
  FAnoList.Add('LOTES');
  FAnoList.Add('LOTESAUX');
  FAnoList.Add('LCTOINVE');
  FAnoList.Add('LSTRIB');
  FAnoList.Add('MOVCBTAQ');
  FAnoList.Add('MOVCBVOL');
  FAnoList.Add('MOVCOB');
  FAnoList.Add('MOVCOMB');
  FAnoList.Add('MCCUSTO');
  FAnoList.Add('NFCANCEL');
  FAnoList.Add('NFCARGA');
  FAnoList.Add('NFCARGAF');
  FAnoList.Add('NFCUPOMF');
  FAnoList.Add('NFITEM18');
  FAnoList.Add('NFITEMM7');
  FAnoList.Add('NFMODAL');
  FAnoList.Add('NOTACOMP');
  FAnoList.Add('NOTAFRET');
  FAnoList.Add('NOTAINF');
  FAnoList.Add('NOTAINFA');
  FAnoList.Add('NOTAINFC');
  FAnoList.Add('NOTAINFF');
  FAnoList.Add('NOTAINFL');
  FAnoList.Add('NOTAINFP');
  FAnoList.Add('NOTAITEM');
  FAnoList.Add('NOTAITRC');
  FAnoList.Add('NOTAOBI2');
  FAnoList.Add('NOTAOBS');
  FAnoList.Add('NOTAOBSI');
  FAnoList.Add('NOTAS');
  FAnoList.Add('NOTASCT');
  FAnoList.Add('NOTASUBD');
  FAnoList.Add('NOTASUBF');
  FAnoList.Add('NOTASUBI');
  FAnoList.Add('NOTATFAT');
  FAnoList.Add('NOTAUFST');
  FAnoList.Add('NOTAOBDP');
  FAnoList.Add('OVMCF');
  FAnoList.Add('OVMEFDIA');
  FAnoList.Add('OVMIA');
  FAnoList.Add('OVMIA2');
  FAnoList.Add('OPSATVIM');
  FAnoList.Add('OPSATVIN');
  FAnoList.Add('OPSBAL');
  FAnoList.Add('OPSCAD');
  FAnoList.Add('OPSCBASS');
  FAnoList.Add('OPSCTCOR');
  FAnoList.Add('OPSCTTBT');
  FAnoList.Add('OPSDET');
  FAnoList.Add('OPSEND');
  FAnoList.Add('OPSFCIEF');
  FAnoList.Add('OPSMUN');
  FAnoList.Add('OPSSOLV');
  FAnoList.Add('OPSTEL');
  FAnoList.Add('OPSVLR');
  FAnoList.Add('PCCRDSLD');
  FAnoList.Add('PCRECSLD');
  FAnoList.Add('PHINTCC');
  FAnoList.Add('PHINTCTB');
  FAnoList.Add('RAZAOCX');
  FAnoList.Add('RECMICRO');
  FAnoList.Add('RECSNAC');
  FAnoList.Add('RECSNACC');
  FAnoList.Add('REDF');
  FAnoList.Add('REG85A');
  FAnoList.Add('REG85B');
  FAnoList.Add('REG85C');
  FAnoList.Add('REG85C2');
  FAnoList.Add('RTD');
  FAnoList.Add('RTDMAN');
  FAnoList.Add('SALDOCX');
  FAnoList.Add('SERVANX');
  FAnoList.Add('SERVMUN');
  FAnoList.Add('SLCONCIL');
  FAnoList.Add('SLMOVEMP');
  FAnoList.Add('SLMOVFIL');
  FAnoList.Add('SOCIOSIC');
  FAnoList.Add('SREG71');
  FAnoList.Add('SREG54');
  FAnoList.Add('ST_OBS');
  FAnoList.Add('ST_OBSI');
  FAnoList.Add('SUBFTMOD');
  FAnoList.Add('SUBFTMUN');
  FAnoList.Add('SUBFTTOT');
  FAnoList.Add('VLSOCIOS');

  FAnoMesList := TStringList.Create;
  FAnoMesList.Add('NOTAITEM');
  FAnoMesList.Add('NOTAITRC');

  FZeroList := TStringList.Create;
  FZeroList.Add('ACIDTRAB');
  FZeroList.Add('ADICVT');
  FZeroList.Add('AFASTAUX');
  FZeroList.Add('AFASTDOM');
  FZeroList.Add('AFASTFUN');
  FZeroList.Add('AUTO');
  FZeroList.Add('AUTOCOOP');
  FZeroList.Add('AUTOBAS');
  FZeroList.Add('AUTOLAN');
  FZeroList.Add('AUTONOMO');
  FZeroList.Add('AUTOVIG');
  FZeroList.Add('AUTTABLE');
  FZeroList.Add('APGSOCIO');
  FZeroList.Add('APLLALUR');
  FZeroList.Add('BANCOINT');
  FZeroList.Add('BAS13P1D');
  FZeroList.Add('BAS13P2D');
  FZeroList.Add('BASE13CP');
  FZeroList.Add('BASE13P1');
  FZeroList.Add('BASE13P2');
  FZeroList.Add('BASEADTD');
  FZeroList.Add('BASEADTO');
  FZeroList.Add('BASEAUT');
  FZeroList.Add('BASEAUTO');
  FZeroList.Add('BASEDOM');
  FZeroList.Add('BASEFER');
  FZeroList.Add('BASEFERD');
  FZeroList.Add('BASEFUN');
  FZeroList.Add('BASEPRAX');
  FZeroList.Add('BASEPROV');
  FZeroList.Add('BASEPRVS');
  FZeroList.Add('BASEPTLC');
  FZeroList.Add('BASERES');
  FZeroList.Add('BASERESD');
  FZeroList.Add('BASERFLD');
  FZeroList.Add('BASERFLF');
  FZeroList.Add('BFAUX');
  FZeroList.Add('BPTLCAUX');
  FZeroList.Add('BSAUTAUX');
  FZeroList.Add('BSFERCC');
  FZeroList.Add('BSFUNCC');
  FZeroList.Add('BSRESCC');
  FZeroList.Add('BENS');
  FZeroList.Add('BEMBXAUX');
  FZeroList.Add('BENSAUX');
  FZeroList.Add('BENSCONS');
  FZeroList.Add('BENSCPAR');
  FZeroList.Add('BENSSLD');
  FZeroList.Add('BNCCTA');
  FZeroList.Add('BNCCTBL');
  FZeroList.Add('BNCLANC');
  FZeroList.Add('BEBIDAG2');
  FZeroList.Add('BEBIDAGP');
  FZeroList.Add('BOMBAS');
  FZeroList.Add('BOMBICO');
  FZeroList.Add('BOMLACRE');
  FZeroList.Add('CADBAIXA');
  FZeroList.Add('CADFCI');
  FZeroList.Add('CADFCI2');
  FZeroList.Add('CADHDI');
  FZeroList.Add('CADHDI2');
  FZeroList.Add('CADINFC');
  FZeroList.Add('CADITEMI');
  FZeroList.Add('CADNATO');
  FZeroList.Add('CADOBS');
  FZeroList.Add('CADSOCIO');
  FZeroList.Add('CAGED');
  FZeroList.Add('CALCEMP');
  FZeroList.Add('CALCVT');
  FZeroList.Add('CALCVT01');
  FZeroList.Add('CALCVTDO');
  FZeroList.Add('CARGODOM');
  FZeroList.Add('CARGOFUN');
  FZeroList.Add('COMPDETA');
  FZeroList.Add('COMPENSA');
  FZeroList.Add('COMPLVT');
  FZeroList.Add('COMPRAVT');
  FZeroList.Add('COMPVT01');
  FZeroList.Add('COMPVTDO');
  FZeroList.Add('CONVEVEH');
  FZeroList.Add('CONVEVEN');
  FZeroList.Add('CUCA');
  FZeroList.Add('CRTRSPA');
  FZeroList.Add('CAT207EL');
  FZeroList.Add('CCONTI');
  FZeroList.Add('CFGCFOP');
  FZeroList.Add('CFGCPREV');
  FZeroList.Add('CFGNFE');
  FZeroList.Add('CFGNFEC');
  FZeroList.Add('CFGNFS');
  FZeroList.Add('CFOPCORR');
  FZeroList.Add('CFOPCST');
  FZeroList.Add('CIAP');
  FZeroList.Add('CIAPDT');
  FZeroList.Add('CIAPDT2');
  FZeroList.Add('CIAPOC');
  FZeroList.Add('CIAPPQT');
  FZeroList.Add('COMB88');
  FZeroList.Add('CTCAIXAI');
  FZeroList.Add('CTRLROTI');
  FZeroList.Add('CTRLBNCS');
  FZeroList.Add('DEPEMP');
  FZeroList.Add('DEPENAUX');
  FZeroList.Add('DEPFUN');
  FZeroList.Add('DEPTO');
  FZeroList.Add('DARFIRF');
  FZeroList.Add('DDUCAPU');
  FZeroList.Add('DEPRACEL');
  FZeroList.Add('DFC');
  FZeroList.Add('DLPARTEA');
  FZeroList.Add('DMPL');
  FZeroList.Add('DTLANCCS');
  FZeroList.Add('DOM');
  FZeroList.Add('DOMAUX');
  FZeroList.Add('EDIGAUTO');
  FZeroList.Add('EFDCRED2');
  FZeroList.Add('EFDCREDF');
  FZeroList.Add('EMCALC');
  FZeroList.Add('EMPTIR13');
  FZeroList.Add('EMPTIRED');
  FZeroList.Add('ESCREVEZ');
  FZeroList.Add('EVENTDOM');
  FZeroList.Add('EVENTFUN');
  FZeroList.Add('FERCOMPL');
  FZeroList.Add('FERIACOL');
  FZeroList.Add('FERIADOM');
  FZeroList.Add('FERIAFUN');
  FZeroList.Add('FGCATNOR');
  FZeroList.Add('FGDIFSAL');
  FZeroList.Add('FISCRTD');
  FZeroList.Add('FISRTDGT');
  FZeroList.Add('FORANALI');
  FZeroList.Add('FORNECA');
  FZeroList.Add('FORMS');
  FZeroList.Add('FUNC');
  FZeroList.Add('FUNCAUX');
  FZeroList.Add('FUNCAUX1');
  FZeroList.Add('FUNCAUX2');
  FZeroList.Add('G5CFGCTB');
  FZeroList.Add('G5GEN000');
  FZeroList.Add('G5ITEM');
  FZeroList.Add('G5ITEM2');
  FZeroList.Add('G5ITEMC2');
  FZeroList.Add('G5ITEMCC');
  FZeroList.Add('GRINVENT');
  FZeroList.Add('GPSFUNC');
  FZeroList.Add('GPSFUNC1');
  FZeroList.Add('HISTANEX');
  FZeroList.Add('HISTATIV');
  FZeroList.Add('HISTCAT');
  FZeroList.Add('HISTFGER');
  FZeroList.Add('HISTHORA');
  FZeroList.Add('HISTPGTO');
  FZeroList.Add('HISTRISC');
  FZeroList.Add('HISTSAL');
  FZeroList.Add('HISTSIND');
  FZeroList.Add('ICONTREF');
  FZeroList.Add('ICONTTAB');
  FZeroList.Add('IMOBITEN');
  FZeroList.Add('IMOBLCTO');
  FZeroList.Add('IMOBTRBO');
  FZeroList.Add('LANCCS');
  FZeroList.Add('LAYBCOS');
  FZeroList.Add('LSUBTRIB');
  FZeroList.Add('LCFERCC');
  FZeroList.Add('LCFOLCC');
  FZeroList.Add('LCREAUXL');
  FZeroList.Add('LCRECCAL');
  FZeroList.Add('LCREDOAL');
  FZeroList.Add('LCREDOAX');
  FZeroList.Add('LCRESAUX');
  FZeroList.Add('LCRESCC');
  FZeroList.Add('LCRESCCX');
  FZeroList.Add('LCT13CP');
  FZeroList.Add('LCT13CPD');
  FZeroList.Add('LCT13P1');
  FZeroList.Add('LCT13P1D');
  FZeroList.Add('LCT13P2');
  FZeroList.Add('LCT13P2D');
  FZeroList.Add('LCTADTDO');
  FZeroList.Add('LCTADTO');
  FZeroList.Add('LCTAUTEM');
  FZeroList.Add('LCTAUTOR');
  FZeroList.Add('LCTFAUTO');
  FZeroList.Add('LCTFERDO');
  FZeroList.Add('LCTFERIA');
  FZeroList.Add('LCTFOLDO');
  FZeroList.Add('LCTFOLHA');
  FZeroList.Add('LCTPTLC');
  FZeroList.Add('LCTRES');
  FZeroList.Add('LCTRESDO');
  FZeroList.Add('LIMINAR');
  FZeroList.Add('LOCAL');
  FZeroList.Add('LOCALFOL');
  FZeroList.Add('LOCRATEI');
  FZeroList.Add('LCTOSMES');
  FZeroList.Add('LEASING');
  FZeroList.Add('LOCBENS');
  FZeroList.Add('LPARTEA');
  FZeroList.Add('LUCPREAC');
  FZeroList.Add('MEDCOMPL');
  FZeroList.Add('MEDIADET');
  FZeroList.Add('MEDNEW');
  FZeroList.Add('MEDNWDOM');
  FZeroList.Add('NFSVARIT');
  FZeroList.Add('NOTASEXP');
  FZeroList.Add('NOTEXPDT');
  FZeroList.Add('PARTEA');
  FZeroList.Add('PARTEB');
  FZeroList.Add('PARTEBCS');
  FZeroList.Add('PAUSA');
  FZeroList.Add('PARAMEM2');
  FZeroList.Add('PARAMEMP');
  FZeroList.Add('PARAMEVT');
  FZeroList.Add('PARTABLE');
  FZeroList.Add('PERAUX');
  FZeroList.Add('PERFC');
  FZeroList.Add('PERFDOM');
  FZeroList.Add('PGGUIAS');
  FZeroList.Add('PGINDIV');
  FZeroList.Add('PHRECIBO');
  FZeroList.Add('PHREPORT');
  FZeroList.Add('PPP');
  FZeroList.Add('PPPAGNOC');
  FZeroList.Add('PPPEXMED');
  FZeroList.Add('PPPHCARG');
  FZeroList.Add('PPPHRESP');
  FZeroList.Add('PPPPARAM');
  FZeroList.Add('PROCF');
  FZeroList.Add('PROCFDTL');
  FZeroList.Add('PROEMP02');
  FZeroList.Add('PROEMPRE');
  FZeroList.Add('PROSOFT');
  FZeroList.Add('RECANX');
  FZeroList.Add('RECAUTO');
  FZeroList.Add('RECAUTO2');
  FZeroList.Add('RECBRTI');
  FZeroList.Add('RECBRUTA');
  FZeroList.Add('RECEMPTI');
  FZeroList.Add('REDINSS');
  FZeroList.Add('RELACIMP');
  FZeroList.Add('RESCOMPL');
  FZeroList.Add('RESFUN');
  FZeroList.Add('RESGUIAS');
  FZeroList.Add('RESIDANO');
  FZeroList.Add('RESIDUAL');
  FZeroList.Add('RESPEMP');
  FZeroList.Add('RESTABLE');
  FZeroList.Add('RESTBDOM');
  FZeroList.Add('RESTBFUN');
  FZeroList.Add('SALDOM');
  FZeroList.Add('SALFUN');
  FZeroList.Add('SECAO');
  FZeroList.Add('SETOR');
  FZeroList.Add('SLDPRVS');
  FZeroList.Add('SOCIOSLD');
  FZeroList.Add('SREG75');
  FZeroList.Add('SSRECACU');
  FZeroList.Add('SUPSIMPL');
  FZeroList.Add('SUSPREDU');
  FZeroList.Add('TERMOTEX');
  FZeroList.Add('TREIFUN');
  FZeroList.Add('VIGCONTR');
  FZeroList.Add('VTAVULSO');
  FZeroList.Add('VTDOM');
  FZeroList.Add('VTFUN');
  FZeroList.Add('VTFUN01');
  FZeroList.Add('G5ITEMRC');
  FZeroList.Add('GRINVCC');
end;

procedure TSqlEmLote.MontaComando(ptabela,pcampos,pvalores,pcondicao : String);
begin
  inc(FNumSql);

  Fcampos := '';
  Fvalores := '';
  Fcondicao := '';
  Ftabela := ptabela;

  if (FNumSql = 1) then
  begin
    if ((ptabela <> '') or (pcampos <> '') or (pvalores <> '') or (pcondicao <> ''))then
    begin
      FInstrucaoAcum := 'BEGIN;';
      Fincluicommit := true;
    end
    else
      FInstrucaoAcum := '';
  end;

  if FZeroList.IndexOf(UpperCase(ptabela)) > -1 then
  begin
    if pcampos <> '' then
      Fcampos := pcampos + ',phx_apelido';
    if pvalores <> '' then
      Fvalores := pvalores + ',' + QuotedStr( GGApelidoAtv );

    if pcondicao <> '' then
      Fcondicao := ' where phx_apelido = ' + QuotedStr( GGApelidoAtv ) + ' and ' + pcondicao
    else
      Fcondicao := ' where phx_apelido = ' + QuotedStr( GGApelidoAtv );
  end
  else
  if FAnoMesList.IndexOf(UpperCase(ptabela)) > -1 then
  begin
    if pcampos <> '' then
      Fcampos := pcampos + ',phx_apelido,phx_ano,phx_mes';
    if pvalores <> '' then
      Fvalores := pvalores + ',' + QuotedStr( GGApelidoAtv ) + ',' + IntToStr(GGanoAtv) + ',' + IntToStr(GGmesAtv);
    if pcondicao <> '' then
      Fcondicao := ' where phx_apelido = ' + QuotedStr( GGApelidoAtv ) + ' and phx_ano = ' + IntToStr(GGanoAtv) + ' and phx_mes = ' + IntToStr(GGmesAtv) + ' and ' + pcondicao
    else
      Fcondicao := ' where phx_apelido = ' + QuotedStr( GGApelidoAtv ) + ' and phx_ano = ' + IntToStr(GGanoAtv) + ' and phx_mes = ' + IntToStr(GGmesAtv);
  end
  else
  if FAnoList.IndexOf(UpperCase(ptabela)) > -1 then
  begin
    if pcampos <> '' then
      Fcampos := pcampos + ',phx_apelido,phx_ano';
    if pvalores <> '' then
      Fvalores := pvalores + ',' + QuotedStr( GGApelidoAtv ) + ',' + IntToStr(GGanoAtv);
    if pcondicao <> '' then
      Fcondicao := ' where phx_apelido = ' + QuotedStr( GGApelidoAtv ) + ' and phx_ano = ' + IntToStr(GGanoAtv) + ' and ' + pcondicao
    else
      Fcondicao := ' where phx_apelido = ' + QuotedStr( GGApelidoAtv ) + ' and phx_ano = ' + IntToStr(GGanoAtv);
  end
  else
  begin
    if pcampos <> '' then
      Fcampos := pcampos;
    if pvalores <> '' then
      Fvalores := pvalores;
    if pcondicao <> '' then
      Fcondicao := ' where '+pcondicao;
  end;

  if Fcondicao = '' then
    Fcondicao := 'where 1=2';
end;

function TSqlEmLote.Open(InstrucaoSQL:String): TSqlEmLote;
begin
  if trim(InstrucaoSQL) = '' then
    exit;

  try
    FreeAndNil(FQuery);
  FQuery := TPhQuery.Create(nil);
  FQuery.Connection := DmPostgres.ADConnection1;

    FQuery.Open(InstrucaoSQL);
    Result := Self;
    Inicializa;
  except
    on E: Exception do
    begin
      ShowMessage('Problemas no open - Erro: '+E.Message);
    end;
  end;
end;

function TSqlEmLote.Select(ptabela, pcampos,
  pcondicao: String; porderby : String = ''; plimit : Integer = -1): String;
begin
  MontaComando(ptabela,pcampos,'',pcondicao);

  if Fcampos = '' then
    Fcampos := '*';

  Result := 'select '+Fcampos+#13+
                    '  from '+Ftabela +#13+
                    ' '+Fcondicao;

  if porderby <> '' then
  begin
    Result := Result + ' Order by '+porderby;
  end;
  if plimit > -1 then
  begin
    Result := Result + ' Limit '+IntToStr(plimit);
  end;
end;

function TSqlEmLote.SelectCount(ptabela, pcondicao: String): Integer;
begin   
  try
    MontaComando(ptabela,'','',pcondicao);
    Fincluicommit := false;
    FInstrucaoAcum := 'select count(*) count'+#13+
                      '  from '+Ftabela +#13+
                      ' '+Uppercase(Fcondicao) +';';
    Open(FInstrucaoAcum);
    Result := Query.FieldByName('count').AsInteger;
    Inicializa;
  except
    on e:Exception do
      Result := 0;
  end;
end;

function TSqlEmLote.Update(ptabela,pcampos,pvalores,pcondicao: String): TSqlEmLote;
var valoresUpdate : TStringList;
    limparcampos : TStringList;
    cont : Integer;
    tamanho : String;
begin
  MontaComando(ptabela,pcampos,pvalores,pcondicao);

  limparcampos := TStringList.Create;
  limparcampos.Delimiter := ',';
  limparcampos.DelimitedText := FCampos;

  valoresUpdate := TStringList.Create;
  valoresUpdate.Delimiter := ',';
  valoresUpdate.DelimitedText := StringReplace(Fvalores,' ','%_',[rfReplaceAll]);

  //Validar campo vazio antes de alterar. Informar antes do campos a validar ('c_','i_').
  for cont := 0 to limparcampos.Count - 1 do
  begin
    if LowerCase(Copy(limparcampos[cont],1,2)) = 'c_' then
    begin
      limparcampos[cont] := Copy(limparcampos[cont],3,length(limparcampos[cont]));
      if UpperCase(limparcampos[cont]) = 'CEP' then
      begin
        valoresUpdate[cont] := ' case when Trim(coalesce('+limparcampos[cont]+','+quotedStr('')+')) not in (' + quotedStr('') + ',' + quotedStr('-') + ') then '+limparcampos[cont]+' else '+valoresUpdate[cont]+' end ';
      end
      else if (Ftabela = 'cadgw') and (UpperCase(limparcampos[cont]) = 'X6EXTRA') then
      begin
        valoresUpdate[cont] := ' case when Trim(coalesce('+limparcampos[cont]+','+quotedStr('')+')) not in (' + quotedStr('') + ',' + quotedStr('.    .  -') + ') then '+limparcampos[cont]+' else '+valoresUpdate[cont]+' end ';
      end
      else
      begin
        valoresUpdate[cont] := ' case when Trim(coalesce('+limparcampos[cont]+','+quotedStr('')+')) not in (' + quotedStr('') + ') then '+limparcampos[cont]+' else '+valoresUpdate[cont]+' end ';
      end;
    end
    else if Copy(limparcampos[cont],1,2) = 'i_' then
    begin
      limparcampos[cont] := Copy(limparcampos[cont],3,length(limparcampos[cont]));
      valoresUpdate[cont] := ' case when coalesce('+limparcampos[cont]+',0) not in (' + quotedStr('0') + ') then '+limparcampos[cont]+' else '+valoresUpdate[cont]+' end ';
    end
    else if Copy(limparcampos[cont],1,2) = 's_' then
    begin
      limparcampos[cont] := Copy(limparcampos[cont],3,length(limparcampos[cont]));
      valoresUpdate[cont] := limparcampos[cont]+' + '+valoresUpdate[cont];
    end
    else if Copy(limparcampos[cont],1,2) = 'u_' then
    begin
      tamanho := Copy(limparcampos[cont],3,3);
      limparcampos[cont] := Copy(limparcampos[cont],6,length(limparcampos[cont]));
      valoresUpdate[cont] := limparcampos[cont]+'||'+'substring('+valoresUpdate[cont]+' from 1 for '+tamanho+' - length('+limparcampos[cont]+'))';
    end;
  end;

  valoresUpdate.Text := StringReplace(StringReplace(valoresUpdate.DelimitedText,'%_',' ',[rfReplaceAll]),'"','',[rfReplaceAll]);
  Fcampos := limparcampos.DelimitedText;
    
  FInstrucaoAcum := FInstrucaoAcum +
                   'DO $$' +#13+
                   'BEGIN' +#13+
                   '   update '+Ftabela+' set ('+Fcampos+') = ('+valoresUpdate.Text+')' +#13+
                   '   '+Fcondicao +';'+#13+
                   'END' +#13+
                   '$$;';

  if (FNumSql >= FLimitSql) then
    Executar;
  Result := Self;

end;

procedure TSqlEmLote.SetAcumula(const Value: String;acumula : Boolean = false);
begin
  if not acumula then
    Fincluicommit := false;
  FInstrucaoAcum := FInstrucaoAcum + Value;
end;

function TSqlEmLote.ExisteTabela(ptabela: String): Boolean;
begin
  result := not Open(Select('PG_TABLES','LOWER(TABLENAME) AS TABLE_NAME',' LOWER(TABLENAME) = LOWER('+QuotedStr(ptabela)+')')).Query.IsEmpty;
end;

function TSqlEmLote.Truncate(ptabela: String;
  restarid: Boolean): TSqlEmLote;
begin
  FInstrucaoAcum := FInstrucaoAcum +
                   'DO $$' +#13+
                   'BEGIN' +#13+
                   '   TRUNCATE TABLE '+ptabela;
  if restarid then
    FInstrucaoAcum := FInstrucaoAcum + ' RESTART IDENTITY;'
  else
    FInstrucaoAcum := FInstrucaoAcum + ';';

  FInstrucaoAcum := FInstrucaoAcum +
                   'END' +#13+
                   '$$;';

  if (FNumSql >= FLimitSql) then
    Executar;

  Result := Self;
end;


function TSqlEmLote.SelectSum(ptabela, pcampos,
  pcondicao: String): Integer;
begin
  try
    Executar;
    MontaComando(ptabela,'','',pcondicao);

    FInstrucaoAcum := 'select SUM(Coalesce('+Fcampos+',0)) sum'+#13+
                      '  from '+Ftabela +#13+
                      ' '+Uppercase(Fcondicao) +';';
    Open(FInstrucaoAcum);
    Result := Query.FieldByName('sum').AsInteger;
    Inicializa;
  except
    on e:Exception do
      Result := 0;
  end;
end;

function TSqlEmLote.SelectSumCurrency(ptabela, pcampos,
  pcondicao: String): Currency;
begin
  try
    Executar;
    MontaComando(ptabela,'','',pcondicao);

    FInstrucaoAcum := 'select SUM(Coalesce('+Fcampos+',0)) sum'+#13+
                      '  from '+Ftabela +#13+
                      ' '+Uppercase(Fcondicao) +';';
    Open(FInstrucaoAcum);
    Result := Query.FieldByName('sum').AsCurrency;
    Inicializa;
  except
    on e:Exception do
      Result := 0.00;
  end;
end;

function TSqlEmLote.Count: TSqlEmLote;
begin
  if Trim(UpperCase(Copy(FInstrucaoAcum, 10, 4))) = 'FROM' then
    System.Insert('count(*)',FInstrucaoAcum,8)
  else
    System.Insert('count(*), ',FInstrucaoAcum,8);
  Inc(FNumSql);
  Result := Self;
end;

function TSqlEmLote.SelectAgregar(ptabela, pcondicao: String): TSqlEmLote;
begin
  MontaComando(ptabela,'','',pcondicao);

  FInstrucaoAcum := 'select '+
                    '  from '+Ftabela +
                    ' '+Uppercase(Fcondicao);

  Result := Self;
end;

function TSqlEmLote.Sum(pcampo: String): TSqlEmLote;
begin
  if Trim(UpperCase(Copy(FInstrucaoAcum, 10, 4))) = 'FROM' then
    System.Insert('sum('+pcampo+') '+pcampo+'Sum ',FInstrucaoAcum,8)
  else
    System.Insert('sum('+pcampo+') '+pcampo+'Sum ,',FInstrucaoAcum,8);
  Inc(FNumSql);
  Result := Self;
end;

function TSqlEmLote.Open: TSqlEmLote;
begin
  if trim(FInstrucaoAcum) = '' then
    exit;

  try
  FreeAndNil(FQuery);
  FQuery := TPhQuery.Create(nil);
  FQuery.Connection := DmPostgres.ADConnection1;

    FQuery.Open(FInstrucaoAcum);
    Result := Self;
    Inicializa;
  except
    on E: Exception do
    begin
      ShowMessage('Problemas no open - Erro: '+E.Message);
    end;
  end;
end;

function TSqlEmLote.SelectCountAgrupado(ptabela,
  pcondicao: String): TSqlEmLote;
begin
  MontaComando(ptabela,'','',pcondicao);
  Fincluicommit := false;

  FInstrucaoAcum := FInstrucaoAcum +
                    'select count(*) count'+#13+
                    '  from '+Ftabela +#13+
                    ' '+Uppercase(Fcondicao);

  Result := Self;
end;


procedure TSqlEmLote.SetLimitSql(const Value: Integer);
begin
  FLimitSql := Value;
end;

function TSqlEmLote.DeleteUsing(ptabela, ptabelausing,
  pcondicao: String): TSqlEmLote;
begin
  MontaComandoDelete(ptabela,ptabelausing,pcondicao);

  FInstrucaoAcum := FInstrucaoAcum +
                  'DO $$' +#13+
                  'BEGIN' +#13+
                  '   delete from '+Ftabela+#13+
                  '   using '+Ftabelausing+#13+
                  '   '+Fcondicao +';'+#13+
                  'END' +#13+
                  '$$;';

  if (FNumSql >= FLimitSql) then
    Executar;
  Result := Self;

end;

procedure TSqlEmLote.MontaComandoDelete(ptabela, ptabelausing, pcondicao: String);
begin
  inc(FNumSql);

  Fcondicao := '';
  Ftabela := ptabela + ' a ';
  Ftabelausing := ptabelausing + ' b ';

  if (FNumSql = 1) then
  begin
    if ((ptabela <> '') or (pcondicao <> ''))then
    begin
      FInstrucaoAcum := 'BEGIN;';
      Fincluicommit := true;
    end
    else
      FInstrucaoAcum := '';
  end;

  if (FZeroList.IndexOf(UpperCase(ptabela)) > -1) and (FZeroList.IndexOf(UpperCase(ptabelausing)) > -1) then
  begin
    if pcondicao <> '' then
      Fcondicao := ' where a.phx_apelido = b.phx_apelido and a.phx_apelido = ' + QuotedStr( GGApelidoAtv ) + ' and ' + pcondicao
    else
      Fcondicao := ' where a.phx_apelido = b.phx_apelido and a.phx_apelido = ' + QuotedStr( GGApelidoAtv );
  end
  else
  if (FAnoMesList.IndexOf(UpperCase(ptabela)) > -1) and (FAnoMesList.IndexOf(UpperCase(ptabelausing)) > -1) then
  begin
    if pcondicao <> '' then
      Fcondicao := ' where a.phx_apelido = b.phx_apelido and a.phx_ano = b.phx_ano and a.phx_mes = b.phx_mes and a.phx_apelido = ' + QuotedStr( GGApelidoAtv ) + ' and a.phx_ano = ' + IntToStr(GGanoAtv) + ' and a.phx_mes = ' + IntToStr(GGmesAtv) + ' and ' + pcondicao
    else
      Fcondicao := ' where a.phx_apelido = b.phx_apelido and a.phx_ano = b.phx_ano and a.phx_mes = b.phx_mes and a.phx_apelido = ' + QuotedStr( GGApelidoAtv ) + ' and a.phx_ano = ' + IntToStr(GGanoAtv) + ' and a.phx_mes = ' + IntToStr(GGmesAtv);
  end
  else
  if (FAnoList.IndexOf(UpperCase(ptabela)) > -1) and (FAnoList.IndexOf(UpperCase(ptabelausing)) > -1) then
  begin
    if pcondicao <> '' then
      Fcondicao := ' where a.phx_apelido = b.phx_apelido and a.phx_ano = b.phx_ano and a.phx_apelido = ' + QuotedStr( GGApelidoAtv ) + ' and a.phx_ano = ' + IntToStr(GGanoAtv) + ' and ' + pcondicao
    else
      Fcondicao := ' where a.phx_apelido = b.phx_apelido and a.phx_ano = b.phx_ano and a.phx_apelido = ' + QuotedStr( GGApelidoAtv ) + ' and a.phx_ano = ' + IntToStr(GGanoAtv);
  end
  else
  begin
    if pcondicao <> '' then
      Fcondicao := ' where '+pcondicao;
  end;
end;

procedure TSqlEmLote.SetInstrucaoAcum(const Value: String);
begin
  Fincluicommit := false;
  FInstrucaoAcum := Value;
end;

end.
