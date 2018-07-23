unit LIB;

interface

uses DB, Controls, SysUtils, Classes, DIALOGS, Variants;

Type
  TLIB = Class(TObject)

  private
  public
    Constructor Create;                //Criação da classe
    Destructor  Destroy; Override;     //Destroi a classe
  end;

  function Empty(value : Variant): boolean;


implementation

{ TLIB }

constructor TLIB.Create;
begin

end;

destructor TLIB.Destroy;
begin

  inherited;
end;

function Empty(value : Variant): boolean;
begin
  result := False;
  case varType(value) of
    varEmpty,
    varNull : result := true;
    varSmallInt,
    varInteger,
    varShortInt,
    varByte,
    varWord,
    varInt64 : Result := (Value = 0);

    varSingle,
    varDouble,
    varCurrency :  Result := (Value = 0.00);
    
    varBoolean  :  Result := not Value;

    varDate     :  Result := (Value = 0);
    varOleStr,
    varString   :  Result := (Value = '');
    
  end;
end;
end.

