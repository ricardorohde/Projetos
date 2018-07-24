program Servidor;

uses
  Forms,
  uServidor in 'uServidor.pas' {Form1},
  Servidor_TLB in 'Servidor_TLB.pas',
  ServerDataSnap in 'ServerDataSnap.pas' {SERVER: TRemoteDataModule} {SERVER: CoClass};

{$R *.TLB}

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
