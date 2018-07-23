unit DBFindEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, StdCtrls, Buttons, DBTables, DB, DBCtrls, DBConsts, TypInfo, ExtCtrls, DBGrids,
  ComCtrls, Grids, dbLookupEdit,LookupEdit;

type

  TDBFindEdit = class(TDBLookupEdit)
  private
    { Private declarations }
  protected
    { Protected declarations }
//    procedure CriaFormPesquisa( pStatus : TCadStatus = csPesquisa);override;
    function  GetReadOnly: Boolean;override;
  public
    { Public declarations }
    procedure MakeCalc;override;
    constructor Create(AOwner: TComponent);override;
  published
    { Published declarations }
    //property MasterDatabase;
//    property Connection;
//    property SessionName;
  end;

procedure Register;

implementation


{TDBFindEdit}

constructor TDBFindEdit.Create(AOwner: TComponent);
begin
  inherited;
//  valida_Sistema(self);
end;

//procedure TDBFindEdit.CriaFormPesquisa( pStatus : TCadStatus = csPesquisa);
//var FrmDynamic : TfmProcura;
//begin
//  FrmDyNamic := TfmProcura(CriaForm('fmProcura',self));
//  with FrmDyNamic do
//  begin
//    Left := Self.ClientOrigin.X - 2;
//    Top := Self.ClientOrigin.Y + Self.Height - 2;
//    dsMain.dataset := qy;
//    FLookUpParam.MakeFind(FrmDyNamic, grdProcura);
//
//    FrmDyNamic.ExibeForm(nil,pStatus, FFindResult,ReturnForm);
//  end;
//end;

function TDBFindEdit.GetReadOnly: Boolean;
begin
  if FDataLink = nil
  then Result := False
  else Result := (FDataLink.ReadOnly);
end;

procedure TDBFindEdit.MakeCalc;
//var
//  Findex, I : Integer;
begin
//  qy.Fields.Clear;
//  with LookUpParam do
//  begin
//    for I := 0 to FListFields.Count - 1 do
//    begin
//      ParseField(I);
//      FParams[0] := Copy(FParams[0], 0, Pos('>', FParams[0]) - 1);
//      Findex := qy.FieldDefs.IndexOf(FParams[0]);
//
//      F_Cria_TField ( qy.FieldDefs.Items[Findex].Datatype,self,qy,FParams[0],qy.Name + FParams[0],qy.FieldDefs.Items[Findex].Size);
//      if FParams[8] = 'T' then // Calculado
//        F_Cria_TField ( ftString,self,qy,FParams[9],qy.Name + FParams[9],255,true);
//    end;
//  end;
end;

procedure Register;
begin
  RegisterComponents('EMS', [TDBFindEdit]);
end;

end.
