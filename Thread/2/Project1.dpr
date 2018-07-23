program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas',
  Tread in 'Tread.pas';

{$R *.res}
var
  m : TMessageProgress;
begin
  Application.Initialize;
  m := TMessageProgress.Create;
  try
    m.Execute;
    Application.Run;
  finally
    m.Free;
  end;
end.
