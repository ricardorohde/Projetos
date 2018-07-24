unit ITFilter;

interface

uses Windows;

type
  TTipoFiltro = ( tfAlfabetico,tfAcentuado,tfNumerico,tfEspeciais,tfCustom,tfEspaco);
  TGrupoTipoFiltro = set of TTipoFiltro;


function Valida_Caracter(pKey:Char;pTipoFiltro : TGrupoTipoFiltro;pAcceptString:string):boolean;

const
  csAlfabetico ='ABCDEFGHIJKLMNOPQRSTUVXZWYabcdefghijklmnopqrstuvxzwy';
  csEspeciais  ='''"!@#$%&*()_-+={}[]?/\|<>,.:;';
  csAcentuado  = 'áéíóú ÁÉÍÓÚ àèìòù ÀÈÌÒÙ âêîôû ÂÊÎÔÛ ãõ ÃÕ äëïüö ÄËÏÖÜ ç Ç';
  csNumerico   ='1234567890';
  csEspaco     =' ';

implementation

function Valida_Caracter(pKey:Char;pTipoFiltro : TGrupoTipoFiltro;pAcceptString:string):boolean;
var bCarcter_valido:boolean;
begin
  bCarcter_valido:=false;

  if ((pkey in[chr(vk_return),chr(vk_escape),chr(vk_back),chr(vk_control)])) then
  begin
    bCarcter_valido:=true;
  end
  else
  begin
    if ( tfCustom in pTipoFiltro ) and (bCarcter_valido=false) then
    begin
       if(pos(pkey, pAcceptString) <> 0 )then
          bCarcter_valido:=true;
    end;

    if ( tfEspeciais in pTipoFiltro ) and (bCarcter_valido=false) then
    begin
       if(pos(pkey, csEspeciais) <> 0 )then
          bCarcter_valido:=true;
    end;

    if( tfAlfabetico in pTipoFiltro) and (bCarcter_valido=false) then
    begin
      if(pos(pkey,csAlfabetico) <> 0 )then
         bCarcter_valido:=true;
    end;

    if( tfAcentuado in pTipoFiltro) and (bCarcter_valido=false) then
    begin
      if(pos(pkey,csAcentuado) <> 0 )then
         bCarcter_valido:=true;
    end;

    if( tfNumerico in pTipoFiltro) and (bCarcter_valido=false) then
    begin
      if(pos(pkey,csNumerico) <> 0 )then
         bCarcter_valido:=true;
    end;

    if( tfEspaco in pTipoFiltro) and (bCarcter_valido=false) then
    begin
      if(pos(pkey,csEspaco) <> 0 )then
         bCarcter_valido:=true;
    end;
    if(bCarcter_valido=false) then
    begin
      if(pkey = #3)then
         bCarcter_valido:=true;
    end;
    if(bCarcter_valido=false) then
    begin
      if(pkey = #22)then
         bCarcter_valido:=true;
    end;


  end;

  result:=bCarcter_valido;
end;

end.
