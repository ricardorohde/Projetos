unit uRegistro60I;

interface

uses
  Classes, Contnrs, SysUtils, StrUtils, Dialogs, Variants, uInterfaceBase;

  type
    TRegistro60I = class(TInterfaceBase)

    private

    public
      constructor Create(); reintroduce;
  end;

const
  CAMPOS : array[0..9] of String = ('DATA_EMISSAO', 'NUMERO_SERIE_FAB', 'NUMERO_ORDEM_DF', 'NUMERO_ITEM',
                                    'CODIGO_MERCADORIA', 'QUANTIDADE', 'VALOR_UNITARIO', 'BASE_CALCULO_ICMS',
                                    'ALIQUOTA_ST', 'VALOR_ICMS');

function GetRegistro60I : TRegistro60I;
var
  Registro60I: TRegistro60I;

implementation

{ TRegistro60I }

function GetRegistro60I : TRegistro60I;
begin
  if not Assigned(Registro60I) then
    Registro60I := TRegistro60I.Create();

  Result := Registro60I;
end;

constructor TRegistro60I.Create;
begin
  inherited Create(CAMPOS);
end;

end.
