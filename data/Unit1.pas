unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, StdCtrls, ExtCtrls, Grids, DBGrids, Provider,
  MemDS, DBAccess, Uni, SetupQuery, alterdataconnection, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxHyperLinkEdit, cxGridCustomPopupMenu;

type
  TForm1 = class(TForm)
    AlterdataConnection1: TAlterdataConnection;
    SetupQuery1: TSetupQuery;
    DataSetProvider1: TDataSetProvider;
    Panel1: TPanel;
    Button1: TButton;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ClientDataSet1Idcodigo: TIntegerField;
    cxGrid1DBTableView1Idcodigo: TcxGridDBColumn;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    ClientDataSet1selecionar: TStringField;
    Button2: TButton;
    tblTempProdutos: TClientDataSet;
    tblTempProdutosCdEmpresa: TIntegerField;
    tblTempProdutosCdCodigo: TIntegerField;
    tblTempProdutosCodEspecifico: TStringField;
    tblTempProdutosCdClassificacao: TStringField;
    tblTempProdutosnmDescricao: TStringField;
    tblTempProdutosIncideMP540: TBooleanField;
    tblTempProdutosDsIncideMP540: TStringField;
    tblTempProdutosAgrupamentoNCM: TStringField;
    tblTempProdutosCodigo_atividade_id: TSmallintField;
    tblTempProdutosAtualizar: TBooleanField;
    PvdProdutos: TDataSetProvider;
    DBGrid1: TDBGrid;
    DataSource2: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGrid1DBTableView1MouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure Button2Click(Sender: TObject);
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
begin
  SetupQuery1.Schema := 'WFISCAL';
  SetupQuery1.Close;
  SetupQuery1.SQL.Clear;
  SetupQuery1.SQL.Add('select C.*, ''Selecionar'' as Selecionar from wfiscal.CADFISM C');
  SetupQuery1.Open;

  ClientDataSet1.AppendData(DataSetProvider1.Data, False);

  ClientDataSet1.Filter := '(IdCodigo = 1102) or (IdCodigo = 11111)';
  ClientDataSet1.Filtered := True;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
//  ClientDataSet1.Append;
//  ClientDataSet1.Fields.FieldByName('IdCodigo').AsInteger := 11111;
//  ClientDataSet1.Post;
end;

procedure TForm1.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if  ACellViewInfo.Item = cxGrid1DBTableView1Column1 then
    begin
      //ClientDataSet1.Delete;
      ClientDataSet1.Edit;
//      ClientDataSet1.Fields.FieldByName('IdCodigo').AsInteger := 1102;
      ClientDataSet1.Fields.FieldByName('IdCodigo').AsInteger := 11111;
//      ClientDataSet1.Fields.FieldByName('Selecionar').AsString := 'Selecionar';
      ClientDataSet1.Post;

//      cxGrid1DBTableView1Idcodigo.DataBinding.DataController.DataSource := DataSource1;
//      cxGrid1DBTableView1Idcodigo.DataBinding.FieldName := 'IdCodigo';
//      cxGrid1DBTableView1Column1.DataBinding.FieldName := 'Selecionar';
//      cxGrid1DBTableView1Idcodigo.DataBinding.ValueType := Integer;
    end;
end;

procedure TForm1.cxGrid1DBTableView1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
//var
//  lCellUnderMouse : TcxGridRecordCellHitTest;
begin
//  if(GetHitTypeByHitCode(cxGrid1DBTableView1.ViewInfo.GetHitTest(X,Y).HitTestCode) <> gvhtCell)then
//    begin
//      Screen.Cursor :=  crDefault;
//      Exit;
//    end;
//
//  lCellUnderMouse := TcxGridRecordCellHitTest(cxGrid1DBTableView1.ViewInfo.GetHitTest(X,Y));
//
//  if TcxGridColumn(lCellUnderMouse.Item).PropertiesClass = TcxHyperLinkEditProperties then
//    Screen.Cursor := crHandPoint
//  else
//    Screen.Cursor :=  crDefault;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  SetupQuery1.Close;
  SetupQuery1.SQL.Clear;
  SetupQuery1.SQL.Add('SELECT DISTINCT &CdEmpresa as CdEmpresa');
  SetupQuery1.SQL.Add('      , CdCodigo');
  SetupQuery1.SQL.Add('      , CodEspecifico');
  SetupQuery1.SQL.Add('      , CdClassificacao');
  SetupQuery1.SQL.Add('      , nmDescricao');
  SetupQuery1.SQL.Add('      , incideMP540');
  SetupQuery1.SQL.Add('      , {fn TOCHAR('''')} as DsIncideMP540');
  SetupQuery1.SQL.Add('      , {fn TOCHAR('''')} as AgrupamentoNCM');
  SetupQuery1.SQL.Add('      , codigo_atividade_id');
  SetupQuery1.SQL.Add('     , {FALSE} as Atualizar');
  SetupQuery1.SQL.Add('FROM &TabelaProdutos');
  SetupQuery1.SQL.Add(' WHERE (DtInicial >= :pDataINI) AND (DtFinal <= :pDataFIM) ');
  SetupQuery1.ParamByName('pDataINI').AsDateTime  := StrToDateTime('01/01/2012');
  SetupQuery1.ParamByName('pDataFIM').AsDateTime  := StrToDateTime('31/01/2012');
  SetupQuery1.MacroByName('TabelaProdutos').Value := 'WFISCAL.CD00001';
  SetupQuery1.MacroByName('CdEmpresa').Value      := '1';
  SetupQuery1.Open;

//        PvdProdutos.DataSet := nxqProdutos;
  tblTempProdutos.AppendData(PvdProdutos.Data, False);
end;

end.
