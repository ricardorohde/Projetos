unit DbErro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, dbTables, bde, Db,ComCtrls,
  {ECmpCol,} DBClient, Grids, DBGrids, DBGridPesquisa,utool,udeclara;

type
  TfmErro = class(TForm)
    paMessage: TPanel;
    meMessage: TMemo;
    bbok: TBitBtn;
    bbDetalhes: TBitBtn;
    IconImage: TImage;
    qyQtRegistro: TQuery;
    dsRelacionamento: TDataSource;
    cdsRelacionamentos: TClientDataSet;
    cdsRelacionamentosNOTABELA: TStringField;
    cdsRelacionamentosNOTABELA_REFERENCIADA: TStringField;
    cdsRelacionamentosCAMPOS: TStringField;
    cdsRelacionamentosQTREGISTROS: TIntegerField;
    qyRelacionamentos: TQuery;
    qyRelacionamentosCDRELACIONAMENTO_TABELA: TFloatField;
    qyRelacionamentosNOTABELA: TStringField;
    qyRelacionamentosQtRegistros: TIntegerField;
    qyCampo: TQuery;
    pcDetalhes: TPageControl;
    tsErro: TTabSheet;
    Panel2: TPanel;
    laErro: TLabel;
    laCategoria: TLabel;
    laSubCodigo: TLabel;
    laErro_Nativo: TLabel;
    bbAnterior: TBitBtn;
    bbProximo: TBitBtn;
    meErrMessage: TMemo;
    edErrorCode: TEdit;
    edCategory: TEdit;
    edSubCode: TEdit;
    edNativeError: TEdit;
    tsRelacionamento: TTabSheet;
    Panel3: TPanel;
    grdRelacionamento: TDBGridPesquisa;
    bbSalvar_Erro: TSpeedButton;
    sdGrava_Arquivo: TSaveDialog;
    procedure bbokClick(Sender: TObject);
    procedure bbDetalhesClick(Sender: TObject);
    procedure Atualiza_Detalhe;
    procedure bbAnteriorClick(Sender: TObject);
    procedure bbProximoClick(Sender: TObject);
    Procedure Mostra_Erro_Principal( piErrorCode : integer; psMensagem, psErro : string );
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pcDetalhesChange(Sender: TObject);
//    procedure Carrega_Relacionamentos(psNoTabela:string);
    procedure bbSalvar_ErroClick(Sender: TObject);
    procedure Gera_Arquivo(vsArquivo:Tstrings);

  private
    { Private declarations }
    vQueryResult : TStrings;
    vErro           : exception;
    vinrErro_Atual  : integer;
    vbDetalhado     : boolean;
    vsender         : TObject;
    vsNoTabela: string;
  public
    { Public declarations }
    class procedure showError( sender : TObject; pErro : exception; psMensagem_Principal : string ='';
                               psNoTabela : string = ''; pQueryResult : Tstrings = nil);
  end;


implementation
{$R *.DFM}

uses {ModPrincipal,} dtmPrincipal;

class procedure TfmErro.showError( sender : TObject; pErro : exception; psMensagem_Principal : string ='';
                           psNoTabela : string = ''; pQueryResult : Tstrings = nil);
var vdbErro : edbEngineError;
begin
  with create(Application) do
  begin
    vErro   := pErro;
    vsNoTabela := psNoTabela;
    vQueryResult := pQueryResult;
    vsender :=sender;

    if (vErro is eDbEngineError) then
    begin
       vdbErro := edbEngineError(vErro);
       Mostra_Erro_Principal( vdbErro.Errors[0].ErrorCode, psMensagem_Principal, vdbErro.Errors[0].message );
    end
    else
       Mostra_Erro_Principal( 0, psMensagem_Principal, vErro.message );

    bbDetalhes.enabled := (psMensagem_Principal<>'')or(vErro is eDbEngineError);
    bbSalvar_Erro.Visible:=AppModo_Debug;
    showmodal;
    free;
  end;
end;

procedure TfmErro.bbokClick(Sender: TObject);
begin
   modalresult := mrOk ;
end;

procedure TfmErro.bbDetalhesClick(Sender: TObject);
var vbTabVisible:boolean;
begin
  if vbDetalhado then
  begin
    vbDetalhado := false;
    bbDetalhes.Caption := 'Detalhes >>';
    vinrErro_Atual := 0;
    pcDetalhes.visible:=false;
  end
  else
  begin
    vbTabVisible:=(vErro is eDbEngineError)and
                  (eDbEngineError(vErro).Errors[0].ErrorCode= DBIERR_DETAILRECORDSEXIST)and
                  ( vsNoTabela <> '' ) and (assigned(vQueryResult));

    tsRelacionamento.TabVisible:=vbTabVisible;
    tsErro.TabVisible:=vbTabVisible;
    pcDetalhes.visible:=true;

    pcDetalhes.ActivePage:=tsErro;
    vbDetalhado := true;
    bbDetalhes.Caption := '<< Detalhes';
    Atualiza_Detalhe;
  end;
end;

procedure TfmErro.Atualiza_Detalhe;
begin
  if vErro is eDbEngineError then
  begin
    with eDbEngineError(vErro) do
    begin
      bbAnterior.enabled := vinrErro_Atual <> 0;
      bbProximo.enabled  := vinrErro_Atual <> (ErrorCount -1 );
      edCategory.text    := inttostr(Errors[vinrErro_Atual].category);
      edsubCode.text     := inttostr(Errors[vinrErro_Atual].SubCode);
      edErrorCode.text   := inttostr(Errors[vinrErro_Atual].ErrorCode);
      edNativeError.text := inttostr(Errors[vinrErro_Atual].NativeError);
      with meErrMessage do
      begin
        lines.clear;
        lines.add(Errors[vinrErro_Atual].Message);
        setfocus;
        selstart := 0;
      end;
    end;
  end
  else
  begin
    bbAnterior.enabled := False;
    bbProximo.enabled  := False;
    edCategory.text    := '';
    edsubCode.text     := '';
    edErrorCode.text   := '';
    edNativeError.text := '';
    with meErrMessage do
    begin
      lines.clear;
      lines.add(vErro.Message);
      setfocus;
      selstart := 0;
    end;
  end;

  laCategoria.Enabled   := edCategory.text    <> '';
  laSubCodigo.Enabled   := edsubCode.text     <> '';
  laErro_Nativo.Enabled := edNativeError.text <> '';
  laErro.Enabled        := edErrorCode.text   <> '';
end;

procedure TfmErro.bbAnteriorClick(Sender: TObject);
begin
  if vErro is eDbEngineError then
  begin
    if vinrErro_Atual > 0 then
    begin
      dec(vinrErro_Atual);
      Atualiza_Detalhe;
    end;
  end;
end;

procedure TfmErro.bbProximoClick(Sender: TObject);
begin
  if vErro is eDbEngineError then
  begin
    if vinrErro_Atual < ( eDbEngineError(vErro).ErrorCount  -1 ) then
    begin
      inc(vinrErro_Atual);
      Atualiza_Detalhe;
    end;
  end
end;

Procedure TfmErro.Mostra_Erro_Principal( piErrorCode : integer; psMensagem,  psErro : string );
begin
  meMessage.Lines.clear;
  if (psMensagem<>'') then
  begin
    meMessage.Lines.add(psMensagem);
  end
  else
  begin
    if piErrorCode = DBIERR_FORIEGNKEYERR then // Master Record Missing ( erro )
    begin
      meMessage.Lines.add(' Não Encontrado Registro Mestre ');
    end
    else
    if piErrorCode = DBIERR_DETAILRECORDSEXIST then // Cannot MODIFY or DELETE this Master record ( warning )
    begin
      meMessage.Lines.add(' Não é possivel excluir. ');
      meMessage.Lines.add(' Encontrados registros relacionados em outras tabelas.');
    end
    else
    if piErrorCode = DBIERR_KEYVIOL then // Key violation ( warning )
    begin
      meMessage.Lines.add(' Registros Duplicados ');
    end
    else
    if piErrorCode = DBIERR_REQDERR then // Field value required ( warning )
    begin
      meMessage.Lines.add(' Campo Obrigatório não informado ');
    end
    else // Exceptions nao tratados ( warning )
      meMessage.Lines.add( psErro );
  end;
end;

procedure TfmErro.FormShow(Sender: TObject);
begin
  // Prepara a tela sem detalhes
  vbDetalhado := true;
  bbDetalhesClick(self);
end;

procedure TfmErro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape then
    ModalResult := mrCancel;
end;

procedure TfmErro.pcDetalhesChange(Sender: TObject);
begin
//Comentei
//  if(pcDetalhes.ActivePage=tsRelacionamento) and (dmCT <> nil) then//and(not dmCT.cdsRelacionamentos.Active)then
//  begin
//    dmCT.Carrega_Relacionamentos(vsNoTabela,vQueryResult);
//    dsRelacionamento.DataSet:=dmCT.cdsRelacionamentos;
//  end;
end;

{procedure TfmErro.Carrega_Relacionamentos(psNoTabela:string);
var vsCampos,vsNoCampo,vsNoTabela,vsNoTabela_Referenciada:string;
    vvValor_Campo_Referenciado:Variant;
begin
  vsNoTabela_Referenciada:=psNoTabela;
  cdsRelacionamentos.Close;
  cdsRelacionamentos.CreateDataSet;
  cdsRelacionamentos.Open;

  qyRelacionamentos.Close;
  qyRelacionamentos.ParamByName('NOTABELA_REFERENCIADA').asstring:=vsNoTabela_Referenciada;
  qyRelacionamentos.Open;

  while not qyRelacionamentos.Eof do
  begin
    vsNoTabela:=qyRelacionamentos.fieldByName('NOTABELA').asString;

    qyCampo.Close;
    qyCampo.ParamByName('CDRELACIONAMENTO_TABELA').asinteger:=qyRelacionamentos.fieldByName('CDRELACIONAMENTO_TABELA').asinteger;
    qyCampo.Open;

    qyQtRegistro.close;
    qyQtRegistro.SQL.Clear;
    qyQtRegistro.SQL.add('SELECT COUNT(*) QTREGISTROS ');
    qyQtRegistro.SQL.add('FROM '+ vsNoTabela);

    vsCampos:='';
    while not qyCampo.Eof do
    begin
      addstrtolist(qyCampo.fieldByName('NOCAMPO').asstring+','+
                   qyCampo.fieldByName('NOCAMPO_REFERENCIADO').asstring,
                   vsCampos,';');
      vsNoCampo := trim(qyCampo.fieldbyname('NOCAMPO').asstring);

      if(qyCampo.fieldbyname('CDTIPO_DADO').asstring=csCdDado_Numerico)then
        vvValor_Campo_Referenciado:= VarAsType(vQueryResult.values[qyCampo.fieldbyname('NOCAMPO_REFERENCIADO').asstring],varInteger)
      else
        vvValor_Campo_Referenciado:=VarAsType(vQueryResult.values[qyCampo.fieldbyname('NOCAMPO_REFERENCIADO').asstring],varString );

      insertfilter(qyQtRegistro,vsNoCampo+' = :'+vsNoCampo,vsNoCampo,vvValor_Campo_Referenciado);

      qyCampo.Next;
    end;
    qyQtRegistro.Open;

    with cdsRelacionamentos do
    begin
      if(qyQtRegistro.FieldByName('QTREGISTROS').asInteger >0)then
      begin
        insert;
        FieldByName('NOTABELA').asString                := vsNoTabela;
        FieldByName('NOTABELA_REFERENCIADA').asString   := vsNoTabela_Referenciada;
        FieldByName('CAMPOS').asString   := vsCampos;
        FieldByName('QTREGISTROS').asInteger   := qyQtRegistro.fieldbyname('QTREGISTROS').asInteger;
        post;
      end;
    end;

    qyRelacionamentos.Next;
  end;
end;
 }
{procedure TfmRelacionamento.Calcula_QtResgistros;
var vsNoTabela,vsNoCampo,vsNoCampo_referenciado : string;
    aCampo:aString;
    i:integer;
begin
  aCampo:=nil;
  with dmCT.cdsRelacionamentos do
  begin
    First;
    while not eof do
    begin
      vsNoTabela := fieldbyname('NOTABELA').asString;
      qyTmp.close;
      qyTmp.SQL.Clear;
      qyTmp.SQL.add('SELECT COUNT(*) QTREGISTROS ');
      qyTmp.SQL.add('FROM '+ vsNoTabela);

      aCampo:=strtoarray(fieldByName('CAMPOS').asstring,';');
      for i:=low(aCampo) to high(aCampo)do
      begin
        vsNoCampo:=copy(aCampo[i],0,pos(',',aCampo[i])-1);
        vsNoCampo_referenciado:=copy(aCampo[i],pos(',',aCampo[i])+1,length(aCampo[i]));
        insertfilter(qyTmp,vsNoCampo+' = :'+vsNoCampo,vsNoCampo,vQueryResult.values[vsNoCampo_referenciado]);
      end;

      qyTmp.Open;
      if (qyTmp.fieldByName('QTREGISTROS').asinteger>0) then
      begin
        edit;
        fieldByName('QTREGISTROS').asinteger:=qyTmp.fieldByName('QTREGISTROS').asinteger;
        post;
        next;
      end
      else
        delete;
    end;
    first;
  end;
end;}

procedure TfmErro.bbSalvar_ErroClick(Sender: TObject);
var vsArquivo:Tstrings;
    vsNoArquivo:string;
    vdia,vmes,vano:word;
begin
  vsArquivo:=TstringList.Create;

  vsNoArquivo:='Erro';
  if (vsender<>nil)and (vsender is TForm) then
    vsNoArquivo:=vsNoArquivo+'_'+vsender.ClassName;
  DecodeDate(now,vano,vmes,vdia);
  vsNoArquivo:=vsNoArquivo+'_'+inttostr(vano)+inttostr(vmes)+inttostr(vdia);

  sdGrava_Arquivo.FileName:=vsNoArquivo;
  if( sdGrava_Arquivo.Execute )then
  begin
    Gera_Arquivo(vsArquivo);
    vsArquivo.SaveToFile(sdGrava_Arquivo.FileName);
  end;
  vsArquivo.Free;
end;

procedure TfmErro.Gera_Arquivo(vsArquivo:Tstrings);
var vsCdPrograma:string;
    i:integer;
begin
  with vsArquivo do
  begin
    Clear;
    if (vsender<>nil)and (vsender is TForm) then
    begin
      vsCdPrograma:= copy(vsender.ClassName,2,length(vsender.ClassName));
      Add('Programa: '+vsCdPrograma+' - '+TForm(vsender).Caption);
      Add('');
    end;

    Add(trim(meMessage.text));//Mensagem principal
    Add('');
    if vErro is eDbEngineError then
    begin
      for i:=0 to eDbEngineError(vErro).ErrorCount -1 do
      begin
        Add('Categoria : '  +inttostr(eDbEngineError(vErro).Errors[i].category));
        Add('SubCodigo : '  +inttostr(eDbEngineError(vErro).Errors[i].SubCode));
        Add('Erro : '       +inttostr(eDbEngineError(vErro).Errors[i].ErrorCode));
        Add('Erro Nativo : '+inttostr(eDbEngineError(vErro).Errors[i].NativeError));
        Add(eDbEngineError(vErro).Errors[i].Message);
        Add('');
      end;
    end
    else
    begin
      Add(vErro.Message);
    end;
    Add('');
    if(vsNoTabela<>'')then
    begin
      Add('Tabela: '+vsNoTabela);
      Add('');
      for i:=0 to vQueryResult.Count - 1 do
        Add(vQueryResult.Strings[i]);
    end;
  end;
end;

end.
