

unit uPrin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp, StdCtrls, ExtCtrls, ComCtrls, Menus,ShellApi,Registry,
  OleCtrls, SHDocVw;

type
  TfrmPrincipal = class(TForm)
    PopupMenu1: TPopupMenu;
    pmnuiExit: TMenuItem;
    Abrir: TMenuItem;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure AbrirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pmnuiExitClick(Sender: TObject);
    procedure pmnuiOpenClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }

  protected
    procedure WndProc(var Msg: TMessage); override;

  public
    { Public declarations }
    TrayIconData: TNotifyIconData;
  end;

var
  frmPrincipal: TfrmPrincipal;

const WM_ICONTRAY  = WM_USER + 1;


implementation

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  with TrayIconData do
    begin
      cbSize := Sizeof(TrayIconData);
      Wnd := Handle;
      uID := 0;
      uFlags := NIF_MESSAGE + NIF_ICON + NIF_TIP;
      uCallbackMessage := WM_ICONTRAY;
      hIcon := Application.Icon.Handle;
      StrPCopy(SzTip, Application.Title);
    end;
  Shell_NotifyIcon(NIM_ADD, @TrayIconData);
end;

procedure TfrmPrincipal.WndProc(var Msg: TMessage);
var
  p: TPoint;
begin
  case Msg.Msg of
    WM_USER + 1:
    case Msg.lParam of
      WM_RBUTTONDOWN:
        begin
          SetForegroundWindow(Handle);
          GetCursorPos(p);
          PopupMenu1.Popup(p.x,p.y);
          PostMessage(Handle, WM_NULL, 0, 0);
        end;
      WM_LBUTTONDBLCLK:
        begin
          Abrir.Click;
        end;
//      WM_RBUTTONDBLCLK:
//        begin
//          frmAgenda.Show;
//          ShowWindow(Application.Handle, SW_HIDE);
//        end;
    end;
  end;
  inherited;
end;

procedure TfrmPrincipal.AbrirClick(Sender: TObject);
begin
  frmPrincipal.Show;
  ShowWindow(Application.Handle, SW_HIDE);
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.Hide;
  abort;
end;

procedure TfrmPrincipal.pmnuiExitClick(Sender: TObject);
begin
  FreeandNil(frmPrincipal);
  Application.Terminate;
end;

procedure TfrmPrincipal.pmnuiOpenClick(Sender: TObject);
begin
  frmPrincipal.Show;
  ShowWindow(Application.Handle, SW_HIDE);
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  //ShowMessage('Teste');
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
//  WebBrowser1.Navigate('http://stat10.novotempo.com/aovivo/radio/');
  ShowWindow(Application.Handle, SW_HIDE);
  Timer1.Enabled:= True;
end;

end.


