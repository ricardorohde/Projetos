unit uDesenvolvedor_Relatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxExportPDF, frxPreview, frxDBSet, ExtCtrls, frxDesgn,
  Menus, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter, cxPC;

type
  TfrmDesenvolvedor_Relatorio = class(TForm)
    frxDBDataset1: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxReport1: TfrxReport;
    frxDesigner1: TfrxDesigner;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    NewMI: TMenuItem;
    NewReportMI: TMenuItem;
    NewPageMI: TMenuItem;
    NewDialogMI: TMenuItem;
    N9: TMenuItem;
    OpenMI: TMenuItem;
    SaveMI: TMenuItem;
    SaveasMI: TMenuItem;
    N1: TMenuItem;
    PreviewMI: TMenuItem;
    PagesettingsMI: TMenuItem;
    N2: TMenuItem;
    ExitMI: TMenuItem;
    Edit1: TMenuItem;
    UndoMI: TMenuItem;
    RedoMI: TMenuItem;
    N3: TMenuItem;
    CutMI: TMenuItem;
    CopyMI: TMenuItem;
    PasteMI: TMenuItem;
    N4: TMenuItem;
    DeleteMI: TMenuItem;
    DeletePageMI: TMenuItem;
    SelectAllMI: TMenuItem;
    GroupMI: TMenuItem;
    UngroupMI: TMenuItem;
    EditMI: TMenuItem;
    N6: TMenuItem;
    FindMI: TMenuItem;
    ReplaceMI: TMenuItem;
    FindNextMI: TMenuItem;
    N5: TMenuItem;
    BringtoFrontMI: TMenuItem;
    SendtoBackMI: TMenuItem;
    Report1: TMenuItem;
    DataMI: TMenuItem;
    VariablesMI: TMenuItem;
    StylesMI: TMenuItem;
    ReportOptionsMI: TMenuItem;
    View1: TMenuItem;
    ToolbarsMI: TMenuItem;
    StandardMI: TMenuItem;
    TextMI: TMenuItem;
    FrameMI: TMenuItem;
    AlignmentPaletteMI: TMenuItem;
    ObjectInspectorMI: TMenuItem;
    DataTreeMI: TMenuItem;
    ReportTreeMI: TMenuItem;
    N7: TMenuItem;
    RulersMI: TMenuItem;
    GuidesMI: TMenuItem;
    DeleteGuidesMI: TMenuItem;
    N8: TMenuItem;
    OptionsMI: TMenuItem;
    Help1: TMenuItem;
    HelpContentsMI: TMenuItem;
    AboutFastReportMI: TMenuItem;
    PageControl: TcxPageControl;
    DesignerSheet: TcxTabSheet;
    PreviewSheet: TcxTabSheet;
    frxPreview1: TfrxPreview;
    procedure FormShow(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure ExitMIClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDesenvolvedor_Relatorio: TfrmDesenvolvedor_Relatorio;

implementation

{$R *.dfm}

uses frxRes;

procedure TfrmDesenvolvedor_Relatorio.FormShow(Sender: TObject);
var
  Designer: TfrxDesignerForm;
begin
  // prevent saving/restoring a report when previewing. This will destroy
  // objects that are loaded in the designer and will lead to AV.
  frxReport1.EngineOptions.DestroyForms := False;
  // set the custom preview
  frxReport1.Preview := frxPreview1;
  // display the designer
  frxReport1.DesignReportInPanel(DesignerSheet);

  // set FR images for our menu
  MainMenu1.Images := frxResources.MainButtonImages;
  // get the reference to the Designer
  Designer := TfrxDesignerForm(frxReport1.Designer);

  // assign FR actions to our menu items
  NewMI.Action          := Designer.NewItemCmd;
  NewReportMI.Action    := Designer.NewReportCmd;
  NewPageMI.Action      := Designer.NewPageCmd;
  NewDialogMI.Action    := Designer.NewDialogCmd;
  OpenMI.Action         := Designer.OpenCmd;
  SaveMI.Action         := Designer.SaveCmd;
  SaveasMI.Action       := Designer.SaveAsCmd;
  PreviewMI.Action      := Designer.PreviewCmd;
  PageSettingsMI.Action := Designer.PageSettingsCmd;

  UndoMI.Action         := Designer.UndoCmd;
  RedoMI.Action         := Designer.RedoCmd;
  CutMI.Action          := Designer.CutCmd;
  CopyMI.Action         := Designer.CopyCmd;
  PasteMI.Action        := Designer.PasteCmd;
  DeleteMI.Action       := Designer.DeleteCmd;
  DeletePageMI.Action   := Designer.DeletePageCmd;
  SelectAllMI.Action    := Designer.SelectAllCmd;
  GroupMI.Action        := Designer.GroupCmd;
  UngroupMI.Action      := Designer.UngroupCmd;
  EditMI.Action         := Designer.EditCmd;
  FindMI.Action         := Designer.FindCmd;
  ReplaceMI.Action      := Designer.ReplaceCmd;
  FindNextMI.Action     := Designer.FindNextCmd;
  BringtoFrontMI.Action := Designer.BringToFrontCmd;
  SendtoBackMI.Action   := Designer.SendToBackCmd;

  DataMI.Action             := Designer.ReportDataCmd;
  VariablesMI.Action        := Designer.VariablesCmd;
  StylesMI.Action           := Designer.ReportStylesCmd;
  ReportOptionsMI.Action    := Designer.ReportOptionsCmd;

  ToolbarsMI.Action         := Designer.ToolbarsCmd;
  StandardMI.Action         := Designer.StandardTBCmd;
  TextMI.Action             := Designer.TextTBCmd;
  FrameMI.Action            := Designer.FrameTBCmd;
  AlignmentPaletteMI.Action := Designer.AlignTBCmd;
  ObjectInspectorMI.Action  := Designer.InspectorTBCmd;
  DataTreeMI.Action         := Designer.DataTreeTBCmd;
  ReportTreeMI.Action       := Designer.ReportTreeTBCmd;
  RulersMI.Action           := Designer.ShowRulersCmd;
  GuidesMI.Action           := Designer.ShowGuidesCmd;
  DeleteGuidesMI.Action     := Designer.DeleteGuidesCmd;
  OptionsMI.Action          := Designer.OptionsCmd;
  HelpContentsMI.Action     := Designer.HelpContentsCmd;
  AboutFastReportMI.Action  := Designer.AboutCmd;
end;

procedure TfrmDesenvolvedor_Relatorio.PageControlChange(Sender: TObject);
begin
  if PageControl.ActivePage = PreviewSheet then
    frxReport1.PrepareReport
end;

procedure TfrmDesenvolvedor_Relatorio.ExitMIClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDesenvolvedor_Relatorio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frxReport1.Designer.Close;
end;

end.
