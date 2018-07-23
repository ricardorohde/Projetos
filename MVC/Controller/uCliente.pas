unit uCliente;

interface

uses Classes, Contnrs, SysUtils, StrUtils, Dialogs,
     Variants, uInterfaceBase;

type
  TCliente = class(TInterfaceBase)

  private
    FTeste: string;
    procedure SetTeste(const Value: string);
  public

  published
    property Teste : string read FTeste write SetTeste;
  end;

implementation

{ TCliente }

procedure TCliente.SetTeste(const Value: string);
begin
  FTeste := Value;
end;

end.
