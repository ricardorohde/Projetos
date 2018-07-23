unit uInterfaceBase;

interface

uses Classes, Contnrs, SysUtils, StrUtils, Dialogs,
     Variants;

  type TpOperacao = (toInsert, toEdit, toDelete, toNone);

  type
    IInterfaceBase = interface
      procedure SetCodigo(const Value: Integer);
      function  GetCodigo() : Integer;
      procedure SetDescricao(const Value: string);
      function  GetDescricao() : string;
      function  GetProp(const PropName: String): Variant;
      procedure SetProp(const PropName: String; const Value: Variant);

      property Codigo    : Integer read GetCodigo    write SetCodigo;
      property Descricao : string  read GetDescricao write SetDescricao;

      property Prop[const PropName : String]: Variant read GetProp write SetProp;
    end;

  type
    TInterfaceBase = class(TInterfacedObject, IInterfaceBase)
    private
      FCodigo       : Integer;
      FDescricao    : string;
      FValores      : array of Variant;
      FCampos       : array of string;
      FTipoOperacao : TpOperacao;

      procedure SetCodigo(const Value: Integer);
      function  GetCodigo() : Integer;
      procedure SetDescricao(const Value: string);
      function  GetDescricao() : string;
      function  GetProp(const PropName: String): Variant;
      procedure SetProp(const PropName: String; const Value: Variant);
      function  GetTipoOperacao: TpOperacao;
      procedure SetTipoOperacao(const Value: TpOperacao);
    public
      procedure AfterConstruction; override;
      function  GetNamePropByIndex(AIndex : Integer) : string;
      function  GetCountProp : Integer;

      constructor Create(AValue : array of string); reintroduce;

      property Codigo       : Integer    read GetCodigo       write SetCodigo;
      property Descricao    : string     read GetDescricao    write SetDescricao;
      property TipoOperacao : TpOperacao read GetTipoOperacao write SetTipoOperacao;

      property Prop[const PropName : String]: Variant read GetProp write SetProp;
    end;

  type
    TListaInterfaceBase = class(TObjectList)
      private
        FPessoa : TInterfaceBase;

        function  GetPessoa: TInterfaceBase;
        procedure SetPessoa(const Value: TInterfaceBase);
      public
        function Add(APessoa: TInterfaceBase): Integer; reintroduce; virtual;
        property Pessoa : TInterfaceBase read GetPessoa write SetPessoa;
    end;

implementation

{ TInterfaceBase }

procedure TInterfaceBase.AfterConstruction;
begin
  inherited;
end;

constructor TInterfaceBase.Create(AValue: array of string);
var
  i : Integer;
begin
  SetLength(FCampos,  Length(AValue));
  SetLength(FValores, Length(AValue));
  for i := Low(AValue) to High(AValue) do
    FCampos[i] := UpperCase(AValue[i]);
end;

function TInterfaceBase.GetCodigo: Integer;
begin
  result := FCodigo;
end;

function TInterfaceBase.GetCountProp: Integer;
begin
  result := Length(FCampos);
end;

function TInterfaceBase.GetDescricao: string;
begin
  Result := FDescricao;
end;

function TInterfaceBase.GetNamePropByIndex(AIndex: Integer): string;
begin
  Result := FCampos[AIndex];
end;

function TInterfaceBase.GetProp(const PropName: String): Variant;
begin
  Result := FValores[AnsiIndexStr(UpperCase(PropName), FCampos)];
end;

function TInterfaceBase.GetTipoOperacao: TpOperacao;
begin
  result := FTipoOperacao;
end;

procedure TInterfaceBase.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TInterfaceBase.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TInterfaceBase.SetProp(const PropName: String;
  const Value: Variant);
begin
  FValores[AnsiIndexStr(UpperCase(PropName), FCampos)] := Value;
end;

procedure TInterfaceBase.SetTipoOperacao(const Value: TpOperacao);
begin
  FTipoOperacao := Value;
end;

{ TListaPessoas }

function TListaInterfaceBase.Add(APessoa: TInterfaceBase): Integer;
begin
  Result := (Self as TObjectList).Add(APessoa as TObject);
end;

function TListaInterfaceBase.GetPessoa: TInterfaceBase;
begin
  Result := FPessoa;
end;

procedure TListaInterfaceBase.SetPessoa(const Value: TInterfaceBase);
begin
  FPessoa := Value;
end;

end.
