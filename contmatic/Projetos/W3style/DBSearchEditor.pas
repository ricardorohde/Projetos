unit DBSearchEditor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Spin, Mask, DBCtrls, DBTables,
  Db, uTool, lookupedit, declaratype, criaSql;

type

  TSearchEditor = class(TForm)
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
    tsPast2: TTabSheet;
    lbFieldDetail: TListBox;
    laFieldDetail: TLabel;
    lbRelation: TListBox;
    laRelacions: TLabel;
    lbFieldMaster: TListBox;
    laFieldMaster: TLabel;
    spdAddRel: TSpeedButton;
    spbDelRel: TSpeedButton;
    ckChave: TCheckBox;
    lbKeyFind: TListBox;
    laModFind: TLabel;
    ckFiltro: TCheckBox;
    ckCalc: TCheckBox;
    edCalc: TEdit;
    laCalc: TLabel;
    BtCancelar: TBitBtn;
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
    procedure lbRelationKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ckCalcClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btCriaSQLClick(Sender: TObject);
  private
    { Private declarations }
    FDatabaseName : String;
    FSessionName : String;        
    procedure ParseSQL;
  public
    { Public declarations }
    FFindAux : TLookUpParam;
    function ExistField(Value : string): boolean;
    function ExistDetail(Value : string; Detail : boolean): boolean;
    procedure GetListFields(qy: TQuery; List: TStrings; Detail : boolean);    
    procedure SetValue(SearchParam : TLookUpParam; pDatabaseName : String);
    procedure GetValue(var SearchParam : TLookUpParam);
    procedure ClearFields;
    procedure UndeleteProperty(Value : String);
    procedure EnableButton;
    procedure FinalizarSearch;
  end;

var
  SearchEditor: TSearchEditor;
{
FParams[0]=  Nome do Campo;
FParams[1]=  Indicador de Cláusula Like;
FParams[2]=  Character de Like;
FParams[3]=  Indicador de Filtro;
FParams[4]=  Indicador de Calculado;
FParams[5]=  Nomde do Calculado;
}

implementation

{$R *.DFM}

{TSearchEditor}
procedure TSearchEditor.SetValue(SearchParam : TLookUpParam; pDatabaseName, pSessionName : String);
var
  I : Byte;
begin
  FFindAux := SearchParam;
  FDatabaseName := pDatabaseName;
  FSessionName  := pSessionName;
  with SearchParam do
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

procedure TSearchEditor.GetValue(var SearchParam : TLookUpParam);
begin
  SearchParam := FFindAux;
  if mePro.Lines.Text <> FFindAux.FLookUpSQL.Text then
  begin
    FFindAux.FLookUpSQL.Assign(mePro.Lines);
    SearchParam.FLookUpSQL.Assign(mePro.Lines);
  end;
end;

procedure TSearchEditor.btnPriorClick(Sender: TObject);
begin
  with pgMain do
  begin
    ActivePage := FindNextPage(ActivePage, False, False);

    if (ActivePage = tsPast2) and
       (FFindAux.FDataSource = nil)
    then ActivePage := FindNextPage(ActivePage, False, False);

    paProTop.Caption := ActivePage.Caption;
    btnPrior.Enabled := (ActivePage <> tsPast1);
    btnNext.Enabled := (ActivePage <> tsPast3);
  end;
end;

procedure TSearchEditor.btnNextClick(Sender: TObject);
begin
  with pgMain do
  begin
    if (ActivePage = tsPast1) then ParseSQL;
    ActivePage := FindNextPage(ActivePage, True, False);
    if (ActivePage = tsPast2) and
       (FFindAux.FDataSource = nil)
    then ActivePage := FindNextPage(ActivePage, True, False);

    paProTop.Caption := ActivePage.Caption;
    btnPrior.Enabled := (ActivePage <> tsPast1);
    btnNext.Enabled := (ActivePage <> tsPast3);
  end;
  btnPrior.Enabled := True;
end;

procedure TSearchEditor.FormCreate(Sender: TObject);
begin
  pgMain.ActivePage := tsPast1;
  paProTop.Caption := pgMain.ActivePage.Caption;

end;

procedure TSearchEditor.meProChange(Sender: TObject);
begin
  btnNext.Enabled := (Trim(mePro.Text) <> '');
end;

procedure TSearchEditor.sbUpClick(Sender: TObject);
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

procedure TSearchEditor.sbDownClick(Sender: TObject);
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

procedure TSearchEditor.btnOkClick(Sender: TObject);
begin
  if MessageDlg('Deseja finalizar Assistente de Procura?',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
     FinalizarSearch;
     ModalResult := mrOk;
  end;
end;

procedure TSearchEditor.ParseSQL;
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

procedure TSearchEditor.GetListFields(qy: TQuery; List: TStrings; Detail : boolean);
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

function TSearchEditor.ExistField(Value : string) : boolean;
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

function TSearchEditor.ExistDetail(Value : string; Detail : Boolean) : boolean;
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

procedure TSearchEditor.lbResultKeyDown(Sender: TObject; var Key: Word;
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

procedure TSearchEditor.btnAdicionarClick(Sender: TObject);
var
  sAux, sFiltro, sLike, sCalc : string;
  sCharLike : String;
begin
  if (ckChave.Checked) then
    if (lbKeyFind.ItemIndex = -1) then
    begin
      MessageDlg('Nenhum "Modo de Busca" foi selecionado.', mtWarning, [mbOk], 0);
      lbKeyFind.SetFocus;
      Exit;
    end;

  if (lbFields.ItemIndex = -1) then Exit;

  sLike := '';
  if ckChave.Checked then sLike := 'T' else sLike := 'F';

  sFiltro := '';
  if ckFiltro.Checked then sFiltro := 'T' else sFiltro := 'F';

  sCalc := '';
  if (ckCalc.Checked) then sCalc := 'T' else sCalc := 'F';

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

  sAux := Format('%s;%s;%s;%s;%s;%s',
    [lbFields.Items[lbFields.ItemIndex], sLike, sCharLike, sFiltro, sCalc, edCalc.Text]);
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

procedure TSearchEditor.FormShow(Sender: TObject);
begin
  mePro.SetFocus;
end;

procedure TSearchEditor.lbFieldsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_delete) and (TListBox(Sender).ItemIndex <> -1)
  then TListBox(Sender).Items.Delete(TListBox(Sender).ItemIndex);
end;

procedure TSearchEditor.ClearFields;
begin
  ckChave.Checked := False;
  ckFiltro.Checked := False;
  lbKeyFind.Enabled := False;
  lbKeyFind.Color := clBtnFace;
  laModFind.Enabled := False;
  ckCalc.Checked := False;
  laCalc.Enabled := False;
  edCalc.Clear;
  edCalc.Color := clBtnFace;
end;

procedure TSearchEditor.UndeleteProperty(Value : String);
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
  ckFiltro.Checked := (Copy(Value, 0, Pos(';', Value) - 1) = 'T');
  Value := Copy(Value, Pos(';', Value) + 1, Length(Value));
  ckCalc.Checked := (Copy(Value, 0, Pos(';', Value) - 1) = 'T');
  Value := Copy(Value, Pos(';', Value) + 1, Length(Value));
  edCalc.Text := Value;
  ckChave.Enabled := (lbKeyFind.Items.Count > 0);
end;

procedure TSearchEditor.EnableButton;
begin
  btnAdicionar.Enabled := (lbFields.ItemIndex <> -1) or
                          (ckChave.Checked or ckFiltro.Checked or ckCalc.Checked);
end;

procedure TSearchEditor.lbFieldsClick(Sender: TObject);
begin
  EnableButton;
end;

procedure TSearchEditor.FinalizarSearch;
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

procedure TSearchEditor.spdAddRelClick(Sender: TObject);
begin
  if (lbFieldDetail.ItemIndex = -1) or (lbFieldMaster.ItemIndex = -1) then Exit;
  lbRelation.Items.Add(lbFieldDetail.Items[lbFieldDetail.ItemIndex] + ' = :' +
                       lbFieldMaster.Items[lbFieldMaster.ItemIndex]);
  lbFieldDetail.Items.Delete(lbFieldDetail.ItemIndex);
  lbFieldMaster.Items.Delete(lbFieldMaster.ItemIndex);
end;

procedure TSearchEditor.spbDelRelClick(Sender: TObject);
var
  sAux : String;
begin
  if (lbRelation.ItemIndex = -1) then Exit;
  sAux := lbRelation.Items[lbRelation.ItemIndex];
  lbFieldDetail.Items.Add(Trim(Copy(sAux, 0, Pos('=', sAux) - 1)));
  lbFieldMaster.Items.Add(Trim(Copy(sAux, Pos(':', sAux) + 1, Length(sAux))));
  lbRelation.Items.Delete(lbRelation.ItemIndex);
end;

procedure TSearchEditor.ckChaveClick(Sender: TObject);
begin
  EnableButton;
  lbKeyFind.Enabled := ckChave.Checked;
  laModFind.Enabled := ckChave.Checked;
  if ckChave.Checked
  then lbKeyFind.Color := clWindow
  else lbKeyFind.Color := clSilver;
end;

procedure TSearchEditor.lbRelationKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sAux : ShortString;
begin
  if (Key = vk_delete) and (lbRelation.ItemIndex <> -1)then
  begin
    sAux := lbRelation.Items[lbRelation.ItemIndex];
    lbFieldDetail.Items.Add(Trim(Copy(sAux, 0, Pos('=', sAux) - 1)));
    lbFieldMaster.Items.Add(Trim(Copy(sAux, Pos(':', sAux) + 1, Length(sAux))));
    lbRelation.Items.Delete(lbRelation.ItemIndex);
  end;
end;

procedure TSearchEditor.ckCalcClick(Sender: TObject);
begin
  laCalc.Enabled := ckCalc.Checked;
  edCalc.Enabled := ckCalc.Checked;
  if ckCalc.Checked then
  begin
    edCalc.Color := clWindow;
    if lbFields.ItemIndex <> -1
    then edCalc.Text := lbFields.Items[lbFields.ItemIndex];
    edCalc.Text := 'Z' + Copy(edCalc.Text, 0 , Pos('>', edCalc.Text) -1);
  end
  else begin
    edCalc.Color := clSilver;
    edCalc.Clear;
  end;
end;

procedure TSearchEditor.BtCancelarClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TSearchEditor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_Escape then
     btCancelar.Click; 
end;

procedure TSearchEditor.btCriaSQLClick(Sender: TObject);
begin
   TfmCriaSQL.CriaSQL( mePro.lines, FDataBaseName, FSessionName );
end;

end.
