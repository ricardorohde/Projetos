unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, OleCtrls, SHDocVw, cxLocalization;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    mniArquivos: TMenuItem;
    mniCadastro: TMenuItem;
    mniEmpresa: TMenuItem;
    mniFuncionarios: TMenuItem;
    WebBrowser1: TWebBrowser;
    mniSair: TMenuItem;
    cxLocalizer1: TcxLocalizer;
    Horario: TMenuItem;
    Feriado: TMenuItem;
    procedure mniFuncionariosClick(Sender: TObject);
    procedure mniEmpresaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mniSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uCadastro_Funcionario, uCadastro_Empresa, LIB;

{$R *.dfm}

procedure TfrmPrincipal.mniFuncionariosClick(Sender: TObject);
begin
  CriaForm(TfrmCadastro_Funcionario);
end;

procedure TfrmPrincipal.mniEmpresaClick(Sender: TObject);
begin
  CriaForm(TfrmCadastro_Empresa);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
//  WebBrowser1.Navigate('http://www.horacerta.com.br/');

  if FileExists(ExtractFilePath(Application.ExeName)+'\TraduçãoDev.ini') then
  begin
    cxLocalizer1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\TraduçãoDev.ini');
    cxLocalizer1.LanguageIndex := 1;
    cxLocalizer1.Active := True;
  end;
end;

procedure TfrmPrincipal.mniSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
