unit uEditButton;
 
interface
 
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons,ExtCtrls;
 
type
  TListFields = record
    Caption   : string;
    FieldName : string;
    Retorno   : Boolean;
    Width     : Integer;
    Tipo      : string;
  end;

  TBeforeButtonEvent = procedure(Sender : TObject) of Object;
  
  TEditBtn = class(TCustomMaskEdit)
  private
    FEditorEnabled: Boolean;
    FOnBtnClick : TNotifyEvent;
    FListFields : TStrings;
 
    procedure SetGlyph(Pic: TBitmap);
    function GetGlyph : TBitmap;
 
    procedure SetNumGlyphs(ANumber: Integer);
    function GetNumGlyphs:Integer;
     
//    function GetMinHeight: Integer;
    procedure SetEditRect;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure CMEnter(var Message: TCMGotFocus); message CM_ENTER;
    procedure CMExit(var Message: TCMExit);   message CM_EXIT;
    procedure WMPaste(var Message: TWMPaste);   message WM_PASTE;
    procedure WMCut(var Message: TWMCut);   message WM_CUT;
    procedure CNKeyDown(var Message: TWMKeyDown); message CN_KEYDOWN; {handle tab}
    function GetListFields: TStrings;
    procedure SetListFields(const Value: TStrings);
  protected
    FAlignment      : TAlignment;
    FFocused        : Boolean;
    FButton         : TSpeedButton;
    FOnBeforeButton : TBeforeButtonEvent;

    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    function IsValidChar(Key: Char): Boolean; virtual;
    procedure aClick (Sender: TObject); virtual;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Button: TSpeedButton read FButton;
  published
    property ListFields: TStrings read GetListFields write SetListFields;
    property OnBeforeButton: TBeforeButtonEvent read FOnBeforeButton write FOnBeforeButton;

    property AutoSelect;
    property AutoSize;
    property Color;
    property Ctl3D;
    property DragCursor;
    property DragMode;
    property EditorEnabled: Boolean read FEditorEnabled write FEditorEnabled default True;
    property Enabled;
    property Font;
    property Glyph : TBitmap read GetGlyph write SetGlyph;
    property NumGlyphs : Integer read GetNumGlyphs write SetNumGlyphs;
    property MaxLength;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnChange;
    property OnClick;
    property OnBtnClick : TNotifyEvent read FOnBtnClick write FOnBtnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;
 
procedure Register;
 
implementation
 
{ TEditBtn }
 
constructor TEditBtn.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FListFields := TStringList.Create;
  FButton := TSpeedButton.Create (Self);
  FButton.Width := 15;
  FButton.Height := 17;
  FButton.Flat := true; //Tenho que ver isso aqui tbm
//  if csDesigning in ComponentState then
  FButton.Visible := True;
//  else FButton.Visible := False;
  FButton.Parent := Self;
  FButton.OnClick := aClick;
  FButton.Cursor := crArrow;
  ControlStyle := ControlStyle - [csSetCaption];
  FEditorEnabled := True;
end;
 
destructor TEditBtn.Destroy;
begin
  FButton := nil;
  FListFields.Free;
  inherited Destroy;
end;
 
procedure TEditBtn.GetChildren(Proc: TGetChildProc; Root: TComponent);
begin
end;
 
procedure TEditBtn.KeyDown(var Key: Word; Shift: TShiftState);
//var
//  stat : Integer;
begin
//  if (Windows.GetWindowLong(handle, GWL_STYLE) and es_multiline)<>0 then
//    begin
//       // 8/22/01 - Don't call inherited if parent processed keystroke.
//       // Parent could process keystroke in case of popup menu with escape key assigned
//       stat:= SendMessage(GetParent(Handle), TMessage(Message).Msg,
//         TMessage(Message).wParam, TMessage(Message).lParam);
//       if (stat<>0) then
//       begin
//         // 7/9/02 - set message.result to 1 if already processed
//         // Fixes problem with form events firing when they should not
//         if (charcode = vk_escape) or
//            (charcode = vk_return) then
//         begin
//            message.result:=1;
//            exit;
//         end
//       end
//    end
//  else
  inherited KeyDown(Key, Shift);
end;

procedure TEditBtn.SetGlyph(Pic: TBitmap);
Begin
  FButton.Glyph.Assign(Pic);
end;
 
function TEditBtn.GetGlyph : TBitmap;
Begin
  Result:=FButton.Glyph;
end;

procedure TEditBtn.SetNumGlyphs(ANumber: Integer);
Begin
  FButton.NumGlyphs:=ANumber;
end;

function TEditBtn.GetNumGlyphs:Integer;
begin
  Result:=FButton.NumGlyphs;
end;

procedure TEditBtn.KeyPress(var Key: Char);
var
  lKey : Char;
begin
//  if not IsValidChar(Key) then
//  begin
//    Key := #0;
//    MessageBeep(0)
//  end;
  if key in [#13, #10] then
  begin
    lKey := key;
    Key  := #0;
  //Perform(Wm_NextDlgCtl,0,0)
//      inherited KeyPress(Key);

  end;
//  if StrToIntDef(Key, -1) <> 0 then


  inherited KeyPress(lKey);
end;

function TEditBtn.IsValidChar(Key: Char): Boolean;
begin
    Result := True;
end;

procedure TEditBtn.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
{  Params.Style := Params.Style and not WS_BORDER;  }
  //Params.Style := Params.Style or ES_MULTILINE or WS_CLIPCHILDREN;
  Params.Style := Params.Style or ES_MULTILINE or WS_CLIPCHILDREN;
end;

procedure TEditBtn.CreateWnd;
begin
  inherited CreateWnd;
  SetEditRect;
end;

procedure TEditBtn.SetEditRect;
var
  Loc: TRect;
begin
  SendMessage(Handle, EM_GETRECT, 0, LongInt(@Loc));
  Loc.Bottom := ClientHeight + 1;  {+1 is workaround for windows paint bug}
  Loc.Right := ClientWidth - FButton.Width - 2;
  Loc.Top := 0;
  Loc.Left := 0;
  SendMessage(Handle, EM_SETRECTNP, 0, LongInt(@Loc));
  SendMessage(Handle, EM_GETRECT, 0, LongInt(@Loc));  {debug}
end;

procedure TEditBtn.WMSize(var Message: TWMSize);
var
  MinHeight: Integer;
begin
  inherited;
  MinHeight := 5;
    { text edit bug: if size to less than minheight, then edit ctrl does
      not display the text }
  if Height < MinHeight then
    Height := MinHeight
  else if FButton <> nil then
  begin
    FButton.Width:=Height;
    if NewStyleControls and Ctl3D then
      FButton.SetBounds(Width - FButton.Width - 5, 0, FButton.Width, Height - 5)
    else
      FButton.SetBounds (Width - FButton.Width, 1, FButton.Width, Height - 1);
    SetEditRect;
  end;
end;
 
//function TEditBtn.GetMinHeight: Integer;
//var
//  DC: HDC;
//  SaveFont: HFont;
//  I: Integer;
//  SysMetrics, Metrics: TTextMetric;
//begin
//  DC := GetDC(0);
//  GetTextMetrics(DC, SysMetrics);
//  SaveFont := SelectObject(DC, Font.Handle);
//  GetTextMetrics(DC, Metrics);
//  SelectObject(DC, SaveFont);
//  ReleaseDC(0, DC);
//  I := SysMetrics.tmHeight;
//  if I > Metrics.tmHeight then I := Metrics.tmHeight;
//  Result := Metrics.tmHeight + I div 4 + GetSystemMetrics(SM_CYBORDER) * 4 + 2;
//end;

procedure TEditBtn.aClick (Sender: TObject);
begin
  if ReadOnly then
    MessageBeep(0)
  else
  if Assigned(FOnBtnClick) then
    FOnBtnClick(Self);
end;


procedure TEditBtn.WMPaste(var Message: TWMPaste);
begin
  if not FEditorEnabled or ReadOnly then Exit;
  inherited;
end;
 
procedure TEditBtn.WMCut(var Message: TWMPaste);   
begin
  if not FEditorEnabled or ReadOnly then Exit;
  inherited;
end;
 
procedure TEditBtn.CMExit(var Message: TCMExit);
begin
  FButton.Visible := True;
  DoExit;
end;
 
procedure TEditBtn.CMEnter(var Message: TCMGotFocus);
begin
  FButton.Visible := True;
  if AutoSelect and not (csLButtonDown in ControlState) then
    SelectAll;
 
  inherited;
end;
 
 
procedure Register;
begin
  RegisterComponents('EMS', [TEditBtn]);
end;
 
function TEditBtn.GetListFields: TStrings;
begin
  Result := FListFields;
end;

procedure TEditBtn.SetListFields(const Value: TStrings);
begin
  if FListFields.Text <> Value.Text then
    try
      begin
        FListFields.BeginUpdate;
        FListFields.Assign(Value);
      end;
    finally
      FListFields.EndUpdate;
    end;
end;

procedure TEditBtn.CNKeyDown(var Message: TWMKeyDown);
var
  stat : Integer;
begin
  with Message do
  begin
    if (Windows.GetWindowLong(handle, GWL_STYLE) and es_multiline)<>0 then
    begin
       // 8/22/01 - Don't call inherited if parent processed keystroke.
       // Parent could process keystroke in case of popup menu with escape key assigned
       stat:= SendMessage(GetParent(Handle), TMessage(Message).Msg,
         TMessage(Message).wParam, TMessage(Message).lParam);
       if (stat<>0) then
       begin
         // 7/9/02 - set message.result to 1 if already processed
         // Fixes problem with form events firing when they should not
         if (charcode = vk_escape) or
            (charcode = vk_return) then
         begin
            message.result:=1;
            exit;
         end
       end;
    end;
  end;
end;

end.
