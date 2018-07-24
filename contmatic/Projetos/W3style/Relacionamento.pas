unit Relacionamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, Grids, DBGrids, StdCtrls, uTool, DBGridPesquisa;

type
  TfmRelacionamento = class(TForm)
    qyRelacionamento: TQuery;
    Panel1: TPanel;
    dsRelacionamento: TDataSource;
    DBGrid1: TDBGridPesquisa;
    qyRelacionamentoNOTABELA: TStringField;
    qyRelacionamentoQtRegistros: TIntegerField;
    Label1: TLabel;
    qyRelacionamentoCDRELACIONAMENTO_TABELA: TFloatField;
    Panel2: TPanel;
    Label2: TLabel;
    qyCampo: TQuery;
    dsCampos: TDataSource;
    DBGrid2: TDBGridPesquisa;
    qyCalc_Campo: TQuery;
    qyTmp: TQuery;
    Panel3: TPanel;
    btOk: TButton;
    procedure qyRelacionamentoCalcFields(DataSet: TDataSet);
    procedure btOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
     vsNoTabela : string;
     vQueryResult : TStrings;
  public
    { Public declarations }
    class Procedure ShowRelation( psNoTabela : string; pQueryResult : TStrings);
  end;

var
  fmRelacionamento: TfmRelacionamento;

implementation

{$R *.DFM}
class Procedure TfmRelacionamento.ShowRelation( psNoTabela : string; pQueryResult : TStrings);
begin
   with create(application) do
   begin
      vsNoTabela := psNoTabela;
      vQueryResult := pQueryResult;
      qyTmp.close;
      qyTmp.sql.clear;
      qyTmp.sql.add('SELECT DSTABELA FROM TABELA WHERE NOTABELA = '+quotedstr(vsNoTabela) );
      qyTmp.open;
      if not qyTmp.eof then
      begin
         Caption := ' Relacionamentos da Tabela "'+vsNoTabela+'" ('+trim(qyTmp.fieldbyname('DSTABELA').asstring)+')';
         qyRelacionamento.close;
         qyRelacionamento.ParamByName('NOTABELA_REFERENCIADA').asString := vsNoTabela;
         qyRelacionamento.open;
         qyCampo.Open;
         showmodal;
      end;
   end;
end;
procedure TfmRelacionamento.qyRelacionamentoCalcFields(DataSet: TDataSet);
var vsNoTabela : string;
    vsNoCampo : string;
begin
  with qyCalc_campo do
  begin
     vsNoTabela := qyRelacionamento.fieldbyname('NOTABELA').asString;
     close;
     parambyname('CDRELACIONAMENTO_TABELA').asinteger := qyRelacionamento.fieldbyname('CDRELACIONAMENTO_TABELA').asinteger;
     open;
     if not eof then
     begin
        qyTmp.close;
        qyTmp.SQL.Clear;
        qyTmp.SQL.add('SELECT');
        qyTmp.SQL.add('COUNT(*) QTREGISTROS ');
        qyTmp.SQL.add('FROM');
        qyTmp.SQL.add(vsNoTabela);
        while not eof do
        begin
           vsNoCampo := trim(fieldbyname('NOCAMPO').asstring);
           insertfilter(qyTmp,vsNoCampo+' = :'+vsNoCampo,vsNoCampo,vQueryResult.values[fieldbyname('NOCAMPO_REFERENCIADO').asstring]);
           next
        end;
        try
          qyTmp.open;
          qyRelacionamento.fieldbyname('QtRegistros').asinteger :=qyTmp.fieldbyname('QtRegistros').asinteger;
        except
          on e:exception do
             showmessage(' Erro calculando registros relacionados na tabela :'+vsNoTabela +chr(13)+qyTmp.sql.text);
        end;
     end;
  end;
end;

procedure TfmRelacionamento.btOkClick(Sender: TObject);
begin
   modalResult := mrOk;
end;

procedure TfmRelacionamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_Escape then
      modalResult := mrCancel;
end;

end.
