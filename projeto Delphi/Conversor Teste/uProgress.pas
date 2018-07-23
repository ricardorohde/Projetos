unit uProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TfrmProgress = class(TForm)
    pnl1: TPanel;
    ProgressBar: TProgressBar;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

type
  TThreadProgress = class(TThread)
  private
    FFrmProgress : TfrmProgress;
  protected
    procedure Execute; override;

    Procedure AtualizaProgress;

  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;

  end;

  TProgress = class(TObject)
  private
    { Private declarations }
    FThread : TThreadProgress;
  public
    { Public declarations }

    procedure Execute;
    procedure Stop;

  end;

var
  frmProgress: TfrmProgress;

implementation


{$R *.dfm}


procedure TfrmProgress.FormShow(Sender: TObject);
begin
  ProgressBar.Position :=0;
  ProgressBar.Max      := 100;
  ProgressBar.Min      := 0;
end;

{ TThreadProgress }

procedure TThreadProgress.AfterConstruction;
begin
  inherited;
//  FFrmProgress.ShowModal;
end;

procedure TThreadProgress.AtualizaProgress;
begin
  if not assigned(FFrmProgress) then
    begin
      FFrmProgress := TfrmProgress.Create(nil);
      FFrmProgress.Show;
    end;

  with FFrmProgress do
    begin
      ProgressBar.Position := ProgressBar.Position+1;

      if (ProgressBar.Position = ProgressBar.Max) then
        Exit;
    end;
end;

procedure TThreadProgress.BeforeDestruction;
begin
  FreeAndNIl(FFrmProgress);
  inherited;
end;

procedure TThreadProgress.Execute;
begin
  synchronize(AtualizaProgress);
  inherited;
end;

{ TProgress }

procedure TProgress.Execute;
begin
  FThread := TThreadProgress.Create(true);
  FThread.FreeOnTerminate := true;
  FThread.Priority := tpNormal;
  FThread.Execute;
end;

procedure TProgress.Stop;
begin
  FThread.Resume;
  FreeAndNil(FThread);
end;

end.
