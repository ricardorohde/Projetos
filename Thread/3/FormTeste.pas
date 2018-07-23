unit FormTeste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Tread;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  m : TLoadingProgress;
begin
  m := TLoadingProgress.Create;
  try
    m.Executar;
  finally
    FreeAndNil(m);
  end;
end;

end.
