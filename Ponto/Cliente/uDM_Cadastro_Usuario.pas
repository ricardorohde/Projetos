unit uDM_Cadastro_Usuario;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect;

type
  TDM_Cadastro_Usuario = class(TDataModule)
    DCOMCon_Usuario: TDCOMConnection;
    cds_Usuario: TClientDataSet;
    cds_UsuarioID_USUARIO: TIntegerField;
    cds_UsuarioUSUARIO: TWideStringField;
    cds_UsuarioSENHA: TWideStringField;
    cds_UsuarioCODIGO_EXTERNO: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_Cadastro_Usuario: TDM_Cadastro_Usuario;

implementation

{$R *.dfm}

end.
