unit usocket;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp, StdCtrls, ExtCtrls, ComCtrls, Menus,ShellApi,Registry,
  DB, DBClient, Grids, DBGrids,LIB, cxPC, cxControls;

type
  TfrmPrincipal = class(TForm)
    Client: TClientSocket;
    Panel3: TPanel;
    btnEnviar: TButton;
    edtTexto: TEdit;
    Panel2: TPanel;
    PopupMenu1: TPopupMenu;
    pmnuiOpen: TMenuItem;
    pmnuiExit: TMenuItem;
    pgConversas: TPageControl;
    Panel1: TPanel;
    gridUsuarios: TDBGrid;
    ClientUsuarios: TClientDataSet;
    dtsUsuarios: TDataSource;
    ClientUsuariosUsuario: TStringField;
    ClientUsuariosIP: TStringField;
    PopupMenu2: TPopupMenu;
    Excluir1: TMenuItem;
    ClientUsuariosConversa: TBlobField;
    mmoConversa: TRichEdit;
    MainMenu1: TMainMenu;
    AdicionarUsurio1: TMenuItem;
    Sair1: TMenuItem;
    Configuracoes: TMenuItem;
    Panel4: TPanel;
    Label1: TLabel;
    PopupMenu3: TPopupMenu;
    Excluir2: TMenuItem;
    Novo1: TMenuItem;
    TabSheet1: TTabSheet;
    procedure ServidorClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServidorClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure FormCreate(Sender: TObject);
    procedure ServidorClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure btnEnviarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtTextoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure FormDestroy(Sender: TObject);
    procedure pmnuiOpenClick(Sender: TObject);
    procedure pmnuiExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtTextoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gridUsuariosDblClick(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure pgConversasChange(Sender: TObject);
    procedure ClientError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure mmoConversaExit(Sender: TObject);
    procedure AdicionarUsurio1Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure ConfiguracoesClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Excluir2Click(Sender: TObject);
  private
    FServidor,
    FPorta,
    FUsuario,
    FIP : String;

    FnmComputador : string;

    FUsuariosCad : TStringList;

    procedure RunOnStartup(sProgTitle, sCmdLine : string; bRunOnce : boolean);
    function  pubNomeComputador : string;
    function nomeusuario:string;
    function NetUserName: string;
    procedure LeArquivoUsuarios;
    procedure MandaMensagem(IpDestino : string);

  protected procedure WndProc(var Msg: TMessage); override;
  public
    { Public declarations }
    TrayIconData: TNotifyIconData;

    //function Empty(Value: string): Boolean;

    {property Servidor : string read FServidor write FServidor;
    property Porta    : string read FPorta    write FPorta;}

    property Usuario : string read FUsuario write FUsuario;
    property IP      : string read FIP    write FIP;
  end;
var
  frmPrincipal: TfrmPrincipal;
  meunro, nrorec: integer;
  const WM_ICONTRAY = WM_USER + 1;

implementation

uses uCadastroUsuario, uConfiguracao, uCriptografia;

{$R *.dfm}

procedure TfrmPrincipal.ServidorClientRead(Sender: TObject;
  Socket: TCustomWinSocket);

var mensagem,
    NmServidor : string;
begin
  //mmoConversa.Lines.Add(Socket.ReceiveText);
  mensagem   :=  Socket.ReceiveText;
  NmServidor := Copy(mensagem,1,Pos(',',mensagem)-1);
  mmoConversa.SelAttributes.Color := clRed;
  mmoConversa.Lines.Add(NmServidor + ' Disse: ' + Copy(mensagem,Pos(',',mensagem)+ 1,Length(mensagem)));

  {nrorec:= strtointdef(Socket.ReceiveText,0);
  if meunro > 0 then
  begin
    if (nrorec + meunro) mod 2 <> 0 then
      showmessage('Seu Nro: ' + inttostr(meunro) + '   Nro Recebido: '+ inttostr(nrorec) + '  VOCÊ GANHOU!')
    else
      showmessage('Seu Nro: ' + inttostr(meunro) + '   Nro Recebido: '+ inttostr(nrorec) + '  VOCÊ PERDEU!');
    nrorec:=0;
    meunro:=0;
  end;}
end;

procedure TfrmPrincipal.ServidorClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  {showmessage('Cliente conectou!');
  btnJogar.Enabled:=true;}
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
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

  frmConfiguracao := TfrmConfiguracao.Create(self);
  if not frmConfiguracao.leConfiguracao then
  begin
    Configuracoes.Click;
  end;

  //btnEnviar.Enabled:=false;
end;

procedure TfrmPrincipal.ServidorClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  {showmessage('Cliente Desconectou!');
  btnJogar.Enabled:=False;}
end;

procedure TfrmPrincipal.ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var mensagem,
    NmServidor,
    IpMensageiro : string;

    lcStringList : TStringList;
    lcDescrip : TCriptografia;
begin
  //mmoConversa.Lines.Add(Socket.ReceiveText);
  mensagem   :=  Socket.ReceiveText;

  lcDescrip :=  TCriptografia.create;
  try
    mensagem := lcDescrip.DesCriptografaTexto(mensagem);
  finally
    FreeandNil(lcDescrip);
  end;

  IpMensageiro := Copy(mensagem,1,Pos(':IP',mensagem)-1);
  IpMensageiro := StringReplace(IpMensageiro,frmConfiguracao.Porta+'*','',[rfReplaceAll]);
  delete(mensagem,1,Pos(':IP',mensagem)+ 2);
  NmServidor := Copy(mensagem,1,Pos(',',mensagem)-1);
  mmoConversa.SelAttributes.Color := clred;
  mensagem := Trim(mensagem);
  mmoConversa.Lines.Add(NmServidor + ' Disse: ' + Copy(mensagem,Pos(',',mensagem)+ 1,Length(mensagem)));


  if ClientUsuarios.Locate('IP',IpMensageiro,[]) then
  begin
    lcStringList := TStringList.Create;
    try
      lcStringList.Clear;
      if not Empty(ClientUsuariosConversa.AsString) then
        lcStringList.Add(ClientUsuariosConversa.AsString);
      lcStringList.Add(NmServidor + ' Disse: ' + Copy(mensagem,Pos(',',mensagem)+ 1,Length(mensagem)));
      ClientUsuarios.Edit;
      ClientUsuariosConversa.AsString := lcStringList.Text;
      ClientUsuarios.Post;
    finally
      Freeandnil(lcStringList);
    end;
  end;


  //abre o form minimizado
  {frmPrincipal.Show;
  ShowWindow(Application.Handle, SW_SHOWMINIMIZED);}
  //pisca quando recebe a mensagem
  FlashWindow(Handle, True);
  FlashWindow(Application.Handle, True);
end;

procedure TfrmPrincipal.ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
var i : integer;
begin
  {showmessage('Cliente conectou!');
  btnJogar.Enabled:=true;}
  //mmoConversa.SelAttributes.Color := clGreen;
  //mmoConversa.Lines.Add('Conversa Iniciada...');
  btnEnviar.Enabled := true;

  //for i := 0 to ClientSocket1.
end;

procedure TfrmPrincipal.btnEnviarClick(Sender: TObject);
begin
 // ServerSocket1.Socket.Connections[0].SendText(edtNum.Text);
 // meunro:=strtointdef(edtTexto.text,0);
  //Client.Socket.SendText(edtTexto.text);
  //mmoConversa.SelAttributes.Color := clBlack;
  if not Empty(edtTexto.Text) then
  begin
    if ClientUsuarios.Locate('Usuario',pgConversas.ActivePage.Caption,[]) then
      begin
        MandaMensagem(dtsUsuarios.DataSet.FieldByName('IP').AsString);
        edtTexto.SetFocus;
      end
    else
      Begin
        showMessage('Selecione um usuário');
        edtTexto.SetFocus;
      end;
  end;
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
  if Key = vk_return then
  begin
    btnEnviar.Click;
    Panel2.Enabled := false;
    edtTexto.SetFocus;
    Panel2.Enabled := true;
  end;
end;

procedure TfrmPrincipal.ClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  {mmoConversa.SelAttributes.Color := clPurple;
  mmoConversa.Lines.Add('Conversa Encerrada.');
  btnEnviar.Enabled:=False;}
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  Shell_NotifyIcon(NIM_DELETE, @TrayIconData);
  FreeandNil(FUsuariosCad);
end;

procedure TfrmPrincipal.RunOnStartup(sProgTitle, sCmdLine: string;
  bRunOnce: boolean);
var
  sKey : string;
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
end;

procedure TfrmPrincipal.pmnuiExitClick(Sender: TObject);
begin
  Application.ProcessMessages;
  Client.Active := False;
  FreeandNil(frmPrincipal);
  Application.Terminate;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Action := caNone;

  frmPrincipal.Hide;
  Client.Active:=False;
  abort;
end;

procedure TfrmPrincipal.edtTextoExit(Sender: TObject);
begin
  //mmoConversa.SelStart := mmoConversa.Lines.Count;
end;

function TfrmPrincipal.pubNomeComputador: string;
const
   MAX_COMPUTER_LENGTH = 30;
var
   pNome : PChar;
   len : DWord;
begin
   try
      len := MAX_COMPUTER_LENGTH + 1;
      GetMem(pNome, len);
      if GetComputerName(pNome, len) then
         Result := pNome
      else
         Result := 'No-Name';
   finally
      FreeMem(pNome, len);
   end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
var i : Integer;
begin
  FnmComputador := NetUserName;
  {Client.Host   := FServidor;
  Client.port   := strtointdef(FPorta,0);
  Client.Active := true;}

  {Servidor.Port := 8080;
  Servidor.Active := true;}

  ClientUsuarios.Close;
  ClientUsuarios.CreateDataSet;


  FUsuariosCad := TStringList.Create;
  LeArquivoUsuarios;

  Client.Active := False;
  {Client.Host   := '10.0.3.182';
  Client.port   := 8080;}
  if frmConfiguracao.leConfiguracao then
    begin
      Client.Host   := frmConfiguracao.servidor;
      Client.port   := StrToIntdef(frmConfiguracao.Porta,8080);
      Client.Active := true;
    end
  else
    begin
      showMessage('configure o servidor.');
      Configuracoes.Click;
    end;
  
  //for i := 0 to
end;

function TfrmPrincipal.nomeusuario: string;
var
  Registro: TRegistry;
begin
  result:='';
  Registro := TRegistry.Create;
  Registro.RootKey := HKEY_CURRENT_USER;
  if Registro.OpenKey('SoftwareMicrosoftWindowsCurrentVersionExplorer', false) then
  begin
    result:=Registro.ReadString('Logon User Name');
  end;
  Registro.Free;
end;

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


{function TfrmPrincipal.Empty(Value: Variant): Boolean;
begin
  Result := False;

  case VarType(Value) of
    varEmpty,
    varNull     :  Result := True;

    varSmallInt,
    varInteger,
    varShortInt,
    varByte,
    varWord,
    varInt64    :  Result := (Value = 0);

    varSingle,
    varDouble,
    varCurrency :  Result := (Value = 0.00);

    varBoolean	:  Result := not Value;

    varDate     :  Result := (Value = 0);

    varOleStr,
    varString   :  Result := (Value = '');
  end;
end;}

procedure TfrmPrincipal.LeArquivoUsuarios;
var i:integer;
    lcLinha : string;
begin
  if FileExists(ExtractFilePath(Application.ExeName) + 'Usuarios.txt') then
  begin
    FUsuariosCad.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Usuarios.txt');
    for i := 0 to FUsuariosCad.Count - 1 do
    begin
      lcLinha := FUsuariosCad.Strings[i];
      ClientUsuarios.Append;
      ClientUsuariosUsuario.AsString := Copy(lcLinha,1,pos('-',lcLinha)-1);
      ClientUsuariosIP.AsString      := Copy(lcLinha,pos('-',lcLinha)+ 1,length(lcLinha));
      ClientUsuarios.post
    end;
  end;
end;

procedure TfrmPrincipal.gridUsuariosDblClick(Sender: TObject);
var
  TabSheet2 : TTabSheet;
  lcUsuario :string;
  Index : Integer;


  function ExistePage(pTab : string) : boolean;
  var i : Integer;
  begin
    result := false;
    for i := 0 to pgConversas.PageCount -1 do
    begin
      if (TTabSheet(pgConversas.Pages[i]).Caption = pTab) then
      begin
        Index := i;
        Result := true;
      end;
    end;
  end;
begin
  mmoConversa.Clear;
  lcUsuario := dtsUsuarios.DataSet.FieldByName('Usuario').AsString;

  if not ExistePage(lcUsuario) then
    begin
      TabSheet2 := TTabSheet.Create(pgConversas);
      TabSheet2.PageControl := pgConversas;
      TabSheet2.Caption := lcUsuario;
      TabSheet2.Enabled := false;
      TabSheet2.PageControl.ActivePageIndex := TabSheet2.PageControl.PageCount;
      pgConversas.ActivePage := TabSheet2;
    end
  else
    pgConversas.ActivePageIndex := Index;
end;

procedure TfrmPrincipal.Excluir1Click(Sender: TObject);
var Tab: TTabSheet;
begin
  Tab := pgConversas.ActivePage;

  if ClientUsuarios.Locate('Usuario',pgConversas.ActivePage.Caption,[]) then
  begin
    ClientUsuarios.Delete;

    FUsuariosCad.Clear;
    ClientUsuarios.First;
    while not ClientUsuarios.Eof do
    begin
      FUsuariosCad.Add(ClientUsuariosUsuario.AsString + '-'+ ClientUsuariosIP.AsString);
      ClientUsuarios.Next;
    end;
    FUsuariosCad.SaveToFile(ExtractFilePath(Application.ExeName) + 'Usuarios.txt');
    ClientUsuarios.First;
  end;

  if Assigned(Tab) then
  begin
    Tab.Parent := nil;
    Tab.PageControl := nil;

    FreeAndNil(Tab);
  end;
end;

procedure TfrmPrincipal.pgConversasChange(Sender: TObject);
begin
  if ClientUsuarios.Locate('Usuario',pgConversas.ActivePage.Caption,[]) then
  begin
    //if not Empty(ClientUsuariosConversa.AsString) then
    mmoConversa.Text := StringReplace(ClientUsuariosConversa.AsString,#$D#$A#$D#$A,#$D#$A,[rfReplaceAll]);
  end;
end;

procedure TfrmPrincipal.MandaMensagem(IpDestino : string);
var lcStringList : TStringList;
    lcCrip       : TCriptografia;
    lcMensagem,
    lcMensagemCrip   : string;
begin
  try
    Panel2.Enabled := false;
    pgConversas.ActivePage.Enabled := false;
    mmoConversa.SelAttributes.Color := clBlue;
    lcMensagem := IpDestino + '*'+Client.Socket.LocalAddress +':IP'+ FnmComputador +','+ edtTexto.text;

    lcCrip := TCriptografia.Create;
    try
      lcMensagemCrip := lcCrip.CriptografaTexto(lcMensagem);
      
    finally
      FreeAndNil(lcCrip);
    end;

    Client.Socket.SendText(lcMensagemCrip);

    mmoConversa.Lines.Add(FnmComputador + ' disse: ' + edttexto.Text);

    lcStringList := TStringList.Create;
    try
      lcStringList.Clear;
      if not Empty(ClientUsuariosConversa.AsString) then
        lcStringList.Add(ClientUsuariosConversa.AsString);
      lcStringList.Add(FnmComputador + ' disse: ' + edttexto.Text);
      ClientUsuarios.Edit;
      ClientUsuariosConversa.AsString := lcStringList.Text;
      ClientUsuarios.Post;
    finally
      Freeandnil(lcStringList);
    end;

    edtTexto.Clear;
    edtTexto.SetFocus;
    Panel2.Enabled := true;
    pgConversas.ActivePage.Enabled := True;
  except
    mmoConversa.SelAttributes.Color := clRed;
    mmoConversa.Lines.Add('A Mensagem não foi enviada.');
    mmoConversa.Lines.Add(edttexto.Text);
  end;
end;

procedure TfrmPrincipal.ClientError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  if (ErrorCode = 10061)then
  begin
    ShowMessage('Servidor não conectado');
    Application.Terminate;
    abort;
  end
end;

procedure TfrmPrincipal.mmoConversaExit(Sender: TObject);
begin
  edtTexto.SetFocus;
end;

procedure TfrmPrincipal.AdicionarUsurio1Click(Sender: TObject);
begin
  FUsuario := '';
  FIP      := '';
  frmCadUsuarios := TfrmCadUsuarios.Create(self);
  frmCadUsuarios.ShowModal;

  if not Empty(FUsuario) and not Empty(FIP) then
  begin
    ClientUsuarios.Append;
    ClientUsuariosUsuario.AsString := FUsuario;
    ClientUsuariosIP.AsString      := FIP;
    ClientUsuarios.Post;

    FUsuariosCad.Add(FUsuario + '-'+ FIP);
    FUsuariosCad.SaveToFile(ExtractFilePath(Application.ExeName) + 'Usuarios.txt');
  end;
end;

procedure TfrmPrincipal.Panel1Click(Sender: TObject);
begin
  Panel1.Enabled := true;
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
var Tab: TTabSheet;
begin
  Tab := pgConversas.ActivePage;

  if Assigned(Tab) then
  begin
    Tab.Parent := nil;
    Tab.PageControl := nil;

    FreeAndNil(Tab);
  end;
end;

procedure TfrmPrincipal.ConfiguracoesClick(Sender: TObject);
begin
  if not Assigned(frmConfiguracao)then
    frmConfiguracao := TfrmConfiguracao.Create(self);
  frmConfiguracao.ShowModal;
end;

procedure TfrmPrincipal.Label1Click(Sender: TObject);
var i : Integer;
begin
  if (Label1.Caption = '<<') then
    begin
      Label1.Caption := '>>';

      for i := 152 downto 0 do
      begin
        Panel1.Width := i;
      end;

      Panel1.Enabled := False;
      for i := 563 downto 411 do
      begin
        frmPrincipal.Width := i;
      end;

      for i := 425 downto 262 do
      begin
        edtTexto.Width := i;
      end;

      for i := 451 downto 275 do
      begin
        btnEnviar.Left := i;
      end;
    end
  else
    begin
      Label1.Caption := '<<';
      Panel1.Enabled := True;
      for i := 411 to 563 do
      begin
        frmPrincipal.Width := i;
      end;
      for i := 0 to 152 do
      begin
        Panel1.Width := i;
      end;
      for i := 262 to 425 do
      begin
        edtTexto.Width := i;
      end;
      for i := 275 to 451 do
      begin
        btnEnviar.Left := i;
      end;
    end;
end;

procedure TfrmPrincipal.Excluir2Click(Sender: TObject);
var Tab: TTabSheet;
begin
  Tab := pgConversas.ActivePage;

  ClientUsuarios.Delete;

  FUsuariosCad.Clear;
  ClientUsuarios.First;
  while not ClientUsuarios.Eof do
  begin
    FUsuariosCad.Add(ClientUsuariosUsuario.AsString + '-'+ ClientUsuariosIP.AsString);
    ClientUsuarios.Next;
  end;
  FUsuariosCad.SaveToFile(ExtractFilePath(Application.ExeName) + 'Usuarios.txt');
  ClientUsuarios.First;

  if Assigned(Tab) then
  begin
    Tab.Parent := nil;
    Tab.PageControl := nil;

    FreeAndNil(Tab);
  end;

end;

end.
