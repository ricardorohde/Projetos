unit DBFilterEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls;

type
  TTipoFiltro = ( tfAlfabetico,tfAcentuado,tfNumerico,tfEspeciais,tfCustom,tfEspaco);
  TGrupoTipoFiltro = set of TTipoFiltro;

  TDBFilterEdit = class(TDBEdit)
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

const
  csAlfabetico ='ABCDEFGHIJKLMNOPQRSTUVXZWYabcdefghijklmnopqrstuvxzwy';
  csEspeciais  ='''"!@#$%&*()_-+={}[]?/\|<>,.:;';
  csAcentuado  = '·ÈÌÛ˙ ¡…Õ”⁄ ‡ËÏÚ˘ ¿»Ã“Ÿ ‚ÍÓÙ˚ ¬ Œ‘€ „ı √’ ‰ÎÔ¸ˆ ƒÀœ÷‹ Á «';
  csNumerico   ='1234567890';
  csEspaco     =' ';

procedure Register;

implementation

constructor TDBFilterEdit.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  TipoFiltro := [tfAlfabetico]+[tfNumerico];
end;

procedure TDBFilterEdit.setAcceptString( value : String );
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

procedure TDBFilterEdit.setTipoFiltro( value : TGrupoTipoFiltro );
begin
  if value <> FTipoFiltro then
  begin
    FTipoFiltro := value;
    if not ( tfCustom in FTipoFiltro ) then
       FAcceptString := '';
  end;
end;

procedure TDBFilterEdit.KeyPress(Var Key:Char);
var bCarcter_valido:boolean;
begin
  bCarcter_valido:=false;
  if ((key in[chr(vk_return),chr(vk_escape),chr(vk_back)])) then
  begin
    bCarcter_valido:=true;
  end
  else
  begin
    if ( tfCustom in FTipoFiltro ) and (bCarcter_valido=false) then
    begin
       if(pos(key, AcceptString) <> 0 )then
          bCarcter_valido:=true;
    end;

    if ( tfEspeciais in FTipoFiltro ) and (bCarcter_valido=false) then
    begin
       if(pos(key, csEspeciais) <> 0 )then
          bCarcter_valido:=true;
    end;

    if( tfAlfabetico in FTipoFiltro) and (bCarcter_valido=false) then
    begin
      if(pos(key,csAlfabetico) <> 0 )then
         bCarcter_valido:=true;
    end;

    if( tfAcentuado in FTipoFiltro) and (bCarcter_valido=false) then
    begin
      if(pos(key,csAcentuado) <> 0 )then
         bCarcter_valido:=true;
    end;

    if( tfNumerico in FTipoFiltro) and (bCarcter_valido=false) then
    begin
      if(pos(key,csNumerico) <> 0 )then
         bCarcter_valido:=true;
    end;

    if( tfEspaco in FTipoFiltro) and (bCarcter_valido=false) then
    begin
      if(pos(key,csEspaco) <> 0 )then
         bCarcter_valido:=true;
    end;

  end;

  if not bCarcter_valido then
  begin
   key:=#0;
  end;
  inherited KeyPress(Key);
end;

procedure Register;
begin
  RegisterComponents('W3Style', [TDBFilterEdit]);
end;

end.
