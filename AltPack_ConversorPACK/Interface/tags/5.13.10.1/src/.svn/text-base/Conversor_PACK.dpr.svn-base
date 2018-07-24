program Conversor_PACK;

uses
  FastMM4,
  ExceptionLog,
  Forms,
  uPrincipal in 'uPrincipal.pas' {frmImportador_Alterdata},
  uSplashScreen in 'uSplashScreen.pas' {SplashScreen};

{$R *.res}

begin
  //Application.Initialize;
  Application.CreateForm(TfrmImportador_Alterdata, frmImportador_Alterdata);
  //Application.CreateForm(TSplashScreen, SplashScreen);
  SplashScreen := TSplashScreen.create(application);
  SplashScreen.Show;
  SplashScreen.ShowSplashScreen;
  Application.Run;
end.
