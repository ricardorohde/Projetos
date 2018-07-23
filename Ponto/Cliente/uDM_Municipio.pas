unit uDM_Municipio;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect;

type
  TDM_Municipio = class(TDataModule)
    DCOMCon_Municipio: TDCOMConnection;
  private
    { Private declarations }
  public
    procedure AfterConstruction; override;
    { Public declarations }

  end;

var
  DM_Municipio: TDM_Municipio;

implementation

{$R *.dfm}

{ TDM_Municipio }

procedure TDM_Municipio.AfterConstruction;
begin
  inherited;
  DCOMCon_Municipio.ServerName := 'ServidorPonto.RDM_Municipio';
  DCOMCon_Municipio.Connected  := True;
end;

end.
