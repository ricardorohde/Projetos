unit uEditaUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls;

type
  TfrmEditarUsuario = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    edtUsuario: TDBEdit;
    Label2: TLabel;
    edtIP: TDBEdit;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditarUsuario: TfrmEditarUsuario;

implementation

uses usocket;

{$R *.dfm}

procedure TfrmEditarUsuario.BitBtn1Click(Sender: TObject);
begin
  if (edtUsuario.Text <> '') and (edtIP.Text <> '') then
    begin
      frmPrincipal.dtsUsuarios.DataSet.Post;
    end
  else
    begin
      showMessage('Dados inválidos.Verifique!!!');
      edtUsuario.SetFocus;
    end;
end;


end.
