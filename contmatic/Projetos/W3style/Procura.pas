unit Procura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, DBGridPesquisa, cadVirtual, uTool, ExtCtrls,
  ADODB;

type
  TfmProcura = class(TfmCadVirtual)
    dsMain: TDataSource;
    grdProcura: TDBGridPesquisa;
    paTitulo: TPanel;
    qyMain: TADOQuery;
    procedure grdProcuraDblClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure grdProcuraKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  protected
      procedure Prepara_Exibicao;override;
  public
    { Public declarations }
  end;

var
  fmProcura: TfmProcura;

implementation

{$R *.DFM}
procedure TfmProcura.Prepara_Exibicao;
begin
  // Cria os titulos passados pela rotina addtitulo
  CriaTitulo(paTitulo,tsCad);

  dsMain.Dataset.Close;
  // Insere Filtros no select da query principal
  Filtrar(TADOQuery(dsMain.Dataset));
  dsMain.Dataset.Open;
  if dsMain.Dataset.Eof then
  begin
    showMessage('Nenhum registro encontrado');
    modalResult:=mrCancel;
    Close;
  end;
end;

procedure TfmProcura.grdProcuraDblClick(Sender: TObject);
begin
    modalResult:=mrOk;
    Close;
end;

procedure TfmProcura.FormDeactivate(Sender: TObject);
begin
   ModalResult := mrCancel;
   close;
end;

procedure TfmProcura.grdProcuraKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_return : begin
                   modalResult:=mrOk;
                   Close;
                end;
    vk_escape : begin
                   modalResult:=mrCancel;
                   Close;
                end
  end;
end;

procedure TfmProcura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if Assigned(Retorno) and ( ModalResult = mrOk ) then
    begin
       Carrega_QueryResult(TADOQuery(dsMain.Dataset), Retorno);
    end;
end;

initialization
   RegisterClass(TfmProcura);
end.
