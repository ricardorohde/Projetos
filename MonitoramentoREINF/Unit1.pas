unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids;

type
  TWThreadMonitorar = class(TThread)
  private
    FTempoAtualizacao: Integer;
    procedure AtualizaTela();
    procedure SetTempoAtualizacao(const Value: Integer);
  protected
    procedure Execute(); override;
  public
    constructor Create(CreateSuspended: Boolean; AForm: TForm);
    property TempoAtualizacao: Integer read FTempoAtualizacao write SetTempoAtualizacao;
  end;

  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    cdsMonitoramento: TClientDataSet;
    dtsMonitoramento: TDataSource;
    cdsMonitoramentoSTATUS: TIntegerField;
    cdsMonitoramentoACAO: TIntegerField;
    cdsMonitoramentoEVENTO: TStringField;
    cdsMonitoramentoDESCRICAO: TStringField;
    cdsMonitoramentoTIPO: TIntegerField;
    cdsMonitoramentoAMBIENTE: TIntegerField;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Contador: Integer;

implementation

{$R *.dfm}

{ TWThreadMonitorar }


procedure TWThreadMonitorar.Execute();
begin
  while (not Terminated) do
  begin
    Synchronize(AtualizaTela);
    Sleep(TempoAtualizacao * 1000);
  end;
end;

procedure TWThreadMonitorar.SetTempoAtualizacao(const Value: Integer);
begin
  FTempoAtualizacao := Value;
end;

procedure TWThreadMonitorar.AtualizaTela();
begin
  Inc(Contador);
  Form1.cdsMonitoramento.Close;
  Form1.cdsMonitoramento.CreateDataSet;
  Form1.cdsMonitoramento.EmptyDataSet;

  Form1.cdsMonitoramento.Append;
  Form1.cdsMonitoramentoSTATUS.AsInteger:= Contador;
  Form1.cdsMonitoramentoACAO.AsInteger:= 1;
  Form1.cdsMonitoramentoEVENTO.AsString:= 'R-1000';
  Form1.cdsMonitoramentoDESCRICAO.AsString:= 'BASE Software';
  Form1.cdsMonitoramentoTIPO.AsInteger:= 1;
  Form1.cdsMonitoramentoAMBIENTE.AsInteger:= 0;
  Form1.cdsMonitoramento.Post;
end;

constructor TWThreadMonitorar.Create(CreateSuspended: Boolean; AForm: TForm);
begin
  inherited Create (CreateSuspended);
  FreeOnTerminate := false;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  _Thread: TWThreadMonitorar;
begin
  Contador:= 0;
  _Thread := TWThreadMonitorar.Create(false, Self);
  _Thread.TempoAtualizacao:= 10;
end;

end.
