unit LookupEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, declaraType,Buttons, dbTables, db, dbctrls, dbGrids,Variants;

type
  TCadStatus = (csNormal, csInclusao, csManutencao, csPesquisa, csConsulta );

  TListFields = record
    Caption   : string;
    FieldName : string;
    Retorno   : Boolean;
    Width     : Integer;
    Tipo      : string;
  end;

  TResultEvent = procedure(Sender : TObject; var ResultFind : TStrings) of Object;
  TSearchEvent = procedure(Sender : TObject; var CanSearch : boolean) of Object;

  TLookupEdit = class(TCustomMaskEdit)
  private
    { Private declarations }
    procedure WMDestroy(var Message: TWMSize); message WM_DESTROY;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
  protected
    { Protected declarations }
    FButton      : TSpeedButton;

    FOnCalcFields: TDataSetNotifyEvent;
    FBtnControl: TWinControl;
//    FBtnControl:TSpeedButton;
    FLookUpAll : Boolean;
    FCaseSensitive : boolean;
    FFindResult : TStrings;
    FOnAfterButton: TResultEvent;
    FOnBeforeSearch: TSearchEvent;
    FOnLookUpChange: TNotifyEvent;
    FFocused : Boolean;
    FAlignment: TAlignment;
    FParametro   : Tstrings;
    vbPesquisou : boolean;
    FArrayListFields : array of TListFields;

    procedure setParametro( value : Tstrings );
    procedure Change; override;
    procedure setLinkValue(Value : Variant);
    function  GetAsString : string;
    procedure setAsString( Const value : string );
    procedure CriaFormPesquisa( pStatus : TCadStatus = csPesquisa);virtual;abstract;
    procedure MakeCalc;virtual;abstract;
    procedure SetEditRect;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMEnabledChanged(var Message: TMessage);
    procedure WMSize(var message: TWMSize);

    function GetMinHeight: Integer;
    procedure KeyPress(var Key: Char); override;
    property Parametro:Tstrings read FParametro Write setParametro;
    
  public
    { Public declarations }

    FLinkValue : Variant;
    constructor Create(AOwner: TComponent);override;
    destructor Destroy;override;
    function isNull : Boolean;
    property LinkValue : Variant read FLinkValue write setLinkValue;
    property AsString : string read GetAsString write setAsString;

    procedure DoClickButton;
  published
    { Published declarations }
    property OnBeforeSearch: TSearchEvent read FOnBeforeSearch write FOnBeforeSearch;
    property OnLookUpChange: TNotifyEvent read FOnLookUpChange write FOnLookUpChange;
    property OnAfterButton: TResultEvent read FOnAfterButton write FOnAfterButton;
    property OnCalcFields: TDataSetNotifyEvent read FOnCalcFields write FOnCalcFields;
    
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

  TFindBtn = class(TSpeedButton)
  protected
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
  end;

implementation

{ TLookupEdit }

constructor TLookupEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Height              := 21;
  FCaseSensitive      := True;
  FBtnControl         := TWinControl.Create(Self);
  FBtnControl.Height  := 17;
  FBtnControl.Width   := 17;
  FBtnControl.Visible := True;
  FBtnControl.Parent  := Self;
  
  FButton := TFindBtn.Create(Self);
  FButton.Font.Size := 8;
  FButton.Font.Name := 'Wingdings';
//  FButton.Glyph   := FGlyph;
  FButton.Caption := 'ê';
  FButton.NumGlyphs := 1;
  FButton.SetBounds(0, 0, FBtnControl.Width, FBtnControl.Height);
  FButton.Visible := True;
  FButton.Parent := FBtnControl;
  
  FFindResult := TStringList.Create;
  FParametro  := TStringList.Create;
  vbPesquisou := false;
  inherited ReadOnly := False;
end;

destructor TLookupEdit.Destroy;
begin
  FButton.Free;
  FBtnControl.Free;
  FFindResult.Free;
  FParametro.Free;
  inherited Destroy;
end;


procedure TLookupEdit.KeyPress(var Key: Char);
begin
  if ( ord(Key) = VK_RETURN ) then
    Key:=#0;
  inherited;
end;

procedure TLookupEdit.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  Invalidate;
end;

procedure TLookupEdit.WMKillFocus(var Message: TWMKillFocus);
begin
  inherited;
  //
end;

procedure TLookupEdit.WMDestroy(var message: TWMSize);
begin
//
end;

function TLookupEdit.isNull : Boolean;
begin
  result := VarIsEmpty(LinkValue) or
            VarIsNull(LinkValue) or
            ( ( varType(LinkValue) = varString  ) and ( LinkValue = '' ) ) or
            ( ( varType(LinkValue) in [ varInteger,varSingle,varDouble] ) and ( LinkValue = 0 ) ) ;
end;

procedure TLookupEdit.Change;
begin
   FLinkValue := unAssigned;
   vbPesquisou := false;
   inherited;
end;


procedure TLookupEdit.setLinkValue(Value : Variant);
begin
  FLinkValue := Value;
end;

function TLookupEdit.GetAsString : string;
begin
  result := VarToStrDef(LinkValue, '');
end;

procedure TLookupEdit.setAsString( Const value : string );
begin
  LinkValue := value;
end;


procedure TLookupEdit.SetEditRect;
var
  Rect: TRect;
begin
  Rect.Bottom := ClientHeight + 1;
  Rect.Right  := FBtnControl.Left - 2;
  Rect.Top    := 0;
  Rect.Left   := 0;
  SendMessage(Handle, EM_SETRECTNP, 0, LongInt(@Rect));
end;

procedure TLookupEdit.setParametro( value : Tstrings );
begin
  if value.text <> FParametro.Text then
  begin
    try
      FParametro.BeginUpdate;
      FParametro.Assign(Value);
    finally
      FParametro.EndUpdate;
    end;
  end;
end;


function TLookupEdit.GetMinHeight: Integer;
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

procedure TLookupEdit.CMFontChanged(var Message: TMessage);
begin
  inherited;
  GetMinHeight;
  Invalidate;
end;


procedure TLookupEdit.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  FButton.Enabled := Enabled;
end;

procedure TLookupEdit.WMSize(var message: TWMSize);
var
  MinHeight: Integer;
begin
  inherited;
  MinHeight := GetMinHeight;
  if Height < MinHeight then
    Height := MinHeight
  else
    begin
      if NewStyleControls then
        FBtnControl.SetBounds(ClientWidth - FButton.Width, 0, FButton.Width, ClientHeight)
      else
        FBtnControl.SetBounds(ClientWidth - FButton.Width, 1, FButton.Width, ClientHeight - 1);
      FButton.Height := FBtnControl.Height;
      SetEditRect;
    end;
end;

{ TFindBtn }

procedure TFindBtn.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  inherited MouseDown(Button, Shift, X, Y);
//  TLookupEdit(Parent.Parent).DoClickButton;
end;

procedure TLookupEdit.DoClickButton;
begin
//  Pesquisa(true);
end;

end.
