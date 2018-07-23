unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms,  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, ComCtrls,
  ToolWin, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxmdaset, DBClient,
  MemDS, DBAccess, Uni, StrUtils, Grids, DBGrids, Menus, Tread;

type
  TMessageProgress = class
    private
      procedure FormShow(Sender: TObject);

    public
      progress : TProgressBar;

      procedure Execute();
  end;

var
  Form : TForm;
  ThreadProgress : TThreadProgress;

const MAX_VALUE = 100000;

implementation

{ TForm }

procedure TMessageProgress.Execute;
begin
  Form := TForm.Create(Application);
  progress := TProgressBar.Create(nil);
  try
    Form.Position    := poScreenCenter;
    Form.BorderStyle := bsSingle;
    Form.BorderIcons := [];
    Form.Height      := 60;
    Form.Width       := 307;
    progress.Parent  := Form;
    progress.Top     := 3;
    progress.Width   := 300;
    progress.Height  := 30;
    Form.OnShow      := FormShow;
    Form.ShowModal;

  finally
    FreeAndNil(progress);
    FreeAndNil(Form);
  end;
end;

procedure TMessageProgress.FormShow(Sender: TObject);
begin
  ThreadProgress := ThreadProgress.Create(true);
  ThreadProgress.FreeOnTerminate := true;
  ThreadProgress.Priority := tpNormal;
  ThreadProgress.Resume;
end;

//initialization
//  RegisterClass(TForm1);

end.
