unit uConfiguracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IniFiles, ExtCtrls, StdCtrls;

type
  TfrmConfiguracao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edtServidor: TEdit;
    chkSom: TCheckBox;
    btnGravar: TButton;
    edtPorta: TEdit;
    Label2: TLabel;
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FServidor : string;
    FSom : Boolean;
    FPorta : string;

  public
    { Public declarations }
    function leConfiguracao : boolean;
    property servidor : string  read FServidor write FServidor;
    property Porta : string  read FPorta write FPorta;
    property Som      : boolean read FSom write FSom;
  end;

var
  frmConfiguracao: TfrmConfiguracao;

implementation

uses LIB;

{$R *.dfm}

procedure TfrmConfiguracao.btnGravarClick(Sender: TObject);
var Configuracao : TIniFile;
begin
  if not Empty(edtServidor.Text) and
     not Empty(edtPorta.Text)then
    begin
      Configuracao := TInifile.Create( ExtractFilePath(Application.ExeName) + 'Configuracao.ini' );
      try
        Configuracao.WriteString('Configuracao','Servidor',edtServidor.Text);
        Configuracao.WriteBool('Configuracao','Som',chkSom.Checked);
        Configuracao.WriteString('Configuracao','Porta',edtPorta.Text);
      finally
        FreeandNil(Configuracao);
      end; {try}
      Close;
    end
  else
    begin
      showMessage('Servidor não preenchido.Verifique');
      edtServidor.Text;
    end;
end;

function TfrmConfiguracao.leConfiguracao: boolean;
var Configuracao : TIniFile;
begin
  result := false;
  if FileExists( ExtractFilePath(Application.ExeName) + 'Configuracao.ini' ) then
  begin
    result := true;
    Configuracao := TInifile.Create( ExtractFilePath(Application.ExeName) + 'Configuracao.ini' );
    try
      servidor := Configuracao.ReadString('Configuracao','Servidor','');
      Porta    := Configuracao.ReadString('Configuracao','Porta','');
      Som      := Configuracao.ReadBool('Configuracao','Servidor',false);
    finally
      FreeandNil(Configuracao);
    end; {try}
  end;
end;

procedure TfrmConfiguracao.FormShow(Sender: TObject);
begin
  if leConfiguracao then
  begin
    edtServidor.Text := servidor;
    chkSom.Checked   := som;
    edtPorta.Text    := Porta;
  end;
end;

end.
