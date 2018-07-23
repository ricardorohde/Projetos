unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, StdCtrls, ExtCtrls, ComCtrls, Grids, DBGrids;

type
  TfrmPrincipal = class(TForm)
    stsbarInfo: TStatusBar;
    Panel1: TPanel;
    btnPesquisar: TButton;
    cdsTeste: TClientDataSet;
    cdsTesteID: TIntegerField;
    cdsTesteNome: TStringField;
    DBGrid1: TDBGrid;
    dtsTeste: TDataSource;
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  ThreadProgressbar;

{$R *.dfm}

procedure TfrmPrincipal.btnPesquisarClick(Sender: TObject);
var
  i: Integer;
//  ThreadProgress: TThreadProgressbar;
begin
  try
//    ThreadProgress:= TThreadProgressbar.Create(False);
    cdsTeste.close;
    cdsTeste.CreateDataSet;
    cdsTeste.DisableControls;
    for i := 0 to 1000000 do
    begin
//      ThreadProgress.Resume;
      cdsTeste.AppendRecord([I, 'Cliente ' + IntToStr(i)]);
    end;

    cdsTeste.EnableControls;
    //ThreadProgress.Terminate;
  finally
//    ThreadProgress:= nil;
//    FreeAndNil(ThreadProgress);
  end;

end;

end.
