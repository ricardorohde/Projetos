unit CacheQuery;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ITValida, Variants, ADODB;

type

  TTransactionEvent = procedure(Sender : TObject; DataSetState : TDataSetState ) of Object;

  TRefreshEvent = procedure(Sender : TObject; DataSetState : TDataSetState ) of Object;

  TCacheParams = class
  private

  public
    FTables : TStrings;
    FFieldsTables : TStrings;
    FRelations : TStrings;
    FParams : TStrings;
    constructor Create;
    destructor Destroy; override;
    procedure MakeInsert(Tabela : string; SQL : TStrings; qyCache : TADOQuery; psData_Sistema : String);
    procedure MakeUpdate(Tabela : string; SQL : TStrings; qyCache : TADOQuery; psData_Sistema : String);
    procedure MakeDelete(Tabela : string; SQL : TStrings);
    procedure MakeSQL(Tabela : string; TipoSQL : byte; SQL : TStrings; qyCache : TADOQuery);
    procedure ParseParams(Index : Integer);
  end;

  TCacheQuery = class(TADOQuery)
  private
    { Private declarations }
    UpdCache : TUpdateSQL;
    FOnTransaction : TTransactionEvent;
    FOnDelTransaction : TNotifyEvent;
    FOnRefresh     : TRefreshEvent;
    FCachedUpdates : Boolean;
    function GetCachedUpdates: Boolean;
    procedure SetCachedUpdates(const Value: Boolean);
//    procedure AtribuirNewValue();
  protected
    procedure DoAfterPost; override;
    { Protected declarations }
  public
    { Public declarations }
    FCacheParam : TCacheParams;
    function GetCacheRelation: TStrings;
    function GetCacheFields: TStrings;
    function GetCacheTables: TStrings;
    function CheckKeyViolation: boolean;
    procedure SetCacheRelation(Value: TStrings);
    procedure SetCacheFields(Value: TStrings);
    procedure SetCacheTables(Value: TStrings);
    procedure SetParams(Tab : string; Qry : TADOQuery);
    procedure MakePost;
    procedure Post; override;
    procedure MakeDelete;
    procedure InternalDelete; override;
    procedure MakeCalcFields;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DoBeforeOpen; override;
    procedure DoAfterClose; override;
    function tableAlias( psNOTABELA : string) : string;
  published
    { Published declarations }
    property CacheRelation : TStrings read GetCacheRelation write SetCacheRelation;
    property CacheFields   : TStrings read GetCacheFields write SetCacheFields;
    property CacheTables   : TStrings read GetCacheTables write SetCacheTables;
    property OnTransaction : TTransactionEvent read FOnTransaction write FOnTransaction;
    property OnDelTransaction : TNotifyEvent read FOnDelTransaction write FOnDelTransaction;
    property OnRefresh     : TRefreshEvent read FOnRefresh write FOnRefresh;
    property CachedUpdates : Boolean read GetCachedUpdates write SetCachedUpdates;
  end;

procedure Register;

implementation
uses uTool;

{TCacheParams}
constructor TCacheParams.Create;
begin
  FTables := TStringList.Create;
  FFieldsTables := TStringList.Create;
  FRelations := TStringList.Create;
  FParams := TStringList.Create;
end;

destructor TCacheParams.Destroy;
begin
  FTables.Free;
  FFieldsTables.Free;
  FRelations.Free;
  FParams.Free;
end;

procedure TCacheParams.ParseParams(Index : Integer);
var
  sAux : string;
begin
  with FParams do
  begin
    Clear;
    sAux := FFieldsTables[Index];
    while Pos(';', sAux) > 0 do
    begin
      Add(Copy(sAux, 0, Pos(';', sAux) - 1));
      sAux := Copy(sAux, Pos(';', sAux) + 1, Length(sAux));
    end;
    Add(sAux);
  end;
end;

procedure TCacheParams.MakeSQL(Tabela : string; TipoSQL : byte; SQL : TStrings; qyCache : TADOQuery);
begin
  Tabela := Tabela + '>' + Tabela;
  case TipoSQL of
    0: MakeInsert(Tabela, SQL, qyCache, 'FSYSDATE');
    1: MakeUpdate(Tabela, SQL, qyCache, 'FSYSDATE');
    2: MakeDelete(Tabela, SQL);
  end;
end;

procedure TCacheParams.MakeInsert(Tabela : string; SQL : TStrings; qyCache : TADOQuery; psData_Sistema : String);
var
  I : Integer;
  StrField, StrValue, sAlias : string;
begin
  SQL.Clear;
  Tabela := Copy(Tabela, 0, Pos('>', Tabela) - 1);
  SQL.Add('INSERT INTO ' + Tabela);
  StrField := '  ('; StrValue := '  (';
  for I := 0 to FFieldsTables.Count -1 do
  begin
    ParseParams(I);
    if Tabela = FParams[0] then
    begin
      if qyCache <> nil then
      begin
        if (FParams[3][1] <> '4') AND (qyCache.FieldByName(FParams[1]) is TblobField )then
            continue;

        if (FParams[3][1] = '3') and
           (qyCache.FieldByName(FParams[1]).IsNull) then Continue;
      end;
      StrField := StrField + FParams[1] + ', ';
      case FParams[3][1] of
        '1' : StrValue := StrValue + psData_Sistema + ', ';
        '4' : begin
                SQL.Clear;
                Exit;
              end;
        else StrValue := StrValue + ':' + FParams[1] + ', ';
      end;

      if FParams[0] <> FParams[7]
      then sAlias := FParams[7]
      else sAlias := '';

    end;
  end;
  StrField := Copy(StrField, 0, Length(StrField) - 2) + ')';
  StrValue := Copy(StrValue, 0, Length(StrValue) - 2) + ')';
  SQL.Add(StrField);
  SQL.Add('VALUES');
  SQL.Add(StrValue);
end;

//procedure TCacheQuery.AtribuirNewValue();
//begin
//end;

procedure TCacheParams.MakeUpdate(Tabela : string; SQL : TStrings; qyCache : TADOQuery; psData_Sistema : String);
var
  I : Integer;
  StrField, StrValue, sAlias : string;
begin
  SQL.Clear;
  Tabela := Copy(Tabela, 0, Pos('>', Tabela) - 1);
  SQL.Add('UPDATE ' + Tabela + ' ');
  SQL.Add('SET');
  StrField := '  '; StrValue := '  ';
  for I := 0 to FFieldsTables.Count -1 do
  begin
    ParseParams(I);
    if Tabela = FParams[0] then
    begin
      if qyCache <> nil then
      begin
         if (FParams[3][1] <> '4') AND (qyCache.FieldByName(FParams[1]) is TblobField )then
            continue;
         if (FParams[3][1] = '3') and
            (qyCache.FieldByName(FParams[1]).NewValue =
             qyCache.FieldByName(FParams[1]).OldValue) then Continue;

      end;
      if FParams[3] = '1' then
      begin
         StrField := StrField + FParams[1] + ' = ' + psData_Sistema + ', ';
      end
      else
        if (FParams[3] <> '0') and (FParams[3] <> '2') and (FParams[3] <> '4') then
          if (qyCache <> nil) and (qyCache.FieldByName(FParams[1]).IsNull)
          then StrField := StrField + FParams[1] + ' = NULL, '
          else StrField := StrField + FParams[1] + ' = :' + FParams[1] + ', ';

      if (FParams[3] <> '3') and (FParams[3] <> '4')
      then StrValue := StrValue + FParams[1] + ' = :OLD_' + FParams[1] + ' AND ';

      if FParams[0] <> FParams[7]
      then sAlias := FParams[7]
      else sAlias := '';
    end;
  end;
  StrField := Copy(StrField, 0, Length(StrField) - 2);
  StrValue := Copy(StrValue, 0, Length(StrValue) - 5);
  if (Trim(StrValue) = '') or (Trim(StrField) = '') then
  begin
    SQL.Clear;
    Exit;
  end;
  SQL.Add(StrField);
  SQL.Add('WHERE');
  SQL.Add(StrValue);
end;

procedure TCacheParams.MakeDelete(Tabela : string; SQL : TStrings);
var I : Integer;
begin
  SQL.Clear;
  Tabela := Copy(Tabela, 0, Pos('>', Tabela) - 1);
  SQL.Add('DELETE FROM ' + Tabela);
  SQL.Add('WHERE');
  for I := 0 to FFieldsTables.Count -1 do
  begin
    ParseParams(I);
    if Tabela = FParams[0] then
      if (FParams[3] = '0') or (FParams[3] = '2') or (FParams[3] = '1') then
      begin
        if SQL.Count = 2
        then SQL.Add('    ' + FParams[1] + '= :OLD_' + FParams[1])
        else SQL.Add('AND ' + FParams[1] + '= :OLD_' + FParams[1]);
      end
      else
        if (FParams[3] = '4') then
        begin
          SQL.Clear;
          Exit;
        end;
  end;
end;

{TCacheQuery}
constructor TCacheQuery.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  valida_Sistema(self);
//  RequestLive := False;
//  CachedUpdates := True;
  AutoCalcFields := True;
  FCacheParam := TCacheParams.Create;
  UpdCache := TUpdateSQL.Create(Self);
  UpdCache.Name := 'UPD_' +  self.name;
//  UpdateObject := UpdCache;
end;

destructor TCacheQuery.Destroy;
begin
  FCacheParam.Free;
  UpdCache.Free;
  inherited Destroy;
end;

procedure TCacheQuery.DoBeforeOpen;
begin
   if Assigned(OnCalcFields) then MakeCalcFields;
end;

function TCacheQuery.GetCachedUpdates: Boolean;
begin
  Result := FCachedUpdates;
end;

function TCacheQuery.GetCacheFields: TStrings;
begin
  Result := FCacheParam.FFieldsTables;
end;

procedure TCacheQuery.SetCachedUpdates(const Value: Boolean);
begin
  FCachedUpdates := Value;
end;

procedure TCacheQuery.SetCacheFields(Value: TStrings);
begin
  if FCacheParam.FFieldsTables.Text <> Value.Text then
    try
      begin
        FCacheParam.FFieldsTables.BeginUpdate;
        FCacheParam.FFieldsTables.Assign(Value);
      end;
    finally
      FCacheParam.FFieldsTables.EndUpdate;
    end;
end;

function TCacheQuery.GetCacheRelation: TStrings;
begin
  Result := FCacheParam.FRelations;
end;

procedure TCacheQuery.SetCacheRelation(Value: TStrings);
begin
  if FCacheParam.FRelations.Text <> Value.Text then
    try
      begin
        FCacheParam.FRelations.BeginUpdate;
        FCacheParam.FRelations.Assign(Value);
      end;
    finally
      FCacheParam.FRelations.EndUpdate;
    end;
end;

function TCacheQuery.GetCacheTables: TStrings;
begin
  Result := FCacheParam.FTables;
end;

procedure TCacheQuery.SetCacheTables(Value: TStrings);
begin
  if FCacheParam.FTables.Text <> Value.Text then
    try
      begin
        FCacheParam.FTables.BeginUpdate;
        FCacheParam.FTables.Assign(Value);
      end;
    finally
      FCacheParam.FTables.EndUpdate;
    end;
end;

procedure TCacheQuery.Post;
var vbTransacao_Interna : boolean;
    vState : TDatasetState;
begin
  vbTransacao_Interna := false;
  if ( not self.Connection.InTransaction) and
     ( Assigned(FOnTransaction)        ) and
     ( FDriverName() <> csDriver_Name_ACCESS ) then
  begin
     //self.Database.StartTransaction;
     self.Connection.BeginTrans;
     vbTransacao_Interna := true;
  end;
  try
    vState := state;

    if not CachedUpdates then
       inherited Post
    else
       MakePost;
    if Assigned(FOnTransaction) then OnTransaction(Self,vState);
  except
     on e:exception do
     begin
        if vbTransacao_Interna then
           //self.Database.Rollback;
          Self.Connection.RollbackTrans;
        raise;
     end;
  end;
  if vbTransacao_Interna then
    //self.Database.Commit;
    Self.Connection.CommitTrans;

  if Assigned(FonRefresh ) then
    FonRefresh(Self,state)
  else
  begin
    close;
    open;
  end;
end;

procedure TCacheQuery.DoAfterPost;
begin
   inherited;
end;

procedure TCacheQuery.MakePost;
var
  I : Integer;
  qy : TADOQuery;
  vsData_Sistema : String;
begin
  doBeforePost;
  qy := TADOQuery.Create(Self);
  vsData_Sistema := FData_Sistema(FDriverName());
  qy.Connection := Self.Connection;
  with FCacheParam do
  begin
    for I := 0 to FTables.Count - 1 do
    begin
      case Self.State of
        dsEdit   : MakeUpdate(FTables[I], qy.SQL, Self, vsData_Sistema);
        dsInsert : MakeInsert(FTables[I], qy.SQL, Self, vsData_Sistema);
      end;
      if qy.SQL.Count > 0 then
      begin
        SetParams(FTables[I], qy);
        if (Self.State = dsInsert) and CheckKeyViolation then
          raise Exception.Create('Registro duplicado...')
        else
          qy.ExecSQL;
        if (Self.State = dsEdit) and (qy.RowsAffected = 0) then
        begin
          self.close;
          self.open;
          raise Exception.Create('Dados desatualizados...');
        end;
      end;
    end;
    qy.Free;
  end;
  doAfterPost;
end;

procedure TCacheQuery.SetParams(Tab : string; Qry : TADOQuery);
var
  I, J, IndDetail, IndMaster : Integer;
  sAux, sFieldName : string;
  Achou : Boolean;
begin
  IndMaster := 0;
  Tab := Copy(Tab, 0, Pos('>', Tab) - 1);
  for I := 0 to Qry.Parameters.Count -1 do
  begin
    with Self do
    begin
      if System.Pos('OLD_', string(Qry.Parameters[I].Name)) > 0 then
      begin
        sFieldName := Qry.Parameters[I].Name;
        sFieldName := Copy(sFieldName, Pos('OLD_', sFieldName) + 4, Length(sFieldName));

        Qry.Parameters[I].Value := FieldByName(sFieldName).OldValue;
      end
      else
      if (State = dsInsert) and
         (FCacheParam.FRelations.Count > 0)then
        begin
          with FCacheParam do
          begin
            Achou := False;
            for J := 0 to FRelations.Count -1 do
            begin
              sAux := FRelations[J];
              IndDetail := StrToInt(Copy(sAux, 0, Pos('-', sAux) -1));
              IndMaster := StrToInt(Copy(sAux, Pos('-', sAux) +1, Length(SAux)));
              ParseParams(IndDetail);
              if (Tab + '.' + Qry.Parameters[I].Name) = (FParams[0] + '.' + FParams[1])then
              begin
                Achou := True;
                break;
              end;
            end;
            if not Achou then
              begin
                if (State <> dsInsert) then
                  Qry.Parameters[I].Value := FieldByName(Qry.Parameters[I].Name).NewValue
                else
                  Qry.Parameters[I].Value := FieldByName(Qry.Parameters[I].Name).Value;
              end
            else
            begin
              ParseParams(IndMaster);
              if FParams[3] <> '4' then
              begin
                if (State <> dsInsert) then
                  Qry.Parameters[I].Value := FieldByName(FParams[1]).NewValue
                else
                  Qry.Parameters[I].Value := FieldByName(FParams[1]).Value
              end;
            end;
          end
        end
      else
        begin
          if (State <> dsInsert) then
            Qry.Parameters[I].Value := FieldByName(Qry.Parameters[I].Name).NewValue
          else
            Qry.Parameters[I].Value := FieldByName(Qry.Parameters[I].Name).Value
        end;
    end;
  end;
end;

procedure TCacheQuery.MakeCalcFields;
var
  Findex, I : Integer;
begin
  if Self.State <> dsInactive then Exit;
  with FCacheParam do
  begin
    GetFieldNames2(Self,FParams);
    for I := 0 to FFieldsTables.Count - 1 do
    begin
      ParseParams(I);
      Findex := Self.FieldDefs.IndexOf(FParams[2]);

      F_Cria_TField ( Self.FieldDefs.Items[Findex].Datatype,self,self,FParams[2],self.Name + FParams[2],Self.FieldDefs.Items[Findex].Size);
      if FParams[5] = 'T' then // Calculado
        F_Cria_TField ( ftString,self,self,FParams[6],self.Name + FParams[6],255,true);
    end;
  end;
end;

procedure TCacheQuery.InternalDelete;
begin
  if not CachedUpdates then inherited else MakeDelete;
end;

procedure TCacheQuery.MakeDelete;
var
  I : Integer;
  qy : TADOQuery;
  vbTransacao_Interna : boolean;
begin
  if Assigned(BeforeDelete) then BeforeDelete(Self);
  qy := TADOQuery.Create(Self);
  try
    qy.Connection := Self.Connection;
    with FCacheParam do
    begin
      for I := FTables.Count - 1 downto 0 do
      begin
        MakeDelete(FTables[I], qy.SQL);
        SetParams(FTables[I], qy);
        if qy.SQL.Count > 0 then
        begin
          vbTransacao_Interna := false;
          if ( not self.Connection.InTransaction ) and
             ( Assigned(FOnDelTransaction)        ) and
             ( FDriverName() <> csDriver_Name_ACCESS ) then
          begin
            self.Connection.BeginTrans;
            vbTransacao_Interna := true;
          end;
          try
            if Assigned(FOnDelTransaction) then OnDelTransaction(Self);
            qy.ExecSQL;
            if qy.RowsAffected = 0 then
            begin
               self.close;
               self.open;
               raise Exception.Create('Dados desatualizados...');
            end;
          except
            on e:exception do
            begin
              if vbTransacao_Interna then
                self.Connection.RollbackTrans;
              raise;
            end;
          end;
          if vbTransacao_Interna then
            self.Connection.CommitTrans;
        end;
      end;
    end;
  finally
    FreeAndNil(qy);
  end;

  Close;
  Open;
end;

function TCacheQuery.CheckKeyViolation: boolean;
var
  I : Integer;
  sTable : string;
  qy : TADOQuery;
begin
  qy := TADOQuery.Create(Self);
  try
    qy.Connection := Self.Connection;
    qy.SQL.Clear;
    with FCacheParam do
    begin
      sTable := FTables.Strings[0];
      sTable := Copy(sTable, 0, Pos('>',sTable) - 1);
      qy.SQL.Add('SELECT COUNT(*) AS QTREGISTROS FROM ' + sTable );
      for I := 0 to FFieldsTables.Count -1 do
      begin
        ParseParams(I);
        if (FParams[3] = '0') or (FParams[3] = '2') then
        begin
          InsertFilter(qy,FParams[2] + ' = :' + FParams[2],FParams[2],Self.FieldByName(FParams[2]).Value)
        end;
      end;
      qy.Open;
      result := (qy.fieldbyname('QTREGISTROS').asInteger > 0 );
      qy.Close;
    end;
  finally
    FreeAndNil(qy);
  end;
end;

procedure TCacheQuery.DoAfterClose;
var i : integer;
begin
  for I := ( FieldCount -1 ) downto 0 do
     Fields[I].Free;
end;

function TCacheQuery.TableAlias( psNOTABELA : string) : string;
var vbEncontrou : boolean;
    i : integer;
    vsTabela : string;
begin
  i := 0;
  vbEncontrou := false;
  while ( i < CacheTables.Count) and ( not vbEncontrou ) do
  begin
     vsTabela := copy(CacheTables[i],1,pos('>',CacheTables[i])-1);
     if UpperCase(vsTabela) = Uppercase(psNOTABELA) then
     begin
        vbEncontrou := true;
        result :=copy(CacheTables[i],pos('>',CacheTables[i])+1,length(CacheTables[i]));
     end
     else
        inc(i);
  end;
end;

procedure Register;
begin
  RegisterComponents('W3Style', [TCacheQuery]);
end;

end.
