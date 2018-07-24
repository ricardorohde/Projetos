unit uDAO;

interface

uses Classes, Contnrs, SysUtils, StrUtils, Dialogs,
  Variants, uInterfaceBase;

type
  TInterfaceDAO = class(TInterfacedObject, IInterfaceDAO)
  public
    procedure Salvar(ClassDAO: TInterfaceBase; const Tabela: string);
  end;

implementation

{ TInterfaceDAO }

procedure TInterfaceDAO.Salvar(ClassDAO: TInterfaceBase; const Tabela: string);
begin
//  'UPDATE '
//
//  TInterfaceBase(ClassDAO).GetCountProp
end;
end.
