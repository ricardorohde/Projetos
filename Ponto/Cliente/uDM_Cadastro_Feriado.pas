unit uDM_Cadastro_Feriado;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect;

type
  TDM_Cadastro_Feriado = class(TDataModule)
    DCOMCon_Feriado: TDCOMConnection;
  private
    { Private declarations }
  public
    procedure AfterConstruction; override;
    { Public declarations }
    
  end;

var
  DM_Cadastro_Feriado: TDM_Cadastro_Feriado;

implementation

{$R *.dfm}

{ TDM_Cadastro_Feriado }

procedure TDM_Cadastro_Feriado.AfterConstruction;
begin
  inherited;
  DCOMCon_Feriado.ServerName := 'ServidorPonto.RDM_Feriado';
  DCOMCon_Feriado.Connected  := True;
end;

end.
