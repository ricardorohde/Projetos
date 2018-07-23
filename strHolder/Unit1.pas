unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, ComCtrls, Grids, DBGrids, ExtCtrls, DBTables, Mask,
  AltLog, AltRepStd, AltLib_Code, ToolWin, altStatus,
  SetupTable, dxmdaset, AltSetupMemData, AuditorEventos,
  Buttons, StdCtrls, Alterdata, AlterdataTypes, Alterdata_consts, AlterdataDatabase,
  uSearchDataSet, Alterdata_Calendario, Math, (*EmpresaC, *)
  rxStrHlder, StrUtils, Uni,  SetupQuery, MemDS, DBAccess, DBCtrls,
  alterdataconnection, DASQLMonitor, UniSQLMonitor;

type
  TForm1 = class(TForm)
    AlterdataConnection1: TAlterdataConnection;
    SetupTable1: TSetupTable;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    StrHolder: TStrHolder;
    SetupTable1cofins_lancamento_automatico_id: TIntegerField;
    DBGrid1: TDBGrid;
    UniSQLMonitor1: TUniSQLMonitor;
    edtCdContabil: TDBEdit;
    SetupTable1CdVlContabil: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
var
  qryMovISS : TSetupQuery;
begin
  OpenTableTemp(SetupTable1);

  StrHolder.MacroByName('Table').Value    := 'IS00001';

  qryMovISS := TSetupQuery.Create('WFISCAL');
  Try
    qryMovISS.SQL.Add('INSERT INTO TEMP.'+SetupTable1.TableName+' ');
    qryMovISS.SQL.Add(StrHolder.ExpandMacros);
    qryMovISS.execSql;
  finally
    FreeAndnil(qryMovISS);
  end;

  SetupTable1.close;
  OpenTable(SetupTable1);

  SetupTable1.First;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SetupTable1.Close;
  SetupTable1.DeleteTable;
end;

end.
