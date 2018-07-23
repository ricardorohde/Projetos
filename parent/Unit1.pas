unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
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

uses Unit2;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form2 := TForm2.Create(nil);
  Form2.Show;
  Form2.Parent := Panel2;
//  WinExec('calc.exe',SW_NORMAL);
//  Windows.SetParent( FindWindow( nil, 'calculadora' ),panel2.handle ) ;
end;

end.
