unit uCadastroClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmCadastroClientes = class(TForm)
    Label1: TLabel;
    edtCodigo: TEdit;
    Label2: TLabel;
    edtNome: TEdit;
    Panel1: TPanel;
    btnSalvar: TBitBtn;
    ListBox1: TListBox;
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroClientes: TfrmCadastroClientes;

implementation

{$R *.dfm}

uses
  uCliente, uClienteDAO;

procedure TfrmCadastroClientes.btnSalvarClick(Sender: TObject);
var
  lCliente : TCliente;
begin
  lCliente := TCliente.Create(['ID', 'NOME']);
  lCliente.Prop['ID']:= edtCodigo.Text;
  lCliente.Prop['NOME']:= edtNome.Text;
  lCliente.Free;
//var
//  lCliente: TCliente;
//  lClienteDAO: TClienteDAO;
//begin
//  lCliente:= TCliente.Create(nil);
//  lClienteDAO:= TClienteDAO.Create(nil);
//  try
//    lCliente.Codigo:= StrToInt(edtCodigo.Text);
//    lCliente.Descricao:= edtNome.Text;
//    lClienteDAO.Salvar(lCliente);
//  finally
//    FreeAndNil(lCliente);
//    FreeAndNil(lClienteDAO);
//  end;
end;

end.
