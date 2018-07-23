unit uCadastroUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,LIB;

type
  TfrmCadUsuarios = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edtLogin: TEdit;
    Label1: TLabel;
    edtIP: TEdit;
    Label2: TLabel;
    btnOk: TButton;
    btnCancelar: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUsuarios: TfrmCadUsuarios;

implementation

uses usocket;

{$R *.dfm}

procedure TfrmCadUsuarios.btnOkClick(Sender: TObject);
begin
  if not Empty(edtLogin.Text) and not Empty(edtIP.Text) then
    begin
      frmPrincipal.IP := edtIP.Text;
      frmPrincipal.Usuario := edtLogin.Text;
      Close;
    end
  else
    begin
      ShowMessage('Campos não preenchidos.Verifique!!!');
      edtLogin.SetFocus;
    end;
end;

procedure TfrmCadUsuarios.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmCadUsuarios.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadUsuarios.FormShow(Sender: TObject);
begin
 edtLogin.SetFocus;
end;

end.
