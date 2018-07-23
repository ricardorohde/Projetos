unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, StdCtrls, ExtCtrls, ComCtrls;

type
  TfrmPrincipal = class(TForm)
    stsbarInfo: TStatusBar;
    Panel1: TPanel;
    btnPesquisar: TButton;
    cdsTeste: TClientDataSet;
    cdsTesteID: TIntegerField;
    cdsTesteNome: TStringField;
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnPesquisarClick(Sender: TObject);
var
  i: Integer;
begin
  cdsTeste.close;
  cdsTeste.CreateDataSet;

  for i := 0 to 1000000 do
  begin
    cdsTeste.AppendRecord([I, 'Cliente ' + IntToStr(i)]);
  end;
end;

end.
