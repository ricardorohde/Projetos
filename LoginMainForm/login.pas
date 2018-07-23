unit login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms,  Dialogs, StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit;

type
  TLoginForm = class(TForm)
    LogInButton: TButton;
    pwdLabel: TLabel;
    edtSenha: TcxTextEdit;
    procedure LogInButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  public
    class function Execute : boolean;
  end;

implementation

{$R *.dfm}

procedure TLoginForm.LogInButtonClick(Sender: TObject);
begin
  if edtSenha.Text = 'delphi' then
    ModalResult := mrOK
  else
    ModalResult := mrAbort;
end;

class function TLoginForm.Execute: boolean;
begin
  with TLoginForm.Create(nil) do
  try
    Result := ShowModal = mrOk;
  finally
    Free;
  end;
end;

procedure TLoginForm.FormCreate(Sender: TObject);
begin
  edtSenha.Text := '';
end;

end.
