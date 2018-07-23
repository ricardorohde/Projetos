unit uDM_Cadastro_Funcionario;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect, EMSTable;

type
  TDM_Cadastro_Funcionario = class(TDataModule)
    DCOMCon_Funcionario: TDCOMConnection;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AfterConstruction; override;
  end;

var
  DM_Cadastro_Funcionario: TDM_Cadastro_Funcionario;

implementation

{$R *.dfm}

{ TDM_Cadastro_Funcionario }

procedure TDM_Cadastro_Funcionario.AfterConstruction;
begin
  inherited;
  DCOMCon_Funcionario.ServerName := 'ServidorPonto.RDM_Funcionario';
  DCOMCon_Funcionario.Connected  := True;
end;

end.
