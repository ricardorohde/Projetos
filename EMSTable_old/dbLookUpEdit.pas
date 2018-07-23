unit dbLookUpEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Variants,
  StdCtrls, Mask, DeclaraType, Buttons, dbTables, db, dbctrls, LookupEdit, uPesquisa;
type

  TDBLookupEdit = class(TLookupEdit)
  private
    { Private declarations }
    FListFields  : TStrings;
    FListSource  : TDataSource;
    FDataLink    : TFieldDataLink;
    FDisplayLink : TFieldDataLink;
    FSkipEdit    : Boolean;
    FReadOnly    : Boolean;
//    FGlyph       : TBitmap;

  protected
    { Protected declarations }
//    FBtnControl: TWinControl;

    procedure AlimentarArrayListFields;
    procedure Pesquisa();
    function GetListSource: TDataSource;
    procedure SetListSource(const Value: TDataSource);
    function GetListFields: TStrings;
    procedure SetListFields(const Value: TStrings);
//    function GetGlyph: TBitmap;
//    procedure SetGlyph(const Value: TBitmap);
    function GetDataSource: TDataSource;
    procedure SetDataSource(Value: TDataSource);
    procedure DataChange(Sender: TObject);
    procedure EditingChange(Sender: TObject);
    procedure DisplayChange(Sender : TObject);
    procedure SetFocused(Value: Boolean);

    function GetDataDisplay: string;
    procedure SetDataDisplay(const value : string);
    procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure Notification(AComponent: TComponent;Operation: TOperation); override;
    function GetDataField: string;
    procedure SetDataField(const Value: string);
    function GetReadOnly: Boolean;virtual;
    procedure SetReadOnly(Value: Boolean);virtual;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
//    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
//    procedure WMSize(var Message: TWMSize); message WM_SIZE;
  public
    { Public declarations }
    Function oldValueText : String;
    constructor Create(AOwner: TComponent);override;
    destructor Destroy;override;
    procedure Clear; override;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
//    procedure DoClickButton;
  published
    { Published declarations }
    property SkipEdit: Boolean read FSkipEdit write FSkipEdit;
    property DataDisplay: string read GetDataDisplay write SetDataDisplay;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property ListSource : TDataSource read GetListSource write SetListSource;
    property ListFields: TStrings read GetListFields write SetListFields;
//    property Glyph : TBitmap read GetGlyph write SetGlyph;
  end;

//  TFindBtn = class(TSpeedButton)
//  protected
//    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
//  end;

implementation
{ TDBLookupEdit }
constructor TDBLookupEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
//  FGlyph  := TBitmap.Create;
//  Self.Glyph     := FGlyph;

//  Self.OnClick := Pesquisa;
  FListFields := TStringList.Create;
  FDataLink                 := TFieldDataLink.Create;
  FDataLink.OnDataChange    := DataChange;
  FDataLink.OnEditingChange := EditingChange;
  FDataLink.OnActiveChange  := EditingChange;
  FDataLink.Control         := Self;
  FDisplayLink              := TFieldDataLink.Create;
  FDisplayLink.OnDataChange := DisplayChange;
  FDisplayLink.Control      := Self;
end;

destructor TDBLookupEdit.Destroy;
begin
//  FGlyph.Free;
  FListFields.Free;
  FDataLink.Free;
  FBtnControl.Free;  
  FDataLink    := nil;
  FDisplayLink.Free;
  FDisplayLink := nil;
  inherited Destroy;
end;

procedure TDBLookupEdit.CMEnter(var message: TCMEnter);
begin
  SetFocused(True);
  vbPesquisou := false;
  inherited;
end;

procedure TDBLookupEdit.CMExit(var message: TCMExit);
begin
   if ( self.IsNull ) and
      ( text <> ''  ) then
     begin
       if not vbPesquisou then
         Pesquisa;
     end
   else
   if text = '' then
     begin
       clear;
       inherited;
     end;

  SetFocused(False);
  DoExit;
end;


procedure TDBLookupEdit.AlimentarArrayListFields();
var
  i           : Integer;
  lStrAux     : string;
begin
  for i := 0 to ListFields.Count -1 do
  begin
    lStrAux := ListFields.Strings[i];

    SetLength(FArrayListFields, Length(FArrayListFields) + 1);

    FArrayListFields[ High(FArrayListFields) ].Caption  := Copy(lStrAux, 1, Pos(';',lStrAux)-1);
    Delete(lStrAux, 1, Pos(';',lStrAux));

    FArrayListFields[ High(FArrayListFields) ].FieldName := Copy(lStrAux, 1, Pos(';',lStrAux)-1);
    Delete(lStrAux, 1, Pos(';',lStrAux));

    FArrayListFields[ High(FArrayListFields) ].Width := StrToIntDef( Copy(lStrAux, 1, Pos(';',lStrAux)-1), 20 );
    Delete(lStrAux, 1, Pos(';',lStrAux));

    FArrayListFields[ High(FArrayListFields) ].Retorno := UpperCase( Copy(lStrAux, 1, Pos(';',lStrAux)-1) ) = 'RETORNO';
    Delete(lStrAux, 1, Pos(';',lStrAux));

    FArrayListFields[ High(FArrayListFields) ].Tipo := UpperCase( Copy(lStrAux, 1, Pos(';',lStrAux)-1) );
    Delete(lStrAux, 1, Pos(';',lStrAux));
  end;
end;

procedure TDBLookupEdit.Pesquisa();
var
  lRetorno : Variant;
begin
  AlimentarArrayListFields();

  frmPesquisa := TfrmPesquisa.Create( Self );
  try

    frmPesquisa.Top  := TForm(Self.Owner).Top + Self.Top + (2 * Self.Height) + 3;
    frmPesquisa.Left := TForm(Self.Owner).Left + Self.Left;
    frmPesquisa.grdPesquisa.DataSource := FListSource;

    lRetorno := frmPesquisa.Pesquisar;

    if VarToStrDef(lRetorno, '') <> '' then
    begin
      Self.Text := VarToStrDef(lRetorno, '');

      if DataSource.DataSet.State in [dsInsert, dsEdit] then
        if (FDisplayLink.FieldName <> '') and (FDisplayLink.DataSource <> nil) then
          DataSource.DataSet.FieldByName(FDisplayLink.FieldName).Value := lRetorno;
    end;

    LinkValue := lRetorno;
  finally
    FreeAndNil( frmPesquisa );
  end;
end;

function TDBLookupEdit.GetListSource: TDataSource;
begin
  Result := FListSource;
end;

procedure TDBLookupEdit.SetListSource(const Value: TDataSource);
begin
  FListSource := Value;
end;

procedure TDBLookupEdit.SetFocused(Value: Boolean);
begin
  if FFocused <> Value then
  begin
    FFocused := Value;
    if (FAlignment <> taLeftJustify) and not IsMasked then
       Invalidate;
    FDataLink.Reset;
  end;
end;

procedure TDBLookupEdit.Clear;
begin
  Text := '';
  linkValue := unAssigned;
  if (FDataLink.Field <> nil) and
     (FDataLink.DataSet.State in [dsInsert, dsEdit]) then
  begin
    FDataLink.Field.Clear;
  end;
end;

function TDBLookupEdit.GetReadOnly: Boolean;
begin
//  Result := FDataLink.ReadOnly;
  Result := FReadOnly;
end;

procedure TDBLookupEdit.SetReadOnly(Value: Boolean);
begin
//  FDataLink.ReadOnly := Value;
  FReadOnly := Value;
end;

procedure TDBLookupEdit.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);

  if (Operation = opRemove) and ((FDataLink <> nil)or(FDisplayLink <> nil)) then
    if (AComponent = DataSource) then
      DataSource := nil;
end;

procedure TDBLookupEdit.DataChange(Sender: TObject);
begin

  if(FDataLink.DataSource = nil) then Exit;

  if FDataLink.Field <> nil then
    begin
      EditMask := FDataLink.Field.EditMask;
      if FDataLink.Field.Value = Null then
      begin
        if FFocused and FDataLink.CanModify then
          Text := FDataLink.Field.Text
        else
          begin
            EditText := FDataLink.Field.DisplayText;
            if (FDataLink.Editing) then Modified := True;
          end;
      end;
    end
  else
    begin
      FAlignment := taLeftJustify;
      EditMask := '';
      if csDesigning in ComponentState then
        EditText := Name
      else
        EditText := '';
    end;

  if(FDataLink.DataSource.State = dsInactive) or
     (FDataLink.Field = nil ) then
     Exit;

  FlinkValue := FDataLink.Field.Text;

  FButton.Enabled := (FDataLink.Datasource.State in [dsInsert,dsEdit]);
//
  if (FDataLink.Datasource.State = dsEdit) and (FSkipEdit) then
    FButton.Enabled := False;
end;

procedure TDBLookupEdit.EditingChange(Sender: TObject);
begin
  if FDataLink.DataSet = nil then
  begin
    inherited ReadOnly := False;
    Exit;
  end;
  if FDataLink.DataSet.State = dsEdit then
    inherited ReadOnly := (FDataLink.DataSet.State = dsBrowse)or(FSkipEdit)
  else
    inherited ReadOnly := (FDataLink.DataSet.State = dsBrowse);
end;

procedure TDBLookupEdit.DisplayChange(Sender : TObject);
begin
  if (FDataLink.DataSource <> nil) and
     (FDisplayLink.Field   <> nil) and
     (GetDataDisplay       <> '') then
  begin
    Text := FDisplayLink.Field.Text;
  end;
end;

Function TDBLookupEdit.oldValueText : String;
begin
//  if CarregaResult(true) then
//    result := FFindResult.values[LookUpParam.GetFieldQuery('%')]
//  else
    result := '';
end;


procedure TDBLookupEdit.SetDataDisplay(const Value: string);
begin
  FDisplayLink.FieldName := Value;
end;

function TDBLookupEdit.GetDataDisplay: string;
begin
  Result := FDisplayLink.FieldName;
end;

function TDBLookupEdit.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TDBLookupEdit.SetDataSource(Value: TDataSource);
begin
  FDataLink.DataSource := Value;
  FDisplayLink.DataSource := Value;
  if Value <> nil then
    Value.FreeNotification(Self);
end;

procedure TDBLookupEdit.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

function TDBLookupEdit.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;
procedure TDBLookupEdit.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if ((Key = vk_Insert) and (ssShift in Shift)) then Key := 0;

  if (Key = vk_return) then
    begin
       Pesquisa;
    end
  else
    inherited KeyDown(Key, Shift);
  Invalidate;
end;

//procedure TDBLookupEdit.DoClickButton;
//begin
//  Pesquisa();
//end;

//procedure TDBLookupEdit.CMEnabledChanged(var Message: TMessage);
//begin
//  FButton.Enabled := Enabled;
//end;

//procedure TDBLookupEdit.WMSize(var Message: TWMSize);
//var
//  MinHeight: Integer;
//begin
//  inherited;
//  MinHeight := GetMinHeight;
//  if Height < MinHeight then
//    Height := MinHeight
//  else
//    begin
//      if NewStyleControls then
//        FBtnControl.SetBounds(ClientWidth - FButton.Width, 0, FButton.Width, ClientHeight)
//      else
//        FBtnControl.SetBounds(ClientWidth - FButton.Width, 1, FButton.Width, ClientHeight - 1);
//      FButton.Height := FBtnControl.Height;
//      SetEditRect;
//    end;
//end;

function TDBLookupEdit.GetListFields: TStrings;
begin
  Result := FListFields;
end;

procedure TDBLookupEdit.SetListFields(const Value: TStrings);
begin
  FListFields := Value;
end;


//function TDBLookupEdit.GetGlyph: TBitmap;
//begin
////  Result := TButtonGlyph(FGlyph).Glyph;
//  Result := FGlyph;
//end;

//procedure TDBLookupEdit.SetGlyph(const Value: TBitmap);
//begin
////  TButtonGlyph(FGlyph).Glyph := Value;
//  FGlyph := Value;
//  Invalidate;
//end;

{ TFindBtn }

//procedure TFindBtn.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
//  Y: Integer);
//begin
//  inherited MouseDown(Button, Shift, X, Y);
//  TDBLookupEdit(Parent.Parent).DoClickButton;
//end;

end.
