unit ITMenuItem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus,utool,am2000menuitem,ITValida;

type

  TITMenuItem = class(TMenuItem2000)
  private
    FNomeChamada:String;
    FParametro   : Tstrings;
    FRotina : Pointer;
    procedure setNomeChamada( value : String );
    procedure setParametro( value : Tstrings );
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    procedure Click;override;
    constructor Create(AOwner:TComponent);override;
    destructor Destroy; override;

    property Rotina : Pointer read FRotina Write FRotina;
  published
    { Published declarations }
    property NomeChamada:string read FNomeChamada Write setNomeChamada;
    property Parametro:Tstrings read FParametro Write setParametro;
  end;

procedure Register;

implementation

constructor TITMenuItem.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  valida_Sistema(self);
  FParametro:=tstringlist.Create;
end;

destructor TITMenuItem.Destroy;
begin
  inherited destroy;
  FParametro.Free;
end;

procedure TITMenuItem.Click;
var i:integer;
  Type TRotina = procedure ( sender : TObject ) ;
begin
  inherited Click;
  if(TRIM(FNomeChamada) <> '' )then
  begin
    with CriaForm('fm'+FNomeChamada,application.MainForm) do
    begin
      for i:=0 to FParametro.Count-1 do
      begin
        AddParametro(FParametro.Names[i],FParametro.Values[FParametro.Names[i]]);
      end;
      ExibeForm;
    end;
  end
  else
  if Assigned(FRotina) then
     TRotina(FRotina)(application.MainForm);
//     TRotina(FRotina)(self);

end;

procedure TITMenuItem.setNomeChamada( value : String );
begin
  if value <> NomeChamada then
  begin
    FNomeChamada := value;
  end;
end;


procedure TITMenuItem.setParametro( value : Tstrings );
begin
  if value.text <> FParametro.Text then
  begin
    try
      begin
        FParametro.BeginUpdate;
        FParametro.Assign(Value);
      end;
    finally
      FParametro.EndUpdate;
    end;
  end;
end;

procedure Register;
begin
  RegisterComponents('W3Style', [TITMenuItem]);
end;

end.
