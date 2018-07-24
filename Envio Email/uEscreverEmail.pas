unit uEscreverEmail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Samples.Gauges, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdAntiFreezeBase, Vcl.IdAntiFreeze, IdMessage, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, IdSMTP;

type
  TfrmEscreverEmail = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtPara: TEdit;
    edtAssunto: TEdit;
    btnEnviar: TButton;
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    IdAntiFreeze1: TIdAntiFreeze;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    Gauge1: TGauge;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEscreverEmail: TfrmEscreverEmail;

implementation

{$R *.dfm}

end.
