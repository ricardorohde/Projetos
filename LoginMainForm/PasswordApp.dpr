program PasswordApp;

uses
  Forms,
  main in 'main.pas' {MainForm},
  login in 'login.pas' {LoginForm};

{$R *.res}

begin
  if TLoginForm.Execute then
  begin
    Application.Initialize;
    Application.CreateForm(TMainForm, MainForm);
    Application.Run;
  end
  else
  begin
    Application.MessageBox('You are not authorized to use the application. The password is "delphi".', 'Password Protected Delphi application');
  end;
end.
