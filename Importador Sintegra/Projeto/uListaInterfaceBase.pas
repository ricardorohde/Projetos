unit uListaInterfaceBase;

interface

uses Classes, Contnrs, SysUtils, StrUtils, Dialogs,
     Variants, uInterfaceBase;

  type
    TListaInterfaceBase = class
      private
        FLista : TObjectList;
    function GetItem(const Index: Integer): TInterfaceBase;
//    procedure SetItem(const Index: Integer; const Value: TInterfaceBase);
      public
        constructor Create;
        procedure Adicionar(pInterface: TInterfaceBase);
        procedure Remover(Index: Integer);
        function  Count: Integer;

        property Item[const Index : Integer]: TInterfaceBase read GetItem; //write SetItem;
  end;
implementation

{ TListaInterfaceBase }

procedure TListaInterfaceBase.Adicionar(pInterface: TInterfaceBase);
begin
  FLista.Add(pInterface);
end;

function TListaInterfaceBase.Count: Integer;
begin
  Result := FLista.Count;
end;

constructor TListaInterfaceBase.Create;
begin
  inherited Create;

  FLista := TObjectList.Create;
end;

function TListaInterfaceBase.GetItem(const Index: Integer): TInterfaceBase;
begin
  Result := nil;
  try
    Result := FLista.Items[Index] as TInterfaceBase;
  except
    ShowMessage('Objeto não encontrado!');
  end;
end;

procedure TListaInterfaceBase.Remover(Index: Integer);
begin
  if Index < Count then
    FLista.Delete(Index)
  else
    ShowMessage('Item não encontrado!');
end;

//procedure TListaInterfaceBase.SetItem(const Index: Integer;
//  const Value: TInterfaceBase);
//begin
//
//end;

end.
