{  Programa:  Cad - Supertipo das Telas de Cadastro
   Descrição: E o form do qual os forms de cadastro herdam suas caracteristicas
              principais, tem o comportamento padrão já codificado, com as rotinas
              de autorização de acesso inclusão, exclusão, alteração, pesquisas etc.,
              sempre em conjunto com o fmMDI.

   Observações: o altura(heigth) ideal da grid de pesquisa, é calculado pela formula :

                H := (x * 18) + 21 [+23]

                onde: H = altura da grid
                      x = numero de linhas de detalhe

Alterações:

********************************************************************************
*** Programa:  CAD                                                           ***
*** Autor:                                                                   ***
*** Data:                                                                    ***
*** Descrição:                                                               ***
********************************************************************************
********************************************************************************
***              HISTORICO MANUTENCAO DA PROCEDURE                           ***
*** ------------------------------------------------------------------------ ***
***  Release/RP  : 59 - Projeto Gap Nível de Gastos - Fase 1                 ***
***  Analista    : Rodrigo Oriola                                            ***
***  Alteracao   : 11/03/2014                                                ***
***  Comentarios : Inclusão da nova Tela "Regra Nível de Gastos (PRE268MA)"  ***
***                na Dupla Custódia nova.                                   ***
*******************************************************************************}
unit Cad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, StdCtrls, Buttons, DB, DBTables, Grids, DBGrids,
  Mask, DBCtrls, Dbiprocs, Menus, UTool2, uDeclara, CacheQuery, StrUtils,
  EDBNum, EDBEdBtn, EDBZero, EDBTime, EDBDate, LookUpEdit,Variants,
  DBLookUpEdit, CadVirtual, DeclaraType, DBGridPesquisa, ELibFnc, ToolWin,
  Typinfo,contnrs,modCOM002A, EFocCol, ImgList, {htmlhelpapi,} JvExStdCtrls,
  JvBehaviorLabel, JvExControls, JvAnimatedImage, JvGIFCtrl, MemDS, DBAccess,
  ADODB{, WinSkinData} ;

type
  TfmCad = class(TfmCadVirtual)
    pcGeral: TPageControl;
    tsDetalhe: TTabSheet;
    paPrincipal: TPanel;
    dsDetalhe: TDataSource;
    pmAtalho: TPopupMenu;
    Ins: TMenuItem;
    Del: TMenuItem;
    Alt: TMenuItem;
    Gra: TMenuItem;
    Can: TMenuItem;
    Pro: TMenuItem;
    Prior: TMenuItem;
    Next: TMenuItem;
    NextPage: TMenuItem;
    PriorPage: TMenuItem;
    tsGeral: TTabSheet;
    grdMain: TDBGridPesquisa;
    qyMain: TCacheQuery;
    Refresh: TMenuItem;
    stBar: TStatusBar;
    paBotoes: TPanel;
    tbNavegacao: TToolBar;
    sbFirst: TSpeedButton;
    sbPrior: TSpeedButton;
    sbNext: TSpeedButton;
    sbLast: TSpeedButton;
    ToolButton2: TToolButton;
    tbManutencao: TToolBar;
    tbFuncoes: TToolButton;
    miHelp: TMenuItem;
    paNoForm: TPanel;
    paSeparador1: TPanel;
    paFiltro: TPanel;
    psShortCut: TPageScroller;
    paShortCut: TPanel;
    dsMain: TDataSource;
    ToolBar1: TToolBar;
    sbInsert: TSpeedButton;
    sbDelete: TSpeedButton;
    sbEdit: TSpeedButton;
    sbPost: TSpeedButton;
    sbCancel: TSpeedButton;
    sbRefresh: TSpeedButton;
    sbFind: TSpeedButton;
    sbHelp: TSpeedButton;
    pmHelp: TPopupMenu;
    miOqueisto: TMenuItem;
    sbPrint: TSpeedButton;
    paDetalhe: TPanel;
    paSeparador2: TPanel;
    dsAuxiliar: TDataSource;
    PAguarde: TPanel;
    JvGIFAnimator1: TJvGIFAnimator;
    JvBehaviorLabel1: TJvBehaviorLabel;
    procedure dsMainStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure pcGeralChange(Sender: TObject);virtual;
    procedure PriorPageClick(Sender: TObject);
    procedure NextPageClick(Sender: TObject);
    procedure grdMainKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure grdMainDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure dsMainDataChange(Sender: TObject; Field: TField);
    procedure ProFindAfterClick(Sender: TObject; var Return: String);
    procedure InsertRec(Sender : TObject);virtual;
    procedure EditRec(Sender : TObject);virtual;
    procedure PostRec(Sender : TObject);virtual;
    procedure CancelRec(Sender : TObject);virtual;
    procedure DelRec(Sender : TObject);virtual;
    procedure FindRec(Sender : TObject);virtual;
    procedure HelpRec(Sender : TObject);virtual;
    procedure RefreshRec(Sender : TObject);virtual;
    procedure PriorRec(Sender : TObject);
    procedure FirstRec(Sender : TObject);
    procedure NextRec(Sender : TObject);
    procedure LastRec(Sender : TObject);
    procedure tbFuncoesClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure qyMainRefresh(Sender: TObject; DataSetState: TDataSetState);
    procedure miOqueistoClick(Sender: TObject);
    procedure grdMainMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure qyMainTransaction(Sender: TObject;
      DataSetState: TDataSetState);
    procedure qyMainDelTransaction(Sender: TObject);
    function Carrega_Campos:boolean;
  private
    { Private declarations }
    vsFiltro_Selecao : string;
    vsRetorno_Pesquisa:Tstrings;
    FFormPesquisa : string;
    procedure InicializaControles;
    procedure Carrega_Definicao_Campos;
    procedure CriaBotoesAtalho;
    function  Existe_Chamada(psCdPrograma,psCdPrograma_Chamado:string; var psNoChamada:string):boolean;
    procedure Carrega_Default;
    function  F_DataField(Sender : TOBject) : string;
    procedure Retorno_Pesquisa(Sender: TObject);
    procedure Grava_Log_Manutencao(psTpManutencao : String;pbManuntencaoPendente : boolean);
    procedure Grava_Log_Manutencao_Detalhe(psTpManutencao : String;pbManuntencaoPendente : boolean; viNrOrdem: integer; vDataSet: TDataSet);
    function Verifica_Alteracoe_Pendentes_Log:boolean;
  protected
    vaCampos : TaCampos;
    vbTelaPermiteEdicao : boolean;
    vbTelaPermiteInclusao : boolean;
    vbTelaPermiteExclusao : boolean;
    // indica se a tela permite manutenção mesmo que o sistema esteja
    // em modo consulta ( App_modo_consulta  = true )
    vbManutencaoModoConsulta : boolean;
    vrPrograma : TReg_Programa;
    procedure SetMaxLength;
    function  F_DataComponent(psNoCampo : String; Owner : TComponent) : TControl;
    procedure Prepara_Exibicao;override;
    function CheckRequired: Boolean;
    procedure HabilitaBotoesAtalhos;
    procedure HabilitaBotoes;
    procedure Atualizar_Menu_Principal;
    procedure Atualizar_Atalhos_Menu_Principal;
    function Campos_Chave : string;
    procedure Refresh_qyMain;
    procedure Refresh_qyAuxiliar;
  public
    { Public declarations }
    Primeira : Boolean;
    ControlActive : TWinControl;
    SQLOriginal : TStrings;
    procedure Checar_Status_Sistema;
    procedure Descricao_Campo(psNoCampo : String; var psDescricao:String);virtual;
    procedure Valor_Campo(psNoCampo : String; pValue : Variant ; var psValor : String;var psDsValor: String);virtual;
  published
    property FormPesquisa : string read FFormPesquisa write FFormPesquisa;
  end;

var
  fmCad: TfmCad;

implementation

uses {mdi,} uTool, dberro{, ModPrincipal}, modCOM003L, dtmPrincipal;

var vrManutencao_Blob : TReg_Manutencao_Blob;
    vbCampo_alterado : Boolean;
    viCdLog_manutencao: Integer;
    vsAuxiliar: String;

{$R *.DFM}

function TfmCad.Carrega_Campos:boolean;
var i : integer;
    vControl : TControl;
begin
  PAguarde.Top:= (grdMain.Height div 2) - (PAguarde.Height div 2);
  PAguarde.Left:= (grdMain.Width div 2) - (PAguarde.Width div 2);
  PAguarde.Visible:=TRUE;
  PAguarde.Repaint;
  carrega_definicao_campos;
  // Desabilita campos do Array de Defaults q nao podem ser alterados
  for i := low(vaDefault) to high(vaDefault) do
  begin
    if ( not vaDefault[i].Alteravel ) then
    begin
      vControl := F_DataComponent(vaDefault[i].NoCampo , self);
      if Assigned(vControl) then
        vControl.enabled := false;
    end;
  end;
  SetMaxLength;
  Carrega_Campos:=TRUE;
  Primeira:=false;
  PAguarde.Visible:=FALSE;
end;

procedure TfmCad.FormCreate(Sender: TObject);
var i : integer;
begin
  Top := ciMargem_MDI;
  Left := 2;

  Primeira := True;
  vbTelaPermiteEdicao := true;
  vbTelaPermiteInclusao := true;
  vbTelaPermiteExclusao := true;
  vbManutencaoModoConsulta := false;
  
  vsFiltro_Selecao := '';
  FFormPesquisa := '';
  pcGeral.ActivePage := tsGeral;

  if ControlActive = nil then
     ControlActive := pcGeral;

  SQLOriginal := TStringList.Create;
  SQLOriginal.Assign(qyMain.SQL);

  //Dimensiona Panels da Status bar
  for i := 0 to ( stbar.Panels.Count - 1 ) do
    stbar.Panels[i].Width := trunc(( stbar.Width / stbar.Panels.Count));

  vsRetorno_Pesquisa:=TstringList.Create;
end;

procedure TFmCad.Prepara_Exibicao;
var vbFiltro_Obrigatorio : boolean;
    vsCdPrograma : String;
begin
  //Retirar
  Checar_Status_Sistema;

  //Tratamento de Programa lógico / Fisico
  vsCdPrograma :=ValorParametro('CDPROGRAMA_LOGICO','');
  if (vsCdPrograma = '' )then
    vsCdPrograma := Copy(ClassName, 4, Length(ClassName));

  //Aqui
  //if dmCOM002A.Autorizacao_Programa( vsCdPrograma, vrPrograma ) then
  if True then
  begin
    self.caption := vrPrograma.NOPROGRAMA + '  ('+ vrPrograma.CDPROGRAMA+')';
    paNoForm.caption := vrPrograma.NOPROGRAMA ;
  end
  else
    paNoForm.caption := self.caption ;

  // Cria os botoes de atalho baseado no menu ppShortCut
  CriaBotoesAtalho;

//  carrega_definicao_campos;

  InicializaControles;

  // Cria os titulos passados pela rotina addtitulo
  CriaTitulo(paFiltro,tsCad);
  Prepara_Grid(grdMain);

  qymain.close;

  // Insere Filtros no select da query principal
  Filtrar(qymain);

  vbFiltro_Obrigatorio := ( not Tem_Filtro ) and sntoboolean(vrPrograma.SNFILTRO_OBRIGATORIO) ;
  //se a tela tem filtro obrigatorio ou vem somente para inclusao
  //não deve selecionar nenhum registro
  if vbFiltro_Obrigatorio or (self.Status = csInclusao)  then
  begin
    insertfilter(qyMain,'1 = 2');
  end;

  try
    qymain.SQL.Text   := Trim(StringReplace(qymain.SQL.Text, #$D#$A, ' ', [rfReplaceAll]));
    qymain.Open;

  except
    on e : exception do
    begin
      if(AppModo_Debug) and ( e is eDBEngineError) then
        TfmErro.showError( self, e, 'Erro abrindo qyMain '+chr(13)+chr(10)+qyMain.sql.text )
      else
        TfmErro.showError( self, e, 'Erro buscando registros do Formulario' );
    end;
  end;

  if qyMain.active then // se nao houve problema de abertura da query
  begin
    if (self.Status = csInclusao) then
    begin
      if vbTelaPermiteInclusao then
      begin
        if(vbManutencaoModoConsulta or (not AppModo_Consulta)) then
          InsertRec(Self)
        else
          showmessage(AppMsgModo_Consulta);
      end
      else
        showmessage('Tela não permite Inclusão!');
    end
    else
    if vbFiltro_Obrigatorio then
    begin
      if FormPesquisa <> '' then
        findrec(self)
      else
      begin
        showmessage('A tela exige que seja filtrada, mas não foi criada nenhuma tela de filtro. (TfmCad.prepara_exibicao)');
        modalresult := mrCancel;
      end
    end
    else
    if ( qymain.RecordCount = 0 ) and
       ( vbTelaPermiteInclusao ) and
       ( vbManutencaoModoConsulta or (not AppModo_Consulta))   and
       ( Application.MessageBox( 'Nenhum registro encontrado, deseja incluir?', 'Inclusão',
                                  MB_YESNO + MB_DEFBUTTON1+MB_ICONQUESTION ) = IDYES       ) then
    begin
      InsertRec(Self);
    end;
  end;

{  // Desabilita campos do Array de Defaults q nao podem ser alterados
  for i := low(vaDefault) to high(vaDefault) do
  begin
    if ( not vaDefault[i].Alteravel ) then
    begin
      vControl := F_DataComponent(vaDefault[i].NoCampo , self);
      if Assigned(vControl) then
        vControl.enabled := false;
    end;
  end;

  SetMaxLength;}

end;

procedure TfmCad.grdMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    vk_return :
      if Status in [ csPesquisa, csInclusao ] then
      begin
        ModalResult := mrOk;
        Close;
      end
      else
      begin
        pcGeral.ActivePage := tsDetalhe;
        pcGeralChange(Self);
      end;
    vk_Insert : InsertRec(Self);
    vk_Delete : DelRec(Self);
  end;
end;

procedure TfmCad.grdMainDblClick(Sender: TObject);
begin
  if status in [csInclusao,  csPesquisa] then
  begin
    ModalResult := mrOk;
    Close;
  end
  else
  begin
    pcGeral.ActivePage := tsDetalhe;
    pcGeralChange(Self);
  end;
end;

procedure TfmCad.pcGeralChange(Sender: TObject);
begin
  if ( pcGeral.ActivePage = tsDetalhe ) then
  begin
    dsDetalhe.Enabled := true;
    if ControlActive.canFocus then
      ActiveControl := ControlActive
    else
      ActiveControl := FindNextControl(ControlActive,true, true, false);
  end
  else
  begin
    dsDetalhe.Enabled := false;
    if ( pcGeral.ActivePage = tsGeral ) then
      ActiveControl := grdMain;
  end;
end;

procedure TfmCad.dsMainDataChange(Sender: TObject; Field: TField);
var sAux : string;
    vfiCampo : TField;
begin
  if dsMain.DataSet.State = dsBrowse then
  begin
    with TDataSource(Sender).Dataset.fields do
    begin
      //Data de Inclusão
      sAux := '';
      vfiCampo := findField('CDOPERADOR_INCLUSAO');
      if vfiCampo <> nil then
        sAux := ' Inclusão : '+vfiCampo.asstring ;

      vfiCampo := findField('DTINCLUSAO');
      if ( vfiCampo <> nil ) and not (vfiCampo.isNull )then
        sAux := sAux + ' - ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', vfiCampo.asDateTime);

      stBar.Panels.Items[0].Text := sAux;

      //data de Alteração
      sAux := '';

      vfiCampo := findField('CDOPERADOR_ALTERACAO');
      if vfiCampo <> nil then
        sAux := ' Alteração : '+vfiCampo.asstring ;

      vfiCampo := findField('DTALTERACAO');
      if ( vfiCampo <> nil ) and not (vfiCampo.isNull )then
        sAux := sAux + ' - ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', vfiCampo.asDateTime);

      stBar.Panels.Items[1].Text := sAux;
      //
    end;
  end;
  if(field = nil)then
  begin
    if (assigned(dsAuxiliar.DataSet)) and
       (not (dsAuxiliar.DataSet.state in [ dsInsert, dsEdit ] ) ) then
    begin
      refresh_qyAuxiliar;
    end;
  end;

end;

procedure TfmCad.dsMainStateChange(Sender: TObject);
var //hMenuHandle : HMENU;
    vbEdicao : boolean;
    i:integer;
begin

  if (csDestroying in Self.ComponentState) then Exit;

  vbEdicao := ( dsMain.State in [dsInsert, dsEdit]);

  // Desabilita o botão de Saida do form
{  hMenuHandle := GetSystemMenu(Handle, FALSE);
  if ( TDataSource(Sender).State in [dsInsert,dsEdit] ) AND (hMenuHandle <> 0) then
    EnableMenuItem(hMenuHandle, SC_CLOSE, MF_BYCOMMAND or MF_GRAYED)
  else
    EnableMenuItem(hMenuHandle, SC_CLOSE, MF_BYCOMMAND or MF_ENABLED);}
  //

  //Define as paginas visiveis do pcGeral
  for I := 0 to pcGeral.PageCount - 1 do
  begin
    if pcGeral.Pages[I].Tag = 1 then
      pcGeral.Pages[I].TabVisible := not vbEdicao;
  end;

  if ( vbEdicao ) then
   begin
    if Primeira then Carrega_Campos;
    pcGeral.ActivePage := tsDetalhe
   end
  else
    pcGeral.ActivePage := tsGeral;

  pcGeralChange(Self);
  //

  HabilitaBotoesAtalhos;
  HabilitaBotoes;

  if (TDataSource(Sender).State = dsInsert) then
  begin
    if (assigned(dsAuxiliar.DataSet))then
    begin
      dsAuxiliar.DataSet.Insert;
    end;
    Carrega_Default;
    Carrega_Campo( dsMain.Dataset,'CDOPERADOR_INCLUSAO',AppSysOper, true);
    //Aqui
    //Carrega_Campo( dsMain.Dataset,'DTINCLUSAO',dmPrincipal.Data_Sistema, true);
    Carrega_Campo( dsMain.Dataset,'DTINCLUSAO', Date, true);
    if (assigned(dsAuxiliar.DataSet))then
    begin
      Carrega_Campo( dsAuxiliar.Dataset,'CDOPERADOR_INCLUSAO',AppSysOper, true);
      //Aqui
      //Carrega_Campo( dsAuxiliar.Dataset,'DTINCLUSAO',dmPrincipal.Data_Sistema, true);
      Carrega_Campo( dsAuxiliar.Dataset,'DTINCLUSAO', date, true);
    end;
  end;

  if vbEdicao then
  begin
    if (assigned(dsAuxiliar.DataSet))then
    begin
      dsAuxiliar.DataSet.Edit;
    end;
    Carrega_Campo( TDataSource(Sender).Dataset,'CDOPERADOR_ALTERACAO',AppSysOper, true);
    if (assigned(dsAuxiliar.DataSet))then
    begin
      Carrega_Campo( dsAuxiliar.Dataset,'CDOPERADOR_ALTERACAO',AppSysOper, true);
    end;
  end;

end;

procedure TfmCad.Carrega_Default;
var i : integer;
    vField : TField;
begin
  vField := nil;
  //Carrega defaults recebidos por parametro ( addDefault)
  for i := low(vaDefault) to high(vaDefault) do
  begin
    if dsMain.Dataset.fieldbyname(vaDefault[i].NoCampo).isNull then
      dsMain.Dataset.fieldbyname(vaDefault[i].NoCampo).asstring := vaDefault[i].Valor;
  end;
  //Carrega Defaults da Tabela de Catalogo
  for i := low(vaCampos) to high(vaCampos) do
  begin
     if ( vaCampos[i].TXVALOR_PADRAO <> '') Then
     begin
       if (vaCampos[i].NOTABELA = vrPrograma.NOTABELA) then
       begin
         vField := dsMain.Dataset.FindField(vaCampos[i].NOCAMPO)
       end
       else
       if Assigned(dsAuxiliar.Dataset) and dsAuxiliar.Dataset.Active and
          Assigned(dsAuxiliar.Dataset.FindField(vaCampos[i].NOCAMPO)) then
       begin
         vField := dsAuxiliar.Dataset.FindField(vaCampos[i].NOCAMPO)
       end;

       if (assigned(vField) and (vField.asstring = '')) then
         vField.asstring := vaCampos[i].TXVALOR_PADRAO;
     end;
  end;
end;

procedure TfmCad.FormClose(Sender: TObject;var Action: TCloseAction);
begin
  inherited;
  try
    if ( dsMain.DataSet <> nil ) and ( dsMain.DataSet.State in [dsInsert, dsEdit] ) then
    begin
      if Application.MessageBox( 'Existem informações sem Gravar. Deseja gravar antes de Sair?',
                                 'Gravação', MB_YESNO + MB_DEFBUTTON1+MB_ICONQUESTION ) = IDYES then
      begin
        PostRec(Sender);
        // Se não foi possivel gravar, não fecha
        if (dsMain.State in [dsInsert, dsEdit]) then
        begin
          Action := caNone;
          Exit;
        end;
      end;
    end;
    Action := caFree;
    vsRetorno_Pesquisa.Free;
    // Gera Retorno
    if Assigned(Retorno) and ( ModalResult = mrOk ) then
      Carrega_QueryResult(TADOQuery(dsMain.Dataset), Retorno);
  except
    on E : Exception do
    begin
      Action := caNone;
      TfmErro.showError( self, e, 'Erro Fechando o Formulario' );
    end;
  end;
end;

procedure TfmCad.PriorPageClick(Sender: TObject);
begin
  pcGeral.ActivePage := pcGeral.FindNextPage(pcGeral.ActivePage,False,True);
  self.pcGeralChange(Self);
end;

procedure TfmCad.NextPageClick(Sender: TObject);
begin
  pcGeral.ActivePage := pcGeral.FindNextPage(pcGeral.ActivePage,True,True);
  self.pcGeralChange(Self);
end;

procedure TfmCad.InsertRec(Sender : TObject);
var vbOk:boolean;
begin
  vbOk:=true;

  if sbInsert.enabled then
  begin
    //VALIDA DUPLA CUSTODIA
    if(vrPrograma.CDPROGRAMA = 'PRE009MA')or(vrPrograma.CDPROGRAMA = 'PRE010MA')or
      (vrPrograma.CDPROGRAMA = 'PRE011MA')or(vrPrograma.CDPROGRAMA = 'PRE110MA')or
      (vrPrograma.CDPROGRAMA = 'PRE268MA')or(vrPrograma.CDPROGRAMA = 'PRE039MA')then
    //Aqui
    //if DmPrincipal.Valida_Dupla_Custodia('161C', false) = 2 then
    if True then
     begin
       showmessage('Operador não tem perfil para inclusão!');
       vbOk:= false;
     end;

    if( Sntoboolean(vrPrograma.SNPROGRAMA_SISTEMA)and
        Sntoboolean(AppOperAdmin) and not(AppModo_Debug))then
    begin
      vbOk:=application.MessageBox('Programa de sistema, Confima inclusão ? ',
                                   'Programa de sistema',MB_OKCANCEL + MB_DEFBUTTON1) = idOk;
    end;

    if(vbOk)then
    begin
      try
        pcGeral.SetFocus;
        dsMain.Dataset.Insert;
      except
        on E : Exception do
        begin
          TFmErro.showError( self, e );
          qyMain.cancel;
        end;
      end;
    end;
  end;
end;

procedure TfmCad.EditRec(Sender : TObject);
var vbOk:boolean;
begin
  vbOk:=true;

  if sbEdit.Enabled then
  begin
    //VALIDA DUPLA CUSTODIA
    if(vrPrograma.CDPROGRAMA = 'PRE009MA')or(vrPrograma.CDPROGRAMA = 'PRE010MA')or
      (vrPrograma.CDPROGRAMA = 'PRE011MA')or(vrPrograma.CDPROGRAMA = 'PRE110MA')or
      (vrPrograma.CDPROGRAMA = 'PRE268MA')or(vrPrograma.CDPROGRAMA = 'PRE039MA')then
    if True then
    //if DmPrincipal.Valida_Dupla_Custodia('161C', false) = 2 then
     begin
      showmessage('Operador não tem perfil para alteração!');
      vbOk:= false;
     end;

    //verifica se existem alteracoes pendentes no log
    if(vbOk)and(sntoBoolean(vrPrograma.SNGRAVA_LOG_MANUTENCAO))and (Verifica_Alteracoe_Pendentes_Log)then
    begin
      ShowMessage('Existem manutenções pendentes para esse registro');
      vbOk:= false;
    end;

    if(vbOk)and(Sntoboolean(vrPrograma.SNPROGRAMA_SISTEMA)and
                Sntoboolean(AppOperAdmin) and not(AppModo_Debug))then
    begin
      vbOk:=application.MessageBox('Programa de sistema, Confima alteração ? ',
                                   'Programa de sistema',MB_OKCANCEL + MB_DEFBUTTON1) = idOk;
    end;

    if(vbOk)then
    begin
      try
        dsMain.DataSet.Edit;
      except
        on E : Exception do
        begin
          TFmErro.showError( self, e  );
          dsMain.DataSet.cancel;
        end;
      end;
    end;
  end;
end;

procedure TfmCad.DelRec(Sender : TObject);
var vQueryResult : TStrings;
    vbOk, vbConfirma, vbConfirmacaoExclusao, vbTransacao : boolean;
begin
  vbOk:=true;
  vbConfirma:=true;
  vbConfirmacaoExclusao := false;
  vbTransacao := false;
  if sbDelete.enabled then
  begin
    //VALIDA DUPLA CUSTODIA
    if(vrPrograma.CDPROGRAMA = 'PRE009MA')or(vrPrograma.CDPROGRAMA = 'PRE010MA')or
      (vrPrograma.CDPROGRAMA = 'PRE011MA')or(vrPrograma.CDPROGRAMA = 'PRE110MA')or
      (vrPrograma.CDPROGRAMA = 'PRE268MA')or(vrPrograma.CDPROGRAMA = 'PRE039MA')then
    if True then
    //if DmPrincipal.Valida_Dupla_Custodia('161C', false) = 2 then
     begin
      showmessage('Operador não tem perfil para exclusão!');
      vbOk:= false;
     end
    else
     begin
      if(vrPrograma.CDPROGRAMA = 'PRE009MA')or(vrPrograma.CDPROGRAMA = 'PRE010MA')or
        (vrPrograma.CDPROGRAMA = 'PRE011MA')or(vrPrograma.CDPROGRAMA = 'PRE110MA')or
      (vrPrograma.CDPROGRAMA = 'PRE268MA')or(vrPrograma.CDPROGRAMA = 'PRE039MA')then
      if True then
      //if DmPrincipal.Valida_Dupla_Custodia('161C', false) <> 0 then
        begin
         vrPrograma.SNGRAVA_LOG_MANUTENCAO := 'S';
         vrPrograma.SNCONFIRMACAO_INCLUSAO := 'S';
         vrPrograma.SNCONFIRMACAO_ALTERACAO := 'S';
         vrPrograma.SNCONFIRMACAO_EXCLUSAO := 'S';
        end;
     end;

    //verifica se existem alteracoes pendentes no log
    if(vbOk)and(sntoBoolean(vrPrograma.SNGRAVA_LOG_MANUTENCAO))and (Verifica_Alteracoe_Pendentes_Log)then
    begin
      ShowMessage('Existem manutenções pendentes para esse registro');
      vbOk:= false;
    end;

    //Entra na aba de detalhe para exibir as descriçõe
    if(vbOk)and( Sntoboolean(vrPrograma.SNPROGRAMA_SISTEMA)and
                 Sntoboolean(AppOperAdmin) and not(AppModo_Debug))then
    begin
      vbOk:=application.MessageBox('Programa de sistema, Confima exclusão ? ',
                                   'Programa de sistema',MB_OKCANCEL + MB_DEFBUTTON1) = idOk;
      vbConfirma:=false;
    end;

    if(vbOk)then
    begin
      try
        vbOk:= true;
        if(vbConfirma )then
          vbOk:= Application.MessageBox( 'Deseja Excluir Registro?', 'Exclusão',
                                    MB_YESNO + MB_DEFBUTTON1+MB_ICONQUESTION ) = IDYES;
        if(vbOk) then
        begin
          //se nao tiver uma transacao aberta e for gravar log, inicia uma transacao
          if ( not dmPrincipal.con.InTransaction ) and
             (sntoboolean(vrPrograma.SNGRAVA_LOG_MANUTENCAO)) then
          begin
             dmPrincipal.con.BeginTrans;
             vbTransacao := true;
          end;

          //Verifica se grava log de manutencao e
          //se tem confirmacao de exclusao (Dupla Custodia)
          if (sntoboolean(vrPrograma.SNGRAVA_LOG_MANUTENCAO)) then
          begin
             //entra na página geral, para carregar as descrições nos findedits,
             //para serem gravados
             pcGeral.ActivePage := tsDetalhe;
             pcGeralChange(Self);
             vbConfirmacaoExclusao := sntoboolean(vrPrograma.SNCONFIRMACAO_EXCLUSAO);
             Grava_Log_Manutencao(csTpManutencao_Exclusao,vbConfirmacaoExclusao);
          end;
          //se tem confirmacao de exclusao nao efetiva a exclusao
          if (vbConfirmacaoExclusao) then
          begin
            showmessage('A exclusão está sujeita à confirmação, e será efetivada após aprovação.');
            Refresh_qyMain;
          end
          else
          begin
             dsMain.DataSet.Delete;
          end;
          //se tiver inciado uma transacao, faz o commit
          if (vbTransacao) then
          begin
             dmPrincipal.con.CommitTrans;
          end;

        end

      except
        on e:exception do
        begin
          vQueryResult := TStringList.Create;
          Carrega_QueryResult(TADOQuery(dsMain.Dataset), vQueryResult);
          if (vbTransacao) and
             (dmPrincipal.con.InTransaction) then
          begin
             dmPrincipal.con.RollbackTrans;
          end;
          TFmErro.showerror( self, e,'',vrPrograma.noTabela,vQueryResult );
        end;
      end;
    end;
  end;
end;

procedure TfmCad.PostRec(Sender : TObject);
var i, x, y, vNrOrdem : integer;
    vbConfirmacao, vbTransacao, vGravaMem, vDuplaPerfil : boolean;
    vsTpManutencao, vTable : String;
    StrFields: TStrings;
    vList : TStringList;
    p:TCacheQuery;
begin
  vbConfirmacao := false;
  vbTransacao := false;
  vDuplaPerfil := false;
  vsAuxiliar := '';

  if sbPost.enabled then
  begin
     Perform(WM_NEXTDLGCTL,0,0);  // Passa o foco para o proximo componente ( forca a atualizacao do campo atual )

    if(vrPrograma.CDPROGRAMA = 'PRE009MA')or(vrPrograma.CDPROGRAMA = 'PRE010MA')or
      (vrPrograma.CDPROGRAMA = 'PRE011MA')or(vrPrograma.CDPROGRAMA = 'PRE110MA')or
      (vrPrograma.CDPROGRAMA = 'PRE268MA')or(vrPrograma.CDPROGRAMA = 'PRE039MA')then
    //if DmPrincipal.Valida_Dupla_Custodia('161C', false) <> 0 then
      begin
       vrPrograma.SNGRAVA_LOG_MANUTENCAO := 'S';
       vrPrograma.SNCONFIRMACAO_INCLUSAO := 'S';
       vrPrograma.SNCONFIRMACAO_ALTERACAO := 'S';
      end;

     if not CheckRequired then
     begin
        try
          // carrega as sequencias
          if dsmain.state = dsInsert then
          begin
              for i := low(vaCampos) to high(vaCampos) do
              begin
                 if vaCampos[i].NOSEQUENCIA <> '' then
                 begin
                    dsMain.Dataset.fieldbyname(vaCampos[i].NOCAMPO).asFloat := dmPrincipal.nextVal(vaCampos[i].NOSEQUENCIA);
                 end;
              end;
          end;
          //se nao tiver uma transacao aberta e for gravar log, inicia uma transacao

          if ( not dmPrincipal.con.InTransaction ) and
             ( sntoboolean(vrPrograma.SNGRAVA_LOG_MANUTENCAO) ) then
          begin
             dmPrincipal.con.BeginTrans;
             vbTransacao := true;
          end;
          //Verifica se grava log de manutencao e se tem confirmacao (Dupla Custodia)
          if (sntoboolean(vrPrograma.SNGRAVA_LOG_MANUTENCAO)) then
          begin
             if (dsmain.state = dsInsert) then
             begin
               vbConfirmacao := sntoboolean(vrPrograma.SNCONFIRMACAO_INCLUSAO);
               vsTpManutencao := csTpManutencao_Inclusao;
             end
             else
             if (dsmain.state = dsEdit) then
             begin
               vbConfirmacao  := sntoboolean(vrPrograma.SNCONFIRMACAO_ALTERACAO);
               vsTpManutencao := csTpManutencao_Alteracao;
             end;
             //
             if (Verifica_Alteracoe_Pendentes_Log) then
             begin
                MessageBox(self.Handle,'Existem manutenções pendentes para esse tipo de registro, que devem ser confirmadas','Manutenção Pendente',mb_iconerror);
               dmPrincipal.con.RollbackTrans;
                Refresh_qyMain;
                exit;
             end else
              begin
               viCdLog_manutencao:=0;
               Grava_Log_Manutencao(vsTpManutencao, vbConfirmacao);
               vNrOrdem := 3;
               for x:=(ComponentCount - 1)downto 0 do
                begin
                  if(Components[x].ClassType = TCacheQuery)then
                   begin
                    if(TCacheQuery(Components[x]).Name <> 'qyMain')then
                     begin
                      p:= FindComponent(TCacheQuery(Components[x]).Name) as TCacheQuery;
                      if(p.State = dsEdit)or(p.State = dsInsert)then
                       begin
                        StrFields:= p.GetCacheFields;

                        dmCOM003L.JvMemData.Close;
                        dmCOM003L.JvMemData.EmptyTable;
                        dmCOM003L.JvMemData.Open;

                        for y := StrFields.Count - 1 downto 0 do
                          begin
                           vList := TStringList.Create;
                           vList.Delimiter:= ';';
                           vList.DelimitedText:=StrFields[y];
                           vGravaMem:=false;

                           //VALIDA SE TABELA É DIFERENTE DA AUXILIAR
                           if(vsAuxiliar <> vList[0])then
                            begin
                             //SE FOR CHAVE CARREGA DADO
                             if(vList[3] = '0')then
                              begin
                                p.FieldByName(vList[1]).Value := qyMain.FieldByName(vList[1]).Value;
                              end;


                             //VALIDA SE CAMPO FOI ALTERADO OU INCLUIDO
                             if(p.State = dsEdit)then
                              begin
                               if(p.FieldByName(vList[1]).NewValue <> p.FieldByName(vList[1]).OldValue)then
                                vGravaMem := true;
                                vsTpManutencao := csTpManutencao_Alteracao;
                              end
                             else
                             if(p.State = dsInsert)then
                              begin
                               if not(p.FieldByName(vList[1]).isNull)then
                                vGravaMem := true;
                                vsTpManutencao := csTpManutencao_Inclusao;
                              end;
                             if(vGravaMem)then
                              begin
                               dmCOM003L.JvMemData.Insert;
                               dmCOM003L.JvMemDataTABELA.Value := vList[0];
                               dmCOM003L.JvMemDataCAMPO.Value := vList[1];
                               dmCOM003L.JvMemDataCHAVE.Value := vList[3];
                               dmCOM003L.JvMemData.Post;
                              end;
                            end;
                          end;
                        if(dmCOM003L.JvMemData.RecordCount>0)then
                         begin
                          Grava_Log_Manutencao_Detalhe(vsTpManutencao, vbConfirmacao, vNrOrdem, p);
                          vNrOrdem:= vNrOrdem + 1;
                         end;
                       end;
                     end;
                   end;
                end;
              end;
          end;
          //se tem confirmacao nao efetiva a manutencao na tabela
          if (vbConfirmacao) then
          begin
            if (vbCampo_alterado) then
            showmessage('As manutenções estão sujeitas à confirmação, e serão aplicadas após aprovação.');
            Refresh_qyMain;
          end
          else
          begin
            dsMain.DataSet.Post;
          end;
          //se tiver inciado uma transacao, faz o commit
          if (vbTransacao) then
          begin
             dmPrincipal.con.CommitTrans;
          end;

          if status = csInclusao then
          begin
            ModalResult := mrOk;
            Close;
          end;
        except
           on e:Exception do
           begin
              if (vbTransacao) and
                 (dmPrincipal.con.InTransaction) then
              begin
                 dmPrincipal.con.RollbackTrans;
              end;
              TFmErro.showerror( self, e );
           end;
        end;
     end;
  end;
end;

procedure TfmCad.CancelRec(Sender : TObject);
begin
  if sbCancel.enabled then
  begin
    try
      if (assigned(dsAuxiliar.dataset)) then
        dsAuxiliar.dataset.Cancel;
      dsMain.DataSet.Cancel;
      if status = csInclusao then
      begin
        ModalResult := mrCancel;
        close;
      end;
    except
      on E : Exception do
        TFmErro.showError( self, e  );
    end;
  end;
end;

procedure TfmCad.FindRec(Sender : TObject);
var vsCampos_Chave : string;
begin
  if sbFind.Enabled then
  begin
    vsCampos_Chave := Campos_Chave;
    if (trim(vsCampos_Chave) = '') then
    begin
      if AppModo_Debug then
        showmessage('Não foi definida chave para a tabela "'+vrPrograma.NOTABELA+'"')
      else
        showmessage('Não foi possivel abrir a pesquisa');
    end
    else
    begin
      with CriaForm(FormPesquisa,self) do
      begin
         passaTitulo(vatitulo);
         passaFiltro(vaFiltro);
         passaDefault(vaDefault);
         passaParametro(vaParametro);
         addParametro('CHAVE',vsCampos_Chave);
         addParametro('ALIAS',qyMain.tableAlias(vrprograma.NOTABELA));
         ExibeForm(self,csNormal,vsRetorno_Pesquisa,Retorno_Pesquisa);
      end;
    end;
  end;
end;

procedure TfmCad.HelpRec(Sender : TObject);
begin
  if sbHelp.enabled then
  begin
    //Aqui
//    HtmlHelpShowTopic(vsCdPrograma+'.htm');
    //HtmlHelpShowContents;
  end;
end;

procedure TfmCad.RefreshRec(Sender : TObject);

begin
  if sbRefresh.enabled then
  begin
    Refresh_qyMain;
  end;
end;

procedure TfmCad.Refresh_qyMain;
var vsCampos_Chave : string;
begin
  vsCampos_Chave := Campos_Chave;
  if ( trim(vsCampos_Chave) = '') then
  begin
    dsMain.DataSet.Close;
    dsMain.DataSet.Open;
  end
  else
    refreshQuery(qyMain,vsCampos_Chave);
  Refresh_qyAuxiliar;
end;

procedure TfmCad.Refresh_qyAuxiliar;
var vQuery : TQuery;
    i : integer;
begin
  if assigned(dsAuxiliar.DataSet) then
  begin
    vQuery := TQuery(dsAuxiliar.DataSet);
    vQuery.close;
    for i := 0 to vQuery.Params.Count -1 do
    begin
      vQuery.Params[i].DataType := dsMain.DataSet.fieldbyname(vQuery.Params[i].Name).DataType;
      vQuery.Params[i].Value := dsMain.DataSet.fieldbyname(vQuery.Params[i].Name).Value;
    end;
    vQuery.open;
  end;
end;

procedure TfmCad.PriorRec(Sender : TObject);
begin
  if sbPrior.Enabled then
  begin
    dsMain.DataSet.Prior;
  end;
end;

procedure TfmCad.FirstRec(Sender : TObject);
begin
  if sbFirst.enabled then
  begin
    dsMain.DataSet.First;
  end;
end;

procedure TfmCad.NextRec(Sender : TObject);
begin
  if sbNext.Enabled then
  begin
    dsMain.DataSet.Next;
  end;
end;

procedure TfmCad.LastRec(Sender : TObject);
begin
  if sbLast.enabled then
  begin
    dsMain.DataSet.Last;
  end;
end;

procedure TfmCad.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (pcGeral.Activepage = tsDetalhe) then
  begin
    if ( Key = vk_escape ) then
    begin
      if dsMain.Dataset.State in [ dsInsert, dsEdit ] then
         CancelRec(sender)
      else
      begin
        pcGeral.ActivePage := tsGeral;
        self.pcGeralChange(Self);
      end;
    end
    else
    // Passa o foco para o proximo componente
    if Key = vk_Return then
    begin
      // Se TLookUpEdit (TDBSearchEdit ou TDBFindEdit) verifica se algun item esta selecionado
      if ( ActiveControl is TLookUpEdit ) then
      begin
        if ( dsMain.State = dsBrowse ) or
           ( not TLookUpEdit(ActiveControl).isNull) then
        begin
          Perform(WM_NEXTDLGCTL,0,0);  // Passa o foco para o proximo componente
        end;
      end
      else
      if not (ActiveControl is TCustomMemo ) then
      begin
        Perform(WM_NEXTDLGCTL,0,0);  // Passa o foco para o proximo componente
      end;

    end;
  end
  else
  if (pcGeral.Activepage = tsGeral) then
  begin
    if ( Key = vk_escape ) then
    begin
      ModalResult := mrCancel;
      Close;
    end;
  end
  // outras paginas
  else
  begin
    if ( Key = vk_escape ) then
    begin
      pcGeral.ActivePage := tsGeral;
      self.pcGeralChange(Self);
    end
  end;
end;

procedure TfmCad.HabilitaBotoesAtalhos;
var I : Integer;
    vbHabilita_Botoes : boolean;
begin
  vbHabilita_Botoes := ( dsMain.State = dsBrowse         ) and
                       ( dsMain.Dataset.RecordCount <> 0 );
  // Habilita Botoes da Barra
  for I := 0 to paShortCut.ControlCount -1 do
  begin
     if ( paShortCut.Controls[I] is TSpeedButton ) and ( paShortCut.Controls[I].Visible ) then
        TSpeedButton(paShortCut.Controls[I]).Enabled := vbHabilita_Botoes;
  end;
  // Habilita Menu
  for I := 0 to pmAtalho.Items.Count -1 do
  begin
     if ( pmAtalho.Items[I].Visible ) then
        pmAtalho.Items[I].Enabled := vbHabilita_Botoes;
  end;

end;

{
  funcao: CheckRequired
  objetivo   : Verificar os campos obrigatórios, baseado na definicao do banco de dados
  retorno    : valor booleano, se verdadeiro todos os campos obrigatorios estao preenchidos
}
function TfmCad.CheckRequired : Boolean;
var
  I : Integer;
  vComp : Tcomponent;
  vsCampos,vsDescricaoCampo : String;
begin
  Result := False;
  vsCampos  := '';
  for i := low(vaCampos) to high(vaCampos) do
  begin
    vComp := F_DataComponent(vaCampos[i].NOCAMPO,self);

    if ( Assigned(vComp) ) and
       ( vaCampos[i].SNOBRIGATORIO = 'S')  and
       ( vaCampos[i].NOSEQUENCIA = '' ) then // Campos nao gerados automaticamente
    begin
       if ((vaCampos[i].NOTABELA = vrPrograma.NOTABELA) and
           (dsMain.DataSet.FieldByName(vaCampos[i].NOCAMPO).asString = '' ) ) or
          ((vaCampos[i].NOTABELA = vrPrograma.NOTABELA_AUXILIAR) and
           (dsAuxiliar.DataSet.FieldByName(vaCampos[i].NOCAMPO).asString = '' )  )then
       begin
         if ( vsCampos = '' ) then    // e o primeiro
         begin
            PoeFoco(TWinControl(vComp));
         end;
         Descricao_Campo(vaCampos[i].NOCAMPO,vsDescricaoCampo);
         addStrtolist(vsDescricaoCampo,vsCampos);
         Result := True;
       end;
    end;
  end;
  if Result = true then
  begin
     ShowMessage('Campo(s) de preenchimento obrigatório : ' + vsCampos );
  end;

end;

{
  Procedure SetMaxLength
  objetivo   : Define os limites de digitacao dos Componentes
}
procedure TfmCad.SetMaxLength;
var i       : integer;
    vComp : TComponent;
    vsMaxValue : string;
begin
  for i := low(vaCampos) to high(vaCampos) do
  begin
     vComp := F_DataComponent(vaCampos[i].NOCAMPO,self);
     if (vComp is TDBEdit ) or
        (vComp is TDBMemo ) or
        (vComp is TEvDBNumEdit ) then
     begin
        if vaCampos[i].CDTIPO_DADO = csCdDado_Numerico then
        begin
           TEdit(vComp).MaxLength := vaCampos[i].NRTAMANHO;
           if ( vComp is TEvDBNumEdit ) then
           begin
              TEvDBNumEdit(vComp).decimals := vaCampos[i].NRDECIMAIS;
              if ( vaCampos[i].NRDECIMAIS <> 0 ) then
                TEvDBNumEdit(vComp).MaxLength := TEvDBNumEdit(vComp).MaxLength + 1;
              vsMaxValue := strReplicate('9',vaCampos[i].NRTAMANHO-vaCampos[i].NRDECIMAIS) +
                            DecimalSeparator +
                            strReplicate('9',vaCampos[i].NRDECIMAIS);
              TEvDBNumEdit(vComp).maxValue := strtoFloat( vsMaxValue );
           end;
        end
        else
        if vaCampos[i].CDTIPO_DADO = csCdDado_Caracter then
        begin
           TEdit(vComp).MaxLength := vaCampos[i].NRTAMANHO;
        end;
     end;
  end;
end;

// Busca no banco de dados as definicoes dos campos da tabela em manutencao
// definicoes ( null, tipo, valor default etc.)
// Localiza os componentes de edicao de dados e associa aos campos
procedure TfmCad.carrega_definicao_campos ;
var i : integer;
    vLabel : TLabel;
    vControl : TControl;
begin
   i := 0;
   vaCampos := nil;
   // Carrega Definicao dos campos da Tabela de Catalogo
   with dmCOM002A.qyCampos do
   begin
      close;
      SQL.Clear;
      SQL.Add('SELECT');
      SQL.Add('       NOTABELA,');
      SQL.Add('       NOCAMPO,');
      SQL.Add('       DSCAMPO,');
      SQL.Add('       CDTIPO_DADO,');
      SQL.Add('       NRTAMANHO,');
      SQL.Add('       NRDECIMAIS,');
      SQL.Add('       SNOBRIGATORIO,');
      SQL.Add('       SNCHAVE_PRIMARIA,');
      SQL.Add('       NOSEQUENCIA,');
      SQL.Add('       CDTIPO_DOMINIO,');
      SQL.Add('       TXVALOR_PADRAO,');
      SQL.Add('       VLMINIMO,');
      SQL.Add('       VLMAXIMO');
      SQL.Add('FROM   CAMPO_TABELA.DBF');
      SQL.Add('WHERE  NOTABELA = :NOTABELA');
      SQL.Add('OR     NOTABELA = :NOTABELA_AUXILIAR');
      SQL.Add('ORDER BY NOTABELA');
//      parambyname('NOTABELA').asString := vrPrograma.NOTABELA;
//      parambyname('NOTABELA').asString := 'CAMPO_TABELA';
      //Mexer Aki
      parambyname('NOTABELA').asString := 'PROGRAMA_GRUPO';

      if (trim(vrPrograma.NOTABELA_AUXILIAR) <> '' ) then
        parambyname('NOTABELA_AUXILIAR').asString := vrPrograma.NOTABELA_AUXILIAR
      else
        begin
          parambyname('NOTABELA_AUXILIAR').DataType := ftString;
          parambyname('NOTABELA_AUXILIAR').Clear;
        end;

      open;
      if eof then
      begin
         showmessage('Não encontrada a definição dos campos da Tabela "'+vrPrograma.NOTABELA+'"');
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
//            vaCampos[i].TXOBSERVACAO     := fieldbyname('TXOBSERVACAO').asString ;

            vControl := F_DataComponent(vaCampos[i].NOCAMPO,self);

            //Associa o menu popup "o que é isto?" aos componentes
            if Assigned(vControl) and IsPublishedProp(vControl, 'PopupMenu') then
                  SetObjectProp(vControl, 'PopupMenu',pmHelp);

            vLabel := TLabel(self.FindComponent('la' + vaCampos[i].NOCAMPO));

            //Procura o campo na tela e muda a cor deste componente para "clNavy" (azul) se o campo for obrigatorio
            if vLabel <> nil then
            begin
               if SNtoboolean(vaCampos[i].SNOBRIGATORIO) then
                  vLabel.Font.color := clnavy;
            end
            else
            begin
               if (assigned(vControl) )and
                 ( vControl is TDBRadioGroup ) then
               begin
                 if SNtoboolean(vaCampos[i].SNOBRIGATORIO) then
                    TDBRadioGroup(vControl).Font.color := clnavy;
              end;
            end;

            inc(i);
            next;
         end;
      end;
      close;
   end;

end;


// Cria os botoes de Atalho que o usuario tem acesso
// baseado no Menu PopUp pmAtalho
procedure TfmCad.CriaBotoesAtalho;
var i,iLeft : integer;
    vmiMenu : TMenuItem;
    vsNoProgram,vsNoChamada : string;
    vsbAtalho : TSpeedButton;
    vrPrograma_Atalho : TReg_Programa;
    vbTemAtalho : Boolean;
begin
   iLeft := 2;
   vbTemAtalho := false;

   for i := 0 to ( pmAtalho.Items.Count -1 )do
   begin
     vmiMenu := pmAtalho.Items[i];
     if ( vmiMenu.visible ) then
     begin
        vsNoProgram := copy( vmiMenu.Name, 3,length(vmiMenu.Name));
        vsNoChamada :='';

        if True {(dmCOM002A.Autorizacao_Programa( vsNoProgram,vrPrograma_Atalho ))and
           (Existe_Chamada(vrPrograma.CDPROGRAMA,vsNoProgram,vsNoChamada))}  then
        begin
           vmiMenu.Enabled := true;

           if(vsNoChamada='')then
             vsNoChamada := vrPrograma_Atalho.NOPROGRAMA;

           vmiMenu.Caption := vsNoChamada + ' ('+vrPrograma_Atalho.CDPROGRAMA +')';

           if vrPrograma_Atalho.NRINDICE_ICONE = 0 then
              dmCOM002A.imIcones.GetBitmap(1,vmiMenu.bitmap)
           else
              dmCOM002A.imIcones.GetBitmap(vrPrograma_Atalho.NRINDICE_ICONE,vmiMenu.bitmap);

           vbTemAtalho := true;
           vsbAtalho := TSpeedButton.Create(self);
           with vsbAtalho do
           begin
              Flat := true;
              vsbAtalho.Name   := 'sb'+vsNoProgram;
              paShortCut.Width := paShortCut.Width + 80;
              vsbAtalho.parent  := paShortCut;
              //Tamanho e posicao do botao
              vsbAtalho.Width   := 42;
              vsbAtalho.Height  := paShortCut.Height - 2;
              vsbAtalho.top     := 1;
              vsbAtalho.left    := iLeft;
              iLeft := iLeft + vsbAtalho.Width;
              //  vsbAtalho.Hint := vrPrograma_Atalho.NOPROGRAMA +  ' <' + ShortCutToText(vmiMenu.ShortCut) + '>' ;
              vsbAtalho.Cursor := crHandPoint;

              vsbAtalho.Hint := vsNoChamada + ' ('+vrPrograma_Atalho.CDPROGRAMA+')';

              vsbAtalho.ShowHint := true;
              dmCOM002A.imIcones.GetBitmap(0,vsbAtalho.glyph);
//              dmCOM002A.imIcones.GetBitmap(vrPrograma_Atalho.NRINDICE_ICONE,vsbAtalho.glyph);
              vsbAtalho.LayOut := blGlyphTop;
              vsbAtalho.Spacing := -1;
              vsbAtalho.Caption := ShortCutToText(vmiMenu.ShortCut);
              vsbAtalho.Font.name := 'Small Fonts';
              vsbAtalho.Font.size := 7;
              vsbAtalho.Font.style := vsbAtalho.Font.style + [fsbold];
              //onclick
              vsbAtalho.onclick := vmiMenu.onclick;
           end;
        end
        else
        begin
           vmiMenu.Enabled := false;
           vmiMenu.visible := false;
        end;
     end;
   end;

   if vbTemATalho then
   begin
      iLeft := iLeft + 2;
      if iLeft > psShortCut.width then
         paShortCut.Width := ileft
      else
         paShortCut.Width := psShortCut.width;
   end
   else
   begin
      self.Height := self.Height - psShortCut.Height;
      psShortCut.Height := 0;
      tbFuncoes.enabled := false;
   end;
end;

function TfmCad.Existe_Chamada(psCdPrograma,psCdPrograma_Chamado:string; var psNoChamada:string):boolean;
//var qytmp:Tquery;
begin
{  result:=false;
  psNoChamada:='';
  qytmp:=dmPrincipal.CriaQuery('dbExterno');
  with qytmp do
  begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT NOCHAMADA FROM PROGRAMA_CHAMADA.DBF');
    Sql.Add('WHERE CDPROGRAMA = '+quotedstr(psCdPrograma));
    Sql.Add('AND   CDPROGRAMA_CHAMADO = '+quotedstr(psCdPrograma_Chamado));
    Open;
    if not eof then
    begin
      result:=true;
      psNoChamada:= fieldByName('NOCHAMADA').asstring;
    end
    else
      ShowMessage('Chamada para o programa "'+psCdPrograma_Chamado+'" não cadastrada');
  end;
  qytmp.Free;}
  result := true;
end;

procedure TfmCad.ProFindAfterClick(Sender: TObject; var Return: String);
begin
  vsFiltro_Selecao := return;
  with qyMain do
  begin
     close;
     sql.clear;
     sql.assign(SQLOriginal);
     insertfilter(qyMain,'( '+vsFiltro_Selecao+' )');
     open;
  end;
end;

procedure TfmCad.HabilitaBotoes;
var vbVazio  : Boolean;
    vbEdicao : Boolean;
    vbPermite_Manutencao : Boolean;
    vbPrograma_sistema : Boolean;
begin
//  vbPrograma_sistema := ( ( not Sntoboolean(vrPrograma.SNPROGRAMA_SISTEMA))or
//                          ( Sntoboolean(vrPrograma.SNPROGRAMA_SISTEMA) and Sntoboolean(AppOperAdmin)) );
//
//
//  vbVazio  := ( (dsMain.State = dsInactive ) or ( dsMain.Dataset.RecordCount = 0 ) );
//  vbEdicao := ( dsMain.State in [dsInsert, dsEdit]);
//  vbPermite_Manutencao := ((AppOperAdmin='S') or (vrPrograma.SNPROGRAMA_SISTEMA='N')) and
//                          (vbManutencaoModoConsulta or (not AppModo_Consulta));
// //
// if (vbPermite_Manutencao = false) and (vrPrograma.SNTELA_SEMPRE_ONLINE = 'S') then
//  begin
//     vbPermite_Manutencao := true;
//  end;
//  sbInsert.Enabled := (vbTelaPermiteInclusao) and (not vbEdicao) and (vrPrograma.snIncluir = 'S') and
//                      (vbPermite_Manutencao)  and (status <> csManutencao)and (status <> csConsulta) and
//                      (dsMain.State <> dsInactive)and (vbPrograma_sistema);
//
//  sbEdit.Enabled   := (vbTelaPermiteEdicao)  and (not vbEdicao) and (vrPrograma.snAlterar = 'S') and
//                      (vbPermite_Manutencao) and ( not vbVazio )and (status <> csConsulta) and (vbPrograma_sistema);
//
//
//  sbDelete.Enabled := (vbTelaPermiteExclusao)  and (not vbEdicao)  and (vrPrograma.snExcluir = 'S') and
//                      (vbPermite_Manutencao )  and ( not vbVazio ) and (status <> csManutencao)  and
//                      (status <> csConsulta)   and (vbPrograma_sistema);
//
//  sbPost.Enabled   := ( vbEdicao );
//  sbCancel.Enabled := ( vbEdicao );
//  sbHelp.Enabled   := true;
//
//  sbRefresh.Enabled := (not vbEdicao) and ( dsMain.State <> dsInactive);
//
//  sbFind.Enabled := (( FormPesquisa <> '' ) and (not vbEdicao) and (status <> csManutencao) and
//                     (status <> csPesquisa) and ( dsMain.State <> dsInactive) );


(*------------------------------------------------------*)

  sbInsert.Enabled := True;

  sbEdit.Enabled   := True;


  sbDelete.Enabled := True;

  sbPost.Enabled   := True;
  sbCancel.Enabled := True;
  sbHelp.Enabled   := true;

  sbRefresh.Enabled := True;

  sbFind.Enabled := True;

  //sbPrint.Enabled   := not vbVazio;

  sbFirst.Enabled := ( not vbEdicao ) and ( not vbVazio ) ;
  sbPrior.Enabled := ( not vbEdicao ) and ( not vbVazio ) ;
  sbNext.Enabled  := ( not vbEdicao ) and ( not vbVazio ) ;
  sbLast.Enabled  := ( not vbEdicao ) and ( not vbVazio ) ;
end;

procedure TfmCad.tbFuncoesClick(Sender: TObject);
begin
   tbFuncoes.CheckMenuDropdown;
end;
{
  Funcao F_Datafield
  objetivo   : retorna o nome do campo relacionado ao componente (DataField)
  Parametros : Sender : Component que será verificado
  retorno    : Nome do Campo, ou '' se o componente não tem campo Relacionado
}
function TfmCad.F_DataField(Sender : TOBject) : string;
var vResult : variant;
begin
  try
    vResult := GetPropValue(sender,'DATAFIELD',true);
    result := vResult
  except
    result := '';
  end;
end;
{
  Funcao F_DataComponent
  objetivo   : retorna o primeiro componente dataaware do form de um dado campo
  Parametros : psNoCampo : Nome do Campo
               Owner : Owner dos componentes
  retorno    : componente dataaware do campo
}
function  TfmCad.F_DataComponent(psNoCampo : String; Owner : TComponent) : TControl;
var i       : integer;
    vComp : TComponent;
begin
   i := 0;
   result := nil;
   while (i < (Owner.ComponentCount ) ) and ( not Assigned(result) ) do
   begin
     vComp := Owner.Components[I];
     // Recursividade
     if vComp.ComponentCount <> 0 then
        result := F_DataComponent( psNoCampo, vComp );
     if not Assigned (result) and
        (vComp is TComponent) and
        (UpperCase(psNoCampo) = UpperCase(F_DataField(vComp))) then
     begin
        result := TControl(vComp);
     end
     else
        inc(i);
   end;
end;

procedure TfmCad.InicializaControles;
var i : integer;
    vComp : TComponent;
begin
  // Configura PageControls
  for i := 0 to ComponentCount -1 do
  begin
    vComp := Components[I];
    if ( vComp is TPageControl) then
    begin
      with TPageControl(vComp) do
      begin
        cursor := crHandPoint;
        if not (fsBold in Font.Style) then
        begin
          Font.Style := Font.Style + [fsBold];
        end;
      end;
    end
    else
    if (vComp is TDBEdit)       or
       (vComp is TLookUpEdit) or
       (vComp is TDBMemo)       or
       (vComp is TEvDBNumEdit ) then
    begin
      TEdit(vComp).CharCase := ecUpperCase;
    end;
  end;
end;

procedure TfmCad.FormDestroy(Sender: TObject);
begin
  SQLOriginal.Free;
end;

procedure TfmCad.Atualizar_Menu_Principal;
begin
//  if (Application.MainForm is TfmMDI ) then
//  begin
//    TfmMDI(Application.MainForm).Atualizar_Menu;
//  end;
end;

procedure TfmCad.Atualizar_Atalhos_Menu_Principal;
begin
//  if (Application.MainForm is TfmMDI ) then
//  begin
//    TfmMDI(Application.MainForm).Atualizar_Atalhos(self);
//  end;
end;

procedure TfmCad.Checar_Status_Sistema;
begin
  if ( dsMain.state in [dsinsert,dsEdit] ) and (not vbManutencaoModoConsulta or AppModo_Consulta ) then
  begin
    showmessage(AppMsgModo_Consulta);
    cancelrec(self);
  end;
  HabilitaBotoes;
end;

function TfmCad.Campos_Chave : string;
var vsCampos_Chave : string;
    i : integer;
begin
  if Primeira then Carrega_Campos;
  vsCampos_Chave :='';
  //Monta lista dos campos chave da tabela principal
  for i := low(vaCampos) to high(vaCampos) do
  begin
    if (sntoboolean(vaCampos[i].SNCHAVE_PRIMARIA))  and
       (vaCampos[i].NOTABELA = vrPrograma.NOTABELA) then
    begin
      AddStrtoList(vaCampos[i].NOCAMPO,vsCampos_Chave,';');
    end;
  end;
  result := vsCampos_Chave;
end;

procedure TfmCad.qyMainRefresh(Sender: TObject;
  DataSetState: TDataSetState);
  //Atualiza select
  procedure AtualizaSQL ( psCampos_Chave, psCampos_Chave_Alias : string );
  var vsFiltro_Registro_Atual : string;
  begin

    if (Datasetstate = dsInsert ) and
       ( (vsFiltro_Selecao <> '' ) // tela foi filtrada por procura
         or
         (self.Status = csInclusao)
         or
         ((not Tem_Filtro)and sntoboolean(vrPrograma.SNFILTRO_OBRIGATORIO))) then //tela tem filtroObrigatorio e não foi filtrada pela dela chamadora
    begin
      //Monta o filtro do registro atual
      if (trim(psCampos_Chave) <> '') then
      begin
        vsFiltro_Registro_Atual := Selecao_reg_Atual(qyMain,strtoarray(psCampos_Chave,';'),strtoarray(psCampos_Chave_Alias,';'));
        if vsFiltro_Selecao <> '' then
          vsFiltro_Selecao := vsFiltro_Selecao +' OR '+ vsFiltro_Registro_Atual
        else
          vsFiltro_Selecao := vsFiltro_Registro_Atual;
      end;

      qyMain.sql.clear;
      qyMain.sql.assign(SQLOriginal);
      filtrar(qyMain);
      if trim(vsFiltro_Selecao) <> '' then
        insertfilter(qyMain,parentesis(vsFiltro_Selecao));
    end;

  end;
var i : integer;
    vsCampos_Chave, vsCampos_Chave_alias, vsAlias  : string;
    vvValores : variant;
    vaCampo_Chave : aString;
    vbTem_chave : boolean;
begin

  vsCampos_Chave :='';
  vsCampos_Chave_Alias :='';
  vaCampo_Chave := nil;

  //Procura o alias da tabela na cachequery
  vsAlias := qyMain.tableAlias(vrprograma.NOTABELA);

  //Monta lista dos campos chave da tabela principal
  for i := low(vaCampos) to high(vaCampos) do
  begin
    if sntoboolean(vaCampos[i].SNCHAVE_PRIMARIA)    and
       (vaCampos[i].NOTABELA = vrPrograma.NOTABELA) then
    begin
      AddStrtoList(vaCampos[i].NOCAMPO,vsCampos_Chave,';');
      AddStrtoList(vsAlias+'.'+vaCampos[i].NOCAMPO,vsCampos_Chave_Alias,';');
    end;
  end;

  vbTem_chave := (trim(vsCampos_Chave) <> '');

  if not vbTem_chave then
  begin
    if AppModo_Debug then
      showmessage('Não foi definida chave para a tabela "'+vrPrograma.NOTABELA+'"')
  end
  else
  begin
    //seleciona os valores do registro atual para poder se reposicionar
    vaCampo_Chave := strtoarray(vsCampos_Chave,';');
    vvValores := VarArrayCreate([low(vaCampo_Chave), high(vaCampo_Chave)], varVariant);

    for i := low(vaCampo_Chave) to high(vaCampo_Chave) do
      vvValores[i] := qymain.fieldbyname(vaCampo_Chave[i]).value;

    AtualizaSQL ( vsCampos_Chave, vsCampos_Chave_Alias )
  end;

  qyMain.close;
  qyMain.open;

  if vbTem_chave then
  begin
    //Posiciona no registro alterado/incluido
    try
      if length(vaCampo_Chave) = 1 then
        qyMain.Locate(vsCampos_Chave,vvValores[low(vaCampo_Chave)],[loCaseInsensitive, loPartialKey])
      else
        qyMain.Locate(vsCampos_Chave,vvValores,[loCaseInsensitive, loPartialKey])
    except
    end;
  end;

end;

procedure TfmCad.miOqueistoClick(Sender: TObject);
var vRegCampo : TReg_Campo;
begin
   dmCOM002A.Definicao_Campo( F_DataField(pmhelp.PopupComponent),vaCampos, vRegCampo);
//   if trim(vRegCampo.TXOBSERVACAO) <> '' then
//     showmessage( vRegCampo.TXOBSERVACAO)
//   else
     showmessage( vRegCampo.DSCAMPO);

end;

procedure TfmCad.Retorno_Pesquisa(Sender: TObject);
begin
  vsFiltro_Selecao := vsRetorno_Pesquisa.Text ;
  with qyMain do
  begin
    close;
    sql.clear;
    sql.assign(SQLOriginal);
    insertfilter(qyMain,'( '+vsFiltro_Selecao+' )');
    open;
  end;
end;

procedure TfmCad.grdMainMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  //zatta 05/12/2003
  //Para resolver o problema do foco após "mousemove" no mxoutlookbarpro
  pcGeral.setfocus;
  if grdMain.CanFocus then
     grdMain.setfocus;
end;

procedure TfmCad.Grava_Log_Manutencao(psTpManutencao : String;pbManuntencaoPendente : boolean);
var vrLog_Manutencao_Campo : TReg_Log_Manutencao_Campo;
    vrLog_Manutencao_Chave : TReg_Log_Manutencao_Chave;
    vsCdStatus_Manutencao, vsNotabela : String;
    i, viSqRegistro, viNrOrdem : integer;
    vField : TField;
    vbGravaLogCampo,vbTabela_Principal : boolean;
    vControl : TControl;
begin
  vrManutencao_Blob.NOCAMPO := '';
  vrManutencao_Blob.VLATUAL := '';
  vsNotabela := '';
  viSqRegistro := 0;
  vbCampo_alterado:=FALSE;
  if (pbManuntencaoPendente) then
    vsCdStatus_Manutencao := csCdStatus_Manutencao_pendente
  else
    vsCdStatus_Manutencao := csCdStatus_Manutencao_Aprovado;

  viCdLog_manutencao:= dmCOM003L.grava_log_manutencao( vrPrograma.CDPROGRAMA, psTpManutencao, vsCdStatus_Manutencao);

  for i := low(vaCampos) to high(vaCampos) do
  begin
     vbTabela_Principal := (vaCampos[i].NOTABELA = vrPrograma.NOTABELA );
     if (vsNotabela <> vaCampos[i].NOTABELA) then
     begin
        vsNotabela := vaCampos[i].NOTABELA;
        if (vbTabela_Principal) then
          viNrOrdem := 1
        else
         begin
          viNrOrdem := 2;
          vsAuxiliar := vaCampos[i].NOTABELA;
         end;
        viSqRegistro := dmCOM003L.grava_log_manutencao_registro(viCdLog_manutencao, viNrOrdem, vaCampos[i].NOTABELA, '');
     end;
     if vbTabela_Principal then
       vField := dsMain.Dataset.findField(vaCampos[i].NOCAMPO)
     else
       vField := dsAuxiliar.Dataset.findField(vaCampos[i].NOCAMPO);

     if(sntoboolean(vaCampos[i].SNCHAVE_PRIMARIA)) then
     begin
         vrLog_Manutencao_Chave.CDLOG_MANUTENCAO := viCdLog_manutencao;
         vrLog_Manutencao_Chave.SQREGISTRO       := viSqRegistro;
         vrLog_Manutencao_Chave.NOCAMPO          := vaCampos[i].NOCAMPO;
         Descricao_Campo(vaCampos[i].NOCAMPO,vrLog_Manutencao_Chave.DSCAMPO);

         Valor_Campo(vaCampos[i].NOCAMPO, vField.Value,vrLog_Manutencao_Chave.VLCAMPO, vrLog_Manutencao_Chave.DSVALOR);
         dmCOM003L.grava_log_manutencao_chave( vrLog_Manutencao_Chave );
     end
     else
     begin
       vbGravaLogCampo:=true;
       //se o campo não estiver na query, não grava campo
       if (not assigned(vField)) then
          vbGravaLogCampo := false;
       //Não grava campos de operador/data de inclusão e alteração
       if (vbGravaLogCampo) and
          ((vaCampos[i].NOCAMPO = 'CDOPERADOR_INCLUSAO')
           or
           (vaCampos[i].NOCAMPO = 'CDOPERADOR_ALTERACAO')
           or
           (vaCampos[i].NOCAMPO = 'DTINCLUSAO')
           or
           (vaCampos[i].NOCAMPO = 'DTALTERACAO') )then
       begin
         vbGravaLogCampo := false;
       end;
       //na inclusao ou exclusao, somente registra o campo se estiver preenchido
       if (vbGravaLogCampo) and
          (psTpManutencao <> csTpManutencao_Alteracao) and
          (varIsNull(vField.Value)) then
       begin
         vbGravaLogCampo := false;
       end;

       //se for type blob
       if (vbGravaLogCampo) and
          (vField.IsBlob) then
        begin
         vbGravaLogCampo := false;
         vrManutencao_Blob.NOCAMPO          := vaCampos[i].NOCAMPO;
         vrManutencao_Blob.VLATUAL          := vField.Value;
        end;


       //na alteraçcao soh registra o campo se o mesmo foi alterado
       if (vbGravaLogCampo) and
          (psTpManutencao = csTpManutencao_Alteracao) and
          (vField.Value = vField.OldValue ) then
        begin
         vbGravaLogCampo := false;
       end;

       if (vbGravaLogCampo) then
       begin
         vbCampo_alterado:=TRUE;
         vrLog_Manutencao_Campo.CDLOG_MANUTENCAO := viCdLog_manutencao;
         vrLog_Manutencao_Campo.SQREGISTRO       := viSqRegistro;
         vrLog_Manutencao_Campo.NOCAMPO          := vaCampos[i].NOCAMPO;
         Descricao_Campo(vaCampos[i].NOCAMPO,vrLog_Manutencao_Campo.DSCAMPO);

         if(psTpManutencao <> csTpManutencao_Exclusao) then
         begin
           Valor_Campo(vaCampos[i].NOCAMPO, vField.Value, vrLog_Manutencao_Campo.VLATUAL, vrLog_Manutencao_Campo.DSVALOR_ATUAL);
         end;

         if(psTpManutencao <> csTpManutencao_Inclusao) then
         begin
           Valor_Campo(vaCampos[i].NOCAMPO, vField.oldvalue, vrLog_Manutencao_Campo.VLANTERIOR, vrLog_Manutencao_Campo.DSVALOR_ANTERIOR);
           //localizar a descrição do valor anterior, se for findedit/searchedit
           if (trim(vrLog_Manutencao_Campo.VLANTERIOR)<>'') then
           begin
             vControl := F_DataComponent(vaCampos[i].NOCAMPO,self);
             if vControl is TDBLookUpEdit then
               vrLog_Manutencao_Campo.DSVALOR_ANTERIOR := TDBLookUpEdit(vControl).oldValueText
           end;
         end;
         dmCOM003L.grava_log_manutencao_campo( vrLog_Manutencao_Campo );
       end;
     end;
  end;
  {Tratamento por conta do campo blob, a intenção é: Se a tela tem dupla custódia mas o campo alterado for "blob" grava a dupla aprovado, porque não possível
  fazer "dupla" para o blob.
  Na inclusão e deleção, no entanto, nenhum campo de fato é alterado por isso foi preciso incluir:
  "if (psTpManutencao = csTpManutencao_Alteracao) and not(vbCampo_alterado) then", ou seja, se é alteração e nem um campo foi alterado grava log como "aprovado"
  }
  if (psTpManutencao = csTpManutencao_Alteracao) and not(vbCampo_alterado) then
   begin
    dmCOM003L.Atualiza_Log_Manutencao(viCdLog_manutencao,csCdStatus_Manutencao_Aprovado);
   end;
  
end;

procedure TfmCad.Grava_Log_Manutencao_Detalhe(psTpManutencao : String;pbManuntencaoPendente : boolean; viNrOrdem: integer; vDataSet: TDataSet);
var vrLog_Manutencao_Campo : TReg_Log_Manutencao_Campo;
    vrLog_Manutencao_Chave : TReg_Log_Manutencao_Chave;
    vsCdStatus_Manutencao, vsNotabela : String;
    i, viSqRegistro : integer;
    vField : TField;
    vbGravaLogCampo,vbTabela_Principal : boolean;
    vControl : TControl;
    strs:TStrings;
begin
  vrManutencao_Blob.NOCAMPO := '';
  vrManutencao_Blob.VLATUAL := '';
  vsNotabela := '';
  viSqRegistro := 0;
  vbCampo_alterado:=FALSE;
  if (pbManuntencaoPendente) then
    vsCdStatus_Manutencao := csCdStatus_Manutencao_pendente
  else
    vsCdStatus_Manutencao := csCdStatus_Manutencao_Aprovado;

  if(viCdLog_manutencao = 0)then
   viCdLog_manutencao:= dmCOM003L.grava_log_manutencao( vrPrograma.CDPROGRAMA, psTpManutencao, vsCdStatus_Manutencao)
  else
   dmCOM003L.Atualiza_Log_Manutencao( viCdLog_manutencao, csCdStatus_Manutencao_pendente);

  viSqRegistro := dmCOM003L.grava_log_manutencao_registro(viCdLog_manutencao, viNrOrdem, dmCOM003L.JvMemDataTABELA.Value, psTpManutencao);

  dmCOM003L.JvMemData.First;
  while not(dmCOM003L.JvMemData.Eof)do
  begin
     vField := vDataSet.FindField(dmCOM003L.JvMemDataCAMPO.Value);

     //VALIDA SE É CHAVE
     if(dmCOM003L.JvMemDataCHAVE.Value = '0')then
     begin
         vrLog_Manutencao_Chave.CDLOG_MANUTENCAO := viCdLog_manutencao;
         vrLog_Manutencao_Chave.SQREGISTRO       := viSqRegistro;
         vrLog_Manutencao_Chave.NOCAMPO          := dmCOM003L.JvMemDataCAMPO.Value;
         Descricao_Campo(dmCOM003L.JvMemDataCAMPO.Value,vrLog_Manutencao_Chave.DSCAMPO);

         Valor_Campo(dmCOM003L.JvMemDataCAMPO.Value, vField.Value,vrLog_Manutencao_Chave.VLCAMPO, vrLog_Manutencao_Chave.DSVALOR);
         dmCOM003L.grava_log_manutencao_chave( vrLog_Manutencao_Chave );
     end
     else
     begin
       vbGravaLogCampo:=true;
       //se o campo não estiver na query, não grava campo
       if (not assigned(vField)) then
          vbGravaLogCampo := false;
       //Não grava campos de operador/data de inclusão e alteração
       if (vbGravaLogCampo) and
          ((dmCOM003L.JvMemDataCAMPO.Value = 'CDOPERADOR_INCLUSAO')
           or
           (dmCOM003L.JvMemDataCAMPO.Value = 'CDOPERADOR_ALTERACAO')
           or
           (dmCOM003L.JvMemDataCAMPO.Value = 'DTINCLUSAO')
           or
           (dmCOM003L.JvMemDataCAMPO.Value = 'DTALTERACAO') )then
       begin
         vbGravaLogCampo := false;
       end;
       //na inclusao ou exclusao, somente registra o campo se estiver preenchido
       if (vbGravaLogCampo) and
          (psTpManutencao <> csTpManutencao_Alteracao) and
          (varIsNull(vField.Value)) then
       begin
         vbGravaLogCampo := false;
       end;

       //se for type blob
       if (vbGravaLogCampo) and
          (vField.IsBlob) then
        begin
         vbGravaLogCampo := false;
         vrManutencao_Blob.NOCAMPO          := dmCOM003L.JvMemDataCAMPO.Value;
         vrManutencao_Blob.VLATUAL          := vField.Value;
        end;

       try
       //na alteraçcao soh registra o campo se o mesmo foi alterado
       if (vbGravaLogCampo) and
          (psTpManutencao = csTpManutencao_Alteracao) and
          (vField.Value = vField.OldValue ) then
        begin
         vbGravaLogCampo := false;
       end;
       except
        if(vField.IsNull)then
         vbGravaLogCampo := false
        else
         vbGravaLogCampo := true;
       end;

       if (vbGravaLogCampo) then
       begin
         vbCampo_alterado:=TRUE;
         vrLog_Manutencao_Campo.CDLOG_MANUTENCAO := viCdLog_manutencao;
         vrLog_Manutencao_Campo.SQREGISTRO       := viSqRegistro;
         vrLog_Manutencao_Campo.NOCAMPO          := dmCOM003L.JvMemDataCAMPO.Value;
         Descricao_Campo(dmCOM003L.JvMemDataCAMPO.Value,vrLog_Manutencao_Campo.DSCAMPO);

         if(psTpManutencao <> csTpManutencao_Exclusao) then
         begin
           Valor_Campo(dmCOM003L.JvMemDataCAMPO.Value, vField.Value, vrLog_Manutencao_Campo.VLATUAL, vrLog_Manutencao_Campo.DSVALOR_ATUAL);
         end;

         if(psTpManutencao <> csTpManutencao_Inclusao) then
         begin
           Valor_Campo(dmCOM003L.JvMemDataCAMPO.Value, vField.oldvalue, vrLog_Manutencao_Campo.VLANTERIOR, vrLog_Manutencao_Campo.DSVALOR_ANTERIOR);
           //localizar a descrição do valor anterior, se for findedit/searchedit
           if (trim(vrLog_Manutencao_Campo.VLANTERIOR)<>'') then
           begin
             vControl := F_DataComponent(vaCampos[i].NOCAMPO,self);
             if vControl is TDBLookUpEdit then
               vrLog_Manutencao_Campo.DSVALOR_ANTERIOR := TDBLookUpEdit(vControl).oldValueText
           end;
         end;
         dmCOM003L.grava_log_manutencao_campo( vrLog_Manutencao_Campo );
       end;
     end;
    dmCOM003L.JvMemData.Next;
  end;
  {Tratamento por conta do campo blob, a intenção é: Se a tela tem dupla custódia mas o campo alterado for "blob" grava a dupla aprovado, porque não possível
  fazer "dupla" para o blob.
  Na inclusão e deleção, no entanto, nenhum campo de fato é alterado por isso foi preciso incluir:
  "if (psTpManutencao = csTpManutencao_Alteracao) and not(vbCampo_alterado) then", ou seja, se é alteração e nem um campo foi alterado grava log como "aprovado"
  }
  if (psTpManutencao = csTpManutencao_Alteracao) and not(vbCampo_alterado) then
   begin
    dmCOM003L.Atualiza_Log_Manutencao(viCdLog_manutencao,csCdStatus_Manutencao_Aprovado);
   end;
  
end;

procedure TfmCad.Descricao_Campo(psNoCampo : String; var psDescricao:String);
var vsDescricao_Campo : String;
    vLabel : Tlabel;
    vControl : TControl;
    vbEncontrou_Descricao : boolean;
begin
  vsDescricao_Campo := '';
  vbEncontrou_Descricao := false;
  vLabel := TLabel(self.FindComponent('la' + psNoCampo));
  //Procura a descrição do campo pelos labels
  if vLabel <> nil then
  begin
     vsDescricao_Campo := vLabel.Caption;
     vbEncontrou_Descricao := true;
  end;
  //Procura a descrição do campo pelos campos realacionados
  if (not vbEncontrou_Descricao) then
  begin
     vControl := F_DataComponent(psNoCampo,self);
     if assigned(vControl) then
     begin
        if ( vControl is TDBCheckBox ) then
        begin
           vsDescricao_Campo := TDBCheckBox(vControl).caption;
           vbEncontrou_Descricao := true;
        end
        else
        if ( vControl is TDBRadioGroup ) then
        begin
           vsDescricao_Campo := TDBRadioGroup(vControl).caption;
           vbEncontrou_Descricao := true;
        end;
     end;
  end;

  //se nao encontrou descricao por nenhum dos outros meios, assume que a descricao eh o nome do campo
  if ( not vbEncontrou_Descricao ) then
  begin
    vsDescricao_Campo := psNoCampo;
  end;

  psDescricao := vsDescricao_Campo;
end;

procedure TfmCad.Valor_Campo(psNoCampo : String; pValue : Variant ; var psValor : String;
                             var psDsValor: String);
var vControl : Tcontrol;
    viIndex : integer;
    vbOk : boolean;
begin

  vbOk := false;
  psDsValor := '';
  if ( not vbOk) and
     (VarIsNull(pValue)) then
  begin
    vbOk := true;
    psValor   := '';
  end;

  if (not vbOk) then
  begin
    //Valor
    psValor   := vartostr(pValue);
    //Monta descricao do valor
    vControl := F_DataComponent(psNoCampo,self);
    if assigned(vControl) then
    begin
      if ( vControl is TDBCheckBox ) then
      begin
        vbOk := true;
        psDsValor := dmPrincipal.Decode_SN(psValor);
      end
      else
      if ( vControl is TDBRadioGroup ) then
      begin
        viIndex := TDBRadioGroup(vControl).values.IndexOf(psValor);
        if (viIndex >= 0) then
        begin
          psDsValor := TDBRadioGroup(vControl).Items[viIndex];
          vbOk := true;
        end;
      end
      else
      if ( vControl is TDBLookUpEdit ) then
      begin
        psDsValor := TDBLookUpEdit(vControl).Text;
        vbOk := true;
      end;

    end;
  end;

  //se nao encontrou descricao do valor por nenhum dos outros meios, assume que a descricao eh o valor do campo
  if (not vbOk)then
  begin
    psDsValor := psValor;
  end;

end;

procedure TfmCad.qyMainTransaction(Sender: TObject;
  DataSetState: TDataSetState);
begin
  if (Assigned(dsAuxiliar.DataSet)) then
    dsAuxiliar.DataSet.Post;
end;

procedure TfmCad.qyMainDelTransaction(Sender: TObject);
begin
  if (Assigned(dsAuxiliar.DataSet)) then
    dsAuxiliar.DataSet.Delete;
end;

function TfmCad.Verifica_Alteracoe_Pendentes_Log: boolean;
var  i:integer;
begin
  if Primeira then Carrega_Campos;
  with dmprincipal.qyTmp do
  begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT COUNT(*) CONT ');
    Sql.Add('FROM LOG_MANUTENCAO LM');
    Sql.Add('WHERE LM.CDPROGRAMA = '+quotedstr(vrPrograma.CDPROGRAMA));
    Sql.Add('AND LM.CDSTATUS_MANUTENCAO = '+quotedstr(csCdStatus_Manutencao_Pendente));

    for i := low(vaCampos) to high(vaCampos) do
    begin
      //se é tabela principal e é chave primaria
      if(vaCampos[i].NOTABELA = vrPrograma.NOTABELA )and(sntoboolean(vaCampos[i].SNCHAVE_PRIMARIA)) then
      begin
        Sql.Add('AND EXISTS (SELECT LMC.CDLOG_MANUTENCAO '+
                '             FROM LOG_MANUTENCAO_REGISTRO LMR, LOG_MANUTENCAO_CHAVE LMC '+
                '             WHERE LM.CDLOG_MANUTENCAO = LMR.CDLOG_MANUTENCAO '+
                '             AND   LMR.CDLOG_MANUTENCAO = LMC.CDLOG_MANUTENCAO '+
                '             AND   LMR.SQREGISTRO = LMC.SQREGISTRO '+
                '             AND   LMR.NOTABELA =  '+quotedstr(vaCampos[i].NOTABELA)+
                '             AND   LMC.NOCAMPO =  '+quotedstr(vaCampos[i].NOCAMPO)+
                '             AND   LMC.VLCAMPO = :'+vaCampos[i].NOCAMPO+')');


        Parameters.ParamByName(vaCampos[i].NOCAMPO).DataType := ftString;
        Parameters.ParamByName(vaCampos[i].NOCAMPO).Value    := dsMain.Dataset.FieldByName(vaCampos[i].NOCAMPO).asString;
      end;
    end;

    open;

    result:=FieldByName('CONT').asInteger>0;

    Close;
  end;
end;

end.
