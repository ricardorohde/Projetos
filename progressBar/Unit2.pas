unit ThreadProgressbar;

interface

uses Classes, ComCtrls, Controls, SysUtils;

type
  TThreadProgressbar = class(TThread)
  private
    { Private declarations }
    procedure InicializaProgresso;
    procedure PreencheProgresso;
    procedure Termino(Sender : TObject);
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended : boolean);
  end;

var
   prgbarProgresso : TProgressBar;

implementation

uses Principal;

constructor TThreadProgressbar.Create(CreateSuspended : boolean);
begin
   inherited Create(CreateSuspended);
   OnTerminate := Termino;  // OnTerminate é executado quando é encerrado a thread.
   FreeOnTerminate := True; // determina se a thread é destruido automaticamente.
   Priority := tpNormal;    // prioridade da thread em relação aos demais processos.
   Synchronize(InicializaProgresso);             // inicializa o progressbar.
end;

procedure TThreadProgressbar.Termino(Sender : TObject);
begin
   FreeAndNil(prgbarProgresso); // destroi e libera o progressbar.
end;

procedure TThreadProgressbar.Execute;
begin  // enquanto a execução não for forçado a terminar
   while not Terminated do      // (atraves do evento OnTerminate da TThreadSQL).
     Synchronize(PreencheProgresso);             // preenche o progressbar.
end;

// inicializa o progressbar
procedure TThreadProgressbar.InicializaProgresso;
begin
   prgbarProgresso := TProgressbar.Create(nil);  // instância um objeto do tipo TProgressBar.
   with prgbarProgresso do
    begin
       Parent := frmPrincipal.stsbarInfo;
       Width := 122;
       Height := 16;
       Top := 3;
       Left := 153;
       Anchors := [akTop,akRight];
       Position := 0;
       Min := 0;
       Max := 1000;
    end;
end;

// preenche o progressbar.
procedure TThreadProgressbar.PreencheProgresso;
begin
   with prgbarProgresso do
    begin
       if Position < Max then
         Position := Position+1
       else
         Position := 0;
    end;
end;

end.
