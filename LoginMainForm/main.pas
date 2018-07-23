unit main;

{

Display a LogIn Dialog Before the Main Form of an Application is Created

http://delphi.about.com/od/windowsshellapi/a/password_login.htm

}


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TMainForm = class(TForm)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

end.
