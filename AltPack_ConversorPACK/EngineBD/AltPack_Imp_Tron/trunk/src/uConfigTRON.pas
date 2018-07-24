{-------------------------------------------------------------------------------
Alterdata Importador (sistema TRON-Windows)
Processo: 0004057980
Unit: uConfigTRON
Criado por: RodrigoSouza@dsn
Data: 03/12/2010.
Descrição: Form que contem as configurações necessárias para conexão com DB TRON.
--------------------------------------------------------------------------------
Processo    Data       Versão  Usuário        Historico
0004057980  05/07/2011 5.13100 Matheus.dsn    Finalização do projeto.
0005311115  16/02/2012 5.13101 Matheus.dsn    Alguns databases da Tron estão com a versão do Firebird para 2.5.
--------------------------------------------------------------------------------}

unit uConfigTRON;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, cxTextEdit, cxMaskEdit,
  cxButtonEdit, cxControls, cxContainer, cxEdit, cxGroupBox, ExtCtrls,IBODataset,
  IB_Components, StdCtrls, Buttons, cxShellBrowserDialog, Alterdata,
  ComCtrls, AlterdataHints;

type
  TfrmConfigTron = class(TForm)
    dlgOpen: TcxShellBrowserDialog;
    pnlConfigImportacao: TPanel;
    pnlAlterdata: TPanel;
    grpDiretorioCONVERSOR: TGroupBox;
    edtDiretorioCONVERSOR: TEdit;
    btnDiretorioCONVERSOR: TBitBtn;
    grpSistemas: TGroupBox;
    chkWdp: TCheckBox;
    PageControl: TPageControl;
    tsWdp: TTabSheet;
    GroupBox1: TGroupBox;
    edtDiretorioDP: TEdit;
    btnDiretorioDP: TBitBtn;
    tsConfiguracao: TTabSheet;
    GroupBox2: TGroupBox;
    edtUSERNAME: TEdit;
    edtPASSWORD: TEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cbxDatabaseVersion: TComboBox;
    lblDatabaseVersion: TLabel;
    procedure btnDiretorioCONVERSORClick(Sender: TObject);
    procedure btnDiretorioDPClick(Sender: TObject);
    procedure chkWdpClick(Sender: TObject);
    procedure edtDiretorioCONVERSORExit(Sender: TObject);
    procedure edtUSERNAMEExit(Sender: TObject);
    procedure edtPASSWORDExit(Sender: TObject);
    procedure edtDiretorioDPExit(Sender: TObject);
  private
    { Private declarations }
    procedure SelecionaDiretorio(const Edit: TEdit);
    procedure UpdateHint(const Edit: TEdit; const IsDirectory: Boolean = False);
  public
    { Public declarations }
    function GetEnderecoDB(vDB : string) : string;
  end;

implementation

{$R *.dfm}

procedure TfrmConfigTron.btnDiretorioCONVERSORClick(Sender: TObject);
begin
  SelecionaDiretorio(edtDiretorioCONVERSOR);
end;

procedure TfrmConfigTron.btnDiretorioDPClick(Sender: TObject);
begin
  SelecionaDiretorio(edtDiretorioDP);
end;

procedure TfrmConfigTron.SelecionaDiretorio(const Edit: TEdit);
begin
  Edit.Text := Trim(UpperCase(Edit.Text));

  if DirectoryExists(Edit.Text) then
    dlgOpen.Path := Edit.Text
  else
    dlgOpen.Path := PutLastBackSlash(GetEnvironmentVariable('HOMEDRIVE'));

  if dlgOpen.Execute then
    begin
      Edit.Text := UpperCase(dlgOpen.Path);
    end;

  UpdateHint(Edit, True);
end;

procedure TfrmConfigTron.UpdateHint(const Edit: TEdit; const IsDirectory: Boolean);
begin
  if Edit.Text = EmptyStr then
    begin
      ShowHintWarning(Edit, 'Informação necessária.', True);
      Exit;
    end;

  if IsDirectory then
    if not DirectoryExists(Edit.Text) then
      begin
        ShowHintError(Edit, 'Diretório inexistente.', True);
        Edit.Text := EmptyStr;
        Edit.SetFocus;
        Exit;
      end;

  ClearHint(Edit);
end;

function TfrmConfigTron.GetEnderecoDB(vDB: string): string;
begin
  if vDB = 'DB_CONVERSOR' then
    Result := PutLastBackSlash(edtDiretorioCONVERSOR.Text);

  if vDB = 'DB_DP' then
    Result := PutLastBackSlash(edtDiretorioDP.Text);

  if vDB = 'DB_USERNAME' then
    Result := edtUSERNAME.Text;

  if vDB = 'DB_PASSWORD' then
    Result := edtPASSWORD.Text;
end;

procedure TfrmConfigTron.chkWdpClick(Sender: TObject);
begin
  chkWdp.Checked := True;
end;
    
procedure TfrmConfigTron.edtDiretorioCONVERSORExit(Sender: TObject);
begin
  UpdateHint(edtDiretorioCONVERSOR, True);
end;

procedure TfrmConfigTron.edtUSERNAMEExit(Sender: TObject);
begin
  UpdateHint(edtUSERNAME);
end;

procedure TfrmConfigTron.edtPASSWORDExit(Sender: TObject);
begin
  UpdateHint(edtPASSWORD);
end;

procedure TfrmConfigTron.edtDiretorioDPExit(Sender: TObject);
begin
  UpdateHint(edtDiretorioDP, True);
end;

end.
