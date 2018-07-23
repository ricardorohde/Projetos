unit usocket;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp, StdCtrls, ExtCtrls, ComCtrls, Menus,ShellApi,Registry;

type
  TfrmPrincipal = class(TForm)
    ServerSocket1: TServerSocket;
    Panel1: TPanel;
    Label3: TLabel;
    edtPorta: TEdit;
    btnConectar: TButton;
    PopupMenu1: TPopupMenu;
    pmnuiOpen: TMenuItem;
    pmnuiExit: TMenuItem;
    procedure btnEnviarClick(Sender: TObject);
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure FormCreate(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
    procedure ServerSocket1ClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtTextoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure pmnuiOpenClick(Sender: TObject);
    procedure pmnuiExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FNmComputador : string;
    FListConectados : TListBox;
    

    procedure RunOnStartup(sProgTitle, sCmdLine : string; bRunOnce : boolean);

//    function  pubNomeComputador: string;
//    function nomeusuario:string;
    function NetUserName: string;

    procedure MandaMensagem(ipDestino,Mensagem : string);
  protected
    procedure WndProc(var Msg: TMessage); override;

  public
    { Public declarations }
    TrayIconData: TNotifyIconData;
  end;

var
  frmPrincipal: TfrmPrincipal;
  meunro, nrorec: integer;
  const WM_ICONTRAY = WM_USER + 1;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnEnviarClick(Sender: TObject);
begin
(*  try
    try
      mmoConversa.SelAttributes.Color := clblue;
      ServerSocket1.Socket.Connections[0].SendText(FNmComputador + ',' + edtTexto.Text);
      mmoConversa.Lines.Add(FNmComputador +  ' disse: ' + edttexto.Text);
    except
      mmoConversa.Font.Color := clRed;
      mmoConversa.Lines.Add('A Mensagem não foi enviada.');
      mmoConversa.Lines.Add(edttexto.Text);
    end;
  finally
    edttexto.Clear;
    edtTexto.SetFocus;
    mmoConversa.SelStart := mmoConversa.Lines.Count;
  end;*)
end;

procedure TfrmPrincipal.ServerSocket1ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
//var i,j : integer;
begin
  (*mmoConversa.SelAttributes.Color := clGreen;
  mmoConversa.Lines.Add('Conversa Iniciada...');
  btnEnviar.Enabled := true;*)
  FListConectados.Items.Add(socket.LocalAddress);

  //ServerSocket1.Socket.Connections[0];


  //ServerSocket1.Socket.Connections[0];
  //ServerSocket1.Socket.Connections[1];

  {for i := 0 to FListConectados.Items.Count - 1 do
  begin
    ServerSocket1.Socket.Connections[1];
    for j := 0 to FListConectados.Items.Count - 1 do
    begin
      FListConectados.ItemIndex := j;
      ServerSocket1.Socket.SendText(FListConectados.Items.Text);
    end;
  end;}
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var porta : string;
begin
  Application.ShowMainForm := False;

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
  RunOnStartup('socket',Application.ExeName,False);


  FListConectados := TListBox.Create(Application);
  FListConectados.Parent := self;
  FListConectados.Visible := False;

  if btnConectar.Caption = 'Conectar' then
    begin
      porta := '3001';
      try
        serversocket1.Port   := strtointdef(porta,0);
        serversocket1.Active := True;
        //btnEnviar.Enabled    := True;
        btnConectar.Caption  := 'Desconectar';
        edtPorta.Enabled     := False;
      except on e:exception do
        begin
          //mmoConversa.Lines.Add('Erro: '+ e.Message);
          showMessage('Erro: '+ e.Message);
          //btnEnviar.Enabled  := False;
        end;
      end;
    end
  else
    begin
      btnConectar.Caption  := 'Conectar';
      serversocket1.Active := False;
      //btnEnviar.Enabled    := False;
      //edtTexto.Enabled     := False;
      edtPorta.Enabled     := True;
    end;
    
  //btnEnviar.Enabled:=false;
end;

procedure TfrmPrincipal.btnConectarClick(Sender: TObject);
var porta : string;
begin
  if btnConectar.Caption = 'Conectar' then
    begin
      porta := edtPorta.Text;
      try
        serversocket1.Port   := strtointdef(porta,0);
        serversocket1.Active := True;
        //btnEnviar.Enabled    := True;
        btnConectar.Caption  := 'Desconectar';
        edtPorta.Enabled     := False;
      except on e:exception do
        begin
          //mmoConversa.Lines.Add('Erro: '+ e.Message);
          showMessage('Erro: '+ e.Message);
          //btnEnviar.Enabled  := False;
        end;
      end;
    end
  else
    begin
      btnConectar.Caption  := 'Conectar';
      serversocket1.Active := False;
      //btnEnviar.Enabled    := False;
      //edtTexto.Enabled     := False;
      edtPorta.Enabled     := True;
    end; 
(*  if btnConectar.Caption = 'Conectar' then
    begin
      {ClientSocket1.Host:= edtServidor.Text;
      ClientSocket1.port:=strtointdef(edtPorta.text,0);
      ClientSocket1.Active:=true;}
      serversocket1.Port :=strtointdef(edtPorta.text,0);
      serversocket1.Active :=true;
      btnJogar.Enabled:=true;
      btnConectar.Caption := 'Desconectar';
    end
  else
    begin
      serversocket1.Active :=False;
      btnJogar.Enabled:=False;
      btnConectar.Caption := 'Desconectar';

      {ClientSocket1.Active:=False;
      btnJogar.Enabled:=False;
      btnConectar.Caption := 'Conectar';}
    end;*)
end;


procedure TfrmPrincipal.ServerSocket1ClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);

begin
  {mmoConversa.SelAttributes.Color := clPurple;
  mmoConversa.Lines.Add('Conversa Encerrada.');
  btnEnviar.Enabled:=False;}
  FListConectados.Items.Delete(FListConectados.Items.IndexOf(Socket.LocalHost));
end;

procedure TfrmPrincipal.ClientSocket1Read(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  //mmoConversa.Lines.Add(Socket.ReceiveText);
{  if meunro > 0 then
  begin
    if (nrorec + meunro) mod 2 <> 0 then
      showmessage('Seu Nro: ' + inttostr(meunro) + '   Nro Recebido: '+ inttostr(nrorec) + '  VOCÊ GANHOU!')
    else
      showmessage('Seu Nro: ' + inttostr(meunro) + '   Nro Recebido: '+ inttostr(nrorec) + '  VOCÊ PERDEU!');
    nrorec:=0;
    meunro:=0;
  end;}
end;

procedure TfrmPrincipal.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var mensagem,
    IpDestino : string;
begin
  mensagem := Socket.ReceiveText;
  IpDestino := Copy(mensagem,1,pos('*',mensagem)-1);
  Delete(mensagem,1,pos('*',mensagem));
  MandaMensagem(IpDestino,mensagem);
  //abre o form minimizado
  {frmPrincipal.Show;
  ShowWindow(Application.Handle, SW_SHOWMINIMIZED);
  //pisca quando recebe a mensagem
  FlashWindow(Handle, True);
  FlashWindow(Application.Handle, True);}
end;

procedure TfrmPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = chr(13) then
  begin
    if not (activeControl is TMemo) then
    begin
      selectnext(activeControl,true,true);
      Key := chr(0);
    end;
  end;
end;

procedure TfrmPrincipal.edtTextoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {if Key = vk_return then
    btnEnviar.Click;}
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  Shell_NotifyIcon(NIM_DELETE, @TrayIconData);
  if (FListConectados <> nil) then
    FreeandNil(FListConectados);
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
        pmnuiOpen.Click;
      end;
    end;
  end;
  inherited;
end;

procedure TfrmPrincipal.pmnuiOpenClick(Sender: TObject);
begin
  frmPrincipal.Show;
  ShowWindow(Application.Handle, SW_HIDE);

  //ShowWindow(FindWindowEx(FindWindow('Shell_TrayWnd', nil),HWND(0),'TrayNotifyWnd', nil),Sw_show) ;
end;

procedure TfrmPrincipal.pmnuiExitClick(Sender: TObject);
begin
  serversocket1.Active := False;
  Application.ProcessMessages;

  OnDestroy := nil;
  Application.Terminate;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caNone;
  Hide;
end;

procedure TfrmPrincipal.RunOnStartup(sProgTitle, sCmdLine: string;
  bRunOnce: boolean);
//var
//  sKey : string;
  //reg  : TRegIniFile;
begin
  {if( bRunOnce )then
    sKey := 'Once'
  else
    sKey := '';
  reg := TRegIniFile.Create( '' );
  reg.RootKey := HKEY_LOCAL_MACHINE;
  reg.WriteString('Software\Microsoft\Windows\CurrentVersion\Run' + sKey + #0, sProgTitle, sCmdLine );
  reg.Free;}
end;

//function TfrmPrincipal.pubNomeComputador: string;
//const
//   MAX_COMPUTER_LENGTH = 30;
//var
//   pNome : PChar;
//   len : DWord;
//begin
//  pNome := '';
//  try
//    len := MAX_COMPUTER_LENGTH + 1;
//    GetMem(pNome, len);
//    if GetComputerName(pNome, len) then
//      Result := pNome
//    else
//      Result := 'No-Name';
//  finally
//    FreeMem(pNome, len);
//  end;
//end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  //FNmComputador := pubNomeComputador;
  FNmComputador := NetUserName;

  //Hide;
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
//var
  //pfwi : FLASHWINFO;
begin
    {pfwi.cbSize := SizeOf(pfwi);
     pfwi.hwnd := Handle;
     pfwi.dwFlags := FLASHW_ALL or FLASHW_TIMER; // or FLASHW_TIMER;//or FLASHW_TIMERNOFG;
     pfwi.uCount := 10;
     pfwi.dwTimeout := 500;
     FlashWindowEx(pfwi);}

{  FlashWindow(Handle, True);
  FlashWindow(Application.Handle, True);}
end;

//function TfrmPrincipal.nomeusuario:string;
//var
//  Registro: TRegistry;
//begin
//  result:='';
//  Registro := TRegistry.Create;
//  Registro.RootKey := HKEY_CURRENT_USER;
//  if Registro.OpenKey('SoftwareMicrosoftWindowsCurrentVersionExplorer', false) then
//    result:=Registro.ReadString('Logon User Name');
//  Registro.Free;
//end;

function TfrmPrincipal.NetUserName: string;
var
  lpBuffer : PChar;
  nSize : DWord;
const
  Buff_Size = 100;
begin
  nSize := Buff_Size;
  lpBuffer := StrAlloc(Buff_Size);
  GetUserName(lpBuffer,nSize);
  Result := string(lpBuffer);
  StrDispose(lpBuffer);
end;

procedure TfrmPrincipal.MandaMensagem(ipDestino,Mensagem : string);
var i : Integer;
    Endereco : string;
begin
  for i := 0 to ServerSocket1.Socket.ActiveConnections - 1 do
    begin
      endereco := ServerSocket1.Socket.Connections[i].RemoteAddress;
      if (ipDestino = endereco) then
        ServerSocket1.Socket.Connections[i].SendText(Mensagem);
    end;
end;

end.
