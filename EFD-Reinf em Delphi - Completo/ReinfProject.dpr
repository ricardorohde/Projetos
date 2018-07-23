program ReinfProject;

uses
  Forms,
  Reinf in 'Reinf.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
//  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
