program AppServerDCOM;

uses
  Forms,
  uFrmMain in 'uFrmMain.pas' {FrmMain},
  AppServerDCOM_TLB in 'AppServerDCOM_TLB.pas',
  uRDM in 'uRDM.pas' {RDM: TRemoteDataModule} {RDM: CoClass};

{$R *.TLB}

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
