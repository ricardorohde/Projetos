unit ITDBSearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls,buttons,ExtCtrls,db;

type
  TITDBSearch = class(TDBEdit)
  private
    { Private declarations }
    FButton: TSpeedButton;
    FWinBack: TWinControl;
    FCanvas: TControlCanvas;
    FBitMapName:string;
    FEdicaoDireta:Boolean;
  protected
    { Protected declarations }
    procedure CreateButton;
    procedure ButtonClick(Sender: TObject);
    procedure BtnClick(Sender: TObject);virtual;abstract;
    procedure SetButtonSize;
    procedure SetHintBtn(Value: string);
    function getHintBtn : string;
    procedure SetClientRect;
    procedure CMEnter(var Msg: TCMGotFocus); message CM_ENTER;
    procedure WMSize(var Msg: TWMSize); message WM_SIZE;
    procedure WMPaint(var Msg: TWMPaint); message WM_PAINT;
    procedure SetGlyph(Value: TBitmap);
    function getNumGlyphs: integer;
    procedure SetNumGlyphs(Value: Integer);
    function getGlyph: TBitmap;
    function GetAlignment: TAlignment;
    function GetTextMargins: TPoint;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure SetEnabled(Value: Boolean); override;
    procedure KeyPress(Var Key:Char);override;
    procedure KeyDown( var Key: Word; Shift: TShiftState);override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);override;
    constructor CreateIcon(AOwner: TComponent;BitMapName:string);
    //    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { Published declarations }
    property Glyph: TBitmap read getGlyph write SetGlyph;
    property HintBtn: string read getHintBtn write SetHintBtn;
    property NumGlyphs:integer read getNumGlyphs write SetNumGlyphs;
    property EdicaoDireta:Boolean read FEdicaoDireta write FEdicaoDireta default false;
  end;

implementation
{$R ITDBSearch}

{ TITDBSearch }

constructor TITDBSearch.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FBitMapName:='3PONTOS';
  FCanvas := TControlCanvas.Create;
  CreateButton;
end;

constructor TITDBSearch.CreateIcon(AOwner: TComponent;BitMapName:string);
begin
  inherited Create(AOwner);
  FBitMapName:=BitMapName;
  FCanvas := TControlCanvas.Create;
  CreateButton;
end;

// Destroy
destructor TITDBSearch.Destroy;
begin
  FButton.Free;
  inherited Destroy;
end;

// CreateButton
procedure TITDBSearch.CreateButton;
begin
  FWinBack := TWinControl.Create(Self);   // fundo do botão
  FWinBack.Parent := Self;
  FButton := TSpeedButton.Create(Self);
  FButton.Parent := FWinBack;
  FButton.OnClick := ButtonClick;
  FButton.Glyph.Handle := LoadBitmap(HInstance,Pchar(FBitMapName));
  self.update;
end;

procedure TITDBSearch.ButtonClick(Sender: TObject);
begin
 if(Datasource<>nil)and(DataField<>'')and
    (Datasource.state in [dsinsert,dsedit])then
 begin
   BtnClick(Sender);
 end;
end;

procedure TITDBSearch.KeyPress(Var Key:Char);
begin

  if(key =chr(vk_return))then
    ButtonClick(self)
  else
  if(not FEdicaoDireta) and ( not (key =chr(vk_tab)) )then
    key:=#0;

  inherited KeyPress(Key);
end;

procedure TITDBSearch.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if(not FEdicaoDireta) and (Key=vk_delete)then
    key:=0;
  inherited KeyDown(Key,Shift);
end;

function TITDBSearch.getHintBtn : string;
begin
 result := FButton.Hint;
end;

// SetHintBtn
procedure TITDBSearch.SetHintBtn(Value: string);
begin
  if FButton.Hint <> Value then
  begin
    FButton.Hint := Value;
  end;
end;

// CreateParams
procedure TITDBSearch.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style or ES_MULTILINE or WS_CLIPCHILDREN;
end;

procedure TITDBSearch.SetEnabled(Value: Boolean);
begin
  inherited SetEnabled(Value);

  if (FButton <> nil) and (FButton.Enabled<>Value) then
    FButton.Enabled := Value;
end;

procedure TITDBSearch.CreateWnd;
begin
  inherited CreateWnd;
  SetClientRect;
end;

// SetClientRect
procedure TITDBSearch.SetClientRect;
var
  Rect: TRect;
begin
  SendMessage(Handle, EM_GETRECT, 0, Longint(@Rect));
  Rect.Bottom := ClientHeight + 1;  // +1 bug
  Rect.Right := ClientWidth - FButton.Width - 2;
  Rect.Top := 0;
  Rect.Left := 0;
  SendMessage(Handle, EM_SETRECTNP, 0, LongInt(@Rect));
  SendMessage(Handle, EM_GETRECT, 0, LongInt(@Rect));  // debug
end;

// WMSize
procedure TITDBSearch.WMSize(var Msg: TWMSize);
begin
  inherited;
  SetClientRect;
  SetButtonSize;
end;

// CMEnter
procedure TITDBSearch.CMEnter(var Msg: TCMGotFocus);
begin
  inherited;
  if AutoSelect and not (csLButtonDown in ControlState) then
    SelectAll;
end;

// SetButtonSize
procedure TITDBSearch.SetButtonSize;
begin
  FWinBack.SetBounds(Width - ClientHeight - 4, 0, ClientHeight, ClientHeight);
  FButton.SetBounds(0, 0, ClientHeight, ClientHeight);
end;

// SetGlyph
procedure TITDBSearch.SetGlyph(Value: TBitmap);
begin
  if Value = nil then
    FButton.Glyph.Handle := LoadBitmap(HInstance,Pchar(FBitMapName))
  else
    FButton.Glyph.Assign(Value);
end;

function TITDBSearch.getGlyph: TBitmap;
begin
  result:=FButton.Glyph;
end;

procedure TITDBSearch.SetNumGlyphs(Value: Integer);
begin
  if (Value<>NumGlyphs) then
  begin
    FButton.NumGlyphs := Value;
  end;
end;

function TITDBSearch.getNumGlyphs: integer;
begin
  result:=FButton.NumGlyphs;
end;

// WMPaint
procedure TITDBSearch.WMPaint(var Msg: TWMPaint);
var
  Left: Integer;
  Margins: TPoint;
  R: TRect;
  DC: HDC;
  PS: TPaintStruct;
  S: string;
begin
  if ((GetAlignment = taLeftJustify) or Focused) and
    not (csPaintCopy in ControlState) then
    begin
      inherited;
      Exit;
    end;
  DC := Msg.DC;
  if DC = 0 then
    DC := BeginPaint(Handle, PS);
  FCanvas.Handle := DC;
  try
    FCanvas.Font := Font;
    with FCanvas do
      begin
        R := ClientRect;
        if not (NewStyleControls and Ctl3D) and (BorderStyle = bsSingle) then
          begin
            Brush.Color := clWindowFrame;
            FrameRect(R);
            InflateRect(R, -1, -1);
          end;
        Brush.Color := Color;
        if not Enabled then
          Font.Color := clGrayText;
        if (csPaintCopy in ControlState) and (Field <> nil) then
          begin
            S := Field.DisplayText;
            case CharCase of
              ecUpperCase: S := AnsiUpperCase(S);
              ecLowerCase: S := AnsiLowerCase(S);
            end;
          end
        else
          S := EditText;
        if PasswordChar <> #0 then
          FillChar(S[1], Length(S), PasswordChar);
        Margins := GetTextMargins;
        case GetAlignment of
          taLeftJustify: Left := Margins.X;
          taRightJustify: Left := ClientWidth - TextWidth(S) - Margins.X - 1 - FWinBack.Width;
        else
          Left := (ClientWidth - TextWidth(S) - FWinBack.Width) div 2;
        end;
        TextRect(R, Left, Margins.Y, S);
      end;
  finally
    FCanvas.Handle := 0;
    if Msg.DC = 0 then
      EndPaint(Handle, PS);
  end;
end;

// GetTextMargins
function TITDBSearch.GetTextMargins: TPoint;
var
  DC: HDC;
  SaveFont: HFont;
  I: Integer;
  SysMetrics, Metrics: TTextMetric;
begin
  if NewStyleControls then
    begin
      if BorderStyle = bsNone
        then I := 0
      else if Ctl3D then
        I := 1
      else
        I := 2;
      Result.X := SendMessage(Handle, EM_GETMARGINS, 0, 0) and $0000FFFF + I;
      Result.Y := I;
    end
  else
    begin
      if BorderStyle = bsNone then
        I := 0
      else
        begin
          DC := GetDC(0);
          GetTextMetrics(DC, SysMetrics);
          SaveFont := SelectObject(DC, Font.Handle);
          GetTextMetrics(DC, Metrics);
          SelectObject(DC, SaveFont);
          ReleaseDC(0, DC);
          I := SysMetrics.tmHeight;
          if I > Metrics.tmHeight then
            I := Metrics.tmHeight;
          I := I div 4;
        end;
      Result.X := I;
      Result.Y := I;
    end;
end;

// GetAlignment
function TITDBSearch.GetAlignment: TAlignment;
begin
  Result := taLeftJustify;
  if (Field <> nil) then
    Result := Field.Alignment;
end;

end.
