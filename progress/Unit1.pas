unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Unit2;

type
  TForm1 = class(TForm)
    ProgressBar1: TProgressBar;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    Thread : ThreadProgress;
  public
    { Public declarations }
    
  end;

//  TProgressContinuo = class
//    private
//
//    public
//
//  end;
var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
//  Button2.Enabled := True;
//  Button1.Enabled := False;
  ProgressBar1.Position := 0;
  Thread.Suspend;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i : Integer;
begin
  Thread := ThreadProgress.Create(True);

  Thread.Progress        := ProgressBar1;
  Thread.FreeOnTerminate := true;
  Thread.Priority        := tpNormal;
  Thread.Resume;

//  i := 0;
//  while not Thread.Suspended do
//  begin
//    while i <= 100 do
//    begin
//      Label1.Caption := 'Aguarde... (' + IntToStr(i) + ')';
//      Label1.Update;
//      if i = 100 then
//        i := 0;
//      Inc(i);
//    end;
//  end;

//  Button2.Enabled := False;
//  Button1.Enabled := True;
end;

end.
