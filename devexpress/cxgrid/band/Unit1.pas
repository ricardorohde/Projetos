unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, dxmdaset, AltSetupMemData, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, StdCtrls,
  ExtCtrls, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxGridCustomPopupMenu, cxGridPopupMenu, SetupQuery, MemDS, DBAccess, Uni,
  DASQLMonitor, UniSQLMonitor, alterdataconnection, Alterdata, cxCheckBox,
  cxCurrencyEdit, cxGridBandedTableView, cxGridDBBandedTableView;

type
  TForm1 = class(TForm)
    SetupMemData1: TSetupMemData;
    DataSource1: TDataSource;
    SetupMemData1CdEmpresa: TIntegerField;
    SetupMemData1NmEmpresa: TStringField;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel1: TPanel;
    Button1: TButton;
    cxGridPopupMenu1: TcxGridPopupMenu;
    SetupMemData1VlIcms: TFloatField;
    AlterdataConnection1: TAlterdataConnection;
    UniSQLMonitor1: TUniSQLMonitor;      
    q: TSetupQuery;
    Button2: TButton;
    Button3: TButton;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1Column1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column3: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column4: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column5: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column6: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column7: TcxGridDBBandedColumn;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qCalcFields(DataSet: TDataSet);
    procedure tvSelecaoHeaderClick(Sender: TObject);
    procedure tvVlContabilGetDataText(Sender: TcxCustomGridTableItem;
      ARecordIndex: Integer; var AText: String);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure tvColumnPosChanged(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure tvDataControllerSummaryFooterSummaryItemsSummary(
      ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
      var OutArguments: TcxSummaryEventOutArguments);
  private
    { Private declarations }
    FTempComponent: Tcomponent;
    FLista_Campos : TStringList;
    FCheck: Boolean;

    procedure DefinirCampo(pType: TFieldType; pName: string;   pDataSet: TDataSet; pSize: integer = 0; pKind: TFieldKind = fkData);
    procedure DefinirComponenteProprietarioDosCamposDaConsultaDeNotas();
    procedure DestruirComponenteProprietarioDosCamposDaConsultaDeNotas;
    procedure GridRefresh;
    procedure FormatarCampos(pQuery : TSetupQuery; pCampos : Array of String; ArrayOfcxGridDBColumn:array of TcxGridDBColumn; pList: TstringList);
//    procedure qCalcFields( DataSet: TDataSet);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses StrUtils;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FCheck := False;
//  SetupMemData1.close;
//  SetupMemData1.Open;
//  SetupMemData1.Append;
//  SetupMemData1CdEmpresa.AsInteger := 1;
//  SetupMemData1NmEmpresa.AsString := 'Teste 1';
//  SetupMemData1VlIcms.AsFloat     := 1000;
//  SetupMemData1.Post;
//
//  SetupMemData1.Append;
//  SetupMemData1CdEmpresa.AsInteger := 2;
//  SetupMemData1NmEmpresa.AsString := 'Teste 2';
//  SetupMemData1VlIcms.AsFloat     := 1500;
//  SetupMemData1.Post;
//
//  SetupMemData1.Append;
//  SetupMemData1CdEmpresa.AsInteger := 3;
//  SetupMemData1NmEmpresa.AsString := 'Teste 3';
//  SetupMemData1VlIcms.AsFloat     := 101500;
//  SetupMemData1.Post;
//
//  SetupMemData1.Append;
//  SetupMemData1CdEmpresa.AsInteger := 4;
//  SetupMemData1NmEmpresa.AsString := 'Teste 4';
//  SetupMemData1VlIcms.AsFloat     := 750;
//  SetupMemData1.Post;
end;

procedure TForm1.Button1Click(Sender: TObject);
//var i : integer;
var i : Integer;
begin
  q.IndexFieldNames := '';
  q.close;
  q.SQL.Clear;

  FLista_Campos := TStringList.create;

  DestruirComponenteProprietarioDosCamposDaConsultaDeNotas();

  DefinirComponenteProprietarioDosCamposDaConsultaDeNotas;

//  for i := 0 to tv.GroupedColumnCount - 1 do
//    FLista_Campos.Add(tv.GroupedColumns[i].Name+'=OK');

//  DefinirCampo(ftDateTime,'DtEscrituracao',q);
//  DefinirCampo(ftInteger,'IdCodFiscal',q);
//  DefinirCampo(ftString,'NmNumero',q,20);
//  DefinirCampo(ftFloat,'VlContabil',q);
//  DefinirCampo(ftFloat,'VlICMSBase',q);
//  DefinirCampo(ftFloat,'VlICMSAliquota',q);
//  DefinirCampo(ftString,'ChaveNfeCalculada',q,60,fkCalculated);
  q.OnCalcFields := nil;

  q.SQL.Add('select CdNota');
  q.SQL.Add('       ,DtEscrituracao');
  q.SQL.Add('       ,IdCodFiscal');
  q.SQL.Add('       ,VlContabil');
  q.SQL.Add('       ,NmNumero');
  q.SQL.Add('       ,VlICMSBase');
  q.SQL.Add('       ,VlICMSAliquota as AliqICMS');
  q.SQL.Add('from &TabelaM');
  q.SQL.Add('where Dtescrituracao between :pdataIni and :pDataFim');
  q.SQL.Add('      and StTipo = ''S''');
  q.MacroByName('TabelaM').Value := 'wfiscal.M00001';
  q.ParamByName('pdataIni').AsDateTime := StrToDate('01/04/2013');
  q.ParamByName('pDataFim').AsDateTime := StrToDate('30/04/2013');

  q.DisableControls;
  q.Open;

//  FormatarCampos(q,['VlContabil', 'VlICMSBase'],[tvVlContabil, tvVlICMSBase],FLista_Campos);

  q.EnableControls;

//  tv.Controller.EditingController.HideEdit(True);
  //tv.BeginUpdate();
    
  //SetupMemData1.Fields.DisplayFormat := '##,###,##0.00';
//  SetupMemData1.First;
//  while not SetupMemData1.Eof do
//    begin
//      SetupMemData1.Edit;
//      case SetupMemData1CdEmpresa.AsInteger of
//        1: SetupMemData1.FieldByName('VlrCapital').AsFloat := 1200;
//        2: SetupMemData1.FieldByName('VlrCapital').AsFloat := 1100;
//        3: SetupMemData1.FieldByName('VlrCapital').AsFloat := 500;
//        4: SetupMemData1.FieldByName('VlrCapital').AsFloat := 120000;
//      end;
//      SetupMemData1.Post;
//
//      SetupMemData1.Next;
//    end;
//
//  tv.DataController.DataSource := DataSource1;
//  GridRefresh;
end;

procedure TForm1.DefinirCampo(pType: TFieldType; pName: string;
  pDataSet: TDataSet; pSize: integer; pKind: TFieldKind);
var
  lField: TField;
begin
  case pType of
    ftString   :
                begin
                  lField      := TStringField.Create(FTempComponent);
                  lField.Size := pSize;
                end;
    ftInteger  : lField := TIntegerField.Create(FTempComponent);
    ftDateTime : lField := TDateTimeField.Create(FTempComponent);
    ftFloat    :
                begin
                  lField := TFloatField.Create(FTempComponent);
                  (lField as TFloatField).DisplayFormat := '##,###,##0.00';
                end;
    ftMemo     : lField := TMemoField.Create(FTempComponent);
  else
    Exit;
  end;

  lField.FieldName := pName;
  lField.FieldKind := pKind;
  lField.DataSet   := pDataSet;
end;

procedure TForm1.DefinirComponenteProprietarioDosCamposDaConsultaDeNotas;
begin
  FTempComponent := TComponent.Create(nil);
end;

procedure TForm1.DestruirComponenteProprietarioDosCamposDaConsultaDeNotas;
begin
  if Assigned(FTempComponent) then
    FreeAndNil(FTempComponent);
end;

procedure TForm1.GridRefresh;
begin
//  tv.DataController.DataModeController.SmartRefresh := False;
//  tv.BeginUpdate;
//  SetupMemData1.Refresh;
//  tv.DataController.Filter.Refresh;
//  tv.EndUpdate;
//  tv.DataController.DataModeController.SmartRefresh := True;
end;

procedure TForm1.FormatarCampos(pQuery: TSetupQuery;
  pCampos: array of String;
  ArrayOfcxGridDBColumn: array of TcxGridDBColumn; pList: TstringList);
var i : Integer;
begin
  for i := 0 to length(pCampos) - 1 do
    if TcxGridDBColumn(ArrayOfcxGridDBColumn[i]).Visible or
       not Empty(pList.Values[TcxGridDBColumn(ArrayOfcxGridDBColumn[i]).Name]) then
      //(pQuery.Fields.FieldByName(pCampos[i]) as TFloatField).DisplayFormat := '##,###,##0.00';
      begin
        //(pQuery.Fields.FieldByName(pCampos[i]) as TFloatField).DefaultExpression := '0';
        (pQuery.Fields.FieldByName(pCampos[i]) as TFloatField).DisplayFormat := '##,###,##0.00';
      end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FLista_Campos.Free;
end;

procedure TForm1.qCalcFields(DataSet: TDataSet);
begin
  DataSet.Fields.FieldByName('ChaveNfeCalculada').AsString :=  'Edson é gostosão!!!';
end;

procedure TForm1.tvSelecaoHeaderClick(Sender: TObject);
var
  i: Integer;
begin
//  tv.Controller.EditingController.HideEdit(True);
//  tv.BeginUpdate();
//  try
//    // WFISCALDIAMOND-1012 - EduardoMendes - 04.04.2012 - Selecionando somente os records filtrados
//    for i := 0 to tv.DataController.FilteredRecordCount - 1 do
//      tv.DataController.Values[tv.DataController.FilteredRecordIndex[i], 0] := not FCheck;
//  finally
//    tv.EndUpdate();
//    tv.Controller.EditingController.ShowEdit();
//  end;

  FCheck := not FCheck;
end;

procedure TForm1.tvVlContabilGetDataText(Sender: TcxCustomGridTableItem;
  ARecordIndex: Integer; var AText: String);
begin

//  if StrToFloatDef(AText, 0) > 0 then
//    AText := FormatFloat('##0.00',StrToFloatDef(AText,0))
//  else
//    AText := '0';
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
//  tv.DataController.DataSet.Edit;
//  tv.DataController.DataSet.Fields.FieldByName('VlICMSBase').AsFloat := 1000;
//  tv.DataController.DataSet.Post;

//********************************************************************

//  q.Edit;
//  q.Fields.FieldByName('AliqICMS').Value := StrToFloat('8,2');
//  q.Post;

//  q.Edit;
//  q.Fields.FieldByName('VlICMSBase').Value := StrToFloat('8,2');
//  q.Post;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if AnsiIndexStr('Edson', ['Feio','Horroroso']) = -1 then
    ShowMessage('Vc é gostosão!!');
//  try
//    ShowMessage(floatToStr(StrToFloat('1,6')));
//  except
//    raise;
//  end;
end;

procedure TForm1.tvColumnPosChanged(Sender: TcxGridTableView;
  AColumn: TcxGridColumn);
begin
//  tvSelecao.Index := 0;
end;

procedure TForm1.tvDataControllerSummaryFooterSummaryItemsSummary(
  ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
  var OutArguments: TcxSummaryEventOutArguments);
//var lValue : Variant;
//begin
//  lValue := OutArguments.Value;
//  OutArguments.Value := 0.0;
//  if ASender.DataController.Values[Arguments.RecordIndex, tvSelecao.Index] = True then
//    OutArguments.Value := lValue;

var
  SumVlContabil, SumVlICMSBase: Extended;
  I: Integer;
begin
  //if VarToStr(ASender.DataController.Values[Arguments.RecordIndex, cxGrid1DBTableView1Group.Index]) <> 'Sotto' then
//  if ASender.DataController.Values[Arguments.RecordIndex, tvSelecao.Index] = True then
//  begin
//    SumVlContabil := SumVlContabil + ASender.DataController.Values[Arguments.RecordIndex, tvVlContabil.Index];
//    SumVlICMSBase   := SumVlICMSBase   + ASender.DataController.Values[Arguments.RecordIndex, tvVlICMSBase.Index];
//  end;
//  if Arguments.SummaryItem = Arguments.SummaryItem.SummaryItems[ASender.ItemOfItemLink(tvVlContabil).Index] then
//    OutArguments.Value := SumVlContabil
//  else
//    if Arguments.SummaryItem = Arguments.SummaryItem.SummaryItems[ASender.ItemOfItemLink(tvVlICMSBase).Index] then
//      OutArguments.Value := SumVlICMSBase;
end;

end.
