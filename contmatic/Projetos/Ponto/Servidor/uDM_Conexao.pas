unit uDM_Conexao;

interface

uses
  SysUtils, Classes, uADStanIntf, uADStanOption, uADStanError, uADGUIxIntf,
  uADPhysIntf, uADStanDef, uADStanPool, uADStanAsync, uADPhysManager,
  uADPhysPG, DB, uADCompClient;

type
  TDM_Conexao = class(TDataModule)
    con: TADConnection;
    ADPhysPgDriverLink1: TADPhysPgDriverLink;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_Conexao: TDM_Conexao;

implementation

{$R *.dfm}

end.
