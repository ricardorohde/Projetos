unit uDM_Cadastro_Municipio;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect;

type
  TDM_Cadastro_Municipio = class(TDataModule)
    DCOMCon_Municipio: TDCOMConnection;
  private
    { Private declarations }
  public
    procedure AfterConstruction; override;
    { Public declarations }

  end;

var
  DM_Cadastro_Municipio: TDM_Cadastro_Municipio;

implementation

{$R *.dfm}

{ TDM_Municipio }

procedure TDM_Cadastro_Municipio.AfterConstruction;
begin
  inherited;
  DCOMCon_Municipio.ServerName := 'ServidorPonto.RDM_Municipio';
  DCOMCon_Municipio.Connected  := True;
end;

end.
