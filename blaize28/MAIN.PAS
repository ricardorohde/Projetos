unit Main;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls;

type
  TFrmMain = class(TForm)
    GrpProtection: TGroupBox;
    GrpHandlerTest: TGroupBox;
    GrpCustom: TGroupBox;
    PnlCustomTest: TPanel;
    EdtSum: TEdit;
    EdtNumItems: TEdit;
    EdtAverage: TEdit;
    BtnAverage: TButton;
    Label1: TLabel;
    Label2: TLabel;
    BtnNoProt: TButton;
    BtnMinProt: TButton;
    BtnCompProt: TButton;
    LblClickHere: TLabel;
    procedure LblClickHereClick(Sender: TObject);
    procedure BtnNoProtClick(Sender: TObject);
    procedure BtnMinProtClick(Sender: TObject);
    procedure BtnCompProtClick(Sender: TObject);
    procedure BtnAverageClick(Sender: TObject);
    procedure LblClickHereMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    MousePt : TPoint;
    procedure HitTest;
  public
    { Public declarations }
  end;

  EMouseClickError = class( Exception );


var
  FrmMain: TFrmMain;

implementation

{$R *.DFM}


procedure ConvertError(const Message: string);
begin
  raise EConvertError.Create(Message);
end;


function Str2Int(const S: string): Longint;
var
  E: Integer;
begin
  Val(S, Result, E);
  if E <> 0 then ConvertError(FmtLoadStr(65408, [S]));
end;






procedure TFrmMain.BtnNoProtClick(Sender: TObject);
var
  Num       : Integer;
  NumStr    : string;
  WastedPtr : Pointer;
begin
  GetMem( WastedPtr, 1024 );             { Allocate some memory }
  NumStr := '23b';                     { Invalid Integer String }
               { StrToInt will raise an EConvertError exception }
  Num := StrToInt( NumStr );

                     { Since nothing handles the exception, the }
                 {  following two statements never get executed }
  MessageDlg( 'About to Free Memory', mtInformation, [mbOk], 0 );
  FreeMem( WastedPtr, 1024 );
end;

procedure TFrmMain.BtnMinProtClick(Sender: TObject);
var
  Num       : Integer;
  NumStr    : string;
  WastedPtr : Pointer;
begin
  GetMem( WastedPtr, 1024 );             { Allocate some memory }
  NumStr := '23b';                     { Invalid Integer String }

        { StrToInt will still raise an EConvertError exception. }
    { But this time, since it is part of a try...finally block, }
                   { the memory allocated above can be released }
  try
    Num := StrToInt( NumStr );
  finally
    MessageDlg( 'About to Free Memory', mtInformation, [mbOk], 0 );
    FreeMem( WastedPtr, 1024 );
  end;
    { Note that after the 'About to Free Memory' message box is }
      { displayed, the 'Invalid Integer...' message box appears }
end;


{= In this final version of the resource protection example,   =}
{= we take things to the completion by adding an exception     =}
{= handler to handle the EConvertError exception such that the =}
{= 'Invalid Integer...' error message is no longer displayed.  =}

procedure TFrmMain.BtnCompProtClick(Sender: TObject);
var
  Num       : Integer;
  NumStr    : string;
  WastedPtr : Pointer;
begin
  GetMem( WastedPtr, 1024 );             { Allocate some memory }
  NumStr := '23b';                     { Invalid Integer String }

  try        { Since try... blocks are blocks, we can nest them }
    try
      Num := StrToInt( NumStr );
    except
      on EConvertError do      { Handle EConvertError exception }
        Num := 0;
    end;
  finally
    MessageDlg( 'About to Free Memory', mtInformation, [mbOk], 0 );
    FreeMem( WastedPtr, 1024 );
  end;
end;

procedure TFrmMain.BtnAverageClick(Sender: TObject);
var
  Sum, Num  : Integer;
  Average   : Real;
  AvgStr    : string;
  Undefined : Boolean;
begin
  Undefined := False;  { Undefined is True if Calculation Fails }
  try
    Sum := Str2Int( EdtSum.Text );    { Convert Text to Number }
{    Num := StrToInt( EdtNumItems.Text );
    Average := Sum / Num;}
  except
    on EZeroDivide do        { If Num = 0 then exception raised }
      Undefined := True;

    on EConvertError do
    begin
      MessageDlg( 'Invalid Integer.  Please try again.',
                  mtError, [mbOk], 0 );
      Exit;
    end;
  end; { except }
  if Undefined then
    EdtAverage.Text := 'Undefined'
  else
  begin
    Str( Average:8:2, AvgStr );     { Convert Average to String }
    EdtAverage.Text := AvgStr;  { Set text of control to AvgStr }
  end;
end;



procedure TFrmMain.HitTest;
var
  SMsg : string;
begin
  with MousePt do
  begin
     { Test to see if mouse was clicked on the word 'Exception' }
    if ( X >= 185 ) and ( X <= 270 ) and
       ( Y >= 5 ) and ( Y <= 18 ) then
    begin
                    { If user clicked on 'Exception', raise one }
      SMsg := 'You Clicked on Exception';
{      raise EMouseClickError.Create( SMsg );}
{       raise EConvertError.Create( SMsg );}
       ConvertError( SMsg );
    end;
  end;
end;


procedure TFrmMain.LblClickHereClick(Sender: TObject);
begin
  try
    HitTest;
  except
    on EConvertError do
      MessageDlg( 'Look, Mom!  I''m Handling EMouseClickError',
                  mtInformation, [mbOk], 0 );
{
    on EMouseClickError do
      MessageDlg( 'Look, Mom!  I''m Handling EMouseClickError',
                  mtInformation, [mbOk], 0 );}
  end;
end;


procedure TFrmMain.LblClickHereMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  MousePt := Point( X, Y );
end;

end.
