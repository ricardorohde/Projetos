unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons, WinSkinData;

type
  TfrmLogin = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    skdata: TSkinData;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    function Validar: Boolean;
    { Private declarations }
  public
    { Public declarations }
    class function LogarSistema(): Boolean;
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;

  end;

var
  frmLogin: TfrmLogin;

implementation

uses uDM_Cadastro_Usuario, LIB;

{$R *.dfm}

{ TfrmLogin }

procedure TfrmLogin.AfterConstruction;
begin
  inherited;
  DM_Cadastro_Usuario := TDM_Cadastro_Usuario.Create(nil);
end;

procedure TfrmLogin.BeforeDestruction;
begin
  FreeAndNil( DM_Cadastro_Usuario );
  inherited;
end;

class function TfrmLogin.LogarSistema: Boolean;
begin
  result := frmLogin.ShowModal = mrOk;
end;

function TfrmLogin.Validar() : Boolean;
begin
  result := False;

  if Empty(edtUsuario.Text) then
  begin
    Aviso('Usuário não preenchido. Verifique!');
    edtUsuario.SetFocus;
    Exit;
  end;

  if Empty(edtSenha.Text) then
  begin
    Aviso('Senha não preenchida. Verifique!');
    edtSenha.SetFocus;
    Exit;
  end;

  DM_Cadastro_Usuario.cds_Usuario.Close;
  DM_Cadastro_Usuario.cds_Usuario.Params[0].AsString := edtUsuario.Text;
  DM_Cadastro_Usuario.cds_Usuario.Active := True;

  if DM_Cadastro_Usuario.cds_Usuario.IsEmpty then
  begin
    Aviso('Usuário inválido. Verifique!');
    edtUsuario.SetFocus;
    edtUsuario.SelectAll;
    Exit;
  end;

  if DM_Cadastro_Usuario.cds_Usuario.FieldByName('SENHA').AsString <> edtSenha.Text then
  begin
    Aviso('Senha inválida. Verifique!');
    edtSenha.SetFocus;
    edtSenha.SelectAll;
    Exit;
  end;  
  result := True;
end;

procedure TfrmLogin.btnOkClick(Sender: TObject);
begin
  if not Validar() then
    Abort;

  ModalResult := mrOk;
end;

procedure TfrmLogin.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    Perform(Wm_NextDlgCtl,0,0);
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  skdata.Active := True;
  edtUsuario.SetFocus;
end;

end.
