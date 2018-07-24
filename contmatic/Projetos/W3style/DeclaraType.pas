unit DeclaraType;

interface

uses Classes, dbTables, db, sysUtils, TypInfo;

type
  {ponteiros}
  Ptr_Integer=^integer;
  ptr_String =^string;

  {Arrays}
  aString = Array of String;
  aInteger = Array of Integer;

  //Registros
  TReg_Default = record
     NoCampo   : String;
     Valor     : Variant;
     Alteravel : boolean;
  end;

  TReg_Parametro = record
     Nome      : String;
     Valor     : Variant;
  end;

  TReg_Titulo = record
     Descricao  : String;
     Valor      : Variant;
     Campos     : string;
     Descricao2 : String;
     Valor2     : Variant;
     NrColunas  : integer;
  end;

  TReg_Filtro = record
     Filtro    : String;
     Parametro : String;
     Valor     : Variant;
  end;

  aFiltro    = Array of TReg_Filtro;
  aDefault   = Array of TReg_Default;
  aParametro = Array of TReg_Parametro;
  aTitulo    = Array of TReg_Titulo;

  eParametro_Invalido = Exception;

implementation

end.
