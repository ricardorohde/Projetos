unit uRegistro53;

interface

uses
  Classes, Contnrs, SysUtils, StrUtils, Dialogs, Variants, uInterfaceBase;

  type
    TRegistro53 = class(TInterfaceBase)

    private

    public
      constructor Create(); reintroduce;
  end;

const
  CAMPOS : array[0..11] of String = ('CNPJ', 'INSCRICAO_ESTADUAL', 'DATA_EMISSAO',
                                     'UNIDADE_FEDERACAO', 'SERIE', 'NUMERO', 'CFOP',
                                     'EMITENTE', 'BASE_CALCULO_ICMS', 'ICMS_RETIDO',
                                     'DESPESAS_ACESSORIAS', 'SITUACAO');

function GetRegistro53 : TRegistro53;
var
  Registro53: TRegistro53;

implementation

{ TRegistro53 }

function GetRegistro53 : TRegistro53;
begin
  if not Assigned(Registro53) then
    Registro53 := TRegistro53.Create();

  Result := Registro53;
end;

constructor TRegistro53.Create;
begin
  inherited Create(CAMPOS);
end;

end.
