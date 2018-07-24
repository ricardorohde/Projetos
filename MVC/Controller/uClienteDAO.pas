unit uClienteDAO;

interface

uses Classes, Contnrs, SysUtils, StrUtils, Dialogs,
     Variants, uDAO, uCliente, TypInfo,
     IBQuery;

type
  TClienteDAO = class(TInterfaceDAO)
    private
    public
      procedure Salvar(Cliente: TCliente);overload;
  end;

implementation

uses uDmMain;

{ TClienteDAO }

//procedure TClienteDAO.Salvar(Cliente: TCliente);overload;
//var
//  Count, I: Integer;
//  List : TPropList;
//  lCliente : TCliente;
//  Info : PPropInfo;
//  q: TIBQuery;
//begin

//  Count := GetPropList(TypeInfo(TCliente), tkProperties, @List);
//
//  try
//    q:= TIBQuery.Create(nil);
//    q.DataBase:= DataModule1.IBDatabase1;
//    q.Transaction:= DataModule1.Transacao;
//    q.Close;
//    q.Sql.Text:= Format('SELECT 1 FROM GR_PARAMETRO P WHERE P.CODIGO_DO_PARAMETRO = %d and P.VALOR = 1', [CodigoParametro]);
//    q.Open;
//
//    result:= not q.IsEmpty;
//  finally
//    FreeAndNil(q);
//  end;
//
//
//  for I := 0 to Pred(Count) do
//  begin
//    Info := GetPropInfo(TypeInfo(TCliente), List[I]^.Name);
//    //Listbox1.Items.Add(List[I]^.Name + ' : ' + Info^.PropType^.Name);
//  end;
  //Aqui vem a SQL
//end;

{ TClienteDAO }

procedure TClienteDAO.Salvar(Cliente: TCliente);
begin
  inherited Salvar(Cliente, 'Clientes');
end;

end.
