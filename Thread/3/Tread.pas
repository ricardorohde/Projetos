unit Tread;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, ComCtrls,
  ToolWin, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxmdaset, DBClient,
  MemDS, DBAccess, Uni, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, 
  StrUtils, Grids, DBGrids, Menus, cxCheckBox, cxGridBandedTableView,
  cxGridDBBandedTableView, cxDBLookupComboBox, cxCalc, cxSpinEdit;

type
  ThreadProgress = class(TThread)
  private
    { Private declarations }
    procedure FormShow(Sender: TObject);

  protected
    procedure Execute; override;
    Procedure AtualizaCaption;
  public
    procedure AfterConstruction; override;
  end;

  TLoadingProgress = Class
     private
       FThreadProgress : ThreadProgress;

     public
       procedure Executar();
       procedure Finalizar();
  end;

const MAX_VALUE = 100000;

Var
  i : integer; //Variavel de controle
  Form     : TForm;
  progress : TProgressBar;
  Descricao : TLabel;
  GroupBox  : TGroupBox;

implementation

{ ThreadProgress }

procedure ThreadProgress.AfterConstruction;
begin
  inherited;
  Form := TForm.Create(Application);
  GroupBox  := TGroupBox.Create(Form);
  progress := TProgressBar.Create(Form);
  Descricao := TLabel.Create(Form);
  try
    //Form
    with Form do
    begin
      Position    := poScreenCenter;
      BorderStyle := bsNone;
      BorderIcons := [];
      Height      := 60;
      Width       := 307;

      with GroupBox do
      begin
        Parent := Form;
        Align := alClient;
      end;

      //Label
      with Descricao do
      begin
        Parent := GroupBox;

        AutoSize := True;

        Left := 100;//MulDiv(8, DialogUnits.X, 4);

        Top := 10;//MulDiv(35, DialogUnits.Y, 8);

        Caption := 'Processando...';
        Font.Style := [fsBold];
      end;

      //Progress Bar
      with progress do
      begin
        Parent  := Form;
        Top     := 25;
        Left    := 3;
        Width   := 300;
        Height  := 20;
        Max     := MAX_VALUE;
      end;
    end;
    
//    Form.OnShow      := FormShow;
    Execute;
  finally
    FreeAndNil(progress);
    FreeAndNil(Form);
  end;
end;

procedure ThreadProgress.AtualizaCaption;
begin
  progress.Position := i;

  if (progress.Position = MAX_VALUE) then
    begin
      progress.Position := 0 + 10000;
      Form.Repaint;
      i := 0;
    end;
end;

procedure ThreadProgress.Execute;
begin
//  inherited;
  Form.Show;
  Form.Repaint;

  for i := 0 to MAX_VALUE do
    synchronize(AtualizaCaption);
end;

procedure ThreadProgress.FormShow(Sender: TObject);
begin
//  Execute;
//  for i := 0 to MAX_VALUE do
//    synchronize(AtualizaCaption);
end;

{ tLoadingProgress }

procedure TLoadingProgress.Executar;
begin
  FThreadProgress := ThreadProgress.Create(True);
  FThreadProgress.FreeOnTerminate := true;
  FThreadProgress.Priority := tpIdle;
  FThreadProgress.Resume;
end;

procedure TLoadingProgress.Finalizar;
begin
  FThreadProgress.Suspend;
end;

end.
