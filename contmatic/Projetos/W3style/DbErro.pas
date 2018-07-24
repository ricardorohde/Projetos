unit DbErro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, dbTables, bde, Db,Relacionamento;

type
  TfmErro = class(TForm)
    paMessage: TPanel;
    meMessage: TMemo;
    bbok: TBitBtn;
    bbDetalhes: TBitBtn;
    paDetalhe: TPanel;
    bbAnterior: TBitBtn;
    bbProximo: TBitBtn;
    meErrMessage: TMemo;
    edErrorCode: TEdit;
    Label1: TLabel;
    edCategory: TEdit;
    Label2: TLabel;
    edSubCode: TEdit;
    Label3: TLabel;
    edNativeError: TEdit;
    Label4: TLabel;
    IconImage: TImage;
    bbTabelas: TButton;
    paDetalhe_Simples: TPanel;
    meMensagem_Erro: TMemo;
    procedure bbokClick(Sender: TObject);
    procedure bbDetalhesClick(Sender: TObject);
    procedure Atualiza_Detalhe;
    procedure bbAnteriorClick(Sender: TObject);
    procedure bbProximoClick(Sender: TObject);
    Procedure Mostra_Erro_Principal( piErrorCode : integer; psMensagem, psErro : string );
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bbTabelasClick(Sender: TObject);
  private
    { Private declarations }
    vQueryResult : TStrings;
  public
    { Public declarations }
    class procedure showError( sender : TObject; pErro : exception; psMensagem_Principal : string ='';
                               psNoTabela : string = ''; pQueryResult : Tstrings = nil);
  end;

var
  fmErro          : TfmErro;
  vErro           : exception;
  vinrErro_Atual  : integer;
  vsNoTabela      : string;
  vbDetalhado     : boolean;
  vbDbEngineError : boolean;

implementation

{$R *.DFM}
class procedure TfmErro.showError( sender : TObject; pErro : exception; psMensagem_Principal : string ='';
                           psNoTabela : string = ''; pQueryResult : Tstrings = nil);
var vdbErro : edbEngineError;
begin
   with create(Application) do
   begin
      vErro   := pErro;
      vsNOTabela := psNoTabela;
      vQueryResult := pQueryResult;
      vbDbEngineError :=(pErro is eDbEngineError);
      if vbDbEngineError then
      begin
         vdbErro := edbEngineError(vErro);
         Mostra_Erro_Principal( vdbErro.Errors[0].ErrorCode, psMensagem_Principal, vdbErro.Errors[0].message );
      end
      else
         Mostra_Erro_Principal( 0, psMensagem_Principal, vErro.message );
      bbDetalhes.enabled := (psMensagem_Principal<>'')or(vbDbEngineError);
      showmodal;
      free;
   end;
end;

procedure TfmErro.bbokClick(Sender: TObject);
begin
   modalresult := mrOk ;
end;

procedure TfmErro.bbDetalhesClick(Sender: TObject);
begin
  if vbDetalhado then
  begin
    clientheight := paMessage.Height ;
    vbDetalhado := false;
    bbDetalhes.Caption := 'Detalhes >>';
    vinrErro_Atual := 0;
  end
  else
  begin
    if(vbDbEngineError) then
      clientheight := paMessage.Height + paDetalhe.Height
    else
    begin
      clientheight := paMessage.Height + paDetalhe_Simples.Height;
    end;
    paDetalhe_Simples.Visible:=(not vbDbEngineError);
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
   end;
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
   meMensagem_Erro.Lines.clear;

   if psMensagem <> '' then
   begin
      meMessage.Lines.add(psMensagem);
      meMensagem_Erro.Lines.Add(psErro);
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
        if ( vsNoTabela <> '' ) and assigned(vQueryResult) then
           bbTabelas.visible := true;
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

procedure TfmErro.bbTabelasClick(Sender: TObject);
begin
    TfmRelacionamento.ShowRelation(vsNoTabela,vQueryResult);
end;

end.
