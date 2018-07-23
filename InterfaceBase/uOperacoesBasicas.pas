unit uOperacoesBasicas;

interface

uses Classes, Contnrs, SysUtils, StrUtils, Dialogs,
     Variants, uInterfaceBase,DB, DBAccess, Uni, MemDS;

  type
    TOperacao = class
      private
        FCampos    : array of string;
        FLista     : TListaInterfaceBase;
        FTableName : string;
        FConection : TUniConnection;

        procedure AlimentaLista();
      public
        procedure   AfterConstruction; override;
        constructor Create(ATableName : String; AValue: array of string); reintroduce;

        procedure Incluir(AInterfaceBase : TInterfaceBase);
        procedure Editar(AInterfaceBase : TInterfaceBase);
        procedure Deletar(ACodigo : Integer);

        property Conection : TUniConnection read FConection write FConection;
    end;

implementation
{ TListaOperacao }

procedure TOperacao.AlimentaLista();
var
  q : TUniQuery;
  i : Integer;
  lObjectList : TInterfaceBase;
begin
  q := TUniQuery.Create(nil);
  try
    q.Connection := Conection;
    q.Close;
    q.SQL.Clear;
    q.SQL.Add('select ' + FCampos[0]);
    for i := 1 to Length(FCampos)-1 do
      q.SQL.Add(', ' + FCampos[i]);
    q.SQL.Add('from ' + FTableName);
    q.Open;

    q.First;
    while not q.eof do
      begin
        lObjectList := TInterfaceBase.Create(FCampos);
        for i := 0 to Length(FCampos)-1 do
            lObjectList.Prop[FCampos[i]] := q.Fields.FieldByName(FCampos[i]).Value;
        lObjectList.TipoOperacao := toNone;
        FLista.Add(lObjectList);
        q.Next;
      end;
  finally
    FreeAndNil(q);
  end;
end;

constructor TOperacao.Create(ATableName : String; AValue: array of string);
var
  i : Integer;
begin
  FTableName := ATableName;
  SetLength(FCampos, Length(AValue));

  for i := Low(AValue) to High(AValue) do
    FCampos[i] := AValue[i];
end;

procedure TOperacao.Deletar(ACodigo: Integer);
var
  i : Integer;
begin
  for I := 0 to FLista.Count-1 do
    if TInterfaceBase(FLista.Items[i]).Codigo = ACodigo then
      TInterfaceBase(FLista.Items[i]).TipoOperacao := toDelete;
end;

procedure TOperacao.Editar(AInterfaceBase: TInterfaceBase);
var
  i, lIndex : Integer;
begin
  lIndex := FLista.IndexOf(AInterfaceBase);
  TInterfaceBase(FLista.Items[lIndex]).TipoOperacao := AInterfaceBase.TipoOperacao;
  TInterfaceBase(FLista.Items[lIndex]).Descricao    := AInterfaceBase.Descricao;

  for i := 0 to AInterfaceBase.GetCountProp -1 do
    TInterfaceBase(FLista.Items[lIndex]).Prop[AInterfaceBase.GetNamePropByIndex(i)] :=
      AInterfaceBase.Prop[AInterfaceBase.GetNamePropByIndex(i)];
end;

procedure TOperacao.Incluir(AInterfaceBase: TInterfaceBase);
begin
  FLista.Add(AInterfaceBase);
end;

procedure TOperacao.AfterConstruction;
begin
  inherited;
  AlimentaLista();
end;

end.

