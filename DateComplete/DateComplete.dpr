program DateComplete;

uses
  Forms,
  uDateComplete in 'uDateComplete.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
