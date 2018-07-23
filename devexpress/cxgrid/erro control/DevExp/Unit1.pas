unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ExtCtrls,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinsDefaultPainters, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxGridDBDataDefinitions, cxCustomData,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue;

type
  TGridPanel = class (TPanel)
  private
    FGrid : TcxGrid;
  public
    constructor Create(AOwner: TComponent); override;

  end;

  TForm1 = class(TForm)
    cxPopupEdit1: TcxPopupEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  Dummy : TGridPanel;
begin
  Dummy := TGridPanel.Create(Self);
  cxPopupEdit1.Properties.PopupControl := Dummy;
end;

{ TGridPanel }

constructor TGridPanel.Create(AOwner: TComponent);
begin
  inherited;
  FGrid := TCxGrid.Create(Self);
  FGrid.Parent := Self;
  FGrid.Align := alClient;
  FGrid.CreateView(TcxGridDBTableView);
  TCxGridDBTableView(FGrid.Views[0]).OptionsData.Appending := false;
  TCxGridDBTableView(FGrid.Views[0]).OptionsData.Deleting := false;
  TCxGridDBTableView(FGrid.Views[0]).OptionsData.Editing := false;
  TCxGridDBTableView(FGrid.Views[0]).OptionsData.Inserting := false;
  TCxGridDBTableView(FGrid.Views[0]).OptionsSelection.CellSelect := false;
  TCxGridDBTableView(FGrid.Views[0]).OptionsSelection.HideSelection := false;
  TCxGridDBTableView(FGrid.Views[0]).OptionsSelection.InvertSelect := false;
  TCxGridDBTableView(FGrid.Views[0]).OptionsSelection.UnselectFocusedRecordOnExit := false;
  TCxGridDBTableView(FGrid.Views[0]).OptionsSelection.CellMultiSelect := false;
  TCxGridDBTableView(FGrid.Views[0]).OptionsView.GroupByBox := false;
  TCxGridDBTableView(FGrid.Views[0]).DataController.Options := TCxGridDBTableView(FGrid.Views[0]).DataController.Options + [dcoCaseInsensitive];
  TCxGridDBTableView(FGrid.Views[0]).FilterRow.Visible := true;
  with FGrid.Levels.Add do
  begin
    GridView := FGrid.Views[0];
  end;

end;

end.
