unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    Horarios1: TMenuItem;
    procedure Horarios1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure BeforeDestruction; override;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses DataModule, uCadastro_Horarios;

{$R *.dfm}

procedure TfrmPrincipal.Horarios1Click(Sender: TObject);
begin
  frmCadastro_Horarios := TfrmCadastro_Horarios.Create(Self);
  frmCadastro_Horarios.ShowModal;
  FreeAndNil(frmCadastro_Horarios);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  DataModule1 := TDataModule1.Create(Self);
end;

procedure TfrmPrincipal.BeforeDestruction;
begin
  inherited;
  FreeAndNil( DataModule1 );
end;

end.
