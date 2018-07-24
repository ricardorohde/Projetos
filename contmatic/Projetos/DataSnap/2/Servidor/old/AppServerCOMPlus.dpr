library AppServerCOMPlus;

uses
  ComServ,
  AppServerCOMPlus_TLB in 'AppServerCOMPlus_TLB.pas',
  uRDM in 'uRDM.pas' {RDM: TMtsDataModule} {RDM: CoClass};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
