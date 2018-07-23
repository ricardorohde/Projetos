// Direct Oracle Access - PictureDemo
// Allround Automations
// support@allroundautomations.nl
// http://www.allroundautomations.nl
//
// This application demonstrates:
// - The use of a BLOB field in a dataset
// - The use of Data Definition Language (creating & dropping a table)
// - The use of a Data Module for the DOA components

unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  JPeg, StdCtrls, DBCtrls, Mask, ExtDlgs, Buttons, Grids, DBGrids, Db,
  OracleData, Oracle, ExtCtrls, DMUnit;

type
  TMainForm = class(TForm)
    GridPanel: TPanel;
    NavigatorPanel: TPanel;
    PicPanel: TPanel;
    DataPanel: TPanel;
    DBGrid: TDBGrid;
    DBNavigator: TDBNavigator;
    LoadButton: TSpeedButton;
    DBImage: TDBImage;
    NameGroupBox: TGroupBox;
    InfoGroupBox: TGroupBox;
    InfoDBMemo: TDBMemo;
    NameDBEdit: TDBEdit;
    OpenPictureDialog: TOpenPictureDialog;
    DeletePanel: TPanel;
    DropButton: TSpeedButton;
    procedure LoadButtonClick(Sender: TObject);
    procedure DropButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.LoadButtonClick(Sender: TObject);
begin
  // Open the load picture dialog
  if OpenPictureDialog.Execute then
  begin
    // Switch to edit mode before loading the picture
    if DM.OracleDataSet.State = dsBrowse then DM.OracleDataSet.Edit;
    DM.Picture.LoadFromFile(OpenPictureDialog.FileName);
    // Set the Filename field
    DM.Filename.Value := OpenPictureDialog.Filename;
  end;
end;

procedure TMainForm.DropButtonClick(Sender: TObject);
begin
  // Should the demo table be dropped?
  if Application.MessageBox('Drop the demo table DOA_PICTUREDEMO ?', 'Confirm',
       mb_YESNO + mb_IconQuestion) = IDYES then
  begin
    // First deactivate the dataset
    DM.OracleDataSet.Active := False;
    // Then drop the table
    DM.DropTableQuery.Execute;
    // There is nothing left to do, so we terminate the program
    Application.Terminate;
  end;
end;

end.
