unit BaseForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ovcstate, ovcbase, ovcfiler, ovcstore, StdCtrls,
  ExtCtrls;

type
  TfmBase = class(TForm)
    paMenu: TPanel;
    alMain: TActionList;
    actCloseWindow: TAction;
    actHelp: TAction;
    paBaseClose: TPanel;
    Label5: TLabel;
    btnCloseWindow: TButton;
    procedure actCloseWindowExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure actHelpExecute(Sender: TObject);
  private
    procedure setCloseButtonLocation;
  public
    { Public declarations }
  end;

var
  fmBase: TfmBase;

implementation

{$R *.dfm}

procedure TfmBase.actCloseWindowExecute(Sender: TObject);
begin
  close;
end;

procedure TfmBase.setCloseButtonLocation;
begin
//  btnCloseWindow.Left := paMenu.Width - btnCloseWindow.Width - 2;
end;

procedure TfmBase.actHelpExecute(Sender: TObject);
begin
  Application.HelpCommand(HELP_Finder, 0);
end;

procedure TfmBase.FormActivate(Sender: TObject);
begin
//  setCloseButtonLocation;
end;

procedure TfmBase.FormResize(Sender: TObject);
begin
//  setCloseButtonLocation;
end;

end.
