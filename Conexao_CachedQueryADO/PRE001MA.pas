unit PRE001MA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Cad, DB, MemDS, DBAccess, Uni, CacheQuery, Menus, ComCtrls, Buttons,
  ToolWin, StdCtrls, JvExStdCtrls, JvBehaviorLabel, JvExControls,
  JvAnimatedImage, JvGIFCtrl, ExtCtrls, Grids, DBGrids, DBGridPesquisa, DBCtrls,
  LookupEdit, DBSearchEdit, dbLookUpEdit, DBFindEdit, Mask, ADODB;

type
  TfmPRE001MA = class(TfmCad)
    laCodOrg: TLabel;
    Bevel1: TBevel;
    dbtxStatus_Organizacao: TDBText;
    laNonOrg: TLabel;
    laCdSituacao: TLabel;
    laCdPessoa: TLabel;
    dbedCodOrg: TDBEdit;
    dbedNonOrg: TDBEdit;
    gbLogotipo: TGroupBox;
    dbimLogotip: TDBImage;
    dbfeCdSituacao: TDBFindEdit;
    dbseCdPessoa: TDBSearchEdit;
    dbckSnGestor: TDBCheckBox;
    procedure qyMainCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPRE001MA: TfmPRE001MA;

implementation

uses dtmPrincipal;

{$R *.dfm}

procedure TfmPRE001MA.qyMainCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('ZCDSITUACAO').asstring:=dmprincipal.F_Localiza_Dominio(DataSet.FieldByName('CDSITUACAO').asstring);
  DataSet.FieldByName('ZCDSTATUS_ORGANIZACAO').asstring:=dmprincipal.F_Localiza_Dominio(DataSet.FieldByName('CDSTATUS_ORGANIZACAO').asstring);
  inherited;
end;

initialization
   RegisterClass(TfmPRE001MA);

end.
