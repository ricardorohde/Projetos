unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  teste = class
    destructor destroy;virtual;
  end;

  teste1 = class(teste)
    destructor destroy; override;
  end;


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

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  lteste: teste;
begin
  lteste:= teste1.Create;
  try
  finally
    lteste.destroy;
  end;
end;

{ teste }

destructor teste.destroy;
begin
  showmessage('destroi da classe base');
end;


{ teste1 }

destructor teste1.destroy;
begin
  showmessage('destruo a classe filha');
  inherited destroy;
end;

end.

