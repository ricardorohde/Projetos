unit Call;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TCallBack = procedure(Mensagem: String) of object;

  TFormBpl = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
   // Procedure SouCallback(Mensagem: String);
   FCallBack: TCallBack;
  public
    { Public declarations }
    procedure ChamaCallBack(CallBack: TCallBack);

    property  CallBack: TCallBack  read FCallBack Write FCallBack;
  end;

var
  FormBpl: TFormBpl;

implementation


{$R *.dfm}

{ TForm1 }

procedure TFormBpl.ChamaCallBack(CallBack: TCallBack);
begin
  CallBack('Mensagem Vinda da BPL');
end;

{procedure TForm1.SouCallback(Mensagem: String);
begin
  Showmessage(Mensagem);
end;  }

procedure TFormBpl.Button1Click(Sender: TObject);
begin
 //ChamaCallBack(SouCallBack);
 FCallBack('Mensagem Vinda da BPL NOVA');
end;



procedure TFormBpl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action := caFree;
end;


//



end.
