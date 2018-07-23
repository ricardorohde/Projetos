unit uRegistro50;

interface

uses
  Classes, Contnrs, SysUtils, StrUtils, Dialogs, Variants, uInterfaceBase;

  type
    TRegistro50 = class(TInterfaceBase)

    private

    public
      constructor Create(); reintroduce;
  end;

const
  CAMPOS : array[0..15] of String = ('CNPJ', 'INSCRICAO_ESTADUAL', 'DATA_EMISSAO',
                                     'UNIDADE_FEDERACAO', 'MODELO', 'SERIE', 'NUMERO',
                                     'CFOP', 'EMITENTE', 'VALOR_TOTAL', 'BASE_CALCULO_ICMS',
                                     'VALOR_ICMS ', 'ISENTA_NAO_TRIBUTADA', 'OUTRAS_ICMS',
                                     'ALIQUOTA', 'SITUACAO');

function GetRegistro50 : TRegistro50;
var
  Registro50: TRegistro50;

implementation

{ TRegistro50 }

function GetRegistro50 : TRegistro50;
begin
  if not Assigned(Registro50) then
    Registro50 := TRegistro50.Create();

  Result := Registro50;
end;

constructor TRegistro50.Create;
begin
  inherited Create(CAMPOS);
end;

end.
