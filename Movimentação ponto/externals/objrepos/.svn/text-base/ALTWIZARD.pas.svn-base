{ 29/12/2003 08:56:32 (GMT-3:00) > [CARREIRO@DSN on CARREIRO] checked out /. }
{ 15/12/2003 10:06:56 (GMT-3:00) > [CARREIRO@DSN on CARREIRO] checked
   in teste ok  }
{ 15/12/2003 10:05:10 (GMT-3:00) > [CARREIRO@DSN on CARREIRO] checked
   out /conversao de tela theme }
{------------------------------------------------------------------------------
 Biblioteca de Componentes Alterdata
 unit AltWizard.Pas criada em 04/11/1999 por Leonardo
 Última Alteração em 03/04/2000 por Leonardo
 Descrição: Wizard Padrão

 Observações:
 
   ATENÇÃO!!!

   O TabOrder do botão Voltar está fora da ordem para que o foco caia no botão
   Avançar assim que o usuário sair do Notebook.

   Alterada a imagem da janela 14/02/2001 Alexandre@dsn
 ------------------------------------------------------------------------------}
unit AltWizard;

interface

uses
  SysUtils, Classes, Controls, Forms, ExtCtrls, Windows, Graphics, Menus, Buttons,
  StdCtrls, Alterdata, AlterdataTypes, Alterdata_consts, AlterdataDatabase;

type
  TfrmWizard = class(TForm)
    Bevel1: TBevel;
    btnVoltar: TButton;
    btnAvancar: TButton;
    btnCancelar: TButton;
    pnlImagem: TPanel;
    imgImagem: TImage;
    btnConcluir: TButton;
    btnFechar: TButton;
    btnHelp: TBitBtn;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnAvancarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    { Private declarations }
    FNotebook      : TNotebook;
    FHasStatusPage : Boolean;
    FHasResultPage : Boolean;
    FIdxConcluir   : Byte;
    FStartPage     : ShortString;
    FNextPage      : Integer;
    FPriorPage     : Integer;

    procedure FocusFirstControl;
  public
    { Public declarations }
    JumpID   	       : String;
    property Notebook  : TNotebook read FNotebook  write FNotebook;
    property NextPage  : Integer   read FNextPage  write FNextPage;
    property PriorPage : Integer   read FPriorPage write FPriorPage;

    procedure Initialize( Notebk : TNotebook; StartPage : ShortString; HasStatusPage, HasResultPage : Boolean );
  end;

var
  frmWizard: TfrmWizard;

implementation

{$R *.DFM}

procedure TfrmWizard.Initialize( Notebk : TNotebook; StartPage : ShortString; HasStatusPage, HasResultPage : Boolean );
begin
  if Assigned( Notebk ) then
  begin
    NoteBook            := Notebk;
    NoteBook.ActivePage := StartPage;
    FStartPage          := StartPage;
    FHasStatusPage      := HasStatusPage;
    FHasResultPage      := HasResultPage;
    FNextPage           := -1;
    FPriorPage          := -1;

    //
    // Calculo o índice da página onde aparece o botão Concluir
    // O default é a última página
    FIdxConcluir        := NoteBook.Pages.Count - 1;
    //
    // Verifico se o Notebook tem pelo menos 3 páginas
    if NoteBook.Pages.Count >= 3 then
    begin
      //
      // Se tiver página de Status, diminuo mais uma página para o botão
      // Concluir
      if FHasStatusPage then
        Dec( FIdxConcluir );
      //
      // Se tiver página de Resultado, diminuo mais uma página para o botão
      // Concluir
      if FHasResultPage then
        Dec( FIdxConcluir );
    end;

    //
    // Habilita o botão Concluir caso a tela tenha apenas 3 páginas
    // no Notebook
    // Por Leonardo em 15/03/2000
    btnConcluir.Visible := NoteBook.PageIndex = FIdxConcluir;
    btnAvancar.Visible  := not btnConcluir.Visible;
  end;
end;

//===================================================

procedure TfrmWizard.FocusFirstControl;
var
  Control : TWinControl;
begin
  Control := FindNextControl( Notebook, True, True, False );

  if Control.CanFocus then
    Control.SetFocus;
end;

//===================================================

procedure TfrmWizard.FormShow(Sender: TObject);
begin
  FocusFirstControl;
end;

//===================================================

procedure TfrmWizard.btnVoltarClick(Sender: TObject);
begin
  if Assigned( Notebook ) then
  begin
    //
    // Se estiver na ultima página, volto para a primeira
    if NoteBook.PageIndex = ( NoteBook.Pages.Count - 1 ) then
      begin
        NoteBook.ActivePage := FStartPage;
        btnConcluir.Enabled := True;
        btnCancelar.Visible := True;
        btnFechar.Visible   := False;
      end
    else
      if FPriorPage = -1 then
        NoteBook.PageIndex := NoteBook.PageIndex - 1
      else
        begin
          NoteBook.PageIndex := FPriorPage;
          FPriorPage         := -1;
        end;

    btnVoltar.Enabled   := NoteBook.PageIndex > 0;
    btnConcluir.Visible := NoteBook.PageIndex = FIdxConcluir;
    btnAvancar.Visible  := not btnConcluir.Visible;

    FocusFirstControl;
  end;
end;

//===================================================

procedure TfrmWizard.btnAvancarClick(Sender: TObject);
begin
  if Assigned( Notebook ) then
  begin
    if FNextPage = -1 then
      NoteBook.PageIndex := NoteBook.PageIndex + 1
    else
      begin
        NoteBook.PageIndex := FNextPage;
        FNextPage          := -1;
      end;

    btnVoltar.Enabled   := NoteBook.PageIndex > 0;
    btnConcluir.Visible := NoteBook.PageIndex = FIdxConcluir;
    btnAvancar.Visible  := not btnConcluir.Visible;

    FocusFirstControl;
  end;
end;

//===================================================

procedure TfrmWizard.btnConcluirClick(Sender: TObject);
begin
  if Assigned( Notebook ) then
  begin
    btnVoltar.Enabled    := False;
    btnConcluir.Enabled  := False;
    btnAvancar.Visible   := False;
    btnCancelar.Visible  := False;
    btnFechar.Visible    := True;

    //
    // Avanço mais uma página se houver página de Status ou de Resultado
    if FHasStatusPage or FHasResultPage then
      NoteBook.PageIndex := NoteBook.PageIndex + 1;

    FocusFirstControl;
  end;
end;

//===================================================

procedure TfrmWizard.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

//===================================================

procedure TfrmWizard.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//===================================================

procedure TfrmWizard.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  EnableEnter( Self, Key, Shift );

  //
  // Por Leonardo em 03/04/2000
  if Key = VK_NEXT then
  begin
    if btnAvancar.Visible and btnAvancar.Enabled then
      btnAvancar.Click
    else
      if btnConcluir.Visible and btnConcluir.Enabled then
        btnConcluir.Click;
  end;

  if ( Key = VK_PRIOR ) and btnVoltar.Enabled then
    btnVoltar.Click;

  if (kEY = VK_F1) then
    btnHelpClick(nil);
end;

//===================================================

procedure TfrmWizard.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

//===================================================

procedure TfrmWizard.btnHelpClick(Sender: TObject);
begin
  Application.HelpJump( JumpID );
end;

end.         

