{*******************************************************}
{                                                       }
{  Form padrao para criacao de relatorios no QuickRep   }
{                                                       }
{  Copyright (c) 1998 Alterdata Tecnologia              }
{                                                       }
{*******************************************************}
{-------------------------------------------------------------------------------
PROCESSO    DATA         VERSÃO  PROGR.         OBS.:
================================================================================
0011053026  04.01.2005   3.0906  Adoniram.dsn   minimizar o sistema quando mini-
                                                mizar relatório.
0011505293  07/06/2006           Alex@dsn       Inclusão do Componente AltSetupPrintQRP
                                                para a impressão correta dos Relatórios.
-------------------------------------------------------------------------------}
unit QrPadrao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Db, DBTables, Qrctrls,
  quickrpt, ExtCtrls, AltCfgPHD, Forms, SetupTable, TXtraFil, Menus, Buttons,
  StdCtrls, Alterdata, AlterdataTypes, Alterdata_consts, AlterdataDatabase, AjustaQuickReport,
  Mask, rxToolEdit, QRPrntr, ComCtrls, ImgList, ToolWin, alterdata_databaseskin,
  QRExport, AltSetupPrintQrp, MemDS, DBAccess, Uni, ConnectionLink;

type
  TQRPreviewStruct = class
    MainForm      : TForm;
    PageControl   : TPageControl;
    Toolbar       : TToolbar;
    QRPreview     : TQRPreview;
    btnSearch     : TToolButton;
    btnTumbs      : TToolButton;
    btnZoom100    : TToolButton;
    btnFitToWidth : TToolButton;
    btnFitToHeight: TToolButton;
    btnPrint      : TToolButton;
    ImageList     : TImageList;
  end;


  TfrmRelatorioPadrao = class(TForm)
    QuickRep: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    lblHora: TQRSysData;
    QRSysData3: TQRSysData;
    lblData: TQRSysData;
    qrdTitulo: TQRSysData;
    qrtnmEmpresa: TQRLabel;
    Table: TSetupTable;
    qrtSoftOwner: TQRLabel;
    Timer1: TTimer;
    tbExtendedControls: TToolBar;
    ImageList1: TImageList;
    btnOnClient: TToolButton;
    btnShowTumbNails: TToolButton;
    btnZoomIn: TToolButton;
    btnZoomOut: TToolButton;
    ComboEdit1: TComboEdit;
    AltSetupPrintQrp: TAltSetupPrintQrp;
    QRExcelFilter1: TQRExcelFilter;
    QRCSVFilter1: TQRCSVFilter;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;var PrintReport: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ComboEdit1Exit(Sender: TObject);
    procedure ComboEdit1KeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure btnShowTumbNailsClick(Sender: TObject);
    procedure btnOnClientClick(Sender: TObject);
    procedure btnZoomInClick(Sender: TObject);
    procedure btnZoomOutClick(Sender: TObject);
    function getSkinComponent: TAltDataBaseVclSkin;
  private
    { Private declarations }
    FShowDateTime  : Boolean;
    FShowRuler     : Boolean;
    FSoftOwner     : String;
    FEmpName       : String;

   {============================================================================
    As variaveis e procedimentos abaixo foram criados para atender ao processo
    0011053026 para que ao minimizar o relatório todo o aplicativo seja minimizado
    evitando assim que o relatório trave o programa. Foi usado
    Application.MainForm.Handle na procedure lWndProc, pois Application.Handle
    estava causando uma violação de acesso ao minimizar.
    Adoniram.dsn - processo 0011053026 - 04.01.2005
    ============================================================================}
    FormPreview : TForm;                
    OldWndProc  : TWndMethod;
    OldOnClose	: TCloseEvent;


    FQRPreviewStruct : TQRPreviewStruct;

    oldBtnPrintClick,
    oldBtnZoom100Click    ,
    oldBtnFitToWidthClick ,
    oldBtnFitToHeightClick:TNotifyEvent;
    FPrintFromPreview: Boolean;
    FonSendToClient: TNotifyEvent;
    FShowExtendedControls: Boolean;

    procedure btnPrintonClick(Sender:TObject);
    procedure btnZoom100onClick(Sender:TObject);
    procedure btnFitToWidthonClick(Sender:TObject);
    procedure btnFitToHeightonClick(Sender:TObject);
    procedure createExtendedControls;

    procedure refreshZoom;
    function getQRPreviewStruct:TQRPreviewStruct;

    procedure OnIdle(Sender:TObject;var Done:Boolean);
    procedure OnMessage(var Msg:tagMsg;var Handled:Boolean);

    procedure lWndProc(var Msg:TMessage);
    procedure FormPreviewOnClose(Sender: TObject; var Action: TCloseAction);
    procedure setonSendToClient(Value:TNotifyEvent);


    //------------------------------------------------------------------------------
    //Função para resolver cagada da lib por favor não retire sem falar comigo antes
    //Mendes 24/10/2007
    function ExisteDataBase(AliasName:String) : Boolean;
   public
    { Public declarations }

    property ShowDateTime         : Boolean      read FShowDateTime         write FShowDateTime;
    property SoftOwner            : String       read FSoftOwner            write FSoftOwner;
    property ShowRuler            : Boolean      read FShowRuler            write FShowRuler;
    property EmpName              : String       read FEmpName              write FempName;
    property PrintFromPreview     : Boolean      read FPrintFromPreview     write FPrintFromPreview;
    property onSendToClient       : TNotifyEvent read FonSendToClient       write setonSendToClient;
    property ShowExtendedControls : Boolean      read FShowExtendedControls write FShowExtendedControls;
  end;

var
  frmRelatorioPadrao: TfrmRelatorioPadrao;

implementation

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TfrmRelatorioPadrao.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintMetafileFromPreview := FPrintFromPreview;


  // Propriedade para mostrar ou não a data.
  lblData.Enabled      := FShowDateTime;

  // Propriedade para mostrar ou não a hora.
  lblHora.Enabled      := FShowDateTime;

  // Propriedade para capturar o nome da Empresa dona do software.
  qrtSoftOwner.Caption := FSoftOwner;

  // Propriedade para capturar o nome da Empresa que vai ser emitida.
  qrtnmEmpresa.Caption := FEmpName;

  // Propriedade para mostrar ou não os títulos das conlunas.
  ColumnHeaderBand1.Enabled := FShowRuler;
end;
//------------------------------------------------------------------------------
procedure TfrmRelatorioPadrao.FormCreate(Sender: TObject);
var
  Bureau : TCfgphd;
begin
  Application.OnIdle    := OnIdle;

  //setup the detault
  FShowDateTime := true;
  FShowRuler    := true;
  if TConnectionLink.GetConnection('WPHD') <> nil then
    Bureau := TCfgphd.Create(Self)
  else
    Bureau := nil;

  try
    if (Bureau <> nil) and (Bureau.infEmpresa <> nil) then
    begin
      FEmpName   := '';
      FSoftOwner := Bureau.infEmpresa.Estabelecimento;
    end;
  finally
    if (Bureau <> nil) and (Bureau.infEmpresa <> nil) then
      Bureau.Free;
  end;

  AjustarQuickReport(QuickRep);

  FPrintFromPreview     := True;
  FShowExtendedControls := True;
end;
//------------------------------------------------------------------------------
procedure TfrmRelatorioPadrao.FormDestroy(Sender: TObject);
begin
  Table.close;
end;
//------------------------------------------------------------------------------
procedure TfrmRelatorioPadrao.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  if not OpenTable(Table) then
    Abort
end;
//------------------------------------------------------------------------------
procedure TfrmRelatorioPadrao.OnIdle(Sender: TObject; var Done: Boolean);
const
 JANELA_DA_FRENTE    = 0;
 CLASSE_DO_RELATORIO = 'TQRStandardPreview';
begin
{==============================================================================
 Pego o form do relatório para alterar o procedimento de tratamento de mensagens
 para que quando minimizar o relatório, minimize o form principal junto e conse-
 quentemente a aplicação.
 Só associo o procedimento OnMessage ao OnMessage do application aqui para que
 não ocorra erros quando o relatório não for exibido, mas apenas criado. Isso
 acontece quando o relatório é gerado em arquivo texto.
 Adoniram.dsn - processo 0011053026 - 04.01.2005
 ==============================================================================}
  if(Screen.Forms[JANELA_DA_FRENTE].ClassName = CLASSE_DO_RELATORIO)then begin
    FormPreview            := Screen.Forms[JANELA_DA_FRENTE];
    OldWndProc             := FormPreview.WindowProc;
    OldOnClose             := FormPreview.OnClose;
    FormPreview.OnClose    := FormPreviewOnClose;
    FormPreview.WindowProc := lWndProc;
    Application.OnMessage  := OnMessage;
    Application.OnIdle     := nil;
    Done                   := True;
  end;
end;
//------------------------------------------------------------------------------
procedure TfrmRelatorioPadrao.lWndProc(var Msg: TMessage);
begin
  OldWndProc(Msg);
  if( Msg.Msg = WM_SYSCOMMAND )and( Msg.WParam = SC_MINIMIZE )then begin
    PostMessage(Application.MainForm.Handle,Msg.Msg,Msg.WParam,0);
  end;
end;
//------------------------------------------------------------------------------
procedure TfrmRelatorioPadrao.OnMessage(var Msg:tagMsg;var Handled:Boolean);
begin
  if(Msg.message = WM_SYSCOMMAND)and(Msg.WParam = SC_RESTORE )then begin
    PostMessage(FormPreview.Handle,Msg.message,SC_MAXIMIZE,0);
  end;
end;
//------------------------------------------------------------------------------
procedure TfrmRelatorioPadrao.FormPreviewOnClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.OnIdle     := nil;
  Application.OnMessage  := nil;
  FormPreview.WindowProc := OldWndProc;
  FormPreview.OnClose    := OldOnClose;
  OldOnClose(Sender,Action);
end;
//------------------------------------------------------------------------------
function TfrmRelatorioPadrao.getQRPreviewStruct: TQRPreviewStruct;
var
 I:Integer;
begin
   result := nil;
   {O EXIT ABAIXO FOI COLOCADA PARA QUE NÃO SEJAM INSERIDOS OS COMPONENTES EXTENDIDOS}
   Exit;

   if Screen.Forms[0].ClassName = 'TQRStandardPreview'then begin
     result := TQRPreviewStruct.Create;
     result.MainForm := Screen.Forms[0];
     for I := 0 to result.MainForm.ControlCount-1 do begin
        if result.MainForm.Controls[I] is TPageControl then begin
          result.PageControl := TPageControl( result.MainForm.Controls[I] );
          result.PageControl.Visible := False;
        end
        else
          if result.MainForm.Controls[I] is TToolBar  then begin
            result.Toolbar        := TToolbar( result.MainForm.Controls[I] );
            result.btnFitToHeight := result.Toolbar.Buttons[0];
            result.btnFitToWidth  := result.Toolbar.Buttons[1];
            result.btnZoom100     := result.Toolbar.Buttons[2];
            result.btnSearch      := result.Toolbar.Buttons[9];
            result.btnTumbs       := result.Toolbar.Buttons[10];
            result.btnPrint       := result.Toolbar.Buttons[13];

            result.btnSearch.Visible := False;
            result.btnTumbs.Visible  := False;

            oldBtnPrintClick       := result.btnPrint.OnClick;
            oldBtnZoom100Click     := result.btnZoom100.OnClick;
            oldBtnFitToWidthClick  := result.btnFitToWidth.OnClick;
            oldBtnFitToHeightClick := result.btnFitToHeight.OnClick;


            result.btnPrint.OnClick       := btnPrintonClick;
            result.btnZoom100.OnClick     := btnZoom100onClick;
            result.btnFitToWidth.OnClick  := btnFitToWidthonClick;
            result.btnFitToHeight.OnClick := btnFitToHeightonClick;
          end
          else
            if result.MainForm.Controls[I] is  TQRPreview  then result.QRPreview := TQRPreview(result.MainForm.Controls[I]);
     end;
     for I := 0 to result.MainForm.ComponentCount-1 do
       if result.MainForm.Components[I] is TImageList then
         result.ImageList := result.MainForm.Components[I] as TImageList;
   end;
end;
//------------------------------------------------------------------------------
procedure TfrmRelatorioPadrao.SpeedButton2Click(Sender: TObject);
begin

end;
//------------------------------------------------------------------------------
procedure TfrmRelatorioPadrao.btnFitToHeightonClick(Sender: TObject);
begin
  if assigned(oldBtnFitToHeightClick)then oldBtnFitToHeightClick(Sender);
  refreshZoom;
end;
//------------------------------------------------------------------------------
procedure TfrmRelatorioPadrao.btnFitToWidthonClick(Sender: TObject);
begin
  if assigned(oldBtnFitToWidthClick)then oldBtnFitToWidthClick(Sender);
  refreshZoom;
end;
//------------------------------------------------------------------------------
procedure TfrmRelatorioPadrao.btnZoom100onClick(Sender: TObject);
begin
  if assigned(oldBtnZoom100Click)then oldBtnZoom100Click(Sender);
  refreshZoom;
end;
//------------------------------------------------------------------------------
procedure TfrmRelatorioPadrao.refreshZoom;
begin
  ComboEdit1.Text := intToStr(FQRPreviewStruct.QRPreview.Zoom);
  FQRPreviewStruct.QRPreview.UpdateZoom;
end;
//------------------------------------------------------------------------------
procedure TfrmRelatorioPadrao.Timer1Timer(Sender: TObject);
begin
  FQRPreviewStruct := getQRPreviewStruct;
  if assigned(FQRPreviewStruct)then begin
    Timer1.Enabled := False;
    if FShowExtendedControls then
      createExtendedControls
    else
      FQRPreviewStruct.Toolbar.Buttons[8].Visible := False;
  end;
end;
//------------------------------------------------------------------------------
procedure TfrmRelatorioPadrao.setonSendToClient(Value:TNotifyEvent);
begin
  if assigned(Value)then begin
    FonSendToClient     := Value;
    btnOnClient.Visible := True;
  end;
end;
//------------------------------------------------------------------------------
procedure TfrmRelatorioPadrao.ComboEdit1Exit(Sender: TObject);
begin
  refreshZoom;
end;
//------------------------------------------------------------------------------
procedure TfrmRelatorioPadrao.ComboEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if not (key in [ord('0')..ord('9'),VK_RETURN,VK_BACK,VK_DELETE])then exit;

  if key = VK_RETURN then begin
    if(strToInt(comboEdit1.Text) > 10)and (strToInt(comboEdit1.Text) < 1200) then begin
      FQRPreviewStruct.QRPreview.Zoom := strToInt(comboEdit1.Text);
      refreshZoom;
      comboEdit1.selectAll;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfrmRelatorioPadrao.btnPrintonClick(Sender: TObject);
begin
  if assigned(oldBtnPrintClick)then oldBtnPrintClick(Sender);
  if PrintMetafileFromPreview then
    if assigned(QuickRep.afterPrint)then QuickRep.AfterPrint(QuickRep);
end;
//------------------------------------------------------------------------------
procedure TfrmRelatorioPadrao.createExtendedControls;
var
 skin: TAltDataBaseVclSkin;
 I   : Integer;
begin
  skin := getSkinComponent;

  tbExtendedControls.removeControl(btnOnClient     );
  tbExtendedControls.removeControl(btnShowTumbNails);
  tbExtendedControls.removeControl(btnZoomIn       );
  tbExtendedControls.removeControl(ComboEdit1      );
  tbExtendedControls.removeControl(btnZoomOut      );

  btnZoomOut.Left := FQRPreviewStruct.Toolbar.Buttons[8].Left + FQRPreviewStruct.Toolbar.Buttons[8].Width;
  ComboEdit1.Left   := FQRPreviewStruct.Toolbar.Buttons[8].Left + FQRPreviewStruct.Toolbar.Buttons[8].Width;
  btnZoomIn.Left := FQRPreviewStruct.Toolbar.Buttons[8].Left + FQRPreviewStruct.Toolbar.Buttons[8].Width;
  btnShowTumbNails.Left := FQRPreviewStruct.Toolbar.Buttons[8].Left + FQRPreviewStruct.Toolbar.Buttons[8].Width;
  btnOnClient.Left := FQRPreviewStruct.Toolbar.Buttons[8].Left + FQRPreviewStruct.Toolbar.Buttons[8].Width;
  btnOnClient.Visible := assigned(FonSendToClient);

  FQRPreviewStruct.Toolbar.InsertControl(btnZoomOut      );
  FQRPreviewStruct.Toolbar.InsertControl(ComboEdit1      );
  FQRPreviewStruct.Toolbar.InsertControl(btnZoomIn       );
  FQRPreviewStruct.Toolbar.InsertControl(btnShowTumbNails);
  FQRPreviewStruct.Toolbar.InsertControl(btnOnClient     );

  btnOnClient.ImageIndex      := FQRPreviewStruct.ImageList.Count;
  btnShowTumbNails.ImageIndex := FQRPreviewStruct.ImageList.Count+1;
  btnZoomIn.ImageIndex        := FQRPreviewStruct.ImageList.Count+2;
  btnZoomOut.ImageIndex       := FQRPreviewStruct.ImageList.Count+3 ;

  for I := 0 to ImageList1.Count-1 do
    FQRPreviewStruct.ImageList.AddImage(ImageList1,I);

  if assigned(skin)and assigned(skin.SkinData)then
    skin.SkinData.UpdateSkinControl(FQRPreviewStruct.MainForm);

  refreshZoom;
end;
//------------------------------------------------------------------------------
procedure TfrmRelatorioPadrao.btnShowTumbNailsClick(Sender: TObject);
begin
  FQRPreviewStruct.PageControl.Visible := btnShowTumbNails.Down;
  FQRPreviewStruct.btnSearch.Visible   := btnShowTumbNails.Down;
  FQRPreviewStruct.btnTumbs.Visible    := btnShowTumbNails.Down;
end;
//------------------------------------------------------------------------------
procedure TfrmRelatorioPadrao.btnOnClientClick(Sender: TObject);
begin
  if assigned(FonSendToClient)then FonSendToClient(Sender);
end;
//------------------------------------------------------------------------------
procedure TfrmRelatorioPadrao.btnZoomInClick(Sender: TObject);
begin
  if FQRPreviewStruct.QRPreview.Zoom < 1200 then begin
    FQRPreviewStruct.QRPreview.Zoom := FQRPreviewStruct.QRPreview.Zoom + 10;
    refreshZoom;
  end;
end;
//------------------------------------------------------------------------------
procedure TfrmRelatorioPadrao.btnZoomOutClick(Sender: TObject);
begin
  if FQRPreviewStruct.QRPreview.Zoom > 10 then begin
    FQRPreviewStruct.QRPreview.Zoom := FQRPreviewStruct.QRPreview.Zoom - 10;
    refreshZoom;
  end;
end;
//------------------------------------------------------------------------------
function TfrmRelatorioPadrao.getSkinComponent: TAltDataBaseVclSkin;
var
 I:Integer;
begin
  result := nil;
  for I := 0 to Application.MainForm.ComponentCount-1 do
    if Application.MainForm.Components[I] is TAltDataBaseVclSkin then
      result :=  Application.MainForm.Components[I] as TAltDataBaseVclSkin;
end;

//------------------------------------------------------------------------------
//Função para resolver cagada da lib por favor não retire sem falar comigo antes
//mendes 24/10/2007
function TfrmRelatorioPadrao.ExisteDataBase(AliasName:String) : Boolean;
//var
//  lIndex : Integer;
//  MainForm : TForm;
begin
  //>>>>CONVERSÃO UNIDAC
  {Result := false;
  MainForm := Application.MainForm;
  if (AliasName <> '') and (MainForm <> nil) then
  begin
      lIndex := 0;
      while (lIndex <= Pred(MainForm.ComponentCount)) and (not Result) do
      try
        if ((MainForm.Components[lIndex].ClassNameIs('TnxDataBase')) or
            (MainForm.Components[lIndex].ClassNameIs('TShopDataBase'))) and
           (UpperCase(TnxDataBase(MainForm.Components[lIndex]).AliasName) = UpperCase(AliasName)) then
          Result := true ;
      finally
        inc(lIndex);
      end;
  end;}
end;

end.
