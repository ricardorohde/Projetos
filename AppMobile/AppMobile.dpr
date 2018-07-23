program AppMobile;

uses
  SvcMgr,
  SysUtils,
  uMain in 'uMain.pas' {srvMobile: TService},
  uTypes in 'uTypes.pas',
  uLibrary in 'uLibrary.pas',
  uConfigure in 'uConfigure.pas' {frmConfigure},
  uDSClientProxy in 'uDSClientProxy.pas';

{$R *.RES}

begin
  // Windows 2003 Server requires StartServiceCtrlDispatcher to be
  // called before CoRegisterClassObject, which can be called indirectly
  // by Application.Initialize. TServiceApplication.DelayInitialize allows
  // Application.Initialize to be called from TService.Main (after
  // StartServiceCtrlDispatcher has been called).
  //
  // Delayed initialization of the Application object may affect
  // events which then occur prior to initialization, such as
  // TService.OnCreate. It is only recommended if the ServiceApplication
  // registers a class object with OLE and is intended for use with
  // Windows 2003 Server.
  //
  // Application.DelayInitialize := True;
  //

  if LowerCase(ParamStr(1)) = '/configure' then
    begin
      try
        frmConfigure := TfrmConfigure.Create(Nil);
        frmConfigure.ShowModal;
      finally
        FreeAndNil(frmConfigure);
      end;
  end;

  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;
  Application.CreateForm(TsrvMobile, srvMobile);
  Application.Run;

end.
