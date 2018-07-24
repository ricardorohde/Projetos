{-------------------------------------------------------------------------------
Alterdata Importador (sistema SPED-Contábil-Windows)
Processo: CONVPACK-329
Unit: uSPEDCONT
Criado por: edson.dsn.pack
Data: 31/08/2012.
Descrição: Form que contem as configurações necessárias para especificar o arquivo LayOut do SPED e
           colocar os dados em uma base DB.
--------------------------------------------------------------------------------
Processo    Data       Versão  Usuário        Historico
--------------------------------------------------------------------------------}
unit uConfigSPEDCONT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxLabel, ComCtrls, StdCtrls,
  Buttons, ExtCtrls, cxShellBrowserDialog, rxPlacemnt, Spin,
  // Lib Alterdata
  Alterdata,
  // Altpack_Standard
  AlterdataSystemUtils, AlterdataHints;

type
  TDirectoryDB = (DB_CONVERSOR, DB_DP);

  TOpcao = (toDirectory, toFile, toMascara);

  TfrmConfigSPEDCONT = class(TForm)
    pnlConfigImportacao: TPanel;
    pnlAlterdata: TPanel;
    grpDiretorioCONVERSOR: TGroupBox;
    edtDiretorioCONVERSOR: TEdit;
    btnDiretorioCONVERSOR: TBitBtn;
    grpSistemas: TGroupBox;
    dlgSPED: TOpenDialog;
    dlgOpen: TcxShellBrowserDialog;
    chkWcont: TCheckBox;
    PageControl: TPageControl;
    TabSheet2: TTabSheet;
    GroupBox2: TGroupBox;
    edtTxtSPEDContabil: TEdit;
    btnSPEDContabil: TBitBtn;
    chkImportarMultiplosArquivos: TCheckBox;
    procedure btnSPEDContabilClick(Sender: TObject);
    procedure btnDiretorioCONVERSORClick(Sender: TObject);
    procedure btnDiretorioDPClick(Sender: TObject);
    procedure edtDiretorioDPExit(Sender: TObject);
    procedure edtDiretorioCONVERSORExit(Sender: TObject);
    procedure chkWcontClick(Sender: TObject);
    procedure chkImportarMultiplosArquivosClick(Sender: TObject);
    procedure edtMascaraClassInternaPContExit(Sender: TObject);
    procedure edtTxtSPEDContabilExit(Sender: TObject);
  private
    { Private declarations }
    procedure SelecionaDiretorio(Edit: TEdit);
    procedure UpdateHint(Edit: TEdit; AOpCao: TOpcao = toFile);
//    procedure AtualizaTabSheet();
  public
    { Public declarations }
    function GetEnderecoDB(DirectoryDB: TDirectoryDB): string;
    procedure DelimiterDate;
  end;



var
  frmConfigSPEDCONT: TfrmConfigSPEDCONT;

implementation

{$R *.dfm}

{ TfrmConfigSPEDCONT }

procedure TfrmConfigSPEDCONT.btnSPEDContabilClick(Sender: TObject);
begin
  if chkImportarMultiplosArquivos.checked then
    SelecionaDiretorio(edtTxtSPEDContabil)
  else
    begin
      if not Empty(edtTxtSPEDContabil.Text) then
        if DirectoryExists(edtTxtSPEDContabil.Text) then
          dlgSPED.InitialDir := edtTxtSPEDContabil.Text
        else
          dlgSPED.InitialDir := PutLastBackSlash(GetEnvironmentVariable('HOMEDRIVE'));

      if dlgSPED.Execute then
        edtTxtSPEDContabil.Text := dlgSPED.FileName;
    end;
end;

procedure TfrmConfigSPEDCONT.SelecionaDiretorio(Edit: TEdit);
begin
  Edit.Text := Trim(UpperCase(Edit.Text));

  if DirectoryExists(Edit.Text) then
    dlgOpen.Path := Edit.Text
  else
    dlgOpen.Path := PutLastBackSlash(GetEnvironmentVariable('HOMEDRIVE'));

  if dlgOpen.Execute then
    Edit.Text := UpperCase(dlgOpen.Path);

  UpdateHint(Edit, toDirectory);
end;

procedure TfrmConfigSPEDCONT.UpdateHint(Edit: TEdit; AOpCao: TOpcao);
begin
  if Edit.Text = EmptyStr then
    begin
      ShowHintWarning(Edit, 'Informação necessária.', True);
      Exit;
    end
  else if not FileExists(Edit.Text) and (AOpCao = toFile) then
    begin
      ShowHintWarning(Edit, 'Arquivo inexistente.', True);
      Exit;
    end;

  if (AOpCao = toDirectory) then
    if not DirectoryExists(Edit.Text) then
      begin
        ShowHintError(Edit, 'Diretório inexistente.', True);
        Edit.Text := EmptyStr;
        Edit.SetFocus;
        Exit;
      end;

  ClearHint(Edit);
end;

//procedure TfrmConfigSPEDCONT.AtualizaTabSheet;
//var lAno : Integer;
//begin
//  if not(chkWdp.Checked) and not(chkWcont.Checked) then
//    begin
//      chkWdp.Checked := True;
//      tsWdp.TabVisible := chkWdp.Checked;
//    end
//  else
//    begin
//      tsWdp.TabVisible := chkWdp.Checked;
//  seAnoCONT.Text     := '0';
//  tsWcont.TabVisible := chkWcont.Checked;
//
//  if chkWcont.Checked then
//    begin
//      lAno           := Year(Date) - 5;
//      seAnoCONT.Text := IntToStr(lAno);
//    end;

//    end;
//end;

function TfrmConfigSPEDCONT.GetEnderecoDB(
  DirectoryDB: TDirectoryDB): string;
begin
  if DirectoryDB = DB_CONVERSOR then
    Result := PutLastBackSlash(edtDiretorioCONVERSOR.Text);

//  if DirectoryDB = DB_DP then
//    Result := PutLastBackSlash(edtDiretorioDP.Text);
end;

procedure TfrmConfigSPEDCONT.DelimiterDate;
begin
//  seAnoDP.MinValue := 1989;
//  seAnoDP.MaxValue := Year(Now);
//  seAnoDP.Value := Year(Now) - 5;
//
//  seAnoCONT.MinValue := 1989;
//  seAnoCONT.MaxValue := Year(Now);
//  seAnoCONT.Value := Year(Now) - 5;
end;

procedure TfrmConfigSPEDCONT.btnDiretorioCONVERSORClick(Sender: TObject);
begin
  SelecionaDiretorio(edtDiretorioCONVERSOR);
end;

procedure TfrmConfigSPEDCONT.btnDiretorioDPClick(Sender: TObject);
begin
//  SelecionaDiretorio(edtDiretorioDP);
end;

procedure TfrmConfigSPEDCONT.edtDiretorioDPExit(Sender: TObject);
begin
//  UpdateHint(edtDiretorioDP, True);
end;

procedure TfrmConfigSPEDCONT.edtDiretorioCONVERSORExit(Sender: TObject);
begin
  UpdateHint(edtDiretorioCONVERSOR, toDirectory);
end;

procedure TfrmConfigSPEDCONT.chkWcontClick(Sender: TObject);
begin
  chkWcont.Checked := True;
end;

procedure TfrmConfigSPEDCONT.chkImportarMultiplosArquivosClick(
  Sender: TObject);
begin
  edtTxtSPEDContabil.Clear;
end;

procedure TfrmConfigSPEDCONT.edtMascaraClassInternaPContExit(
  Sender: TObject);
begin
  UpdateHint(TEdit(Sender), toMascara);
end;

procedure TfrmConfigSPEDCONT.edtTxtSPEDContabilExit(Sender: TObject);
begin
  if chkImportarMultiplosArquivos.Checked then
    UpdateHint(edtTxtSPEDContabil,toDirectory)
  else
    UpdateHint(edtTxtSPEDContabil,toFile);
end;

end.
