

unit uPrin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp, StdCtrls, ExtCtrls, ComCtrls, Menus,ShellApi,Registry,
  OleCtrls, SHDocVw;

type
  TWThreadMonitorar = class(TThread)
  private
    FTempoAtualizacao: Integer;
    procedure AtualizaTela();
    procedure SetTempoAtualizacao(const Value: Integer);
  protected
    procedure Execute(); override;
  public
    constructor Create(CreateSuspended: Boolean; AForm: TForm);
    property TempoAtualizacao: Integer read FTempoAtualizacao write SetTempoAtualizacao;
  end;


  TfrmPrincipal = class(TForm)
    PopupMenu1: TPopupMenu;
    pmnuiExit: TMenuItem;
    Abrir: TMenuItem;
    TrayIcon1: TTrayIcon;
    procedure FormCreate(Sender: TObject);
    procedure AbrirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pmnuiExitClick(Sender: TObject);
    procedure pmnuiOpenClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    procedure BuscarDadosRegistro_R1000(const Condominio: Integer);
    { Private declarations }

  protected
  public
    { Public declarations }
    TrayIconData: TNotifyIconData;
  end;

var
  frmPrincipal: TfrmPrincipal;

const WM_ICONTRAY  = WM_USER + 1;

implementation

uses Module;

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  _Thread: TWThreadMonitorar;
begin
  inherited;
//  Contador:= 0;
  _Thread := TWThreadMonitorar.Create(false, Self);
  _Thread.TempoAtualizacao:= 10;
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

procedure TfrmPrincipal.BuscarDadosRegistro_R1000(const Condominio: Integer);
//var
//  q: TIBQuery;
begin
//  try
//    q:= TIBQuery.Create(nil);
////    q.DataBase:= DMPrincipal.sqs2000;
////    q.Transaction:= DMPrincipal.Transacao;
//    q.Close;
//    q.Sql.Text:= Format('SELECT LINHA FROM PROC_GERACAO_REINF_REG_R1000 (%d, %d, NULL)', [Condominio, Condominio]);
//    q.Open;
//
//    q.First;
//    while not q.Eof do
//    begin
//
//      q.Next;
//    end;
//  finally
//    FreeAndNil(q);
//  end;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  BuscarDadosRegistro_R1000(53);
  TrayIcon1.BalloonFlags:= bfInfo;
  TrayIcon1.BalloonTitle:= 'Executado';
  TrayIcon1.ShowBalloonHint;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_HIDE);
end;

{ TWThreadMonitorar }

procedure TWThreadMonitorar.AtualizaTela;
begin

end;

constructor TWThreadMonitorar.Create(CreateSuspended: Boolean; AForm: TForm);
begin
  inherited Create (CreateSuspended);
  FreeOnTerminate := false;
end;

procedure TWThreadMonitorar.Execute;
begin
  inherited;
  while (not Terminated) do
  begin
    Synchronize(AtualizaTela);
    Sleep(TempoAtualizacao * 1000);
  end;
end;

procedure TWThreadMonitorar.SetTempoAtualizacao(const Value: Integer);
begin
  FTempoAtualizacao := Value;
end;

end.


