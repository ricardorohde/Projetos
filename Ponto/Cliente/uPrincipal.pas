unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, OleCtrls, SHDocVw, cxLocalization, WinSkinData,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBar, cxClasses,
  dxRibbon, ImgList;

type
  TfrmPrincipal = class(TForm)
    WebBrowser1: TWebBrowser;
    cxLocalizer1: TcxLocalizer;
    skdata: TSkinData;
    BarManager: TdxBarManager;
    RibbonTab1: TdxRibbonTab;
    Ribbon: TdxRibbon;
    BarCadastro: TdxBar;
    btnEmpresas: TdxBarLargeButton;
    btnFuncionarios: TdxBarLargeButton;
    btnHorarios: TdxBarLargeButton;
    btnFeriados: TdxBarLargeButton;
    dxRibbon1Tab2: TdxRibbonTab;
    BarMovimentacoes: TdxBar;
    btnMunicipios: TdxBarLargeButton;
    btnMovimentacoes: TdxBarLargeButton;
    cxImageList1: TcxImageList;
    btnUsuario: TdxBarLargeButton;
    BarManagerBar1: TdxBar;
    btnImportadorAFD: TdxBarLargeButton;
    procedure FormShow(Sender: TObject);
    procedure mniSairClick(Sender: TObject);
    procedure btnEmpresasClick(Sender: TObject);
    procedure btnFuncionariosClick(Sender: TObject);
    procedure btnHorariosClick(Sender: TObject);
    procedure btnFeriadosClick(Sender: TObject);
    procedure btnMunicipiosClick(Sender: TObject);
    procedure btnUsuarioClick(Sender: TObject);
    procedure btnImportadorAFDClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uCadastro_Funcionario, uCadastro_Empresa, LIB, uCadastro_Horario,
  uCadastro_Feriado, uCadastro_Municipio, uCadastro_Usuario;

{$R *.dfm}

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
//  WebBrowser1.Navigate('http://www.horacerta.com.br/');
  skdata.Active := True;

  if FileExists(ExtractFilePath(Application.ExeName)+'\TraduçãoDev.ini') then
  begin
    cxLocalizer1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\TraduçãoDev.ini');
    cxLocalizer1.LanguageIndex := 1;
    cxLocalizer1.Active := True;
  end;

  Ribbon.Tabs[0].Active := True;
end;

procedure TfrmPrincipal.mniSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.btnEmpresasClick(Sender: TObject);
begin
  CriaForm(TfrmCadastro_Empresa, taShowModal);
end;

procedure TfrmPrincipal.btnFuncionariosClick(Sender: TObject);
begin
  CriaForm(TfrmCadastro_Funcionario, taShowModal);
end;

procedure TfrmPrincipal.btnHorariosClick(Sender: TObject);
begin
  CriaForm(TfrmCadastro_Horario, taShowModal);
end;

procedure TfrmPrincipal.btnFeriadosClick(Sender: TObject);
begin
  CriaForm(TfrmCadastro_Feriado, taShowModal);
end;

procedure TfrmPrincipal.btnMunicipiosClick(Sender: TObject);
begin
  CriaForm(TfrmCadastro_Municipio, taShowModal);
end;

procedure TfrmPrincipal.btnUsuarioClick(Sender: TObject);
begin
  CriaForm(TfrmCadastro_Usuario, taShowModal);
end;

procedure TfrmPrincipal.btnImportadorAFDClick(Sender: TObject);
begin
//
end;

end.
