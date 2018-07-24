unit DBFindEditDsg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,DBFindEdit,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Spin, Mask, DBCtrls, DBTables,
  Db, uTool, Lookupedit, declaratype, DBGridPesquisa,CriaSQL,DesignIntf,DesignEditors,
  DeclaraTypeDsg;

type
  TFindEditor = Class(TDefaultEditor)
    procedure ExecuteVerb(Index: Integer);      Override;
    function  GetVerb(Index: Integer): String;  Override;
    function  GetVerbCount: Integer;            Override;
    procedure MakeAssist;
  end;

  TfrmFindEditor = class(TForm)
    pgMain: TPageControl;
    tsPast1: TTabSheet;
    mePro: TMemo;
    paPro: TPanel;
    btnPrior: TBitBtn;
    btnNext: TBitBtn;
    tsPast3: TTabSheet;
    paProTop: TPanel;
    lbFields: TListBox;
    lbResult: TListBox;
    btnOk: TBitBtn;
    btnAdicionar: TBitBtn;
    lbFormat: TLabel;
    lbCampos: TLabel;
    sbDown: TSpeedButton;
    sbUp: TSpeedButton;
    tsPast4: TTabSheet;
    paBack: TPanel;
    paLeft: TPanel;
    paRigth: TPanel;
    paBottom: TPanel;
    paBack2: TPanel;
    paGrid: TPanel;
    grdPro: TDBGridPesquisa;
    qyFind: TQuery;
    dsFind: TDataSource;
    ckGrid: TCheckBox;
    rdgAlign: TRadioGroup;
    tsPast2: TTabSheet;
    lbFieldDetail: TListBox;
    laFieldDetail: TLabel;
    lbRelation: TListBox;
    laRelacions: TLabel;
    lbFieldMaster: TListBox;
    laFieldMaster: TLabel;
    spdAddRel: TSpeedButton;
    spbDelRel: TSpeedButton;
    paTop: TPanel;
    ckChave: TCheckBox;
    lbKeyFind: TListBox;
    laModFind: TLabel;
    edtTitle: TEdit;
    laTitle: TLabel;
    ckKey: TCheckBox;
    ckCalc: TCheckBox;
    laCalc: TLabel;
    edCalc: TEdit;
    btCancelar: TBitBtn;
    st: TStatusBar;
    btCriaSQL: TButton;
    procedure btnNextClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure meProChange(Sender: TObject);
    procedure sbUpClick(Sender: TObject);
    procedure sbDownClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure lbResultKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAdicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lbFieldsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lbFieldsClick(Sender: TObject);
    procedure spdAddRelClick(Sender: TObject);
    procedure spbDelRelClick(Sender: TObject);
    procedure ckChaveClick(Sender: TObject);
    procedure ckGridClick(Sender: TObject);
    procedure lbRelationKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ckCalcClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btCriaSQLClick(Sender: TObject);
  private
    { Private declarations }
    procedure ParseSQL;
    procedure MakeQuery(qy: TQuery);
  public
    { Public declarations }
    FFindAux : TLookUpParam;
    FDatabaseName : String;
    FSessionName : String;    
    function ExistField(Value : string): boolean;
    function ExistDetail(Value : string; Detail : boolean): boolean;
    procedure GetListFields(qy: TQuery; List: TStrings; Detail : boolean);
    procedure SetValue(FindParam : TLookUpParam; pDatabaseName, pSessionName : String);
    procedure GetValue(var FindParam : TLookUpParam);
    procedure MakeGrid;
    procedure ClearFields;
    procedure UndeleteProperty(Value : String);
    procedure EnableButton;
    procedure FinalizarFind;
    procedure SetCols;
  end;

var
  frmFindEditor: TfrmFindEditor;

const
  DEF_WIDTH_OLD = 564;
  DEF_HEIGHT_OLD = 395;

procedure Register;


{
FParams[0]=  Nome do Campo;
FParams[1]=  Indicador de Cláusula Like;
FParams[2]=  Character de Like;

FParams[3]=  Indicador de Grid;
FParams[4]=  Alinhamento da Grid;
FParams[5]=  Indicador de Chave;
FParams[6]=  Descrição do Campo;

FParams[7]=  Tamanho do Campo na Grid;
FParams[8]=  Indicador de Calculado;
FParams[9]=  Nome do Campo Calculado;
}

implementation

{$R *.DFM}

{TFindEditor}

procedure TFindEditor.ExecuteVerb(Index: Integer);
begin
  if Index = 0 then MakeAssist;
end;

function TFindEditor.GetVerb(Index: Integer): String;
begin
  if Index = 0 then Result := 'Assistente de Busca';
end;

function TFindEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;

procedure TFindEditor.MakeAssist;
var viModalResult : integer;
begin
//  if TDBFindEdit(Component).FDatabaseName = '' then
//  begin
//    MessageDlg('propriedade "MasterDatabase" inválida.', mtError, [mbOK], 0);
//  end
//  else
//  begin
     with TFrmFindEditor.Create(Application) do
     begin
       SetValue(TDBFindEdit(Component).FLookUpParam, TDBFindEdit(Component).MasterDatabase, TDBFindEdit(Component).SessionName);
       viModalResult := ShowModal;
       if viModalResult = mrOk then
       begin
          GetValue(TDBFindEdit(Component).FLookUpParam);
          TDBFindEdit(Component).SetLookUpSQL(TDBFindEdit(Component).FLookUpParam.FLookUpSQL);
          FindRootDesigner(Component).Modified;
       end;
       Destroy;
     end;
//  end;
end;

{TFrmFindEditor}
procedure TfrmFindEditor.SetValue(FindParam : TLookUpParam; pDatabaseName, pSessionName : String);
var
  I : Byte;
begin
  FFindAux := FindParam;
  FDatabaseName := pDatabaseName;
  FSessionName  := pSessionName;
  with FindParam do
  begin
    if mePro.Lines.Text <> FLookUpSQL.Text then
    begin
      mePro.Lines.Text := FLookUpSQL.Text;
      FFindAux.FLookUpSQL.Text := FLookUpSQL.Text;
    end;

    if FListFields.Count > 0 then
      for I := 0 to FListFields.Count - 1 do
        lbResult.Items.Add(FListFields.Strings[I]);

    if FRelations.Count > 0 then
      for I := 0 to FRelations.Count - 1 do
        lbRelation.Items.Add(FRelations.Strings[I]);

    lbKeyFind.Items.Clear;
    if GetFieldQuery('=') = '' then lbKeyFind.Items.Add('Igual (=)');
    if GetFieldQuery('=2') = '' then lbKeyFind.Items.Add('Igual2 (=2)');
    if GetFieldQuery('%') = '' then lbKeyFind.Items.Add('Like (%)');
    ckChave.Enabled := (lbKeyFind.Items.Count > 0);
  end;
end;

procedure TfrmFindEditor.GetValue(var FindParam : TLookUpParam);
begin
  FindParam := FFindAux;
  if mePro.Lines.Text <> FFindAux.FLookUpSQL.Text then
  begin
    FFindAux.FLookUpSQL.Assign(mePro.Lines);
    FindParam.FLookUpSQL.Assign(mePro.Lines);
  end;
end;

procedure TfrmFindEditor.btnPriorClick(Sender: TObject);
begin
  with pgMain do
  begin
    if ActivePage = tsPast4 then SetCols;
    Self.Width := DEF_WIDTH_OLD;
    Self.Height := DEF_HEIGHT_OLD;
    ActivePage := FindNextPage(ActivePage, False, False);

    if (ActivePage = tsPast2) and
       (FFindAux.FDataSource = nil)
    then ActivePage := FindNextPage(ActivePage, False, False);

    paProTop.Caption := ActivePage.Caption;
    btnPrior.Enabled := (ActivePage <> tsPast1);
    btnNext.Enabled := (ActivePage <> tsPast4);
  end;
end;

procedure TfrmFindEditor.btnNextClick(Sender: TObject);
begin
  with pgMain do
  begin
    Self.Width := DEF_WIDTH_OLD;
    Self.Height := DEF_HEIGHT_OLD;
    if (ActivePage = tsPast1) then ParseSQL;
    ActivePage := FindNextPage(ActivePage, True, False);
    if (ActivePage = tsPast2) and
       (FFindAux.FDataSource = nil)
    then ActivePage := FindNextPage(ActivePage, True, False);

    paProTop.Caption := ActivePage.Caption;
    if (ActivePage = tsPast4)then MakeGrid;
    btnPrior.Enabled := (ActivePage <> tsPast1);
    btnNext.Enabled := (ActivePage <> tsPast4);
  end;
  btnPrior.Enabled := True;
end;

procedure TfrmFindEditor.FormCreate(Sender: TObject);
begin
  pgMain.ActivePage := tsPast1;
  paProTop.Caption := pgMain.ActivePage.Caption;
end;

procedure TfrmFindEditor.meProChange(Sender: TObject);
begin
  btnNext.Enabled := (Trim(mePro.Text) <> '');
end;

procedure TfrmFindEditor.sbUpClick(Sender: TObject);
var
  sAux : string;
  iAux : Integer;
  Obj : TObject;
begin
  Obj := nil;
  if lbResult.Focused then Obj := lbResult;
  if Obj = nil then Exit;
  if TListBox(Obj).Items.Count = 0 then Exit;

  if TListBox(Obj).ItemIndex = 0 then Exit;
  iAux := TListBox(Obj).ItemIndex;
  sAux := TListBox(Obj).Items[TListBox(Obj).ItemIndex];
  TListBox(Obj).Items.Delete(iAux);
  TListBox(Obj).Items.Insert(iAux -1, sAux);
  TListBox(Obj).ItemIndex := iAux -1;
end;

procedure TfrmFindEditor.sbDownClick(Sender: TObject);
var
  sAux : string;
  iAux : Integer;
  Obj : TObject;
begin
  Obj := nil;
  if lbResult.Focused then Obj := lbResult;
  if Obj = nil then Exit;
  if TListBox(Obj).Items.Count = 0 then Exit;

  if TListBox(Obj).ItemIndex = TListBox(Obj).Items.Count - 1 then Exit;
  iAux := TListBox(Obj).ItemIndex;
  sAux := TListBox(Obj).Items[TListBox(Obj).ItemIndex];
  TListBox(Obj).Items.Delete(iAux);
  TListBox(Obj).Items.Insert(iAux +1, sAux);
  TListBox(Obj).ItemIndex := iAux +1;
end;

procedure TfrmFindEditor.btnOkClick(Sender: TObject);
begin
  if MessageDlg('Deseja finalizar Assistente de Procura?',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
     SetCols;
     FinalizarFind;
     modalResult := mrOk;
  end;

end;

procedure TfrmFindEditor.ParseSQL;
var
  I, Ini, Fim : Integer;
  sAux, sFieldName : string;
begin
  lbFieldMaster.Items.Clear;
  lbFieldDetail.Items.Clear;
  lbFields.Items.Clear;

  Ini := mePro.Lines.IndexOf('SELECT') + 1;
  Fim := mePro.Lines.IndexOf('FROM') - 1;
  for I := Ini to Fim do
  begin
    sAux := Trim(mePro.Lines[I]);
    if Pos(',', sAux) > 0 then
      sAux := Copy(sAux, 0, Length(sAux) - 1);
    if Pos('.', sAux) > 0 then
    begin
      if Pos(' AS ', sAux) = 0 then
      begin
        sFieldName := Copy(sAux, Pos(' ', sAux) + 1, Length(sAux));
        sFieldName := sFieldName + '>' + Copy(sAux, 0, Pos(' ', sAux) - 1);
      end
      else
      begin
        sFieldName := Copy(sAux, Pos(' AS ', sAux) + 4, Length(sAux));
        sFieldName := sFieldName + '>' + Copy(sAux, 0, Pos(' AS ', sAux) - 1);
      end;

      sAux := sFieldName;
    end
    else
      sAux := sAux + '>' + sAux;
    if not ExistDetail(sAux, True) then lbFieldDetail.Items.Add(sAux);
    if not ExistField(sAux) then lbFields.Items.Add(sAux);
  end;
  with FFindAux do
  begin
    FLookUpSQL.Assign(mePro.Lines);
    if FDataSource <> nil
    then GetListFields(TQuery(FDataSource.Dataset), lbFieldMaster.Items, False);
  end;
end;

procedure TfrmFindEditor.GetListFields(qy: TQuery; List: TStrings; Detail : boolean);
var
  I : Integer;
begin
  GetFieldNames2(qy,List);
  I := 0;
  while I <= List.Count -1 do
    if ExistDetail(List[I], Detail)
    then List.Delete(I)
    else Inc(I);
end;

function TfrmFindEditor.ExistField(Value : string) : boolean;
var
  I : Integer;
  sAux : string;
begin
  result := False;
  for I := 0 to lbResult.Items.Count - 1 do
  begin
    sAux := lbResult.Items.Strings[I];
    sAux := Copy(sAux, 0, Pos(';',sAux)-1);
    if UpperCase(sAux) = UpperCase(Value) then
    begin
      result := True;
      Break;
    end;
  end;
end;

function TfrmFindEditor.ExistDetail(Value : string; Detail : Boolean) : boolean;
var
  I : Integer;
  sAux : string;
begin
  result := False;
  for I := 0 to lbRelation.Items.Count - 1 do
  begin
    sAux := lbRelation.Items.Strings[I];
    if Detail
    then sAux := Trim(Copy(sAux, 0, Pos('=', sAux)-1))
    else sAux := Trim(Copy(sAux, Pos(':', sAux)+1, Length(sAux)));
    if UpperCase(sAux) = UpperCase(Value) then
    begin
      result := True;
      Break;
    end;
  end;
end;

procedure TfrmFindEditor.lbResultKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Aux : String;
begin
  if (Key = vk_delete) and (TListBox(Sender).ItemIndex <> -1)then
  begin
    Aux := TListBox(Sender).Items[TListBox(Sender).ItemIndex];
    UndeleteProperty(TListBox(Sender).Items.Strings[TListBox(Sender).ItemIndex]);
    TListBox(Sender).Items.Delete(TListBox(Sender).ItemIndex);
  end;
end;

procedure TfrmFindEditor.btnAdicionarClick(Sender: TObject);
var
  sAux, sLike, sKey, sCalc : string;
  sInd, sCharLike : String;
begin
  if (ckChave.Checked) then
    if (lbKeyFind.ItemIndex = -1) then
    begin
      MessageDlg('Nenhum "Modo de Busca" foi selecionado.', mtWarning, [mbOk], 0);
      lbKeyFind.SetFocus;
      Exit;
    end;

  if (lbFields.ItemIndex = -1) then Exit;

  sCalc := '';
  if ckCalc.Checked then sCalc := 'T' else sCalc := 'F';
  sLike := '';
  if ckChave.Checked then sLike := 'T' else sLike := 'F';
  sInd := '';
  if ckGrid.Checked then sInd := 'T' else sInd := 'F';
  sKey := '';
  if ckKey.Checked then sKey := 'K' else sKey := ' ';


  sCharLike := ' ';
  if (ckChave.Checked)then
    if (lbKeyFind.ItemIndex <> -1) then
    begin
      if Pos('=2', lbKeyFind.Items[lbKeyFind.ItemIndex]) > 0 then
         sCharLike := '=2'
      else
      if Pos('=', lbKeyFind.Items[lbKeyFind.ItemIndex]) > 0 then
         sCharLike := '='
      else
      if Pos('%', lbKeyFind.Items[lbKeyFind.ItemIndex]) > 0 then
         sCharLike := '%';
    end;

  sAux := Format('%s;%s;%s;%s;%s;%s;%s;%s;%s;%s',
    [lbFields.Items[lbFields.ItemIndex], sLike, sCharLike,
     sInd, IntToStr(rdgAlign.ItemIndex), sKey, edtTitle.Text, '100', sCalc, edCalc.Text]);
  lbResult.Items.Add(sAux);
  lbFields.Items.Delete(lbFields.ItemIndex);
  if (ckChave.Checked) then
    if (lbKeyFind.ItemIndex <> -1)then
    begin
      lbKeyFind.Items.Delete(lbKeyFind.ItemIndex);
      ckChave.Enabled := (lbKeyFind.Items.Count > 0);
    end;
  ClearFields;
end;

procedure TfrmFindEditor.FormShow(Sender: TObject);
begin
  mePro.SetFocus;
end;

procedure TfrmFindEditor.lbFieldsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_delete) and (TListBox(Sender).ItemIndex <> -1)
  then TListBox(Sender).Items.Delete(TListBox(Sender).ItemIndex);
end;

procedure TfrmFindEditor.MakeGrid;
var
  I : Integer;
  ColAux : TColumn;
begin
  I := 0;
  while I < grdPro.Columns.Count - 1 do
  begin
    ColAux := grdPro.Columns.Items[I];
    ColAux.Free;
  end;
  ColAux := grdPro.Columns.Items[0];
  ColAux.Free;

  if lbResult.Items.Count = 0 then Exit;

  with FFindAux do
  begin
    FListFields.Clear;
    for I := 0 to lbResult.Items.Count - 1 do
      FListFields.Add(lbResult.Items[I]);

    MakeQuery(qyFind);
    MakeFind(Self, grdPro);
  end;
end;

procedure TfrmFindEditor.ClearFields;
begin
  ckGrid.Checked := False;
  ckChave.Checked := False;
  lbKeyFind.Enabled := False;
  lbKeyFind.Color := clBtnFace;
  rdgAlign.ItemIndex := 1;
  laModFind.Enabled := False;
  edtTitle.Clear;
  ckKey.Checked := False;
  laCalc.Enabled := False;
  ckCalc.Checked := False;
  edCalc.Clear;
  edCalc.Color := clBtnFace;
end;

procedure TfrmFindEditor.UndeleteProperty(Value : String);
begin
  lbFields.ItemIndex := lbFields.Items.Add(Copy(Value, 0, Pos(';', Value) - 1));
  Value := Copy(Value, Pos(';', Value) + 1, Length(Value));
  ckChave.Checked := (Copy(Value, 0, Pos(';', Value) - 1) = 'T');
  Value := Copy(Value, Pos(';', Value) + 1, Length(Value));
  if Copy(Value, 0, Pos(';', Value) - 1) <> ' ' then
  begin
    if Copy(Value, 0, Pos(';', Value) - 1) = '='
    then lbkeyFind.Items.Add('Igual (=)');
    if Copy(Value, 0, Pos(';', Value) - 1) = '=2'
    then lbkeyFind.Items.Add('Igual2 (=2)');

    if Copy(Value, 0, Pos(';', Value) - 1) = '%'
    then lbkeyFind.Items.Add('Like (%)');
  end;
  Value := Copy(Value, Pos(';', Value) + 1, Length(Value));
  ckGrid.Checked := (Copy(Value, 0, Pos(';', Value) - 1) = 'T');
  Value := Copy(Value, Pos(';', Value) + 1, Length(Value));
  rdgAlign.ItemIndex := StrToInt(Copy(Value, 0, Pos(';', Value) - 1));
  Value := Copy(Value, Pos(';', Value) + 1, Length(Value));
  ckKey.Checked := (Copy(Value, 0, Pos(';', Value) - 1) = 'K');
  Value := Copy(Value, Pos(';', Value) + 1, Length(Value));
  edtTitle.Text := Copy(Value, 0, Pos(';', Value) - 1);
  Value := Copy(Value, Pos(';', Value) + 1, Length(Value));
  Value := Copy(Value, Pos(';', Value) + 1, Length(Value));
  ckCalc.Checked := (Copy(Value, 0, Pos(';', Value) - 1) = 'T');
  Value := Copy(Value, Pos(';', Value) + 1, Length(Value));
  edCalc.Text := Value;
  ckChave.Enabled := (lbKeyFind.Items.Count > 0);
end;

procedure TfrmFindEditor.EnableButton;
begin
  btnAdicionar.Enabled := ((lbFields.ItemIndex <> -1) and (edtTitle.Text <> '')) or
                          (ckChave.Checked or ckKey.Checked or ckCalc.Checked);
end;

procedure TfrmFindEditor.lbFieldsClick(Sender: TObject);
begin
  EnableButton;
end;

procedure TfrmFindEditor.FinalizarFind;
var
  I : Integer;
begin
  FFindAux.FListFields.Clear;
  for I := 0 to lbResult.Items.Count - 1 do
    FFindAux.FListFields.Add(lbResult.Items[I]);

  FFindAux.FRelations.Clear;
  for I := 0 to lbRelation.Items.Count - 1 do
    FFindAux.FRelations.Add(lbRelation.Items[I]);
  FFindAux.valida_Parametros;    
end;

procedure TfrmFindEditor.SetCols;
var
  I, J, K : byte;
  sField, sAux : string;
begin
  if lbResult.Items.Count = 0 then Exit;
  for I := 0 to lbResult.Items.Count - 1 do
   for J := 0 to grdPro.Columns.Count - 1 do
   begin
     sField := lbResult.Items[I];
     sField := Copy(sField, 0, Pos('>', sField) - 1);
     if sField = grdPro.Columns[J].FieldName then
     begin
       sAux := lbResult.Items[I];
       sField := '';
       K := 0;
       while K < 7 do
       begin
         sField := sField + Copy(sAux, 0, Pos(';', sAux));
         sAux := Copy(sAux, Pos(';', sAux) + 1, Length(sAux));
         Inc(K);
       end;
       sAux := Copy(sAux, Pos(';', sAux) + 1, Length(sAux));
       sField := sField + IntToStr(grdPro.Columns[J].Width) + ';' + sAux;
       lbResult.Items[I] := sField;
     end;
   end;
end;

procedure TfrmFindEditor.spdAddRelClick(Sender: TObject);
begin
  if (lbFieldDetail.ItemIndex = -1) or (lbFieldMaster.ItemIndex = -1) then Exit;
  lbRelation.Items.Add(lbFieldDetail.Items[lbFieldDetail.ItemIndex] + ' = :' +
                       lbFieldMaster.Items[lbFieldMaster.ItemIndex]);
  lbFieldDetail.Items.Delete(lbFieldDetail.ItemIndex);
  lbFieldMaster.Items.Delete(lbFieldMaster.ItemIndex);
end;

procedure TfrmFindEditor.spbDelRelClick(Sender: TObject);
var
  sAux : String;
begin
  if (lbRelation.ItemIndex = -1) then Exit;
  sAux := lbRelation.Items[lbRelation.ItemIndex];
  lbFieldDetail.Items.Add(Trim(Copy(sAux, 0, Pos('=', sAux) - 1)));
  lbFieldMaster.Items.Add(Trim(Copy(sAux, Pos(':', sAux) + 1, Length(sAux))));
  lbRelation.Items.Delete(lbRelation.ItemIndex);
end;

procedure TfrmFindEditor.ckChaveClick(Sender: TObject);
begin
  EnableButton;
  lbKeyFind.Enabled := ckChave.Checked;
  laModFind.Enabled := ckChave.Checked;
  if ckChave.Checked
  then lbKeyFind.Color := clWindow
  else lbKeyFind.Color := clSilver;
end;

procedure TfrmFindEditor.ckGridClick(Sender: TObject);
begin
  EnableButton;
  rdgAlign.Enabled := ckGrid.Checked;
  ckKey.Enabled := ckGrid.Checked;
end;

procedure TfrmFindEditor.lbRelationKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sAux : ShortString;
begin
  if (Key = vk_delete) and (lbRelation.ItemIndex <> -1) then
  begin
    sAux := lbRelation.Items[lbRelation.ItemIndex];
    lbFieldDetail.Items.Add(Trim(Copy(sAux, 0, Pos('=', sAux) - 1)));
    lbFieldMaster.Items.Add(Trim(Copy(sAux, Pos(':', sAux) + 1, Length(sAux))));
    lbRelation.Items.Delete(lbRelation.ItemIndex);
  end;
end;

procedure TfrmFindEditor.ckCalcClick(Sender: TObject);
begin
  laCalc.Enabled := ckCalc.Checked;
  edCalc.Enabled := ckCalc.Checked;
  if ckCalc.Checked then
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

procedure TfrmFindEditor.btCancelarClick(Sender: TObject);
begin
   modalResult := mrCancel;
end;

procedure TfrmFindEditor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_Escape then
     btCancelar.Click;
end;

procedure TfrmFindEditor.MakeQuery(qy : TQuery);
begin
  qy.DatabaseName := FDatabaseName;
  qy.SessionName  := FSessionName;  
  qy.SQL.Clear;
  qy.SQL.Assign(FFindAux.FLookUpSQL);
  qy.Open;
end;

procedure TfrmFindEditor.btCriaSQLClick(Sender: TObject);
begin
   TfmCriaSQL.CriaSQL( mePro.lines, FDataBaseName, FSessionName );
end;

procedure Register;
begin
  RegisterComponentEditor(TDBFindEdit, TFindEditor);
  RegisterPropertyEditor(TypeInfo(string), TDBFindEdit, 'MasterDatabase', TDatabaseProperty);
  RegisterPropertyEditor(TypeInfo(string), TDBFindEdit, 'MasterDatabase', TDatabaseProperty);  
  RegisterPropertyEditor(TypeInfo(string), TDBFindEdit, 'DataDisplay', TDataFieldProperty);
end;

end.
