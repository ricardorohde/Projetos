{
   Programa:  modCOM002A - DATA MODULE DE AUTORIZACAO
   Autor:     ISRAEL
   Data:      15/04/2002
   Descrição: Rotinas de Autorização de Acesso aos Programas

Alterações:
*********************************************************************
***   HISTORICO MANUTENCAO                                        ***
***   ---------------------------------                           ***
***   Release/RP : release 30.5                                   ***
***   Analista   : SERGIO SILVA DE SOUZA                          ***
***   Alteração  : 30/06/2010                                     ***
***   Comentarios: Tela "SEMPRE ON-LINE"                          ***
********************************************************************/
}

unit modCOM002A;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, Db, DBTables,dbctrls, MemDS, DBAccess, Uni;
type

  TReg_Programa = record
     CDPROGRAMA              : string;
     NOPROGRAMA              : string;
     NOABREVIADO             : string;
     NOTABELA                : string[30];
     NOTABELA_AUXILIAR       : String[30];
     SNPROGRAMA_SISTEMA      : String[1];
     SNGERAL                 : string[1];
     SNFILTRO_OBRIGATORIO    : string[1];
     SNPROGRAMA_LOGICO       : string;
     CDPROGRAMA_FISICO       : string;
     TXPARAMETRO             : string;
     NRINDICE_ICONE          : integer;
     CDMODULO                : string;
     SNGRAVA_LOG_MANUTENCAO  : String[1];
     SNCONFIRMACAO_INCLUSAO  : String[1];
     SNCONFIRMACAO_EXCLUSAO  : String[1];
     SNCONFIRMACAO_ALTERACAO : String[1];
     SNINCLUIR               : string[1];
     SNALTERAR               : string[1];
     SNEXCLUIR               : string[1];
     SNCONSULTAR             : string[1];
     SNTELA_SEMPRE_ONLINE    : string[1];
  end;

  TReg_Campo = record
     NOTABELA         : String;
     NOCAMPO          : string;
     DSCAMPO          : string;
     CDTIPO_DADO      : string;
     NRTAMANHO        : integer;
     NRDECIMAIS       : integer;
     SNOBRIGATORIO    : string;
     SNCHAVE_PRIMARIA : string;
     NOSEQUENCIA      : string;
     CDTIPO_DOMINIO   : integer;
     TXVALOR_PADRAO   : string;
     VLMINIMO         : real;
     VLMAXIMO         : real;
     TXOBSERVACAO     : string;
  end;

  TaCampos = array of TReg_Campo;

  TdmCOM002A = class(TDataModule)
    qyPrograma_Operador: TUniQuery;
    ImIcones: TImageList;
    qyTmp: TUniQuery;
    dsIcone: TDataSource;
    qyPrograma_Grupo: TUniQuery;
    qyAtalho: TUniQuery;
    imIcones24: TImageList;
    imIcones16: TImageList;
    dsPrograma: TDataSource;
    tbIcone: TTable;
    tbIconeCDPROGRAMA: TStringField;
    tbIconeFGICONE: TBlobField;
    qyCampos: TQuery;
    qyCampo: TQuery;
    qyModulo: TQuery;
    qyPrograma: TQuery;
  private
    { Private declarations }
    vaPrograma : array of TReg_Programa;
    procedure Carrega_Array_Programa;

    procedure Copia_ImageList(pimlOrigem,pimlDestino:TimageList);
    procedure Autoriza_Programa( psCDPROGRAMA, psSNINCLUIR, psSNALTERAR, psSNEXCLUIR, psSNCONSULTAR : string);
  public
    { Public declarations }
    function Autorizacao_Programa( psCdPrograma : string; var prPrograma : TReg_Programa ) : boolean; overload;
    function Autorizacao_Programa( psCdPrograma : string ) : boolean; overload;
    function Autorizacao_Modulo( psCdModulo : string ) : boolean;
    function Descricao_Programa( psCdPrograma : string):string;
    function Indice_Icone_Programa( psCdPrograma : string ) : integer;
    procedure Carrega_Autorizacao_Programas;
    //function Campo_Existe(psNoTabela,psNoCampo: string): boolean;
//    function Obtem_Tipo_Campo( psNoTabela,psNoCampo : string ) : String;
    function Obtem_Tipo_Campo( psNoCampo : string;paCampos : TaCampos) : String;
    function Campo_IsFloat( psNoCampo : string;paCampos : TaCampos) : Boolean;
    function Campo_Existe(psNoCampo: string;paCampos : TaCampos): boolean;
    procedure Definicao_Campo( psNoCampo : string;paCampos : TaCampos; var pRegCampo : TReg_Campo);
    function Carrega_definicao_campos(psNoTabela:String;psNoTabela_Auxiliar:String=''):TaCampos;
  end;

var
  dmCOM002A: TdmCOM002A;

implementation

uses uDeclara, dtmPrincipal;

{$R *.DFM}

procedure TdmCOM002A.Copia_ImageList(pimlOrigem,pimlDestino:TimageList);
var vBitmap_Origem : TBitMap;
    vBitmap_Destino : TBitMap;
    vRect_Destino : TRect;
    i : integer;
begin
  vBitmap_Origem := TBitMap.Create;
  vBitmap_Origem.Width  := pimlOrigem.Width;
  vBitmap_Origem.Height := pimlOrigem.Height;

  vBitmap_Destino := TBitMap.Create;
  vBitmap_Destino.Width  := pimlDestino.Width;
  vBitmap_Destino.Height := pimlDestino.Height;

  vRect_Destino.Left   := 0;
  vRect_Destino.Top    := 0;
  vRect_Destino.right  := pimlDestino.Width;
  vRect_Destino.Bottom := pimlDestino.Height;


  for i := 0 to imIcones.count -1 do
  begin
    pimlOrigem.GetBitmap(i,vBitmap_Origem);
    vBitmap_Destino.Canvas.stretchDraw(vRect_Destino,vBitmap_Origem);
    pimlDestino.Add(vBitmap_Destino,nil);
  end;

  vBitmap_Origem.free;
  vBitmap_Destino.free;
end;

function TdmCOM002A.Autorizacao_Modulo( psCdModulo : string ) : boolean;
var i : integer;
    vbAutorizou : boolean;
begin
   i := low(vaPrograma);
   vbAutorizou := false;
   while (i <= high(vaPrograma)) and (not vbAutorizou) do
   begin
      if UpperCase(vaPrograma[i].CDMODULO) = UpperCase(psCdModulo) then
      begin
         vbAutorizou := ( ( not AppModo_Geral ) OR ( vaPrograma[i].SNGERAL='S') ) and
                        ( ( vaPrograma[i].SNINCLUIR   = 'S' ) OR
                          ( vaPrograma[i].SNALTERAR   = 'S' ) OR
                          ( vaPrograma[i].SNEXCLUIR   = 'S' ) OR
                          ( vaPrograma[i].SNCONSULTAR = 'S' ) );
      end;
      inc(i);
   end;

  result := vbAutorizou;

end;


procedure TdmCOM002A.Carrega_Array_Programa;
var //imdb : TDBImage;
    i : integer;
    vbIcone_Externo : boolean;
    vsQgIcone:string;
begin
//  imdb := TDBImage.Create(self);
//  imdb.DataSource := dsPrograma;
//  imdb.DataField := 'FGICONE';
  vbIcone_Externo := false;

//  vaPrograma := nil;

  // Deleta os icones dos programas, exceto as imagens 0 e 1,
  //que é a imagem da botao e do menu sem figura relacionada
//  for i := (imIcones.Count-1) downto 2 do
//    imIcones.Delete(i);
//  vsQgIcone:=AppPathKey;
//  if fileexists(vsQgIcone+'\Icone.dbf') OR fileexists(vsQgIcone+'\Icone.db') then
//  begin
//    with tbIcone do
//    begin
//      close;
//
//      if fileExists( AppPathKey + '\icone.dbf') then
//        tablename := 'icone.dbf'
//      else
//        tablename := 'icone.db';
//
//      DatabaseName := AppPathKey;
//      open;
////      imdb.DataSource := dsIcone;
//      vbIcone_Externo := true;
//    end;
//  end;

  with qyPrograma do
  begin
    close;
    open;
    while not eof do
    begin
      if (FieldByName('CDSITUACAO').asString = csCdSit_Ativo )then
      begin
        // CARREGA ARRAY DE DIREITOS DE ACESSO
        setLength(vaPrograma,length(vaPrograma)+1);
        vaPrograma[high(vaPrograma)].CDPROGRAMA           := Trim(FieldByName('CDPROGRAMA').asString);
        vaPrograma[high(vaPrograma)].NOPROGRAMA           := FieldByName('NOPROGRAMA').asString;
        vaPrograma[high(vaPrograma)].NOABREVIADO          := FieldByName('NOABREVIADO').asString;
        vaPrograma[high(vaPrograma)].NOTABELA             := FieldByName('NOTABELA').asString;
        vaPrograma[high(vaPrograma)].NOTABELA_AUXILIAR    := FieldByName('NOTABELA_AUXILIAR').asString;
        vaPrograma[high(vaPrograma)].SNPROGRAMA_SISTEMA   := FieldByName('SNPROGRAMA_SISTEMA').asString;
        vaPrograma[high(vaPrograma)].SNGERAL              := FieldByName('SNGERAL').asString;
        vaPrograma[high(vaPrograma)].SNFILTRO_OBRIGATORIO := FieldByName('SNFILTRO_OBRIGATORIO').asString;
        vaPrograma[high(vaPrograma)].SNTELA_SEMPRE_ONLINE := FieldByName('SNTELA_SEMPRE_ONLINE').asString;        
        //programas lógico
        vaPrograma[high(vaPrograma)].SNPROGRAMA_LOGICO    := FieldByName('SNPROGRAMA_LOGICO').asString;
        vaPrograma[high(vaPrograma)].CDPROGRAMA_FISICO    := FieldByName('CDPROGRAMA_FISICO').asString;
        vaPrograma[high(vaPrograma)].TXPARAMETRO          := FieldByName('TXPARAMETRO').asString;
        vaPrograma[high(vaPrograma)].CDMODULO             := FieldByName('CDMODULO').asString;
        //log e dupla custódia
        vaPrograma[high(vaPrograma)].SNGRAVA_LOG_MANUTENCAO  := FieldByName('SNGRAVA_LOG_MANUTENCAO').asString;
        vaPrograma[high(vaPrograma)].SNCONFIRMACAO_INCLUSAO  := FieldByName('SNCONFIRMACAO_INCLUSAO').asString;
        vaPrograma[high(vaPrograma)].SNCONFIRMACAO_EXCLUSAO  := FieldByName('SNCONFIRMACAO_EXCLUSAO').asString;
        vaPrograma[high(vaPrograma)].SNCONFIRMACAO_ALTERACAO := FieldByName('SNCONFIRMACAO_ALTERACAO').asString;
        // Se o operador eh administrador ja autoriza todos os programas
        vaPrograma[high(vaPrograma)].SNINCLUIR            := AppOperAdmin;
        vaPrograma[high(vaPrograma)].SNALTERAR            := AppOperAdmin;
        vaPrograma[high(vaPrograma)].SNEXCLUIR            := AppOperAdmin;
        vaPrograma[high(vaPrograma)].SNCONSULTAR          := AppOperAdmin;
        //localiza o icone
        vaPrograma[high(vaPrograma)].NRINDICE_ICONE := 0; // imNotFound eh o default
//        if ( vbIcone_Externo ) then
//        begin
//           if tbIcone.Locate('CDPROGRAMA', FieldByName('CDPROGRAMA').asString ,[])  and
//              (not tbIcone.FieldByName('FGICONE').isNull) then
//           begin
//             vaPrograma[high(vaPrograma)].NRINDICE_ICONE := imIcones.Add(imDb.Picture.Bitmap,nil);
//           end;
//        end
//        else
//        begin
////                if (not qyPrograma.FieldByName('FGICONE').isNull) then
//          if (TBlobField(qyPrograma.FieldByName('FGICONE')).BlobSize > 0) then
//          begin
//            try
//              vaPrograma[high(vaPrograma)].NRINDICE_ICONE := imIcones.Add(imDb.Picture.Bitmap,nil);
//            except
//               vaPrograma[high(vaPrograma)].NRINDICE_ICONE := 0; // imNotFound eh o default
//            end;
//          end;
//        end;
      end;

      Next;
    end;
    close;
  end;

//  tbIcone.close;

//  imIcones24.clear;
//  imIcones16.Clear;
//  Copia_ImageList(ImIcones,imIcones24);
//  Copia_ImageList(ImIcones,imIcones16);

//  imdb.Free;
end;

function  TdmCOM002A.Autorizacao_Programa( psCdPrograma : string; var prPrograma : TReg_Programa ) : boolean;
var i : integer;
    vbEncontrou : boolean;
    vbAutoriza : boolean;
begin
   i := low(vaPrograma);
   vbEncontrou := false;
   while (i <= high(vaPrograma)) and (not vbEncontrou) do
   begin
      if UpperCase(vaPrograma[i].CDPROGRAMA) = UpperCase(psCdPrograma) then
      begin
         prPrograma := vaPrograma[i];
         vbEncontrou := true;
      end;
      inc(i);
   end;
   vbAutoriza := vbEncontrou and
                 ( ( not AppModo_Geral ) OR
                   ( prPrograma.SNGERAL='S') ) and
                 ( ( prPrograma.SNINCLUIR   = 'S' ) OR
                   ( prPrograma.SNALTERAR   = 'S' ) OR
                   ( prPrograma.SNEXCLUIR   = 'S' ) OR
                   ( prPrograma.SNCONSULTAR = 'S' ) );
  result := vbAutoriza;
end;

function TdmCOM002A.Autorizacao_Programa( psCdPrograma : string ) : boolean;
var vrPrograma : TReg_Programa;
begin
  result := Autorizacao_Programa( psCdPrograma, vrPrograma);
end;

function TdmCOM002A.Indice_Icone_Programa( psCdPrograma : string ) : integer;
var vrPrograma : TReg_Programa;
begin
   Autorizacao_Programa(psCdPrograma,vrPrograma);
   result := vrPrograma.NRINDICE_ICONE;
end;

procedure TdmCOM002A.Carrega_Autorizacao_Programas;
begin
  Carrega_Array_Programa;
  if AppOperAdmin <> 'S' then
  begin
     // Carrega Autorizacao do Operador
     with qyPrograma_Operador do
     begin
        close;
        ParamByName('CDOPERADOR').asString := AppSysOper;
        open;
        while not eof do
        begin
           Autoriza_Programa( FieldByName('CDPROGRAMA').asString,
                              FieldByName('SNINCLUIR').asString,
                              FieldByName('SNALTERAR').asString,
                              FieldByName('SNEXCLUIR').asString,
                              FieldByName('SNCONSULTAR').asString);

           next;
        end;
        close;
     end;
     // Carrega Autorizacao do Grupo
     with qyPrograma_Grupo do
     begin
        close;
        ParamByName('CDGRUPO').asInteger := AppSysGrupo;
        ParamByName('CDOPERADOR').asString := AppSysOper;
        open;
        while not eof do
        begin
           Autoriza_Programa( FieldByName('CDPROGRAMA').asString,
                              FieldByName('SNINCLUIR').asString,
                              FieldByName('SNALTERAR').asString,
                              FieldByName('SNEXCLUIR').asString,
                              FieldByName('SNCONSULTAR').asString);
           next;
        end;
        close;
     end;
  end;
end;

procedure TdmCOM002A.Autoriza_Programa( psCDPROGRAMA, psSNINCLUIR, psSNALTERAR, psSNEXCLUIR, psSNCONSULTAR : string);
var i : integer;
    vbEncontrou : boolean;
begin
   i := low(vaPrograma);
   vbEncontrou := false;
   while (i <= high(vaPrograma)) and (not vbEncontrou) do
   begin
      if UpperCase(vaPrograma[i].CDPROGRAMA) = UpperCase(psCdPrograma) then
      begin
         vaPrograma[i].SNINCLUIR   := psSNINCLUIR;
         vaPrograma[i].SNEXCLUIR   := psSNEXCLUIR;
         vaPrograma[i].SNALTERAR   := psSNALTERAR;
         vaPrograma[i].SNCONSULTAR := psSNCONSULTAR;
         vbEncontrou := true;
      end;
      inc(i);
   end;
//   if not vbEncontrou then
//      showmessage('Não encontrado o programa "'+psCdPrograma+'"');
end;

function TdmCOM002A.Descricao_Programa( psCdPrograma : string) : string;
var vrPrograma : TReg_Programa;
begin
   Autorizacao_Programa(psCdPrograma,vrPrograma);
   result := vrPrograma.NOPROGRAMA;
end;

// Busca no banco de dados as definicoes dos campos da tabela em manutencao
// definicoes ( null, tipo, valor default etc.)
// Localiza os componentes de edicao de dados e associa aos campos
function TdmCOM002A.Carrega_definicao_campos(psNoTabela:String;psNoTabela_Auxiliar:String=''):TaCampos;
var i : integer;
    vaCampos : TaCampos;
begin
  i := 0;
  vaCampos := nil;
  // Carrega Definicao dos campos da Tabela de Catalogo
  with dmCOM002A.qyCampos do
  begin
    Close;
    parambyname('NOTABELA').asString := psNoTabela;
    if (trim(psNoTabela_Auxiliar) <> '' ) then
      parambyname('NOTABELA_AUXILIAR').asString := psNoTabela_Auxiliar
    else
      parambyname('NOTABELA_AUXILIAR').Clear;

    open;
    if eof then
    begin
       showmessage('Não encontrada a definição dos campos da Tabela "'+psNoTabela+'"');
    end
    else
    begin
      while not eof do
      begin
        setlength(vaCampos,i+1);
        vaCampos[i].NOTABELA         := fieldbyname('NOTABELA').asstring ;
        vaCampos[i].NOCAMPO          := fieldbyname('NOCAMPO').asstring ;
        vaCampos[i].DSCAMPO          := fieldbyname('DSCAMPO').asstring ;
        vaCampos[i].CDTIPO_DADO      := fieldbyname('CDTIPO_DADO').asstring ;
        vaCampos[i].NRTAMANHO        := fieldbyname('NRTAMANHO').asInteger ;
        vaCampos[i].NRDECIMAIS       := fieldbyname('NRDECIMAIS').asInteger ;
        vaCampos[i].SNOBRIGATORIO    := fieldbyname('SNOBRIGATORIO').asstring ;
        vaCampos[i].SNCHAVE_PRIMARIA := fieldbyname('SNCHAVE_PRIMARIA').asstring ;
        vaCampos[i].NOSEQUENCIA      := fieldbyname('NOSEQUENCIA').asstring ;
        vaCampos[i].CDTIPO_DOMINIO   := fieldbyname('CDTIPO_DOMINIO').asInteger ;
        vaCampos[i].TXVALOR_PADRAO   := fieldbyname('TXVALOR_PADRAO').asstring ;
        vaCampos[i].VLMINIMO         := fieldbyname('VLMINIMO').asFloat ;
        vaCampos[i].VLMAXIMO         := fieldbyname('VLMAXIMO').asFloat ;
        inc(i);
        next;
      end;
    end;
    Close;
  end;
  result:=vaCampos;
end;

{
  Procedure Definicao_Campo
  objetivo   : Verificar as definicoes de um campo da tabela
  Parametros : psNoCampo : Nome do campo em Questão
  retorno    : registro do tipo TReg_Campo, que contem as definicoes do campo
               se nao encontrar a definicao para o campo, lanca uma excecao
}
procedure TdmCOM002A.Definicao_Campo( psNoCampo : string;paCampos : TaCampos; var pRegCampo : TReg_Campo);
var i : integer;
    vbEncontrado : boolean;
begin
   i := low(paCampos);
   vbEncontrado := false;
   while (i <= high(paCampos)) and (not vbEncontrado) do
   begin
      if paCampos[i].NOCAMPO = psNoCampo then
      begin
         pRegCampo := paCampos[i];
         vbEncontrado := true;
      end;
      inc(i);
   end;
   if (not vbEncontrado) then
   begin
      raise exception.create('Não encontrado definição para o campo "'+psNoCampo+'"');
   end;
end;

{
//Busca direto na tabela .dbf
function TdmCOM002A.Obtem_Tipo_Campo(psNoTabela,psNoCampo: string): String;
begin
  result:='';
  with qyCampo do
  begin
    Close;
    parambyname('NOTABELA').asString := psNoTabela;
    parambyname('NOCAMPO').asString := psNoCampo;
    Open;
    result:=fieldbyname('CDTIPO_DADO').asString;
    Close;
  end;
end;

function TdmCOM002A.Campo_Existe(psNoTabela,psNoCampo: string): boolean;
begin
  with qyCampo do
  begin
    Close;
    parambyname('NOTABELA').asString := psNoTabela;
    parambyname('NOCAMPO').asString := psNoCampo;
    Open;
    result:=not eof;
    Close;
  end;
end;}

//Busca procura no array de definição de campos
function TdmCOM002A.Obtem_Tipo_Campo(psNoCampo: string; paCampos: TaCampos): String;
var pRegCampo: TReg_Campo;
begin
  Definicao_Campo( psNoCampo,paCampos,pRegCampo);
  result:= pRegCampo.CDTIPO_DADO;
end;

function TdmCOM002A.Campo_IsFloat(psNoCampo: string; paCampos: TaCampos): Boolean;
var pRegCampo: TReg_Campo;
begin
  Definicao_Campo( psNoCampo,paCampos,pRegCampo);
  result:= (pRegCampo.NRDECIMAIS > 0) ;
end;

function TdmCOM002A.Campo_Existe(psNoCampo: string;paCampos: TaCampos): boolean;
var pRegCampo: TReg_Campo;
begin
  try
    Definicao_Campo( psNoCampo,paCampos,pRegCampo);
    result:= true;
  except
    result:= false;
  end;
end;

end.
