unit LIB;

interface

uses DB, Controls, SysUtils, Classes, DIALOGS, Variants,
     Forms, Windows, uPesquisa, StdCtrls, Buttons,
     ExtCtrls, ComCtrls, ToolWin, Grids, DBGrids;

  function Empty(value : Variant): Boolean;
  function Confirma(Mensagem : string): Boolean;
  procedure Aviso(Mensagem : string);
  procedure Informacao(Mensagem : string);
  function AddAspas(Value : string): string;

  procedure Pesquisar(Sender : TControl);
  procedure CriaForm(NomeForm: TFormClass);

implementation

function Empty(value : Variant): Boolean;
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

function AddAspas(Value : string): string;
begin
  Result := '"' + Value + '"';
end;

function Confirma(Mensagem : string): Boolean;
begin
  Result := Application.MessageBox( PChar(Mensagem), PChar('Confirma?'), MB_ICONINFORMATION+MB_YESNO ) = mrYes;
end;

procedure Aviso(Mensagem : string);
begin
  Application.MessageBox( PChar(Mensagem), PChar('Aviso'), MB_ICONWARNING+MB_OK );
end;

procedure Informacao(Mensagem : string);
begin
  Application.MessageBox( PChar(Mensagem), PChar('Informacao'), MB_ICONINFORMATION+MB_OK );
end;

procedure Pesquisar(Sender : TControl);
begin
  TEdit(Sender).Text := frmPesquisa.Pesquisar();
end;

procedure CriaForm(NomeForm: TFormClass);
begin
  TForm(NomeForm) := NomeForm.Create(NIL);
  try
    TForm(NomeForm).ShowModal;
  finally
    FreeAndNil(NomeForm);
  end;
end;

end.
