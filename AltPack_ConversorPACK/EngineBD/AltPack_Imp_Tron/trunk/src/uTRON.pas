{-------------------------------------------------------------------------------
Alterdata Importador (sistema TRON-Windows)
Processo: 0004057980
Unit: uTRON
Criado por: RodrigoSouza@dsn
Data: 03/12/2010.
Descrição: Pacote responsável pela seleção das tabelas para conversão do TRON.
--------------------------------------------------------------------------------
Processo    Data       Versão  Usuário        Historico
0004057980  05/07/2011 5.13100 Matheus.dsn    Finalização do projeto.
0005311115  16/02/2012 5.13101 Matheus.dsn    Alguns databases da Tron estão com a versão do Firebird para 2.5.
0005295741  16/02/2012 5.13101 Matheus.dsn    Na versão do satabase 2.5 da Tron o field 'CPFSCORSP' foi alterado para 'INSSCORSP' na tabela 'TBLSCORSP'.
--------------------------------------------------------------------------------}
unit uTRON;

interface

uses
  SysUtils, StdCtrls, IBODataset, IB_Components, Windows, Classes, DB, StrUtils,
  UInterfaceImportadorAlterdata, Variants, ExtCtrls,  Controls, uConfigTRON,
  cxTextEdit, cxButtonEdit, Dialogs, Alterdata, AltFStatus;

type
  ArrayDeTabelas = Array of String;

  TTRON = class(TImportadorAlterdataBase)
  private
    { Private declarations }
    // Componentes para conexão com banco de dados concorrente.
    dbTron : TIBODatabase;
    qryTron : TIBOQuery;

    // Retornar 'DataSet' para validação do 'Wphd'.
    function GetPHDEmpresa : TDataSet;
    function GetPHDSocio : TDataSet;
    function GetPHDVinculoSocio(AIdEmpresa : string) : TDataSet;

    // Retornar 'DataSet' para validação do 'WDp'.
    function GetDPEmpresa : TDataSet;
    function GetDPDepartamento(AIdEmpresa : string) : TDataSet;
    function GetDPSindicato : TDataSet;
    function GetDPFuncao : TDataSet;
    function GetDPHorario : TDataSet;
    function GetDPBanco : TDataSet;
    function GetDPFuncionario(AIdEmpresa : String) : TDataSet;
    function GetDPDependente(AIdEmpresa : String) : TDataSet;
    function GetDPEspecial : TDataSet;
    function GetDPAfastamento(AIdEmpresa : String) : TDataSet;
    function GetDPFerias(AIdEmpresa : String) : TDataSet;
    function GetDPReajusteSalarial(AIdEmpresa : String) : TDataSet;

    // Retorna 'DataSet' para validação do 'WInss'.
    function GetINSSContribuinteSocio(AIdEmpresa : String) : TDataSet;

    function ReplaceZeroLeft(AValue : String):String;

    function CreateOk: Boolean;
    procedure CopiaDB(vDirOrigem, vDirDestino : string);
  public
    { Public declarations }
//    constructor Create; override;
//    destructor Destroy; override;
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;

    class function Caption: String; override;
    class procedure ShowConfiguracao(APanel: TPanel); override;

    function InformationOk: Boolean; override;
    function GetTpSistemaImportacao : TTipoArraySistema; override;
    function GetTpTabelasImportacao : TTipoArrayTabelas; override;
    function GetDataSetImpConcorrente(TableName: String) : TDataSet; override;
    function GetDataSetImpConcorrente(TableName: String; AIdEmpresa : String) : TDataSet; override;
  end;

implementation

const
  cLibraryName : string = 'TRON';
  cVersion : string = '5.13.10.3';
  CDatabaseFile : string = 'TRONCG.IDB';

var
  FormConfigTRON : TfrmConfigTRON;

{ TTRON }

function GetForm : TfrmConfigTron;
begin
  if not Assigned(FormConfigTRON)then
    FormConfigTRON := TfrmConfigTRON.Create(nil);
  Result := FormConfigTRON;
end;

class function TTRON.Caption: String;
begin
  // nome que vai aparecer no combo que lista os conversores.
  Result := cLibraryName + ' - ' + cVersion;
end;

class procedure TTRON.ShowConfiguracao(APanel: TPanel);
begin
  // passo para a interface do usuário o panel do form frmConfigImportacao, com as configurações para conversão do concorrente.
  GetForm.pnlConfigImportacao.Align  := alClient;
  GetForm.pnlConfigImportacao.Parent := APanel;
  GetForm.pnlConfigImportacao.Show;
  GetForm.pnlConfigImportacao.BringToFront;
  GetForm.PageControl.ActivePageIndex := 0;
end;

function TTRON.InformationOk: Boolean;
begin
  Result := True;

  if not DirectoryExists(GetForm.edtDiretorioCONVERSOR.Text) then
    begin
      MessageBox(0, 'Diretório informado para conversão não existe!', 'Atenção', MB_ICONWARNING or MB_OK);
      GetForm.edtDiretorioCONVERSOR.SetFocus;
      Result := False;
      Exit;
    end;

  if GetForm.edtUSERNAME.Text = EmptyStr then
    begin
      MessageBox(0, 'Usuário informado não existe!', 'Atenção', MB_ICONWARNING or MB_OK);
      GetForm.PageControl.ActivePage := GetForm.tsConfiguracao;
      GetForm.edtUSERNAME.SetFocus;
      Result := False;
      Exit;
    end;

  if GetForm.edtPASSWORD.Text = EmptyStr then
    begin
      MessageBox(0, 'Password informado não existe!', 'Atenção', MB_ICONWARNING or MB_OK);
      GetForm.PageControl.ActivePage := GetForm.tsConfiguracao;
      GetForm.edtPASSWORD.SetFocus;
      Result := False;
      Exit;
    end;

  if not DirectoryExists(GetForm.edtDiretorioDP.Text) then
    begin
      MessageBox(0, 'Diretório informado da base de dados da Tron não existe!', 'Atenção', MB_ICONWARNING or MB_OK);
      GetForm.PageControl.ActivePage := GetForm.tsWdp;
      GetForm.edtDiretorioDP.SetFocus;
      Result := False;
      Exit;
    end;
end;

function TTRON.GetTpSistemaImportacao: TTipoArraySistema;
begin
  // retorno os sistemas que convertemos desse concorrente.
  Result := varArrayOf(['WPHD', 'WDP']);
end;

function TTRON.GetTpTabelasImportacao: TTipoArrayTabelas;
begin
  Result := varArrayOf(['Socio', 'Departamento', 'Sindicato', 'Funcao', 'Horario', 'Banco', 'Funcionario', 'Dependente', 'Afastamento', 'ReajusteSalarial']);
end;

{constructor TTRON.Create;
const
  cDatabaseName : string = 'localhost';

begin
  inherited Create;

  if CreateOk then
    begin
      // copio a base de dados evitando trabalhar na base padrão do cliente.
      CopiaDB(GetForm.GetEnderecoDB('DB_DP'), GetForm.GetEnderecoDB('DB_CONVERSOR'));

      // crio componentes para conexão e seleção das informações
      dbTron  := TIBODatabase.Create(nil);
      qryTron := TIBOQuery.Create(nil);

      qryTron.IB_Connection := dbTron;

      // passo os parâmetros para conexão do IBO.
      dbTron.Server       := cDatabaseName;
      dbTron.DatabaseName := cDatabaseName + ':' + GetForm.GetEnderecoDB('DB_CONVERSOR') + CDatabaseFile;
      dbTron.Username     := GetForm.GetEnderecoDB('DB_USERNAME');
      dbTron.Password     := GetForm.GetEnderecoDB('DB_PASSWORD');
      dbTron.PageSize     := 4096;
      dbTron.SQLDialect   := 3;
      dbTron.Connected    := True;
    end;
end; }

{destructor TTRON.Destroy;
begin
  // Destruir componentes.
  qryTron.Close;
  FreeAndNil(qryTron);

  dbTron.Close;
  FreeAndNil(dbTron);

  inherited Destroy;
end; }

function TTRON.GetDataSetImpConcorrente(TableName: String): TDataSet;
begin
  result := nil;

  if AnsiSameText(TableName, 'WPHD.Empresa') then
    begin
      Result := GetPHDEmpresa;
      Exit;
    end;

  if AnsiSameText(TableName, 'WPHD.Socio') then
    begin
      Result := GetPHDSocio;
      Exit;
    end;

  if AnsiSameText(TableName, 'WDP.Empresa') then
    begin
      Result := GetDPEmpresa;
      Exit;
    end;

  if AnsiSameText(TableName, 'WDP.Sindicato') then
    begin
      Result := GetDPSindicato;
      Exit;
    end;

  if AnsiSameText(TableName, 'WDP.Horario') then
    begin
      Result := GetDPHorario;
      Exit;
    end;

  if AnsiSameText(TableName, 'WDP.Funcao') then
    begin
      Result := GetDPFuncao;
      Exit;
    end;

  if AnsiSameText(TableName, 'WDP.Banco') then
    begin
      Result := GetDPBanco;
      Exit;
    end;

  if AnsiSameText(TableName, 'WDP.Especial') then
    begin
      Result := GetDPEspecial;
      Exit;
    end;
end;

function TTRON.GetDataSetImpConcorrente(TableName : String; AIdEmpresa : String) : TDataSet;
begin
  result := nil;

  if AnsiSameText(TableName, 'WDP.Funcionario') then
    begin
      Result := GetDPFuncionario(AIdEmpresa);
      Exit;
    end;

  if AnsiSameText(TableName, 'WDP.Dependente') then
    begin
      Result := GetDPDependente(AIdEmpresa);
      Exit;
    end;

  if AnsiSameText(TableName, 'WPHD.VinculoSocio') then
    begin
      Result := GetPHDVinculoSocio(AIdEmpresa);
      Exit;
    end;

  if AnsiSameText(TableName, 'WDP.Departamento') then
    begin
      Result := GetDPDepartamento(AIdEmpresa);
      Exit;
    end;

  if AnsiSameText(TableName, 'WDP.Ferias') then
    begin
      Result := GetDPFerias(AIdEmpresa);
      Exit;
    end;

  if AnsiSameText(TableName, 'WDP.Afastamento') then
    begin
      Result := GetDPAfastamento(AIdEmpresa);
      Exit;
    end;

  if AnsiSameText(TableName, 'WDP.ReajusteSalarial') then
    begin
      Result := GetDPReajusteSalarial(AIdEmpresa);
      Exit;
    end;

  if AnsiSameText(TableName, 'WINSS.ContribuinteSocio') then
    begin
      Result := GetINSSContribuinteSocio(AIdEmpresa);
      Exit;
    end;
end;

function TTRON.CreateOk: Boolean;
begin
  Result := True;

  if not DirectoryExists(GetForm.edtDiretorioCONVERSOR.Text) then
    Result := False
  else
    if not DirectoryExists(GetForm.edtDiretorioDP.Text) then
      Result := False
    else
      if GetForm.edtUSERNAME.Text = EmptyStr then
        Result := False
      else
        if GetForm.edtPASSWORD.Text = EmptyStr then
          Result := False;
end;

procedure TTRON.CopiaDB(vDirOrigem, vDirDestino: string);
var
  vOrigemAux, vDestinoAux : string;
  vStatus : TStatus;

begin
  vStatus := TStatus.Init(1, 'Copiando Base de Dados', True);
  try
    vOrigemAux := vDirOrigem + CDatabaseFile;
    vDestinoAux := vDirDestino + CDatabaseFile;

    if not FileExists(vDestinoAux) then
      CopyFile(PChar(vOrigemAux), PChar(vDestinoAux), True);

    vStatus.Position := vStatus.Position + 1;
  finally
    vStatus.Free;
  end;
end;

function TTRON.GetPHDEmpresa : TDataSet;
const
  cTableName01 : string = 'TBLEMP';
  cTableName02 : string = 'TBLCID';
  cTableName03 : string = 'TBLEMPDET';
  
Begin
  with qryTron do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT ' + cTableName01 + '.codemp          AS CdEmpresa,          ');
      SQL.Add('       ' + cTableName01 + '.razsocemp       AS NmEmpresa,          ');
      SQL.Add('       ' + cTableName03 + '.nomfanemp       AS NmFantasia,         ');
      SQL.Add('       ' + cTableName03 + '.lgremp          AS DsEndereco,         ');
      SQL.Add('       ' + cTableName03 + '.baiemp          AS NmBairro,           ');
      SQL.Add('       ' + cTableName02 + '.nomcid          AS NmCidade,           ');
      SQL.Add('       ' + cTableName03 + '.cepemp          AS NrCEP,              ');
      SQL.Add('       ' + cTableName02 + '.codundfed       AS CdUF,               ');
      SQL.Add('       ' + cTableName01 + '.insmunemp       AS NrInscrMunicipal,   ');
      SQL.Add('       ' + cTableName01 + '.insestemp       AS NrInscrEstadual,    ');
      SQL.Add('       ' + cTableName01 + '.juncomemp       AS NrRegJuntaComercial,');
      SQL.Add('       ' + cTableName01 + '.dtaregjuncomemp AS DtRegJuntaComercial,');
      SQL.Add('       ' + cTableName03 + '.capsocemp       AS VlCapital,          ');
      SQL.Add('       ' + cTableName01 + '.dtainiatvemp    AS DtInicioAtividade,  ');
      SQL.Add('       ' + cTableName01 + '.insemp          AS NrCGC,              ');
      SQL.Add('       ' + cTableName01 + '.dtateratvemp    AS DtFimAtividade,     ');
      SQL.Add('       ' + cTableName03 + '.emaemp          AS NmEmail,            ');
      SQL.Add('       ' + cTableName01 + '.codnatjur       AS CdNaturezaJuridica, ');
      SQL.Add('       ' + cTableName01 + '.codsubclaatv    AS CdCNAE,             ');
      SQL.Add('       CASE WHEN (' + cTableName01 + '.stsemp = ''I'')             ');
      SQL.Add('         THEN 1                                                    ');
      SQL.Add('         ELSE 0                                                    ');
      SQL.Add('       END AS StAtiva                                              ');
      SQL.Add(' FROM ' + cTableName01 + ', ' + cTableName02 + ', ' + cTableName03   );
      SQL.Add('WHERE ' + cTableName01 + '.codcid = ' + cTableName02 + '.codcid    ');
      SQL.Add('  AND ' + cTableName01 + '.codemp = ' + cTableName03 + '.codemp;   ');
      Open;
    end;

  Result := qryTron;
end;

function TTRON.GetPHDSocio : TDataSet;
const
  cTableName01 : string = 'TBLSCORSP';
  cTableName02 : string = 'TBLCID';
  cTableName03 : string = 'TBLSCORSPEMP';

begin
  with qryTron do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT ' + cTableName03 + '.codemp       AS IdEmpresa,                ');
      SQL.Add('       ' + cTableName01 + '.codscorsp    AS CdSocio,                  ');
      SQL.Add('       ' + cTableName01 + '.nomscorsp    AS NmSocio,                  ');
      SQL.Add('       ' + cTableName01 + '.lgrscorsp    AS DsEndereco,               ');
      SQL.Add('       ' + cTableName01 + '.baiscorsp    AS NmBairro,                 ');
      SQL.Add('       ' + cTableName02 + '.nomcid       AS NmCidade,                 ');
      SQL.Add('       ' + cTableName01 + '.cepscorsp    AS NrCEP,                    ');
      SQL.Add('       ' + cTableName02 + '.codundfed    AS CdUF,                     ');

      // Processo 0005295741
      if GetForm.cbxDatabaseVersion.ItemIndex = 0 then
        SQL.Add('       ' + cTableName01 + '.cpfscorsp  AS NrCPF,                    ')
      else
        SQL.Add('       ' + cTableName01 + '.insscorsp  AS NrCPF,                    ');

      SQL.Add('       ' + cTableName01 + '.idescorsp    AS NrIdentidade,             ');
      SQL.Add('       ' + cTableName01 + '.orgexpscorsp AS NmOrgaoExp,               ');
      SQL.Add('       ' + cTableName01 + '.emascorsp    AS nmEMail                   ');
      SQL.Add(' FROM ' + cTableName01 + ', ' + cTableName02 + ', ' + cTableName03      );
      SQL.Add('WHERE ' + cTableName01 + '.codcid    = ' + cTableName02 + '.codcid       ');
      SQL.Add('  AND ' + cTableName01 + '.codscorsp = ' + cTableName03 + '.codscorsp;');
      Open;
    end;

  Result := qryTron;
end;

function TTRON.GetPHDVinculoSocio(AIdEmpresa : string) : TDataSet;
const
  cTableName01 : string = 'TBLSCORSPEMP';
  cTableName02 : string = 'TBLSCORSP';

begin
  with qryTron do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT ' + cTableName01 + '.codemp          AS IdEmpresa,             ');
      SQL.Add('       ' + cTableName01 + '.codscorsp       AS CdSocio,               ');
      SQL.Add('       ' + cTableName01 + '.perprtcapscoemp AS AlCapital,             ');
      SQL.Add('       CASE WHEN (' + cTableName01 + '.assscorspemp = ''S'')          ');
      SQL.Add('         THEN ''1''                                                   ');
      SQL.Add('         ELSE ''0''                                                   ');
      SQL.Add('       END                                  AS stResponsavelCGC,      ');
      SQL.Add('       ' + cTableName01 + '.prolabscoemp    AS vlProLabore,           ');
      SQL.Add('       ' + cTableName01 + '.dtaadmscoemp    AS dtAdmissao,            ');
      SQL.Add('       ' + cTableName01 + '.dtadesscoemp    AS dtDemissao,            ');
      SQL.Add('       CASE                                                           ');
      SQL.Add('         WHEN (' + cTableName01 + '.tipscorsp = ''S'') THEN ''S''     ');
      SQL.Add('         ELSE ''P''                                                   ');
      SQL.Add('       END                                  AS TpIdentifResponsavel   ');
      SQL.Add(' FROM ' + cTableName01 + ', '            + cTableName02                            );
      SQL.Add('WHERE ' + cTableName01 + '.codscorsp = ' + cTableName02 + '.codscorsp ');
      SQL.Add('  AND ' + cTableName01 + '.codemp =    ' + QuotedStr(AIdEmpresa)            );
      Open;
    end;

  Result := qryTron;
end;

function TTRON.GetDPEmpresa : TDataSet;
const
  cTableName01 : string = 'TBLEMPFOL';
  cTableName02 : string = 'TBLEMP';

begin
  with qryTron do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT ' + cTableName01 + '.codempfol       AS IdEmpresa,          ');
      SQL.Add('       ' + cTableName01 + '.alqacitrbempfol AS AlSATGRPS,          ');
      SQL.Add('       ' + cTableName01 + '.codfpa          AS CdFPASGRPS,         ');
      SQL.Add('       ' + cTableName01 + '.codrecsfp       AS CdTerceiroGRPS,     ');
      SQL.Add('       ' + cTableName02 + '.insemp          AS NrCGC,              ');
      SQL.Add('       ' + cTableName01 + '.codgps          AS CdRecolhimentoGPS   ');
      SQL.Add(' FROM ' + cTableName01 + ', ' + cTableName02                         );
      SQL.Add('WHERE ' + cTableName01 + '.codempfol = ' + cTableName02 + '.codemp;');
      Open;
    end;

  Result := qryTron;
end;

function TTRON.GetDPBanco: TDataSet;
const
  cTableName : string = 'TBLBCO';

begin
  with qryTron do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT codbco AS CdChamada,');
      SQL.Add('       nombco AS NmBanco   ');
      SQL.Add('FROM ' + cTableName + ';   ');
      Open;
    end;

  Result := qryTron;
end;

function TTRON.GetDPDepartamento(AIdEmpresa : string) : TDataSet;
const
  cTableName : string = 'TBLDEP';

begin
  with qryTron do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT codempfol AS IdEmpresa,    ');
      SQL.Add('       coddep    AS CdChamada,    ');
      SQL.Add('       dscdep    AS NmDepartamento');
      SQL.Add('FROM ' + cTableName                );
      SQL.Add('WHERE codempfol = ' + QuotedStr(AIdEmpresa));
      Open;
    end;

  Result := qryTron;
end;

function TTRON.GetDPHorario: TDataSet;
const
  cTableName01 : string = 'TBLHORTRB';
  cTableName02 : string = 'TBLHORTRBDIASEM';

begin
  with qryTron do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT ' + cTableName02 + '.codhortrb                                                                                               AS CdChamada,');
      SQL.Add('       ' + cTableName01 + '.dschortrb                                                                                               AS DsHorario,');
      SQL.Add('       SUBSTRING(' + cTableName02 + '.inihortrbdiasem FROM 1 FOR 2) || SUBSTRING(' + cTableName02 + '.inihortrbdiasem FROM 4 FOR 2) AS HrEntrada,');
      SQL.Add('       SUBSTRING(' + cTableName02 + '.fimhortrbdiasem FROM 1 FOR 2) || SUBSTRING(' + cTableName02 + '.fimhortrbdiasem FROM 4 FOR 2) AS HrSaida   ');
      SQL.Add(' FROM ' + cTableName01 + ', ' + cTableName02                                                                                                       );
      SQL.Add('WHERE ' + cTableName01 + '.codhortrb = ' + cTableName02 + '.codhortrb                                                                            ');
      SQL.Add('  AND ' + cTableName02 + '.coddiasem = ''1'';                                                                                                    ');
      Open;
    end;

  Result := qryTron;
end;

function TTRON.GetDPFuncao: TDataSet;
const
  vTableName : string = 'TBLCBO';

begin
  with qryTron do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT codcbo AS CdChamada,');
      SQL.Add('       dsccbo AS NmFuncao, ');
      SQL.Add('       codcbo AS NrCBONovo ');
      SQL.Add('FROM ' + vTableName + ';   ');
      Open;
    end;

  Result := qryTron;
end;

function TTRON.GetDPFuncionario(AIdEmpresa : String) : TDataSet;
const
  cTableName01 : string = 'TBLPES';
  cTableName02 : string = 'TBLEPG';
  cTableName03 : string = 'TBLCID';
  cTableName04 : string = 'VIEPESEPG';

begin
  with qryTron do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT ' + cTableName04 + '.codempfol          AS IdEmpresa,                          ');
      SQL.Add('       ' + cTableName04 + '.matepgctt          AS CdChamada,                          ');
      SQL.Add('       ' + cTableName01 + '.nomfun             AS NmFuncionario,                      ');
      SQL.Add('       ' + cTableName01 + '.logpes             AS NmEndereco,                         ');
      SQL.Add('       ' + cTableName01 + '.numpes             AS NrEndereco,                         ');
      SQL.Add('       ' + cTableName01 + '.baipes             AS NmBairro,                           ');
      SQL.Add('       ' + cTableName03 + '.nomcid             AS NmCidade,                           ');
      SQL.Add('       ' + cTableName03 + '.codundfed          AS CdUF,                               ');
      SQL.Add('       ' + cTableName01 + '.ceppes             AS NrCEP,                              ');
      SQL.Add('       ' + cTableName02 + '.dtanscpes          AS DtNascimento,                       ');
      SQL.Add('       ' + cTableName02 + '.estcivpes          AS TpEstadoCivil,                      ');
      SQL.Add('       ' + cTableName02 + '.grainspes          AS TpInstrucao,                        ');
      SQL.Add('       ' + cTableName02 + '.sexpes             AS TpSexo,                             ');
      SQL.Add('       ' + cTableName04 + '.dtaadmtractt       AS DtAdmissao,                         ');

      // Retirei por não fazer referência a data de rescisão, visto que a Tron trata demissão como afastamento.
      // SQL.Add('       ' + cTableName04 + '.dtadesctt          AS DtDemissao,                         ');

      SQL.Add('       ' + cTableName02 + '.carideepg          AS NrIdentidade,                       ');
      SQL.Add('       ' + cTableName02 + '.orgexpideepg       AS NmOrgaoExpedidor,                   ');
      SQL.Add('       ' + cTableName02 + '.dtaexpideemp       AS DtExpedicao,                        ');
      SQL.Add('       ' + cTableName02 + '.codundfedorgexpepg AS CdUFExpedicao,                      ');
      SQL.Add('       ' + cTableName02 + '.pispasepg          AS NrPISPASEP,                         ');
      SQL.Add('       ' + cTableName01 + '.inspes             AS NrCPF,                              ');
      SQL.Add('       ' + cTableName02 + '.ctpepg             AS NrCTPS,                             ');
      SQL.Add('       ' + cTableName02 + '.serctpepg          AS NrSerieCTPS,                        ');
      SQL.Add('       ' + cTableName02 + '.codundfedctpepg    AS CdUFCTPS,                           ');
      SQL.Add('       ' + cTableName02 + '.dtaexpctpepg       AS DtExpedicaoCTPS,                    ');
      SQL.Add('       ' + cTableName02 + '.resepg             AS NrCertificadoReservista,            ');
      SQL.Add('       ' + cTableName02 + '.titeleepg          AS NrTituloEleitor,                    ');
      SQL.Add('       ' + cTableName02 + '.zontiteleepg       AS NrZonaEleitoral,                    ');
      SQL.Add('       ' + cTableName02 + '.sectiteleepg       AS NrSecaoEleitoral,                   ');
      SQL.Add('       ' + cTableName02 + '.regcnhepg          AS NrCarteiraHabilitacao,              ');
      SQL.Add('       ' + cTableName02 + '.dtavencnhepg       AS DtVctoHabilitacao,                  ');
      SQL.Add('       ' + cTableName02 + '.maeepg             AS NmMae,                              ');
      SQL.Add('       ' + cTableName02 + '.paiepg             AS NmPai,                              ');
      SQL.Add('       ' + cTableName02 + '.racpes             AS TpCorRaca                           ');
      SQL.Add('FROM  ' + cTableName01 + ', ' + cTableName02 + ', ' + cTableName03 + ', ' + cTableName04);
      SQL.Add('WHERE ' + cTableName04 + '.codempfol    = ' + AIdEmpresa                               );
      SQL.Add('  AND ' + cTableName04 + '.codpes       = ' + cTableName02 + '.codpesepg              ');
      SQL.Add('  AND ' + cTableName01 + '.codpes       = ' + cTableName02 + '.codpesepg              ');
      SQL.Add('  AND ' + cTableName01 + '.tippes       = ' + cTableName02 + '.tippesepg              ');
      SQL.Add('  AND ' + cTableName01 + '.codcid       = ' + cTableName03 + '.codcid;                ');
      Open;
    end;

  Result := qryTron;
end;

function TTRON.GetDPDependente(AIdEmpresa : String) : TDataSet;
const
  cTableName01 : string = 'TBLDPDEPG';
  cTableName02 : string = 'TBLCID';
  cTableName03 : string = 'VIEPESEPG';

begin
  with qryTron do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT ' + cTableName03 + '.codempfol       AS IdEmpresa,          ');
      SQL.Add('       ' + cTableName03 + '.matepgctt       AS IdFuncionario,      ');
      SQL.Add('       ' + cTableName01 + '.coddpdepg       AS CdChamada,          ');
      SQL.Add('       ' + cTableName01 + '.nomdepepg       AS NmDependente,       ');
      SQL.Add('       CASE                                                        ');
      SQL.Add('         WHEN (' + cTableName01 + '.grapardpdepg = ''FI'') THEN 3  ');
      SQL.Add('         WHEN (' + cTableName01 + '.grapardpdepg = ''CO'') THEN 2  ');
      SQL.Add('         ELSE 4                                                    ');
      SQL.Add('       END                                  AS TpRelacao,          ');
      SQL.Add('       ' + cTableName01 + '.dtanscdpdepg    AS DtNascimento,       ');
      SQL.Add('       ' + cTableName02 + '.nomcid          AS DsLocalNascimento,  ');
      SQL.Add('       ' + cTableName01 + '.nomcarregdpdepg AS NrCartorio,         ');
      SQL.Add('       ' + cTableName01 + '.regdpdepg       AS NrRegistro,         ');
      SQL.Add('       ' + cTableName01 + '.dtabasinidpdepg AS DtInicioDependencia,');
      SQL.Add('       ' + cTableName01 + '.livfoldpdepg    AS NrLivro             ');
      SQL.Add(' FROM ' + cTableName01 + ', ' + cTableName02 + ', ' + cTableName03   );
      SQL.Add('WHERE ' + cTableName03 + '.codempfol = ' + AIdEmpresa               );
      SQL.Add('  AND ' + cTableName01 + '.codpesepg = ' + cTableName03 + '.codpes ');
      SQL.Add('  AND ' + cTableName01 + '.natdpdepg = ' + cTableName02 + '.codcid;');
      Open;
    end;

  Result := qryTron;
end;

function TTRON.GetDPEspecial: TDataSet;
const
  cTableName01 : string = 'TBLSITEPG';

begin
  with qryTron do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT 0                              AS Imagem,   ');
      SQL.Add('       ' + cTableName01 + '.codsitepg AS CdChamada,');
      SQL.Add('       ' + cTableName01 + '.dscsitepg AS NmEspecial');
      SQL.Add('FROM ' + cTableName01                               );
      SQL.Add('ORDER BY CdChamada DESC;'                           );
      Open;
    end;

  Result := qryTron;
end;

function TTRON.GetDPSindicato: TDataSet;
const
  cTableName01 : string = 'TBLSIN';
  cTableName02 : string = 'TBLCID';

begin
    with qryTron do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT ' + cTableName01 + '.codsin    AS CdChamada,             ');
      SQL.Add('       ' + cTableName01 + '.nomsin    AS NmSindicato,           ');
      SQL.Add('       ' + cTableName01 + '.logsin    AS NmEndereco,            ');
      SQL.Add('       ' + cTableName01 + '.numsin    AS NrEndereco,            ');
      SQL.Add('       ' + cTableName01 + '.baisin    AS NmBairro,              ');
      SQL.Add('       ' + cTableName02 + '.nomcid    AS NmCidade,              ');
      SQL.Add('       ' + cTableName02 + '.codundfed AS CdUF,                  ');
      SQL.Add('       ' + cTableName01 + '.cepsin    AS NrCEP,                 ');
      SQL.Add('       ' + cTableName01 + '.inssin    AS NrCGC,                 ');
      SQL.Add('       ' + cTableName01 + '.codsinsin AS CdEntidade,            ');
      SQL.Add('       ' + cTableName01 + '.sitsin    AS SiteInternet,          ');
      SQL.Add('       ' + cTableName01 + '.emasin    AS Email                  ');
      SQL.Add(' FROM ' + cTableName01 + ', ' + cTableName02                      );
      SQL.Add('WHERE ' + cTableName01 + '.tipsin = ''F''                       ');
      SQL.Add('  AND ' + cTableName01 + '.codcid = ' + cTableName02 + '.codcid;');
      Open;
    end;

  Result := qryTron;
end;

function TTRON.GetDPReajusteSalarial(AIdEmpresa: String): TDataSet;
const
  cTableName01 : string = 'TBLCTTPARSAL';
  cTableName02 : string = 'TBLEPG';
  cTableName03 : string = 'VIEPESEPG';

begin
  with qryTron do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT ' + cTableName01 + '.matepgctt       AS IdFuncionario,         ');
      SQL.Add('       ' + cTableName01 + '.dtareacttparsal AS DtAlteracao,           ');
      SQL.Add('       ' + cTableName01 + '.refparsal       AS VlNovoSalario          ');
      SQL.Add('FROM ' + cTableName01 + ', ' + cTableName02 + ', ' + cTableName03      );
      SQL.Add('WHERE ' + cTableName01 + '.codempfol = ' + AIdEmpresa                  );
      SQL.Add('  AND ' + cTableName03 + '.codempfol = ' + AIdEmpresa                  );
      SQL.Add('  AND ' + cTableName03 + '.codpes    = ' + cTableName02 + '.codpesepg ');
      SQL.Add('  AND ' + cTableName01 + '.matepgctt = ' + cTableName02 + '.codpesepg;');
      Open;
    end;

  Result := qryTron;
end;

function TTRON.GetINSSContribuinteSocio(AIdEmpresa: String): TDataSet;
const
  cTableName01 : string = 'TBLSCORSP';
  cTableName02 : string = 'TBLCID';
  cTableName03 : string = 'TBLSCORSPEMP';

begin
  with qryTron do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT ''S''                             AS StTipo,                  ');
      SQL.Add('       ' + cTableName01 + '.codscorsp    AS CdSocio,                 ');
      SQL.Add('       ' + cTableName01 + '.nomscorsp    AS NmSocio,                 ');
      SQL.Add('       ' + cTableName01 + '.lgrscorsp    AS DsEndereco,              ');
      SQL.Add('       ' + cTableName01 + '.baiscorsp    AS NmBairro,                ');
      SQL.Add('       ' + cTableName02 + '.nomcid       AS NmCidade,                ');
      SQL.Add('       ' + cTableName01 + '.cepscorsp    AS NrCEP,                   ');
      SQL.Add('       ' + cTableName02 + '.codundfed    AS CdUF,                    ');

      // Processo 0005295741
      if GetForm.cbxDatabaseVersion.ItemIndex = 0 then
        SQL.Add('       ' + cTableName01 + '.cpfscorsp  AS NrCPF,                    ')
      else
        SQL.Add('       ' + cTableName01 + '.insscorsp  AS NrCPF,                    ');

      SQL.Add('       ' + cTableName01 + '.idescorsp    AS NrIdentidade,            ');
      SQL.Add('       ' + cTableName01 + '.orgexpscorsp AS NmOrgaoExp,              ');
      SQL.Add('       ' + cTableName01 + '.emascorsp    AS nmEMail                  ');
      SQL.Add('FROM  ' + cTableName01 + ', ' + cTableName02 + ', ' + cTableName03     );
      SQL.Add('WHERE ' + cTableName01 + '.codcid    = ' + cTableName02 + '.codcid      ');
      SQL.Add('  AND ' + cTableName01 + '.codscorsp = ' + cTableName03 + '.codscorsp');
      SQL.Add('  AND ' + cTableName03 + '.codemp    \= ' + QuotedStr(ReplaceZeroLeft(AIdEmpresa))    + ';');
      Open;
    end;

  Result := qryTron;
end;

function TTRON.GetDPFerias(AIdEmpresa: String): TDataSet;
{const
  cTableName01 : string = 'TBLMOVMEN';
  cTableName02 : string = 'TBLTIPFOL';
  cTableName03 : string = 'TBLSITEPG';}

begin
  {with qryTron do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT DISTINCT ' + cTableName01 + '.matepgctt          AS IdFuncionario,');
      SQL.Add('                ''02''                       As IdEspecial,              ');
      SQL.Add('                ' + cTableName01 + '.dtainifatgermovmen AS DtInicial,    ');
      SQL.Add('                ' + cTableName01 + '.dtafinfatgermovmen AS DtFinal       ');
      SQL.Add('FROM ' + cTableName01 + ', ' + cTableName02 + ', ' + cTableName03 + '    ');
      SQL.Add('WHERE ' + cTableName01 + '.codempfol = ''' + IntToStr(AIdEmpresa) + '''  ');
      SQL.Add('  AND ' + cTableName01 + '.codsitepg = ''2''                             ');
      SQL.Add('  AND ' + cTableName01 + '.codsitepg = ' + cTableName03 + '.codsitepg;   ');
      Open;
    end;

  Result := qryTron;}
  
  Result := nil;
end;

function TTRON.GetDPAfastamento(AIdEmpresa: String): TDataSet;
const
  cTableName01 : string = 'TBLMOVMEN';
  cTableName02 : string = 'TBLSITEPG';
  cTableName03 : string = 'VIEPESEPG';

begin
  with qryTron do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT DISTINCT ' + cTableName01 + '.matepgctt AS IdFuncionario,       ');
      SQL.Add('                ' + cTableName01 + '.codsitepg AS IdEspecial,          ');
      SQL.Add('                ' + cTableName01 + '.dtainifatgermovmen AS DtInicial,  ');
      SQL.Add('                ' + cTableName01 + '.dtafinfatgermovmen AS DtFinal     ');
      SQL.Add('FROM  ' + cTableName01 + ', ' + cTableName02 + ', ' + cTableName03 + '  ');
      SQL.Add('WHERE ' + cTableName01 + '.codempfol = ' + QuotedStr(ReplaceZeroLeft(AIdEmpresa)));
      SQL.Add('  AND ' + cTableName01 + '.codsitepg = ' + cTableName02 + '.codsitepg  ');
      SQL.Add('  AND ' + cTableName01 + '.matepgctt = ' + cTableName03 + '.matepgctt; ');
      Open;
    end;

  Result := qryTron;
end;

function TTRON.ReplaceZeroLeft(AValue: String): String;
var i        : Integer;
    lBoolean : Boolean;
begin
  result   := '';
  lBoolean := False;

  for i := 0 to Length(AValue) do
    begin
      if (AValue[i] in ['1'..'9']) or lBoolean then
        begin
          lBoolean := True;
          result   := Result + AValue[i];
        end;
    end;
end;

procedure TTRON.AfterConstruction;
const
  cDatabaseName : string = 'localhost';

begin
  inherited;

  if CreateOk then
    begin
      // copio a base de dados evitando trabalhar na base padrão do cliente.
      CopiaDB(GetForm.GetEnderecoDB('DB_DP'), GetForm.GetEnderecoDB('DB_CONVERSOR'));

      // crio componentes para conexão e seleção das informações
      dbTron  := TIBODatabase.Create(nil);
      qryTron := TIBOQuery.Create(nil);

      qryTron.IB_Connection := dbTron;

      // passo os parâmetros para conexão do IBO.
      dbTron.Server       := cDatabaseName;
      dbTron.DatabaseName := cDatabaseName + ':' + GetForm.GetEnderecoDB('DB_CONVERSOR') + CDatabaseFile;
      dbTron.Username     := GetForm.GetEnderecoDB('DB_USERNAME');
      dbTron.Password     := GetForm.GetEnderecoDB('DB_PASSWORD');
      dbTron.PageSize     := 4096;
      dbTron.SQLDialect   := 3;
      dbTron.Connected    := True;
    end;
end;

procedure TTRON.BeforeDestruction;
begin
  // Destruir componentes.
  qryTron.Close;
  FreeAndNil(qryTron);

  dbTron.Close;
  FreeAndNil(dbTron);

  inherited;
end;

initialization
  RegisterImportador(TTRON);

finalization
  GetForm.Free;

end.
