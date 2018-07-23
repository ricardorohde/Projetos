unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    pb1: TProgressBar;
    btn1: TButton;
    tmr1: TTimer;
    lst1: TListBox;
    btn2: TButton;
    edt1: TEdit;
    lst2: TListBox;
    btn3: TButton;
    procedure btn1Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  i: Integer;
begin
//  tmr1.Enabled := not tmr1.Enabled;

  pb1.Max := lst1.Count;

  lst2.Clear();

  for i := 0 to lst1.Count - 1 do
    begin
      lst2.Items.Add(lst1.Items.Strings[i]);
      pb1.Position := pb1.Position + 1;
      Self.Repaint();
      Sleep(200);
    end;

  pb1.Position := 0;
end;

procedure TForm1.tmr1Timer(Sender: TObject);
begin
  pb1.Position := pb1.Position + 1;

  if pb1.Position >= 100 then
    pb1.Position := 0;
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
  lst1.Items.Add(edt1.Text);
  edt1.Text := '';
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
  lst1.Clear();
end;

end.
