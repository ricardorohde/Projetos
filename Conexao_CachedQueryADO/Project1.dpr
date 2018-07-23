program Project1;

uses
  FastMM4,
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Cad in 'Cad.pas' {fmCad},
  dtmPrincipal in 'dtmPrincipal.pas' {dmPrincipal: TDataModule},
  UTool2 in 'UTool2.pas',
  Cript in 'Cript.pas',
  uDeclara in 'uDeclara.pas',
  DbErro in 'DbErro.pas' {fmErro},
  modCOM003L in 'modCOM003L.pas' {dmCOM003L: TDataModule},
  modCOM002A in 'modCOM002A.pas' {dmCOM002A: TDataModule},
  COM007MA in 'COM007MA.pas' {fmCOM007MA},
  MDI in 'MDI.pas' {fmMDI},
  uInicializacao in 'uInicializacao.pas',
  PRE001MA in 'PRE001MA.pas' {fmPRE001MA};

{$R *.res}

begin
  Application.Initialize;
  AppTitle := 'Polaris';
  AppSystem := 'Polaris';
  AppMsgModo_Consulta := 'Processo "Batch" em andamento. Sistema dísponivel apenas para consulta. ';
  if InicializacaoOK then
  begin
     // Splash
//     fmSplash_PRE := TfmSplash_PRE.Create(Application);
//     fmSplash_PRE.Show;
//     fmSplash_PRE.Update;

     Application.Title := 'Polaris';
     Application.HelpFile := 'polaris.chm';
//     Application.CreateForm(TdmPRE001G, dmPRE001G);
//  Application.CreateForm(TdmPRE002H, dmPRE002H);
//  Application.CreateForm(TdmPRE004R, dmPRE004R);
//  Application.CreateForm(Tdm_Relatorio, dm_Relatorio);
//  Application.CreateForm(TfmMDIPRE, fmMDIPRE);
//  Application.CreateForm(TfmPRE272MA, fmPRE272MA);
//  Application.CreateForm(TfmPRE044PR_BC, fmPRE044PR_BC);
//  sleep(2000);
//     fmSplash_PRE.Hide;
//     fmSplash_PRE.Free;
     Application.CreateForm(TfmMDI, fmMDI);
  Application.Run;
  end;
end.
