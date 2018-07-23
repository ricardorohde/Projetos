unit uConexao;

interface

uses SysUtils, StdCtrls, Windows, Classes, DB, StrUtils,
  Variants, ExtCtrls,  Controls, Dialogs, IBCustomDataSet, IBQuery,
  IBDatabase,DBTables;


type TAcessarFirebird = class
  private
    dbFirebird  : TIBDatabase;
    qryFirebird : TIBQuery;
    Transaction : TIBTransaction;
    dbConDb     : TDatabase;
    qryDb       : TQuery;

    procedure  ConectarFirebird;
    procedure  ConectarDb;

    procedure  DesconectarFirebird;
    procedure  DesconectarDb;

    procedure  CriaTabelaEmpresa;
    procedure  CriaTabelaDpEmpresa;
    procedure  CriarTabelaDpSindicato;
    procedure  CriarTabelaDpHorario;
    procedure  CriarTabelaDpFuncao;
    procedure  CriarTabelaDpFunc;
    procedure  CriarTabelaDpDepend;


    procedure  ExecuteQueryDB(ComandText: string);

    function  RetornaCampos(ADataSet : TDataSet): string;

    function  LerTabPhdEmp()  : TDataSet;
    function  LerTabDpEmp()   : TDataSet;
    function  LerTabDpSind()  : TDataSet;
    function  LerTabHorario() : TDataSet;
    function  LerTabFuncao()  : TDataSet;
    function  LerTabFunc()    : TDataSet;
    function  LerTabDepend()  : TDataSet;

  public
    procedure InserirDados;
    procedure InserirDadosDpEmp;
    procedure InserirDadosDpSind;
    procedure InserirDadosDpHorario;
    procedure InserirDadosDpFuncao;
    procedure InserirDadosDpFunc;
    procedure InserirDadosDpDepend;

end;

implementation

const
  cDatabaseName  = 'localhost';
  //CDatabaseFile  = 'AC.gdb';
  Directory_Base = 'localhost:C:\Users\thiago.dsn.pack\Desktop\projeto Delphi\base\AC.gdb';    // mudar o diretorio do banco
  pathDb         = 'C:\Users\thiago.dsn.pack\Desktop\projeto Delphi\Conversor Teste\base';     //caminho onde as tabelas serão criadas
  DATABASE_NAME  = 'Conversao';
  DRIVE_NAME     = 'STANDARD';
  DB_EXTENSION   = '.DB';

  tblEmpresa     = 'EMPRESA';
  tblDpEmpresa   = 'EMP';
  tblSindicato   = 'SIN';
  tblHorario     = 'HOR';
  tblFuncao      = 'CAR';
  tblFuncionario = 'EPG';
  tblMunicipio   = 'MUN';
  tblDependente  = 'DEP';




{ TAcessarFirebird }

procedure TAcessarFirebird.ConectarDb;
begin
  dbConDb  := TDatabase.Create(nil);
  qryDb    := TQuery.Create(nil);

  dbConDb.DatabaseName := DATABASE_NAME;
  dbConDb.DriverName   := DRIVE_NAME;
  dbConDb.Params.Add('PATH='+ pathDb);

  qryDb.DatabaseName   := DATABASE_NAME;
end;

procedure TAcessarFirebird.ConectarFirebird;
begin
    // crio componentes para conexão e seleção das informações
  dbFirebird  := TIBDatabase.Create(nil);
  qryFirebird := TIBQuery.Create(nil);
  Transaction := TIBTransaction.Create(nil);

  qryFirebird.Database         := dbFIrebird;
  Transaction.DefaultDatabase  := dbFIrebird;
  qryFirebird.Transaction      := Transaction;

  // passo os parâmetros para conexão do IB.
  dbFIrebird.AllowStreamedConnected := True;
  dbFIrebird.DatabaseName           := Directory_Base;
  dbFIrebird.LoginPrompt            := False;
  dbFIrebird.Params.Add('user_name=SYSDBA');
  dbFIrebird.Params.Add('password=masterkey');
  dbFIrebird.SQLDialect             := 3;
  dbFIrebird.Connected              := True;
end;

procedure TAcessarFirebird.CriarTabelaDpDepend;
begin
  if not FileExists((pathDb) + 'DependenteDP' + DB_EXTENSION) then
    ExecuteQueryDB('CREATE TABLE DependenteDP (CodFuncionario VARCHAR(6)' +
                                              ', NmDependente VARCHAR(50)' +
                                              ', TipoRelacao VARCHAR(1)' +
                                              ', DtNascimento VARCHAR(10)' +
                                              ', LocalNasc VARCHAR(30)' +
                                              ', UF VARCHAR(2)' +
                                              ', NmCartorio VARCHAR(30)' +
                                              ', NumCertidao VARCHAR(6)' +
                                              ', DtInicioDependencia VARCHAR(10)' +
                                              ', DtFimDependencia VARCHAR(10)' +
                                              ', NumLivro VARCHAR(6)' +
                                              ', NumFolha VARCHAR(6) )');
end;

procedure TAcessarFirebird.CriarTabelaDpFunc;
begin
  if not FileExists((pathDb) + 'FuncionarioDP' + DB_EXTENSION) then              
    ExecuteQueryDB('CREATE TABLE FuncionarioDP (CODEMPRESA VARCHAR(5)' +                      
                                               ', CDCHAMADA VARCHAR(6)' +                     
                                               ', NOMEFUNC VARCHAR(50)' +                     
                                               ', DTNASCIMENTO VARCHAR(12)' +                 
                                               ', SEXO VARCHAR(1)' +                          
                                               ', MAENOME VARCHAR(50)' +                      
                                               ', PAINOME VARCHAR(50)' +                      
                                               ', CONJUGENOME VARCHAR(50)' +                  
                                               ', CONTACORRENTE VARCHAR(1)' +                 
                                               ', NUMCONTACORRENTE VARCHAR(10)' +             
                                               ', DDD VARCHAR(3)' +                           
                                               ', TELEFONE VARCHAR(7)' +                      
                                               ', CELULAR VARCHAR(8)' +                       
                                               ', LOGRADOURO VARCHAR(50)' +                   
                                               ', BAIRRO VARCHAR(30)' +                       
                                               ', CEP VARCHAR(8)' +                           
                                               ', UF VARCHAR(2)' +
                                               ', MUNICIPIO VARCHAR(40)' +                            
                                               ', PIS VARCHAR(11)' +                          
                                               ', CPF VARCHAR(11)' +                          
                                               ', TITULO VARCHAR(12)' +                       
                                               ', ZONA VARCHAR(3)' +                          
                                               ', SECAO VARCHAR(4)' +                         
                                               ', IDENTIDADE VARCHAR(9)' +                    
                                               ', IDENTIDADEORGAOEXPEDIDOR VARCHAR(6)' +      
                                               ', DTEXPEDICAOIDENTIDADE VARCHAR(10)' +        
                                               ', ADMISSAODATA VARCHAR(10)' +                 
                                               ', RECISAODATA VARCHAR(10)' +                  
                                               ', CTPSNUMERO VARCHAR(8) );');
end;

procedure TAcessarFirebird.CriarTabelaDpFuncao;
begin
  if not FileExists((pathDb) + 'FuncaoDP' + DB_EXTENSION) then
    ExecuteQueryDB('CREATE TABLE FuncaoDP (CodChamada VARCHAR(6)' +
                                          ', Cargo VARCHAR(45)' +
                                          ', CodCBO VARCHAR(10) );');
end;

procedure TAcessarFirebird.CriarTabelaDpHorario;
begin
  if not FileExists((pathDb) + 'HorarioDP' + DB_EXTENSION) then
    ExecuteQueryDB('CREATE TABLE HorarioDP (DsHorario VARCHAR(35)' +
                                           ', HrEntrada VARCHAR(10)' +
                                           ', HrSaidaAlmoco VARCHAR(10)' +
                                           ', HrVoltaAlmoco VARCHAR(10)' +
                                           ', HrSaida VARCHAR(10) );');
end;

procedure TAcessarFirebird.CriarTabelaDpSindicato;
begin
  if not FileExists((pathDb) + 'SindicatoDP' + DB_EXTENSION) then
    ExecuteQueryDB('CREATE TABLE ' + 'SindicatoDP' + ' (CdSindicato VARCHAR(5)' +
                                            ', Nome VARCHAR(60)' +
                                            ', CNPJ VARCHAR(20)' +
                                            ', Logradouro VARCHAR(35)' +
                                            ', Numero VARCHAR(5)' +
                                            ', Complemento VARCHAR(30)' +
                                            ', Bairro VARCHAR(25)' +
                                            ', CEP VARCHAR(20)' +
                                            ', CodMunicipio VARCHAR(6)' +
                                            ', DDD VARCHAR(3)' +
                                            ', Telefone VARCHAR(15) );');
end;



{procedure TAcessarFirebird.CriarTabelaHorario;
begin
  if not FileExists((pathDb) + 'Horario' + DB_EXTENSION) then
    ExecuteQueryDB('CREATE TABLE ' + 'Horario' + ' ');

end;  }

procedure TAcessarFirebird.CriaTabelaDpEmpresa;
begin
  if not FileExists((pathDb) + 'EmpresaDP' + DB_EXTENSION) then
    ExecuteQueryDB('CREATE TABLE ' + 'EmpresaDP' + ' (CoddEmpresa VARCHAR(5)' +
                                           ', RazaoSocial VARCHAR(80)' +
                                           ', CNPJ VARCHAR(20) );');
end;


procedure TAcessarFirebird.CriaTabelaEmpresa;
begin
  if not FileExists((pathDb) + 'EmpresaPHD' + DB_EXTENSION) then
    ExecuteQueryDB('CREATE TABLE ' + 'EmpresaPHD' + '(CdEmpresa VARCHAR(5)' +
                                            ', NomeEmpresa VARCHAR(45)' +
                                            ', CNPJ VARCHAR(20)' +
                                            ', Logradouro VARCHAR(30)' +
                                            ', Numero VARCHAR(9)' +
                                            ', Cidade VARCHAR(30)' +
                                            ', Bairro VARCHAR(20)' +
                                            ', UF VARCHAR(2) );' );
end;

procedure TAcessarFirebird.DesconectarDb;
begin
  dbConDb.Close;
  qryDb.Close;
  FreeAndNil(qryDb);
  FreeAndNil(dbConDb);
end;

procedure TAcessarFirebird.DesconectarFirebird;
begin
  qryFirebird.Close;
  dbFirebird.Close;
  FreeAndNil(qryFirebird);
  FreeAndNil(dbFirebird);
end;

procedure TAcessarFirebird.ExecuteQueryDB(ComandText: string);
begin
  //DestroyQuery;

  with qryDb do
    begin
      SQL.Clear;
      SQL.Add(ComandText);
      ExecSQL();
    end;
end;

procedure TAcessarFirebird.InserirDados;
var lDataTemp : TDataSet;
    lStrAux   : string;
begin
  ConectarFirebird;
  ConectarDb;

  lDataTemp := LerTabPhdEmp;

  if Assigned(lDataTemp) and (lDataTemp.RecordCount > 0) then
    begin
      CriaTabelaEmpresa;
      lDataTemp.First;

      while not lDataTemp.Eof do
        begin
          lStrAux := RetornaCampos(lDataTemp);
          ExecuteQueryDB('Insert into EmpresaPHD' +
                     ' Values ('+ lStrAux + ')');
          lDataTemp.Next;
        end;
    end;

  DesconectarFirebird;
  DesconectarDb;
end;

procedure TAcessarFirebird.InserirDadosDpDepend;
var lDataSetTemp : TDataSet;
    lStrAux      : string;
begin
  ConectarFirebird;
  ConectarDb;

  lDataSetTemp := LerTabDepend;

  if Assigned(lDataSetTemp) and (lDataSetTemp.RecordCount > 0) then
    begin
      CriarTabelaDpDepend;
      lDataSetTemp.First;
      
      while not lDataSetTemp.Eof do
        begin
          lStrAux := RetornaCampos(lDataSetTemp);
          ExecuteQueryDB('INSERT INTO DependenteDP VALUES(' + lStrAux + ')');
          lDataSetTemp.Next;
        end;
    end;
  DesconectarFirebird;
  DesconectarDb;

end;

procedure TAcessarFirebird.InserirDadosDpEmp;
var lDataSetTemp : TDataSet;
    lStrAux      : string;
begin
  ConectarFirebird;
  ConectarDb;

  lDataSetTemp := LerTabDpEmp;

  
  if Assigned(lDataSetTemp) and (lDataSetTemp.RecordCount > 0) then
    begin
      CriaTabelaDpEmpresa;
      lDataSetTemp.First;

      while not lDataSetTemp.Eof do
        begin
          lStrAux := RetornaCampos(lDataSetTemp);
          ExecuteQueryDB('INSERT INTO EmpresaDP VALUES (' + lStrAux + ')');
          lDataSetTemp.Next;
        end;
    end;                    
    DesconectarFirebird;
    DesconectarDb;
end;

procedure TAcessarFirebird.InserirDadosDpFunc;
var lDataSetTemp : TDataSet;
    lStrAux      : string;
begin
  ConectarFirebird;
  ConectarDb;

  lDataSetTemp := LerTabFunc;

  if Assigned(lDataSetTemp) and (lDataSetTemp.RecordCount > 0) then
    begin
      CriarTabelaDpFunc;
      lDataSetTemp.First;

      while not lDataSetTemp.Eof do
        begin
          lStrAux := RetornaCampos(lDataSetTemp);
          ExecuteQueryDB('INSERT INTO FuncionarioDP VALUES(' + lStrAux + ')');
          lDataSetTemp.Next;
        end;
    end;
  DesconectarFirebird;
  DesconectarDb;
end;

procedure TAcessarFirebird.InserirDadosDpFuncao;
var lDataSetTemp : TDataSet;
    lStrAux      : string;
begin
  ConectarFirebird;
  ConectarDb;

  lDataSetTemp := LerTabFuncao;

  if Assigned(lDataSetTemp) and (lDataSetTemp.RecordCount > 0) then
    begin
      CriarTabelaDpFuncao;
      lDataSetTemp.First;

      while not lDataSetTemp.Eof do
        begin
          lStrAux := RetornaCampos(lDataSetTemp);
          ExecuteQueryDB('INSERT INTO FuncaoDP VALUES (' + lStrAux + ')');
          lDataSetTemp.Next;
        end;
    end;
  DesconectarFirebird;
  DesconectarDb;  

end;

procedure TAcessarFirebird.InserirDadosDpHorario;
var lDataSetTemp  : TDataSet;
    lStrAux       : string;
begin
  ConectarFirebird;
  ConectarDb;

  lDataSetTemp := LerTabHorario;

  if Assigned(lDataSetTemp) and (lDataSetTemp.RecordCount > 0) then
    begin
      CriarTabelaDpHorario;
      lDataSetTemp.First;

      while not lDataSetTemp.Eof do
        begin
          lStrAux := RetornaCampos(lDataSetTemp);
          ExecuteQueryDB('INSERT INTO HorarioDP VALUES (' + lStrAux + ')');
          lDataSetTemp.Next;
        end;
    end;                    
    DesconectarFirebird;
    DesconectarDb;
end;

procedure TAcessarFirebird.InserirDadosDpSind;
var lDataSetTemp  : TDataSet;
    lStrAux       : string;
begin
  ConectarFirebird;
  ConectarDb;

  lDataSetTemp := LerTabDpSind;

  if Assigned(lDataSetTemp) and (lDataSetTemp.RecordCount > 0) then
    begin
      CriarTabelaDpSindicato;
      lDataSetTemp.First;

      while not lDataSetTemp.Eof do
        begin
          lStrAux := RetornaCampos(lDataSetTemp);
          ExecuteQueryDB('INSERT INTO SindicatoDP VALUES (' + lStrAux + ')');
          lDataSetTemp.Next;
        end;
    end;

    DesconectarFirebird;
    DesconectarDb;

end;

function TAcessarFirebird.LerTabDepend: TDataSet;
begin
  with qryFirebird do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT ' + tblDependente + '.EPG_CODIGO AS CodFuncionario');
      SQL.Add(',      ' + tblDependente + '.NOME as NmDependente');                     
      SQL.Add(',      ' + tblDependente + '.TIPO as TipoRelacao');                      
      SQL.Add(',      ' + tblDependente + '.NASCDATA as DtNascimento');
      SQL.Add(',      ' + tblMunicipio  + '.NOME AS LocalNasc');
      SQL.Add(',      ' + tblDependente + '.MUN_UFD_SIGLA_NASC AS UF');
      SQL.Add(',      ' + tblDependente + '.CERTIDAOCARTORIO AS NmCartorio');
      SQL.Add(',      ' + tblDependente + '.CERTIDAONUMERO AS NumCertidao');
      SQL.Add(',      ' + tblDependente + '.DEPENDDTINICIAL AS DtInicioDependencia');
      SQL.Add(',      ' + tblDependente + '.DEPENDDTFINAL AS DtFimDependencia');
      SQL.Add(',      ' + tblDependente + '.CERTIDAOLIVRO AS NumLivro');
      SQL.Add(',      ' + tblDependente + '.CERTIDAOFOLHA AS NumFolha');
      SQL.Add('FROM   ' + tblDependente);
      SQL.Add('LEFT JOIN ' + tblMunicipio + ' ON ' + tblMunicipio + '.CODIGO = ' + tblDependente + '.MUN_CODIGO_NASC');
      SQL.Add('AND ' + tblMunicipio + '.UFD_SIGLA = ' + tblDependente + '.MUN_UFD_SIGLA_NASC');
      SQL.Add('ORDER BY ' + tblDependente + '.EMP_CODIGO' );
     // SQL.SaveToFile('C:\Users\thiago.dsn.pack\Desktop\projeto Delphi\Conversor Teste\base\teste.sql');
      Open;
    end;
  Result := qryFirebird;
end;

function TAcessarFirebird.LerTabDpEmp: TDataSet;
begin
  with qryFirebird do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT ' + tblDpEmpresa + '.CODIGO AS CodEmpresa' );
      SQL.Add(',      ' + tblDpEmpresa + '.RAZAOSOCIAL as RazaoSocial');
      SQL.Add(',      ' + tblDpEmpresa + '.CNPJBASE as CNPJ');
      SQL.Add('FROM   ' + tblDpEmpresa);
      Open;
    end;
    Result := qryFirebird;
end;

function TAcessarFirebird.LerTabDpSind: TDataSet;
begin
  with qryFirebird do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT ' + tblSindicato + '.CODIGO AS CdSindicato');
      SQL.Add(',      ' + tblSindicato + '.NOME as Nome');
      SQL.Add(',      ' + tblSindicato + '.CNPJ');
      SQL.Add(',      ' + tblSindicato + '.ENDLOGRADOURO AS Logradouro');
      SQL.Add(',      ' + tblSindicato + '.ENDNUMERO AS Numero');
      SQL.Add(',      ' + tblSindicato + '.ENDCOMPLEMENTO AS Complemento');
      SQL.Add(',      ' + tblSindicato + '.BAIRRO AS Bairro');
      SQL.Add(',      ' + tblSindicato + '.CEP');
      SQL.Add(',      ' + tblSindicato + '.MUN_CODIGO AS CodMunicipio');
      SQL.Add(',      ' + tblSindicato + '.DDD');
      SQL.Add(',      ' + tblSindicato + '.FONE AS Telefone');
      SQL.Add('FROM   ' + tblSindicato);
//          SQL.SaveToFile('C:\Users\thiago.dsn.pack\Desktop\projeto Delphi\Conversor Teste\base\teste.sql');
      Open;
    end;
  Result := qryFirebird;
end;

function TAcessarFirebird.LerTabFunc: TDataSet;
begin
  with qryFirebird do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT ' + tblFuncionario + '.EMP_CODIGO AS CODEMPRESA');
      SQL.Add(',      ' + tblFuncionario + '.CODIGO AS CDCHAMADA');
      SQL.Add(',      ' + tblFuncionario + '.NOME AS NOMEFUNC');
      SQL.Add(',      ' + tblFuncionario + '.DTNASCIMENTO');
      SQL.Add(',      ' + tblFuncionario + '.SEXO');
      SQL.Add(',      ' + tblFuncionario + '.MAENOME');
      SQL.Add(',      ' + tblFuncionario + '.PAINOME');
      SQL.Add(',      ' + tblFuncionario + '.CONJUGENOME');
      SQL.Add(',      ' + tblFuncionario + '.CONTACORRENTE');
      SQL.Add(',      ' + tblFuncionario + '.CONTACORRENTENUMERO AS NUMCONTACORRENTE');
      SQL.Add(',      ' + tblFuncionario + '.DDD');
      SQL.Add(',      ' + tblFuncionario + '.FONE AS TELEFONE');
      SQL.Add(',      ' + tblFuncionario + '.CELULAR');
      SQL.Add(',      ' + tblFuncionario + '.ENDLOGRADOURO AS LOGRADOURO');
      SQL.Add(',      ' + tblFuncionario + '.BAIRRO');
      SQL.Add(',      ' + tblFuncionario + '.CEP');
      SQL.Add(',      ' + tblFuncionario + '.MUN_UFD_SIGLA AS UF');
      SQL.Add(',      ' + tblMunicipio   + '.NOME AS MUNICIPIO');
      SQL.Add(',      ' + tblFuncionario + '.PIS');
      SQL.Add(',      ' + tblFuncionario + '.CPF');
      SQL.Add(',      ' + tblFuncionario + '.TITULO');
      SQL.Add(',      ' + tblFuncionario + '.ZONA');
      SQL.Add(',      ' + tblFuncionario + '.SECAO');
      SQL.Add(',      ' + tblFuncionario + '.IDENTIDADENUMERO AS IDENTIDADE');
      SQL.Add(',      ' + tblFuncionario + '.IDENTIDADEORGAOEXPEDIDOR');
      SQL.Add(',      ' + tblFuncionario + '.IDENTIDADEDTEXPEDICAO AS DTEXPEDICAOIDENTIDADE');
      SQL.Add(',      ' + tblFuncionario + '.ADMISSAODATA');
      SQL.Add(',      ' + tblFuncionario + '.DTRESCISAO AS RECISAODATA');
      SQL.Add(',      ' + tblFuncionario + '.CTPSNUMERO');
      SQL.Add('FROM   ' + tblFuncionario );
      SQL.Add('LEFT JOIN ' + tblMunicipio + ' ON EPG.MUN_CODIGO = MUN.CODIGO');
      SQL.Add('                              AND EPG.MUN_UFD_SIGLA = MUN.UFD_SIGLA');
      SQL.Add(' ORDER BY EPG.EMP_CODIGO ASC');
     // SQL.SaveToFile('C:\Users\thiago.dsn.pack\Desktop\projeto Delphi\Conversor Teste\base\teste.sql');
      Open;
    end;
    Result := qryFirebird;
end;

function TAcessarFirebird.LerTabFuncao: TDataSet;
begin
  with qryFirebird do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT DISTINCT ''''  AS CodChamada');
      SQL.Add(',      ' + tblFuncao + '.NOME AS Cargo');
      SQL.Add(',      ' + tblFuncao + '.CBO_CODIGO AS CodCBO');
      SQL.Add('FROM   ' + tblFuncao);
      SQL.Add('WHERE COALESCE(CBO_CODIGO, '''' ) <> '''' ');
//      SQL.SaveToFile('C:\Users\thiago.dsn.pack\Desktop\projeto Delphi\Conversor Teste\base\teste.sql');
      Open;

    end;
  Result := qryFirebird;
end;

function TAcessarFirebird.LerTabHorario: TDataSet;
begin
  with qryFirebird do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT DISTINCT');
      SQL.Add('case WHEN coalesce(nome, '''') = '''' THEN');        // se o nome for nulo, joga vazio
      SQL.Add('          ''Horario: ''|| segent ||'' ás ''|| segint || '' e '' || segret || '' às '' || segsai'); // concatenando as horas , o coalesce concatena valores nulos também
      SQL.Add('else  nome end AS DsHorario,');
      SQL.Add('      segent   AS HrEntrada,');
      SQL.Add('      segint   AS HrSaidaAlmoco,');
      SQL.Add('      segret   AS HrVoltaAlmoco,');
      SQL.Add('      segsai   AS HrSaida');
      SQL.Add('FROM ' + tblHorario );
      SQL.Add('WHERE COALESCE(segent || segsai, '''') <> ''''');
      Open;
    end;
  Result := qryFirebird;    
end;

function TAcessarFirebird.LerTabPhdEmp : TDataSet;
begin
  with qryFirebird do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT ' + tblEmpresa + '.CODEMPRESA AS CdEmpresa');   //perguntar aqui, o quotedstr
      SQL.Add(',      ' + tblEmpresa + '.NMEMPRESA AS NomeEmpresa');
      SQL.Add(',      ' + tblEmpresa + '.CNPJ');
      SQL.Add(',      ' + tblEmpresa + '.LOGRADOURO AS Logradouro');
      SQL.Add(',      ' + tblEmpresa + '.NUMERO AS Numero');
      SQL.Add(',      ' + tblEmpresa + '.CIDADE AS Cidade' );
      SQL.Add(',      ' + tblEmpresa + '.BAIRRO AS Bairro');
      SQL.Add(',      ' + tblEmpresa + '.UF');
      SQL.Add('FROM   ' + tblEmpresa );
      Open;
    end;
  Result := qryFirebird;
end;

function TAcessarFirebird.RetornaCampos(ADataSet: TDataSet): string;  // pega coluna por coluna e retorna
var i : Integer;
begin
  Result := '';
  for i := 0 to ADataSet.FieldCount - 1 do
    begin
      if (i = 0) then
        Result := Result + QuotedSTr(ADataSet.Fields[i].AsString)
      else
        Result := Result + ',' + QuotedSTr(ADataSet.Fields[i].AsString);
    end;
end;

end.

