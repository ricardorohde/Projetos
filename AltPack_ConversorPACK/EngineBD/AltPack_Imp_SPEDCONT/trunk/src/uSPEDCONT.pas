{-------------------------------------------------------------------------------
Alterdata Importador (sistema SPED-Contábil-Windows)
Processo: CONVPACK-329
Unit: uSPEDCONT
Criado por: edson.dsn.pack
Data: 31/08/2012.
Descrição: Pacote responsável pela seleção das tabelas para conversão do SPED Contábil.
--------------------------------------------------------------------------------
Processo       Data         Versão      Usuário           Historico
CONVPACK-484 - 05/03/2013 - 5.13.10.1 - thiago.dsn.pack - Função que elimina os caracteres especiais " e ` , pois estavam ocasionando erro de sintaxe SQL.
--------------------------------------------------------------------------------}
unit uSPEDCONT;

interface

uses
  SysUtils, StdCtrls, DBTables, Windows, Classes, DB, StrUtils,
  UInterfaceImportadorAlterdata, Variants, ExtCtrls,  Controls, uConfigSPEDCONT,
  cxTextEdit, cxButtonEdit, Dialogs, Alterdata, AltFStatus, AlterdataTypes,
  AlterdataFilesUtils, AlterdataDataFormat, uSPEDCONTVariaveis, ComCtrls,
  Forms, ComObj, ActiveX, UCodeGenerator, dxmdaset, AltSetupMemData;

type
  ArrayDeTabelas = Array of String;

  TSPEDCONT = class(TImportadorAlterdataBase)
  private
    { Private declarations }
    dbSPEDCONT  : TDatabase;
    qrySPEDCONT : TQuery;

    FFileName          : string;
    FArquivosInvalidos : string;
    //FCampos            : TCampos;

    FRegistro_0     : TRegistro_0;
    FRegistro_I     : TRegistro_I;
    FTermoAbertura  : TI030;
    FMovimento      : TMovimento;
    FSaldoContas    : TSaldoContas;
    FSaldoPeriodico : TMovimento;
    FContador       : TContador;

    FStringListAux     : TStringList;
    FCdEmpresa         : string;
    FTabelas           : string;
    FMascClassIntPCont : string;
    FCdEmpresaOld      : string;

    FMascaraParaTodos  : Boolean;
    FMemData           : TSetupMemData;

    Procedure GetArquivo;
    Procedure ProcessarArquivo(FileName : string);
    procedure LerSPEDCONT;
    //function  validarEstruturaArquivo : boolean;
    function  CreateOk: Boolean;

    procedure ProcessaBloco_0(ALinha : string; ARegistro : Integer);
    procedure ProcessaBloco_I(ALinha : string; ARegistro : Integer; AInsereStringList : Boolean = False);
    procedure ProcessaMovimento(ALinha,
                                ACOD_CTA_AUX : string;
                                ARegistro : Integer;
                                AIncluiMovimento : boolean);

    procedure ProcessaSaldoContas(ALinha : string; ARegistro : Integer);
    procedure ProcessaSaldoPeriodico(ALinha : string; ARegistro : Integer);

    procedure ProcessaInformacoesContador(ALinha : string; ARegistro : Integer);

    procedure ProcessatermoAbertura(ALinha : string; ARegistro : Integer);

    procedure ExecuteQueryDB(ComandText: string);
    procedure DestroyQuery;

    function  RetornaDescricaoReg(var ARetorno: string; ACaracter : string = '|'): string;
    procedure CopiaDB;
    procedure InsereEmpresa(ARegistro_0 : TRegistro_0);
    procedure InsereConta(var ARegistro_I : TRegistro_I; IdPlanodeContas : string; Incrementa : boolean);
    procedure InsereHist(ARegistro_I : TRegistro_I);
    procedure InsereCentroDeCusto(ARegistro_I : TRegistro_I; IdPlanoCentroCusto : string);
    procedure InserePlanoDeCentroDeCusto(NmEmpresa, IdPlanoCentroCusto : string);
    procedure InsereInformacoesContador(AContador : TContador);
    procedure InsereTermodeAbertura(ATermoAbertura : TI030);

    procedure InsereMovimento(AMovimento: TMovimento; ALancamentoPeriodico : Boolean);
    procedure InsereSaldoContas(ASaldoContas: TSaldoContas);
    procedure InserePlan_Contas(ARegistro_0 : TRegistro_0; DsMascaraClassinterna : string);
    //function  GuidCreate: string;
    function  GetCode(TableName,Campo : string) : string;
    procedure LimpaCampoI(Item: integer = 0);

    function  GetCodAglutinado(CodAglu : string;Nivel : Integer): string;
    function  IncrementaNivel(CodAglu : string;Nivel : Integer): string;
    function  CaracterUtilizado(Mascara : string; Nivel : Integer; var Len : integer) : string;
    function  SelecionaUltimoCodAglutinado(ARegistro_I : TRegistro_I): string;
    function  LimpaCampos(AValue : String): string;

    Procedure CriaTabelaMovimento(ATableName : string);


    //function SearchConta(ACdChamada, AIdPlanoContas : String): boolean;

    // Retornar 'DataSet' para validação do 'WPHD'.
    function  GetPHDEmpresa: TDataSet;

    // Retornar 'DataSet' para validação do 'Wcont'.
    function GetCONTEmpresa: TDataSet;
    function GetCONTHistoricoPadrao: TDataSet;
    function GetCONTPlanoDeConta: TDataSet;
    function GetCONTConta: TDataSet;
    function GetCONTLancamentoTemporario(AIdEmpresa: string): TDataSet;
    function GetCONTPlanoDeCentroDeCusto: TDataSet;
    function GetCONTCentroDeCusto: TDataSet;

    function SetMascaraPlanoDeContas(ANomeEmpresa : String) : String;

  public
    { Public declarations }

//    constructor Create; override;
//    destructor Destroy; override;
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;


    class function Caption: String; override;
    class procedure ShowConfiguracao(APanel: TPanel); override;

    function GetTpSistemaImportacao: TTipoArraySistema; override;
    function GetTpTabelasImportacao: TTipoArrayTabelas; override;
    function GetDataSetImpConcorrente(TableName: String): TDataSet; override;
    function GetDataSetImpConcorrente(TableName: String; AIdEmpresa: String): TDataSet; override;
end;


var
  FormConfigSPEDCONT: TfrmConfigSPEDCONT;

implementation

uses uMascaraPlanoDeContas;

//uses uSPEDCONTHandler;

{ TSPEDCONT }
function GetForm: TfrmConfigSPEDCONT;
begin
  if not Assigned(FormConfigSPEDCONT)then
    FormConfigSPEDCONT := TfrmConfigSPEDCONT.Create(nil);
  Result := FormConfigSPEDCONT;
end;

class function TSPEDCONT.Caption: String;
begin
  // nome que vai aparecer no combo que lista os conversores.
  Result := cLibraryName + ' - ' + cVersion;
end;

{constructor TSPEDCONT.Create;
begin
  inherited Create;
  if CreateOk then
    begin
      FMascaraParaTodos  := False;
      FArquivosInvalidos := '';
      dbSPEDCONT         := TDatabase.Create(nil);
      qrySPEDCONT        := TQuery.Create(nil);

      dbSPEDCONT.DatabaseName := DATABASE_NAME;
      dbSPEDCONT.DriverName   := DRIVE_NAME;
      dbSPEDCONT.Params.Add('PATH=' + GetForm.GetEnderecoDB(DB_CONVERSOR));

      qrySPEDCONT.DatabaseName := DATABASE_NAME;
      FStringListAux           := TStringList.Create;
      GetForm.chkWcont.Checked := True;
      CopiaDB;
    end
  else
    begin
      MessageBox(0, 'Informações incorretas.Verifique!!!', 'Atenção', MB_ICONWARNING or MB_OK);
      abort;
    end;
end; }

function TSPEDCONT.CreateOk: Boolean;
begin
  Result := True;

  if GetForm.chkImportarMultiplosArquivos.Checked then
    begin
      if not DirectoryExists(GetForm.edtTxtSPEDContabil.Text) then
        Result := False;
    end
  else if not FileExists(GetForm.edtTxtSPEDContabil.Text)then
    Result := False;
end;

{destructor TSPEDCONT.Destroy;
begin
  FreeAndNil(qrySPEDCONT);
  dbSPEDCONT.Close;
  FreeAndNil(dbSPEDCONT);

  FreeAndNil(FStringListAux);
  inherited Destroy;
end;}

procedure TSPEDCONT.DestroyQuery;
begin
  if Assigned(qrySPEDCONT)then
    begin
      FreeAndNil(qrySPEDCONT);
      qrySPEDCONT               := TQuery.Create(nil);
      qrySPEDCONT.DatabaseName  := DATABASE_NAME;
    end;
end;

procedure TSPEDCONT.ExecuteQueryDB(ComandText: string);
begin
  DestroyQuery;

  with qrySPEDCONT do
    begin
      Close;
      SQL.Clear;
      SQL.Add(ComandText);
//      sql.SaveToFile('C:\Bases\SPEDCONT\conversor\sql.txt');
      ExecSQL();
    end;
end;

procedure TSPEDCONT.GetArquivo;
var lPath : string;
    lSearchRec : TSearchRec;
    lStatus : TStatus;
begin
  lStatus := TStatus.Animate('Aguarde! Criando base de dados temporária!', aviFindFile);
  try
    if GetForm.chkImportarMultiplosArquivos.checked then
      begin
        // pegar cada arquivo presente no diretório e tentar processar, realizando corretamente as verificações
        lPath := putLastBackSlash(GetForm.edtTxtSPEDContabil.text) + '*.*';
        if findFirst(lPath, faAnyFile, lSearchRec) = 0 then
          begin
            repeat
              processarArquivo(putLastBackSlash(GetForm.edtTxtSPEDContabil.text) + lSearchRec.Name);
            until findNext(lSearchRec) <> 0;

            SysUtils.findClose(lSearchRec);
          end;

        if not Empty(FArquivosInvalidos) then
          ShowMessage('Os arquivos :' + CRLF + FArquivosInvalidos +
                      'não são arquivos do SPED Contábil válidos' + CRLF +
                      'Verifique!!!');
      end
    else
      begin
        processarArquivo(GetForm.edtTxtSPEDContabil.text);
      end;
  finally
    FreeAndNil(lStatus);
  end;
end;

procedure TSPEDCONT.LerSPEDCONT;
var lfhFileHandler : TextFile;
    lLinhaArquivo          : String;
    lBloco                 : string;
    lCodAglutinado         : string;
    lStrAux                : string;
    lLinhaArquivoAux       : string;
    lCOD_CTA_Aux           : string;
    lIdPlanoCentroCusto    : string;
    lStrSearchConta        : TStringList;
    lRegistro,i            : Integer;


  procedure LimpaMovimento;
  begin
    FMovimento.NUM_LCTO     := '';
    FMovimento.DT_LCTO      := '';
    FMovimento.VL_LCTO      := '';
    FMovimento.IND_LCTO     := '';
    FMovimento.COD_CTA      := '';
    FMovimento.COD_CCUS     := '';
    FMovimento.VL_DC        := '';
    FMovimento.IND_DC       := '';
    FMovimento.NUM_ARQ      := '';
    FMovimento.COD_HIST_PAD := '';
    FMovimento.HIST         := '';
    FMovimento.COD_PART     := '';
    FMovimento.COD_CTA_02   := '';
  end;
begin
  lStrSearchConta := TStringList.Create;
  try
    FMovimento.COD_CTA  := '';
    FMovimento.COD_CCUS := '';
    FMovimento.VL_DC    := '';
    FMovimento.IND_DC   := '';
    lStrAux                    := '';

    //ler o arquivo txt
    AssignFile(lfhFileHandler,FFileName);

    //inicia o arquivo
    reset(lfhFileHandler);

    FCdEmpresa                := StrZero(GetCode(TableName_01,'CdEmpresa'),5);
    FRegistro_0.IdPlanoContas := StrZero(GetCode(TableName_07,'IdPlanoDeContas'),4);
    //faz um while até o final do arquivo
    while not eof(lfhFileHandler) do
      begin
        Application.ProcessMessages;
        ReadLn(lfhFileHandler, lLinhaArquivo);

        lBloco    := Copy(lLinhaArquivo,2,1);
        lRegistro := StrToIntDef(Copy(lLinhaArquivo,3,3),-1);

        //verifico em qual bloco está o registro
        case  AnsiIndexStr(UpperCase(lBloco), ['0','I','J','9'])  of
          0 :
             begin
               //processo o registro 0 relativo as informações da empresa
               ProcessaBloco_0(lLinhaArquivo,lRegistro);
               if (lRegistro = 990) and (Pos('|'+ TableName_01,FTabelas) > 0) then
                 InsereEmpresa(FRegistro_0);

               //Criar um plano de centro de custo por empresa
               if (lRegistro = 990) then
                 begin
                   if (Pos('|'+ TableName_08,FTabelas) > 0) then
                     begin
                       lIdPlanoCentroCusto := StrZero(GetCode(TableName_08,'CdChamada'),5);
                       InserePlanoDeCentroDeCusto(FRegistro_0.NOME, lIdPlanoCentroCusto);
                     end;

                   if not FMascaraParaTodos then
                     FMascClassIntPCont := SetMascaraPlanoDeContas(FRegistro_0.NOME);
                 end;
             end;
          1 :
            begin
              //processo registros I050, I051  e I052 relativos as informações das contas
              ProcessaBloco_I(lLinhaArquivo,lRegistro, True);
              case lRegistro of
                52:
                  begin
                    if (Pos('|'+ TableName_02,FTabelas) > 0) then
                      begin
                        if Empty(lStrAux) then
                          begin
                            lCodAglutinado := LimpaCampos(FRegistro_I.COD_AGL);

                            i := 0;
                            while i <> FStringListAux.Count do
                            //for i := 0 to FStringListAux.Count -1 do
                              begin
                                lLinhaArquivo := FStringListAux.Strings[i];
                                lRegistro     := StrToIntDef(Copy(lLinhaArquivo,3,3),-1);
                                ProcessaBloco_I(lLinhaArquivo,lRegistro);

                                //quando o código agluitnado está está informado no código da conta
                                if (StrToIntDef(lCodAglutinado,-1) = -1) then
                                  begin
                                    FRegistro_I.COD_AGL := GetCodAglutinado(lCodAglutinado,StrToIntDef(FRegistro_I.NIVEL,1));

                                    if (lStrSearchConta.IndexOf(FRegistro_0.IdPlanoContas + '-' + FRegistro_I.COD_CTA) = -1) then
                                      begin
                                        InsereConta(FRegistro_I,FRegistro_0.IdPlanoContas,True);
                                        lStrSearchConta.Add(FRegistro_0.IdPlanoContas + '-' + FRegistro_I.COD_CTA);
                                      end;
                                  end
                                else
                                  begin
                                    FRegistro_I.COD_AGL := FRegistro_I.COD_CTA;
                                    if (lStrSearchConta.IndexOf(FRegistro_0.IdPlanoContas + '-' + FRegistro_I.COD_CTA) = -1) then
                                      begin
                                        InsereConta(FRegistro_I,FRegistro_0.IdPlanoContas,False);
                                        lStrSearchConta.Add(FRegistro_0.IdPlanoContas + '-' + FRegistro_I.COD_CTA);
                                      end;
                                  end;

                                Inc(i);
                              end;
                          end
                        else
                          begin
                            for i := FStringListAux.Count -1 downto 0 do
                              begin
                                lLinhaArquivo := FStringListAux.Strings[i];
                                lRegistro     := StrToIntDef(Copy(lLinhaArquivo,3,3),-1);
                                ProcessaBloco_I(lLinhaArquivo,lRegistro);

                                //quando o código agluitnado está está informado no código da conta
                                if (StrToIntDef((lCodAglutinado),-1) = -1) then
                                  FRegistro_I.COD_AGL := SelecionaUltimoCodAglutinado(FRegistro_I)
                                else
                                  FRegistro_I.COD_AGL := FRegistro_I.COD_CTA;

                                if (lRegistro = 50) then
                                  if (lStrSearchConta.IndexOf(FRegistro_0.IdPlanoContas + '-' + FRegistro_I.COD_CTA) = -1) then
                                    begin
                                      InsereConta(FRegistro_I,FRegistro_0.IdPlanoContas,False);
                                      lStrSearchConta.Add(FRegistro_0.IdPlanoContas + '-' + FRegistro_I.COD_CTA);
                                      LimpaCampoI;
                                    end;
                              end;
                          end;

                        FStringListAux.Clear;
                        lStrAux := 'ABCDE';
                      end;
                  end;

                30: if (Pos('|'+ TableName_10,FTabelas) > 0) then
                      ProcessatermoAbertura(lLinhaArquivo,lRegistro);

                //processo registro I075 relativo as informações do histórico padrão
                75: if (Pos('|'+ TableName_03,FTabelas) > 0) then
                      InsereHist(FRegistro_I);

                //processo registro I100 relativo as informações do Centro de custos
                100: InsereCentroDeCusto(FRegistro_I, lIdPlanoCentroCusto);

                //processo registro I150 e I155 relativo as informações do Saldo periódico
                150, 155:
                  begin
                    //de acordo com a suzana.qld.pack e o bruno.qld.pack só deverão ser incluídos os valores do primeiro mês
                    //para que possa ser calculado o saldo.
                    //if (Pos('|'+ TableName_05,FTabelas) > 0) then
                    ProcessaSaldoPeriodico(lLinhaArquivo,lRegistro);
                  end;
                (* teste *)
                //processo registro I200 e I250 relativo as informações do Lançamento temporário
                200, 250, 990:
                  begin
//                    if (Pos('|'+ TableName_05,FTabelas) > 0) then
//                      begin
//                        if (lLinhaArquivo = '|I250|11100100202||4712,24|C|0 ||TRANSFERÊNCIA DE VENDAS EM DINHEIRO NO MÊS QUIOSQUI CENTER NORTE||') then
//                          ShowMessage('teste');

                    if (FStringListAux.Count > 0) and ((lRegistro = 200) or (lRegistro = 990)) then
                      begin
                        //Movimento do tipo duplo
                        if (FStringListAux.Count = 3) then
                          begin
                            //Registro 200
                            lLinhaArquivoAux := FStringListAux.Strings[0];
                            lRegistro        := StrToIntDef(Copy(lLinhaArquivoAux,3,3),-1);
                            ProcessaMovimento(lLinhaArquivoAux,'',lRegistro,false);

                            //recuperar o COD_CTA do registro posterior
                            lLinhaArquivoAux := FStringListAux.Strings[2];
                            RetornaDescricaoReg(lLinhaArquivoAux);
                            lCOD_CTA_Aux     := RetornaDescricaoReg(lLinhaArquivoAux);

                            //Registro 250
                            lLinhaArquivoAux := FStringListAux.Strings[1];
                            lRegistro        := StrToIntDef(Copy(lLinhaArquivoAux,3,3),-1);
                            ProcessaMovimento(lLinhaArquivoAux,lCOD_CTA_Aux,lRegistro,False);

                            //recuperar o COD_CTA do registro Anterior
                            lCOD_CTA_Aux := FMovimento.COD_CTA;

                            //Registro 250
                            lLinhaArquivoAux := FStringListAux.Strings[2];
                            lRegistro        := StrToIntDef(Copy(lLinhaArquivoAux,3,3),-1);
                            ProcessaMovimento(lLinhaArquivoAux,lCOD_CTA_Aux,lRegistro,True);
                          end
                        else
                        //movimento do tipo múltiplos
                          for i := 0 to FStringListAux.Count -1 do
                            begin
                              lLinhaArquivoAux := FStringListAux.Strings[i];
                              lRegistro        := StrToIntDef(Copy(lLinhaArquivoAux,3,3),-1);
                              ProcessaMovimento(lLinhaArquivoAux,'',lRegistro,True);
                            end;

                        FStringListAux.Clear;
                        LimpaMovimento;
                      end;

                    FStringListAux.Add(lLinhaArquivo);
                  end; (**)
                //processo registro I350 e I355 relativo as informações do Saldo das contas
                350, 355:
                  if (Pos('|'+ TableName_06,FTabelas) > 0) then
                    ProcessaSaldoContas(lLinhaArquivo,lRegistro);
              end;
            end;
          2:
            if (Pos('|'+ TableName_09,FTabelas) > 0) then
              ProcessaInformacoesContador(lLinhaArquivo,lRegistro);
        end;
      end;

     //Insero um plano de contas por arquivo SPED
      if (Pos('|'+ TableName_07,FTabelas) > 0) then
        InserePlan_Contas(FRegistro_0,FMascClassIntPCont);
  finally
    CloseFile(lfhFileHandler);
    FreeAndNil(lStrSearchConta);
  end;
end;

procedure TSPEDCONT.ProcessaBloco_0(ALinha: string; ARegistro: Integer);
var lDataAux : string;
begin
  case ARegistro of
    0 :
      begin
        RetornaDescricaoReg(ALinha);
        RetornaDescricaoReg(ALinha);
        lDataAux := RetornaDescricaoReg(ALinha);
        lDataAux := Copy(lDataAux,1,2)+ '/' +
                    Copy(lDataAux,3,2)+ '/' +
                    Copy(lDataAux,5,4);
        try
          FRegistro_0.DT_INI := StrToDate(lDataAux);
        except
          FRegistro_0.DT_INI := Now;
        end;
        lDataAux := RetornaDescricaoReg(ALinha);

        lDataAux := Copy(lDataAux,1,2)+ '/' +
                    Copy(lDataAux,3,2)+ '/' +
                    Copy(lDataAux,5,4);
        try
          FRegistro_0.DT_FIN := StrToDate(lDataAux);
        except
          FRegistro_0.DT_FIN := Now;
        end;

        FRegistro_0.NOME        := RetornaDescricaoReg(ALinha);
        FRegistro_0.CNPJ        := RetornaDescricaoReg(ALinha);
        FRegistro_0.UF          := RetornaDescricaoReg(ALinha);
        FRegistro_0.IE          := RetornaDescricaoReg(ALinha);
        FRegistro_0.COD_MUN     := RetornaDescricaoReg(ALinha);
        FRegistro_0.IM          := RetornaDescricaoReg(ALinha);
        FRegistro_0.IND_SIT_ESP := RetornaDescricaoReg(ALinha);
      end;
    1 :
      begin
        RetornaDescricaoReg(ALinha);
        FRegistro_0.IND_DAD     := RetornaDescricaoReg(ALinha);
      end;
    7 :
      begin
        RetornaDescricaoReg(ALinha);
        FRegistro_0.COD_ENT_REF  := RetornaDescricaoReg(ALinha);
        FRegistro_0.COD_INSCR    := RetornaDescricaoReg(ALinha);
      end;
  end;
end;

procedure TSPEDCONT.ProcessaBloco_I(ALinha : string; ARegistro : Integer; AInsereStringList : Boolean);
begin
  case ARegistro of
    1 :
      begin
        RetornaDescricaoReg(ALinha);
        FRegistro_I.IND_DAD := RetornaDescricaoReg(ALinha);
      end;
    10:
      begin
        RetornaDescricaoReg(ALinha);
        FRegistro_I.IND_ESC    := RetornaDescricaoReg(ALinha);
        FRegistro_I.COD_VER_LC := RetornaDescricaoReg(ALinha);
      end;
    50:
      begin
        if AInsereStringList then
          FStringListAux.Add(ALinha);

        RetornaDescricaoReg(ALinha);
        FRegistro_I.DT_ALT      := RetornaDescricaoReg(ALinha);
        FRegistro_I.COD_NAT     := RetornaDescricaoReg(ALinha);
        FRegistro_I.IND_CTA     := RetornaDescricaoReg(ALinha);
        FRegistro_I.NIVEL       := RetornaDescricaoReg(ALinha);
        FRegistro_I.COD_CTA     := RetornaDescricaoReg(ALinha);
        FRegistro_I.COD_CTA_SUP := RetornaDescricaoReg(ALinha);
        FRegistro_I.CTA         := RetornaDescricaoReg(ALinha);
      end;
    51:
      begin
        if AInsereStringList then
          FStringListAux.Add(ALinha);

        RetornaDescricaoReg(ALinha);
        FRegistro_I.COD_ENT_REF   := RetornaDescricaoReg(ALinha);
        FRegistro_I.COD_CCUS      := RetornaDescricaoReg(ALinha);
        FRegistro_I.COD_CTA_REF   := RetornaDescricaoReg(ALinha);
      end;
    52:
      begin
        if AInsereStringList then
          FStringListAux.Add(ALinha);

        RetornaDescricaoReg(ALinha);
        FRegistro_I.COD_CCUS_DET  := RetornaDescricaoReg(ALinha);
        FRegistro_I.COD_AGL       := RetornaDescricaoReg(ALinha);
      end;
    75:
      begin
        LimpaCampoI;

        RetornaDescricaoReg(ALinha);
        FRegistro_I.COD_HIST   := RetornaDescricaoReg(ALinha);
        FRegistro_I.DESCR_HIST := RetornaDescricaoReg(ALinha);
      end;

    100:
      begin
        LimpaCampoI;

        RetornaDescricaoReg(ALinha);
        FRegistro_I.DT_ALT   := RetornaDescricaoReg(ALinha);
        FRegistro_I.COD_CCUS := RetornaDescricaoReg(ALinha);
        FRegistro_I.CCUS     := RetornaDescricaoReg(ALinha);
      end;
  end;
end;

procedure TSPEDCONT.ProcessaMovimento(ALinha,
                                      ACOD_CTA_AUX : string;
                                      ARegistro: Integer;
                                      AIncluiMovimento : boolean);

Var lStrAux : string;
begin
  lStrAux := ALinha;
  case ARegistro of
    200 :
      begin
        RetornaDescricaoReg(lStrAux);
        FMovimento.NUM_LCTO := RetornaDescricaoReg(lStrAux);
        FMovimento.DT_LCTO  := RetornaDescricaoReg(lStrAux);
        FMovimento.VL_LCTO  := RetornaDescricaoReg(lStrAux);
        FMovimento.IND_LCTO := RetornaDescricaoReg(lStrAux);
      end;
    250 :
      begin
        RetornaDescricaoReg(lStrAux);
        FMovimento.COD_CTA      := RetornaDescricaoReg(lStrAux);
        FMovimento.COD_CCUS     := RetornaDescricaoReg(lStrAux);
        FMovimento.VL_DC        := RetornaDescricaoReg(lStrAux);
        FMovimento.IND_DC       := RetornaDescricaoReg(lStrAux);
        FMovimento.NUM_ARQ      := RetornaDescricaoReg(lStrAux);
        FMovimento.COD_HIST_PAD := RetornaDescricaoReg(lStrAux);
        FMovimento.HIST         := RetornaDescricaoReg(lStrAux);
        FMovimento.COD_PART     := RetornaDescricaoReg(lStrAux);
        FMovimento.COD_CTA_02   := ACOD_CTA_AUX;

        if AIncluiMovimento then
          InsereMovimento(FMovimento,False);
      end;
  end;
end;

procedure TSPEDCONT.ProcessaSaldoContas(ALinha: string;
  ARegistro: Integer);
begin
  case ARegistro of
    350 :
      begin
        RetornaDescricaoReg(ALinha);
        FSaldoContas.DT_RES := RetornaDescricaoReg(ALinha);
      end;
    355:
      begin
        RetornaDescricaoReg(ALinha);
        FSaldoContas.COD_CTA  := RetornaDescricaoReg(ALinha);
        FSaldoContas.COD_CCUS := RetornaDescricaoReg(ALinha);
        FSaldoContas.VL_CTA   := RetornaDescricaoReg(ALinha);
        FSaldoContas.IND_DC   := RetornaDescricaoReg(ALinha);

        InsereSaldoContas(FSaldoContas);
      end;
  end;
end;

procedure TSPEDCONT.ProcessaSaldoPeriodico(ALinha: string;
  ARegistro: Integer);
begin
  case ARegistro of
    150 :
      begin
        RetornaDescricaoReg(ALinha);
        FSaldoPeriodico.DT_LCTO := RetornaDescricaoReg(ALinha);
      end;
    155:
      begin
        RetornaDescricaoReg(ALinha);
        FSaldoPeriodico.COD_CTA    := RetornaDescricaoReg(ALinha);
        FSaldoPeriodico.COD_CCUS   := RetornaDescricaoReg(ALinha);
        FSaldoPeriodico.VL_LCTO    := RetornaDescricaoReg(ALinha);
        FSaldoPeriodico.IND_DC     := RetornaDescricaoReg(ALinha);
        FSaldoPeriodico.IND_LCTO   := 'N';
        FSaldoPeriodico.COD_CTA_02 := '';

        if (FCdEmpresa <> FCdEmpresaOld) then
          begin
            FSaldoPeriodico.NUM_LCTO := NewStringCode();
            FCdEmpresaOld := FCdEmpresa;
          end;

        InsereMovimento(FSaldoPeriodico,True);
      end;
  end;
end;

procedure TSPEDCONT.ProcessaInformacoesContador(ALinha: string; ARegistro: Integer);
begin
  if (ARegistro = 930) then
    begin
      RetornaDescricaoReg(ALinha);
      FContador.IDENT_NOM    := RetornaDescricaoReg(ALinha);
      FContador.IDENT_CPF    := RetornaDescricaoReg(ALinha);
      FContador.IDENT_QUALIF := RetornaDescricaoReg(ALinha);
      FContador.COD_ASSIM    := RetornaDescricaoReg(ALinha);
      FContador.IND_CRC      := RetornaDescricaoReg(ALinha);

      if (StrToIntDef(FContador.COD_ASSIM,-1) = 900) then
        InsereInformacoesContador(FContador);
    end;
end;

procedure TSPEDCONT.ProcessatermoAbertura(ALinha: string;
  ARegistro: Integer);
begin
  RetornaDescricaoReg(ALinha);
  FTermoAbertura.DNRC_ABERT  := RetornaDescricaoReg(ALinha);
  FTermoAbertura.NUM_ORD     := RetornaDescricaoReg(ALinha);
  FTermoAbertura.NAT_LIVR    := RetornaDescricaoReg(ALinha);
  FTermoAbertura.QTD_LIN     := RetornaDescricaoReg(ALinha);
  FTermoAbertura.NOME        := RetornaDescricaoReg(ALinha);
  FTermoAbertura.NIRE        := RetornaDescricaoReg(ALinha);
  FTermoAbertura.CNPJ        := RetornaDescricaoReg(ALinha);
  FTermoAbertura.DT_ARQ      := RetornaDescricaoReg(ALinha);
  FTermoAbertura.DT_ARQ_CONV := RetornaDescricaoReg(ALinha);
  FTermoAbertura.DESC_MUN    := RetornaDescricaoReg(ALinha);
  
  InsereTermodeAbertura(FTermoAbertura);
end;

procedure TSPEDCONT.ProcessarArquivo(FileName: string);
var lExt    : string;
begin
  FFileName := FileName;

  lExt := ExtractFileExt(FFileName);

  if (lExt = '.txt') then
    begin
//      if validarEstruturaArquivo then
      LerSPEDCONT
//      else
//        FArquivosInvalidos := FArquivosInvalidos + FFileName + CRLF;
    end;
end;

class procedure TSPEDCONT.ShowConfiguracao(APanel: TPanel);
begin
  // passo para a interface do usuário o panel do form frmConfigImportacao, com as configurações para conversão do concorrente.
  GetForm.pnlConfigImportacao.Align := alClient;
  GetForm.pnlConfigImportacao.Parent := APanel;
  GetForm.pnlConfigImportacao.Show;
  GetForm.pnlConfigImportacao.BringToFront;
  GetForm.PageControl.ActivePageIndex := 0;
end;

//function TSPEDCONT.validarEstruturaArquivo: boolean;
//var lfhFileHandler : TextFile;
//    lLinhaArquivo  : String;
//    lBloco         : string;
//    lStrAux        : string;
//    lStatus        : TStatus;
//    lRegistro      : Integer;
//
//  function Validacao(Values : array of String; Str : string) : boolean;
//  var i : Integer;
//  begin
//    result := True;
//    for i := Low(Values) to High(Values) do
//      begin
//        if result and (Pos(Values[i],Str) = 0) then
//          result := False;
//      end;
//  end;
//begin
//  try
//    AssignFile(lfhFileHandler,FFileName);
//
//    lStatus := TStatus.Animate('Aguarde! validando Arquivo!', aviFindFile);
//    try
//      reset(lfhFileHandler);
//
//      while not eof(lfhFileHandler) do
//        begin
//          Application.ProcessMessages;
//          ReadLn(lfhFileHandler, lLinhaArquivo);
//
//          lBloco    := Copy(lLinhaArquivo,2,1);
//          lRegistro := StrToIntDef(Copy(lLinhaArquivo,3,3),-1);
//
//          //registros essenciais para geração do arquivo
//          case  AnsiIndexStr(UpperCase(lBloco), ['0','I','J','9'])  of
//            0 :
//              begin
//                case lRegistro of
//                  0   : lStrAux := lStrAux + '|0000|';
//                  1   : lStrAux := lStrAux + '|0001|';
//                  7   : lStrAux := lStrAux + '|0007|';
//                  990 : lStrAux := lStrAux + '|0990|';
//                end;
//              end;
//            1 :
//              begin
//                case lRegistro of
//                  50:  if (Pos('|I050|',lStrAux) = 0) then lStrAux := lStrAux + '|I050|';
//                  51:  if (Pos('|I051|',lStrAux) = 0) then lStrAux := lStrAux + '|I051|';
//                  52:  if (Pos('|I052|',lStrAux) = 0) then lStrAux := lStrAux + '|I052|';
//                  75:  if (Pos('|I075|',lStrAux) = 0) then lStrAux := lStrAux + '|I075|';
//                  100: if (Pos('|I100|',lStrAux) = 0) then lStrAux := lStrAux + '|I100|';
//                  150: if (Pos('|I150|',lStrAux) = 0) then lStrAux := lStrAux + '|I150|';
//                  155: if (Pos('|I155|',lStrAux) = 0) then lStrAux := lStrAux + '|I155|';
//                  200: if (Pos('|I200|',lStrAux) = 0) then lStrAux := lStrAux + '|I200|';
//                  250: if (Pos('|I250|',lStrAux) = 0) then lStrAux := lStrAux + '|I250|';
//                  990: if (Pos('|I990|',lStrAux) = 0) then lStrAux := lStrAux + '|I990|';
//                  350: if (Pos('|I350|',lStrAux) = 0) then lStrAux := lStrAux + '|I350|';
//                  355: if (Pos('|I355|',lStrAux) = 0) then lStrAux := lStrAux + '|I355|';
//                end;
//              end;
//          end;
//        end;
//    finally
//      FreeAndNil(lStatus);
//    end;
//  finally
//    CloseFile(lfhFileHandler);
//  end;
//
//  result := Validacao(['|0000|','|0001|','|0007|','|0990|','|I050|',
//                       '|I051|','|I052|','|I075|','|I100|','|I150|',
//                       '|I155|','|I200|','|I250|','|I990|','|I350|',
//                       '|I355|'],lStrAux);
//end;

function TSPEDCONT.RetornaDescricaoReg(var ARetorno : string; ACaracter : string = '|'): string;
var lLinha   : string;
    lPosicao : Integer;
begin
  lLinha    := Trim(ARetorno);
  lPosicao  := pos(ACaracter,lLinha);
  lLinha    := Copy(lLinha,lPosicao + 1,Length(lLinha));

  lPosicao  := pos(ACaracter,lLinha);
  result    := Copy(lLinha,1,lPosicao - 1);

  lLinha    := Copy(lLinha,lPosicao,Length(lLinha));

  ARetorno  := lLinha;
end;

procedure TSPEDCONT.InsereEmpresa(ARegistro_0 : TRegistro_0);
begin
  DestroyQuery;

  with qrySPEDCONT do
    begin
      close;
      SQL.Clear;
      SQL.Add('INSERT INTO ' + TableName_01);
      SQL.Add('(CdEmpresa,');
      SQL.Add(' NmEmpresa,');
      SQL.Add(' CdUF,');
      SQL.Add(' NrInscrMunicipal,');
      SQL.Add(' NrInscrEstadual,');
      SQL.Add(' CdMunicipio,');
      SQL.Add(' IdPlanoDeContas,');
      SQL.Add(' NrCGC)');
      SQL.Add('VALUES ');
      SQL.Add('( '+ QuotedSTr(FCdEmpresa));
      SQL.Add(' ,'+ QuotedSTr(ARegistro_0.NOME));
      SQL.Add(' ,'+ QuotedSTr(ARegistro_0.UF));
      SQL.Add(' ,'+ QuotedSTr(ARegistro_0.IM));
      SQL.Add(' ,'+ QuotedSTr(ARegistro_0.IE));
      SQL.Add(' ,'+ QuotedSTr(ARegistro_0.COD_MUN));
      SQL.Add(' ,'+ QuotedSTr(ARegistro_0.IdPlanoContas));
      SQL.Add(' ,'+ QuotedSTr(ARegistro_0.CNPJ)+ ');');
      ExecSQL;
    end;
end;

procedure TSPEDCONT.InsereConta(var ARegistro_I : TRegistro_I; IdPlanodeContas : string; Incrementa : boolean);
var lDataAux,
    lCodReferencial : string;
begin
//  if SearchConta(ARegistro_I.COD_CTA, IdPlanodeContas) then
//    exit;

  lCodReferencial := '';
  if (ARegistro_I.IND_CTA = 'A') and Incrementa then
    ARegistro_I.COD_AGL := IncrementaNivel(ARegistro_I.COD_AGL,StrToIntDef(ARegistro_I.NIVEL,1));

  DestroyQuery;

  lDataAux := Copy(ARegistro_I.DT_ALT,1,2)+ '/' +
              Copy(ARegistro_I.DT_ALT,3,2)+ '/' +
              Copy(ARegistro_I.DT_ALT,5,4);

  with qrySPEDCONT do
    begin
      close;
      SQL.Clear;
      SQL.Add('INSERT INTO ' + TableName_02);
      SQL.Add('(NmConta,');
      SQL.Add(' DtCad,');
      SQL.Add(' TpConta,');
      SQL.Add(' CdChamada,');
      SQL.Add(' COD_CTA_SUP,');
      SQL.Add(' CdClassReferencial,');
      SQL.Add(' CdEmpresa,');
      SQL.Add(' IdPlanodeContas,');
      SQL.Add(' NIVEL,');
      SQL.Add(' CdClassInterna)');
      SQL.Add('VALUES ');
      SQL.Add('( '+ QuotedSTr(LimpaCampos(ARegistro_I.CTA)));
      SQL.Add(' ,:pDatCad');
      SQL.Add(' ,'+ QuotedSTr(ARegistro_I.IND_CTA));
      SQL.Add(' ,'+ QuotedSTr(ARegistro_I.COD_CTA));
      SQL.Add(' ,'+ IntToStr(StrToIntDef(ARegistro_I.COD_CTA_SUP,0)));
      SQL.Add(' ,'+ QuotedSTr(lCodReferencial));
      SQL.Add(' ,'+ QuotedSTr(FCdEmpresa));
      SQL.Add(' ,'+ IntToStr(StrToIntDef(IdPlanodeContas,0)));
      SQL.Add(' ,'+ ARegistro_I.NIVEL);
      SQL.Add(' ,'+ QuotedStr(ARegistro_I.COD_AGL) + ');');
      ParamByName('pDatCad').AsDate := StrToDate(lDataAux);
//      SQL.SaveToFile('C:\bases\spedcont\contas.sql');
      ExecSQL;
    end;
end;

procedure TSPEDCONT.CopiaDB;
var lEnderecoDB : string;
begin
  lEnderecoDB := GetForm.GetEnderecoDB(DB_CONVERSOR);
  FTabelas    := '';

  //crio a tabela de Empresas
  if not FileExists(lEnderecoDB + TableName_01 + DB_EXTENSION) then
    begin
      FTabelas := FTabelas + '|' + TableName_01;

      ExecuteQueryDB('CREATE TABLE ' + TableName_01     + CRLF +
                     '(CdEmpresa          VARCHAR(6),  '+ CRLF +
                     ' NmEmpresa          VARCHAR(60), '+ CRLF +
                     ' CdUF               VARCHAR(2),  '+ CRLF +
                     ' NrInscrMunicipal   VARCHAR(26), '+ CRLF +
                     ' NrInscrEstadual    VARCHAR(20), '+ CRLF +
                     ' CdMunicipio        VARCHAR(7),  '+ CRLF +
                     ' IdPlanoDeContas    VARCHAR(4),  '+ CRLF +
                     ' NrCGC              VARCHAR(14));');
    end;

  //crio a tabela de CONTAS
  if not FileExists(lEnderecoDB + TableName_02 + DB_EXTENSION) then
    begin
      FTabelas := FTabelas + '|' + TableName_02;

      ExecuteQueryDB('CREATE TABLE ' + TableName_02     + CRLF +
                     '(CdEmpresa          VARCHAR(6),  '+ CRLF +
                     ' NmConta            VARCHAR(50), '+ CRLF +
                     ' DtCad              DATE,        '+ CRLF +
                     ' TpConta            VARCHAR(1),  '+ CRLF +
                     ' CdChamada          VARCHAR(20), '+ CRLF +
                     ' COD_CTA_SUP        INTEGER,     '+ CRLF +
                     ' CdClassReferencial VARCHAR(30), '+ CRLF +
                     ' IdPlanodeContas    INTEGER,     '+ CRLF +
                     ' NIVEL              INTEGER,     '+ CRLF +
                     ' CdClassInterna     VARCHAR(30));');
    end;

  //crio a tabela de HISTÓRICO PADRÃO
  if not FileExists(lEnderecoDB + TableName_03 + DB_EXTENSION) then
    begin
      FTabelas := FTabelas + '|' + TableName_03;

      ExecuteQueryDB('CREATE TABLE ' + TableName_03    + CRLF +
                     '(CdEmpresa         VARCHAR(6),'  + CRLF +
                     ' DsHistoricoPadrao VARCHAR(250),'+ CRLF +
                     ' StComplemento     VARCHAR(1),'  + CRLF +
                     ' CdChamada         VARCHAR(10));');
    end;

  //crio a tabela de CENTRO DE CUSTO';
  if not FileExists(lEnderecoDB + TableName_04 + DB_EXTENSION) then
    begin
      FTabelas := FTabelas + '|' + TableName_04;

      ExecuteQueryDB('CREATE TABLE ' + TableName_04     + CRLF +
                     '(CdEmpresa          VARCHAR(6),'  + CRLF +
                     ' DtCad              DATE,'        + CRLF +
                     ' CdChamada          INTEGER,'     + CRLF +
                     ' TpCentrodeCusto    VARCHAR(1),'  + CRLF +
                     ' IdPlanoCentroCusto VARCHAR(10),' + CRLF +
                     ' NmCentroDeCusto    VARCHAR(50));');
    end;

  //crio a tabela de MOVIMENTO
//  if not FileExists(lEnderecoDB + TableName_05 + DB_EXTENSION) then
//    begin
//      FTabelas := FTabelas + '|' + TableName_05;
//
//      ExecuteQueryDB('CREATE TABLE ' + TableName_05  + CRLF +
//                     '(CdEmpresa       VARCHAR(6),'  + CRLF +
//                     ' DtLancamento    DATE,'        + CRLF +
//                     ' IdMovimento     VARCHAR(30),'  + CRLF +
//                     ' stEncerramento  Integer,'     + CRLF +
//                     ' IdConta         VARCHAR(20),' + CRLF +
//                     ' IdContraPartida VARCHAR(20),' + CRLF +
//                     ' DsHistorico     VARCHAR(255),'+ CRLF +
//                     ' DsLote          VARCHAR(7),'  + CRLF +
//                     ' TpConta         VARCHAR(1),'  + CRLF +
//                     ' TpLancamento    VARCHAR(1),'  + CRLF +
//                     ' IdPlanodeContas INTEGER,'  + CRLF +
//                     ' VlLancamento    FLOAT);');
//    end;

  //crio a tabela de SALDO das CONTAS
  if not FileExists(lEnderecoDB + TableName_06 + DB_EXTENSION) then
    begin
      FTabelas := FTabelas + '|' + TableName_06;

      ExecuteQueryDB('CREATE TABLE ' + TableName_06 + CRLF +
                     '(CdEmpresa VARCHAR(6),'       + CRLF +
                     ' DtSaldo   DATE,'             + CRLF +
                     ' idconta   VARCHAR(20),'      + CRLF +
                     ' idCCusto  VARCHAR(40),'      + CRLF +
                     ' VlDebito  FLOAT,'            + CRLF +
                     ' VlCredito FLOAT);');
    end;

  //crio a tabela de Plano de Contas
  if not FileExists(lEnderecoDB + TableName_07 + DB_EXTENSION) then
    begin
      FTabelas := FTabelas + '|' + TableName_07;

      ExecuteQueryDB('CREATE TABLE ' + TableName_07        + CRLF +
                     '(CdEmpresa             VARCHAR(6),'  + CRLF +
                     ' IdPlanoDeContas       INTEGER,'     + CRLF +
                     ' NmPlanoDeContas       VARCHAR(40),' + CRLF +
                     ' DsMascaraClassinterna VARCHAR(30));');
    end;

  //crio a tabela de Plano de Centro de Custos
  if not FileExists(lEnderecoDB + TableName_08 + DB_EXTENSION) then
    begin
      FTabelas := FTabelas + '|' + TableName_08;

      ExecuteQueryDB('CREATE TABLE ' + TableName_08        + CRLF +
                     '(CdChamada             VARCHAR(10),' + CRLF +
                     ' NmPlanoCentroCusto    VARCHAR(40),' + CRLF +
                     ' DsMascaraClassInterna VARCHAR(20));');
    end;

  //crio a tabela de Contador
  if not FileExists(lEnderecoDB + TableName_09 + DB_EXTENSION) then
    begin
      FTabelas := FTabelas + '|' + TableName_09;

      ExecuteQueryDB('CREATE TABLE ' + TableName_09       + CRLF +
                     '(CdEmpresa  VARCHAR(6),'  + CRLF +
                     ' NmContador VARCHAR(50),' + CRLF +
                     ' NrCPF      VARCHAR(18),' + CRLF +
                     ' NrCRC      VARCHAR(15));');
    end;

  if not FileExists(lEnderecoDB + TableName_10 + DB_EXTENSION) then
    begin
      FTabelas := FTabelas + '|' + TableName_10;

      ExecuteQueryDB('CREATE TABLE ' + TableName_10       + CRLF +
                     '(CdEmpresa  VARCHAR(6),'  + CRLF +
                     ' CdNIRE       VARCHAR(12));');
    end;

  if not Empty(FTabelas) then
    GetArquivo;
end;

function TSPEDCONT.GetCode(TableName,Campo : string): string;
var lResult : Integer;
begin
  DestroyQuery;
  lResult := 0;
  with qrySPEDCONT do
    begin
      close;
      SQL.Clear;
      SQL.Add('SELECT '+ Campo);
      SQL.Add('FROM '+ TableName);
      //SQL.Add('Order by '+ Campo + ' ;');
      Open;

      First;
      while not Eof do
        begin
          lResult := StrToIntDef(FieldByName(Campo).AsString,0);
          Next;
        end;
    end;

  Result := IntToStr(lResult + 1);
end;

function TSPEDCONT.GetCodAglutinado(CodAglu : string;Nivel : Integer): string;
var i,lLen  : Integer;
    lStrAux : string;
    lCarac  : string;
begin
  lCarac := CaracterUtilizado(FMascClassIntPCont,Nivel,lLen);

  lStrAux := lCarac + CodAglu + lCarac;
  i       := 1;
  result  := '';
  while i <= Nivel do
    begin
      if (i = 1) then
        result := result + RetornaDescricaoReg(lStrAux,lCarac)
      else //if (lStrAux <> lCarac) then
        result := result + lCarac + RetornaDescricaoReg(lStrAux,lCarac);

      inc(i);
    end;
end;

function TSPEDCONT.IncrementaNivel(CodAglu: string;
  Nivel: Integer): string;
var i        : Integer;
    lLen     : Integer;
    lNum     : Integer;
    lStrAux1 : string;
    lStrAux2 : string;
    lCarac  : string;
begin
  lCarac := CaracterUtilizado(FMascClassIntPCont,Nivel,lLen);

  //lStrAux1 := lCarac + StringReplace(CodAglu,lCarac,'',[rfReplaceAll]) + lCarac;
  lStrAux1 := lCarac + CodAglu + lCarac;
  i        := 1;
  result   := '';
  while (i <= Nivel) do
    begin
      lStrAux2 := RetornaDescricaoReg(lStrAux1,lCarac);
      lNum     := StrToIntDef(lStrAux2,0);

      if (i = 1) then
        begin
          if (i = Nivel) then
            result := result + StrZero(IntToStr(lNum + 1),lLen)
          else 
            result := result + lStrAux2;
        end
      else
        begin
          if (i = Nivel) then
            begin
              result := result + lCarac + StrZero(IntToStr(lNum + 1),lLen)
            end
          else
            result := result + lCarac + lStrAux2
        end;

      inc(i);
    end;
end;

function TSPEDCONT.CaracterUtilizado(Mascara: string;
  Nivel: Integer; var Len : integer) : string;
var i,j,jAux : Integer;
begin
  jAux    := 1;
  i       := 1;
  result  := '';
  while i <= Nivel do
    begin
      Len := 0;
      for j := jAux to Length(Mascara) do
        begin
          if (StrToIntDef(Mascara[j], -1) = -1) then
            begin
              result := Mascara[j];
              jAux   := j + 1;
              inc(i);
              break;
            end
          else
            inc(Len);

          if (j = Length(Mascara)) then
            inc(i);
        end;
    end;
end;


function TSPEDCONT.SelecionaUltimoCodAglutinado(
  ARegistro_I: TRegistro_I): string;
begin
  DestroyQuery;
  with qrySPEDCONT do
    begin
      close;
      SQL.Clear;
      SQL.Add('SELECT CdClassInterna FROM CONTAS');
      SQL.Add('WHERE COD_CTA_SUP = '+ QuotedStr(ARegistro_I.COD_CTA_SUP));
      Open;

      if not IsEmpty then
        begin
          Last;
          result := IncrementaNivel(Fields.FieldByName('CdClassInterna').AsString, StrToIntDef(ARegistro_I.NIVEL,1));
        end
      else
        begin
          close;
          SQL.Clear;
          SQL.Add('SELECT CdClassInterna FROM CONTAS');
          SQL.Add('WHERE cdchamada = '+ QuotedStr(ARegistro_I.COD_CTA_SUP));
          Open;

          if not IsEmpty then
            begin
              Last;
              result := IncrementaNivel(Fields.FieldByName('CdClassInterna').AsString, StrToIntDef(ARegistro_I.NIVEL,1));
            end;
        end;
    end;
end;

procedure TSPEDCONT.InsereHist(ARegistro_I : TRegistro_I);
var lCdChamada : string;
begin
  lCdChamada := StrZero(GetCode(TableName_03,'CdChamada'),5);

  DestroyQuery;

  with qrySPEDCONT do
    begin
      close;
      SQL.Clear;
      SQL.Add('INSERT INTO ' + TableName_03);
      SQL.Add('(DsHistoricoPadrao,');
      SQL.Add(' StComplemento,');
      SQL.Add(' CdEmpresa,');
      SQL.Add(' CdChamada)');
      SQL.Add('VALUES ');
      SQL.Add('( '+ QuotedSTr(ARegistro_I.DESCR_HIST));
      SQL.Add(' , ''S''');
      SQL.Add(' ,'+ QuotedSTr(FCdEmpresa));
      SQL.Add(' ,'+ QuotedSTr(lCdChamada)+ ');');
      ExecSQL;
    end;
end;

procedure TSPEDCONT.LimpaCampoI(Item: integer = 0);
begin
  FRegistro_I.IND_DAD      := '';
  FRegistro_I.IND_ESC      := '';
  FRegistro_I.COD_VER_LC   := '';
  FRegistro_I.DT_ALT       := '';
  FRegistro_I.COD_NAT      := '';
  FRegistro_I.IND_CTA      := '';
  FRegistro_I.NIVEL        := '';
  FRegistro_I.COD_CTA      := '';
  FRegistro_I.COD_CTA_SUP  := '';
  FRegistro_I.CTA          := '';
  FRegistro_I.COD_ENT_REF  := '';
  FRegistro_I.COD_CCUS     := '';
  FRegistro_I.COD_CTA_REF  := '';
  FRegistro_I.COD_CCUS_DET := '';
  FRegistro_I.COD_AGL      := '';
  FRegistro_I.COD_HIST     := '';
  FRegistro_I.DESCR_HIST   := '';
end;

procedure TSPEDCONT.InserePlanoDeCentroDeCusto(NmEmpresa, IdPlanoCentroCusto : string);
begin
  DestroyQuery;

  with qrySPEDCONT do
    begin
      //Plano de Centro de Custo
      close;
      SQL.Clear;
      SQL.Add('INSERT INTO ' + TableName_08);
      SQL.Add('(CdChamada,');
      SQL.Add(' NmPlanoCentroCusto)');
//      SQL.Add(' DsMascaraClassInterna)');
      SQL.Add('VALUES ');
      SQL.Add('( '+ QuotedSTr(IdPlanoCentroCusto));
//      SQL.Add(' ,'+ QuotedSTr(DsMascaraClassInterna));
      SQL.Add(' ,'+ QuotedSTr(NmEmpresa) + ');');
      ExecSQL;
    end;
end;


procedure TSPEDCONT.InsereInformacoesContador(AContador: TContador);
begin
  DestroyQuery;

  with qrySPEDCONT do
    begin
      //Contador
      close;
      SQL.Clear;
      SQL.Add('INSERT INTO ' + TableName_09);
      SQL.Add('(CdEmpresa');
      SQL.Add(',NmContador');
      SQL.Add(',NrCPF');
      SQL.Add(',NrCRC)');
      SQL.Add('VALUES ');
      SQL.Add('( '+ QuotedSTr(FCdEmpresa));
      SQL.Add(' ,'+ QuotedSTr(AContador.IDENT_NOM));
      SQL.Add(' ,'+ QuotedSTr(AContador.IDENT_CPF));
      SQL.Add(' ,'+ QuotedSTr(AContador.IND_CRC) + ');');
      //sql.SaveToFile('C:\sql\contador.txt');
      ExecSQL;
    end;
end;


procedure TSPEDCONT.InsereCentroDeCusto(ARegistro_I : TRegistro_I;
  IdPlanoCentroCusto : string);
var lDataAux         : string;
begin
  if (Pos('|'+ TableName_04,FTabelas) > 0) then
    begin
      DestroyQuery;

      lDataAux := Copy(ARegistro_I.DT_ALT,1,2)+ '/' +
                  Copy(ARegistro_I.DT_ALT,3,2)+ '/' +
                  Copy(ARegistro_I.DT_ALT,5,4);

      with qrySPEDCONT do
        begin
          //Centro de Custo
          close;
          SQL.Clear;
          SQL.Add('INSERT INTO ' + TableName_04);
          SQL.Add('(CdChamada,');
          SQL.Add(' DtCad,');
          SQL.Add(' CdEmpresa,');
          SQL.Add(' IdPlanoCentroCusto,');
          SQL.Add(' NmCentroDeCusto)');
          SQL.Add('VALUES ');
          SQL.Add('( '+ QuotedStr(LimpaCampos(ARegistro_I.COD_CCUS)));
          SQL.Add(' ,:pDatCad');
          SQL.Add(' ,'+ QuotedSTr(FCdEmpresa));
          SQL.Add(' ,'+ QuotedSTr(IdPlanoCentroCusto));
          SQL.Add(' ,'+ QuotedSTr(ARegistro_I.CCUS) + ');');
          ParamByName('pDatCad').AsDate := StrToDate(lDataAux);
//          SQL.SaveToFile('C:\bases\spedcont\ccusto.sql');
          ExecSQL;
        end;
    end;
end;

procedure TSPEDCONT.InsereMovimento(AMovimento: TMovimento; ALancamentoPeriodico : Boolean);
var lVlrLcto,
    lDataAux     : string;
    lData_Lcto   : TDateTime;
    lInclui_Lcto : Boolean;
    lTableName   : String;
//    lIdMovimento : string;
begin
  lDataAux := Copy(AMovimento.DT_LCTO,1,2)+ '/' +
              Copy(AMovimento.DT_LCTO,3,2)+ '/' +
              Copy(AMovimento.DT_LCTO,5,4);

  if not IsDate(lDataAux) then
    lDataAux := '30/12/1899';


  lData_Lcto   := StrToDate(lDataAux);
  lInclui_Lcto := True;

  if ALancamentoPeriodico then
    begin
      lInclui_Lcto          := ((lData_Lcto >= FRegistro_0.DT_INI) and
                               (lData_Lcto <= MonthLastDate(FRegistro_0.DT_INI)));
      lData_Lcto            := MonthLastDate(MonthFirstDate(lData_Lcto) - 1);
      AMovimento.HIST       := 'Saldo de abertura';
      AMovimento.COD_CTA_02 := '';

      if (StrToFloatDef(AMovimento.VL_LCTO, 0.0) = 0.0) then
        Exit;
    end;

  if lInclui_Lcto then
    begin
      lTableName := TableName_05 + FormatDateTime('MMYYYY', lData_Lcto);

      CriaTabelaMovimento(lTableName);

      DestroyQuery();

      with qrySPEDCONT do
        begin
          close;
          SQL.Clear;
          SQL.Add('INSERT INTO ' + lTableName);
          SQL.Add('(CdEmpresa');
          SQL.Add(' ,DtLancamento');
          SQL.Add(' ,IdMovimento');
          SQL.Add(' ,stEncerramento');
          SQL.Add(' ,DsLote');
          SQL.Add(' ,DsHistorico');
          SQL.Add(' ,IdConta');
          SQL.Add(' ,IdContraPartida');
          SQL.Add(' ,TpConta');
          SQL.Add(' ,TpLancamento');
          SQL.Add(' ,IdPlanodeContas');
          SQL.Add(' ,VlLancamento)');
          SQL.Add('VALUES ');
          SQL.Add('( '+ QuotedSTr(FCdEmpresa));
          SQL.Add(' ,:pDtLancamento');
          SQL.Add(' ,'+ QuotedSTr(AMovimento.NUM_LCTO));

          //SQL.Add(' ,'+ QuotedSTr(Strzero(lIdMovimento,8)));
          if (AMovimento.IND_LCTO = 'N') then
            SQL.Add(' ,0')
          else
            SQL.Add(' ,1');

          SQL.Add(' ,'+QuotedStr(FormatDateTime('mm/yyyy',lData_Lcto)));
          //CONVPACK-484 - 05/03/2013 - thiago.dsn.pack
          SQL.Add(' ,'+QuotedStr(LimpaCampos(AMovimento.HIST)));

          lVlrLcto := StringReplace(AMovimento.VL_LCTO,',','.',[rfReplaceAll]);

          if Empty(AMovimento.COD_CTA_02) then
            begin
              SQL.Add(' ,'+QuotedStr(AMovimento.COD_CTA));
              SQL.Add(' ,'+QuotedStr(IntToStr(StrToIntDef(AMovimento.COD_CTA_02,0))));

              if not ALancamentoPeriodico then
                lVlrLcto := StringReplace(AMovimento.VL_DC,',','.',[rfReplaceAll]);

              SQL.Add(' ,'+QuotedStr(AMovimento.IND_DC));
              SQL.Add(' , ''M''');
            end
          else
            begin
              if (AMovimento.IND_DC = 'C') then
                begin
                  SQL.Add(' ,'+QuotedStr(AMovimento.COD_CTA));
                  SQL.Add(' ,'+QuotedStr(IntToStr(StrToIntDef(AMovimento.COD_CTA_02,0))));
                end
              else
                begin
                  SQL.Add(' ,'+QuotedStr(IntToStr(StrToIntDef(AMovimento.COD_CTA_02,0))));
                  SQL.Add(' ,'+QuotedStr(AMovimento.COD_CTA));
                end; 

              SQL.Add(' , ''-''');
              SQL.Add(' , ''D''');
            end;

          SQL.Add(' ,'+ FRegistro_0.IdPlanoContas);
          SQL.Add(' ,'+ lVlrLcto + ');');

//          sql.SaveToFile('C:\bases\spedcont\movimento.sql');
          ParamByName('pDtLancamento').AsDate := lData_Lcto;
          ExecSQL;
        end;
    end;
end;

procedure TSPEDCONT.InsereSaldoContas(ASaldoContas: TSaldoContas);
var lDataAux   : string;
    lVlCredito : string;
    lVlDebito  : string;
begin
  lVlCredito := StringReplace(ASaldoContas.VL_CTA,',','.',[rfReplaceAll]);
  lVlDebito  := StringReplace(ASaldoContas.VL_CTA,',','.',[rfReplaceAll]);

  //  if (SaldoContas.IND_DC = 'C') then
  //    lVlCredito := StringReplace(SaldoContas.VL_CTA,',','.',[rfReplaceAll])
  //  else if (SaldoContas.IND_DC = 'D') then
  //    begin
  //      lVlDebito := StringReplace(SaldoContas.VL_CTA,',','.',[rfReplaceAll]);
  //
  //      if lVlDebito > '0' then
  //        lVlDebito := '-'+ lVlDebito;
  //    end;

  DestroyQuery;

  lDataAux := Copy(ASaldoContas.DT_RES,1,2)+ '/' +
              Copy(ASaldoContas.DT_RES,3,2)+ '/' +
              Copy(ASaldoContas.DT_RES,5,4);

  if not IsDate(lDataAux) then
    lDataAux := '30/12/1899';

  with qrySPEDCONT do
    begin
      close;
      SQL.Clear;
      SQL.Add('INSERT INTO ' + TableName_06);
      SQL.Add('(CdEmpresa');
      SQL.Add(' ,DtSaldo');
      SQL.Add(' ,idconta');
//      SQL.Add(' ,idCCusto');
      SQL.Add(' ,VlDebito');
      SQL.Add(' ,VlCredito)');
      SQL.Add('VALUES ');
      SQL.Add('( '+ QuotedStr(FCdEmpresa));
      SQL.Add(' ,:pDtSaldo');
      SQL.Add(' ,'+ QuotedStr(ASaldoContas.COD_CTA));
      SQL.Add(' ,'+ lVlDebito);
      SQL.Add(' ,'+ lVlCredito + ');');
      //sql.SaveToFile('C:\Bases\SPEDCONT\conversor\sql.txt');
      ParamByName('pDtSaldo').AsDate := StrToDate(lDataAux);
      ExecSQL;
    end;
end;

procedure TSPEDCONT.InserePlan_Contas(ARegistro_0 : TRegistro_0;
  DsMascaraClassinterna : string);
begin
  DestroyQuery;

  with qrySPEDCONT do
    begin
      close;
      SQL.Clear;
      SQL.Add('INSERT INTO ' + TableName_07);
      SQL.Add('(CdEmpresa');
      SQL.Add(' ,IdPlanoDeContas');
      SQL.Add(' ,NmPlanoDeContas');
      SQL.Add(' ,DsMascaraClassinterna)');
      SQL.Add('VALUES ');
      SQL.Add('( '+ QuotedSTr(FCdEmpresa));
      SQL.Add(' ,'+ ARegistro_0.IdPlanoContas);
      SQL.Add(' ,'+ QuotedSTr(ARegistro_0.NOME));
      SQL.Add(' ,'+QuotedStr(DsMascaraClassinterna) + ');');
      //sql.SaveToFile('C:\Bases\SPEDCONT\conversor\sql.txt');
      ExecSQL;
    end;
end;

procedure TSPEDCONT.InsereTermodeAbertura(ATermoAbertura: TI030);
begin
  DestroyQuery;

  with qrySPEDCONT do
    begin
      close;
      SQL.Clear;
      SQL.Add('INSERT INTO ' + TableName_10);
      SQL.Add('(CdEmpresa');
      SQL.Add(' ,CdNIRE)');
      SQL.Add('VALUES ');
      SQL.Add('( '+ QuotedSTr(FCdEmpresa));
      SQL.Add(' ,'+ QuotedStr(ATermoAbertura.NIRE) + ');');
      //sql.SaveToFile('C:\sql\termoabertura.txt');
      ExecSQL;
    end;
end;


//function TSPEDCONT.GuidCreate: string;
//var
//  ID: TGUID;
//begin
//  Result := '';
//
//  if CoCreateGuid(ID) = S_OK then
//     Result := GUIDToString(ID);
//end;

function TSPEDCONT.GetTpSistemaImportacao: TTipoArraySistema;
var
  lSistema: TTipoArraySistema;
  lTipoArrayController: TTipoArrayController;
begin
  // Retornar sistemas.

  lTipoArrayController := TTipoArrayController.Create(taSistema);
  try
    lTipoArrayController.Add('WPHD');

//    if GetForm().chkWdp.Checked then
//      begin
//        lTipoArrayController.Add('WDP');
//        lTipoArrayController.Add('WINSS');
//      end;

    if GetForm().chkWcont.Checked then
      lTipoArrayController.Add('WCONT');

    lSistema := lTipoArrayController.GetArrayOfString();
  finally
    lTipoArrayController.Free;
  end;

  Result := lSistema;
end;

function TSPEDCONT.GetTpTabelasImportacao: TTipoArrayTabelas;
var
  lTabelas: TTipoArrayTabelas;
  lTipoArrayController: TTipoArrayController;
begin
  // Retornar tabelas. 
  lTipoArrayController := TTipoArrayController.Create(taTabelas);
  try
    lTipoArrayController.Add('');

    if GetForm().chkWcont.Checked then
      begin
        lTipoArrayController.Add('HistoricoPadrao');
        lTipoArrayController.Add('PlanoDeConta');
        lTipoArrayController.Add('CentrodeCusto');
        lTipoArrayController.Add('LancamentoTemporario');        
      end;

    lTabelas := lTipoArrayController.GetArrayOfString();
  finally
    lTipoArrayController.Free;
  end;

  Result := lTabelas;
end;

function TSPEDCONT.GetDataSetImpConcorrente(TableName: String): TDataSet;
begin
  result := nil;

  if AnsiSameText(TableName, 'WPHD.Empresa') then
    begin
      Result := GetPHDEmpresa;
      Exit;
    end;

  if AnsiSameText(TableName, 'WCONT.Empresa') then
    begin
      Result := GetCONTEmpresa;
      Exit;
    end;

  if AnsiSameText(TableName, 'WCONT.HistoricoPadrao') then
    begin
      Result := GetCONTHistoricoPadrao;
      Exit;
    end;

  if AnsiSameText(TableName, 'WCONT.LancamentoAutomatico') then
    begin
      //Result := GetCONTLancamentoAutomatico();
      Result := nil;
      Exit;
    end;

  if AnsiSameText(TableName, 'WCONT.PlanoDeConta') then
    begin
      Result := GetCONTPlanoDeConta;
      Exit;
    end;

  if AnsiSameText(TableName, 'WCONT.Conta') then
    begin
      Result := GetCONTConta;
      Exit;
    end;

  if AnsiSameText(TableName, 'WCONT.PlanoDeCentroDeCusto') then
    begin
      Result := GetCONTPlanoDeCentroDeCusto;
      Exit;
    end;

  if AnsiSameText(TableName, 'WCONT.CentroDeCusto') then
    begin
      Result := GetCONTCentroDeCusto;
      Exit;
    end;
end;

function TSPEDCONT.GetDataSetImpConcorrente(TableName: String;
  AIdEmpresa: String): TDataSet;
begin
  result := nil;

  if AnsiSameText(TableName, 'WCONT.LancamentoTemporario') then
    begin
      Result := GetCONTLancamentoTemporario(StrZero(AIdEmpresa,5));
      Exit;
    end;
end;

function TSPEDCONT.GetPHDEmpresa: TDataSet;
begin
  if not FileExists(GetForm.GetEnderecoDB(DB_CONVERSOR) + TableName_01 + DB_EXTENSION) and
     not FileExists(GetForm.GetEnderecoDB(DB_CONVERSOR) + TableName_10 + DB_EXTENSION) then
    begin
      Result := nil;
      Exit;
    end;

  DestroyQuery;

  with qrySPEDCONT do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT EMPRE.*');
      SQL.Add('       ,TERMO.CdNire      AS CdNire');
      SQL.Add('FROM ' + TableName_01 + ' AS EMPRE');
      SQL.Add('LEFT JOIN ' + TableName_10 + ' AS TERMO on (TERMO.CDEMPRESA = EMPRE.CDEMPRESA)');
      Open;
    end;

  Result := qrySPEDCONT;
end;

function TSPEDCONT.GetCONTEmpresa: TDataSet;
begin
  if not FileExists(GetForm.GetEnderecoDB(DB_CONVERSOR) + TableName_01 + DB_EXTENSION) and
     not FileExists(GetForm.GetEnderecoDB(DB_CONVERSOR) + TableName_09 + DB_EXTENSION) then
    begin
      Result := nil;
      Exit;
    end;

  DestroyQuery;

  with qrySPEDCONT do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT EMP.CdEmpresa AS IdEmpresa');
      SQL.Add('       ,NrCGC');
      SQL.Add('       ,True         AS StGeraSPED');
      SQL.Add('       ,IdPlanoDeContas');
      SQL.Add('       ,NmContador');
      SQL.Add('       ,NrCPF');
      SQL.Add('       ,NrCRC');
      SQL.Add('       ,''C''        AS TpContador');
      SQL.Add('FROM      ' + TableName_01 + ' AS EMP');
      SQL.Add('LEFT JOIN ' + TableName_09 + ' AS CONT ON (EMP.cdEmpresa = CONT.CdEmpresa)');
      Open;
    end;

  Result := qrySPEDCONT;
end;

function TSPEDCONT.GetCONTConta: TDataSet;
begin
  if not FileExists(GetForm.GetEnderecoDB(DB_CONVERSOR) + TableName_02 + DB_EXTENSION) then
    begin
      Result := nil;
      Exit;
    end;

  DestroyQuery;

  with qrySPEDCONT do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT IdPlanoDeContas,');
      SQL.Add('       CdChamada,      ');
      SQL.Add('       CdClassInterna, ');
      SQL.Add('       NmConta,        ');
      SQL.Add('       DtCad,          ');
      SQL.Add('       TpConta         ');
      SQL.Add('FROM ' + TableName_02 + ';');
      Open;
    end;

  Result := qrySPEDCONT;
end;

function TSPEDCONT.GetCONTHistoricoPadrao: TDataSet;
begin
  if not FileExists(GetForm.GetEnderecoDB(DB_CONVERSOR) + TableName_03 + DB_EXTENSION) then
    begin
      Result := nil;
      Exit;
    end;

  DestroyQuery;

  with qrySPEDCONT do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT CdChamada,       ');
      SQL.Add('       StComplemento,   ');
      SQL.Add('       DsHistoricoPadrao');
      SQL.Add('FROM ' + TableName_03 + ';');
      Open;
    end;

  Result := qrySPEDCONT;
end;


function TSPEDCONT.GetCONTPlanoDeConta: TDataSet;
begin
  if not FileExists(GetForm.GetEnderecoDB(DB_CONVERSOR) + TableName_07 + DB_EXTENSION) then
    begin
      Result := nil;
      Exit;
    end;

  DestroyQuery;

  with qrySPEDCONT do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT IdPlanoDeContas,     ');
      SQL.Add('       NmPlanoDeContas,     ');
      SQL.Add('       DsMascaraClassinterna');
      SQL.Add('FROM ' + TableName_07 + ';    ');
      Open;
    end;

  Result := qrySPEDCONT;
end;

function TSPEDCONT.GetCONTLancamentoTemporario(
  AIdEmpresa: string): TDataSet;

var lTabelasMovimento : TStringList;
    i                 : Integer;
    lStatus           : TStatus;

  Procedure AlimentaMemData(ATableName : String; APrimeiro : Boolean);
  var i : Integer;
  begin
    DestroyQuery;

    qrySPEDCONT.Close;
    qrySPEDCONT.SQL.Clear;
    qrySPEDCONT.SQL.Add('SELECT DtLancamento,');
    qrySPEDCONT.SQL.Add('       IdMovimento,');
    qrySPEDCONT.SQL.Add('       stEncerramento,');
    qrySPEDCONT.SQL.Add('       IdConta,');
    qrySPEDCONT.SQL.Add('       IdContraPartida,');
    qrySPEDCONT.SQL.Add('       DsHistorico,');
    qrySPEDCONT.SQL.Add('       DsLote,');
    qrySPEDCONT.SQL.Add('       TpConta,');
    qrySPEDCONT.SQL.Add('       TpLancamento,');
    qrySPEDCONT.SQL.Add('       IdPlanoDeContas,');
    qrySPEDCONT.SQL.Add('       VlLancamento,');
    qrySPEDCONT.SQL.Add('       (SUBSTRING(DsLote FROM 1 FOR 2) + SUBSTRING(DsLote FROM 4 FOR 7)) AS Lote');
    qrySPEDCONT.SQL.Add('FROM ' + ATableName);
    qrySPEDCONT.SQL.Add('where CdEmpresa = '+ QuotedSTr(AIdEmpresa));
    //SQL.Add('ORDER BY Lote DESC, TpLancamento, IdMovimento, TpConta;');
    qrySPEDCONT.SQL.Add('ORDER BY DtLancamento, IdMovimento, DsLote, stEncerramento;');
//      SQL.SaveToFile('C:\Bases\SPEDCONT\movimento.txt');
    qrySPEDCONT.Open;

    if APrimeiro then
      begin
        FMemData.Close;
        FMemData.ClearFields;
        FMemData.LoadFromDataset(qrySPEDCONT);
      end
    else
      begin
        qrySPEDCONT.First;
        while not qrySPEDCONT.Eof do
          begin
            Application.ProcessMessages;
            FMemData.Append;

            for i := 0 to qrySPEDCONT.FieldDefs.Count - 1 do
              if FMemData.Fields.FindField(qrySPEDCONT.FieldDefs[i].Name) <> nil then
                FMemData.FieldByName(qrySPEDCONT.FieldDefs[i].Name).value := qrySPEDCONT.FieldByName(qrySPEDCONT.FieldDefs[i].Name).value;

            FMemData.Post;
            qrySPEDCONT.Next;
          end;
      end;
  end;

begin
  result := nil;
//  if not FileExists(GetForm.GetEnderecoDB(DB_CONVERSOR) + TableName_05 + DB_EXTENSION) then
//    Exit;
  if Assigned(FMemData) then
    FreeAndNil(FMemData);

  FMemData := TSetupMemData.Create(nil);

  lTabelasMovimento := TStringList.Create;
  lStatus           := TStatus.Animate('Aguarde! Ajustando lançamentos temporários!', aviFindFile);
  try
    lTabelasMovimento := ResultArchives(GetForm.GetEnderecoDB(DB_CONVERSOR) + TableName_05 + '*' + DB_EXTENSION);

    if (lTabelasMovimento.Count = 0) then
      Exit;

    for i := 0 to lTabelasMovimento.Count -1 do
      AlimentaMemData(lTabelasMovimento.Strings[i], (i = 0));

    Result := FMemData;
  finally
    FreeAndNil(lStatus);
    FreeAndNil(lTabelasMovimento);
  end;
end;


function TSPEDCONT.GetCONTCentroDeCusto: TDataSet;
begin
  if not FileExists(GetForm.GetEnderecoDB(DB_CONVERSOR) + TableName_04 + DB_EXTENSION) then
    begin
      Result := nil;
      Exit;
    end;

  DestroyQuery;

  with qrySPEDCONT do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM ' + TableName_04 + ';    ');
      Open;
    end;

  Result := qrySPEDCONT;
end;

function TSPEDCONT.GetCONTPlanoDeCentroDeCusto: TDataSet;
begin
  if not FileExists(GetForm.GetEnderecoDB(DB_CONVERSOR) + TableName_08 + DB_EXTENSION) then
    begin
      Result := nil;
      Exit;
    end;

  DestroyQuery;

  with qrySPEDCONT do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM ' + TableName_08 + ';');
      Open;
    end;

  Result := qrySPEDCONT;
end;


//function TSPEDCONT.SearchConta(ACdChamada, AIdPlanoContas : String): boolean;
//begin
//  DestroyQuery;
//
//  qrySPEDCONT.Close;
//  qrySPEDCONT.SQL.Clear;
//  qrySPEDCONT.SQL.Add('select CdChamada');
//  qrySPEDCONT.SQL.Add('from CONTAS');
//  qrySPEDCONT.SQL.Add('where CdChamada = :pCdChamada');
//  qrySPEDCONT.SQL.Add('and IdPlanoDeContas = :pIdPlanoDeContas');
//  qrySPEDCONT.ParamByName('pCdChamada').AsString         := ACdChamada;
//  qrySPEDCONT.ParamByName('pIdPlanoDeContas').AsInteger  := StrToIntDef(AIdPlanoContas,0);
//  //lQuery.SQL.SaveToFile('C:\sql\spedcont\SearchConta.txt');
//  qrySPEDCONT.Open;
//
//  result := (qrySPEDCONT.RecordCount > 0);
//end;

function TSPEDCONT.SetMascaraPlanoDeContas(ANomeEmpresa : String) : String;
begin
  frmMascaraPlanoDeContas := TfrmMascaraPlanoDeContas.Create(Nil);
  try
    frmMascaraPlanoDeContas.lblEmpresa.Caption := 'Empresa: ' + FCdEmpresa + ' - ' + UpperCase(ANomeEmpresa);

    frmMascaraPlanoDeContas.chkMascaraForAll.Visible := GetForm.chkImportarMultiplosArquivos.Checked;
    frmMascaraPlanoDeContas.ShowModal;
    result            := frmMascaraPlanoDeContas.MascaraPlanoContas;
    FMascaraParaTodos := frmMascaraPlanoDeContas.MascaraForAll;
  finally
    FreeAndNil(frmMascaraPlanoDeContas);
  end;
end;

procedure TSPEDCONT.AfterConstruction;
begin
  inherited;

  if CreateOk then
    begin
      if Assigned(dbSPEDCONT) then
        begin
          DestroyQuery;
          
          dbSPEDCONT.Connected := False;
          dbSPEDCONT.Close;
          FreeAndNil(dbSPEDCONT);
        end; 

      FMascaraParaTodos  := False;
      FArquivosInvalidos := '';
      dbSPEDCONT         := TDatabase.Create(nil);
      qrySPEDCONT        := TQuery.Create(nil);

      dbSPEDCONT.DatabaseName := DATABASE_NAME;
      dbSPEDCONT.DriverName   := DRIVE_NAME;
      dbSPEDCONT.Params.Add('PATH=' + GetForm.GetEnderecoDB(DB_CONVERSOR));

      qrySPEDCONT.DatabaseName := DATABASE_NAME;
      FStringListAux           := TStringList.Create;
      GetForm.chkWcont.Checked := True;
      CopiaDB;
    end
  else
    begin
      MessageBox(0, 'Informações incorretas.Verifique!!!', 'Atenção', MB_ICONWARNING or MB_OK);
      abort;
    end;
end;

procedure TSPEDCONT.BeforeDestruction;
begin
  qrySPEDCONT.Close;
  FreeAndNil(qrySPEDCONT);

  dbSPEDCONT.Connected := False;
  dbSPEDCONT.Close;
  FreeAndNil(dbSPEDCONT);

  FreeAndNil(FStringListAux);
  inherited;
end;

procedure TSPEDCONT.CriaTabelaMovimento(ATableName : string);
begin
  //crio a tabela de MOVIMENTO
  if not FileExists(GetForm.GetEnderecoDB(DB_CONVERSOR) + ATableName + DB_EXTENSION) then
    begin
//      FTabelas := FTabelas + '|' + TableName_05;

      ExecuteQueryDB('CREATE TABLE ' + ATableName  + CRLF +
                     '(CdEmpresa       VARCHAR(6),'  + CRLF +
                     ' DtLancamento    DATE,'        + CRLF +
                     ' IdMovimento     VARCHAR(30),'  + CRLF +
                     ' stEncerramento  Integer,'     + CRLF +
                     ' IdConta         VARCHAR(20),' + CRLF +
                     ' IdContraPartida VARCHAR(20),' + CRLF +
                     ' DsHistorico     VARCHAR(255),'+ CRLF +
                     ' DsLote          VARCHAR(7),'  + CRLF +
                     ' TpConta         VARCHAR(1),'  + CRLF +
                     ' TpLancamento    VARCHAR(1),'  + CRLF +
                     ' IdPlanodeContas INTEGER,'  + CRLF +
                     ' VlLancamento    FLOAT);');
    end;
end;

function TSPEDCONT.LimpaCampos(AValue: String): string;
begin
  result := ClearString(AValue, chr(39) + '."`');
end;

initialization
  RegisterImportador(TSPEDCONT);

finalization
  GetForm.Free;

end.
