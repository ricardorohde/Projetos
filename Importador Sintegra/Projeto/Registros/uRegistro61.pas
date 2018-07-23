unit uRegistro61;

interface

uses
  Classes, Contnrs, SysUtils, StrUtils, Dialogs, Variants, uInterfaceBase;

  type
    TRegistro61 = class(TInterfaceBase)

    private

    public
      constructor Create(); reintroduce;
  end;

const
  CAMPOS : array[0..11] of string = ('DATA_EMISSAO', 'MODELO', 'SERIE', 'SUBSERIE',
                                     'NÚMERO_INICIAL_ORDEM', 'NÚMERO_FINAL_ORDEM',
                                     'VALOR_TOTAL', 'BASE_CALCULO_ICMS', 'VALOR_ICMS',
                                     'ISENTA_NAOTRIBUTADAS', 'OUTRAS', 'ALIQUOTA');

function GetRegistro61 : TRegistro61;
var
  Registro61: TRegistro61;

implementation

{ TRegistro61 }

function GetRegistro61 : TRegistro61;
begin
  if not Assigned(Registro61) then
    Registro61 := TRegistro61.Create();

  Result := Registro61;
end;

constructor TRegistro61.Create;
begin
  inherited Create(CAMPOS);
end;

end.
