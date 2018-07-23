unit uConexao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmConexao = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    edtServidor: TEdit;
    edtPorta: TEdit;
    btnConectar: TButton;
    procedure btnConectarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConexao: TfrmConexao;

implementation

uses usocket,LIB;

{$R *.dfm}

procedure TfrmConexao.btnConectarClick(Sender: TObject);
begin
  if not Empty(edtServidor.Text) and not Empty(edtPorta.Text) then
    begin
      frmPrincipal := TfrmPrincipal.Create(self);
      frmPrincipal.Servidor := edtServidor.Text;
      frmPrincipal.Porta    := edtPorta.Text;
      frmPrincipal.Show;
    end
  else
    begin
      ShowMessage('Campos não Preenchidos.Verifique!!!');
    end;
end;

end.
