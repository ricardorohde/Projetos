program ProgressMessage;

uses
  Forms,
  Classes,
  Tread in 'Tread.pas',
  FormTeste in 'FormTeste.pas' {Form1};

{$R *.res}
begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
