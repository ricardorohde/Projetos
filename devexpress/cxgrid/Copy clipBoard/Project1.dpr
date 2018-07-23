program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Gerar_CSV in 'Gerar_CSV.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
