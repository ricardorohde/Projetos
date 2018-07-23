unit Unit1;


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
   ChronometerState=(csRunning,csStopped,csReset);

  TForm1 = class(TForm)
    Display: TLabel;
    btnstart: TButton;
    btnstop: TButton;
    btnReset: TButton;
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnstartClick(Sender: TObject);
    procedure btnstopClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
  private
    { Private declarations }
    State:ChronometerState;
    fTime:TTime;
    fOldTime:TTime;
    fInitialTime:TTime;
    procedure ChangeState(vState:ChronometerState);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.ChangeState(vState: ChronometerState);
begin
   State:=vState;

   case State of

      csRunning:
         Self.Color:=clGreen;
      csStopped:
         Self.Color:=clRed;
      csReset:
         Self.Color:=clBlue;
   end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   ChangeState(csReset);
   fTime:=0;
   fInitialTime:=0;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
   fTime:=fInitialTime+Now-fOldTime;
   Display.Caption:=FormatDateTime('hh:mm:ss:zz',fTime);
end;

procedure TForm1.btnstartClick(Sender: TObject);
begin

   case(State)of
      csStopped:
         fInitialTime:=fTime;
      csReset:
         fInitialTime:=0;
   end;

   fOldTime:=Now;

   Timer1.Enabled:=True;
   ChangeState(csRunning);
end;

procedure TForm1.btnstopClick(Sender: TObject);
begin
   Timer1.Enabled:=False;
   ChangeState(csStopped);
end;

procedure TForm1.btnResetClick(Sender: TObject);
begin
   if(State=csStopped)then
   begin
      fTime:=0;
      fInitialTime:=0;

      Display.Caption:=FormatDateTime('hh:mm:ss:zzz',fTime);

      ChangeState(csReset);
   end;
end;

end.
