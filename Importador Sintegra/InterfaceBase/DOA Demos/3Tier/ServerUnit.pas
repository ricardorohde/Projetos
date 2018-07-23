// Direct Oracle Access - Server
// Allround Automations
// support@allroundautomations.nl
// http://www.allroundautomations.nl
//
// This application demonstrates:
// - The Server part of a 3 Tier application
// - The use of the TOracleDataSet component in a Server Application

// This is a tray-icon application, it will show up as an icon on the
// bottom right of your screen.
// Click it to display the main form.

unit ServerUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ShellAPI;

type
  TMainForm = class(TForm)
    StatusPanel: TPanel;
    ButttonPanel: TPanel;
    ShutDownButton: TButton;
    LogMemo: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ShutDownButtonClick(Sender: TObject);
  private
    TrayIconData: TNotifyIconData;
    function  AddIcon: Boolean;
    function  DeleteIcon: Boolean;
    procedure TrayIconClick;
  protected
    procedure WndProc(var Msg: TMessage); override;
  public
    { Public declarations }
  end;

// These two procedures are called from the ServerDM unit
procedure Log(S: string);
procedure UpdateStatusLine(Change: Integer);

var
  MainForm: TMainForm = nil;
  // Counting the number of times a connection is made
  Connections: Integer = 0;

implementation

{$R *.DFM}

// The first part handles the TrayIcon
var
  CloseAction : TCloseAction = caNone;
const
  WM_TRAYICON = WM_USER + 1;

function TMainForm.AddIcon: Boolean;
begin
  with TrayIconData do
  begin
    cbSize := sizeof(TNotifyIconData);
    wnd := Handle;
    uID := 0;
    uFlags := NIF_Message + NIF_Icon + NIF_Tip;
    hIcon := Icon.Handle;
    StrPCopy(szTip, Caption);
    uCallbackMessage := WM_TRAYICON;
  end;
  Result := Shell_NotifyIcon(NIM_Add, @TrayIconData);
end;

function TMainForm.DeleteIcon: Boolean;
begin
  Result := Shell_NotifyIcon(NIM_Delete, @TrayIconData);
end;

procedure TMainForm.TrayIconClick;
begin
  Application.ShowMainForm := True;
  Visible := True;
  SetForegroundWindow(Handle);
end;

procedure TMainForm.WndProc(var Msg : TMessage);
begin
  begin
    if (Msg.msg = WM_TRAYICON) then
    case Msg.lParam of
      WM_LBUTTONUP : TrayIconClick;
      WM_RBUTTONUP : TrayIconClick;
    end else
      inherited WndProc(Msg);
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  AddIcon;
  LogMemo.Clear;
  UpdateStatusLine(0);
  Log('Application Server started.');
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  DeleteIcon;
end;

// The default close simply hides the main form
procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CloseAction;
  if Action = caNone then Visible := False;
end;

// Force this application to stop
procedure TMainForm.ShutDownButtonClick(Sender: TObject);
begin
  CloseAction := caFree;
  Close;
  CloseAction := caNone;
end;

// Display a line in the TMemo
procedure Log(S: string);
begin
  S := FormatDateTime('hh:mm:ss ', Now) + S;
  if MainForm <> nil then MainForm.LogMemo.Lines.Add(S);
end;

// Display the number of connections
procedure UpdateStatusLine(Change: Integer);
var S: string;
begin
  Inc(Connections, Change);
  if MainForm <> nil then
  begin
    S := '   ' + IntToStr(Connections) + ' Connection';
    if Connections <> 1 then S := S + 's';
    MainForm.StatusPanel.Caption := S;
  end;
end;

end.
