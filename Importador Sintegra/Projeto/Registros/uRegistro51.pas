unit uRegistro51;

interface

uses
  Classes, Contnrs, SysUtils, StrUtils, Dialogs, Variants, uInterfaceBase;

  type
    TRegistro51 = class(TInterfaceBase)

    private

    public
      constructor Create(); reintroduce;
  end;

const
  CAMPOS : array[0..11] of String = ('CNPJ', 'INSCRICAO_ESTADUAL', 'DATA_EMISSAO',
                                     'UNIDADE_FEDERACAO', 'SERIE', 'NUMERO', 'CFOP',
                                     'VALOR_TOTAL', 'VALOR_IPI', 'ISENTA_NAO_TRIBUTADA',
                                     'OUTRAS_IPI', 'SITUACAO');
function GetRegistro51 : TRegistro51;
var
  Registro51: TRegistro51;

implementation

{ TRegistro51 }

function GetRegistro51 : TRegistro51;
begin
  if not Assigned(Registro51) then
    Registro51 := TRegistro51.Create();

  Result := Registro51;
end;

constructor TRegistro51.Create;
begin
  inherited Create(CAMPOS);
end;

end.
