unit UFrmOpeIs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFrmOpeIs = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmOpeIs: TFrmOpeIs;

implementation

{$R *.DFM}

procedure TFrmOpeIs.Button1Click(Sender: TObject);
var
  S: String;
begin
  if Sender is TButton then
    S := 'Classe: TButton'
  else if Sender is TEdit then
    S := 'Classe: TEdit'
  else if Sender is TMemo then
    S := 'Classe: TMemo'
  else if Sender is TCheckBox then
    S := 'Classe: TCheckBox'
  else if Sender is TLabel then
    S := 'Classe: TLabel';
  Label1.Caption := S;
end;

end.
