unit uServidorPonto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, uDM_Conexao, WinSkinData;

type
  TfrmServidorPonto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnConectar: TBitBtn;
    edtDataBase: TEdit;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtServidor: TEdit;
    Label4: TLabel;
    skdata: TSkinData;
    procedure btnConectarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmServidorPonto: TfrmServidorPonto;

implementation

{$R *.dfm}

procedure TfrmServidorPonto.btnConectarClick(Sender: TObject);
begin
  if btnConectar.Caption = 'Conectar' then
    begin
      DM_Conexao.con.Connected := False;
      DM_Conexao.con.Params.Clear;
      DM_Conexao.con.Params.Add('Database=' + edtDataBase.Text);
      DM_Conexao.con.Params.Add('User_Name=' + edtUsuario.Text);
      DM_Conexao.con.Params.Add('Password=' + edtSenha.Text);
      DM_Conexao.con.Params.Add('Server=' + edtServidor.Text);
      DM_Conexao.con.Params.Add('DriverID=PG');
      DM_Conexao.con.Connected := True;

      if DM_Conexao.con.Connected then
        btnConectar.Caption := 'Desconectar';
    end
  else
    begin
      DM_Conexao.con.Connected := False;

      if not DM_Conexao.con.Connected then
        btnConectar.Caption := 'Conectar';
    end;
end;

procedure TfrmServidorPonto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM_Conexao.con.Connected := False;
end;

procedure TfrmServidorPonto.FormShow(Sender: TObject);
begin
  skdata.Active := True;
end;

end.
