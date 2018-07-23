unit uClienteDAO;

interface

uses Classes, Contnrs, SysUtils, StrUtils, Dialogs,
     Variants, uInterfaceBase, uCliente;

type
  TClienteDAO = class
    private
    public
      procedure Salvar(Cliente: TCliente);
  end;

implementation

{ TClienteDAO }

procedure TClienteDAO.Salvar(Cliente: TCliente);
begin
  //Aqui vem a SQL
end;

end.
