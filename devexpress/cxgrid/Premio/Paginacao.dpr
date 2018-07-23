program Paginacao;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  dtmPrincipal in 'dtmPrincipal.pas' {dmPrincipal: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
