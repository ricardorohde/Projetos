unit uRegistro10;

interface

uses
  Classes, Contnrs, SysUtils, StrUtils, Dialogs, Variants, uInterfaceBase;

  type
    TRegistro10 = class(TInterfaceBase)

    private

    public
      constructor Create(); reintroduce;
  end;

const
  CAMPOS : array[0..11] of String = ('CNPJ', 'INSCRICAO_ESTADUAL', 'NOME_CONTRIBUINTE',
                                     'MUNICIPIO', 'UNIDADE_FEDERACAO', 'FAX', 'DATA_INICIAL',
                                     'DATA_FINAL', 'IDENTIFICACAO_ARQUIVO', 'IDENTIFICACAO_CONVENIO',
                                     'IDENTIFICACAO_NATUREZA_OPERACAO', 'CODIGO_FINALIDADE');


function GetRegistro10 : TRegistro10;
var
  Registro10: TRegistro10;

implementation

{ TRegistro10 }

function GetRegistro10 : TRegistro10;
begin
  if not Assigned(Registro10) then
    Registro10 := TRegistro10.Create();

  Result := Registro10;
end;

constructor TRegistro10.Create;
begin
  inherited Create(CAMPOS);
end;

end.
