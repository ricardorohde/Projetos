program pVersao;

uses
  ExceptionLog,
  Forms,
  Versao in 'Versao.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Mudar a vers�o';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
