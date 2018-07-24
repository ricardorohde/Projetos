unit AlterdataHints;

interface

uses Classes, Controls, AlterdataHintsView;

  procedure ShowHint(componente                 : TControl; mensagem : string; tipoHint : TAlterdataHintTypes; exibeIcone : Boolean = HINT_SHOW_ICONS; duracao : integer = HINT_DEFAULT_TIMER);
  procedure ShowHintWarning(componente          : TControl; mensagem : string; exibeIcone : Boolean = HINT_SHOW_ICONS; duracao : integer = HINT_DEFAULT_TIMER);
  procedure ShowHintInformation(componente      : TControl; mensagem : string; exibeIcone : Boolean = HINT_SHOW_ICONS; duracao : integer = HINT_DEFAULT_TIMER);
  procedure ShowHintError(componente            : TControl; mensagem : string; exibeIcone : Boolean = HINT_SHOW_ICONS; duracao : integer = HINT_DEFAULT_TIMER);

  procedure ShowFixedHint(componente            : TControl; mensagem : string; tipoHint : TAlterdataHintTypes; exibeIcone : Boolean = HINT_SHOW_ICONS);
  procedure ShowFixedHintWarning(componente     : TControl; mensagem : string; exibeIcone : Boolean = HINT_SHOW_ICONS);
  procedure ShowFixedHintInformation(componente : TControl; mensagem : string; exibeIcone : Boolean = HINT_SHOW_ICONS);
  procedure ShowFixedHintError(componente       : TControl; mensagem : string; exibeIcone : Boolean = HINT_SHOW_ICONS);

  procedure ClearAllHints();
  procedure ClearHint(control : TControl);



implementation


(*
  Exibe o hint, por padrão seu tempo de duração está definido
  como Default na constante HINT_DEFAULT_TIMER, porém pode ser parâmetro na chamada da procedure
*)
procedure ShowHint(componente : TControl; mensagem : string; tipoHint : TAlterdataHintTypes; exibeIcone : Boolean; duracao : integer);
begin

  with TAlterdataHintsView.Create(nil) do
  begin
    BuildHint(false, componente, mensagem, tipoHint, exibeIcone, duracao);
  end;

end;


(*
  Exibe hint de Erro, por padrão seu tempo de duração está definido
  como Default na constante HINT_DEFAULT_TIMER, porém pode ser parâmetro na chamada da procedure
*)
procedure ShowHintError(componente: TControl; mensagem: string; exibeIcone : Boolean;
  duracao: integer);
begin
  ShowHint(componente, mensagem, hintError, exibeIcone, duracao);
end;


(*
  Exibe hint de Alerta, por padrão seu tempo de duração está definido
  como Default na constante HINT_DEFAULT_TIMER, porém pode ser parâmetro na chamada da procedure
*)
procedure ShowHintWarning(componente: TControl; mensagem: string; exibeIcone : Boolean;
  duracao: integer);
begin
  ShowHint(componente, mensagem, hintWarning, exibeIcone, duracao);
end;


(*
  Exibe hint de Informação, por padrão seu tempo de duração está definido
  como Default na constante HINT_DEFAULT_TIMER, porém pode ser parâmetro na chamada da procedure
*)
procedure ShowHintInformation(componente: TControl; mensagem: string; exibeIcone : Boolean;
  duracao: integer);
begin
  ShowHint(componente, mensagem, hintInformation, exibeIcone, duracao);
end;



(*
  Exibe o hint fixo, este hint só é destruido na chamada da função ClearHints
  como Default na constante HINT_DEFAULT_TIMER, porém pode ser parâmetro na chamada da procedure
*)
procedure ShowFixedHint(componente : TControl; mensagem : string; tipoHint : TAlterdataHintTypes; exibeIcone : Boolean);
begin

  with TAlterdataHintsView.Create(nil) do
  begin
    BuildHint(true, componente, mensagem, tipoHint, exibeIcone,  0);
  end;

{  with TAlterdataHintsView.Create(Componente.Parent) do
  begin
    BuildHint(true, componente, mensagem, tipoHint, exibeIcone,  0);
  end;}
  
end;

(*
  Exibe hint de Erro fixo, este hint só é destruido na chamada da função ClearHints
  como Default na constante HINT_DEFAULT_TIMER, porém pode ser parâmetro na chamada da procedure
*)
procedure ShowFixedHintError(componente: TControl;
  mensagem: string; exibeIcone : Boolean);
begin
  ShowFixedHint(componente, mensagem, hintError, exibeIcone);
end;


(*
  Exibe hint de Alerta fixo, este hint só é destruido na chamada da função ClearHints
  como Default na constante HINT_DEFAULT_TIMER, porém pode ser parâmetro na chamada da procedure
*)
procedure ShowFixedHintWarning(componente: TControl;
  mensagem: string; exibeIcone : Boolean);
begin
  ShowFixedHint(componente, mensagem, hintWarning, exibeIcone);
end;


(*
  Exibe hint de Informação fixo, este hint só é destruido na chamada da função ClearHints 
  como Default na constante HINT_DEFAULT_TIMER, porém pode ser parâmetro na chamada da procedure
*)
procedure ShowFixedHintInformation(componente: TControl;
  mensagem: string; exibeIcone : Boolean);
begin
  ShowFixedHint(componente, mensagem, hintInformation, exibeIcone);
end;


(*
  Apago todos os hints
*)
procedure ClearAllHints();
begin

  TAlterdataHintsView.ClearAllHints();
  
end;


(*
  Apago o hint de um determinado controle
*)
procedure ClearHint(control : TControl);
begin
  TAlterdataHintsView.ClearHint(control);
  TAlterdataHintsView.RepaintAll();
end;



end.
