unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, MemDS, DBAccess, Uni, SetupQuery,
  alterdataconnection, StrUtils, Grids, DBGrids, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  IFabricadeForms, LibFis, moviment, Alterdata;

type
  TForm1 = class(TForm)
    Button1: TButton;
    AlterdataConnection1: TAlterdataConnection;
    SetupQuery1: TSetupQuery;
    RadioGroup1: TRadioGroup;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    function GetDataUltimoMovimento: TDateTime;
//    procedure DefinirCampo(pType: TFieldType; pName: string;pDataSet: TDataSet;pSize: integer = 0;AcxGridDBColumn : TcxGridDBColumn = nil; pKind: TFieldKind = fkData);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  SetupQuery1.IndexFieldNames := '';
  SetupQuery1.Close;
  SetupQuery1.Sql.Clear;
//  SetupQuery1.Sql.Add('Select *');
//  SetupQuery1.Sql.Add('from WFISCAL.M00001');
//  SetupQuery1.Sql.Add('where DtEscrituracao between :pDataIni and :pDataFim');
//  SetupQuery1.Sql.Add(' and StTipo = &pTipo');

  SetupQuery1.Sql.Add('SELECT');
  SetupQuery1.Sql.Add('  /* Valor Default --*/');
  SetupQuery1.Sql.Add('  :pDataIni as DtInicial,');
  SetupQuery1.Sql.Add('  :pDataFim as DtFinal,');
  SetupQuery1.Sql.Add('  CAST(''00001'' AS VARCHAR) as CdEmpresa,');
  SetupQuery1.Sql.Add('  CAST(''EMPRESA TESTE LUCRO PRESUMIDO'' AS VARCHAR) as NmEmpresa,');
  SetupQuery1.Sql.Add('  CAST('''' AS VARCHAR) as CdFornCliFiltro,');
  SetupQuery1.Sql.Add('  CAST(''Todos os Fornecedores.'' AS VARCHAR) as NmFornCliFiltro,');
  SetupQuery1.Sql.Add('  CAST(''isento'' AS VARCHAR) as InscEstadualEmpresa,');
  SetupQuery1.Sql.Add('  /* Campos com nome exatamente igual a tabela de movimento --  */');
  SetupQuery1.Sql.Add('  M.CdNota as CdNota,');
  SetupQuery1.Sql.Add('  M.StAcao as StAcao,');
  SetupQuery1.Sql.Add('  M.StTipo as StTipo,');
  SetupQuery1.Sql.Add('  COALESCE(M.Total_Pis_Unidade_Medida, 0) + COALESCE(M.Total_Pis_Cumulativo, 0) + COALESCE(M.Total_Pis_Nao_Cumulativo, 0) as Total_Pis,');
  SetupQuery1.Sql.Add('  COALESCE(M.Total_Cofins_Unidade_Medida, 0) + COALESCE(M.Total_Cofins_Cumulativo, 0) + COALESCE(M.Total_Cofins_Nao_Cumulativo, 0) as Total_Cofins,');
  SetupQuery1.Sql.Add('   COALESCE(M.Total_Base_Pis, 0) as Total_Base_Pis,');
  SetupQuery1.Sql.Add('   COALESCE(M.Total_Base_Cofins,0) as Total_Base_Cofins,');
  SetupQuery1.Sql.Add('  M.dtEscrituracao,');
  SetupQuery1.Sql.Add('  M.NmNumero,');
  SetupQuery1.Sql.Add('  M.NmSerie,');
  SetupQuery1.Sql.Add('  M.NmEspecie,');
  SetupQuery1.Sql.Add('  M.CdSitDocumento,');
  SetupQuery1.Sql.Add('  M.VlContabil,');
  SetupQuery1.Sql.Add('  M.VlICMSValor,');
  SetupQuery1.Sql.Add('  M.VlIPIValor,');
  SetupQuery1.Sql.Add('  M.VlICMSOutras,');
  SetupQuery1.Sql.Add('  M.VlIPINaoAproveitado,');
  SetupQuery1.Sql.Add('  M.IdCodForCli,');
  SetupQuery1.Sql.Add('  M.IdCodFiscal,');
  SetupQuery1.Sql.Add('  M.VlICMSBase,');
  SetupQuery1.Sql.Add('  M.VlICMSIsentas,');
  SetupQuery1.Sql.Add('  M.VlAbatePIS,');
  SetupQuery1.Sql.Add('  M.VlAbateCofins,');
  SetupQuery1.Sql.Add('  M.VrIRCompensar,');
  SetupQuery1.Sql.Add('  M.VrCSSLCompensar,');
  SetupQuery1.Sql.Add('  M.VlIPIBase,');
  SetupQuery1.Sql.Add('  M.BaFECPSTMVA,');
  SetupQuery1.Sql.Add('  M.BaFECPSTIntMVA,');
  SetupQuery1.Sql.Add('  M.IdModDocFiscal,');
  SetupQuery1.Sql.Add('  M.BaAntecParcial,');
  SetupQuery1.Sql.Add('  M.VrAntecParcial,');
  SetupQuery1.Sql.Add('  M.ValorSTInt,');
  SetupQuery1.Sql.Add('  M.BaseSTInt,');
  SetupQuery1.Sql.Add('  M.VlValorST,');
  SetupQuery1.Sql.Add('  M.VlBaseST,');
  SetupQuery1.Sql.Add('  M.VlIcmsAjuste,');
  SetupQuery1.Sql.Add('  M.VlIpiAjuste,');
  SetupQuery1.Sql.Add('  M.VlIPIOutras,');
  SetupQuery1.Sql.Add('  M.VlIPIIsentas,');
  SetupQuery1.Sql.Add('  M.CSTICMS,');
  SetupQuery1.Sql.Add('  M.VlReducaoBase,');
  SetupQuery1.Sql.Add('  M.AliqFECP,');
  SetupQuery1.Sql.Add('  M.ContReinicio,');
  SetupQuery1.Sql.Add('  COALESCE(M.VlBaseStTransporte, 0) as VlBaseStTransporte,');
  SetupQuery1.Sql.Add('  COALESCE(M.VlValorStTransporte, 0) as VlValorStTransporte,');
  SetupQuery1.Sql.Add('  M.DtEmissao,');
  SetupQuery1.Sql.Add('  COALESCE(M.VlBaseDiferencial, 0) as VlBaseDiferencial,');
  SetupQuery1.Sql.Add('  COALESCE(M.VlValorDiferencial, 0) as VlValorDiferencial,');
  SetupQuery1.Sql.Add('  M.CstPIS,');
  SetupQuery1.Sql.Add('  M.CstCOFINS,');
  SetupQuery1.Sql.Add('  M.NatBaseCredito,');
  SetupQuery1.Sql.Add('  M.IndNaturezaFrete,');
  SetupQuery1.Sql.Add('  M.ValorMercadorias,');
  SetupQuery1.Sql.Add('  M.VlDespAces,');
  SetupQuery1.Sql.Add('  M.VlValorSeguro,');
  SetupQuery1.Sql.Add('  M.VlValorFrete,');
  SetupQuery1.Sql.Add('  /* Campos com nome diferente da tabela de movimento -- */');
  SetupQuery1.Sql.Add('  M.VlICMSAliquota,');
  SetupQuery1.Sql.Add('  M.VlIPIAliquota,');
  SetupQuery1.Sql.Add('  M.IdTipoOperacao as CdTpOperacaoContabil,');
  SetupQuery1.Sql.Add('  M.NmObservacao as Observacao,');
  SetupQuery1.Sql.Add('  M.ContReducao as ContReducaoZ,');
  SetupQuery1.Sql.Add('  M.VlOperacaoPE,');
  SetupQuery1.Sql.Add('  M.VlBaseICMSAntecipadoPE,');
  SetupQuery1.Sql.Add('  M.CodECF as CodECF,');
  SetupQuery1.Sql.Add('  M.VlrTotalInicial,');
  SetupQuery1.Sql.Add('  M.VlrTotalFinal,');
  SetupQuery1.Sql.Add('  M.ValorVendaBruta,');
  SetupQuery1.Sql.Add('  M.VlCancelamento,');
  SetupQuery1.Sql.Add('  M.VlDescontosp,');
  SetupQuery1.Sql.Add('  M.VlISSQN,');
  SetupQuery1.Sql.Add('  SYSTEM.ALT_ROUNDREAL(COALESCE(M.AlAntecParcial,0),2) as AlAntecParcial,');
  SetupQuery1.Sql.Add('  SYSTEM.ALT_ROUNDREAL(COALESCE(M.AlRedVlAntecParcial,0),2) as AlRedVlAntecParcial,');
  SetupQuery1.Sql.Add('  SYSTEM.ALT_ROUNDREAL(COALESCE(M.ICMSDestacadoAntecParcial,0),2) as ICMSDestacadoAntecParcial,');
  SetupQuery1.Sql.Add('  /* Campos com condição --                   */');
  SetupQuery1.Sql.Add('   CAST(Case WHEN M.CdTpPagamento = ''0'' THEN ''À Vista'' WHEN M.CdTpPagamento = ''1'' THEN ''A Prazo'' ELSE ''Sem Pagamento'' END AS VARCHAR) as CdTpPagamento,');
  SetupQuery1.Sql.Add('   CAST(Case WHEN M.StCancelada = ''S'' THEN ''Sim'' ELSE ''Não'' END AS VARCHAR) as StCancelada,');
  SetupQuery1.Sql.Add('  CAST(Case WHEN M.StCombustivel = ''S'' THEN ''Sim'' ELSE ''Não'' END AS VARCHAR) as StCombustivel,');
  SetupQuery1.Sql.Add('  CAST(Case WHEN M.StExportado = ''S'' THEN ''Sim'' ELSE ''Não'' END AS VARCHAR) as StExportado,');
  SetupQuery1.Sql.Add('  CAST(COALESCE(system.ALT_ONLYNUMBER(system.ALT_COPY(NMNUMERO,''/''),0),''0'') AS INTEGER) as INumDoc,');
  SetupQuery1.Sql.Add('  /* Campos da tabela de códigos fiscais --  */');
  SetupQuery1.Sql.Add('  CFOP.NmNome as CFOPDescricao,');
  SetupQuery1.Sql.Add(' CAST(Case WHEN CFOP.CdTipo = ''C'' and M.StTipo = ''E'' THEN ''Compras Normais''');
  SetupQuery1.Sql.Add('       WHEN CFOP.CdTipo = ''C'' and M.StTipo = ''S'' THEN ''Vendas Normais''');
  SetupQuery1.Sql.Add('       WHEN CFOP.CdTipo = ''T'' THEN ''Transferências''');
  SetupQuery1.Sql.Add('       WHEN CFOP.CdTipo = ''D'' THEN ''Devoluções''');
  SetupQuery1.Sql.Add('       WHEN CFOP.CdTipo = ''E'' THEN ''Energia Elétrica''');
  SetupQuery1.Sql.Add('       WHEN CFOP.CdTipo = ''U'' THEN ''Uso e Consumo''');
  SetupQuery1.Sql.Add('       WHEN CFOP.CdTipo = ''A'' THEN ''Ativo Imobilizado''');
  SetupQuery1.Sql.Add('       WHEN CFOP.CdTipo = ''M'' THEN ''Comunicações''');
  SetupQuery1.Sql.Add('       WHEN CFOP.CdTipo = ''R'' THEN ''Transportes''');
  SetupQuery1.Sql.Add('       WHEN CFOP.CdTipo = ''O'' THEN ''Outros''');
  SetupQuery1.Sql.Add('       WHEN CFOP.CdTipo = ''X'' THEN ''Exportação''');
  SetupQuery1.Sql.Add('       WHEN CFOP.CdTipo = ''I'' THEN ''Importação''');
  SetupQuery1.Sql.Add('       WHEN CFOP.CdTipo = ''S'' THEN ''Subst. Tributária''');
  SetupQuery1.Sql.Add('       WHEN CFOP.CdTipo = ''N'' THEN ''Transf. Ativo''');
  SetupQuery1.Sql.Add('       WHEN CFOP.CdTipo = ''F'' THEN ''Transf. Uso Cons.''');
  SetupQuery1.Sql.Add('       WHEN CFOP.CdTipo = ''.'' THEN ''Transf. Crédito''');
  SetupQuery1.Sql.Add('       ELSE '''' END AS VARCHAR) as DsTipoCFOP,');
  SetupQuery1.Sql.Add('  /* Campos da tabela de tipos de receita do simples --                              */');
  SetupQuery1.Sql.Add('  Case WHEN (M.IdTipoReceita IS NOT NULL) THEN T.CdTipoReceita END as CdTipoReceitaSimples,');
  SetupQuery1.Sql.Add('  Case WHEN (M.IdTipoReceita IS NOT NULL) THEN T.DsDescricao END as NmTipoReceitaSimples,');
  SetupQuery1.Sql.Add('  /* Campos da tabela de tipos de operação contábil --                               */');
  SetupQuery1.Sql.Add('  Case WHEN (M.IdTipoOperacao IS NOT NULL) THEN O.NmDescricao END as NmTpOperacaoContabil,');
  SetupQuery1.Sql.Add('  F.NmNome as NomeForn,');
  SetupQuery1.Sql.Add('  F.CdUF as UfCliFornec,');
  SetupQuery1.Sql.Add('  F.NmCidade as MunCliFornec,');
  SetupQuery1.Sql.Add('  F.CdInscrEstadual as InscrEstadual,');
  SetupQuery1.Sql.Add('  Case WHEN COALESCE(F.IdConta, '''') <> '''' THEN F.IdConta');
  SetupQuery1.Sql.Add('       WHEN COALESCE(F.IdConta, '''')  = '''' THEN FI.CdChamadaConta');
  SetupQuery1.Sql.Add('       END as CdContaContabil,');
  SetupQuery1.Sql.Add('  /* Campos da tabela de Natureza da Operação --                                  */');
  SetupQuery1.Sql.Add('  Case WHEN M.CdNatOperacaoREDF <> '''' THEN N.DsNaturezaOp END as DsNatOperacao,');
  SetupQuery1.Sql.Add('  /* Campos da tabela de códigos de receita da DACON --                           */');
  SetupQuery1.Sql.Add('  Case WHEN M.CdReceitaDacon <> '''' THEN D.CdReceita END as CdTipoReceitaDacon,');
  SetupQuery1.Sql.Add('  Case WHEN M.CdReceitaDacon <> '''' THEN D.DsReceita END as NmTipoReceitaDacon,');
  SetupQuery1.Sql.Add('  M.NmNumeroCompNFe,');
  SetupQuery1.Sql.Add('  M.NrChaveAcessoNFe,');
  SetupQuery1.Sql.Add('  M.NrChaveAcessoNFe as ChaveNfeCalculada,');
  SetupQuery1.Sql.Add('  MD.TpNFEletronica,');
  SetupQuery1.Sql.Add('  M.TpEmissaoNF,');
  SetupQuery1.Sql.Add('  F.CdCGC,');
  SetupQuery1.Sql.Add('  F.CdMunicipioSintegra,');
  SetupQuery1.Sql.Add('  MUN.CodMunicipio,');
  SetupQuery1.Sql.Add('  CAST('''' AS VARCHAR) as CdCFOPFiltro,');
  SetupQuery1.Sql.Add('  CAST(''Todos os códigos fiscais.'' AS VARCHAR) as NmCFOPFiltro,');
  SetupQuery1.Sql.Add('  CAST(''LEI COUTO - Serviços Contábeis S/S Ltda'' AS VARCHAR) as NmBureau');
  SetupQuery1.Sql.Add('FROM WFiscal.M00001 M');
  SetupQuery1.Sql.Add('  /* join com a tabela de códigos fiscais --                       */');
  SetupQuery1.Sql.Add('  LEFT JOIN WFiscal.CadFisM CFOP ON (M.IdCodFiscal = CFOP.IdCodigo)');
  SetupQuery1.Sql.Add('  /* join com a tabela de tipos de receita do simples --               */');
  SetupQuery1.Sql.Add('  LEFT JOIN WFiscal.TipoRecSSM T ON (M.IdTipoReceita = T.IdTipoReceita)');
  SetupQuery1.Sql.Add('  /* join com a tabela de tipos de operação contábil --                 */');
  SetupQuery1.Sql.Add('  LEFT JOIN WFiscal.CADTIPOOP O ON (M.IdTipoOperacao = O.IdTipoOperacao)');
  SetupQuery1.Sql.Add('  /* join com a tabela de fornecedores --                       */');
  SetupQuery1.Sql.Add('  LEFT JOIN wfiscal.FORNEC F ON (M.IdCodForCli = F.CdFornecedor)');
  SetupQuery1.Sql.Add('  /* join com a tabela de municípios IBGE --*/');
  SetupQuery1.Sql.Add('  LEFT JOIN wphd.MunicipiosIBGE MUN ON');
  SetupQuery1.Sql.Add('  ((MUN.IdMunicipio = F.IdMunicipio) AND (M.TpEmissaoNF <> ''S'')) OR');
  SetupQuery1.Sql.Add('  ((MUN.IdMunicipio = 3222) AND (M.TpEmissaoNF = ''S''))');
  SetupQuery1.Sql.Add('  /* join com a tabela de natureza de operação --*/');
  SetupQuery1.Sql.Add('  LEFT JOIN wfiscal.NaturezaOp N ON (M.CdNatOperacaoREDF = N.CdNaturezaOp)');
  SetupQuery1.Sql.Add('  /* join com a tabela de códigos de receita da DACON --*/');
  SetupQuery1.Sql.Add('  LEFT JOIN wfiscal.CodigosDacon D ON (M.CdReceitaDacon = D.CdReceita)');
  SetupQuery1.Sql.Add('  /* join com a tabela de integração (Fornecedor) --*/');
  SetupQuery1.Sql.Add('  LEFT JOIN WFISCAL.FrnInteg FI ON (FI.IdPlanoDeContas = 0) AND');
  SetupQuery1.Sql.Add('                                   (M.IdCodForCli = FI.CodFornecedor)');
  SetupQuery1.Sql.Add('  /* join com a tabela de modelos de nota --                     */');
  SetupQuery1.Sql.Add('  LEFT JOIN WFiscal.MODDOC MD ON (M.IdModDocFiscal = MD.CdCodigo)');
  SetupQuery1.Sql.Add('WHERE (M.dtEscrituracao >= :pDataIni) AND');
  SetupQuery1.Sql.Add('      (M.dtEscrituracao <= :pDataFim) AND');
  SetupQuery1.Sql.Add('      (M.StTipo = ''E'')');

//  SetupQuery1.MacroByName('pTipo').AsString := IfThen((RadioGroup1.ItemIndex = 0), 'E', 'S');
  SetupQuery1.ParamByName('pDataIni').AsDateTime := StrToDate('01/03/2013');
  SetupQuery1.ParamByName('pDataFim').AsDateTime := StrToDate('31/03/2013');
  SetupQuery1.DisableControls;
  SetupQuery1.Open;

//  SetupQuery1.Filter := 'idcodFiscal = 1101';
//  SetupQuery1.Filtered := True;
  SetupQuery1.EnableControls;
end;

//procedure TForm1.DefinirCampo(pType: TFieldType; pName: string;
//  pDataSet: TDataSet; pSize: integer; AcxGridDBColumn: TcxGridDBColumn;
//  pKind: TFieldKind);
//var
//  lField: TField;
//begin
//  case pType of
//    ftString   :
//                begin
//                  lField      := TStringField.Create(FTempComponent);
//                  lField.Size := pSize;
//                end;
//    ftInteger  : lField := TIntegerField.Create(FTempComponent);
//    ftDateTime : lField := TDateTimeField.Create(FTempComponent);
//    ftFloat    :
//                begin
//                  lField := TFloatField.Create(FTempComponent);
//                  // edson.dsn.pack, Data : 22/04/2013 processo [ WFISCAL-13496 ] -
//                  if assigned(AcxGridDBColumn) then
//                    TcxGridDBColumn(AcxGridDBColumn).DataBinding.ValueType := 'Float';
//                end;
//
//    ftMemo     : lField := TMemoField.Create(FTempComponent);
//  else
//    Exit;
//  end;
//
//  lField.FieldName := pName;
//  lField.FieldKind := pKind;
//  lField.DataSet   := pDataSet;
//end;

procedure TForm1.Button2Click(Sender: TObject);
var
  lMovimento      : IMovimentos;
begin
  //0004346656 - 20/07/2011 - leandromoraes@dsn
  lMovimento := TFabricaDeMovimentos.CriarMovimentos('TfrmMovimentoEdicao');
//  lMovimento := TFabricaDeMovimentos.CriarMovimentos('TForm1');
  lMovimento.setProperty('ConsultaDeNotas',          True);
  lMovimento.setProperty('UltimoDatadoMovimento',    GetDataUltimoMovimento);
  lMovimento.setProperty('VerificouCritica',         False);
  lMovimento.setProperty('qryMovimentoConsulta',     SetupQuery1);
  lMovimento.setProperty('AtualizaSaldo',            False);
  lMovimento.setProperty('CdNota',                   SetupQuery1.Fields.FieldByName('CdNota').AsString);
  lMovimento.setProperty('StTipo',                   IfThen(RadioGroup1.ItemIndex = 0, 'E', 'S'));
  lMovimento.setProperty('IdEmpresa',                '00001');
  // WFISCALDIAMOND-826 - EduardoMendes - 09.03.2012 - Alterando as datas para que sejam passados o 1º e o ultimo dia do mes
  lMovimento.setProperty('DataInicial',              StrToDate('01/01/2013'));
  lMovimento.setProperty('DataFinal',                StrToDate('31/01/2013'));
  //m.SetProperty('tblMovSai',                tblMovSai);
  //m.SetProperty('UsuariosWMail',            tblEmpresasFiscalUsuariosWMail.AsString);
  //m.SetProperty('UserCode',                 AltLock.UserCode);
  //m.SetProperty('TemCdOpDefault',           not tblTipoReceitaCFOPAux.IsEmpty);
  lMovimento.SetProperty('TipoMovimento',            IIf(RadioGroup1.ItemIndex = 0, tpEntrada, tpSaida));
  //m.setEvent('OnMovimentoChange',           Self, MovimentoChange);
//  lMovimento.setEvent('OnAtualizaTotaisICMSIPI',     Self, False);
//  lMovimento.setEvent('OnRetornaTotaisICMSIPI',      Self, False);
  //m.setEvent('OnAbreMovimentoOtimizadoBpl', Self, AbreMovimentoOtimizadoBpl);
//  lMovimento.setEvent('OnAtualizaGrid',              Self, AtualizaGrid);
//  lMovimento.setEvent('OnAtualizarSaldo',            Self, AtualizarSaldo);
  lMovimento.Editar;
end;

function TForm1.GetDataUltimoMovimento: TDateTime;
var
  q: TSetupQuery;
begin
  q := TSetupQuery.Create('WFISCAL');
  try
    q.Close;
    q.SQL.Clear;
    q.SQL.Add('SELECT                                  ');
    q.SQL.Add('  Max(dtEscrituracao) as dtEscrituracao ');
    q.SQL.Add('FROM Wfiscal.&TableNameM;               ');
    q.MacroByName('TableNameM').Value := 'WFISCAL.M00001';
    q.Open;

    Result:= q.Fields.FieldByName('dtescrituracao').AsDateTime;
  finally
    FreeAndNil(q);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  SetupQuery1.First;
  //SetupQuery1.Filtered := False;
end;

end.
