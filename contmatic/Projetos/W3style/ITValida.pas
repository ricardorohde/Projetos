unit ITValida;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, dbTables,  db,dialogs;

  Procedure Valida_Sistema( Sender : TComponent );


implementation

Procedure Valida_Sistema( Sender : TComponent );
const vaSistemas: array[0..4] of String = ( 'Polaris',
                                            'Sisinte',
                                            'Realty',
                                            'RP2000',
                                            'Cerelab' );
//var i : integer;
//    vbOk : boolean;
begin
{  if (not ( csDesigning in sender.ComponentState ) ) and
     (not ( csDesigning in sender.Owner.ComponentState ) ) then
  begin
    i:= low(vaSistemas);
    vbOk := false;
    while (i <= high(vaSistemas) ) and ( not vbOK) do
    begin
      if (uppercase(Application.Title) = uppercase(vaSistemas[i])) then
        vbOk := true
      else
        inc(i);
    end;

    if not vbOK then
    begin
      MessageBeep(MB_ICONASTERISK);
      Showmessage('O componente ' + sender.ClassName + ' não está disponível para este Sistema!');
      application.Terminate;
    end;
  end;}
end;

end.
