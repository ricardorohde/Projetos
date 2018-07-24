unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, udmmain;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Clientes1: TMenuItem;
    procedure Clientes1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  BaseLibrary, uCadastroClientes;

{$R *.dfm}

procedure TfrmPrincipal.Clientes1Click(Sender: TObject);
begin
  frmCadastroClientes:= TfrmCadastroClientes.Create(Self);
  frmCadastroClientes.ShowModal;
  frmCadastroClientes.Free;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  try
    DataModule1.IBDatabase1.Connected:= True;
  except on e:exception do
    begin
      Erro('Não foi possível conectar ao banco de dados.'+ CRLF + 'Erro: '+ CRLF + e.message);
      Application.Terminate;
    end;
  end;
end;

end.
