unit LIB;

interface

uses DB, Controls, SysUtils, Classes, DIALOGS, Variants,
     Forms, Windows, uPesquisa, StdCtrls, Buttons,
     ExtCtrls, ComCtrls, ToolWin, Grids, DBGrids;

  type TAbertura = (taShow, taShowModal);
  
  function Empty(value : Variant): Boolean;
  function Confirma(Mensagem : string): Boolean;
  procedure Aviso(Mensagem : string);
  procedure Informacao(Mensagem : string);
  function AddAspas(Value : string): string;

  procedure Pesquisar(Sender : TControl);
  procedure CriaForm(NomeForm: TFormClass; TipoAbertura : TAbertura);
  function DiaSemana(Dia : Integer): String;
  function RetornarID(const Tabela, Campo: string; const Schema : string = 'public'): Integer;


const CRLF = #13#10;

implementation

uses uDM_Utils;

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

procedure CriaForm(NomeForm: TFormClass; TipoAbertura : TAbertura);
begin
  TForm(NomeForm) := NomeForm.Create(NIL);
  try
    if TipoAbertura = taShow then
      TForm(NomeForm).Show
    else
      TForm(NomeForm).ShowModal;
  finally
    FreeAndNil(NomeForm);
  end;
end;

function DiaSemana(Dia : Integer): String;
begin
  Result := '';
  case Dia of
    1: Result := 'Domingo';
    2: Result := 'Segunda';
    3: Result := 'Terça';
    4: Result := 'Quarta';
    5: Result := 'Quinta';
    6: Result := 'Sexta';
    7: Result := 'Sábado';
  end;
end;


function RetornarID(const Tabela, Campo: string; const Schema : string = 'public'): Integer;
begin
  Result := 0;
  DM_Utils := TDM_Utils.Create(nil);
  try
    DM_Utils.cdsRetornoID.Close;
    DM_Utils.cdsRetornoID.Params.ParamByName('TABELA').AsString := AddAspas(Schema)+ '.' + AddAspas(Tabela) ;
    DM_Utils.cdsRetornoID.Params.ParamByName('CAMPO').AsString  := Campo;
    DM_Utils.cdsRetornoID.Active := True;

    if not DM_Utils.cdsRetornoID.IsEmpty then
      Result := DM_Utils.cdsRetornoID.FieldByName('id').AsInteger;
  finally
    FreeAndNil( DM_Utils );
  end;
end;

end.
