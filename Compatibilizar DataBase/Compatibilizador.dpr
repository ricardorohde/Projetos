program Compatibilizador;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  udmMain in 'udmMain.pas' {dmMain: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmMain, dmMain);
  Application.Run;
end.
