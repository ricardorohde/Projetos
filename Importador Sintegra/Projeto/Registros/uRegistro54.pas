unit uRegistro54;

interface

uses
  Classes, Contnrs, SysUtils, StrUtils, Dialogs, Variants, uInterfaceBase;

  type
    TRegistro54 = class(TInterfaceBase)

    private

    public
      constructor Create(); reintroduce;
  end;

const
  CAMPOS : array[0..14] of String = ('CNPJ', 'MODELO', 'SERIE', 'NUMERO',
                                     'CFOP', 'CST', 'NUMERO_ITEM', 'CODIGO_PRODUTO',
                                     'QUANTIDADE', 'VALOR_PRODUTO', 'VALOR_DESCONTO',
                                     'BASE_CALCULO_ICMS', 'BASE_CALCULO_ICMS_ST',
                                     'VALOR_IPI', 'ALIQUOTA_ICMS');

function GetRegistro54 : TRegistro54;
var
  Registro54: TRegistro54;

implementation

{ TRegistro54 }

function GetRegistro54 : TRegistro54;
begin
  if not Assigned(Registro54) then
    Registro54 := TRegistro54.Create();

  Result := Registro54;
end;

constructor TRegistro54.Create;
begin
  inherited Create(CAMPOS);
end;

end.
