unit ITFilterEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls,ITFilter,ITValida;

type
  TITDBFilterEdit = class(TDBEdit)
  private
    FAcceptString:String;
    FTipoFiltro : TGrupoTipoFiltro;
    { Private declarations }

  protected
    procedure KeyPress(Var Key:Char);override;
    procedure setAcceptString( value : String );
    procedure setTipoFiltro( value : TGrupoTipoFiltro );
    { Protected declarations }

  public
    constructor Create(AOwner:TComponent);override;
    { Public declarations }

  published
    property AcceptString:string read FAcceptString Write setAcceptString;
    property TipoFiltro : TGrupoTipoFiltro read FTipoFiltro write setTipoFiltro;
    { Published declarations }
  end;

type
  TITFilterEdit = class(TEdit)
  private
    FAcceptString:String;
    FTipoFiltro : TGrupoTipoFiltro;
    { Private declarations }

  protected
    procedure KeyPress(Var Key:Char);override;
    procedure setAcceptString( value : String );
    procedure setTipoFiltro( value : TGrupoTipoFiltro );
    { Protected declarations }

  public
    constructor Create(AOwner:TComponent);override;
    { Public declarations }

  published
    property AcceptString:string read FAcceptString Write setAcceptString;
    property TipoFiltro : TGrupoTipoFiltro read FTipoFiltro write setTipoFiltro;
    { Published declarations }
  end;

  procedure Register;

implementation

//  TITDBFilterEdit
constructor TITDBFilterEdit.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  valida_Sistema(self);
  TipoFiltro := [tfAlfabetico]+[tfNumerico];
end;

procedure TITDBFilterEdit.setAcceptString( value : String );
begin
  if value <> FAcceptString then
  begin
    FAcceptString := value;
    if (FAcceptString='') then
      TipoFiltro := TipoFiltro - [tfCustom]
    else
      TipoFiltro := TipoFiltro + [tfCustom]
  end;
end;

procedure TITDBFilterEdit.setTipoFiltro( value : TGrupoTipoFiltro );
begin
  if value <> FTipoFiltro then
  begin
    FTipoFiltro := value;
    if not ( tfCustom in FTipoFiltro ) then
       FAcceptString := '';
  end;
end;

procedure TITDBFilterEdit.KeyPress(Var Key:Char);
begin
  if not Valida_Caracter(Key,FTipoFiltro,AcceptString) then
  begin
    key:=#0;
  end;
  inherited KeyPress(Key);
end;

//  TITFilterEdit
constructor TITFilterEdit.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  valida_Sistema(self);
  TipoFiltro := [tfAlfabetico]+[tfNumerico];
end;

procedure TITFilterEdit.setAcceptString( value : String );
begin
  if value <> FAcceptString then
  begin
    FAcceptString := value;
    if (FAcceptString='') then
      TipoFiltro := TipoFiltro - [tfCustom]
    else
      TipoFiltro := TipoFiltro + [tfCustom]
  end;
end;

procedure TITFilterEdit.setTipoFiltro( value : TGrupoTipoFiltro );
begin
  if value <> FTipoFiltro then
  begin
    FTipoFiltro := value;
    if not ( tfCustom in FTipoFiltro ) then
       FAcceptString := '';
  end;
end;

procedure TITFilterEdit.KeyPress(Var Key:Char);
begin
  if not Valida_Caracter(Key,FTipoFiltro,AcceptString) then
  begin
    key:=#0;
  end;
  inherited KeyPress(Key);
end;
//

procedure Register;
begin
  RegisterComponents('W3Style', [TITDBFilterEdit,TITFilterEdit]);
end;

end.
