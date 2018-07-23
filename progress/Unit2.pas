unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls;

type
  ThreadProgress = class(TThread)
  private
    FProgress: TProgressBar;
    procedure SetProgress(const Value: TProgressBar);
    { Private declarations }
  protected
    procedure Execute(); override;
    Procedure AtualizaCaption;
  public
    property Progress : TProgressBar read FProgress write SetProgress;
  end;

const MAX_VALUE = 10000;

Var
  i : integer; //Variavel de controle

implementation


procedure ThreadProgress.AtualizaCaption;
begin
  Progress.Position := Progress.Position + 1;

  if (Progress.Position = MAX_VALUE) then
    begin
      Progress.Position := 0;
      i := 0;
    end;
end;

procedure ThreadProgress.Execute;
begin
  Progress.Position := 0;
  Progress.Max := MAX_VALUE;

  for i := 0 to MAX_VALUE do
    synchronize(AtualizaCaption);
  inherited;
end;

procedure ThreadProgress.SetProgress(const Value: TProgressBar);
begin
  FProgress := Value;
end;

end.
 