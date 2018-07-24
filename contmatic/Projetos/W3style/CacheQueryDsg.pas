unit CacheQueryDsg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Spin, Mask,
  DBCtrls, DBTables, Db, CriaSQL,DesignIntf,DesignEditors,CacheQuery,
  ADODB;

type
  TCacheQueryEditor = Class(TDefaultEditor)
    procedure ExecuteVerb(Index: Integer);      Override;
    function  GetVerb(Index: Integer): String;  Override;
    function  GetVerbCount: Integer;            Override;
    procedure MakeAssist;
  end;

  TfrmCacheryEditor = class(TForm)
    pgMain: TPageControl;
    tsPast1: TTabSheet;
    me: TMemo;
    paPro: TPanel;
    btnPrior: TBitBtn;
    btnNext: TBitBtn;
    tsPast2: TTabSheet;
    paProTop: TPanel;
    lbFields: TListBox;
    lbResult: TListBox;
    btnOk: TBitBtn;
    lbFormat: TLabel;
    lbCampos: TLabel;
    sbInsResult: TSpeedButton;
    sbDelResult: TSpeedButton;
    dsPro: TDataSource;
    lbTables: TListBox;
    laTabelas: TLabel;
    tsPast3: TTabSheet;
    lbKeyMaster: TListBox;
    spInsRelation: TSpeedButton;
    spDelRelation: TSpeedButton;
    lbKeyDetail: TListBox;
    laRel: TLabel;
    lbRelations: TListBox;
    cbMaster: TComboBox;
    cbDetail: TComboBox;
    laMestre: TLabel;
    laDetalhe: TLabel;
    laKeyMestre: TLabel;
    laKeyDetalhe: TLabel;
    tsPast4: TTabSheet;
    lbTabResult: TListBox;
    laTabela: TLabel;
    meResultSQL: TMemo;
    rdgTipoSQL: TRadioGroup;
    sbUp: TSpeedButton;
    spDown: TSpeedButton;
    sbUp1: TSpeedButton;
    sbDown1: TSpeedButton;
    edSeq: TEdit;
    laSeq: TLabel;
    rdgTipo: TRadioGroup;
    ckCalc: TCheckBox;
    edCalc: TEdit;
    laCalc: TLabel;
    btCancelar: TBitBtn;
    btCriaSQL: TButton;
    qyPro: TADOQuery;
    procedure btnNextClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure meChange(Sender: TObject);
    procedure sbUpClick(Sender: TObject);
    procedure sbDownClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure lbResultKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure lbFieldsClick(Sender: TObject);
    procedure sbInsResultClick(Sender: TObject);
    procedure sbDelResultClick(Sender: TObject);
    procedure cbMasterChange(Sender: TObject);
    procedure cbDetailChange(Sender: TObject);
    procedure lbKeyMasterClick(Sender: TObject);
    procedure spInsRelationClick(Sender: TObject);
    procedure spDelRelationClick(Sender: TObject);
    procedure lbTabResultClick(Sender: TObject);
    procedure ckChaveClick(Sender: TObject);
    procedure rdgTipoClick(Sender: TObject);
    procedure ckCalcClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btCriaSQLClick(Sender: TObject);
  private
    { Private declarations }
    FConnection : TADOConnection;
//    FDataBaseName : String;
//    FSessionName : String;
    procedure ParseSQL;
  public
    { Public declarations }
    FCacheAux : TCacheParams;
    function ExistField(Value : string): boolean;
    procedure SetKeys(Value : string; lb : TListBox; Detail : Boolean);
    procedure SetValue(CacheParam : TCacheParams; pConnection : TADOConnection);
    procedure GetValue(var CacheParam : TCacheParams);
    procedure ClearFields(Tipo : byte);
    procedure UndeleteProperty(Value : String);
    procedure EnableButton;
    procedure EnableRel;
    procedure FinalizarAssist;
  end;

var
  frmCacheryEditor: TfrmCacheryEditor;

procedure Register;
{
FParams[0]=  Nome da Tabela;
FParams[1]=  Alias do Campo;
FParams[2]=  Nome do Campo;
FParams[3]=  Tipo do Campo;
FParams[4]=  Nome do Sequence;
FParams[5]=  Indicadores de Campo Calculado;
FParams[6]=  Nome do Campo Calculado;
FParams[7]=  Alias da Tabela;
}

implementation
{$R *.DFM}

{TCacheQueryEditor}
procedure TCacheQueryEditor.ExecuteVerb(Index: Integer);
begin
  if Index = 0 then MakeAssist;
end;

function TCacheQueryEditor.GetVerb(Index: Integer): String;
begin
  if Index = 0 then Result := 'Assistente de CacheQuery';
end;

function TCacheQueryEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;

procedure TCacheQueryEditor.MakeAssist;
var viModalResult : integer;
begin
  with TfrmCacheryEditor.Create(Application) do
  begin
    me.Lines.Assign(TCacheQuery(Component).SQL);
    SetValue(TCacheQuery(Component).FCacheParam, TCacheQuery(Component).Connection);
    viModalResult := ShowModal;
    if viModalResult = mrOk then
    begin
       GetValue(TCacheQuery(Component).FCacheParam);
       TCacheQuery(Component).SQL.Assign(me.Lines);
       FindRootDesigner(Component).Modified;
    end;
    Destroy;
  end;
end;

{TCacheEditor}

procedure TfrmCacheryEditor.SetKeys(Value : string; lb : TListBox; Detail : Boolean);
var
  I : Integer;
  Valido : Boolean;
begin
  with FCacheAux do
  begin
    lb.Items.Clear;
    FFieldsTables.Assign(lbResult.Items);
    for I := 0 to FFieldsTables.Count -1 do
    begin
      ParseParams(I);
      if Value = FParams[0] then
      begin
        if Detail
        then Valido := (FParams[3] = '0')
        else Valido := ((FParams[3] = '0')or(FParams[3] = '2'));
        if Valido then lb.Items.Add(FParams[2]);
      end;
    end;
  end;
end;

procedure TfrmCacheryEditor.SetValue(CacheParam : TCacheParams; pConnection : TADOConnection);
begin
  FCacheAux := CacheParam;
  lbResult.Items.Assign(FCacheAux.FFieldsTables);
  lbRelations.Items.Assign(FCacheAux.FRelations);
  FConnection := pConnection;
//  FDataBaseName := pDatabaseName;
//  FSessionName  := pSessionName;
end;

procedure TfrmCacheryEditor.GetValue(var CacheParam : TCacheParams);
begin
  CacheParam := FCacheAux;
end;

procedure TfrmCacheryEditor.btnPriorClick(Sender: TObject);
begin
  with pgMain do
  begin
    ActivePage := FindNextPage(ActivePage, False, False);
    paProTop.Caption := ActivePage.Caption;
    btnPrior.Enabled := (ActivePage <> tsPast1);
    btnNext.Enabled := (ActivePage <> tsPast4);
    if (lbTables.Items.Count = 1) and
       (ActivePage = tsPast3)
    then ActivePage := FindNextPage(ActivePage, False, False);
  end;
end;

procedure TfrmCacheryEditor.btnNextClick(Sender: TObject);
begin
  with pgMain do
  begin
    if (ActivePage = tsPast1)then ParseSQL;
    ActivePage := FindNextPage(ActivePage, True, False);
    paProTop.Caption := ActivePage.Caption;
    if (lbTables.Items.Count = 1) and
       (ActivePage = tsPast3)
    then ActivePage := FindNextPage(ActivePage, True, False);

    btnPrior.Enabled := (ActivePage <> tsPast1);
    btnNext.Enabled := (ActivePage <> tsPast4);
    if (ActivePage = tsPast4) then
    begin
      FinalizarAssist;
      lbTabResult.OnClick(Self);
    end;
  end;
end;

procedure TfrmCacheryEditor.FormCreate(Sender: TObject);
begin
  pgMain.ActivePage := tsPast1;
  paProTop.Caption := pgMain.ActivePage.Caption;
end;

procedure TfrmCacheryEditor.meChange(Sender: TObject);
begin
  btnNext.Enabled := (Trim(me.Text) <> '');
end;

procedure TfrmCacheryEditor.sbUpClick(Sender: TObject);
var
  sAux : string;
  iAux : Integer;
  Obj : TObject;
begin
  Obj := nil;
  if lbResult.Focused then Obj := lbResult;
  if lbRelations.Focused then Obj := lbRelations;
  if Obj = nil then Exit;
  if TListBox(Obj).Items.Count = 0 then Exit;

  if TListBox(Obj).ItemIndex = 0 then Exit;
  iAux := TListBox(Obj).ItemIndex;
  sAux := TListBox(Obj).Items[TListBox(Obj).ItemIndex];
  TListBox(Obj).Items.Delete(iAux);
  TListBox(Obj).Items.Insert(iAux -1, sAux);
  TListBox(Obj).ItemIndex := iAux -1;
end;

procedure TfrmCacheryEditor.sbDownClick(Sender: TObject);
var
  sAux : string;
  iAux : Integer;
  Obj : TObject;
begin
  Obj := nil;
  if lbResult.Focused then Obj := lbResult;
  if lbRelations.Focused then Obj := lbRelations;
  if Obj = nil then Exit;
  if TListBox(Obj).Items.Count = 0 then Exit;

  if TListBox(Obj).ItemIndex = TListBox(Obj).Items.Count - 1 then Exit;
  iAux := TListBox(Obj).ItemIndex;
  sAux := TListBox(Obj).Items[TListBox(Obj).ItemIndex];
  TListBox(Obj).Items.Delete(iAux);
  TListBox(Obj).Items.Insert(iAux +1, sAux);
  TListBox(Obj).ItemIndex := iAux +1;
end;

procedure TfrmCacheryEditor.btnOkClick(Sender: TObject);
begin
  if MessageDlg('Deseja finalizar Assistente de Procura?',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
     FinalizarAssist;
     modalResult := mrOk;
  end;
end;

procedure TfrmCacheryEditor.ParseSQL;
var
  I, Ini, Fim : Integer;
  sAux, sFieldName : string;
begin
  lbFields.Items.Clear;
  lbTables.Items.Clear;
  cbDetail.Items.Clear;
  Ini := me.Lines.IndexOf('SELECT') + 1;
  Fim := me.Lines.IndexOf('FROM') - 1;
  for I := Ini to Fim do
  begin
    sAux := Trim(me.Lines[I]);
    if Pos('.', sAux) > 0 then
    begin
      sAux := Copy(sAux, Pos('.',sAux) + 1, Length(sAux));
      if Pos(' AS ',sAux ) = 0 then
      begin
        sFieldName := Trim(Copy(sAux, 0, Pos(' ',sAux) - 1));
        sAux := Copy(sAux, Pos(' ',sAux) + 1, Length(sAux));
      end
      else
      begin
        sFieldName := Trim(Copy(sAux, 0, Pos(' AS ',sAux) - 1));
        sAux := Copy(sAux, Pos(' AS ',sAux) + 4, Length(sAux));
      end;
      if Pos(',', sAux) > 0 then sAux := Copy(sAux, 0, Length(sAux) - 1);
      if not ExistField(sAux) then lbFields.Items.Values[sAux]:= sFieldName;
    end
    else begin
      if Pos(',', sAux) > 0 then sAux := Copy(sAux, 0, Length(sAux) - 1);
      if not ExistField(sAux) then lbFields.Items.Values[sAux]:= sAux;
    end;
  end;
  Ini := me.Lines.IndexOf('FROM') + 1;
  if (me.Lines.IndexOf('WHERE') <> -1)
  then Fim := me.Lines.IndexOf('WHERE') - 1
  else
    if (me.Lines.IndexOf('ORDER BY') <> -1)
    then Fim := (me.Lines.IndexOf('ORDER BY') -1)
    else Fim := me.Lines.Count -1;

  for I := Ini to Fim do
  begin
    sAux := Trim(me.Lines[I]);
    if Pos(' ', sAux) > 0 then
    begin
      Insert('>', sAux, Pos(' ',sAux) + 1);
      Delete(sAux, Pos(' ', sAux), 1);
      if Pos(',', sAux) > 0
      then lbTables.Items.Add(Copy(sAux, 0, Length(sAux) - 1))
      else lbTables.Items.Add(sAux);
    end
    else
      if Pos(',', sAux) > 0
      then lbTables.Items.Add(Copy(sAux, 0, Length(sAux) - 1) + '>' + sAux)
      else lbTables.Items.Add(sAux + '>' + sAux);
    if Pos('>', sAux) > 0
    then sAux := Copy(sAux, 0, Pos('>', sAux) -1);
    cbDetail.Items.Add(sAux);
  end;
  lbTables.Enabled := (lbFields.Items.Count > 0);
  lbTabResult.Items.Assign(cbDetail.Items);
  lbTabResult.ItemIndex := 0;
end;

function TfrmCacheryEditor.ExistField(Value : string) : boolean;
var
  I : Integer;
  sAux : string;
begin
  result := False;
  for I := 0 to lbResult.Items.Count - 1 do
  begin
    sAux := lbResult.Items.Strings[I];
    sAux := Copy(sAux, Pos(';',sAux) + 1, Length(sAux));
    sAux := Copy(sAux, Pos(';',sAux) + 1, Length(sAux));
    sAux := Copy(sAux, 0, Pos(';',sAux)-1);
    if UpperCase(sAux) = UpperCase(Value) then
    begin
      result := True;
      Break;
    end;
  end;
end;

procedure TfrmCacheryEditor.lbResultKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_delete) and (TListBox(Sender).ItemIndex <> -1)
  then sbDelResultClick(Sender);
end;

procedure TfrmCacheryEditor.FormShow(Sender: TObject);
begin
  pgMain.ActivePage := tsPast1;
  me.SetFocus;
end;

procedure TfrmCacheryEditor.ClearFields(Tipo : byte);
begin
  if Tipo = 1 then
  begin
    rdgTipo.ItemIndex := 3;
    edSeq.Clear;
    ckCalc.Checked := False;
    edCalc.Color := clBtnFace;
    edCalc.Clear;
  end
  else begin
    cbMaster.Text := '';
    cbDetail.Items.Clear;
    cbDetail.Text := '';
    lbKeyMaster.Items.Clear;
    lbKeyDetail.Items.Clear;
  end;
end;

procedure TfrmCacheryEditor.UndeleteProperty(Value : String);
var
  sFieldName : ShortString;
begin
  Value := Copy(Value, Pos(';', Value) + 1, Length(Value));
  sFieldName := Copy(Value, 0, Pos(';', Value) - 1);
  Value := Copy(Value, Pos(';', Value) + 1, Length(Value));
  sFieldName := sFieldName + '=' + Copy(Value, 0, Pos(';', Value) - 1);
  lbFields.ItemIndex := lbFields.Items.Add(sFieldName);
  Value := Copy(Value, Pos(';', Value) + 1, Length(Value));
  rdgTipo.ItemIndex := StrToInt(Copy(Value, 0, Pos(';', Value) - 1));
  Value := Copy(Value, Pos(';', Value) + 1, Length(Value));
  edSeq.Text := Copy(Value, 0, Pos(';', Value) - 1);
  Value := Copy(Value, Pos(';', Value) + 1, Length(Value));
  ckCalc.Checked := (Copy(Value, 0, Pos(';', Value) - 1) = 'T');
  Value := Copy(Value, Pos(';', Value) + 1, Length(Value));
  edCalc.Text := Copy(Value, 0, Pos(';', Value) - 1);
  lbTables.Enabled := (lbFields.Items.Count > 0);
end;

procedure TfrmCacheryEditor.EnableRel;
begin
  spInsRelation.Enabled := ((cbMaster.Text <> '') and
                            (cbDetail.Text <> '') and
                            (lbKeyMaster.ItemIndex <> -1) and
                            (lbKeyDetail.ItemIndex <> -1));
end;

procedure TfrmCacheryEditor.EnableButton;
var
  bSeq : Boolean;
begin
  if (rdgTipo.ItemIndex = 2) then bSeq := (edSeq.Text <> '') else bSeq := True;
  sbInsResult.Enabled := ((lbFields.ItemIndex <> -1) and
                          (lbTables.ItemIndex <> -1) and
                          (bSeq));
end;

procedure TfrmCacheryEditor.lbFieldsClick(Sender: TObject);
begin
  EnableButton;
end;

procedure TfrmCacheryEditor.FinalizarAssist;
begin
  with FCacheAux do
  begin
    if lbTables.Items.Count = 0 then Exit;
    FFieldsTables.Clear;
    FTables.Clear;
    FTables.Assign(lbTables.Items);
    FFieldsTables.Assign(lbResult.Items);
    FRelations.Assign(lbRelations.Items);
  end;
end;

procedure TfrmCacheryEditor.sbInsResultClick(Sender: TObject);
var
  sField, sTipo, sAux,
  sCalc, sTableName, sAlias : ShortString;
  I : Integer;
begin
  I := 0;
  if rdgTipo.ItemIndex = 2 then
  begin
     showmessage('Função de Sequence desabilitada!');
  end
  else
  begin
     while I <= lbFields.Items.Count -1 do
       if lbFields.Selected[I] then
       begin
         if ckCalc.Checked then sCalc := 'T' else sCalc := 'F';
         sTipo := IntToStr(rdgTipo.ItemIndex);
         sField := lbFields.Items[I];
         sTableName := lbTables.Items[lbTables.ItemIndex];
         sTableName := Copy(sTableName, 0, Pos('>', sTableName) - 1);
         sAlias := lbTables.Items[lbTables.ItemIndex];
         sAlias := Copy(sAlias, Pos('>', sAlias) + 1, Length(sAlias));
         sAux := Format('%s;%s;%s;%s;%s;%s;%s;%s',
           [sTableName, Copy(sField, Pos('=', sField) + 1, Length(sField)),
           Copy(sField, 0, Pos('=', sField) - 1), sTipo, edSeq.Text, sCalc, edCalc.Text, sAlias]);
         lbResult.Items.Add(sAux);
         lbFields.Items.Delete(I);
       end
       else Inc(I);
     lbTables.Enabled := (lbFields.Items.Count > 0);
     ClearFields(1);
  end;
end;

procedure TfrmCacheryEditor.sbDelResultClick(Sender: TObject);
begin
  if lbResult.ItemIndex = -1 then Exit;
  UndeleteProperty(lbResult.Items[lbResult.ItemIndex]);
  lbResult.Items.Delete(lbResult.ItemIndex);
  lbTables.Enabled := (lbFields.Items.Count > 0);
  lbRelations.Items.Clear;
  FCacheAux.FRelations.Clear;
end;

procedure TfrmCacheryEditor.lbKeyMasterClick(Sender: TObject);
begin
  EnableRel;
end;

procedure TfrmCacheryEditor.cbMasterChange(Sender: TObject);
begin
  SetKeys(cbMaster.Text, lbKeyMaster, False);
  EnableRel;
end;

procedure TfrmCacheryEditor.cbDetailChange(Sender: TObject);
var
  I : integer;
  sAux : string;
begin
  cbMaster.Items.Clear;
  cbMaster.Text := '';
  lbKeyMaster.Items.Clear;
  for I := 0 to lbTables.Items.Count - 1 do
  begin
    sAux := lbTables.Items[I];
    sAux := Copy(sAux, 0, Pos('>', sAux) -1);
    if cbDetail.Text <> sAux
    then cbMaster.Items.Add(sAux);
  end;
  SetKeys(cbDetail.Text, lbKeyDetail, True);
  EnableRel;
end;

procedure TfrmCacheryEditor.spInsRelationClick(Sender: TObject);
var
  sAux, sFieldName, sDetail, sMaster : string;
  I : integer;
begin
  sDetail := cbDetail.Text + '.' + lbKeyDetail.Items[lbKeyDetail.ItemIndex];
  sMaster := cbMaster.Text + '.' + lbKeyMaster.Items[lbKeyMaster.ItemIndex];
  for I := 0 to lbResult.Items.Count -1 do
  begin
    sAux := lbResult.Items[I];
    sFieldName := Copy(sAux, 0, Pos(';', sAux) -1);
    sAux := Copy(sAux, Pos(';', sAux) + 1, Length(sAux));
    sAux := Copy(sAux, Pos(';', sAux) + 1, Length(sAux));
    sFieldName := sFieldName + '.' + Copy(sAux, 0, Pos(';', sAux) -1);
    if sFieldName = sDetail then sDetail := IntToStr(I) + '-';
    if sFieldName = sMaster then sMaster := IntToStr(I);
  end;
  sAux := sDetail + sMaster;
  if (lbRelations.Items.IndexOf(sAux) = -1) then lbRelations.Items.Add(sAux);
end;

procedure TfrmCacheryEditor.spDelRelationClick(Sender: TObject);
begin
  if (lbRelations.ItemIndex <> -1)
  then lbRelations.Items.Delete(lbRelations.ItemIndex);
end;

procedure TfrmCacheryEditor.lbTabResultClick(Sender: TObject);
begin
  if (lbTabResult.ItemIndex = -1) or (rdgTipoSQL.ItemIndex = -1) then Exit;
  FCacheAux.MakeSQL(lbTabResult.Items[lbTabResult.ItemIndex],
                    rdgTipoSQL.ItemIndex,
                    meResultSQL.Lines, nil);
end;

procedure TfrmCacheryEditor.ckChaveClick(Sender: TObject);
begin
  EnableButton;
end;

procedure TfrmCacheryEditor.rdgTipoClick(Sender: TObject);
begin
  laSeq.Enabled := (rdgTipo.ItemIndex = 2);
  edSeq.Enabled := (rdgTipo.ItemIndex = 2);
  if (rdgTipo.ItemIndex = 2) then edSeq.Color := clWindow else edSeq.Color := clBtnFace;
  EnableButton;
end;


procedure TfrmCacheryEditor.ckCalcClick(Sender: TObject);
begin
  laCalc.Enabled := (ckCalc.Checked);
  edCalc.Enabled := (ckCalc.Checked);
  if (ckCalc.Checked) then
  begin
    edCalc.Color := clWindow;
    if lbFields.ItemIndex <> -1
    then edCalc.Text := lbFields.Items[lbFields.ItemIndex];
    edCalc.Text := 'Z' + Copy(edCalc.Text, 0 , Pos('=', edCalc.Text) -1);
  end
  else begin
    edCalc.Color := clBtnFace;
    edCalc.Clear;
  end;
end;

procedure TfrmCacheryEditor.btCancelarClick(Sender: TObject);
begin
   modalResult := mrCancel;
end;

procedure TfrmCacheryEditor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_Escape then
     btCancelar.Click; 

end;

procedure TfrmCacheryEditor.btCriaSQLClick(Sender: TObject);
begin
   TfmCriaSQL.CriaSQL( me.lines, FConnection);
end;

procedure Register;
begin
  RegisterComponentEditor(TCacheQuery, TCacheQueryEditor);
end;


end.
