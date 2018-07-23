unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, MemDS, DBAccess, Uni, SetupQuery,
  alterdataconnection, StdCtrls, ALTERDATA, DASQLMonitor, UniSQLMonitor,
  ExtCtrls;

type
  TForm1 = class(TForm)
    AlterdataConnection1: TAlterdataConnection;
    QryFiltroMovimento: TSetupQuery;
    UniSQLMonitor1: TUniSQLMonitor;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);

    procedure SelecionaHorarioFuncionario;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
//var
//  lcSql : TStringList;
//  I : iNTEGER;
//begin
//  lcSql := TStringList.Create;
//  lcSql.Add(' 	SELECT');
//      lcSql.Add('		    M.cdEmpresa,M.idFuncionario,M.tpPessoa,M.DtMovimentacao,M.stWDP,M.stNaoCalcular,');
//      lcSql.Add('			FP.NmFuncionario,FP.cdChamada,FP.dtDemissao,FP.dtAdmissao,FP.dtTransferencia,FP.idDepartamento,');
//      lcSql.Add(' 		FP.idFuncao,FP.idSindicatoGRCS,');
//      lcSql.Add('			StatusMovimentacao1 ,StatusMovimentacao2 ,StatusMovimentacao3,');
//      lcSql.Add('			StatusMovimentacao4 ,StatusMovimentacao5 ,StatusMovimentacao6,');
//      lcSql.Add(' 		StatusMovimentacao7 ,StatusMovimentacao8 ,StatusMovimentacao9,');
//      lcSql.Add('			StatusMovimentacao10,');
//      lcSql.Add(' 		MotivoMovimentacao1,MotivoMovimentacao2,MotivoMovimentacao3,');
//      lcSql.Add('			MotivoMovimentacao4,MotivoMovimentacao5,MotivoMovimentacao6,');
//      lcSql.Add('			MotivoMovimentacao7,MotivoMovimentacao8,MotivoMovimentacao9,');
//      lcSql.Add(' 		MotivoMovimentacao10,');
//      lcSql.Add('	{fn TOCHAR({fn SUBSTRING(HoraMovTotal,:p1, :p4)})} AS HrMovimentacao1,{fn TOCHAR({fn SUBSTRING(HoraMovTotal,:p5, :p4)})} AS HrMovimentacao2,{fn TOCHAR({fn SUBSTRING(HoraMovTotal,:p9, :p4)})} AS HrMovimentacao3,');
//      lcSql.Add('	{fn TOCHAR({fn SUBSTRING(HoraMovTotal,:p13,:p4)})} AS HrMovimentacao4,{fn TOCHAR({fn SUBSTRING(HoraMovTotal,:p17,:p4)})} AS HrMovimentacao5,{fn TOCHAR({fn SUBSTRING(HoraMovTotal,:p21,:p4)})}  AS HrMovimentacao6,');
//      lcSql.Add('	{fn TOCHAR({fn SUBSTRING(HoraMovTotal,:p25,:p4)})} AS HrMovimentacao7,{fn TOCHAR({fn SUBSTRING(HoraMovTotal,:p29,:p4)})} AS HrMovimentacao8,{fn TOCHAR({fn SUBSTRING(HoraMovTotal,:p33,:p4)})}  AS HrMovimentacao9,');
//      lcSql.Add('	{fn TOCHAR({fn SUBSTRING(HoraMovTotal,:p37,:p4)})}  AS HrMovimentacao10,');
//      lcSql.Add('	{fn TOCHAR({fn SUBSTRING(HoraTotal,:p1, :p4)})} AS Hrlegal1,{fn TOCHAR({fn SUBSTRING(HoraTotal,:p5, :p4)})} AS Hrlegal2,{fn TOCHAR({fn SUBSTRING(HoraTotal,:p9, :p4)})}  AS Hrlegal3,');
//      lcSql.Add('	{fn TOCHAR({fn SUBSTRING(HoraTotal,:p13,:p4)})} AS Hrlegal4,{fn TOCHAR({fn SUBSTRING(HoraTotal,:p17,:p4)})} AS Hrlegal5,{fn TOCHAR({fn SUBSTRING(HoraTotal,:p21,:p4)})}  AS Hrlegal6,');
//      lcSql.Add('	{fn TOCHAR({fn SUBSTRING(HoraTotal,:p25,:p4)})} AS Hrlegal7,{fn TOCHAR({fn SUBSTRING(HoraTotal,:p29,:p4)})} AS Hrlegal8,{fn TOCHAR({fn SUBSTRING(HoraTotal,:p33,:p4)})}  AS Hrlegal9,');
//      lcSql.Add('	{fn TOCHAR({fn SUBSTRING(HoraTotal,:p37,:p4)})}  AS Hrlegal10');
//      lcSql.Add('		FROM');
//      lcSql.Add(' 	(select cdEmpresa,idFuncionario,tpPessoa,DtMovimentacao,stWDP,stNaoCalcular,');
//      lcSql.Add('			      StatusMovimentacao1 ,StatusMovimentacao2 ,StatusMovimentacao3,');
//      lcSql.Add(' 		      StatusMovimentacao4 ,StatusMovimentacao5 ,StatusMovimentacao6,');
//      lcSql.Add('			      StatusMovimentacao7 ,StatusMovimentacao8 ,StatusMovimentacao9,');
//      lcSql.Add(' 		      StatusMovimentacao10,');
//      lcSql.Add('			      MotivoMovimentacao1,MotivoMovimentacao2,MotivoMovimentacao3,');
//      lcSql.Add('			      MotivoMovimentacao4,MotivoMovimentacao5,MotivoMovimentacao6,');
//      lcSql.Add(' 		      MotivoMovimentacao7,MotivoMovimentacao8,MotivoMovimentacao9,');
//      lcSql.Add('			      MotivoMovimentacao10,');
//      lcSql.Add('    /*HrLegal*/');
//      lcSql.Add('           {fn concat({fn concat({fn concat({fn concat({fn concat(');
//      lcSql.Add('	          {fn concat({fn concat({fn concat({fn concat(');
//      lcSql.Add('	          (CASE WHEN StatusMovimentacao1  = :pD THEN :pVazio ELSE COALESCE(HrMovimentacao1,:pVazio)  END),');
//      lcSql.Add('	          (CASE WHEN StatusMovimentacao2  = :pD THEN :pVazio ELSE COALESCE(HrMovimentacao2,:pVazio)  END))},');
//      lcSql.Add('	          (CASE WHEN StatusMovimentacao3  = :pD THEN :pVazio ELSE COALESCE(HrMovimentacao3,:pVazio)  END))},');
//      lcSql.Add('	          (CASE WHEN StatusMovimentacao4  = :pD THEN :pVazio ELSE COALESCE(HrMovimentacao4,:pVazio)  END))},');
//      lcSql.Add('	          (CASE WHEN StatusMovimentacao5  = :pD THEN :pVazio ELSE COALESCE(HrMovimentacao5,:pVazio)  END))},');
//      lcSql.Add('	          (CASE WHEN StatusMovimentacao6  = :pD THEN :pVazio ELSE COALESCE(HrMovimentacao6,:pVazio)  END))},');
//      lcSql.Add('	          (CASE WHEN StatusMovimentacao7  = :pD THEN :pVazio ELSE COALESCE(HrMovimentacao7,:pVazio)  END))},');
//      lcSql.Add('	          (CASE WHEN StatusMovimentacao8  = :pD THEN :pVazio ELSE COALESCE(HrMovimentacao8,:pVazio)  END))},');
//      lcSql.Add('	          (CASE WHEN StatusMovimentacao9  = :pD THEN :pVazio ELSE COALESCE(HrMovimentacao9,:pVazio)  END))},');
//      lcSql.Add('	          (CASE WHEN StatusMovimentacao10 = :pD THEN :pVazio ELSE COALESCE(HrMovimentacao10,:pVazio) END))} AS HoraTotal,');
//      lcSql.Add('		/*HrMovimentacao*/');
//      lcSql.Add(' 	        {fn concat({fn concat({fn concat({fn concat({fn concat(');
//      lcSql.Add('		        {fn concat({fn concat({fn concat({fn concat(');
//      lcSql.Add('		        COALESCE(HrMovimentacao1,:pVazio),COALESCE(HrMovimentacao2,:pVazio))},COALESCE(HrMovimentacao3,:pVazio))},');
//      lcSql.Add(' 	        COALESCE(HrMovimentacao4,:pVazio))},COALESCE(HrMovimentacao5,:pVazio))},COALESCE(HrMovimentacao6,:pVazio))},');
//      lcSql.Add('		        COALESCE(HrMovimentacao7,:pVazio))},COALESCE(HrMovimentacao8,:pVazio))},COALESCE(HrMovimentacao9,:pVazio))},');
//      lcSql.Add(' 	        COALESCE(HrMovimentacao10,:pVazio))} AS HoraMovTotal');
//      lcSql.Add('		FROM WPONTO.Movimen)M');
//
////      if BhAutomatico then
////        begin
////          lcSql.Add('		left join wponto.FuncBanco FB on (FB.CdEmpresa = M.CdEmpresa');
////          lcSql.Add('		                                  and FB.IdFuncionario = M.IdFuncionario');
////          lcSql.Add('		                                  and FB.TPPessoa = M.TpPessoa)');
////        end;
//
//      lcSql.Add('INNER JOIN (SELECT F.NmFuncionario, F.cdChamada, F.dtDemissao, F.dtAdmissao,F.dtTransferencia,F.idDepartamento,F.idFuncao,F.idSindicatoGRCS,''F'' AS tipoPessoa,F.idFuncionario');
//      lcSql.Add('	        FROM WPONTO.F' + StrZero(IntToStr(1),5) + ' F');
//      lcSql.Add('	        UNION');
//      lcSql.Add('	        SELECT P.nmPessoa AS nmFuncionario,P.cdChamada,P.dtTermino AS dtDemissao,P.dtCadastro AS dtAdmissao, {date ''1899-12-31''} AS dtTransferencia,');
//      lcSql.Add('	                        P.idDepartamento,P.idFuncao,P.idSindicato AS IdSindicatoGRCS,P.tpPessoa AS tipoPessoa,P.idPessoa AS idFuncionario');
//      lcSql.Add('	        FROM WPONTO.Pessoa P) FP ON M.idFuncionario = FP.idFuncionario AND M.tpPessoa = FP.tipoPessoa');
//      lcSql.Add('	        WHERE (M.cdEmpresa = :pCdEmpresa)');
//      lcSql.Add('	              AND (M.DtMovimentacao between :pDataIni and :pDataFim)');
//
////      if BhAutomatico then
////        begin
////          lcSql.Add('       and (((FB.StAtraso = ''S'') or (FB.StHoraExtra = ''S'')  or (FB.StFalta = ''S''))');
////          lcSql.Add('       and (M.DtMovimentacao >= FB.DtInicio) and ((M.DtMovimentacao <= FB.DtFinal) or (coalesce(FB.DtFinal,{date ''1899-12-31''}) = {date ''1899-12-31''}))) or (M.TpPessoa <> ''F'')');
//////        end;
//
////      if not empty (pIdFuncionario) then
////        lcSql.add(' AND (M.idFuncionario IN (' + quotedStr(pIdFuncionario) + ')) AND (M.tpPessoa = ' + quotedStr(pTpPessoa) + ')');
////      if not empty(lcWhereIdFun) then
////        lcSql.add(' AND (M.idFuncionario + M.tpPessoa IN ' + lcWhereIdFun+ ')');
////      if not empty(lcWhereIdPessoa) then
////        lcSql.add(' AND (M.idFuncionario + M.tpPessoa IN ' + lcWhereIdPessoa+ ')');
////      if not Empty (pIdDepartamento) then
////        lcSql.add(' AND (FP.idDepartamento = ' + quotedStr(pidDepartamento) + ')');
//
////      if (TipoOrdenacaoMov = toData) then
////        //lcSql.add('ORDER BY cdEmpresa,idFuncionario,tpPessoa,dtMovimentacao')
////        lcSql.add('ORDER BY dtMovimentacao')
////      else
//        //lcSql.add('ORDER BY cdEmpresa,idFuncionario,tpPessoa,NmFuncionario');
//        lcSql.add('ORDER BY NmFuncionario');
//
//      QryFiltroMovimento.SQL.Assign(lcSql);
//
//      i := 1;
//      while (i < 38) do
//        begin
//          QryFiltroMovimento.ParamByName('p' + IntToStr(i)).AsInteger := i;
//          i := i + 4;
//        end;
//
//      QryFiltroMovimento.ParamByName('pD').AsString  := 'D';
//      QryFiltroMovimento.ParamByName('p4').AsInteger := 4;
//      QryFiltroMovimento.ParamByName('pVazio').AsString := '';
//      QryFiltroMovimento.ParamByName('pCdEmpresa').AsInteger  := 1;
//      {QryFiltroMovimento.ParamByName('pDataIni').AsDateTime   := IfThen(not Empty(pDtInicio),pDtInicio,0);
//      QryFiltroMovimento.ParamByName('pDataFim').AsDateTime   := IfThen(not Empty(pDtFim),pDtFim,0);}
//
//      QryFiltroMovimento.ParamByName('pDataIni').AsDateTime   := StrToDateTime('01/11/2011');
//      QryFiltroMovimento.ParamByName('pDataFim').AsDateTime   := StrToDateTime('30/11/2011');
//      QryFiltroMovimento.Schema := 'WPONTO';
//      QryFiltroMovimento.Open;
//  lcSql.Free;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
//  QryFiltroMovimento.First;
//  showmessage(QryFiltroMovimento.FieldByName('HrMovimentacao1').AsString);

  SelecionaHorarioFuncionario;
end;


procedure TForm1.SelecionaHorarioFuncionario;

begin
  {Essa query serve para selecionar o primeiro Horário do Funcionário naquele dia}

  try
    QryFiltroMovimento.Close;
    QryFiltroMovimento.SQL.Clear;
    QryFiltroMovimento.SQL.Add('select {TOP_MACRO 1}');
    QryFiltroMovimento.SQL.Add('       case when CDHrComp = 0 then');
    QryFiltroMovimento.SQL.Add('       case when CdEscala = '''' then');
    QryFiltroMovimento.SQL.Add('       case when CdTurno = '''' then');
    QryFiltroMovimento.SQL.Add('         CdHistorico');
    QryFiltroMovimento.SQL.Add('       else CdTurno end');
    QryFiltroMovimento.SQL.Add('       else CdEscala end');
    QryFiltroMovimento.SQL.Add('       else');
    QryFiltroMovimento.SQL.Add('       CDHrComp end as CdChamada,');
    QryFiltroMovimento.SQL.Add('       TipoHorario,');
    QryFiltroMovimento.SQL.Add('       DsDescansoSemanal,');
    QryFiltroMovimento.SQL.Add('       HrEntrada,HrSaida,HrSaidaAlmoco,HrVoltaAlmoco,');
    QryFiltroMovimento.SQL.Add('       DsIntervaloLanche,');
    QryFiltroMovimento.SQL.Add('       Data,');
    QryFiltroMovimento.SQL.Add('       DtTermino');
    QryFiltroMovimento.SQL.Add('from (select cast (HC.NrDiaSemana as varchar) as CDHrComp,');
    QryFiltroMovimento.SQL.Add('       '''' as CdEscala,');
    QryFiltroMovimento.SQL.Add('       '''' as CdTurno,');
    QryFiltroMovimento.SQL.Add('       '''' as CdHistorico,');
    QryFiltroMovimento.SQL.Add('       ''thComplementar'' as TipoHorario,');
    QryFiltroMovimento.SQL.Add('       1 as prioridade_Horario,');
    QryFiltroMovimento.SQL.Add('       H.DsDescansoSemanal as DsDescansoSemanal,');
    QryFiltroMovimento.SQL.Add('       HC.HrEntrada,');
    QryFiltroMovimento.SQL.Add('       HC.HrSaida,');
    QryFiltroMovimento.SQL.Add('       HC.HrSaidaAlmoco,');
    QryFiltroMovimento.SQL.Add('       HC.HrVoltaAlmoco,');
    QryFiltroMovimento.SQL.Add('       H.DsIntervaloLanche,');
    QryFiltroMovimento.SQL.Add('       HC.CdEmpresa,');
    QryFiltroMovimento.SQL.Add('       HC.IdFuncionario,');
    QryFiltroMovimento.SQL.Add('       HC.TpPessoa,');
    QryFiltroMovimento.SQL.Add('       HC.DtAlteracao as Data,');
    QryFiltroMovimento.SQL.Add('       HC.DtTermino as DtTermino');
    QryFiltroMovimento.SQL.Add('from &pTabelaHrComp HC');
    QryFiltroMovimento.SQL.Add('left join &pTabelaHor H on (H.IdHorario = HC.IdHorario)');
    QryFiltroMovimento.SQL.Add('union');
    QryFiltroMovimento.SQL.Add('select '''' as CDHrComp,');
    QryFiltroMovimento.SQL.Add('       H.CdChamada as CdEscala,');
    QryFiltroMovimento.SQL.Add('       '''' as CdTurno,');
    QryFiltroMovimento.SQL.Add('       '''' as CdHistorico,');
    QryFiltroMovimento.SQL.Add('       ''thEscala'' as TipoHorario,');
    QryFiltroMovimento.SQL.Add('       2 as prioridade_Horario,');
    QryFiltroMovimento.SQL.Add('       H.DsDescansoSemanal as DsDescansoSemanal,');
    QryFiltroMovimento.SQL.Add('       H.HrEntrada,');
    QryFiltroMovimento.SQL.Add('       H.HrSaida,');
    QryFiltroMovimento.SQL.Add('       H.HrSaidaAlmoco,');
    QryFiltroMovimento.SQL.Add('       H.HrVoltaAlmoco,');
    QryFiltroMovimento.SQL.Add('       H.DsIntervaloLanche,');
    QryFiltroMovimento.SQL.Add('       ER.CdEmpresa,');
    QryFiltroMovimento.SQL.Add('       ER.IdFuncionario,');
    QryFiltroMovimento.SQL.Add('       ER.TpPessoa,');
    QryFiltroMovimento.SQL.Add('       ER.DtMovimentacao as Data,');
    QryFiltroMovimento.SQL.Add('       ER.DtUltimaAtualizacao as DtTermino');
    QryFiltroMovimento.SQL.Add('from wponto.EscalaRevezItem ER');
    QryFiltroMovimento.SQL.Add('left join &pTabelaHor H on (H.IdHorario = ER.IdHorario)');
    QryFiltroMovimento.SQL.Add('union');
    QryFiltroMovimento.SQL.Add('select '''' as CDHrComp,');
    QryFiltroMovimento.SQL.Add('       '''' as CdEscala,');
    QryFiltroMovimento.SQL.Add('       HT.DsTurno as CdTurno,');
    QryFiltroMovimento.SQL.Add('       '''' as CdHistorico,');
    QryFiltroMovimento.SQL.Add('       ''thTurno'' as TipoHorario,');
    QryFiltroMovimento.SQL.Add('       3 as prioridade_Horario,');
    QryFiltroMovimento.SQL.Add('       H.DsDescansoSemanal as DsDescansoSemanal,');
    QryFiltroMovimento.SQL.Add('       HT.HrEntrada, HT.HrSaida,HT.HrSaidaAlmoco,HT.HrVoltaAlmoco,');
    QryFiltroMovimento.SQL.Add('       H.DsIntervaloLanche,');
    QryFiltroMovimento.SQL.Add('       HT.CdEmpresa,');
    QryFiltroMovimento.SQL.Add('       HT.IdFuncionario,');
    QryFiltroMovimento.SQL.Add('       HT.TpPessoa,');
    QryFiltroMovimento.SQL.Add('       HT.DtAlteracao as Data,');
    QryFiltroMovimento.SQL.Add('       HT.DtTermino');
    QryFiltroMovimento.SQL.Add('from WPONTO.HrTurno HT');
    QryFiltroMovimento.SQL.Add('left join &pTabelaHor H on (H.IdHorario = HT.IdHorario)');
    QryFiltroMovimento.SQL.Add('union');
    QryFiltroMovimento.SQL.Add('select '''' as CDHrComp,');
    QryFiltroMovimento.SQL.Add('       '''' as CdEscala,');
    QryFiltroMovimento.SQL.Add('       '''' as CdTurno,');
    QryFiltroMovimento.SQL.Add('       H.CdChamada as CdHistorico,');
    QryFiltroMovimento.SQL.Add('       ''thHistorico'' as TipoHorario,');
    QryFiltroMovimento.SQL.Add('       4 as prioridade_Horario,');
    QryFiltroMovimento.SQL.Add('       H.DsDescansoSemanal as DsDescansoSemanal,');
    QryFiltroMovimento.SQL.Add('       H.HrEntrada,H.HrSaida,H.HrSaidaAlmoco,H.HrVoltaAlmoco,');
    QryFiltroMovimento.SQL.Add('       H.DsIntervaloLanche,');
    QryFiltroMovimento.SQL.Add('       HH.CdEmpresa,');
    QryFiltroMovimento.SQL.Add('       HH.IdFuncionario,');
    QryFiltroMovimento.SQL.Add('       HH.TpPessoa,');
    QryFiltroMovimento.SQL.Add('       :pData as Data,');
    QryFiltroMovimento.SQL.Add('       HH.DtUltimaAtualizacao as DtTermino');
    QryFiltroMovimento.SQL.Add('from WPONTO.HistHor HH');
    QryFiltroMovimento.SQL.Add('left join &pTabelaHor H on (H.IdHorario = HH.IdHorario))HORARIO');
    QryFiltroMovimento.SQL.Add('where HORARIO.CdEmpresa = :pCdEmpresa and');
    QryFiltroMovimento.SQL.Add('      HORARIO.IdFuncionario = :pIdFuncionario and');
    QryFiltroMovimento.SQL.Add('      HORARIO.tpPessoa = :pTpPessoa and');
    QryFiltroMovimento.SQL.Add('      :pData between HORARIO.Data and coalesce(HORARIO.DtTermino,:pData) {LIMIT_MACRO 1}');
    QryFiltroMovimento.SQL.Add('      order by prioridade_Horario');
    QryFiltroMovimento.MacroByName('pTabelaHor').Value        := 'wdp.HORARIO';
    QryFiltroMovimento.MacroByName('pTabelaHrComp').Value     := 'wdp.HrComp';
    QryFiltroMovimento.ParamByName('pCdEmpresa').AsInteger    := 205;
    QryFiltroMovimento.ParamByName('pIdFuncionario').AsString := '001000000P';
    QryFiltroMovimento.ParamByName('pTpPessoa').AsString      := 'F';
    QryFiltroMovimento.ParamByName('pData').asDateTime        := StrToDate('01/01/2011');
    QryFiltroMovimento.Open;

    DataSource1.DataSet := QryFiltroMovimento;
  except on e:Exception do
    ShowMessage('Erro Método SelecionaHorarioFuncionario : '+ e.message);
  end;
end;
end.
