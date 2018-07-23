unit Unit2;

interface

uses
   Sysutils,Classes;

type
  ThreadProgress = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
    Procedure AtualizaCaption;
  public
    procedure AfterConstruction; override;
  end;

const MAX_VALUE = 100000;

Var
  i : integer; //Variavel de controle

implementation

uses Unit1;


{ ThreadProgress }

procedure ThreadProgress.Execute;
begin
  for i := 0 to MAX_VALUE do
    synchronize(AtualizaCaption);
end;

procedure ThreadProgress.AtualizaCaption;
begin
  //form1.Caption := 'Contando :  ' + IntToStr(i);
  form1.pb1.Position := i;

  if (form1.pb1.Position = MAX_VALUE) then
    begin
      form1.pb1.Position := 0 + 10000;
      i := 0;
    end;
end;


procedure ThreadProgress.AfterConstruction;
begin
  inherited;
  form1.pb1.Max := MAX_VALUE;
end;

end.
