unit ThreadProgressbar;

interface

uses ComCtrls, Classes, Controls, StdCtrls, Forms;

//type
//  TThreadProgressbar = class(TThread)
//  private
//    { Private declarations }
//    procedure InicializaProgresso;
//    procedure PreencheProgresso;
//    procedure Termino(Sender : TObject);
//  protected
//    procedure Execute; override;
//  public
//    constructor Create(CreateSuspended : boolean);
//  end;
//
//var
//   prgbarProgresso : TProgressBar;
//
//implementation
//
//uses Principal;
//
//constructor TThreadProgressbar.Create(CreateSuspended : boolean);
//begin
//   inherited Create(CreateSuspended);
//   OnTerminate := Termino;  // OnTerminate é executado quando é encerrado a thread.
//   FreeOnTerminate := True; // determina se a thread é destruido automaticamente.
//   Priority := tpNormal;    // prioridade da thread em relação aos demais processos.
//   Synchronize(InicializaProgresso);             // inicializa o progressbar.
//end;
//
//procedure TThreadProgressbar.Termino(Sender : TObject);
//begin
//   FreeAndNil(prgbarProgresso); // destroi e libera o progressbar.
//end;
//
//procedure TThreadProgressbar.Execute;
//begin  // enquanto a execução não for forçado a terminar
//   while not Terminated do      // (atraves do evento OnTerminate da TThreadSQL).
//     Synchronize(PreencheProgresso);             // preenche o progressbar.
//end;
//
//// inicializa o progressbar
//procedure TThreadProgressbar.InicializaProgresso;
//begin
//   prgbarProgresso := TProgressbar.Create(nil);  // instância um objeto do tipo TProgressBar.
//   with prgbarProgresso do
//    begin
//       Parent := frmPrincipal.stsbarInfo;
//       Width := 122;
//       Height := 16;
//       Top := 3;
//       Left := 153;
//       Anchors := [akTop,akRight];
//       Position := 0;
//       Min := 0;
//       Max := 1000000;
//    end;
//end;
//
//// preenche o progressbar.
//procedure TThreadProgressbar.PreencheProgresso;
//begin
//   with prgbarProgresso do
//    begin
//       if Position < Max then
//         Position := Position+1
//       else
//         Position := 0;
//    end;
//end;

type
 TThreadProgresso = class(TThread)
 private
 FProgresso: TProgressBar;
 FPrioridade: Integer;
 FLabelTempo: TLabel;
 public
 property Progresso: TProgressBar read FProgresso write FProgresso;
 property Prioridade: Integer read FPrioridade write FPrioridade;
 property LabelTempo: TLabel read FLabelTempo write FLabelTempo;
 protected
 procedure Execute; override;
 end;

implementation

uses SysUtils;

{ TThreadProgresso }

procedure TThreadProgresso.Execute;
 var
 I, Total: Integer;
 TimeIni: TTime;
 TimeFim: TTime;
 begin
 //Prioritys
 //tpIdle    The thread executes only when the system is idle. The system will not interrupt other threads to execute a thread with tpIdle priority.
 //tpLowest    The thread's priority is two points below normal.
 //tpLower    The thread's priority is one point below normal.
 //tpNormal    The thread has normal priority.
 //tpHigher    The thread's priority is one point above normal.
 //tpHighest    The thread's priority is two points above normal.
 //tpTimeCritical    The thread gets highest priority.
 Total := 10000;
 TimeIni := Time;

FProgresso.Max := Total;
 FProgresso.Position := 0;
 case FPrioridade of
 0: Priority := tpLower;
 1: Priority := tpNormal;
 2: Priority := tpHigher;
 3: Priority := tpTimeCritical;
 end;

for I := 0 to Total -1 do
 FProgresso.StepBy(1);
 Application.ProcessMessages();
 Self.Terminate;

TimeFim := Time;

FLabelTempo.Caption := FormatDateTime('hh:mm:ss.zzzz', TimeFim - TimeIni);

inherited;
 end;

end.

end.
