unit ItDatabase;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ITValida;

type
  TItDatabase = class(TDatabase)
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure SetConnected(Value: Boolean); override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);override;
  published
    { Published declarations }
  end;

procedure Register;

implementation

constructor TItDatabase.Create(AOwner: TComponent);
begin
  inherited;
  valida_Sistema(self);
end;

procedure TItDatabase.SetConnected(Value: Boolean);
begin
   inherited;
   StreamedConnected := false;
end;

procedure Register;
begin
  RegisterComponents('W3Style', [TItDatabase]);
end;

end.
