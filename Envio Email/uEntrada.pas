unit uEntrada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, IdMessage, IdBaseComponent, IdComponent, IdCustomTCPServer,
  IdMappedPortTCP, IdMappedTelnet, IdMappedPOP3, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, Vcl.ComCtrls, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient, IdIMAP4, Data.DB,
  Datasnap.DBClient, Data.Win.ADODB, IdPOP3, uConexaoDB, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid;

type
  TfrmEntrada = class(TForm)
    lstPrincipal: TListBox;
    Panel1: TPanel;
    IdMappedPOP31: TIdMappedPOP3;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    IdIMAP41: TIdIMAP4;
    StatusBar1: TStatusBar;
    dtsEmails: TDataSource;
    Timer1: TTimer;
    Panel2: TPanel;
    btnEscrever: TButton;
    con: TADOConnection;
    memLog: TMemo;
    cdsEmails: TADODataSet;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cdsEmailsID: TAutoIncField;
    cdsEmailsremetente: TStringField;
    cdsEmailsassunto: TStringField;
    cdsEmailstexto: TMemoField;
    cdsEmailsIdUsuario: TIntegerField;
    cdsEmailsidEmail: TIntegerField;
    qryUsuarios: TADOQuery;
    cdsEmails_View: TClientDataSet;
    cdsEmails_ViewID: TAutoIncField;
    cdsEmails_Viewremetente: TStringField;
    cdsEmails_Viewassunto: TStringField;
    cdsEmails_ViewLogin: TStringField;
    cxGrid1DBTableView1Login: TcxGridDBColumn;
    cxGrid1DBTableView1remetente: TcxGridDBColumn;
    cxGrid1DBTableView1assunto: TcxGridDBColumn;
    cdsEmails_ViewIdEmail: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnEscreverClick(Sender: TObject);
  private
    FoConexaoDB: TConexao;

    procedure ReceberEmail(IdUsuario: Integer; Login, Senha: string);
    procedure Log(LogMsg: string);
    procedure CarregarEmails;
    procedure AlimentarClient;
    { Private declarations }
  public
    procedure BeforeDestruction; override;
    procedure AfterConstruction; override;
    { Public declarations }

  end;

var
  frmEntrada: TfrmEntrada;

implementation

{$R *.dfm}

uses uCadastroUsuarios, uEscreverEmail;


procedure TfrmEntrada.AfterConstruction;
begin
  inherited;
  FoConexaoDB:= TConexao.Create;
end;

procedure TfrmEntrada.BeforeDestruction;
begin
  FreeAndNil(FoConexaoDB);
  inherited;
end;

procedure TfrmEntrada.btnEscreverClick(Sender: TObject);
begin
  frmEscreverEmail:= TfrmEscreverEmail.Create(nil);
  frmEscreverEmail.ShowModal;
  FreeAndNil(frmEscreverEmail);
end;


procedure TfrmEntrada.Log( LogMsg: string );
begin
  memLog.Lines.Add( LogMsg );
  Application.ProcessMessages;
end;

procedure TfrmEntrada.FormShow(Sender: TObject);
begin
  FoConexaoDB.con:= con;
  FoConexaoDB.Conectar();

  lstPrincipal.Items.Add('Entrada');
  lstPrincipal.Items.Add('Enviados');
  lstPrincipal.Items.Add('Lixo');

//  Timer1.Interval:= 1;
//  Timer1.Enabled:= True;
  CarregarEmails();
end;

procedure TfrmEntrada.Timer1Timer(Sender: TObject);
begin
//  CarregarEmails();
end;

procedure TfrmEntrada.CarregarEmails();
begin
  cdsEmails.Close;
  cdsEmails.Connection:= con;
  cdsEmails.Open;

//  Timer1.Interval:= 5000;
//  Timer1.Enabled:= False;
  qryUsuarios.Close;
  qryUsuarios.Connection:= con;
  qryUsuarios.SQL.Clear;
  qryUsuarios.SQL.Text:= 'SELECT * FROM dbo.tblUsuario';
  qryUsuarios.Open;

//  qryUsuarios.First;
//  while not qryUsuarios.Eof do
//  begin
//    ReceberEmail( qryUsuarios.FieldByName('ID').AsInteger,
//                  qryUsuarios.FieldByName('Login').AsString,
//                  qryUsuarios.FieldByName('Senha').AsString );
//    qryUsuarios.Next;
//  end;

  AlimentarClient();
//  Timer1.Enabled:= True;
end;

procedure TfrmEntrada.AlimentarClient();
var
  loQuery: TADOQuery;
begin
  loQuery:= TADOQuery.Create(nil);
  try
    loQuery.Connection:= con;
    loQuery.SQL.Text:= 'SELECT * FROM tblEmail';
    loQuery.Open;

    if cdsEmails_View.Active then
      cdsEmails_View.EmptyDataSet;

    cdsEmails_View.Close;
    cdsEmails_View.CreateDataSet;

    cdsEmails_View.DisableControls;
    loQuery.First;
    while not loQuery.Eof do
    begin
      cdsEmails_View.Append;
      cdsEmails_Viewremetente.AsString:= loQuery.FieldByName('remetente').AsString;
      cdsEmails_Viewassunto.AsString:= loQuery.FieldByName('assunto').AsString;

      if qryUsuarios.Locate('ID', loQuery.FieldByName('IdUsuario').AsInteger, []) then
        cdsEmails_ViewLogin.AsString:= qryUsuarios.FieldByName('Login').AsString;

      cdsEmails_ViewIdEmail.AsInteger:= loQuery.FieldByName('idEmail').AsInteger;
      cdsEmails_View.Post;
      loQuery.Next;
    end;
    cdsEmails_View.EnableControls;
  finally
    FreeAndNil(loQuery);
  end;
end;

procedure TfrmEntrada.ReceberEmail(IdUsuario: Integer; Login, Senha: string);
var
  IMAPClient: TIdIMAP4;
  UsersFolders: TStringList;
  OpenSSLHandler: TIdSSLIOHandlerSocketOpenSSL;
  res: Boolean;
  i: integer;
  inbox, currUID: string;
  cntMsg: integer;
  msg, msg2: TIdMessage;
  BodyTexts: TStringList;
  flags: TIdMessageFlagsSet;
  fileName_MailSource, TmpFolder: string;
begin
  IMAPClient := TIdIMAP4.Create( nil );
  try
    OpenSSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create( nil );
    try
      IMAPClient.Host := 'imap.gmail.com';
      IMAPClient.Port := 993;
      IMAPClient.Username := Login;
      IMAPClient.Password := Senha;

      if Pos( 'gmail.com', IMAPClient.Host ) > 0 then
      begin
        OpenSSLHandler.SSLOptions.Method := sslvSSLv3;
        IMAPClient.IOHandler := OpenSSLHandler;
        IMAPClient.UseTLS := utUseImplicitTLS;
      end;

      try
        res := IMAPClient.Connect;
        if not res then begin
          Log( '  Unsuccessful connection.' );
          exit;
        end;

      except
        on e: Exception do begin
          Log( '   Unsuccessful connection.' );
          Log( '  (' + Trim( e.Message ) + ')' );
          exit;
        end;
      end;

      try
        UsersFolders := TStringList.Create;
        try
          res := IMAPClient.ListMailBoxes( UsersFolders );
          if not res then begin
            Log( '  ListMailBoxes error.' );
            exit
          end;
        except
          on e: Exception do begin
            Log( '  ListMailBoxes error.' );
            Log( '  (' + Trim( e.Message ) + ')' );
            exit;
          end;

        end;

        Log( 'User folders: ' + IntToStr( UsersFolders.Count ) );
        for i := 0 to UsersFolders.Count - 1 do begin
          Log( '  [' + inttostr( i + 1 ) + '/' + inttostr( UsersFolders.Count ) + '] Folder: "' + UsersFolders[ i ] + '"' );
        end;

        IMAPClient.RetrieveOnSelect := rsDisabled;
        inbox := 'INBOX';
        Log( 'Opening folder "' + inbox + '"...' );
        res := IMAPClient.SelectMailBox( inbox );
        cntMsg := IMAPClient.MailBox.TotalMsgs;
        Log( 'E-mails to read: ' + IntToStr( cntMsg ) );

//        res := IMAPClient.RetrieveAllEnvelopes( AMsgList );

        msg := TIdMessage.Create( nil );
        msg2 := TIdMessage.Create( nil );
        BodyTexts := TStringList.Create;
        TmpFolder := 'c:\';
        res := IMAPClient.CreateMailBox( 'Temp2' );
        try

          for I := 0 to cntMsg - 1 do
          begin

            Log( '  [' + inttostr( i + 1 ) + '/' + inttostr( cntMsg ) + '] E-mail...' );

            IMAPClient.GetUID( i + 1, currUID );

            Log( '(Downloading message...)' );
            IMAPClient.UIDRetrieve( currUID, msg );

            fileName_MailSource := TmpFolder + 'Log_Mail_' + currUID + '.eml';
//            msg.SaveToFile( fileName_MailSource, false );


            if cdsEmails.Locate('idEmail', StrToIntDef(currUID, 0), [loCaseInsensitive]) then
              Continue;

            cdsEmails.Append;
            cdsEmailsidEmail.AsInteger:= StrToIntDef(currUID, 0);
            cdsEmailsremetente.AsString:= msg.From.Text;
            cdsEmailsassunto.AsString:= msg.Subject;
            cdsEmailsIdUsuario.AsInteger:= IdUsuario;
            cdsEmailstexto.AsString:= msg.Body.Text;
            cdsEmails.Post;

            // In the final version I will delete the original message
            // so I have to recreate it from the archived file

//            msg2.LoadFromFile( fileName_MailSource );

//            res := IMAPClient.AppendMsg( 'Temp2', msg2, msg2.Headers, [] );
          end;
        finally
          FreeAndNil( msg );
          FreeAndNil( msg2 );
          FreeAndNil( BodyTexts )
        end;

      finally
        IMAPClient.Disconnect;
      end;
    finally
      OpenSSLHandler.Free;
    end;
  finally
    IMAPClient.Free;
  end;
end;

end.
