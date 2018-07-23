unit uRegistro60M;

interface

uses
  Classes, Contnrs, SysUtils, StrUtils, Dialogs, Variants, uInterfaceBase;

  type
    TRegistro60M = class(TInterfaceBase)

    private

    public
      constructor Create(); reintroduce;
  end;

const
  CAMPOS : array[0..9] of String = ('DATA_EMISSAO', 'NUMERO_SERIE_FAB', 'NUMERO_ORDEM_SEQ', 'MODELO_DOCUMENTO',
                                    'NUM_CONT_ORDEM_OP_INI', 'NUM_CONT_ORDEM_OP_FIM', 'NUM_CONT_REDUCAO_Z',
                                    'CONTADOR_REINÍCIO_OP', 'VLR_VENDA_BRUTA', 'VLR_TOTALIZADOR_EQUIP');

function GetRegistro60M : TRegistro60M;
var
  Registro60M: TRegistro60M;

implementation

{ TRegistro60M }

function GetRegistro60M : TRegistro60M;
begin
  if not Assigned(Registro60M) then
    Registro60M := TRegistro60M.Create();

  Result := Registro60M;
end;

constructor TRegistro60M.Create;
begin
  inherited Create(CAMPOS);
end;

end.
