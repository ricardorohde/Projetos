unit uDM_Cadastro_Empresa;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect, EMSTable;

type
  TDM_Cadastro_Empresa = class(TDataModule)
    DCOMCon_Empresa: TDCOMConnection;
  private
    { Private declarations }
  public
    procedure AfterConstruction; override;
    { Public declarations }

  end;

var
  DM_Cadastro_Empresa: TDM_Cadastro_Empresa;

implementation

{$R *.dfm}

{ TDM_Cadastro_Empresa }

procedure TDM_Cadastro_Empresa.AfterConstruction;
begin
  inherited;
  DCOMCon_Empresa.ServerName := 'ServidorPonto.RDM_EMPRESA';
  DCOMCon_Empresa.Connected  := True;
end;

end.