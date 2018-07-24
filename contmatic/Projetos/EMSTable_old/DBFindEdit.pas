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
    function  GetReadOnly: Boolean;override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);override;
  published
    { Published declarations }
  end;

procedure Register;

implementation


{TDBFindEdit}

constructor TDBFindEdit.Create(AOwner: TComponent);
begin
  inherited;
end;


function TDBFindEdit.GetReadOnly: Boolean;
begin
  Result := False;
//  if FDataLink = nil then
//    Result := False
//  else
//    Result := (FDataLink.ReadOnly);
end;

procedure Register;
begin
  RegisterComponents('EMS', [TDBFindEdit]);
end;

end.
