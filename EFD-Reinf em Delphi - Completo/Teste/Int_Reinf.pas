unit Int_Reinf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StrUtils, XSBuiltIns, OleCtrls, Generics.Collections,
  Dialogs, BaseLibrary;

implementation

  type
    IReinfBase = interface
      procedure SetCodigo(const Value: Integer);
      function  GetCodigo() : Integer;

      property Codigo    : Integer read GetCodigo    write SetCodigo;
    end;

  type
    TReinfBase = class(TInterfacedObject, IReinfBase)
    private
    FCodigo: Integer;
    procedure SetCodigo(const Value: Integer);
      function  GetCodigo() : Integer;
    public
      procedure AfterConstruction; override;
      property Codigo: Integer read GetCodigo write SetCodigo;
    end;

{ TReinfBase }

procedure TReinfBase.AfterConstruction;
begin
  inherited;

end;

function TReinfBase.GetCodigo: Integer;
begin
  Result:= FCodigo;
end;

procedure TReinfBase.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

end.

