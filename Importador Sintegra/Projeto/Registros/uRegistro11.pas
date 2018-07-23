unit uRegistro11;

interface

uses
  Classes, Contnrs, SysUtils, StrUtils, Dialogs, Variants, uInterfaceBase;

  type
    TRegistro11 = class(TInterfaceBase)

    private

    public
      constructor Create(); reintroduce;
  end;

const
  CAMPOS : array[0..6] of String = ('LOGRADOURO', 'NUMERO', 'COMPLEMENTO',
                                    'BAIRRO', 'CEP', 'NOME_CONTATO', 'TELEFONE');

function GetRegistro11 : TRegistro11;
var
  Registro11: TRegistro11;

implementation

{ TRegistro11 }

function GetRegistro11 : TRegistro11;
begin
  if not Assigned(Registro11) then
    Registro11 := TRegistro11.Create();

  Result := Registro11;
end;

constructor TRegistro11.Create;
begin
  inherited Create(CAMPOS);
end;

end.
