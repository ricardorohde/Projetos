unit DBEditbtnDescricao;

interface

uses
  SysUtils, Classes, StdCtrls, DBEditBtn, Controls,
  Windows, Messages, Graphics, Forms, Dialogs;

type
  TDBEditbtnDescricao = class(TDBEditBtn)
  private
    { Private declarations }
//    procedure WMSize(var Message: TWMSize); message WM_SIZE;
  protected
    { Protected declarations }
    FEditDescricao : TEdit;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;

  published
    { Published declarations }
  end;

procedure Register;

implementation

{ TDBEditbtnDescricao }

constructor TDBEditbtnDescricao.Create(AOwner: TComponent);
begin
  inherited;

  FEditDescricao := TEdit.Create(Self);
  FEditDescricao.Enabled := False;
  FEditDescricao.Color   := clBtnFace;
  FEditDescricao.Parent  := Self;
  FEditDescricao.Width   := 100;
  FEditDescricao.Height  := 17;
  FEditDescricao.Left    := TDBEditBtn(Self).Width + 2;
  FEditDescricao.Cursor  := crArrow;
end;

procedure Register;
begin
  RegisterComponents('EMS', [TDBEditbtnDescricao]);
end;
//procedure TDBEditbtnDescricao.WMSize(var Message: TWMSize);
//var
//  MinHeight: Integer;
//begin
//  inherited;
//  MinHeight := 5;
//    { text edit bug: if size to less than minheight, then edit ctrl does
//      not display the text }
//  if Height < MinHeight then
//    Height := MinHeight
//  else if FButton <> nil then
//  begin
//    FButton.Width:=Height;
//    if NewStyleControls and Ctl3D then
//      FButton.SetBounds(Width - FButton.Width - 5, 0, FButton.Width, Height - 5)
//    else
//      FButton.SetBounds (Width - FButton.Width, 1, FButton.Width, Height - 1);
//    SetEditRect;
//  end;
//end;

end.
