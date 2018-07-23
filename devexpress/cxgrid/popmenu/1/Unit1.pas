unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxGridCustomTableView, cxGridTableView,
  cxControls, cxGridCustomView, cxClasses, cxGridLevel, cxGrid, cxPC,
  dxBar, dxBarExtItems, cxRichEdit, cxContainer, cxGroupBox, cxCheckGroup,
  cxImage, ImgList, cxVGrid, cxInplaceContainer, cxEditRepositoryItems,
  StdCtrls, DB, DBTables, cxDBVGrid, Mask, dxDockControl, dxDockPanel,
  cxDBData, cxGridDBTableView, cxGridCustomPopupMenu, cxGridPopupMenu, cxGridStdPopupMenu,
  cxTextEdit;

type
  TForm1 = class(TForm)
    Table1: TTable;
    DataSource1: TDataSource;
    cxGridPopupMenu1: TcxGridPopupMenu;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1SpeciesNo: TcxGridDBColumn;
    cxGrid1DBTableView1Category: TcxGridDBColumn;
    cxGrid1DBTableView1Common_Name: TcxGridDBColumn;
    cxGrid1DBTableView1SpeciesName: TcxGridDBColumn;
    cxGrid1DBTableView1Lengthcm: TcxGridDBColumn;
    cxGrid1DBTableView1Length_In: TcxGridDBColumn;
    cxGrid1DBTableView1Notes: TcxGridDBColumn;
    cxGrid1DBTableView1Graphic: TcxGridDBColumn;
    cxEditRepository1: TcxEditRepository;
    cxEditRepository1CalcItem1: TcxEditRepositoryCalcItem;
    procedure cxGridPopupMenu1Popup(ASenderMenu: TComponent;
      AHitTest: TcxCustomGridHitTest; X, Y: Integer;
      var AllowPopup: Boolean);
    procedure StdHeaderMenuPopup(Sender: TObject);
    procedure DoItemClick(Sender: TObject);
  private
    FColumn: TcxGridColumn;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Menus;

{$R *.dfm}

procedure TForm1.DoItemClick(Sender: TObject);
begin
  ShowMessage(TMenuItem(Sender).Caption);
end;

procedure TForm1.cxGridPopupMenu1Popup(ASenderMenu: TComponent;
  AHitTest: TcxCustomGridHitTest; X, Y: Integer; var AllowPopup: Boolean);
begin
  if (AHitTest is TcxGridColumnHeaderHitTest) and (ASenderMenu is TcxGridStdHeaderMenu) then
  begin
    FColumn := TcxGridColumnHeaderHitTest(AHitTest).Column;
    TcxGridStdHeaderMenu(ASenderMenu).OnPopup := StdHeaderMenuPopup
  end;
end;

procedure TForm1.StdHeaderMenuPopup(Sender: TObject);

  function IsItemsExists(AMenu: TcxGridStdHeaderMenu): Boolean;
  var
    I: Integer;
  begin
    Result := False;
    with AMenu.Items do
      for I := 0 to Count - 1 do
        if (Items[I].Name = 'ExpandItem') or (Items[I].Name = 'CollapseItem') then
        begin
          Result := True;
          System.Break;
        end;
  end;

var
  AItem: TMenuItem;
begin
  if not IsItemsExists(TcxGridStdHeaderMenu(Sender)) then
    with TcxGridStdHeaderMenu(Sender) do
    begin
      AItem := TMenuItem.Create(Self);
      AItem.Caption := 'Expand';
      AItem.Visible := True;
      AItem.Name := 'ExpandItem';
      AItem.OnClick := DoItemClick;
      Items.Add(AItem);

      AItem := TMenuItem.Create(Self);
      AItem.Caption := 'Collapse';
      AItem.Visible := True;
      AItem.Name := 'CollapseItem';
      AItem.OnClick := DoItemClick;
      Items.Add(AItem);
    end;
end;

end.
