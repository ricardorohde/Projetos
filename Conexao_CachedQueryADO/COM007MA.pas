unit COM007MA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Cad, DB, DBTables, CacheQuery, Menus, ComCtrls, Buttons, ToolWin,
  StdCtrls, JvExStdCtrls, JvBehaviorLabel, JvExControls, JvAnimatedImage,
  JvGIFCtrl, ExtCtrls, Grids, DBGrids, DBGridPesquisa, Mask, LookupEdit,
  dbLookUpEdit, DBFindEdit, DBCtrls, MemDS, DBAccess, Uni, ADODB;

type
  TfmCOM007MA = class(TfmCad)
    laCdPrograma: TLabel;
    GroupBox1: TGroupBox;
    dbckSNINCLUIR: TDBCheckBox;
    dbckSNEXCLUIR: TDBCheckBox;
    dbckSNALTERAR: TDBCheckBox;
    dbckSNCONSULTAR: TDBCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DelRec(Sender: TObject);override;
    procedure dsMainStateChange(Sender: TObject);
    procedure qyMainCalcFields(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    vbAtualiza_Menu : boolean;
  public
    { Public declarations }
    procedure Prepara_Exibicao;
  end;

var
  fmCOM007MA: TfmCOM007MA;

implementation

uses dtmPrincipal;

{$R *.dfm}

procedure TfmCOM007MA.Button1Click(Sender: TObject);
begin
//  qyMain.FieldByName('CDGRUPO').AsFloat := dmPrincipal.Proximo_Valor_int('PROGRAMA_GRUPO', 'CDGRUPO', 'WHERE CDPROGRAMA = ' + QuotedStr(VarToStrDef(dbfeCDPROGRAMA.linkvalue, '')));

//  PostRec(Sender);
  inherited;

end;

procedure TfmCOM007MA.DelRec(Sender: TObject);
begin
  inherited;
  vbAtualiza_Menu := true;
end;

procedure TfmCOM007MA.dsMainStateChange(Sender: TObject);
begin
//  if dsMain.State = dsInsert then
//     CONTROLACTIVE:= dbfeCDPROGRAMA
//  else
//     CONTROLACTIVE:= dbckSNINCLUIR;

  inherited;
end;

procedure TfmCOM007MA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if vbAtualiza_Menu then
    Atualizar_Menu_Principal;
end;

procedure TfmCOM007MA.Prepara_Exibicao;
begin
  vbAtualiza_Menu := false;
  inherited;
end;

procedure TfmCOM007MA.qyMainCalcFields(DataSet: TDataSet);
begin
  inherited;
  if(not DataSet.FieldByName('CDPROGRAMA').isnull)then
    DataSet.FieldByName('ZCDPROGRAMA').AsString :=dmPrincipal.Procura_Descricao('PROGRAMA.DBF','NOPROGRAMA','WHERE CDPROGRAMA = '+quotedstr(DataSet.FieldByName('CDPROGRAMA').AsString),'dbExterno');
end;

initialization
   RegisterClass(TfmCOM007MA);
end.
