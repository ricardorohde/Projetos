unit UConfiguracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, AppEvnts, ExtCtrls, IniFiles, Buttons, DB,
  ADODB;

type
  TConfiguracao = record
    Senha    : string;
    Usuario  : string;
    Servidor : string;
    Porta    : string;
    DataBase : string;
  end;

  TCriptografia = class
  private
  public
    function EncripitarVar(Texto: String):String;
    function DesencriptarVar(Texto: String):String;
  end;

  TfmConfiguracao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edtServidor: TEdit;
    Label1: TLabel;
    edtPorta: TEdit;
    Label2: TLabel;
    edtUsuario: TEdit;
    Label3: TLabel;
    edtSenha: TEdit;
    Label4: TLabel;
    btnOk: TSpeedButton;
    btnCancelar: TSpeedButton;
    Label5: TLabel;
    edtDataBase: TEdit;
    ADOConnection1: TADOConnection;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtPortaKeyPress(Sender: TObject; var Key: Char);
  private
    procedure GravarConfiguracao();
    function Conectar(): boolean;
    { Private declarations }
  public
    { Public declarations }

    function LerConfiguracao(): TConfiguracao;
  end;

var
  fmConfiguracao: TfmConfiguracao;

const Masc=90;  // Chave da criptografia e descriptografia

implementation

{$R *.dfm}

{ TCriptografia }

function TCriptografia.DesencriptarVar(Texto: String): String;
var
  w : string;
  i : integer;
begin
   for i := 1 to length(texto) do
     w := w + chr( Ord(texto[i]) - i - Masc );
   result:= w;
end;

function TCriptografia.EncripitarVar(Texto: String): String;
var
  r : string;
  i : integer;
begin
   for i := 1 to Length(texto) do
     r := r + chr(Ord(Texto[i]) + i + Masc);
   result:= r;
end;

function TfmConfiguracao.LerConfiguracao(): TConfiguracao;
var
  lConfiguracao : TIniFile;
  lCriptografia : TCriptografia;
begin
  result.Senha := '';
  result.Usuario  := '';
  result.Servidor := '';
  result.Porta    := '';
  result.DataBase := '';

  lCriptografia := TCriptografia.Create;
  try
    if FileExists( ExtractFilePath(Application.ExeName) + 'Configuracao.ini' ) then
    begin
      lConfiguracao := TInifile.Create( ExtractFilePath(Application.ExeName) + 'Configuracao.ini' );
      try
        result.Senha    := lCriptografia.DesencriptarVar(lConfiguracao.ReadString('Configuracao','1',''));
        result.Usuario  := lCriptografia.DesencriptarVar(lConfiguracao.ReadString('Configuracao','2',''));
        result.Servidor := lCriptografia.DesencriptarVar(lConfiguracao.ReadString('Configuracao','3',''));
        result.Porta    := lCriptografia.DesencriptarVar(lConfiguracao.ReadString('Configuracao','4',''));
        result.DataBase := lCriptografia.DesencriptarVar(lConfiguracao.ReadString('Configuracao','5',''));
      finally
        FreeandNil(lConfiguracao);
      end; {try}
    end;
  finally
    FreeAndNil(lCriptografia);
  end;
end;

procedure TfmConfiguracao.GravarConfiguracao();
var
  lConfiguracao : TIniFile;
  lCriptografia : TCriptografia;
begin
  if (Trim(edtServidor.Text)= '') then
  begin
    ShowMessage('Servidor não preenchido. Verifique!');
    edtServidor.SetFocus;
    Exit;
  end;

  if (Trim(edtPorta.Text)= '') then
  begin
    ShowMessage('Porta não preenchida. Verifique!');
    edtPorta.SetFocus;
    Exit;
  end;

  if (Trim(edtUsuario.Text)= '') then
  begin
    ShowMessage('Usuário não preenchido. Verifique!');
    edtUsuario.SetFocus;
    Exit;
  end;

  if (Trim(edtSenha.Text)= '') then
  begin
    ShowMessage('Senha não preenchida. Verifique!');
    edtSenha.SetFocus;
    Exit;
  end;

  if (Trim(edtDataBase.Text)= '') then
  begin
    ShowMessage('Base de Dados não preenchida. Verifique!');
    edtDataBase.SetFocus;
    Exit;
  end;

  if not Conectar() then
  begin
    ShowMessage('Dados incorretos. Verifique!');
    edtServidor.SetFocus;
    Exit;
  end;

  lConfiguracao := TInifile.Create( ExtractFilePath(Application.ExeName) + 'Configuracao.ini' );
  lCriptografia := TCriptografia.Create;
  try
    lConfiguracao.WriteString('CONFIGURACAO','1', lCriptografia.EncripitarVar(edtSenha.Text));
    lConfiguracao.WriteString('CONFIGURACAO','2', lCriptografia.EncripitarVar(edtUsuario.Text));
    lConfiguracao.WriteString('CONFIGURACAO','3', lCriptografia.EncripitarVar(edtServidor.Text));
    lConfiguracao.WriteString('CONFIGURACAO','4', lCriptografia.EncripitarVar(edtPorta.Text));
    lConfiguracao.WriteString('CONFIGURACAO','5', lCriptografia.EncripitarVar(edtDataBase.Text));
  finally
    FreeandNil(lCriptografia);
    FreeandNil(lConfiguracao);
  end; {try}
  Close;  
end;

procedure TfmConfiguracao.btnOkClick(Sender: TObject);
begin
  GravarConfiguracao();
  ModalResult := mrOk;
end;

procedure TfmConfiguracao.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

function TfmConfiguracao.Conectar(): boolean;
begin
  result := false;
  try
    if ADOConnection1.Connected then
      ADOConnection1.Close;

    ADOConnection1.LoginPrompt := False;
    ADOConnection1.ConnectionString:= 'Provider=ASEOLEDB.1;Password=' + edtSenha.Text + ';Persist Security Info=True;' +
                                                  'User ID=' + edtUsuario.Text + ';Data Source="' + edtServidor.Text +
                                                  ';' +  edtPorta.Text + '";Initial Catalog='+ edtDataBase.Text;

    ADOConnection1.CommandTimeout:=5;
    ADOConnection1.Open;
    ADOConnection1.CommandTimeout:=30;

    result := ADOConnection1.Connected;
  except
  end;
end;

procedure TfmConfiguracao.edtPortaKeyPress(Sender: TObject; var Key: Char);
begin
  //OnlyNumber
  if (not (Key in ['0'..'9', #8, #3, #22])) then Key := #0;
end;

end.
