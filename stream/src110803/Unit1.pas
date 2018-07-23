unit Unit1;

{
  Article___________________________________________________________
  Streams, streams, ... TStream

  http://delphi.about.com/library/weekly/aa110803a.htm

  A stream is what it's name suggests: a flowing "river of data".
  A stream has a beginning, an end, and you're always somewhere in
  between of these two points. Learn about using the TStream class
  in Delphi: how to use stream objects to read from, write to, or
  copy information stored in a particular medium.
}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, ExtCtrls, IniFiles;

const
  FmtRec = '%6.6d %1s %4.4d %20s';  // record formatter
type
  // just some testrecord
  TTestRec = record
    IntField  : integer;
    CharField : char;
    ByteField : byte;
    StrField  : string[20];
  end;
  PTTestRec = ^TTestRec;

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    ProcessMs1: TButton;
    Ms1SaveToFile: TButton;
    Ms1LoadFromFile: TButton;
    btnLoadFs: TButton;
    Edit3: TEdit;
    StreamWalkBut: TSpinButton;
    StaticText2: TStaticText;
    Edit4: TEdit;
    StaticText3: TStaticText;
    Memo2: TMemo;
    StaticText4: TStaticText;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ProcessMs1Click(Sender: TObject);
    procedure Ms1SaveToFileClick(Sender: TObject);
    procedure Ms1LoadFromFileClick(Sender: TObject);
    procedure btnLoadFsClick(Sender: TObject);
    procedure StreamWalkButDownClick(Sender: TObject);
    procedure StreamWalkButUpClick(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    Ms1,
    Ms2     : TmemoryStream;
    procedure FillStream( AStream: TStream; N: integer );
    procedure ShowStreamData(AStream: TStream;
                             ABuffer: TStrings;
                             ID : string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

const
  IniFileName: string = 'example.ini';

{$R *.DFM}

//==========================================
procedure TForm1.FormCreate(Sender: TObject);
begin
  Ms1 := TmemoryStream.Create;
  Ms2 := TMemoryStream.Create;
end;

//===========================================
procedure TForm1.FormDestroy(Sender: TObject);
begin
 Ms1.Free;
 Ms2.Free;
end;


{-----------------------------------------}
{ general procedure to show contents of   }
{ streams populated with TTestRec records }
{-----------------------------------------}
procedure TForm1.ShowStreamData(AStream: TStream;
                                ABuffer: TStrings;
                                ID: string);
var
  TestRec : TTestRec;
begin
  ABuffer.BeginUpdate;  // this speeds up things dramatically!
  ABuffer.Clear;
  ABuffer.Add( 'Contents of : ' + ID );
  ABuffer.Add( 'Class       : ' + AStream.ClassName );
  ABuffer.Add( 'Size is     : ' +  IntToStr(AStream.Size) + ' bytes' );
  //
  AStream.Position := 0;
  while AStream.Position < AStream.Size do
  begin
    AStream.Read( TestRec, SizeOf(TestRec) );
    with TestRec do
      ABuffer.Add( Format( FmtRec, [IntField, CharField,ByteField, StrField]));
  end;
  ABuffer.EndUpdate;
end;


{----------------------------------------}
{  Fill any stream with N records        }
{----------------------------------------}
procedure TForm1.FillStream( AStream: TStream; N: integer);
var
 i : integer;
 TestRec : TTestRec;
begin
   { important note
     --------------
     Streams are persistent, so if , say, 1000 records were previously
     written, and after that another 100 records are written to it
     starting from the _beginning_ of the stream, the stream still will
     contain 1000 records! TStream does not have a SetSize() method,
     as TMemory/TFileStream have.
     So in here, we can only write from the beginning by setting Position
     to zero. Clearing of the stream must be done outside from this
     procedure
   }
   AStream.Position := 0;
   for i := 1 to N do
   with TestRec do begin
     IntField  := Random(10000);
     CharField := chr(65 + random(26));
     ByteField := i;
     StrField  := 'SomeString ' + IntToStr(i);
     //=======================================
     // Rule Nr. 1 : **ALWAYS** use SizeOf() !
     //=======================================
     AStream.Write( TestRec, SizeOf(TTestRec) );
   end;
end;

//============================================
procedure TForm1.Button1Click(Sender: TObject);
begin
   Ms1.Clear;
   FillStream( Ms1, 1000 );
   ShowStreamData( Ms1, Memo1.Lines, 'Ms1' );
end;



//==============================================
procedure TForm1.ProcessMs1Click(Sender: TObject);
Var
 TestRec : TTestRec;
 Start,
 Duration: DWORD;
 RecCount: integer;
begin
  Start := GetTickCount;  //  ms since last  boot
  Ms1.Position := 0;
  RecCount := 0;
  while Ms1.Position < Ms1.Size do
  begin
    Ms1.Read( TestRec, SizeOf(TestRec) );
    inc( RecCount );
  end;
  Duration := GetTickCount - Start;
  ShowMessage( 'Reading Stream took ' + IntToStr(Duration)+' ms.'+ #13
               + IntToStr(RecCount) + ' records were read');
end;


//==================================================
procedure TForm1.Ms1SaveToFileClick(Sender: TObject);
begin
 try
  Ms1.SaveToFile('test.dat');
 except
   Showmessage(' Oops.. couldn''t write!' + #13
               + SysErrorMessage(GetLastError));
 end;
end;

//===================================================
procedure TForm1.Ms1LoadFromFileClick(Sender: TObject);
begin
  try
    Ms1.LoadFromFile('test.dat');

  except
     Showmessage(' Oops.. couldn''t read file!' + #13
               + SysErrorMessage(GetLastError));
  end;
    ShowStreamData( Ms1, Memo1.Lines, 'Ms1' );
end;

//=============================================
procedure TForm1.btnLoadFsClick(Sender: TObject);
var
   Fs      : TFileStream;
begin
  try
   Fs := TFileStream.Create('test.dat', fmOPENREAD );
   ShowStreamData( Fs, Memo2.Lines, 'Fs1' );
  except
   Showmessage(' Oops.. couldn''t read file!' + #13
               + SysErrorMessage(GetLastError));
  end;
  Fs.Free;
end;

//==================================================
procedure TForm1.StreamWalkButDownClick(Sender: TObject);
var
 TestRec : TTestRec;
begin
  if Ms1.Position < Ms1.Size then
  begin
    Ms1.Read( TestRec, SizeOf(TestRec) );
    with TestRec do
      Edit3.Text := Format( FmtRec, [IntField, CharField,ByteField, StrField]);
  end;
end;

//===============================================
procedure TForm1.StreamWalkButUpClick(Sender: TObject);
var
 TestRec : TTestRec;
begin
  if Ms1.Position > 0 then
  begin
    // we first need to go back *2* records, since
    // each read() advances the stream position!
    Ms1.Seek( -2 * SizeOf(TestRec), soFROMCURRENT );
    // clamp ! Delphi does not do any limit checks,
    // and will return garbage data
    if Ms1.Position < 0 then
       Ms1.Position := 0;
    //
    Ms1.Read( TestRec, SizeOf(TestRec) );
    with TestRec do
      Edit3.Text := Format( FmtRec, [IntField, CharField,ByteField, StrField]);
  end;
end;

//============================================================
procedure TForm1.Edit4KeyPress(Sender: TObject; var Key: Char);
var
  RecIndex : integer;
  TestRec  : TTestRec;
begin
  if Key = #13 then
  begin
    Key := #0;  // suppress annoying beep...
    try
     RecIndex :=  Pred(StrToInt(Edit4.Text)) * SizeOf( TestRec ); // 1-based
    except
      on EConvertError do begin
       ShowMessage(' Gotcha! Illegal Number...' );
       EXIT;
      end;
    end;
    Ms1.Seek( RecIndex,  soFROMBEGINNING );
    // clamp!
    if Ms1.Position < 0 then
       Ms1.Position := 0;
    if Ms1.Position >= Ms1.Size then
       Ms1.Position := Ms1.Size - SizeOf(TTestRec);
    //
    Ms1.Read( TestRec, SizeOf(TestRec) );
    with TestRec do
      Edit3.Text := Format( FmtRec, [IntField, CharField,ByteField, StrField]);

  end;
end;

//===========================================
procedure TForm1.Button2Click(Sender: TObject);
begin
   Ms1.Position := 0; // go to begin
   Ms2.Position := 0;
   Ms2.CopyFrom( Ms1, Ms1.Size );
   ShowStreamData( Ms2, Memo2.Lines, 'Ms2' );
end;


//============================================
procedure TForm1.Button3Click(Sender: TObject);
begin
   Ms1.Position := Ms1.Size div 2; // half of stream
   Ms2.Position := 0;
   Ms2.CopyFrom( Ms1, Ms1.Size  div 2 );
   ShowStreamData( Ms2, Memo2.Lines, 'Ms2' );
end;


//============================================
procedure TForm1.Button4Click(Sender: TObject);
var
   Fs      : TFileStream;
begin
  try
   Fs := TFileStream.Create('test.dat', fmOPENWRITE or fmCREATE );
   FillStream( Fs, 10 );
   ShowStreamData( Fs, Memo2.Lines, 'Fs1' );
  except
   Showmessage(' Oops.. couldn''t write file!' + #13
               + SysErrorMessage(GetLastError));
  end;
  Fs.Free;  // << this actually writes the data to disk
end;
end.
