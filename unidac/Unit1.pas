unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,  DB, ExtCtrls,  cxTextEdit, cxButtonEdit,
  Alterdata, MemDS, DBAccess, Uni, UniProvider, Clipbrd,
  UniDacVcl, {$WARN UNIT_PLATFORM OFF} FileCtrl;
  //ASEUniProvider, ODBCUniProvider;


type
  TForm1 = class(TForm)
    btn1: TButton;
    Button1: TButton;
    procedure btn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
//var SrvMastermaqSQLServer : TSQLServerUniProvider;
//    dbMastermaqSQLServer  : TUniConnection;
//    dlgMastermaqSQLServer : TUniConnectDialog;
//    qryMastermaqSQLServer : TUniQuery;
begin
  // Crio componentes para conexão e seleção das informações
//  SrvMastermaqSQLServer := TSQLServerUniProvider.Create(nil);
//  dbMastermaqSQLServer := TUniConnection.Create(nil);
//  dlgMastermaqSQLServer := TUniConnectDialog.Create(nil);
//  qryMastermaqSQLServer := TUniQuery.Create(nil);
//
//  // Passo os parâmetros para conexão.
//  with dbMastermaqSQLServer do
//    begin
//      ConnectDialog := dlgMastermaqSQLServer;
//      ProviderName  := 'Ole';
//      LoginPrompt   := False;
//      Server        := GetForm.GetEnderecoDB('DB_SERVER');
//      Username      := GetForm.GetEnderecoDB('DB_USERNAME');
//      Password      := GetForm.GetEnderecoDB('DB_PASSWORD');
//      Database      := 'master';
//      Connected     := True;
//    end;
//  qryMastermaqSQLServer.Connection := dbMastermaqSQLServer;
end;

procedure TForm1.Button1Click(Sender: TObject);
var UniConnection: TUniConnection;
//    teste : TUniProvider;
begin

//  teste := TUniProvider.Create(nil);
  //teste.GetProviderName;

//  teste.GetProviderName :
  UniConnection:= TUniConnection.Create(nil);
  UniConnection.ProviderName := 'ASE';

  UniConnection.Server := 'dominio';//server name
  UniConnection.LoginPrompt := False;
  UniConnection.Port := 5000; //port
//  UniConnection.Username := '..'; //login
//  UniConnection.Password := '...';//password
  try
    UniConnection.Connect;
    ShowMessage(UniConnection.ServerVersion);
  finally
    UniConnection.Free;
  end;
end;
end.
