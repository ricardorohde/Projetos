unit uPrin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxEdit, cxScheduler, cxSchedulerStorage,
  cxSchedulerCustomControls, cxSchedulerCustomResourceView,
  cxSchedulerDayView, cxSchedulerDateNavigator, cxSchedulerHolidays,
  cxSchedulerTimeGridView, cxSchedulerUtils, cxSchedulerWeekView,
  cxSchedulerYearView, cxSchedulerGanttView, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxScheduler3Painter, dxSkinsdxBarPainter,
  ImgList, cxSchedulerDBStorage, DB, DBTables, dxBar, dxRibbon,
  dxStatusBar, dxRibbonStatusBar, cxClasses,ShellApi, Math, dxBarExtItems,
  cxExportSchedulerLink,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue, dxSkinsdxRibbonPainter,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, cxLocalization;

type
  TfrmAgenda = class(TForm)
    Scheduler: TcxScheduler;
    dxRibbon1Tab1: TdxRibbonTab;
    dxRibbon1: TdxRibbon;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    dxBarManager1: TdxBarManager;
    dxBarApplicationMenu1: TdxBarApplicationMenu;
    dtsAgenda: TDataSource;
    dxbrManager1Bar: TdxBar;
    dxBarGroup1: TdxBarGroup;
    dxbrbtn1: TdxBarButton;
    dxBarButton1: TdxBarButton;
    btnExcel: TdxBarLargeButton;
    btnTexto: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarButton2: TdxBarButton;
    btnHtml: TdxBarLargeButton;
    btnXml: TdxBarLargeButton;
    dxBarManager1Bar1: TdxBar;
    btnDay: TdxBarLargeButton;
    btnEventosSemana: TdxBarLargeButton;
    btnSemana: TdxBarLargeButton;
    btnMes: TdxBarLargeButton;
    btnHora: TdxBarLargeButton;
    btnAno: TdxBarLargeButton;
    dbAgenda: TDatabase;
    tblAgenda: TTable;
    SchedulerDBStorage: TcxSchedulerDBStorage;
    tblAgendaParentID: TIntegerField;
    tblAgendaType: TIntegerField;
    tblAgendaStart: TDateTimeField;
    tblAgendaFinish: TDateTimeField;
    tblAgendaOptions: TIntegerField;
    tblAgendaCaption: TStringField;
    tblAgendaRecurrenceIndex: TIntegerField;
    tblAgendaRecurrenceInfo: TBlobField;
    tblAgendaResourceID: TBlobField;
    tblAgendaLocation: TStringField;
    tblAgendaMessage: TStringField;
    tblAgendaReminderData: TDateTimeField;
    tblAgendaReminderMinutes: TIntegerField;
    tblAgendaState: TIntegerField;
    tblAgendaLabelColor: TIntegerField;
    tblAgendaActualStart: TDateTimeField;
    tblAgendaActualFinish: TDateTimeField;
    tblAgendaSyncIDField: TStringField;
    tblAgendaID: TAutoIncField;
    ppAbrir: TPopupMenu;
    Abrir: TMenuItem;
    SaveDialog: TSaveDialog;
    cxImageList: TcxImageList;
    cxLocalizer1: TcxLocalizer;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnTextoClick(Sender: TObject);
    procedure AbrirClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnDayClick(Sender: TObject);
    procedure btnIrparaDataClick(Sender: TObject);
  private
    { Private declarations }
    FEventCount : Integer;
    FMaxID      : Integer;

    procedure  CriaConectaTabelas(pPathDb : string);
    procedure  ExecuteQueryDB(ComandText: string);
    procedure RealizarTraducaoCxGrid;
//    procedure  ExecutarTrayIcon;
//    procedure  Execute;

  protected
//    procedure WndProc(var Msg: TMessage); override;
    AnchorDate: TDateTime;

  public
    { Public declarations }
    TrayIconData: TNotifyIconData;
  end;

var
  frmAgenda: TfrmAgenda;

const DATABASE_NAME = 'AGENDA';
      DRIVE_NAME  = 'STANDARD';
      //DRIVE_NAME  = 'PARADOX';
      DB_EXTENSION = '.DB';
      WM_ICONTRAY  = WM_USER + 1;


implementation

{$R *.dfm}

procedure TfrmAgenda.FormCreate(Sender: TObject);
var lPath : string;
    ADate : TDateTime;
    I     : Integer;
begin
  inherited;
//  ExecutarTrayIcon;

  ADate := EncodeDate(2005, 9, 30);
  Scheduler.GoToDate(ADate);
  ADate := ADate + Scheduler.OptionsView.WorkStart;
  Scheduler.SelectTime(ADate, ADate, nil);
  FMaxID := 0;
  FEventCount := SchedulerDBStorage.EventCount;
  for I := 0 to FEventCount - 1 do
    FMaxID := Max(FMaxID, SchedulerDBStorage.Events[I].ID);

  lPath := ExtractFilePath(Application.ExeName);

//  if FileExists(lPath + 'tradutor.INI') then
//    begin
//      cxLocalizer1.Locale := 1;
//      cxLocalizer1.LoadFromFile(lPath + 'tradutor.INI');
//      cxLocalizer1.Active := True;
//    end;

  dbAgenda.DatabaseName := DATABASE_NAME;
  dbAgenda.DriverName   := DRIVE_NAME;
  dbAgenda.Params.Add('PATH='+ lPath);

  CriaConectaTabelas(lPath);
  //tblAgenda.IndexName := 'IdxPrimario';
end;

procedure TfrmAgenda.CriaConectaTabelas(pPathDb : string);
begin
  with tblAgenda do
    begin
      if not FileExists((pPathDb) + 'AGENDA' + DB_EXTENSION) then
        begin
          Close;
          DatabaseName := DATABASE_NAME;
          TableName    := 'AGENDA';
          IndexDefs.Clear;
          IndexDefs.Add ('IdxPrimario', 'ID', [ixPrimary]);
          CreateTable;
          ExecuteQueryDB('CREATE UNIQUE INDEX IdxPrimario ON AGENDA (ID)');
          Open;
          IndexName := 'IdxPrimario';
        end
      else
        begin
          Close;
          DatabaseName := DATABASE_NAME;
          TableName    := 'AGENDA';
          Open;
          IndexName := 'IdxPrimario';
        end;
    end;
end;

procedure TfrmAgenda.ExecuteQueryDB(ComandText: string);
var lQuery : TQuery;
begin
  lQuery := TQuery.Create(nil);
  try
    lQuery.DatabaseName := DATABASE_NAME;
    lQuery.SQL.Add(ComandText);
    lQuery.ExecSQL;
  finally
    FreeAndNil(lQuery);
  end;
end;

procedure TfrmAgenda.RealizarTraducaoCxGrid();
begin
  if FileExists(ExtractFilePath(Application.ExeName)+'\TraduçãoDev.ini') then
  begin
    cxLocalizer1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\TraduçãoDev.ini');
    cxLocalizer1.LanguageIndex := 1;
    cxLocalizer1.Active := True;
  end;
end;

procedure TfrmAgenda.FormClose(Sender: TObject; var Action: TCloseAction);
{var
  I: Integer;}
begin
{  if (FEventCount < SchedulerDBStorage.EventCount) and
    (MessageDlg('Você quer excluir eventos criados anteriormente?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      SchedulerDBStorage.BeginUpdate;
      try
        I := 0;
        while I < SchedulerDBStorage.EventCount do
          begin
            if SchedulerDBStorage.Events[I].ID > FMaxID then
              SchedulerDBStorage.Events[I].Delete
            else
              Inc(I);
          end;
      finally
        SchedulerDBStorage.EndUpdate;
      end;
    end;}
end;

procedure TfrmAgenda.FormShow(Sender: TObject);
begin
  RealizarTraducaoCxGrid();
  Scheduler.GoToDate(now);
end;

//procedure TfrmAgenda.Execute;
//begin
//  Query1.DatabaseName := DATABASE_NAME;
//  Query1.SQL.Add('select * from AGENDA');
//  Query1.Open;
//end;

procedure TfrmAgenda.btnTextoClick(Sender: TObject);
var lPath : string;
begin
  lPath := ExtractFilePath(Application.ExeName);
  //Scheduler.Storage.l
  //SchedulerDBStorage.SaveToFile(lPath + 'Agenda.txt');
end;

//procedure TfrmAgenda.ExecutarTrayIcon;
//begin
//  with TrayIconData do
//    begin
//      cbSize := Sizeof(TrayIconData);
//      Wnd := Handle;
//      uID := 0;
//      uFlags := NIF_MESSAGE + NIF_ICON + NIF_TIP;
//      uCallbackMessage := WM_ICONTRAY;
//      hIcon := Application.Icon.Handle;
//      StrPCopy(SzTip, Application.Title);
//    end;
//  Shell_NotifyIcon(NIM_ADD, @TrayIconData);
//end;

//procedure TfrmAgenda.WndProc(var Msg: TMessage);
//var
//  p: TPoint;
//begin
//  case Msg.Msg of
//    WM_USER + 1:
//    case Msg.lParam of
//      WM_RBUTTONDOWN:
//        begin
//          SetForegroundWindow(Handle);
//          GetCursorPos(p);
//          ppAbrir.Popup(p.x,p.y);
//          PostMessage(Handle, WM_NULL, 0, 0);
//        end;
//      WM_LBUTTONDBLCLK:
//        begin
//          Abrir.Click;
//        end;
////      WM_RBUTTONDBLCLK:
////        begin
////          frmAgenda.Show;
////          ShowWindow(Application.Handle, SW_HIDE);
////        end;
//    end;
//  end;
//  inherited;
//end;

procedure TfrmAgenda.AbrirClick(Sender: TObject);
begin
  frmAgenda.Show;
  ShowWindow(Application.Handle, SW_HIDE);
end;

procedure TfrmAgenda.btnExcelClick(Sender: TObject);

  procedure ExportToFile(AType: Integer);
  begin
    SaveDialog.FilterIndex := AType;
    if SaveDialog.Execute then
      begin
        case AType of
          1:
            cxExportSchedulerToExcel(SaveDialog.FileName, Scheduler);
          2:
            cxExportSchedulerToText(SaveDialog.FileName, Scheduler);
          3:
            cxExportSchedulerToHTML(SaveDialog.FileName, Scheduler);
          4:
            cxExportSchedulerToXML(SaveDialog.FileName, Scheduler);
        end;
      end;
  end;
begin
  case (Sender as TdxBarLargeButton).Tag of
//    0: cxSchedulerExportToOutlook(Scheduler.Storage);
    1..4:
      ExportToFile((Sender as TdxBarLargeButton).Tag);
  end;
end;

procedure TfrmAgenda.btnDayClick(Sender: TObject);
begin
  if not Scheduler.ViewWeek.Active then
    AnchorDate := Scheduler.SelectedDays[0];

  Scheduler.SelectDays([AnchorDate], TdxBarLargeButton(Sender).Tag in [0, 1]);
  case TdxBarLargeButton(Sender).Tag of
    0:
      begin
        Scheduler.ViewDay.Active := True;
        Scheduler.GoToDate(now);
      end;
    1:
      Scheduler.SelectWorkDays(Date);
    2:
      Scheduler.ViewWeek.Active := True;
    3:
      Scheduler.GoToDate(Scheduler.SelectedDays[0], vmMonth);
    4:
      Scheduler.ViewTimeGrid.Active := True;
    5:
      Scheduler.ViewYear.Active := True; 
  end;
end;

procedure TfrmAgenda.btnIrparaDataClick(Sender: TObject);
//var
//  ADate: TDateTime;
//  AMode: TcxSchedulerViewMode;
begin
//  ADate := Scheduler.SelectedDays[0];
//  if cxShowGoToDateDialog(Scheduler, Scheduler.LookAndFeel, ADate, AMode) then
//    Scheduler.GoToDate(ADate, AMode);
end;

end.


