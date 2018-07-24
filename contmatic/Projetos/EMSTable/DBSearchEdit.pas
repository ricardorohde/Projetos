unit DBSearchEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, StdCtrls, Buttons, DBTables, DB, DBCtrls, DBConsts, TypInfo,
  ExtCtrls, DBGrids, ComCtrls, Grids, dblookupEdit, lookupedit, Variants;

type

  TDBSearchEdit = class(TDBLookupEdit)
  private
//    FLookUpParam: TLookupParam;
    { Private declarations }
    FListSource: TDataSource;

    procedure ButtonClick(Sender: TObject);
    procedure SetListSource(const Value: TDataSource);
  protected
    { Protected declarations }
    FFormName : String;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
//    procedure CriaFormPesquisa( pStatus : TCadStatus = csPesquisa);override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure MakeCalc;override;
  published
    { Published declarations }
    property ListSource : TDataSource read FListSource write SetListSource;
//    property FormName : String read FFormName write FFormName;
//    property AssistSearch : TLookupParam read FLookUpParam write FLookUpParam;
//    property Parametro;
    //
//    property Connection;
//    property MasterDatabase;
//    property SessionName;
  end;

procedure Register;

implementation

uses uPesquisa;

{TDBSearchEdit}

procedure TDBSearchEdit.ButtonClick(Sender: TObject);
var
  lRetorno : Variant;
begin
  frmPesquisa := TfrmPesquisa.Create( Self );
  try
    frmPesquisa.grdPesquisa.DataSource := FListSource;

    frmPesquisa.Top  := TForm(Self.Owner).Top + Self.Top + (2 * Self.Height) + 3;
    frmPesquisa.Left := TForm(Self.Owner).Left + Self.Left;

    lRetorno := frmPesquisa.Pesquisar;

    if VarToStrDef(lRetorno, '') <> '' then
    begin
      Self.Text := VarToStrDef(lRetorno, '');

      if Assigned(DataSource) and (DataSource.DataSet.State in [dsInsert, dsEdit]) then
        if (FDisplayLink.FieldName <> '') and (FDisplayLink.DataSource <> nil) then
          DataSource.DataSet.FieldByName(FDisplayLink.FieldName).Value := lRetorno;
    end;

    LinkValue := lRetorno;
  finally
    FreeAndNil( frmPesquisa );
  end;
end;

constructor TDBSearchEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
//  valida_Sistema(self);
  FButton.Font.Size := 7;
  FButton.Font.Name := 'Verdana';
  FButton.Font.Style := [fsBold];
  FButton.Caption := '...';
  FButton.OnClick := ButtonClick;
end;

procedure TDBSearchEdit.KeyDown(var Key: Word; Shift: TShiftState);
var vbCanSearch : boolean;
begin

//  if ((Key = vk_Insert) and (ssCtrl in Shift)) then
//  begin
//    if (FDataLink.DataSource.State = dsInsert) or
//       ( (FDataLink.DataSource.State = dsEdit ) and not skipedit) then
//    begin
//       vbCanSearch := true;
//       Key := 0;
//       // Limpa Parametros
//       LookUpParam.vaFiltro := nil;
//       LookUpParam.vaDefault := nil;
//       LookUpParam.vaTitulo := nil;
//       LookUpParam.vaParametro := nil;
//
//       if Assigned(FOnBeforeSearch) then OnBeforeSearch(self,LookUpParam, vbCanSearch);
//
//       Self.CriaFormPesquisa(csInclusao);
//    end;
//  end;
  inherited;
end;

//procedure TDBSearchEdit.CriaFormPesquisa( pStatus : TCadStatus = csPesquisa);
//var ParentForm : TForm;
//    Form : TfmCadVirtual;
//    i : integer;
//begin
//    ParentForm := screen.Forms[0];
//    Form := CriaForm(FFormName,self);
//    with LookUpParam do
//    begin
//       for i := low(vaFiltro) to high(vaFiltro) do
//           Form.AddFiltro(vaFiltro[i]);
//       for i := low(vaDefault) to high(vaDefault) do
//           Form.AddDefault(vaDefault[i].NoCampo, vaDefault[i].valor,vaDefault[i].Alteravel);
//       for i := low(vaTitulo) to high(vaTitulo) do
//           Form.AddTitulo(vaTitulo[i].Descricao,vaTitulo[i].valor);
//       //Parametros
//          //dinamicos
//       for i := low(vaParametro) to high(vaParametro) do
//           Form.AddParametro(vaParametro[i].Nome,vaParametro[i].valor);
//          //Propriedade Parametro
//       for i:=0 to FParametro.Count-1 do
//         Form.AddParametro(FParametro.Names[i],FParametro.Values[FParametro.Names[i]]);
//       //
//
//    end;
//    Form.ExibeForm(ParentForm,pStatus, FFindResult,ReturnForm);
//end;

procedure TDBSearchEdit.MakeCalc;
//var
//  Findex, I : Integer;
begin
//  qy.Fields.Clear;
//  with FLookUpParam do
//  begin
//    for I := 0 to FListFields.Count - 1 do
//    begin
//      ParseField(I);
//      FParams[0] := Copy(FParams[0], 0, Pos('>', FParams[0]) - 1);
//      Findex := qy.FieldDefs.IndexOf(FParams[0]);
//      if FIndex = -1 then
//      begin
//        GetFieldNames2(qy,FParams);
//        ParseField(I);
//        FParams[0] := Copy(FParams[0], 0, Pos('>', FParams[0]) - 1);
//        FIndex := qy.FieldDefs.IndexOf(FParams[0]);
//      end;
//
//      F_Cria_TField ( qy.FieldDefs.Items[Findex].Datatype,self,qy,FParams[0],qy.Name + FParams[0],qy.FieldDefs.Items[Findex].Size);
//      if FParams[4] = 'T' then // Calculado
//         F_Cria_TField ( ftString,self,qy,FParams[5],qy.Name + FParams[5],255,true);
//    end;
//  end;
end;

procedure Register;
begin
  RegisterComponents('EMS', [TDBSearchEdit]);
end;


procedure TDBSearchEdit.SetListSource(const Value: TDataSource);
begin
  FListSource := Value;
end;

end.
