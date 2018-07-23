unit MDI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, Menus, Buttons, StdCtrls, ToolWin, Grids, Cad, DB,
  DBCtrls, DBTables, ShellApi, ImgList, {Sobre, senha,} EFocCol,Variants,
  uTool2,uTool, CadVirtual,declaratype,ITMenuItem, DBSearchEdit,
  Mask, LookupEdit, dbLookUpEdit, DBFindEdit,clipbrd,  Typinfo, {mxOutlookBarPro,}
  {am2000menuitem, am2000mainmenu, am2000, am2000menubar,}dbcgrids, {htmlhelpapi,}
  cxGraphics, {WinSkinData,} cxControls, dxStatusBar, jpeg, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinsdxStatusBarPainter, cxClasses, dxRibbon,
  dxSkinsdxBarPainter, dxBar, cxBarEditItem, JvExButtons, JvBitBtn, DBGrids;

type
  TfmMDI = class(TForm)
    mnGeral: TMainMenu;
    FocusColor1: TEvFocusColor;
    tmHora_atual: TTimer;
    miConexao: TMenuItem;
    miModulos: TMenuItem;
    miOpcoes: TMenuItem;
    miUtilitarios: TMenuItem;
    miBackup: TMenuItem;
    miConversor_Unidade_Medida: TMenuItem;
    miCalculadora: TMenuItem;
    miAgendaAgenda: TMenuItem;
    miJanela: TMenuItem;
    miAjuda: TMenuItem;
    miLogin: TMenuItem;
    miAkterar_Senha: TMenuItem;
    N1: TMenuItem;
    miSair: TMenuItem;
    miCascata: TMenuItem;
    miLadoaLado: TMenuItem;
    miOrganizar_Icones: TMenuItem;
    miConteudo: TMenuItem;
    miIndice: TMenuItem;
    miDicas: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    miSobre: TMenuItem;
    miHome_Page_Intertech: TMenuItem;
    miSuporte_OnLine: TMenuItem;
    miAtualizacao: TMenuItem;
    miRegistrar: TMenuItem;
    imOutLookBar: TImageList;
    imBarra_Principal: TImageList;
    paDivider1: TPanel;
    paDivider2: TPanel;
    pmAtalho_interno: TPopupMenu;
    miIncluir_Atalho_Interno: TMenuItem;
    pmAtalho_Externo: TPopupMenu;
    miIncluir_atalho_Externo: TMenuItem;
    miImpExp: TMenuItem;
    ImportaodasTabelasdeCatlogo1: TMenuItem;
    miLocalizaPrograma: TMenuItem;
    stGeral: TdxStatusBar;
    paModulo: TPanel;
    paNoModulo: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    tbLogin: TSpeedButton;
    tbAlterar_Senha: TSpeedButton;
    tbAtalho: TSpeedButton;
    tbSair: TSpeedButton;
    lbOrg: TLabel;
    imageOrg: TImage;
    Label1: TLabel;
    Image1: TImage;
    ismalllist: TImageList;
    dxRibbon1: TdxRibbon;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    JvBitBtn1: TJvBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AtalhoClick(Sender: TObject);
    procedure ModuloClick(Sender: TObject);
    procedure ProgramaClick(Sender: TObject);
    procedure After_Login(Sender: TObject);virtual;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure miSobreClick(Sender: TObject);
    procedure miAlterar_SenhaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure miCascataClick(Sender: TObject);
    procedure miLadoaLadoClick(Sender: TObject);
    procedure miOrganizarIconesClick(Sender: TObject);
    function  CheckResolution : Boolean;
    procedure tmHora_atualTimer(Sender: TObject);
    procedure miIndiceClick(Sender: TObject);
    procedure miConteudoClick(Sender: TObject);
    procedure miHomePageClick(Sender: TObject);
    procedure miSairClick(Sender: TObject);
    procedure miAtualizar_MenuClick(Sender: TObject);
    procedure sbForca_SaidaClick(Sender: TObject);
    procedure sbCopyFormClick(Sender: TObject);
    procedure miSuporteClick;
    procedure miDicasClick;
    procedure miAtualizacaoClick;
    procedure ToolButtonClick(Sender: TObject);
    procedure miHome_Page_IntertechClick(Sender: TObject);
    procedure miIncluir_Atalho_InternoClick(Sender: TObject);
    procedure miIncluir_atalho_ExternoClick(Sender: TObject);
    procedure tbAtalhoClick(Sender: TObject);
    procedure FocusColor1ChangeControl(Sender: TObject;
      NewControl: TWinControl; var Change: Boolean);
    procedure miImpExpClick(Sender: TObject);
    procedure ImportaodasTabelasdeCatlogo1Click(Sender: TObject);
    procedure miLocalizaProgramaClick(Sender: TObject);
    procedure dbfeProgramaAfterButton(Sender: TObject;
      var ResultFind: TStrings);
    procedure tbLoginClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure JvBitBtn1Click(Sender: TObject);
  private
    Primeira : Boolean;
    vsModulo_Padrao : string;
    Procedure TrataException(Sender: TObject; E: Exception);
    function Carrega_Menu( AdxBar : TdxBar; psCdModulo : string;
                           piCDITEM_MENU_PAI:integer = 0 ):boolean;


    procedure Execute( Sender : TObject; psTp_Acao : string );
    procedure SelecionaModulo( psCdModulo, psNoModulo : string);
    procedure ProcedureCriaSubMenus(AdxBar: TdxBar; psCdModulo: string);
    procedure Atualizar_Atalhos(Sender: TObject);
  public
    function inclui_atalho(psNomeAtalho,psPath : string) : boolean;
    procedure Atualizar_Modulos( psCdModulo: String);
//    procedure Atualizar_Atalhos(Sender :TObject);
    procedure Atualizar_Menu;
    procedure Login;
  end;

const
  csTp_Acao_Atalho   = 'A';
  csTp_Acao_Modulo   = 'M';
  csTp_Acao_Programa = 'P';

var
  fmMDI: TfmMDI;

implementation

uses  uDeclara, {ModPrincipal,} modCOM002A, dbErro, dtmPrincipal, Unit2;

{$R *.DFM}
{$R icmodulos.RES}

procedure TfmMDI.FormCreate(Sender: TObject);
//var vHeader : TmxHeader;
begin
  if not CheckResolution then
  begin
    showmessage( 'A resolução minima recomendada para a utilização do sistema é de 1024x768 dpi''s ! ' );
  end;
  Application.OnException := TrataException;
  Primeira := True;

  miUtilitarios.Visible := AppModo_Debug;

  Caption := AppTitle;
  tmHora_Atual.Enabled := not AppModo_Debug;
  vsModulo_Padrao :='';
  //Cria os Headers das Barras
//  vHeader := mxOutlookBar.AddHeader;
//  vHeader.Name    := 'hdModulo';
//  vHeader.Caption := 'Modulo';
//  vHeader.Images.Normal := imOutLookBar;
//  vHeader.FirstButtonTop := 1;
//  vHeader.Background.Color:=$00F4F4F4;
//
//
//  mxOutlookBar.ActiveHeader := vHeader;
//
//  vHeader := mxOutlookBar.AddHeader;
//  vHeader.Name    := 'hdAtalhos_Sistema';
//  vHeader.Caption := 'Atalhos Sistema';
//  vHeader.PopupMenu := pmAtalho_Interno;
//  vHeader.Images.Normal := imOutLookBar;
//  vHeader.FirstButtonTop := 1;
//  vHeader.Background.Color:=$00F4F4F4;
//
//  vHeader := mxOutlookBar.AddHeader;
//  vHeader.Name    := 'hdOutros_Atalhos';
//  vHeader.Caption := 'Outros Atalhos';
//  vHeader.PopupMenu := pmAtalho_Externo;
//  vHeader.Images.Normal := imOutLookBar;
//  vHeader.FirstButtonTop := 1;
//  vHeader.Background.Color:=$00F4F4F4;
end;

procedure TfmMDI.FormShow(Sender: TObject);
begin
  Atualizar_Menu;
end;

Function TfmMDI.CheckResolution : Boolean;
var
  Metrics : TRect;
begin
  GetWindowRect(GetDeskTopWindow(), Metrics);
  if ( Metrics.Right < 1024 ) or
     ( Metrics.Bottom  < 768) then
  begin
    WindowState := wsMaximized;
    result := false;
  end
  else
  if ( Metrics.Right = 1024 ) and
     ( Metrics.Bottom  = 768) then
  begin
    WindowState := wsMaximized;
    result := true;
  end
  else
  begin
    Position := poScreenCenter;
    WindowState := wsNormal;
    result := true;
    Width  := 1024;
    Height := 768;
  end;
end;

procedure TfmMDI.FormActivate(Sender: TObject);
begin
  if Primeira then
  begin
//    skdata.Active:=TRUE;
    tbLoginClick(Self);
    Primeira := False;
    invalidate;
  end;
end;

Procedure TfmMDI.TrataException(Sender: TObject; E: Exception);
begin
  TfmErro.showError( Sender, e );
end;

procedure TfmMDI.Login;
var fmLogin : TFmCadVirtual;
    LoginOk : Boolean;
begin
  if ( MDIChildCount > 0)then
  begin
    ShowMessage('Feche todos os formulários antes de logar novamente...');
  end
  else
  begin
    if not Primeira then
      LoginOk := Application.MessageBox( PCHAR('Tem certeza que deseja efetuar logoff de '+AppSysOper+'?') ,'Logoff',MB_YESNO + MB_DEFBUTTON1+MB_ICONQUESTION ) = IDYES
    else
      LoginOk := True;
    if LoginOk then
    begin
      fmLogin := CriaForm('fmInpLogin',Application);
      if fmLogin <> nil then
        fmLogin.ExibeForm(self,csNormal,nil,After_Login);
    end;
  end;
end;

procedure TfmMDI.After_Login(Sender: TObject);
begin
  if AppModo_Carga then
  begin
    miImpExpClick(Sender);
  end
  else
  begin
    Atualizar_Menu;
  end;

end;

procedure TfmMDI.ModuloClick(Sender: TObject);
begin
  Execute( Sender, csTp_Acao_Modulo );
end;

procedure TfmMDI.ProgramaClick(Sender: TObject);
begin
  Execute( Sender, csTp_Acao_Programa );
end;

procedure TfmMDI.AtalhoClick(Sender: TObject);
begin
  inherited;
  Execute( Sender, csTp_Acao_Atalho );
end;

procedure TfmMDI.Execute( Sender : TObject; psTp_Acao : string );
var vsHint, vsCaption : string;
    vResult : variant;
begin
  try
    vResult := GetPropValue(sender,'HINT',true);
    vsHint := vartostr(vResult)
  except
    vsHint := '';
  end;

  try
    vResult := GetPropValue(sender,'CAPTION',true);
    vsCaption := vartostr(vResult)
  except
    vsCaption := '';
  end;
  
  if vsHint <> '' then
  begin
    if psTp_Acao = csTp_Acao_Atalho then
    begin
      ShellExecute( Handle, 'open', PChar(vsHint), nil,
                    PChar(vsHint), SW_SHOW);
    end
    else
    if psTp_Acao = csTp_Acao_Modulo then
    begin
      SelecionaModulo(vsHint, vsCaption );
    end
    else
    if psTp_Acao = csTp_Acao_Programa then
    begin
      Showform('fm'+vsHint);
    end;
  end;

end;

procedure TfmMDI.SelecionaModulo( psCdModulo, psNoModulo : string);
begin
  //Nome do modulo
  paNoModulo.Caption := ' ' + psNoModulo;
//  mmModulo.Items2000.Clear;
  //Verificar
  //Carrega_Menu(psCdModulo);
//  mbModulo.Visible :=(mmModulo.Items2000.Count > 0);
//  mbModulo.UpdateMenuBar(true);
{  if AppAutenticacao <> csAutenticacao_NWO then
     AppIni.WriteString(AppSysOper,'Modulo' ,psCdModulo);
  AppIni.UpdateFile;}
end;

procedure TfmMDI.ProcedureCriaSubMenus(AdxBar : TdxBar; psCdModulo : string);
var qy :Tquery;
    //ABarEditItem  : TdxBarLargeButton;
    ABarEditItem  : TdxBarButton;
begin
 qy :=dmPrincipal.CriaQuery('dbExterno');
 try
   qy.SQL.Add('SELECT NOPROGRAMA, CDPROGRAMA');
   qy.SQL.Add('FROM PROGRAMA.DBF');
   qy.Sql.Add('WHERE CDMODULO = '+quotedstr(psCdModulo));
   qy.Open;

   qy.First;
   while not qy.Eof do
   begin
     ABarEditItem         := AdxBar.ItemLinks.AddItem(TdxBarLargeButton).Item as TdxBarButton;
     ABarEditItem.Caption := qy.FieldByName('NOPROGRAMA').asstring+'('+qy.FieldByName('CDPROGRAMA').asstring+')';
//            ABarEditItem.Name    := FieldByName('CDITEM_MENU').asstring;
     qy.Next;
   end;
 finally
   FreeAndNil(qy);
 end;
end;

//Verificar
function TfmMDI.Carrega_Menu( AdxBar : TdxBar; psCdModulo : string;
                              piCDITEM_MENU_PAI : integer = 0 ):boolean;
var qyMenu_Sistema: Tquery;
    mi            : TITMenuItem;
    vrPrograma    : Treg_Programa;
    vRotina       : POINTER;
begin
  qyMenu_Sistema:=dmPrincipal.CriaQuery('dbExterno');
  try
    result:=false;
    with qyMenu_Sistema do
    begin
      Sql.Add('SELECT CDITEM_MENU, CDTIPO_ITEM, CDPROGRAMA, TXDESCRICAO,CDITEM_MENU_PAI, NOROTINA');
      Sql.Add('FROM MENU_SISTEMA.DBF');
      Sql.Add('WHERE CDMODULO = '+quotedstr(psCdModulo));
      if piCDITEM_MENU_PAI <> 0 then
        Sql.Add('AND CDITEM_MENU_PAI='+inttostr(piCDITEM_MENU_PAI))
      else
        Sql.Add('AND CDITEM_MENU_PAI IS NULL' );

      sql.add('AND SNATIVO = ''S''');
      if not AppModo_Debug then
        sql.add('AND SNDESENVOLVIMENTO = ''N''');

      sql.add('ORDER BY CDITEM_MENU');
      Open;

      while not eof do
      begin
        if (FieldByName('CDITEM_MENU_PAI').asstring = '') and
           (AdxBar.Tag = 0) then
          begin
            AdxBar.Caption := FieldByName('TXDESCRICAO').asstring;
            AdxBar.Tag     := FieldByName('CDTIPO_ITEM').AsInteger;

            ProcedureCriaSubMenus(AdxBar, psCdModulo);
          end;

        (*if(FieldByName('CDTIPO_ITEM').asinteger<>ciTpPrograma )or
        (dmCOM002A.Autorizacao_Programa(FieldByName('CDPROGRAMA').asstring,vrPrograma))then
        begin

          //mi:=TITMenuItem.Create(SELF);

          mi.Name    :='mi'+FieldByName('CDITEM_MENU').asstring;
          if(FieldByName('CDTIPO_ITEM').asinteger=ciTpSeparador)then
            mi.Caption :=FieldByName('TXDESCRICAO').asstring
          else
          if(FieldByName('CDTIPO_ITEM').asinteger=ciTpNo)then
          begin
            mi.Visible:=Carrega_Menu(psCdModulo, FieldByName('CDITEM_MENU').asinteger);
            mi.Enabled:=mi.Visible;
            mi.Caption :=FieldByName('TXDESCRICAO').asstring;
            result := mi.Visible or result;
          end
          else
          if (FieldByName('CDTIPO_ITEM').asinteger=ciTpPrograma) then
          begin
            result:=true;

            mi.caption := vrPrograma.NOPROGRAMA + ' (' +vrPrograma.CDPROGRAMA+')';

            mi.Parametro.Clear;

            if SNtoBoolean(vrPrograma.SNPROGRAMA_LOGICO) then
            begin
               mi.Parametro.Text := vrPrograma.TXPARAMETRO;
               mi.Parametro.Add('CDPROGRAMA_LOGICO='+vrPrograma.CDPROGRAMA);
               mi.NomeChamada:=vrPrograma.CDPROGRAMA_FISICO;
            end
            else
              mi.NomeChamada:=FieldByName('CDPROGRAMA').asstring;
          end
          else
          if (FieldByName('CDTIPO_ITEM').asinteger=ciTpRotina) then
          begin
            result:=true;
            vRotina := self.methodaddress(FieldByName('NOROTINA').asstring);
            if Assigned(vRotina) then
              mi.Rotina := vRotina
            else
              showmessage('Rotina "'+FieldByName('TXDESCRICAO').asstring+'('+FieldByName('NOROTINA').asstring+')" não encontrada!');

            mi.Caption:=FieldByName('TXDESCRICAO').asstring+'('+FieldByName('NOROTINA').asstring+')'
          end;
//          if mi.Caption <> '' then
//            //miPai.Add(mi)
//            begin
////              miPai.ItemLinks.AddItem()
//            end
//          else
//            showmessage(mipai.name + ' ' + mi.name);
        end;    *)
        next;
      end;
      close;
    end;
  finally
    qyMenu_Sistema.Free;
  end;
end;

//Verificar
procedure TfmMDI.Atualizar_Modulos( psCdModulo : String);
var {hdModulo  : TmxHeader;
    vButton   : TmxButton;
    vMenuItem : TMenuItem;
    vBitMap : TBitMap;}
    i : integer;
    vValida_Modulo:Boolean;

    (*Teste *)
    Tab: TdxRibbonTab;
    dxBar : TdxBar;
//    Grupo: TdxribbonTabgroup;
    Grupos : TdxRibbonTabGroups;
begin
  (*Teste*)
  dxRibbon1.BarManager := dxBarManager1;

//  vBitMap := TBitmap.Create;
//  //Limpa Items da barra de modulos
//  hdModulo := mxOutlookBar.HeaderByName('hdModulo');
//  for i := ( hdModulo.ButtonCount - 1 ) downto 0 do
//    hdModulo.buttons[i].free;
//
//  //Limpa o Menu de Modulos
//  miModulos.Clear;
//  //Limpa o ImageList de Modulos
//  imOutLookBar.Clear;

  //Carrega Modulos
  with dmCOM002A.qyModulo do
  begin
    close;
    open;
    First;
    while not eof do
    begin
      //
      vValida_Modulo := true;
      if fieldbyname('CDMODULO').asString = 'CBF' then
        vValida_Modulo := (dmprincipal.Valida_Parametro('HABILITA_MODULO_CARTA_BONUS','N')= 'S');
      //
//      if (vValida_Modulo) and dmCOM002A.Autorizacao_Modulo( fieldbyname('CDMODULO').asString) then
//      begin
        Tab := dxRibbon1.Tabs.Add;
        Tab.Caption := fieldbyname('NOMODULO').asString;

        dxBarManager1.LockUpdate := True;

        dxBar := dxBarManager1.Bars.Add;
        With dxBar do
        Begin
          IsMainMenu   := True;
          Visible      := True;
          Caption      := fieldbyname('NOMODULO').asString;
          DockingStyle := dsTop;
        End;

        Tab.AddToolBar(dxBar);
        dxBarManager1.LockUpdate := False;

        Carrega_Menu(dxBar, fieldbyname('CDMODULO').asString);

//        dxBarManager1.BeginUpdate;
//        dxBarManager1.Bars.Add;
//        dxBarManager1.Bars[i].Caption := fieldbyname('NOMODULO').asString;
//        Grupos[i].ToolBar := dxBarManager1.Bars[i];
//
//        Tab.AddToolBar(Grupos[i].ToolBar);
//
//        Inc(i);
//        dxBarManager1.EndUpdate;

//        dxBarManager1.Bars.Add;
//        dxBarManager1.Bars[dxBarManager1.Bars.Count -1].Caption := fieldbyname('NOMODULO').asString;
//        Tab.AddToolBar(dxBarManager1.Bars[dxBarManager1.Bars.Count -1]);

        //cria botao do modulo
(*        vButton := hdModulo.AddButton;
        vButton.Caption := fieldbyname('NOMODULO').asString;
        vButton.Hint    := fieldbyname('CDMODULO').asString;
        vButton.OnClick := ModuloClick;
        vButton.Transparent := true;
        vButton.WordWrap := true;
        //Busca o icone do modulo
        try
          vBitMap.LoadFromResourceName(hInstance,fieldbyname('CDMODULO').asString);
          vBitMap.Transparent := true;
          vBitMap.TransparentMode := tmAuto;
          vButton.ImageIndex  := imOutLookBar.AddMasked(vBitMap,clWhite);
          vButton.ImageIndex  := imOutLookBar.AddMasked(vBitMap,vBitMap.canvas.pixels[0,0]);
        except
          vButton.ImageIndex  := -1;
        end;

        //Cria Item de Menu
        vMenuItem:=TMenuItem.Create(self);
        miModulos.Add(vMenuItem);
        vMenuItem.Caption := fieldbyname('NOMODULO').asString;
        vMenuItem.Hint    := fieldbyname('CDMODULO').asString;
        vMenuItem.OnClick := ModuloClick;  *)

        //Seleciona o modulo default
//        if ( fieldbyname('CDMODULO').asString = psCdModulo ) then
//          SelecionaModulo( psCdModulo, fieldbyname('NOMODULO').asString );

//      end;
      next;
    end;
    close;

  end;
//  vBitMap.Free;

end;

//procedure TfmMDI.Atualizar_Atalhos(Sender : TObject);
//  procedure Inclui_Atalho_Interno( psDescricao, psCdPrograma : string; vHeader : TmxHeader );
//  var vrPrograma : TReg_Programa;
//      vButton : TmxButton;
//  begin
//    if dmCOM002A.Autorizacao_Programa( psCdPrograma, vrPrograma ) then
//    begin
//      vButton            := vHeader.AddButton;
//      vButton.Caption    := psDescricao;
//      vButton.OnClick    := ProgramaClick;
//      vButton.Hint       := vrPrograma.CDPROGRAMA;
//      vButton.ImageIndex := vrPrograma.NRINDICE_ICONE;
//      vButton.WordWrap := true;
//    end
//    else
//      showMessage('Acesso não autorizado a referencia do atalho "'+psDescricao+'"');
//  end;
//
//  procedure Inclui_Atalho_Externo( psDescricao, psTXPath : string; vHeader : TmxHeader );
//  var vImage  : Timage;
//      vBitMap : TBitMap;
//      vButton : TmxButton;
//      viAux   : word;
//      viImageIndex : integer;
//  begin
//    if fileExists( psTXPath ) then
//    begin
//      // Busca o Icone do Atalho
//      viAux := 0;
//      vImage := Timage.create(self);
//      vBitMap := TBitMap.Create;
//
//      vImage.Picture.Icon.Handle := ExtractAssociatedIcon(vImage.Picture.Icon.Handle, PCHAR(psTXPath), viAux);
//      vBitMap.Width := vImage.Picture.Icon.Width;
//      vBitmap.Height := vImage.Picture.Icon.Height;
//      vBitmap.FreeImage;
//      vBitmap.Canvas.Draw(0,0,vImage.Picture.Icon);
//      viImageIndex := imOutLookBar.AddMasked(vBitmap,clwhite);
//      vImage.free;
//      vBitMap.free;
//
//      vButton := vHeader.AddButton;
//      vButton.Caption := psDescricao;
//      vButton.OnClick := AtalhoClick;
//      vButton.Hint    := psTXPath;
//      vButton.ImageIndex := viImageIndex;
//      vButton.WordWrap := true;
//    end;
//  end;
//
//var vAtalho_Interno, vAtalho_Externo : TmxHeader;
//    i : integer;
//begin
//  // Limpando Barra de Atalhos
//  vAtalho_Interno := mxOutlookBar.HeaderByName('hdAtalhos_Sistema');
//  for i := ( vAtalho_Interno.ButtonCount - 1 ) downto 0 do
//    vAtalho_Interno.buttons[i].free;
//
//  vAtalho_Externo := mxOutlookBar.HeaderByName('hdOutros_atalhos');
//  for i := ( vAtalho_Externo.ButtonCount - 1 ) downto 0 do
//    vAtalho_Externo.buttons[i].free;
//
//  // Atualizando Atalhos Disponiveis no Menu
//  with dmCOM002A.qyTmp do
//  begin
//    close;
//    sql.clear;
//    sql.add('SELECT * ');
//    sql.add('FROM   ATALHO A ');
//    sql.add('WHERE A.CDOPERADOR = ' + quotedstr(AppSysOper));
//    sql.add('ORDER BY NOATALHO ');
//    open;
//    while not eof do
//    begin
//      if ( not fieldbyname('TXPATH').Isnull ) then
//      begin
//        Inclui_Atalho_Externo( fieldbyname('NOATALHO').asstring,
//                               fieldbyname('TXPATH').asstring,
//                               vAtalho_Externo );
//      end
//      else
//      if not fieldbyname('CDPROGRAMA').IsNull then
//      begin
//        Inclui_Atalho_Interno( fieldbyname('NOATALHO').asstring,
//                               fieldbyname('CDPROGRAMA').asstring,
//                               vAtalho_Interno);
//      end;
//
//      next;
//    end;
//    close;
//  end;
//end;

procedure TfmMDI.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var i : integer;
    vform : TForm;
begin
  CanClose := true;
  vform    := nil;

  if ( not  AppModo_Debug ) and
     ( Application.MessageBox( 'Deseja realmente sair do Sistema?', AppTitle,
                               MB_YESNO + MB_DEFBUTTON1+MB_ICONQUESTION ) = IDNO ) then
  begin
    CanClose := False;
  end;
  if Canclose = true then
  begin
    i := 0;
    while ( i < mdiChildCount  ) and
          ( canClose = true    ) do
    begin
      vform := mdiChildren[i];
      if ( vform is TfmCad ) then
      begin
        if TfmCad(vform).dsMain.Dataset.State in [ dsInsert, dsEdit ] then
           canClose := false
        else
           inc(i);
      end
      else
        inc(i);
    end;
    if canClose = false then
    begin
      showMessage('O programa ' + vform.caption + ' não pode ser fechado !');
      vform.show;
    end;
  end;
end;

procedure TfmMDI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if AppSysOper <> '' then
  begin
//    skdata.Active:=FALSE;
    dmPrincipal.MarcaOperador( AppSysOper, 'N') ; // Marca Como não Logado
  end;
end;

function TfmMdi.inclui_atalho(psNomeAtalho,psPath : string) : boolean;
begin
  with dmCOM002A.qyAtalho do
  begin
    close;
    sql.clear;
    sql.add('SELECT * ');
    sql.add('FROM   ATALHO A ');
    sql.add('WHERE A.CDOPERADOR = ' + quotedstr(AppSysOper));
    sql.add('AND   A.NOATALHO = ' + quotedstr(psNomeAtalho));
    open;
    if eof then
    begin
      insert;
      fieldbyname('CDATALHO').asFloat  := dmPrincipal.Nextval('SEQ_ATALHO');
      fieldbyname('CDOPERADOR').asstring := AppSysOper;
      fieldbyname('NOATALHO').asstring   := psNomeAtalho;
      fieldbyname('TXPATH').asstring     := psPath;
      fieldbyname('NOPASTA').asstring := 'Atalhos';
      post;
      result := true;
    end
    else
    begin
      showMessage('Atalho já cadastrado !');
      result := false;
    end;
    close;
  end;
end;

procedure TfmMDI.Atualizar_Atalhos(Sender : TObject);
  procedure Inclui_Atalho_Interno( psDescricao, psCdPrograma : string{; vHeader : TmxHeader} );
  var vrPrograma : TReg_Programa;
      vButton : TdxBarButton;
  begin
//    if dmCOM002A.Autorizacao_Programa( psCdPrograma, vrPrograma ) then
//    begin
//      vButton            := vHeader.AddButton;
//      vButton.Caption    := psDescricao;
//      vButton.OnClick    := ProgramaClick;
//      vButton.Hint       := vrPrograma.CDPROGRAMA;
//      vButton.ImageIndex := vrPrograma.NRINDICE_ICONE;
//      vButton.WordWrap := true;
//    end
//    else
//      showMessage('Acesso não autorizado a referencia do atalho "'+psDescricao+'"');
  end;

  procedure Inclui_Atalho_Externo( psDescricao, psTXPath : string{; vHeader : TmxHeader });
  var vImage  : Timage;
      vBitMap : TBitMap;
//      vButton : TmxButton;
      viAux   : word;
      viImageIndex : integer;
  begin
    if fileExists( psTXPath ) then
    begin
      // Busca o Icone do Atalho
      viAux := 0;
      vImage := Timage.create(self);
      vBitMap := TBitMap.Create;

      vImage.Picture.Icon.Handle := ExtractAssociatedIcon(vImage.Picture.Icon.Handle, PCHAR(psTXPath), viAux);
      vBitMap.Width := vImage.Picture.Icon.Width;
      vBitmap.Height := vImage.Picture.Icon.Height;
      vBitmap.FreeImage;
      vBitmap.Canvas.Draw(0,0,vImage.Picture.Icon);
      viImageIndex := imOutLookBar.AddMasked(vBitmap,clwhite);
      vImage.free;
      vBitMap.free;

//      vButton := vHeader.AddButton;
//      vButton.Caption := psDescricao;
//      vButton.OnClick := AtalhoClick;
//      vButton.Hint    := psTXPath;
//      vButton.ImageIndex := viImageIndex;
//      vButton.WordWrap := true;
    end;
  end;

var {vAtalho_Interno,
    vAtalho_Externo : TmxHeader;}
    i : integer;
begin
  // Limpando Barra de Atalhos
{  vAtalho_Interno := mxOutlookBar.HeaderByName('hdAtalhos_Sistema');
  for i := ( vAtalho_Interno.ButtonCount - 1 ) downto 0 do
    vAtalho_Interno.buttons[i].free;

  vAtalho_Externo := mxOutlookBar.HeaderByName('hdOutros_atalhos');
  for i := ( vAtalho_Externo.ButtonCount - 1 ) downto 0 do
    vAtalho_Externo.buttons[i].free;}

  // Atualizando Atalhos Disponiveis no Menu
  with dmCOM002A.qyTmp do
  begin
    close;
    sql.clear;
    sql.add('SELECT * ');
    sql.add('FROM   ATALHO A ');
    sql.add('WHERE A.CDOPERADOR = ' + quotedstr(AppSysOper));
    sql.add('ORDER BY NOATALHO ');
    open;


//    while not eof do
//    begin
//      if ( not fieldbyname('TXPATH').Isnull ) then
//      begin
//        Inclui_Atalho_Externo( fieldbyname('NOATALHO').asstring,
//                               fieldbyname('TXPATH').asstring,
//                               nil
//                               {vAtalho_Externo} );
//      end
//      else
//      if not fieldbyname('CDPROGRAMA').IsNull then
//      begin
//        Inclui_Atalho_Interno( fieldbyname('NOATALHO').asstring,
//                               fieldbyname('CDPROGRAMA').asstring,
//                               nil
//                               {vAtalho_Interno});
//      end;
//
//      next;
//    end;
//    close;
  end;
end;

procedure TfmMDI.JvBitBtn1Click(Sender: TObject);
begin
  with criaform('fmPRE001MA',self) do
  begin
    exibeform(self,csNormal,nil, nil);
  end;

//  with criaform('fmCad2',self) do
//  begin
//    exibeform(self,csNormal,nil, nil);
//  end;

//  fmCad2 := TfmCad2.Create(nil);
//  fmCad2.Show;
end;

procedure TfmMDI.miSobreClick(Sender: TObject);
begin
//  Application.CreateForm(TfmSOBRE, fmSOBRE);
//  fmSOBRE.ShowModal;
//  fmSobre.free;
end;

procedure TfmMDI.miAlterar_SenhaClick(Sender: TObject);
begin
//  if AppSysOper <> '' then
//  begin
//    application.createForm(TfmSenha,fmSenha);
//    fmSenha.ShowModal;
//    fmSenha.free;
//  end;
end;

procedure TfmMDI.miCascataClick(Sender: TObject);
begin
  Cascade;
end;

procedure TfmMDI.miLadoaLadoClick(Sender: TObject);
begin
  Tile;
end;

procedure TfmMDI.miOrganizarIconesClick(Sender: TObject);
begin
  ArrangeIcons;
end;

procedure TfmMDI.Atualizar_Menu;
begin

  dmCOM002A.Carrega_Autorizacao_Programas;

  //Verificar
  Atualizar_Modulos(AppIni.ReadString(AppSysOper,'Modulo',''));
  Atualizar_Atalhos(self);

  //Atualiza Panels
  stGeral.Panels[6].Text := 'Polaris: ' + VarToStr(csAppVersaoPolaris);
  stGeral.Panels[2].Text := 'Operador: '+AppSysOper +' - Grupo: '+ AppNoSysGrupo;
  if AppConexao <> '' then
    stGeral.Panels[3].Text := 'Ambiente: ' + AppConexao
  else
    stGeral.Panels[3].Text := '';
  stGeral.Panels[4].Text := datetimetoStr(date);
  stGeral.Panels[5].Text := copy(timetoStr(now()),1,5);
end;

procedure TfmMDI.miSairClick(Sender: TObject);
begin
  close;
end;

procedure TfmMDI.tmHora_atualTimer(Sender: TObject);
begin
  //Atualiza Panels
  stGeral.Panels[5].Text := copy(timetoStr(now()),1,5);
end;

procedure TfmMDI.miIndiceClick(Sender: TObject);
begin
// HtmlHelpShowIndex;
end;

procedure TfmMDI.miConteudoClick(Sender: TObject);
begin
// HtmlHelpShowContents;
end;

procedure TfmMDI.miHomePageClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'www.commarket.com.br', nil, nil, SW_SHOW);
end;

// Rotina de Chamada de todas as telas de dominio
procedure TfmMDI.miAtualizar_MenuClick(Sender: TObject);
begin
  Atualizar_Menu;
end;

procedure TfmMDI.sbForca_SaidaClick(Sender: TObject);
begin
  Application.terminate;
end;

procedure TfmMDI.sbCopyFormClick(Sender: TObject);
var vBitmap : TBitMap;
begin
  if self.ActiveMDIChild <> nil then
  begin
    vBitmap := TBitmap.Create;
    try
      vBitMap := self.ActiveMDIChild.GetFormImage;
      ClipBoard.Assign(vBitmap);
    finally
      vBitmap.Free;
    end;
  end;
end;

procedure TfmMDI.ToolButtonClick(Sender: TObject);
begin
  if sender is TToolButton then
    TToolButton(sender).CheckMenuDropdown;
end;

procedure TfmMDI.miHome_Page_IntertechClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'www.commarket.com.br', nil, nil, SW_SHOW);
end;

procedure TfmMDI.miSuporteClick;
begin
//
end;

procedure TfmMDI.miDicasClick;
begin
//
end;

procedure TfmMDI.miAtualizacaoClick;
begin
//
end;

procedure TfmMDI.miIncluir_Atalho_InternoClick(Sender: TObject);
begin
  with criaform('fmCOM004MA',self) do
  begin
    addParametro('TIPO_ATALHO','I');
    //Verificar
    //exibeform(self,csInclusao,nil,Atualizar_Atalhos);
  end;
end;

procedure TfmMDI.miIncluir_atalho_ExternoClick(Sender: TObject);
begin
  with criaform('fmCOM004MA',self) do
  begin
    addParametro('TIPO_ATALHO','E');
    //Verificar
    //exibeform(self,csInclusao,nil,Atualizar_Atalhos);
  end;

end;

procedure TfmMDI.tbAtalhoClick(Sender: TObject);
begin
  showform('fmCOM004MA');
end;

procedure TfmMDI.FocusColor1ChangeControl(Sender: TObject;
  NewControl: TWinControl; var Change: Boolean);
begin
  Change:=not ((NewControl is TDbCtrlGrid) or (NewControl.Parent is TDbCtrlGrid) );
end;

procedure TfmMDI.miImpExpClick(Sender: TObject);
begin
   showform('fmINT009PR');
end;

procedure TfmMDI.ImportaodasTabelasdeCatlogo1Click(Sender: TObject);
begin
   showform('fmINT025PR');
end;

procedure TfmMDI.miLocalizaProgramaClick(Sender: TObject);
begin
  showform('fmINT007MA_LOCALIZA');
end;

procedure TfmMDI.dbfeProgramaAfterButton(Sender: TObject; var ResultFind: TStrings);
var vsCdPrograma: string;
    vrPrograma    :Treg_Programa;
    vsParametros : Tstrings;
    i:integer;
begin
  vsCdPrograma:=ResultFind.Values['CDPROGRAMA'];
  if(vsCdPrograma<>'' )then
  begin
    if(dmCOM002A.Autorizacao_Programa(vsCdPrograma,vrPrograma))then
    begin
      vsParametros:=TstringList.Create;

      if(sntoboolean(vrPrograma.SNPROGRAMA_LOGICO))then
      begin
        vsCdPrograma:= vrPrograma.CDPROGRAMA_FISICO ;
        vsParametros.Text:=vrPrograma.TXPARAMETRO;
        vsParametros.Add('CDPROGRAMA_LOGICO='+vrPrograma.CDPROGRAMA);
      end;

      with CriaForm('fm'+vsCdPrograma,self) do
      begin
        for i:=0 to vsParametros.Count-1 do
        begin
          AddParametro(vsParametros.Names[i],vsParametros.Values[vsParametros.Names[i]]);
        end;
        ExibeForm;
      end;
      vsParametros.Free;
    end
    else
      ShowMessage('Usuario sem autorização para o programa');
  end;
end;

procedure TfmMDI.tbLoginClick(Sender: TObject);
begin
//  if FileExists(AppDirTempInst + '\polaris_org.bmp') then
//   DeleteFile(AppDirTempInst + '\polaris_org.bmp');
//  Login;
end;

end.

