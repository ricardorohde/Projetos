program Servidor;

uses
  Forms,
  uServidor in 'uServidor.pas' {Form1},
  Servidor_TLB in 'Servidor_TLB.pas',
  uDataSnapServer in 'uDataSnapServer.pas' {DataSnapServer: TRemoteDataModule} {DataSnapServer: CoClass};

{$R *.TLB}

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
