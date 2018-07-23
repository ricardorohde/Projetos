unit uServidor;

interface

  type
  TServidor = Class
    private
    public
      procedure Execute;
  end;

implementation

uses usocket, Forms;

{ TServidor }

procedure TServidor.Execute;
begin
  //frmPrincipal := TfrmPrincipal.Create(nil);
  //frmPrincipal.Show;
end;

end.
