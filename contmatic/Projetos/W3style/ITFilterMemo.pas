unit ITFilterMemo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls,ITFilter,ITValida;

type
  TITDBFilterMemo = class(TDBMemo)
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
    property CharCase;
    property WantReturns;
    property AcceptString:string read FAcceptString Write setAcceptString;
    property TipoFiltro : TGrupoTipoFiltro read FTipoFiltro write setTipoFiltro;
    { Published declarations }
  end;

type
  TITFilterMemo = class(TMemo)
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
    property CharCase;
    property AcceptString:string read FAcceptString Write setAcceptString;
    property TipoFiltro : TGrupoTipoFiltro read FTipoFiltro write setTipoFiltro;
    { Published declarations }
  end;

  procedure Register;

implementation

//  TITDBFilterMemo
constructor TITDBFilterMemo.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  valida_Sistema(self);
  TipoFiltro := [tfAlfabetico]+[tfNumerico];
end;

procedure TITDBFilterMemo.setAcceptString( value : String );
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

procedure TITDBFilterMemo.setTipoFiltro( value : TGrupoTipoFiltro );
begin
  if value <> FTipoFiltro then
  begin
    FTipoFiltro := value;
    if not ( tfCustom in FTipoFiltro ) then
       FAcceptString := '';
  end;
end;

procedure TITDBFilterMemo.KeyPress(Var Key:Char);
begin
  if ( Key <> #3 ) and //ctrl+c
     ( Key <> #22 ) and //ctrl+v
     ( Key <> #24 ) and //ctrl+x
      (not Valida_Caracter(Key,FTipoFiltro,AcceptString) )then
  begin
    key:=#0;
  end;
  inherited KeyPress(Key);
end;

//  TITFilterEdit
constructor TITFilterMemo.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  valida_Sistema(self);
  TipoFiltro := [tfAlfabetico]+[tfNumerico];
end;

procedure TITFilterMemo.setAcceptString( value : String );
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

procedure TITFilterMemo.setTipoFiltro( value : TGrupoTipoFiltro );
begin
  if value <> FTipoFiltro then
  begin
    FTipoFiltro := value;
    if not ( tfCustom in FTipoFiltro ) then
       FAcceptString := '';
  end;
end;

procedure TITFilterMemo.KeyPress(Var Key:Char);
begin
  if ( Key <> #3 ) and //ctrl+c
     ( Key <> #22 ) and //ctrl+v
     ( Key <> #24 ) and //ctrl+x
      (not Valida_Caracter(Key,FTipoFiltro,AcceptString) )then
  begin
    key:=#0;
  end;
  inherited KeyPress(Key);
end;
//

procedure Register;
begin
  RegisterComponents('W3Style', [TITDBFilterMemo,TITFilterMemo]);
end;

end.
