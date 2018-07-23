unit USelecionarArquivo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, StdCtrls, Mask, JvExMask, JvToolEdit, cxPC, ExtCtrls,
  JvXPCore, JvXPButtons, JvExControls, JvGradientHeaderPanel;

type
  TfmSelecionar = class(TForm)
    pnlBottom: TJvGradientHeaderPanel;
    btnOK: TJvXPButton;
    Panel1: TPanel;
    rgConexao: TRadioGroup;
    pc: TcxPageControl;
    tbNao: TcxTabSheet;
    tbSim: TcxTabSheet;
    edtDirectory: TJvDirectoryEdit;
    edtArquivo: TEdit;
    btnSearch: TJvXPButton;
    Label1: TLabel;
    Label2: TLabel;
    OpenDialog: TOpenDialog;
    procedure rgConexaoClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
  private
    FFileName : string;

    function Validar(pIndex : Integer): Boolean;
    function GetFileName: String;
    { Private declarations }
  public
    { Public declarations }
    property FileName : String read GetFileName;
  end;

var
  fmSelecionar: TfmSelecionar;

implementation

{$R *.dfm}

procedure TfmSelecionar.rgConexaoClick(Sender: TObject);
begin
  if (rgConexao.ItemIndex = 1) then
    begin
      pc.ActivePage := tbSim;
      edtDirectory.Clear;
    end
  else
    begin
      pc.ActivePage := tbNao;
      edtArquivo.Clear;
    end;
end;

procedure TfmSelecionar.btnOKClick(Sender: TObject);
begin
  if Validar(rgConexao.ItemIndex) then
    begin
      if edtArquivo.Text <> '' then
        FFileName := edtArquivo.Text
      else
        FFileName := edtDirectory.Text + '\QUALQUERUM.dbf';

      ModalResult := mrOk
    end
  else
    Abort;
    //ModalResult := mrCancel;
end;

function TfmSelecionar.Validar(pIndex : Integer): Boolean;
begin
  Result := False;
  case pIndex of
    0:
    begin
      if (edtArquivo.Text = '') then
      begin
        ShowMessage('Arquivo não informado. Verifique!');
        edtArquivo.SetFocus;
        Exit;
      end;

      if not FileExists(edtArquivo.Text) then
      begin
        ShowMessage('Arquivo não existe. Verifique!');
        edtArquivo.SetFocus;
        Exit;
      end;
    end;
    1:
    begin
      if (edtDirectory.Text = '') then
      begin
        ShowMessage('Diretório não informado. Verifique!');
        edtDirectory.SetFocus;
        Exit;
      end;

      if not DirectoryExists(edtDirectory.Text) then
      begin
        ShowMessage('Diretório não existe. Verifique!');
        edtDirectory.SetFocus;
        Exit;
      end;
    end;
  end;
  Result := True;
end;

procedure TfmSelecionar.FormShow(Sender: TObject);
begin
  ModalResult   := mrNone;
  pc.ActivePage := tbNao;
end;

procedure TfmSelecionar.btnSearchClick(Sender: TObject);
begin
  if OpenDialog.Execute then
    edtArquivo.Text := OpenDialog.FileName;
end;

function TfmSelecionar.GetFileName: String;
begin
  Result := FFileName;
end;

end.
