unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Cad, DB, DBTables, CacheQuery, Menus, ComCtrls, Buttons, ToolWin,
  StdCtrls, JvExStdCtrls, JvBehaviorLabel, JvExControls, JvAnimatedImage,
  JvGIFCtrl, ExtCtrls, Grids, DBGrids, DBGridPesquisa, Mask, LookupEdit,
  dbLookUpEdit, DBFindEdit, DBCtrls;

type
  TfmCad2 = class(TfmCad)
    laCdPrograma: TLabel;
    GroupBox1: TGroupBox;
    dbckSNINCLUIR: TDBCheckBox;
    dbckSNEXCLUIR: TDBCheckBox;
    dbckSNALTERAR: TDBCheckBox;
    dbckSNCONSULTAR: TDBCheckBox;
    dbfeCDPROGRAMA: TDBFindEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PostRec(Sender: TObject);override;
    procedure DelRec(Sender: TObject);override;
    procedure dsMainStateChange(Sender: TObject);
    procedure qyMainCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    vbAtualiza_Menu : boolean;
  public
    { Public declarations }
    procedure Prepara_Exibicao;
  end;

var
  fmCad2: TfmCad2;

implementation

uses dtmPrincipal;

{$R *.dfm}

procedure TfmCad2.DelRec(Sender: TObject);
begin
  inherited;
  vbAtualiza_Menu := true;
end;

procedure TfmCad2.dsMainStateChange(Sender: TObject);
begin
  if dsMain.State = dsInsert then
     CONTROLACTIVE:= dbfeCDPROGRAMA
  else
     CONTROLACTIVE:= dbckSNINCLUIR;

  inherited;
end;

procedure TfmCad2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if vbAtualiza_Menu then
    Atualizar_Menu_Principal;
end;

procedure TfmCad2.PostRec(Sender: TObject);
begin
  inherited;
  vbAtualiza_Menu := true;
end;

procedure TfmCad2.Prepara_Exibicao;
begin
  vbAtualiza_Menu := false;
  inherited;
end;

procedure TfmCad2.qyMainCalcFields(DataSet: TDataSet);
begin
  inherited;
  if(not DataSet.FieldByName('CDPROGRAMA').isnull)then
    DataSet.FieldByName('ZCDPROGRAMA').AsString :=dmPrincipal.Procura_Descricao('PROGRAMA.DBF','NOPROGRAMA','WHERE CDPROGRAMA = '+quotedstr(DataSet.FieldByName('CDPROGRAMA').AsString),'dbExterno');
end;

initialization
   RegisterClass(TfmCad2);
end.
