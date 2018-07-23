unit socket;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    btnJogar: TButton;
    ClientSocket1: TClientSocket;
    ServerSocket1: TServerSocket;
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure btnJogarClick(Sender: TObject);
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  meunro, nrorec: integer;

implementation

{$R *.dfm}

procedure TForm1.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
begin
nrorec:= strtointdef(Socket.ReceiveText,0);
if meunro > 0 then
    begin
    if (nrorec + meunro) mod 2 = 0 then
        begin
        showmessage('Seu Nro: ' + inttostr(meunro) + '   Nro Recebido: '+ inttostr(nrorec) + '  VOCÊ GANHOU!');
        end
    else
        begin
        showmessage('Seu Nro: ' + inttostr(meunro) + '   Nro Recebido: '+ inttostr(nrorec) + '  VOCÊ PERDEU!');
        end;
    nrorec:=0;
    meunro:=0;
    end;
end;

procedure TForm1.btnJogarClick(Sender: TObject);
begin
meunro:=strtointdef(Edit1.text,0);
ServerSocket1.Socket.Connections[0].SendText(Edit1.text);
if nrorec>0 then
    begin
    if (nrorec + meunro) mod 2 = 0 then
        begin
        showmessage('Seu Nro: ' + inttostr(meunro) + '   Nro Recebido: '+ inttostr(nrorec) + '  VOCÊ GANHOU!');
        end
    else
        begin
        showmessage('Seu Nro: ' + inttostr(meunro) + '   Nro Recebido: '+ inttostr(nrorec) + '  VOCÊ PERDEU!');
        end;
    nrorec:=0;
    meunro:=0;
    end;
end;

procedure TForm1.ServerSocket1ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
showmessage('Cliente conectou!');
btnJogar.Enabled:=true;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  btnJogar.Enabled:=false;
end;

end.
