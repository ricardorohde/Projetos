(*
  Alterdata Hints - Funções para exibição de hints de Erro, Alerta e Informação
  Criação: 11/08/2011  - Francisco.dsn.pack


  Histórico de Alterações:
-------------------------------------------------------------
  Data Alteração  | Programador  | Descrição
-------------------------------------------------------------
  11/08/2011        Francisco      Criação da Unit
-------------------------------------------------------------
*)
unit AlterdataHintsView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, Contnrs, ExtCtrls, ImgList, cxGraphics, Buttons, StdCtrls,
  Menus, cxImage, dxGDIPlusClasses, cxContainer, cxEdit;


// Configurações padrão
const

   HINT_DEFAULT_TIMER             = 2000;
   HINT_ANIMATION_DURATION        = 110;
   HINT_PADDING                   = 6;

   HINT_SHOW_CLOSE_BUTTON         = false;
   HINT_CLOSE_PADDING             = 2;
   
   HINT_PARENT_BORDER_PADDING     = 3;
   HINT_SHADOW_SIZE               = 1;
   HINT_SHADOW_COLOR              = clSilver;

   //HINT_COLOR_ERROR               = $00CACAFF; //Claro
   HINT_COLOR_ERROR               = $007171FF;   //Escuro
   HINT_COLOR_WARNING             = $00D6FBFE;
   HINT_COLOR_INFORMATION         = $00FFE6CC;


   //HINT_BORDER_COLOR_ERROR        = $009F9FFF; //Claro
   HINT_BORDER_COLOR_ERROR        = $001515FF;   //Escuro
   HINT_BORDER_COLOR_WARNING      = $0057CFF7;
   HINT_BORDER_COLOR_INFORMATION  = $00FFCB97;


   //HINT_FONT_COLOR_ERROR          = $003E3E3E; //Claro
   HINT_FONT_COLOR_ERROR          = $00FDFDFD;   //Escuro
   HINT_FONT_COLOR_WARNING        = $003E3E3E;
   HINT_FONT_COLOR_INFORMATION    = $003E3E3E;

   HINT_SHOW_ICONS                = false;


type
  TAlterdataHintTypes = (hintError, hintWarning, hintInformation);

type
  TAlterdataHintsView = class(TForm)

    Timer      : TTimer;
    lblMessage : TLabel;
    cxImageError: TcxImage;
    cxImageWarning: TcxImage;
    cxImageInformation: TcxImage;
    TimerMove: TTimer;
    cxImageFechar: TcxImage;

    procedure TimerTimer(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure TimerMoveTimer(Sender: TObject);
    procedure cxImageFecharClick(Sender: TObject);

  private

    FFixed      : Boolean;
    FExibeIcone : Boolean;
    FControl    : TControl;
    FTipoHint   : TAlterdataHintTypes;
    FMensagem   : string;

    FUltimaPosicaoPai : TPoint;

    function  ColorMap()     : TColor;
    function  BorderMap()    : TColor;
    function  FontColorMap() : TColor;
    procedure PictureMap();
    
    procedure PersonalizeHint();
    procedure CreateBorder();
    procedure CreateDisplay();
    procedure CreateShadow();

    procedure AjustSize();
    procedure AjustLeft();
    procedure AjustTop();
    
    procedure SetTimer(duracao : integer);

    procedure ClearHints();


  public

    procedure BuildHint(fixo : Boolean; componente: TControl; mensagem: string; tipoHint : TAlterdataHintTypes; exibeIcone : boolean; duracao : integer);
    
    class procedure ClearHint(componente : TControl);
    class procedure ClearAllHints();
    class procedure RepaintAll();

  end;




implementation

uses Types;


var
    ListaHints    : TComponentList;

{$R *.dfm}

{ TAlterdataHintsView }

(*
  Customização de cores e posição da mensagem (label)
*)
procedure TAlterdataHintsView.PersonalizeHint();
begin


  Canvas.Brush.Color := ColorMap();
  Canvas.Pen.Color   := BorderMap();

  lblMessage.Font.Color := FontColorMap();
  lblMessage.Left       := HINT_PADDING;
  lblMessage.top        := HINT_PADDING;
  lblMessage.Caption    := FMensagem;

  if FTipoHint = hintError then
    lblMessage.Font.Style := [fsBold];

  if FExibeIcone then
  begin
    lblMessage.Caption := '     ' +  FMensagem;
    PictureMap();
  end;

  if FFixed and HINT_SHOW_CLOSE_BUTTON then
  begin
    cxImageFechar.Top  :=  HINT_CLOSE_PADDING;
    cxImageFechar.Left :=  lblMessage.Width + HINT_PADDING + HINT_CLOSE_PADDING + lblMessage.Left;
    cxImageFechar.Visible := true;
  end;
    
end;


(*
  Mapeamento da cor de fundo do hint através do seu tipo de mensagem,
  seu tipo definido no TAlterdataHintTypes
*)
function TAlterdataHintsView.ColorMap(): TColor;
begin

  case FtipoHint of
    hintError       : Result := HINT_COLOR_ERROR;
    hintWarning     : Result := HINT_COLOR_WARNING;
    hintInformation : Result := HINT_COLOR_INFORMATION;
  end;

end;



(*
  Mapeamento da cor da borda do hint através do seu tipo de mensagem,
  seu tipo é definido no TAlterdataHintTypes
*)
function TAlterdataHintsView.BorderMap(): TColor;
begin

  case FtipoHint of
    hintError       : Result := HINT_BORDER_COLOR_ERROR;
    hintWarning     : Result := HINT_BORDER_COLOR_WARNING;
    hintInformation : Result := HINT_BORDER_COLOR_INFORMATION;
  end;

end;


(*
  Mapeamento da cor da fonte do hint através do seu tipo de mensagem,
  seu tipo é definido no TAlterdataHintTypes
*)
function TAlterdataHintsView.FontColorMap(): TColor;
begin

  case FtipoHint of
    hintError       : Result := HINT_FONT_COLOR_ERROR;
    hintWarning     : Result := HINT_FONT_COLOR_WARNING;
    hintInformation : Result := HINT_FONT_COLOR_INFORMATION;
  end;

end;


(*
  Mapeamento do png utilizado de acordo com o tipo da imagem,
  seu tipo é definido no TAlterdataHintTypes
*)
procedure TAlterdataHintsView.PictureMap();
begin

  case FtipoHint of
    hintError       : cxImageError.Visible       := True;
    hintWarning     : cxImageWarning.Visible     := True;
    hintInformation : cxImageInformation.Visible := True;
  end;

end;


(*
  Rotina para apagar as mensagens existentes na tela
*)
procedure TAlterdataHintsView.ClearHints();
begin

  if (Self.Showing) then
  begin

    if Assigned(FControl.Parent) then
      FControl.Parent.Repaint;

    Self.Free;

  end;

  RepaintAll();

end;


(*
  Rotina responsável por montar o hint a partir dos parametros informados
*)
procedure TAlterdataHintsView.BuildHint(fixo : Boolean; componente: TControl; mensagem: string; tipoHint: TAlterdataHintTypes;
  exibeIcone : Boolean; duracao: integer);
begin

  ClearHint(componente);
  ListaHints.Add(Self);

  FFixed      := fixo;
  FExibeIcone := exibeIcone;
  FControl    := componente;


  FMensagem := mensagem;
  FTipoHint := tipoHint;

  PersonalizeHint();
  AjustSize();
  CreateBorder();
  CreateDisplay();
  CreateShadow();

  SetTimer(duracao);

  RepaintAll();

end;


(*
  Rotina responsável por criar a borda sobre o componente que chama o hint
*)
procedure TAlterdataHintsView.CreateBorder();
var
  cCanvas :  TControlCanvas;
begin

  cCanvas := TControlCanvas.Create();

  try

    cCanvas.Control     := FControl.Parent;
    cCanvas.Brush.Color := BorderMap();
    cCanvas.Pen.Width   := HINT_PARENT_BORDER_PADDING;
    cCanvas.FrameRect(Rect(FControl.left-HINT_PARENT_BORDER_PADDING , FControl.top-HINT_PARENT_BORDER_PADDING, FControl.BoundsRect.Right+HINT_PARENT_BORDER_PADDING, FControl.BoundsRect.Bottom+HINT_PARENT_BORDER_PADDING));

  finally

    cCanvas.Free;

  end;

end;


(*
  Rotina que deixa o hint visivel
*)
procedure TAlterdataHintsView.CreateDisplay();
begin

  AnimateWindow(Self.Handle, HINT_ANIMATION_DURATION, AW_BLEND);
  ShowWindow(Self.Handle, SW_SHOWNA);

  Self.FormStyle := fsStayOnTop;
  Self.Visible   := true;
  Repaint;

end;

(*
  Rotina responsável por criar a sombra do hint
*)
procedure TAlterdataHintsView.CreateShadow();
var
  cCanvas  :  TControlCanvas;
  lRect    : TRect;
begin

  cCanvas := TControlCanvas.Create();

  try

    cCanvas.Control := FControl.Parent;

    cCanvas.Brush.Color := HINT_SHADOW_COLOR;
    cCanvas.Pen.Width   := HINT_SHADOW_SIZE;
    lRect.TopLeft       := FControl.parent.ScreenToClient(Self.BoundsRect.TopLeft);
    lRect.BottomRight   := FControl.Parent.ScreenToClient(Self.BoundsRect.BottomRight);

    inc(lRect.Top,    HINT_SHADOW_SIZE);
    inc(lRect.Left,   HINT_SHADOW_SIZE);
    inc(lRect.Right,  HINT_SHADOW_SIZE);
    inc(lRect.Bottom, HINT_SHADOW_SIZE);

    cCanvas.FillRect( lRect );

  finally

    cCanvas.Free;

  end;


end;


(*
  Rotina responsável por posicionar o forme em relação ao componente passado
*)
procedure TAlterdataHintsView.AjustSize();
var
  PosicaoComponente : TPoint;
  
begin

  FUltimaPosicaoPai.X := FControl.Parent.Left;
  FUltimaPosicaoPai.Y := FControl.Parent.Top;

  PosicaoComponente.X := 0;
  PosicaoComponente.Y := 0;

  PosicaoComponente := FControl.ClientToScreen(PosicaoComponente);

  Self.Left   := PosicaoComponente.x - HINT_PADDING+1;
  Self.Top    := PosicaoComponente.y + FControl.Height;

  if FFixed and HINT_SHOW_CLOSE_BUTTON then
    Self.Width  := lblMessage.BoundsRect.Right  + lblMessage.Left + cxImageFechar.width + (HINT_CLOSE_PADDING *2)
  else
    Self.Width  := lblMessage.BoundsRect.Right  + lblMessage.Left;

  Self.Height := lblMessage.BoundsRect.Bottom + lblMessage.Top;


  AjustLeft();
  AjustTop();

end;

(*
  Caso o hint ultrapasse o limite do canto direito da tela, posiciona o final à direita do componente
*)
procedure TAlterdataHintsView.AjustLeft();
begin

  if ((Self.Width + Self.Left + FControl.Left) > Screen.Width) then
    Self.Left := (Self.Left - Self.Width) + FControl.Width + HINT_PADDING - 1;

end;

(*
  Caso o hint ultrapasse o limite inferior da tela, posiciona acima do componente
*)
procedure TAlterdataHintsView.AjustTop();
begin

  if ((Self.Height + Self.Top + FControl.Top) > Screen.Height) then
    Self.Top := (Self.Top - Self.Height) - FControl.Height - HINT_PADDING + 1;

end;




(*
   Na Execução do timer, apago os hints que possuem duração
*)
procedure TAlterdataHintsView.TimerTimer(Sender: TObject);
begin

  Timer.Enabled := false;
  ClearHints();
  
end;


procedure TAlterdataHintsView.FormPaint(Sender: TObject);
begin

  Canvas.Rectangle(Self.ClientRect);

end;


(*
  Para Hints que não sejam fixos, é utilizado um Timer para
  destruí-lo apos seu tempo de duração terminar
*)
procedure TAlterdataHintsView.SetTimer(duracao : integer);
begin

  if not FFixed then
  begin
    Timer.Interval := duracao;
    Timer.Enabled  := true;
  end
  else
    Timer.Enabled  := false;

end;


(*
  Limpo o hint a partir do controle informado
*)
class procedure TAlterdataHintsView.ClearHint(componente: TControl);
var  i     : integer;
begin

  for i:= 0 to ListaHints.Count-1 do
  begin

    if Assigned(ListaHints.Items[i]) then
    begin
      componente.parent.Repaint;

      if(TAlterdataHintsView(ListaHints.Items[i]).FControl.Parent.name <> componente.Parent.name) then
      begin
        ClearAllHints();
        Break;
      end;

      if (TAlterdataHintsView(ListaHints.Items[i]).FControl.name = componente.name)
      then
      begin
        TAlterdataHintsView(ListaHints.Items[i]).Free;
        Break;
      end;
    end;
  end;

  RepaintAll();

end;

(*
  Limpo todos os hints
*)
class procedure TAlterdataHintsView.ClearAllHints();
var parent : TControl;
begin

  if (ListaHints.Count > 0) then
  begin
    parent := TAlterdataHintsView(ListaHints.Items[0]).FControl.Parent;
    ListaHints.Clear;
    parent.Repaint;
  end;  

end;

(*
  Caso o form esteja em movimento, refaço as bordas e sombras
*)
procedure TAlterdataHintsView.TimerMoveTimer(Sender: TObject);
begin

  if ((FControl.Parent.Left <> FUltimaPosicaoPai.X) or (FControl.Parent.Top <> FUltimaPosicaoPai.Y))
   or not (FControl.Parent.Showing)
  then
  begin

    FUltimaPosicaoPai.X := FControl.Parent.Left;
    FUltimaPosicaoPai.Y := FControl.Parent.Top;

    AjustSize();

    FControl.Parent.Repaint();
    RepaintAll();

  end;

end;

procedure TAlterdataHintsView.cxImageFecharClick(Sender: TObject);
begin

  ClearHints();

end;


(*
  Repinto as bordas e sombras
*)
class procedure TAlterdataHintsView.RepaintAll();
var i : integer;
begin

  for i:= 0 to ListaHints.Count-1 do
  begin
    if not (TAlterdataHintsView(ListaHints.Items[i]).FControl.Parent.Showing) then
    begin
      TAlterdataHintsView(ListaHints.Items[i]).Free;
      Break;
    end;
  end;     

  for i:= 0 to ListaHints.Count-1 do
  begin
    TAlterdataHintsView(ListaHints.Items[i]).CreateBorder();
    TAlterdataHintsView(ListaHints.Items[i]).CreateShadow();
  end;    

end;          



(*
  Caso o form esteja em movimento, refaço as bordas e sombras
*)
procedure TimerControleOnTimer(Sender: TObject);
var
    i : integer;
begin

  for i:= 0 to ListaHints.Count-1 do
  begin     
    if not (TAlterdataHintsView(ListaHints.Items[i]).FControl.Parent.Showing) then
    begin
      TAlterdataHintsView(ListaHints.Items[i]).FControl.Free;
      Break;
    end;
  end;

end;

initialization
  ListaHints    := TComponentList.Create;

finalization
  ListaHints.Free;



end.
