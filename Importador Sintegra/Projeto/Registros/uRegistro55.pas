unit uRegistro55;

interface

uses
  Classes, Contnrs, SysUtils, StrUtils, Dialogs, Variants, uInterfaceBase;

  type
    TRegistro55 = class(TInterfaceBase)

    private

    public
      constructor Create(); reintroduce;
  end;

const
  CAMPOS : array[0..14] of String = ('CNPJ', 'INSCRICAO_ESTADUAL', 'DATA_GNRE', 'UNIDADE_FEDERACAO_SUBSTITUTO',
                                     'UNIDADE_FEDERACAO_FAVORECIDA', 'BANCO_GNRE', 'AGENCIA_GNRE', 'NUMERO_GNRE',
                                     'VALOR_GNRE', 'DATA_VENCIMENTO', 'MES_ANO_REFERENCIA', 'NUMERO_CONVENIO',
                                     'BASE_CALCULO_ICMS_ST', 'VALOR_IPI', 'ALIQUOTA_ICMS');

function GetRegistro55 : TRegistro55;
var
  Registro55: TRegistro55;

implementation

{ TRegistro55 }

function GetRegistro55 : TRegistro55;
begin
  if not Assigned(Registro55) then
    Registro55 := TRegistro55.Create();

  Result := Registro55;
end;

constructor TRegistro55.Create;
begin
  inherited Create(CAMPOS);
end;

end.
