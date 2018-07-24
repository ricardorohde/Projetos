unit DirectoryDialog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl, Buttons, ExtCtrls;

type
  TfmDirectoryDialog = class(TForm)
    sbOk: TSpeedButton;
    sbCancelar: TSpeedButton;
    laDiretorio: TLabel;
    dlbDiretorio: TDirectoryListBox;
    dcbDrive: TDriveComboBox;
    paPrincipal: TPanel;
    procedure sbOkClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    class function Execute(psDiretorio:string=''):string;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmDirectoryDialog: TfmDirectoryDialog;

implementation

{$R *.DFM}

class function TfmDirectoryDialog.Execute(psDiretorio:string=''):string;
var vDirectoryDialog:TfmDirectoryDialog;
begin
  vDirectoryDialog := create(application);

  if(DirectoryExists(psDiretorio))then
    vDirectoryDialog.dlbDiretorio.Directory:=psDiretorio;

  vDirectoryDialog.showModal;

  if vDirectoryDialog.ModalResult=mrOk then
    result:=vDirectoryDialog.dlbDiretorio.Directory
  else
    result:='';
end;

procedure TfmDirectoryDialog.sbOkClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TfmDirectoryDialog.sbCancelarClick(Sender: TObject);
begin
  ModalResult:= mrCancel;
end;

end.
