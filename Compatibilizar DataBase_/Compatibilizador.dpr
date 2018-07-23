program Compatibilizador;

uses
  Forms,
  uMain in 'uMain.pas' {frmMain},
  udmMain in 'udmMain.pas' {dmMain: TDataModule};

{$R *.res}

begin
  Application.Initialize;
//  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
