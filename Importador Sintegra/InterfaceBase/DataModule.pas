unit DataModule;

interface

uses MaskUtils, Variants, 
  uDadosConexao, 
  uADStanIntf, uADStanOption, uADStanParam,
  uADStanError, uADDatSManager, uADPhysIntf, uADDAptIntf, uADStanAsync,
  uADDAptManager, uADCompDataSet, uADCompClient,

  SysUtils, Classes, DB, Dialogs, Forms, tbTableNew, IniFiles, uADGUIxIntf,
  uADStanDef, uADStanPool, uADPhysManager, uADGUIxFormsWait,
  uADGUIxFormsfScript, uADGUIxFormsfAsync, uADGUIxFormsfLogin,
  uADGUIxFormsfError, uADCompGUIx, uADPhysPG, DBClient, Provider, PhQuery;

type
  TDataModule1 = class(TDataModule)
    ADConnection1: TADConnection;
    ADPhysPgDriverLink1: TADPhysPgDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure BeforeDestruction; override;
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

procedure TDataModule1.BeforeDestruction;
begin
  AdConnection1.Connected := False;
  inherited;
end;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
var
  cAux: String;
  ArqIni: TIniFile;
begin

  ArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + '\phoenix_pg.ini');

  AdConnection1.Params.Clear;
  AdConnection1.Params.Values['Database'] := ArqIni.ReadString('Connection', 'Database', '');
  AdConnection1.Params.Values['User_Name']:= ArqIni.ReadString('Connection', 'User_Name', '');
  AdConnection1.Params.Values['Password'] := ArqIni.ReadString('Connection', 'Password', '');
  AdConnection1.Params.Values['Server']   := ArqIni.ReadString('Connection', 'Server',  '');
  AdConnection1.Params.Values['Port']     := ArqIni.ReadString('Connection', 'Porta',  '');
  AdConnection1.Params.Values['DriverID'] := 'PG';

  cAux := ArqIni.ReadString('Client', 'Client DLL name', '');
  if cAux = '' then
    cAux := ExtractFilePath(Application.ExeName) + '\libpq.dll';

  AdConnection1.Params.Add('Client DLL name =' + cAux);
  ADPhysPgDriverLink1.VendorLib := cAux;
  AdConnection1.Connected := True;
  ArqIni.Free;
end;

end.
