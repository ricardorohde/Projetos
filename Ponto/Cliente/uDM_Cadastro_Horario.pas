unit uDM_Cadastro_Horario;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect;

type
  TDM_Cadastro_Horario = class(TDataModule)
    DCOMCon_Horario: TDCOMConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_Cadastro_Horario: TDM_Cadastro_Horario;

implementation

{$R *.dfm}

end.
