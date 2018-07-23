unit EMSFindEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons;

type
  TResultEvent = procedure(Sender : TObject; var ResultFind : TStrings) of Object;
  TSearchEvent = procedure(Sender : TObject; var CanSearch : boolean) of Object;

  TEMSFindEdit = class(TCustomMaskEdit)
  private
    FHeight        : Integer;
    FLookUpAll     : Boolean;
    FCaseSensitive : Boolean;
    FButton        : TSpeedButton;

    { Private declarations }
    procedure WMDestroy(var Message: TWMSize); message WM_DESTROY;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure SetHeight(const Value: Integer);
  protected
    { Protected declarations }
    FBtnControl     : TSpeedButton;
    FOnAfterButton  : TResultEvent;
    FOnBeforeSearch : TSearchEvent;
    FOnLookUpChange : TNotifyEvent;

    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    function GetMinHeight: Integer;
    procedure SetEditRect;
  public
    { Public declarations }

    constructor Create(AOwner: TComponent);override;
  published
    { Published declarations }
    property OnBeforeSearch: TSearchEvent read FOnBeforeSearch write FOnBeforeSearch;
    property OnLookUpChange: TNotifyEvent read FOnLookUpChange write FOnLookUpChange;
    property OnAfterButton: TResultEvent  read FOnAfterButton write FOnAfterButton;

    property Height : Integer read FHeight write SetHeight default 21;

    property Font;
    property CaseSensitive: Boolean read FCaseSensitive write FCaseSensitive;
    property LookUpAll: Boolean read FLookUpAll write FLookUpAll default True;
    property TabOrder;
    property Enabled;
    property Charcase;
    property PopupMenu;
    property Visible;
    property OnChange;
    property OnClick;
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

procedure Register;
begin
  RegisterComponents('EMS', [TEMSFindEdit]);
end;

{ TEMSFindEdit }

procedure TEMSFindEdit.CMFontChanged(var Message: TMessage);
begin
  GetMinHeight;
  Invalidate;
end;

constructor TEMSFindEdit.Create(AOwner: TComponent);
begin
  inherited;

end;

function TEMSFindEdit.GetMinHeight: Integer;
var
  DC: HDC;
  SaveFont: HFont;
  I, VTextMargin: Integer;
  SysMetrics, Metrics: TTextMetric;
begin
  DC := GetDC(0);
  GetTextMetrics(DC, SysMetrics);
  SaveFont := SelectObject(DC, Font.Handle);
  GetTextMetrics(DC, Metrics);
  SelectObject(DC, SaveFont);
  ReleaseDC(0, DC);
  I := SysMetrics.tmHeight;
  if I > Metrics.tmHeight then I := Metrics.tmHeight;
  vTextMargin := I div 4;
  Result := Metrics.tmHeight + vTextMargin + GetSystemMetrics(SM_CYBORDER) * 4 + 1;
end;

procedure TEMSFindEdit.SetEditRect;
var
  Rect: TRect;
begin
  Rect.Bottom := ClientHeight + 1;
  Rect.Right  := FBtnControl.Left - 2;
  Rect.Top    := 0;
  Rect.Left   := 0;
  SendMessage(Handle, EM_SETRECTNP, 0, LongInt(@Rect));
end;

procedure TEMSFindEdit.SetHeight(const Value: Integer);
begin
  FHeight := Value;
end;

procedure TEMSFindEdit.WMDestroy(var Message: TWMSize);
begin
//
end;

procedure TEMSFindEdit.WMKillFocus(var Message: TWMKillFocus);
begin
//
end;

procedure TEMSFindEdit.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  Invalidate;
end;

procedure TEMSFindEdit.WMSize(var Message: TWMSize);
var
  MinHeight: Integer;
begin
  inherited;
  MinHeight := GetMinHeight;
  if Height < MinHeight then
    Height := MinHeight
  else
    begin
//      if NewStyleControls then
//        FBtnControl.SetBounds(ClientWidth - FButton.Width, 0, FButton.Width, ClientHeight)
//      else
//        FBtnControl.SetBounds(ClientWidth - FButton.Width, 1, FButton.Width, ClientHeight - 1);
//      FButton.Height := FBtnControl.Height;
      SetEditRect;
    end;
end;

end.
