unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, DB, cxDBData, StdCtrls,
  dxmdaset, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxInplaceContainer, cxVGrid, cxOI;

const
  UM_MYMESSAGE = WM_USER + 1;

type
  TForm1 = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1RecId: TcxGridDBColumn;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1Name: TcxGridDBColumn;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView2RecId: TcxGridDBColumn;
    cxGrid1DBTableView2DetailID: TcxGridDBColumn;
    cxGrid1DBTableView2Text: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1Level2: TcxGridLevel;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    dxMemData1: TdxMemData;
    dxMemData1ID: TIntegerField;
    dxMemData1Name: TStringField;
    dxMemData2: TdxMemData;
    dxMemData2DetailID: TIntegerField;
    dxMemData2Text: TStringField;
    Button1: TButton;
    cxGrid1Level3: TcxGridLevel;
    procedure Button1Click(Sender: TObject);
    procedure umMyMessage(var Message: TMessage); message UM_MYMESSAGE;
    procedure cxGrid1DBTableView2DataControllerFilterChanged(
      Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);

  procedure SetFilter(AView: TcxGridDBTableView; AColumn: TcxGridDBColumn; AKind: TcxFilterOperatorKind; AValue: Variant; ADisplayValue: string);
  var
    AItemList: TcxFilterCriteriaItemList;
  begin
    AView.DataController.Filter.BeginUpdate;
    try
      AView.DataController.Filter.Root.Clear;
      AView.DataController.Filter.Root.AddItem( AColumn, AKind, AValue, ADisplayValue);
    finally
      AView.DataController.Filter.EndUpdate;
      AView.DataController.Filter.Active := true;
    end;
  end;

begin
  SetFilter(cxGrid1DBTableView1, cxGrid1DBTableView1.GetColumnByFieldName('ID'), foLess, 3, '3');
  SetFilter(cxGrid1DBTableView2, cxGrid1DBTableView2.GetColumnByFieldName('Text'), foLike, 'Na%', 'Na%');
end;

procedure TForm1.cxGrid1DBTableView2DataControllerFilterChanged(
  Sender: TObject);
begin
  if (Sender as TcxDBDataFilterCriteria).FilterText <> '' then
    PostMessage(Handle, UM_MYMESSAGE, 1, 0)
  else
    PostMessage(Handle, UM_MYMESSAGE, 0, 0);
end;

procedure TForm1.umMyMessage(var Message: TMessage);
begin
  if Message.WParam = 1 then
  begin
    cxGrid1.ActiveLevel := cxGrid1Level3;
    cxGrid1Level3.GridView := cxGrid1DBTableView2;
  end
  else
  begin
    cxGrid1.ActiveLevel := cxGrid1Level1;
    cxGrid1Level2.GridView := cxGrid1DBTableView2;
  end;
end;

end.
