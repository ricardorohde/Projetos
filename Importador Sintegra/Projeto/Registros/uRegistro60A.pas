unit uRegistro60A;

interface

uses
  Classes, Contnrs, SysUtils, StrUtils, Dialogs, Variants, uInterfaceBase;

  type
    TRegistro60A = class(TInterfaceBase)

    private

    public
      constructor Create(); reintroduce;
  end;

const
  CAMPOS : array[0..3] of String = ('DATA_EMISSAO', 'NUMERO_SERIE_FAB', 'SITUACAO_TRIBUTARIA_ALIQ', 'VALOR_ACUMULADO');

function GetRegistro60A : TRegistro60A;
var
  Registro60A: TRegistro60A;

implementation

{ TRegistro60A }

function GetRegistro60A : TRegistro60A;
begin
  if not Assigned(Registro60A) then
    Registro60A := TRegistro60A.Create();

  Result := Registro60A;
end;

constructor TRegistro60A.Create;
begin
  inherited Create(CAMPOS);
end;

end.
