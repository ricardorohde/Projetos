unit DBEditBtn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Variants,
  StdCtrls, Mask, DeclaraType, Buttons, dbTables, db, dbctrls, uEditButton;

type
  TDBEditBtn = class(TEditBtn)
  private

  protected
    FDataLink     : TFieldDataLink;
    FDisplayLink  : TFieldDataLink;
    FListSource   : TDataSource;
    
    procedure SetListSource(const Value: TDataSource);
    function GetFieldName: string;
    function GetDataSource: TDataSource;
    procedure SetFieldName(const Value: string);
    procedure SetDataSource(const Value: TDataSource);
    { Private declarations }

    procedure DataChange(Sender: TObject);
    procedure EditingChange(Sender: TObject);
    procedure DisplayChange(Sender : TObject);
      
    { Protected declarations }
    procedure SetFocused(Value: Boolean);
    procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;

    procedure aClick(Sender: TObject); override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);override;
    destructor Destroy;override;
  published
    { Published declarations }
    property ListSource : TDataSource read FListSource   write SetListSource;
    property DataSource : TDataSource read GetDataSource write SetDataSource;
    property FieldName  : string      read GetFieldName  write SetFieldName;
  end;

procedure Register;

implementation

uses uPesquisa;

procedure Register;
begin
  RegisterComponents('EMS', [TDBEditBtn]);
end;

{ TDBEditBtn }

procedure TDBEditBtn.CMEnter(var Message: TCMEnter);
begin
  SetFocused(True);
  inherited;  
end;

procedure TDBEditBtn.CMExit(var Message: TCMExit);
begin
  SetFocused(False);
  DoExit;
end;

constructor TDBEditBtn.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDataLink                 := TFieldDataLink.Create;
  FDataLink.OnDataChange    := DataChange;
  FDataLink.OnEditingChange := EditingChange;
  FDataLink.OnActiveChange  := EditingChange;
  FDataLink.Control         := Self;
  FDisplayLink              := TFieldDataLink.Create;
  FDisplayLink.OnDataChange := DisplayChange;
  FDisplayLink.Control      := Self;
end;

procedure TDBEditBtn.DataChange(Sender: TObject);
begin
  if(FDataLink.DataSource = nil) then Exit;

  if FDataLink.FieldName <> '' then
    SetFieldName(FDataLink.FieldName);

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
        end
      else
        Text := FDataLink.Field.Text;       
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

//    if (not FDataLink.Field.isNull) and
//       ((not Assigned(FDisplayLink.Field) ) or (FDisplayLink.Field.Text = '')) then
//    begin
////      qy.Connection := Self.Connection;
//      QueryChange;
//    end;

//  FlinkValue := FDataLink.Field.Text;

//  FButton.Enabled := (FDataLink.Datasource.State in [dsInsert,dsEdit]);
//  if (FDataLink.Datasource.State = dsEdit) {and (FSkipEdit)} then
//    FButton.Enabled := False;
end;

procedure TDBEditBtn.DisplayChange(Sender: TObject);
begin
  if (FDataLink.DataSource   <> nil) and
     (FDisplayLink.Field     <> nil) and
     (FDisplayLink.FieldName <> '') then
  begin
    Text := FDisplayLink.Field.Text;
  end;
end;

procedure TDBEditBtn.EditingChange(Sender: TObject);
begin
  if FDataLink.DataSet = nil then
  begin
    inherited ReadOnly := False;
    Exit;
  end;

  if FDataLink.DataSet.State = dsEdit then
    inherited ReadOnly := (FDataLink.DataSet.State = dsBrowse){or(FSkipEdit)}
  else
    inherited ReadOnly := (FDataLink.DataSet.State = dsBrowse);
end;


function TDBEditBtn.GetFieldName: string;
begin
  Result := FDataLink.FieldName;
end;

function TDBEditBtn.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;


procedure TDBEditBtn.aClick(Sender : TObject);
var
  lRetorno : Variant;
begin
  frmPesquisa := TfrmPesquisa.Create( Self );
  try
    if Assigned( TEditBtn( self ).OnBeforeButton ) then
      TEditBtn( self ).OnBeforeButton( Sender );

    frmPesquisa.grdPesquisa.DataSource := FListSource;

    frmPesquisa.Top  := TForm(Self.Owner).Top + Self.Top + (2 * Self.Height) + 3;
    frmPesquisa.Left := TForm(Self.Owner).Left + Self.Left;

    lRetorno := frmPesquisa.Pesquisar;

//    if VarToStrDef(lRetorno, '') <> '' then
//    begin
//      Self.Text := VarToStrDef(lRetorno, '');
//
//      if (DataSource <> nil) and (DataSource.DataSet.State in [dsInsert, dsEdit]) then
//        if (FieldName <> '') and (DataSource <> nil) then
//          FDataLink.DataSource.DataSet.FieldByName(FieldName).Value := lRetorno;
//    end;
    if VarToStrDef(lRetorno, '') <> '' then
    begin
      Self.Text := VarToStrDef(lRetorno, '');

      if Assigned(DataSource) and (DataSource.DataSet.State in [dsInsert, dsEdit]) then
        if (FieldName <> '') and (DataSource <> nil) then
        begin
          DataSource.DataSet.FieldByName(FieldName).Value := lRetorno;

          if DataSource.DataSet.FieldByName(FieldName) is TNumericField then
            Self.Text := Format(TNumericField(DataSource.DataSet.FieldByName(FieldName)).DisplayFormat, [Self.Text]);
        end;
    end;

    Self.Text := VarToStrDef( lRetorno, '');
  finally
    FreeAndNil( frmPesquisa );
  end;

  Self.SetFocus;

  inherited;
end;

procedure TDBEditBtn.SetFieldName(const Value: string);
begin
  FDataLink.FieldName := Value;

//  if Assigned(FDataLink.DataSource) and
//     Assigned(FDataLink.DataSource.DataSet.FindField(Value)) then
//  begin
//    FDataLink.Field.Assign( FDataLink.DataSource.DataSet.FieldByName(Value) );
//  end;
end;

procedure TDBEditBtn.SetDataSource(const Value: TDataSource);
begin
  FDataLink.DataSource := Value;
  FDisplayLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

procedure TDBEditBtn.SetFocused(Value: Boolean);
begin
  if FFocused <> Value then
  begin
    FFocused := Value;
    if (FAlignment <> taLeftJustify) and not IsMasked then
       Invalidate;
    FDataLink.Reset;
  end;
end;

procedure TDBEditBtn.SetListSource(const Value: TDataSource);
begin
  FListSource := Value;
end;

destructor TDBEditBtn.Destroy;
begin
  FreeAndNil(FDataLink);
  FreeAndNil(FDisplayLink);
  inherited Destroy;
end;

end.
