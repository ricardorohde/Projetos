unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinscxPCPainter, StdCtrls, cxClasses,
  cxGridLevel, cxGrid, DB, dxmdaset, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView;

type
  TForm1 = class(TForm)
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Button1: TButton;
    DS: TDataSource;
    dxMemData1: TdxMemData;
    dxMemData1Name: TStringField;
    dxMemData1asdas: TIntegerField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    GridView: TcxGridDBTableView;
    GridLevel: TcxGridLevel;
    procedure GridDblClick(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  i : integer;
  aColumnSummary: TcxGridColumnSummary;
begin
  GridView:= cxGrid1.CreateView(TcxGridDBTableView) as TcxGridDBTableView;
  GridView.Name:= {IniName+}'GridView';
  GridView.DataController.DataSource:= DS;
  GridView.DataController.DataModeController.SyncMode:= true;
  GridView.OnDblClick:= GridDblClick;
  GridView.OptionsBehavior.IncSearch:= True;
  GridView.OptionsCustomize.ColumnsQuickCustomization:= True;
  GridView.OptionsCustomize.DataRowSizing:= True;
  GridView.OptionsData.Deleting:= False;
  GridView.OptionsData.Editing:= False;
  GridView.OptionsData.Inserting:= False;
  GridView.OptionsSelection.MultiSelect:= True;
  GridView.OptionsView.Footer:= True;
  GridView.OptionsView.GroupFooters:= gfVisibleWhenExpanded;
  GridView.OptionsView.HeaderAutoHeight:= true;

  GridLevel := cxGrid1.Levels.Add;
  GridLevel.Name:= {IniName+}'GridLevel';
  GridLevel.GridView:= GridView;
  //GroupSummary:= TcxDataSummary.Create(GridView.DataController);


  //FieldList.Clear;
  GridView.DataController.BeginFullUpdate;
  if GridView.ItemCount > 0 then
    GridView.ClearItems;
  for i := 0 to dxMemData1.FieldCount - 1 do
    begin

      GridView.DataController.CreateItemByField(dxMemData1.Fields[i]);
      GridView.Items[i].Options.IncSearch:= true;
      GridView.Columns[i].Visible:= true;
      case dxMemData1.Fields[i].DataType of
        ftDateTime:
          begin
          end;
        ftTimeStamp:
          begin
          end;
        ftInteger:
          begin
            aColumnSummary:= TcxGridColumnSummary.Create(GridView.Columns[i]);
            GridView.Columns[i].Summary.FooterKind:= skCount;
            GridView.Columns[i].Summary.GroupFooterKind:= skCount;
          end;
        ftMemo:
          begin

          end;
        ftFloat:
          begin
            aColumnSummary:= TcxGridColumnSummary.Create(GridView.Columns[i]);
            GridView.Columns[i].Summary.FooterKind:= skSum;
            GridView.Columns[i].Summary.GroupFooterKind:= skSum;
          end;
        ftBCD:
          begin
            aColumnSummary:= TcxGridColumnSummary.Create(GridView.Columns[i]);
            GridView.Columns[i].Summary.FooterKind:= skSum;
            GridView.Columns[i].Summary.GroupFooterKind:= skSum;
          end;
        ftGUID:
           begin
             GridView.Columns[i].Visible:= false;
           end;
      end;
    end;
  GridView.DataController.EndFullUpdate;

end;

procedure TForm1.GridDblClick(Sender: TObject);
begin
  //
end;

end.
