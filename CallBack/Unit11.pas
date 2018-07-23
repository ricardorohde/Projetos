unit Unit11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormExePrincipal = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    Procedure SouCallback(Mensagem: String);
  end;

var
  FormExePrincipal: TFormExePrincipal;

implementation
uses call;
{$R *.dfm}

procedure TFormExePrincipal.Button1Click(Sender: TObject);
//var
  //formbpl: Tformbpl;
begin
    formbpl:= Tformbpl.Create(application);
    formbpl.CallBack:=SouCallback  ;
    formbpl.ShowModal;
    formbpl.Free;
end;

procedure TFormExePrincipal.SouCallback(Mensagem: String);
begin
  Showmessage(Mensagem);
end;

end.
