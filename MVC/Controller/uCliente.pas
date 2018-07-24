unit uCliente;

interface

uses Classes, Contnrs, SysUtils, StrUtils, Dialogs,
     Variants, uInterfaceBase;

type
  TCliente = class(TInterfaceBase)
  private
    FNome: string;
    FId: TPrimaryKey;
    procedure SetNome(const Value: string);
    procedure SetId(const Value: TPrimaryKey);
  public

  published
    property Id : TPrimaryKey read FId write SetId;
    property Nome : string read FNome write SetNome;
  end;

implementation

{ TCliente }

procedure TCliente.SetId(const Value: TPrimaryKey);
begin
  FId := Value;
end;

procedure TCliente.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
