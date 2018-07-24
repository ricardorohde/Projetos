unit uOperacoesBasicas;

interface

uses Classes, Contnrs, SysUtils, StrUtils, Dialogs,
     Variants, uInterfaceBase, DB{, DBAccess, Uni, MemDS}, LIB,
     uADStanOption, uADStanParam, uADStanError, uADDatSManager, uADPhysIntf,
     uADDAptIntf, uADStanAsync, uADDAptManager, uADCompDataSet, uADCompClient;

  type
    TOperacao = class
      private
        FCampos     : array of string;
        FLista      : TListaInterfaceBase;
        FTabela     : string;
        FPrimaryKey : string;
        FSchema     : string;
        FConnection : TADConnection;

        function  GetLista: TListaInterfaceBase;
        procedure IncluirNaLista(AInterfaceBase : TInterfaceBase);
        procedure AlimentarLista();
        function  GetConnection: TADConnection;
        procedure SetConnection(const Value: TADConnection);
        function  GetTabela: String;
        procedure SetTabela(const Value: String);
        function  GetPrimaryKey: string;
        procedure SetPrimaryKey(const Value: string);
        function  RetonarTipo(value: Variant): TFieldType;
        procedure DeletarDaLista(AInterfaceBase: TInterfaceBase);
        function  GetSchema: string;
        procedure SetSchema(const Value: string);
      public
        procedure   AfterConstruction; override;
        procedure   BeforeDestruction; override;
        constructor Create(AValue: array of string); reintroduce;
        procedure EditarNaLista(AInterfaceBase : TInterfaceBase);
        procedure Salvar(AInterfaceBase : TInterfaceBase);
        procedure Deletar(AInterfaceBase : TInterfaceBase);
        function  RetornarValorLista(Index : Integer; propName : string): Variant;

        property Connection : TADConnection read GetConnection write SetConnection;
        property Tabela     : String        read GetTabela     write SetTabela;
        property PrimaryKey : string        read GetPrimaryKey write SetPrimaryKey;
        property Schema     : string        read GetSchema     write SetSchema;

        procedure IniciaOperacao();

        property Lista : TListaInterfaceBase read GetLista;
    end;

implementation

{ TListaOperacao }

function TOperacao.GetConnection: TADConnection;
begin
  Result := FConnection;
end;

procedure TOperacao.SetConnection(const Value: TADConnection);
begin
  FConnection := Value;
end;

function TOperacao.GetTabela: String;
begin
  Result := FTabela;
end;

procedure TOperacao.SetTabela(const Value: String);
begin
  FTabela := Value;
end;

procedure TOperacao.IniciaOperacao();
begin
  AlimentarLista();
end;

function TOperacao.GetPrimaryKey: string;
begin
  Result := FPrimaryKey;
end;

procedure TOperacao.SetPrimaryKey(const Value: string);
begin
  FPrimaryKey := Value;
end;

function TOperacao.GetSchema: string;
begin
  Result := FSchema;
end;

procedure TOperacao.SetSchema(const Value: string);
begin
  FSchema := Value;
end;

procedure TOperacao.AlimentarLista();
var
  q       : TADQuery;
  i       : Integer;
  lObjeto : TInterfaceBase;
begin
  q := TADQuery.Create(nil);
  try
    q.Connection := FConnection;
    q.Close;
    q.SQL.Clear;
    q.SQL.Add('SELECT ' + AddAspas( FCampos[0] ));
    for i := 1 to Length(FCampos)-1 do
      q.SQL.Add(', ' + AddAspas( FCampos[i] ));
    q.SQL.Add('FROM '+ AddAspas( FSchema ) + '.' + AddAspas( FTabela ));
    q.Open;

    q.First;
    while not q.eof do
    begin
      lObjeto := TInterfaceBase.Create(FCampos);
      for i := 0 to Length(FCampos)-1 do
          lObjeto.Prop[FCampos[i]] := q.Fields.FieldByName(FCampos[i]).Value;
      lObjeto.TipoOperacao := toNone;
      IncluirNaLista(lObjeto);
      q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

constructor TOperacao.Create(AValue: array of string);
var
  i : Integer;
begin
  SetLength(FCampos, Length(AValue));

  for i := Low(AValue) to High(AValue) do
    FCampos[i] := AValue[i];
end;

procedure TOperacao.Deletar(AInterfaceBase : TInterfaceBase);
var
  q : TADQuery;
begin
  q := TADQuery.Create(nil);
  try
    q.Connection := FConnection;
    q.Close;
    q.SQL.Clear;
    q.SQL.Add('DELETE FROM '+ AddAspas( FSchema ) + '.' + AddAspas( FTabela ));
    q.SQL.Add('WHERE ' + AddAspas( FPrimaryKey ) + ' = ' + VarToStrDef(AInterfaceBase.Prop[FPrimaryKey], '0'));
    q.ExecSQL;

    DeletarDaLista(AInterfaceBase);
  finally
    FreeAndNil(q);
  end;
end;

procedure TOperacao.DeletarDaLista(AInterfaceBase: TInterfaceBase);
var
  i, j : Integer;
begin
  for i := 0 to FLista.Count -1 do
    if (TInterfaceBase(FLista.Items[i]).Prop[FPrimaryKey] =
        AInterfaceBase.Prop[FPrimaryKey]) then
    begin
      FLista.Delete(i);
      Break;
    end;
end;

procedure TOperacao.EditarNaLista(AInterfaceBase: TInterfaceBase);
var
  i, j : Integer;
begin
  for i := 0 to FLista.Count -1 do
    if (TInterfaceBase(FLista.Items[i]).Prop[FPrimaryKey] =
        AInterfaceBase.Prop[FPrimaryKey]) then
    begin
      for j := 0 to AInterfaceBase.GetCountProp do
        TInterfaceBase(FLista.Items[i]).Prop[AInterfaceBase.GetNamePropByIndex(j)] :=
          AInterfaceBase.Prop[AInterfaceBase.GetNamePropByIndex(j)];
      Break;
    end;
end;

procedure TOperacao.IncluirNaLista(AInterfaceBase: TInterfaceBase);
begin
  if ( FLista.IndexOf(AInterfaceBase) < 0 )then
    FLista.Add(AInterfaceBase);
end;

procedure TOperacao.AfterConstruction;
begin
  inherited;
  FLista := TListaInterfaceBase.Create;
end;

function TOperacao.GetLista: TListaInterfaceBase;
begin
  Result := FLista;
end;

function TOperacao.RetornarValorLista(Index: Integer; propName : string): Variant;
begin
  Result := TInterfaceBase(FLista.Items[Index]).Prop[propName];
end;

function TOperacao.RetonarTipo(value : Variant): TFieldType;
begin
  case varType(value) of
    varEmpty,
    varNull : result := ftUnknown;

    varSmallInt,
    varInteger,
    varShortInt,
    varByte,
    varWord,
    varInt64 : Result := ftInteger;

    varSingle,
    varDouble,
    varCurrency :  Result := ftFloat;

    varBoolean  :  Result := ftBoolean;

    varDate     :  Result := ftDateTime;

    varOleStr,
    varString   :  Result := ftString;
  end;
end;

procedure TOperacao.Salvar(AInterfaceBase: TInterfaceBase);
var
  q         : TADQuery;
  i         : Integer;
  lPrimeiro : Boolean;
begin
  q := TADQuery.Create(nil);
  try
    lPrimeiro    := True;
    q.Connection := FConnection;
    q.Close;
    q.SQL.Clear;
    q.SQL.Add('UPDATE '+ AddAspas( FSchema ) + '.' + AddAspas( FTabela ) + ' SET');

    for i := Low(FCampos) to High(FCampos) do
      if (UpperCase(FCampos[i]) <> UpperCase(FPrimaryKey)) and
         not Empty(AInterfaceBase.Prop[FCampos[i]]) then
        if lPrimeiro then
          begin
            q.SQL.Add(AddAspas( FCampos[i] ) + ' = :p' + FCampos[i]);
            q.ParamByName('p'+ FCampos[i]).DataType := RetonarTipo( AInterfaceBase.Prop[FCampos[i]] );
            q.ParamByName('p'+ FCampos[i]).Value    := AInterfaceBase.Prop[FCampos[i]];
            lPrimeiro := False;
          end
        else
          begin
            q.SQL.Add(', ' + AddAspas( FCampos[i] ) + ' = :p' + FCampos[i]);
            q.ParamByName('p'+ FCampos[i]).DataType := RetonarTipo( AInterfaceBase.Prop[FCampos[i]] );
            q.ParamByName('p'+ FCampos[i]).Value    := AInterfaceBase.Prop[FCampos[i]];
          end;
    q.SQL.Add('WHERE ' + AddAspas( FPrimaryKey ) + ' = ' + VarToStrDef(AInterfaceBase.Prop[FPrimaryKey], '0'));
    q.ExecSQL;

    if q.RowsAffected = 0 then
      begin
        if ( FLista.IndexOf(AInterfaceBase) < 0 )then
          IncluirNaLista(AInterfaceBase);

        lPrimeiro    := True;
        q.Connection := FConnection;
        q.Close;
        q.SQL.Clear;
        q.SQL.Add('INSERT INTO '+ AddAspas( FSchema ) + '.' + AddAspas( FTabela ));
        for i := Low(FCampos) to High(FCampos) do
          if (UpperCase(FCampos[i]) <> UpperCase(FPrimaryKey)) and
            not Empty(AInterfaceBase.Prop[FCampos[i]]) then
            if lPrimeiro then
              begin
                q.SQL.Add('(' + AddAspas( FCampos[i] ));
                lPrimeiro := False;
              end
            else
              q.SQL.Add(',' + AddAspas( FCampos[i] ));

        if not lPrimeiro then
          q.SQL.Add(')');

        lPrimeiro := True;
        for i := Low(FCampos) to High(FCampos) do
          if (UpperCase(FCampos[i]) <> UpperCase(FPrimaryKey)) and
            not Empty(AInterfaceBase.Prop[FCampos[i]]) then
            if lPrimeiro then
              begin
                q.SQL.Add('VALUES ( :p' + FCampos[i]);
                q.ParamByName('p'+ FCampos[i]).DataType := RetonarTipo( AInterfaceBase.Prop[FCampos[i]] );
                q.ParamByName('p'+ FCampos[i]).Value    := AInterfaceBase.Prop[FCampos[i]];
                lPrimeiro := False;
              end
            else
              begin
                q.SQL.Add(', :p' + FCampos[i]);
                q.ParamByName('p'+ FCampos[i]).DataType := RetonarTipo( AInterfaceBase.Prop[FCampos[i]] );
                q.ParamByName('p'+ FCampos[i]).Value    := AInterfaceBase.Prop[FCampos[i]];
              end;
        if not lPrimeiro then
          q.SQL.Add(')');
        q.ExecSQL;
      end
    else
      EditarNaLista(AInterfaceBase);
  finally
    FreeAndNil(q);
  end;
end;

procedure TOperacao.BeforeDestruction;
begin
  FreeAndNil(FLista);
  inherited;
end;

end.

