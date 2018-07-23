unit Tread;

interface

uses
   Sysutils,Classes;

type

  TThreadProgress = class(TThread)
  private
    { Private declarations }
//    FProgress : TProgressBar;
  protected
    procedure Execute; override;

    Procedure AtualizaCaption;
  public

//    property Progress : TProgressBar read FProgress write FProgress;

    procedure AfterConstruction; override;    
  end;

var
  i : integer; //Variavel de controle

implementation

uses Unit1;

{ TThreadProgress }

procedure TThreadProgress.AfterConstruction;
begin
  inherited;
//  Form.progress.Max := MAX_VALUE;
end;

procedure TThreadProgress.AtualizaCaption;
begin
//  Form.progress.Position := i;
//
//  if (Form.progress.Position = MAX_VALUE) then
//    begin
//      Form.progress.Position := 0 + 1000;
//      i := 0;
//    end;
end;

procedure TThreadProgress.Execute;
begin
//  inherited;

//  for i := 0 to MAX_VALUE do
//    synchronize(AtualizaCaption);
end;

end.
