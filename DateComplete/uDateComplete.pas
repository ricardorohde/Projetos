unit uDateComplete;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask;

type
  TForm1 = class(TForm)
    MaskEdit1: TMaskEdit;
    edtDate: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtDateExit(Sender: TObject);
  private
    { Private declarations }
    procedure DateComplete(var StrLikeDate : string; const NowIfError:boolean = True) ;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.DateComplete(var StrLikeDate : string; const NowIfError:boolean = True);
var
  DateStr : string;
  Year, Month, Day : Word;
  cnt, SepCount : Integer;
begin
  DateStr:=StrLikeDate;

  if DateStr = '' then
    Exit;

  SepCount := 0;

  for cnt := 1 to Length(DateStr) do
  begin
    if not (DateStr[cnt] in ['0'..'9']) then
    begin
      DateStr[cnt] := DateSeparator;
      inc(SepCount) ;
    end;
  end;

  while (DateStr <> '') and (DateStr[Length(DateStr)]=DateSeparator) do
  begin
    Delete(DateStr, Length(DateStr), 1) ;
    Dec(SepCount) ;
  end;

  DecodeDate(Now, Year, Month, Day) ;

  if SepCount = 0 then
  begin
     case Length(DateStr) of
       0 : DateStr := DateToStr(Now) ;
       1, 2 : DateStr := DateStr+DateSeparator+IntToStr(Month) ;
       4 : Insert(DateSeparator, DateStr, 3) ;
       6, 8 : begin
               Insert(DateSeparator, DateStr, 5) ;
               Insert(DateSeparator, DateStr, 3) ;
              end;
     end; {case}
  end; {if SepCount}

  try
    StrLikeDate := DateToStr(StrToDate(DateStr)) ;
  except
    if NowIfError = true then
      StrLikeDate := DateToStr(Date)
    else
      StrLikeDate := '';
  end;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    perform(wm_nextdlgctl,0,0);
  end;
end;

procedure TForm1.edtDateExit(Sender: TObject);
var
  s : string;
begin
  s := edtDate.Text;
  DateComplete(s, True) ; {or DateComplete(s)}
  edtDate.Text := s;
end;

end.
