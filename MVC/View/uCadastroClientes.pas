unit uCadastroClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, TypInfo,
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
  Count, I: Integer;
  List : TPropList;
  lCliente : TCliente;
  Info : PPropInfo;
begin
  lCliente := TCliente.Create(['ABC']);
  Count := GetPropList(TypeInfo(TCliente), tkProperties, @List);

  for I := 0 to Pred(Count) do
  begin
    Info := GetPropInfo(TypeInfo(TCliente), List[I]^.Name);
    Listbox1.Items.Add(List[I]^.Name + ' : ' + Info^.PropType^.Name);
  end;

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
