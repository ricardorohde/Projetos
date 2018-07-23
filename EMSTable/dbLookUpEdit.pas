unit dbLookUpEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Variants,
  StdCtrls, Mask, DeclaraType, Buttons, dbTables, db, dbctrls, LookupEdit;

type

  TDBLookupEdit = class(TLookupEdit)
  private
    { Private declarations }

  protected
    { Protected declarations }
    FDataLink: TFieldDataLink;
    FDisplayLink : TFieldDataLink;
    FSkipEdit : Boolean;
    function GetDataSource: TDataSource;
    procedure SetDataSource(Value: TDataSource);
    procedure DataChange(Sender: TObject);
    procedure EditingChange(Sender: TObject);
    procedure DisplayChange(Sender : TObject);
    procedure SetFocused(Value: Boolean);
    procedure QueryChange;
    function CarregaResult(pbOldValue : boolean = false) : boolean;

    function GetDataDisplay: string;
    procedure SetDataDisplay(const value : string);
    procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure Atualiza_Exibicao( Sender : TOBject ) ; override;
    procedure Notification(AComponent: TComponent;Operation: TOperation); override;
    function GetDataField: string;
    procedure SetDataField(const Value: string);
    function GetReadOnly: Boolean;virtual;
    procedure SetReadOnly(Value: Boolean);virtual;
  public
    { Public declarations }
    Function oldValueText : String;
    constructor Create(AOwner: TComponent);override;
    destructor Destroy;override;
    procedure Clear; override;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
  published
    { Published declarations }
    property SkipEdit: Boolean read FSkipEdit write FSkipEdit;
    property DataDisplay: string read GetDataDisplay write SetDataDisplay;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
  end;

implementation
{ TDBLookupEdit }
constructor TDBLookupEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDataLink := TFieldDataLink.Create;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnEditingChange := EditingChange;
  FDataLink.OnActiveChange := EditingChange;
  FDataLink.Control := Self;
  FDisplayLink := TFieldDataLink.Create;
  FDisplayLink.OnDataChange := DisplayChange;
  FDisplayLink.Control := Self;
end;

destructor TDBLookupEdit.Destroy;
begin
  FDataLink.Free;
  FDataLink := nil;
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
   end;
//   else
//   if text = '' then
//   begin
//      clear;
//      inherited;
//   end;

  SetFocused(False);
  DoExit;
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
  Result := FDataLink.ReadOnly;
end;

procedure TDBLookupEdit.SetReadOnly(Value: Boolean);
begin
  FDataLink.ReadOnly := Value;
end;

procedure TDBLookupEdit.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);

  if (Operation = opRemove) and ((FDataLink <> nil)or(FDisplayLink <> nil)) then
    if (AComponent = DataSource) then DataSource := nil;
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
        end
      else
        Text := FDataLink.Field.Text;
    end
  else
    begin
      FAlignment := taLeftJustify;
      EditMask := '';
      if csDesigning in ComponentState then
        EditText := Name else
        EditText := '';
    end;

  if(FDataLink.DataSource.State = dsInactive) or
     (FDataLink.Field = nil ) then
     Exit;

    if (not FDataLink.Field.isNull) and
       ((not Assigned(FDisplayLink.Field) ) or (FDisplayLink.Field.Text = '')) then
    begin
//      qy.Connection := Self.Connection;
      QueryChange;
    end;

  FlinkValue := FDataLink.Field.Text;

  FButton.Enabled := (FDataLink.Datasource.State in [dsInsert,dsEdit]);
  if (FDataLink.Datasource.State = dsEdit) and (FSkipEdit) then FButton.Enabled := False;

end;

procedure TDBLookupEdit.EditingChange(Sender: TObject);
begin
  if FDataLink.DataSet = nil then
  begin
    inherited ReadOnly := False;
    Exit;
  end;
  if FDataLink.DataSet.State = dsEdit
  then inherited ReadOnly := (FDataLink.DataSet.State = dsBrowse)or(FSkipEdit)
  else inherited ReadOnly := (FDataLink.DataSet.State = dsBrowse);
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

procedure TDBLookupEdit.QueryChange;
begin
//  if CarregaResult then
//  begin
//    Atualiza_Exibicao(self);
//  end
//  else
//  begin
//    Text := '';
//  end;
end;

Function TDBLookupEdit.oldValueText : String;
begin
  if CarregaResult(true) then
    result := FFindResult.values[LookUpParam.GetFieldQuery('%')]
  else
    result := '';
end;

function TDBLookupEdit.CarregaResult(pbOldValue : boolean = false) : boolean;
//var
//  sFilter, sField, sFieldLook : String;
//  I : Integer;
//  FindField : Boolean;
//  vValue : Variant;
begin
  Result := False;
//  LookUpParam.valida_Parametros(name);
//  // Limpa Parametros
//  LookUpParam.vaFiltro := nil;
//  LookUpParam.vaDefault := nil;
//  LookUpParam.vaTitulo := nil;
//  LookUpParam.vaParametro := nil;
//
//  FindField := true;
//  qy.Close;
//  //qy.SessionName  :=SessionName;
//  qy.Connection := TLookupEdit(Self).Connection;
//  qy.SQL.Clear;
//  qy.SQL.Assign(LookUpSQL);
//  GetFieldNames2(qy,LookUpParam.FParams);
//
//  if Assigned(FOnCalcFields) then
//  begin
//     qy.OnCalcFields := OnCalcFields;
//     MakeCalc;
//  end;
//
//  with LookUpParam do
//  begin
//    if FRelations.Count > 0 then
//    begin
//       for I := 0 to FRelations.Count -1 do
//       begin
//         sFilter := FRelations[I];
//         sFieldLook := Copy(sFilter, 0, Pos('>', sFilter) -1);
//         sFilter := Copy(sFilter, Pos('>', sFilter) +1, Length(sFilter));
//         SField := Trim(Copy(sFilter, Pos(':', sFilter) + 1, Length(sFilter)));
//
//         if pbOldvalue then
//           vValue := FDataLink.DataSet.FieldByName(sField).oldValue
//         else
//           vValue := FDataLink.DataSet.FieldByName(sField).Value;
//
//         if not VarIsNull(sField) then
//         begin
//           addFiltro(sFilter,sField,vValue);
//         end
//         else
//            FindField := false;
//       end;
//    end
//    else
//       FindField := false;
//  end;
//  if FindField then
//  begin
//    for i := low(LookUpParam.vaFiltro) to high(LookUpParam.vaFiltro) do
//        insertFilter(qy,LookUpParam.vaFiltro[i]);
//    qy.Open;
//    if qy.eof then
//    begin
//       FindField := false;
//       //showmessage(self.name +': Erro buscando registro selecionado. Verifique a parametriza?');
//    end
//    else
//    begin
//      Carrega_QueryResult( qy, FFindResult );
//    end;
//    qy.close;
//  end;
//  result := findField;
end;

procedure TDBLookupEdit.SetDataDisplay(const Value: string);
begin
  FDisplayLink.FieldName := Value;
end;

function TDBLookupEdit.GetDataDisplay: string;
begin
  Result := FDisplayLink.FieldName;
end;

procedure TDBLookupEdit.Atualiza_Exibicao( Sender : TOBject ) ;
begin
  LookUpParam.valida_Parametros(name);
  if ( FDataLink.DataSource <> nil ) and
     ( FDataLink.DataSource.state in [ dsInsert, dsEdit] ) and
     (FDataLink.DataSet.FieldByName(FDataLink.FieldName).Value <> FFindResult.values[LookUpParam.GetFieldQuery('=')] ) then
  begin
    FDataLink.DataSet.FieldByName(FDataLink.FieldName).Value := FFindResult.values[LookUpParam.GetFieldQuery('=')];
  end;
 inherited;
end;

function TDBLookupEdit.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TDBLookupEdit.SetDataSource(Value: TDataSource);
begin
  FDataLink.DataSource := Value;
  FDisplayLink.DataSource := Value;
  LookUpParam.FDataSource := Value;
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

end.
